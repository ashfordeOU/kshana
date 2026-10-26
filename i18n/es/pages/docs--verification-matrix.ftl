# docs--verification-matrix: translations (es)

# text
seg-619f89bf160c = Realización del marco de referencia lunar

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Correspondencia de compliance con marcos públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidad

# text
seg-ad856ad710eb = Estado

# text
seg-60a43431ebe0 = Requisito

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-1603e76bcf66 = Identificación de ruido de ley de potencias mediante autocorrelación de retardo 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: el identificador de ruido por autocorrelación de retardo 1 de Riley y Greenhall ({ "2004" }) (fase diezmada con su componente cuadrática eliminada, o frecuencia promediada por grupos con su recta eliminada; primeras diferencias repetidas hasta que delta = r1/({ "1" }+r1) < { "0.25" } o d = dmax), que devuelve el exponente de ley de potencias alfa, entero y sin redondear (de +{ "2" } PM blanco a -2 FM de paseo aleatorio), con cualquier factor de promediado; fija los grados de libertad según el tipo de ruido de las fichas de dispositivo de la biblioteca de relojes medidos

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin y colaboradores, LGPL-3.0-or-later, ejecutado como programa aparte por el generador de datos de prueba): una implementación independiente del algoritmo publicado de Riley-Greenhall, una magnitud definida de forma única bajo las convenciones indicadas. Valida el identificador, no el contenido de ruido de ningún reloj real

# text
seg-aedf395f3597 = Autenticación de datos de navegación de Galileo OSNMA en el lado del receptor

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: un verificador abierto, en Rust puro, del lado del receptor para Galileo OSNMA (SIS ICD edición { "1.1" }, Receiver Guidelines edición { "1.3" }) a partir de páginas I/NAV o de un flujo UBX-RXM-SFRBX de u-blox: claves públicas de árbol de Merkle (DSM-PKR), la firma ECDSA P-256/P-521 del DSM-KROOT, verificación de la cadena de claves TESLA (SHA-256 o SHA3-256), verificación de MACSEQ y de etiquetas (HMAC-SHA-256 o CMAC-AES) para ADKD { "0" }, { "4" } y { "12" } con autenticación cruzada, fin/revocación/renovación de cadena, renovación y revocación de claves públicas, y el mensaje de alerta; estado por satélite Authenticated/Failed/Unavailable con un motivo para cada fallo o retraso. Orientativo: no es un equipo de navegación homologado ni un servicio de integridad de la navegación; no se afirma ningún rendimiento antispoofing

# text
seg-a6bd60ed728f = Los vectores de prueba oficiales de Galileo OSNMA publicados por el European GNSS Service Centre como anexo de las Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } de { "18" } conjuntos, { "186,382" } etiquetas autenticadas, { "0" } fallidas, ejecutados sin conexión el 2026-10-10 (registro de evidencias en kshana-pro docs/evidence). Alcance: los vectores validan la verificación criptográfica (Merkle, KROOT/ECDSA, cadena TESLA, etiquetas MACK, ADKD 0/4/12) y sus resultados en los escenarios publicados; usan solo HMAC-SHA-256, una cadena SHA-256, claves de 128 bits, etiquetas de 40 bits y entradas de tabla { "33" } y { "34" }, de modo que CMAC-AES, las cadenas SHA3-256 y otros parámetros quedan cubiertos solo por pruebas de respuesta conocida de primitivas publicadas y por pruebas sintéticas. El endurecimiento de la hora de confianza, del vínculo de datos, de la caducidad y de la confirmación de cabecera se prueba con las pruebas de ataque sintéticas, no con una referencia independiente externa. No comprobado: listas de revocación de certificados, señales en vivo ni un receptor en vivo (la disposición de palabras UBX se comprueba solo con tramas sintéticas), árboles de Merkle SHA3-256, frescura sin una hora independiente. No es un servicio de la UE

# text
seg-27a61718eb95 = Caracterización de la estabilidad de frecuencia

# text
seg-56174d771190 = Desviación de Allan/modificada/de Hadamard + identificación de ruido de ley de potencias con IC de χ²

# text
seg-ed01b2ab3481 = Desviaciones de referencia de NIST SP { "1065" } (Riley) / Stable32 sobre NBS14

# text
seg-25b78672c194 = Estabilidad de frecuencia en un reloj real medido

# text
seg-fd378f5fe04a = Desviación de Allan solapada + desviación de Hadamard solapada en un patrón de cesio real

# text
seg-64fd49d58394 = ADEV/HDEV solapadas de Stable32 sobre la serie de fase medida del cesio 5071A (allantools)

# text
seg-f305dbc83f2b = Paridad del estimador de Allan en la serie de referencia canónica de Stable32

# text
seg-5bfca5dcfb7c = Allan solapada + Allan modificada + desviación de tiempo en toda la escalera de AF

# text
seg-327ab6dcf16a = Desviaciones de referencia de Stable32 para PHASE.DAT (Riley; la serie de regresión estándar)

# text
seg-96c4275f5a89 = Estabilidad de frecuencia de rango extendido (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 y desviación total (TOTVAR): estimadores de estabilidad de tau largo y rango extendido que alcanzan ~{ "75" }% del registro allí donde la desviación de Allan se agota hacia ~{ "50" }%; el híbrido ThêoH sin sesgo (allan::theoh_curve) construido sobre ellos sigue siendo MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" }, una biblioteca independiente de terceros de estabilidad de frecuencia: theo1 (NIST SP { "1065" } ec. { "30" }) y totdev (NIST SP { "1065" } ec. { "25" }) sobre el conjunto de datos LCG hermético de NIST SP { "1065" } §{ "12.4" }; regenerable sin conexión mediante tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

# text
seg-cc40472fbcbf = Error máximo de intervalo de tiempo (MTIE): métrica de wander de telecomunicaciones

# text
seg-5c54ba2748f7 = MTIE(τ): la máxima oscilación pico a pico del error de tiempo en cualquier ventana deslizante de τ = m·tau0, el estadístico de wander de ITU-T G.810/G.823/G.8261 en el que se basan los límites de las redes de sincronización (máscaras MTIE): una cifra extremal (máx./mín.) distinta de la familia RMS de Allan

# text
seg-300fd3f945a0 = allantools { "2024.06" }, una biblioteca independiente de terceros de estabilidad de frecuencia: mtie() sobre la serie de fase LCG hermética de NIST SP { "1065" } §{ "12.4" }; MTIE es un estadístico puramente de máximo/mínimo, de modo que la salida del estimador coincide bit a bit con allantools sobre la matriz de fase construida de forma idéntica (las constantes de referencia confirmadas en el repositorio, de 15 cifras significativas, quedan a { "1" } ULP). Regenerable sin conexión mediante tests/fixtures/mtie/generate_mtie_reference.py

# text
seg-67d73f3ca14d = Allan modificada / desviación de tiempo (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): la desviación de Allan modificada solapada (estimador de ventana deslizante de segunda diferencia que separa el ruido de fase blanco del de fase flicker), y TDEV(τ) = τ/√{ "3" }·MDEV(τ), el estadístico de wander en el dominio del tiempo de ITU-T G.811/G.812/G.823 en el que se basan las máscaras de sincronización

# text
seg-24a441f32375 = allantools { "2024.06" }, una biblioteca independiente de terceros de estabilidad de frecuencia: mdev() y tdev() sobre la serie de fase LCG hermética de NIST SP { "1065" } §{ "12.4" } (la misma serie que las filas de Theo1/TOTDEV/MTIE), que calculan los mismos estimadores definidos de forma única; coinciden hasta <{ "1e-9" } relativo. Regenerable sin conexión mediante tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (El phasedat_reference.rs, condicionado a datos, también los contrasta con Stable32 hasta { "1e-3" }; esta es la comprobación hermética cruzada, estricta y siempre activa)

# text
seg-e4b6d707cbf5 = Estabilidad de frecuencia de un reloj óptico en una curva real medida

# text
seg-e9077554a08f = Recuperación NNLS de ley de potencias (FM blanco + nivel de ruido rojo) a partir de una desviación de Allan medida y publicada de la transición de reloj óptico de ⁸⁸Sr, que reproduce σ_y(τ) y la escala principal de 4.7e-16/√τ a tau corto con un nivel mínimo medido genuino a tau largo, en lugar del nivel mínimo sintetizado de clase óptica que holdover.rs supone en otro caso

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), fig. { "4" }, ADEV medida; curva incorporada literalmente desde Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Limitado a reproducir la curva de estabilidad medida publicada; las cifras de dispositivo de holdover hasta el umbral por clase de reloj siguen siendo MODELLED

# text
seg-cc95c8615d39 = Integridad (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = Separación de soluciones de múltiples hipótesis de ARAIM según el ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels y add_v42_protection_levels_ecef: determinación de subconjuntos mediante las reglas P_THRES y FC_THRES, VPL, HPL, el umbral efectivo del monitor EMT y sigma_acc); detección de fallos por RAIM instantáneo con χ² y exclusión de un solo satélite (raim::snapshot_raim, raim::snapshot_raim_fde) y HPL/VPL basados en pendiente en el nivel local geodésico; y la combinación de niveles de protección SBAS DO-229E (sbas::sbas_protection_level) en el servicio L1. NO cubierto, dicho claramente: las funciones de conveniencia de sigma uniforme raim::araim_raim y raim::araim_dual_raim NO se ajustan a ADD (con entradas coincidentes se desvían de Stanford MAAST en { "0.75" } m de VPL / { "4.04" } m de HPL y en { "0.39" } m de VPL / { "1.93" } m de HPL, un hallazgo); la comparación de SBAS L5 de doble frecuencia y multiconstelación (DFMC) es un hallazgo ({ "308" } pares de usuario-época sin GEO a la vista están protegidos por Kshana y no por MAAST, cuya puerta de recepción de GEO Kshana no modela); raim::solution_separation_raim no tiene comparación externa

# text
seg-a83c68500982 = Tres herramientas independientes, preregistradas (0123cee1) antes de que existiera cualquier dato de prueba o salida de referencia independiente, con las tolerancias fijadas entonces. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ejecutado como programa aparte con GNU Octave { "8.4" } y un adaptador de compatibilidad de unique() en el controlador (declarado, sin cambio de algoritmo), con el TOL_PL de ADD de { "0.05" } m: el código Rust reproduce la implementación de referencia de ADD en { "270" } casos reales. Declarado: la ruta de ADD de Kshana se escribió después del preregistro, siguiendo ADD tal como lo implementa MAAST; una reserva independiente del revisor ({ "270" } geometrías de usuario nuevas y un segundo mensaje de soporte de integridad, con MAAST ejecutado de nuevo contra el código congelado) se superó con el mismo umbral. ({ "2" }) RAIM instantáneo: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde en un arnés de C aparte para detección y exclusión; el PL por pendiente a partir de matinv/xyz2enu de RTKLIB más chi2/ncx2 de SciPy { "1.18.1" }, donde ambos lados evalúan la misma forma cerrada (Brown; Parkinson y Axelrad), de modo que la comprobación del PL cubre la implementación, no la fórmula. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, sin modificar, sobre las propias difusiones WAAS grabadas de MAAST: niveles de L1 dentro de { "1e-4" } m tras el reescalado de K y un conjunto protegido igual. Las mismas comparaciones produjeron los hallazgos indicados en la capacidad: las funciones de ARAIM de sigma uniforme no se ajustan a ADD, y la igualdad de conjuntos de L5 falla en { "308" } pares sin GEO a la vista (los niveles de los { "3267" } pares que ambas herramientas protegen coinciden hasta { "1e-13" } m). Los factores K de DO-229E/DO-316 son constantes transcritas y la geometría real es una entrada; ninguno se cuenta como referencia independiente. Revisión { "0.30" }: los niveles de protección de snapshot_raim pasaron del nivel local radial al geodésico (hasta { "0.31" } m de HPL y { "0.14" } m de VPL a { "16" } deg N)

# text
seg-1c37702cc5f2 = Propagación y determinación de órbita

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell de 6 DOF + perturbaciones, OD por lotes/secuencial

# text
seg-c84585f43297 = Vectores de verificación de SGP4 de AIAA 2006-6753

# text
seg-50c545872e4f = Propagador numérico de Cowell y modelo de fuerzas

# text
seg-74f8c585bcfd = Propagador numérico de Cowell con un modelo de fuerzas jerárquico (dos cuerpos, zonal J2–J6, tercer cuerpo Sol/Luna, SRP de bola de cañón, resistencia exponencial); RK4 con doblado de paso / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853: una biblioteca independiente, con un integrador distinto y una recursión de armónicos esféricos distinta. Los niveles conservativos (dos cuerpos → zonal J2–J6 → tercer cuerpo Sol/Luna → SRP de bola de cañón) coinciden con precisión submétrica en un arco de { "24" } h, lo que valida el integrador + el álgebra de fuerzas; el nivel de resistencia atmosférica y la fidelidad absoluta de las entradas de efemérides de Sol/Luna y de densidad siguen siendo MODELLED (solo caracterización)

# text
seg-d38c4be472ac = Sombra de SRP con Tierra achatada (opcional)

# text
seg-ab8247c6b4d2 = Fracción iluminada de SRP con el elipsoide WGS-84 como cuerpo ocultante (radio aparente de la Tierra desde el limbo del elipsoide hacia el Sol, fórmula de lente de doble disco; srp_shadow::oblate_conical_shadow), opcional en el modelo de fuerzas de Cowell mediante propagator::ForceModel::srp_shadow (por defecto: la sombra cónica esférica, sin cambios)

# text
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio con un cuerpo ocultante OneAxisEllipsoid WGS-84 y otro esférico, ejecutado como programa aparte con el Sol fijo en la misma posición inercial. Umbrales preregistrados en xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } en ambos y una dispersión achatada frente a esfera > { "1e-2" }; todos alcanzados. El eje del elipsoide es el eje z inercial en ambos lados (sin precesión-nutación)

# text
seg-01066d639b39 = Presión de radiación solar de caja-alas y ECOM2, con derivadas parciales (opcional)

# text
seg-2a5fc9708bd0 = SRP no de bola de cañón: un modelo de placas planas de caja-alas (Vallado ec. 8-44; paneles de cuerpo de una sola cara, alas orientadas al Sol) con las tablas FOC, IOV e IOV de fin de vida de Galileo de los metadatos de satélite de GSC, con guiñada nominal de GNSS, con derivadas parciales analíticas para el factor de radiación y para los coeficientes especular y difuso de cada panel; y el modelo empírico ECOM2 (D2/B1) con sus derivadas parciales. El modelo de caja-alas es opcional en el propagador de Cowell (propagator::ForceModel::box_wing_srp, que establece su campo srp_boxwing) y en el modelo de determinación precisa de órbita (precise_od::PreciseForceModel::box_wing_srp), y sustituye el término de bola de cañón por cr como factor de radiación; ambos son None por defecto y dejan idéntica byte a byte toda ruta existente. ECOM2 no está conectado a ningún modelo de fuerzas

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft con FixedPanel y PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), guiñada nominal GenericGNSS y ECOM2(nD = { "2" }, nB = { "1" }), ejecutado como programa aparte con el Sol en posiciones inerciales fijas; la derivada del factor de radiación a partir de Hipparchus Gradient, las derivadas por panel como diferencias centrales de Orekit (Orekit no las tiene). Umbrales preregistrados en xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), antes de que existiera cualquier salida de Orekit: { "1e-12" } relativo ({ "1e-11" } de extremo a extremo, { "1e-9" } para las diferencias); todos alcanzados (RESULTS.md). VALIDATED cubre solo la evaluación del modelo: las tablas de GSC son entradas transcritas, y no se cubren la adecuación de una caja-alas para órbitas reales de Galileo, la reemisión térmica, la ley de guiñada modificada con beta bajo ni los giros de eclipse; la predicción de SRP de Galileo sigue siendo MODELLED

# text
seg-bde1b3a94a47 = Sombra de SRP con oscurecimiento del limbo solar (opcional)

# text
seg-eaaec545dd68 = Fracción iluminada de SRP como la fracción no ocultada del flujo solar con oscurecimiento del limbo (ley de aproximación de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, cuadratura de Gauss-Legendre) sobre una Tierra esférica o WGS-84 (srp_shadow::limb_darkened_shadow, la variante OblateEarthLimbDarkened de ShadowModel)

# text
seg-76cb4b668ad5 = Ninguna externa: Orekit { "12.2" } no tiene una razón de iluminación con oscurecimiento del limbo. Contrastado solo con formas cerradas de la misma ley

# text
seg-673b17e9dcf7 = Densidad termosférica NRLMSISE-00

# text
seg-09e997231de8 = Un port de la termosfera empírica NRLMSISE-00 (gtd7 y gtd7d: densidades de especies, densidad de masa total con oxígeno anómalo, temperaturas; los { "24" } interruptores; modos de Ap diario y de matriz ap de 3 horas) a partir de la versión en C de dominio público del Fortran del NRL

# text
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, que ejecuta el GTD7D de Fortran del NRL en precisión simple, y el port en C de NRLMSISE-00 (versión { "20190709" }, dominio público) compilado como programa aparte, además de las { "17" } salidas de prueba publicadas de la distribución en C. Umbrales preregistrados en xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) antes de que existiera el port; todos alcanzados (RESULTS.md). Valida el port, no la exactitud del modelo frente a la densidad medida

# text
seg-12977f65b2ea = Nivel de densidad de resistencia atmosférica NRLMSISE-00 (opcional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential por defecto, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) y propagator::ForceModel::drag_density: resistencia cuadrática frente a la atmósfera en corrotación con la densidad de NRLMSISE-00 en el punto geodésico WGS-84 (ángulo de rotación terrestre con UT1 = TT, hora solar local UT + lon/15), clima espacial constante por modelo; desactivado por defecto e idéntico bit a bit

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 con DragForce sobre la propia implementación NRLMSISE00 de Orekit, ejecutado como programa aparte con el mismo marco de ángulo de rotación terrestre, la misma forma WGS-84, la misma convención de hora solar local (un Sol medio) y TT como UT; la configuración de las convenciones se comprobó entre referencias independientes (Orekit frente a pymsis, { "5.2e-5" } en densidad). Umbrales preregistrados en xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } del desplazamiento por resistencia, y dos comprobaciones de sensibilidad > { "100" } m; todos alcanzados. No cubierto: la exactitud del modelo frente a la densidad medida, el clima espacial variable en el tiempo, un tramo con GMAT

# text
seg-1ac7430e88fc = Resistencia exponencial por defecto frente a una implementación independiente (ecuatorial)

# text
seg-a9c41b03f2ca = La resistencia por defecto del propagador de Cowell: resistencia cuadrática frente a la atmósfera en corrotación con forces::atmospheric_density, la tabla exponencial por tramos de la tabla 8-4 de Vallado a la altitud esférica (propagator::ForceModel::drag con la variante Exponential por defecto de forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole con la atmósfera Exponential (la misma tabla de 28 bandas), Tierra de masa puntual y PrinceDormand78, ejecutado, nunca incorporado al repositorio. Umbrales preregistrados en xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) sobre el desplazamiento por resistencia de cada lado (ejecución con resistencia menos ejecución sin ella), que cancela los dos valores de mu de la Tierra y los integradores; todos alcanzados (RESULTS.md). GMAT toma la altura geodésica y kshana la altitud esférica: solo coinciden en el ecuador, de modo que VALIDATED cubre órbitas ecuatoriales; fuera del ecuador los modelos difieren por diseño ({ "10.4" } % del desplazamiento de { "24" } h a { "51.6" } deg, { "400" } km). La compilación pública de GMAT no tiene NRLMSISE-00 (falta el plugin), de modo que el nivel NRLMSISE-00 solo tiene la referencia independiente de Orekit. No se cubre la exactitud de la tabla frente a la densidad medida

# text
seg-9e15970435c3 = Sol y Luna de DE440 en el modelo de fuerzas de Cowell (opcional)

# text
seg-de6831cf7785 = Nivel opcional de efemérides para los términos de tercer cuerpo y SRP del ForceModel numérico de Cowell: el Sol y la Luna geocéntricos de cualquier EphemerisProvider (un kernel SPK DE440 mediante KernelEphemeris) en TDB = TT + (TDB - TT), rechazando un proveedor que no pueda servir la época y contando cualquier recurso a la serie analítica; desactivado por defecto

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 con ThirdBodyAttraction y SolarRadiationPressure sobre el propio lector DE440 de Orekit (orekit-data lnxp1990.440), ejecutado como programa aparte; kshana lee un recorte bit a bit, comprobado con SPICE, de NAIF de440s.bsp. Umbrales preregistrados en xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). El umbral de órbita ({ "0.5" } m) y el control de sensibilidad se alcanzan, pero el umbral de posición del Sol y la Luna ({ "3" } m / { "0.2" } m) no se alcanzó: { "6.39" } m / { "0.244" } m. SPICE, leyendo el mismo kernel en su TDB exacto, se desvía de Orekit en una cantidad equivalente ({ "6.25" } m / { "0.240" } m), de modo que la diferencia está entre la ruta de de440s de NAIF y el lector DE440 o la escala de tiempo de Orekit; causa no aislada. Registrado y fijado, por lo que la fila sigue siendo MODELLED

# text
seg-057c21daf4f2 = Marea atmosférica S1 (opcional)

# text
seg-f600a39f297e = La marea diurna S1 de presión del aire como perturbación del geopotencial: modelo N1 de Biancale y Bode ({ "2006" }), grados { "2" } a { "6" }, mediante la fórmula de carga de la ec. { "6.21" } de IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional en los modelos de fuerzas de Cowell y de órbita precisa (air_tide_s1, desactivado por defecto)

# text
seg-7dd9fccac779 = Ninguna externa para el efecto sobre el geopotencial. Los { "24" } coeficientes se transcriben del modelo N1 de la tabla { "1" } de GFZ STR06/01 y se revisaron fila por fila frente al informe (SHA-256 890865ae); no se usan los grados { "0" }, { "1" }, { "7" } y { "8" }. Ray y Ponte ({ "2003" }) no imprimen ninguna tabla de armónicos esféricos, por lo que no se comparó con una segunda fuente

# text
seg-b150b1bdb599 = Coeficientes de la marea atmosférica S2 en la convención de IERS

# text
seg-87e9238b8c53 = Armónicos de presión del aire S2 de Ray ({ "2001" }) (n <= { "4" }, progrados y retrógrados) convertidos a la forma completamente normalizada con adelanto de seno de las ecs. 6.20-6.21 de IERS { "2010" } (amplitud dividida por N_nm, epsilon = { "90" } deg - psi) y aplicados como término S2 de tides::atmospheric_tide

# text
seg-4745148b6c60 = Biancale y Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), tabla { "5" }, modelo A2: Ray ({ "2001" }) publicado en armónicos completamente normalizados con fases de adelanto de seno, una representación independiente del mismo modelo. Preregistrado en xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) junto con la corrección que valida. Cubre solo la conversión de coeficientes; el efecto geopotencial de la marea atmosférica no tiene referencia independiente externa

# text
seg-444f0a65b6fd = Geopotencial teseral en el propagador de Cowell

# text
seg-ad475816bc78 = Campo teseral EGM2008 opcional (hasta grado/orden { "70" }) como gravedad central del ForceModel numérico de Cowell, evaluado en un sistema fijo a la Tierra rotado según el ángulo de rotación terrestre de la IAU { "2000" } (o la cadena CIO de GCRS a ITRS); desactivado por defecto, de modo que ninguna salida existente cambia

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 con HolmesFeatherstoneAttractionModel sobre los mismos coeficientes (tools/egm2008_to70.gfc) en un sistema fijo al cuerpo rotado con la misma fórmula del ángulo de rotación terrestre, ejecutado como programa independiente. Umbrales fijados de antemano (f0e0e65, enmendados antes de cualquier comparación en 2da899a): |dr| <= { "0.5" } m y |dv| <= { "5e-4" } m/s, y que ambos controles negativos fallen por > { "100" } m; todos cumplidos, tras lo cual los umbrales se endurecieron a { "0.1" } m y { "1e-4" } m/s. No validado: la fidelidad de la orientación terrestre (ambos lados usan UT1 = TT sin precesión-nutación en el sistema Era), la opción de sistema Cio (solo comprobación interna), los grados superiores a { "70" }

# text
seg-e8f5ff8c9149 = Gravedad de armónicos esféricos de alto grado (EGM2008 hasta { "2190" })

# text
seg-d3b2f32dcecb = Evaluación sin desbordamiento por defecto y segura en los polos de un campo totalmente normalizado hasta el grado { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, columna directa modificada de Holmes-Featherstone { "2002" } con el gradiente libre de 1/cos phi), un cargador ICGEM .gfc en flujo (from_gfc_file / from_gfc_reader; el EGM2008 completo se descarga en tiempo de ejecución, no se incluye) y el evaluador de Holmes-Featherstone seleccionable en el Geopotential de Cowell opcional

# text
seg-8651532685f3 = HolmesFeatherstoneAttractionModel de Orekit { "12.2" } (Apache-2.0) y MakeGravGridPoint de pyshtools { "4.14.1" } (BSD-3-Clause), ejecutados como programas independientes; umbrales fijados de antemano en xval/high-degree-gravity/PREREGISTRATION.md (276c869f) y xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit concuerda en todos los puntos donde está definido, pero pyshtools no alcanza su umbral fijado de antemano en los dos puntos cercanos al polo (hasta { "7.3e-10" } m/s^{ "2" }; una comprobación con mpmath a 50 dígitos sitúa el error en pyshtools), no existe ningún valor de referencia independiente exactamente sobre el eje polar, y el control de sensibilidad de grado 70, fijado de antemano, de la órbita de { "24" } h falló ({ "0.726" } m frente a > { "1" } m). Cada fallo queda registrado, no se corrige a base de ajustes, por lo que la fila sigue siendo MODELLED

# text
seg-e81b7418c382 = Integrador DOP853

# text
seg-e6e3638aa68e = Runge-Kutta explícito de Hairer DOP853 { "8" }({ "5,3" }) con el estimador de error combinado de órdenes 5 y 3, el controlador de paso de SciPy/Hairer, paso inicial automático, una protección de paso con cierre seguro y salida densa de orden 7; seleccionable como la variante Dop853 del Integrator del propagador / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) y sus rutinas de paso único, norma de error, salida densa y paso inicial, una implementación independiente; estados exactos de dos cuerpos de mpmath { "1.3.0" } con { "40" } dígitos. Umbrales fijados de antemano en xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) antes de la primera comparación; todos cumplidos (xval/dop853-scipy/RESULTS.md). El primer paso de SciPy se entrega a ambos resolutores en las ejecuciones completas; la rutina de paso inicial se compara por separado. No cubierto: RKF7({ "8" }), detección de rigidez, localización de eventos

# text
seg-9ad7c1f4da77 = Resolutor robusto de la ecuación de Kepler

# text
seg-4b9d812fd13e = Resolutor de Kepler elíptico para todo { "0" } <= e < { "1" } y todas las anomalías medias: arranque cúbico de Markley ({ "1995" }) y corrección de quinto orden, un residuo sin cancelación (1-e)E + e(E - sin E) - M y pulido de Newton con protecciones (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = Raíces de 50 dígitos de mpmath { "1.3.0" } (BSD-3-Clause) a partir de las entradas binarias exactas. Umbrales fijados de antemano en xval/kepler-mpmath/PREREGISTRATION.md (df22174), expresados relativos a |E| con el argumento de condicionamiento e -> { "1" }, M -> { "0" }; todos cumplidos (xval/kepler-mpmath/RESULTS.md). Los resolutores heredados (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) no cambian numéricamente, porque dependen de ellos salidas ya registradas, y esta fila no los cubre

# text
seg-1960804ef2f4 = Determinación de órbita por lotes con velocidad radial y az/el con enmascaramiento de estación

# text
seg-4c185244bc66 = Recuperar un estado de época a partir de seguimiento mixto de distancia, velocidad radial y acimut/elevación por encima de una máscara de elevación mediante Gauss-Newton sobre H = (dh/dx(t)) Phi(t, t0): derivadas parciales analíticas de la medida y una matriz de transición de estado variacional con derivadas parciales analíticas de dos cuerpos + J2 (integrada con RK4, no una STM de forma cerrada)

# text
seg-6c6a42c25433 = BatchLSEstimator de Orekit { "12.2" } (Apache-2.0) con medidas geométricas instantáneas personalizadas RangeRate y AzEl (contrastadas con el TopocentricFrame de Orekit), ejecutado como programa independiente sobre observaciones idénticas, enmascaradas y con semilla. Umbrales fijados de antemano en xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Todos los umbrales se cumplen salvo B4, la concordancia de estado sin ruido de { "1" } cm, incumplida en { "2" } de { "4" } escenarios ({ "1.46" }, { "1.74" } cm): la propia estimación sin ruido de Orekit se aleja esa distancia de su verdad simulada (causa en el lado de Orekit no aislada). Registrado y fijado, por lo que la fila sigue siendo MODELLED. No modelado: tiempo de luz, aberración, refracción, rotación terrestre, un filtro secuencial para estos tipos de medida

# text
seg-bc3d1ee7c639 = Ponderación de observaciones por código de precisión SP3

# text
seg-63b1fab84f85 = Asignar los códigos de precisión SP3 (exponentes ++ de la cabecera en { "2" }^n mm, la base %f, desviaciones típicas base^n mm por registro) a sigmas de posición por observación para el motor de determinación de órbita precisa (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Ninguna externa: los pesos son una decisión de modelado (el formato SP3 define el código solo como indicador de precisión del productor; aquí se lee como una sigma por eje). Las ejecuciones de agencia ya registradas no cambian

# text
seg-e35df6881c80 = Campos de gravedad planetarios a partir de tablas PDS SHADR

# text
seg-f78b73ae8742 = Leer tablas de armónicos esféricos PDS SHADR (from_shadr, en SphericalHarmonicField en src/gravity_pds.rs: conversión de unidades, C00 = { "1" } suministrado, comprobaciones de completitud y normalización) y evaluar la gravedad fija al cuerpo de Marte GMM-3 (g/o { "120" }) y del campo lunar GRAIL GL0660B (g/o { "660" })

# text
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) leyendo los mismos archivos PDS y evaluando la gravedad puntual, ejecutado como programa independiente, y las cabeceras y etiquetas publicadas de los productos PDS. Umbrales fijados de antemano en xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); todos cumplidos (RESULTS.md). Datos: NASA PDS Geosciences Node, dominio público; recortes de grado 20 incluidos con NOTICE, archivos completos descargados en el momento del ensayo

# text
seg-ae3e8833a5ef = Asociar un campo de gravedad publicado a un cuerpo

# text
seg-ffb2b20e5f32 = with_gravity_field (en Body, en src/gravity_pds.rs): asocia cualquier campo de armónicos esféricos cargado (por ejemplo GMM-3 o GL0660B) a un Body para que el propagador lo evalúe fijo al cuerpo; opcional, los cuerpos por defecto no cambian

# text
seg-bcb731f7a9b5 = Solo coherencia interna. Cada campo publicado se define en el sistema fijo al cuerpo de su productor (GMM-3 en el sistema de Marte de Konopliv et al. { "2006" }, GL0660B en el sistema de ejes principales lunar DE421), mientras que el campo se evalúa en el sistema IAU; el desfase no se modela

# text
seg-659bfeba459c = Determinación de órbita por lotes y secuencial

# text
seg-dbc98f498941 = Recuperar un estado de época [r,v] a partir de distancias de estaciones terrestres mediante un corrector diferencial por lotes de Gauss–Newton y un filtro secuencial, sobre un modelo de fuerzas de dos cuerpos+J2

# text
seg-ecfce82a4e3d = BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) de Orekit { "12.2" } (CS GROUP, Apache-2.0): una biblioteca de estimación de terceros independiente sobre un modelo de fuerzas equivalente; el estado de época recuperado y el RMS de residuos tras el ajuste concuerdan a <{ "1e-3" } m sin ruido y <{ "3" } m con un suelo de ruido de { "5" } m

# text
seg-acdac055acb9 = Resolutor de tiempo de luz radiométrico de espacio profundo

# text
seg-62a478e40850 = Solución de tiempo de luz unidireccional retardada (tramo descendente) τ = |r_rx − r_target(t−τ)|/c para navegación radiométrica de espacio profundo (Tierra→Marte/Sol/Luna)

# text
seg-a38690bb69fa = Tiempo de luz con aberración newtoniana convergida de ANISE { "0.10" } (Nyx Space, MPL-2.0) (Aberration::CN; equivalente a spkapo de SPICE) sobre JPL DE440: una implementación SPICE en Rust independiente; el resolutor retardado de punto fijo de kshana concordó a menos de un nanosegundo. Las cifras más amplias de Doppler / Shapiro / DO de dinámica reducida siguen siendo MODELLED

# text
seg-c69ef9342160 = Posición de satélite por efemérides de difusión (RINEX multi-GNSS)

# text
seg-62702fc6f242 = Posición de satélite ECEF kepleriana a partir de efemérides de difusión IS-GPS-200 / Galileo-OS / BeiDou-OS desde un registro de navegación RINEX-3 analizado

# text
seg-cb66d33b7ba7 = eph2pos() de RTKLIB v2.4.2-p13 compilado desde el código fuente en C (T. Takasu, BSD-2-Clause): una implementación independiente de IS-GPS-200/SIS-ICD, alimentada con los mismos registros de navegación RINEX-3; la posición ECEF del satélite concordó a ~{ "62" } nm. (La interpolación de efemérides precisas SP3 se valida por separado: véase «Interpolación de efemérides precisas SP3»)

# text
seg-c807a782b20e = Interpolación de efemérides precisas SP3

# text
seg-238de70daab9 = Interpolación de Lagrange estándar del IGS de posiciones de satélite de efemérides precisas SP3 con la corrección de rotación terrestre por nodo (rotar cada nodo ω⊕·(t_node−t) hasta el sistema fijo a la Tierra del instante de consulta antes del ajuste polinómico)

# text
seg-e9249ae44a11 = peph2pos() de RTKLIB compilado desde el código fuente en C (preceph.c; T. Takasu, BSD-2-Clause): la referencia IGS de facto, una implementación independiente; el interpolador de kshana (que ahora incorpora la misma corrección de rotación terrestre por nodo) concordó a ~{ "15" } nm sobre un producto SP3 real, frente a ~{ "5.5" } cm antes de la corrección

# text
seg-9762cf428435 = Codificadores de mensajes de navegación más allá de GPS LNAV (GPS CNAV, Galileo I/NAV y F/NAV)

# text
seg-9b703b9607d8 = Tipos de mensaje GPS CNAV 10/11/30, tipos de palabra 1-5 de Galileo I/NAV en páginas pares/impares nominales y tipos de página 1-4 de Galileo F/NAV: empaquetado de campos y cuantización según ICD, CRC-24Q, codificación convolucional de tasa 1/2 K={ "7" } (G2 invertido para Galileo), entrelazado por bloques y patrones de sincronización, con decodificadores de prueba correspondientes

# text
seg-7939b210e83c = Ida y vuelta interna y respuestas conocidas del ICD; no se ha ejecutado ningún decodificador de terceros (el arnés de RTKLIB/GNSS-SDR que lee KSHANA_NAVMSG_ORACLE_JSON está condicionado a datos). MODELLED

# text
seg-5ce7cd3d6011 = Lector de mapas globales de ionosfera IONEX e interpolación sobre un GIM de CODE real

# text
seg-502656556ddf = Lector IONEX { "1.0" } (cabecera, valores I5 en columnas fijas, mapas de TEC y RMS, épocas absolutas, valores ausentes) con interpolación espacial bilineal, la interpolación temporal del formato por mapa más cercano / consecutivo / rotado (ecs. 1-3) y TEC oblicuo de capa delgada

# text
seg-1575dc4cfb4a = Los valores impresos del GIM de CODE (exactos en cada nodo; el mapa se descarga en el momento del ensayo, no se incluye, al no estar confirmada su licencia) y una reimplementación independiente en la biblioteca estándar de Python de las fórmulas de interpolación de IONEX { "1.0" } incluida con el fixture (umbrales fijados de antemano e4d8b1f, { "1e-9" } TECU). Comprobación de terceros (B6, fijada de antemano, primera ejecución): iontec de RTKLIB v2.4.2-p13 (BSD-2-Clause, ejecutado como herramienta independiente) en { "6885" } puntos de consulta concuerda con IonexFile::vtec_at a { "3.6e-13" } TECU en ambos modos de interpolación frente a un umbral de { "1e-5" } TECU. Condicionado a datos: GIM de CODE descargado en el momento del ensayo, con SHA fijado; RTKLIB lee el archivo completo porque su getindex rechaza el recorte de latitud. tests/fixtures/ionex_code_gim/fetch.sh lo descarga y comprueba el SHA-256, el ensayo falla con cualquier otro byte, y run_rtklib.sh es la vía de reproducción documentada (requiere acceso a la red). Promovido a VALIDATED por decisión del propietario sobre evidencia condicionada a datos (2026-10-13)

# text
seg-974d8c1f7876 = Suavizado Hatch de código con portadora sobre observaciones RINEX reales

# text
seg-f26b5da0f52e = Filtro Hatch sin divergencia (código libre de ionosfera transportado por la portadora libre de ionosfera, ventana de N épocas, reinicio ante pérdida de enganche, salto libre de geometría o hueco) en el montaje de posicionamiento puntual preciso

# text
seg-fac84cb9b256 = HALLAZGO frente a la coordenada ITRF2020 publicada de WTZR: los umbrales fijados de antemano (mediana y p95 suavizadas como máximo { "0.6" } x las brutas; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) no se alcanzaron, con razones de { "0.718" } y { "0.923" }; el error residual de nivel métrico es de tipo sesgo (sesgo de código C1C, antena, marea, multitrayecto de largo periodo), no el ruido blanco que elimina el suavizado. MODELLED: las estadísticas del filtro se comprueban internamente

# text
seg-2eec513ae8c8 = Dobles diferencias RTK con fijación entera LAMBDA sobre observaciones RINEX reales

# text
seg-6571676bf918 = Posicionamiento relativo de línea base corta a partir de código y fase de portadora GPS reales de doble frecuencia: dobles diferencias respecto al satélite más alto con su covarianza completa, un filtro de Kalman flotante sobre la línea base y las ambigüedades de diferencia simple con reinicialización ante saltos, mínimos cuadrados enteros LAMBDA con la prueba de razón, y la línea base condicionada a los enteros fijados

# text
seg-e50c5d4b65c7 = Coordenadas ITRF2020 publicadas de WTZR y WTZZ (IGN ITRF2020_GNSS.SSC, solución { "3" }, con las alturas de antena RINEX) que dan la línea base de referencia; umbrales fijados de antemano en tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md antes de escribir el código. Solo línea base corta: no se modelan dobles diferencias ionosféricas ni troposféricas

# text
seg-f9aa0c529393 = Solución de tiempo del reloj del receptor PPP frente al reloj final de estación del IGS

# text
seg-83ad9e893db9 = El reloj del receptor estimado por el filtro PPP flotante estático sobre código y fase GPS reales de doble frecuencia con órbitas y relojes finales del IGS: una transferencia de tiempo del receptor al tiempo IGS, la solución de tiempo PPP libre de ionosfera.

# text
seg-91a882dd71e8 = El reloj combinado final del IGS para la estación WTZR (registros AR de IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, una combinación de las soluciones de red de varios centros de análisis; productos del IGS, uso libre con atribución); umbrales fijados de antemano en xval/ppp-time/PREREGISTRATION.md antes de cualquier comparación; todos se cumplieron en la primera ejecución. LO QUE NO SE COMPRUEBA: una estación y una ventana convergida de dos horas; tiempo IGS, no UTC(k); el desfase constante incluye sesgos de código del receptor y está acotado, no calibrado; sin trazabilidad a Circular T.

# text
seg-a9b2a93401a3 = Posicionamiento puntual preciso flotante sobre observaciones RINEX reales

# text
seg-cc991ccec112 = Filtro de Kalman extendido PPP flotante estático sobre código y fase de portadora GPS reales de doble frecuencia con órbitas y relojes finales del IGS: combinación libre de ionosfera, desfases de antena de satélite y de receptor (variaciones del receptor), marea terrestre sólida, wind-up de fase, retardo Shapiro, retardo cenital húmedo estimado, ambigüedades flotantes por arco con detección de saltos libre de geometría / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Coordenada ITRF2020 publicada de WTZR (IGN ITRF2020_GNSS.SSC, solución { "3" }, propagada con su velocidad): umbrales fijados de antemano en tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md antes de escribir el filtro; desarrollo solo sobre la estación colocalizada WTZZ. No modelado: carga oceánica, PCV de satélite, resolución de ambigüedad entera

# text
seg-c8d87abed330 = Lectura de archivos de navegación RINEX { "4" }

# text
# c1: > EPH
seg-28913a01af00 = Archivos de navegación RINEX 4.00-4.02: registros <c1/> de GPS LNAV, Galileo I/NAV y F/NAV, BeiDou D1/D2 y QZSS LNAV decodificados al tipo de efemérides de difusión; registros CNAV, CNV1-3, FDMA, SBAS, STO, EOP e ION omitidos hasta la siguiente cabecera de registro; un registro cuya cabecera nombra a otro satélite, o un registro truncado, se rechaza

# text
seg-687b3b159691 = El archivo de difusión combinado RINEX { "3" } del IGS del mismo día (datos publicados, escritos por un generador de archivos distinto a partir de los mismos mensajes de difusión); umbrales fijados de antemano en tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) antes de la primera ejecución

# text
seg-278ca396127a = Lectura de archivos de observación RINEX { "4" }

# text
seg-e0883aa933eb = Cabeceras de observación RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiquetas localizadas en las columnas 61-80 para la versión { "4" } y posteriores) y registros de época

# text
seg-971fb1203a6d = Ajuste a la norma del formato sobre un archivo RINEX { "4.00" } real publicado (los valores leídos coinciden con los literales impresos en el archivo) y una cabecera derivada de la especificación; no se ejecutó ningún lector independiente, por lo que MODELLED

# text
seg-33e5c74720ff = Posición de satélite GEO de BeiDou por difusión

# text
seg-44b61449b65a = Posición de satélite geoestacionario según BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de unas efemérides de difusión (sistema cuasi inercial, luego Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional mediante el campo include_beidou_geo de NavParseOptions, de modo que el lector por defecto sigue omitiendo los GEO

# text
seg-06d500099814 = Fijado de antemano (7aa264b, 110fef9) frente a una órbita precisa IGS MGEX con los GEO; ningún producto de ese tipo estuvo al alcance de la sesión que lo construyó, por lo que la comparación está pendiente y la fila es MODELLED (comprobada solo frente a las posiciones GEO nominales publicadas)

# text
seg-559814996a4c = Interpolación de relojes precisos SP3

# text
seg-8e7a0dbd1755 = Desfase de reloj de satélite entre los nodos de reloj SP3 tabulados mediante interpolación lineal sobre los dos nodos válidos que lo acotan (el esquema pephclk de RTKLIB; se omite el centinela de reloj defectuoso), y los mismos nodos entregados a la cadena de productos precisos como registros equivalentes a reloj RINEX

# text
seg-1f4f0f841802 = Combinación final de relojes de satélite de { "30" } s del IGS (IGS0OPSFIN 30S CLK, 2025-02-24): estimaciones de reloj publicadas en los instantes de consulta, no interpoladas a partir del SP3; umbrales fijados de antemano en tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md antes de la primera ejecución (RMS { "0.15" } ns, p95 { "0.30" } ns, mediana de nodo { "1e-12" } s, discriminación 2x)

# text
seg-71f48628ebb2 = GNSS/INS fuertemente acoplado con fase de portadora y ambigüedades flotantes

# text
seg-5a156aa81275 = EKF de estado de error sobre { "15" } estados INS, un reloj de receptor de dos estados y una ambigüedad de portadora flotante por satélite seguido; pseudodistancia, fase de portadora y velocidad radial opcional de una constelación Walker SGP4 (tiempo de luz y Sagnac), con correcciones de Klobuchar y Saastamoinen/Niell aplicadas en el lazo en la posición propia del filtro; detección de saltos por portadora diferenciada en el tiempo con un umbral por satélite ampliado por la incertidumbre de velocidad; reinicialización de ambigüedades ante saltos y readquisición

# text
seg-00576e8c1032 = Coherencia interna: las medidas se sintetizan a partir de los modelos que usa el filtro (χ² NEES/NIS sobre semillas, una convergencia sin ruido, inyección de saltos). MODELLED; no se compara con datos de un receptor real ni con un filtro de terceros

# text
seg-7d644516b1ec = Paquetes GNSS/INS marítimo, ferroviario y de aviación con opción de acoplamiento fuerte

# text
seg-cbb03a8baf73 = Tres escenarios gnss-ins sobre la biblioteca de trayectorias (un buque que zigzaguea a { "8" } m/s con una interrupción de cinco minutos; un tren que atraviesa una trinchera con dos satélites visibles y un túnel; una aeronave cuya interrupción abarca un viraje con alabeo de 25 grados) y la tabla opcional [tight] del paquete: pseudodistancias de una constelación Walker SGP4 fusionadas por el navegador en lazo cerrado, con todos los satélites sobre la máscara en condiciones nominales y los pocos más altos en condiciones degradadas

# text
seg-273c14256d4c = Interno: las cifras de mérito de cada paquete frente a su propia verdad y una comparación débil/fuerte con entradas idénticas. MODELLED; la comparación con NaveGo de la auditoría no se ha ejecutado

# text
seg-f4dab73c4eda = Filtro PNT acoplado de pseudodistancia con estado de sesgo y extensión 3-D en el paquete de fusión

# text
seg-742b60089361 = Un único filtro de Kalman apilado sobre posición, velocidad, fase y frecuencia de reloj alimentado con pseudodistancias que acoplan posición y reloj (actualizaciones en forma de Joseph que conservan la covarianza cruzada); una variante de 1 grado de libertad aumentada con un estado de sesgo de acelerómetro constante que el paquete de fusión ejecuta bajo [coupled]; y la versión 3-D de 8 estados con filas de línea de visión

# text
seg-9558d7aad3af = Coherencia interna: verdad simulada a partir de los propios modelos de los filtros (χ² NEES sobre semillas de Monte Carlo, el paquete desacoplado con sensores idénticos). MODELLED

# text
seg-4a64aa1fe3ca = EKF GNSS/INS débilmente acoplado con brazo de palanca sobre el conjunto de datos KF-GINS

# text
seg-30f503856ac5 = El EKF de estado de error de 15 estados en lazo cerrado, dirigido por incrementos de IMU con posiciones de antena GNSS fusionadas mediante el modelo de brazo de palanca H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], configurado a partir de un archivo YAML de KF-GINS (estado inicial y sigmas, ARW/VRW, sesgos de Gauss-Markov)

# text
seg-b01d28a09abe = La trayectoria de referencia publicada del conjunto de datos y el programa C++ KF-GINS (GPL-3.0, commit 8291a93e, ejecutado como herramienta independiente); umbrales fijados de antemano en xval/kfgins/PREREGISTRATION.md, y KF-GINS no se ejecutó sobre estos datos antes de ese registro (comprobado en sus Results). Los seis umbrales se cumplieron en la primera ejecución. CONDICIONADO A DATOS: el conjunto de demostración de KF-GINS (IMU Leador-A15 real y GNSS RTK con trayectoria de referencia) no lleva licencia, por lo que no se incluye; xval/kfgins/fetch.sh lo descarga en el momento del ensayo con el SHA-256 de cada archivo fijado, y el ensayo falla si no coincide; la vía de reproducción, que requiere acceso a la red, está en xval/kfgins/PREREGISTRATION.md. Promovido a VALIDATED por decisión del propietario sobre evidencia condicionada a datos (2026-10-13)

# text
seg-e6b6c605564c = Exportación de test bench leída por los lectores de archivos de movimiento de un simulador (gps-sdr-sim)

# text
seg-a07429aa1998 = Los archivos de movimiento de la exportación del bench entregados a los propios lectores de un simulador GNSS de código abierto devuelven la trayectoria exportada: el archivo NMEA GGA (-g), el corte tiempo/latitud/longitud/altura del CSV de movimiento (-x) y su corte tiempo/x/y/z (-u), en { "6" } escenarios gnss-ins (incluidos los paquetes marítimo, ferroviario y de aviación, leídos hasta el límite de 3000 muestras del simulador) y { "2" } estacionarios. Solo movimiento; no se escribe ni se genera ninguna señal.

# text
seg-07b5f46a900f = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: readNmeaGGA, readUserMotion y readUserMotionLLH de gps-sdr-sim (MIT, commit 28ca29a6) con su propio llh2xyz WGS { "84" }, invocados mediante xval/testbench-gpssdrsim/driver.c (sin llamar a ninguna función de señal), frente a las columnas fijas a la Tierra del CSV de movimiento fila a fila, con umbrales fijados de antemano en xval/testbench-gpssdrsim/PREREGISTRATION.md antes de cualquier ejecución: cada muestra leída en los { "8" } escenarios; NMEA peor caso { "1.21" } mm (umbral { "1" } cm); corte LLH peor caso { "0.145" } mm (umbral { "1" } mm); corte de cuatro columnas fijas a la Tierra exacto (umbral { "1" } um, enmienda { "1" }); filas gnss-ins en la rejilla de { "10" } Hz del simulador a { "2.3e-13" } s. HALLAZGO (ejecución { "1" }, fijado): el CSV de ancho completo sin cabecera no es legible con -u, porque el búfer de línea de 100 caracteres del lector divide cada fila de 161 caracteres en dos muestras; docs/TEST-BENCH.md da el corte de cuatro columnas. LO QUE NO SE COMPRUEBA: la física de la trayectoria verdadera del escenario; la salida de señal de gps-sdr-sim; el lector de cualquier otro simulador; cualquier receptor.

# text
seg-2db2b9dc3b45 = Biblioteca de trayectorias GNSS/INS e importación de verdad CSV

# text
seg-e1fe83c75a6c = Perfiles de movimiento seleccionables para el paquete gnss-ins (recta, figura-8, urbano con paradas y arranques, ascenso de aeronave y viraje coordinado, dron de topografía), definidos por órdenes de velocidades de Euler y de aceleración a lo largo de la trayectoria cerradas sobre el estado verdadero con la IMU cinemática (términos centrípeto, de gravedad y de Coriolis), y verdad CSV importada convertida en la IMU que la reproduce; el recorrido histórico no cambia cuando no se da ningún perfil

# text
seg-30ea002a06a0 = Interno: identidades de cinemática de sólido rígido, la ida y vuelta CSV y la propia covarianza del filtro. MODELLED (no se compara ningún registro de conducción real)

# text
seg-8685fd899e3c = Mecanización INS strapdown

# text
seg-ba942e322f8a = Mecanización inercial strapdown NED WGS-84 con actitud en cuaterniones (con compensación de coning/sculling) que propaga un estado de navegación a partir de incrementos (Δθ, Δv)

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) ejecutado bajo Octave: una herramienta INS publicada independiente alimentada con el mismo flujo de incrementos (Δθ,Δv). La actitud coincide bit a bit (mismas convenciones NED / cuaternión con escalar primero / velocidad de rotación terrestre / velocidad de transporte); velocidad/posición concuerdan salvo dos diferencias documentadas: el término de gravedad norte por desviación de la vertical que NaveGo incluye y kshana omite por diseño (gravedad de plomada; coincide con la forma cerrada de Groves en todos los dígitos, con una aserción de suelo de cordura) y las diferencias de integrador de O(dt²), no errores de mecanización

# text
seg-d1a5c8e7ca74 = Síntesis de funcionales del campo de gravedad (mapa de navegación asistida por gravedad / sin GNSS)

# text
seg-8336eb12eb7b = Magnitud de gravedad por armónicos esféricos + perturbación (mGal) a partir de cualquier modelo ICGEM .gfc; gravedad normal GRS80

# text
seg-b5a7fc986751 = Gravedad normal de Somigliana GRS80 (Moritz { "1980" }, IAG) + γ_e/γ_p publicados; campo real ICGEM EGM2008

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } del CR3BP Tierra-Luna frente a la órbita que voló CAPSTONE

# text
seg-d4127cf241f3 = La órbita de halo casi rectilínea austral L2 circular restringida { "9" }:{ "2" } que corrige cr3bp::differential_correct_halo (la familia de órbitas de Gateway y CAPSTONE), comparada en su geometría media (periodo, radio de perilunio, radio de apolunio) con la órbita que CAPSTONE voló realmente. Una medición de lo bien que el miembro del CR3BP describe la órbita real; una órbita CR3BP no es una órbita de modelo de efemérides y no se compara época por época

# text
seg-e0cc33dfb10b = Medido frente a la efeméride reconstruida de CAPSTONE de JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado en la Luna, 2023-03-01..31 a { "10" } min), incluida byte por byte (tests/fixtures/capstone_horizons/, NOTICE.md), fijada de antemano { "4e868170" } antes de descargarla, como una medición con umbrales sobre la geometría media. No es una validación: el CR3BP omite el Sol, la excentricidad de la Luna y el mantenimiento de estación que realizó CAPSTONE, por lo que los umbrales describen cuán representativa es la órbita del modelo, no una exactitud. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = Estados rotatorios del CR3BP transformados a ICRF centrado en la Luna sobre la línea Tierra-Luna de DE440

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf transforma un estado rotatorio adimensional del CR3BP Tierra-Luna en una posición y velocidad ICRF centradas en la Luna sobre la línea Tierra-Luna instantánea (unidad de longitud la distancia Tierra-Luna, unidad de tiempo la inversa de la velocidad orbital, la velocidad angular completa del sistema, incluida su componente fuera del plano debida a la aceleración de la Luna), con la inversa from_moon_centred_icrf, y cr3bp::to_moon_centred_icrf_de440 lee el estado geocéntrico de la Luna de un SPK DE440. Transforma estados; no convierte una órbita CR3BP en una órbita de modelo de efemérides

# text
seg-d91ce10ea439 = sxform del NAIF SPICE Toolkit (CSPICE N0067 mediante spiceypy { "8.3.0" }) de un sistema dinámico de dos vectores (primario +X a lo largo de la posición de la Luna respecto a la Tierra, secundario +Y a lo largo de su velocidad, de440s), aplicado al estado rotatorio dimensional construido a partir del propio estado de la Luna de SPICE, mediante un programa independiente que no llama a ningún código de Kshana (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Fijado de antemano 2313eb1b, enmendado antes de cualquier ejecución en d5ef79b3 para incluir la velocidad angular fuera del plano del sistema (sin ella la velocidad se desviaría hasta { "8e-2" } m/s). Una comprobación de biblioteca solo de la transformación. Resultados: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Tipo de escenario del sistema solar sobre un kernel de JPL (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = El tipo de escenario <c1/> con planetary_kernel_path: cada cuerpo informado cuyo propio código NAIF contiene el SPK toma su posición y velocidad heliocéntricas J2000 del kernel mediante el lector propio del motor (etiqueta KERNEL), un enlace cuyos dos extremos están en el kernel se calcula sobre él, los baricentros nunca se sustituyen por un planeta, y todos los demás cuerpos siguen siendo analíticos con su propia etiqueta; el informe añade un bloque kernel (ruta, SHA-256, los cuerpos y enlaces tomados de él) solo cuando la opción está activada. Con de440s.bsp son Mercurio, Venus, la Tierra y la Luna

# text
seg-05cc6642285b = Estados heliocéntricos spkezr del NAIF SPICE Toolkit (CSPICE N0067 mediante spiceypy { "8.3.0" }) sobre el de440s.bsp completo, un programa independiente que no llama a ningún código de Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); el motor lee recortes de de440s bit a bit. Fijado de antemano f8e946ea. Una comprobación de biblioteca del cableado: ni el propio DE440 ni los cuerpos analíticos se validan aquí. Resultados: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop sobre las efemérides DE440

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: el barrido fecha de lanzamiento x fecha de llegada de C3 de salida (km²/s²) y V-infinito de llegada (km/s) con el resolutor de Lambert prógrado de una sola revolución y la protección de colinealidad de { "0.5" } grados, sobre los estados heliocéntricos J2000 de dos cuerpos NAIF cualesquiera leídos de un SPK DE440 de JPL con el lector propio del crate. Una revolución, prógrado, sin restricciones de vehículo de lanzamiento ni de llegada: un barrido, no un diseño de misión

# text
seg-bd19ca214f29 = Estados heliocéntricos del NAIF SPICE Toolkit (CSPICE N0067 mediante spiceypy { "8.3.0" }) sobre de440s.bsp y lambert_problem de pykep { "3.0.1" } (ESA, el núcleo kep3 en C++, MPL-2.0), un resolutor de Lambert independiente, ejecutados como programa independiente que no llama a ningún código de Kshana (tests/fixtures/porkchop_de440/, NOTICE.md); el motor lee un recorte de de440s bit a bit. Fijado de antemano 2d857fb1. Una comprobación de biblioteca del barrido. Resultados: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

# text
seg-b1401bed5da8 = Optimizador de transferencia impulsiva sobre las efemérides DE440

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: las fechas de salida y llegada de una transferencia balística de dos impulsos de una sola revolución que minimizan el C3 de salida o el V-infinito de llegada dentro del Tipo I o el Tipo II, como óptimo continuo (una rejilla de 2 días sobre ambas ventanas, luego Nelder-Mead 2-D), sobre estados heliocéntricos del SPK DE440. Un optimizador de fechas para un solo tramo, no un diseño de misión: sin opciones de vehículo de lanzamiento, órbita de aparcamiento, maniobra en el espacio profundo ni multirrevolución

# text
seg-6c695aef043b = Un optimizador independiente: estados heliocéntricos del NAIF SPICE Toolkit (CSPICE N0067 mediante spiceypy { "8.3.0" }) sobre el mismo recorte de de440s, lambert_problem de pykep { "3.0.1" } (ESA, MPL-2.0) y Nelder-Mead de SciPy { "1.18.1" }, sin llamar a ningún código de Kshana. El manual de la NASA Tierra-Marte (MIDAS, efemérides no indicadas, rejilla de fechas de 2 días) es una referencia publicada secundaria y no determina el estado

# text
seg-93f3cdbb7297 = Resolutor de transferencias de Lambert multirrevolución

# text
seg-995a6a995b78 = Todas las soluciones del problema de Lambert con hasta tres revoluciones completas (maneuver::lambert_multirev: la solución de una revolución, luego las ramas izquierda y derecha de cada número de revoluciones, Izzo { "2015" }), con las velocidades de contorno v1 y v2, para transferencias prógradas y retrógradas, en unidades canónicas y en SI heliocéntricas, incluidas transferencias a menos de { "1" } % del tiempo de vuelo mínimo de un número de revoluciones y geometrías próximas a 180 grados. Solo un resolutor de dos cuerpos (sin perturbaciones)

# text
seg-77c43836cafe = lambert_problem de pykep { "3.0.1" } (ESA, el núcleo kep3 en C++, MPL-2.0), una biblioteca independiente, ejecutada como programa independiente por scripts/gen_lambert_multirev_ref.py; solo se registra su salida numérica. Fijado de antemano a75de851 (conjunto de casos, umbrales, regla de resultado) antes de cualquier comparación; la referencia se regeneró de forma independiente y es idéntica byte a byte. Resultados: docs/design/evidence/lambert-multirev/RESULTS.md

# text
seg-ff9c6140fe1c = Resolutor de transferencias de Lambert de dos cuerpos

# text
seg-d8c39ced64b2 = Resolutor de Lambert de Izzo-2015 de una revolución (r1, r2, tiempo de vuelo → velocidades de contorno) en transferencias LEO→GEO→heliocéntricas, prógradas y retrógradas

# text
seg-d0470acf4f29 = izzo2015 de lamberthub { "1.0.0" } (J. Martínez Garrido, MIT): un resolutor de Lambert de terceros independiente. El problema de Lambert de una revolución (M={ "0" }) tiene una solución única, por lo que la concordancia entre bibliotecas es una comprobación externa genuina; coincide a <{ "1e-4" } m/s (observado ~{ "1e-11" }), el mismo tipo de validación que recibe DOP frente a gnss_lib_py

# text
seg-347cece5df63 = Marcos de referencia y escalas de tiempo

# text
seg-5a4bc2c15eaa = Precesión-nutación IAU 2006/2000A, CIO GCRS↔ITRS, escalas de tiempo con segundos intercalares

# text
seg-51d28ab9d256 = Vectores de referencia IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Fechas julianas de dos partes y segundos intercalares en la ruta temporal de órbita terrestre

# text
seg-5e859e3aa613 = Una fecha y hora de calendario UTC a una fecha juliana UTC de dos partes con la convención dtf2d de SOFA para días que terminan en un segundo intercalar ({ "86 401" } s de duración, { "23" }:{ "59" }:{ "60" }.x válido), de UTC a TAI y a la inversa, y UT1 a partir de UTC a través de TAI, sobre fechas de dos partes desde 1972-01-01: la ruta temporal que toman SGP4 (Sgp4::propagate_at, medido desde una época de dos partes) y la rotación fija a la Tierra IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop con el ángulo de rotación terrestre de dos partes)

# text
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; los algoritmos SOFA publicados por el proyecto ERFA), una biblioteca independiente: erfa.dtf2d("UTC"), erfa.utctai y erfa.taiutc sobre los instantes registrados, la diferencia formada parte por parte sobre las fechas de dos partes, umbral { "1e-6" } s fijado antes de la ejecución (fijado de antemano e947e69d). Peor diferencia { "9.6e-12" } s (dtf2d) y { "1.9e-11" } s (utctai, taiutc). Tomar cada día UTC como { "86 400" } s, o dejar sin escalar la fracción del día con segundo intercalar, pone el ensayo en rojo. UT1 a través de TAI (iauUtcut1) se comprueba en el tramo ERFA de la fila de la ruta de órbita terrestre. Alcance: UTC desde 1972-01-01; el UTC anterior, de tasa variable, no se modela

# text
seg-f1c7bc235a6b = Fechas julianas de dos partes hasta la rotación terrestre en la ruta de órbita

# text
seg-cee11d4bad08 = Rotación terrestre a partir de una fecha juliana UT1 de dos partes en la ruta de órbita, de modo que la posición fija a la Tierra conserva el microsegundo que pierde una fecha de un único f64 (unos { "3e-9" } rad cerca de { "2020" }): jd2::gmst82 (GMST IAU { "1982" }, la convención TEME, sobre las dos partes), cio::gcrs_to_itrs_matrix_jd2 (la matriz CIO de GCRS a ITRS con el ángulo de rotación terrestre a partir de las dos partes) y, construidas sobre ellas y comprobadas internamente, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 y own_jd2_utc, el two_part_jd opcional del escenario de efemérides (la posición ECEF, la traza en tierra y la vista desde estación; desactivado por defecto, sin cambios), y conversiones From sin pérdidas entre jd2::Jd2 y timescales::TwoPartJd. La precesión-nutación y la época del modelo de fuerzas de Cowell siguen en un único f64, donde un redondeo de { "40" } us queda por debajo de { "1e-15" } rad o muy por debajo del error de las efemérides analíticas de Sol/Luna

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; los algoritmos SOFA publicados por el proyecto ERFA), una biblioteca independiente: gmst82 y c2t06a sobre las fechas de dos partes registradas, movimiento polar { "0.1" } y { "0.3" } segundos de arco. Fijado de antemano b10475ee (fechas, umbrales) antes de escribir las funciones y antes de ejecutar la referencia independiente. Los ensayos internos (la opción del escenario, la ida y vuelta TEME/ITRF, las conversiones de tipos) son autoconsistencia de apoyo

# text
seg-096df3971f5f = Matrices de sistemas de referencia frente a vectores ERFA: sesgo-precesión IAU { "2006" }, TEME a GCRS y la cadena CIO con correcciones del polo celeste

# text
seg-731a5ed967b3 = Tres matrices de sistemas de referencia comparadas elemento a elemento o por ángulo de rotación con ERFA en épocas arbitrarias: precession::precession_matrix (sesgo-precesión IAU { "2006" } mediante ángulos de Fukushima-Williams), nutation::teme_to_gcrs_matrix (la rotación de TEME a GCRS P^T N^T Rz(-EE) con precesión IAU { "2006" }, nutación IAU 2000B y la ecuación de los equinoccios con sus dos primeros términos complementarios) y cio::gcrs_to_cirs_matrix_with_offsets (la rotación de GCRS a CIRS con las correcciones del polo celeste del IERS dX, dY sumadas a los X, Y del CIP del modelo antes de la rotación, la convención del cookbook de SOFA; nuevo). Las elecciones de modelo en sí (nutación 2000B en la ruta TEME, la serie complementaria de dos términos) no se validan, solo su implementación

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; los algoritmos SOFA publicados por el proyecto ERFA), una biblioteca independiente: pmat06; numat(obl06, nut00b) con la ecuación de los equinoccios de eect00 (la serie complementaria completa), compuesta como P^T N^T Rz(-EE); xys06a y luego c2ixys(X + dX, Y + dY, s). Fijado de antemano 979c1e39 (épocas, correcciones y umbrales) antes de ejecutar la referencia independiente. El residuo TEME de { "1.1e-10" } rad es el efecto previsto de conservar dos términos complementarios (unos { "3" } mm en órbita GNSS)

# text
seg-4e2fe2e3dabb = UTC anterior a 1972 (era de tasa variable) en la ruta temporal de fechas julianas de dos partes

# text
seg-1d086e669f09 = UTC desde 1960-01-01 hasta 1971-12-31, cuando UTC corría con una tasa desplazada respecto a TAI y avanzaba a saltos de fracciones de segundo, en la ruta de fechas julianas de dos partes: TAI - UTC a partir de la tabla de deriva de cada periodo (timescales::tai_minus_utc_on_date), la fecha de calendario UTC a una fecha juliana UTC de dos partes con la duración del día { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC a TAI con la fracción del día escalada de UTC a segundos SI (jd2::utc_to_tai) y TAI de vuelta a UTC (jd2::tai_to_utc), siguiendo dtf2d, utctai y taiutc de SOFA. Antes de { "1960" } se toma TAI - UTC como { "0" } (el valor de SOFA; UTC indefinido) y queda fuera de la afirmación. El timescales::tai_minus_utc de un único f64 sigue fijándose en { "10" } s antes de { "1972" } y no está cubierto

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; los algoritmos SOFA publicados por el proyecto ERFA), una biblioteca independiente: erfa.dtf2d("UTC"), erfa.utctai y erfa.taiutc sobre los instantes registrados, la diferencia formada parte por parte. Fijado de antemano 23c40661 (instantes, tolerancia y la suma de comprobación de { "1972" }+) antes del cambio del motor y antes de ejecutar la referencia independiente. La tabla de deriva se transcribe de la misma tabla iauDat de SOFA que usa la referencia independiente, por lo que la comparación cubre la aritmética de la conversión (duración del día, escalado de UTC a segundos SI, iteración), no la propia tabla histórica

# text
seg-efacec095051 = Reloj de satélite de difusión GLONASS y propagación de órbita de difusión

# text
seg-821b9c01b56e = El sesgo de reloj de satélite de difusión GLONASS -tau_n + gamma_n (t - t_b) en un instante leído en el reloj del satélite (glonass::GlonassEphemeris::sv_clock_bias_s, el desfase corregido por el sesgo de reloj mediante dos iteraciones de punto fijo), y la posición fija a la Tierra PZ-90 del vector de estado de difusión propagado con RK4 mediante las ecuaciones de movimiento del ICD de GLONASS dentro de +/-15 min de la época de referencia (GlonassEphemeris::position_ecef), a partir de registros reales de navegación GLONASS RINEX { "3" }. No se aplica ninguna transformación de PZ-90.11 a ITRF (concuerdan a nivel centimétrico desde { "2014" }; RTKLIB tampoco aplica ninguna). No conectado a ninguna salida de escenario: función de biblioteca

# text
seg-4478a2518341 = geph2clk y geph2pos de RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa), compilados desde el código fuente en C en un arnés independiente (xval/rtklib-glonass) que lee el mismo archivo RINEX con el lector propio de RTKLIB, de modo que se comparan también el análisis, el signo de -tau_n, las unidades y la iteración, además del reloj y la órbita. Fijado de antemano e099c42a antes de que existiera la función y antes de construir el arnés. Ambos lados evalúan la misma forma cerrada del reloj, así que la comparación del reloj cubre la implementación, no la fórmula. Los integradores de órbita difieren (RTKLIB avanza { "60" } s y luego el resto, Kshana pasos iguales de como máximo { "60" } s) y también las constantes (mu de RTKLIB { "3.9860044e14" }, el de Kshana el PZ-90.11 { "3.986004418e14" }); el peor caso de { "1.1" } mm es esa diferencia, como se predijo antes de la ejecución. Alcance: las efemérides de difusión dentro de su intervalo de validez, no la órbita ni el reloj verdaderos (sin comparación con productos precisos)

# text
seg-d3b72a6fbb18 = Una sola ruta de órbita terrestre: conjuntos de elementos SGP4 a GCRS e ITRS en la cadena IAU 2006/2000A con parámetros de orientación terrestre

# text
seg-e4eca7205b5e = La ruta de propagación y de sistemas de referencia que comparten todos los tipos de escenario de órbita terrestre encaminados: un conjunto de elementos medios SGP4 con una época UTC de dos partes (sgp4::MeanElementSet, leído de elementos de diseño de constelación mediante MeanElementSet::from_earth_fixed) propagado por SGP4/SDP4 a TEME (sgp4::SgpOrbit), y las rotaciones TEME -> ITRS y GCRS -> ITRS de la cadena IAU 2006/2000A con UT1 - UTC y movimiento polar (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, las formas sin parámetros teme_to_itrs_matrix y gcrs_to_itrs_matrix). TEME es el ecuador verdadero de la fecha con el equinoccio medio, alcanzado desde GCRS mediante el sesgo-precesión IAU { "2006" }, la nutación IAU 2000B y la ecuación de los equinoccios

# text
seg-44f28276f859 = Tramo { "1" }: python-sgp4 { "2.24" } (licencia MIT; el SGP4 de referencia en C++ de D. Vallado, el código que produjo los vectores de verificación AIAA 2006-6753), WGS-72, modo mejorado. Tramo { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, las rutinas SOFA): c2t06a con TT de utctai/taitt y UT1 de utcut1, y para TEME c2t06a . pnm06a^T . rz(-ee06a). Umbrales fijados antes de la ejecución (fijado de antemano 72ea9eb0). Declarado: la primera ejecución falló el tramo { "2" } en 2016-12-31T23:{ "59" }:{ "59.5" } por un segundo de rotación (UT1 tomado de la fecha juliana cuasi UTC en un día con segundo intercalar); el motor se corrigió (jd2::utc_to_ut1) y la segunda ejecución concuerda con los mismos umbrales. Eliminar el movimiento polar ({ "46" } fallos) o usar constantes WGS-84 en lugar de WGS-72 ({ "4432" } fallos) pone el ensayo en rojo. Este diseño de tres tramos sustituyó una comparación de extremo a extremo con Orekit que falló en el SDP4 de Orekit con e = { "0" } y en su TEME IERS { "1996" } (el hallazgo sigue fijado en tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

# text
seg-f650a11458b8 = Compromiso de diseño de códigos de medición de distancia

# text
seg-071e552a7179 = Lóbulos laterales y cotas de correlación cruzada de secuencias m/Gold, longitud↔ambigüedad

# text
seg-65b7902a2d8f = Correlación cruzada Gold publicada de GPS C/A (−{ "23.9" } dB); cota de Gold { "1967" }

# text
seg-5ec4c0730280 = Geometría GNSS / dilución de la precisión (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP a partir de la geometría de línea de visión mediante Q=(HᵀH)⁻¹ con una descomposición ENU local

# text
seg-cecd882ec4e4 = DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab): biblioteca independiente, coincide a { "1e-6" } relativo

# text
seg-1a5623c81b48 = Error de posición a partir de la geometría: error RMS = sigma_UERE x DOP para la solución de mínimos cuadrados del motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry y check: una simulación de Monte Carlo con semilla (N = { "20,000" } épocas por geometría, sigma = { "1.5" } m, semilla ChaCha8 { "36" } + i) de la propia solución de mínimos cuadrados iterada del motor (pvt::solve_spp, pesos unitarios, resuelta desde la posición verdadera) sobre las { "8" } geometrías de tests/fixtures/dop/dop_reference.csv, comparando las varianzas de error este, norte, arriba y de reloj, el RMS H/V/P, la correlación este-norte, los errores medios y la fracción dentro de la elipse horizontal del { "95" } % con sigma^{ "2" } Q, donde Q es el factor de covarianza del kernel orbit::dop (orbit::dop_cofactor, la misma aritmética) sobre la misma geometría

# text
seg-90f18c774d57 = Coherencia interna frente a una forma cerrada: bajo el modelo gaussiano lineal la covarianza de mínimos cuadrados es sigma^{ "2" } (H^T H)^-1 (Kaplan y Hegarty (eds.), Understanding GPS: Principles and Applications, 2.ª ed., Artech House, { "2006" }, cap. { "7" }). Método y tolerancias de la nota de diseño de geometría { "0.36" }, sección { "5.2" }, fijados en un commit de preregistro antes de la primera ejecución: cada varianza dentro del { "5" } % ({ "5" } errores típicos de una varianza muestral con N = { "20,000" }), cada RMS dentro del { "2.5" } %, la correlación este-norte dentro de { "0.035" } (5/sqrt(N)), cada media dentro de { "5" } errores típicos, la fracción de la elipse del { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } errores típicos binomiales); los controles negativos (PDOP duplicado; errores que crecen como 1/sin(elevación) frente a la Q sin ponderar) deben fallar. CÓMO SE COMPONE: Q es el factor de covarianza del kernel orbit::dop, VALIDATED frente a gnss_lib_py { "1.0.4" } sobre estas mismas { "8" } geometrías en tests/dop_reference.rs (fila «Geometría GNSS / dilución de la precisión»); esta fila añade el paso de esos factores a metros mediante el resolutor del motor y no toma prestado el estado de aquella fila. POR QUÉ MODELLED: no interviene ningún conjunto de datos externo; la concordancia muestra que el estimador y el ruido realizan sigma x DOP bajo el modelo de manual, no que el error de ningún receptor sea igual a UERE x DOP, y sigma_UERE es una entrada

# text
seg-9acfde1b57f7 = Clasificación de confianza con conciencia de geometría: geometría de satélites junto a la puntuación de confianza del receptor y una clase en cada deducción

# text
seg-6138c41e13ff = receiver_trust::geometry: geometría de satélites por época (buena, degradada con motivos pocos satélites/PDOP alto/HDOP alto/cielo bloqueado, o desconocida cuando el registro no da GSV, NAV-SAT ni GSA) derivada de las elevaciones y acimuts informados mediante orbit::dop o tomada de GSA, con una etiqueta siempre informada y nunca puntuada (buena, aceptable, mala, desconocida) y el HDOP, PDOP, VDOP, el número de satélites y la pérdida de señal expresados con palabras; un monitor de geometría de la puntuación del buque que no deduce nada salvo que la geometría sea mala (razón max(hdop/4, pdop/6, 5/n_used) por encima de { "1" }), y luego crece hasta un tope de { "15" } puntos en { "1.5" } que la geometría por sí sola no puede llevar por debajo de la banda degradada (tope, fin de la rampa y suelo en [geometry]; sin alarma); una clase en cada deducción (geometría, entorno, incoherencia) con la pérdida de enganche de satélites por debajo de { "15" } grados clasificada como geometría, los satélites a la vista pero no seguidos clasificados como entorno, y una deducción por mala geometría cuyo HDOP indicado está más allá de max({ "1.0" }, { "25" } % del HDOP derivado) respecto al cielo indicado clasificada como incoherencia

# text
seg-6987737c5fe4 = Coherencia interna: la clasificación se comprueba frente a las reglas que enuncia y frente a razones derivadas a mano sobre ediciones sintéticas del registro de demostración incluido, y los anclajes de no cambio mantienen las salidas de { "0.35.0" }: ninguna puntuación cambia salvo que la geometría sea mala; la etiqueta siempre se informa. POR QUÉ MODELLED: los umbrales se eligen, no se ajustan (procedencia en el geometry_model de cada ejecución; las cifras de IEC 61108-1 y GPS SPS tal como se citan, por contrastar con el texto de las normas), y no existe un conjunto de datos externo etiquetado de degradación natural de la geometría frente a ataques con el que validar la clasificación. El DOP derivado reutiliza el kernel orbit::dop, VALIDATED frente a gnss_lib_py, cuyo estado esta fila no toma prestado. Una clase de geometría es una afirmación sobre el cielo, no un hallazgo de que no ocurrió ningún ataque

# text
seg-540420863a5a = Modelo de ionosfera de difusión (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Retardo de grupo ionosférico oblicuo L1 monofrecuencia de Klobuchar a partir de los ocho coeficientes α/β de difusión

# text
seg-0b0b02e8b0b8 = ionmodel de RTKLIB (tomojitakasu/RTKLIB, src/rtkcmn.c): implementación de referencia independiente compilada desde el código fuente; coincide a < { "1e-4" } m

# text
seg-0af6b1a073ce = Kernel estadístico de integridad RAIM/ARAIM (leyes χ² / χ² no central / normal)

# text
seg-224a6c4200cd = El núcleo distribucional en el que se apoya todo nivel de protección: el umbral de detección de fallos instantáneo χ²₁₋ₚfₐ(dof), la no centralidad de detección fallida pbias=√λ y los multiplicadores de separación de soluciones K_fa/K_md/K_V

# text
seg-03578217425f = Nivel de protección SBAS (HPL/VPL de mínimos cuadrados ponderados DO-229E)

# text
seg-df640d6c7a5d = Niveles de protección de mínimos cuadrados ponderados del Apéndice J de DO-229E: D=(GᵀWG)⁻¹ a partir de elevación/acimut por satélite y presupuesto de error, eje mayor de la elipse de error horizontal y σ vertical, escalados por los factores K publicados

# text
seg-39aed7b4bffd = Bifurcación SBAS-PL de RTKLIB: waasprotlevels() de zsiki/rtklib_ws (Siki y Takács { "2017" }, «DO-229D Appendix J»), ejecutada por rnx2rtkp -ws sobre mensajes reales de EGNOS GEO-PRN120 + RINEX real de BUTE/Budapest; implementación de terceros independiente, HPL coincide a < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) confirmó una convención idéntica. Ambas referencias independientes redondean K_V→{ "5.33" } frente al exacto Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } de Kshana (~{ "0.06" }%), por lo que lo vertical se comprueba como el d_U sin factor K

# text
seg-8f32eb9c8167 = Métricas de evaluación de detectores de ML (ROC/AUC/confusión/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, empates ½), matriz de confusión en el umbral, P_d/P_md/P_fa/precisión/exactitud/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }): biblioteca independiente, coincidencia exacta

# text
seg-e7af87ce5e72 = Puntuación de detección de anomalías sobre telemetría real de naves espaciales

# text
seg-9659b33fca5b = AUC ROC + IC bootstrap que separa anomalías reales etiquetadas; detector transparente (reproduce las etiquetas)

# text
seg-b4ed67ce7e7e = roc_auc_score de scikit-learn sobre la partición de prueba OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }): telemetría real de OPS-SAT

# text
seg-5c3f1057c6cc = Kernels numéricos de compromiso cuántico (NNLS / bandas χ² / Q de van Loan)

# text
seg-f82113ccb30b = Ajuste NNLS de ADEV medida, bandas de coherencia χ² de NEES/NIS y la covarianza discreta de ruido de proceso de van Loan del reloj (deriva en holdover): la columna computacional del motor de compromiso

# text
seg-823da1deb3af = scipy { "1.17.1" }: optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exactos, χ² <{ "5e-4" } con los grados de libertad de operación. Solo kernels: las cifras de rendimiento de dispositivos siguen siendo modeladas (fila siguiente)

# text
seg-6f3099e7562c = Campo geomagnético de referencia (síntesis IGRF-14)

# text
seg-e9534723cb34 = Síntesis de armónicos esféricos del campo principal IGRF-14 (componentes X/Y/Z/F, declinación e inclinación) que alimenta la capa alt-PNT de anomalía magnética

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT): la implementación de referencia IGRF en Python puro de IAGA-VMOD, que incluye los coeficientes oficiales IGRF14.shc (IAGA 14.ª generación, Zenodo 10.5281/zenodo.14012302); una base de código de terceros independiente que calcula el campo IGRF-14 definido de forma única, con coincidencia sobre una rejilla global

# text
seg-cb3fea409de7 = Estadísticos de detección: AUC gaussiano y fallo mínimo detectable

# text
seg-ca677becb465 = AUC ROC binormal analítico = Φ(μ/(σ√{ "2" })) y el fallo mínimo detectable σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentan los detectores de fallos cuánticos y de anomalías

# text
seg-7d296e4199af = scipy { "1.17" } (ndtr/ndtri de Cephes) + roc_auc_score de scikit-learn (Pedregosa et al., JMLR { "2011" }), ambas BSD-3-Clause: bibliotecas independientes que calculan las mismas magnitudes de cola gaussiana / AUC definidas de forma única, con coincidencia hasta el suelo de erf de A&S (~{ "7e-8" }). La ventaja cuántica frente a la clásica construida encima sigue siendo MODELLED

# text
seg-1ed12110fb74 = Kernel de estadísticos de orden de rango (Kendall-τ / Dirichlet / percentil)

# text
seg-0fb003404a5b = Kernels de correlación de rangos y remuestreo del estudio de inestabilidad de decisión de resiliencia: Kendall τ-b, media de Dirichlet, ranking de competición e intervalos de confianza por percentiles

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause): implementaciones independientes (τ por ordenación por mezcla) de los estadísticos de rango definidos de forma única, con coincidencia a { "1e-12" }. El estudio de inestabilidad de decisión construido sobre estos kernels sigue siendo MODELLED

# text
seg-fdd2ba203d5b = Kernel de derivación de prioridades MCDA (autovector AHP / razón de consistencia)

# text
seg-d01c155fbddf = Pesos de prioridad del Proceso Analítico Jerárquico = autovector principal (de Perron) normalizado de una matriz recíproca de comparaciones por pares mediante iteración de potencias, con el Índice de Consistencia / Razón de Consistencia de Saaty y la puerta de aceptación CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Tabla canónica de Índice Aleatorio de Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) reproducida exactamente + scipy.linalg.eig de SciPy/LAPACK (BSD-3-Clause) como resolutor de autovalores independiente que calcula el mismo autovector/autovalor de Perron definido de forma única, con coincidencia a <{ "1e-9" }. La capa de decisión Pareto / sensibilidad / MAUT construida sobre este kernel sigue siendo MODELLED (los agregadores WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE se validan externamente por separado: véanse las filas siguientes)

# text
seg-73e933220afb = Kernels de agregación ponderada MCDA (WSM / WPM)

# text
seg-c436cdc991a2 = Modelo de Suma Ponderada (agregado aditivo normalizado mín–máx + ranking) y Modelo de Producto Ponderado (agregado multiplicativo normalizado por suma, con recíproco para costes): los dos evaluadores de agregación de valor de los estudios de compromiso

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization): una biblioteca MCDA de Python de terceros, independiente y de uso extendido, que calcula los mismos agregados ponderados definidos de forma única; coincidencia a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_wsm/ y tests/fixtures/mcda_wpm/. Basura entra, basura sale en las entradas; la capa de sensibilidad/robustez sigue siendo MODELLED

# text
seg-f00bdb66a052 = Ranking MCDA por distancia a la solución ideal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution: normalización mín–máx, soluciones ideales positiva/negativa ponderadas, cercanía relativa Cᵢ = d⁻/(d⁺+d⁻) y ranking

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization: una biblioteca MCDA de terceros independiente que calcula los mismos coeficientes de cercanía definidos de forma única; coincidencia a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = Ranking de compromiso MCDA (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija: utilidad de grupo Sᵢ, arrepentimiento individual Rᵢ e índice de compromiso Qᵢ con peso de estrategia v={ "0.5" }, con un ranking en el que menor es mejor

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }): una biblioteca MCDA de terceros independiente que calcula la misma agregación S/R/Q con normalización por rango definida de forma única; coincidencia a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = Ranking MCDA de flujo neto de sobreclasificación (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod: índice de preferencia por pares con las seis formas estándar de criterio generalizado, flujos de sobreclasificación positivo/negativo y el ranking completo de flujo neto (criterio usual validado)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual'): una biblioteca MCDA de terceros independiente que calcula el mismo flujo neto de sobreclasificación definido de forma única; coincidencia a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_promethee/generate_promethee_reference.py. Las formas de preferencia con umbral (q/p/σ) se reducen al mismo álgebra de criterio generalizado y siguen comprobándose por propiedades

# text
seg-72248291c388 = Kernel de elección por sobreclasificación MCDA (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité: matrices de concordancia / discordancia, la relación de dominancia de concordancia y no veto y el kernel de elección por sobreclasificación (convención de todo beneficio, pesos normalizados por suma, una única escala global)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira): una biblioteca de decisión multicriterio de terceros independiente que calcula la misma concordancia/discordancia/dominancia/kernel definidos de forma única; coincidencia elemento a elemento a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_electre/generate_electre_reference.py. Las elecciones de umbral ĉ/d̂ son entradas del analista (la sensibilidad sigue siendo MODELLED)

# text
seg-95942c6a2689 = Kernels de agregación MCDA (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (mezcla convexa normalizada linealmente λ·WSM+({ "1" }−λ)·WPM con λ={ "0.5" }) y el sistema de razones MOORA (total de beneficios ponderado normalizado vectorialmente menos total de costes ponderado): la mezcla de valor endurecida en estabilidad y el evaluador de sistema de razones con signo

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; sistema de razones methods.MOORA, normalización vectorial): una biblioteca MCDA de Python de terceros, independiente y de uso extendido, que calcula los mismos agregados definidos de forma única; coincidencia a <{ "1e-9" }. Regenerable sin conexión mediante tests/fixtures/mcda_waspas/ y tests/fixtures/mcda_moora/. Basura entra, basura sale en las entradas; la capa de sensibilidad/robustez sigue siendo MODELLED

# text
seg-7de67fedc1da = Ranking proporcional MCDA (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment: significancia de beneficio normalizada por suma de columnas S⁺ más el término de significancia de coste inverso, la significancia relativa Q y el grado de utilidad U = Q/max Q (mejor alternativa = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira): una biblioteca MCDA de terceros independiente que calcula la misma significancia relativa/utilidad de COPRAS definida de forma única. Se usa pyDecision deliberadamente: el COPRAS de pymcdm { "1.4.0" } se reduce algebraicamente al trivial S⁺+S⁻ y no es una referencia fiel, mientras que pyDecision implementa el canónico Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Coincidencia a <{ "1e-9" }; regenerable sin conexión mediante tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = Latencia de detección de cambios CUSUM y ARL

# text
seg-302f5db625df = Latencia de detección en el peor caso del detector CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) y longitud media de racha fuera de control, usadas por el nivel de protección de temporización y los monitores de spoofing

# text
seg-691a506ce13f = ARL de CUSUM tabular publicado: aproximación de movimiento browniano de Siegmund ({ "1985" }) (Hawkins y Olwell { "1998" }, ec. { "3.7" }) anclada de forma cruzada a las tablas ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) para k=½, h∈{ "{" }{ "4,5" }{ "}" }; latencia determinista coincidente exactamente con una referencia independiente de primer paso. La cota TPL compuesta sigue siendo MODELLED

# text
seg-d923a77bd31a = Varianza de deriva en holdover de reloj e inversión de umbral

# text
seg-4fafaf5f919d = Crecimiento de la varianza del error de fase en deriva q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 y su inversión monótona a un umbral de holdover de error de temporización

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm que calcula el ruido de proceso discreto de Van-Loan { "1978" } Q₀₀ = ∫₀ᵗ ΦQcΦᵀds mediante escalado y cuadrado de Padé sobre la matriz aumentada de { "6" }×{ "6" }: una vía independiente que nunca ve los coeficientes polinómicos de kshana; más optimize.brentq que invierte la misma curva monótona frente a la bisección de kshana. Las cifras de suelo de ruido rojo por clase (ClockClass) siguen siendo MODELLED

# text
seg-eb3cd9e92d8d = Kernel de diversidad de Simpson inversa

# text
seg-244d57819f2b = Diversidad arquitectónica efectiva = número de Simpson inversa / orden 2 de Hill 1/Σpᵢ² sobre las calidades de fuente por grupo de independencia (el término de diversidad de la puntuación de resiliencia)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause): una biblioteca de terceros independiente que calcula el índice de Simpson inverso definido de forma única; reproducido byte a byte. El marco de puntuación DHS-RPCF (pesos/niveles) construido encima sigue siendo MODELLED

# text
seg-c14b8fe46517 = Máscara de horizonte dependiente del acimut: conjunto visible, acimut y elevación, y DOP bajo la máscara

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: el acimut y la elevación geodésicos (WGS-84) de un satélite desde un emplazamiento terrestre, una tabla de máscara de acimut/elevación interpolada linealmente en acimut con cierre en { "360" } grados, el conjunto visible el >= max(mask_deg, mask(az)), y el DOP de reloj común y la matriz de cofactores ENU y reloj de ese conjunto (el kernel detrás de orbit::dop). Así es como la sección [skyline] decide la visibilidad en los tipos de escenario gnss-sim, jamming, leo-pvt, leo-pass y nmea-scenario y, con el emplazamiento terrestre user_site, en orbit e integrity

# text
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): un TopocentricFrame sobre un OneAxisEllipsoid WGS-84 para los ángulos de visión y un ElevationMask por tabla, ejecutado por xval/orekit-skyline/OrekitSkyline.java sobre estados fijos a la Tierra registrados (no se compara la propagación), con get_dop de gnss_lib_py { "1.0.4" } (metadatos de wheel MIT) para el DOP y la matriz DOP ENU y reloj de los conjuntos que Orekit encuentra visibles. Fijado de antemano (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) antes de ejecutar ninguna de las dos referencias independientes sobre las entradas de comparación; la interpolación lineal con cierre de Orekit se confirmó de antemano con una sonda sintética. Alcance: máscaras de tabla, ángulos de visión geodésicos, el conjunto visible enmascarado y su DOP de reloj común y cofactor. NO se comprueba aquí: las reducciones de cañón, sector y terreno y los preajustes (sus tablas de 360 puntos entraron como entradas; filas «Reducciones de cañón urbano, sectores y terreno a una tabla» y «Preajustes de horizonte»), los estados de reloj por sistema y la elipse de error (fila «Elipse de error horizontal y cofactor por sistema a partir de la covarianza de la geometría»), la rotación GMST del emplazamiento terrestre user_site en orbit/integrity y su fechado de cada propagador a un solo instante (a Orekit se le dan estados fijos a la Tierra), y cualquier obstrucción real (solo línea de visión)

# text
seg-bbb1828b3db1 = Reducciones de cañón urbano, sectores y terreno a una tabla

# text
seg-2864aec7be88 = skyline: el cañón urbano en forma cerrada (corte atan((h - a) / d) con d = (w/2) / abs(sin(az - s)), extremos abiertos para una longitud finita), sectores de bordes netos en sentido horario con cierre, y puntos de terreno reducidos a una tabla con la caída por curvatura d^2/({ "2" } * 4/3 R); el horizonte es su máximo punto a punto con cualquier tabla

# text
seg-50f1df206b30 = Interno: las formas cerradas se comprueban frente a valores calculados a mano (elevaciones de la parte superior de los muros de una calle indicada, la condición de extremo abierto, la caída por curvatura de un punto indicado). Sin referencia independiente externa: la nota de diseño acota estas reducciones como MODELLED, y el ElevationMask de Orekit toma una tabla, por lo que la comparación de la fila «Máscara de horizonte dependiente del acimut: conjunto visible, acimut y elevación, y DOP bajo la máscara» lee sus tablas de 360 puntos como entradas y no las comprueba

# text
seg-3f3d657854ce = Preajustes de horizonte (calle urbana, aproximación a puerto, fiordo, terminal de contenedores)

# text
seg-44ae9b6289d9 = Ninguna: dimensiones elegidas e indicadas, no un levantamiento de ninguna calle, puerto, fiordo o terminal (la relación de aspecto de la calle está dentro de la banda 0.5-2 de Oke ({ "1988" }); el fiordo es del orden de los fiordos del oeste de Noruega; las pilas usan la altura high-cube de ISO { "668" }). El ensayo comprueba los preajustes frente a sus propias dimensiones indicadas, una comprobación de transcripción, que la regla de validación no cuenta

# text
seg-2c53381d48ae = Elipse de error horizontal y cofactor por sistema a partir de la covarianza de la geometría

# text
seg-15fea5c05cbd = geometry::sky_geometry: el cofactor ENU y reloj (H^T H)^-1 con un reloj de receptor común o uno por sistema (el kernel orbit::cofactor_from_los), y la elipse de error horizontal a partir de su bloque este-norte (semiejes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), el acimut del eje mayor desde el norte)

# text
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv de G^T G y numpy.linalg.eigh de su bloque horizontal sobre las entradas registradas, una biblioteca numérica independiente que realiza la inversa y la descomposición en autovalores con sus propios algoritmos (estándar P2). Fijado de antemano en xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) antes de la ejecución; el formato de salida del controlador se corrigió una vez tras el preregistro (un escalar de numpy escrito como np.float64(...)), sin cambio del protocolo ni de las tolerancias. La afirmación validada es el álgebra lineal sobre esas entradas; el modelo de error gaussiano y la UERE son entradas indicadas, no una exactitud medida ni una cota de integridad

# text
seg-6012113b4836 = Funciones de geometría del cielo: visibilidad, DOP, covarianza, elipse de error, nube de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> y <c2/>, funciones de Python y WASM con los mismos nombres, MCP <c3/>): a partir de un emplazamiento, un instante y preajustes de constelación (o satélites como acimut/elevación o ECEF), los satélites visibles y enmascarados bajo un horizonte, GDOP/PDOP/HDOP/VDOP/TDOP, el cofactor de varianza unitaria (H^T H)^-1 y la covarianza en este-norte-arriba con un reloj de receptor por sistema o uno común, la elipse de error horizontal (semiejes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientación { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) desde el norte), y n errores de mínimos cuadrados con semilla bajo errores de distancia gaussianos independientes con su covarianza empírica, RMS y contención del { "95" } %. El cofactor es orbit::cofactor_from_los, el único kernel detrás de orbit::dop y orbit::dop_cov (dop es la reducción de dop_cov): no hay una segunda implementación de DOP

# text
seg-aa0da1028636 = Los factores DOP de reloj único se apoyan en el kernel validado frente a gnss_lib_py { "1.0.4" } (fila «Geometría GNSS / dilución de la precisión (DOP)»); las comprobaciones propias de esta fila son internas: sky_geometry reproduce orbit::dop y dop_cov sobre la misma geometría, la elipse reproduce una descomposición en autovalores analítica 2x2, las entradas ECEF y de acimut/elevación concuerdan, y el RMS y la contención del { "95" } % de la nube con semilla concuerdan con la geometría. La covarianza ENU con un reloj por sistema y la elipse son VALIDATED en la fila «Elipse de error horizontal y cofactor por sistema a partir de la covarianza de la geometría» (numpy, P2); lo que sigue siendo MODELLED aquí es la composición: la propagación de los preajustes a un cielo representativo, la nube de Monte Carlo (comprobada frente a la geometría que muestrea, una comprobación de autoconsistencia) y las superficies. Los preajustes de constelación dan un cielo representativo, no uno fechado; el modelo de error gaussiano y la UERE son entradas indicadas, no una exactitud medida ni una cota de integridad

# text
seg-7f66be0f15c8 = Holdover de reloj sin GNSS

# text
seg-4d8f87668a0f = Crecimiento del error de deriva en forma cerrada + holdover hasta el umbral; clases de relojes cuánticos

# text
seg-2d260626e3d2 = Recursión de covarianza clock_state multipaso (comprobación cruzada dentro del mismo código base); el kernel subyacente de varianza de deriva e inversión de holdover está validado externamente frente a scipy (véase «Varianza de deriva en holdover de reloj e inversión de umbral»). Las cifras de holdover del suelo de ruido rojo por clase siguen siendo MODELLED

# text
seg-29b482d88916 = Tarjetas de dispositivo de reloj medidas (predicción sobre datos reservados)

# text
seg-8c68c5b25004 = clock_library: una tarjeta de dispositivo (ruido blanco de fase, FM blanco, flicker y de paseo aleatorio más una deriva lineal de frecuencia) ajustada a un tercio de un registro de reloj medido con nombre tras un paso de acondicionamiento registrado (se eliminan huecos, valores atípicos de fase, saltos de fase y ráfagas; se registran los saltos de frecuencia), ponderada por los grados de libertad por tipo de ruido identificados con retardo 1, y su desviación de Allan predicha puntuada sobre los dos tercios reservados; lectores de archivos de reloj RINEX e IGS, archivos por laboratorio del BIPM y la Sección { "1" } de Circular T; conversión de una tarjeta al modelo de ruido de temporización de ranura, al modelo de reloj de Kalman extendido y a los niveles de ruido del monitor de spoofing

# text
seg-af2d78e2986c = Registros medidos, reservados: relojes combinados finales de { "30" } s del IGS de los { "11" } satélites GPS Block IIF entre 2026-03-01 y { "14" } (una ventana que ningún ensayo había abierto; IGS, abiertos con atribución) y el receptor u-blox ZED-F9P de JammerTest { "2024" } en sus sesiones estacionarias no puntuadas (GPL-3.0-or-later). Comparación externa D9 (fijada de antemano 2ec76864, desviación de Allan predicha / medida de cada tarjeta dentro de [1/1.5, { "1.5" }] en sus tiempos de promediado ajustados), un hallazgo (sigue siendo MODELLED): { "10" } de las { "11" } tarjetas GPS IIF están dentro del umbral; G27 es optimista a escala de dos horas ({ "0.662" } a { "7680" } s, peor factor { "1.510" }), el error periódico a escala de hora que una tarjeta de ley de potencias no recoge. La tarjeta del TCXO del receptor está bloqueada: fuera de las transmisiones registradas, las demás sesiones del conjunto de datos dejan { "167" } épocas frente a las { "3600" } requeridas. Informado, no a ciegas (registros abiertos por filas anteriores): la tarjeta del cesio 5071A está dentro del umbral (peor { "1.070" } hasta { "4096" } s), la tarjeta del OCXO es conservadora y queda fuera ({ "2.348" } a { "128" } s; su suelo de ruido cambia durante el registro), y la tarjeta del estroncio de Norcia ajustada sobre los tres puntos publicados más cortos está dentro en los dos puntos puntuados ({ "1.291" }, { "1.405" }). Los másers de hidrógeno pasivos de Galileo (no hay fuente accesible sin inicio de sesión de relojes finales de Galileo) y el Deep Space Atomic Clock (un único valor abierto en el espacio) están bloqueados. D9 ronda { "2" }, el TCXO del receptor ZED-F9P como clase de modelo sobre { "14" } días de { "12" } estaciones estáticas de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; fijada de antemano fb475550), un hallazgo: con el procedimiento registrado { "11" } de { "12" } estaciones no fueron evaluables (RAIM rechazó la mayoría de las épocas libres de ionosfera) y BX14 falló; una repetición declarada con un procedimiento corregido (fijada de antemano c9cc0d49) supera { "1" } de { "11" } estaciones a ciegas (BX12, { "1.412" }; BX07 { "1.532" } y BX13 { "1.542" } justo fuera), porque los relojes de receptor de posicionamiento puntual a partir de archivos intermitentes de { "30" } s no son un registro limpio de un oscilador

# text
seg-5097a0e6460d = Tarjetas de reloj GPS Block IIF medidas con términos por revolución (predicción sobre datos reservados)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: una tarjeta de dispositivo que incluye los términos de fase de una a cuatro veces por revolución (periodo T/k, T = { "43 082.05" } s), ajustados conjuntamente con el cuadrático por mínimos cuadrados sobre un tercio de un registro de reloj de satélite medido, con la contribución de Allan en forma cerrada de cada término { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } en la desviación de Allan predicha

# text
seg-83981cd13a17 = Registros medidos, reservados: relojes combinados finales de { "30" } s del IGS de los { "11" } satélites GPS Block IIF entre 2026-04-01 y { "14" } (una ventana que ningún ensayo había abierto; IGS, abiertos con atribución). Comparación externa D9 (fijada de antemano fb475550, desviación de Allan predicha / medida dentro de [1/1.5, { "1.5" }] en cada tiempo de promediado ajustado de cada satélite), un hallazgo (sigue siendo MODELLED): { "9" } de las { "11" } tarjetas están dentro del umbral; G03 ({ "1.947" }) y G25 ({ "1.581" }) son optimistas entre { "60" } s y { "2000" } s porque sus registros reservados son más ruidosos que sus tercios de ajuste (la parte reservada de G25 contiene { "16" } huecos y { "29" } valores atípicos de fase), un cambio del reloj y no un término periódico ausente. Eliminar los términos periódicos de la predicción hace fallar las { "11" } tarjetas ({ "1.77" } a { "4.96" }), por lo que los términos sostienen la predicción

# text
seg-0d72fcc0fbea = Estimación del estado del reloj a bordo

# text
seg-6db5391f8ebe = Reloj de Kalman de van Loan de 3 estados (fase/frecuencia/deriva), estabilizado en forma de Joseph

# text
seg-f41b4c81df2a = KalmanFilter de filterpy { "1.4.5" } (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz de bloques de Van-Loan { "1978" }: una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Coherencia entre implementaciones: la física del reloj / la calibración de Allan no están validadas externamente, por lo que esto sigue siendo MODELLED. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): sobre relojes finales de { "30" } s del IGS de { "11" } satélites GPS Block IIF (2025-08-17 a { "30" }), con Q ajustada a la ADEV de la primera mitad y el filtro puntuado sobre la segunda mitad reservada, el filtro es coherente a un paso ({ "0.906" } a { "0.971" } de las épocas dentro de su banda del { "95" } %, umbral { "90" } %) pero excesivamente confiado a una hora en { "9" } de { "11" } relojes ({ "0.486" } a { "0.829" }) y sus sumas de innovación quedan fuera de [{ "2.4" }, { "3.6" }] en { "5" }. El ruido blanco de fase ajustado es cero en todos los satélites, y el error a escala de hora (términos periódicos, FM flicker) no está en el modelo de 3 estados. Ronda { "2" } de { "0.30" }, un filtro extendido (FM flicker y estados de una y dos veces por revolución) sobre relojes IGS reservados nuevos de 2025-09-01 a { "14" } (fijada de antemano 4b1a841e), un hallazgo (sigue siendo MODELLED): los criterios de coherencia a un paso y a una hora se cumplen en los { "11" } satélites ({ "0.948" } a { "0.988" } y { "0.907" } a { "0.996" }), pero el criterio de la suma de innovación falla en G24 ({ "0.964" }) y G30 ({ "1.929" }) frente a [{ "2.4" }, { "3.6" }]. D9 ronda { "3" }, el filtro extendido de la ronda 2, con ajuste y criterios sin cambios tras el detector de acondicionamiento congelado de clock_library, sobre relojes IGS nuevos de 2026-04-01 a { "14" } (fijada de antemano fb475550), un hallazgo (sigue siendo MODELLED): (a) a un paso { "0.941" } a { "0.968" } y (c) media de NIS triple { "2.641" } a { "3.549" } se cumplen en los { "11" } satélites; (b) una hora falla en G09 ({ "0.894" }) y G26 ({ "0.876" }) frente a { "0.90" }

# text
seg-3f0a9d7c2971 = Presupuesto de errores de transferencia de tiempo

# text
seg-216f46b43860 = Bidireccional/TWSTFT (Sagnac), vista común GNSS, PPP; jitter del enlace→distancia

# text
seg-e7b6aac2ec58 = Magnitud de Sagnac comprobada frente a un VALOR PUBLICADO de autoridad: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Ec. { "1.29" }: una circunnavegación ecuatorial hacia el este acumula { "207.4" } ns (2ωA_E/c²); kshana reproduce { "207.386" } ns. Corroborado de forma independiente por geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que lleva la misma geometría 2Aω/c². El presupuesto compuesto de transpondedor TWSTFT / vista común / PPP del BIPM no tiene referencia independiente externa, por lo que la capacidad sigue siendo modelada

# text
seg-157fadeb5d67 = Modulación de señales de navegación y análisis de seguimiento de código

# text
seg-ab633d191396 = PSD BPSK-R/BOC, separación espectral κ, ancho de banda de Gabor, jitter del DLL, multitrayecto

# text
seg-94f0c4fc2930 = La correlación cruzada/autocorrelación Gold de GPS C/A coincide EXACTAMENTE (enteros ±65/−1/63) con la generación independiente de códigos de IS-GPS-200; la forma de la PSD de BPSK-R({ "1" })/BOC({ "1,1" }) frente a un periodograma independiente de scipy. Las formas cerradas de modulación/SSC/DLL (Betz { "2001" } / Kaplan y Hegarty) siguen siendo analíticas, por lo que la fila sigue siendo MODELLED, pero la subafirmación de correlación de código coincide externamente. Ronda { "2" } de { "0.30" }, frente a los valores impresos de Betz { "2001" } y Hein et al. { "2006" } (fijada de antemano 9f4f2ce8, media unidad impresa), un hallazgo (sigue siendo MODELLED): las { "45" } celdas espectrales de la Tabla { "1" }, los valores de correlación a { "1" } GHz, las cifras de interferencia MBOC y { "2" } de los { "3" } desfases de la Fig. { "17" } concuerdan; los primeros lóbulos laterales a { "24" } MHz, el desfase de la Fig. { "17" } de BOC({ "8,4" }) y todos los sesgos de multitrayecto del peor caso de las Figs. 18-21 ({ "11" } a { "15" } % por debajo) no. Kshana y una evaluación independiente con NumPy de la lectura fijada de antemano concuerdan, por lo que la diferencia está en esa lectura o en un detalle no indicado del artículo; causa sin resolver

# text
seg-589e0053e3e8 = Generación del código de ensanchamiento GPS L1 C/A

# text
seg-782d4da75b59 = Generador de código C/A con LFSR G1/G2 que reproduce los vectores de verificación octales de los primeros 10 chips publicados en IS-GPS-200 para PRN { "1" }–{ "9" } (más longitud de 1023 chips, equilibrio de 512 unos, autocorrelación periódica de tres valores)

# text
seg-473f24d4e06a = IS-GPS-200 Tabla 3-Ia 'Code Phase Assignments': los vectores de verificación OCTALES de los primeros 10 chips publicados, de dominio público del Gobierno de EE. UU. y de autoridad (GPS Directorate, navcen.uscg.gov); el LFSR G1/G2 propio de kshana regenera exactamente todos los vectores de PRN { "1" }–{ "9" }. Las formas cerradas posteriores de modulación/SSC/DLL siguen siendo modeladas (fila aparte)

# text
seg-e6c08e1e6ae3 = Rendimiento de sensores inerciales cuánticos

# text
seg-d28e1f6a430f = Acelerómetro interferométrico de átomos fríos a partir de primeros principios (k_eff·T², QPN)

# text
seg-57fd0a6e5d72 = Vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, la ASD de ruido de disparo es un suelo unilateral dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Un acotamiento, no una paridad. Ronda { "2" } de { "0.30" } (fijada de antemano fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente a los puntos medidos de la Fig. { "14" } de Gauguet et al. { "2009" } da razones de { "0.695" } a { "0.788" } en los tres puntos admitidos ({ "0.751" } en el punto de operación), y no alcanza el umbral del { "30" } % fijado de antemano por { "0.5" } puntos; el suelo de QPN queda entre un { "21" } y un { "31" } % por debajo del ruido medido, como cabe esperar de un modelo sin ruido de láser ni de detección. La composición del gradiómetro coincide con la línea del modelo QPN de Janvier et al. { "2022" } (razón { "1.013" } a { "1.017" }, referencia). El ensayo medido no puede discriminar un error de composición de sqrt({ "2" }); solo puede la línea de Janvier de contraste desigual

# text
seg-4b79d03cecf5 = Ambigüedad de franja / rango dinámico de sensor inercial cuántico

# text
seg-deb2850546d5 = Rango dinámico de ambigüedad de franja Mach–Zehnder: la lectura de franja periódica de 2π fija una fuerza específica máxima sin ambigüedad a_max=π/(k_eff·T²), y el rango sin ambigüedad en celdas de resolución a_max/σ_a=π/σ_Φ es independiente del factor de escala óptico: la ganancia de sensibilidad T² cuesta rango sin ambigüedad en exacta proporción (el tiempo de interrogación intercambia resolución por rango, con el número de celdas fijado por el ruido de fase de lectura)

# text
seg-7603ff7a7693 = Autoconsistencia del modelo de franja del interferómetro: el borde de media franja, la estructura de aliasing periódica de 2π y la cancelación del factor de escala en la razón rango/resolución son identidades algebraicas de forma cerrada comprobadas frente a las propias funciones de fase y sensibilidad Mach–Zehnder del motor: comprobaciones de coherencia interna, NO un conjunto de datos externo, por lo que la fila sigue siendo InternalConsistency. Ambigüedad de franja ideal de tres pulsos MODELLED; sin cotas de aberración de frente de onda ni de pérdida de contraste sobre el rango sin ambigüedad

# text
seg-d04bf321d4a1 = Resiliencia de navegación por estima inercial cuántica

# text
seg-c4989abb5d40 = Presupuesto de posición compuesto de sesgo + factor de escala + VRW + decaimiento de estabilidad durante el holdover

# text
seg-bfe4085115c1 = Integración SDE de Monte Carlo independiente con numpy del ruido de aceleración blanca doblemente integrado (valida la varianza analítica de VRW mediante un algoritmo genuinamente independiente) + un ancla de valor publicado de Groves { "2013" } para los términos de sesgo/factor de escala; las cifras de dispositivos CAI cuantifican hardware del socio y siguen siendo MODELLED

# text
seg-bc6e733c39b3 = Fusión de sensores GNSS/INS

# text
seg-16514286bb51 = EKF de estado de error de 15 estados, débilmente acoplado (validado sobre un recorrido real IMU/GNSS frente a NaveGo); un UKF de pseudodistancia/Doppler fuertemente acoplado y un filtro acoplado de reloj+posición (solo coherencia, fuera de la afirmación validada)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, ejecutado como herramienta bajo GNU Octave, nunca enlazado): su ins_gnss débilmente acoplado sobre su propio recorrido real de vehículo terrestre con IMU/GNSS Ekinox, con ambas soluciones puntuadas frente a la trayectoria de referencia de Ekinox. Ambos filtros leen la misma entrada float32 de { "20" } Hz, y la configuración de Kshana se obtiene mecánicamente de los parámetros publicados del conjunto de datos. El RMS de posición horizontal y vertical de Kshana y su RMS de innovación de posición están dentro de 1.2x de los de NaveGo (medidos { "0.912" }, { "0.940" } y { "0.861" }) y su innovación normalizada media es como máximo { "1.5" } (medida { "0.395" }: unas 2.5x de infraconfianza, dadas las sigmas GNSS indicadas del conjunto de datos); tolerancias fijadas antes de la comparación. Alcance: GNSS está presente a { "5" } Hz durante todo el recorrido, por lo que no se prueba ninguna interrupción ni deriva y la comprobación detecta defectos gruesos del filtro, no un ajuste fino (las soluciones brutas corregidas por brazo de palanca quedarían cerca del umbral vertical); la transformación del brazo de palanca se calcula en el arnés de ensayo. El UKF fuertemente acoplado y el filtro acoplado de reloj+posición conservan sus comprobaciones de coherencia con filterpy { "1.4.5" } (posteriores lineales hasta { "2.4e-12" }) y siguen fuera de la afirmación validada

# text
seg-5692c7b936b6 = Resiliencia al jamming sin GNSS

# text
seg-f4ff77caa47b = Presupuesto de enlace J/S de la geometría, C/N₀ antiinterferencia, pérdida de enganche por satélite

# text
seg-daf317735edb = Ecuación de presupuesto de enlace de C/N₀ antiinterferencia contrastada con una rederivación independiente en numpy (comparte la misma forma cerrada → InternalConsistency) más una caracterización de degradación de C/N₀ de JammerTest-2024 real. Ronda { "2" } de { "0.30" }, bloqueada (sigue siendo MODELLED): la caída medida de C/N0 de JammerTest { "2024" } frente a una predicción de presupuesto de enlace (fijada de antemano 6a66994b, dentro de { "3" } dB) no se ejecutó porque la posición y el apuntamiento de la antena F8.1 en Bleik y la parte de L1 de la potencia de rampa multibanda { "1.6.4" } no están documentados en el catálogo de pruebas ni en el registro oficial

# text
seg-ff90679d1de9 = Detección de spoofing

# text
seg-b843f63e77e6 = χ² asistido por reloj, RAIM, AGC y SQM fusionados en una FoM de seguridad por época

# text
seg-baeb1c3db11f = Parámetros de escenario de TEXBAT (Humphreys { "2012" }): caracterización, no vectores fijados. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): sobre JammerTest { "2024" } (Bleik; datos GPL-3.0) los monitores a nivel de observables (chi cuadrado asistido por reloj, RAIM, fallo de resolución) no dieron alarma en { "10" } s de ninguno de los { "8" } inicios de spoofing publicados evaluables (donde la ventana previa al inicio estaba limpia, la primera alarma llegó entre { "10.2" } y { "39" } s después del comienzo de la franja publicada), y tres ventanas previas al inicio presentaron falsas alarmas del monitor de reloj ({ "81" }, { "64" } y { "173" } épocas). El primer efecto observable fue una pérdida del seguimiento GPS de doble frecuencia, no una inconsistencia de RAIM. Los inicios publicados son comienzos de franja de la programación con resolución de minuto; que precedan a la captura de RF es una interpretación, no una medición. Ronda { "2" } de { "0.30" }, frente al registro oficial de los organizadores de JammerTest { "2024" } (resolución de segundo; fijada de antemano 6a66994b con un monitor de reloj de tres estados calibrado con Hadamard sin enclavamiento), un hallazgo (sigue siendo MODELLED): el monitor da alarma en { "10" } s en { "4" } de los { "10" } inicios registrados; en los otros seis llega con { "18" } a { "211" } s de retraso o da falsas alarmas de reloj previas al inicio ({ "1" } en { "2.1.4" }, { "85" } en { "2.3.15" }). D9 ronda { "3" } (una tarjeta de receptor de las otras sesiones de la unidad de JammerTest, fijada de antemano 2ec76864) bloqueada: { "167" } épocas de entrenamiento frente a { "3600" }. D9 rondas { "4" } y 4b (niveles de ruido de una tarjeta de clase de modelo u-blox ZED-F9P, Wroclaw { "2021" }, fijada de antemano fb475550; 4b, una repetición declarada con una extracción corregida, c9cc0d49), un hallazgo (sigue siendo MODELLED): cero falsas alarmas previas al inicio en los { "10" } inicios registrados y { "6" } de { "10" } en { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } y { "2.6.1" } siguen con retraso (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sin cambios por el nivel de ruido del reloj

# text
seg-b10d07921f5e = Nivel de protección de temporización bajo spoofing

# text
seg-2a829711b997 = Cota en forma cerrada del error de tiempo no detectado en el peor caso = suelo del monitor + σ de deriva del oscilador sobre la latencia de detección de CUSUM, informada como banda de suelo de ruido rojo

# text
seg-682251b2e3c7 = Compone primitivas validadas (allan/holdover de van Loan, suelo de seguridad); calibrado con el escenario { "2.1.1" } de JammerTest { "2024" } (~{ "1.01" } ms de arrastre real de tiempo servido frente a ≤{ "51" } ns declarados). Puente sobre partes validadas: no es en sí una validación externa. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): en los escenarios de spoofing de JammerTest { "2024" } el error de tiempo servido no detectado medido supera el TPL nominal en { "3" } de { "8" } inicios detectados: { "184.3" } frente a { "34.6" } ns ({ "2.1.4" }), { "295.7" } frente a { "159.3" } ns ({ "2.3.5" }) y { "143.0" } frente a { "69.0" } ns ({ "2.3.11" }); tres de los cinco que quedan dentro son triviales (una falsa alarma enclavada previa al inicio). Causa probable: el término de deriva de una calibración de { "60" } s con ruido de deriva nulo no cubre la fluctuación de frecuencia del TCXO del receptor durante { "15" } a { "39" } s. El error medido es la propia estimación de reloj de punto único de Kshana frente a una recta ajustada a sus propias estimaciones previas al inicio, de modo que incluso una concordancia no habría sido totalmente independiente. Ronda { "2" } de { "0.30" }, frente a los inicios del registro oficial de JammerTest { "2024" } y el error de tiempo del receptor medido (fijada de antemano 6a66994b), un hallazgo (sigue siendo MODELLED): en { "4" } de los { "10" } inicios registrados el error no detectado supera el TPL del estado de deriva ({ "634.7" } frente a { "458.5" } ns en { "2.1.1" }, { "232.6" } frente a { "16.2" } ns en { "2.3.5" }, { "41.3" } frente a { "6.0" } ns en { "2.3.10" }, { "218.6" } frente a { "47.4" } ns en { "2.6.3" })

# text
seg-0ec37553bbc4 = Análisis de misión cislunar

# text
seg-a47465f682ba = STM del CR3BP + corrector diferencial de disparo único; NRHO austral L2

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; familia de halo austral L2 Tierra–Luna, metodología Howell/Davis): periodo T, Jacobi C y condiciones iniciales de cruce perpendicular publicados externamente; el corrector STM de disparo único de kshana, sembrado con la CI del catálogo y perturbado, converge de nuevo a los miembros del catálogo

# text
seg-f1d49eac89f8 = PNT alternativo / complementario

# text
seg-023dda973f66 = Correspondencia de mapas de gravedad, referenciado al terreno (TERCOM/SITAN), anomalía magnética

# text
seg-da869d48e505 = Coeficientes IGRF-14; CRLB de filtro adaptado de primeros principios. El campo del benchmark de gravedad de campo real se comprueba externamente (fila «Síntesis de anomalía de gravedad a partir de un modelo de armónicos esféricos»), pero su resultado de navegación no tiene referencia independiente externa

# text
seg-db7767ab661d = Síntesis de anomalía de gravedad a partir de un modelo de armónicos esféricos

# text
seg-2db367c4a473 = Anomalía de gravedad en aproximación esférica (Barthelmes STR09/02 ec. { "126" }, ICGEM gravity_anomaly_sa) a partir de coeficientes totalmente normalizados frente a un elipsoide de nivel en forma cerrada (WGS84/GRS80), con el término de grado cero, en rejilla para el emparejador de mapas de gravedad

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), una implementación independiente: EGM2008 truncado en el grado { "70" }, gravity_anomaly_sa, WGS84, libre de marea, término de grado cero, h = { "0" }. La salida del servicio no lleva una licencia explícita, por lo que las rejillas se descargan en el momento del ensayo con un SHA-256 fijado (tools/fetch_icgem_grid.sh) y solo se citan diez valores con atribución

# text
seg-31f51d4998cb = Lector de elevación digital SRTM sobre terreno real

# text
seg-08ea4ae0b671 = Analizador SRTM .hgt escrito a mano (16 bits big-endian, primero la fila norte, consciente de huecos) + muestreador bilineal que lee un tile DEM real de dominio público y resuelve una referencia topográfica documentada

# text
seg-791e7285c291 = Reproducibilidad y garantía del software

# text
seg-7177355a482c = Determinista, con hash de escenario, SBOM + puertas de referencia multiplataforma

# text
seg-6cf9d570cc51 = Ajuste a la norma del SBOM frente al esquema JSON oficial de CycloneDX { "1.5" } (+ identificadores SPDX válidos): una norma publicada externa, cero errores de validación sobre todo el grafo de dependencias; la parte de determinismo de la FoM / reproducibilidad byte a byte sigue siendo una comprobación de autoconsistencia fijada, por lo que la fila sigue siendo MODELLED

# text
seg-89b2114542bb = Evaluación de detección de perturbaciones de RF con IA/ML ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético etiquetado de perturbaciones + arnés ROC/AUC/confusión/Pfa-Pmd independiente del detector; protección contra fugas, partición estratificada, informe de optimismo por cambio de distribución (dentro frente a fuera de régimen). Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = Cotas de AUC en forma cerrada (Mann–Whitney) + un detector de referencia independiente perfecto; el corpus es SINTÉTICO (fundamentado en parámetros, no de campo/IQ)

# text
seg-c38ebee794b3 = Estudio de la brecha de optimismo de perturbaciones de RF con IA/ML y predictor de brecha solo con ID

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudio sintético controlado de la brecha de optimismo de AUC de dentro a fuera de la distribución en detectores de método publicado y aprendidos (regresión logística / MLP de una capa oculta): tendencias de ley de escala por clase (ρ de Spearman + pendiente sobre { "1" }−gravedad) y un predictor ridge solo con ID que estima la brecha únicamente a partir de diagnósticos dentro de la distribución, puntuado dejando fuera un detector y dejando fuera una clase. Reproducible mediante <c1/>

# text
seg-c46973920f5b = Estadísticos derivados a mano frente a formas cerradas (AUC binormal Φ(d'/√{ "2" }), varianza de DeLong, Spearman con rangos empatados, recuperación exacta por OLS) + CV dejando uno fuera frente a la línea base de predecir la media. El corpus es SINTÉTICO (fundamentado en parámetros, nunca de campo/IQ) y la brecha de optimismo es un cambio de gravedad de sintético a sintético, NO un resultado de simulación a campo

# text
seg-fd6424213d1f = Compromiso PNT cuántico frente a clásico y resiliencia sin GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingesta de ADEV medida (NNLS), tabla de compromiso (holdover de temporización/inercial + beneficio), envolvente de resiliencia frente al tiempo; la salvedad del suelo se lleva en el artefacto. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = El kernel de ajuste de ADEV medida→PSD (NNLS) coincide con scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs): un kernel externo independiente; pero los NÚMEROS del compromiso cuantifican (nunca validan) un reloj/CAI del socio, por lo que el compromiso en sí sigue siendo MODELLED, sin halo de validación

# text
seg-1fa865bfddd1 = Entorno de clima espacial y densidad termosférica dirigida por la actividad

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 y la densidad termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfiles de difusión estáticos que reproducen su Tabla { "7" }, con las variaciones diurna, geomagnética, semianual, estacional-latitudinal y del helio) frente a la atmósfera estática USSA76. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/space-weather.toml)

# text
seg-1cad4329e226 = Tabla definicional Kp↔ap + forma cerrada de la temperatura exosférica de Jacchia-1971 (coincide a <{ "1" } K con los anclajes publicados, tests/space_weather_reference.rs); la densidad se caracteriza frente a pymsis NRLMSISE-00 (un modelo independiente del NRL): la oscilación del ciclo solar a { "800" } km es 10.4x frente a 13.6x de NRLMSISE-00. Revisión { "0.30" }: el factor de actividad de primer orden calibrado se sustituyó por Jacchia { "1971" } (densidad del escenario por defecto a { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k eliminado, mean_exospheric_temperature_k añadido). Ronda { "2" } de { "0.30" }, densidades medidas por acelerómetro TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; fijada de antemano 20eed695), un hallazgo (sigue siendo MODELLED): los promedios orbitales a { "400" } a { "500" } km quedan dentro de un factor { "2" } en el máximo solar fuera de tormentas (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), pero Jacchia { "1971" } es aproximadamente 1.7x demasiado denso en el mínimo solar de { "2008" } (GRACE-A 412/544 dentro de un factor { "2" }), por lo que la densidad no está validada

# text
seg-29bedb28c34f = Interoperabilidad CCSDS OEM (importación de efemérides de GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = Importador CCSDS { "502.0" } OEM (parse_oem), tolerante con líneas COMMENT / palabras clave de metadatos adicionales / bloques de covarianza y la inversa exacta del escritor; ida y vuelta + ingesta de archivo externo con comprobación de coherencia de velocidad. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Ventana de lanzamiento y geometría de ascenso (análisis de misión)

# text
# c1: launch-window
seg-6066c634faba = Acimut(s) de lanzamiento de dos cuerpos (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, bonificación hacia el este por rotación terrestre, Δv de cambio de plano con dogleg y oportunidades diarias, y, dados una época y filas IERS finals2000A, la velocidad del emplazamiento alrededor del polo verdadero (launch::site_rotation_speed_at). Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Geometría de lanzamiento de trigonometría esférica en forma cerrada frente a anclajes de ejemplos resueltos publicados (Vallado, Fundamentals of Astrodynamics 4.ª ed., Algoritmo { "37" } de acimut de lanzamiento + Cap. 6 de cambio de plano; tests/launch_window_ascent_geometry_reference.rs). Estos reutilizan la misma forma cerrada que implementa kshana (una comprobación de paridad con valor publicado / de transcripción, InternalConsistency); MODELLED de dos cuerpos, sin modelo de triángulo de velocidades con Tierra en rotación / ascenso / pérdidas por resistencia. Comparación externa { "0.30" } con Orekit { "12.2" } (Apache-2.0), un hallazgo (sigue siendo MODELLED): la geometría concuerda hasta el redondeo (inclinación leída de vuelta desde el acimut de agotamiento en { "158" } casos, peor { "2.6e-15" } rad; inclinación mínima, velocidad circular y delta-v de dogleg a { "3e-16" }), pero la velocidad del emplazamiento por rotación terrestre no alcanza el umbral relativo de { "1e-6" } fijado de antemano a { "62.9" } grados de latitud ({ "1.12e-6" }). La diferencia crece como tan(lat), coherente con un desplazamiento del polo por movimiento polar de unos { "5.8e-7" } rad en el sistema terrestre de Orekit que el ω·R·cos(lat) esférico omite. La afirmación no se restringió antes de la ejecución, por lo que la fila no puede promoverse con esta comparación. Ronda { "2" } de { "0.30" } (fijada de antemano 71bebf63): con una época y filas IERS, la velocidad del emplazamiento sobre el polo verdadero (campo de escenario site_rotation_speed_true_pole_m_s) concuerda con Orekit a { "1e-6" } en { "24" } emplazamientos sobre cuatro longitudes (peor { "4.9e-8" }), pero la velocidad nominal sin época que el escenario emite por defecto como bonificación por rotación terrestre sigue fallando por { "1.12e-6" }, por lo que la fila sigue siendo MODELLED a la espera de una decisión sobre la salida por defecto

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Deceleración máxima (independiente del coeficiente balístico), velocidad + altitud en el pico de g y velocidad de calentamiento máximo para una entrada balística en atmósfera exponencial. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Entrada analítica de Allen–Eggers en forma cerrada, contrastada además con una integración numérica con solve_ivp (DOP853) de scipy { "1.18" } de la MISMA EDO de entrada solo con resistencia (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, peor rel de a_max { "2.9e-9" }): una comprobación integral numérica frente a la propia forma analítica, por lo que sigue siendo InternalConsistency, NO una validación externa. MODELLED balístico (sin sustentación), sin aerotermia/TPS: la salida de calentamiento es una velocidad, no un flujo de calor. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a la reconstrucción de la entrada de la SRC de Stardust (Desai y Qualls, NASA NTRS { "20080008567" }), la deceleración máxima de Allen–Eggers para el estado de entrada inercial impreso ({ "12.9" } km/s, -8.2 grados, H { "7200" } m) es { "61.8" } g frente a los { "32.89" } g de la mejor trayectoria estimada, +{ "88" } % frente a una tolerancia del { "15" } %: la solución de ángulo de trayectoria constante y sin gravedad casi duplica el pico de una entrada poco inclinada y más rápida que la velocidad de escape. Stardust no llevaba acelerómetro, por lo que la reconstrucción es una estimación de trayectoria. Ronda { "2" } de { "0.30" }, bloqueada (sigue siendo MODELLED): una solución integrada de masa puntual plana (reentry::simulate_planar_entry, US76, gravedad de cuadrado inverso, curvatura) concuerda con las mejores trayectorias estimadas de Stardust y Genesis dentro del { "15" } % (+{ "11.3" } %, +{ "5.6" } %), pero esos máximos son salidas de simulación de agencia, no mediciones, por lo que es solo una comprobación cruzada. La comparación con acelerómetro (fijada de antemano a94a283d) está bloqueada a la espera de una copia legible del análisis REMM de Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-8c10b50407d3 = Huella de carga útil EO y geometría de cobertura

# text
# c1: eo-coverage
seg-45c1e799c87c = Geometría del triángulo espacial de SMAD: radio angular de la Tierra, ancho de franja, GSD en nadir, acceso máximo fuera de nadir y periodo circular, más el periodo nodal J2 de primer orden (eo_payload::j2_nodal_period) y el espaciado de la traza en tierra ecuatorial R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) con un indicador de cobertura contigua, para una altitud orbital, inclinación y FOV/IFOV del sensor. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/eo-coverage.toml); su inclinación por defecto es la heliosíncrona de eo_payload::sun_synchronous_inclination, un valor por defecto de conveniencia que no forma parte de la afirmación validada

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) y GeographicLib { "2.1" } (MIT), ambos ejecutados como programas independientes, fijados de antemano (766823f3) antes del cambio del motor y de cualquier ejecución de referencia independiente: magnitudes esféricas dentro de { "1e-9" } relativo (peor: radio angular { "5.4e-16" }, franja { "7.0e-13" }, acceso { "1.9e-14" }), periodo { "1e-12" } ({ "1.6e-16" }), GSD en nadir { "1e-7" } ({ "2.9e-10" }), el periodo nodal J2 y el espaciado de nodos dentro del { "0.1" } % de una propagación J2 numérica de Orekit con detector de nodos ({ "1.2e-5" } y { "6.7e-5" }), el indicador contiguo exacto (168/168), y frente al elipsoide WGS-84 el limbo dentro de { "0.3" } grados ({ "0.186" } grados) y el alcance máximo en tierra dentro del { "0.5" } % ({ "3.2e-3" }). Eliminar el término de regresión nodal hace fallar { "35" } de los { "42" } puntos de nodo. Alcance MODELLED: huella de Tierra esférica; sin radiometría, MTF, atmósfera, jitter ni destellos; no se compara la inclinación heliosíncrona por defecto. La comprobación cruzada anterior con Skyfield/SGP4 se conserva como regresión. Revisión { "0.30" }: el espaciado ahora incluye la regresión nodal J2 (escenario por defecto { "2756.37" } -> { "2752.17" } km)

# text
seg-940692c550f3 = Encuadre TM/TC de CCSDS Space Packet ({ "133.0" })

# text
# c1: space-packet
seg-bf06c7ffa875 = Codificación/decodificación de la cabecera primaria de CCSDS 133.0-B Space Packet (versión/tipo/cab-sec/APID/indicadores-sec/contador/longitud-de-datos) + un escenario de encuadre. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0): una implementación de terceros independiente de CCSDS 133.0-B-2; encode_packet/decode_packet de kshana coincidieron byte a byte (la cabecera primaria de 6 octetos en { "33" } casos + el paquete codificado completo en { "12" })

# text
seg-5510c82f671a = Cabecera secundaria, control de errores de paquete y segmentación de CCSDS Space Packet

# text
seg-7503bf761df9 = Extensiones de CCSDS 133.0-B-2 Space Packet junto a la cabecera primaria: una cabecera secundaria con un código de tiempo CCSDS 301.0-B (CUC o CDS, campo P explícito o implícito) y datos auxiliares, el campo de control de errores de paquete CRC-16, la segmentación de una unidad grande de datos de usuario y su reensamblado, decodificación de flujos con comprobaciones de huecos de secuencia y de orden, y paquetes PUS-TM. La salida de la cabecera primaria es idéntica byte a byte a la anterior

# text
seg-4123d600477a = Fijado de antemano (003ef3eb) antes de cualquier comparación; cuatro implementaciones independientes, ninguna GPL, nada incluido en el repositorio: ccsdspy { "2.0.1" } (BSD-3-Clause) decodifica { "34" } paquetes escritos por Kshana en { "5" } flujos (cabecera primaria, campo P, tiempo grueso y fino, campos CDS, datos auxiliares, datos de usuario, PEC) y las dos unidades segmentadas de 1000 octetos se reconstruyen a partir de sus datos de usuario con { "0" } discrepancias, y señala los flujos con un paquete perdido y con paquetes intercambiados que Kshana rechaza; el CRC de { "8" } mensajes y { "57" } campos PEC es igual a binascii.crc_hqx de CPython y a spacepackets-rs { "0.18.0" } (valor de comprobación 0x29B1); { "66" } casos de código de tiempo CUC y CDS son iguales a la escritura y lectura de spacepackets-rs { "0.18.0" } octeto a octeto ({ "3" } casos CDS también con spacepackets-py { "0.32.0" }); { "4" } paquetes PusTm de spacepackets-py { "0.32.0" } son idénticos byte a byte a los de Kshana. No cubierto: códigos de tiempo de época de agencia ({ "7" } casos se apoyan en ensayos unitarios), tramas de transferencia TC y cualquier capa de enlace por debajo del paquete

# text
seg-7c61da52b8f8 = Exportación SPICE SPK (tipos { "9" } y { "13" })

# text
seg-582ce23522f6 = Escritor y lector de kernels NAIF SPICE SPK de los tipos { "9" } (Lagrange, pasos de tiempo desiguales) y { "13" } (Hermite, pasos de tiempo desiguales), con la disposición DAF, descriptores de segmento y directorios de épocas, y la exportación de un CCSDS OEM a un kernel SPK (épocas UTC o TDB a tiempo de efemérides)

# text
seg-194c37ac787f = CSPICE N0067 mediante spiceypy { "8.3.0" }, kernel de segundos intercalares naif0012.tls, fijado de antemano (5059fd2a) antes de que SPICE leyera ningún kernel de Kshana: el inventario de SPICE de los cuatro kernels de Kshana es exacto; spkpvn y spkgeo en { "5 516" } épocas y { "690" } evaluaciones de cadena son iguales a la propia evaluación de Kshana bit a bit y quedan dentro del umbral en cada nodo (peor { "0.022" } del mismo); Kshana lee kernels escritos por SPICE de forma idéntica bit a bit; para las mismas entradas los kernels de Kshana son idénticos byte a byte a los de SPICE ({ "0" } bytes distintos en cuatro archivos); las épocas OEM se convierten a tiempo de efemérides a { "6.0e-8" } s de str2et (umbral { "1e-6" } s) y SPICE evalúa la exportación OEM dentro del umbral (peor { "0.060" }). Arcos de Kepler sintéticos: nada sobre exactitud física. No se escriben otros tipos de SPK

# text
seg-d699104fc2af = SPICE SPK tipos { "3" } y { "21" } (Chebyshev, líneas de diferencias extendidas)

# text
seg-7d3e8b5b40af = Escritor y lector de segmentos NAIF SPICE SPK del tipo { "3" } (polinomios de Chebyshev para posición y velocidad en intervalos fijos, grado { "0" } a { "27" }) y del tipo { "21" } (matrices de diferencias modificadas extendidas, las líneas de diferencias de los integradores de JPL, MAXDIM { "15" } a { "25" }), a partir de registros dados, en archivos que también contienen segmentos de tipo { "9" } y { "13" }; selección de registros y evaluación en el orden de los lectores de SPICE. Kshana no ajusta coeficientes de Chebyshev ni produce líneas de diferencias

# text
seg-40323a2adce1 = CSPICE N0067 mediante spiceypy { "8.3.0" } (spkw03, spkw13 y, de la misma biblioteca por su símbolo f2c, spkw21; spkpvn, spkgeo), fijado de antemano (e1cf80d8) antes de que existiera el código, con los registros sintéticos extraídos del SHA-1 de ese commit: para tres archivos (tipo { "3" } grados { "0" }, { "12" } y { "27" } con { "3" } a { "150" } registros; tipo { "21" } MAXDIM { "15" }, { "20" } y { "25" } con { "1" } a { "250" } líneas, cero a dos entradas de directorio y una cadena de centros; tipo { "3" }, { "21" } y { "13" } en un archivo con comentarios) el inventario de SPICE de los kernels de Kshana es exacto, los kernels de Kshana son idénticos byte a byte a los que SPICE escribe a partir de los mismos registros, y spkpvn y spkgeo son iguales al lector de Kshana bit a bit sobre archivos de Kshana y de SPICE ({ "48 876" } componentes en cada sentido, umbral { "1e-12" } relativo). Registros sintéticos: nada sobre exactitud física; los kernels reales de tipo { "21" } producidos por JPL no están en el conjunto de casos

# text
seg-39517faae95c = Mensajes de datos de actitud CCSDS (AEM, APM)

# text
seg-f88f6ea002c8 = Escritor y lector de los mensajes de datos de actitud CCSDS 504.0-B-2 en KVN y NDM/XML: AEM versión { "2.0" } (y { "1.0" } en KVN, con su ATTITUDE_DIR, QUATERNION_TYPE y secuencias de rotación numéricas) con tipos de actitud de cuaternión, ángulos de Euler y espín y sus variantes de derivada, velocidad angular y nutación, varios segmentos; APM versión { "2.0" } con bloques de cuaternión, Euler, velocidad angular, espín, inercia y maniobra; el cuaternión de A a B de un registro (504.0-B-2 Anexo F)

# text
seg-8853058de1f3 = Analizadores y escritores de Orekit { "13.1.8" } (Apache-2.0), ejecutados como programa independiente (xval/adm-orekit), fijados de antemano (7a6a05fe) antes de cualquier comparación: Orekit analiza todos los mensajes escritos por Kshana ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) y todos los valores quedan dentro de su umbral (cuaterniones { "1e-14" }, ángulos { "1e-9" } grados; peor { "0.054" } de un umbral); Kshana analiza los { "31" } mensajes que Orekit escribe a partir de las mismas entradas dentro de todos los umbrales; la rotación de cada uno de { "135" } registros de cuaternión, Euler y espín es igual a AemSegment.getAngularCoordinates a { "1e-12" } (peor { "0.0071" } del umbral). Los { "15" } mensajes XML de Kshana validan contra el esquema NDM/XML { "4.0.0" } (condicionado a datos, descargado con SHA-256 fijado). Hallazgo: el escritor APM de Orekit rechaza una maniobra sin MAN_DELTA_MASS (opcional en la norma), por lo que las maniobras APM solo se cubren en el sentido en que escribe Kshana. Fuera del conjunto de casos: tipos */RATE de AEM { "1.0" } y XML, bloques APM repetidos

# text
seg-5f26f879037e = Mensajes de datos orbitales CCSDS (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Escritor y lector de los mensajes de datos orbitales CCSDS 502.0-B-3 en KVN y NDM/XML: OPM { "3.0" } y { "2.0" } (vector de estado, elementos keplerianos osculadores, parámetros de nave, covarianza, maniobras, parámetros definidos por el usuario), OMM { "3.0" } y { "2.0" } (elementos medios por movimiento medio o semieje mayor, parámetros relacionados con TLE con BSTAR o BTERM y AGOM, covarianza) y OCM { "3.0" } con trayectoria (CARTP, CARTPV, CARTPVA; épocas absolutas o relativas), propiedades físicas, covarianza (CARTP, CARTPV en orden LTM), maniobra y bloques definidos por el usuario; un OMM a precisión completa a partir de un conjunto de elementos SGP4 junto al OmmFile::to_omm_kvn sin cambios

# text
seg-d4c7896b5963 = Analizadores y escritores OPM, OMM y OCM de Orekit { "13.1.8" } (Apache-2.0), ejecutados como programa independiente (xval/odm-orekit), fijados de antemano (cc6841da) antes de cualquier comparación: { "27" } de los { "30" } mensajes escritos por Kshana ({ "6" } casos OPM, { "5" } OMM y { "5" } OCM en KVN, y XML para la versión { "3.0" }) se analizan en Orekit con todos los valores dentro de { "1e-14" } relativo y todas las épocas dentro de { "1e-9" } s ({ "904" } valores, peor { "0.021" } de un umbral), y Kshana lee los { "25" } mensajes que Orekit vuelve a escribir dentro de los mismos umbrales ({ "858" } valores, peor { "0.020" }); los { "14" } mensajes XML de Kshana validan contra el esquema NDM/XML { "4.0.0" } (condicionado a datos). Hallazgos, fijados, que restringen la afirmación: Orekit exige ELEMENT_SET_NO (opcional en 502.0-B-3), rechaza COMMENT en parámetros definidos por el usuario en XML (el esquema lo permite), no escribe BTERM sin BSTAR (por lo que BTERM y AGOM solo se cubren en el sentido en que escribe Kshana) y suma las épocas relativas de OCM como segundos SI, de modo que bajo TDB difieren de la lectura de calendario TDB en unos { "1.9e-10" } s/s (UTC, TAI y TT coinciden). La salida heredada OmmFile::to_omm_kvn, que envuelve los metadatos del OMM en META_START/META_STOP, es rechazada por Orekit (registrado). Fuera de alcance: bloques PERT y OD de OCM, conjuntos de elementos no cartesianos, otros órdenes de covarianza

# text
seg-1e5ea1d9918d = Presupuesto de error de actitud y apuntamiento de 3 grados de libertad (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Par perturbador de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) como pico sobre la actitud (la afirmación validada), más un presupuesto de error de apuntamiento RSS sobre contribuyentes nombrados de 1σ con el término dominante (una suma en cuadratura de números aportados por quien llama, fuera de la afirmación validada). Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = GravityGradientEffector de Basilisk { "2.9.1" } (AVSLab, ISC), una implementación independiente en C++ del par de gradiente de gravedad con tensor completo: el pico (3/2)(μ/R³)ΔI de Kshana es igual al par de Basilisk con la actitud de { "45" } grados dentro de { "1e-12" } relativo (peor { "2.1e-15" }) sobre { "5" } altitudes y { "8" } tensores de inercia, y acota el par de Basilisk sobre { "2000" } actitudes aleatorias por caso; tolerancia fijada antes de la comparación. Afirmación validada: el pico del par de gradiente de gravedad. El presupuesto de apuntamiento RSS es una suma en cuadratura de números aportados por quien llama, sin verdad externa, y queda fuera de ella; la maximización de tensor completo de Hipparchus codificada a mano permanece como autoconsistencia de apoyo. Sin simulación de lazo de control / 6 grados de libertad / modos flexibles

# text
seg-1461aa14a7ff = Predicción de pasos de estación terrestre (segmento terreno)

# text
# c1: passes
seg-e1cf1ec4f005 = Pasos de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación máxima, duración) de un propagador del motor sobre una estación por encima de una máscara de elevación, con cruces de salida/puesta interpolados y acceso total: passes::predict_passes, el planificador geométrico (sin refracción ni tiempo de luz). El tipo de escenario <c1/> ejecuta el predictor aparente de la fila «Predicción aparente de pasos de estación terrestre con refracción y tiempo de luz»

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" }: una biblioteca de dinámica de vuelo independiente: ElevationDetector (buscador de raíces de Brent) + EventsLogger sobre unas efemérides ITRF, con la estación como TopocentricFrame WGS-84. AOS/LOS/elevación máxima/número de pasos/acceso total coinciden con idéntica órbita+estación+máscara+ventana (fixture registrado; controlador xval/orekit-passes)

# text
seg-1dd8b2655b18 = Predicción aparente de pasos de estación terrestre con refracción y tiempo de luz

# text
# c1: passes
seg-46f93d3c24d2 = Pasos de visibilidad (AOS, TCA, LOS, elevación aparente máxima, duración) de un conjunto de elementos SGP4 sobre una estación WGS-84 en la ruta de órbita terrestre validada (IAU 2006/2000A, parámetros opcionales de orientación terrestre), con refracción troposférica ITU-R P.834-9 (ecuaciones { "9" } a { "14" }, los coeficientes impresos de la Recomendación) y el tiempo de luz del enlace descendente, cada uno conmutable; cruces resueltos por bisección hasta { "1e-7" } s y la culminación por búsqueda de la sección áurea. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/passes.toml), con ambas correcciones activadas por defecto

# text
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) con Hipparchus { "4.0.3" }: TLEPropagator sobre los mismos conjuntos de elementos en un TEME que Orekit construye según la definición indicada (su TOD IERS { "2010" } rotado por GAST - GMST), ElevationDetector y ElevationExtremumDetector con y sin ITURP834AtmosphericRefraction, y AngularAzEl con AngularRadioRefractionModifier para el caso de tiempo de luz, con cruces y máximo resueltos por Hipparchus; { "60" } casos (cuatro órbitas, cinco estaciones a nivel del mar, máscaras de { "0" }, { "5" } y { "10" } grados, { "24" } horas). Umbrales fijados antes de la ejecución (fijado de antemano e947e69d, tramo { "3" } de 72ea9eb0). Ignorar el tiempo de luz ({ "9777" } fallos) o cambiar la constante P.834 { "1.728" } por { "1.828" } ({ "7883" } fallos) pone el ensayo en rojo. Alcance: estaciones a nivel del mar; el coeficiente h*theta0^{ "2" } de P.834 en Orekit es { "0.011380" } donde la Recomendación imprime { "0.01380" } (fijado), por lo que no se comparan alturas sobre el nivel del mar. La ronda { "1" }, frente al TEME IERS { "1996" } por defecto de Orekit, cumplió todos los umbrales de paso pero no alcanzó el umbral de dirección por la diferencia de convención TEME de { "72" } mas (fijado)

# text
seg-7b4a8e25c3c9 = Codificación y modulación adaptativas DVB-S2 a lo largo de un paso de enlace descendente LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann, tasa de símbolos), el MODCOD DVB-S2 más eficiente que supera su umbral de casi libre de errores de ETSI EN { "302" } 307-1 V1.4.1 Tabla { "13" } más un margen de implementación en cada paso, el volumen de datos ACM del paso y la línea base de codificación constante que cierra en la máscara y en la mayor distancia. Ejecutable como el tipo de escenario <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-a7f26e3a6030 = Coherencia interna: la eficiencia espectral calculada en forma cerrada a partir de K_bch de la Tabla 5a y las longitudes de trama concuerda con las eficiencias que imprime la Tabla { "13" } (una comprobación de transcripción de la tabla de umbrales); las piezas del presupuesto de enlace concuerdan con sus formas cerradas; la selección es monótona en Es/N0 y respeta el margen; ACM mueve al menos el volumen de la codificación constante. La geometría del paso procede del predictor aparente de pasos, validado por separado, VALIDATED. LO QUE NO SE COMPRUEBA: no se ha comparado ninguna herramienta externa ni enlace medido; los umbrales son los valores AWGN ideales de la norma, no los de un módem; no se modelan el desvanecimiento por lluvia, la pérdida de apuntamiento a lo largo del paso ni los pilotos.

# text
seg-19603a7e0fe8 = Planificación de contactos terrestres multisatélite y multiestación con resolución de conflictos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contactos candidatos a partir de cada paso satélite-estación con su volumen de datos ACM; conflictos cuando una antena serviría a dos satélites dentro de su tiempo de reorientación o un satélite descargaría a dos estaciones a la vez; un objetivo de entrega ponderado por prioridad limitado al atraso de cada satélite; un plan voraz perezoso de valor marginal, una línea base de primero en llegar y una ramificación y acotación exacta sobre hasta { "26" } candidatos, con la brecha de optimalidad del voraz informada. Ejecutable como el tipo de escenario <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-bc520db98f9a = Coherencia interna: la ramificación y acotación exacta concuerda con la enumeración por fuerza bruta sobre conjuntos aleatorios pequeños, cada plan se comprueba como factible frente a las reglas de conflicto, y el voraz nunca supera el óptimo exacto. LO QUE NO SE COMPRUEBA: no se ha comparado ningún planificador externo ni plan operativo; los contactos se toman enteros (sin división), el atraso se fija al inicio de la ventana, y no se modelan el tiempo de reorientación más allá del tiempo fijo de giro ni el almacenamiento a bordo.

# text
seg-ddf2bc2f13a9 = Presupuesto de enlace unidireccional (comunicaciones / diseño de enlace)

# text
# c1: link-budget
seg-83331f513dba = Pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre con la ecuación de enlace de CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distancia/tasa/banda frente a un Eb/N₀ requerido. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Tabla publicada de diseño y control de telecomunicaciones de espacio profundo como vectores numéricos fijados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabla 1-1 (Galileo banda X): kshana reensambla las partidas de la tabla y reproduce su L_fs extremo a extremo publicada de { "290.54" } dB y Pr/N0 de { "54.6" } dB-Hz; la pérdida en espacio libre se comprueba además frente a ITU-R P.525

# text
seg-3742d2aea62a = Planteamiento frugal de coste por cobertura / ROI

# text
seg-4228311689f8 = Coste por porcentaje de cobertura + ROI de cobertura por euro sobre el motor de dimensionamiento de constelaciones; el coste por satélite es un rango bajo/nominal/alto aportado por quien llama (sin precios inventados)

# text
seg-d542ac64c31c = Aritmética de costes en forma cerrada frente a valores derivados a mano; un PLANTEAMIENTO económico de una cifra de cobertura modelada, no una cotización ni un modelo de costes validado

# text
seg-8ba6ee9acc8a = Impacto en la integridad de la detección fallida (HPL/VPL según el contexto frente al límite de alerta)

# text
seg-f5985399d0d5 = Transforma un sesgo de spoofing/jamming no detectado en error efectivo → región de Stanford (disponible/no disponible/MI/HMI) frente a HAL/VAL específicos del contexto (cielo abierto frente a urbano)

# text
seg-124d0ffe959e = Compone la clasificación de Stanford de RAIM validada externamente (raim::classify_stanford); la correspondencia detección fallida→AL en sí es modelada, no una asignación de integridad certificada

# text
seg-37d43b5b918a = Hoja de parámetros de modelo de error CAI citados ({ "13503" })

# text
seg-0b6a901f5ad2 = Rendimiento acotado (mejor/nominal/conservador) de interferómetros de átomos fríos (inestabilidad de sesgo, paseo aleatorio de velocidad/ángulo, estabilidad del factor de escala, tasa de muestreo limitada por la interrogación, rango dinámico de ambigüedad de franja), cada uno trazable a una cita; alimenta QuantumNavBudget sin modelar hardware

# text
seg-4b66096727b8 = Coherencia interna: el rango de VRW citado contrastado con la física de CaiAccelerometer::accel_asd + rango dinámico bruto calculado a partir del límite de ambigüedad de franja; los números son rangos de revisión bibliográfica MODELLED (needs_source_confirmation), ningún dispositivo validado, sin halo de validación

# text
seg-c93f2d3a3167 = Benchmark de ajuste a la norma de integridad de temporización: clasificador de épocas del diagrama de integridad de Stanford

# text
seg-712d5c35a6a6 = Clasificación de épocas TIB del diagrama de integridad de Stanford (nominal / no disponible / MI / HMI)

# text
seg-93b913e60063 = Reimplementación independiente en numpy de la regla de cuatro regiones (scripts/gen_tib_scorer_reference.py) sobre el mismo conjunto de muestras; método citado del diagrama de integridad Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) y de RTCA DO-229 WAAS MOPS. NO es una referencia independiente de exactitud ExternalDataset: el benchmark es inmune a la honestidad.

# text
seg-573aa0193cb3 = Benchmark de ajuste a la norma de integridad de temporización: evaluador de cobertura de integridad

# text
seg-4d86f3c2d8f5 = Puntuación de cobertura de integridad TIB (tasas de HMI/MI/disponibilidad + veredicto de cobertura de cota superior)

# text
seg-645eb084ae8e = Recuento independiente de regiones en numpy en tests/fixtures/tib/reference.json; solo comprobación cruzada de la maquinaria del evaluador, sin afirmación de exactitud.

# text
seg-372dd0fdb025 = Benchmark de ajuste a la norma de integridad de temporización: catálogo de fallos (generadores paramétricos)

# text
seg-2604e7cf27d2 = Menú de fallos TIB (divergencia de dominio, golpe de reloj, deriva en holdover, retardo estático/incremental/simétrico/asimétrico, repetición dentro de la frescura, selectivo por trayecto, quórum k de N)

# text
seg-b907aecaccd0 = Generadores de fallos paramétricos representativos (modelados); el conjunto indetectable (retardo simétrico, repetición dentro de la frescura) se cita de Mizrahi RFC { "7384" } y de Narula y Humphreys (IEEE JSTSP { "2018" }). Sin referencia independiente externa: un catálogo de fallos no hace ninguna afirmación medida.

# text
seg-90c0eb1e7c14 = Benchmark de ajuste a la norma de integridad de temporización: veredicto de absorción de lo indetectable

# text
seg-f713acf042ff = Veredicto de absorción de lo indetectable TIB (el simétrico/la repetición deben ser absorbidos por el PL, nunca informados como detectados)

# text
seg-6840c2467c63 = Comprobación de propiedad de que el enum Verdict estructuralmente no puede informar un fallo indetectable como detectado (Mizrahi RFC { "7384" }); absorbido ⟺ PL ≥ desfase. Sin referencia independiente de exactitud.

# text
seg-3652a591eefc = Ingeniería del bus de la nave (AOCS/térmica/estructuras/propulsión/energía)

# text
seg-50a9c1c7dff0 = No se proporciona: Kshana es un simulador de rendimiento de navegación, no una casa de buses

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Diseño de la carga útil de RF de navegación y del hardware de antenas

# text
seg-76c983a23e7b = No se proporciona: Kshana modela el rendimiento de la señal, no el hardware de carga útil/antena

# text
seg-7bba3b35214c = Diseño y maduración del hardware de carga útil cuántica

# text
seg-15fcc200b859 = No se proporciona: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio

# text
seg-d69dd4c5167b = Garantía de producto del hardware de vuelo (radiación/EEE/MAIT)

# text
seg-b1540f78ffd4 = No se proporciona: Kshana solo trata la garantía de producto del software; la de vuelo es del socio

# text
seg-1f200f8efc71 = Tiempo coordenado lunar

# text
seg-2e6961dbffe9 = Tasa de reloj relativista Tierra-Luna (LTC/TCL) + encadenamiento TT/TAI/UTC + conjunto

# text
seg-3f52d6e04361 = Ashby y Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base del LTC de LunaNet de IAU/IAG): autopotencial de la superficie lunar L_m = { "3.13881e-11" } y total secular { "56.02" } µs/día coinciden como valores numéricos publicados; velocidad geocéntrica de la Luna contrastada con JPL DE440 (de440s.bsp mediante SPICE)

# text
seg-8adbbd2cdb74 = Autodescripción del informe híbrido óptico/RF

# text
seg-2a5e48b558e1 = El informe hybrid-optical-rf declara la configuración de enlace con la que se ejecutó realmente (longitud de onda de portadora, apertura de transmisión y de recepción, distancia, anchura de pulso, tiempo de integración, eficiencias y pérdidas, valores por defecto resueltos) y lleva un bloque de unidades que da la unidad y la clase de procedencia de cada magnitud que probablemente cite un artículo, incluidas las trazas de covarianza del traspaso en metros cuadrados

# text
# c1: variance
seg-23f0c10237f4 = Sin referencia independiente externa, y no es posible ninguna: esto es autodescripción, no una medición. Se registra porque su ausencia era un defecto: P5 tuvo que citar la longitud de onda de portadora y la apertura de transmisión a partir de valores por defecto del código fuente, e inferir que un <c1/> sin más estaba en metros cuadrados a partir de una comprobación de coherencia interna. La inferencia era correcta, y precisamente por eso importaba: nada habría detectado que fuera errónea

# text
seg-0691f3dee8cb = Disponibilidad del enlace híbrido óptico/RF en el lado de RF

# text
seg-72ccb655caf0 = El informe hybrid-optical-rf declara una disponibilidad de enlace de RF, compuesta a partir de magnitudes que el motor ya calcula y no de una climatología importada, y declara la composición como una regla con nombre: A_rf = I_closure * I_track, donde I_closure es el veredicto de cierre del presupuesto de enlace unidireccional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margen de Eb/N0 >= { "0" }) a la distancia propia del escenario e I_track es el veredicto del lazo de seguimiento (jamming::lock_status) sobre el C/N0 que devolvió ese MISMO presupuesto. Cada factor lleva a la salida la clase de procedencia de su entrada, y los factores que deliberadamente NO están en el producto (visibilidad geométrica, denegación por interferencia y una climatología de interrupciones de RF) se nombran con el motivo en lugar de fijarse silenciosamente en { "1" }. El tramo de RF resuelto se repite como su propio bloque rf_link_configuration, y las cifras continuas junto al indicador (margen de enlace, margen de C/N0, las distancias de cierre y de seguimiento en forma cerrada y la utilización de distancia) son las inversiones de distancia del mismo presupuesto. El informe declara por completo, en el bloque y en la entrada de unidades a la que llega un lector, que esta cifra está LIMITADA POR MARGEN/GEOMETRÍA y es DETERMINISTA, mientras que la disponibilidad óptica está LIMITADA POR METEOROLOGÍA/CLIMATOLOGÍA y es probabilista, de modo que nunca puedan citarse como un par comparable de porcentajes

# text
seg-319705ea0166 = Sin referencia independiente externa, y se descarta ExternalDataset. Las dos entradas son un margen de Eb/N0 y un cruce de umbral de C/N0, ambos funciones de una EIRP, una figura de mérito y una asignación global de pérdidas MODELLED; no existe un registro de disponibilidad medido de un servicio híbrido óptico/RF Tierra-Luna con el que contrastar la cifra compuesta. Las comprobaciones que existen son internas y se declaran como tales: la composición se recalcula a partir de los márgenes publicados por el propio informe y no de los internos del emisor, y la distancia de cierre se verifica volviendo a ejecutar la ecuación de enlace EN ella y exigiendo que el margen se anule: una ida y vuelta de inversión, no una implementación independiente. El límite honesto de la cifra queda registrado en el propio informe: es un indicador determinista 0/1, no una probabilidad, porque nada en este motor mide una distribución de interrupciones del enlace de RF en esta banda y geometría. Esa entrada ausente se nombra en rf_availability.factors_not_included en lugar de inventarse, y aportarla es lo que necesitaría una disponibilidad de RF probabilista

# text
seg-22c5df9b6c7c = Comparación de medición de distancia óptica frente a RF en igualdad de condiciones

# text
seg-70eb396f40af = El informe hybrid-optical-rf emite la razón de medición de distancia óptica frente a RF con la ÚNICA configuración a la que se evaluaron ambos tramos incluida en el mismo objeto: el mismo trayecto unidireccional, la misma distancia y el mismo tiempo de acumulación. El tramo óptico es la CRLB de ToA limitada por fotones del motor sobre el recuento de fotones unidireccional; el tramo de RF es el jitter térmico de seguimiento de código early-late del DLL del motor con el C/N0 que devuelve el propio presupuesto de enlace del motor para esa misma distancia unidireccional. El ancho de banda de ruido del lazo se deriva, no se elige: B_L = 1/({ "2" }*integration_s) sitúa el tramo de RF exactamente en el tiempo de acumulación óptico, y si quien llama lo anula de modo que los dos tiempos de promediado discrepan, la razón queda REFUSED (null, con la discrepancia y ambos tiempos nombrados) en lugar de citarse en dos puntos de operación. No se forma ninguna razón frente al rf_position_sigma_m paramétrico ELEGIDO del escenario, y el rechazo dice por qué: esa entrada no lleva ninguna configuración. El resultado óptico bidireccional publicado y el factor exacto que lo conecta con el tramo de comparación unidireccional se emiten junto a la razón, de modo que el informe no pueda leerse como portador de dos sigmas ópticas discrepantes

# text
seg-acbb3ac98ee3 = Sin referencia independiente externa para la RAZÓN, y se descarta deliberadamente ExternalDataset. La cadena de RF subyacente sí tiene una: tests/validate_p5_rf_ranging_precision.rs comprueba linkbudget::link_budget y navsignal::dll_code_jitter_chips frente a un fixture independiente en Python/NumPy y frente al valor resuelto fijo en el código de Kaplan y Hegarty ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz), y la CRLB óptica tiene su propia fila de forma cerrada. Reclamar cualquiera de las dos anclas para esta fila sería una validación tomada prestada, que los invariantes de la matriz existen para impedir: la magnitud aquí es una RAZÓN en una configuración con EIRP, figura de mérito, potencia de transmisión y apertura MODELLED, y no existe ninguna comparación medida de medición de distancia óptica frente a RF en un punto de operación común con la que contrastarla. Lo que se comprueba internamente es lo que la razón puede hacer mal realmente: que los dos tramos estén en un único punto de operación. Eso se mide escalando el tiempo de acumulación común y exigiendo que ambos tramos se muevan según la misma ley de raíz cuadrada y que la razón se mantenga, y se hace cumplir rechazando la razón por completo cuando los tiempos de promediado discrepan. Ambos tramos son cotas de ruido térmico/de disparo y ambos excluyen el retardo del medio, el error de reloj y la ambigüedad, de modo que la exclusión es idéntica en cada lado; el informe lo dice en lugar de dejarlo inferido

# text
seg-3f26f598e013 = Autodescripción del informe de presupuesto de enlace

# text
seg-b88bf41d6d4c = El informe de presupuesto de enlace declara cada constante absoluta con la que se calculó su propio margen (la frecuencia de portadora que usó la pérdida en espacio libre, la EIRP, la figura de mérito, la pérdida global y el término de Boltzmann), además del G/T requerido con el que el margen es cero, la constante de enlace (EIRP - pérdidas - Eb/N0 requerido) que es la única combinación que una tabla publicada de tasa/ganancia puede fijar jamás y, cuando quien llama declara una temperatura de ruido del sistema, la ganancia de la antena receptora que esa figura de mérito implica

# text
seg-52f98f50522f = Sin referencia independiente externa: esto es autodescripción sobre una ecuación ya validada frente a una tabla publicada de diseño y control (véase la fila del presupuesto de enlace unidireccional). Se registra porque su ausencia era un defecto medido: reproducir el d1_rate_gain_beamwidth.csv publicado exigió despejar una constante efectiva hasta { "0.0034" } dB a partir de las treinta filas, y el motor ahora nombra esa combinación y demuestra, mediante un ensayo, que ninguna tabla publicada habría podido separar jamás sus tres componentes

# text
seg-a7b192e27cb5 = Tabla de cruce de tiempo lunar por clase de reloj

# text
seg-cab605dc6ea2 = Una ejecución del presupuesto de tiempo lunar emite una fila de cruce reloj-frente-a-sistema de referencia por clase de reloj contra un único término de sistema de referencia compartido, de modo que el reloj es la única variable de la comparación; cada fila lleva el cruce alcanzado de dos maneras (por bisección a partir de la curva general de error de tiempo de ley de potencias y por inversión algebraica a partir del tipo de ruido dominante de la fila) con la diferencia relativa entre ambos

# text
seg-ccec15f0b125 = Dos cálculos distintos dentro del código base de la misma magnitud, no uno repetido: la bisección sobre la curva de ley de potencias IEEE-1139 no sabe nada del tipo de ruido, mientras que la forma cerrada invierte el tipo dominante algebraicamente, de modo que un tipo de ruido mal clasificado o un intervalo inicial malo aparece como una diferencia relativa no diminuta. Los cuatro valores reproducen además la tabla publicada del artículo hasta la mitad de su último dígito impreso, pero esa tabla se reconstruyó a su vez a partir de la misma forma cerrada, por lo que es una comprobación de reproducibilidad y no una referencia independiente externa, y el término de sistema de referencia con el que se mide es una asignación modelada

# text
seg-ff32b78acb8c = Error conjunto de UT1 y movimiento polar sobre un conjunto común de filas

# text
seg-561e588153af = Una tabla informa el error de predicción de UT1, el error del polo por movimiento polar y su combinación en cuadratura en la Luna sobre un conjunto de épocas IDÉNTICO por horizonte, emitiendo las épocas en las que se midió cada componente. Aparte, el escenario nombra la entrada EOP que esté en vigor y descompone su censo de filas, y siempre emite la tabla de horizontes predicho-frente-a-final con una declaración explícita de por qué está vacía cuando lo está

# text
seg-093191c1ddce = utils.iers de astropy { "8.0.1" } (BSD-3) leyendo el producto IERS finals2000A con su propia regla de Boletín B si no A, y rotaciones completas celeste-a-terrestre de pyerfa { "2.0.1.5" } (SOFA) (c2i06a, sp00, pom00, c2tcio; el ángulo de rotación terrestre según IERS { "2010" } ec. { "5.15" } en aritmética exacta), ejecutados como programas independientes sobre filas literales del finals2000A.all congelado de 2026-09-30; fijado de antemano (455b8fb5) con las enmiendas A1 y A2 que fijan solo la precisión numérica de la referencia independiente (ambas declaradas con las ejecuciones que siguieron): todas las listas de épocas de la Tabla { "3" } iguales, estadísticos de UT1 y del polo dentro de { "6e-16" }, la combinación dentro de { "1.9e-7" }, 12/12 casos de predicho-frente-a-final. La comprobación de la combinación no puede resolver errores del término del polo por debajo de aproximadamente { "1e-4" } relativo porque UT1 la domina; la exactitud del polo se apoya en la comprobación del estadístico del polo a { "1e-9" }. Las reglas del conjunto de épocas y de reserva son el generador que refleja las definiciones de Kshana, y los estados de tabla vacía son comportamiento de diseño sin verdad externa. Magnitudes: errores de predicción realizados de la Tabla 3a del IERS Annual Report { "2019" }, Kshana/IERS { "1.001" } a { "1.100" } a { "1" } a { "90" } días (umbral [{ "0.8" }, { "1.25" }], medido). Censo de filas: astropy (fila de entrada sin conexión). Ronda { "1" } (conservada como regresión): frente a la fórmula de exactitud impresa en { "178" } boletines A emitidos, el polo concuerda dentro de 1.5x y UT1 no, lo que contrasta la fórmula del IERS con su error realizado

# text
seg-3692f1fc89e6 = La entrada de orientación terrestre sin conexión por defecto es un producto real del IERS

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = El valor por defecto de ejecución de <c1/> es la copia incorporada propia de la biblioteca de un extracto literal de IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } filas diarias consecutivas, MJD 61224-61397, recortadas del finals2000A.all de 2026-09-30) que lleva las tres añadas de filas que define el formato, clasificadas por los indicadores I/P del IERS (eop::row_vintage): { "30" } finales del Boletín B, { "54" } filas medidas rápidas (indicador I sin bloque del Boletín B) y { "90" } predicciones del Boletín A (indicador P). Una ejecución simple sin argumento de archivo ni red emite una tabla por horizonte rellena, el censo filas = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) y predicted_rows.n = { "90" } sobre MJD 61308-61397; el corte tal como se emitió de las comparaciones predicho-frente-a-final es la última fila medida. El extracto anterior de 32 filas (tools/finals2000A_2026.txt, todas las filas con indicador I) y el extracto de cinco filas solo finales siguen incluidos y ejercitados: en ellos predicted_rows.n es { "0" }, una propiedad del archivo de entrada y no un resultado del analizador

# text
seg-1683dc91fd68 = astropy.utils.iers.IERS_A de astropy { "8.0.1" } (BSD-3-Clause), leyendo los mismos bytes con su propio lector, y la tabla del Boletín A del IERS Vol. XXXIX n.º { "039" }, copiada número a número; fijado de antemano (6fdae01b) con seis criterios exactos antes de ejecutar astropy. Se cumplen los seis: { "30" } filas finales, { "54" } rápidas y { "90" } predichas con listas MJD iguales, cada fila predicha con indicador P, el censo de la ejecución por defecto igual, y las predicciones iguales al Boletín A hasta el último dígito impreso. Declarado: el recorte se eligió con un simple corte de columnas de los indicadores y del bloque del Boletín B, que mostró 30/54/90, antes del commit; el extracto es un corte literal que este repositorio recortó de un producto del IERS (SHA-256 en el NOTICE del fixture). La afirmación validada es la clasificación por añada y el censo de la entrada por defecto incluida y de sus filas predichas; las entradas arbitrarias de usuario se clasifican con la misma regla de indicadores pero no forman parte de la comparación. Ronda { "1" } de { "0.30" } (sustituida): el valor por defecto anterior llamaba predicciones del Boletín A a { "12" } filas con indicador I; el motor ahora clasifica por indicador. REVISIONES: las celdas de la ejecución por defecto que cambiaron se listan de antiguo a nuevo en docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, el suelo del polo { "0.06776" } -> { "0.05550" } mas, el término de orientación terrestre { "14.01601" } -> { "14.01583" } m, el total { "20.09759" } -> { "20.09746" } m y { "67.03834" } -> { "67.03790" } ns, las filas de la Tabla { "2" } de tests/golden/realtime-frame-eop.csv y las cifras de concordancia del predictor operativo); las anteriores en docs/revisions/G12-default-eop-cell-changes.md

# text
seg-18c72a7565d6 = Huella de captura frente a altitud y anchura de haz

# text
seg-9c30a0ab5233 = Barrido de dos ejes de la huella de captura de superficie, ponderada por el patrón y limitada por la altitud, sobre la altitud del transmisor y el diámetro del plato, emitido en una fila por punto de operación con la anchura de haz a mitad de potencia que implica cada diámetro, y la captura en el limbo informada como UMBRAL: por fila el J/S del limbo, su margen y la potencia de transmisión que lo cerraría; por rejilla los cruces localizados, o una declaración explícita de que el limbo no se alcanza en ningún punto de la rejilla, con el déficit

# text
seg-4d866b62d4f7 = Inclusión de conjuntos: la razón interferencia-señal entra como un desplazamiento uniforme en decibelios, de modo que el conjunto capturado con una potencia de transmisión mayor contiene al de una menor y la fracción solo puede aumentar, una propiedad que el patrón de Airy NO da en anchura de haz ni en altitud, donde la región capturada se rompe en anillos y la fracción es genuinamente no monótona. Ninguna tabla publicada da la fracción de disco capturado de un transmisor orbital lunar frente a altitud y anchura de haz, por lo que no hay nada externo con lo que contrastar estas celdas; el patrón subyacente está validado por separado frente a valores de Bessel publicados y conserva su propia fila

# text
seg-fc0a64b9a280 = Reproducibilidad del presupuesto de error de tiempo lunar

# text
seg-5d5970506b9c = El escenario de presupuesto de tiempo lunar publica sus salidas de tipo matriz como una tabla en formato largo (índice de rejilla, tiempo de promediado, término) junto con el informe, de modo que las siete curvas x(tau) por término y el total de raíz de suma de cuadrados son salida del motor y no algo que un lector reconstruya a partir de la sección de método

# text
seg-62df6258bc62 = Solo autoconsistencia: el total publicado se comprueba frente a la raíz de la suma de cuadrados de los términos del mismo archivo, y la curva emitida reproduce el p3_time_budget_curve.csv publicado en los { "57" } puntos. Ambas comprobaciones comparten las definiciones de términos propias de este motor, por lo que ninguna es independiente. El término de reloj se apoya en especificaciones de reloj publicadas, pero las MAGNITUDES de los suelos de enlace, sistema de referencia, relativista y de efemérides son asignaciones de presupuesto documentadas sin referencia independiente externa

# text
seg-675887733454 = Laboratorio de tiempo de estación lunar: holdover del miniRAFS frente a LTC

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Retardo VLBI de campo cercano para una línea base terrestre que observa una baliza lunar + derivadas parciales

# text
seg-d1943f9932af = delta_dor de onda plana (dentro del mismo código base) en el límite de campo lejano; derivadas parciales por diferencias finitas. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a los tiempos de luz convergidos de ANISE { "0.10" } mediante DE440 ({ "75" } retardos el 2024-01-01 sobre tres líneas base de la DSN, generados por xval/anise-lunar-od sin código de Kshana), ningún retardo está dentro de la tolerancia de { "1" } ps. La mayor diferencia es de { "24" } µs, debida al centro analítico de la Luna (unos { "200" } km respecto a DE440), la geometría instantánea única sin iteración de tiempo de luz ({ "3.6" } µs) y el movimiento polar omitido; las derivadas parciales de la baliza difieren hasta { "2.9e-3" } relativo frente a { "1e-6" }. La afirmación de la documentación del módulo de que las aproximaciones de sistemas de referencia están por debajo de la fidelidad del modelo no se sostiene a este nivel. Ronda { "2" } de { "0.30" }: la ruta de kernel (lunar_vlbi::KernelGeometry) se valida frente a tiempos de luz de NAIF SPICE en su propia fila, VLBI geodésico lunar, ruta de kernel; la comparación con ANISE de esa ruta (75/75 dentro de { "1" } ps, peor { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) es solo una comprobación cruzada de evaluación de kernel, porque la resolución del tiempo de luz en ese arnés es la propia de este proyecto. Esta fila (la ruta analítica por defecto) sigue siendo MODELLED con el hallazgo anterior

# text
seg-d12d4565b01d = VLBI geodésico lunar, ruta de kernel

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Retardo VLBI de campo cercano para una línea base terrestre que observa una baliza lunar, con derivadas parciales de baliza y de estación, en la ruta de kernel (lunar_vlbi::KernelGeometry): Tierra y Luna de DE440, ejes principales lunares de DE440, orientación terrestre ITRF93 con UT1 y movimiento polar, cada tiempo de luz convergido en el sistema baricéntrico, derivadas parciales con el factor de tiempo de luz 1/(c - u.V). Ejecutable como el escenario <c1/> con planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path definidos; las salidas validadas son la serie geometric_delay_s de la ruta de kernel y epoch_partials. En la ruta de kernel delay_s suma el término de Shapiro diferenciado analítico, que no se compara, y delay_rate y near_field_correction_us no se comparan

# text
seg-c7f6842b6019 = Tiempos de luz newtonianos convergidos (spkcpt/spkcpo, CN) de NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) desde una baliza fija en MOON_PA_DE440 hasta las estaciones DSN DSS-14, DSS-43 y DSS-63 del kernel de estaciones NAIF earthstns_itrf93_260814.bsp, con de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec y naif0012; las derivadas parciales son diferencias centrales de cinco puntos de los tiempos de luz de SPICE, no la fórmula 1/(c - u.V) de Kshana. Fijado de antemano (a689c797, épocas de { "2024" }) con umbrales de { "1" } ps en cada retardo y { "1e-6" } relativo en cada derivada parcial. Esa primera ejecución falló (17/75 retardos dentro de { "1" } ps, peor { "1.03e-11" } s): SPICE lleva ET como un único double, cuyo espaciado en { "2024" } redondea la época de emisión hasta { "6e-8" } s, unos { "6" } ps de tiempo de luz, y el residuo coincide con ese redondeo con una correlación de { "0.99999" } (fijado; el revisor lo reprodujo de forma independiente). La enmienda 66e365d4, escrita tras ese resultado y antes de que existiera su fixture, trasladó la misma referencia independiente y los mismos umbrales a { "25" } épocas horarias cerca de J2000, donde el espaciado de ET es como máximo { "1.5e-11" } s: 75/75 retardos dentro de { "1" } ps (peor { "6.2e-14" } s), 75/75 derivadas parciales de baliza (peor { "7.4e-9" }), 150/150 derivadas parciales de estación (peor { "3.8e-11" }). Fuera de la afirmación: la ruta analítica por defecto (Luna en serie y sistema lunar medio, { "24" } µs respecto a ANISE mediante DE440, la fila VLBI geodésico lunar), el término de Shapiro diferenciado que el escenario añade analíticamente, el medio, y la escala baricéntrica a geocéntrica

# text
seg-1f10810131be = Lector de kernels NAIF: contenedor DAF, SPK tipo { "2" } y PCK binario tipo { "2" }

# text
seg-7da4847e7a28 = El lector propio del motor, en Rust puro, de kernels binarios NAIF (naif_kernel): el contenedor DAF (ambos órdenes de bytes, registros de resumen enlazados), segmentos de posición de Chebyshev SPK tipo 2 encadenados a través de sus centros hasta un ancestro común más bajo, y segmentos de ángulos de Euler PCK binario tipo 2 convertidos en una rotación de J2000 al cuerpo, con las épocas tomadas como ET de dos partes para que un desfase de menos de un microsegundo conserve su precisión. Es lo que KernelEphemeris (ephem_provider) y las rutas de kernel de lunar_vlbi, lunar_llr y lunar_vlbi_fim leen para acceder a DE440. La afirmación es que lee correctamente los kernels de JPL; no es una afirmación de que DE440, ni las series analíticas de Sol y Luna del motor, sean exactas

# text
seg-09773b73d785 = Dos lectores de kernels independientes sobre los mismos archivos NAIF: NAIF SPICE Toolkit N0067 (CSPICE mediante spiceypy { "8.2.0" }, MIT; spkezr y pxform) y ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate y Almanac.rotate), ambos ejecutados como programas independientes sobre de440s.bsp y moon_pa_de440_200625.bpc. Fijado de antemano (abcd9133) antes de que existiera ningún fixture o valor de referencia independiente: la semilla de la rejilla son los primeros { "16" } dígitos hexadecimales del hash de ese commit, de modo que ni las { "200" } épocas ni los pares de cuerpos pudieron elegirse con el resultado a la vista; cada época lleva además la Luna y el Sol relativos a la Tierra. Umbrales fijados de antemano a partir de la evaluación de Chebyshev en doble precisión (como máximo { "15" } coeficientes, n^{ "2" } u = { "2.5e-14" } por evaluación, dos evaluaciones y hasta dos saltos por lado): posición { "1e-13" } R + { "1e-5" } m, velocidad { "1e-13" } V + { "1e-10" } m/s, siendo R y V la mayor magnitud relativa al ancestro común más bajo; elemento de rotación { "1e-13" } W + { "1e-15" }, siendo W la suma de coeficientes del registro que cubre; ANISE añade { "2" } ns de movimiento relativo por sus épocas de nanosegundos. Resultado: cada uno de los { "600" } estados y las { "200" } rotaciones queda dentro de su umbral frente a ambas referencias independientes, sobre el recorte y sobre los kernels completos; peor { "6.0e-3" } del umbral (posición), { "5.9e-3" } (velocidad), { "3.7e-3" } (rotación). Mutación: evaluar cada registro en -s hace fallar { "3597" } comparaciones. Declarado: una comprobación anterior de 25 épocas frente a SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) se vio antes de esta fila y no es su evidencia; la primera ejecución del generador del fixture se abortó por un intervalo de rejilla vacío antes de producir ningún valor y se corrigió. Ambos lados leen DE440, por lo que la concordancia valida el lector, no las efemérides

# text
seg-e08e98908f3a = Earth-GNSS a distancia lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Recepción de Earth-GNSS a distancia lunar: la capa de señal débil que nombra la Tabla { "1" } de P7 y para la que el motor no tenía modelo. Por satélite y por época calcula el ángulo fuera del eje respecto al nadir del transmisor, si la Tierra ocluye el trayecto recto, la distancia oblicua y su pérdida en espacio libre, la ganancia de transmisión en ese ángulo, la potencia recibida y la densidad de portadora a ruido; luego agrega solo los enlaces que superan un umbral de seguimiento, y barre una revolución completa de la constelación para que la respuesta sea una DISTRIBUCIÓN y no una instantánea. Tres hechos determinan el resultado y el informe declara cada uno: la Tierra subtiende { "13.90" } grados desde el radio de la constelación, por lo que el PICO del haz no está geométricamente disponible para ningún rayo dirigido a la Luna; lo que queda es el borde del lóbulo principal y los lóbulos laterales, el régimen en el que LuGRE operó en la Luna en { "2025" }; y la pérdida de trayecto en L1 es de unos { "208" } dB, unos { "25" } dB más que la que paga un usuario terrestre. MEDIDO sobre la geometría incluida de 24 satélites de clase GPS durante { "64" } épocas de un periodo orbital: disponibilidad de SEÑAL { "0.375" } con un mejor enlace de { "30.93" } dB-Hz, y disponibilidad de SOLUCIÓN DE POSICIÓN { "0.000" }: como máximo dos enlaces seguibles simultáneos, nunca los cuatro que necesita una posición. La separación de esas dos disponibilidades es el punto central, y el informe se niega a que se confundan: Earth-GNSS a distancia lunar es una capa de grado de TEMPORIZACIÓN, no de posición, y un a priori de resiliencia en capas debe tomar la disponibilidad de solución de posición. El condicionamiento se emite por la misma razón: todo satélite visible queda dentro de un cono de un par de grados de anchura visto desde la Luna, de modo que las líneas de visión son casi paralelas por construcción. Ejecutable como el tipo de escenario <c1/> Reformulado según D7: la afirmación a distancia lunar es la densidad de portadora a ruido RELATIVA entre satélites en una misma época, a partir de patrones de transmisión bidimensionales medidos (NAVCEN Block IIR/IIR-M), más visibilidad geométrica; no se afirma el C/N0 absoluto (Parker et al. informan de una pérdida común de { "7" } a { "12" } dB).

# text
seg-bed2679f88e5 = Identidades en forma cerrada y coherencia interna; NO se afirma ninguna referencia independiente externa. El semiángulo del limbo se comprueba frente a asin(R_earth/r_orbit) y la geometría frente a él; la pérdida en espacio libre, el kernel DOP y la propagación SGP4 que esto compone están cada uno validados externamente en sus propias filas y esta fila no toma prestado su estado. POR QUÉ MODELLED, y es el patrón de transmisión: la ganancia en función del ángulo es una apertura circular iluminada uniformemente, el patrón de Airy, mientras que una antena GPS L1 real es una agrupación helicoidal de doce elementos con un lóbulo principal conformado, con el pico fuera del eje para uniformar la potencia sobre el disco terrestre, y lóbulos laterales que no son de Airy. Existen patrones medidos publicados y no se incluyen aquí, por lo que los órdenes y los órdenes de magnitud se mantienen, mientras que los dB de un satélite concreto no. UNA PRIMERA IMPLEMENTACIÓN DE ESTA FILA ERA ERRÓNEA DE UNA FORMA QUE MERECE REGISTRARSE: la expresión de Airy solo es válida en el hemisferio frontal, su argumento va como sin(theta), y con theta cerca de { "180" } grados se enrolla y devuelve la GANANCIA COMPLETA EN EL EJE detrás de la apertura, de modo que los dos enlaces más fuertes del primer informe eran satélites que apuntaban sus antenas lejos de la Luna, y eran los únicos dos que superaban el umbral. Detrás de la apertura el modelo aplica ahora un suelo plano de lóbulo trasero, declarado como una cota y no como una forma de patrón inventada. Deliberadamente ausentes, y todas ellas hacen OPTIMISTA el presupuesto: ninguna pérdida ionosférica ni troposférica en los rayos rasantes al limbo, ninguna pérdida por polarización, apuntamiento o implementación, y una Tierra esférica sin extensión refractiva. La posición de la Luna es una ENTRADA, no una consulta de efemérides, porque la magnitud sometida a prueba es el enlace y la geometría del haz. Promover esta fila a validada exige un patrón de transmisión medido y puntos normales de LuGRE con los que contrastar; ninguno está en el repositorio y ninguno se inventa aquí. Ronda { "2" } de { "0.30" }, un hallazgo (sigue siendo MODELLED): una ruta de enlace con entradas medidas (posiciones SP3 reales, potencia de transmisión por bloque, patrones de transmisión y recepción tabulados, histéresis de adquisición y seguimiento) se contrastó con la Tabla { "3" } de Montenbruck et al. { "2023" } para GENESIS a { "6000" } km (fijada de antemano 5b414f0a): las medias con antena en cenit concuerdan en { "5" } de { "6" } dentro de un dB de la sensibilidad del artículo; las medias con antena en nadir son { "1.0" } a { "2.4" } satélites superiores a lo impreso, posiblemente porque el artículo usó patrones de lóbulos laterales GPS dependientes del acimut que no están publicados. Las cifras a distancia lunar de esta fila siguen usando el sustituto de Airy. { "0.30" }+ D7, un hallazgo (sigue siendo MODELLED): la magnitud reformulada, la DIFERENCIA de C/N0 entre satélites Block IIR/IIR-M seguidos en una misma época, predicha con los patrones L1 medidos por SVN de NAVCEN (bidimensionales, sistema de guiñada) frente al C/N0 de vuelo de LuGRE (fijada de antemano 768cb62b: { "99" } % visible, RMS de pares <= { "3.0" } dB, mediana <= { "2.0" } dB, al menos { "50" } registros y { "30" } pares) tiene muy pocos datos: las { "26" } épocas de tránsito y de órbita lunar que cumplen los requisitos contienen { "15" } registros IIR/IIR-M seguidos (se siguen sobre todo IIF y III) y un par. Los { "15" } se predicen visibles y el residuo del único par es -0.06 dB; no se afirma nada

# text
seg-29df5b40a3f9 = Determinación de órbita lunar: Earth-GNSS frente a radiométrica terrestre

# text
seg-647902ebcee3 = Determinación de órbita en una órbita de halo casi rectilínea (o una órbita elíptica congelada) a partir de dos tipos de datos independientes: pseudodistancias Earth-GNSS recibidas a bordo (la regla de enlace de la fila Earth-GNSS a distancia lunar, más la oclusión por la Luna) y distancia y velocidad radial bidireccionales desde tierra de tres estaciones de la Deep Space Network. Cada una es un ajuste por mínimos cuadrados por lotes de un solo paso en torno a la órbita de referencia con su covarianza formal; una simulación de Monte Carlo con semilla de la diferencia entre ambas estimaciones comprueba si las dos covarianzas la explican (q = d' (P_G + P_R)^-1 d, chi cuadrado con seis grados de libertad cuando los modelos coinciden) y qué efecto tiene una aceleración no modelada sobre el estadístico.

# text
seg-652bdc29deea = Resolución de ambigüedades de fase de portadora lunar: superficie y orbitador

# text
seg-02496f9e9af2 = Fase de portadora y código Earth-GNSS de diferencia simple entre receptores en una estación de superficie lunar y un orbitador, con la diferencia de reloj por época perfilada fuera, una ambigüedad por paso continuo y el paso más largo como referencia de gauge. La covarianza flotante de ambigüedades es un complemento de Schur; LAMBDA resuelve los enteros, la tasa de bootstrapping se informa junto a una tasa de éxito de mínimos cuadrados enteros por Monte Carlo con semilla y las sigmas de posición flotante y fija. Informado tal como se encontró: con los { "12" } dBi registrados el problema de dobles diferencias no es formable (la enmienda { "1" } cambió el valor por defecto a { "25" } dBi tras ver solo los recuentos de disponibilidad), y a { "25" } dBi la fijación entera NO se logra: fuera de alcance (unos pocos por ciento como máximo) aunque la solución flotante mejora con el arco.

# text
seg-8d8296752eb8 = Una resolución independiente con numpy de las mismas ecuaciones normales a partir de las filas exportadas (Q3) y una enumeración entera por fuerza bruta (Q4). No se compara con ninguna medición de fase de portadora GNSS ni lunar. MODELLED.

# text
seg-11dd1bb8e4e1 = Coestimación del sistema de referencia lunar: estaciones de superficie y orbitadores

# text
seg-a38c8d95e6c9 = Información de Fisher del datum del sistema de referencia lunar de siete parámetros a partir de telemetría láser desde estaciones terrestres a los cinco reflectores solos y con distancias orbitador-estación de superficie añadidas: la matriz de información, el rango, las sigmas de Cramer-Rao, la métrica de degeneración del módulo de identificabilidad lunar y conjuntos aleatorios de estaciones con semilla. La órbita se mantiene conocida en los ejes lunares (su error lo lleva la sigma de distancia del orbitador).

# text
seg-47d2afc53b3d = Una diferencia finita independiente con numpy del modelo directo (F2). No se compara nada con soluciones reales del sistema de referencia lunar. El factor está condicionado a la órbita conocida supuesta y a la sigma de distancia de { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Precisión del enlace espacial entre sistemas de referencia: GNSS, VLBI y telemetría láser colocalizados

# text
seg-a9ae8e99f00d = Precisión de Cramer-Rao de los desfases de traslación, escala y rotación entre técnicas de los sistemas de referencia GNSS, VLBI y de telemetría láser cuando una nave lleva las tres, con la posición de la nave eliminada en cada época y nueve parámetros de perturbación de enlace local con un a priori, barrida sobre la exactitud del enlace local. Covarianzas por la vía de la raíz cuadrada (las ecuaciones normales pierden los dígitos cuando las técnicas son casi perfectas).

# text
seg-b37ac7294112 = Un sistema apilado independiente con numpy con las incógnitas de posición eliminadas mediante complementos de Schur explícitos (T3). No se compara con datos de GRASP, Genesis ni de ninguna otra misión. MODELLED.

# text
seg-ae627996875e = Sensibilidad del número de Love y de la libración lunares

# text
seg-28780d07c4a7 = Información de Fisher de h2, k2, l2 y las amplitudes de libración física a partir de telemetría láser (desplazamiento mareal radial y horizontal, rotación de reflectores), seguimiento de orbitadores (la aceleración k2 de grado 2 integrada a lo largo de la línea de visión, con la tendencia eliminada), un gravímetro de superficie (factor gravimétrico { "1" } + h2 - { "1.5" } k2) y un reloj de superficie (tasa fraccional ({ "1" } + k2 - h2) W2/c2, ligada a las constantes de tiempo lunar). Los valores nominales de h2 y l2 son puntos de linealización; el estudio dice qué es sensible a qué, no cuáles son los números.

# text
seg-180d74388339 = Un ensamblaje independiente por diferencias finitas con numpy (G2) y una evaluación en forma cerrada (G4). La sensibilidad k2 de la familia de orbitadores es una cifra de extremo superior (aquí el estado de la órbita absorbe solo una constante y una tendencia). No se compara con ninguna medición de marea o libración lunar; k2 se cita de Lemoine et al. { "2014" } como nominal. MODELLED.

# text
seg-da712b740519 = Aumento del DOP con balizas de superficie lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Dilución de la precisión aumentada con balizas para un usuario de superficie lunar: las filas de línea de visión de los satélites visibles y las filas de medición de distancia de las balizas de superficie visibles se concatenan en una única matriz de diseño y se evalúan mediante el kernel DOP compartido, y el DOP resultante se transforma en una exactitud realizada de 1 sigma EN METROS mediante un error equivalente de medición de distancia del usuario por baliza compuesto como raíz de la suma de cuadrados de términos de sincronización de reloj, multitrayecto y levantamiento. La visibilidad de balizas es el horizonte geométrico de dos alturas de la Luna sin atmósfera, que no tiene extensión refractiva y es por tanto exacto en lugar de aproximado. Ejecutable como el tipo de escenario <c1/>, que informa de los satélites solos, los satélites más las balizas, y una constelación mayor como la vía alternativa hacia la misma geometría. MEDIDO sobre la geometría de referencia incluida (usuario a -80 grados, tres balizas topografiadas, LCNS ilustrativo de seis satélites en t={ "0" }, máscara de { "5" } grados): { "5" } satélites visibles dan PDOP { "9.6941" } y un 1 sigma 3-D de { "11.222" } m; añadir las balizas que realmente superan el horizonte da PDOP { "4.1160" } y { "4.765" } m, un factor de { "2.355" }; el servicio de 24 satélites da en cambio PDOP { "2.4226" } y { "2.804" } m, un factor de { "4.002" }. El informe imprime el número de balizas VISIBLES y no el configurado, y en esta geometría solo UNA de las tres balizas supera el horizonte: los dos emplazamientos laterales están a unos { "333" } km del usuario frente a un horizonte de { "86" } km para una antena de { "2" } m, de modo que nunca se deja al lector suponer que contribuyeron las tres

# text
seg-179fb996fc72 = La aritmética de DOP es el kernel crate::orbit::dop, validado externamente por separado frente a gnss_lib_py en tests/dop_reference.rs; esta fila no vuelve a tomar prestado el estado de aquella fila. El horizonte de visibilidad de balizas es la forma cerrada L01, y sigma = DOP x sigma_URE es la relación estándar de GNSS (Kaplan y Hegarty, Understanding GPS/GNSS, sección { "7" }). Dentro de esta fila el aumento en sí se comprueba frente a una vía DOP independiente del repositorio y se fija a un golden registrado. POR QUÉ MODELLED: el diseño de la constelación, la colocación de las balizas, las alturas de antena y las tres magnitudes del presupuesto de error son entradas ilustrativas y no un levantamiento desplegado ni un enlace medido, por lo que los metros informados son una propiedad de un escenario elegido y no de ningún servicio desplegado. NOTA SOBRE LA PROCEDENCIA: esta capacidad se anunciaba en el README y la ejercitaban dos ensayos de validación, y sin embargo NO tenía ninguna fila de la matriz ni tipo de escenario, por lo que no podía alcanzarse en absoluto desde una ejecución. Se afirmaba en prosa, estaba ausente del registro e inalcanzable en el motor al mismo tiempo. La fila y el tipo de escenario se añadieron juntos. Ronda { "2" } de { "0.30" } (fijada de antemano db0eb9ec), bloqueada (sigue siendo MODELLED): la visibilidad de ANISE { "0.10.6" } y un DOP en numpy sobre la geometría de la fila concuerdan (conjuntos visibles exactos, incluidos { "72" } casos cercanos al horizonte y { "48" } cercanos a la máscara; DOP dentro de { "7.2e-13" }), pero los metros informados son DOP por un error de medición de distancia en raíz de suma de cuadrados ilustrativo de { "1.158" } m sin referencia independiente; la delimitación que los excluiría espera una decisión del propietario

# text
seg-b0b618abf402 = Ceguera de integridad de modo común

# text
seg-e732ac99a9ae = División exacta en subespacio de paridad de un error de medición en la parte que RAIM no puede ver y la parte que sí. Para el modelo instantáneo linealizado y = G·x + e, cualquier error dy se descompone de forma única en un componente CIEGO en range(G), absorbido como error de estado S·dy y anulado por el proyector de residuos Pperp = I − G·S, por lo que es invisible para CUALQUIER prueba de residuos, no solo para un umbral concreto, y un componente DETECTABLE en el espacio de paridad. El módulo devuelve el proyector, la división y la fracción ciega, de modo que quien llama puede cuantificar cuánto de un error concreto es estructuralmente incapaz de informar un monitor instantáneo. Aplicado al suelo real entre efemérides: la discrepancia métrica DE440 frente a INPOP21a y DE440 frente a EPM2021 en la posición geocéntrica de la Luna es absorbida casi por completo como error de posición del usuario (fracción ciega mediana { "1.000000" }; error de posición ciego mediano { "2.3955" } m y { "2.0050" } m) frente a un residuo de paridad del nivel de { "1e-15" } m

# text
seg-077303e9dd72 = P2: numpy linalg.lstsq (SVD gelsd de LAPACK, BSD-3) recalcula la división por mínimos cuadrados sobre entradas registradas CON una parte de paridad real (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), semilla { "20261001" }) sobre la geometría de 8 satélites y un subconjunto de 6 satélites, { "1464" } casos sobre ambos pares reales entre efemérides, fijada de antemano (f672a314): blind_dx, residual, blind_norm y detectable_norm dentro de { "1e-12" } relativo a |dy| y blind_fraction dentro de { "1e-12" } absoluto (peor blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy construye G por sí mismo a partir de las posiciones registradas, mientras que el motor usa ecuaciones normales con Gauss-Jordan; una inversa izquierda oblicua pone el ensayo en rojo con { "5.5e-2" } |dy|. La enmienda { "1" } (86c53301, tras una primera ejecución, declarada) relajó solo una precondición de entrada sobre la fracción de paridad (todos los casos al menos { "1e-3" } y el { "95" } % de cada geometría al menos { "0.05" }), no el umbral de concordancia. Afirmación validada, como permite P2: el álgebra lineal de la división sobre esas entradas; las magnitudes del suelo entre efemérides y la geometría lunar ilustrativa ({ "8" } nodos de tipo LCNS a { "5000" } km) son entradas, no validadas, y la ceguera es una propiedad conocida de todo RAIM instantáneo. La comparación con numpy de la ronda 1 (tests/lunar_common_mode_integrity_reference.rs) comprobó solo la identidad S·G = I porque sus entradas estaban en range(G); se conserva como regresión. Procedencia de las efemérides: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Nivel de protección de modo común y envolvente total de integridad

# text
seg-ffc59a7ed497 = Álgebra analítica del proyector comprobada contra sí misma: una covarianza confinada a range(G) debe dar un CMPL positivo, una covarianza confinada al espacio de paridad debe dar aproximadamente cero, y la envolvente debe sumar dos contribuciones ortogonales en el espacio de medida. La covarianza de modo común, la geometría de la constelación y k son entradas modeladas representativas, NO un presupuesto certificado, y no se afirma que la cota triangular sea ajustada. NOTA SOBRE LA PROCEDENCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope son públicos y se distribuyen, y sus ensayos unitarios ya los citaba la fila de ceguera de modo común, pero la AFIRMACIÓN DE LA ENVOLVENTE en sí no tenía fila, de modo que la única salvedad que la mantiene honesta, que la suma es una cota triangular y no un RSS, no estaba declarada en ningún lugar del registro. La fila registra la afirmación y la salvedad juntas.

# text
seg-5ed34a5b402e = OD lunar conjunta multitécnica + reloj

# text
seg-5ace1caff5a9 = Fusión por lotes de VLBI + distancia local lunar + distancia entre satélites para recuperar posiciones y relojes de estaciones y constelación

# text
seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq con gelsd de LAPACK, numpy.linalg.inv; BSD-3) recalcula cada paso de Gauss-Newton, la solución convergida de mínimos cuadrados ponderados, las sigmas formales y el error de estación sobre los jacobianos y observaciones registrados de seis redes simuladas, fijada de antemano (5094bc31) a max({ "1e-8" }, { "100" } kappa eps) relativo. La primera ejecución falló en la red sin VLBI ({ "6.1e-7" } frente a { "1e-8" }, una inversa de ecuaciones normales con condición { "1.4e5" }); la corrección del motor escrita tras ese resultado (batch_ls::gauss_newton_qr, un paso QR de Householder usado por estimate y formal_covariance) se volvió a ejecutar con el umbral sin cambios: pasos { "1.1e-14" } a { "2.4e-11" }, sigmas como máximo { "1.3e-11" }. La afirmación validada es el álgebra lineal de la resolución de fusión sobre esas entradas, no las magnitudes físicas de la red simulada ni de sus modelos de observación: la fila de retardo VLBI geodésico lunar sigue siendo MODELLED (su ruta analítica difiere de ANISE hasta { "24" } µs), y los sistemas de referencia tienen sus propias filas. La recuperación de una verdad simulada inyectada y la coherencia NEES siguen siendo comprobaciones internas; la comprobación cruzada anterior de Levenberg-Marquardt con Orekit { "12.2" } / Hipparchus (tests/lunar_joint_multi_technique_od_reference.rs) ejercita batch_ls::gauss_newton, que estimate ya no llama, y se conserva como comprobación de esa primitiva. Revisión { "0.30" }: los errores de estación por defecto de lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m con VLBI y { "2183.119" } -> { "2183.558" } m sin él (resolución QR). Revisión { "0.36" } (STUDIO-15, matemáticas portables; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m con VLBI y { "2183.558" } -> { "2184.021" } m sin él, y la resolución sin VLBI se detiene tras { "5" } iteraciones, no { "2" } (una parada limitada por el redondeo en la red mal condicionada); la comparación fijada de antemano se volvió a ejecutar con entradas reexportadas y el umbral sin cambios (numpy { "2.4.6" }, las seis redes pasan)

# text
seg-69fbe488dec5 = Información de Fisher y observabilidad de Cramér–Rao

# text
seg-043d4c7a2d6a = Información de Fisher M=HᵀWH, cota inferior de Cramér–Rao, rango de observabilidad / espacio nulo del defecto de datum (pseudoinversa de Moore–Penrose) y escalares de diseño de experimentos óptimos D/A/E/T a partir de un resolutor de autovalores de Jacobi simétrico

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, respaldado por LAPACK): una autoridad independiente de terceros que calcula los mismos autovalores definidos de forma única, la covarianza de Cramér–Rao σ²(XᵀX)⁻¹ y los factores de dilución de la precisión de GNSS mediante un algoritmo distinto (divide y vencerás de LAPACK + LU) del barrido cíclico de Jacobi y la pseudoinversa espectral de Kshana; coinciden hasta { "1e-9" }. La misma clase de biblioteca externa ya valida el motor de DOP (frente a gnss_lib_py) y los núcleos χ²/erf (frente a SciPy). Además, se contrasta con las CRLB en forma cerrada de Kay ({ "1993" }) y con la consecución de la CRLB por Monte Carlo (interno)

# text
seg-e4ec41d0f5e1 = Observabilidad absoluta de estaciones lunares (defecto de datum)

# text
seg-b3e4160042d2 = Observabilidad por información de Fisher de la solución lunar conjunta: sin líneas base con la Tierra, el datum del marco absoluto queda en el espacio nulo de HᵀWH (la posición de la estación no es observable); ≥{ "3" } líneas base restituyen el rango completo y acotan el error de Cramér–Rao de la estación, cota que el estimador alcanza

# text
seg-238597f6aa01 = Estructura analítica del defecto de datum: el modo no observable del marco absoluto queda en el espacio nulo de la información de Fisher (forma cerrada), el umbral de rango coincide con la justificación publicada del diseño de 3 estaciones, y el estimador alcanza la CRLB resultante en Monte Carlo. La geometría lunar es en sí una red representativa (no unas efemérides de vuelo), de modo que la fila se mantiene MODELLED; el motor FIM/CRLB subyacente se comprueba por separado con las formas cerradas de Kay ({ "1993" }). { "0.30" } ronda { "2" } (preregistrada fab02df9), bloqueada (se mantiene MODELLED): NumPy/SciPy recalculan el rango y el defecto con el umbral indicado de { "1e-9" }, la parte de los ejes de la estación en el espacio nulo (dentro de { "8.4e-10" }) y la CRLB de la estación (dentro de { "1.2e-10" }) en { "17" } configuraciones confirmadas generadas por Kshana (P2). No promovida: la afirmación de que el estimador alcanza la cota (eficiencia de Monte Carlo de aproximadamente { "0.98" }) carece de referencia independiente, y el alcance que la dejaría en MODELLED espera una decisión del responsable

# text
seg-ae4b71d54dfa = Ajuste de datum de Helmert de 7 parámetros + enlace de orientación ICRF a partir de una red de puntos

# text
seg-9e434924b34c = Resolutor independiente de transformación de similitud de Umeyama (Horn) ponderada en forma cerrada (basado en SVD de numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A): un algoritmo distinto del ajuste iterativo de Gauss–Newton de kshana, que alcanza el mismo óptimo de mínimos cuadrados ponderados definido de forma única en redes de puntos idénticas byte a byte

# text
seg-4bcec6e2dd9f = Volumen de servicio de navegación lunar

# text
seg-dba98ad5df1c = DOP lunar de clase Moonlight / cobertura / disponibilidad + niveles de protección ARAIM lunares generalizados sobre un volumen de servicio

# text
seg-7e981d90a806 = Autoridad independiente de terceros: propagador kepleriano ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0), una vía de código bicuerpo equinoccial distinta del Kepler de Newton-Raphson de kshana; la posición MCI por satélite coincide a <{ "1e-3" } m y el recuento/conjunto derivado de satélites visibles coincide exactamente en cada punto de la cuadrícula. El núcleo de DOP está validado con gnss_lib_py; la integridad usa parámetros publicados de LunaNet/LCNS

# text
seg-2ed7181c97dd = Generación de códigos de ensanchamiento LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Los códigos de la Augmented Forward Signal de LSIS V1.0 ({ "29" } de enero de { "2025" }): el código primario AFS-Q de 10230 chips generado a partir de la construcción del piloto L1C de IS-GPS-800 con los índices de IS-GPS-800J (las mismas { "210" } asignaciones que imprime el Apéndice D de LSIS), los códigos Gold AFS-I de 2046 chips generados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } y g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } con el retardo G2 de cada PRN recuperado del archivo del Anexo { "3" } de la norma, los cuatro códigos secundarios, los códigos terciarios de 1500 chips, la asignación provisional de nodos de la Tabla { "11" } y el código piloto escalonado. El contenido de LSIS se lee en tiempo de ejecución desde una caché local verificada con SHA-256 y rellenada desde el PDF alojado por la NASA, nunca redistribuido

# text
seg-dc1dd144b107 = Referencia: los valores que LSIS V1.0 imprime para la validación (Tablas C-1 a C-5, D-1 a D-6, E-1 a E-6) y sus archivos electrónicos de códigos del Anexo { "3" }, con un criterio de cero discrepancias fijado antes de la comparación. El criterio no se cumple por una celda impresa que es internamente incoherente con el propio archivo del Anexo { "3" } de la norma, por lo que la fila se mantiene MODELLED; se ha redactado una nota de erratas. Los mismos chips coinciden también con los de LANS-AFS-SIM (fila 'Renderizado en banda base de LunaNet AFS frente a un generador independiente, dado su estado de canal')

# text
seg-ea20909686ea = Renderizado en banda base de LunaNet AFS frente a un generador independiente, dado su estado de canal (LSIS V1.0)

# text
seg-c0f021c38842 = El núcleo de renderizado de la banda base AFS (LSIS-130: envolvente compleja I + jQ, I = el código Gold AFS-I por la trama de { "500" } símbolos/s a { "1.023" } Mchip/s, Q = el piloto escalonado AFS-Q a { "5.115" } Mchip/s, rotación de portadora, alineación de chips y símbolos) reproduce las muestras de un generador independiente cuando se alimenta con el propio estado de canal registrado de ese generador (fases y tasas de código, fase y frecuencia de portadora, amplitud por canal). No cubierto: el modelo de nodo que deriva ese estado a partir de un Doppler, un retardo y una densidad de portadora a ruido, el reparto de potencia 50/50 calculado a partir de la densidad de portadora a ruido (las amplitudes se toman del simulador), y los metadatos SigMF y la escritura de muestras de 8 bits

# text
seg-dd1142957a05 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, compilación de banda S, ejecutada como programa separado); las muestras de Kshana se alimentan únicamente con el estado de canal registrado del simulador, y una compilación con traza solo de impresión se comprueba idéntica byte a byte a la no modificada. Umbrales fijados antes de la ejecución: cero discrepancias de chips y de símbolos, |rho| >= { "0.999" } en toda la ejecución y >= { "0.99" } por bloque de { "2" } ms, fase dentro de { "0.05" } rad. Las amplitudes I y Q iguales son una entrada de la comparación, por lo que el reparto de potencia no se prueba con ella. LANS-AFS-SIM lee sus códigos terciarios del archivo del Anexo { "3" } de LSIS, por lo que esa parte no es independiente de la fila de códigos. LANS-AFS-SIM y PocketSDR-AFS comparten autor y cuentan como una sola implementación independiente. Condicionado a datos: la comparación con LANS-AFS-SIM necesita la caché local de LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificada con SHA-256) y se omite con un aviso si falta

# text
seg-5d79da539912 = Codificación de canal de trama LunaNet AFS, FID { "0" } (LSIS V1.0)

# text
seg-6ed2b4c792e6 = La trama FID { "0" } de { "12" } s y 6000 símbolos de LSIS V1.0: patrón de sincronización de 68 símbolos, subtrama { "1" } BCH ({ "51" }, { "8" }) (generador octal-763), CRC-24 (({ "1" } + X)·P(X)) en las subtramas 2-4, codificación LDPC de tasa 1/2 con las A, B^-1, C, D impresas (Anexo { "1" } de LSIS, leído en tiempo de ejecución desde la caché local verificada con SHA-256) y el perforado de la norma, entrelazador de bloques de { "60" } x { "98" }; un decodificador exhaustivo de la subtrama 1 que marca un TOI fuera de { "0" }..99, y un decodificador LDPC min-sum normalizado escrito únicamente a partir de H = [[A, B, { "0" }], [C, D, I]]

# text
seg-46879e2e8ab5 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), cuyos propios BCH, CRC, LDPC y entrelazador producen tramas idénticas símbolo a símbolo a las de Kshana para el mismo contenido (cero discrepancias, umbral fijado antes de la ejecución). Corroborado por valores de referencia: el ejemplo resuelto de BCH de la Figura { "8" } de LSIS V1.0 y el valor de comprobación de CRC-24/LTE-A (catálogo de algoritmos CRC parametrizados de Greg Cook), ambos exactos al bit; y por PocketSDR-AFS, que decodificó cada subtrama de las tramas que sincronizó en tres ejecuciones con CRC correcto y bits de la subtrama 2 coincidentes. La prueba de la comprobación de paridad es casi una identidad interna (confirma que la B^-1 impresa invierte la B impresa) y no se cuenta como referencia independiente. Condicionado a datos: la comparación con LANS-AFS-SIM necesita la caché local de LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificada con SHA-256) y se omite con un aviso si falta

# text
seg-56c7aeac59c1 = Decodificabilidad en lazo cerrado de LunaNet AFS por un receptor independiente (LSIS V1.0)

# text
seg-da2d29d437b0 = Una grabación AFS de Kshana adquirida, seguida y decodificada por un receptor de software independiente y comparada con las propias etiquetas de verdad de la grabación. Esto demuestra solo el ajuste a la norma y la coherencia de las etiquetas; no es una afirmación sobre la física del canal, la propagación, la potencia recibida ni los presupuestos de enlace, cuyos valores en la grabación son entradas elegidas

# text
seg-8211583afc64 = Biblioteca: PocketSDR-AFS (T. Ebinuma a partir del PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, compilación de banda S, copia con nivel de registro solo de impresión), con criterios fijados antes de cada ejecución. La tercera comparación preregistrada cumple íntegramente sus umbrales de decodificación y seguimiento C1 y C2, pero no su guarda G0 tal como está escrita (dos ejecuciones del receptor sin modificar difieren en los mismos cuatro registros de adquisición), y la segunda falló por { "5" } incumplimientos, por lo que la fila se mantiene MODELLED. LANS-AFS-SIM y PocketSDR-AFS comparten autor y cuentan como una sola implementación independiente; las comprobaciones con vectores impresos de la fila de codificación de tramas protegen frente a una lectura errónea compartida

# text
seg-780369fb9a54 = Ajuste a la norma de GPS L1 C/A entre generadores

# text
seg-ee47b60515f1 = Códigos de ensanchamiento GPS L1 C/A (sdr::CaCode) y subtramas LNAV 1-3 (gps_lnav: cuantización de campos de IS-GPS-200 con el pi de la especificación, empaquetado en complemento a dos, palabras TLM y HOW, paridad de la Tabla 20-XIV con inversión D29*/D30*, los bits que resuelven la paridad de las palabras { "2" } y { "10" }) comparados bit a bit con gps-sdr-sim sobre su brdc0010.22n incluido ({ "32" } satélites)

# text
seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, ejecutado como programa separado mediante un arnés confirmado), preregistrado f88f2969 con un umbral exacto al bit sobre (A) los chips C/A, (B) cada campo LNAV calculado, (C) cada bit de paridad. HALLAZGO: (A) { "0" } de { "32 736" } chips difieren, (C) la paridad de { "0" } de { "1 920" } palabras difiere, (B) { "230" } de { "1 152" } campos calculados difieren en una unidad: eph2sbf de gps-sdr-sim trunca hacia cero con conversiones de C donde el entero difundido necesita redondeo (cada valor discrepante queda a { "0.01" } de una unidad del entero redondeado de Kshana). Se mantiene MODELLED: el umbral registrado era la conjunción

# text
seg-325900ed59ea = Geometría de señal de la escena IQ de GNSS frente a un generador de banda base independiente

# text
seg-ee5625b30ff2 = La verdad por satélite del generador de escenas IQ para una escena de GPS L1 C/A con efemérides de difusión (iq::scene: una SatGeometry de efemérides de difusión, generada en registros de verdad TruthRecord): qué satélites están sobre el horizonte, la pseudodistancia, la fase de código en la primera muestra, el Doppler de portadora y los ángulos de observación, para un receptor estático, comparados con el estado de canal a partir del cual gps-sdr-sim construye el primer bloque de su propia salida I/Q, para las mismas efemérides, receptor e instante de inicio (ionosfera desactivada en ambos lados)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), un generador independiente de banda base GPS L1 C/A, compilado con su propio Makefile y ejecutado como programa separado sobre su brdc0010.22n incluido en la ubicación de ejemplo de su texto de uso (scripts/gen_iq_gpssdrsim_ref.sh); un arnés confirmado enlazado con la misma compilación imprime el estado de canal (computeRange, computeCodePhase) que hay detrás del primer bloque del programa. Umbrales fijados antes de ejecutar el generador (preregistrado 7777da53). Alcance: geometría GPS L1 C/A para un receptor estático sin ionosfera, troposfera ni reloj del receptor; los modelos de canal, el ruido y el contenido de datos de navegación de la escena no forman parte de esta fila

# text
seg-bf429c8f00fb = Adquisición IQ de GNSS sobre muestras I/Q generadas de forma independiente

# text
seg-9a0c52bfb06e = iq::acq::acquire (búsqueda paralela de fase de código por FFT con el umbral Marcum-Q de ley cuadrática) con la réplica GpsL1Ca, sobre { "20" } ms de la propia salida I/Q de 8 bits de gps-sdr-sim decodificada por el decodificador de muestras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sin ruido): cada PRN { "1" } a { "32" } buscado en dos ventanas de { "10" } ms, con el resultado comparado con la fase de código y el Doppler que gps-sdr-sim moduló

# text
seg-fb96290003e1 = Muestras I/Q de gps-sdr-sim (MIT, commit 28ca29a6) y su propio estado de canal, preregistrado 7777da53: (B1) cada PRN simulado adquirido, (B2) ningún otro PRN adquirido, (B3) fase de código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. HALLAZGO: B1, B3 y B4 se cumplen en ambas ventanas (peor caso { "0.195" } chip, { "72" } Hz), pero B2 falla: los { "21" } PRN que gps-sdr-sim no simuló también cruzan el umbral (estadístico { "151" } a { "206" } frente a { "79.5" }; PRN simulados { "1 300" } y superiores). El umbral está fijado para ruido gaussiano de la potencia de muestra medida; gps-sdr-sim no añade ruido, así que las celdas de un PRN ausente contienen la correlación cruzada de los demás satélites. Se mantiene MODELLED: el umbral registrado era la conjunción

# text
seg-f40dc3dac990 = Monitores IQ puntuados en campañas de reproducción de laboratorio: detección, omisiones, falsas alarmas y cifras de falsas alarmas en forma cerrada

# text
seg-93fb3109728c = iq::campaign::detect y el ejecutor de campañas: una tabla opcional [monitors] ejecuta los monitores IQ en cada celda en la pasada única del ejecutor. Los monitores de potencia y espectrales ven las muestras después de cada cadena de front-end; los monitores de C/N0, SQM y enganche ven las actualizaciones de lazo de cada canal seguido. Cada alarma se puntúa frente a los eventos indicados: detectada u omitida por (evento, tipo de alarma, canal), tiempo hasta la detección, y falsas alarmas fuera de los eventos sobre su exposición. Se indica la cifra de falsas alarmas en forma cerrada de cada prueba: potencia por bloque (cola Gamma exacta), exceso espectral por bloque (aproximación), curtosis (gaussiana unilateral), pulsos (techo binomial), SQM por actualización promediada (2Q(k) = Q(1/2, k^2/2), nueva), y el ARL0 del CUSUM de C/N0 (Siegmund). Sin la tabla, las celdas, claves y resúmenes no cambian. No se sintetiza ninguna forma de onda de interferencia

# text
seg-4c4fff313585 = Las propias formas cerradas de los monitores sobre las propias escenas GPS L1 C/A de Kshana (ruido y señales legítimas; eventos de atenuación de las propias señales de los satélites), frente a umbrales preregistrados en docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). HALLAZGO: M1, M2 y M4 cumplidos. M3 cumplido en detección ({ "18" } de { "18" } atenuaciones, P_md { "0" }) y NOT MET en su cláusula de temporización: la mediana del tiempo hasta la detección es { "1.001" } s frente a { "2" } x ARL1 muestras = { "0.433" } s. El CUSUM ve una estimación por ventana de { "1" } s, por lo que la cota de recuento de muestras es inferior a una muestra. Solo coherencia interna: no se comprueba ningún receptor real ni interferencia grabada

# text
seg-5b7eb7ddb474 = ROC de detección de los monitores IQ a partir de una campaña de reproducción de laboratorio puntuada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada celda de una campaña con monitores conserva, por tipo de alarma y canal, el máximo del propio estadístico de prueba del monitor sobre cada ventana de evento indicada (positivo) y sobre ventanas roc_window_s en mosaico fuera de los eventos (negativo). Los estadísticos son la desviación de potencia de bloque, el exceso de PSD, la z de curtosis, el |z| SQM de la métrica promediada y el CUSUM de C/N0. El informe los agrupa por tipo en una ROC empírica a nivel de ventana con su AUC y el punto de operación en el umbral configurado, escrita como roc.json (kshana.campaign-roc/1) y una sección Detection ROC de report.html. Una campaña sin monitores no escribe ninguno de los dos

# text
seg-e882dd678998 = Campañas sintéticas a partir de las propias escenas GPS L1 C/A de Kshana (atenuaciones de las propias señales de los satélites), frente a umbrales preregistrados en docs/design/DETECTION-ROC.md (b47e358d). HALLAZGO: R2 cumplido (nivel de azar sin nada que detectar). R1 NOT MET: AUC de cn0_drop { "0.7855" } frente a { "0.95" }, porque cada ventana negativa posterior a un evento hereda de la detección el decaimiento del CUSUM (los { "18" } negativos posteriores a un evento alcanzan { "81" } o más; los { "18" } anteriores a un evento se quedan en { "0" }). Solo coherencia interna: no se comprueba ningún receptor real ni interferencia grabada

# text
seg-3a3cfa322f01 = Calibración de los modelos de C/N0 y de enganche del receptor abierto con los resultados de campañas IQ, con error de predicción indicado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) y <c1/> en <c2/>, Python <c3/> y la herramienta MCP labfit (carpetas de campaña solo dentro de su directorio de trabajo): lee una carpeta de salida de <c4/> por su DIGEST y agrupa las celdas puntuadas en unidades de ajuste (señal x diseño de lazo x cadena de front-end x tipo de interferente, nunca agrupadas). Por unidad, ajusta el C/N0 medido frente al J/S indicado con la forma de separación espectral. Q_eff no es identificable a partir de datos de C/N0 sin una medición independiente de las potencias del interferente y de la señal, por lo que Q se indica, nunca se ajusta (la tabla de tipos, la q del evento o, para un tipo desconocido, el valor indicado más perjudicial, cw Q = { "1" }). El parámetro ajustado es el desfase identificable delta_eff = delta - { "10" } log10 Q, y la guarda de correlación informa de la degeneración. Los intervalos de C/N0 con enganche inferior al { "90" } % se censuran y se enumeran. El umbral de J/S se da directamente y mediante la forma cerrada; los modelos de lazo de seguimiento y de enganche empírico se acoplan a través del modelo de C/N0, con tiempos de caída y de reenganche. Un bootstrap de conglomerados con semilla sobre grabaciones ({ "1000" } réplicas) da intervalos percentiles; los intervalos de predicción del { "90" } % proceden de extracciones de residuos; las exclusiones de una grabación por vez se dividen en interpolación y extrapolación; una tabla [validation] preregistrada se resume con hash y cada umbral se juzga como PASS/FAIL. Informe kshana.labfit-iq/1 como JSON, CSV y Markdown generado, con un bloque de unidades. Solo sintético (sin grabación de terceros ni forma de onda de interferente). La vía labfit del registro del receptor no cambia

# text
seg-f9abecb1eea6 = Recuperación sintética de parámetros sobre las propias escenas GPS L1 C/A de Kshana con un perfil de C/N0 conocido impuesto a partir de la fórmula de la sección { "3.1" }, seguidas y puntuadas por kshana iq campaign, frente a umbrales preregistrados en docs/design/LABFIT-FROM-IQ.md (sección { "5.1" }, enmendada el 2026-10-12 en b7117bf, sección { "13" }). El estimador de C/N0 de las campañas (M2M4) se fijó en 5b13e3c2, enviado antes de la primera evaluación de umbrales (confirmado junto con el código de ajuste, no solo), tras una ejecución diagnóstica de seguimiento divulgada. HALLAZGO en la campaña de umbrales de 18 eventos: (c) PASS; (a') NOT MET, error de delta_eff -1.097 dB frente a { "0.5" } dB (todavía -0.89 dB en intervalos de { "38" } dB-Hz o más); (b') NOT MET, { "0" } de { "50" } campañas cubren la verdad (error -1.189 +/- { "0.093" } dB, intervalo de aproximadamente { "0.3" } dB); (d) NOT MET, forma cerrada { "2.20" } dB por debajo del J/S directo en la pérdida, aproximadamente el tiempo de caída ajustado por la pendiente de la rampa ({ "2.09" } dB); las cláusulas originales de Q de (a) y (b) son NOT MET porque Q no es identificable. SEGUIMIENTO (umbrales preregistrados en 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): en una campaña de J/S escalonado delta_eff se recupera dentro de +{ "0.185" } dB (S1 MET: el error de rampa es retardo del estimador); (d) tal como está escrito se cumple en ella con el modelo de lazo de seguimiento ({ "0.45" } dB) pero no con el empírico ({ "6.42" } dB), por lo que S2 es NOT MET; en una nueva campaña de rampa, (d) con los tiempos de caída ajustados más la pendiente de rampa de cada evento queda dentro de { "1" } dB para ambos modelos (R1 MET), y (a') y (d) tal como están escritos fallan de nuevo (-1.25 dB; { "2.32" } y { "9.47" } dB). Se comprueba el método, no ningún receptor: no puede ser VALIDATED a partir de datos sintéticos

# text
seg-9537d301c95e = Codificación LNAV de GPS decodificada por una biblioteca de receptor independiente

# text
seg-909415621881 = Las subtramas LNAV 1-3 de Kshana (gps_lnav::encode_subframes) para las { "32" } efemérides brdc0010.22n alimentadas a decode_word y decode_frame de RTKLIB: paridad de cada palabra, decodificación de subtramas con emisión de datos coherente, y cada parámetro decodificado frente al entero de Kshana y frente al valor de entrada

# text
seg-9b21219e9572 = decode_word/decode_frame de RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) como programa separado, preregistrado ca5f0142: R1 paridad y decodificación, R2 valor decodificado igual al entero de Kshana por la escala de IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de medio cuanto del valor de entrada. HALLAZGO: R1 { "960" } de { "960" } palabras y { "96" } de { "96" } subtramas; R3 cada parámetro, semana y tiempos de referencia exactos; R2 falla en { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades en el último lugar porque P2_43 de RTKLIB es el decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo respecto de { "2" }^-43; dividir por la constante de RTKLIB devuelve el entero de Kshana en todos los casos. Se mantiene MODELLED: el umbral R2 registrado era demasiado estricto para la propia constante de la referencia independiente

# text
seg-f66855e35c53 = Codificación del mensaje de navegación LNAV de GPS

# text
seg-8caf8366e2f8 = Subtramas LNAV 1-3 de IS-GPS-200 (gps_lnav::encode_subframes: cuantización por redondeo al más próximo de cada parámetro de reloj y de órbita con los factores de escala y el valor de pi de la especificación, empaquetado en complemento a dos, palabras TLM y HOW, paridad de la Tabla 20-XIV con inversión D29*/D30*, los bits que resuelven la paridad de las palabras { "2" } y { "10" }), el mensaje que transmite un generador de señal GPS L1 C/A

# text
seg-2b71b166b9d5 = readrnx de RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) analizando el archivo de difusión diario de IGS BRDC00IGS_R_20250610000_01D_MN.rnx y decode_word/decode_frame decodificando las palabras de Kshana, ejecutado como programa separado; preregistrado d4d9eb9d antes de obtener el archivo, umbral de entero exacto. Mutación: truncar en lugar de redondear produce { "235" } fallos. Las comparaciones anteriores del mismo codificador se registran como hallazgos: frente a gps-sdr-sim, que trunca ({ "230" } campos), y frente a los valores escalados de RTKLIB, cuya constante decimal { "2" }^-43 incumplió un umbral de una ulp ({ "41" } valores). Posverificación del integrador (se mantiene MODELLED): la comparación coincide y una mutación del conjunto de paridad también la pone en rojo, pero el preregistro d4d9eb9d llegó a la rama pública a las { "20" }:{ "02" }:{ "29" } UTC, dos segundos después del commit de resultados 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), que ya contiene la salida de RTKLIB para el archivo, por lo que no se puede demostrar el orden 'registrado antes de obtener el archivo'; un nuevo registro enviado antes de obtener un archivo de difusión no visto lo resolvería

# text
seg-c5c944357643 = Adquisición y estimación de C/N0 sobre IQ lunar real

# text
seg-f5dcb5e06bf4 = Búsqueda paralela de fase de código (acquisition::pcps_acquire: FFT portátil, plegado coherente, acumulación no coherente, umbral chi cuadrado para una probabilidad de falsa alarma en toda la búsqueda), refinamiento, correlación prompt en lazo abierto con Doppler de código y el estimador de C/N0 M2M4, ejecutados sobre los lotes IQ de 4 bits L1 de LuGRE leídos mediante realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, programa separado, configuración fijada) sobre los nueve lotes L1 no superficiales y el C/N0 RAW del receptor de vuelo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), preregistrado 768cb62b. HALLAZGO: el lector de Kshana decodifica los { "288" } tramos comparados de forma idéntica a un conversor independiente; GNSS-SDR declara positivas { "266" } de { "288" } búsquedas y Kshana coincide en las { "266" } decisiones, pero solo { "250" } se localizan en la celda de GNSS-SDR (A2 falla); la rama de C/N0 es vacua, pues ninguna época RAW de vuelo cae a menos de { "30" } s de ningún lote (la más cercana, { "141" } s). La mayoría de los positivos son artefactos: los niveles desnudos en complemento a dos llevan una media de -0.5 en I y Q, una línea de frecuencia cero { "32" } dB por encima del ruido en un intervalo de { "1" } kHz, que ambos receptores adquieren. Dos lotes (OP5, OP12) se excluyeron por error: se tomó una lectura de sus metadatos sin dígitos por una contradicción con sus cabeceras; la causa real era que el lector no podía leer una muestra más ancha que una palabra (ya corregido). Se mantiene MODELLED

# text
seg-709626569a5c = Adquisición sobre IQ lunar real frente al Doppler predicho por órbita (decisión por potencia de muestra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire con su decisión por potencia de muestra sobre los nueve lotes L1 de LuGRE no superficiales con niveles mid-rise; diferencias de Doppler entre satélites adquiridos comparadas con las diferencias predichas a partir de las órbitas finales de ESA y de la trayectoria Blue Ghost reconstruida por Firefly

# text
seg-38b8127db267 = Doppler predicho a partir de las órbitas finales de ESA/ESOC y de la trayectoria reconstruida CLPS de NAIF (xval/lugre-predicted-doppler/predict.py, independiente de Kshana), preregistrado 0d1839d2. HALLAZGO: las { "288" } búsquedas cruzan el umbral con ruido (estadísticos de potencia de muestra de aproximadamente { "430" } a { "520" } frente a { "346.3" }), por lo que P1 se cumple trivialmente y P3 se cumple ({ "274" } de { "288" } predichos visibles) mientras que P2 falla en { "4033" } de { "4036" } pares. El front-end de banda limitada eleva el ruido de cada celda unas { "1.46" } veces (fijado: suelo de ruido { "292" } frente al ruido blanco { "200" } en OP2 PRN { "1" }), lo que el estadístico de potencia de muestra no ve. Se mantiene MODELLED

# text
seg-89875d67b253 = Adquisición sobre IQ lunar real puntuada por Doppler predicho por órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire con la decisión de promediado por celdas (pico sobre la celda media de la cuadrícula, robusta al ruido de banda limitada) sobre los nueve lotes L1 de LuGRE no superficiales con niveles mid-rise; diferencias de Doppler entre satélites adquiridos comparadas con las diferencias predichas a partir de las órbitas finales de ESA y de la trayectoria Blue Ghost reconstruida por Firefly

# text
seg-f80a751bc49b = Doppler predicho a partir de las órbitas finales de ESA/ESOC y de la trayectoria reconstruida CLPS de NAIF (xval/lugre-predicted-doppler/predict.py, independiente de Kshana), preregistrado a81a9a4e. HALLAZGO: P1 y P3 se cumplen ({ "4" } lotes, { "12" } de { "12" } adquisiciones predichas visibles) pero P2 falla en { "8" } de { "8" } pares. Los dos pares más fuertes coinciden con la predicción en magnitud con el signo invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medido, -7693.9 predicho; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), por lo que el orden registrado de I en el nibble bajo es el conjugado de los lotes; las seis detecciones justo por encima del umbral no coinciden con ninguno de los dos signos. La dispersión de Doppler del refinamiento ({ "30" } a { "50" } Hz entre dos ejecuciones) también fue subestimada por el registro. Se mantiene MODELLED

# text
seg-8fa779dd1788 = Adquisición sobre IQ lunar real reservado frente al Doppler predicho por órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisión de promediado por celdas, probabilidad de falsa alarma { "1e-7" }) con refine_doppler_coherent sobre los lotes L1 de LuGRE grabados en la superficie lunar (I en el nibble alto, niveles mid-rise); diferencias de Doppler entre satélites adquiridos frente a las diferencias predichas a partir de las órbitas finales de ESA y del núcleo del lugar de aterrizaje de Firefly

# text
seg-8bfd18bb6478 = Doppler predicho a partir de las órbitas finales de ESA/ESOC y del núcleo del lugar de aterrizaje de Firefly de NAIF CLPS (xval/lugre-predicted-doppler/predict_surface.py, independiente de Kshana), preregistrado 2108e6ff sobre lotes nunca abiertos antes. HALLAZGO: falla la no vacuidad; ningún lote contiene dos adquisiciones. OP40 excluido (los metadatos nombran un archivo inexistente); OP38, OP73, OP77_0 y OP77_1 no adquieren nada y no muestran falsa alarma a { "1e-7" } (estadísticos máximos { "325" } a { "356" } frente a { "385.9" }); OP74 y OP76 adquieren el PRN { "31" } y OP78_0 y OP78_1 el PRN { "12" }, cada uno solo, todos predichos visibles. Se mantiene MODELLED. Desviaciones divulgadas: el umbral de Doppler de { "10" } Hz registrado se apoya en un Monte Carlo sintético del refinamiento coherente, no en la dispersión de los lotes ya vistos que pidió el integrador; OP40 se excluyó antes de la ejecución porque sus metadatos nombran un archivo de muestras que el conjunto de datos no incluye

# text
seg-758af035b3ce = Geometría lunar conjunta de comunicaciones y navegación

# text
seg-11f861bdc6bf = Ángulos de observación topocéntricos por satélite (acimut en sentido horario desde el norte, elevación) y distancia oblicua en un emplazamiento selenográfico con nombre, dado el satélite en el marco fijo a la Luna del emplazamiento (la afirmación validada). La precisión de medición de distancia de la señal en el espacio se expone como parámetro del escenario, de modo que el barrido del volumen de servicio produce un REQUIREMENT de medición de distancia en lugar de un resultado superado/no superado con un único sigma fijo; ese parámetro es una entrada de diseño ajena a la afirmación validada

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, ejecutado como herramienta desde xval/anise-service-geometry, binario lunar-look-angles-xval, que no llama a ningún código de Kshana): la propia rutina de acimut, elevación y distancia de ANISE (azimuth_elevation_range_sez) desde emplazamientos construidos con su constructor de latitud-longitud-altitud sobre la Luna de pck00011 (esfera de { "1737.4" } km), con los satélites rotados a MOON_PA_DE440 mediante moon_pa_de440_200625.bpc. { "768" } muestras en { "8" } emplazamientos (los { "4" } emplazamientos con nombre y { "4" } más, por encima y por debajo del horizonte), { "12" } épocas y { "8" } satélites coinciden dentro de { "1e-6" } grados en acimut y elevación y de { "1" } mm en distancia y posición del emplazamiento (fijado antes de la comparación); medido { "2.2e-12" } grados, { "2.1e-13" } grados y { "5.6e-9" } m. Afirmación: colocación del emplazamiento y ángulos de observación dado el satélite en el marco fijo al cuerpo del emplazamiento. La realización propia de Kshana del marco fijo a la Luna de rotación media y el parámetro de precisión de medición de distancia quedan fuera de ella; las pruebas unitarias de geometría en forma cerrada se mantienen como comprobaciones de apoyo

# text
seg-10af60b488b9 = Estación de referencia diferencial de clase NovaMoon: cancelación de modo común + residuo creciente con la línea base + niveles de protección DGNSS

# text
seg-96b2627b388a = Identidad de cancelación diferencial de errores + reutilización de la maquinaria de PL de SBAS de DO-229E; la solución de diferencia simple + WLS se contrasta además con lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilado): código de resolución independiente, pero con el mismo álgebra de primer orden de la diferencia de líneas de visión, por lo que sigue siendo InternalConsistency

# text
seg-c04a3591074c = Exportación de interoperabilidad lunar

# text
seg-91f4a066b3c0 = Exportación alineada con LunaNet/IOAG de marco lunar + tiempo + efemérides (CCSDS OEM + KIF) con ajuste a la norma de ida y vuelta

# text
# c1: oem
seg-f5f8ed69bea7 = La exportación OEM lunar de kshana releída por la biblioteca independiente de terceros <c1/> (R. J. Anderson): los tokens de marco/tiempo y el estado por época coinciden con la precisión de escritura ({ "1" } mm / { "1e-9" } km/s) y se rechaza una exportación sin TIME_SYSTEM: un viaje de ida y vuelta estructural de intercambio; la semántica física de marco/tiempo lunar se valida en sus propias filas, por lo que esta se mantiene MODELLED. { "0.30" } comparación externa, un hallazgo (se mantiene MODELLED): un segundo lector independiente, el analizador CCSDS OEM de Orekit { "12.2" } (Apache-2.0, valores por defecto estrictos), rechaza ambos archivos lunares porque no implementa los sistemas de tiempo LTC y TCL (decodifica el OEM EME2000/UTC del crate, y decodifica los archivos lunares una vez que TIME_SYSTEM se sustituye por TDB); oem { "0.4.5" } los decodifica dentro de la precisión escrita solo recurriendo al sistema de tiempo no admitido. No se ha establecido el intercambio de estos archivos lunares con lectores CCSDS habituales

# text
seg-8ab65cbefb75 = Puntuación alineada con marcos de resiliencia PNT

# text
seg-c48198f31d63 = Subpuntuaciones por dimensión sobre las siete categorías de resiliencia propias de Kshana (no términos del DHS), las funciones RDRR de RethinkPNT y los criterios de Yang, cada una etiquetada como modelada con su factor determinante; nivel RPCF provisional con una compuerta de degradación acotada. Autoevaluación derivada de simulación, nunca una certificación.

# text
seg-f905aeb203bb = Fórmulas por métrica derivadas a mano: diversidad de Simpson inversa, compuesto de media ponderada, duraciones de línea de tiempo acotadas/no acotadas, escalera de niveles del eslabón más débil

# text
seg-d7bdb6fe186e = Estudio de inestabilidad de decisión de la puntuación de resiliencia

# text
seg-5fcf18a68bb1 = Cuantifica cómo una única puntuación compuesta / nivel RPCF reordena arquitecturas bajo un símplex de ponderaciones defendible y un conjunto de amenazas (tasa de cambio del top-1, dispersión de tau de Kendall, tasa de cambio de nivel, rangos de clasificación); análisis de declarado frente a medido y de colapso de diversidad.

# text
seg-b6bf76a752a0 = Identidades de estadísticos de rango en forma cerrada (tau en [-1,{ "1" }] con valores calculados a mano; Dirichlet determinista con semilla) y testigos estables/inestables construidos

# text
seg-1bf03544a010 = Representatividad de la demostración y brechas hasta el vuelo

# text
seg-db24d16d38c9 = Registro de honestidad por resultado que califica la salida de una demostración: sus anclajes externos, supuestos modelados, brechas hasta el vuelo y banda TRL representativa, con invariantes impuestos (lo validado requiere un anclaje externo; lo modelado requiere una brecha y no puede afirmar por encima de TRL { "4" }).

# text
seg-81d3adb239c5 = Invariantes en forma cerrada que se corresponden con la disciplina de compliance de 'representatividad justificada + brechas hasta el vuelo identificadas'; vinculados a la frontera entre estado de verificación y tipo de referencia independiente

# text
seg-52ab936eb5f5 = Evidencia de compromiso cuántico frente a clásico (forma común)

# text
seg-a6679ed5bed7 = Un objeto TradeEvidence reproducible (marco fijo: escenario+semilla+motor; valores comunes por FoM cuántico frente a clásico con beneficio de polaridad correcta, IC del { "95" }% opcional, etiqueta validado/modelado) que lleva un registro de representatividad, de modo que cada vertical de PNT cuántico informa del compromiso de la misma manera honesta.

# text
seg-70da3e15ea8b = Identidades de beneficio/ganador en forma cerrada + envoltorio fiel del quantum_trade::TradeResult existente; honestidad vinculada al registro de representatividad y a las etiquetas de verificación

# text
seg-20fee61b3107 = Biblioteca de modelos de error de dispositivos cuánticos

# text
seg-e42eabe9bc2a = Tarjetas de dispositivo (relojes ópticos/de iones atrapados/de iones de mercurio + relojes clásicos reutilizados de holdover/clock_state; interferómetro de átomos fríos; enlaces de transferencia de tiempo clásicos + de entrelazamiento/fotón único), cada una con un registro de representatividad; el enlace de entrelazamiento añade un modelo de precisión de temporización limitado por ruido de disparo (~jitter/sqrt(R*tau), penalización por cuentas oscuras, suelo sistemático).

# text
seg-632600203e1f = Coeficientes de reloj/CAI reutilizados (holdover/clock_state, valores publicados) + identidades en forma cerrada de ruido de disparo/pérdida para el enlace de entrelazamiento

# text
seg-86d71fd89f26 = Temporización cuántica de confianza (transferencia de tiempo + difusión segura + anomalía)

# text
seg-d2a3d37825ef = Cadena de transferencia de tiempo cuántica frente a clásica de extremo a extremo (deriva del reloj + precisión del enlace en cuadratura), un nivel de protección de temporización reutilizado, un FoM de seguridad frente a ataques de retardo/repetición (1-P_md) y una probabilidad de detección de anomalías del reloj + latencia del CUSUM, emitidos como TradeEvidence honesto con un registro de representatividad.

# text
seg-ac95d112a17a = Presupuesto en cuadratura en forma cerrada sobre núcleos validados reutilizados (ADEV frente a Stable32/NIST; cota de TPL; detección analytic_pd/pmd); honestidad vinculada al registro de representatividad

# text
seg-eaf341ff4522 = Navegación cuántica sin GNSS

# text
seg-908a44a9f7c7 = Navegación a estima con INS cuántico (interferómetro de átomos fríos) frente a INS clásico de grado de navegación durante una interrupción de GNSS: crecimiento del error de posición, holdover hasta un umbral de posición y el compromiso cuántico frente a clásico como TradeEvidence honesto; nota honesta de observabilidad (el sesgo no es observable sin una corrección de posición, por lo que el error crece).

# text
seg-508f2c8884e2 = Presupuestos inerciales reutilizados contrastados con una doble integración independiente en Octave de la misma EDO de navegación a estima (entorno de ejecución distinto, modelo compartido → ReferenceImpl) más el ruido a corto plazo publicado de Freier-2016 como anclaje unilateral; el compuesto cuántico frente a clásico se mantiene MODELLED

# text
seg-914132833f5a = Detección de fallos/anomalías en sistemas PNT cuánticos

# text
seg-f20392820b9d = Catálogo etiquetado de fallos cuánticos (salto/deriva de frecuencia del reloj, pérdida de enganche; salto de sesgo/pérdida de señal del sensor), un AUC de ROC del estadístico de detección con IC por bootstrap y un fallo mínimo detectable con una tasa de falsa alarma fija; un monitor asistido por reloj cuántico detecta fallos menores que uno clásico, emitido como TradeEvidence honesto.

# text
seg-a689ab2ebb84 = AUC gaussiana en forma cerrada = Phi(mu/(sigma*sqrt2)) contrastada con la eval_stats::bootstrap_auc_ci validada externamente (frente a scikit-learn) + umbrales analíticos de detección

# text
seg-0633e05d393f = Dinámica de actitud de cuerpo rígido sin par

# text
seg-23f43007bcbf = Ecuaciones de movimiento rotacional de Euler (I ω̇ = τ − ω × Iω, ejes principales y tensor de inercia general) acopladas a la cinemática de actitud en cuaternión (q̇ = ½ q ⊗ ω) y propagadas con un integrador RK4 de paso fijo que renormaliza el cuaternión en cada paso

# text
seg-2d21a01ea132 = Propagación de cuerpo rígido del núcleo de la nave de Basilisk { "2.9.1" } (AVSLab, ISC; actitud MRP mediante sus propias ecuaciones acopladas del núcleo, svIntegratorRKF78 con tolerancia relativa { "1e-12" }), una implementación independiente de las ecuaciones del cuerpo rígido sin par: el cuaternión RK4 de Kshana (dt { "0.01" } s) y las velocidades angulares del cuerpo coinciden dentro de { "1e-9" } en { "1e4" } s con dos inercias generales no diagonales (peor caso { "3.3e-11" } y { "3.4e-12" } rad/s); tolerancia fijada antes de la comparación. Afirmación validada: movimiento sin par; no se compara el término de par externo. Las comprobaciones de leyes de conservación y de peonza simétrica se mantienen como autoconsistencia de apoyo. Sin entorno de cuerpo flexible / lazo de control / par externo

# text
seg-93b8ba1ba0e5 = Dinámica de movimiento relativo de Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Movimiento relativo de un perseguidor alrededor de un objetivo en una órbita de referencia circular en el marco LVLH: las ecuaciones linealizadas de Clohessy–Wiltshire (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) resueltas mediante la matriz de transición de estado Φ(n,t) de { "6" }×{ "6" } en forma cerrada (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) con la condición de órbita relativa acotada ẏ₀=−2n·x₀, y una corrección de segundo orden en forma cerrada (cw_dynamics::second_order_correction, la respuesta CW a los términos cuadráticos de las ecuaciones exactas del jefe circular; Karlgaard y Lutze { "2003" }, Newman, Lovell y Pratt { "2015" }) compuesta como cw_dynamics::propagate_second_order. La salida validada es propagate_second_order; la Φ lineal por sí sola se caracteriza frente a una verdad no lineal, no se valida

# text
seg-29adc2d68a7b = NumericalPropagator de Orekit { "12.2" } (Apache-2.0), de dos cuerpos, LOFType.QSW, ejecutado como programa separado (fixture sin cambios desde la ronda { "1" }). Umbral preregistrado de { "1e-3" } m en cada muestra de cada caso; la corrección del motor de segundo orden se volvió a ejecutar contra él sin cambios (enmienda 8c8e768d, escrita antes de que existiera el propagador, que divulga que se conocían las discrepancias de primer orden). propagate_second_order coincide dentro de { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } y { "2.2e-8" } m; reducir a la mitad el término de segundo orden falla a { "1.85e-3" } a { "3.14e-3" } m. La Φ lineal por sí sola se aparta de la verdad no lineal en { "1.2" } a { "6.3" } mm a { "100" } m durante un tercio de órbita (el término de segundo orden omitido; su prueba estricta se mantiene ignorada), por lo que se caracteriza, no se valida. Comprobaciones internas conservadas: Φ frente a una integración RK4 de las ecuaciones de Hill, Φ(t)Φ(−t)=I, las identidades de órbita acotada y de deriva −12π·x₀, y el escalado del residuo de tercer orden del término de segundo orden. Alcance: jefe circular, separaciones cercanas a { "100" } m, hasta un tercio de órbita; sin excentricidad (Tschauner–Hempel), ni términos de J2 ni de arrastre diferencial; supuesto de separación pequeña

# text
seg-d31be81dfd8f = Geolocalización pasiva de emisores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localizar un emisor (interferente/falsificador, o una fuente oportunista para PNT inverso) a partir de la diferencia de tiempos de llegada en una red de receptores (la intersección de hiperboloides τᵢ=(Rᵢ−R₀)/c resuelta por mínimos cuadrados de Gauss–Newton) y, añadiendo la diferencia de frecuencias de llegada (diferencias de velocidad de distancia) con receptores en movimiento, recuperar conjuntamente posición y velocidad; con la cota inferior de Cramér–Rao sobre la covarianza de posición a partir de la geometría de medición

# text
seg-17b45796fd43 = Autoconsistencia del estimador y de la geometría: viajes de ida y vuelta directo→inverso, la identidad de Fisher/CRLB J·CRLB=I, la monotonía del GDOP y el estimador que alcanza su propia cota de Cramér–Rao con ruido de Monte Carlo: comprobaciones de coherencia interna, NO un conjunto de datos externo, por lo que la fila sigue siendo InternalConsistency. Geolocalización pasiva MODELLED: modelo de línea de visión de fuente puntual; sin términos de multitrayecto / NLOS, sesgo del reloj del receptor ni refracción atmosférica. { "0.30" } ronda { "2" }, frente a Ho y Chan { "1993" } y Ho y Xu { "2004" } (preregistrado f89018b8, { "1" } % de cada valor impreso), un hallazgo (se mantiene MODELLED): la cota de TDOA restringida a la superficie reproduce los factores geométricos de { "40" } N (-0.11 %, -0.02 %) y el TDOA máximo; la cota conjunta TDOA+FDOA reproduce la Fig. { "6" } (+{ "0.06" } %, -0.17 %) y, en la fuente que el propio código de los autores nombra para la Fig. { "7" } (enmienda escrita después de ver ese resultado, divulgada), la Fig. { "7" } (+{ "0.11" } %, -0.02 %); iguala el código publicado de la cota de los autores (estilo BSD, ejecutado con GNU Octave) hasta { "3e-12" }; el resolutor de máxima verosimilitud ponderado por covarianza alcanza la cota impresa (+{ "0.3" } a +{ "0.4" } %). Los factores de Ottawa que el artículo imprime a partir de un Monte Carlo ({ "251" }, { "7.1" }) difieren en +{ "1.3" } % y +{ "4.4" } %, fuera del umbral del { "1" } %

# text
seg-36b74b49f82f = Deceleración máxima en entrada balística de 3-DoF frente al nominal publicado de Stardust

# text
# c1: entry-heating
seg-a05ca2fde6fc = Una entrada de masa puntual de 3-DoF sobre una Tierra esférica en rotación a través de la Atmósfera Estándar de EE. UU. { "1976" }, integrada con RK4 desde un estado de entrada inercial, que informa de la deceleración máxima y su altitud; el estado de entrada relativo al planeta a partir del inercial. Ejecutable como el tipo de escenario <c1/>.

# text
seg-5ab7065c0803 = El nominal de Stardust de Desai, Mitcheltree y Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): deceleración máxima de { "33.4" } g desde { "12.6" } km/s relativos al planeta con la masa de lanzamiento de { "45.8" } kg, una trayectoria POST de 6-DoF con la base de datos aerodinámica completa; interfaz de entrada de Desai, Lyons, Tooley y Kangas (NTRS { "20090004445" }): radio { "6503.14" } km, { "12.9" } km/s inercial a -8.2 grados. Umbrales preregistrados en xval/entry-stardust/PREREGISTRATION.md antes de cualquier ejecución con estas entradas; ambos se cumplieron en la primera ejecución. LO QUE NO SE COMPRUEBA: un caso publicado y una magnitud (deceleración máxima, que en la aproximación balística no depende del coeficiente balístico); la latitud y el rumbo de entrada se suponen; no se contrastan con ella el calentamiento, la carga térmica ni el punto de aterrizaje; masa puntual con C_D constante, no de 6-DoF.

# text
seg-5bd3882531b6 = Calentamiento convectivo de entrada en el punto de estancamiento (Sutton-Graves) en una entrada de 3-DoF

# text
seg-4f97036ed72f = Flujo de calor convectivo en el punto de estancamiento q = k sqrt(rho/R_n) V^{ "3" } con las constantes de Sutton-Graves para aire terrestre y para la atmósfera de Marte (NASA TR R-376, { "1971" }), su pico y la carga de calor integrada a lo largo de una entrada de 3-DoF, balística o con sustentación a ángulo de alabeo constante, en la Tierra o en Marte.

# text
seg-5a203ecfeaee = Coherencia interna: la relación y las constantes tal como están impresas en NASA TR R-376, una comprobación de convergencia de medio paso y el orden esperado de los picos de calentamiento y deceleración. LO QUE NO SE COMPRUEBA: no se ha comparado ningún valor de calentamiento publicado (los artículos de Stardust dan un límite de diseño y una estimación convectiva más radiativa de unos { "1200" } W/cm2, que una relación solo convectiva no puede igualar); ni calentamiento radiativo, ni corrección de temperatura de pared o de catalicidad, ni respuesta de la protección térmica.

# text
seg-1b96577665fc = Radiometría de un generador de imágenes electroóptico, MTF, respuesta relativa de borde y NIIRS de GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Presupuesto de relación señal-ruido de un generador de imágenes en nadir (radiancia de escena lambertiana, ecuación de la cámara, ruido de disparo, oscuro, de lectura y de cuantización), la MTF del sistema en Nyquist como producto de la difracción de apertura sin obstrucción, la apertura del detector, el emborronamiento lineal y la vibración gaussiana, la respuesta de borde y la respuesta relativa de borde integradas a partir de esa MTF, Q = lambda F / p, y el NIIRS de GIQE versión { "4" } sin compensación de MTF. Ejecutable como el tipo de escenario <c1/>.

# text
seg-bb3a01edc95d = Formas cerradas: la MTF de difracción a media frecuencia de corte, el borde en rampa de un píxel de una apertura de detector pura (RER { "1" }), el borde de CDF normal de un desenfoque gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), el escalado del ruido de disparo y los coeficientes de GIQE { "4" } tal como se publicaron (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). LO QUE NO SE COMPRUEBA: no se ha comparado ningún generador de imágenes externo, MTF medida ni imagen calificada; GIQE es una regresión empírica con su propio error; ni luz parásita, MTF atmosférica, compensación de MTF ni aliasing.

# text
seg-07ca77a67207 = Pérdidas de ascenso de lanzamiento por gravedad, arrastre, guiado y contrapresión

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascenso planar con giro por gravedad de un vehículo multietapa sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. { "1976" } (densidad y presión), con un impulso de cabeceo, empuje reducido por la contrapresión de la tobera, agotamientos de etapa en límites de paso exactos, y las pérdidas por gravedad, arrastre, guiado y contrapresión integradas junto al estado. Ejecutable como el tipo de escenario <c1/>.

# text
seg-174ed29adbbe = Coherencia interna: la identidad exacta velocidad de agotamiento = suma Isp g0 ln(m0/mf) menos las cuatro pérdidas integradas (residuo inferior a { "1e-6" } m/s), la ecuación de Tsiolkovski en una combustión vertical en vacío con la gravedad como única pérdida, y las presiones de US76 al nivel del mar y en la tropopausa. LO QUE NO SE COMPRUEBA: no se han comparado las pérdidas de ningún vehículo publicado; ni rotación terrestre, ni fase balística, ni regulación de empuje ni guiado más allá del impulso; C_D constante; no es un optimizador de trayectorias.

# text
seg-55e8345def8b = Ecuación bidireccional de TWSTFT, presupuesto de incertidumbre y estabilidad del enlace con no reciprocidad de flicker y diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = La ecuación bidireccional de TWSTFT resuelta para T_A - T_B con retardos de transmisión y recepción de las estaciones, la asimetría ionosférica de subida/bajada en banda Ku, la diferencia de retardo del transpondedor y los términos de Sagnac, frente a su modelo directo exacto; un presupuesto de incertidumbre en cuadratura con la TDEV del enlace como término de tipo A; una serie bidireccional con ruido de fase blanco y flicker (Kasdin-Walter), una no reciprocidad diurna y un residuo constante de reciprocidad; y la tasa, el RMS residual, la TDEV y la ADEV de series suministradas de Circular T, MJD-CSV o reloj de estación IGS RINEX. Ejecutable como el tipo de escenario <c1/>.

# text
seg-244f7396ac25 = Coherencia interna: el modelo directo y la ecuación resuelta coinciden hasta { "1e-15" } s, el término de Sagnac iguala la forma de lazo omega/c^{ "2" } de BIPM 2A independiente del módulo, el término ionosférico es { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, y los procesos de ruido muestran sus formas de TDEV esperadas. LO QUE NO SE COMPRUEBA: no se ha comparado ninguna medición real de TWSTFT ni informe de calibración; los retardos e incertidumbres indicados son entradas, no medidos; las estabilidades de las series suministradas se informan, no se validan.

# text
seg-2f9be02c92bc = Numérica de la atmósfera de una trayectoria oblicua óptica: varianza de Rytov, centelleo, probabilidad de desvanecimiento gamma-gamma, promediado de apertura, profundidad óptica de nubes y de aire despejado

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrada a lo largo de una trayectoria oblicua para la varianza de Rytov de onda plana y esférica (enlace ascendente y descendente), el índice de centelleo de Andrews-Phillips y los parámetros gamma-gamma, la probabilidad de desvanecimiento gamma-gamma y el margen de desvanecimiento, el factor de promediado de apertura de turbulencia débil, la profundidad óptica de nubes de una columna de agua líquida y la profundidad óptica de aire despejado de visibilidad de Kim más Rayleigh, que sustituye la pérdida atmosférica global del presupuesto de enlace óptico cuando se suministra una atmósfera. Ejecutable dentro del tipo de escenario <c1/>.

# text
seg-7ca512adff99 = La numérica se compara con un programa independiente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } a { "30" } dígitos, cuadratura tanh-sinh sobre la variable de altura original y densidades gamma-gamma de Bessel-K) que no comparte código con Kshana, con umbrales fijados antes de que existiera cualquier implementación (xval/optical-atmosphere/PREREGISTRATION.md). POR QUÉ MODELLED: esa referencia independiente evalúa las mismas fórmulas publicadas, de modo que comprueba la implementación de las fórmulas indicadas y no la atmósfera; no se usa ningún ejemplo de validación de ITU-R ni registro medido de centelleo o de extinción en trayectoria oblicua (los valores de ITU son una decisión de licencia abierta y se mantienen fuera del repositorio). El nivel del perfil de Cn2, la visibilidad, las alturas de escala de aerosoles y moléculas, la longitud de trayectoria del promediado de apertura y el ajuste de momentos usado para aplicar el promediado de apertura a los parámetros gamma-gamma son entradas o convenciones indicadas. Una línea de fuente del módulo registra que un estudio muy copiado imprime el segundo exponente de centelleo como 7/6 donde Andrews y Phillips dan 5/6; se implementa la forma 5/6

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
seg-ab2a33c1b1a4 = Coherencia interna con el módulo de holdover, bit a bit; NO se reivindica ninguna referencia independiente externa. Las PSD de clase son los suelos sintetizados de tau largo que el módulo de holdover ya incluye, de modo que las cifras heredan su advertencia indicada de que el holdover hasta un umbral estrecho lo rige el suelo de ruido rojo supuesto y no la desviación de Allan citada. Las duraciones de interrupción son un modelo lognormal con parámetros indicados, no un registro medido de permanencia de nubes

# text
seg-b119df65d2a7 = Margen de enlace óptico frente al tiempo: una realización con semilla del tiempo meteorológico de un emplazamiento

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Una tabla opcional <c1/> (duración, paso, semilla) hace que el tipo de escenario <c2/> escriba además, por emplazamiento, una realización con semilla del modelo de emplazamiento indicado a lo largo del tiempo: episodios de nubes (periodos despejados exponenciales, interrupciones por nubes lognormales con la media y dispersión indicadas, con la proporción de tiempo nublado fijada a la probabilidad de nubes indicada), una columna de agua líquida lognormal por episodio de nubes, una muestra de centelleo gamma-gamma por paso, y a partir de ellas el margen de enlace, los desvanecimientos por nubes y por centelleo y el indicador de enlace activo, con la disponibilidad, la fracción de nubes, el número de interrupciones y la interrupción más larga realizados. Sin la tabla el resultado es el documento de { "0.37" }. Los sorteos pasan por las rutas portátiles de distribuciones y matemáticas, de modo que native y wasm32 dan los mismos bytes.

# text
seg-d25e5d2449bd = Solo coherencia interna; NO se reivindica ninguna referencia independiente externa y no existe ninguna para una realización meteorológica. Las comprobaciones comparan un sorteo con la salida estadística del mismo modelo, de modo que una prueba superada dice que el generador muestrea las distribuciones indicadas (la disponibilidad y la proporción de nubes del sorteo quedan dentro de tolerancias preregistradas de las cifras indicadas), no que ningún emplazamiento real se comporte así. La serie es una realización, no el clima: su disponibilidad difiere de la indicada por el error de muestreo del sorteo, y las muestras de centelleo en pasos distintos son independientes, una simplificación indicada de un proceso que se decorrelaciona en milisegundos. Las entradas meteorológicas siguen siendo supuestos del escenario.

# text
seg-58cbf576c959 = Lector de archivos de datos orbitales TRK-2-18 y modelo Doppler de 2 vías con rampas de Marte

# text
seg-d1055650a77f = Un lector de archivos de datos orbitales de la DSN (TRK-2-18): los grupos de registros de 36 bytes (etiqueta de archivo, identificador, datos orbitales, rampas por estación, desfases de reloj, resumen, fin de archivo), y en cada registro de datos orbitales la marca de tiempo desde { "1950" }, retardos de enlace descendente y ascendente, observable, estaciones, tipo de dato, bandas, validez, canal, nave, la frecuencia de referencia de 46 bits y el tiempo de compresión; tiempos de inicio y fin de rampa, tasas y frecuencias iniciales. Sobre él, un modelo Doppler de 2 vías en banda X con rampas (rampas de enlace ascendente integradas, tiempo de luz de ida y vuelta con Shapiro y troposfera, estaciones de la DSN mediante la cadena CIO IAU 2006/2000A y EOP de IERS, tiempo de estación) y una determinación de órbita por lotes de un orbitador de Marte (campo GMM-3, terceros cuerpos, SRP, arrastre).

# text
seg-6d533149f6f0 = La etiqueta PDS3 que el proceso de acondicionamiento de datos de navegación de la DSN produjo con el archivo (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), contrastada con umbrales preregistrados en xval/mro-odf/PREREGISTRATION.md antes de que existiera el lector. MODELLED porque un umbral registrado (las filas de la tabla de fin de archivo, { "121" } en el archivo frente a { "120" } en la etiqueta) no se cumplió; la etiqueta es internamente incoherente en ese punto. Etapa { "2" } (xval/mro-od/PREREGISTRATION.md, enmiendas A1 y A2 antes del resultado puntuado): el Doppler predicho a partir de la reconstrucción del equipo de navegación de MRO (mro_psp5, NAIF) coincide con el Doppler de 2 vías con rampas observado hasta { "12.5" } mHz en pasadas no usadas en el desarrollo, umbral cumplido; la determinación de órbita registrada falló en el arco puntuado (la matriz normal no es definida positiva) y no produjo órbita, por lo que no se cumplieron los umbrales de órbita. La ejecución { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, un estimador amortiguado, el mismo arco y umbrales, una enmienda de puntuación R2-A1 divulgada en docs/revisions) convergió: la órbita estimada queda dentro de { "0.36" } km RMS ({ "0.53" } km como máximo) de la reconstrucción, umbrales cumplidos, pero el RMS del Doppler posterior al ajuste es { "48.6" } mHz frente al umbral de { "30" } mHz, no cumplido, por lo que la fila se mantiene MODELLED. LO QUE NO SE COMPRUEBA: ninguna órbita estimada ha cumplido todos los umbrales registrados; la ionosfera, el plasma solar y la mayor parte del desfase de antena (se ajusta un desfase radial de { "1.5" } m en la pasada de desarrollo) no se modelan.

# text
seg-c7d292f14693 = Control de actitud en lazo cerrado con realimentación MRP y ruedas de reacción

# text
# c1: aocs
seg-f33781b74cc2 = Control de actitud de apuntamiento inercial de un núcleo rígido con tres o más ruedas de reacción equilibradas: la ley de realimentación MRP L_r = -K sigma_BR - P omega_BR (Schaub y Junkins), pares de motor de rueda de norma mínima G_s u = -L_r recortados al límite de cada rueda, la dinámica acoplada del núcleo y las ruedas con la inercia del núcleo que incluye la inercia de giro de las ruedas, cinemática en cuaternión, RK4 con retenedor de orden cero. Ejecutable como el tipo de escenario <c1/> (lazo de estado verdadero).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; la rueda bsk ejecutada como herramienta separada, nunca enlazada ni incorporada): núcleo de la nave, reactionWheelStateEffector (BalancedWheels, límite de par activado), simpleNav, inertial3D, attTrackingError, mrpFeedback (sin término integral) y rwMotorTorque con dt = { "0.1" } s y su RK4, frente a la implementación propia de Kshana en tres casos (tres ruedas ortogonales; una pirámide de cuatro ruedas; un caso de cuatro ruedas con saturación), con umbrales preregistrados en xval/aocs-basilisk/PREREGISTRATION.md antes del código y de la ejecución. Todos los umbrales se cumplieron en la primera ejecución. LO QUE NO SE COMPRUEBA: ruido de sensor en el lazo, realimentación integral, guiado de seguimiento, fricción de las ruedas, vibración, límites de velocidad y potencia, ni las ganancias de ninguna nave real; la comparación comprueba la implementación de la ley y de la dinámica frente a una independiente, no un controlador de vuelo.

# text
seg-455dc946c965 = Estimación de actitud con EKF multiplicativo a partir de un giroscopio y un seguidor estelar

# text
# c1: aocs
seg-553d043438b4 = El EKF multiplicativo de Lefferts-Markley-Shuster: estados de error de actitud en ejes cuerpo y de sesgo del giroscopio, propagación con la velocidad del giroscopio menos la estimación del sesgo y el ruido de proceso discreto de Farrenkopf (paseo aleatorio de ángulo y de velocidad), actualizaciones del seguidor estelar con el residuo { "2" } vec(q^-1 q_st) en forma de Joseph y el reinicio multiplicativo; un simulador discreto de Farrenkopf de giroscopio y seguidor estelar. El tipo de escenario <c1/> puede cerrar el lazo de control sobre su estimación.

# text
seg-846cb1eeb35c = Coherencia interna: el error de estimación normalizado al cuadrado del filtro frente a una verdad simulada con los mismos modelos de sensor sobre semillas de Monte Carlo, y la convergencia de las estimaciones de actitud y de sesgo. LO QUE NO SE COMPRUEBA: no se ha comparado ningún estimador externo ni datos de vuelo (Basilisk { "2.9.1" } no tiene módulo MEKF); los modelos de sensor son los de los manuales, sin desalineación, factor de escala ni efectos del campo de visión del seguidor estelar.

# text
seg-059732bda693 = Determinación de actitud de Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Actitud óptima de tres ejes a partir de observaciones vectoriales ponderadas (direcciones de estrellas/Sol/magnetómetro): el TRIAD determinista de dos vectores, el método q de Davenport (el minimizador exacto de la pérdida de Wahba: el cuaternión óptimo es el autovector del mayor autovalor de la matriz K de Davenport de { "4" }×{ "4" }, resuelto con un resolutor de autovalores de Jacobi simétrico) y QUEST (raíz de Newton/secante de la ecuación característica de K con semilla en Σ pesos, y luego recuperación del cuaternión mediante el vector de Gibbs)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }): la solución SVD de Kabsch/Markley del problema de Wahba, un algoritmo genuinamente independiente (SVD de la matriz de perfil de actitud) y una base de código distinta de la resolución de autovalores de Davenport-K / método de la raíz característica de QUEST de kshana, que calcula la MISMA actitud óptima de Wahba definida de forma única. En conjuntos de observaciones vectoriales ponderadas sin ruido, TRIAD, el método q y QUEST reproducen la rotación óptima de scipy hasta <{ "1e-9" } rad (comparado mediante el ángulo de error de actitud invariante al signo). La afirmación estadística de Monte Carlo con ruido 'el óptimo supera a TRIAD' se mantiene MODELLED (sin referencia independiente externa); solo observaciones de vectores unitarios de dirección puntual: sin modelado del campo de visión, sesgo ni correlación temporal del sensor, y QUEST es singular a { "180" }° (el método q cubre ese caso)

# text
seg-cd342cc48afc = Estadísticos de detección de adquisición GNSS de ley cuadrática

# text
seg-6d97452de33e = Detector de adquisición de ley cuadrática (no coherente) sobre una búsqueda de fase de código × Doppler: probabilidad de falsa alarma (χ² central con 2M grados de libertad), el umbral que alcanza una P_fa objetivo (CDF de χ² invertida por bisección) y la probabilidad de detección (χ² no central con parámetro de no centralidad 2M·ρ para una SNR de poscorrelación por celda ρ), con la función Q de Marcum generalizada Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost): un algoritmo independiente (χ² no central/central por fracciones continuas) de la serie de gamma incompleta de kshana (raim::chi2_cdf / noncentral_chi2_cdf), que calcula el mismo NÚCLEO de estadísticos de detección definido de forma única: la Q de Marcum generalizada Q_M(a,b)=ncx2.sf(b²,2M,a²), la probabilidad de detección P_d, la probabilidad de falsa alarma P_fa y la inversión P_fa→umbral, coincidentes hasta ~{ "1e-6" }, con la misma base de independencia que la fila validada 'Núcleo estadístico de integridad RAIM/ARAIM'. Solo el NÚCLEO: el CFAR por promediado de celdas por celda y la pérdida por desfase entre contenedores de código/Doppler se mantienen MODELLED

# text
seg-77f425a38aa2 = Resolución de ambigüedades enteras de fase de portadora GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fijación de ambigüedades por mínimos cuadrados enteros al modo LAMBDA: una transformación decorrelacionante entera (Z) que preserva el volumen (reducción de tamaño entero de Gauss del factor L D Lᵀ) + una búsqueda exacta de mínimos cuadrados enteros por ramificación y acotación en profundidad de Schnorr–Euchner, con la prueba de razón sobre los dos mejores candidatos (la afirmación validada); más la tasa de éxito bootstrapped en forma cerrada P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), comprobada solo internamente y fuera de la afirmación validada

# text
seg-5aeb95f59f07 = lambda() de RTKLIB v2.4.2-p13 (su archivo fuente lambda.c, T. Takasu, BSD-2-Clause), una reducción LAMBDA y una búsqueda MLAMBDA independientes compiladas desde C y ejecutadas como herramienta, sobre { "300" } covarianzas aleatorias (n { "2" } a { "10" }): los mínimos cuadrados enteros tienen un minimizador único, por lo que los enteros fijados deben ser idénticos ({ "0" } discrepancias) y las dos mejores normas al cuadrado, que alimentan la prueba de razón, coinciden hasta { "1e-9" } relativo (medido { "5.6e-13" }); tolerancia fijada antes de la comparación. Afirmación validada: la solución ILS y sus dos mejores normas. RTKLIB no calcula la tasa de éxito bootstrapped, que se mantiene comprobada internamente frente a un Monte Carlo del proceso de redondeo; los invariantes de la transformada Z y la enumeración por fuerza bruta se mantienen como comprobaciones de apoyo. Solo decorrelación entera de Gauss (las permutaciones de reordenación de la reducción LAMBDA completa aceleran la búsqueda pero no cambian ni la respuesta ILS exacta ni la tasa bootstrapped)

# text
seg-4ad1ec05610f = Apuntamiento en el plano B y asistencia gravitatoria de cónicas empalmadas

# text
seg-d249aea7c3ea = Geometría de sobrevuelo hiperbólico (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, ángulo de giro δ={ "2" }·asin(1/e), parámetro de impacto |B|=|a|·√(e²−{ "1" })), el marco de punto de apuntamiento Ŝ/T̂/R̂ del plano B y la descomposición B·T̂/B·R̂, y una asistencia gravitatoria de cónicas empalmadas (módulo de v∞ conservado, dirección desviada en δ, Δv heliocéntrico={ "2" }·v∞·sin(δ/2) sin coste de propulsante) con el parámetro de Tisserand T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, ejecutado como programa separado) sobre { "192" } estados hiperbólicos terrestres: B.T, B.R y |B| dentro de { "1e-6" } km (peor caso { "1.35e-8" } km), el ángulo de giro y ambas asíntotas dentro de { "1e-9" } rad (peor caso { "9.3e-15" } rad); la variación de velocidad de la asistencia a partir de C3 y las asíntotas de GMAT dentro de { "1e-9" } v_inf (peor caso { "5.6e-14" }); SMA, ECC e INC heliocéntricos en { "350" } estados centrados en el Sol antes y después de la asistencia dentro de { "1e-9" } relativo y { "1e-12" } rad (peor caso { "2.2e-14" } y { "4.1e-14" } rad); el parámetro de Tisserand frente a sbpy { "0.6.0" } (BSD-3) sobre elementos de GMAT dentro de { "1e-9" } (peor caso { "1.3e-15" }) y frente a { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }); y la forma cerrada de Tisserand frente a la Tabla { "8.1" } de Kasuga y Jewitt ({ "2019" }) para { "12" } objetos dentro de la cota de redondeo impreso (peor caso { "0.39" } de ella; un valor resuelto publicado P1). Preregistrado (436293bf; reparación heliocéntrica 6fd9f5e6); la enmienda 374c806b, escrita después de generar los archivos de la referencia independiente y antes de cualquier valor de Kshana, amplió el filtro de entrada de inclinación de { "1e-2" } a { "1e-3" } rad, conservando más estados y peor condicionados. Alcance MODELLED: sobrevuelo bicuerpo de cónicas empalmadas en una órbita planetaria circular, sin transición de esfera de influencia, perturbaciones del encuentro ni efemérides

# text
seg-8e82da17a463 = Conformación de haz de un arreglo antiinterferencia CRPA

# text
seg-1744f527b4d1 = Anulación de antena de patrón de recepción controlado: vectores de apuntamiento complejos del arreglo a(û)=exp(j·k·pₙ·û), anulación determinista (ganancia unitaria hacia el SV, nulos exactos hacia hasta N−{ "1" } interferentes mediante la norma mínima w=Aᴴ(AAᴴ)⁻¹b) y pesos adaptativos MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) que dirigen por sí mismos nulos profundos hacia interferentes fuertes (con un núcleo de álgebra lineal compleja desde cero)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (resolución compleja zgesv de LAPACK): una base de código de álgebra lineal independiente del núcleo complejo desde cero de kshana, que calcula los MISMOS pesos definidos de forma única: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) y anulación de norma mínima w=Aᴴ(AAᴴ)⁻¹b, además de las ganancias de respuesta del arreglo resultantes, coincidentes hasta ~{ "1e-9" }: la misma clase de referencia independiente que las filas validadas de DOP (gnss_lib_py) y de información de Fisher (numpy). Arreglo MODELLED de banda estrecha, campo lejano y elementos isótropos idénticos: sin acoplamiento mutuo, desajuste por elemento, ancho de banda finito (STAP) ni error de estimación del vector de apuntamiento

# text
seg-f2c973f14d52 = Ruido de reloj de ley de potencias IEEE-1139 + suelo de flicker-FM

# text
seg-4a0159558671 = La conversión IEEE-1139 de PSD↔varianza de Allan de cinco coeficientes S_y(f)=Σh_α f^α → σ_y²(τ) (PM blanco/flicker, FM blanco/flicker/paseo aleatorio), el suelo de flicker-FM σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) como término ajustable de primera clase, y un ajuste no negativo de la familia FM en la base { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } que recupera el suelo que la base de deriva { "{" }1/τ,τ,τ³{ "}" } no puede representar

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; coeficientes de Kasdin & Walter { "1992" } / Vernotte { "2015" }): una base de código de terceros y un linaje de citas independientes que calculan la MISMA conversión IEEE-1139 PSD→Allan σ_y(τ) definida de forma única para cada uno de los cinco tipos de ruido de ley de potencias. powerlaw::allan_deviation de kshana coincide con las formas cerradas de allantools (FM blanco/flicker, RW-FM y PM blanco a <{ "5e-9" } relativo; PM flicker a ~{ "1e-5" }, la verdadera señal de independencia, pues kshana usa la constante tabulada { "1.038" } de NIST-SP-1065 frente al 3γ−ln2 completo de allantools), y el suelo de flicker-FM √({ "2" } ln2·h_{ "{" }-1{ "}" }) coincide con allantools en toda la escala: el mismo umbral que superan las filas validadas de MDEV/TDEV/Theo1/MTIE. Modelo estacionario de ley de potencias MODELLED: sin término de deriva determinista (τ²); los coeficientes por dispositivo / suelos medidos se mantienen modelados

# text
seg-cc1ac065e684 = Intercambio del bloque de covarianza CCSDS OEM

# text
seg-ec4d44e7cf78 = Serializar y analizar el bloque COVARIANCE_START…COVARIANCE_STOP de OEM de CCSDS { "502.0" }: la covarianza posición/velocidad de { "6" }×{ "6" } escrita como su triángulo inferior de 21 elementos (orden canónico CX_X … CZ_DOT_Z_DOT) con el COV_REF_FRAME opcional, que complementa el escritor/analizador existente de vectores de estado OEM para que las covarianzas de determinación de órbita y de filtros hagan el viaje de ida y vuelta en el formato estándar

# text
seg-ae061c7f082c = Crecimiento del error y cruces de umbral en deriva INS/TRN

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Presupuesto de error de posición frente a duración de deriva construido a partir de coeficientes de IMU, con cada fuente de error (sesgo del acelerómetro, sesgo del giroscopio, paseo aleatorio de velocidad, paseo aleatorio de ángulo, factor de escala en crucero y bajo fuerza específica sostenida) propagada mediante un modelo de error de INS de nivel local de nueve estados con la realimentación de Schuler (inertial::coast::ErrorDynamics según Groves 2.ª ed. cap. { "14" }: errores de actitud, velocidad y posición, el canal vertical con su gradiente de gravedad, radios WGS-84 y gravedad normal, una plataforma nivelada con rumbo norte a la velocidad configurada, latitude_deg y height_m; términos sistemáticos mediante una exponencial matricial aumentada, paseos aleatorios mediante Van Loan), con los monomios de Tierra plana conservados solo como leading_order_m; contribuciones combinadas bajo una regla indicada (rss / suma lineal / suma determinista con rss estocástico); las duraciones de deriva que alcanzan umbrales de posición suministrados por quien llama ({ "10" } m y { "50" } m por defecto) localizadas mediante un barrido hacia delante hasta el primer cruce (first_crossing_s, ya que las curvas acotadas por Schuler no son monótonas), con la fuente dominante en cada cruce; y un modo acotado por TRN que da el mayor intervalo de corrección de terreno que cumple cada umbral. Ejecutable como el tipo de escenario <c1/>

# text
seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), ejecutado como programa separado bajo GNU Octave { "8.4.0" }: ejecuciones de deriva inercial libre con el mismo perfil de error de IMU, con una zona muerta numérica corregida en su actualización de cuaternión (qua_update.m: la guarda sobre una velocidad inferior a { "1e-8" } rad/s sustituida por wnorm == { "0" }, aplicada a una copia en tiempo de ejecución y comprobada para que coincida una vez; con la guarda en su lugar, la actitud de una plataforma con deriva lenta se congelaba y cortaba la realimentación de Schuler). Preregistrado (4262b969) con el generador corregido antes de ejecutarlo; el motor (440b3877) se confirmó antes de abrir cualquier salida corregida; mismo umbral del { "5" } %, { "48" } puntos, términos, semillas y estadístico que en la ronda { "1" }. Resultado: 48/48 dentro del { "5" } % (peor +{ "3.70" } % de paseo aleatorio de velocidad a { "1200" } s, +{ "3.33" } % de paseo aleatorio de ángulo a { "1800" } s); a { "3600" } s NaveGo/Kshana dan 2375.4/2376.2 m para el sesgo del acelerómetro y { "130" } 885/131 { "675" } m para el sesgo del giroscopio. Anular la realimentación de tasa de transporte de Schuler hace fallar la prueba (+{ "695" } % a { "3600" } s). Divulgado: se conocían las predicciones de Schuler de un solo canal y los valores de NaveGo de la ronda 1; el modelo no tiene ningún parámetro ajustado. Alcance: las curvas de error por término en grado táctico, { "45" } grados N, nivelado y con rumbo norte, hasta { "3600" } s; los cruces, la regla de combinación y el modo TRN son funciones deterministas de esas curvas. Los coeficientes de la clase de IMU (cifras de banda de la Tabla { "4.1" } de Groves { "2013" }) y el residuo de corrección de TRN se mantienen como entradas MODELLED. Ronda { "1" } (sustituida): los monomios de Tierra plana, ahora leading_order_m, sobrestiman más allá de { "600" } s (2.2x a 8x a una hora). { "0.30" } revisión: cambia cada salida de ins-trn-coast (el pico de TRN del escenario distribuido { "52.932679" } -> { "44.711834" } m)

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
# c1: passes::predict_passes
seg-656fd7d44a9e = Coherencia interna, a partir de tres magnitudes calculadas con expresiones distintas en el mismo barrido y que luego deben cerrar. Los segundos de apertura de navegación, de comunicaciones y de inactividad se acumulan por separado (la inactividad a partir de (aperturas − |atendidas|) por intervalo elemental, nunca como un resto) y su suma se comprueba frente a aperturas × horizon_s, lo que rompe de inmediato un límite mal acotado, un intervalo contado dos veces o uno omitido; los tiempos atendidos por sesión deben además sumar de nuevo los dos totales de servicio. Las propiedades estructurales del planificador se miden en lugar de suponerse: se comprueba que el tiempo atendido no decrece con el número de aperturas sobre { "200" } planes pseudoaleatorios para las tres políticas (no evidente para la política no apropiativa, donde una apertura adicional cambia quién retiene qué en cada límite posterior), y la aritmética de límites se fija en el par de contacto/solapamiento de un segundo donde un error de uno quedaría oculto. El puente del predictor de pasadas se comprueba frente a la salida de <c1/>: con una apertura y sin servicio competidor, los segundos de apertura de navegación igualan las duraciones de pasada sumadas del propio predictor. No se reivindica ninguna referencia independiente externa y no existe ninguna: la capacidad sustituye el cálculo manual en lugar de contrastarse con él, el plan de contactos incluido es ilustrativo y no de vuelo, y ningún planificador operativo publica un par plan-más-respuesta con su regla de arbitraje indicada; un ciclo de trabajo calculado bajo una política no indicada no es comparable con uno calculado bajo una indicada, y la dependencia de la política se mide (ciclos de trabajo de navegación de 100/150 frente a 50/150 sobre el plan idéntico). El tiempo de reorientación y de cambio, el volumen de datos, el estado del búfer, la energía y el cierre del enlace se excluyen en la etiqueta del informe en lugar de modelarse en silencio

# text
seg-43cd7aa7ab53 = Interferencia de RF en la navegación de superficie lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Relación interferente-señal nativa lunar, C/N₀ efectiva y pérdida de enganche para un usuario selenográfico de superficie bajo un interferente de superficie lunar (o elevado), sobre la constelación ilustrativa de clase Moonlight/LCNS de fuentes públicas. Compone la cadena abierta de interferencia (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) con la geometría abierta del cielo lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no se rederiva ninguna geometría ni radiometría. A diferencia del tipo de escenario terrestre <c1/>, el tramo de señal no es una potencia recibida fija: la potencia recibida isótropa de cada satélite es su propio EIRP del presupuesto de enlace − FSPL(distancia oblicua), de modo que J/S varía de un satélite a otro con la distancia y la elevación lunares. Emite UNA FILA POR ENLACE VISIBLE (época, satélite) como JSON y como artefacto *.table.csv, con las dos potencias recibidas cuya diferencia es J/S impresas junto a ella; las cifras de mérito agregadas se sitúan junto a esa tabla, nunca en su lugar. Ejecutable como el tipo de escenario <c2/>

# text
seg-2a4393ae7c52 = Contraste de composición frente a una vía de código independiente del propio repositorio: cada J/S por enlace se rederiva como la diferencia de dos presupuestos de enlace calculados con linkbudget::received_signal_power_dbw, cuya pérdida en espacio libre es la expresión única { "20" }·log10(4πRf/c) en lugar de la suma de tres términos que usa jamming::free_space_path_loss_db: ambas coinciden a < { "1e-9" } dB en cada fila (peor caso medido { "7.11e-14" } dB, es decir, redondeo de coma flotante). La cadena de interferencia subyacente que compone está anclada externamente por separado en tests/gnss_denied_jamming_resilience_reference.rs (rederivación independiente con numpy/scipy de J/S y de C/N₀ efectiva fijada a Kaplan & Hegarty §{ "9.4" }, más el C/N₀ medido de JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); la geometría lunar que compone es la geometría lunar_service/lunar con sus propias referencias independientes. Identidades en forma cerrada comprobadas aquí: reducir a la mitad la distancia del interferente suma exactamente { "20" }·log10({ "2" }) dB a cada fila; J/S es exactamente invariante a la ganancia en el eje de la antena del usuario mientras que C/N₀ se mueve exactamente esa ganancia; una máscara de elevación no cambia ninguna fila superviviente bit a bit. La fila en sí se mantiene ReferenceImpl/modelada: no existe ninguna campaña medida de interferencia lunar con la que validar, y la constelación es una geometría ilustrativa de clase Moonlight/LCNS de fuentes públicas, no unas efemérides de vuelo

# text
seg-4c116e25c5c5 = Contorno de denegación lunar con una banda de incertidumbre a partir de la dispersión medida de C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = El informe <c1/> ya no apoya su contorno de denegación en un único escalar. Emite la distribución completa medida de C/N₀ de la señal deseada sobre la tabla por satélite (n, mín., p05, p25, mediana, p75, p95, máx., media, desviación típica muestral y la propia asimetría de la muestra (p95 − mediana) − (mediana − p05)) junto a las filas por enlace, que no cambian. El contorno se informa entonces en cada uno de esos estadísticos de orden bajo AMBOS criterios de denegación que reconoce el motor, nunca uno en lugar del otro: el criterio vigente de relación de potencias (J/S = { "30" } dB, el mismo umbral que usan attack_surface y tracking_loop, y el criterio tras la columna <c2/> de la tabla publicada de interferencia de enlaces lunares), y el criterio de pérdida de enganche (la C/N₀ efectiva que cae hasta tracking_threshold_dbhz), que es el criterio con el que se puntúa la propia columna links[].status de este informe. Cada punto del contorno se da en ambos ejes del plano de denegación (el EIRP del interferente necesario a la distancia del escenario, y la distancia de denegación al EIRP del escenario), de modo que la banda es un intervalo sobre los mismos ejes en que se dibuja un gráfico de contorno. Los bordes de la banda SON contour(p05) y contour(p95): la misma aplicación en forma cerrada aplicada a los propios cuantiles de la muestra, no un sigma ajustado a la muestra ni la mediana ± k·desviación típica, y el informe lo indica en una cadena band_definition junto a las cifras. stdev se emite por continuidad y no lo usa nada. Un cuantil cuya C/N₀ ya está en el umbral de seguimiento o por debajo no tiene J/S denegante finita; esas columnas se emiten como null con una razón contada en lugar de como un infinito o un radio limitado

# text
seg-f7457156f960 = Coherencia interna frente a las propias funciones directas del motor, que es todo lo que esta capacidad puede afirmar con honestidad. Cada punto del contorno es una inversión en forma cerrada, y cada inversión se comprueba devolviendo su respuesta por la función DIRECTA con la que se puntuaron las propias filas del informe: la columna J/S mediante jamming::effective_cn0_dbhz (que debe devolver tracking_threshold_dbhz a < { "1e-9" } dB-Hz), la columna de distancia mediante jamming::free_space_path_loss_db y jamming::j_over_s_db (el mismo J/S a < { "1e-9" } dB), la columna de EIRP mediante jamming::j_over_s_db a la distancia propia del escenario. Se comprueba además que el contorno es la FRONTERA del conjunto de denegación y no un punto interior: lock_status pierde el enganche con una desigualdad estricta, de modo que se mide que el veredicto pasa de DEGRADED a LOST dentro de { "1e-4" } dB de J/S a cada lado del contorno, lo que un contorno desplazado un épsilon no superaría. La comprobación más fuerte es por enlace y no por cuantil: aplicar la misma aplicación a la propia C/N₀ de cada fila reproduce exactamente la columna de estado del informe: { "0" } discrepancias en { "38" } de { "38" } filas en el punto de operación documentado (tipo de escenario = lunar-jamming, cada entrada por defecto excepto jammer.range_m = { "25 000" } m), donde { "26" } filas son LOST y { "12" } no lo son. La monotonía se mide, no se supone: { "20 001" } muestras en [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violaciones de una distancia estrictamente decreciente y una potencia necesaria estrictamente creciente, de modo que el orden de cuantiles de la banda se demuestra y no se afirma. ExternalDataset se descarta y con él la validación: no existe ninguna campaña medida de interferencia lunar con la que comparar un radio de denegación, la constelación es una geometría ilustrativa de clase Moonlight/LCNS de fuentes públicas y no unas efemérides de vuelo, y las entradas del contorno (EIRP, potencia del interferente, ganancias de antena, temperatura de ruido) son magnitudes representativas. También se consideró y se descartó ReferenceImpl: la inversa y la expresión directa son la MISMA álgebra leída en dos sentidos, de modo que el viaje de ida y vuelta detecta errores de transcripción y de signo pero no es una implementación independiente; llamarlo contraste sería la jugada de independencia prestada que los invariantes de la matriz existen para evitar. Lo que aporta la banda se mide y se cita en lugar de afirmarse: en ese punto de operación el contorno de un solo escalar es { "27.402916" } km y deja { "25" } km del lado denegado para las { "38" } filas, mientras que la banda { "21.256108" } .. { "29.921360" } km contiene el punto de operación y por tanto informa de la división que la tabla muestra realmente. También se mide que los dos criterios discrepan: la banda de relación de potencias ({ "38.186527" } .. { "53.691675" } km) no contiene { "25" } km en absoluto, razón por la que se imprimen ambos

# text
seg-2d3944107ba0 = Potencia de detección del monitor de integridad intermodal

# text
seg-38bc7c0bfe57 = El informe hybrid-optical-rf indica lo que el monitor chi cuadrado intermodal puede DETECTAR realmente, y no solo que pasa un caso sin fallos: el sesgo mínimo detectable por eje monitorizado (este, norte, arriba, reloj) con las probabilidades de falsa alarma y de detección omitida indicadas del escenario, la curva de potencia de detección a cada lado de él, el múltiplo de sesgo sin ruido en el que el estadístico realizado cruza por primera vez el umbral y el tiempo hasta la detección de una rampa de sesgo a una tasa indicada. También se inyectan fallos a través del monitor real y el estadístico que devuelve se informa junto a la predicción analítica

# text
seg-b6b8dec4dcff = Dos referencias independientes internas, sin conjunto de datos externo. ({ "1" }) Viaje de ida y vuelta en forma cerrada: el sesgo mínimo detectable se produce invirtiendo la cola del chi cuadrado no central sobre el parámetro de no centralidad (raim::pbias) y se verifica devolviendo el parámetro de no centralidad resultante por raim::noncentral_chi2_cdf en el umbral propio del monitor, que debe devolver P_md. ({ "2" }) Inyección frente a análisis: se escribe un sesgo en la estimación de RF de un eje y se vuelve a ejecutar cross_raim::run_cross_raim, de modo que el estadístico comparado con el parámetro de no centralidad analítico es el que calculó el monitor, no una rederivación. Un Monte Carlo con semilla del propio estadístico se lleva en las pruebas como tercera comprobación; deliberadamente NO está en el informe, porque una estimación muestreada sería más lenta y no reproducible bit a bit. ExternalDataset se descarta: la magnitud es la potencia de detección de ESTE monitor con la asignación de sigma de ESTE escenario, y las magnitudes de sigma por las que se escala el MDB son entradas representativas modeladas, no mediciones. También se consideró y se descartó ReferenceImpl: el Monte Carlo muestrea el mismo estadístico que describe el análisis, de modo que detecta errores de transcripción y de coeficientes pero no es una implementación independiente del monitor. { "0.30" } ronda { "2" } (preregistrada 0135a9e4), bloqueada (se mantiene MODELLED): chi2/ncx2/brentq de SciPy { "1.18.1" } reproducen el umbral del informe (dentro de { "5.4e-12" }), el MDB por eje, la curva de potencia, el múltiplo de cruce y el tiempo hasta la detección de la rampa (dentro de { "5.3e-10" }) en cinco configuraciones; los estadísticos de fallos inyectados no tienen referencia independiente y las magnitudes de sigma son entradas modeladas, por lo que el alcance espera una decisión del responsable

# text
seg-38cabd4921c1 = Recrecimiento de la covarianza tras el traspaso frente al límite de alerta

# text
seg-9287268bbada = El informe hybrid-optical-rf expone el modelo de ruido de proceso del filtro e indica cuánto tiempo permanece la solución posterior al traspaso dentro del límite de alerta: para ambos sentidos de traspaso lleva la covarianza por eje que dejó el traspaso, la propaga hacia delante bajo un ruido de proceso de paseo aleatorio indicado, e informa del instante en que el 1σ escalado por cobertura alcanza los límites de alerta horizontal, vertical y de temporización, de qué límite actúa primero, de la constante de tiempo de duplicación de la varianza y de un perfil de deriva muestreado que acota el cruce. Las PSD de ruido de proceso, el factor de cobertura y los límites de alerta son entradas con valores por defecto documentados

# text
seg-c85b822227f3 = Sin referencia independiente externa. El cruce es una solución en forma cerrada del crecimiento de la varianza de paseo aleatorio, y las pruebas lo recalculan de forma independiente a partir de los valores que publica el propio informe y no de los elementos internos del emisor. La covarianza inicial se fija bit a bit a la traza que el bloque de traspaso existente ya informaba, de modo que la deriva no puede propagar una covarianza que nadie más vio. Las PSD de ruido de proceso son entradas representativas MODELLED y los tiempos de cruce escalan directamente con ellas, lo que la prueba de escalado enuncia como propiedad medida y no como afirmación. ExternalDataset se descarta deliberadamente: el tiempo de deriva es una función directa de dos PSD modeladas y de límites de alerta que son a su vez representativos, y no existe ninguna deriva medida de traspaso óptico/RF lunar con la que comparar. Una referencia independiente externa aquí necesitaría una curva publicada de crecimiento de covarianza posterior al traspaso o de exactitud de holdover para un receptor comparable con su modelo de ruido de proceso indicado, comprobada con una tolerancia

# text
seg-a3b8272862aa = Patrón de antena fuera del eje en la exportación de geometría lunar

# text
seg-27d246503a48 = La exportación de geometría por satélite lleva, por (época, satélite), el ángulo fuera del eje EN EL SATÉLITE y la ganancia de transmisión hacia el emplazamiento a partir del patrón real de apertura circular de iluminación uniforme (Airy), e informa del recuento en haz bajo ese patrón JUNTO AL recuento en haz bajo la aproximación simétrica de ganancia a ancho de haz (θ_3dB[grados] = √(31000/G_lin)), con la diferencia emitida como corrección explícita en enlaces, en satélites por época y como la peor época individual. Se emiten ambas eficiencias de apertura implícitas de la aproximación ({ "0.641" } frente a la regla de { "70" }·λ/D grados con la que se cita, { "0.920" } frente a una apertura circular uniforme), de modo que la eficiencia que supone en silencio se indica en lugar de inferirse. Desactivada por defecto: el bloque aparece solo cuando se dan a la vez un emplazamiento de exportación y una apertura

# text
seg-f7f79e2dd6c5 = Mixto, y separado en lugar de agrupado. El PATRÓN subyacente está validado externamente y conserva su propia fila (un fixture de scipy.special.j1 a < { "0.05" } dB en tests/validate_p1_orbital_footprint.rs, más aquí la abscisa de media potencia de Airy publicada x = { "1.61634" } localizada por bisección en lugar de supuesta). La GEOMETRÍA se comprueba frente a trigonometría de triángulos en forma cerrada escrita como una expresión distinta del producto escalar sometido a prueba. La CONTENCIÓN del haz real por el cono aproximado es álgebra derivada (28.019/√η frente a { "29.479" } grados por λ/D), de modo que la corrección solo puede ser no positiva para η ≤ { "0.9035" }. Pero los RECUENTOS en haz en sí no tienen referencia independiente externa: ninguna tabla publicada da cuántos satélites de una capa de clase Moonlight/LCNS mantienen un emplazamiento del polo sur dentro del haz de media potencia de un plato dado, y la constelación es una aproximación ilustrativa de fuentes públicas, no unas efemérides de vuelo. La discrepancia medida en el punto de trabajo documentado ({ "0" } enlaces en haz bajo el patrón real frente a { "28" } bajo la aproximación, −{ "2.33" } satélites por época, peor época { "3" }, sobre { "76" } enlaces evaluados) es por tanto un hallazgo MODELLED sobre la aproximación, fijado como literal de regresión (la fila más cercana está a { "0.069" }° de cualquiera de los bordes del haz, cuatro órdenes de magnitud por encima de cualquier discrepancia del último dígito), no una cifra de cobertura validada externamente. Etiquetar la fila como ExternalDataset sobre la base del propio anclaje externo del patrón sería validación prestada, que es la jugada que los invariantes de la matriz existen para evitar. { "0.30" } ronda { "2" } (preregistrada d9755d28), bloqueada (se mantiene MODELLED): la geometría de SPICE y las funciones de Bessel de SciPy reproducen el ángulo fuera del eje (peor caso { "3.0e-5" } grados), la ganancia de Airy y los indicadores en haz en { "6 336" } filas de estados de orbitadores en vuelo y el punto de trabajo documentado; pero en geometría de vuelo los indicadores se dividen por identidad de satélite (el enlace más cercano está a { "1.66" } grados del borde del haz), la visibilidad de { "5" } grados se comprueba como indicador y no como elevación numérica, el indicador de la aproximación simétrica aplica la regla empírica de 31000/G a un ángulo validado sin validar la regla, y las eficiencias implícitas no tienen referencia independiente; el alcance espera una decisión del responsable

# text
seg-6fbfa234ef3e = Pérdida de enganche del lazo de seguimiento y arrastre de falsificación bajo interferencia

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Pérdida de enganche calculada a partir de la dinámica del lazo en lugar de una relación de potencias: fluctuación térmica 1σ de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N₀ con la pérdida por elevación al cuadrado, frente a las reglas indicadas 3σ_PLL + θ_e ≤ { "45" }° y 3σ_DLL + retardo de rampa ≤ d/2 chips; umbrales de C/N₀ de caída y de reenganche con el lazo determinante nombrado y la histéresis DERIVADA del mayor ancho de banda de arrastre en lugar de afirmada; el tiempo declarado hasta perder el enganche de un detector de enganche de dos umbrales con permanencias de confirmación, informado por separado del tiempo físico de escape de fase (tiempo medio de Viterbi entre saltos de ciclo, en log₁₀ s porque abarca cientos de décadas); la mayor deriva de código y tasa de Doppler de portadora que pueden seguir los lazos de la víctima; y el RADIO DE DENEGACIÓN que implica la dinámica del lazo, informado junto al radio de relación de potencias existente con su diferencia con signo como campo propio con nombre. Ejecutable como el tipo de escenario <c1/>

# text
seg-c3794c8d85c5 = El propio correlador sdr del motor (sdr::correlate / synth_if / CaCode) avanzado sobre IF sintética con semilla a una C/N₀ calibrada: una vía de código separada que llega a las mismas cifras por correlación numérica de IQ muestreada y no mediante una expresión algebraica de la fluctuación, de modo que es una ruta distinta y no un replanteamiento, más valores tabulados estándar de la Bessel modificada I₀ para el término de salto de ciclo. Teoría de lazos según Kaplan & Hegarty cap. { "8" } y Viterbi/Gardner para el tiempo de salto. La fila se mantiene ReferenceImpl/MODELLED: el contraste vive en esta misma base de código, y la comprobación de bessel_i0 valida una función especial y no el modelo de seguimiento, de modo que promover la fila sobre esa base sería un etiquetado interesado. ExternalDataset necesitaría un conjunto de datos de IF cruda grabada con C/N₀ de verdad conocida y un instante de pérdida de enganche anotado (clase TEXBAT/OAKBAT); ninguno se incluye en este árbol, e incluso con el IQ esos conjuntos de datos no publican verdad del estado del lazo por época, de modo que un tiempo declarado de pérdida de enganche solo podría validarse frente al detector de enganche de algún otro receptor, que es una elección modelada y no una referencia independiente. Los anchos de banda de lazo, el tiempo de integración, el espaciado del correlador, la razón de arrastre, las permanencias, la potencia del interferente y las ganancias de antena son cifras representativas de banda, no una hoja de datos. { "0.30" } ronda { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, ejecutado como programa) sobre IF generada de forma independiente (preregistrado 6ef7698c, enmiendas al método de medición divulgadas), un hallazgo (se mantiene MODELLED): la fluctuación del PLL y del DLL en lazo cerrado coincide dentro del { "8" } % a { "35" } a { "45" } dB-Hz, el esfuerzo dinámico de { "10" } Hz/s dentro del { "1" } % y el retardo de rampa de código de primer orden dentro del { "2" } %; a { "30" } dB-Hz la fluctuación del PLL es un { "21" } % mayor y la del DLL un { "32" } % menor, los umbrales medidos de la regla de 15 grados quedan { "1.5" } dB por encima del motor, y el lazo de segundo orden salta de { "0.5" } a { "2" } décadas más a menudo que la cota de tiempo de salto de primer orden. { "0.30" } revisión: el tiempo de salto de Costas usa ahora la SNR de lazo rho/4 (saltos de medio ciclo); el valor por defecto de jitter_table log10_mean_time_to_cycle_slip_s baja de { "11.58" } a { "2.10" } en el umbral de { "25.47" } dB-Hz

# text
seg-69155fb79ebd = Covarianza de coordenadas de estaciones de VLBI lunar a partir de un plan de seguimiento

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Parciales de retardo acumulados sobre un plan de líneas base × épocas en una matriz de información de Fisher, invertida a la covarianza de coordenadas de estación y al sigma de estación por coordenada, que sustituye un enlace supuesto de equipartición isótropa a partir de una precisión escalar de retardo. El estado lleva coordenadas de estación fijas a la Tierra (ITRS), de modo que el jacobiano es el parcial inercial rotado por la matriz GCRS→ITRS de cada época y la rotación terrestre es lo que hace observables esas coordenadas: el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. En cada ejecución se emiten el rango, el defecto de datum, el número de condición, el espectro de información y el espacio nulo de la red libre, y bajo una deficiencia de rango el sigma principal se publica como NULL con un estado en lugar de leerse de una inversa casi singular. El valor de equipartición c·σ_τ·√(g/N) para el MISMO plan se imprime junto al calculado con su razón, junto con la cota de traza isótropa √(p/trace(M)) que AM-HM convierte en un suelo estricto. Ejecutable como el tipo de escenario <c1/>

# text
seg-b259d4d18f42 = Una vía independiente dentro del repositorio. Cada fila del jacobiano se rederiva por diferencia finita central de lunar_vlbi::vlbi_delay_s evaluada a partir de las propias coordenadas fijas a la Tierra y fijas al cuerpo lunar del estado, rotadas hacia delante por la cadena de marcos: una ruta que no calcula ninguna derivada y no comparte ninguna expresión con los parciales analíticos, y las matrices de información que construyen las dos vías coinciden a < { "1e-6" } de la mayor diagonal. El núcleo de álgebra lineal que esto compone (information_matrix, crlb, sym_eig) está anclado externamente por separado frente a numpy.linalg.eigh / numpy.linalg.inv en tests/fim_observability_reference.rs, y el observable de retardo lleva la propia referencia independiente de campo lejano de delta-DOR de lunar_vlbi; la fila no toma prestado ninguno de esos estados. Identidades en forma cerrada comprobadas aquí y etiquetadas como tales: el escalado de σ² y 1/N, y √(p/trace(M)) como cota inferior AM-HM que el sigma calculado no puede mejorar, que coincide con el valor de equipartición solo en una geometría isótropa, razón por la que la razón medida es exactamente la anisotropía que descartaba el supuesto. { "0.30" } comparación externa (Biblioteca: NAIF SPICE CSPICE N0067 mediante spiceypy { "8.2.0" }, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), preregistrada ({ "50863551" }) junto con una ejecución de sensibilidad al error de modelo del lado del motor: cada fila del jacobiano se reconstruye por diferencias centrales de diferencias de tiempo de luz newtonianas convergidas a partir de la geometría de SPICE (la ecuación del tiempo de luz es un guion breve sobre posiciones de SPICE; SPICE aporta la geometría), con el plan reconstruido a partir de elevaciones de SPICE. El plan, el rango, el defecto, el espectro de información, el número de condición, los sigmas de estación, el valor principal, la cota de traza, las razones de equipartición, el espacio nulo de la red libre, el barrido de línea de visión y la declinación de la baliza coinciden dentro de { "1" } % / { "0.1" } grados preregistrados, que queda por encima del error analítico conocido de la Luna del motor ({ "3.2e-3" } en sigmas, medido antes de la ejecución). NumPy { "2.3.5" } rehace el álgebra lineal sobre el jacobiano confirmado del motor hasta { "2e-13" } (P2). Validada como cota de Cramér-Rao para el conjunto reducido de parámetros indicado sobre las entradas ilustrativas indicadas: las efemérides del centro de la Luna, los relojes, la troposfera y los parámetros de orientación terrestre se mantienen fijos en ambos tramos, por lo que no es una exactitud de campaña real

# text
seg-0f4d023fe2d4 = Covarianza de coordenadas de un punto de la superficie lunar a partir de un plan de retardos de VLBI, distinta de la de la estación terrestre

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Una tercera opción de datum, <c1/>, que mantiene fijas todas las estaciones terrestres y estima solo las coordenadas fijas al cuerpo lunar de la BALIZA: la configuración para la que realmente se cita la incertidumbre de un punto de la superficie lunar, ya que las coordenadas de las estaciones terrestres son una entrada del modelo de retardo y no una incógnita suya. Existe porque la covarianza a nivel de estación y la covarianza del punto de superficie son MAGNITUDES DISTINTAS separadas por el brazo de palanca ρ/B, y nada impedía antes citar una frente a la otra. El bloque <c2/> emitido lleva ρ, la línea base más larga, el brazo de palanca, la forma de punto de superficie del enlace de equipartición c·σ_τ·(ρ/B)·√(g/N), el sigma de baliza por coordenada calculado y su razón, siendo la razón null en lugar de engañosa siempre que la baliza no se estima o la matriz es de rango deficiente. B se toma como la línea base MÁS LARGA presente, la más favorable, de modo que la razón solo puede subestimar. Ejecutable como <c3/> con <c4/>, que se rechaza con un mensaje que nombra la entrada que falta cuando la baliza no se estima

# text
seg-18096ae23d96 = Identidades en forma cerrada, sin referencia independiente externa reivindicada ni disponible. El brazo de palanca se comprueba frente a ρ/B y las dos formas de equipartición entre sí hasta { "1e-15" }: identidades algebraicas, de modo que detectan un error de cableado y nada más, y se etiquetan como tales. El resultado sustantivo se MIDE en lugar de afirmarse: un retardo de una línea base fija restringe la DIRECCIÓN de la baliza, de modo que la componente de línea de visión llega a la matriz de información solo a través del término de distancia de campo cercano, y la prueba lee la anisotropía resultante del espectro emitido en lugar de derivarla. AM-HM convierte √(p/trace(M)) en un suelo estricto, de modo que un enlace de equipartición isótropa solo puede SUBESTIMAR, y la razón entre lo calculado y la equipartición es exactamente la anisotropía que descartó. MEDIDO en el par de tipo Goldstone/tipo Canberra cuya cuerda es { "10726.748" } km: en { "112" } días muestreados, { "36" } no admiten ninguna época mutuamente visible con una máscara de { "10" }°, lo máximo que se ve mutuamente es { "17" } de un plan de 49 muestras, y en los { "73" } días viables la razón de tres componentes va de { "113.9" }× a cuatro órdenes de magnitud más, mediana { "1513" }×, mientras que restringirse a las dos direcciones transversales que la línea de visión no deja sin información da { "3.94" }× a { "25.8" }×, mediana { "7.8" }×. LO QUE ESTA FILA NO AFIRMA: ninguna de esas cifras como propiedad de una campaña real. Establece que la magnitud del punto de superficie se CALCULA ahora en lugar de suponerse, y que no puede intercambiarse en silencio con la del nivel de estación. Se mantiene ReferenceImpl/MODELLED: no existe ninguna covarianza publicada de un punto de superficie de VLBI lunar con la que validar, las estaciones y el emplazamiento de la baliza son ilustrativos y no están levantados topográficamente, y las efemérides, los relojes, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que es una cota de Cramér-Rao para un conjunto reducido de parámetros y optimista por sí misma. La misma magnitud en la vía de núcleo (baliza sobre la Luna DE440) está validada en su propia fila, "…, vía de núcleo"; en esta vía analítica el menor sigma de baliza queda un { "3.9" } % por debajo de la referencia independiente de SPICE de esa fila, razón por la que esta fila se mantiene MODELLED

# text
seg-8958521eedf7 = Covarianza de coordenadas de un punto de la superficie lunar a partir de un plan de retardos de VLBI, vía de núcleo

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = La covarianza de baliza con todas las estaciones fijas del escenario lunar-vlbi-fim (todas las estaciones terrestres fijas, solo se estiman las coordenadas fijas al cuerpo lunar de la baliza) con la baliza situada sobre la Luna DE440 de JPL leída por el propio lector de núcleos del motor (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Solo el centro de la Luna difiere de la vía analítica; la rotación del cuerpo IAU { "2015" }, las estaciones, la rotación terrestre y el álgebra lineal son los mismos. Las salidas validadas son el conjunto de observaciones, el espectro de información de { "3" } x { "3" }, el rango y el número de condición, los tres sigmas de baliza fijos al cuerpo y su RMS, el brazo de palanca y la razón entre lo calculado y la equipartición, en el plan por defecto. Ejecutable como el escenario <c1/> con datum = "all-stations-fixed", estimate_beacon = true y planetary_kernel_path definido

# text
seg-63250578ec6b = Tramo vinculante de biblioteca: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) sobre de440s, earth_latest_high_prec (ITRF93 con UT1 y movimiento polar) y los marcos lunares DE440, con la baliza fija en MOON_ME; cada fila del jacobiano es una diferencia central de { "3" } km de la diferencia de tiempo de luz newtoniana convergida (el propio código de tiempo de luz de la referencia independiente M069, importado), nunca un parcial de Kshana; visibilidad reconstruida a partir de elevaciones WGS-84; eigh e inv de NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK). Tramo P2: NumPy sobre el jacobiano confirmado del motor. Preregistrado (4a51256) antes de que existieran el fixture o la referencia independiente, con umbrales de { "1" } % en autovalores, condición, sigmas, RMS y razón, { "1e-4" } en el brazo de palanca, conjunto de observaciones y rango exactos; P2 { "1e-9" }. Divulgado: la comparación solo del motor entre la Luna analítica y la de núcleo ({ "3.9" } % en el sigma y) se ejecutó antes del preregistro, para elegir la vía de núcleo, y se indica allí. Resultado: ambos tramos coinciden, peor caso { "1.7e-3" } (sigma y de baliza { "0.081211" } m frente a { "0.081351" } m). Mutación: transponer la rotación del cuerpo del parcial de la baliza hace fallar ambos tramos. Ambos lados leen DE440, de modo que la coincidencia valida la geometría y el álgebra lineal sobre DE440, no DE440. Fuera de la afirmación: la exactitud de punto de superficie de una campaña real (relojes, troposfera y orientación terrestre fijos; estaciones y emplazamiento de baliza ilustrativos), y la vía analítica por defecto (fila anterior, que se mantiene MODELLED: sobre la Luna analítica el sigma y queda un { "3.9" } % por debajo de esta referencia independiente)

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
seg-478225d0a8e1 = Núcleo de niveles de protección ARAIM lunar

# text
seg-863690a44f21 = El paso de geometría a covarianza del nivel de protección lunar, (GᵀG)⁻¹ sobre toda la geometría en vista y cada subgeometría de fallo único, proyectada sobre la vertical local y la traza del bloque horizontal, y su núcleo estadístico: el multiplicador de detector de Bonferroni, la cola superior gaussiana de cada hipótesis de fallo y la resolución de raíces que asigna un presupuesto de riesgo de integridad a un nivel de protección, sobre un volumen de servicio lunar de 7 puntos

# text
seg-8191906fc700 = Dos implementaciones establecidas de terceros compuestas, ambas ejecutadas sin conexión, con el fixture regenerado de extremo a extremo y verificado idéntico byte a byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilado desde código fuente C con -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() invierte la matriz normal mediante LU de Crout con pivoteo parcial, un algoritmo sin relación con invert4() de Gauss-Jordan escrito a mano de kshana; numpy.linalg.inv (getrf/getri de LAPACK) vuelve a invertir cada una como tercera inversa independiente, coincidiendo con RTKLIB hasta { "1.112e-12" } relativo. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) aportan norm.isf, norm.sf (ndtri/ndtr de Cephes) y optimize.brentq frente a la serie de gamma incompleta de Numerical Recipes de kshana, su inversa por bisección y su bisección de 200 pasos; y el sf directo de SciPy es una ruta numérica distinta hacia la cola lejana que la { "1" } − Φ de kshana, de modo que la cancelación en la cola profunda se mide y no se replica. El eje vertical es el vector unitario radial (la definición de vertical local en una Luna esférica) y la varianza horizontal es la traza del bloque horizontal, por lo que no se comparte ninguna convención de acimut Este/Norte. EXPLÍCITAMENTE NO VALIDATED POR ESTA FILA: σ_URE, el prior de fallo por satélite y la constelación ilustrativa de clase Moonlight/LCNS son entradas MODELLED entregadas tal cual a la referencia independiente; y la FORMA de la ecuación de integridad MHSS de fallo único está transcrita de la misma cota publicada que implementa kshana: una forma cerrada compartida es un supuesto compartido, de modo que esta fila cubre una evaluación errónea de esa ecuación, no una elección errónea de ella. No hay ninguna implementación MHSS ARAIM de terceros al alcance (RTKLIB no expone ningún punto de entrada de nivel de protección, no existe ninguna distribución de PyPI de ese tipo, Stanford MAAST es MATLAB), que es la mejora pendiente

# text
seg-0ec1699f5754 = Niveles de protección ARAIM MHSS frente a vectores de referencia publicados

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = La propia ecuación del nivel de protección de separación de soluciones con hipótesis múltiples: mínimos cuadrados ponderados con toda la geometría en vista y por modo de fallo en una geometría Este/Norte/Arriba con un estado de reloj por constelación, los sigmas de subsolución, los sigmas de separación de soluciones y las proyecciones unilaterales de sesgo nominal, los umbrales K_fa de Bonferroni, la asignación de riesgo de fallos no monitorizados y los VPL/HPL que resuelven la ecuación de riesgo de integridad. Ejecutable como el tipo de escenario <c1/>

# text
seg-483b91a7aace = Grupo de Trabajo C UE-EE. UU., Subgrupo Técnico de ARAIM, Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junio de { "2019" }), ejemplo numérico resuelto del Apéndice D: ENTRADAS publicadas (matriz de geometría de 10 satélites y 2 constelaciones, diagonales C_int/C_acc, b_nom, P_sat, P_const, constantes de LPV-200) y SALIDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } y seis intermedios de fallo de constelación), obtenido el 2026-09-20, SHA-256 de la fuente 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Coincide con la tolerancia indicada PROPIA de la referencia TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT y σ_v_acc con su precisión impresa. El Milestone { "3" } Report ({ "2016" }) del mismo subgrupo, Anexo A §A.IX, enuncia el mismo ejemplo pero es internamente incoherente: una errata de signo en la fila { "3" } de G (+{ "0.7477" } donde el documento de { "2019" } imprime −{ "0.7477" }; con el más, el propio σ_v_acc del documento resulta { "0.8690" } m frente a su { "1.47" } m publicado), y un K_fa_3 evaluado con { "57" } modos de fallo mientras el documento indica N_fault_max = { "1" }, es decir, { "12" }, de modo que su EMT sigue el umbral de 57 modos y su VPL/HPL no. Ninguna implementación que se ajuste a la norma puede reproducir todas sus salidas a la vez. Sus intermedios de geometría se reproducen exactamente y sus niveles de protección se registran como discrepancias medidas (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), excluidas de la cifra de aceptación; la tolerancia no se amplió para absorberlas. ALCANCE: solo N_fault_max = { "1" }: los subconjuntos de fallos de varios eventos se rechazan en lugar de truncarse, y la exclusión, la comprobación de consistencia chi cuadrado y el paso de reasignación por doble recuento se mantienen MODELLED

# text
seg-7bfcb5c6a985 = ARAIM con hipótesis de fallo simultáneo de varios satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: la regla de determinación de subconjuntos de ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorizados con menos eliminados primero) generalizada de pares a combinaciones simultáneas de hasta max_order eventos de satélite y de constelación, con el prior exacto P_no fault prod q_e; add_v42_protection_levels_to_order ejecuta sobre él la vía de nivel de protección de ADD v4.2 (el orden { "2" } es exactamente la vía existente). raim::araim_subset_raim (opcional): RAIM avanzado sobre ese conjunto de hipótesis, cada subconjunto monitorizado como un modo (p_fault, T, b, sigma) en la suma de riesgo de integridad, subconjuntos inobservables trasladados al riesgo no monitorizado, el presupuesto escalado por la asignación de ADD del riesgo no monitorizado, e informando del subconjunto de mayor separación normalizada cuando se detecta un fallo. Los priors que necesitan subconjuntos más profundos que max_order se rechazan, nunca se truncan

# text
seg-6c6076ea1eee = Coherencia interna (InternalConsistency): la reducción de orden 2 a la vía ADD v4.2 comprobada con MAAST, la rederivación independiente de los priors y un fallo construido de dos satélites. No se ha hecho ninguna ejecución de MAAST ni de RTKLIB más allá de pares, de modo que los conjuntos de hipótesis más profundos y los niveles de protección del RAIM por subconjuntos no están comprobados externamente. araim_subset_raim comparte las simplificaciones de araim_dual_raim (un sigma para integridad y exactitud, un reloj, la cola normal simple): no se ajusta a la norma ADD

# text
seg-48ca01332f8f = RAIM junto a las cifras de mérito de holdover del reloj

# text
seg-890f1006a75d = La sección opcional [integrity] del tipo de escenario clock (clock_integrity::run): a partir de un emplazamiento indicado y de preajustes de constelación (geometry::sky_geometry), en cada época de integridad mientras la línea de tiempo de GNSS no está denegada, RAIM instantáneo (raim::snapshot_raim: prueba chi cuadrado de paridad, niveles de protección por pendiente) sobre los satélites por encima de la máscara con residuos gaussianos con semilla del sigma indicado y un sesgo indicado opcional; un bloque integrity_fom separado con veredictos por época, niveles de protección y disponibilidad. Las épocas denegadas se informan como no disponibles, nunca extrapoladas; las cifras de mérito de holdover no cambian y, sin la sección, la salida es idéntica byte a byte

# text
seg-c2860bf4b562 = Coherencia interna (InternalConsistency): los niveles de protección son los de snapshot_raim, que se valida frente a RTKLIB en su propia fila, recalculados sobre la misma geometría; comportamiento sin fallos y con fallos inyectados. El cielo es una geometría de preajuste representativa (no un almanaque con fecha), los residuos son sintéticos y sigma, los límites de alerta y las probabilidades son entradas indicadas; nada de esto es una afirmación sobre la disponibilidad de un receptor real

# text
seg-9cbb4ee7588a = Observabilidad cislunar por longitud de arco espacial, con ruido y de varias familias

# text
seg-5ebd771deef8 = El umbral de observabilidad cislunar por longitud de arco en el CR3BP ESPACIAL de seis estados en lugar del plano de cuatro estados, en las familias DRO, halo L2 y halo casi rectilíneo L2, con ruido de medición que entra en el gramiano y DOS criterios informados porque no hay uno único honesto: el criterio de rango publicado, que es demostrablemente invariante a un sigma de medición homocedástico (el blanqueo multiplica la matriz de observabilidad por un escalar, dejando sin cambios el espectro relativo de valores singulares y por tanto el rango, el defecto y la condición), y un criterio de estimabilidad (el primer arco en el que la incertidumbre formal 1σ de posición del estado inicial del jefe cae por debajo de una cota indicada), que es el que sí se mueve con el ruido. Cada umbral lleva el intervalo de la cuadrícula de épocas en el que se sitúa; un criterio no alcanzado es null con una razón. El modo plano sigue siendo el predeterminado y las familias fuera del plano se rechazan allí en lugar de aplanarse en un estado que no puede representarlas

# text
seg-046231819882 = Un rango independiente por forma escalonada por filas mediante eliminación gaussiana con pivoteo parcial confirma cada veredicto de rango de seis estados: un algoritmo distinto que no comparte código con la vía de autovalores/SVD sometida a prueba. La matriz de transición de estado del CR3BP de { "6" }×{ "6" } que esto compone lleva su propia referencia independiente ReferenceImpl frente a la integración variacional de SciPy, y las condiciones iniciales de halo/NRHO proceden de un corrector que reproduce la órbita Gateway L2 sur { "9" }:{ "2" } publicada. El tramo existente del filtro de información en raíz cuadrada NO se cuenta explícitamente como corroboración: consume los mismos jacobianos y se reduce a la misma matriz normal, de modo que es una comprobación de coherencia entre dos máquinas numéricas, y la etiqueta de extensión emitida lo dice. NO anclado externamente, y por ello ExternalDataset se descarta en lugar de tomarse prestado de la fila de la STM: las propias longitudes de arco umbral dependen del diseño de constelación MODELLED, de la cuadrícula de épocas y, de forma medible, hasta en { "40" }×, de la tolerancia de valores singulares. El { "2.09" } h plano publicado se reproduce exactamente con rel_tol = { "1e-6" } y es en sí dependiente de la tolerancia ({ "10.25" } h con { "1e-4" }, { "0.42" } h con { "1e-8" }), lo que es una propiedad del criterio y no de la órbita. Ningún conjunto de datos público publica un umbral de observabilidad por longitud de arco para una constelación cislunar elegida. RESULTADO MEDIDO: el umbral espacial de seis estados es { "22.17" } h para la NRHO L2 y { "40.42" } h para el halo L2, y NO EXISTE para la familia DRO plana sobre la que se derivó la afirmación publicada: rango { "4" } de { "6" } con defecto de datum { "2" } y dos autovalores exactamente nulos, un defecto estructural que ninguna longitud de arco recupera

# text
seg-e250321394bc = Error de predicción de orientación terrestre de estilo operativo, medido de predicho frente a final

# text
seg-0e443d241460 = Un ajuste de mínimos cuadrados de sesgo más tasa sobre una ventana final más los principales términos periódicos (anual, semianual y las dos mareas zonales principales para UT1; Chandler, anual y semianual para el polo), extrapolado arrastrando hacia delante el último residuo dentro de la ventana: la clase que usa el Boletín A de IERS, en lugar del predictor de persistencia en el que se apoyaba el horizonte publicado. Puntuado de la única manera honesta: un pronóstico para T+h construido a partir de filas rápidas del Boletín A en T o antes, medido frente al valor final del Boletín B PUBLICADO DESPUÉS en T+h, con la persistencia puntuada sobre el mismo conjunto de épocas frente a los mismos valores finales a su lado. Una época objetivo sin valor final publicado se descarta en lugar de volver a puntuarse frente a la columna rápida; un término periódico que la ventana no puede restringir se informa como rechazado con los ciclos que realmente abarca; una ventana incompleta se rechaza en lugar de acortarse en silencio

# text
seg-822a1ce99154 = Tres vías independientes, ninguna de ellas una cifra publicada de exactitud de predicción. ({ "1" }) Una señal analítica con coeficientes conocidos: la única forma de ejercitar la maquinaria periódica, pues ninguna serie confirmada es lo bastante larga para admitir un término anual. ({ "2" }) La solución de mínimos cuadrados en forma cerrada de los manuales, con un álgebra distinta de la resolución matricial sometida a prueba, sobre filas reales. ({ "3" }) Las genuinas filas archivadas de predicción del Boletín A que publica el producto real de { "2026" }, comparadas por antelación como estadístico de CONCORDANCIA y explícitamente no como error: { "0.256" } ms a { "1" } día, { "0.695" } ms a { "2" } días, { "1.252" } ms a { "3" } días, con deriva hasta { "3.885" } ms a { "9" } días. Así que esta es la CLASE del Boletín A, cercana a corto plazo, no el Boletín A. Los residuos de predicho frente a final son magnitudes reales medidas sobre filas reales de IERS, pero su magnitud solo se comprueba frente a la DIRECCIÓN de la comparación, nunca frente a una cifra de exactitud publicada por IERS: leer un producto real es procedencia, no una referencia independiente. MEDIDO: el día { "1" } el predictor operativo da { "3.78" } m de error en el marco de la Luna frente a { "11.39" } m de la persistencia ({ "3.01" }×), el día { "2" } { "10.23" } m frente a { "21.72" } m ({ "2.12" }×), el día { "3" } { "20.33" } m frente a { "30.57" } m ({ "1.50" }×), y es PEOR más allá de tres días ({ "0.87" }× a { "5" } días, { "0.43" }× a { "10" }), lo que el informe emite en lugar de mostrar solo los horizontes que lo favorecen. NO se reproducen: el filtro autorregresivo de residuos y la reducción tabulada de mareas zonales, la ventana operativa de 365 días es inalcanzable con los datos confirmados, y NO existe en este repositorio ninguna versión archivada anterior de la serie, de modo que la tabla de versiones archivadas no informa de ninguna fila en lugar de puntuar una sintetizada. { "0.30" } comparación externa, un hallazgo (se mantiene MODELLED): puntuado frente a los mismos valores finales sobre { "178" } emisiones archivadas del Boletín A con la ventana de 15 días por defecto del crate, el MAE de UT1 del predictor es de 2.4x a 12.6x el del Boletín A a { "1" } a { "10" } días (umbral 1.5x) y { "5.32" } ms a { "10" } días, fuera del rango de { "0.36" } a { "3.13" } ms del 2nd EOP PCC; el polo es de 1.5x a 1.85x el del Boletín A (dentro de 1.5x solo a { "6" } y { "7" } días); { "19" } de { "21" } condiciones preregistradas fallan. Corrección a la vía ({ "3" }): las filas del producto de { "2026" } con las que se comparó llevan la marca I (medido) de IERS, no P, de modo que esas cifras de concordancia son frente a valores rápidos medidos, no frente a predicciones del Boletín A. { "0.30" } ronda { "2" }, un predictor de mínimos cuadrados más autorregresivo con las mareas zonales eliminadas analíticamente, frente a { "178" } emisiones archivadas del Boletín A con el umbral de la ronda 1 (preregistrado c93605b4), un hallazgo (se mantiene MODELLED): se cumplen { "12" } de { "21" } condiciones; el MAE de UT1 es de { "1.73" } a 2.11x el del Boletín A a { "2" } a { "10" } días (umbral 1.5x) mientras que el polo está dentro de 1.27x en cada antelación. { "0.30" } revisión: con la entrada sin conexión ahora clasificada por la marca de IERS, las cifras de concordancia de la vía ({ "3" }) son frente a predicciones reales del Boletín A (0.256/0.695/1.252/3.885 ms a 1/2/3/9 días frente a filas rápidas -> 0.133/0.421/0.839/2.786 ms)

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
seg-60e30948cee7 = Un estimador separado en esta base de código con un algoritmo distinto y una vía de código disjunta: Gauss-Newton ponderado no lineal con parciales por diferencias finitas, cuyo veredicto se lee como error medido de recuperación de estado en km y mm/s. No tiene ninguna expresión en común con la vía de rango y covarianza del gramiano, y la separación se IMPONE mediante una guarda sobre el texto fuente en lugar de afirmarse. MEDIDO en la cuadrícula DRO plana publicada: el criterio de ESTIMABILIDAD está CORROBORATED: la frontera medida de Monte Carlo es { "5.739130" } h frente a la { "5.739130" } h formal (razón { "1.0000" }), y el RMS medido reproduce el 1σ formal sobre { "21" } longitudes de arco con una razón de media geométrica de { "0.9804" }. El criterio de RANGO NO está corroborado como frontera de recuperabilidad: el estimador recupera desde { "0.782609" } h frente a las { "2.086957" } h del gramiano, razón { "0.375" }, y a { "1.826087" } h (el último prefijo que la lectura de rango puntúa { "3" } de { "4" }) recupera hasta { "1.96e-5" } del desplazamiento a priori. La frontera de recuperación no se mueve a lo largo de tres décadas de su propia cota mientras que el umbral de rango abarca de 'nunca' a { "0.782609" } h a lo largo de cuatro décadas de rel_tol, y ambos coinciden exactamente con rel_tol = { "1e-8" }. Ese intervalo se registró primero como si llegara a { "0.260870" } h; esa cifra era un ARTEFACTO, producido por una lectura de rango que contaba { "4" } direcciones a partir de { "2" } filas de medición por debajo del suelo de ruido de f64, y se corrige aquí en lugar de dejarse. La lectura de rango está ahora acotada por la desigualdad de Sylvester con la razón emitida, y el intervalo corregido satura exactamente en el arco donde el estimador independiente recupera, lo que refuerza la validación cruzada de esta fila en lugar de debilitarla: el { "1e-6" } publicado es una CONVENCIÓN conservadora de valores singulares, no una afirmación sobre la recuperabilidad. El mismo patrón espacialmente: NRHO { "9.290323" } h frente a { "21.677419" } h, halo { "22.978723" } h frente a { "39.829787" } h, con la estimabilidad coincidiendo exactamente en ambos. El DRO plano de seis estados no recupera en ningún arco, reproduciendo de forma independiente el defecto estructural de datum de esa familia a partir de un estimador al que no se le dijo nada de él. NO anclado externamente (la dinámica y las condiciones iniciales se comparten con el análisis sometido a prueba y ningún conjunto de datos público publica tal umbral), por lo que ExternalDataset se descarta

# text
seg-f839285852d9 = Volumen de servicio lunar a partir de geometría de constelación real y obtenida

# text
# c1: ephemeris_path
seg-c3059fcced49 = Acepta unas efemérides de estado tabuladas centradas en la Luna (la evaluación de un núcleo SPK/BSP) o una definición de constelación publicada tras <c1/>, ejecuta contra ella el mismo barrido de cobertura / DOP / nivel de protección y emite el requisito de medición de distancia σ_URE que implica JUNTO A los resultados ilustrativos kepleriano y perturbado sin cambios, con la diferencia como magnitud con nombre propio. Cada cifra lleva una clase de procedencia que distingue lo derivado de núcleo de lo derivado de elementos publicados y de lo modelado, de modo que nunca pueden confundirse en una cita posterior

# text
seg-cbe9bd6bf989 = La GEOMETRÍA es externa y tiene hash: tres fixtures cuyas cifras proceden solo de documentos obtenidos con URL, fecha de obtención y SHA-256, regenerables mediante generadores confirmados que verifican el hash de origen y ABORTAN en lugar de emitir una cifra: la constelación de referencia de la demostración de interoperabilidad de LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), los estudios de caso de LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) y unas efemérides genuinas de naves en vuelo para LRO, Danuri, Chandrayaan-2 y CAPSTONE evaluadas a partir de los propios núcleos reconstruidos de JPL mediante Horizons. NO existe públicamente ningún núcleo de constelación de navegación lunar (Moonlight/LCNS, LCRNS y LNSS no están en vuelo y NAIF no publica nada para ellas) y no se inventó ninguno. El requisito DERIVADO de σ_URE NO tiene referencia independiente externa (nadie publica la exactitud de medición de distancia que exige un HPL lunar de { "50" } m sobre este volumen de servicio), de modo que se comprueba frente a su propia identidad algebraica y, de forma independiente, volviendo a ejecutar todo el barrido en el requisito calculado y confirmando que la disponibilidad cambia allí. MEDIDO: el diseño publicado de 8 satélites necesita σ_URE { "2.9044" } m con { "100" } % de cobertura frente a los { "0.3591" } m al { "37.85" } % de la constelación ilustrativa: una revisión de { "8.09" }× de una cifra publicada según la regla de programa R4. La conclusión cualitativa se mantiene (la clase LNIS de { "30" } m sigue sin cerrar un HPL de { "50" } m en el polo sur) pero el déficit se sobrestimaba ocho veces. La demostración de LANS de 5 satélites da CERO muestras de nivel de protección (cinco satélites no pueden dar los seis en vista que necesita un conjunto de hipótesis de fallo único) y el campo de requisito está AUSENTE en lugar de fabricado; igual para las cuatro naves reales con { "0" } % de cobertura. InternalConsistency es el tipo honesto: los datos de ENTRADA son externos y tienen hash, pero la magnitud de esta fila solo se valida frente a sí misma. { "0.30" } comparación externa, un hallazgo (se mantiene MODELLED): frente a las estadísticas de los estudios de caso de LNCSS de navi.613 en { "346" } puntos de cuadrícula, { "4" } de { "12" } estadísticas de disponibilidad quedan fuera de los { "2" } puntos porcentuales preregistrados (caso A: -4.0, +{ "22.5" } y -3.6 pp; caso B: -12.1 pp). Causas probables: elementos leídos en el marco equivocado, Kepler de dos cuerpos durante { "15" } días frente al modelo de fuerzas no indicado del artículo y una cuadrícula no reproducible a partir del texto. La mitad de PDOP no pudo evaluarse (LANS no imprime ningún estadístico numérico); la prueba de comparación está confirmada como ignorada. { "0.30" } ronda { "2" }, un hallazgo (se mantiene MODELLED): frente a una referencia independiente de Orekit { "12.2" } / Hipparchus { "3.1" } que calcula todo el informe (propagación de Orekit, visibilidad y DOP de DOPComputer, niveles de protección MHSS compuestos con Hipparchus, el requisito resuelto por muestra; preregistrado d3ce97b2) en las cinco geometrías obtenidas y dos cuadrículas, { "155" } de { "160" } valores coinciden dentro de los umbrales preregistrados ({ "2" } pp, { "5" } %, { "1" } %), incluido el requisito sigma_URE para LNCSS A y C ({ "3.879072208" } m en ambos lados para el caso A) y el requisito ausente para LANS y los orbitadores. LNCSS B en la cuadrícula densa falla en sus estadísticos de peor muestra (sigma_required { "0.000923" } frente a { "0.001511" } m, hpl_max { "1.63e6" } frente a { "0.99e6" } m), donde geometrías casi singulares (PDOP de aproximadamente { "1e6" }) amplifican la coincidencia de posición a nivel de metro; su requisito p95 coincide ({ "1.6343" } frente a { "1.6357" } m). El requisito de peor muestra está mal planteado en geometría degenerada. Frente a navi.613: { "4" } de { "12" } siguen fuera de { "2" } pp (fijado)

# text
seg-36a6cfaf5afa = Unidad y procedencia declaradas para cada magnitud informada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Un esquema legible por máquina que da unidad, clase de procedencia y definición para cada campo numérico de cada informe de escenario, más una única compuerta global que ejecuta cada tipo de escenario registrado y falla si un campo numérico emitido carece de cualquiera de ellas. El vocabulario de procedencia es cerrado y cada clase lleva un nivel de evidencia, con dos clases asignadas deliberadamente a <c1/> y <c2/> en lugar de recibir un nivel que la clase no determina

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
seg-a8c4a6fd4989 = El propio documento emitido: cada hoja numérica debe resolverse en una entrada del bloque de unidades de ese mismo documento. No existe ningún registro externo de unidades con el que comprobar una unidad DECLARADA, de modo que una unidad declarada es una afirmación revisada y no verificada: la compuerta verifica la COMPLETITUD y la BUENA FORMACIÓN, no la verdad, y marcarlo como validado sería erróneo porque nada externo confirma que <c1/> sea la unidad correcta de un campo llamado <c2/>. Se ejecutó una comprobación cruzada independiente de sufijos de nombre sobre los { "1,434" } campos descritos EN ESE MOMENTO: de los { "691" } con un sufijo que indica unidad, { "40" } discrepan de la unidad declarada y los { "40" } están explicados (sufijos por segundo, mínimos, segundos de apertura, newton-metros frente a un sufijo que parece nanómetro), por lo que no afloró ninguna unidad errónea. Esa comprobación cruzada no se ha vuelto a ejecutar desde entonces y la cobertura ha crecido más allá de ella: la cifra se deja en lo que realmente se midió en lugar de reformularse con el total actual. En el momento de ese cambio ({ "0.27.0" }), la cobertura pasó de { "7" } de { "56" } tipos de escenario a { "60" } de { "61" }, y de { "389" } de { "1354" } campos a { "1,742" } de { "1,744" } (docs/field-units-schema.json, que una comprobación de obsolescencia mantiene al día). NINGÚN tipo de escenario queda sin cubrir (techo { "0" }, FUT-28, { "0.36" }): el último fue <c3/>, dos de cuyas columnas se identifican por quien llama, por lo que sus unidades son datos; ahora se describen como <c4/> y la unidad de cada posición se lee de la propia tabla de unidades del paquete BARRIDO en <c5/> y <c6/> (o se toma de la <c7/> declarada del eje, que debe coincidir con la del paquete cuando existen ambas; null cuando no existe ninguna, indicado y no adivinado). <c8/> fue el anterior, y salió de la lista cuando su documento publicado ganó un bloque de unidades: la fijación de aditividad que había nombrado <c9/> como clave prohibida ahora DEMUESTRA que la adición es aditiva: se quita el bloque de nuevo y el documento sigue teniendo hash igual a las dos constantes congeladas antes de que existiera, de modo que un valor publicado que se moviera bajo la adición sigue fallando. El trabajo también sacó a la luz doce defectos de unidades o de documentación en código existente, informados y no corregidos según R1

# text
seg-cf779c468eed = Datum del marco lunar a partir de una campaña de observación REAL

# text
# c1: lunar-llr-datum
seg-96151f13a92b = La covarianza del datum de Helmert de siete parámetros, con sus dos entradas simuladas sustituidas por entradas medidas: el plan son las épocas de transmisión desde tierra de { "337" } puntos normales archivados de telemetría láser lunar de ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7845" } y Matera MLRO { "7941" }, los cinco arreglos de retrorreflectores) y cada peso de observación es la propia precisión archivada de ese punto bin_rms/√n_raw, mediana de { "5.13" } mm de distancia de ida, leída del archivo. Coordenadas de estación de IERS ITRF2020, coordenadas de reflector de la Tabla { "7" } de JPL DE430. Ejecutable como el tipo de escenario <c1/>. La afirmación validada ({ "0.36" }) es estrecha: en la vía analítica por defecto, el cálculo de la covarianza del datum coincide con una referencia independiente de SPICE de tiempo de luz y NumPy sobre puntos normales medidos nuevos; no es una exactitud de LLR ni evidencia de que la Luna analítica sea exacta

# text
seg-50c60fc25ded = Identidades en forma cerrada, una vía independiente dentro del repositorio y, desde { "0.36" }, una referencia independiente de biblioteca de SPICE y NumPy sobre datos medidos nuevos (más abajo); no existe ningún par publicado de covarianza de datum de LLR lunar con el que comprobar, por lo que no se reivindica ninguna exactitud. La única derivada nueva, el parcial de la distancia respecto a la posición fija al cuerpo del reflector, se rederiva por diferencia finita central del tiempo de luz bidireccional que diferencia, una ruta que no comparte ninguna expresión con la forma analítica. La referencia independiente de la física es estructural: el parcial de una distancia ES el doble de la línea de visión, de modo que la coordenada fija al cuerpo a lo largo de la dirección media hacia la Tierra debe determinarse mucho mejor que las dos coordenadas en el plano del cielo, a las que solo llega la libración; medido en { "50.7" }× a { "71.7" }× en los cinco arreglos frente a un barrido de libración que el informe mide de forma independiente, con la predicción isótropa de ángulo pequeño y la anisotropía transversal que explica la diferencia, ambas impresas. LO QUE CAMBIÓ: el plan, el número de observaciones y cada peso de observación son ahora medidos; se usan { "337" } de { "349" } puntos archivados y los { "12" } que no se usan se omiten y se cuentan, porque ITRF2020 no incluye ninguna posición para Apache Point. MEDIDO: sigma de traslación del datum { "1.851746e-2" } m frente a los { "6.3975" } m de la campaña SIMULADA ({ "345" }×), rotación { "36" }×, escala { "24" }×: una razón entre una red de telemetría láser y una red de retardos de VLBI, de modo que es un hallazgo y no una validación. Rango de información del reflector 15/15 con acoplamiento entre arreglos exactamente { "0" }; rango de Helmert 7/7, condición { "2.4e4" }. LO QUE ESTA FILA NO AFIRMA: que la cifra sea correcta en términos absolutos. Una solución LLR real coestima la órbita lunar, las libraciones físicas, la orientación terrestre, las coordenadas de estación y los parámetros de mareas y relativistas, e informa de decímetros (los propios 0.12-0.27 m de la Tabla { "7" } de DE430) donde esta cota es mucho menor; esto es una cota de Cramér-Rao para un conjunto reducido de parámetros indicado, no una exactitud. Fuera de la afirmación validada (modelados, no validados): las efemérides del centro de la Luna y la orientación del cuerpo IAU { "2015" } están modeladas, y la troposfera, las mareas, la excentricidad de estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes. Su tamaño combinado se PUBLICA y no se argumenta (distancia de ida observada menos calculada de { "156,494" } m RMS sobre los { "337" } puntos) y su efecto en la covarianza está ACOTADO y no se argumenta: volver a resolver todo el datum con cada parcial inclinado { "0.1" }° (el doble de la inclinación de efemérides medida en la peor época, con signo alterno) mueve el resultado entregable un { "0.288" } %. COMPROBACIÓN EXTERNA ({ "0.30" } ronda { "2" }, preregistrada 6b27964a), un hallazgo (se mantiene MODELLED): el tiempo de luz bidireccional de SPICE (DE440, ITRF93, orientación lunar DE440) con parciales por diferencias finitas, y una inversa de numpy, sobre los mismos { "337" } puntos normales medidos y pesos, coinciden en la contabilidad, ambos rangos, el acoplamiento cero, el RMS residual ({ "2.1e-5" }) y { "15" } de { "16" } cifras de covarianza. El sigma de traslación en z es un { "1.03" } % más alto frente al umbral preregistrado del { "1" } %. Con el centro de la Luna de DE440 baja al { "0.049" } % (c51f8b2, datos vistos), y con puntos normales nuevos de { "2019" } el datum con Luna de núcleo cumple todos los umbrales (fila "…, centro de la Luna por núcleo"), donde la Luna analítica también se queda dentro de los umbrales (peor caso { "3.8e-3" }, solo informativo), de modo que esa comparación no separa los modelos de la Luna. EJECUCIÓN CON DATOS NUEVOS DE LA VÍA ANALÍTICA ({ "0.36" }, preregistrada 31f5283 antes de obtener ningún punto): la referencia independiente de SPICE y NumPy sin cambios sobre { "151" } puntos normales EDC CRD v2 usados de 2025-04..06 (un año que ninguna prueba había usado; archivos obtenidos de nuevo y referencia independiente reejecutada de forma independiente, véase el NOTICE del fixture) con los mismos umbrales: contabilidad, rangos, recuentos por arreglo y acoplamiento cero iguales; sigmas y normas peor caso { "1.11e-3" } (umbral del { "1" } %), condición { "8.95e-4" } ({ "2" } %), razones transversal/longitudinal peor caso { "1.79e-3" } ({ "2" } %); O-C de SPICE { "10.79" } m. VALIDATED con esa evidencia como comprobación de biblioteca del cálculo de la covarianza únicamente; el RMS residual analítico en ese tramo es { "222" } km, por lo que los umbrales no discriminan modelos de la Luna (como en la fila de núcleo). Resultados: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

# text
seg-c815cb90dcde = Geodesia de la estación de referencia lunar: retrorreflector y baliza de VLBI añadidos frente al datum de cinco arreglos

# text
seg-103cf21173ac = Las entradas opcionales extra_reflectors y extra_beacons del escenario lunar-llr-datum añaden un bloque station_geodesy: la información de Helmert de cinco arreglos del tramo archivado de telemetría láser lunar más la información que un retrorreflector añadido (medido en las épocas de puntos normales archivadas en las que la estación de medición está sobre su horizonte, cada una con el peso archivado de ese punto normal) y una baliza de VLBI añadida (observada por la red y el plan de lunar-frame-campaign con las estaciones terrestres fijas, mediante los parciales de retardo de lunar-vlbi-fim) en emplazamientos indicados aportan al datum de siete parámetros, vuelto a resolver, con el 1-sigma de cada parámetro de Helmert antes y después, su razón, las normas antes y después y los autovalores extremos de la diferencia de Fisher. Si falta o está vacía, el informe no cambia

# text
seg-d9f033ebf109 = Datum del marco lunar a partir de una campaña de observación REAL, centro de la Luna por núcleo

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = La covarianza del datum de Helmert de siete parámetros de lunar-llr-datum a partir de puntos normales archivados de ILRS y sus pesos medidos, en la vía de núcleo: el centro geocéntrico de la Luna se lee de JPL DE440 con el propio lector de núcleos del motor (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Solo el centro de la Luna difiere de la fila analítica; la orientación IAU { "2015" }, el movimiento polar y UT1 ausentes, los catálogos, las reglas de selección, los pesos y el álgebra lineal son los mismos. La afirmación validada es solo que la covarianza del datum de esta vía coincide con una referencia independiente de SPICE y NumPy sobre puntos normales nuevos y no vistos. La comparación no discrimina modelos de la Luna y no comprueba el centro de la Luna: en el mismo tramo la Luna analítica también supera todos los umbrales, la mutación preregistrada (la Luna de núcleo leída una hora tarde) no se detectó, y un centro de la Luna erróneo en unos { "4,650" } km también supera (véase el texto de la referencia independiente). No es evidencia de que la Luna de núcleo mejore el datum. Ejecutable como el escenario <c1/> con planetary_kernel_path (y normal_points_dir para otro tramo)

# text
seg-ec47513b1828 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) tiempos de luz bidireccionales sobre DE440, orientación terrestre ITRF93 y la orientación lunar DE440 (MOON_ME) con parciales por diferencias finitas de { "100" } m, y matriz de información e inversa de numpy { "2.3.5" } (BSD-3-Clause, LAPACK): el generador sin cambios de la comparación de la fila analítica (6b27964a), ejecutado sobre un tramo nuevo (puntos normales EDC CRD, 2019-04..06) preregistrado en 830d945a antes de obtener nada de él, con los umbrales de la fila analítica (sigmas y normas del { "1" } %, condición y razones del { "2" } %, contabilidad, rangos y acoplamiento exactos) y su autocomprobación de la referencia independiente (O-C de SPICE { "10.86" } m < { "100" } m). Cada magnitud se cumple, peor caso { "7.6e-5" }. Mutaciones: el retardo de la Luna de una hora planificado NO se detecta (la covarianza depende de la dispersión de las líneas de visión, no de su temporización); una mutación estructural elegida después y divulgada como tal, que elimina el parcial del tramo de bajada, hace fallar todos los sigmas. Hallazgo: en este tramo la Luna analítica también supera (peor caso { "3.8e-3" }), de modo que el umbral no discrimina modelos de la Luna y esto valida la covarianza con datos nuevos, no una mejora de la Luna de núcleo. Comprobación del integrador en el pliegue (no preregistrada): la Luna de núcleo leída respecto al baricentro Tierra-Luna en lugar de la Tierra (RMS residual { "4,649" } km) y la época del núcleo sin TT menos UTC ({ "69" } s; residuo { "2.6" } km) siguen superando ambas todos los umbrales, mientras que quitar sqrt(n_raw) de los pesos medidos hace fallar las { "16" } magnitudes con banda; la comparación es sensible a los pesos, los parciales y el álgebra lineal, no al centro de la Luna. Ambos lados leen DE440: esto valida el cálculo sobre DE440, no DE440. Fuera de la afirmación: una exactitud de LLR (una cota de Cramér-Rao para un conjunto reducido de parámetros)

# text
seg-bd3af378b613 = Efemérides lunares analíticas integradas: su COTA DE EXACTITUD DECLARADA comprobada con datos reales

# text
seg-a51c4e234a4f = ephem::moon_position, la serie lunar geocéntrica de baja precisión a la que recurre el crate cuando no hay ningún núcleo DE/SPK, medida frente a telemetría láser lunar real y frente a unas efemérides planetarias publicadas sobre el mismo intervalo. Esta fila valida la cota que el módulo declara sobre sí mismo, NO una exactitud: se confirma que la serie no es peor de lo que dice, no que sea buena

# text
seg-81dff68ddd9c = DOS conjuntos de datos externos independientes que no comparten nada. ({ "1" }) { "337" } puntos normales archivados de telemetría láser lunar de ILRS (EUROLAS Data Center, DGFI-TUM, 2015-04-08 a 2015-06-27, cinco arreglos de retrorreflectores, confirmados con SHA-256 por archivo y un guion de nueva descarga y verificación): distancia de ida observada menos calculada de { "156,494" } m RMS, con coordenadas de estación de IERS ITRF2020 y coordenadas de reflector de la Tabla { "7" } de JPL DE430, de modo que el residuo está dominado por la serie del centro de la Luna. ({ "2" }) Estados geocéntricos geométricos de la Luna de JPL Horizons sobre el mismo intervalo: { "112,567" } m RMS radial, { "195,655" } m RMS vectorial, peor época { "360,324" } m = { "0.0536" }°. Un residuo de distancia responde a la parte RADIAL de un error de efemérides, de modo que ({ "1" }) y ({ "2" }) son la misma magnitud alcanzada de dos maneras y coinciden hasta { "1.39" }×, lo que autoriza al escenario lunar-llr-datum a atribuir su residuo a las efemérides. La documentación propia del módulo del motor afirma ~{ "0.3" }° / ~unos·10² km; ambas mediciones quedan dentro de ella, la afirmación angular con un margen de { "5.6" }×. ALCANCE, indicado para que ningún lector pueda confundirlo: esto valida la COTA declarada, no una cifra de exactitud. La serie sigue siendo inadecuada para cualquier aplicación que necesite algo mejor que ~{ "1e5" } m, y esa limitación es tanto el contenido de la fila como lo es la coincidencia. Regenerable sin conexión mediante los guiones confirmados de obtención y verificación

# text
seg-44f582b17fa9 = Integridad de la compuerta: un verde que significa lo que dice

# text
# c1: cargo test --all
seg-43fbcfbe990c = Tres guardas estructurales sobre el propio proceso de verificación, cada una cerrando una clase de defecto que llegó a la compuerta canónica como un rojo intermitente o espurio. ({ "1" }) Cada ruta temporal construida en las fuentes de Rust debe llevar un componente único por llamada; se rechaza un identificador de proceso, porque cargo ejecuta las pruebas de la biblioteca como hilos paralelos de UN solo proceso y el pid es compartido por todos ellos. ({ "2" }) Cada fijación byte a byte o por hash debe declarar, junto a sí misma o en la cabecera de su módulo, qué cubre y qué excluye deliberadamente, de modo que un cambio transversal pueda decir de un vistazo qué fijaciones están en alcance y cuáles se han convertido en silencio en detectores de cambios de todo el repositorio. ({ "3" }) Un verde solo puede afirmarse a partir de la suite COMPLETA: scripts/gate.sh ejecuta <c1/>, captura el código de salida verdadero sin ninguna tubería en medio y escribe un recibo que nombra el commit, el número de binarios de integración, el número de pruebas y la duración; la comprobación previa al push rechaza un push cuyo commit no nombra ningún recibo válido, en un árbol limpio. La repetibilidad se muestrea por separado con scripts/check-repeatability.sh, que ejecuta la suite de la biblioteca N veces y falla si el conjunto de pruebas superadas difiere.

# text
seg-17a5f9da54a4 = Forma cerrada: cada guarda se ejecuta sobre un fragmento conocido como defectuoso fijo que debe activarse y un fragmento conocido como correcto fijo que debe permanecer en silencio, ambos constantes literales sobre las que el detector no puede influir. Los dos fragmentos defectuosos son los defectos F22 y F25 en su forma original. Es una referencia independiente INTERNA y la fila es MODELLED en consecuencia: demuestra que las guardas discriminan el defecto de su corrección, no que las clases que describen sean exhaustivas. Sus puntos ciegos indicados (estado compartido que no es una ruta, una fijación contenida en una constante corta con nombre, una condición de carrera rara que tres ejecuciones no muestrean y un recibo que puede falsificar cualquiera que pueda escribir el archivo) están escritos en la documentación del módulo de tests/source_guards.rs y en la cabecera de cada guion en lugar de dejarse para descubrirlos.

# text
seg-178192c9c87a = PL de temporización compuesto: especialización escalar MHSS (H=1_N)

# text
seg-431aaf94ec31 = TPL de separación de soluciones de tiempo escalar sobre fuentes heterogéneas; PL determinado por el ruido del subconjunto de peor exclusión + sesgo de UTC(k)

# text
seg-9a5ea79248c8 = P2: linalg.lstsq de numpy { "2.3.5" } y scipy { "1.18.1" } (norm.isf, norm.sf, brentq) recalculan, con sus propios algoritmos, los estimadores de mínimos cuadrados ponderados de subconjuntos, la covarianza de separación general sqrt(Δ Σ Δᵀ), los sesgos y el nivel de protección a partir de ellos en { "300" } entradas confirmadas (tests/fixtures/tpl_scalar_numpy_oracle); el PL coincide dentro de { "1e-9" } relativo (peor caso { "1.2e-10" }) y el subconjunto de exclusión determinante es idéntico, con la tolerancia fijada antes de la comparación. Los multiplicadores, los priors y las sobrecotas de sesgo son entradas, y la estructura de la ecuación del PL (lista de modos, reparto ir/2, proyección del sesgo) es una entrada indicada, como para la fila Núcleo de niveles de protección ARAIM lunar; la afirmación validada es el álgebra lineal y el PL sobre esas entradas, no las magnitudes físicas de un escenario de temporización. Linaje ARAIM Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = PL de temporización compuesto: travesía de holdover sembrada con P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); semicontinuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrido de K(IR/2); exponentes de fase τ/τ³/τ⁵

# text
seg-1438193381be = Pruebas de propiedades (monotonía, sin caída en el traspaso) + lint de exponentes frente a holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = PL de temporización compuesto: cobertura de la envolvente de holdover, régimen de varios años (tau>=90d)

# text
seg-d9520f6c1769 = La envolvente de máximo corrido sobrecota (sin perforación por cero) una serie metrológica real en cada retardo probado tau>=90d en un segmento disjunto; el tau corto (<=30d) es un límite modelado divulgado

# text
seg-086baedd33a9 = Serie de 5 días de BIPM Circular-T [UTC-UTC(USNO)] MJD 56074-60429 ({ "872" } pts, API webtai); ajuste/prueba disjuntos, cobertura sin perforación por cero de varios años

# text
seg-096b6cdfe2dc = PL de temporización compuesto: envolvente LIL c.s. (imposibilidad + coherencia)

# text
seg-1671add2210d = Ningún holdover de peor caso finito (el supremo browniano diverge); HPL asignado por IR coherente con la envolvente de Hartman-Wintner cuando IR→{ "0" }

# text
seg-c9ed8bbede70 = Identidad de la envolvente c.s. en forma cerrada √(2Dt·lnln t) + comprobación de dominancia del HPL; costura de imposibilidad de Baweja arXiv:{ "2606.24210" }

# text
seg-5a27c9f0a67d = Sobrecota de integridad del sesgo de trazabilidad heterogéneo de UTC(k)

# text
seg-fd09ab2adbf6 = Sobrecota de sesgo por fuente b = (U/k_cov)·Phi^-1(1-tail/2) + envejecimiento, que infla una incertidumbre expandida de tipo B publicada hasta una cola de integridad asignada; se enlaza con tpl_scalar como bias_s

# text
seg-1fd53acf9a3f = Reproducción independiente con numpy + estadística de la biblioteca estándar de la forma cerrada de la sobrecota (InternalConsistency). La serie BIPM Circular-T [UTC-UTC(USNO)] es solo una entrada CITADA: es la MISMA serie ya validada para la fila de cobertura de holdover R4 y NO se vuelve a validar aquí; reproducir sus valores no demuestra nada sobre R2. La cola profunda de integridad es modelada. { "0.30" } comparación externa, un hallazgo (se mantiene MODELLED): en los archivos UTC-UTC(k) por laboratorio de BIPM ({ "102" } laboratorios, { "105 024" } filas con incertidumbres publicadas) la sobrecota b = { "2.576" } u en la cola de { "1e-2" } es superada por el { "50.8" } % de las filas (Clopper-Pearson { "95" } %: { "50.4" } a { "51.1" } %) y en más del { "1" } % en { "101" } de { "102" } laboratorios. La u publicada es la incertidumbre de la determinación de UTC-UTC(k) por BIPM, no una cota del desfase, que habitualmente llega a muchas veces u; la sobrecota tal como está especificada no acota el sesgo real de trazabilidad de UTC(k). { "0.30" } ronda { "2" }, una sobrecota de los desfases UTC-UTC(k) realizados entrenada con datos de Circular T de BIPM de 2015-2022 y probada en 2023-2026 (preregistrada ca0921a4, excedencia agrupada como máximo { "1e-2" }), un hallazgo (se mantiene MODELLED): la excedencia agrupada es { "0.0333" } ({ "694" } de { "20 826" } filas en { "82" } laboratorios; { "0.0127" } sin las { "430" } filas que no tienen cota por regla). D9 ronda { "3" }, una cota de envejecimiento jerárquica agrupada (utck_bound), preregistrada fb475550 y puntuada de forma prospectiva sobre emisiones de Circular T desde { "465" }: aún no ejecutada (la emisión { "465" } se publicó el 2026-10-12 con unos { "285" } valores de prueba; la regla preregistrada de 1000 valores necesita emisiones hasta aproximadamente { "468" }, y la ejecución necesita los archivos por laboratorio archivados del 2026-09-30, ya que BIPM ha reescrito desde entonces { "87" } de los { "113" })

# text
seg-d75b900ad25f = Covarianza cruzada del sesgo de trazabilidad correlacionado (asignación insegura de modo común)

# text
seg-0641f6d38c23 = Covarianza cruzada de sesgo de N×N con fuera de diagonal rho·b_i·b_j para fuentes que comparten un realizador de UTC(k); DEMOSTRADO correlated_fused_bias >= independent_fused_bias (la asignación independiente ingenua subacota el sesgo fusionado -> optimista -> insegura)

# text
seg-72359f29aab1 = Reproducción independiente con numpy de la covarianza cruzada y de la desigualdad de sesgo fusionado correlacionado frente a independiente (InternalConsistency). Conjunto representativo de fuentes; escenario modelado.

# text
seg-0359a9194c60 = Blanqueo de modo común por GLS (Aitken) + identidad de Mahalanobis

# text
seg-67b11ff6d055 = Cholesky Omega=LL^T hecho a mano y blanqueo por sustitución hacia delante z=L^-1 r (Cov(z)=I cuando Cov(r)=Omega); cuadrado de Mahalanobis z^T z = r^T Omega^-1 r

# text
seg-24cb37529637 = P2: linalg.cholesky de numpy { "2.3.5" } (LAPACK potrf), solve (gesv) e inv sobre { "201" } entradas SPD confirmadas (tests/fixtures/gls_whitening_numpy_oracle) comprueban el factor programado a mano, el residuo blanqueado y el operador de blanqueo; el cuadrado de Mahalanobis se comprueba frente a solve(Omega, r), que no usa Cholesky, de modo que la identidad z^T z = r^T Omega^-1 r queda confirmada por una vía independiente. Todo dentro de { "1e-12" } relativo (peor caso { "7.9e-16" }), con la tolerancia fijada antes de la comparación. El mayor número de condición es { "19.3" }, así que las matrices mal condicionadas no están cubiertas. El blanqueo GLS/Aitken { "1935" } es Citado.

# text
seg-1a3bb032960f = Estadístico de consistencia de modo común (fallo de referencia compartida ciego a la separación)

# text
seg-1b03f522b8fc = Estadístico de puntuación ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para un desplazamiento de modo común que la separación de soluciones (contrastes ortogonales a { "1" }) no puede ver; un desplazamiento de modo común lo infla mientras las separaciones por pares permanecen planas

# text
seg-d79071a5d9ec = Reproducción independiente del estadístico con numpy y prueba de propiedad de que una inyección de modo común lo infla (InternalConsistency). Escenario modelado. { "0.30" } ronda { "2" } (preregistrado f9aa360d), bloqueado (sigue siendo MODELLED): gesv de LAPACK en numpy { "2.3.5" } reproduce el valor del estadístico en { "261" } casos confirmados (dentro de { "3.5e-15" } con buen condicionamiento, { "1.2e-9" } con condición de hasta { "6.1e7" }); la ley nula chi-cuadrado({ "1" }) es un teorema citado y las separaciones por pares planas son una identidad sin salida del motor con la que comparar, por lo que la delimitación del alcance espera una decisión del responsable

# text
seg-91fc18cde833 = Cota de modo común indetectable con residuo fuera de Omega

# text
seg-0cc2c0f033c8 = Techo de modo común indetectable: la mayor magnitud de fallo a lo largo de una dirección d que escapa TANTO a la separación (alpha_ss = T_ss / norma de contraste blanqueada de d) como al estadístico de modo común (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), notificada como min(alpha_ss, alpha_cm). Con una Omega definida positiva, las dos direcciones ciegas (d proporcional a { "1" }, y { "1" }^T Omega^-1 d = { "0" }) son mutuamente excluyentes, por lo que el techo es FINITO para todo d distinto de cero; solo es infinito para una dirección nula o para una Omega no definida positiva. Una dirección fuera del eje común modelado es ciega únicamente al estadístico de modo común y queda acotada por la separación

# text
seg-b67c71daa7de = P2: linalg.solve de numpy { "2.3.5" } (gesv de LAPACK, LU sin Cholesky) recalcula alpha_ss (el umbral sobre la norma de contraste blanqueada de d tras eliminar su coeficiente de modo común GLS), alpha_cm y su mínimo en { "256" } entradas confirmadas (Omega, d, T_ss, T_cm) (tests/fixtures/gls_outside_omega_bound_numpy_oracle), incluidas direcciones de modo común puro, direcciones fuera del eje común modelado y los casos de dirección nula y de matriz no definida positiva, que deben dar +inf; preregistrado (d070699a; enmienda 8a44267b, antes de cualquier comparación, que reformula la forma matricial); tolerancias fijadas antes de la comparación. El texto de la capacidad se corrigió por decisión del responsable (2026-10-02): decía que la cota es infinita para una dirección fuera del eje común, lo que contradecía el código y esta comparación. Que el detector idealizado de un solo contraste acota inferiormente la magnitud indetectable de un detector real de subconjuntos sigue siendo Modelado

# text
seg-a7a33523bb1c = Identificabilidad del datum lunar - álgebra lineal de la descomposición

# text
seg-bd59cc76557a = Marginal por complemento de Schur del bloque { "{" }lunocenter-X, scale{ "}" } de la Fisher del datum de Helmert de 7 parámetros: la métrica escalar de degeneración lambda_min(S), la CRLB del origen X y la correlación entre origen y escala

# text
seg-0f7e4fb31c44 = Referencia independiente de SciPy/NumPy (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): el complemento de Schur, sus valores propios y la inversa 2x2 calculados con una biblioteca independiente. Limitado al ÁLGEBRA LINEAL de la descomposición; las MAGNITUDES lunares de correlación y CRLB obtenidas con geometría real siguen siendo MODELLED.

# text
seg-3359eee713a5 = Clasificación del espacio nulo del datum lunar (aditividad de rango de LLR + elevación del defecto por libración)

# text
seg-6d722c176052 = Clasificación del problema de datum de medición interna de distancias: una sola observación de distancia aporta rango { "1" } (espacio nulo de 6 dimensiones); el par origen X y escala es casi nulo y la libración física de DE440 eleva el defecto a cero mientras el par sigue casi degenerado

# text
seg-ae6dc4e6ea8b = Estructura geométrica reproducida por el motor más la identidad de Schur 2x2 en forma cerrada; consistente en ESTRUCTURA con Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cuyas magnitudes publicadas NO se reproducen aquí. La clasificación es estructural; las magnitudes de correlación y CRLB con geometría real son MODELLED (coordenadas y orientación de los reflectores mantenidas fijas). { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): frente a Sosnica et al. { "2025" }, la correlación origen-escala de la Fisher de distancias (-0.993 / -0.988) está a menos de { "0.05" } del -0.97 publicado, pero con la geometría de cinco reflectores del propio artículo la correlación de Helmert de 7 parámetros con pesos iguales es -0.78 (el valor publicado depende de errores por reflector que el artículo no imprime), y la CRLB del origen ({ "0.6" } a { "1.2" } mm con ruido de distancia de { "3" } mm) queda entre un { "96" } y un { "98" } % por debajo de los { "3.07" } cm del artículo, frente a una tolerancia del { "20" } %. Magnitudes no reproducidas

# text
seg-3fd19007ea67 = Información de datum lunar multitécnica (LLR + VLBI lunar + distancia de orbitador)

# text
seg-23d0dd7d0666 = Filas del jacobiano del datum para la distancia LLR a reflectores terrestres, el retardo diferencial de VLBI lunar entre dos estaciones y la distancia de orbitador a baliza sobre el datum de 7 parámetros, combinadas en una única Fisher preacondicionada de forma coherente; demuestra que el seguimiento fuera de la dirección radial (orbitador / diverso en profundidad) rompe la degeneración entre origen X y escala, mientras que el VLBI transversal ayuda solo de forma indirecta

# text
seg-b2f5715c4577 = Comprobaciones cruzadas analítico frente a diferencias finitas de las derivadas parciales de cada técnica (internas); la DIRECCIÓN de la mejora es un hecho geométrico. Las ubicaciones de las balizas, las planificaciones y el ruido son MODELLED/representativos (véase tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = Proveedor de orientación de ejes principales lunares DE440

# text
seg-ebe4519a40e4 = Rotación de MOON_PA_DE440 a J2000 en épocas arbitrarias dentro de 2014-01-01 a 2030-12-31 TDB, mediante interpolación geodésica R0·Exp(f·Log(R0ᵀR1)) entre los nodos de una serie diaria confirmada de { "6" } 209 filas (las funciones try_ devuelven OrientationSpanError fuera de ella, las infalibles entran en pánico; nunca se satura); incrustada en tiempo de compilación, por lo que no hay E/S del sistema de archivos en ejecución y la compilación WASM la incluye

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 hasta spiceypy { "8.2.0" }, ejecutado como herramienta): pxform de MOON_PA_DE440 a J2000 evaluando directamente el PCK binario de JPL moon_pa_de440_200625.bpc, con el propio kernel de marcos de NAIF moon_de440_250416.tf, en { "2 000" } épocas aleatorias fuera de los nodos dentro de la ventana incrustada. El ángulo de rotación entre las matrices de Kshana y las de SPICE está dentro de { "1.7e-5" } rad ({ "30" } m al radio medio de { "1737.4" } km, fijado antes de la comparación); el peor caso medido es { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, y el peor caso es { "1.75e-6" } rad en { "6 000" } épocas adicionales extraídas por el verificador. Los nodos diarios se extrajeron a su vez del mismo kernel (scripts/gen_de440_moon_pa.py, SHA-256 del fixture 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), de modo que esta comparación pone a prueba la interpolación entre ellos, que es la afirmación. Encontrado mediante esta comparación y corregido: la interpolación lineal elemento a elemento anterior con Gram-Schmidt conservaba el eje pero no el ángulo de la rotación de { "13.2" } grados/día y tenía un error de hasta { "2.0e-4" } rad ({ "340" } m) cerca de los puntos de cuarto; la cifra anterior de unos { "14" } m procedía de una protección que solo muestrea los puntos medios de los intervalos. La serie cubre 2014-01-01 a 2030-12-31 y da error fuera de ella (ronda { "2" }); sus nodos de 2024-2025 se regeneran a partir del mismo kernel con { "4.3e-13" }. La comparación con SPICE fuera de los nodos descrita arriba cubre solo 2024-2025, que es la ventana validada; los nodos ampliados proceden del mismo kernel y script, pero no se comparan fuera de los nodos. Un sustrato de geometría para el análisis de identificabilidad, no un producto de orientación submétrico

# text
seg-ab96cfc8d48c = Sustrato de geometría del datum LLR lunar (reflectores en ejes principales, estaciones terrestres, derivadas parciales analíticas de la distancia)

# text
seg-40e91288f81a = Los cinco conjuntos de retrorreflectores de la cara visible en metros del sistema de ejes principales (PA) del cuerpo y las estaciones terrestres LLR en coordenadas geodésicas; colocación de los reflectores del sistema del cuerpo al inercial mediante la orientación PA de DE440; derivadas parciales analíticas de la distancia Tierra-reflector respecto al datum de 4 parámetros; y la matriz de Fisher solo de LLR que muestra la degeneración entre lunocentro-X y escala que motiva el análisis de 7 parámetros

# text
seg-89ce1f95d9f6 = El cálculo se comprueba internamente: cada derivada parcial analítica frente a una diferencia finita, y el caso de datum nulo frente a la distancia nominal. El CATÁLOGO se comprueba de forma externa e independiente: las coordenadas de ejes principales de DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) se contrastan con la Tabla { "6" } del memorando de coordenadas de superficie de DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído automáticamente de un PDF verificado con SHA-256 mediante tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) y coinciden con una diferencia de { "1.12" } m, mientras que la realización de Tierra media de los mismos cinco conjuntos difiere en { "672" } a { "871" } m. La ESTRUCTURA DE DEGENERACIÓN se comprueba frente a un resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que para el sistema de ejes principales lunares notifica un coeficiente de correlación entre lunocentro-X y escala de r = -0.97, y que el LLR no alcanza el centro de masas real de la Luna con una exactitud mejor que { "12" } cm debido a esa correlación. Este módulo recupera la misma estructura (|corr(t_x, scale)| entre { "0.9" } y { "0.9999" }, defecto de datum <= { "1" }) a partir de un diseño de Fisher solo de LLR. La corroboración es entre efemérides, no un viaje de ida y vuelta: el artículo combina INPOP21a, DE430 y EPM2021, mientras que este módulo se alimenta de la libración de DE440. Lo que NO se reproduce es la magnitud: la correlación aquí es de aproximadamente -0.988 frente al -0.97 de ellos, y la CRLB de 4 parámetros es submilimétrica frente al suelo alcanzado de { "12" } cm de ellos, porque aquí la orientación y las coordenadas de los reflectores se mantienen fijas y allí se resuelven. Solo estructura de geometría y de degeneración; ninguna afirmación de exactitud sobre un datum resuelto. { "0.30" } comparación externa: las partes de distancia medida de este módulo (reflectors(), stations_itrf(), la colocación PA de DE440 y el tiempo de luz baricéntrico llr_bcrs_one_way_m) se validan en su propia fila, modelo de distancia medida LLR, frente a { "192" } puntos normales de ILRS (RMS { "2.81" } m frente a { "10" } m). Esta fila sigue siendo MODELLED porque la comparación con mediciones no ejercita el resto de su afirmación. El catálogo geodésico de estaciones stations() redondea APOLLO a { "0.001" } grados; con un tiempo de luz geocéntrico da { "22.7" } m en los mismos puntos (prueba reflector_ranges_against_ilrs_normal_points; { "96" } m con la interpolación de orientación elemento a elemento anterior). Las derivadas parciales analíticas de la distancia y la Fisher solo de LLR se calculan mediante llr_range_m y reflector_inertial con la serie analítica de la Luna (ephem::moon_position, a unos { "0.3" } grados del GCRS) y sin tiempo de luz

# text
seg-a78ba110b64c = Modelo de distancia medida LLR (catálogo de reflectores, estaciones ITRF2020, colocación en ejes principales de DE440, tiempo de luz baricéntrico IERS { "2010" })

# text
seg-c9827c1a427b = La distancia unidireccional entre una estación terrestre y un reflector para un punto normal de telemetría láser lunar: los cinco conjuntos de retrorreflectores de la cara visible en metros del sistema de ejes principales (PA) del cuerpo de DE440 (lunar_llr_geometry::reflectors); las estaciones de stations_itrf(), a saber Grasse { "7845" } y Matera { "7941" } de ITRF2020 en la época { "2015.0" } con sus velocidades, situadas en el Sistema Celeste de Referencia Geocéntrico (GCRS) mediante la transformación IERS { "2010" } con el movimiento polar del Boletín A (lunar_vlbi::station_inertial_position_itrs), y APOLLO { "7045" } en su posición geocéntrica aproximada publicada por el operador (sin velocidad); la colocación de los reflectores del sistema del cuerpo al inercial mediante la orientación PA de DE440 (lunar_orientation::try_de440_moon_pa_body_to_inertial, que da error fuera de 2014-2030); y el tiempo de luz baricéntrico de la Sección { "11.2" } de las Convenciones IERS { "2010" } (lunar_llr_geometry::llr_bcrs_one_way_m: la transformación cuerpo a BCRS de la Ec. { "11.19" } de estación y reflector, y el retardo de Shapiro de la Ec. { "11.17" } del Sol, la Tierra y la Luna). ENTRADAS, que no forman parte de la afirmación: los estados y potenciales baricéntricos de la Tierra, la Luna y el Sol (DE440 mediante SPICE), UT1-UTC y movimiento polar del IERS, y el viaje de ida y vuelta medido convertido de TT a TDB. DEL LADO DEL ARNÉS, que no forma parte de la afirmación: el retardo cenital de Mendes-Pavlis con la función de mapeo FCULa, en la prueba, con la elevación tomada del catálogo geodésico stations(). No modelado: mareas, excentricidades de las estaciones, términos térmicos de los reflectores

# text
seg-536c75eebae3 = Medido: { "192" } puntos normales lunares ILRS CRD v2 (EUROLAS Data Center, DGFI-TUM, 2024-04 a 2024-06; Grasse { "151" }, APOLLO { "32" }, Matera { "9" }; confirmados literalmente con SHA256SUMS). La distancia unidireccional predicha se compara con c por la mitad del viaje de ida y vuelta medido en TDB. Umbral fijado antes de la comparación: RMS como máximo de { "10" } m sobre los { "192" } puntos Y sobre los { "160" } puntos de las dos estaciones ITRF2020 por separado. El umbral procede de la tercera enmienda de preregistro 3e0f5cdf, confirmada antes del cambio del motor y de la ejecución; la cifra de { "10" } m no ha cambiado desde la ronda { "1" }. Medido: { "2.81" } m (media { "2.67" } m) en todos los puntos; { "2.96" } m en las estaciones ITRF2020; APOLLO { "1.94" } m; segmento de { "2015" } ({ "349" } puntos, secundario) { "3.82" } m. Mutación: poner a cero los tramos de Shapiro del Sol da { "10.19" } m, lo que falla. Historial, divulgado: { "96" } m con interpolación de orientación elemento a elemento; { "22.7" } m tras la interpolación geodésica con el catálogo geodésico; { "10.94" } m con estaciones ITRF2020 y movimiento polar pero con tiempo de luz geocéntrico (un desfase común de +{ "10.9" } m). El modelo baricéntrico se escribió después de ver ese desfase. Es el modelo publicado de la Sección { "11.2" } de IERS { "2010" } sin ningún parámetro libre. La tercera enmienda sustituyó una condición autoimpuesta de solo ITRF2020/SLRF2020 tras el resultado BLOCKED. El RMS solo con ITRF2020 pasa sin APOLLO, que no tiene solución ITRF2020 ni SLRF2020 y cuya posición es la aproximada declarada por el operador. Queda un desfase común de +{ "2.7" } m, por debajo del umbral y sin ajustar. El umbral es holgado respecto al resultado: un término solar ausente de { "7.6" } m sigue dando { "10.19" } m. Los términos por debajo del umbral no se resuelven uno a uno: con el movimiento polar a cero el RMS es { "6.15" } m (estaciones ITRF2020 { "5.98" } m), y con la transformación de la Ec. { "11.19" } eliminada es { "2.96" } m; ambos seguirían pasando. Las velocidades de las estaciones y los términos de Shapiro de la Tierra y la Luna son aún menores. La comparación valida la distancia unidireccional ensamblada con un RMS de { "10" } m y el término de Shapiro solar, no cada componente enumerado

# text
seg-9b1dfa736cb6 = Calibre acoplado de marco y escala de tiempo lunares: el espacio nulo conjunto de datum espacial, desfase de reloj y deriva de reloj

# text
seg-a000ef6ab2e0 = assemble_coupled_info construye la Fisher acoplada de 9 parámetros sobre [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space devuelve una descomposición de su espacio nulo invariante respecto a la base en dimensiones solo espaciales, solo temporales y genuinamente acopladas, además de la norma de acoplamiento del proyector de espacial a temporal; coupled_marginal_eigs da el marginal por complemento de Schur { "{" }scale, offset{ "}" }. En las redes confirmadas, el motor notifica un datum de rango completo (defecto { "0" }) para el caso bien planteado y un defecto exacto de una sola dirección de deriva para el caso de una sola época (tiempo transcurrido cero, de modo que la deriva es inobservable por construcción), y calcula el marginal { "{" }s, d_tau{ "}" } en ambos.

# text
seg-35eebbc8a2e9 = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: kshana calcula la descomposición en valores propios con su propio resolutor de Jacobi escrito a mano (fim::sym_eig) y el marginal con su propia pseudoinversa; la referencia independiente recalcula ambos con numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) mediante scripts/gen_coupled_gauge_ref.py. La coincidencia con rel<{ "1e-3" } es, por tanto, una comprobación con biblioteca independiente de LA ARITMÉTICA DE ESTE CRATE frente a una implementación estándar, que es la afirmación Validada y todo su alcance. LO QUE NO: el ensamblado y la clasificación del espacio nulo son reglas propias de este módulo, y la referencia independiente las reproduce a partir de la misma especificación y no de una fuente independiente: eso corrobora la implementación, no la regla. La geometría de balizas y orbitadores es Modelada y representativa. Las filas de observación sí llevan la orientación PA real de la Luna de DE440 (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), pero esa es una ENTRADA que reciben ambos lados, no evidencia sobre la respuesta, y se registra aquí como procedencia y no como justificación del estado: la misma distinción que main ya establece en la fila de integridad de modo común. Cada flotante de las filas se redondea a { "6" } decimales antes de escribir network.json, de modo que ambos lados leen dobles IEEE-754 idénticos y la única diferencia restante es el resolutor.

# text
seg-63a8571f8eb0 = Degeneración entre distancia y desfase de reloj en telemetría lunar unidireccional, y la ley de diseño de diversidad geométrica

# text
seg-cdd70f56051a = La degeneración por nodo entre distancia radial y desfase del reloj del receptor es exacta en { "1" } m a { "3.336" } ns (uno sobre c). El marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) muestra que, en una red geométricamente diversa, la telemetría bidireccional eleva el marginal en aproximadamente el mismo factor que un número igual de datos unidireccionales adicionales, mientras que en el régimen idealizado de un solo nodo la elevación bidireccional es de órdenes de magnitud mayor. La ley de diseño que se deduce: la diversidad geométrica, y no la telemetría bidireccional como tal, es lo que separa la escala del marco lunar del desfase de la escala de tiempo en la telemetría unidireccional; un enlace de tiempo bidireccional o externo solo es necesario en el régimen de baja diversidad o de un solo usuario.

# text
seg-25dd0e9134c8 = Fisher marginal por complemento de Schur de la matriz de información acoplada, en álgebra lineal de forma cerrada, comprobada frente a los dos regímenes límite que predice. La equivalencia de { "1" } m a { "3.336" } ns es la definición del metro mediante c y no es un resultado empírico. Las redes de observación son geometría Modelada representativa, por lo que la ley de diseño es una afirmación sobre la geometría que se le presenta y no hace ninguna afirmación sobre ninguna red lunar desplegada.

# text
seg-16ec8283f9b4 = Acoplamiento relativista entre deriva de reloj y marco para la escala de tiempo lunar

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) da la sensibilidad de la deriva de la escala de tiempo lunar a la realización del marco, a partir del potencial efectivo ecuatorial truncado en el grado { "2" } (GM, radio ecuatorial, J2, rotación; LunarSurfacePotential): d_alpha/d_scale = L_m, aproximadamente +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, aproximadamente -1.11e-14 (dependiente del tiempo); d_alpha/d_r_radial = g_eff/c^{ "2" }, aproximadamente +{ "1.806e-17" } por metro. Para un desplazamiento radial del datum de { "1" } m esto es una perturbación de deriva de aproximadamente { "1.8e-17" } (una consecuencia aritmética de la entrada radial), muy inferior al desfase de deriva de unos { "1.7e-11" } de una escala de tiempo lunar respecto a TT

# text
seg-6fc3d01ea825 = Preregistrado (5590ab21): L_m frente a Ashby y Patla { "2024" } (AJ { "167" }:{ "149" }) Ec. ({ "10" }), { "3.13881" }({ "15" })e-11, a partir de GM, a_m, omega_m del artículo y el J2 de los dos campos de grado 350 que el artículo cita (Bertone et al. { "2021" }, AIUB-GRL350A/B), dentro de { "1e-4" }; la entrada radial frente a la gravedad ecuatorial de pyshtools { "4.14.1" } (BSD-3) de los mismos campos dentro de { "1e-4" } (medido { "8.3e-5" } y { "6.7e-5" }, un margen estrecho); la entrada de velocidad frente a la velocidad lunar de JPL Horizons DE441 dentro de { "4.5e-3" }. Una forma cerrada de grado 2 de un valor publicado de grado 350 (residuo de grado 3-350; Referencia, no P1). Divulgado: el resultado de la entrada 1 se conocía antes del preregistro, y el radio por defecto distribuido de { "1738.14" } km es la definición de superficie del artículo, adoptada tras la ronda { "1" }. Las contribuciones de marea y la banda de comparación siguen siendo cifras de superficie de referencia Modeladas

# text
seg-a666792106d9 = Clasificación invariante respecto a la base del espacio nulo acoplado de marco y escala de tiempo

# text
seg-5ee36574d1b4 = classify_null_space descompone el espacio nulo del datum en partes solo espaciales (dimensión d menos rango U_T), solo temporales (d menos rango U_S) y genuinamente acopladas (rango U_S más rango U_T menos d), además de la norma de acoplamiento del proyector de espacial a temporal p_st_norm, la norma de Frobenius del bloque fuera de la diagonal del proyector del espacio nulo. Cada una de estas magnitudes es una función del PROYECTOR y no de una base elegida, por lo que son invariantes ante cualquier elección ortonormal de vectores nulos, que es lo que hace que la clasificación sea notificable.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space y numpy.linalg.svd, LAPACK gesdd) clasifican las mismas matrices confirmadas mediante intersección de subespacios, dim null([F; E_T]) y dim null([F; E_S]), y el proyector del espacio nulo por SVD, que difiere de los vectores propios de Jacobi y de las fórmulas de rango de Gram de Kshana; preregistrado (d429993c): enteros exactos, p_st_norm a { "1e-9" } (P2, una biblioteca numérica independiente), con el umbral de rango fijado de antemano y un salto espectral de al menos { "1e6" } comprobado. La afirmación de la fila es la clasificación de una matriz dada, de modo que P2 la cubre por completo. Los casos construidos incluyen espacios nulos de suma directa, acoplados y mixtos, y cambios de base aleatorios; las dimensiones de la red real de la fila de calibre acoplado no se vuelven a contar aquí. Se conserva la prueba de invarianza en el propio crate (una base nula rotada da resultados idénticos)

# text
seg-2c074d6260ba = Menú representativo de mediciones multitécnica y regla aditiva de combinación de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock contiene una campaña de medición candidata como una contribución de información de Fisher de 7x7 más un coste relativo escalar; block_from_rows construye uno a partir de filas crudas del jacobiano del datum, de modo que todos los bloques se preacondicionan de forma idéntica mediante lunar_identifiability::assemble_multi_info; combine suma la información de un subconjunto elegido, que es la regla correcta porque la información de Fisher es aditiva entre mediciones independientes; representative_lunar_menu aporta un menú determinista de cuatro bloques (LLR, una baliza transversal de limbo VLBI, un orbitador de la cara visible y un orbitador de la cara oculta). El optimizador de diseño con restricción de presupuesto que consume este menú no forma parte de este crate.

# text
seg-d83a9942ee72 = La aditividad de la información de Fisher entre mediciones independientes es una propiedad de forma cerrada, comprobada aquí frente a una suma elemento a elemento escrita de forma independiente y frente a la invarianza respecto al orden y la monotonía que se derivan de ella. NOTA SOBRE LA EVIDENCIA: el combinador antes no tenía ninguna prueba, y la única prueba del módulo sumaba las dos matrices de información en línea en lugar de llamarlo, de modo que un combinador defectuoso habría dejado el módulo en verde; ahora la prueba pasa por combine y falla cuando se muta. Todas las ubicaciones de balizas, la geometría de orbitadores, las precisiones por técnica y los costes relativos son elecciones representativas y no valores de misión (véase tests/fixtures/llr_geometry/NOTICE.md), por lo que toda métrica de degeneración y toda cifra de CRLB alcanzada a través de este menú hereda el estado Modelado de lunar_identifiability::decompose.

# text
seg-341eedfc47da = Consistencia lunar de marco y dinámica entre proveedores (inter-efemérides real)

# text
seg-f8d94c0771cc = descomposición solo de rotación (traslación+rotación de 6 parámetros) del desacuerdo geocéntrico de la Luna entre DE440/INPOP21a/EPM2021 en un enlace de marco ICRF común reducible y un exceso irreducible de orientación de la órbita lunar (el ajuste completo de Helmert de 7 parámetros es una función pública distinta que NO cubre esta comprobación externa: su evidencia es una prueba unitaria interna de recuperación analítica más tests/lunar_helmert_fit_cross_check.rs, que lo contrasta con el ajuste exacto de Gauss-Newton Validado de lunar_frame_realise y fija la convención de signo de rotación opuesto entre ambos)

# text
seg-c69fd3fc645b = Tres efemérides independientes y de referencia: DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS), muestreadas mediante calceph del IMCCE, contrastadas con un ajuste por mínimos cuadrados SVD de numpy independiente. POR QUÉ ESTO ES Validado DONDE lunar_common_mode NO LO ES, con las mismas tres efemérides: aquí la magnitud notificada ES una propiedad de los datos publicados (su desacuerdo mutuo), de modo que las efemérides son la referencia independiente y no una entrada. En lunar_common_mode el mismo desacuerdo alimenta una geometría de constelación MODELLED y la respuesta es una propiedad de ese modelo, razón por la cual esa fila es correctamente Modelled/ReferenceImpl.

# text
seg-2d3347bcb15e = Tolerancia de consistencia entre proveedores para un usuario con proveedores mixtos

# text
seg-9decf2cb6b0c = consistency_tolerance: invierte un presupuesto de posición del usuario en un requisito de acuerdo de Helmert entre proveedores por parámetro (origen/escala/rotación) con un brazo de palanca de referencia, opcionalmente inflado por la CRLB de realización de un solo proveedor P1

# text
seg-b8dc68eb4bda = Cota del peor caso por desigualdad triangular de la acción del jacobiano puntual de Helmert (forma cerrada)

# text
seg-5450d921dfc9 = Presupuesto de error de interoperabilidad lunar multiproveedor y ley de diseño de marco frente a efemérides

# text
seg-e1e30f5c17a6 = interop_budget: división entre reducible (enlace de marco común) e irreducible (dinámica) bajo las convenciones PerProvider / CommonFrameTie / CommonEphemeris, con la métrica de ley de diseño de fracción irreducible (~{ "0.69" } con DE440/INPOP/EPM reales: una etiqueta de marco común por sí sola deja el suelo dominante)

# text
seg-46304ae1efa4 = Agregación RMS de las divisiones por pares Validadas bajo cada convención (forma cerrada)

# text
seg-a01f394a36d3 = Cadena de álgebra lineal de observabilidad de fallos de red libre autónoma (proyector de paridad, detectabilidad, no centralidad MDB, chispa de bloque bizantino)

# text
seg-b3389bb90e8d = En la red lunar por nodo real de DE440 (cada fila una distancia unidireccional diferencial entre nodos construida mediante pernode_range_row con una línea de visión real en el sistema PA de la Luna de DE440), el motor calcula el proyector de paridad ponderado P⊥ = I − G(GᵀWG)⁺GᵀW (la forma de pseudoinversa deficiente de rango que sobrevive al calibre de 8 dimensiones datum⊕escala de tiempo), el residuo de detectabilidad T1 ‖P⊥·b‖ (fallos dentro del rango anulados, fallos genéricos detectables), la forma cuadrática de no centralidad MDB de Baarda cᵀWP⊥c (la forma ponderada correcta con un solo P⊥, NO la forma con doble P⊥ cᵀP⊥WP⊥c) con MDB = √(λ₀/cᵀWP⊥c), y los recuentos de detección/identificación de chispa de bloque bizantino de las firmas efectivas apiladas de los pares P⊥·B_T (rango de columna, no meramente distinto de cero)

# text
seg-8cb248423fd0 = Reproducción independiente de álgebra lineal con numpy/scipy sobre filas reales de línea de visión en el sistema PA de la Luna de DE440 (P⊥ a partir de la SVD del diseño blanqueado W^{ "{" }1/2{ "}" }G; la no centralidad MDB a partir de la norma al cuadrado del subespacio de paridad clásico de Baarda ({ "1968" }); el rango del bloque a partir del recuento de valores singulares de una SVD de numpy), una vía numérica genuinamente distinta de la descomposición en valores propios de Jacobi cíclico de GᵀWG del crate. Alcance (según tests/fixtures/faultobs/NOTICE.md): esto valida la CADENA DE ÁLGEBRA LINEAL solo en estas filas. La geometría de los nodos es Modelada. NO es una garantía operativa de integridad, ni una certificación de nivel de protección, ni ninguna afirmación de disponibilidad RAIM/ARAIM, y NO es una garantía de misión de tolerancia a fallos bizantinos: el RECUENTO de fallos tolerados para esta red es Modelado, mientras que la COTA de chispa por bloques de detección>f / identificación>2f es Citada (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; chispa por bloques de Donoho–Elad { "2003" }) y es una instanciación demostrada en el código

# text
seg-ebb827739614 = Cota de chispa por bloques bizantina de detección/identificación en la red lunar autónoma por nodo (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia la cota de codificación / observabilidad dispersa de la estimación segura de estado sobre la geometría de la red por nodo: un par bizantino inyecta una combinación lineal arbitraria de las mediciones en las que participa, y la red DETECTA cualquier coalición de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única cualquier coalición de ≤ ⌊(block_spark − { "1" })/2⌋, donde block_spark es la menor coalición de pares cuyas firmas efectivas apiladas P⊥·B_T tienen rango de columna deficiente. La detectabilidad de un par es el RANGO DE COLUMNA COMPLETO de P⊥·B_j (un bloque distinto de cero pero con rango deficiente es un ataque distinto de cero que cae en range(G) y no deja residuo), no meramente P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Instanciación geométrica de la cota de chispa por bloques / estimación segura de estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; chispa por bloques de Donoho–Elad { "2003" }; Candès–Tao { "2005" }), NO el umbral de consenso 3f+{ "1" } de Lamport–Shostak–Pease ('bizantino' nombra únicamente el MODELO de fallo arbitrario/colusorio). El recuento concreto de fallos tolerados es una propiedad Modelada de la geometría representativa de la red, comprobada en cuanto a autoconsistencia mediante casos analíticos construidos a mano y las fórmulas de recuento

# text
seg-4f57f586cf82 = Suelo de calibre temporal de holdover autónomo para la constelación lunar autorreferencial (T4)

# text
seg-eb690e8f5c9b = holdover_floor establece que, en un conjunto de nodos autónomos conectados únicamente por mediciones entre nodos, la deriva de reloj común (δα_j += { "1" } ∀j) es un parámetro libre del tiempo del conjunto que pertenece a N(GᵀWG): ninguna cantidad de telemetría adicional entre nodos puede observarla (rate_in_gauge = true, temporal_gauge_dim = { "2" } con el desfase común). Este es el verdadero suelo de holdover, el análogo temporal del calibre de posición del marco rígido. Añadir un enlace externo de deriva absoluta (un enlace directo a una referencia fuera de la red) expulsa la deriva común del espacio nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), lo que demuestra que el suelo es un calibre real y no un artefacto del modelo de oscilador

# text
seg-097f126797bb = Argumento del parámetro libre del tiempo del conjunto (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado en la red representativa por nodo con DE440 real: una prueba de nulidad de residuo relativo del generador analítico de deriva común frente a GᵀWG, con el contraste de ruptura de empate que distingue el calibre genuino de un artefacto del modelo de oscilador. Geometría Modelada representativa, no un presupuesto de temporización certificado

# text
seg-25ffd6e1979c = División común/diferencial por proveedor, unificación de la deficiencia de un rango y pendiente de la brecha de protección (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Tres facetas de la descomposición única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), con el calibre datum⊕escala de tiempo de 8 dimensiones como N(G) y las state_dim − { "8" } = { "32" } direcciones observables como range(G): (T5) provider_mismatch_split clasifica un sesgo común multiproveedor (∈ range(G)) como INDETECTABLE, ya que requiere un enlace externo, y un sesgo diferencial (∉ range(G)) como automonitorizado / DETECTABLE; (§{ "0" }) la unificación consiste en que el MISMO subespacio ciego range(G) gobierna la clase de fallo indetectable, de modo que el calibre del datum N(G) y el subespacio ciego a fallos range(G) son una sola geometría, no dos; (g7) slope devuelve la pendiente de brecha de protección de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para un fallo b ∈ range(G) (estimador corrompido con paridad cero) y finita para un fallo detectable

# text
seg-e0fd3860fce9 = Álgebra de forma cerrada del proyector de paridad / pseudoinversa en la red representativa por nodo con DE440 real: la división común/diferencial, la unificación N(G) ⊕ range(G) y la pendiente de brecha de protección de Brown ({ "1992" }) se deducen todas de la anulación del rango P⊥·G = { "0" }. Geometría Modelada representativa, no un nivel de protección certificado

# text
seg-101b0551d987 = MTIE y TDEV de temporización de telecomunicaciones sobre una serie de error de tiempo en holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = El error máximo de intervalo de tiempo y la desviación de tiempo que informa el tipo de escenario <c1/>, sobre un registro de holdover a escala de telecomunicaciones: un MTIE de ventana deslizante de cola monótona O(n) (telecom_timing::mtie_sliding, necesario para que un día de muestras de un segundo siga siendo rápido) y el TDEV del motor (allan::time_deviation), evaluados en la rejilla que informa el tipo y leídos de vuelta de una ejecución completa que ingiere la serie

# text
seg-59cb2711355c = allantools { "2024.06" }, una biblioteca independiente de terceros de estabilidad de frecuencia: mtie() y tdev() sobre tests/fixtures/telecom_timing/holdover_te_series.csv, con la serie analizada a partir del mismo texto de 17 cifras significativas en ambos lados; la referencia registra el SHA-256 de la serie y es regenerable sin conexión mediante tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida los ESTIMADORES en este registro, no el holdover sintético que lo produjo

# text
seg-632add2dbd3c = Máscaras de sincronización de telecomunicaciones de ITU-T con PASS/FAIL y margen

# text
# c1: telecom-timing
seg-47687529aee7 = Límites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado y holdover de ePRTC-A (incluida la envolvente de error de tiempo de la Tabla { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) clases T-BC/T-TSC A-D y G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punto de referencia C, cada intervalo abierto o cerrado tal como lo indica la tabla, con todas las entradas 'para estudio ulterior' omitidas; un veredicto y un margen en el punto limitante de cada comprobación, y el tiempo que tarda en superarse cada presupuesto. Ejecutable como tipo de escenario <c1/>

# text
seg-46b139a58bb0 = Transcripción de las Recomendaciones indicadas (de descarga libre en itu.int), con cada límite acompañado de su tabla o cláusula, enumeradas con cada elemento sin confirmar o sin implementar en docs/TELECOM-TIMING.md; las identidades de continuidad de los puntos de quiebre que implican las tablas se comprueban en las pruebas. Una transcripción de normas con comprobaciones de consistencia interna, no una prueba de ajuste a la norma ni una validación externa. { "0.30" } ronda { "2" } (preregistrado 970003ee), bloqueado (sigue siendo MODELLED): los diez valores de máscara y los trece valores de holdover de ePRTC-A que las Recomendaciones imprimen como números resueltos (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } y Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 a 7-4) se reproducen dentro de media unidad impresa, la mayoría constantes de tabla o puntos de quiebre; la Fig. 7-2 de G.8271.1 rotula { "200" } ns a { "1.3" } s frente a su propia Tabla 7-1 ({ "197.5" } ns). Los límites de las clases A-D de G.8273.2 no tienen ningún valor resuelto impreso, y las etiquetas de los puntos de quiebre de ePRTC bloqueado de G.8272.1 (sobre líneas de construcción continuas) se excluyeron por la regla de selección preregistrada, por lo que siguen siendo transcripciones

# text
seg-165ed2bc771a = Máscaras de generación de wander de sincronización de frecuencia de ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Siete máscaras de generación de wander MTIE y TDEV a temperatura constante para el tipo <c1/>: G.811 (09/1997) PRC (autónomo), G.812 (06/2004) Tipos I, II y III, G.8262 (10/2024) EEC Opciones { "1" } y { "2" } y G.8262.1 (11/2025) eEEC (modo bloqueado), incluidos los tramos de ley de potencia que escriben las tablas (<c2/> y similares), cada intervalo abierto o cerrado como se imprime, medidos a través del filtro de { "10" } Hz que indican las cláusulas (tomado como aplicado antes del muestreo); el escenario de referencia scenarios/telecom-synce-eec.toml enfrenta un OCXO en marcha libre con las tres máscaras EEC. No implementado: las tolerancias de temperatura variable, el holdover, los transitorios, el jitter y la exactitud de frecuencia de G.811

# text
seg-ca16d9c98dc5 = Transcripción de las Recomendaciones indicadas (descargadas de itu.int el 2026-10-13), con cada fila releída frente al texto, y con la continuidad de los puntos de quiebre que implican los coeficientes impresos acotada en las pruebas (por ejemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns frente a la meseta de { "100" } ns de la Tabla { "4" } de G.812). Una transcripción de normas con comprobaciones de consistencia interna, no una prueba de ajuste a la norma ni una validación externa. G.812 (06/2004) figura como sustituida por una edición previamente publicada de 08/2026 y G.811 tiene una Amd. { "1" } (04/2016); no se pudo leer ninguna de las dos, por lo que ninguna está comprobada. El escenario de OCXO en marcha libre sobrestima la contribución del oscilador en intervalos de observación largos frente a la constante de tiempo de un lazo; no dice nada sobre ningún reloj de equipo

# text
seg-5fc2ad88faf0 = Formatos de registro de reloj (reloj RINEX, ASCII de TimeLab, TICC de TAPR) leídos a una serie de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: una capa de análisis que convierte un archivo de reloj RINEX (registros AS/AR de un reloj con nombre, versiones { "2" } y { "3.00" } a { "3.04" }), un registro ASCII de fase o frecuencia al estilo de TimeLab, o un registro de marcas de tiempo o intervalos de TAPR TICC en una rejilla de fase uniforme, con tau0 indicado, tomado de una cabecera o como el espaciado mediano, con cada hueco, lectura fuera de rejilla y duplicado contabilizados, y una política de huecos de rechazo, tramo más largo o lineal; conectada de forma opcional a la serie de telecom-timing (<c1/>, que añade un bloque <c2/>) y al tipo clock (<c3/>, que añade un bloque <c4/> con ADEV, TDEV y MTIE, el SHA-256 de la tabla y el SHA-256 de la fase; runs = { "1" }). Sin la tabla, ambos tipos son idénticos byte a byte

# text
seg-1d3df655c14c = Preregistrado en tests/fixtures/clock_log/PREREGISTRATION.md (confirmado solo, 159334f2, antes de que existiera el fixture); registrado en RESULTS.md. Tres registros sintéticos con semilla, uno por formato (un hueco de TICC de tres épocas, un segundo reloj RINEX que se ignora), leídos de vuelta por un lector independiente escrito a partir de docs/CLOCK-LOG-FORMATS.md por el mismo autor: los recuentos de rejilla, huecos y relleno coinciden y la mayor diferencia de fase es { "0" } s (umbral { "1e-13" } s). oadev, tdev y mtie de allantools { "2024.6" } sobre esa fase coinciden dentro de un { "2.5e-14" } relativo (umbral { "1e-10" }) en cada factor de promediado que evalúa; no evalúa el MTIE sobre todo el registro, que es lo que informa el motor, por lo que ese punto por registro no tiene valor de referencia independiente y el umbral tal como está redactado no se alcanza ahí. MODELLED: registros sintéticos, y el lector de referencia independiente comparte autor; no se compararon archivos reales de reloj de TimeLab, TICC ni RINEX procedentes de instrumentos

# text
seg-acdb0337bce7 = Formatos de registro de reloj de linuxptp (ptp4l, phc2sys, ts2phc) y chrony (tracking, statistics) leídos a una serie de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input con los formatos ptp4l, phc2sys, ts2phc, chrony-tracking y chrony-statistics: el desfase registrado de una línea de servo de linuxptp (ns, la propia marca de tiempo entre corchetes de la línea, con las lecturas anteriores a la primera notificación de s2 del servo omitidas y contabilizadas) o de un registro tracking o statistics de chrony (s, por posición de columna, fecha y hora UTC) se convierte en una rejilla de fase uniforme mediante las mismas políticas de huecos que los demás formatos; un selector de fuente (<c1/>) nombra una de varias interfaces, relojes o direcciones; los registros alimentan la serie de telecom-timing, el tipo clock y el tipo holdover-test

# text
seg-fb9393044576 = Fixtures escritos para Kshana a partir de los diseños de línea públicos de los demonios, con valores inventados (NOTICE.md en la carpeta del fixture); no se leyó ningún registro de una instalación real y ninguna referencia independiente compara el análisis con otro lector, de modo que un diseño que difiera entre versiones del demonio aún puede ser rechazado o malinterpretado. Los estimadores alimentados por la serie de fase son los validados frente a allantools en las filas anteriores

# text
seg-97aebb84576e = Prueba de holdover puntuada a partir de un registro de error de tiempo suministrado por el operador

# text
# c1: holdover-test
seg-ab533cf99c56 = El tipo <c1/>: un registro de error de tiempo (un registro de reloj de linuxptp, chrony, TICC, TimeLab o RINEX, o pares time_s,time_error_ns) se divide, en los dos instantes que el operador indica para la retirada y la restauración de GNSS, en una etapa de línea base, una de holdover y una de recuperación; la línea base se mide frente a las máscaras de ITU-T escritas para un reloj bloqueado y el holdover frente a las escritas para holdover o un reloj autónomo, la envolvente de holdover de ePRTC-A y los presupuestos de error de tiempo; el holdover informa del desfase de frecuencia por mínimos cuadrados que mantuvo el sistema, y la recuperación informa de si |TE| entró en una banda indicada y cuándo, y permaneció en ella durante una permanencia indicada, con el pico y el mayor salto. Cada límite es el que transcribe el tipo telecom-timing; los dos instantes son una declaración del operador y no se verifican

# text
seg-a54380cf95ea = Cálculo a mano sobre registros construidos con fórmulas cuya pendiente, salto, extremo y tiempo de recuperación se conocen antes de la ejecución (las pruebas los indican), y las máscaras, la envolvente y los presupuestos de las filas de telecom-timing anteriores. No se puntuó ninguna medición de laboratorio de un holdover real ni se comparó ninguna referencia independiente externa, por lo que el tipo no hace ninguna afirmación sobre ningún reloj ni sistema; se necesita un socio de laboratorio de temporización antes de poder promover cualquier cifra por clase de reloj

# text
seg-94cbac97a1aa = Disponibilidad de señales GNSS en el Volumen de Servicio Espacial y más allá, comparada con el folleto SSV del ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Los barridos de disponibilidad del tipo <c1/>: por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y combinadas, la proporción de pares (usuario, época) con al menos una y al menos cuatro señales y la interrupción más larga, para un usuario sobre una esfera (la capa global de 2,562 puntos del folleto, { "14" } días a { "1" } minuto) o sobre una trayectoria (GEO, HEO, transferencia lunar), a partir de las órbitas keplerianas del anexo C del folleto, una potencia radiada mínima constante dentro del ángulo de referencia fuera del eje, bloqueo terrestre por la esfera más { "50" } km y un umbral de C/N0; antenas de usuario de la tabla B10 del folleto

# text
seg-d71c9d361342 = El folleto del Volumen de Servicio Espacial del ICG (UN OOSA ST/SPACE/75, { "2018" }), que es en sí mismo una simulación, comparado bajo un preregistro confirmado antes de la ejecución (xval/gnss-ssv/PREREGISTRATION.md; resultados en xval/gnss-ssv/RESULTS.md, fijados por tests/ssv_booklet_results.rs, fallos incluidos). Ejecución { "1" } con la lectura preregistrada: las constantes de potencia radiada mínima y el umbral lunar coinciden (S0 y S6 alcanzados); los umbrales de SSV superior, SSV inferior, umbral de RF, GEO y HEO son NOT MET, casi todos por GLONASS, para el que el folleto da { "20" } y { "28" } grados en las tablas B2 y B6 y { "26" } y { "34" } grados en la tabla { "4.2" }. Una variante de diagnóstico con los ángulos de la tabla { "4.2" } coincide en todas las celdas del SSV superior, el SSV inferior y las seis misiones GEO (no sustituye a la ejecución { "1" }; las celdas de RF, HEO y lunares siguen fallando). Los patrones medidos de panel de GPS L1 no se reproducen con el sustituto paramétrico (RMS { "6" } a { "9" } dB frente a un umbral de { "3" } dB). La coincidencia muestra que el método declarado del folleto se reproduce, no que las señales GNSS se comporten así

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efectos de ionosfera, plasmasfera y atmósfera en el rayo del limbo sobre señales GNSS rasantes, y el diseño de receptor de señal débil, en el tipo <c1/>

# text
seg-1a1786ba90b6 = Una ionosfera de Chapman, una plasmasfera de tipo Gallagher y una atmósfera neutra (curvatura por refractividad, absorción de oxígeno, desenfoque) integradas a lo largo del rayo recto entre transmisor y usuario: contenido total de electrones oblicuo, su parte plasmasférica, retardo en exceso, altitud tangente y la pérdida en enlaces rasantes; y un diseño de receptor de señal débil (integración coherente y no coherente, límite de bits de datos, ayuda externa, búsqueda Doppler) que fija el umbral de C/N0 a partir de los modelos de adquisición y de lazo de seguimiento

# text
seg-4ca1217472ab = Formas cerradas y magnitudes publicadas en las pruebas (el pico de una capa de Chapman y la curvatura del limbo de superficie, unos pocos TECU de plasmasfera en un rayo de GPS a GEO); el diseño de receptor reutiliza los modelos de adquisición y de lazo de seguimiento y sus pruebas. No se compara con él ningún dato medido de sondeo del limbo ni de recepción de señal débil

# text
seg-6b8f9f3ca2a3 = Filtro de navegación GNSS a bordo para naves de órbita alta y de transferencia lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = El modo <c2/> del tipo <c1/>: un filtro de Kalman extendido de nueve estados (posición, velocidad, sesgo y deriva del reloj del receptor, una escala de presión de radiación solar) sobre pseudodistancias cuya disponibilidad, ruido y C/N0 proceden de la misma geometría de enlace que los barridos; la verdad de referencia se integra con J2, tercer cuerpo del Sol y la Luna y presión de radiación con sombra, el filtro modela J2 y los terceros cuerpos y estima la presión de radiación; informa de los errores de posición y velocidad dentro y por encima de las órbitas GNSS, el mayor hueco de mediciones y el NEES medio

# text
seg-469602656ab4 = Verdad simulada frente a la propia estimación del filtro (el error de estimación normalizado al cuadrado medio de un filtro consistente es de aproximadamente { "3" } para la posición) y determinismo para una semilla fija. No se compara ningún dato de vuelo ni registrado de GNSS en órbita alta; el Sol y la Luna son sustitutos circulares de baja precisión

# text
seg-5fc242476828 = Navegación relativa de una formación de varias naves en una órbita muy elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = El modo <c2/> del tipo <c1/>: una nave principal y sus subordinadas ejecutan cada una el filtro absoluto; la posición de la subordinada respecto a la principal se estima restando las estimaciones absolutas y mediante un filtro relativo sobre pseudodistancias de diferencia simple de las señales que ambas naves siguen, con la dinámica relativa como la diferencia de dos trayectorias no lineales

# text
seg-69c078b57fc8 = La misma verdad simulada que el filtro absoluto: el error del filtro relativo frente al estado relativo verdadero, y la comprobación de que lo hace al menos tan bien como restar dos soluciones absolutas independientes. No se compara ningún dato de formación en vuelo

# text
seg-7038f6902820 = Términos de error del interferómetro de átomos fríos: ruido de fase del láser Raman, sesgo por curvatura del frente de onda y resolución de la ambigüedad de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funciones de biblioteca, aún no accesibles desde un tipo de escenario): la función de ponderación de fase Raman de un interferómetro de tres pulsos de pulso cuadrado (Cheinet et al. { "2008" }, Ec. { "8" }) con la forma cerrada de fase blanca (pi/2)^{ "2" } S_phi0/tau_R y una vía numérica para cualquier espectro; el ruido de frecuencia del láser que el retardo de retrorreflexión no cancela (Le Gouet et al. { "2007" }, Ecs. { "9" } a { "11" }); el sesgo de frente de onda de desenfoque puro sigma_v^2/R de una nube térmica y su reducción mediante un radio de detección; la probabilidad de índice de franja erróneo erfc(pi/(sqrt({ "2" }) s)) para una ayuda de acelerómetro clásico y para dos tiempos de interrogación, y su inversa

# text
seg-a7b220763674 = Cada forma cerrada frente a una vía numérica independiente en las pruebas (cuadratura en el dominio de la frecuencia de la función de transferencia exacta y del filtro de retardo, un Monte Carlo sobre átomos para el sesgo de frente de onda, un Monte Carlo sobre disparos para el índice de franja) y sus casos límite. Un valor resuelto publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) indican que con tau_R = { "20" } us hace falta un ruido de fase Raman blanco por debajo de -111 dB rad^2/Hz para { "1" } mrad por disparo; el término blanco por sí solo da { "0.99" } mrad (el artículo deriva el nivel con su Ec. { "17" }, flicker más blanco). Consistencia interna y un valor resuelto, no una validación externa; no se modelan las aberraciones de orden superior ni el ruido de ningún láser concreto

# text
seg-c380ec16a4f8 = Grados de libertad equivalentes exactos de Greenhall y Riley de las varianzas de Allan, de Allan modificada y de Hadamard

# text
seg-dee2a54c5019 = allan::edf_greenhall (con los envoltorios edf_greenhall_adev, _mdev y _hdev): el algoritmo completo de Greenhall y Riley, Proc. 35th PTTI ({ "2003" }), Sección { "3" } (Ecs. { "7" } a { "13" } y los coeficientes de J grande de las Tablas { "1" } a { "3" }), para órdenes de diferencia { "1" } a { "3" }, exponentes de ruido +{ "2" } a -4 siempre que alpha + 2d > { "1" }, estimadores solapados y no solapados, modificados y no modificados; NaN donde no se aplica, incluido el caso de PM blanco no modificado con ceil(M/S) <= d, cuya forma cerrada no está implementada. assurance::uncertainty::edf ahora comparte el código y conserva sus salidas bit a bit

# text
seg-695ec24f9676 = ci.edf_greenhall de allantools { "2024.6" }, una implementación de terceros del algoritmo publicado, ejecutada por scripts/gen_greenhall_edf_ref.py sobre la rejilla preregistrada en xval/greenhall-edf/PREREGISTRATION.md (confirmada sola, 0db0bb7a, antes de cualquier comparación): en los { "4 876" } puntos en los que devuelve un edf finito, kshana coincide dentro de un { "6.0e-13" } relativo (umbral { "1e-9" }); en sus { "46" } puntos de NotImplementedError kshana devuelve NaN; aparece cada etiqueta de caso; los envoltorios son iguales al núcleo bit a bit; uncertainty::edf es idéntico bit a bit en { "274 280" } valores (fijado como SHA-256 antes del refactor). En { "32" } puntos (alpha -4, d { "3" }, no modificado, caso { "2.2" }) allantools falla en su búsqueda en la Tabla { "2" }, por lo que no tienen valor de referencia independiente y no se cuentan. No se ejecutó Stable32. { "0.36" } revisión (docs/revisions/STUDIO15-greenhall-edf-portable.md): con matemáticas portables el núcleo toma su logaritmo de una evaluación de doble-doble redondeada una sola vez (allan::greenhall_ln), y el Umbral { "1" } sin cambios vuelve a satisfacerse en los { "4 876" } puntos, con peor caso relativo de { "6.0e-13" }; la protección de uncertainty::edf se rebasa sobre el volcado portable de { "0.36" } ({ "3 746" } de los { "274 280" } valores cambiaron, como máximo { "1.6e-12" } en términos relativos, respecto a la base de matemáticas del anfitrión)

# text
seg-363705e03bac = Preajustes de holdover de osciladores a partir de hojas de datos públicas

# text
seg-9750d9e0ec7a = Cuatro preajustes (OCXO (Microchip OX-208), rubidio (Microchip 8040C), cesio (Microchip 5071A tubo de alto rendimiento) y CSAC (Microchip SA.45s)), cada uno con los máximos de desviación de Allan, el envejecimiento y la cota de temperatura de su hoja de datos; un ajuste de ruido de frecuencia blanco + flicker + paseo aleatorio por mínimos cuadrados no negativos, escalado para envolver cada punto de la hoja de datos, un suelo de flicker nunca inferior a la cifra de τ más largo, envejecimiento lineal y un término de temperatura sinusoidal, sintetizado como un holdover con semilla tras una pérdida de GNSS

# text
seg-95aaa171864b = Las cuatro hojas de datos de Microchip indicadas (números de documento y URL en cada preajuste y en docs/TELECOM-TIMING.md) para las cifras de entrada; la rampa de envejecimiento de forma cerrada y la propiedad de envolvente del ajuste como comprobaciones internas. Cómo se convierten las cifras en un modelo de ruido (el ajuste, la regla del suelo, el mes de 30 días, la lectura lineal de la temperatura) es una decisión de modelado; ningún preajuste es una medición de una unidad. { "0.30" } ronda { "2" }, umbrales unilaterales frente a unidades medidas (preregistrado a01c491c), un hallazgo (sigue siendo MODELLED): la estación IGS THU2 Symmetricom 8040C en los relojes finales de ESA MGEX tiene una desviación de Allan de { "0.35" } a { "0.87" } de la del preajuste de rubidio, pero un error de holdover de { "1.07" } a { "1.60" } veces el de este; el registro del 5071A queda fuera del preajuste de cesio hasta { "1000" } s (ruido de fase blanco de medición, 30x a { "1" } s) y en holdover ({ "1.15" } a { "8.74" }); el peor SA.45s de producción de { "2011" } es 1.26x el preajuste CSAC a { "1" } s; el OX-208 no tiene registro medido (bloqueado)

# text
seg-69f93d5ec864 = Predicción de holdover a partir de un registro de reloj medido, comprobada con datos reservados

# text
# c1: slot-timing
seg-8bdc5a24c66d = La vía de registro medido del tipo <c1/>: la desviación de Allan solapada de un registro de fase ajustada mediante mínimos cuadrados no negativos ponderados por edf en la base de fase blanca y de modulación de frecuencia de IEEE Std { "1139" } (slot_timing::fit_weighted), e invertida después para obtener el tiempo de deriva en el que el error de tiempo alcanza un umbral (slot_timing::slot_budget). El suelo de ruido rojo se mide a partir del registro en lugar de suponerse

# text
seg-c888226296fe = Un reloj atómico real en marcha libre: { "556 990" } muestras de fase de un segundo de un patrón de cesio 5071A medido frente a un máser de hidrógeno (A. Wallin, distribuido con allantools; commit fijado y SHA-256 en scripts/fetch_cs5071a.sh), el mismo registro que usa tests/cs5071a_reference.rs para los estimadores. Los dos tercios reservados son una medición externa que la predicción nunca vio. Condicionado a datos: el flujo de trabajo realdata-clock obtiene el registro y ejecuta la prueba con KSHANA_REQUIRE_REALDATA={ "1" }. Valida la vía de ajuste y luego inversión en un patrón atómico dominado por FM blanca en derivas de hasta unos { "50 000" } s; no las fuentes de hoja de datos o de clase, ni los términos deterministas. NO es un oscilador de cuarzo: en un registro medido de OCXO (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h frente a un máser de hidrógeno) la predicción reservada es conservadora, en { "0.59" } a { "0.70" } de la superación medida, y en su mayor parte queda fuera del umbral, porque el suelo de ruido de ese oscilador se redujo a la mitad durante el registro; dentro de la muestra está en { "0.98" } a { "1.17" }. El caso del cristal sigue siendo MODELLED. Tampoco son relojes atómicos en órbita: en { "10" } relojes de satélites GPS Block IIF (tests/slot_timing_igs_holdout.rs, relojes finales de IGS de { "30" } s, { "14" } días, protocolo escrito antes de la descarga) { "8" } quedan dentro del umbral y { "2" } (G25, G30) son optimistas hasta en torno a 2x, por lo que, bajo el protocolo, el caso orbital sigue siendo MODELLED

# text
seg-d7e03158b972 = Segundos hasta que un reloj en marcha libre sale de la guarda de una ranura indexada en el tiempo, y la cadencia de correcciones que lo mantiene dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = El tipo <c1/>: el error predicho E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para obtener la superación, el tiempo restante, el intervalo de resincronización neto de la latencia de corrección y las correcciones por día, con cada término desglosado y el dominante nombrado; relojes a partir de los seis valores por defecto de ClockClass (TCXO, OCXO y RAFS añadidos, cada uno citando una hoja de datos), los preajustes de telecom-timing, una hoja de datos en línea o un registro medido; una superación más allá del mayor tiempo de promediado de la fuente se marca como extrapolada

# text
seg-cc0464060e58 = Formas cerradas para cada término por separado y la búsqueda de raíz independiente holdover::holdover_seconds; las cifras de la hoja de datos son los documentos indicados (docs/SLOT-TIMING.md). Un valor por defecto de clase se apoya en un suelo de ruido rojo supuesto y una fuente de hoja de datos es una envolvente de máximos, por lo que ninguna es una medición de ninguna unidad

# text
seg-2797643153dc = Nivel de protección de temporización para un receptor en órbita bajo spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, accesible como la sección de spoofing del tipo <c1/>: velocidad y periodo de una órbita circular, el mayor tiempo que un spoofer terrestre puede alcanzar al satélite por pasada, el suelo del monitor asistido por reloj y la latencia de detección CUSUM, el nivel de protección condicional (suelo más deriva durante la latencia), el arrastre que acumula un spoofer con una tasa máxima de rampa indicada antes de que el satélite salga de su huella o se ejecute una comprobación independiente, y si cada comprobación de contacto con tierra o de enlace cruzado es independiente de un spoofer terrestre

# text
seg-3d441db3a373 = Reducción al nivel de protección de temporización existente y a las formas cerradas de visibilidad de órbita circular y Tierra esférica. Condicionado a la detección, un spoofer terrestre con una tasa de rampa indicada, una pasada cenital sobre una Tierra sin rotación; no validado en un receptor en órbita sometido a spoofing

# text
seg-158a99d40b0d = Densidades espectrales de potencia de señales en banda L en forma cerrada y coeficientes de separación espectral

# text
seg-17060c71fa54 = Densidades espectrales de potencia de área unitaria de GPS L1 C/A y L2C (BPSK({ "1" })), GPS L5 y Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) y Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, con una variante MBOC añadida), sus nulos y máximos localizados numéricamente (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), y el coeficiente de separación espectral de una señal frente a cualquier espectro con cualquier desplazamiento (navsignal::spectral_separation_coeff_offset) o frente a un tono, ruido plano, un chirp o ruido adaptado (spectrum::Jammer::ssc), con el coeficiente antiinterferencia Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Valores publicados de manual: el lóbulo principal de BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo y los coeficientes antiinterferencia Q = { "1" } para un jammer de banda estrecha (CW) y Q = { "1.5" } para un jammer de espectro ensanchado adaptado a C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3.ª ed., sección { "9.4" }); los lóbulos principales de BOC(m,n) centrados en más o menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); los coeficientes de separación espectral -61.8, -64.8 y -67.8 dB/Hz para C/A con C/A, BOC({ "1,1" }) con BOC({ "1,1" }) y C/A con BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, mayo/junio de { "2006" }), reproducidos aquí a partir de sus formas cerradas de autocorrelación mediante Parseval. El máximo de BOC({ "1,1" }) no está en { "1.023" } MHz: el lóbulo se extiende desde el nulo de la portadora hasta { "2.046" } MHz y alcanza su pico en { "0.759" } MHz, y la prueba fija ambos. La mezcla MBOC es la definición del ICD, comprobada solo en cuanto a área unitaria y linealidad

# text
seg-f134975d4ffa = Cascada del espectro en banda L con J/S por banda y C/N0 efectivo bajo una cronología de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = El tipo <c1/>: una rejilla de frecuencia por tiempo de la densidad espectral de potencia en banda L (suelo térmico k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }), las señales con sus potencias recibidas mínimas de la especificación de interfaz, y jammers de onda continua, de banda estrecha, de chirp y de ruido adaptado con tiempos de encendido/apagado), con cada celda promediada sobre su casilla y fila (los chirps exactamente sobre barridos completos y parciales, los jammers por ciclo de trabajo), C/N0 efectivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por fila, J/S por banda, J/S en banda y una cascada SVG con barras de C/N0. El informe incluye una comprobación cruzada con la cadena del tipo <c2/> sobre las mismas entradas de enlace

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Reducción a la ecuación antiinterferencia y al presupuesto de enlace del tipo <c1/> existente (el mismo código, llamado con las mismas entradas), y la forma cerrada del suelo de ruido k T0 F. Los espectros de señal subyacentes son los de la fila validada anterior; las potencias de los jammers, la cronología y los anchos de banda del front-end son entradas del escenario, los espectros son continuos (sin líneas de código de ensanchamiento), y ningún control automático de ganancia, supresión ni diagrama de antena actúa sobre el jammer. No hay en el repositorio ningún espectro medido con interferencia con el que comprobar el compuesto. La tabla de Q del tipo <c2/> (CW y banda estrecha { "1" }, banda ancha y barrido { "2" } desde { "0.36" }: los valores de manual, fijados a las formas cerradas de navsignal) coincide con el valor CW de este modelo y difiere de lo que este deriva para ruido adaptado a C/A ({ "1.5" }) y para ruido plano de nulo a nulo sin normalización en banda ({ "2.2" }); el informe imprime ambos

# text
seg-1461dcaed6be = Entrada y salida de grabaciones SigMF, y estimaciones espectrales de Welch de IQ complejo

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: lee y escribe grabaciones del Signal Metadata Format (JSON .sigmf-meta con los campos básicos global, captures y annotations; .sigmf-data sin procesar como cf32_le, ci16_le o ci8, con los decodificadores enteros compartidos con realdata::iqif::load_iq), todo sobre cadenas y búferes de bytes. spectrum::welch_psd: periodogramas con ventana de Hann, solapados y promediados, con escala de densidad, sobre una transformada de base 2 propia del crate (spectrum::fft_in_place). Esas dos son la afirmación validada. spectrum::synthesise_iq dibuja el modelo como IQ, y la sección [iq] del tipo <c1/> ejecuta modelo a IQ a SigMF a Welch y compara con el modelo; su sección [recording] estima una grabación real (compilaciones nativas); la síntesis y esas comparaciones con el modelo quedan fuera de la afirmación validada

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) con la misma ventana de Hann periódica, solapamiento, escala de densidad, sin eliminación de tendencia y promedio de la media bilateral: cada casilla dentro de { "1e-12" } relativo (observado { "6.0e-14" }) en { "27" } casos, con los recuentos de segmentos tomados del propio spectrogram de scipy. sigmf-python { "1.13.0" } (LGPL-3.0, ejecutado como herramienta) escribe cinco grabaciones de terceros (cf32_le, ci16_le, ci8, dos capturas con anotaciones, un primer sample_start distinto de cero) que el crate decodifica bit a bit de forma idéntica con campos básicos idénticos, y lee de vuelta las grabaciones del crate bit a bit de forma idéntica; el esquema de metadatos de SigMF { "v1.2.6" } informa de cero errores en los metadatos del crate. Tolerancias fijadas antes de la primera comparación. Fuera de la afirmación: spectrum::synthesise_iq y las comparaciones de [iq] y [recording] con el modelo (una síntesis no tiene una única respuesta correcta; un chirp periódico muestra líneas, rizado de Fresnel y colas de borde que el modelo suave omite, con potencia total dentro del { "2" } %), la convención de escalado de entero a coma flotante (el crate divide por { "32767" } y { "127" }, el autoscale de sigmf-python por { "2" }^{ "15" } y { "2" }^{ "7" }, algo que la especificación deja abierto; la comparación usa códigos sin procesar), las grabaciones multicanal y los tipos de datos que el lector rechaza

# text
seg-bf2d02d76762 = Posiciones planetarias en todo el sistema solar a partir de los elementos keplerianos de Standish de JPL

# text
# c1: solar-system
seg-c9d3549045eb = Posiciones heliocéntricas de Mercurio, Venus, el baricentro Tierra-Luna, la Tierra, Marte, Júpiter y Saturno a partir de la Tabla { "1" } de Standish ({ "1800" } d. C. a { "2050" } d. C.), y de los ocho planetas a partir de las Tablas 2a/2b ({ "3000" } a. C. a { "3000" } d. C., con los términos de anomalía media b, c, s, f), siguiendo paso a paso el algoritmo de la página de JPL y rotadas al ICRF (Marco Internacional de Referencia Celeste) con la oblicuidad de la página; la Tierra se separa del baricentro mediante la serie lunar de Montenbruck & Gill y la razón de masas. Compuesto como ephem_provider::AnalyticSolarSystem para que cualquier cuerpo esté disponible respecto a cualquier otro, y ejecutable como el tipo <c1/>

# text
seg-24e058d4d094 = Vectores heliocéntricos geométricos de JPL Horizons DE441 (eclíptica e ICRF), obtenidos después de las confirmaciones de preregistro { "80451866" }, 8d38a28b y 558cc807. Umbral: por planeta y componente, RMS como máximo 1.0x los errores aproximados de la Tabla { "8.10.1" } del Explanatory Supplement 3.ª ed. (la fila EMB para la Tierra); la separación Tierra-EMB se comprueba directamente frente a DE441 { "399" } menos { "3" }, como máximo { "0.3" } grados y { "8.1" } km en cada época de 1950-2050 (el umbral de longitud de { "8.1" } km procede de la exactitud de la serie lunar indicada en la propia documentación de efemérides de Kshana, que cita a Montenbruck y Gill, y no se comprobó con el libro; los { "6.09" } km medidos quedan cerca de él). El estadístico RMS se eligió sabiendo que una comparación anterior de 27 épocas alcanzó 1.87x el valor nominal en su máximo; los errores de una sola época alcanzan 3.83x (3.87x en el caso ICRF). El Supplement no define sus cifras como RMS. El caso B rota ambos lados con la oblicuidad IAU { "1976" } escrita en la prueba, de modo que la rotación no se comprueba contra sí misma. No se ejercita la selección de tabla por defecto de AnalyticSolarSystem (las pruebas fuerzan la Tabla { "1" }). Urano y Neptuno de la Tabla { "1" } son una fila MODELLED aparte

# text
seg-4ea08a296b37 = Posiciones del Sol, la Luna, Mercurio y Venus a partir del kernel DE440 en épocas UTC (KernelEphemeris)

# text
seg-8d47467c36e4 = Posiciones geométricas del Sol, Mercurio, Venus, la Tierra y la Luna entre sí (ejes J2000/ICRF, metros) a partir de un kernel JPL DE440 mediante ephem_provider::KernelEphemeris en épocas UTC: nombres de cuerpos asignados a códigos NAIF, UTC llevado a través de la tabla de segundos intercalares y TT a TDB con la serie TDB-TT de dos términos, con el kernel leído por el lector propio del motor. Un cuerpo que el kernel contiene solo como baricentro de sistema (de Marte a Neptuno, Plutón en de440s) se rechaza y nunca se sustituye. La fila de Standish sin kernel sigue siendo la vía del navegador y de reserva

# text
seg-f0e09f78814a = Skyfield { "1.54" } (MIT), con su propia tabla de segundos intercalares, su propio TDB-TT y su propio lector del mismo NAIF de440s.bsp (jplephem), ejecutado como programa aparte en épocas UTC. Preregistrado (0bfafe6d) antes de que existiera el fixture, con la rejilla sembrada a partir del hash de esa confirmación, con un umbral de { "5e-5" } s por la velocidad relativa (la exactitud TDB-TT de dos términos declarada del motor) más { "1e-13" } de la distancia baricéntrica más { "1e-5" } m, por componente. Resultado: los { "600" } dentro, el peor en { "0.66" } del umbral ({ "2.96" } m en un par rápido, el propio error de la serie TDB-TT). Mutación: usar TT como TDB falla a { "33" } veces el umbral. Ambos lados leen DE440: esto valida el proveedor y su cadena de tiempo, no DE440. Fuera de la afirmación: los planetas más allá de Venus como cuerpos (de440s contiene solo sus baricentros), las lunas planetarias y la precisión por debajo de la serie TDB-TT de dos términos (unos pocos metros para los pares más rápidos)

# text
seg-b59153f28d69 = Tiempo de luz entre cuerpos del sistema solar

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = El tiempo de luz newtoniano unidireccional de cualquier cuerpo a cualquier otro, recibido en una época, resuelto con el resolutor radiométrico de tiempo de luz de punto fijo (radiometric::light_time_solution, con el transmisor en su posición retardada) mediante solar_system::link_on sobre cualquier EphemerisProvider; el tipo solar-system lo ejecuta sobre el sistema solar analítico en el marco heliocéntrico (solar_system::link). La distancia bidireccional de radiometric::two_way_range y el retardo de Shapiro del Sol de radiometric::shapiro_delay se informan por separado y no se comparan externamente. Emitido para cada cuerpo frente a un observador y para cualquier enlace adicional por el tipo <c1/>, y para el enlace descendente del cuerpo a la Tierra por el tipo <c2/>

# text
seg-0685ab1ef2d3 = Tiempo de luz newtoniano LT del tramo descendente unidireccional de JPL Horizons DE441 (VEC_CORR=LT, observador en el centro de la Tierra), preregistrado (480037d3, con la enmienda 54d5c86f que cambia solo el espaciado de los nodos de interpolación tras fallar la primera obtención en su precondición de precisión de interpolación de { "10" } m, antes de comparar ningún tiempo de luz) con un umbral de { "1e-6" } s por tiempo de luz, con el resolutor alimentado con posiciones baricéntricas de DE441 para que la iteración del transmisor retardado sea visible (un resolutor de primera iteración falla hasta en { "0.1" } s). Con las posiciones analíticas de Standish el tiempo de luz es tan bueno como esas posiciones (véase la fila de posiciones planetarias); el enlace distribuido trata el Sol como un centro inercial, lo que queda dentro de ese error de posición pero no está validado por separado. two_way_range y shapiro_delay no se comparan externamente

# text
seg-6e0b9687e8ee = Urano y Neptuno a partir de la Tabla { "1" } de Standish, Plutón y velocidades planetarias

# text
seg-df3bf502dfe9 = Posiciones de Urano y Neptuno a partir de la Tabla { "1" } de Standish (la predeterminada dentro de { "1800" } d. C. a { "2050" } d. C.), de Plutón a partir de la fila de la Tabla { "1" } de { "1992" } que la página actual de JPL ya no incluye, y la velocidad heliocéntrica de cada planeta: la derivada de dos cuerpos con el movimiento medio que implican los elementos más el giro de la elipse por las tasas de perihelio, inclinación y nodo

# text
seg-f49245efe44f = Medido frente a JPL Horizons DE441 (los mismos fixtures confirmados), pero no validado: las cifras indicadas en la Tabla { "1" } para Urano y Neptuno se superan hasta en { "2.0" } y { "5.2" } veces frente a las posiciones heliocéntricas de DE441 (Neptuno las alcanza frente a posiciones baricéntricas, lo que sugiere que el ajuste no era heliocéntrico), la página no indica ningún error para Plutón y no existe una cota publicada para las velocidades. Las Tablas 2a/2b alcanzan sus propias cifras para Urano y Neptuno y están cubiertas por la fila validada

# text
seg-a50be56f605a = Posiciones de la Luna y de siete lunas principales (Fobos, Deimos, las lunas galileanas, Titán)

# text
seg-2cfbe5a1eece = La Luna geocéntrica a partir de la serie de Montenbruck & Gill (cuyo término de -1.3972 grados por siglo ya la refiere al equinoccio J2000), y posiciones y velocidades planetocéntricas de Fobos, Deimos, Ío, Europa, Ganímedes y Calisto a partir de los elementos medios de Solar System Dynamics de JPL en el plano de Laplace de cada luna, con la tasa de longitud media tomada de la tasa de rotación síncrona de la IAU (la tabla imprime el periodo con demasiado pocos dígitos para mantener la fase), y de Titán a partir del modelo de rotación de la IAU (la luna sobre el eje x fijo al cuerpo cambiado de signo a la distancia media), porque la fila impresa del plano de Laplace de Titán no reproduce Horizons ni siquiera en su propia época

# text
seg-6c81bd570fe5 = Medido frente a las efemérides de satélites de JPL Horizons (DE441, MAR099, JUP365, SAT441) confirmadas en tests/fixtures/solar_system/horizons_satellites_icrf.csv con la consulta y la fecha de obtención; no existe exactitud publicada para los elementos medios ni para la colocación con el modelo de rotación, por lo que los umbrales fijados detectan regresiones y no validan. Los elementos medios omiten las perturbaciones resonantes y solares, y la aceleración secular de Fobos no se modela

# text
seg-8b8c8e28ece9 = Constantes físicas de cada cuerpo del sistema solar y el informe del sistema completo

# text
# c1: solar-system
seg-d225a30de35c = Body incorpora Mercurio, Venus, Júpiter, Saturno, Urano, Neptuno, Plutón, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán (parámetro gravitacional, radio de referencia, J2 donde se publica con el radio al que se refiere, polo y meridiano origen de la IAU), una búsqueda por nombre y un registro BodyFacts (código NAIF, clase, padre, radio ecuatorial y medio); el tipo <c1/> los informa para los dieciocho cuerpos con las posiciones, los tiempos de luz y una traza orbital durante una revolución, con cada cuerpo etiquetado como VALIDATED o MODELLED

# text
seg-6adc29de51fd = Transcripción de constantes publicadas, cada una citada donde se define: parámetros gravitacionales de los registros de cuerpos de JPL Horizons y de la tabla de parámetros físicos de satélites de JPL, radios de las tablas de parámetros físicos de JPL (IAU WGCCRE { "2015" }), polos y meridianos origen del Grupo de Trabajo de la IAU sobre Coordenadas Cartográficas y Elementos Rotacionales (valores medios, sin los términos de tasa T ni periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } y { "2019" }, y Jacobson { "2009" } y { "2014" }. Comprobado en cuanto a consistencia interna (el periodo de rotación de Júpiter frente a la tasa del Sistema III, cada J2 frente a su radio de referencia), no frente a una referencia independiente externa. { "0.30" } ronda { "2" }: los valores de GM se adoptaron de gm_de440 y los elementos de Fobos y Deimos de pck00011, de modo que { "0" } de { "84" } constantes de los catorce cuerpos añadidos difieren ahora de NAIF (antes { "12" }), lo que es una comprobación de transcripción y no se cuenta. { "0.36" }: la orientación fija al cuerpo de la IAU y el GM de los catorce cuerpos añadidos se separan en su propia fila VALIDATED ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); esta fila conserva lo que queda. J2 y el radio medio están citados, no validados; las posiciones del informe se apoyan en sus propias filas; y el prime_meridian_deg del informe para la Tierra, la Luna y Marte sigue usando constantes convencionales (hasta { "6.6e-3" }, { "2.8e-2" } y { "9.6e-4" } rad respecto a IAU_<BODY>). { "0.30" } revisiones: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutón { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; radio ecuatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg incluye ahora los términos cuadráticos y periódicos

# text
seg-fa8a4b082cd5 = Orientación de cuerpo de la IAU y parámetro gravitacional de los catorce cuerpos del sistema solar añadidos

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, la rotación de J2000 al marco fijo al cuerpo de la IAU de Mercurio, Venus, Júpiter, Saturno, Urano, Neptuno, Plutón, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán con cada tasa secular, término cuadrático y término periódico que el cuerpo lleva en pck00011, y el campo de parámetro gravitacional mu de los mismos catorce cuerpos. El Sol, la Tierra, la Luna y Marte llevan constantes convencionales que pertenecen a otras filas y no están cubiertos

# text
seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 hasta spiceypy) pxform('J2000', 'IAU_<BODY>') sobre pck00011.tpc, una implementación independiente del mismo modelo de rotación de la IAU, y NAIF gm_de440.tpc para GM, con los fixtures generados por un programa aparte que no llama a ningún código de Kshana (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Preregistrado 154bc54 (con el umbral original de { "1e-9" } rad de c2434204) antes de que existiera el fixture de épocas nuevas; el fixture nuevo se regeneró de forma independiente y es idéntico byte a byte. GM es una transcripción de DE440 comprobada con el archivo publicado, no una determinación independiente de GM. Resultados: docs/design/evidence/mr08-body-orientation/RESULTS.md

# text
seg-87ab655f8270 = Posicionamiento alrededor de cualquier cuerpo del sistema solar con una constelación local y un enlace de espacio profundo desde la Tierra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = El tipo <c1/>: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo elegido por nombre navega con pseudodistancias unidireccionales de una constelación de navegación Walker alrededor del cuerpo (órbitas de dos cuerpos con la deriva secular J2 del cuerpo, un reloj de usuario desconocido) y una distancia bidireccional opcional sin reloj desde la Tierra, con la dirección y la distancia de la Tierra tomadas de la efeméride analítica en cada época; líneas de visión bloqueadas por la esfera del cuerpo y una máscara de elevación en superficie; por época, el GDOP y el PDOP solo de la constelación (orbit::dop), la incertidumbre formal de posición con y sin la fila de la Tierra, y soluciones de Gauss-Newton con semilla (batch_ls::gauss_newton) en cada caso, con el tiempo de luz y el viaje de ida y vuelta del cuerpo a la Tierra

# text
seg-3538c49df107 = Formas cerradas y autoconsistencia: la tercera ley de Kepler para el periodo del relé, el radio de órbita y el radio de superficie mantenidos durante la ejecución, el hecho de que añadir una medición nunca aumenta la incertidumbre formal, y los errores con semilla que concuerdan con la covarianza. Las órbitas de los relés ignoran terceros cuerpos (no se modela la atracción de Júpiter sobre los relés alrededor de Europa), el ruido es gaussiano con los niveles indicados y el modelo de medición es instantáneo, por lo que esto no está validado frente a los datos de navegación de ninguna misión

# text
seg-281b680a9897 = Geometría de constelaciones Walker y las ranuras nominales publicadas de GPS, Galileo y GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Los generadores del tipo <c1/>: patrones Walker delta y star en la convención T/P/F (separación de nodos 360/P o 180/P, separación en el plano { "360" }·P/T, desfase de fase entre planos { "360" }·F/T), y los preajustes de línea base de GPS y expandible de 24 ranuras, de Galileo y de GLONASS construidos a partir de sus elementos nominales publicados, colocados en un marco fijo a la Tierra mediante el ángulo horario de Greenwich que indican sus documentos

# text
seg-bdf83007af50 = Documentos publicados de las agencias: Galileo Open Service Service Definition Document edición { "1.1" } (European GNSS Service Centre) Tablas { "1" } y { "23" }, la constelación de referencia a 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edición { "5.1" } ({ "2008" }) sección { "5.2" }, la fórmula de ranura para la longitud del nodo y el argumento de latitud; GPS Standard Positioning Service Performance Standard 5.ª edición (abril de { "2020" }) Tablas 3.2-1, 3.2-2 y 3.2-3, incluida la columna de cruce ecuatorial de la traza terrestre, que es una declaración independiente de la geometría fija a la Tierra que el preajuste debe reproducir. Valida los generadores y la transcripción; la fase de órbita media de BeiDou y los nodos geosíncronos inclinados no están publicados y no están cubiertos

# text
seg-0f1d49ab5d51 = Dilución global de la precisión de la constelación de línea base de GPS

# text
# c1: constellation-design
seg-83775b77f5ca = El motor de cobertura del tipo <c1/> sobre el preajuste de línea base de 24 ranuras de GPS bajo las condiciones del Apéndice B del GPS Standard Positioning Service Performance Standard (SPS PS) (un día sidéreo, { "287" } pasos de cinco minutos, una rejilla global de { "4" } x { "4" } grados ponderada por el coseno de la latitud, todos en vista, máscara de { "5" } grados, un reloj de receptor): la distribución global de HDOP, la mediana de PDOP y la disponibilidad de PDOP como máximo 6, globalmente y en el peor emplazamiento

# text
seg-6fb3c2028c4a = GPS SPS PS 5.ª edición (abril de { "2020" }) Apéndice B secciones B.3.2.2 y B.3.2.3, la distribución publicada de HDOP promedio global de la constelación de línea base de 24 ranuras totalmente ocupada (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, media { "0.96" }), Tabla 3.8-1 (disponibilidad de PDOP) y Tabla B.3-1 (PDOP de conjunto de una constelación degradada, usada solo como cota superior), más una forma cerrada derivada a mano para una época. Las distribuciones de VDOP y PDOP de la constelación completa solo se publican como figura, por lo que PDOP se fija de un solo lado; el peor punto espacio-tiempo (HDOP { "2.40" } y VDOP { "5.22" } aquí, { "2.49" } y { "5.43" } publicados) depende de la rejilla y se informa, no se fija

# text
seg-7d4d7200cbca = Mapas de cobertura y de dilución de la precisión para diseños multiconstelación arbitrarios a gran escala, alrededor de cualquier cuerpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = El tipo <c1/> más allá de los dos casos fijados: diseños explícitos y de varias capas, varias constelaciones por ejecución con un reloj de receptor por constelación, la Tierra, la Luna y Marte a partir de las constantes de cuerpo, el preajuste de BeiDou (se modelan la fase de órbita media y el cruce geosíncrono inclinado a { "118" } grados E), satélites en vista por celda, GDOP, PDOP, HDOP, VDOP y disponibilidad, trazas terrestres submuestreadas y un prefiltro de visibilidad por latitud del subsatélite que ejecuta un diseño de { "5" } 000 satélites sobre una rejilla de { "10" } grados en una fracción de segundo

# text
seg-2c0f28426ab9 = Consistencia interna: el barrido de elevación por fuerza bruta, las reducciones calculadas a mano y con orbit::dop, y la geometría Walker y geosíncrona en forma cerrada. Órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico con la vertical local a lo largo del radio, solo visibilidad geométrica (sin potencia de señal, salud del satélite, terreno ni perturbación de terceros cuerpos), y la fase relativa entre sistemas tomada de épocas de referencia diferentes, por lo que no es una instantánea de ninguna fecha. { "0.30" } revisión, un hallazgo (sigue siendo MODELLED): los preajustes alcanzan los suelos unilaterales publicados de disponibilidad de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) al { "100" } %, pero con el PDOP del motor duplicado en una copia de trabajo siguen alcanzándolos (peor punto { "99.36" } %), de modo que los suelos no pueden detectar ni siquiera un error del { "100" } % en la magnitud que calcula esta fila; endurecerlos después de la ejecución sería una tolerancia a posteriori. La promoción requiere una comparación bilateral de valores de DOP sobre geometría idéntica con una tolerancia fijada de antemano. { "0.30" } ronda { "2" } (tests/coverage_dop_full_oracle.rs, preregistrado add671d6), un hallazgo (sigue siendo MODELLED): posiciones, elevación, acimut y trazas terrestres de Orekit { "12.2" } con GDOP/PDOP/HDOP/VDOP de gnss_lib_py { "1.0.4" } (reloj común) y una inversa de numpy (un reloj por constelación) coinciden en todos los umbrales en los diseños de Galileo, GPS, BeiDou, Galileo+GPS (un reloj cada uno) y un diseño terrestre de 1584 satélites (DOP dentro de { "2e-14" } relativo, solución idéntica, y recuentos de disponibilidad y visibilidad idénticos). En los diseños de la Luna y Marte los elementos, las posiciones, la visibilidad y las trazas coinciden, pero el DOP supera el umbral relativo prefijado de { "1e-9" } en celdas cuyo mayor PDOP es { "1434" } o más (hasta { "8e-6" }), y { "4" } celdas difieren en una época de solución en geometría numéricamente singular (pivote del motor { "1e-10" } frente al rango de numpy), por lo que la fila no está validada. { "0.30" } revisiones: el reloj de referencia de TDOP/GDOP es ahora la constelación de menor número a la vista (GDOP máximo global de constellation-multi-gnss-coverage { "2.2236" } -> { "2.1205" }, media { "1.122" } -> { "1.131" }), y los recuentos de visibles por constelación se suman como enteros

# text
seg-278c77438493 = Una misión encadenada entre tipos de escenario sobre una cronología compartida

# text
# c1: campaign
seg-3dcfb26f6234 = Las fases del tipo <c1/>: cada fase ejecuta uno o más escenarios de tipos existentes mediante run_toml, lee sus salidas en canales con nombre (error de tiempo del reloj y guarda, relación media efectiva portadora-densidad de ruido y suelo de seguimiento, nivel de protección vertical y límite de alerta, error de posición, satélites en seguimiento, indicadores de alarma) mediante preajustes por tipo o rutas de resultado explícitas, las sitúa al comienzo de la fase y las mantiene sobre una rejilla común, con límites de fase y eventos; el estado se transfiere mediante carry (un canal continúa desde el valor final de la fase anterior), handoff (un número de una fase anterior escrito en el escenario siguiente) y end_at (una fase termina en un instante que calculó una ejecución, como el instante de detección de un monitor de spoofing); un hash de campaña y un resumen sobre el resultado de cada miembro

# text
seg-fd018ef7bc3b = Identidades de composición frente a las ejecuciones independientes de los mismos tipos: una campaña de una fase reproduce la salida independiente bit a bit, el desfase transferido es igual a la última muestra de la ejecución anterior y la fase terminada por end_at tiene exactamente el instante de detección de la ejecución como duración. La transferencia aditiva a través del límite de fase y el mantenimiento de orden cero son decisiones de modelado, y cada fase es tan buena como el tipo que la ejecutó; ninguna misión encadenada se ha comprobado frente a una medida

# text
seg-ad6105af464c = Barridos de parámetros y conjuntos Monte Carlo con semilla sobre cualquier tipo de escenario

# text
# c1: campaign
seg-95921611839e = Las secciones sweep del tipo <c1/> (de una a tres claves con puntos de cualquier tipo, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y monte_carlo: la realización k se ejecuta con base_seed + k; cada métrica informa de la media, la desviación típica, los percentiles 5/50/95 por rango más cercano y un intervalo de confianza del { "95" } % por bootstrap de percentiles con semilla fija sobre la media (inertial::metric_stat); las unidades de las métricas se leen del propio bloque de unidades del tipo barrido

# text
seg-03d15c27b3b9 = La forma cerrada del paseo aleatorio de fase bajo ruido blanco de frecuencia, varianza q_wf tau (NIST Technical Note { "1337" }), para la maquinaria estadística, y la igualdad byte a byte con las ejecuciones independientes para la siembra. Comprueba la aritmética del conjunto sobre el propio modelo de reloj del motor, no un conjunto de datos externo

# text
seg-24327a0ed82e = Varios escenarios bajo condiciones compartidas, con un resumen combinado

# text
# c1: campaign
seg-5833fb3b06e3 = La sección compose del tipo <c1/>: valores compartidos con nombre (por ejemplo, la potencia y la posición de un jammer) escritos en cada miembro en las claves a las que los vincula, ejecución de cada miembro y, por métrica, el menor, el mayor y el valor medio entre los miembros con el miembro nombrado; las unidades de las métricas deben coincidir entre los miembros

# text
seg-67ffd6684b1c = Identidad de composición frente a la ejecución independiente. La aritmética de condiciones compartidas es contabilidad; la física es la de los tipos miembro, cada uno con su propia fila

# text
seg-0bc866720bde = Optimización acotada de una métrica sobre parámetros de campaña

# text
# c1: campaign
seg-f9bdb89c2b4f = La sección optimize del tipo <c1/> (CAP-32): de una a tres claves de escenario con puntos acotadas a [lo, hi] en escala lin o log, una métrica leída por ruta de resultado, objetivo minimize, maximize o target; método grid (los valores de eje del barrido) o un símplex determinista de Nelder-Mead en coordenadas normalizadas con proyección sobre la caja y los coeficientes estándar; una métrica ausente o no finita puntúa como la peor y permanece en la traza; con runs > { "1" } la métrica es la media sobre semillas comunes; cada evaluación es una ejecución real del tipo indicado, listada en trace y contada en el resumen de reproducibilidad

# text
seg-e3a2f80b04dc = Solo interno: la forma cerrada exacta -20 log10(range) de la ecuación de enlace, una rejilla independiente de fuerza bruta sobre el mismo tipo y la función de Rosenbrock. El umbral 1-D de la ronda { "1" } es NOT MET (la caja preregistrada excluía la solución de { "3" } dB; el optimizador se detuvo en la cota), registrado en docs/design/evidence/cap32-optimize/RESULTS.md y no vuelto a puntuar. El óptimo es local a la caja y al punto de partida; ninguna afirmación de óptimo global

# text
seg-b9b1637d326c = Formas cerradas de banda limitada para cualquier señal de medición de distancia: potencia en banda y jitter de seguimiento de código early-late frente a valores publicados, con el ancho de banda de Gabor y la separación espectral con desplazamiento comprobados de forma cruzada

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: la integral seno (sine_integral), la fracción de potencia de BPSK-R dentro de una banda bilateral en forma cerrada (bpsk_power_in_band_closed_form), el ancho de banda de Gabor de BPSK de banda limitada en forma cerrada (bpsk_gabor_bandwidth_closed_form_hz), el jitter del lazo de seguimiento de retardo early-late coherente y no coherente de banda limitada para cualquier espectro de área unitaria según Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) y su cota de Gabor de separación evanescente (dll_jitter_small_spacing_limit_s), el coeficiente de separación espectral de BPSK con desplazamiento en forma cerrada (bpsk_offset_ssc_closed_form), el espectro AltBOC({ "15,10" }) de Galileo E5 (altboc_15_10_psd) y un analizador de etiquetas de modulación (parse_modulation); usado por el tipo <c1/> para cada diseño de señal

# text
seg-15d8c44be46f = Fijados externamente: { "90.3" } por ciento de potencia en el lóbulo principal, el jitter early-late coherente en el punto de operación indicado, los valores de la tabla de la integral seno y el coeficiente de autoseparación espectral de BPSK 2/({ "3" } R_c) con desplazamiento cero. Solo comprobaciones cruzadas internas, no validación externa: la forma cerrada del ancho de banda de Gabor de BPSK de banda limitada y su asíntota, y el coeficiente de separación espectral de BPSK con desplazamiento en desplazamientos distintos de cero, ambos derivados aquí y comprobados frente a cuadratura. Formas cerradas publicadas: el espectro sinc al cuadrado de BPSK-R y su { "90" } por ciento de potencia en el lóbulo principal (Kaplan & Hegarty, Understanding GPS/GNSS, 3.ª ed.); el jitter coherente early-late de seguimiento de código sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, sección { "8" }) y la generalización de banda limitada con su límite de ancho de banda de Gabor (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); las tablas de la integral seno de Abramowitz & Stegun (Tabla { "5.1" }); el coeficiente de separación espectral como transformada de Fourier de la autocorrelación al cuadrado (Betz { "2001" }). El espectro AltBOC se comprueba solo en cuanto a área unitaria y posición de los lóbulos (la expresión del Interface Control Document del Galileo Open Service Signal-in-Space integra a { "8" } y se divide por ese valor).

# text
seg-def449efa852 = Doppler máximo de un satélite de navegación de órbita terrestre baja, que dimensiona la búsqueda de adquisición

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: el mayor Doppler del satélite en una pasada cenital a la máscara de elevación para una órbita circular, v R_E cos(el) / (R_E + h) por f / c, a partir de la portadora y la altitud orbital propias de cada preajuste; el tipo <c1/> añade términos de oscilador y de usuario y lo convierte en casillas Doppler

# text
seg-652e28dfa10f = Diseños de señal de posicionamiento, navegación y temporización de órbita terrestre baja: seguimiento de código, adquisición, compatibilidad con GNSS y un compromiso de banda para cualquier sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = El tipo <c1/>: diseños de señal parametrizados (banda, ancho de banda de transmisión, asignación de la UIT; componentes de adquisición, de datos y piloto con espectros BPSK(n), BOC(m,n), MBOC o planos, reparto de potencia, subportadoras FDMA, longitudes de código y tasas de datos) a partir de archivos de preajuste públicos compilados (Xona Pulsar, Iridium STL, señal de oportunidad de Starlink, CentiSpace, un diseño genérico en banda C y diseños genéricos UHF/L/S/C/C ancha, cada uno con su URL de origen y con los valores no publicados rotulados REPRESENTATIVE) o escritos en línea; por señal, la densidad espectral de potencia de banda limitada, las fracciones de potencia en banda, el ancho de banda de Gabor, el jitter de código frente a C/N0 y espaciado y la exactitud de medición de distancia, el espacio de búsqueda de adquisición, la probabilidad de detección de ley cuadrática y el tiempo medio de adquisición serie y paralela de código, el coeficiente de separación espectral hacia y desde GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b y AltBOC con la degradación de C/N0, y la tolerancia de J/S CW, de banda ancha y adaptada a partir de la cadena SSC del tipo spectrum; un compromiso de banda de retardo ionosférico, pérdida en espacio libre, exactitud de medición de distancia con igual C/N0 e igual EIRP y tolerancia a jammers; y comprobaciones cualitativas de forma de un diseño frente a una medición descrita

# text
seg-040b3f5cc70e = Las formas cerradas validadas de las dos filas anteriores, la identidad de falsa alarma de ley cuadrática P_d(snr = { "0" }) = P_fa y el tiempo medio de adquisición de Holmes, y la reducción a la propia cadena SSC del tipo spectrum (el mismo código Jammer::ssc). Los diseños en sí son entradas: los preajustes marcados REPRESENTATIVE o WORKSHOP no son especificaciones publicadas, los espectros de QPSK de Feher mejorado, de modulación por desplazamiento de código y de OFDM son aproximados, y las comprobaciones de forma comparan formas, no niveles calibrados.

# text
seg-c2b9c8e4a364 = Cascada de espectro multibanda (UHF, L, S, C) con señales diseñadas y jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = El tipo <c1/> ampliado más allá de la banda L: bandas dadas como un diseño de señal preajustado (dibujado con cada componente, de banda limitada al ancho de banda de transmisión, con C/N0 y J/S referidos al componente seguido) o como una portadora y modulación personalizadas; paneles de cascada adicionales sobre cualquier rango de frecuencias en la misma cronología y escala de color; un jammer de banda ancha (de barrera) junto a ruido CW, de banda estrecha, de chirp y adaptado; J/S por banda y C/N0 efectivo a partir de la cadena del coeficiente de separación espectral sin cambios

# text
seg-a3b398f66ad3 = Reducción a la cadena de espectro existente y a la ecuación antiinterferencia del tipo jamming (una banda de un solo componente da los mismos números que antes de la ampliación) y a los espectros de señal de las filas validadas. Las potencias de los jammers, la cronología, los anchos de banda del front-end y las señales diseñadas son entradas, y una señal diseñada se trunca en su banda de transmisión (sin emisión fuera de banda).

# text
seg-f92d6cbc58d4 = Coeficientes de atenuación específica por lluvia para cualquier banda que use un enlace LEO-PNT

# text
# c1: leo-pass
seg-96b6a118d374 = Ecuaciones ({ "1" }) a ({ "5" }) de ITU-R (Unión Internacional de Telecomunicaciones, Sector de Radiocomunicaciones) P.838-3: k_H, alpha_H, k_V, alpha_V a partir de los ajustes de curva de las Tablas { "1" } a { "4" }, el (k, alpha) dependiente del trayecto y de la polarización y la atenuación específica k R^alpha; usado por el término de lluvia del tipo <c1/>

# text
seg-5c256ff404b6 = Tabla { "5" } de ITU-R P.838-3 (03/2005), los propios k_H, alpha_H, k_V, alpha_V tabulados de la Recomendación, confirmados en tests/fixtures/leo_link/p838_3_table5.csv con la URL del PDF y la fecha de obtención. La tabla está redondeada a sus dígitos impresos, por lo que el umbral es ese redondeo

# text
seg-f4a311f936de = Atenuación por lluvia a largo plazo en trayecto oblicuo de un enlace Tierra-espacio

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 sección { "2.2.1.1" } pasos { "2" } a { "10" } (trayecto oblicuo y horizontal por debajo de la altura de lluvia, factores de reducción horizontal y de ajuste vertical, A0.01 y su escalado a { "0.001" } % a { "5" } % de un año medio), con la altura de lluvia (P.839) y R0.01 (P.837) como entradas porque el motor no incluye ninguno de los dos mapas digitales; aplicado por banda y época por el tipo <c1/>

# text
seg-325d1bb9c26d = Archivo de ejemplos de validación del Grupo de Estudio { "3" } de ITU-R CG-3M3J-13-ValEx-Rev8.3.0 para P.618-14, tabulado por las páginas de validación de ITU-Rpy, con la altura de lluvia P.839-4 de cada emplazamiento tomada de los mismos ejemplos; confirmado en tests/fixtures/leo_link/p618_14_rain_attenuation.csv con las URL y la fecha de obtención. Valida el procedimiento dados h_R y R0.01, no los mapas

# text
seg-6b51ec84bdce = Centelleo troposférico de amplitud en un enlace Tierra-espacio

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 sección { "2.4.1" } pasos { "3" } a { "9" } (sigma de referencia a partir de N_wet, longitud efectiva del trayecto, factor de promediado de antena, profundidad de desvanecimiento para { "0.01" } % a { "50" } % del tiempo), con N_wet como entrada o calculado a partir de temperatura, humedad y presión mediante las expresiones de ITU-R P.453-14; por debajo de { "4" } GHz el tipo <c1/> marca el valor como extrapolación

# text
seg-7fc4a1e7960a = Ejemplos de validación del Grupo de Estudio { "3" } de ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para el centelleo de P.618-14, con el N_wet de P.453-14 de cada emplazamiento tomado de los mismos ejemplos; confirmados en tests/fixtures/leo_link/p618_14_scintillation.csv con las URL y la fecha de obtención. La expresión de la refractividad húmeda a partir de temperatura y humedad no está cubierta por esta fila

# text
seg-e0d40cf4ea79 = Pérdida de entrada en edificios para un usuario LEO-PNT en interiores

# text
# c1: leo-pass
seg-4f06274e38ec = Ecuaciones ({ "1" }) a ({ "10" }) del Anexo { "1" } de ITU-R P.2109-2 con la Tabla { "1" }: la pérdida no superada con probabilidad P para edificios tradicionales y térmicamente eficientes a la elevación del trayecto en la fachada, de { "80" } MHz a { "100" } GHz; aplicada por banda y época a un usuario en interiores por el tipo <c1/> (el caso UHF en interiores)

# text
seg-99c648f9c6eb = Los valores del libro de validación de Clutter y BEL del Grupo de Estudio { "3" } de ITU-R, tal como se transcriben en el script de validación de la implementación de referencia en MATLAB (github.com/eeveetza/p2109), confirmados en tests/fixtures/leo_link/p2109_bel.csv con la URL y la fecha de obtención. El libro imprime tres decimales

# text
seg-8c5e291c8ff8 = Retardo ionosférico de primer orden por banda, la combinación libre de ionosfera y la pérdida en espacio libre

# text
seg-89df726127f9 = Retardo de grupo { "40.3" } STEC/f^{ "2" } por banda; los coeficientes libres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) y -f2^2/(f1^{ "2" } - f2^{ "2" }) y la amplificación de ruido sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) para cualquier par de bandas; la pérdida en espacio libre { "20" } log10({ "4" } pi R f/c) de linkbudget::free_space_loss_db en su forma de kilómetro-megahercio

# text
seg-9bf00f744174 = IS-GPS-200 sección { "20.3.3.3.3.2" }, que indica la razón de retardo de grupo L1/L2 gamma = (77/60)^{ "2" } que se deduce del escalado de primer orden 1/f^{ "2" }, y la fórmula de transmisión de Friis (Proc. IRE, { "1946" }). Valida las leyes de escalado, no un TEC oblicuo

# text
seg-c584a867fcda = Doppler máximo que ve un usuario estático desde una órbita LEO o MEO

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: una búsqueda sobre cada posición orbital y cada usuario en el horizonte del satélite de una órbita circular, con la Tierra girando, del mayor ritmo de variación de distancia, más las velocidades orbital y máxima del satélite fija a la Tierra; informado por banda como envolvente Doppler por el tipo <c1/> y usado como ventana de búsqueda de arranque en frío de su modelo de bajo consumo

# text
seg-4abd3afebad2 = Leclere, Marathe y Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabla { "1" } (receptor estático sobre una esfera de { "6371" } km, siendo la rotación terrestre el único otro efecto): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz en L1. Cubre órbitas circulares de dos cuerpos

# text
seg-d9eb3e7e69c2 = Una pasada LEO-PNT y su presupuesto de enlace por banda frente a los satélites GNSS MEO a la vista

# text
# c1: leo-pass
seg-d986e44443dd = El tipo <c1/>: satélites a partir de una pasada diseñada, elementos, un TLE mediante SGP4 o una constelación Walker de constellation-design; por banda y época, los ángulos de visión, la distancia, la tasa de variación de distancia y la aceleración de distancia en forma cerrada (comprobadas en cada ejecución con diferencias centrales e informadas), pérdida en espacio libre, EIRP con patrón isoflux, gaussiano o plano, una antena de usuario de parche, hemisférica o isótropa, atenuación gaseosa del Anexo { "2" } de ITU-R P.676-10, lluvia y centelleo de P.618, pérdida de entrada en edificios de P.2109, desajuste de polarización, temperatura de ruido del sistema, C/N0, Doppler y tasa de Doppler, y el retardo de primer orden a partir de un TEC oblicuo de Klobuchar o de TEC vertical escalado por la fracción de Chapman por debajo del satélite; pares libres de ionosfera con ruido de código en el pico de la pasada; portadoras de Galileo o GPS a partir de sus potencias recibidas del documento de interfaz a través del mismo receptor

# text
seg-c558a6519038 = Formas cerradas y autoconsistencia: las identidades de tasa de variación de distancia y aceleración de distancia frente a derivadas numéricas, la ganancia isoflux que cancela el crecimiento de la distancia, los límites de pérdida de polarización de manual, la observación cualitativa LEO frente a GNSS (una pasada en forma de campana de minutos que alcanza varios dB por encima de portadoras GNSS planas de 44-51 dB-Hz). Los EIRP y los patrones son potencias recibidas publicadas convertidas en un EIRP o elecciones representativas, el término gaseoso es el método simplificado superado de P.676-10, y nada se compara con un C/N0 LEO medido

# text
seg-95a077a980b6 = Preajustes de sistemas LEO-PNT con nombre y fuentes indicadas, y un motor independiente del sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérico (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como señal de oportunidad solo Doppler, CentiSpace y un preajuste opcional Celeste IOD, cada uno con su fuente marcada como PUBLIC (con URL), REPRESENTATIVE o WORKSHOP, el de workshop en el archivo opcional del preajuste Celeste IOD, compilado solo cuando ese archivo existe; cada banda y órbita puede sobrescribirse en un escenario, y un escenario puede no nombrar ningún preajuste

# text
seg-399dc53ceafb = Transcripción de las cifras públicas citadas y una comprobación de consistencia: un EIRP fijado a partir de una potencia recibida mínima publicada predice el máximo publicado dentro de { "0.5" } dB con un patrón plano. Es una comprobación de la dispersión de distancia, no una validación de la antena de ningún satélite; los preajustes representativos no hacen ninguna afirmación sobre un sistema real

# text
seg-a39f34973373 = Posicionamiento de bajo consumo: tiempo hasta la primera solución y energía por solución frente al ciclo de trabajo

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy y la sección [iot] del tipo <c1/>: integración coherente limitada por la tasa de Doppler, sumas no coherentes de ley cuadrática hasta un umbral de detección, una búsqueda en casillas Doppler sobre la envolvente de usuario estático de la órbita (en frío) o una ventana asistida (en caliente), búsqueda de código paralela o serie, tiempo de mensaje de navegación en un arranque en frío, energía por solución y vida de la batería según los intervalos de solución, para cada banda LEO y la señal GNSS

# text
seg-a5fa1ef1be9b = Consistencia interna de un modelo de diseño indicado: cada elección de potencia, umbral y búsqueda es una entrada, y el modelo ignora la ambigüedad de flanco de bit, la detección fallida y la readquisición. No se compara con un receptor medido

# text
seg-7e94f8b38cff = Pesos del error de distancia de la señal en el espacio promediados globalmente para cualquier altitud orbital

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: el peso radial w_R y el peso transversal al cuadrado w_AC^{ "2" } como promedios de cos^{ "2" } y de la mitad de sin^{ "2" } del ángulo de nadir de la línea de visión sobre usuarios distribuidos uniformemente en el casquete terrestre visible por encima de una máscara de elevación, para cualquier radio orbital, mediante integración de Simpson; usado por cada cifra SISRE de leo-navmsg (a { "510" } km, w_R { "0.46" } y w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = La tabla publicada de factores de ponderación SISRE de Montenbruck, Steigenberger y Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } y 1/49, GLONASS { "0.98" } y 1/45, Galileo { "0.98" } y 1/61, BeiDou MEO { "0.98" } y 1/54, BeiDou IGSO/GEO { "0.99" } y 1/126. El mismo promedio evaluado a radios LEO da los pesos LEO; no se fija ninguna tabla LEO publicada, por lo que los valores LEO son el método validado aplicado, no validados por separado

# text
seg-3cbb8b6afe3c = Algoritmo de usuario de efemérides de difusión del ICD de Galileo como base de un mensaje de navegación LEO

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: la evaluación kepleriana del ICD SIS OS de Galileo (ecuación de Kepler, correcciones de segundo armónico, nodo fijo a la Tierra) escrita por separado del evaluador RINEX del motor, que devuelve la posición con el argumento de latitud, la inclinación y el nodo a partir de los cuales se construye el marco de corrección a lo largo/transversal/radial, y los términos de extensión de Liu et al. { "2025" }

# text
seg-6a90728fcea9 = Posiciones ECEF de eph2pos de RTKLIB 2.4.2-p13 (una implementación independiente del mismo algoritmo del ICD) para registros de difusión reales de BKG/IGS del 2024-09-10, ambos confirmados con procedencia en tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Esto valida el algoritmo de usuario kepleriano; las correcciones a lo largo/transversal/radial añadidas encima están cubiertas por sus propias filas, y los términos de Liu por la fila de 22 parámetros de Liu et al. { "2025" }

# text
seg-d65102fd4a1d = Comprobación de trama CRC-24Q para el mensaje de navegación LEO

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: polinomio generador 0x1864CFB, valor inicial { "0" }, sin reflexión, sin XOR final, la comprobación que la trama LEO de Kshana lleva sobre cada byte precedente

# text
seg-18c79d18e4e4 = El valor de comprobación del catálogo CRC para estos parámetros (catálogo CRC de reveng.sourceforge.io, CRC-24/LTE-A: ancho { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), que son los parámetros CRC-24Q de RTCM { "10403" } y del ICD SIS OS de Galileo, y la trama de ejemplo del tipo de mensaje { "1005" } impresa en RTCM { "10403" }

# text
seg-82b9b0f7b07c = Ajustador de efemérides de difusión LEO y error de distancia de la señal en el espacio frente al intervalo de ajuste y al periodo de actualización

# text
# c1: leo-navmsg
seg-8c7065aa22bd = El ajustador y el compromiso del tipo <c1/>: una órbita de referencia integrada con gravedad zonal J2-J6 o EGM2008 hasta el grado elegido y con arrastre, y un reloj libre o gobernado con semilla; un ajuste de Levenberg-Marquardt del conjunto kepleriano de Galileo sobre elementos no singulares con a prioris débiles, y después polinomios de corrección a lo largo, transversal y radial por mínimos cuadrados lineales; el polinomio de reloj ajustado descontando el término relativista del usuario; SISRE (solo órbita y con reloj) sobre periodos de uso centrados en sus ventanas de ajuste, frente al intervalo de ajuste y al periodo de actualización. Parte validada: el ajuste kepleriano de 16 parámetros y su SISRE solo de órbita frente al intervalo de ajuste sobre órbitas precisas reales, y la órbita de referencia integrada con J2-J6/EGM2008({ "20" }, { "70" })/arrastre frente a Orekit { "12.2" } dentro de { "4.6" } mm en { "6" } h (umbral de { "2" } cm, misma entrada de densidad); los polinomios de corrección, el ajuste del reloj (reloj libre o gobernado con semilla) y el compromiso del periodo de actualización siguen siendo modelados

# text
seg-7dfbc8297444 = Órbitas científicas precisas reales como referencia (órbitas reducidas dinámicas operativas de TU Graz IfG/ITSG, de uso libre con reconocimiento; valores SHA-256 en el NOTICE del fixture) ajustadas con el conjunto de 16 parámetros en arcos de { "20" } y { "30" } min, frente a las estadísticas que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publican para los mismos satélites y días: RMS a lo largo, transversal y radial cada uno dentro de 1.5x (medido de { "0.804" } a { "1.087" }), SISRE dentro de 1.5x (medido de { "0.716" } a { "0.809" }) y pesos SISRE dentro de { "0.005" } de su Tabla { "2" } (medido { "0.0007" }); tolerancias fijadas antes de la comparación. La puerta por componente da dientes a la prueba: poner a cero la tasa de inclinación deja cada razón SISRE dentro de 1.5x pero falla la puerta transversal. La razón SISRE uniforme de { "0.72" } a { "0.81" } es la del artículo: sus valores SISRE impresos usan los pesos de la Tabla { "2" } sin elevar al cuadrado en lugar de su propia Ec. { "9" }, que es la que sigue Kshana (Montenbruck et al. { "2018" }). La órbita de referencia integrada (J2-J6 zonal, EGM2008 hasta grado { "20" } y { "70" }, arrastre) coincide con Orekit { "12.2" } (CS GROUP, Apache-2.0) e Hipparchus { "3.1" }, propagada desde el mismo estado inicial en los mismos marcos con la misma entrada de densidad, dentro de { "4.55" } mm en { "6" } h (umbral de { "0.02" } m fijado antes de la ejecución, preregistro 65e4d46c). Fuera de la afirmación: los polinomios de corrección, el ajuste del reloj y el compromiso del periodo de actualización, que conservan comprobaciones internas (una órbita de referencia de dos cuerpos recuperada por el conjunto de 16 parámetros a menos de { "1" } mm, y una comprobación cruzada interna con numpy de los mensajes exportados en GRACE-FO con su reloj CLK1B, que fue escrita y ejecutada por este proyecto y no es una referencia independiente)

# text
seg-8121e7db3db3 = Actualización del mensaje de navegación LEO a mitad de pasada con una comprobación de continuidad en el cambio

# text
# c1: leo-navmsg
seg-34c310d85c42 = El análisis de actualización a mitad de pasada del tipo <c1/>: la pasada más alta sobre un usuario dentro de un intervalo de búsqueda, mensajes en un calendario global con periodos de uso centrados en sus ventanas de ajuste, y en cada cambio el salto de posición 3D, el salto de reloj, el salto de pseudodistancia del usuario, el mayor salto sobre cualquier línea de visión visible (forma cerrada sobre el cono de nadir), el error de distancia antes y después, y PASS/FAIL frente a un umbral

# text
seg-418f2cd21141 = Consistencia interna (la identidad del salto y la cota del cono frente a un muestreo de fuerza bruta). El umbral es una entrada; no se fija ningún requisito publicado de continuidad LEO

# text
seg-7635a8339e78 = Codificación binaria documentada del mensaje de navegación LEO con un presupuesto de error de cuantización

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: la trama propia de Kshana (preámbulo, versión, modelo, longitud, carga útil, CRC-24Q) para los cuatro modelos de efemérides, el polinomio de reloj, SVID, edad de los datos, banda, salud, un conjunto de Klobuchar, coeficientes NeQuick-G y parámetros UTC, cada campo con un ancho y un paso indicados (field_table), cuantización con rechazo de rango, y un presupuesto del mayor cambio de posición y de reloj que provoca un cambio de medio paso de cada campo sobre la ventana de validez

# text
seg-4261a9fac5d9 = Identidades de ida y vuelta y el propio presupuesto. El formato es propio de Kshana, modelado sobre los componentes de mensaje publicados y el conjunto de campos del ICD de Galileo; no es la disposición de bits de Celeste ni de ningún otro sistema (ninguna es pública), por lo que no hay una disposición externa frente a la que validar

# text
seg-17ca41d7fd71 = Exportaciones al estilo RINEX 4 y CSV de mensajes de navegación LEO

# text
seg-185e12ccef0d = leo_navmsg::text: un bloque al estilo RINEX 4 (cabecera de registro > EPH, línea de satélite y época con tres términos de reloj, líneas de órbita de difusión D19.12) con letra de sistema L y tipos de registro KP16, KRAC, LU22 y APOL, rotulado en cada cabecera como una extensión de Kshana que no forma parte de RINEX { "4.02" }, y una tabla CSV con un esquema de columnas por defecto y esquemas preajustados, cada uno con un importador

# text
seg-5cc5b6382437 = Idas y vueltas y la aritmética de calendario. RINEX { "4.02" } no define registros de navegación LEO (IGS RINEX { "4.02" }), por lo que la disposición es una extensión documentada con arXiv { "2401.17767" } citado como antecedente; no existe ningún lector externo de ella con el que comparar

# text
seg-ff15935ba1b3 = Modelo de efemérides LEO de 22 parámetros de Liu et al. { "2025" } y su ajuste sobre órbitas precisas reales

# text
seg-6af1b6f3bbd4 = la variante Liu22 de leo_navmsg::elements::EphemerisModel, evaluada por kepler_point con Liu22Extra: el conjunto de 16 parámetros más una tasa de semieje mayor a_dot, una tasa de movimiento medio n_dot que entra como n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transcrita de la Ec. { "1" } del artículo (la comparación del ajuste no depende de esta convención de escala, por lo que el significado de un valor de nDot transmitido no se valida aquí), y armónicos de radio de una y tres veces por revolución Crs1, Crc1, Crs3, Crc3 sobre el argumento de latitud sin corregir. Su ajuste mediante leo_navmsg::fit::fit_message toma el inicio y el estimador de la Sección { "2.3" } del artículo (cada corrección parte de cero; mínimos cuadrados simples sin a prioris; el tope de 100 iteraciones del artículo), pero se detiene con la regla de convergencia de parámetros de Kshana (cada paso por debajo de { "1e-3" } de su sigma formal) en lugar de la regla del artículo de un cambio de RMS por debajo de { "0.1" } mm. Ajustado sobre arcos de { "20" } y { "30" } minutos de una órbita precisa tabulada

# text
seg-90768b99ab5f = Medido: las órbitas reducidas dinámicas operativas de TU Graz IfG/ITSG (de uso libre con reconocimiento; valores SHA-256 en el NOTICE del fixture) de GRACE-A, GRACE-C, Sentinel-2A y Sentinel-6A son la referencia, ajustadas en arcos de { "20" } y { "30" } min, y comparadas con las filas de 22 parámetros (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) de las Tablas { "4" }, { "5" }, { "6" } y { "8" } de Liu, Su, Xie, Zhou y Qu ({ "2025" }), Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894 (CC BY { "4.0" }; números citados, no incorporados). Umbrales fijados antes de la primera comparación: RMS a lo largo, transversal y radial cada uno dentro de 1.5x bilateral, y SISRE dentro de 1.5x, para cada satélite y ambas longitudes de arco. La repetición de la ronda 2 se preregistró (aa559785) antes del cambio del motor y antes de obtener las órbitas reservadas: el ajuste de la Ec. { "1" } y la Sección { "2.3" } del artículo, más dos nuevos días reservados por satélite frente a los mismos valores impresos. Medido: cada razón de los días del artículo de { "0.755" } a { "1.138" }, y cada razón de los días reservados de { "0.683" } a { "1.186" }. Divulgado: las razones a lo largo de la traza de la primera ejecución de { "1.71" } (Sentinel-2A) y { "1.86" } (Sentinel-6A) a { "20" } min se conocían antes de la repetición. Las razones SISRE reservadas más bajas quedan cerca de la cota inferior de { "0.667" } porque el SISRE impreso del artículo usa los pesos de la Tabla { "2" } sin elevar al cuadrado (véase la fila del ajustador de 16 parámetros). El preregistro describió mal la regla de parada del artículo (el artículo se detiene con un cambio de RMS por debajo de { "0.1" } mm); se mantuvo la regla de convergencia de parámetros preregistrada. Mutación: restaurar a prioris centrados en cero da, para Sentinel-6A a { "20" } min a lo largo de la traza, { "1.08" } frente a { "0.70" } cm ({ "1.54" }), lo que falla. Sonda del revisor: la convención anterior a 0.30 (un factor 1/2 sobre n_dot) deja cada cifra sin cambios, por lo que la comparación restringe el espacio funcional del modelo de 22 parámetros y la calidad de su ajuste, no la convención de n_dot. Fuera de la afirmación: el polinomio ECEF ATOMIC y la tabla sintética de comparación de modelos de cinco altitudes, que tienen su propia fila MODELLED

# text
seg-e79047fc95af = Polinomio ECEF de reloj cero de ATOMIC y la comparación sintética de modelos LEO a cinco altitudes

# text
seg-e261843e35b1 = la variante EcefPoly de leo_navmsg::elements::EphemerisModel: un polinomio ECEF por eje sin términos de reloj, con el término relativista a partir de -2 r.v/c^{ "2" }, puntuado frente a un reloj gobernado. También el análisis de comparación de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta el modelo de 22 parámetros a las cinco altitudes del artículo en arcos de 20 minutos de una órbita integrada por Kshana e imprime el resultado junto al SISRE publicado

# text
seg-a3b92fdcc591 = Datos del modelo ATOMIC de InsideGNSS (polinomio de 6.º orden, aproximadamente un minuto de validez, refresco de { "30" } s, reloj gobernado, error de reloj de { "24" } cm). Son datos descriptivos sin cifras publicadas con las que comparar. La tabla de cinco altitudes imprime el SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } y { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } y { "1336" } km en un arco de 20 minutos) junto al ajuste de Kshana sobre su propia órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } y { "0.51" } cm; razones de { "0.46" } a { "0.77" }), sin fijar, porque el artículo ajustó órbitas precisas reales y las referencias difieren. El modelo de 22 parámetros y su ajuste están validados frente a órbitas reales en la fila Modelo de efemérides LEO de 22 parámetros de Liu et al. { "2025" } y su ajuste sobre órbitas precisas reales. { "0.30" } revisión: las cifras de la tabla cambiaron con el ajuste según la convención del artículo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Servicios ionosféricos monofrecuencia y UTC de un mensaje de navegación LEO

# text
seg-bc73bfeca68e = leo_navmsg::services: el retardo de difusión de Klobuchar en cualquier portadora (el modelo L1 del motor escalado por (f_L1/f)^{ "2" }), el nivel de ionización efectiva de NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } con las reglas de todo cero y de [{ "0" }, { "400" }] sfu, y el tiempo del sistema a UTC con los tres casos de segundo intercalar del ICD

# text
seg-84500ea94d49 = GNSSTk { "15.3.1" } (ARL:UT, LGPL-3.0, commit 55ea3344, ejecutado como programa aparte mediante un arnés; no se incorpora código de GNSSTk): getIonoCorr de KlobucharIonoNavData en L1, L2 y L5, getEffIonoLevel de NeQuickIonoNavData para Az con las reglas de todo cero y de [{ "0" }, { "400" }] sfu, y getOffset de GPSLNavTimeOffset para la deriva UTC, dentro de { "1e-3" } m, { "1e-6" } sfu y { "1e-9" } s; y ERFA mediante pyerfa { "2.0.1.5" } (BSD-3), que deriva UTC de la tabla de segundos intercalares del IERS, para los tres casos de segundo intercalar del ICD a través de los segundos intercalares reales del 2015-06-30 y del 2016-12-31, incluida la lectura { "23" }:{ "59" }:{ "60" }, dentro de { "1e-9" } s (GNSSTk no implementa la regla de longitud de día del caso (b) del ICD, por lo que no se usó ahí, como se indica en el preregistro). Las entradas son los coeficientes reales de la cabecera BRDC de IGS. Preregistrado (6a66994b; la enmienda 88807a7e confirmó un subconjunto de { "21" } 602 filas de la rejilla de segundos intercalares antes de comparar ningún valor de Kshana). La integración de densidad electrónica de NeQuick no está implementada, y no se hace ninguna corrección para un satélite LEO que vuela dentro de la ionosfera

# text
seg-0af8030f4d21 = Doppler que debe gestionar un receptor terrestre procedente de un satélite de navegación LEO

# text
# c1: leo-pvt
seg-9714103964d6 = Tasa de variación de distancia exacta de un satélite cuya posición y velocidad fijas a la Tierra proceden de una órbita de dos cuerpos con la deriva secular J2 y la rotación de la Tierra (leo_fusion::geom::EarthOrbit::state, con la velocidad como derivada temporal exacta de la posición), convertida en Doppler a una portadora; el mayor Doppler absoluto, tasa de Doppler y sacudida (jerk) por encima de una máscara de elevación sobre una ventana (leo_fusion::doppler::doppler_envelope), informados por sistema LEO por el tipo <c1/> en modo doppler

# text
seg-ebf6cee8ec4c = Cifras publicadas reproducidas a partir de la órbita y la portadora indicadas: Doppler de Iridium de hasta más o menos { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) y Doppler máximo de Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe y Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). La cifra de Iridium es una cota superior redondeada, de ahí el umbral del { "5" } %. La tasa de Doppler y la sacudida (jerk) se informan pero no se validan: la sacudida modelada en una pasada cenital de Pulsar X1 es de aproximadamente { "1.0" } Hz/s^{ "2" } frente a los { "1.26" } publicados

# text
seg-d2e18c8bdc14 = Posicionamiento a partir de Doppler LEO, con uno o varios satélites, con estados de deriva de reloj y de velocidad

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamiento por lotes de Gauss-Newton a partir de la tasa de variación de distancia con derivadas parciales analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), una velocidad constante del usuario como opción, una pseudomedición de altura para un usuario en superficie, pasos amortiguados; la covarianza formal en la verdad de referencia; proyecciones a lo largo de la traza, transversal y vertical; la exactitud de una sola pasada frente al desplazamiento transversal del usuario; el instante de máximo acercamiento. El modo doppler del tipo <c1/> añade el error frente a la longitud de la ventana y un modo de señales de oportunidad solo Doppler (el preajuste starlink-sop)

# text
seg-84e2eb636579 = Consistencia interna: recuperación sin ruido, la identidad cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivada numéricamente, Doppler cero en el máximo acercamiento, la solución espejo de una sola pasada y errores con semilla frente a la covarianza formal. La cifra de Starlink de Kozhaya, Saroufim y Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: unos { "2" } m en { "20" } s con tres satélites) es solo una comparación: el receptor modelado, con una efeméride perfecta y todo el error concentrado en un sigma Doppler de { "30" } Hz, es varias veces menos exacto sobre la misma ventana, y no se reproducen el receptor ni la tasa de medición del artículo

# text
seg-7f462969d2d4 = Posicionamiento conjunto por pseudodistancias de GNSS y LEO con sesgos entre sistemas y modelos de error por señal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluciones de Gauss-Newton por mínimos cuadrados ponderados sobre cualquier mezcla de sistemas, con un reloj de receptor por sistema (el sesgo entre sistemas se estima junto con la posición) o un desfase de difusión conocido sobre la escala de tiempo de referencia; sigmas por medición suministrados por quien llama y, por defecto, el ruido térmico del lazo de seguimiento de retardo del motor (navsignal::dll_code_jitter_chips) al C/N0 de la elevación combinado con el error de distancia de la señal en el espacio; DOP sin ponderar (GDOP, PDOP, HDOP, VDOP, TDOP) en el marco geodésico local, sigmas formales este-norte-arriba y los sigmas de sesgo; el modo conjunto del tipo <c1/> compara soluciones solo GNSS, solo LEO y fusionadas y barre el DOP frente al número de satélites LEO añadidos

# text
seg-e83699418c0e = Un DOP de cuatro satélites derivado a mano (un satélite en el cenit y tres en el horizonte separados { "120" } grados, cuya matriz normal se invierte a mano), la identidad estructural de que un sistema con su propio reloj y un satélite no añade geometría, recuperación sin ruido de la posición, el reloj y el sesgo, y errores con semilla frente a la covarianza. Solo comprobaciones internas; no se compara con la salida de ningún receptor. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en un día IGS multi-GNSS (ABMF 2018-05-13, GPS y Galileo C1C, efemérides de difusión, Klobuchar) el sesgo entre sistemas coincide con RTKLIB v2.4.2-p13 rnx2rtkp (diferencia mediana de -0.11 ns tras la corrección del retardo de grupo de difusión de { "0.30" }, -0.35 ns antes; umbral de { "1" } ns), pero solo el { "93.6" } % de { "280" } épocas (el { "93.2" } % antes de la corrección) están a menos de { "3" } m de la coordenada ITRF2020 frente al { "95" } % preregistrado. El propio RTKLIB alcanza el { "88.2" } % con los mismos datos, por lo que el umbral queda más allá del posicionamiento monofrecuencia con difusión en esta estación y este día y no es una discrepancia del resolutor; la prueba de comparación se confirma ignorada. { "0.30" } ronda { "2" }, entradas más estrictas con el umbral sin cambios de { "3" } m / { "95" } % / { "1" } ns, un hallazgo (sigue siendo MODELLED): con el par libre de ionosfera E1/E5a de Galileo (preregistrado { "6927e039" }) el { "79.9" } % de las épocas están a menos de { "3" } m (RTKLIB { "67.9" } %); con órbitas, relojes, desfases de antena de satélite y sesgos de código precisos de CODE MGEX (preregistrado 7d8c3597) el { "94.2" } % (RTKLIB { "94.1" } %), y el sesgo entre sistemas difiere de RTKLIB en -1.03 ns porque el modo único de RTKLIB ignora los desfases de antena de satélite (+{ "0.04" } ns cuando ambos los omiten)

# text
seg-ee9a4a0cb530 = Convergencia del posicionamiento de punto preciso con solo GNSS y con aumentación LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Un filtro de Kalman extendido PPP flotante sobre código y fase libres de ionosfera: coordenadas estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio proyectado por 1/sin(elevación), una ambigüedad flotante por cada arco de satélite añadida a la salida y descartada a la puesta, y el error de órbita y reloj precisos común al código y a la fase de un satélite, procesado como una actualización correlacionada de dos filas en forma estabilizada de Joseph; mediciones simuladas a partir del mismo modelo; tiempo de convergencia (errores por debajo de los umbrales hasta el final de la ejecución), curvas de error y el NEES de posición promediado sobre la ejecución para solo GNSS y cada caso LEO, ejecutado como el tipo <c1/>

# text
seg-be4593802ccf = La prueba chi-cuadrado del NEES es una comprobación de consistencia interna (la verdad de referencia y el filtro comparten el modelo). La tendencia se compara con Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min acortados a { "7.0" }, { "3.2" }, { "2.1" } y { "1.3" } min con { "60" }, { "96" }, { "192" } y { "288" } satélites LEO. El escenario incluido da { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } y { "2.3" } min con sus propias capas representativas de { "1000" } km, { "60" } grados, ruido y estaciones; no se reproducen las constelaciones, el ruido ni la definición de convergencia del artículo, por lo que esto es una consistencia MODELLED de la tendencia (acortamiento monótono, la mayor constelación por debajo de un tercio del tiempo solo GNSS), no una validación

# text
seg-8ef013b46d0f = Exactitud de posicionamiento de redes no terrestres 5G a partir del ancho de banda de la señal

# text
# c1: ntn-positioning
seg-12b1e4657370 = La cota de Cramér-Rao del tiempo de llegada a partir del ancho de banda cuadrático medio (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para un espectro OFDM plano (beta = B/sqrt({ "12" })), un espectro BPSK de banda limitada (numerador en forma cerrada) o cualquier espectro por cuadratura, y de la frecuencia de un tono complejo, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); soluciones de tiempo de llegada del enlace descendente con un reloj de receptor desconocido y una solución Doppler de un solo satélite durante una pasada en la banda S MSS n256 de 3GPP, ejecutadas como el tipo <c1/>

# text
seg-f63e1d78cfff = Valores resueltos publicados (P1): Bachl, Lei y Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), cotas de un solo SSB de NR NTN reproducidas a partir del mapa SSB de 3GPP TS { "38.211" } mediante las propias funciones numéricas de Kshana (W_rms { "1.9616" } frente a { "1.96" } MHz, sigma_t { "38.755" } frente a { "39" } us, sigma_f 100.79/87.28 frente a 101/87 Hz, sigma_rho 0.5970/0.5831 frente a 0.60/0.58 m, cada una dentro de media unidad del último dígito impreso); los anchos de banda RMS de BPSK-R de Betz { "2001" } Tabla { "1" } (1.128/3.477 frente a 1.1/3.5 MHz, suplementario); las covarianzas de las soluciones de tiempo de llegada y Doppler coinciden con numpy.linalg.inv de numpy { "2.4.6" } sobre la geometría exportada (P2; { "5e-15" } y { "1.2e-5" } relativo, umbrales { "1e-5" } y { "1e-3" }). Preregistrado (9f2875db; parte C 0d66dccd). La solución del motor joint_pvt::formal_sigma_enu (la cota evaluada en la posición verdadera, no en la solución con ruido) se escribió después de que la primera ejecución de { "200" } kHz fallara en { "6.5e-5" } y se repitió con la tolerancia sin cambios. Las formas de espectro plano y de tono complejo que ejecuta el escenario (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz) llegan a la comprobación P1 mediante pruebas unitarias de identidad dentro del crate. Cotas en un canal sin multitrayecto, no exactitud alcanzada. { "0.30" } revisión: ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m (NR { "5" } MHz) y { "25.938613" } -> { "25.938839" } m (NB { "200" } kHz)

# text
seg-9306f1c06081 = Transferencia de tiempo asistida por LEO a UTC frente al C/N0 y el oscilador del receptor

# text
# c1: leo-pvt
seg-c618feb01476 = Mediciones de reloj de cada satélite LEO a la vista en una posición conocida, combinadas por varianza inversa a partir del modelo de ruido de pseudodistancia, filtradas por un filtro de Kalman de dos estados (fase, frecuencia) cuyo ruido de proceso es el ruido de frecuencia blanco y de paseo aleatorio de la clase del oscilador (slot_timing::ClockNoise, clock_state::ClockClass; la varianza de deriva de holdover::coast_phase_variance), un reloj de referencia con semilla de los mismos niveles, y la expresión de tiempo del sistema a UTC de la sección { "20.3.3.5.2.4" } de IS-GPS-200 con una incertidumbre del desfase de difusión añadida como sesgo por ejecución; el modo de temporización del tipo <c1/> barre osciladores y desplazamientos de C/N0

# text
seg-4a878bd4a90f = Consistencia interna: la expresión del desfase publicada evaluada a mano, el error normalizado sobre { "40" } semillas y el suelo fijado por la incertidumbre del desfase. La cifra del NIST para receptores de temporización de Iridium con un reloj atómico en miniatura (menos de { "40" } ns respecto a UTC(NIST) durante { "40" } días) es solo una comparación; el escenario de Iridium incluido da de { "10" } a { "11" } ns RMS a potencia nominal con su error de distancia representativo de { "5" } m. El ruido de frecuencia flicker y el retardo ionosférico no se simulan

# text
seg-cef79d82f0d4 = Cobertura LEO y dilución de la precisión para usuarios polares y árticos frente a GNSS MEO

# text
# c1: leo-pvt
seg-462a5e95d480 = Satélites a la vista y PDOP, HDOP y VDOP medianos con disponibilidad frente a la latitud, sobre longitudes y épocas muestreadas, para los sistemas GNSS MEO solos, los sistemas LEO solos y todos ellos, cada sistema con su propia máscara y modelo de reloj, ejecutado como el modo polar de <c1/>; las órbitas son conjuntos de elementos SGP4/SDP4 en la época del barrido (2026-01-01T00:{ "00" }:{ "00" } UTC en el modo polar) llevados al marco fijo a la Tierra por la vía de órbita terrestre validada (IAU 2006/2000A, UT1 = UTC, sin movimiento polar)

# text
seg-a16896913438 = Orekit { "13.1.8" } (Apache-2.0) con Hipparchus { "4.0.3" }: los estados GCRS del motor rotados a ITRF por Orekit (IERS { "2010" }), visibilidad con TopocentricFrame de WGS-84 frente a la máscara de cada sistema, org.orekit.gnss.DOPComputer para una incógnita de reloj y numpy.linalg.inv de NumPy { "2.4.6" } (P2) para varias; con la vía comprobada frente a python-sgp4 y ERFA (fila 'One Earth-orbit path'). Umbrales fijados antes de la ejecución (preregistrado 72ea9eb0; T2 y T3 son los umbrales de la ronda 2 de { "0.30" }). El paso TEME -> GCRS congelado en J2000 pone la prueba en rojo ({ "4739" } fallos). Solo geometría; sin centelleo, terreno ni potencia de señal. El VDOP de GNSS aumenta hacia el polo ({ "1.20" } en el ecuador a { "1.51" } a { "89.9" } grados para GPS y Galileo en el escenario incluido) mientras que una capa LEO casi polar converge allí. Historial: la ronda { "2" } (3254d456) coincidió en estados de dos cuerpos tabulados; la afirmación completa de la ronda 1 de D8 frente a la propia propagación TLE de Orekit (e947e69d) fue un hallazgo, el SDP4 de Orekit con e = { "0" } y su TEME IERS { "1996" }, fijado

# text
seg-d92777401093 = Sistemas LEO PNT con nombre como preajustes de datos opcionales, cada uno con su fuente

# text
seg-5130bfe2410c = Entradas independientes del sistema: cada sistema son capas Walker, elementos explícitos o un preajuste GNSS, una señal (portadora, tasa de chips, ancho de banda, potencia recibida o rango de C/N0), un SISRE, un sigma Doppler y un modelo de reloj; los preajustes rellenan solo lo que un escenario deja fuera, un archivo cada uno con fuentes marcadas como PUBLIC (con una URL), WORKSHOP o DERIVED y los valores no publicados enumerados como representativos: Xona Pulsar X1/X5, Iridium STL, señales de oportunidad de Starlink, CentiSpace, un sistema representativo en banda C, el modelo de efemérides de reloj cero ATOMIC y un preajuste derivado de un taller en el archivo opcional del preajuste Celeste IOD, que se retiene borrando ese archivo y sus escenarios

# text
seg-c6f71b3937cd = Transcripción de los valores públicos citados, comprobada en cuanto a estructura (cada fuente pública tiene una URL, los patrones Walker se dividen de forma exacta, el C/N0 a partir de la potencia recibida sobre kT a { "290" } K), no frente a una referencia independiente externa. Los valores representativos se nombran en cada preajuste y son ilustrativos

# text
seg-dec52b5b9cd6 = Un sistema LEO-PNT de extremo a extremo: diseño de señal, presupuesto de enlace de pasada, mensaje de navegación y posicionamiento fusionado, con la salida de cada etapa entregada a la siguiente

# text
# c1: leo-pnt-chain
seg-39443b31d418 = El tipo <c1/>: un diseño leo-signal (preajuste público o en línea) fija el centro, el ancho de banda, la tasa de chips y el reparto de EIRP de una banda leo-pass; la pasada da el C/N0 del componente seguido y el jitter de código de banda limitada por época; una recta de C/N0 por mínimos cuadrados en sin(elevación), el SISRE del mensaje leo-navmsg (ajustado en la órbita del satélite de la pasada, más un término indicado de determinación de órbita en suma cuadrática) y la portadora y la tasa de chips del diseño pasan a cada sistema LEO de una solución conjunta leo-pvt y, opcionalmente, a los casos LEO de leo-ppp; cada traspaso se informa con su valor y su unidad

# text
seg-854d3c1428d0 = Autoconsistencia de los traspasos: cada valor entregado es igual a la propia salida de la etapa anterior, y mutar una entrada anterior desplaza cada cifra posterior que depende de ella. Las etapas conservan sus propias etiquetas; la cadena no añade física ni ninguna referencia independiente externa

# text
seg-55ca63edff02 = Detección de spoofing mediante la consistencia entre Doppler LEO y geometría de la pasada

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = La sección <c2/> del tipo <c1/>: un spoofer falsifica, de forma autoconsistente en distancia y tasa de variación de distancia, las señales vistas en una posición declarada que salta y/o se desplaza respecto a la verdadera tras un inicio (por banda LEO y para la señal GNSS MEO); el receptor predice cada tasa de variación de distancia a partir de la órbita de difusión y una posición y velocidad previas independientes, y contrasta las tasas medidas con un estadístico chi-cuadrado de mínimos cuadrados generalizados sobre una ventana de épocas (deriva de reloj como parámetro de molestia o con un a priori), en los canales GNSS, los canales LEO y todos los canales, con ruido térmico del lazo de seguimiento de frecuencia a partir de C/N0 (Kaplan & Hegarty { "2006" }, sección { "5.6.2" }); probabilidad de detección a partir de la ley chi-cuadrado no central con una probabilidad de falsa alarma indicada, con la detección declarada con una probabilidad de detección fallida indicada

# text
seg-787c07c08c7f = Formas cerradas e identidades, no una medición externa: el gradiente de la tasa de variación de distancia frente a una diferencia central, el estadístico en forma de información frente a la forma de covarianza densa, una deriva de reloj pura que da cero, un desplazamiento explicado por el a priori que da como máximo |dx|^2/sigma_p^{ "2" }, el estadístico cuadrático en un salto. Ninguna cifra de detección se compara con un ataque medido; el spoofer está idealizado (sin potencia, ángulo de llegada ni firma de pico de correlación)

# text
seg-5f341f85ac07 = Detección de spoofing mediante la consistencia entre bandas de una señal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO y par de bandas de medición de distancia, la sección <c1/> forma la combinación de pseudodistancia libre de geometría, elimina el modelo ionosférico del receptor y contrasta su salto de época a época con el ruido de código de las dos bandas y una tasa ionosférica no modelada tolerada indicada (gaussiana bilateral, probabilidad de detección exacta); un spoofer que falsifica algunas bandas y no otras, o todas las bandas sin la ionosfera, se ve en su inicio; uno que falsifica todas las bandas y simula la ionosfera no se ve, lo cual indica el resultado

# text
seg-87fd44fa1d94 = Identidades: el salto de inicio de un spoofer libre de ionosfera es igual a la diferencia modelada de retardo ionosférico del par, el umbral es el cuantil normal bilateral por la desviación típica del salto más la cota de tasa. El modelo ionosférico del receptor es el del motor, de modo que el residuo auténtico es cero en media por construcción; sin referencia independiente externa

# text
seg-97dbcd5f2728 = Sondeo de la ionosfera: TEC oblicuo a partir del retardo de doble banda de una pasada LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de un satélite <c1/>, el informe da el contenido total de electrones oblicuo que recupera la combinación de código libre de geometría en el pico de la pasada, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), y su sigma de 1 a partir del ruido térmico de código de las dos bandas, de modo que cualquier diseño LEO-PNT multibanda puede evaluarse como sondeador de la ionosfera

# text
seg-2562ae9e6180 = La identidad de dispersión de primer orden, exacta por construcción frente al propio retardo de primer orden del motor (cuyo escalado 1/f^{ "2" } está VALIDATED frente a IS-GPS-200 en su propia fila); la precisión es solo el ruido térmico de código, sin multitrayecto ni sesgos entre frecuencias. { "0.30" } ronda { "2" }, medido (preregistrado 5e795f93), un hallazgo (sigue siendo MODELLED): el mapa global de ionosfera de CODE CODG1330.18I frente al código C1C/C2W de ABMF con los sesgos de CODE da { "33" } de { "36" } medias de arco dentro de { "3" } TECU (peor +{ "6.84" } TECU en un arco vespertino; RMS por época { "3.95" } TECU), frente a un umbral de todos los arcos; no validado

# text
seg-0a63a69e181d = Covarianza del datum del marco lunar con las estaciones estimadas, frente a precisión extendida de 50 dígitos

# text
seg-de2ee45f6527 = La covarianza del datum de Helmert de siete parámetros del escenario lunar-frame-campaign con las estaciones terrestres estimadas (estación { "1" } anclada), tal como la calcula lunar_frame_campaign en binary64: la información de Fisher conjunta de estaciones y balizas acumulada a partir del jacobiano de retardo, el bloque de estaciones marginalizado mediante un complemento de Schur a través de una inversa espectral de Jacobi, H = AᵀSA formada con el diseño de Helmert e invertida espectralmente. El problema está mal condicionado por construcción (número de condición de Helmert de { "2.1e8" } a { "2.3e8" }, número de condición de la información conjunta de { "1.6e12" } a { "3.0e13" }): un cambio relativo de { "1e-9" } en la corrección de Schur desplaza los sigmas del datum hasta en un { "28" } %. Informado: los siete sigmas del datum, el número de condición de Helmert y la dirección más débil. AFIRMACIÓN, ACOTADA: los sigmas del datum y el número de condición del motor quedan dentro de la cota de error de peor caso a priori de una cadena de doble precisión estable hacia atrás en este problema; esto no afirma que sean tan exactos como permite la doble precisión (una vía de factorización es unas mil veces más exacta con las mismas entradas, y el resolutor de raíz cuadrada opcional unas diez millones de veces), y la dirección más débil solo está validada donde su umbral está por debajo de un ángulo recto (el control con estaciones fijas)

# text
seg-1aab389815b3 = mpmath { "1.3.0" } (BSD-3-Clause) con { "50" } cifras significativas, autocomprobado con { "80" } (coincidencia { "1.1e-38" } o mejor), sobre el jacobiano confirmado del motor, los pesos y el diseño de Helmert: la propia resolución LU de mpmath para el complemento de Schur, su inversa para H y su descomposición en valores propios de Jacobi (P2, una biblioteca numérica independiente). Preregistrado 804662d5 antes de que existiera el fixture, con umbrales a partir de una fórmula de error hacia atrás de primer orden: constante (3n+{ "1" })n + m por el redondeo unitario (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "10.4" }, la forma del nivel B), por la sensibilidad exacta de primer orden de cada magnitud respecto a la información conjunta, el complemento de Schur y H. Medido: sigmas del datum dentro de { "4.8e-6" } el 2026-03-18 (umbrales { "9.6e-2" } a { "2.2e-1" }), { "9.7e-6" } el 2024-01-01 (umbrales { "2.8e-2" } a { "6.9e-2" }) y { "2.0e-14" } con las estaciones fijas (umbrales { "1.0e-11" } a { "2.8e-7" }); número de condición dentro de { "4.6e-6" }, { "1.3e-5" } y { "4.1e-14" }. En los escenarios con estaciones estimadas los umbrales son de peor caso y cuatro órdenes de magnitud superiores al error medido, y el umbral de la dirección más débil allí supera un ángulo recto, por lo que esa comprobación no se cuenta; en el control con estaciones fijas la dirección más débil coincide hasta { "6.6e-16" } rad frente a un umbral de { "9.4e-11" }, medido por la cuerda entre vectores unitarios (un comparador acos anterior no podía resolver ángulos por debajo de { "1.5e-8" } rad; el umbral no cambia). Diagnóstico: las vías de Cholesky y QR de NumPy { "2.3.5" } alcanzan { "9e-9" } y { "5e-9" } con las entradas del 2024-01-01, sus vías de inversa y de valores propios { "2.9e-6" } y { "6.2e-6" }: el motor está dentro de su cota pero es unas mil veces menos exacto que una vía de factorización. Valida el álgebra lineal con las entradas confirmadas, no el jacobiano (eso lo hace el tramo SPICE de la fila de campaña) ni la exactitud física de la campaña ilustrativa

# text
seg-71b463388e80 = Resolutor de datum de información en raíz cuadrada frente a precisión extendida de 50 dígitos

# text
seg-5ec3e3c2bf19 = Un resolutor de información en raíz cuadrada opcional (lunar-frame-campaign solver = "srif"; valor por defecto sin cambios) que nunca forma ni invierte una matriz de información para el datum: QR de Householder (descomposición ortogonal-triangular) del jacobiano de retardo blanqueado como actualización de medición de un filtro de información en raíz cuadrada, las estaciones terrestres marginalizadas a través del bloque triangular final (cuyo producto de Gram es el complemento de Schur), un segundo QR de R_bb A para el datum de Helmert de siete parámetros, sigmas como las normas de fila de la inversa triangular, y el espectro (número de condición, dirección más débil) a partir de una descomposición en valores singulares de Jacobi unilateral. Los productos internos se compensan con un producto libre de error con división de Dekker, de modo que cada operación es una operación básica o una raíz cuadrada IEEE-754 correctamente redondeada; los resultados idénticos en todas las plataformas se argumentan a partir de eso, no se prueban entre plataformas

# text
seg-271cba640489 = mpmath { "1.3.0" } (BSD-3-Clause) con { "50" } cifras significativas, autocomprobado con { "80" } (coincidencia { "1.4e-43" } o mejor), sobre el jacobiano confirmado del motor, los pesos y el diseño de Helmert (P2, una biblioteca numérica independiente: la propia resolución LU, inversa, Cholesky y descomposición en valores propios de Jacobi de mpmath). Preregistrado b41908c9 antes de escribir el resolutor, con umbrales a partir de una cota de error hacia atrás de primer orden en forma de raíz cuadrada: constante de QR de Householder mn más (3n+{ "1" })n por el redondeo unitario (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "19.4" } y Capítulo { "8" }) por sensibilidades exactas. Medido: sigmas del datum dentro de { "3.0e-13" } el 2026-06-09 (umbrales { "4.1e-7" } a { "5.3e-7" }), { "1.9e-15" } con las estaciones fijas (umbrales de hasta { "4.8e-12" }), { "3.8e-13" } el 2026-03-18 y { "2.3e-13" } el 2024-01-01, donde el resolutor espectral por defecto se desvía { "4.8e-6" } y { "9.7e-6" }; número de condición dentro de { "4.9e-13" }; dirección más débil dentro de { "1.4e-13" } rad (control { "1.7e-16" } frente a { "5.1e-10" }). LÍMITE DE LA COMPROBACIÓN: los umbrales solo garantizan errores del datum inferiores a aproximadamente { "2e-7" } relativo; las cifras medidas de { "1e-13" } son observaciones, no lo que garantizan los umbrales. La comprobación rechaza el resolutor espectral por defecto (sigmas { "9.7e-6" } frente a { "2.9e-7" } el 2024-01-01; en la fecha limitante { "1.3e-6" } frente a { "4.9e-7" }, un margen de { "1.3" } a { "2.6" }) y una inversa triangular mal tomada (normas de columna: rojo), pero un signo de Householder invertido, un producto escalar sin compensar y sigmas de una inversa espectral de la H formada a partir del factor de raíz cuadrada ({ "3.7e-9" }) pasan todos, por lo que no demuestra que cada paso de raíz cuadrada sea necesario. Valida el álgebra lineal del resolutor opcional con entradas confirmadas, no el jacobiano ni el resolutor por defecto; la reproducibilidad bit a bit entre plataformas se argumenta a partir de las operaciones usadas y solo se prueba como identidad de repetición en una plataforma

# text
seg-433b52bf0ba2 = Monitores de confianza marítimos: la aritmética en la que se apoyan (decodificación NMEA, desplazamientos geodésicos, los estadísticos cinemáticos y de residuos de sensores)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Para un buque, <c1/> decodifica las sentencias NMEA { "0183" } que emiten un receptor y sus instrumentos (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), forma el desplazamiento este-norte entre soluciones (<c2/>) y, a partir de ellos, los estadísticos sobre los que deciden sus monitores: la velocidad implícita, el residuo de estima, la aceleración implícita y la velocidad de giro implícita sobre ventanas de { "30" } s, los residuos de rumbo frente a rumbo efectivo, de corredera frente a velocidad sobre el fondo y de altitud de antena (medianas de { "10" } s), y la dispersión y el aumento de la relación señal-ruido de los satélites.

# text
seg-32fcf6956dac = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: ({ "1" }) la decodificación de cada campo que leen los monitores, frente a pynmea2 { "1.19.0" } (MIT) en { "8" } registros sintéticos ({ "1,086" } épocas), hasta { "1e-9" } en la unidad del campo (latitud y longitud, altitud, separación del geoide, HDOP, velocidades, rumbo efectivo, rumbo, relación señal-ruido; enteros y fechas de forma exacta; hora del día hasta { "1e-6" } s), con las mayores diferencias al nivel del último dígito de un doble; ({ "2" }) el desplazamiento este-norte entre dos soluciones, como distancia y demora, frente a la geodésica WGS84 de geographiclib { "2.1" } (MIT) en { "223" } pares de soluciones con líneas base de hasta { "2" } km, de -45 a { "70" } grados de latitud y a través del antimeridiano, hasta { "0.01" } m y { "0.001" } grados (la demora frente al acimut medio de la geodésica, la dirección de la cuerda); ({ "3" }) los estadísticos de entrada de los monitores en { "341" } épocas puntuadas de una travesía sintética de { "400" } s con un giro y un salto de posición, frente a recálculos en Python que usan geographiclib para distancia y acimut, pynmea2 para la decodificación y numpy para medianas y desviaciones típicas: velocidad implícita hasta { "0.005" } m/s, residuo de estima hasta { "0.02" } m, aceleración hasta { "5e-4" } m/s^{ "2" }, velocidad de giro hasta { "1e-3" } grados/s, las medianas de residuos y la dispersión y el aumento de la relación señal-ruido hasta { "1e-6" }. LO QUE NO: las longitudes de ventana, las tolerancias y los umbrales de los monitores son reglas propias de este proyecto; el código Python las reproduce a partir de la misma documentación, de modo que la coincidencia corrobora la implementación de la aritmética, no las reglas. La sentencia THS no tiene clase en pynmea2 y la sentencia ROT no se lee; ninguna está cubierta. La tabla de un emisor NMEA y número de satélite a un identificador de satélite al estilo RINEX es propia de este proyecto (solo se comparan el número, el emisor y el valor). Las entradas de paso de tiempo, reloj del anfitrión y estado de autenticación no tienen referencia independiente. Todos los datos son texto sintético de receiver_trust::synth; nada aquí es una medición y no se hace ninguna afirmación sobre cómo se comporta ningún monitor ante interferencia real. Demora: comparada con el acimut medio de la geodésica. La comparación preregistrada frente al acimut directo en la solución { "1" } falló a { "0.001" } grados ({ "77" } de { "223" } pares, peor caso { "8.3e-3" } grados) por una discrepancia de definición, no de aritmética; la enmienda se hizo después de la primera ejecución y se registran ambos resultados (la comparación con el acimut directo permanece en la prueba como una cota descriptiva, no preregistrada, de { "0.01" } grados). Divulgado: las primeras ejecuciones encontraron entradas que ejercitaban muy poco (la aceleración y la velocidad de giro quedaban saturadas a cero en cada época, y la trayectoria del antimeridiano nunca lo cruzaba), un error en el generador sintético (sin ajuste de longitud) y, para la demora, que la magnitud de referencia independiente registrada (el acimut directo de la geodésica en la primera solución) difiere de la dirección de la cuerda en aproximadamente la mitad de la convergencia de meridianos ({ "77" } de { "223" } pares fuera de { "0.001" } grados, peor caso { "8.3e-3" }); se corrigieron las entradas y la demora se comparó con el acimut medio con la misma tolerancia (enmiendas { "1" } a { "3" } del preregistro, hechas después de ver los resultados y por tanto no ciegas); las comparaciones de rumbo efectivo y de rumbo se hicieron circulares ({ "360" } y { "0" } grados son un mismo rumbo, enmienda { "5" }). Mutación: un escalado de { "1e-4" } del desplazamiento este falla la comparación geodésica.

# text
seg-1fdbb476c8ab = Puntuación de confianza marítima: la agregación de la evidencia de los monitores en una puntuación de 0-100 y sus tres bandas

# text
seg-0d76b33144f1 = Cada monitor reduce su evidencia a una razón entre estadístico y umbral; la puntuación es { "100" } menos la suma sobre los monitores del peso por una rampa lineal acotada de la razón ({ "0" } hasta { "0.5" }, { "1" } en { "1.5" }), acotada a de { "0" } a { "100" } y redondeada a { "0.1" }, con bandas en { "90" } y { "55" }; cada época enumera los monitores que dedujeron y sus puntos.

# text
seg-b2d3c6d6ac36 = Implementación frente a especificación, NO una referencia independiente externa: una reimplementación en Python de sala limpia (scripts/maritime_score_cleanroom.py), escrita por un lector al que solo se dieron docs/RECEIVER-TRUST.md y docs/MARITIME-TRUST.md y no el código fuente en Rust, coincide con score_from_ratios en { "600" } vectores de razones (puntuación, banda, puntos y orden de las deducciones, diferencia { "0" }), después de completar la documentación donde el primer lector la encontró muda o inconsistente (orden de empates, redondeo, la razón de un monitor de pasa o no pasa, dos ejemplos cuyos números no coincidían con la fórmula). Eso demuestra que la documentación es suficiente y que el código hace lo que dice. LO QUE NO SE COMPRUEBA, y por qué la fila sigue siendo MODELLED: la regla en sí (los pesos, la rampa, los bordes de banda, la retención de evidencia) es propia de este proyecto, preregistrada pero sin ninguna fuente externa, y nada aquí muestra que una puntuación de { "80" } o de { "40" } signifique lo que un navegante querría que significara ante interferencia real; no se da ninguna cifra de ese tipo. Los umbrales de los monitores son igualmente propios de este proyecto (la fila A solo comprueba su aritmética).

# text
seg-f52fceaf06ca = Ajuste a la norma del flujo de entrenamiento NMEA { "0183" } y valores decodificados

# text
seg-684f86418933 = Flujos NMEA { "0183" } sintéticos de puente para entrenamiento de tripulaciones (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW y el marcador PKSHT, generados a partir de una trayectoria de referencia con efectos modelados de receptor, cielo, jamming y spoofing. Solo salida de texto; no se transmite nada.

# text
seg-4591ed75149c = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: las { "225,227" } sentencias de ocho flujos de entrenamiento sintéticos (cuatro escenarios de biblioteca, semillas { "1" } y { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW y el marcador PKSHT) se analizan en pynmea2 { "1.19.0" }, un analizador NMEA independiente, con una suma de comprobación válida y el emisor y el tipo esperados. La posición, la velocidad sobre el fondo, el rumbo efectivo, el rumbo, la hora y la fecha UTC, el estado de la solución y el número de satélites de GGA que decodifica coinciden con la trayectoria de referencia del generador dentro de tolerancias fijadas antes de la primera comparación ({ "1.5e-6" } grados, { "0.06" } nudos, { "0.07" } km/h, { "0.11" } grados de rumbo efectivo, { "0.5" } grados de rumbo, { "0.02" } s), ejecutadas por scripts/gen_nmea_training_ref.py con el fixture en tests/fixtures/nmea_training_ref/. La expectativa del número de satélites de GGA se corrigió tras la primera ejecución a la convención NMEA ({ "00" } sin solución); las tolerancias numéricas no cambian respecto a la confirmación del preregistro. LO QUE NO: que algún receptor, trazador de cartas o sistema de puente acepte los flujos; el realismo de los modelos de receptor, cielo, jamming o spoofing (cielo nominal, ruido modelado, perfiles de arrastre y de reproducción, todos MODELLED); HDOP, altitud, y el contenido de DOP y de GSA/GSV más allá de la sintaxis y los recuentos; el registro del instructor. No se transmite nada, y no se afirma ningún rendimiento antiinterferencia ni antispoofing.

# text
seg-1be1cfcb95c8 = Mapa de interferencia: significados de los códigos de exactitud, valores de no disponible de AIS, asignación de celdas de la rejilla, longitud de ruta por estado de celda y enmascaramiento interior

# text
seg-71cff2a675e8 = La lectura de los códigos de exactitud e integridad de navegación de ADS-B que usa el mapa (la cota de EPU que representa un código NACp, la cota de radio de contención que representa un código NIC, y las clases baja y buena que el método deriva de ellas); los valores de no disponible de posición y velocidad de AIS que descarta el lector de AIS; la celda fija de la rejilla de latitud/longitud en la que cae una posición; la longitud de ruta, y su reparto por estado de celda (degradada, no degradada, sin evaluar, no observada), que informa la exposición de ruta; y si una posición está tierra adentro de un polígono de tierra por más de un margen. Una celda marcada como degradada o anómala es una afirmación sobre campos de exactitud notificados o posiciones inverosímiles, no un hallazgo de interferencia, y nada aquí lo comprueba.

# text
seg-beee15333c89 = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: cinco implementaciones independientes leen las mismas entradas sintéticas. ({ "1" }) pyModeS { "2.21" } decodifica tramas DF17 sintéticas de estado operativo y de posición en vuelo; las cotas de EPU de NACp de Kshana coinciden hasta { "0.5" } m (mayor diferencia { "0.4" } m), sus cotas de contención de NIC para los códigos { "5" } a { "11" } coinciden hasta { "1" } m, y sus clases baja y buena sitúan los { "12" } códigos NACp y cada código NIC que produce la referencia independiente ({ "0" } a { "11" }) del mismo lado de los umbrales que implican las cotas de la referencia independiente ({ "0" } discrepancias). ({ "2" }) pyais { "3.3.0" } decodifica sentencias AIVDM de tipo { "1" } cuyos bits de carga útil empaqueta el script a partir de los valores brutos de los campos de ITU-R M.1371; Kshana rechaza exactamente las posiciones no disponibles decodificadas (latitud { "91" }, longitud { "181" }) y la velocidad ({ "102.3" } nudos), y conserva de { "0" } a { "102.2" } nudos tal como se decodifican ({ "0" } discrepancias en { "94" } tramas). ({ "3" }) covers() de shapely { "2.2.0" } sobre polígonos de celda coincide con grid::Grid::cell_of en { "1770" } puntos con tamaños de celda de { "0.5" }, { "0.25" }, { "1" } y { "0.07" } grados, incluidos puntos cercanos al borde, ambos polos y el antimeridiano ({ "0" } discrepancias). ({ "4" }) la intersección ruta/celda de shapely { "2.2.0" } con longitudes geodésicas WGS84 de GeographicLib { "2.1" } coincide con la exposición de ruta en { "8" } rutas sintéticas, incluidas dos que cruzan el antimeridiano: longitud total hasta el { "0.6" } % (mayor diferencia { "0.49" } %, la esfera frente al elipsoide) y la longitud de cada estado de celda hasta el { "0.6" } % más { "125" } m por tramo (mayor { "21" } % de esa tolerancia). ({ "5" }) contains() de shapely { "2.2.0" } con la distancia acimutal equidistante de pyproj a la costa coincide con la máscara interior de { "2000" } m en { "992" } puntos del centro de la retícula alrededor de cuatro islas sintéticas, una con un lago ({ "0" } discrepancias; { "4" } puntos a menos de { "20" } m del margen se excluyeron y se contaron). Las tolerancias se fijaron en tests/fixtures/interference_map_ref/PREREGISTRATION.md antes de cualquier comparación y no se cambiaron después; allí se registran dos defectos de las entradas sintéticas que encontró la primera ejecución. LO QUE NO: Kshana no decodifica tramas Mode S brutas ni sentencias AIVDM, por lo que esto valida su lectura de valores ya decodificados, no un decodificador. Los radios de contención de NIC de la referencia independiente para los códigos { "1" }, { "2" } y { "4" } difieren de DO-260B ({ "20" }, { "8" } y { "2" } NM), por lo que solo los códigos { "5" } a { "11" } se comparan numéricamente. La regla de posición ({ "0" }, { "0" }), el suelo de altitud, el filtro de tipo de fuente, el hash de identificadores, los umbrales y estadísticos del método y la elección del tamaño de celda son propios de Kshana y no se comprueban frente a nada. La comparación de rutas usa la misma definición de trayectoria recta en latitud y longitud en ambos lados, por lo que comprueba longitudes y asignación de celdas, no que esa trayectoria sea la correcta para un buque o una aeronave. Nada aquí demuestra que una celda marcada sea interferencia. Las entradas son sintéticas; los fixtures de la referencia independiente los escribe scripts/gen_interference_map_ref.py (pyModeS es GPL-3.0 y se usa solo en ese script sin conexión; CI no necesita Python).

# text
seg-57ace69bdf1a = Formatos de transmisión de telemetría de confianza: exposición de texto de Prometheus y JSON OTLP/HTTP de OpenTelemetry

# text
seg-654126a9d073 = Confianza GNSS (puntuación, banda, motivos, puerta y, a petición, posición) como exposición de texto de Prometheus servida en /metrics y como métricas JSON OTLP/HTTP, con un tope a la cardinalidad de las etiquetas de motivo.

# text
seg-9cbde962155c = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: nuestra exposición de texto de Prometheus para un flujo sintético de 84 líneas (valores de etiqueta con comillas, barras invertidas, saltos de línea y texto no ASCII, { "64" } series de motivos más un pliegue 'other', indicadores de puerta y de posición) es aceptada por el analizador de texto de prometheus_client { "0.26.0" }, y las familias de métricas, los tipos, el texto de ayuda, los conjuntos de etiquetas y los valores que lee son exactamente iguales al estado del registro (valores por igualdad de f64). Nuestro JSON OTLP/HTTP para el mismo registro se analiza con json_format.Parse(ignore_unknown_fields=False) de protobuf { "7.36.2" } en ExportMetricsServiceRequest de opentelemetry-proto { "1.45.1" }, y cada nombre de métrica, descripción, unidad, tipo, monotonicidad, temporalidad de agregación, atributo, valor, hora de inicio y hora es exactamente igual al estado del registro. Se demostró que ambos analizadores rechazan un campo desconocido, un valor con tipo erróneo y una línea mal formada (scripts/gen_telemetry_formats_ref.py). Esquema { "1.3" } ({ "0.36" }), preregistrado (fb226057) antes de que ninguna herramienta lo leyera: para un flujo sintético de esquema 1.3 de 64 líneas (estados de geometría, DOP, etiquetas y pérdida de señal presentes, nulos, ausentes y desconocidos; clases de deducción; líneas no analizables) los mismos dos analizadores leen las series de geometría (Prometheus kshana_trust_geometry*, OTLP kshana.geometry.*) y la etiqueta de clase de kshana_trust_reason_active exactamente como implica el registro ({ "24" } familias y { "54" } muestras; { "12" } métricas y { "31" } puntos), promtool { "3.5.0" } check metrics termina con { "0" } sin problemas de lint, y el OpenTelemetry Collector contrib { "0.135.0" } acepta el JSON OTLP/HTTP (estado { "200" }, nada rechazado) y su exportador de archivos registra la petición sin cambios (xval/telemetry-1.3, condicionado a datos: los tarballs de versión se obtienen con SHA-256 fijado y se confirman sus salidas). LO QUE NO: el punto de conexión HTTP, la entrega, los tiempos de espera y la reconexión no se comprueban con una referencia independiente, ni tampoco el receptor de prometheus del Collector; el registro se lee mediante accesores, por lo que un fallo en el propio estado del registro no se detectaría; la comprobación OTLP de 'la salida confirmada está al día' solo se ejecuta con la característica otlp; no se validan los nombres de las métricas ni su utilidad para un centro de operaciones; CEF y LEEF no están cubiertos (véase la fila siguiente).

# text
seg-b037c999443b = Eventos SIEM de telemetría de confianza: Common Event Format (CEF) sobre syslog

# text
seg-ffd8d7062055 = Eventos de cambio de banda (o por época) como cargas útiles de Common Event Format en un envoltorio RFC { "5424" } sobre UDP o TCP, con una asignación de campos documentada y escape de CEF.

# text
seg-59fd23d6607e = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: frente a dos analizadores independientes de código abierto (referencias independientes: pycef { "1.11" } (PyPI, MIT); el códec CEF de Logstash (logstash-codec-cef { "6.2.7" } en Logstash { "8.15.3" })), sobre un corpus de líneas CEF que escribió este crate ({ "157" } antes de la enmienda { "4" } siguiente, { "170" } después de ella, { "176" } después de la enmienda { "5" }): cada cambio de banda y cada época de un flujo sintético de confianza confirmado de 84 líneas, más texto adversarial en anfitriones, motivos, etiquetas de tiempo y nombres de puerta que contiene signos igual, barras invertidas, barra invertida-igual, barras verticales, saltos de línea, retornos de carro, tabuladores, series de espacios, caracteres multibyte y astrales y falsos parecidos de claves, puntuaciones y desplazamientos extremos, y cada banda con y sin banda previa. pycef analiza las líneas cuya cabecera no necesita escape ({ "153" } antes de la enmienda { "4" }, { "166" } después de ella, { "172" } después de la enmienda { "5" }) y recupera, de forma exacta, los campos de cabecera, la gravedad, el conjunto exacto de claves de extensión y cada valor (números por igualdad de f64), tras las reglas de desescape de la especificación CEF, que pycef no aplica y que aplica scripts/gen_cef_ref.py. El códec de Logstash, que desescapa por sí mismo, analiza cada línea ({ "157" }, luego { "170" }, luego { "176" }), alcanza el mismo umbral, y además recupera cuatro campos de cabecera que necesitan escape (una barra vertical, una barra invertida y un signo igual en la cadena de versión), que el patrón de cabecera de pycef no puede leer, de modo que el escape de la cabecera descansa solo en el códec de Logstash. El umbral de comparación se registró en las confirmaciones { "5172e579" } (pycef) y 0a7598aa (Logstash) antes de ejecutar ninguno de los dos analizadores, y ambos lo alcanzaron en la primera comparación. Se divulgan cinco enmiendas. Las enmiendas ({ "1" }) a ({ "3" }) no tocaron ninguna regla de comparación ni ningún valor esperado: ({ "1" }) se corrigió una aserción del tamaño del corpus de { "5" } a { "4" } cambios de banda, un error de recuento, ya que el flujo tiene { "4" }; ({ "2" }) se corrigió el cableado del delimitador de la canalización del ejecutor de Logstash tras un primer intento que no produjo eventos; ({ "3" }) la puntuación de confianza y el desplazamiento de época se movieron de los campos enteros CEF cn1 y cn2 a los campos de coma flotante cfp1 y cfp2, un cambio de formato de transmisión hecho en esta versión, tras lo cual se regeneró el corpus y se volvieron a ejecutar ambas referencias independientes con el umbral sin cambios y lo alcanzaron de nuevo. La enmienda ({ "4" }), { "0.36" }, amplió el corpus y el conjunto de claves esperado, registrada en d6331429 antes de que ninguno de los dos analizadores se ejecutara con las líneas nuevas: las entradas del esquema { "1.3" } añaden la geometría de satélites en los campos personalizados cs6 (etiqueta geometry: estado, luego ';' y las clases de deducción), cfp3 (geometryHdop) y cfp4 (geometryPdop); { "13" } casos de geometría (el corpus hasta { "170" } líneas) y las tres claves nuevas; ambos alcanzaron el umbral, sin otros cambios, en la primera comparación (pycef { "166" } de { "170" } líneas analizadas, los { "4" } casos de cabecera de nivel { "2" } como antes; Logstash { "170" } de { "170" }). La enmienda ({ "5" }), { "0.36" }, añadió { "6" } casos de etiqueta de geometría (el corpus hasta { "176" } líneas), registrada en 9a8e4fa9 antes de que ninguno de los dos analizadores se ejecutara con ellos: a partir de entradas que llevan la etiqueta de geometría, cs6 gana un tercer campo (';' y la etiqueta) y cn1 (geometryUsedSatellites) los satélites usados; primero se leyó la tabla de asignación del códec de Logstash (sin campos flexString, de ahí cs6 en lugar de flexString1); ambos alcanzaron el umbral en la primera comparación (pycef { "172" } de { "176" }, Logstash { "176" } de { "176" }), y cada entrada de referencia anterior se reprodujo sin cambios. LO QUE NO: ningún analizador comprueba el tipo de los valores cfp (ambos los conservan como texto), por lo que el uso de los campos de coma flotante descansa en el diccionario CEF y no en una referencia independiente; no se ejecutó ningún SIEM de proveedor; los nombres de las claves de extensión y su asignación son una elección de este crate, y los analizadores solo muestran que se leen de vuelta tal como se escribieron; el envoltorio RFC { "5424" }, la entrega, los tiempos de espera y la reconexión no están cubiertos; pycef es un analizador pequeño cuya última versión es de { "2020" }, y el códec de Logstash es la referencia independiente más sustancial.

# text
seg-51640405c9b7 = Eventos SIEM de telemetría de confianza: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de cambio de banda (o por época) como cargas útiles de Log Event Extended Format { "2.0" } en un envoltorio RFC { "5424" } sobre UDP o TCP, con una asignación de campos documentada.

# text
seg-563ccb0adbe5 = LO QUE SE COMPRUEBA: las propias pruebas de cadena exacta de este crate de la asignación de campos de LEEF documentada y los campos del envoltorio RFC { "5424" }; no existe ningún analizador LEEF de código abierto mantenido (una búsqueda en el índice de paquetes de Python no encontró ninguno), por lo que el formato se comprueba frente a su propia especificación leída por el mismo autor, no frente a una referencia independiente externa. LO QUE NO: si los analizadores o SIEM de algún proveedor aceptan las cargas útiles LEEF; las reglas de escape más allá de las documentadas; el comportamiento de un colector syslog real.

# text
seg-96a95b89faa5 = Integridad del paquete de evidencias: firma, cadena de hashes y procedimiento de verificación

# text
seg-943a853d8a4a = Un paquete de evidencias firmado y encadenado por hashes de un evento de confianza GNSS: SHA-256 sobre cada archivo y una cadena sobre el manifiesto, una firma Ed25519 sobre los bytes exactos del manifiesto, y un verificador que nombra cada fallo (un archivo cambiado, eliminado, renombrado, intercambiado o añadido, un manifiesto reordenado o editado, un manifiesto con hash recalculado sin la clave, un paquete refirmado, una clave fijada incorrecta, y un token de sello de tiempo que se ha retirado, sustituido, es basura o corresponde a otro documento).

# text
# c1: kshana evidence verify --tsa-ca
seg-0699ef2074fd = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: ({ "1" }) las funciones Ed25519 que usa el paquete para firmar y verificar de forma estricta (evidence::bundle::sign_detached, evidence::verify::verify_detached) reproducen byte a byte las claves públicas y las firmas de los vectores de prueba { "1" }, { "2" }, { "3" } y { "1024" } de la sección { "7.1" } de RFC { "8032" }, los aceptan, y rechazan cada bit invertido del vector { "1" } y cada séptimo bit de los demás y una firma S+L no canónica; los vectores se analizan a partir del texto del RFC y se reproducen con dos implementaciones independientes (cryptography/OpenSSL y PyNaCl/libsodium) en scripts/gen_ed25519_rfc8032_ref.py. ({ "2" }) evidence::bundle::sha256_hex, el hash que hay detrás de cada hash del paquete y de la cadena, reproduce exactamente los ejemplos SHA-256 de FIPS 180-4 (abc; el mensaje de 448 bits; un millón de a), el mensaje vacío y los resúmenes de hashlib de una escalera de { "0" } a { "130" } bytes a través de los límites de relleno. ({ "3" }) Un verificador escrito en Python solo a partir de docs/EVIDENCE-PACKS.md (scripts/evidence_verify_cleanroom.py: hashlib y cryptography; su autor no leyó código Rust) coincide exactamente con el verificador de Rust en { "71" } paquetes sintéticos íntegros y manipulados, en el veredicto, el conjunto de fallos con nombres de archivo, el veredicto de la firma y la cabeza de cadena recalculada a partir de los archivos y la que registra el manifiesto. La primera ejecución coincidió en { "64" } de { "71" }; las discrepancias fueron una ambigüedad de la especificación (comprobar una clave fijada frente a un manifiesto ilegible), una desviación de interfaz de la referencia independiente y un caso construido de forma incompleta; se aclaró la frase de la especificación, se reimplementó la referencia independiente a partir del texto y se completó el caso, sin cambiar ninguna tolerancia ni expectativa (registrado en la confirmación d54e14c6). LO QUE NO: el verificador de sala limpia es una implementación independiente de un autor distinto, no una autoridad de terceros, y comparte las elecciones de la especificación, por lo que corrobora esta implementación de las reglas, no las reglas; los vectores validan las primitivas, no el diseño del formato del paquete. En esta fila el token de RFC { "3161" } se lee solo por su huella de mensaje y los tokens de prueba son sintéticos y no están firmados; la firma y la cadena de la autoridad se verifican, de forma opcional (<c1/>), en la fila aparte 'RFC { "3161" } timestamp-token signature and chain verification'. Los casos de manipulación son sintéticos. Nada de esto es una opinión jurídica sobre ningún paquete ni una atestación de ninguno.

# text
seg-c15736afcbc9 = Verificación de la firma y de la cadena del token de sello de tiempo de RFC { "3161" }

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token, y la opción <c1/> para el timestamp.tsr de un paquete: una TimeStampResp de RFC { "3161" } o un TimeStampToken desnudo (CMS SignedData sobre una TSTInfo) comprobado sin conexión frente a anclas de confianza como lo comprueba <c2/>: el tipo de contenido de los atributos firmados y el resumen del mensaje sobre la TSTInfo; la firma sobre los atributos firmados (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 y P-384; operaciones públicas RSA sobre crypto-bigint); el hash ESS signing-certificate v1 (SHA-1) o v2 que nombra el certificado del firmante, encontrado entre los certificados no fiables del token y de quien llama; el uso extendido de clave timeStamping crítico y único del firmante; la cadena hasta un ancla de confianza autoemitida con la firma de cada certificado, su condición de CA y su uso de clave, y cada certificado válido en el genTime del token; y la huella del mensaje frente a los datos. No se comprueba: la revocación (CRL, OCSP), las restricciones de nombre y de política, el nonce

# text
# c1: openssl ts -verify -attime genTime
# c2: openssl cms -verify -cades -purpose timestampsign
seg-d305c442506d = OpenSSL { "3.0.13" } (<c1/>, y <c2/> más la huella de TSTInfo para tokens RSA-PSS), ejecutado por tests/fixtures/evidence_tsa/run_openssl.sh sobre los { "27" } casos de cases.tsv: RSA PKCS#1 v1.5 con SHA-256 y SHA-512 y ESS v1 y v2, una raíz ECDSA P-384 sobre un intermedio P-256 y TSA P-256 y P-384, RSA-PSS, un token sin el certificado del firmante con y sin él suministrado, tokens firmados con CAdES, un byte de firma invertido (tres algoritmos), una TSTInfo cambiada (dos), una firma intermedia invertida, un certificado gemelo ESS, anclas incorrectas (cuatro), un certificado de TSA caducado, un uso extendido de clave no crítico y uno incorrecto, y datos incorrectos (tres). Preregistrado en tests/fixtures/evidence_tsa/PREREGISTRATION.md (confirmado solo, 30ad70b2, antes de que existiera el verificador; los veredictos de OpenSSL se volvieron a ejecutar después, idénticos byte a byte). Primera ejecución: los { "27" } veredictos coinciden (B1) y cada genTime coincide al segundo (B2). Alcance, expresado de forma estricta: certificados y tokens de prueba autogenerados, hechos por el mismo OpenSSL que los juzga; OpenSSL es una implementación independiente, no una autoridad de sellado de tiempo; no se incorpora el token de ninguna autoridad pública (freetsa.org no indica ninguna licencia). Nada aquí da fe de ningún sello de tiempo real

# text
seg-c04042b0270a = Umbrales de interferencia de confianza del receptor calibrados con el conjunto de datos JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: la calibración preregistrada de los monitores de caída de C/N0, AGC e indicador de jamming sobre el conjunto de datos público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtenido en tiempo de ejecución, nunca incorporado): por carpeta una cronología de { "1" } s a partir de mon_rf.csv y rinex.csv, los monitores se ejecutan una vez, cada época posterior a la calibración se etiqueta como limpia o con jamming a partir del attack_log de la carpeta (desplazado de CEST a UTC, guarda de { "60" } s), cada umbral se barre sobre una rejilla fija, se selecciona el menor umbral con una probabilidad de falsa alarma limpia agrupada de como máximo { "0.01" }, y recuentos reservados dejando fuera una carpeta cada vez; una comprobación cruzada del lector UBX. La selección se distribuye solo como el perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); la regla por defecto y cada salida sin él permanecen sin cambios

# text
seg-3ccd1b09ad09 = Los registros de eventos publicados del conjunto de datos (ventanas de attack_log), como verdad de eventos, bajo el preregistro xval/jammertest-trust/PREREGISTRATION.md (confirmado solo, 0fa012b, antes de que se ejecutara el arnés). Primera y única ejecución (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } carpetas evaluables ({ "7" } con jamming), { "3,502" } épocas limpias y { "9,560" } con jamming. Probabilidad de falsa alarma limpia reservada: cn0_drop_db { "0.0231" } (81/3502) frente a un umbral de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, pasa; jam_ind_threshold { "0.0094" }, pasa; unión de los tres: falsas alarmas { "0.0328" }, detección { "0.807" } frente a { "0.05" } y { "0.50" }, pasa. Según la regla registrada, la fila es MODELLED (un umbral falló). Acotado: un tipo de receptor (u-blox ZED-F9P), un evento, franjas programadas de un minuto como verdad (la detección es una cota inferior; limpio significa fuera de las ventanas registradas); calibrado con los registros CSV, y el lector UBX da más falsas alarmas en dos carpetas. Las bandas de la puntuación de confianza marítima no están calibradas

# text
seg-65a8361b4a22 = Puntuación de Jammertest: un registro de receptor puntuado por cada ensayo programado (latencia de detección, alarmas omitidas, falsas alarmas, tiempo de recuperación) frente al plan de ensayos publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): el catálogo de ensayos y el plan de transmisión de la NPRA (MIT, obtenidos con un SHA-256 fijado, nunca incorporados al repositorio) leídos como verdad programada, con los identificadores del catálogo conservados; una ejecución de receiver-trust puntuada por ensayo (primera alarma menos inicio planificado, detectado/tardío/omitido según una tolerancia, tiempo hasta el primer tramo sin alarmas, alarmas fuera de cualquier franja y de su margen de guarda), con un paquete de evidencias firmado que contiene la tarjeta de puntuación. El calendario son franjas planificadas, no horas de emisión registradas

# text
seg-49b912adb7a9 = El número de franjas del plan por área de ensayo ({ "76" }, { "77" } y { "45" } franjas, de las cuales transmiten { "61" }, { "63" } y { "32" }) se contó de forma independiente con un script sobre el mismo JSON; las ventanas de attack_log del conjunto de datos de { "2024" } como verdad de los eventos, según xval/jammertest-score/PREREGISTRATION.md (confirmado por separado, c2e6d3b, antes de que se ejecutara el puntuador). Primera y única ejecución (xval/jammertest-score/RESULTS.md): la regla registrada de datos mínimos resultó fallida ({ "4" } ventanas de jamming puntuables procedentes de { "4" } de { "12" } carpetas UBX, frente a un mínimo de { "10" } ventanas de { "2" } carpetas: { "5" } carpetas descartadas por la regla de línea base, { "3" } registros UBX contienen solo la hora GPS de la semana), por lo que los umbrales B1 a B4 no son evaluables; no se relajó nada ni se repitió la ejecución. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, confirmado por separado, solo tratamiento de datos: registros con solo hora GPS ubicados a partir de la fecha, las { "12" } carpetas solo CSV, una sesión de plataforma móvil para rovers en movimiento; los mismos umbrales y la misma regla de datos mínimos): se conservaron { "14" } de { "24" } carpetas pero solo { "7" } ventanas de jamming puntuables, la regla de datos mínimos volvió a fallar y ningún umbral es evaluable (RESULTS-v2.md). Verdad programada: una franja planificada no es un registro de emisión real, una omisión puede ser un ensayo que nunca se ejecutó, la latencia se mide desde el inicio planificado y limpio significa fuera de las franjas planificadas. La detección mediante monitores del dominio de la medida no dice nada sobre un spoofer de baja potencia. Un solo tipo de receptor (u-blox ZED-F9P). El conjunto de datos NMEA de SimulaMet de { "2025" } no se utiliza (sin licencia indicada, acceso con suscripción)

# text
seg-0d227bbcb5f1 = Exportación para test bench (kshana bench-export): columnas ligadas a la Tierra, geodésicas y de velocidad local, columnas de actitud y salida NMEA { "0183" }

# text
seg-c6a6e08afadd = Las columnas CSV de movimiento de posición ligada a la Tierra, posición geodésica, velocidad ligada a la Tierra, rumbo/cabeceo/alabeo y UTC, y las sentencias NMEA GGA/RMC, escritas a partir de escenarios sintéticos (gnss-ins, incluido automotive-urban-canyon, jamming, gnss-sim). Solo movimiento y eventos; no se escribe ninguna señal ni se afirma el rendimiento de ningún simulador ni receptor.

# text
seg-f953ad11fe08 = LO QUE SE COMPRUEBA EXTERNAMENTE, expresado de forma estricta: frente a pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } y scipy { "1.18.1" }, ejecutados por scripts/gen_testbench_ref.py sobre { "4" } escenarios sintéticos, con tolerancias fijadas antes de la primera comparación (cada una, el peor caso de redondeo del escritor): las columnas ligadas a la Tierra equivalen a la conversión WGS { "84" } de las columnas geodésicas (peor caso { "1.3e-4" } m, umbral { "3e-4" }) y a la inversa ({ "1.3e-9" } deg, umbral { "2e-9" }; altura { "1.3e-4" } m, umbral { "3e-4" }) en todas las filas; la velocidad ligada a la Tierra rotada a norte-este-abajo mediante la operación topocéntrica de PROJ equivale a la velocidad NED verdadera del motor ({ "7.5e-5" } m/s, umbral { "2e-4" }); el rumbo, el cabeceo y el alabeo equivalen al guiñada-cabeceo-alabeo de scipy del cuaternión verdadero del motor ({ "5.0e-7" } deg, umbral { "1e-6" }); cada sentencia NMEA se analiza en pynmea2 con una suma de verificación válida y su posición decodificada ({ "1.2e-3" } m, umbral { "5e-3" }), altura, velocidad, rumbo efectivo ({ "5.0e-4" } deg, umbral { "1e-3" }) y hora coinciden con los valores de movimiento; la columna UTC coincide con una aritmética independiente de fecha y hora. Se fija el SHA-256 de los bytes exactos de CSV y NMEA comprobados. LO QUE NO SE COMPRUEBA: la propia trayectoria verdadera del escenario (el perfil de conducción y su integración); las convenciones (el rumbo es la guiñada del cuerpo, no el rumbo efectivo, y difiere de él hasta unos { "77" } grados en automotive-urban-canyon; la calidad GGA, el número de satélites y el HDOP son valores provisionales); si algún simulador de laboratorio lee los archivos como se pretende; el rendimiento de cualquier simulador o receptor. Las referencias independientes comprueban conversiones y codificaciones, no la física del escenario. El tratamiento del marco local se comprueba solo mediante la rotación de la velocidad y la velocidad y el rumbo efectivo NMEA (el CSV no tiene columna de posición local).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): una correspondencia entre las salidas de Kshana y las cláusulas de marcos públicos, solo por número, rellenada a partir de las ejecuciones proporcionadas; un resultado cuenta para una capacidad solo cuando incluye la evidencia que nombra la correspondencia, un conjunto vacío no evidencia nada y la formulación es "aporta evidencias a favor de"; el informe no constata que se alcance ningún marco ni es una calificación ni una aprobación por parte de nadie.

# text
seg-8659260fd38e = Referencias comprobadas frente a un índice de encabezados, extraído con un script, de los documentos públicos citados, leídos el 2026-10-10 (tests/compliance_references.rs). LO QUE SE COMPRUEBA: { "49" } referencias citadas a cláusulas, secciones, párrafos o encabezados existen en el documento citado y { "7" } URL citadas se resolvieron en la fecha registrada ({ "2" } por una segunda vía); los controles negativos fallan. LO QUE NO SE COMPRUEBA: que cualquier paráfrasis, correspondencia o laguna sea correcta; las cláusulas de EN { "16803" } (de pago, solo el texto del catálogo); revisiones posteriores; el índice no es una implementación independiente.

# text
seg-98c360d82d56 = Integraciones marinas: plugin de Signal K, flujo de la puerta y panel de puntuación de OpenCPN, build de referencia

# text
seg-7af9ce566646 = La puntuación de confianza, la banda, los motivos, el estado de la puerta y la posición comunicada por el receptor publicados en navigation.gnss.kshana en un servidor Signal K con una notificación de aviso, alarma y normal (integrations/signalk); el flujo NMEA filtrado por la puerta, con la solución marcada como no válida mientras la confianza esté colapsada y una sentencia PKSHT por ciclo, servido a OpenCPN por TCP por la propia puerta o por un pequeño relé, y un panel de puntuación nativo de OpenCPN que lee la sentencia PKSHT (integrations/opencpn); y unidades de systemd y un contenedor que ejecutan la puerta (deploy/reference-build). Cuando muestran resultados, llevan la declaración consultiva: Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
seg-00a0f52f7458 = LO QUE SE COMPRUEBA, expresado de forma estricta: que estas integraciones funcionan con el software real para el que están escritas. LA EVIDENCIA está confirmada en integrations/signalk/evidence/README.md (con sus archivos JSON) y en integrations/opencpn/evidence/README.md (con sus capturas de pantalla y registros), cada una con el script que la reproduce. ({ "1" }) Signal K: el plugin cargado en el paquete npm signalk-server { "2.33.0" } fijado, en un espacio de nombres de red privado solo de loopback, alimentado con datos sintéticos. Las propias interfaces REST y WebSocket del servidor mostraron las rutas publicadas, los metadatos de la puntuación y una notificación que pasó por ausente, aviso, alarma, normal (tras el tiempo de retención) y de nuevo aviso cuando los datos se interrumpieron. Con el kshana real ejecutado por el plugin sobre el NMEA que el propio servidor recibió, la notificación pasó a aviso y luego a alarma y se publicó la posición comunicada; el navigation.position del propio servidor lo escribió su proveedor NMEA, nunca el plugin. Se repitió con el esquema JSON en vivo { "1.2" }. ({ "2" }) OpenCPN: el plugin compilado con la cabecera de la API de plugins de OpenCPN y wxWidgets { "3.2.4" }, cargado en el paquete de Ubuntu { "24.04" } de OpenCPN { "5.8.4" } bajo una pantalla virtual; OpenCPN lo cargó, ejecutó su inicialización y le entregó las sentencias PKSHT del flujo filtrado por la puerta, y el panel se puso en rojo en la banda no fiable. En una ejecución limpia, la propia posición del buque en OpenCPN dejó de actualizarse y su indicador de solución cayó cuando la puerta marcó la solución como no válida. Una segunda ejecución alimentada directamente por el receptor TCP de la puerta mostró la entrega al plugin, pero no un antes y un después nítidos. ({ "3" }) Las pruebas del relé reproducen un extracto grabado del flujo filtrado por la puerta a través de un socket TCP real y comprueban lo que recibe un consumidor (los bytes sin cambios, sumas de verificación válidas en cada sentencia, incluidas las reescritas, GGA y RMC coincidentes, un PKSHT por ciclo con el campo de la puerta donde la solución no es válida), y el script de extremo a extremo comprueba que un consumidor del receptor de la puerta recibe exactamente los bytes que la misma puerta escribe en la salida estándar. ({ "4" }) Los analizadores de PKSHT (JavaScript y C++) se ejecutan sobre sentencias grabadas de la salida de kshana y rechazan una suma de verificación o una versión incorrectas, o una puntuación fuera de { "0" } a { "100" }. ({ "5" }) Las unidades de systemd se comprueban con systemd-analyze verify (systemd { "255" }, binarios sustituidos por stubs) y con controles de un shell en ExecStart, la política de reinicio y las claves del sandbox; el tratamiento de argumentos del entrypoint del contenedor se comprueba con un binario stub. LO QUE NO SE COMPRUEBA: no hay ninguna referencia independiente externa para ningún valor que muestran estas integraciones. Los propios valores de confianza son las filas anteriores, y una ejecución de integración solo muestra que la infraestructura los transporta; por eso esta fila es MODELLED y no VALIDATED (docs/VALIDATION.md). No se utilizó ningún buque real, receptor, ejecución larga, otra versión de cualquiera de los dos anfitriones, otro sistema operativo ni escritorio; todos los datos son texto sintético y nada de esto es una medición. No se ejercitaron el tratamiento sonoro y visual de la notificación por un cliente Signal K real, el botón de la barra de herramientas de OpenCPN, las preferencias y el estado obsoleto, ni el empaquetado para el gestor de plugins de OpenCPN. Las claves del sandbox de systemd se comprobaron solo en cuanto a sintaxis, no se ejecutaron bajo un systemd en vivo, y la construcción de la imagen del contenedor y su comprobación de estado no tienen aquí evidencia confirmada. No se afirma ninguna cifra de detección ni de falsas alarmas. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
seg-89ab9ef155eb = Seguimiento de BOC({ "1,1" }): escalado del DLL y resolución de ambigüedad por salto de pico (opcional)

# text
seg-ef24be9b5917 = El campo boc de iq::track::LoopConfig (opcional, None por defecto): los tres discriminadores del DLL reescalados para leer el error de código en chips con pendiente unitaria sobre el pico principal del BOC({ "1,1" }) senoidal, y un monitor de salto de pico sobre correladores muy adelantado y muy retrasado a medio periodo de subportadora ({ "0.5" } chip) que salta el NCO de código hacia el pico principal cuando un contador ascendente/descendente alcanza N ({ "8" } por defecto). Sin la opción, todas las salidas permanecen sin cambios.

# text
seg-416ce4dfc6f5 = Coherencia interna frente a una verdad inyectada y formas cerradas, con umbrales preregistrados en 6b68f6cc (docs/design/evidence/boc-bump-jump/). Una señal de datos BeiDou B1C (PRN { "19" }, { "5" } MS/s) generada por iq::scene: con la opción desactivada, un inicio en un pico lateral permanece enganchado en falso en el ±({ "0.5" } + d/4) chip previsto (medido ±{ "0.549" }); con ella activada, un salto hacia el pico principal a los { "0.08" } s y un RMS en la ventana tardía de { "0.0008" } chip a { "45" } dB-Hz y { "0.0048" } chip a { "35" } dB-Hz; ningún salto desde el pico principal a { "35" }, { "40" } y { "45" } dB-Hz durante { "4" } s; la pendiente del EMLP escalada de { "0.94" } a { "0.99" } sobre la señal muestreada (sin escalar, de { "3.6" } a { "3.8" }). El detector de salto de pico por sí solo, sobre tríos de correladores con la covarianza de ruido exacta de BOC({ "1,1" }), no produjo ningún salto falso en { "100 000" } actualizaciones a { "25" } hasta { "45" } dB-Hz y detectó { "1000" } de { "1000" } inicios en picos laterales a { "35" } dB-Hz. NOT MET (hallazgo F1): la cuadrícula de pruebas unitarias preregistrada para el escalado incluye desfases fuera del rango lineal de los discriminadores, donde las lecturas escaladas no alcanzan el desfase hasta en un { "48" } %. LO QUE NO SE COMPRUEBA: IQ de campo, front ends de banda limitada, réplicas compuestas MBOC/QMBOC y cualquier receptor externo.

# text
seg-2c32955cbfb3 = Canal de centelleo ionosférico IQ (modelo de Cornell) frente al centelleo medido de GPS L1 a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, el modelo de centelleo de Cornell (intensidad de Rice, espectro de Butterworth de segundo orden, fase arg z) accionado con el S4 y el tiempo de decorrelación de la intensidad de una ventana medida, comparado en lo que genera más allá de esas dos entradas; realdata::scint50 lee el registro medido, le quita la tendencia y ejecuta la comparación.

# text
seg-bdc9fe963c5c = Datos medidos con umbrales preregistrados en b6ccb499 (xval/scint-malindi/): registro de Zenodo { "16941224" } (INGV, Malindi, { "18" } de marzo de { "2023" }, GPS PRN { "26" }, intensidad y fase de portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 comprobado). { "22" } ventanas de { "60" } s admisibles (N1 alcanzado). MET: la distribución de la intensidad (Kolmogorov-Smirnov D { "0.0415" }, umbral { "0.05" }) y el centelleo de fase ligado a S4 (sigma-phi medido/modelo mediano { "0.779" }, umbral 2/3 a 3/2). NOT MET (hallazgo F1): la fracción de desvanecimientos profundos del modelo es { "2.38" } veces la medida (umbral { "0.5" } a { "2" }) y su desvanecimiento medio dura { "3.51" } veces más (umbral 2/3 a 3/2). Hallazgo F2: el procesamiento registrado lee la fase envuelta del modelo, lo cual puso de manifiesto una autocomprobación; B3 repetido a posteriori con la fase desenvuelta da { "0.804" }. LO QUE NO SE COMPRUEBA: otras noches, estaciones, latitudes o señales; el ruido del receptor en el modelo. La fila sigue siendo MODELLED.

# text
seg-160507ac3702 = Opción CFAR de promediado de celdas en la adquisición IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar y ca_cfar_cells (opcional): una celda de una cuadrícula de adquisición se compara con la media de celdas de referencia de su fila Doppler (retardos de guarda y de paso, con ajuste cíclico alrededor del periodo), con un factor alfa fijado a partir de la probabilidad de falsa alarma de forma cerrada del CA-CFAR para M bloques no coherentes (ca_cfar_pfa, ca_cfar_alpha). El detector de potencia de muestra sigue siendo el predeterminado y todas las salidas existentes permanecen sin cambios.

# text
seg-ba35daac2aed = Forma cerrada, con umbrales preregistrados en 3724aefa (docs/design/evidence/acq-cfar/). La probabilidad de falsa alarma del CA-CFAR para celdas Gamma(M), frente a Monte Carlo del modelo exacto: { "18" } de { "18" } casos dentro de { "3" } sigma binomiales. En cada celda de las búsquedas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } celdas cada una) con un diseño del { "1" } %: { "0.977" } % y { "0.969" } % con ruido gaussiano y { "1.006" } % y { "0.999" } % con ruido cuantificado a 2 bits (M = { "1" } y { "4" }; umbral de más o menos { "20" } %); decisiones sin cambios al escalar la entrada. NOT MET (hallazgo F1): en una señal de 2 bits sin ruido, la detección y su celda son correctas, pero el { "1.28" } % de las celdas fuera del pico de la fila del pico (umbral { "1" } %) superan el umbral de decisión, en los lóbulos laterales de correlación deterministas del código. LO QUE NO SE COMPRUEBA: otras variantes de CFAR, ventanas bidimensionales, front ends de banda limitada, datos de campo.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou y Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resuelve, solo por nombre (MORE_BAND_NAMES), GLONASS L1OF y L2OF en cada canal FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a y B3I (BPSK({ "10" })) y Galileo E6 (BPSK({ "5" })), con las portadoras y las potencias mínimas recibidas de sus documentos de control de interfaz; el conjunto de bandas predeterminado y todas las salidas existentes permanecen sin cambios.

# text
seg-6d674bc4b40a = Documentos de control de interfaz publicados y formas cerradas, con umbrales preregistrados en 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edición { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } y B3I { "1.0" }, Galileo OS SIS ICD Edición { "2.1" }. MET: cada portadora, velocidad de chip y potencia recibida tal como se transcribe ({ "28" } canales GLONASS), los primeros nulos de BPSK en la velocidad de chip, el B1C compuesto igual a MBOC(6,1,1/11) como indica la tabla de potencias de su ICD, la identidad de la ruta C/N0 y escenarios de espectro idénticos byte a byte. NOT MET: el umbral de área unitaria, que era inalcanzable tal como estaba escrito (hallazgo F1; las áreas equivalen a la fracción en banda de forma cerrada), y la coincidencia por bin de las formas de onda B1I y B1C de la capa IQ con la envolvente del modelo ({ "1.26" } y { "1.56" } dB frente a { "0.5" } dB, hallazgo F2; GLONASS { "0.07" } dB), porque los códigos Gold y Weil tienen espectros de líneas irregulares; promediados por banda, los lóbulos principales coinciden con una diferencia de { "0.25" } dB como máximo. LO QUE NO SE COMPRUEBA: IQ grabado, otras señales, interferencia dentro del sistema.

# text
seg-63b7da996265 = Códigos de distancia primarios BeiDou B1I frente a un generador independiente

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits y b1i: los códigos Gold de BDS-SIS-ICD-B1I-3.0 truncados a { "2046" } chips, PRN { "1" } a { "63" }, tal como la capa IQ los genera, adquiere y rastrea.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (etiqueta { "v0.0.19" }, commit 1ddd4562), una implementación de código abierto independiente del mismo ICD: su beidou_b1i_code_gen_int, compilado de forma autónoma, generó los { "63" } códigos. Solo se confirma su salida de programa: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, un prefijo de 64 chips y el SHA-256 de cada código de 2046 chips. Esa salida son los códigos PRN BeiDou B1I que define el BDS-SIS-ICD-B1I-3.0 público; en el repositorio no hay ningún código fuente ni binario de GNSS-SDR. Umbral preregistrado en 911106d1 (xval/beidou-b1i-gnss-sdr/): los { "2046" } chips de los { "63" } PRN idénticos, sin inversión, desplazamiento ni reetiquetado. Resultado: { "63" } de { "63" } idénticos; el fixture se regeneró a partir de una copia nueva de { "v0.0.19" } (SHA-256 del archivo fuente tal como se registró) y es idéntico byte a byte. LO QUE NO SE COMPRUEBA: el código secundario NH20, la lista de PRN GEO, la portadora y la velocidad de chip.

# text
seg-b4787b04338e = Códigos de distancia y de superposición GPS L1C frente a las columnas de comprobación impresas de IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits y l1c_o_bits: los códigos de distancia Weil L1CP y L1CD (secuencia de Legendre calculada, índice de Weil, secuencia de expansión insertada antes del chip p) y los códigos de superposición L1CO S1, PRN { "1" } a { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, declaración de distribución A), las columnas de comprobación que imprime junto a los parámetros del generador: Tabla 3.2-2 los { "24" } chips iniciales y finales de cada código L1CP y L1CD, Tabla 3.2-3 los { "11" } bits iniciales y finales de cada código L1CO, Tabla 6.2-1 la secuencia de Legendre de longitud 10223; transcritas por scripts/extract_is_gps_800_tables.py a partir del PDF (SHA-256 c4aad710...). Umbrales preregistrados en fe372e26 (docs/design/evidence/l1c-codes/): { "252" } de { "252" } columnas, { "63" } de { "63" } superposiciones y { "10 223" } de { "10 223" } bits de Legendre idénticos; la extracción --check pasa; un control negativo falla con códigos reetiquetados, invertidos y desplazados. LO QUE NO SE COMPRUEBA: los propios parámetros del generador (proceden de las mismas tablas), los chips entre las columnas impresas, el patrón de subportadora TMBOC y los códigos L1CO S2.

# text
seg-5cba09089e09 = Códigos primarios LunaNet AFS-I y AFS-Q frente a las columnas de comprobación impresas de LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits y afs_q_primary_bits (nombres de señal lunanet-afs-i y lunanet-afs-q en kshana iq): el código Gold AFS-I ({ "2047" } acortado cíclicamente a { "2046" }, G2 retardado por PRN) y el código primario Weil AFS-Q (secuencia de Legendre calculada, índice de Weil, secuencia de expansión insertada antes del chip p), PRN { "1" } a { "210" }.

# text
seg-330ed84e8e78 = Frente a las tablas impresas de LSIS-AFS V1.0 (marcadas TBC en la especificación): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" } de enero de { "2025" } (NASA; SHA-256 del PDF { "986e0795" }...), las columnas de comprobación que imprime junto a los parámetros del generador: Tablas C-1 a C-5 y D-2 a D-6 los primeros y últimos { "24" } chips de cada código AFS-I y AFS-Q, Tabla D-1 la secuencia de Legendre de longitud 10223; extraídas por scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Umbrales preregistrados en b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md) antes de que existiera el generador: B1 { "420" } de { "420" }, B2 idéntico, B3 { "420" } de { "420" }. El documento marca sus tablas de códigos como { "{" }LSIS-TBC{ "}" } y dice que son solo para ensayo e integración, de modo que esto valida la construcción frente a las tablas de esa edición, no frente a las de una posterior. Una afirmación preregistrada sobre el estado inicial de G2 impreso (B1b) se formuló con el sentido equivocado y es NOT MET ({ "0" } de { "210" }), fijada; la relación corregida ({ "2047" } menos el retardo) se verifica en { "210" } de { "210" } y se registra como a posteriori. LO QUE NO SE COMPRUEBA: los propios parámetros del generador (mismas tablas), los chips entre las columnas impresas, el código terciario, la capa de mensaje y la codificación LDPC.

# text
seg-7b1ae0c7ca28 = Códigos terciarios y capa de mensaje de LunaNet AFS (BCH SB1, CRC-24Q, entrelazador) frente a LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: patrón de sincronización, codificador BCH({ "51,8" }) de SB1 y decodificador de 256 hipótesis, CRC-24Q, el entrelazador de bloques de { "60" } x { "98" }, un verificador de flujos de símbolos (kshana lunanet-afs-check) y un generador de flujos de prueba con subtramas provisionales. La codificación LDPC de tasa 1/2 de las subtramas { "2" } a { "4" } no está implementada (sus matrices están en un anexo aparte).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (como arriba): la secuencia de Legendre de longitud 1499 (Tabla E-1, idéntica) y los primeros y últimos { "24" } chips terciarios (Tablas E-2 a E-6: { "419" } de { "420" } columnas idénticas; el documento imprime los mismos últimos { "24" } chips, A14850, para el PRN { "147" } y el PRN { "151" } y el generador reproduce los del PRN { "151" }, por lo que la entrada del PRN { "147" } es muy probablemente una errata; el umbral de { "420" } de { "420" } es NOT MET y el fallo queda fijado); el ejemplo desarrollado de la Figura { "8" } del código SB1 (un ejemplo: 0x045 se codifica como 0x229F61DBB84A0); CRC-24Q frente al valor de comprobación de catálogo 0xCDE703 para ASCII { "123456789" }; la propia aritmética de tramas del documento. Umbrales preregistrados en b3ba5d5. Un fallo registrado y un solo ejemplo desarrollado para la capa de mensaje, por lo que la fila sigue siendo MODELLED. LO QUE NO SE COMPRUEBA: LDPC y las palabras CRC dentro de las subtramas { "2" } a { "4" }, el contenido del mensaje y cualquier flujo grabado

# text
seg-0d7b17524c04 = Paquetes de normas: escenarios puntuados frente a umbrales establecidos antes de la ejecución

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): los perfiles de ensayo del marco Resilient PNT del DHS para los niveles { "1" } a { "4" }, los niveles de precisión y la evaluación de integridad de IMO MSC.1/Circ.1575 y los paquetes de monitorizar, evaluar y mitigar del Apéndice F de ICAO Doc { "9849" }: cada ensayo ejecuta un tipo de escenario incluido y compara los campos de resultado con los umbrales establecidos en el paquete, y los ensayos que necesitan un registro de receptor se listan como NEEDS INPUT y no se puntúan.

# text
seg-d9ea966abdd6 = Ninguna externa para los resultados de los escenarios: cada ensayo del paquete ejecuta un tipo de escenario MODELLED. Los umbrales son el perfil establecido por el autor del paquete (el marco del DHS no establece valores; los límites de precisión de la IMO son la Tabla C-1 de MSC.1/Circ.1575, leída completa; el paquete de ICAO sigue la propia presentación del Plan de mitigación de RFI de ICAO porque Doc { "9849" } es una publicación de pago y no se leyó), confirmados antes de cualquier ejecución puntuada en archivos PREREGISTRATION.md de estilo xval bajo standards/. Un umbral MET dice que un escenario modelado alcanzó un umbral establecido, nada acerca de un producto

# text
seg-8a8f2c85e0c3 = Paquete de evidencias de ida y vuelta de laboratorio (escenario, condiciones de ensayo, registro del receptor, puntuación)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) y la exportación de registro de receptor kshana.test-conditions/1 de kshana bench-export: un paquete firmado que registra el hash del escenario, el hash de las condiciones declaradas, el hash del registro y la puntuación frente a los eventos declarados, y rechaza condiciones que no coincidan con los eventos de puntuación o un registro cuyo hash no sea el declarado. No se escribe, reproduce ni programa ninguna señal.

# text
seg-76da58fe670a = Ninguna externa: el paquete enlaza hashes y una puntuación MODELLED del registro del receptor, comprobada con datos sintéticos (el NMEA exportado de un escenario incluido tratado como el registro del receptor). No se afirma ninguna ejecución de laboratorio

# text
seg-a9189e4fe413 = Motor de seguimiento IQ frente a GNSS-SDR { "0.0.19" } con grabaciones independientes

# text
seg-364de05e5b1b = El motor completo de seguimiento de la capa IQ (iq::track mediante kshana iq track: traspaso de la adquisición, correladores, NCO, PLL Costas de segundo orden de { "15" } Hz, DLL de envolvente EML de primer orden de { "2" } Hz asistido por portadora, indicador de enganche y estimadores de C/N0) sobre GPS L1 C/A a { "30" } hasta { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, el paquete de Ubuntu { "24.04" }, ejecutado como programa aparte; solo se confirman los números derivados) siguiendo las mismas grabaciones de numpy (independientes del motor), ambos medidos frente a la verdad analítica. Umbrales preregistrados en 48edd4a5, enmendados antes de cualquier grabación de prueba en 1e4288c4 (un FLL de { "10" } Hz solo durante el enganche inicial en ambos receptores, después de que la calibración registrada fallara por un traspaso erróneo de GNSS-SDR, hallazgo F3). MET a { "30" }, { "35" }, { "40" } y { "45" } dB-Hz: jitter de portadora dentro del { "4.3" } %, jitter de código dentro del { "4.6" } % y media y dispersión del Doppler dentro de los de GNSS-SDR. NOT MET: el C/N0 NWPR del motor lee de { "2.3" } a { "7.1" } dB por debajo del SNV de GNSS-SDR (hallazgo F4, el límite conocido del NWPR; su M2M4 está a { "0.06" } dB de la verdad); los indicadores de enganche de fase difieren por definición (F5); a { "30" } dB-Hz GNSS-SDR sufrió dos deslizamientos y el motor ninguno (F6). El propio traspaso de GNSS-SDR se enganchó a una frecuencia errónea en { "3" } de { "30" } ejecuciones de calibración. LO QUE NO SE COMPRUEBA: otras señales, eliminación de bits de datos, readquisición, grabaciones de campo. La fila sigue siendo MODELLED.

# text
seg-259d201c2ff8 = Ganancias de antena CRPA en el tipo de escenario jamming frente a un recálculo independiente con numpy

# text
seg-192144c57783 = La sección opcional [crpa] del tipo de escenario jamming: un haz por canal hacia cada satélite (anulación dirigida con el jammer como nulo, o MVDR sobre sigma^{ "2" } I + P_j a_j a_j^H), que escala el ruido de cada enlace por ||w||^{ "2" } y el jammer por |w^H a_j|^{ "2" } antes de la ecuación C/N0 antiinterferencia existente.

# text
seg-232d040b575d = Un recálculo independiente con numpy (xval/crpa-jamming/oracle.py, sin código compartido: vectores de dirección de numpy, numpy.linalg.solve e inv) de cada enlace de la geometría de jamming-demo con una agrupación cuadrada de 4 elementos, con ambas ponderaciones. Umbrales preregistrados en 08d83b4d. MET: A1 (los { "150" } resultados de escenario idénticos byte a byte sin la sección, tras una corrección: la primera compilación añadió las unidades crpa a la tabla de unidades de cada ejecución de jamming), A2 (un elemento equivale a ninguna agrupación hasta { "1e-12" } dB), A3 en la ganancia de ruido de la agrupación y el C/N0 efectivo ({ "912" } ponderaciones de enlace dentro de { "1e-9" } dB, peor caso { "2.1e-14" } dB) y en el nulo del jammer con anulación dirigida (por debajo de -200 dB en ambos lados), A4 (MVDR dentro de { "0.1" } dB de la anulación dirigida con un JNR de { "80" } dB). NOT MET: A3 en la ganancia del jammer con MVDR, { "194" } de { "456" } enlaces por encima de { "1e-9" } dB con { "0.36" } de matemáticas portables ({ "202" } con matemáticas del anfitrión; docs/revisions/STUDIO15-batch4-rebaseline.md) (peor caso { "1.7e-6" } dB) en residuos de -100 a -188 dB, donde la cancelación en float64 limita ambas implementaciones (inv y solve de numpy discrepan entre sí en { "169" } enlaces, peor caso { "7.9e-7" } dB); el C/N0 efectivo que estos alimentan no se ve afectado. LO QUE NO SE COMPRUEBA: acoplamiento mutuo, desajuste entre elementos, procesamiento de banda ancha, varios jammers, cualquier hardware de antena. Un recálculo de las mismas ecuaciones, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-a2f34cff9338 = Sombra del terreno sobre el jammer en el tipo de escenario jamming frente a un recálculo independiente con numpy sobre una tesela SRTM real

# text
seg-334c569d9cae = La sección opcional [terrain] del tipo de escenario jamming: el perfil del terreno por círculo máximo entre el jammer y el receptor sobre una tesela SRTM .hgt con una curvatura terrestre de factor k, el filo de cuchillo dominante (mayor nu de Fresnel-Kirchhoff) y la pérdida por un único filo de cuchillo de la sección { "4.1" } de ITU-R P.526-15, restada de la potencia recibida del jammer.

# text
seg-615ea67dd756 = Un recálculo independiente con numpy (xval/jamming-terrain/oracle.py, sin código compartido: su propia lectura de .hgt, interpolación bilineal, ida y vuelta WGS { "84" }, perfil, curvatura, nu y J(nu)) de diez ubicaciones del jammer alrededor de un receptor en Badwater Basin sobre la tesela SRTM real confirmada tests/fixtures/terrain/N36W117_sub6.hgt. Umbrales y ubicaciones preregistrados en 92cd2bfd. Todos MET: aditividad (los { "150" } resultados de escenario idénticos byte a byte sin la sección); los puntos del perfil y el obstáculo de cada ubicación coinciden y nu y la pérdida quedan dentro de { "1.6e-10" } (umbral { "1e-9" }); la pérdida nunca aumenta cuando el jammer sube de { "2" } a { "4902" } m; la pérdida reduce cada J/S exactamente en su valor y en nada más; J(nu) dentro de { "1e-12" } dB de la de la referencia independiente. Hallazgos: las ubicaciones al otro lado de las montañas Black y Funeral pierden de { "44" } a { "48" } dB; dos ubicaciones en el fondo del valle pierden { "8" } y { "15" } dB solo por la curvatura terrestre con antenas a { "2" } m de altura, el caso rasante del modelo de un único filo de cuchillo. LO QUE NO SE COMPRUEBA: ninguna propagación medida, difracción por múltiples filos, reflexión en el suelo, clutter, el error propio del DEM. Un recálculo del mismo modelo, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-825c121c7512 = Histéresis de adquisición y cuantificador del front end en el tipo de escenario jamming frente a recálculos independientes

# text
seg-f7207263d881 = La sección opcional [acquisition] del tipo de escenario jamming (un satélite se adquiere en o por encima de un umbral de adquisición tras un retardo de readquisición y se mantiene mientras esté en o por encima del umbral de seguimiento) y la sección [front_end] (la lectura del AGC { "10" } log10({ "1" } + J/N) y la pérdida del cuantificador del ADC con entrada gaussiana descontadas de cada enlace, señaladas como no válidas para jammers no gaussianos).

# text
seg-6abc60ee9ec4 = Un recálculo independiente en Python de cada indicador de adquisición (xval/jamming-acq-agc/hysteresis.py) a partir del C/N0 efectivo por época del motor, un Monte Carlo independiente con numpy de la pérdida del cuantificador (xval/jamming-acq-agc/quantiser_mc.py, su propia búsqueda del paso óptimo, { "2" }^{ "22" } muestras) y el lazo de AGC de la capa IQ. Umbrales preregistrados en 70c72fcc, con un conjunto de ejecuciones suplementario fijado en { "37793290" }. MET: aditividad (los { "150" } resultados de escenario idénticos byte a byte sin las secciones); cada indicador igual en las ejecuciones suplementarias ({ "1824" } enlaces, { "732" } de ellos con histéresis); monótono respecto al umbral; la pérdida del cuantificador dentro de { "0.0007" } dB del Monte Carlo a { "1" } hasta { "4" } bits (umbral { "0.02" } dB); la lectura del AGC dentro de { "0.012" } dB del lazo de AGC (umbral { "0.05" } dB). NOT MET: las ejecuciones de histéresis registradas (jamming-demo a { "10" } hasta { "30" } dBW) no fueron informativas, con todos los enlaces perdidos, y sus H2 y H4 se alcanzan solo de forma trivial. Hallazgo: con un jammer CW un ADC de 1 bit pierde unos { "5" } dB más que la cifra gaussiana que aplica el motor, y se señala como no válido. LO QUE NO SE COMPRUEBA: la propia búsqueda de adquisición, la dinámica temporal del AGC, cualquier hardware de receptor. Recálculos del mismo modelo, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-9c46f1c76486 = Enganche inicial del FLL limitado por debajo del piso de traspaso FLL-PLL del diseño predeterminado (opcional)

# text
seg-efa1d1a9e904 = carrier.fll_pull_in_max_s opcional de iq::track (el campo fll_pull_in_max_s de iq::track::LoopConfig): con fll_assist = pull-in, el FLL traspasa al PLL tras un tiempo de enganche fijo, sea cual sea el PLI, con un tiempo de permanencia de retorno equivalente hasta que el PLI alcanza por primera vez fll_off_pli.

# text
seg-76cce58eaddd = Coherencia interna frente a una verdad inyectada: una fuente GPS L1 C/A sintética sin datos (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, diez semillas de ruido) cuya fase de portadora se conoce, con umbrales preregistrados en 58789af0 (docs/design/evidence/fll-handover-floor/). MET: el control (el valor predeterminado sin límite nunca traspasa en { "9" } de { "10" } semillas a { "33" } dB-Hz); aditividad (hash predeterminado y pruebas de seguimiento existentes sin cambios); enganche inicial de un traspaso desviado { "100" } Hz a { "45" } dB-Hz. NOT MET: con un límite de { "1.0" } s, traspaso y mantenimiento en cada ejecución ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; el resto alterna entre traspasos forzados y el retorno del FLL) y jitter de fase dentro del { "25" } % del PLL solo ({ "10.8" } frente a { "6.1" } grados a { "33" } dB-Hz). LO QUE NO SE COMPRUEBA: bits de datos, otras señales y frecuencias de muestreo, grabaciones de campo. El valor predeterminado no cambia; la fila sigue siendo MODELLED.

# text
seg-ac0f97e945a7 = Lector de soluciones .pos de RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lee un archivo de solución de RTKLIB (hora de calendario o semana GPS/TOW, posición en latitud/longitud o ECEF, satélites utilizados) en la línea temporal de receiver-trust (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Ninguna externa: no se leyó ningún archivo producido por RTKLIB y la disposición de columnas procede del manual de RTKLIB. Comprobado solo con archivos escritos para la ocasión; la conversión ECEF reutiliza frames::ecef_to_geodetic, que tiene sus propias filas

# text
seg-849393517c04 = Registros ASCII y binarios de NovAtel OEM7 (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lee BESTPOS (posición), RANGE (C/No por señal) y RXSTATUS (el indicador de jammer del receptor, como autoinforme de la época) de registros OEM7 ASCII y binarios, con CRC comprobado, solo lectura (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Ninguna externa como umbral de aprobación. Las disposiciones de campos y el CRC siguen la documentación pública de OEM7 (docs.novatel.com); la rutina de CRC se comprobó una vez frente al CRC que la documentación indica para su propio ejemplo BESTPOSA (citado, no transcrito). Los fixtures están escritos para la ocasión; no se leyó ningún registro de un receptor real

# text
seg-a45c53a9deb3 = Lector de relación portadora-ruido MSM4 y MSM7 de RTCM { "3" } para receiver-trust

# text
seg-0a0c9976236f = Lee el C/N0 de cada celda de señal de los mensajes MSM4 y MSM7 de RTCM { "3" } (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de un flujo de tramas, con CRC-24Q comprobado (receiver_trust::machines::rtcm3). Disposiciones tomadas de las tablas de pyrtcm con licencia BSD, no del texto del estándar RTCM.

# text
seg-2af6fc1abe98 = ReferenceImpl en una comprobación puntual, no una prueba de la suite: el decodificador de pyrtcm { "1.2.0" } lee las mismas tramas escritas para la ocasión con el mismo C/N0 y la misma hora de época. Comparte con este lector el origen de sus tablas, por lo que comprueba el tratamiento de bits, no la disposición. No se leyó ninguna captura de un receptor real ni de una estación base

# text
seg-cd554a7c1649 = Adaptador de monitor GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lee los mensajes de GNSS-SDR Monitor (Gnss_Synchro) y de PVT-monitor, retransmitidos como líneas JSON con los nombres de campo de proto, en C/N0 por canal, solución, satélites utilizados, HDOP y cielo (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Ninguna externa: los nombres de campo proceden de la documentación de GNSS-SDR; ni el lector ni relay.py se ejecutaron contra un GNSS-SDR en vivo ni una captura real

# text
seg-217e5953c128 = Ingesta de registros IMU, entrada de rumbo del giróscopo y ajuste Allan de parámetros de sensores híbridos

# text
seg-9dadc819daef = Lee un CSV de IMU (columnas documentadas o la disposición EuRoC); integra la velocidad de guiñada en el rumbo que lee el monitor heading-course ([log.imu]); y ajusta los parámetros de ruido del acelerómetro y del giróscopo de los escenarios híbridos y de fusión a partir de un registro estacionario mediante desviación de Allan con solapamiento (imu-fit).

# text
seg-9099f3467e9e = Ninguna externa: el ajuste se comprueba con registros sintéticos de ruido blanco con coeficientes conocidos, y el rumbo con registros de velocidad de guiñada constante. No se ajustó ningún registro IMU real, y q_aa no se ajusta

# text
seg-15a852a2dcb0 = Descubrimiento MQTT de Home Assistant y exportador de estado para la telemetría de confianza

# text
seg-6d6b07b26966 = Un documento de estado JSON y mensajes de descubrimiento MQTT de Home Assistant para el flujo de confianza, impresos como texto en cada superficie y publicados por MQTT { "3.1.1" } QoS { "0" } por la CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Ninguna externa: los paquetes los leyó un receptor de loopback escrito para la prueba, no un broker real, y Home Assistant no se ejecutó

# text
seg-68caf86157c2 = Paquete ROS { "2" } receiver-trust y puente gnss_lib_py

# text
seg-e7d7d99fe538 = Un puente sin ROS que escribe mensajes de solución y de satélites como NMEA y los puntúa mediante el binding de Python (integrations/ros2/kshana_trust), y un puente de NavData de gnss_lib_py a receiver-trust mediante el formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Ninguna externa: el nodo ROS no se ejecutó en un grafo ROS { "2" } en vivo, y los nombres de campo de ublox_ubx_msgs no se comprobaron contra un controlador en ejecución. gnss_lib_py (MIT) se ejecutó para la prueba del puente

# text
seg-c3c260b7063e = Pruebas

# text
seg-33d506570c1b = srp_shadow::tests (la forma cerrada anular, la ley uniforme que reproduce la sombra cónica, límites de sol pleno y de umbra)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horarios durante { "24" } h, LEO, GEO y HEO, tercer cuerpo y tercer cuerpo + SRP: peor |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; el control de serie analítica falla por { "9.96" } m; Sol { "6.39" } m y Luna { "0.244" } m respecto de las posiciones DE440 de Orekit, un fallo registrado); pruebas unitarias de propagator (rechazo del proveedor, recuento de respaldo compartido entre clones)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (el término S1 es diurno, gira { "90" } grados en un cuarto de día y tiene la amplitud del factor de carga de cada fila; magnitud física en LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit en { "8" } puntos fuera del eje: máx. |da| { "2.2e-17" } m/s^{ "2" } con N = { "70" }, se ejecuta siempre; { "3.5e-17" }, { "3.9e-17" } y { "7.3e-17" } m/s^{ "2" } con N = { "200" }, { "360" }, { "2190" }, condicionado a datos en KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada a datos: peor |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; control de grado 70 { "0.726" } m); pruebas unitarias de gravity_sh (coincidencia con el evaluador clásico hasta { "1e-13" } en grado { "70" }, diferencia finita y continuidad en el polo sobre un campo de grado 2190, un término de grado 2190 con desbordamiento por defecto frente a un cálculo con exponente extendido)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } escenarios: range-rate, az/el y mixtos, LEO y MEO, sin ruido y con sigma con semilla { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } y { "10" } grados, frente a Orekit { "12.2" }: conjuntos visibles idénticos; valores de medición dentro de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM dentro de { "1.2e-14" } en relativo; estados con ruido dentro de { "1.74" } cm y { "1.14e-5" } m/s; RMS posajuste por tipo dentro de { "2.7e-4" } en relativo; kshana sin ruido frente a la verdad { "1.06e-8" } m; kshana sin ruido frente a Orekit { "1.464" } y { "1.740" } cm en dos escenarios, un fallo registrado del umbral de { "1" } cm); pruebas unitarias de orbit_determination y batch_ls

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = pruebas unitarias de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (fixture de ESOC de { "8" } h incluido en el repositorio, sigma { "0.032" } m a partir del exponente de cabecera { "5" }: RMS 3D del nivel 1 { "0.132" } m sin cambios, nivel 2 { "0.035" } m frente a { "0.070" } m con sigma { "1" } m, procediendo el cambio de la restricción empírica a priori reequilibrada); tests/agency_swarm.rs (el producto Swarm no incluye códigos de exactitud y recurre al respaldo, fijado)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de comprobación de CRC-24Q 0xCDE703; respuesta al impulso convolucional; Viterbi corrige errores inyectados; anchos de disposición); tests/gnss_navmsg_roundtrip.rs (los bits de inicio de campo igualan los números de bit del ICD; la ida y vuelta codificar -> FEC -> entrelazar -> Viterbi -> decodificar queda dentro de medio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registros Galileo de IGS BRDC 2018-133 en la rejilla de LSB, peor { "3.6e-3" } LSB; el umbral preregistrado de número de satélites no se alcanzó, { "15" } de { "20" }, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (paso directo sin ruido; varianza de ruido blanco 1/(2N-1); reinicios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: error 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeras { "4" } épocas del archivo RINEX { "4.00" } de IGS MGEX MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: los registros de cabecera y los valores de la primera época igualan los literales publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabecera sintética { "4.02" } a partir de la especificación)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registros reales C01-C04: radio geoestacionario, longitudes 140.02/80.04/110.55/159.99 grados en las posiciones publicadas, |latitud| { "2.13" } grados con la inclinación frente a { "6.65" } sin ella; la comparación preregistrada de difusión frente a SP3 preciso está condicionada a datos en KSHANA_BDS_GEO_SP3 y no se ha ejecutado); rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (recorrido en forma de 8: RMS 3-D estable de { "0.025" } m con portadora frente a { "0.470" } m con código sobre mediciones idénticas; { "12" } semillas con NIS/dof medio { "1.00" } y NEES/dof estable { "0.92" }; un salto de 1 ciclo detectado en su época sin falsas alarmas y con la solución intacta; desactivar las correcciones de difusión eleva el error de código de { "0.51" } m a { "19.6" } m (ionosfera) y { "8.0" } m (troposfera); la ejecución sin ruido converge a { "0.3" } mm)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada paquete: fusionado por debajo de INS libre durante la interrupción con ambos sensores; ferroviario: estrecho { "5.3" } m frente a débil { "12.9" } m con grado de navegación y { "15.6" } m frente a { "18.8" } m con grado táctico durante la interrupción, disponibilidad { "0.97" } frente a { "0.95" }; tabla de acoplamiento estrecho validada); tests/gnss_ins_legacy_trajectory_pin.rs (el valor por defecto de acoplamiento débil, idéntico bit a bit)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D con { "60" } semillas: NEES medio de la segunda mitad { "8.12" } para { "8" } estados, suma de χ² de la última época dentro de su banda del { "95" } %; una corrección de reloj de { "0.1" } ns reduce la sigma de posición 3-D de { "5.58" } m a { "3.07" } m; filtro de sesgo con { "60" } semillas: suma de χ²({ "5" }) dentro de la banda, sesgo dentro de { "3" } sigma en { "59" } de { "60" }; fusion-pnt-coupled con acelerómetros sesgados: p95 de posición { "18.7" } m / { "90.0" } m e integridad { "1.00" } / { "0.97" } acoplado frente a { "430" } m / { "4060" } m y { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sin [coupled], idénticos bit a bit)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (un giro coordinado no tiene fuerza lateral y el factor de carga es 1/cos φ; la importación de CSV reproduce un perfil volado hasta { "1e-3" } m/s y { "1" } m); tests/gnss_ins_trajectory_library.rs (todos los perfiles se ejecutan y la fusión supera a INS libre durante la interrupción; cada uno vuela su movimiento nombrado; observabilidad del rumbo: sigma de guiñada tras { "240" } s de { "1.27" } grados en crucero rectilíneo frente a { "0.039" } grados en figura de 8 y { "0.062" } grados en arranque y parada); tests/gnss_ins_legacy_trajectory_pin.rs (hashes de resultado y de verdad de referencia heredados, idénticos bit a bit)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE marzo de { "2023" }, { "4" } perilunios y { "5" } apolunios: periodo { "6.5004" } d frente a { "6.5699" } d ({ "1.07" } %, umbral { "3" } %), apolunio { "71 182" } frente a { "71 215" } km ({ "0.05" } %, umbral { "5" } %), perilunio { "3 385" } frente a { "3 245" } km ({ "4.1" } %, umbral { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: las { "104" } comprobaciones pasan en la primera ejecución tras el preregistro e50c88d2, peor varianza { "3.2" } %, RMS { "1.6" } %, correlación { "0.012" }, media { "2.2" } errores estándar, fracción de elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos controles fallan como se exige; position_error_is_sigma_times_dop_on_masked_skies: las dos geometrías de horizonte enmascarado de la nota de diseño, el cielo 10sat-mixed bajo los preajustes city-street ({ "4" } satélites, PDOP { "16.6" }) y container-terminal ({ "9" } satélites, PDOP { "2.5" }), las { "26" } comprobaciones pasan en la primera ejecución tras el preregistro 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (una primera comprobación aparte sobre cuatro cielos elegidos a mano (abierto, agrupado, cañón, medio cielo; sigma { "1" } m, semilla 0x0D0B5EED) con intervalos de confianza de chi cuadrado de { "1e-6" } en total sobre { "20" } comprobaciones: razones de { "0.987" } a { "1.009" }, el PDOP/GDOP del propio resolutor igual al del núcleo hasta { "2.5e-12" }, y controles negativos para un error de DOP del { "10" } % y errores de 1/sin(elevación); ejecutada antes del preregistro, por lo que se informa, no está preregistrada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: en el paso sintético por el fiordo de scenarios/training/fjord-natural-degradation.toml se deducen las mismas { "624" } épocas con y sin el [skyline] indicado; con él se informa de cielo bloqueado en { "680" } épocas ({ "0" } sin él: el recurso por hueco de azimut no ve nada en un fiordo con dos lados), open_fraction es { "0.758" }, y las épocas de clase entorno bajan de { "78" } a { "33" }, siendo el resto pérdidas de satélites que el horizonte indicado deja al descubierto; fuera del evento el horizonte no cambia ninguna puntuación); receiver_trust::geometry::tests (razones derivadas a mano en los umbrales, los bordes de los umbrales, la rampa y el tope, el suelo, los bordes de las etiquetas, las sustituciones de [geometry], el DOP sobre el núcleo validado, cielos retenidos y caducados, lo desconocido no se adivina, pérdida de señal, la tolerancia a geometría mala, centinelas de ausencia de solución); tests/geometry_trust.rs (un cielo enmascarado aceptable etiquetado y no puntuado, un cielo enmascarado malo, una pérdida a baja elevación, una caída de potencia, un HDOP falsificado, pérdida total de señal, un arrastre durante geometría mala, geometría desconocida, sustituciones de sesión, el esquema en vivo); tests/geometry_trust_no_change.rs (las dos sesiones de ejemplo idénticas byte a byte a { "0.35.0" } una vez eliminadas las claves añadidas); tests/geometry_corpus_identity.rs (todo corpus NMEA de buque incluido, también como cielo abierto solo con GPS, y los escenarios de formación de tripulaciones: idénticos byte a byte a { "0.35.0" } salvo las épocas malas, que difieren únicamente por la deducción de geometría)

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (el núcleo de reloj único frente a gnss_lib_py)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (frente a la recursión de covarianza de Kalman en varios pasos; FM blanca exacta; ida y vuelta); núcleo de varianza de deriva validado externamente en tests/gnss_denied_clock_holdover_reference.rs (frente a scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; preregistrada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; condicionado a datos)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; preregistrada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-3016100a7015 = clock_state::tests (Q analítica de van-Loan; NEES; positividad de la PSD); tests/clock_state_reference.rs (trayectoria completa de predicción y actualización: estado x y covarianza P de { "3" }×{ "3" } sobre { "1925" } pasos / { "4" } conjuntos de parámetros frente a filterpy { "1.4.5" }; peor |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fija el hallazgo); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ronda { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelación recíproca; identidad de Sagnac de dos formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circunnavegación ecuatorial = { "207.386" } ns frente al valor publicado de Ashby de { "207.4" } ns con diferencia < { "0.05" } ns; además, la geometría Sagnac/geodist comprobada de forma cruzada con geodist() de RTKLIB { "2.4.3" } compilado a partir del código fuente en C)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (SSC propia de BPSK = 2/3R_c; PSD de área unidad; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (coincidencia entera exacta de la correlación cruzada y la autocorrelación Gold C/A de GPS con una generación independiente de códigos según IS-GPS-200; PSD de BPSK-R({ "1" })/BOC seno({ "1,1" }) frente a un periodograma independiente de scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fijado)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; T² de Mach-Zehnder; cota del suelo de Freier-2016); tests/quantum_inertial_sensor_reference.rs (función de transferencia |H(ω)|, k_eff·T² y ASD de ruido de disparo frente a los vectores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fijado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max se sitúa en el borde de media franja ±π con el escalado de alcance 1/T²; la recuperación de fase desenvuelta es exacta dentro de [−a_max,a_max] y produce aliasing de exactamente { "2" }·a_max fuera de él; el rango dinámico sin ambigüedad a_max/σ_a=π/σ_Φ es idéntico para dos factores de escala de longitud de onda/T muy distintos; los métodos de CaiAccelerometer coinciden con las funciones libres)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (sesgo frente al integrador de AccelModel; VRW frente a la integral analítica); tests/quantum_inertial_dead_reckoning_reference.rs (VRW frente a una doble integración independiente de Monte Carlo con numpy del ruido de aceleración blanca, peor desviación { "0.42" }% dentro de ±{ "3" }% en { "6" } tiempos de deriva; sesgo/factor de escala frente a un valor de forma cerrada de Groves { "2013" }; ida y vuelta de holdover)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form y cw_q_equals_the_spectral_separation_closed_form: la tabla de Q, CW y banda estrecha { "1" }, banda ancha y barrido { "2" }, fijada a las formas cerradas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efectivo frente a una rederivación independiente en numpy del presupuesto de enlace de Kaplan y Hegarty §{ "9.4" }; el C/N₀ real de JammerTest cae de forma monótona al atravesar el umbral de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (preregistrada, bloqueada, no ejecutada)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterización de parámetros de TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fija el hallazgo); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referencias independientes de forma cerrada + CUSUM); examples/tpl_jammertest.rs (calibración con suplantación real de JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fija el hallazgo); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondencia con mapa; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (el benchmark de 60 min sin GPS sobre el campo real EGM2008 de grado 70, preregistrado en xval/icgem-egm2008/: con correspondencia { "3106" } m, de modo que el umbral de < { "500" } m es NOT MET y se afirma como no alcanzado, y la reducción de diez veces de la deriva de { "70.6" } km es MET; más el Monte Carlo con semilla del error de mapa); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel y tests/emag2_real_grid.rs (lector de EMAG2v3 condicionado a datos sobre un recorte real; no se afirma ningún resultado de navegación con él); tests/terrain_slam_rbpf.rs (estimación conjunta del mapa, un RBPF de tipo FastSLAM, frente a SITAN de mapa conocido con un error de mapa correlado de { "15" } m sobre { "20" } semillas, preregistrado en xval/terrain-slam-rbpf/: ganancia media del { "1.5" }% y mejor en { "10" } de { "20" }, de modo que los umbrales del { "10" }% y de 12 de 20 son NOT MET y se afirman como no alcanzados; sin perjuicio en un mapa perfecto, MET)

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (el SBOM generado valida con cero errores frente al esquema JSON oficial de CycloneDX { "1.5" } sobre el grafo completo de 66 componentes distribuido: características default + python + wasm, sin dependencias de desarrollo)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfecta=1/idéntica=0.5/empate={ "0.125" }, ROC monótona, fusionada>{ "0.8" }, separación de capas por clase, protección frente a fugas, corpus reproducible, los indicadores de desplazamiento de distribución señalan optimismo); dominance_demonstrators (alcanzable + reproducible + MODELLED-not-VALIDATED + brecha de optimismo autoconsistente)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de referencia independiente por clase≈{ "1" }, brecha de optimismo aprendida>{ "0" }, forma de la rejilla + el IC bootstrap acota la media + tendencia de escalado positiva, características de ID finitas, el predictor de la brecha supera a predecir la media tanto con validación cruzada dejando fuera un detector como dejando fuera una clase + determinista); impairment_ml::tests (logreg separa + determinista + pérdida↓, el MLP resuelve XOR, que un modelo lineal no puede + con semilla); eval_stats::tests (bootstrap/DeLong/Spearman/ridge frente a formas cerradas)

# text
seg-e0f68f57399d = quantum_trade::tests (recuperación en ida y vuelta de la ADEV, no negatividad de NNLS, aviso de suelo presente/ausente, beneficio>{ "1" }, envolvente monótona + cota de alt-PNT); dominance_demonstrators (la ADEV medida se guía por datos y no se supone un suelo, la clase supuesta marca suelo + aviso, curva mal formada rechazada, MODELLED-not-VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exacto en los puntos de la rejilla + ida y vuelta + monótono, media de Ap diaria, T exosférica frente a las anclas publicadas de mínimo/media/máximo solar + incremento por tormenta, densidad igual a la unidad en la referencia, oscilación del ciclo solar dentro de la banda observada de { "5" }–{ "10" }×, escenario reproducible + MODELLED-not-VALIDATED + rechazo de fuera de rango); dominance_demonstrators (alcanzable + reproducible + T física + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (un lanzamiento hacia el este exacto alcanza i=latitud, KSC→ISS = { "45" }° de manual, polar = N/S, i<lat inalcanzable, bonificación ecuatorial de { "465" } m/s, cambio de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, recuentos de oportunidades diarias, escenario reproducible/MODELLED + trayectoria dogleg); dominance_demonstrators (alcanzable + reproducible + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (g máximo independiente del coeficiente balístico + banda física de g, crece con γ más pronunciado / entrada más rápida, la velocidad del g máximo = V_e·e^(−1/2) y la del calentamiento máximo = V_e·e^(−1/6) más rápida, la altitud del g máximo física + más profunda para B mayor, escenario reproducible/MODELLED + geometría degenerada rechazada); dominance_demonstrators (alcanzable + reproducible + fracción V_e·e^(−1/2) + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (solo comprobación cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueada, no ejecutada)

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (coste por cobertura derivado a mano 48/96={ "0.5" }, razón de ROI { "2.667" }, ordenación de cotas + protecciones de cobertura cero)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (el mismo fallo pasa de Available a MI y a HMI al endurecerse el contexto; PL conservador→Unavailable; HMI por eje; protecciones de entrada)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (el VRW físico cae dentro de la cota de VRW citada en los { "3" } niveles; rango bruto de ambigüedad de franja calculado a partir de k_eff·T²; el presupuesto conservador deriva más que el mejor; toda cota con fuente y marcada para confirmación; protecciones de ordenación de cotas)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (cuatro regiones + límites inclusivos + |error| + indisponibilidad por PL>AL); tests/tib_scorer_reference.rs (recuentos de clasificación frente a numpy independiente sobre un conjunto sintético fijo)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpio/subacotado/todo no disponible/vacío); tests/tib_scorer_reference.rs (recuentos + tasas + coverage_ok frente a numpy hasta { "1e-12" })

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfiles de desfase, deriva monótona, marcado del conjunto indetectable, consistencia de max_offset, exactamente dos clases indetectables)

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (el PL de referencia absorbe; PL roto no absorbido sin detección nunca; veredicto de cobertura detectable; la propiedad de honestidad de que no se puede alcanzar ningún veredicto de cobertura/detección para un escenario indetectable)

# text
seg-6d963d838eed = hybrid_integrity::tests (la configuración resuelta se repite tanto para los valores por defecto como para las sustituciones, sin hacer pasar la longitud de onda por metros en una ida y vuelta; cada entrada de unidades lleva una unidad y una clase de procedencia; todo campo que nombra el bloque de unidades se emite de verdad, de modo que no puede documentar un campo fantasma)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (la disponibilidad es igual al producto de los dos indicadores recalculados a partir de los márgenes del propio informe, y esos márgenes se reconstruyen a su vez a partir de la EIRP, la pérdida en espacio libre, la pérdida agrupada, la figura de mérito, el término de Boltzmann, la tasa de datos y el requisito del propio informe hasta { "1e-9" } dB; se mide que el valor es { "0" } o { "1" } mientras que se mide que la disponibilidad óptica en la misma ejecución está estrictamente entre ambos; cada fila de factor lleva una clase de procedencia del vocabulario cerrado de field_schema; el alcance de cierre indicado, vuelto a pasar por el presupuesto de enlace, devuelve un margen de { "0" } a { "1e-9" } dB y se mide que es independiente del alcance al que estaba la ejecución a lo largo de cuatro décadas, mientras que la utilización del alcance se mueve exactamente según la razón de alcances; un enlace de -40 dBW indica disponibilidad { "0" }, LOST, y una utilización superior a { "1" } en lugar de una fracción; se afirma que la nota obsoleta 'no RF-availability counterpart is computed by this engine' ha desaparecido y que la que la sustituye nombra el campo nuevo; una entrada RF mal formada se rechaza en lugar de recortarse)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (la razón es igual a los dos tramos emitidos divididos, con precisión relativa de { "1e-15" }, y sus formas recíproca y en decibelios coinciden; el alcance y la sigma de tiempo de cada tramo se relacionan exactamente por c; se afirma que la configuración común emitida es igual al alcance y al tiempo de integración del propio escenario y que el alcance del tramo RF es igual al del tramo óptico; el C/N0 del tramo RF es bit a bit el del bloque de disponibilidad, de un único presupuesto de enlace, no una rederivación; la propiedad de COMPARACIÓN HOMOGÉNEA se MIDE en lugar de afirmarse: cuadruplicar el tiempo de acumulación común reduce a la mitad el tramo óptico con { "1e-12" } y el tramo RF con { "1e-7" } y deja la razón sin moverse con { "3.19e-9" } relativo, cosa que un tramo que promediara en secreto sobre otra cosa no podría hacer; una sustitución de rf_dll_bandwidth_hz que rompe el tiempo de promediado común hace que la razón sea nula con un motivo que nombra ambos tiempos, mientras que ambos tramos se siguen emitiendo; una ejecución de un solo sentido hace que el tramo de comparación sea bit a bit el valor destacado publicado con un factor de penalización de exactamente { "1" }, y una ejecución de doble sentido reproduce la penalización 0.5/sqrt(pérdida geométrica del camino de retorno) recalculada a partir de la propia geometric_loss_db del informe con { "1e-12" })

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (en tres bandas, cuatro décadas de alcance y ambos veredictos de cierre, el margen y la pérdida en espacio libre que lo sustenta se recalculan solo a partir del informe con mejor de { "1e-9" } dB; el G/T requerido ensamblado a partir de los términos de la ecuación coincide con la misma magnitud obtenida como G/T menos margen, y volver a ejecutar en él anula el margen; tres presupuestos con EIRP, pérdidas y umbral muy distintos pero igual constante de enlace dan un requisito idéntico, mientras que { "1" } dB en la constante lo mueve exactamente { "1" } dB; el reparto de ganancia está ausente salvo que se indique una temperatura de ruido y se rechaza una no positiva; todo campo que nombra el bloque de unidades se emite de verdad)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests y lunar_time_budget_scenario::tests (las cuatro clases presentes en una ejecución y en el orden de un subconjunto solicitado; cada fila coincide con su propia forma cerrada con mejor de { "1e-12" } relativo; escalar el error de marco por k escala el cruce por k para un reloj de FM flicker y por k^{ "2" } para uno de FM blanca, comprobado con k={ "2" } y k={ "3" }, lo que separa las dos clases de ruido; cada fila reproduce el cruce de reloj único que el presupuesto ya informaba; cada fila recupera el único término de marco compartido; un nombre de reloj desconocido se rechaza)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests y attack_surface::tests (la rejilla está completa y toda fracción capturada está en [{ "0,1" }]; la fracción capturada no decrece con la potencia de transmisión en ningún nodo; NO es monótona en anchura de haz ni en altitud, lo cual fija su propia prueba para que el barrido no pueda suavizarse después; el nodo de línea base reproduce bit a bit la fracción capturada existente; la evaluación solo del limbo es idéntica bit a bit al último punto del barrido completo; un cruce localizado está en el umbral con { "1e-9" } dB y queda enmarcado)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (los { "57" } tiempos de promediado x { "8" } términos presentes, el índice de la rejilla va de { "0" }..={ "56" } y lleva { "8" } filas cada uno; la fila <c1/> es igual a la raíz de la suma de cuadrados de los siete términos que la acompañan en cada tau; la tabla sigue una rejilla solicitada y no una codificada; emitirla deja el JSON del informe idéntico byte a byte)

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: con el gobierno desactivado, el término de reloj es igual al término de reloj del presupuesto hasta el último bit en las cuatro clases; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas clases de ruido; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: el documento, la tabla y el resumen por defecto no cambian y el bloque solo añade su propio objeto y sus unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: óptico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, con las curvas de PHM y RAFS cruzándose entre { "7e5" } y { "8e5" } s, fijado como propiedad declarada de los modelos de reloj de un solo tipo de ruido; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (el límite de campo lejano coincide con delta_dor; corrección de campo cercano; derivadas parciales por diferencias finitas); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } pruebas de biblioteca: el semiángulo del limbo terrestre frente a su forma cerrada asin(R/r) con una aserción adicional de que TODO enlace no ocultado queda fuera de ese cono, de modo que la prueba de ocultación y el ángulo del limbo no pueden discrepar; el predicado de ocultación comprobado en el lado cercano, el lado lejano y el caso en que el cuerpo queda DETRÁS del transmisor; pérdida de trayecto acotada a la banda plausible de alcance lunar en todo enlace; el conjunto seguible se muestra como subconjunto del conjunto geométricamente visible y disjunto del ocultado; monotonía en ambos sentidos: más ganancia de recepción nunca reduce el recuento, un umbral más estricto nunca lo aumenta; ningún enlace recibe más que la ganancia en el eje de visión; un receptor dentro de la Tierra se rechaza; se afirma que el barrido VARÍA de verdad con la época; y se afirma que la disponibilidad de señal y de solución son distintas, están correctamente ordenadas y son coherentes con las filas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fijado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (hallazgo fijado)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (umbral O1: la matriz de transición de estado encadenada durante tres días y durante un periodo es igual a scipy DOP853 con un relativo de { "1e-6" }; umbral C1: q medio y la fracción dentro del 95 %; umbral C2: muestra sobre traza formal de cada estimador; umbral C3, NOT MET y fijado: con { "3e-10" } m/s2 de aceleración no modelada, la superación dentro del 95 % es { "0.0525" }, no al menos { "0.5" }: la estimación a bordo solo se conoce con centenares de metros, de modo que unos diez metros de desplazamiento quedan ocultos dentro de su covarianza); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (umbral Q1: éxito de Monte Carlo al menos la cota bootstrap menos tres errores estándar; Q2: ninguna caída con la longitud del arco más allá de tres errores estándar; Q4: LAMBDA es igual a la enumeración por fuerza bruta para { "200" } extracciones de dimensión hasta cinco; Q3: el diseño flotante es igual a una resolución independiente en numpy con { "1e-9" } para las covarianzas de ambigüedad y de posición, y la tasa con bootstrap es NOT MET con { "1e-9" }, fijado: difiere en un relativo de { "1.7e-6" } porque la CDF normal de LAMBDA es una aproximación de Abramowitz y Stegun)

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (umbral F1: la traza del CRLB no sube y el menor valor propio no baja con enlaces de orbitador, en el ejemplo y en { "20" } conjuntos aleatorios con semilla; umbral F2: las derivadas parciales de alcance son iguales a una diferencia finita independiente en numpy longdouble del modelo directo de Rodrigues en { "50" } geometrías; umbral F3: el menor valor propio sube al menos 2.0x, se halló unas 111x)

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (umbral T1: las sigmas de traslación no bajan al aflojarse el enlace local; T2: con las sigmas de técnica escaladas por { "1e-6" }, la sigma de traslación de cada par está dentro del { "1" } % de sqrt({ "2" }) veces la sigma del enlace local, hallada dentro de { "3e-7" }; T3: la matriz de información es igual a un ensamblado apilado independiente en numpy con { "1e-9" }). La primera ejecución de T2 con inversión de ecuaciones normales falló ({ "1.3" } % con un enlace de { "0.1" } m, valores por debajo del suelo con { "1" } m); la causa era numérica y la covarianza pasó a la vía de raíz cuadrada antes de volver a puntuar el umbral.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (umbral G1: las derivadas parciales analíticas son iguales a una diferencia finita centrada de cada modelo directo con { "1e-8" }; G2: la información 5x5 es igual a un ensamblado independiente en numpy con { "1e-6" }; G4: la amplitud de la marea de reloj y sus sensibilidades a k2 y h2 son iguales a una evaluación independiente con { "1e-9" }; umbral G3 NOT MET en su mitad de traza, fijado: añadir una familia nunca baja el menor valor propio ({ "28" } de { "28" }) pero la traza de la pseudoinversa subió en { "12" } de { "28" } adiciones porque la familia añadida elevó el rango)

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidad de horizonte frente a la forma cerrada L01; el DOP aumentado con balizas frente al desnudo; la raíz de la suma de cuadrados del presupuesto de errores; la relación DOP-a-metros); tests/validate_p2_beacon_before_after_table.rs (toda la tabla de antes y después fijada a un golden incluido con { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (la misma geometría por una ruta de DOP INDEPENDIENTE, de modo que la ampliación no se comprueba frente al núcleo que la produjo); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal acota el error de posición horizontal a k sigmas aportado por la clase de modo común ciega, formando blind_position_covariance = S<em>Cov</em>S^T y proyectándola a ENU; integrity_envelope informa hpl_total = hpl_araim + cmpl. La distinción que el par existe para hacer: la prueba de RESIDUO de RAIM/ARAIM es demostrablemente ciega a los errores de range(G), pero el NIVEL DE PROTECCIÓN de ARAIM no lo es: su término sin fallos ya los acota hasta una URA del proveedor más un sesgo nominal. Por tanto, el CMPL es solo el EXCESO entre proveedores que la URA/ISM por proveedor de un único proveedor no sobreacota, y la suma es una cota conservadora por desigualdad triangular y no una RSS, válida solo donde ese exceso no está ya dentro de la URA.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (rango deficiente sin líneas base con la Tierra; tres líneas base restablecen el rango completo: el umbral de 3 estaciones sale del rango de la información, no del error de resolución; CRLB de estación alcanzado por el estimador con eficiencia { "0.98" }; el CRLB se estrecha de forma monótona con las líneas base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices de IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registros de longitud máxima, equilibrio de Legendre, ida y vuelta del retardo G2, composición de niveles); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sin la caché de LSIS: cuatro números citados fijan el hallazgo; con ella: { "2 937 232" } chips y bits frente a los archivos del Anexo { "3" } de LSIS, los primeros y últimos { "24" } chips impresos, las Tablas D-1 y E-1 de Legendre y las inicializaciones de G2 dan exactamente un elemento diferente, la celda de 'últimos { "24" } chips' de la Tabla E-5 para el PRN { "147" }, que duplica la del PRN { "151" } mientras que el archivo del Anexo { "3" } coincide con el generador); la prueba estricta preregistrada afs_codes_match_lsis_v1_tables_and_annex3_bit_exact se ignora con esa diferencia

# text
seg-8cd700abad59 = lunar_afs::waveform (grabación y etiquetas de verdad de referencia), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (tercer preregistro: { "2" } nodos, { "4" } canales seguidos, peor error de Doppler { "0.57" } Hz, peor error de desfase de código { "0.008" } chip, las { "6" } tramas decodificadas con el TOI correcto a través del salto { "99" } -> { "0" } y con la subtrama { "2" } coincidente; G0 no se alcanza tal como está escrita, la propia variación de ejecución a ejecución del receptor en sus registros de adquisición); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segunda: { "5" } violaciones); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primera: nula); las pruebas estrictas de los tres archivos se ignoran con sus diferencias

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (hallazgo fijado); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (estricta, ignorada con la diferencia); gps_lnav::tests

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (hallazgo fijado); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (estricta, ignorada con la diferencia)

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } bloques frente al intervalo binomial del { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razón { "0.0131" } frente a { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } frente a { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estricta, ignorada con la diferencia); pruebas de iq::campaign::detect; pruebas de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (los resúmenes fijados no cambian sin la tabla)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } en eventos indicados que no atenúan nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estricta, ignorada con la diferencia); pruebas de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura de PI90 { "0.891" } sobre { "558" } intervalos, { "0.900" } sobre { "10" } eventos de tiempo hasta la pérdida con cada modelo de enganche), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash y veredictos de [validation], auditoría del bloque de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db y bar_b_prime_ci_subset (estrictas, ignoradas con la diferencia); bar_b_prime_full_set_of_50_campaigns (ignorada, se ejecuta antes de la publicación); pruebas de iq::labfit::cn0 (degeneración exacta de Q-delta, recuperación de delta con la Q indicada, inversa del umbral de forma cerrada); pruebas de iq::labfit::iqfit (las condiciones del modelo de enganche reproducen exactamente el modelo de C/N0); tests/iq_labfit_followup.rs (el seguimiento registrado en 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign que afirma el NOT MET registrado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, en release)

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (hallazgo fijado); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estricta, ignorada con la diferencia)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites del archivo de difusión de IGS del { "2" } de marzo de { "2025" }: { "960" } de { "960" } palabras pasan la paridad de RTKLIB, { "96" } de { "96" } subtramas se decodifican, { "608" } de { "608" } enteros difundidos decodificados son iguales a los de Kshana, toda entrada dentro de medio cuanto, semana y tiempos exactos); gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estricta, ignorada con la diferencia); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estricta, ignorada con la diferencia)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estricta, ignorada con la diferencia)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (hallazgo fijado, condicionado a datos); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estricta, ignorada con la diferencia)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (el modo común del reloj se cancela exactamente; el residuo crece con la línea base; reutiliza el PL de SBAS; el número de satélites se respeta hasta el límite del constructor de { "24" }, de modo que una constelación mayor no puede devolver en silencio una menor); tests/lunar_differential_pnt_reference.rs (residuo de diferencia simple + resolución de posición por WLS frente a lsq() de RTKLIB compilado a partir del código fuente en C)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (el OEM lleva REF_FRAME/TIME_SYSTEM lunares; los metadatos de tiempo hacen ida y vuelta; envoltura KIF); tests/lunar_interoperability_export_reference.rs (el OEM lunar emitido por kshana releído con la biblioteca independiente de Python <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época con la precisión del formato; una exportación corrompida se rechaza); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonía, cotas del compuesto, tope de nivel, procedencia modelada); resilience::diversity::tests (Simpson inversa, modo común, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (ejemplo a mano de tau de Kendall, símplex de Dirichlet, tasa de inversión); resilience::study::tests (control de estabilidad, testigo de inestabilidad, declarado frente a medido, colapso de la diversidad)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, campos JSON)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridad del beneficio, mayor/menor es mejor; envuelve fielmente un TradeResult real; evidencia deshonesta rechazada; una FoM validada necesita ancla externa; JSON determinista)

# text
seg-fe77856b9e9d = quantum_devices::tests (tarjetas de reloj honestas y ordenadas; precisión del entrelazamiento ~1/sqrt(tau); tasa detectada -10x/10dB; las cuentas oscuras degradan; cotas del suelo sistemático; tarjeta modelada y válida)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (la precisión mejora con la integración; lo cuántico puede ganar Y perder; PL finito y positivo; FoM de seguridad en [{ "0,1" }] y crece con el retardo del ataque; Pd de anomalía monótona; el estudio comparativo is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (lo cuántico supera a lo clásico en una interrupción larga; la ventaja depende de la interrupción; el estudio comparativo is_honest); tests/gnss_free_quantum_navigation_reference.rs (crecimiento de la posición a estima frente a una doble integración independiente en Octave + el ancla de ruido publicado de Freier-2016)

# text
seg-8e49ee940482 = quantum_faults::tests (valores conocidos de AUC analítica; la AUC bootstrap empírica acota la forma cerrada; lo cuántico detecta fallos menores / mayor AUC; la ventaja desaparece para fallos enormes; catálogo de 5 clases; el estudio comparativo is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sin ruido directa→inversa hasta { "1e-6" } m; J·CRLB=I con una covarianza simétrica definida positiva; la traza de la varianza de posición del CRLB no aumenta cuando se añade un receptor; TDOA+FDOA conjuntas recuperan la posición+velocidad de un emisor en movimiento; se rechazan <{ "4" } receptores); tests/geolocation_reference.rs (ida y vuelta sobre cuatro geometrías con una red diversa en 3-D; el estimador de Gauss–Newton alcanza su cota de Cramér–Rao: la covarianza empírica del error sigue la cota analítica en { "4000" } ensayos de Monte Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound y finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fijados)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registra { "746" } W/cm2 para Stardust sin umbral)

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (la ecuación bidireccional recupera exactamente el desfase; el término de Sagnac es igual a la forma cerrada del lazo de BIPM; el término ionosférico sigue la división de frecuencias y la troposfera se cancela; la fase flicker tiene una TDEV plana; un residuo diurno eleva la TDEV hacia medio día; un sesgo de reciprocidad desplaza el desfase y no la TDEV; la estabilidad de series elimina una tasa); time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (umbrales preregistrados A1-A3 frente a la referencia independiente mpmath: { "216" } puntos de la rejilla de Rytov con peor error relativo { "3.4e-7" } frente a un umbral de { "1e-6" }, centelleo peor { "4.5e-16" }, factor de apertura peor { "5.7e-16" }, { "96" } probabilidades de desvanecimiento gamma-gamma con peor { "1.3e-12" } en log10, profundidad óptica de nubes y de aire despejado peor { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (umbral A5: el presupuesto de enlace con pérdidas agrupadas y las salidas existentes de disponibilidad de emplazamiento son idénticos bit a bit al commit base sobre { "1,000" } conjuntos de parámetros)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (umbral A4: rho = { "0" } es igual a la unión independiente y rho = { "1" } al mejor emplazamiento individual hasta { "1e-12" }, y cero violaciones de monotonía en el número de emplazamientos y en la correlación; la primera ejecución de este umbral falló por { "3e-9" } porque la CDF normal en uso era la forma de Abramowitz-Stegun de { "1.5e-7" }, un defecto de implementación sustituido por la CDF de gamma incompleta con el umbral sin cambios); optical_weather::tests y optical_sitediv::tests (margen monótono, el techo de nubes como forma cerrada, las identidades de duración de interrupción, inversión de la búsqueda del margen)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (umbral A6: el error de temporización por interrupción es igual a holdover::coast_phase_sigma y el error de alcance es igual a phase_to_range_m bit a bit sobre { "9" } relojes, { "3" } duraciones medias, { "3" } dispersiones y { "4" } cuantiles); optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (umbrales T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fijados antes de la primera ejecución: misma semilla, mismos bytes, y otra semilla, otros bytes; sin clave sin la tabla; en { "8760" } h a { "600" } s, semillas { "37" } y { "38" }, la disponibilidad realizada de cada uno de los tres emplazamientos por defecto dentro de { "6" } puntos de la indicada (peor { "3.3" }) y la fracción de nubes realizada dentro de { "5" } puntos de la probabilidad indicada (peor { "2.1" }); el margen es igual al presupuesto menos los dos desvanecimientos y «up» es igual a margen no negativo en cada paso; ninguna llamada matemática no portable en el módulo; las ejecuciones demasiado largas y los pasos erróneos se rechazan)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (un ODF real de MRO, 2007-304/305, frente a su etiqueta PDS: el recuento de registros, las posiciones de grupo, las estaciones, las horas de inicio y fin y los tipos de datos se mantienen; el recuento de filas de la tabla de fin de archivo falla por uno, una inconsistencia de la etiqueta, fijada como hallazgo); odf::tests (ida y vuelta de un registro construido a mano, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (condicionado a datos, SHA-256 de entradas fijado, CI mensual con datos reales obligatorio: Doppler previsto a partir de la reconstrucción de navegación de MRO mro_psp5 en las pasadas puntuadas de DSS { "63" } y DSS { "14" }, { "12.5" } mHz RMS, umbral { "30" } mHz, alcanzado; la determinación de órbita registrada no produjo ninguna órbita, fijado como hallazgo; ejecución { "2" } con un estimador amortiguado, registrada por separado: órbita { "0.36" } km RMS y { "0.53" } km máximo frente a mro_psp5, alcanzado, Doppler posajuste { "48.6" } mHz frente a { "30" } mHz, no alcanzado, fijado como hallazgo; lector de SPK tipo { "1" } frente a CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } semillas, NEES medio de seis grados de libertad en la segunda mitad dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (una ventana que termina exactamente cuando empieza la siguiente no compite, y adelantarla un segundo cuesta exactamente un segundo: la protección contra el error de uno; las ventanas solapadas más allá del número de aperturas dejan en interrupción a la sesión de menor rango, con el intervalo de contienda fijado; la política de arbitraje decide qué servicio ocupa la apertura, con las cifras de las tres políticas fijadas en un mismo plan; el primero en llegar es el primero en ser atendido no expropia una sesión que ya tiene una apertura; una sesión que pierde el arbitraje al comenzar adquiere una apertura cuando una queda libre; los tres ciclos de trabajo dan cuenta de cada segundo de apertura disponible en { "3" } políticas × { "4" } números de aperturas; añadir una apertura nunca aumenta la interrupción de ninguna sesión, medido en { "200" } planes pseudoaleatorios × { "3" } políticas × cada número de aperturas; con aperturas suficientes para cada sesión no queda ninguna interrupción; el horizonte de informe recorta el plan y fija el denominador del ciclo de trabajo; una lista de pases previstos se convierte en un plan de contactos sin un segundo tipo de ventana; las cifras de ciclo de trabajo del plan incluido son salidas del motor para una y dos aperturas; el informe indica la política que produjo las cifras; toda cifra informada lleva una unidad y una clase de procedencia; el escenario es reproducible y se declara MODELLED; el escenario rechaza un plan que no puede planificar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } pruebas de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; invirtiendo jamming::effective_cn0_dbhz, jamming::j_over_s_db y jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } pruebas de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (la curva de potencia de detección va desde la tasa de falsas alarmas con fallo cero hasta { "1" } − P_md en el sesgo mínimo detectable; el sesgo mínimo detectable devuelto a noncentral_chi2_cdf en el umbral que aplicó el propio monitor devuelve P_md con una diferencia de { "1e-9" }, en todos los ejes y a través del asistente público; un sesgo realmente inyectado en la estimación RF desplaza el estadístico propio del monitor exactamente en el valor b²/(σ_rf² + σ_opt²) calculado a mano; un sesgo sin ruido se detecta por encima de √(T/λ*)×MDB y se pierde por debajo, con la escalera inyectada a ambos lados de ese cruce; la potencia de detección es monótona en la magnitud del fallo e idéntica en los cuatro ejes en múltiplos de MDB; una simulación de Monte Carlo con semilla de 200,000 muestras del estadístico del monitor reproduce la potencia analítica dentro de 4σ en cuatro puntos de la curva; el MDB de temporización queda fijado por encima del límite de alerta de temporización, lo que es una debilidad medida y no una característica; se mide que el cuantil de Wilson-Hilferty discrepa del umbral exacto del monitor en ~{ "4" }%, lo que deja constancia de por qué no se usó; la cifra de rampa es exactamente MDB/velocidad y escala inversamente con la velocidad, y una velocidad no positiva da null y no cero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (el avance en inercia parte exactamente de la traza de covarianza que notifica el bloque de traspaso, en ambos sentidos, de modo que la diagonal reproducida no puede desviarse del traspaso notificado; el tiempo de cruce notificado se recalcula a partir del propio sigma de traspaso del informe, de la PSD de ruido de proceso y del factor de cobertura, y la cota queda dentro del límite de alerta justo antes de él y fuera justo después; el tiempo de avance en inercia escala exactamente de forma inversa con la PSD de ruido de proceso y se acorta cuando el límite de alerta se estrecha; un avance en inercia con PSD cero notifica null y no un tiempo cero, porque nunca no es inmediatamente; el perfil emitido cruza exactamente una vez y acota el cruce notificado; el tiempo de duplicación de la varianza y el tiempo de cruce del límite de alerta se mantienen separados, al diferir en ocho órdenes de magnitud tras la etapa óptica ajustada y en menos de un orden de magnitud tras la etapa RF holgada; abandonar la modalidad óptica da más tiempo de avance en inercia que abandonar la RF, exactamente en la diferencia de covarianzas dividida por la tasa de crecimiento horizontal; y random_walk_time_to_limit distingue ya-fuera, cruza-en-t y nunca-cruza)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests y lunar_service::tests (el cruce de potencia mitad localizado por bisección sobre el patrón coincide con la x de Airy publicada = { "1.61634" } y da el ancho exacto { "1.02899" }·λ/D, lo que deja constancia de que el coeficiente convencional { "1.02" } se sitúa en −{ "2.955" } dB y no en −{ "3.010" } dB; el patrón es estrictamente decreciente a lo largo de { "400" } puntos desde el eje hasta el primer nulo; el álgebra de eficiencia implícita hace el viaje de ida y vuelta con una diferencia de { "1e-12" } y reproduce { "0.641" } / { "0.920" }; el ángulo fuera del eje coincide con tan θ = R·sin γ/(r − R·cos γ) en { "20" } puntos y en ambos límites con una diferencia de { "1e-12" }; el cono aproximado contiene el haz real fila por fila; los recuentos de cabecera son iguales a los indicadores por fila que resumen y la corrección es igual a su diferencia; cada veredicto de fila puede recalcularse solo a partir del informe emitido; cada campo numérico y booleano emitido tiene una unidad y una clase de procedencia; una abertura imposible no emite ningún bloque; sin antena configurada la exportación conserva exactamente sus seis claves preexistentes, { "0" } hojas cambiadas y { "0" } eliminadas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (compuesto de sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter del discriminador de Costas en lazo abierto frente a sdr::correlate avanzado paso a paso sobre IF sintética con semilla, { "3" } realizaciones de ruido agrupadas × { "900" } épocas, con una coincidencia de { "0.63" }% entre 35 y 45 dB-Hz, exigiendo que el término de pérdida por elevación al cuadrado se ajuste al menos { "3" }× mejor que la forma sin pérdida por elevación al cuadrado allí donde sea resoluble; la saturación del discriminador atan en ~{ "32" } dB-Hz afirmada y no meramente enunciada, de modo que el límite de validez queda fijado; σ en lazo cerrado frente a un lazo de Costas sdr avanzado paso a paso a lo largo de { "4000" } épocas con { "3.7" }%; retardo de rampa del DLL de primer orden frente a un DLL sdr avanzado paso a paso con { "0.17" }%; bessel_i0 frente a I₀ tabulado con { "7.4e-8" }; el ancho de histéresis obligado a caer en [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] en { "4" } relaciones × { "2" } tiempos de integración × { "3" } anchos de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (compuesto de lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } pruebas de biblioteca: cada grafía de datum hace el viaje de ida y vuelta por parse/as_str y una desconocida se rechaza; mantener todas las estaciones sin la baliza se rechaza con un error que nombra <c1/>; se afirma que el brazo de palanca es IGUAL a ρ/B y que la equirrepartición de la baliza es IGUAL a la equirrepartición de la estación multiplicada por él, ambos con una diferencia de { "1e-15" }, con una afirmación adicional de que el brazo de palanca supera { "10" } para que los dos presupuestos no puedan confundirse en esta geometría; la línea base publicada del fixture queda fijada en { "10726.748" } km y se afirma que su calendario de 49 muestras da estrictamente menos de { "49" } observaciones de visibilidad mutua; se mide que el espectro de la baliza en una única línea base abarca al menos cinco décadas y se afirma que la relación resultante es superior a { "1" } por AM-HM y superior a { "100" } en la práctica; se afirma que la configuración estación más baliza es de rango deficiente con AMBOS campos calculados en null mientras el término modelado de comparación sigue notificándose. Además, una salvaguarda sobre el propio fixture: una clave de nivel superior intercalada después de una matriz de tablas pasa a ser, en cambio, un dato de estación, por lo que se afirma el punto de intercalación y se comprueba que el escenario analizado lleva la clave: el modo de fallo es una ejecución que usa en silencio una configuración distinta de la que nombra la prueba)

# text
seg-08708f044bb5 = lunar_dpnt::tests (una salvaguarda puramente aditiva cuya diferencia de conjunto de claves es exactamente { "{" }correction_link, units{ "}" }, con todos los valores preexistentes idénticos bit a bit frente a literales capturados antes del cambio; el error de levantamiento NO se decorrelaciona con la línea base mientras que el término de órbita sí, y sobrevive a una línea base cero donde el término de órbita es exactamente cero: la comprobación estructural que detecta haber cableado el término en el lugar equivocado; un error de estación de { "1" } m se transfiere { "1" }:{ "1" } y se demuestra que no es amplificado por el DOP; una latencia cero reproduce bit a bit el residuo sin envejecer y el residuo es monótono en la latencia, con la curva emitida igual a las ejecuciones directas; el paso de cuantificación se reduce exactamente a la mitad por bit y σ² = step²/12, y la escala completa sigue las magnitudes inyectadas; cada término desactivado por turno recupera los otros dos en cuadratura; un σ igual por satélite se propaga exactamente a σ·PDOP y ese PDOP coincide con orbit::dop; cada campo emitido lleva una unidad y una clase de procedencia, comprobado en ambos sentidos)

# text
seg-810a6946b5cd = lunar_station (sobre lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: con una diferencia de { "1e-12" } m con y sin ruido de receptor; zero_baseline_floor_is_zero_in_every_trial: { "0" } con una diferencia de { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro de la banda del { "5" } % indicada antes de la ejecución; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (el recálculo numpy preregistrado, registrado con su fallo); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs y los registros y goldens multiplataforma sin cambios (aditividad); tests/field_units_global.rs (cada campo emitido descrito, sin excepciones)

# text
seg-641b41572fd9 = lunar_terrain (sobre skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: el avance del rayo reproduce -acos(R / (R + a)) con una diferencia de { "1e-3" } grados en cada acimut; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: el mismo cono muestreado sobre una tesela de latitud/longitud de { "0.005" } grados coincide con el cono analítico con una diferencia de { "0.25" } grados; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: un cráter de fondo plano sobre la esfera, con el observador en el centro y a { "4" } km y { "7" } km de él, frente a la elevación del borde de forma cerrada atan2((R + H) cos s - (R + a), (R + H) sin s) con s de la ecuación esférica de cruce del borde, con una diferencia de { "0.01" } grados en cada acimut; rasterised_cone_matches_the_analytic_cone: un cono rasterizado sobre una cuadrícula estereográfica polar de { "200" } m y leído mediante el muestreador de cuadrícula coincide con el cono analítico con una diferencia de { "0.25" } grados; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos tipos de escenario; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 conserva su recuento plano y las épocas que cuesta un horizonte son terrain_masked (la propia disponibilidad puede aumentar, porque un horizonte puede ocultar un satélite que la estación no ve), y un horizonte de { "89" } grados en la estación no deja nada disponible; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: los fondos de los cráteres Shackleton y Haworth bajos, el macizo Malapert alto, no la imagen especular; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: una tesela remuestreada del recorte incorporado da a la estación el horizonte del recorte con una diferencia de { "0.22" } grados (cota { "0.5" } grados, fijada antes de la ejecución), con el eco de la tesela y las unidades, y dem_path con dem_tile_path rechazado; the_export_site_is_masked_by_the_terrain: cada fila de exportación supera el terreno exactamente cuando es visible y está a la altura del horizonte del emplazamiento o por encima de ella en su acimut, la geometría no se mueve, el CSV gana la columna solo con terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs y los registros y goldens multiplataforma sin cambios (aditividad)

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma de la muestra sqrt({ "2" }) a dentro del { "6" } %; station_multipath_is_gauss_markov: correlación de retardo 1 exp(-dt / tau) dentro de { "0.01" }, varianza unitaria dentro del { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs y los goldens sin cambios (aditividad)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: la diferencia de error de enlace entre con crecimiento y sin crecimiento tiene una sigma de muestra rate tau / sqrt({ "3" }) dentro del { "6" } % sobre { "1600" } muestras; linear_growth_is_the_first_order_propagated_error: un error de velocidad dv propagado con el integrador de dos cuerpos del propio árbol desde la órbita del escenario desplaza la posición en dv tau con una diferencia dentro del { "1" } % a { "60" } s y { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorada, el anexo registrado)

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: igual a lunar_dpnt::position_error_vector_from_range_errors con una diferencia de { "1e-8" } m, una fila de altura laxa no cambia nada, una ajustada fija el error de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: cada cifra con { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorada, el anexo registrado)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (las cifras registradas frente a los umbrales registrados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorada, unos { "7" } s en release: vuelve a ejecutar los seis casos registrados y afirma las cifras registradas)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, el riesgo no monitorizado dentro de P_THRES, un subconjunto que elimina tres o más satélites monitorizado, y más de diez probabilidades a priori monitorizadas rederivadas de forma independiente como P_no fault q^k con una diferencia de { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: sin alarma sin fallo, y un sesgo de { "30" } m en dos satélites detectado con el par como el subconjunto de mayor separación normalizada); tests/araim_reference_vectors.rs y tests/integrity_araim_stanford_oracle.rs sin cambios (la ruta de orden 2 es la comprobada con MAAST)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: cifras de holdover sin cambios, { "111" } épocas denegadas no disponibles y sin nivel de protección, rechazado con ejecuciones > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: el HPL y el VPL de cada época muestreada son exactamente iguales a los de un snapshot_raim de residuo cero sobre el mismo cielo preestablecido, y la ejecución sin fallos no da ninguna alarma; a_stated_bias_is_detected_while_it_lasts: un sesgo de { "60" } m da alarma exactamente en las { "10" } épocas que abarca; every_integrity_field_has_a_unit); clock_integrity::tests; los goldens del reloj sin cambios

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests y observability_gramian::tests (el documento por defecto fijado bit a bit mediante FNV-1a de su JSON, resumen y SVG, con los valores por defecto explícitos afirmados como no-op y las ocho claves de extensión afirmadas como AUSENTES, de modo que la captura no pueda regenerarse como una autocomparación; el bloque aditivo <c1/> excluido de la congelación al despojarlo y volver a calcular su hash frente a la constante fijada antes de que existiera, lo que demuestra, en lugar de suponer, que nada de lo publicado se movió; invariancia del rango bajo un sigma homocedástico afirmada con σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado como escalado exactamente lineal con σ con { "1e-6" } relativo; el espacio nulo del DRO afirmado como exactamente los ejes de coordenadas z y ż con las dos causas separadas — una fila de distancia entre naves coplanares tiene û_z = { "0" }, y el bloque fuera del plano del CR3BP se desacopla exactamente en z = { "0" }; jacobianos espaciales frente a diferencias finitas centrales y frente al observable de velocidad de distancia en 3-D independiente del crate; familias fuera del plano rechazadas en modo plano)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests y tests/operational_eop_predictor_reference.rs (recuperación de coeficientes de señal analítica con { "1e-9" } en una ventana de 365 días; un ajuste de sesgo más tasa igual a la pendiente y la ordenada en el origen de los mínimos cuadrados ordinarios de forma cerrada con { "1e-12" } sobre filas reales; DOS detectores de anticipación que destrozan las columnas rápidas de UT1 y de polo de cada fila posterior a la época de emisión — dejando intactas las finales del Bulletin B — y exigen una salida idéntica bit a bit, verificados por mutación para poner en rojo { "10" } pruebas cuando la barrera del ajuste se afloja exactamente un día; una lista de épocas reconstruida de forma independiente; el bloque Bulletin B de un objetivo en blanco y la época mostrada saliendo de la tabla; admisión de términos comprobada con ventanas de { "6" }, { "15" }, { "150" } y 365 días; recuentos de filas monótonos; y una captura previa al cambio congelada del informe por defecto afirmada campo a campo sin tolerancia, que además afirma que la captura no contiene las claves nuevas para que no pueda regenerarse en silencio como una autocomparación); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (la extensión opcional EopSeries::with_ls_ar_prediction más allá de la última fila: respuestas dentro de la tabla idénticas bit a bit, filas de pronóstico iguales a ls_ar_predict, los argumentos de marco más allá de la tabla siguen el pronóstico en lugar de quedar acotados; coherencia interna)

# text
seg-c77bd56a0619 = lunar_frame_campaign (compuesto de lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } pruebas de biblioteca: el diseño de Helmert frente a una diferencia finita central de lunar_frame_realise::apply_helmert — el módulo PARA el que es el datum, que no calcula ninguna derivada y por tanto fija la convención de signo [p]ₓ — con las { "84" } entradas del diseño coincidiendo con < { "1e-6" }; una traslación pura de la red leída de vuelta como traslación pura con una fuga < { "1e-6" } hacia los otros seis parámetros; el sigma del datum exactamente lineal en el sigma de retardo con { "1e-8" } en un cambio de { "3" }× en los siete parámetros; un arco de { "16" } h medido peor y un arco de { "48" } h medido mejor que { "24" } h, con el barrido de libración emitido ordenado del mismo modo; el peor eje de traslación afirmado como el eje dominante de la dirección fija al cuerpo hacia la Tierra medida por separado y peor que los demás en > { "5" }×, una referencia independiente física de la que nada en el solucionador fue informado; tres balizas colineales que producen un defecto con cada sigma de datum NULL y las direcciones nulas emitidas en la base de siete parámetros; offblock_fraction y la correlación entre balizas exactamente { "0.0" } con las estaciones fijas y ambas > { "0" } con ellas estimadas; las cifras de transformación inyectada del bloque de comparación mostradas iguales a una ejecución independiente de ese escenario con { "1e-14" } relativo en lugar de transcritas; una salvaguarda de que no aparece ningún datum inyectado/recuperado en ninguna parte del documento; la emisión de realización del marco lunar fijada byte a byte mediante FNV-1a-64 sobre json‖summary‖svg para tres formas de entrada, con huella tomada antes de empezar el trabajo); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (con puerta; el estricto lunar_frame_campaign_matches_spice_geometry_and_numpy sigue ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (hallazgo; decisión del fundador 2026-10-02, opción A: esta fila sigue siendo MODELLED y no toma prestado el estado de la fila separada; frente a una referencia independiente mpmath de 50 dígitos, preregistrada 804662d5, los sigmas de datum con estaciones estimadas del motor están dentro de su cota de error hacia atrás a priori, con { "9.7e-6" } de diferencia el 2024-01-01, y el umbral de { "1e-9" } estaba por debajo de lo que alcanza cualquier ruta de doble precisión, siendo la mejor, una proyección QR de NumPy, de { "5.5e-9" } de diferencia; la evidencia respalda la fila separada «Lunar frame datum covariance with the stations estimated, against 50-digit extended precision»); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fijada); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fijada)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests y tests/cislunar_arc_recovery_reference.rs (ambos límites y sus relaciones fijados sobre la cuadrícula publicada; la curva de error medida comparada con la fila de covarianza formal fila por fila con una cota de factor dos por fila y una cota de media geométrica; un CONTROL NEGATIVO — el DRO plano de seis estados — que afirma que el criterio PUEDE fallar y que el estimador sin regularizar diverge más allá de { "1e6" } km en lugar de devolver un error pequeño verosímil; invariancia de parametrización afirmada en cada prefijo con { "1e-3" } relativo; una salvaguarda sobre el texto fuente que elimina comentarios, literales de cadena y el módulo de pruebas y falla ante cualquier mención del jacobiano, la STM, el rango SVD o la maquinaria SRIF, verificada por mutación inyectando una llamada prohibida; una comprobación solo de prueba de que las diferencias finitas son iguales a las filas analíticas, de modo que la linealización se sabe correcta mientras la ruta analítica sigue ausente del estimador; determinismo afirmado byte a byte; el documento publicado de observabilidad cislunar fijado por conjunto de claves, huella canónica y línea de resumen)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análisis de formato y de marco; interpolación de Lagrange exacta en los nodos y sobre una trayectoria lineal fuera de los nodos; los elementos ICRF toman la reducción IAU { "2015" } y son iguales byte a byte a una aplicación explícita de icrf_to_iau_moon; anomalía verdadera↔media con viaje de ida y vuelta frente a una resolución directa de Kepler; archivos malformados rechazados con el motivo indicado). lunar_service::tests (con <c1/> sin establecer, el conjunto de claves y el SHA-256 del informe quedan fijados; la fila kepleriana es igual a la ejecución kepleriana independiente campo a campo; la identidad σ_required · HPL_max / σ_URE = AL, y luego una nueva ejecución DE EXTREMO A EXTREMO con el requisito calculado que alcanza el { "100" } % de disponibilidad de nivel de protección y una nueva ejecución un { "1" } % por encima que no lo alcanza; cada campo numérico emitido de los dos bloques nuevos recorrido en el JSON producido en busca de una unidad y una clase de procedencia; los fixtures confirmados contrastados con sus tablas de origen satélite por satélite; un horizonte que supera el final de una tabla rechazado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (se ejecutan los { "61" } tipos de escenario registrados, con una forma de documento cada uno: cada hoja numérica debe resolverse en una entrada del bloque de unidades de ese documento; una entrada malformada cuenta como ausente para CADA tipo de escenario, exento o no, de modo que un marcador de posición no compra cobertura; la lista de exenciones no puede superar su techo fijado, un tipo de escenario de la lista que resulte estar totalmente cubierto HACE FALLAR la puerta para que la lista no pueda rellenarse, y un tipo de escenario registrado ausente de la tabla del ejecutor hace fallar la puerta para que un paquete nuevo no pueda colarse sin examinar — lo que ocurrió, detectando los dos tipos de escenario añadidos después de empezar este trabajo; un trinquete unidireccional sobre el atraso de lo descrito pero no definido; y una comprobación de obsolescencia sobre el documento de esquema confirmado); field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for y solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: las listas vacías y el ejemplo de línea base dan el informe y el resumen por defecto byte a byte; an_added_site_never_increases_any_variance: el menor valor propio de H_after - H_before es no negativo con { "1e-9" } del mayor, cada relación de sigma después/antes es como máximo uno y ambos emplazamientos añadidos se observan; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml y scenarios/lunar-station-geodesy-with-station.toml (mismo calendario archivado y mismo bloque de campaña VLBI)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } pruebas: ambas salvaguardas sobre todo el árbol de código fuente, más fixtures de mutación que califican cada salvaguarda en ambos sentidos — el patrón F22 notificado en ambas rutas que colisionan, la corrección de secuencia atómica publicada aceptada, una corrección a medias notificada exactamente en la ruta que perdió su componente único, un identificador de archivo temporal y un directorio único heredado aceptados, un reloj de pared rechazado; una fijación no declarada notificada, una declarada aceptada, un ámbito sin exclusión rechazado, una declaración en el comentario de documentación de la prueba envolvente aceptada y que se demuestra que no se filtra a la prueba siguiente; y cada grafía de fijación — hexadecimal, decimal, cadena de resumen, longitud en bytes, recuento de bytes con nombre, archivo golden — detectada, mientras que las constantes de algoritmos, las semillas de RNG y las pequeñas comprobaciones de cardinalidad no lo son)

# text
seg-416def055790 = integrity::composed_pl::tests (monotonía, suelo P0, K(IR/2), exponentes, semicontinuidad inferior)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergencia, umbral, dominancia del estrechamiento por IR)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionada a los datos: se omite con un mensaje cuando falta la serie del BIPM); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 ronda { "3" }, prospectiva, aún no ejecutada: la Circular T { "465" } apareció el 2026-10-12, y la regla preregistrada de 1000 valores necesita emisiones hasta aproximadamente { "468" })

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (parciales analíticas de LLR/VLBI/orbitador frente a diferencia finita); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transversal frente a radial mediante crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - una selección vacía da la matriz cero, una selección única es la identidad, un par es igual a una suma elemento a elemento escrita de forma independiente, y el resultado es invariante respecto al orden de selección; adding_a_block_never_reduces_the_degeneracy_metric - monotonía bajo información añadida; radial_diversity_beats_transverse_for_breaking_the_degeneracy - el bloque del orbitador de la cara oculta eleva la métrica de degeneración más que el bloque VLBI transversal)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonía en el presupuesto; reducción del presupuesto RSS bajo un CRLB por proveedor; tolerancia de rotación resuelta en el brazo de palanca lunar; término vinculante = rotación)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris pone a cero el presupuesto; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } en las divisiones reales; ordenación de convenciones)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloque no nulo pero de rango deficiente ⇒ block_spark { "1" }, f_detect { "0" }; columnas independientes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (un par que posee todas las mediciones de un nodo = un error de desfase de reloj ∈ range(G), indetectable, con un claro salto espectral de Gram), byzantine_redundant_net_identifies_at_least_one (seis pares independientes de una sola medición ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (los casos manuales con P⊥ = I fijan f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (red autorreferencial: la tasa común está en N(GᵀWG), temporal_gauge_dim { "2" }; tras una fila externa de enlace de tasa: tasa expulsada del calibre, temporal_gauge_dim { "1" } con el desfase común subsistiendo)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (sesgo común indetectable, diferencial detectable), slope_infinity_in_range_finite_detectable (g7: pendiente ∞ para b ∈ range(G), finita para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, el calibre de 8 dimensiones es todo el espacio nulo con un salto espectral >{ "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremos abiertos y cerrados, el intervalo τ = { "400" } s de la Tabla 7-3 de G.8271.1, continuidad en cada punto de ruptura que implican las tablas; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de escenario clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (registros escritos a mano por formato: cabeceras, separadores, unidades, integración de frecuencia, canales y modos de TICC, huecos y políticas, rechazos); tests/clock_log_allantools.rs (la comparación preregistrada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) sobre los fixtures en tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — la rampa de envejecimiento discreta dentro del { "0.1" } % de (1/2)·D·t² a lo largo de un día; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relojes de satélites GPS Block IIF, { "14" } días de relojes finales del IGS: { "8" } dentro del umbral de { "1.5" }, G25 y G30 optimistas hasta aproximadamente 2x, fijado); tests/slot_timing_ocxo_holdout.rs (un OCXO medido: la predicción reservada nunca es optimista, de { "0.59" } a { "0.70" } de la superación medida; dentro de la muestra, de { "0.98" } a { "1.17" }; sin el término de frecuencia de fijación, la predicción dentro de la muestra es optimista en cada umbral); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — cada clase frente a holdover::holdover_seconds con { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exactamente tpl::timing_protection_level_ns cuando el reloj no tiene término de flicker, de fase blanca ni de recorrido aleatorio; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db y C/N0 efectivo igual a jamming::effective_cn0_dbhz con Q = 1/(R_c kappa) con una diferencia de { "1e-9" } dB, y el ancla de { "32.105" } dB de la propia prueba del tipo de escenario jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fijado en { "2.04" } y { "5.16" } veces el error nominal de longitud, por debajo de seis veces; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } segundos de arco y { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: peor caso { "3.7e-3" } de la velocidad); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: peor error angular visto desde el planeta entre { "2000" } y { "2040" }, Fobos { "5.65" } grados, Deimos { "0.38" }, Ío { "0.40" }, Europa { "1.63" }, Ganímedes { "0.22" }, Calisto { "0.27" }, Titán { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } grados); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: la raíz cuadrática media de cada error de fijación sobre su propio sigma formal en [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — cada mapa y contador es igual a un barrido con la prueba directa de elevación; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime el tiempo de ejecución y las pruebas de pares conservadas; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (solo comprobación de regresión); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regresión)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — el resultado del miembro idéntico byte a byte a la ejecución independiente y cada valor alineado igual a la serie independiente; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } semillas de un reloj de ruido blanco de frecuencia en avance en inercia tau = { "3010" } s: la media verdadera { "0" } dentro del intervalo notificado, la semianchura del intervalo dentro del { "25" }% de { "1.96" } sigma/sqrt(n), y la varianza muestral dentro del intervalo chi-cuadrado bilateral del { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; conjunto de calibración (CAP-10, preregistrado ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): sobre { "200" } conjuntos independientes el intervalo cubre la media verdadera en { "192" } (dentro de la región del { "99" } % de Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) y la comprobación chi-cuadrado se supera en { "196" }, mientras que la tolerancia de percentil de una sola semilla (p05 y p95 dentro de { "0.3" } sigma) se supera solo en { "183" } de { "200" }, NOT MET frente a los { "190" } preregistrados, una comprobación frágil ante la semilla registrada y no relajada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — una composición de un miembro lee el número independiente y el resumen del resultado)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (preregistrado fbe6c8b3 y, tras un fallo de protocolo en la ronda 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — resolución de objetivo 1-D con una diferencia de { "6.1e-15" } respecto de r* = r0 { "10" }^((m(r0) - { "3" })/20) en { "96" } evaluaciones; p3_prime_contour_target_grid_and_nelder_mead y p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — el mejor resultado del método de cuadrícula igual bit a bit a un bucle independiente de fuerza bruta de { "41" } x { "41" } sobre run_toml, con Nelder-Mead al menos igual de bueno en { "177" } y { "161" } evaluaciones; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fija el fallo registrado de la ronda 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } en { "234" } evaluaciones; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (cada escenario incluido agnóstico del sistema se ejecuta sin datos del workshop, las relaciones ionosféricas del intercambio de bandas son iguales a (f_ref/f)^{ "2" } y sus diferencias de espacio libre a { "20" } log10(f/f_ref), el jitter en el C/N0 de referencia se sitúa entre su cota de Gabor y su forma de banda ilimitada, las comprobaciones de forma E5 del escenario con parámetros del workshop son coherentes cuando ese archivo está presente, y ningún archivo fuente compila ese archivo)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (la cascada multibanda se ejecuta con cuatro paneles, los interferentes de UHF, banda L5, S y C deniegan cada uno solo su propia banda, y una ejecución de banda simple no cambia con la extensión); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: por debajo de { "0.01" } Hz y { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: con una diferencia de { "0.5" } dB respecto de -139.1 y -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (el salto de distancia de cada conmutación es igual al cambio en el error de distancia, y un ajuste corregido de { "300" } s actualizado cada { "150" } s supera un umbral de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (la forma cerrada acota un muestreo denso del cono)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (cada modelo a { "2" } mm del mensaje exacto tras decodificar, recodificación idéntica bit a bit, un bit invertido rechazado por el CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (cada modelo a { "0.1" } mm tras el bloque de texto, el CSV exacto)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: hasta { "1" } mm y la deriva hasta { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: el RMS del residuo ponderado en [{ "0.8" }, { "1.2" }] y el error por debajo de cuatro sigmas formales); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (un proxy preregistrado frente a los percentiles publicados del conjunto de datos 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: con { "3" } satélites (máscara de { "47" } grados), sin ayuda de altura y { "30" } Hz, el error 3-D p90 es de { "92.2" } m a { "20" } s y de { "870" } m a { "8" } s frente a los { "2" } m y { "10" } m publicados, de modo que ambos umbrales de factor dos son NOT MET, por el lado alto, y se afirman como no alcanzados; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) con una diferencia de { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } semillas, media de NEES promediada por ejecución en [{ "2.4" }, { "3.6" }] y al menos el { "75" }% de las épocas dentro de la banda chi-cuadrado bilateral del { "95" }%; medido con { "150" } semillas, media { "2.84" } solo con GNSS y { "2.87" } con LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: análisis del texto fuente de src, scenarios y tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: una EIRP más fuerte, un intervalo de ajuste más largo y un término de determinación de órbita mayor mueven cada uno el valor traspasado y la fijación fusionada; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: es igual al TEC oblicuo del paso en el pico con una diferencia de { "1e-9" } y su sigma es igual al ruido de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótona en cada estadístico, añadir un monitor nunca sube la puntuación, los estadísticos sanos se mantienen en { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadenas LEEF exactas, escape, gravedad, sobre RFC { "5424" }, tiempos de espera de entrega y reconexión); tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorada, condicionada a los datos por KSHANA_JAMMERTEST_DIR: la selección registrada, los recuentos reservados, los veredictos de los umbrales y el veredicto); receiver_trust::calibration::tests (marcas de tiempo, emparejamiento de ventanas y desplazamiento de zona horaria, etiquetas, bandas de guarda, exclusión, selección); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionada a los datos por KSHANA_JAMMERTEST_PLAN_DIR: recuentos de franjas por área de prueba del plan de { "2025" }, identificadores de catálogo, viaje de ida y vuelta de TOML); tests/jammertest_score.rs (un registro sintético con una caída conocida: detectada, no detectada, no evaluable, ejecución con falsa alarma, paquete firmado con la tarjeta de puntuación); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionada a los datos por KSHANA_JAMMERTEST_DIR: la ejecución registrada)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (la puerta y su oyente TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } pruebas de Node sobre salida sintética registrada); integrations/opencpn/test/relay.test.mjs ({ "5" } pruebas de Node); integrations/opencpn/test/e2e-live.mjs (el binario real hacia un consumidor TCP, ejecutado a mano y en CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (comprobaciones en C++ del analizador de PKSHT y del estado del panel); deploy/reference-build/check-units.sh y deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); pruebas unitarias de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: el umbral de prueba unitaria B4 preregistrado se conserva tal como estaba escrito, con sus fallos registrados afirmados como hallazgo F1)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, el veredicto registrado afirmado tal como se registró, hallazgo F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, solo notificado; condicionada a los datos, obtenida mediante scripts/fetch_scint_malindi.sh); pruebas unitarias de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, hallazgo F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, el veredicto registrado afirmado tal como se registró, hallazgo F1, fijado por finding_noise_free_sidelobes_exceed_the_cfar_rate); prueba unitaria de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, hallazgo F1, fijado por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, hallazgo F2, fijado por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, solo notificado)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack; compliance (hechos del paquete de normas en compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: el estado de cada prueba, incluidos los fallos L4-T1 y las cuatro pruebas de exactitud de la OMI); standards_pack::tests

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sobre números derivados por tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), frente a xval/crpa-jamming/expected.json generado por xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), frente a xval/jamming-terrain/expected.json generado por xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), frente a xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json y expected_quantiser.json

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (la compuerta del FLL)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sobre tests/fixtures/fll_handover_floor/results.csv

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (épocas lat/lon, semana/TOW y ECEF, dms rechazado, entrada hostil); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fijado, registros ASCII y binarios, CRC erróneo omitido, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de comprobación del catálogo de CRC-24Q, fusión de C/N0 y de épocas de MSM4/MSM7, hora de GLONASS y correspondencia de identificadores SBAS, CRC erróneo y otros mensajes)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes conocidos de ruido blanco recuperados con un error de hasta el { "10" } %, rechazos, el TOML se interpreta como AccelCfg); tests/receiver_trust_machines.rs (coincidencia y discrepancia de rumbo, portadora en línea, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes de paquete, broker de bucle local, broker caído contabilizado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: el formato que escribe el puente gnss_lib_py, ejecutado con receiver-trust); las pruebas en Python de los puentes son integrations/ros2/kshana_trust/test/test_bridge.py (puente con un motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (la wheel real puntúa como nominal una posición estable y como no confiable un salto de { "1.1" } km) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } y la wheel), ejecutadas con pytest, no con cargo

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Fuente: <c1/>

# text
seg-4cb1d67922ed = El registro de evidencias completo y comprobado por máquina: <b>{ "388" } filas: { "176" } VALIDATED, { "208" } MODELLED, { "4" } PARTNER</b>. Una fila solo puede ser VALIDATED con una referencia independiente externa (los tests de invariantes de la matriz lo imponen). Los mismos datos, con enlaces pulsables por fila a cada test, módulo y fixture incluido en el repositorio, constituyen el <em>Registro de validación</em> en <a1>https://kshana.dev</a1>. Véase <a2>MODELLED-RATIONALE.md</a2> para saber por qué cada fila modelada no está validada externamente.

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-b04cb81fc402 = tests/clock_library_lag1_noise_id_allantools.rs ({ "140" } casos: diez registros de ley de potencias de Kasdin, b = { "0" } a -4, como datos de fase y de frecuencia, af = { "1" } a { "64" }; alpha_int y d idénticos, peor |d alpha| { "9.6e-13" } y |d rho| { "4.8e-13" } frente a { "1e-9" }; preregistrado 2ec76864); allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (opcional, KSHANA_OSNMA_VECTORS: los { "18" } conjuntos de vectores, { "186,382" } etiquetas autenticadas, { "0" } fallidas, mínimos por conjunto, cadenas anunciadas, ADKD 0/4/12, alerta verificada, autenticación que se reanuda tras el fin de cadena, revocación de cadena y de clave y nueva clave pública; sin conexión, vectores no redistribuidos); tests/osnma_synthetic.rs (la suite de ataques: subtramas espurias de futuro lejano, caducidad y vinculación de datos, alerta y no usar, confirmación de cabecera, etiquetas ficticias, MACSEQ, conflicto de claves, KROOT obsoleta y reproducida, CMAC-AES/SHA3-256/P-521 a través del verificador); tests unitarios de osnma (respuestas conocidas de RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } y CRC-24Q)

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 frente a Stable32 hasta { "1e-4" }); allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (Cs 5071A real frente a máser de hidrógeno, { "556 990" } puntos, { "16" } factores de promediado frente a Stable32 hasta { "1e-3" }; condicionado a datos mediante scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (PHASE.DAT de Stable32, { "139" } factores de promediado, OADEV/MDEV/TDEV hasta { "1e-3" }; condicionado a datos mediante scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV sobre el conjunto de datos LCG de 1000 puntos de NIST SP { "1065" } §{ "12.4" }, { "6" } + { "6" } factores de promediado frente a allantools { "2024.06" } hasta <{ "1e-9" }); allan::tests (seguimiento en forma cerrada de FM blanco; identidad TOTVAR=ADEV en m={ "1" }; invariancia de Theo1/TOTVAR frente a desfase de fase/frecuencia; pendiente -1/2 de FM blanco)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE sobre la serie de fase LCG hermética de 1000 puntos de NIST SP { "1065" } §{ "12.4" }, { "9" } factores de promediado m={ "1" }..256 frente a mtie de allantools { "2024.06" } hasta <{ "1e-9" }, observado ≤{ "4e-15" }); allan::tests (pico a pico derivado a mano; monótona no decreciente en τ; a·m exacto sobre una rampa pura)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV sobre la serie de fase LCG hermética de 1000 puntos de NIST SP { "1065" } §{ "12.4" }, { "8" } factores de promediado m={ "1" }..200 frente a mdev/tdev de allantools { "2024.06" } hasta <{ "1e-9" } relativo, más la identidad τ/√{ "3" } sobre la serie real); allan::tests (pendiente −1/2 de FM blanco; caso pequeño de MDEV derivado a mano)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (σ_y(τ) del reloj de pinzas de ⁸⁸Sr de Norcia et al., { "8" } tiempos de promediado { "0.92" }–{ "117.76" } s incorporados literalmente bajo CC-BY-4.0: NNLS reconstruye la curva con ~{ "10" }% de RMS / ≤{ "21" }% en el peor punto; el √q_wf = { "4.33e-16" } recuperado coincide con el 4.7e-16/√τ publicado; q_rw > { "0" } suelo de ruido rojo medido)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } casos de geometría real, Celestrak GPS+Galileo e IGS SP3: peor |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m frente al TOL_PL del ADD de { "0.05" } m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (las brechas de sigma uniforme, fijadas); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (IGS ABMF real 2018-05-13, { "288" } épocas, { "2016" } casos con sesgos inyectados de { "10" } a { "100" } m: 2016/2016 decisiones de detección y 801/801 de exclusión idénticas, HPL/VPL de pendiente dentro de { "2.7e-12" } m frente a { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } pares de época de usuario sobre difusiones WAAS reales, el mismo conjunto protegido, peor |dVPL| { "7.1e-6" } m y |dHPL| { "1.6e-5" } m frente a { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (el hallazgo de L5, fijado); tests/igs_real_data.rs y tests/araim_dual_real_data.rs (verosimilitud sobre SP3 de IGS reales y geometría de Celestrak, conservados como comprobaciones de regresión, no como referencias independientes)

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } vectores de verificación de AIAA, peor caso { "4.12" } mm); tests/sgp4_crate_comparison.rs (crate sgp4 independiente)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } épocas = { "11" } casos × { "25" } estados horarios, LEO+GTO, frente a DormandPrince853 de Orekit { "12.2" }; niveles conservadores T1–T5, peor |Δr| { "0.08" } m en { "24" } h; nivel de arrastre caracterizado en { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } geometrías a través del borde de la sombra, { "884" } en penumbra, de LEO a GEO, declinación solar { "0" } y +-23.44 grados, { "8" } acimutes: peor |dnu| { "7.41e-9" } para WGS-84 y { "2.24e-9" } para la línea base esférica; los cocientes WGS-84 y esférico de Orekit difieren hasta { "0.98" }, de modo que el conjunto discrimina el achatamiento); tests unitarios de srp_shadow y propagator

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } geometrías de órbita Galileo, { "7" } casos solares que incluyen las distancias de perihelio y afelio, { "100" } actitudes aleatorias; suma de placa plana, peor caso { "2.05e-15" } relativo en { "1056" } casos; de extremo a extremo con la propia actitud y presión de Orekit, peor caso { "2.39e-15" } en { "747" } casos de pleno sol, mientras que las constantes de presión por defecto de Orekit difieren en >= { "4.43e-3" }, de modo que la comparación discrimina la constante; matriz de guiñada nominal, peor caso { "1.89e-15" }; parcial del factor de radiación, peor caso { "1.35e-15" }; parciales por panel, peor caso { "4.12e-13" } relativo frente a diferencias centrales de Orekit en { "10836" } casos de panel; aceleración y parciales de ECOM2, peor caso { "1.74e-15" }); tests unitarios de srp_boxwing (límites en forma cerrada, parciales por diferencias finitas); tests de conexión de propagator y precise_od

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } puntos de rejilla, de { "90" } a { "1000" } km, { "4" } latitudes, { "2" } horas locales, { "3" } días, actividad baja/moderada/alta: densidad dentro de { "1.866e-6" } relativo y temperatura dentro de { "1.97e-4" } K respecto de pymsis; idéntico bit a bit al port en C; los { "17" } casos de prueba publicados en C, { "187" } valores dentro de { "0.496" } unidades de la 7.ª cifra significativa); tests unitarios de nrlmsise00

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } casos x { "25" } estados horarios en { "24" } h, circular de { "51.6" } grados, { "400" } km con actividad baja/moderada/alta y { "300" } km: peor |dr| { "0.0303" } m y |dv| { "3.36e-5" } m/s frente a { "3.3" } a { "141.8" } km de desplazamiento por arrastre, peor error/umbral { "0.003" }; el control de densidad exponencial falla por { "119.1" } m); tests unitarios de forces y propagator (por defecto, idéntico bit a bit; el nivel evalúa el port en el punto geodésico fijo a la Tierra)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (casos ecuatoriales E400, E300 y E250x600 en J2000.0, { "25" } estados horarios en { "24" } h: el desplazamiento inducido por el arrastre concuerda con el de GMAT hasta como máximo { "0.016" } del umbral { "0.5" } m + { "1e-3" }|D| frente a { "21.5" } a { "143.9" } km de desplazamiento; un cambio de +{ "1" } % en Cd*A/m alcanza { "9.83" } veces el umbral; se informa del caso inclinado I400, { "10.4" } % de diferencia, la diferencia de definición de altura declarada)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } de { "21" } ondas concuerdan con el modelo A2 publicado: peor caso { "0.00050" } cm, { "0.050" } grados frente a umbrales de { "0.0006" } cm, { "0.1" } grados); tests/tides_iers.rs (banda de amplitud de S2)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } casos x { "25" } estados horarios en { "24" } h: EGM2008 8x8 y 70x70 en LEO de { "45" } grados, polar de { "89.9" } grados, heliosíncrona de { "98.2" } grados, GTO, y 70x70 con Sol/Luna y SRP; peor |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; los controles negativos fallan por { "6168" } m (Tierra congelada) y { "20871" } m (solo zonal)); tests unitarios de propagator (identidad del límite zonal hasta { "1e-12" }, marco CIO bit a bit frente a precise_od, integral de Jacobi mantenida hasta { "1e-9" } en { "6" } h)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } pasos individuales: estado dentro de { "5.55e-15" } relativo, derivada FSAL { "3.46e-15" }, salida densa { "1.99e-14" }, decisiones de aceptación/rechazo idénticas; { "3" } ejecuciones completas con rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } en { "5" } periodos, Arenstorf en un periodo): paso inicial idéntico, pasos aceptados 502/501, 390/390, 298/298 y evaluaciones 6025/6013, 5497/5497, 4285/4285 frente a SciPy, estados finales dentro de { "2.95e-13" } relativo (dos cuerpos) y { "1.58e-12" } (Arenstorf), salida densa dentro de { "9.5e-13" }; precisión frente a la solución exacta de Kepler con mpmath igual a la de SciPy (LEO { "8.44e-5" } m, periodicidad de Arenstorf { "1.475e-9" })); tests unitarios de integrator y propagator ({ "24" } h de dos cuerpos frente a Kepler exacto por debajo de { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } puntos de rejilla, e de { "0" } a { "0.999999" }, M en [-pi, pi] hasta { "1e-12" }: peor |E - E_ref| { "0.898" } eps|E| frente a un umbral de { "8" } eps|E|; { "9" } puntos de M arrollada en el peor caso a { "0.013" } de su umbral; no se necesitó ningún paso de pulido de Newton en ninguno de los { "414" } puntos; envoltorio idéntico bit a bit); tests unitarios de kepler

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (los recortes de grado 20 se ejecutan siempre: peor |dg|/|g| { "9.7e-16" }, relativo a la perturbación { "3.4e-11" }; GMM-3 g/o { "120" } en toda la esfera { "3.7e-15" } / { "6.3e-12" } y GL0660B g/o { "660" } con |lat| <= { "60" } grados { "5.0e-14" } / { "1.0e-10" }, condicionado a datos; cabeceras y coeficientes seleccionados iguales a los productos PDS publicados, recuentos de registros { "7380" } y { "218790" }); tests unitarios de gravity_pds

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } escenarios: { "6" } LEO/MEO/excéntrico/de 3–4 estaciones sin ruido + { "2" } con σ={ "5" } m, frente a Orekit { "12.2" }; peor |Δr| por lotes { "1e-3" } m / |Δv| { "1e-6" } m/s, |Δr| secuencial { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } tramos en { "8" } épocas { "2020" }–{ "2027" } frente a ANISE DE440; peor |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m a hasta { "2.5" } AU)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } casos de SV-época: GPS + Galileo + BeiDou-MEO, { "12" } SV × { "7" } desfases, frente a eph2pos de RTKLIB; peor |Δ| por eje { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } casos de SV-época fuera de nodo / { "6" } satélites frente a peph2pos de RTKLIB; peor |Δ| por eje { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (mapa IONEX sintético incluido en el repositorio frente a la referencia por fórmula: { "20 075" } nodos exactos, interpolación con |Δ| máx. { "3.5e-13" } TECU; condicionado a datos en KSHANA_IONEX_CODE_GIM_DIR, el recorte de latitudes del GIM final real de CODE de 2018-05-13 obtenido por fetch.sh con un SHA-256 fijado: nodos exactos, interpolación con |Δ| máx. { "3.6e-13" } TECU en { "15 795" } muestras, TEC oblicuo { "5.1e-13" } TECU; iontec de RTKLIB v2.4.2-p13 condicionado a datos en { "6885" } puntos de consulta, ejecutado el 2026-10-13: |Δ| máx. { "3.6e-13" } TECU en ambos modos de tiempo, umbral { "1e-5" } preregistrado); ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (estaciones IGS WTZR como base / WTZZ como móvil, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } épocas, fijaciones al { "100" } % desde las { "00" }:{ "10" }, mediana del error de línea base fija { "4.5" } mm, p95 { "5.5" } mm; primeros { "10" } min con solución fija { "2.6" } mm frente a flotante { "13" } cm); rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } épocas: Kshana menos la desviación típica de IGS { "0.075" } ns, umbral { "0.20" }; media -0.659 ns, umbral { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (estación IGS WTZR, 2025-02-24 00-06 h, { "30" } s, reservada fuera del desarrollo: horizontal en la última época { "1.5" } mm, vertical −{ "2.9" } cm; 04-06 h 240/240 épocas dentro de { "0.10" } m en 3-D, p95 { "6.7" } cm; p95 solo con código { "1.70" } m; RMS de ZTD condicionado a datos { "1.7" } cm frente a EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: el PPP de RTKLIB v2.4.2-p13 con las mismas entradas concuerda dentro de { "0.05" } m en 240/240 épocas, { "9.7" } mm en la última, en el tercer registro tras dos ejecuciones cuya configuración de RTKLIB carecía de la marea sólida y situaba la antena en la ranura de la base, ambas registradas como hallazgos; el umbral de paridad de SPP no se alcanzó, mediana de { "1.085" } m frente a { "0.50" } m; gLAB { "6.0.0" } en su primera ejecución registrada, línea de comandos de la enmienda { "4" }: PPP dentro de { "0.05" } m en 240/240 épocas y { "5.0" } mm en la última, umbral de SPP no alcanzado, mediana de { "1.187" } m, un hallazgo: las soluciones SPP de las dos herramientas de referencia difieren entre sí en una mediana de { "0.852" } m, de modo que ese umbral se fijó más estricto que la concordancia entre herramientas)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (BRD400DLR_S RINEX { "4.02" } de IGS frente a BRDM00DLR_S RINEX { "3.04" } de 2026-07-19, tramo 00-02 h: registros G { "37" } / E { "478" } / C { "72" } emparejados en ambos sentidos, todos los campos idénticos, posición en Toe { "0" } m; día completo condicionado a datos: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (SP3 final de IGS de { "15" } min de 2025-02-24 frente a los relojes finales de IGS de { "30" } s, { "32" } satélites GPS: mediana de |Δ| en nodos { "2.6e-13" } s; { "3038" } registros de punto medio con RMS { "0.121" } ns, p95 { "0.265" } ns; manteniendo el nodo en su lugar { "4.24" } ns de RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (cargadores sintéticos y tests de brazo de palanca con plataforma giratoria siempre; condicionado a datos en KSHANA_KFGINS_DIR, ejecutado el 2026-10-13 con el conjunto de demostración de KF-GINS: RMS horizontal / vertical { "0.0109" } / { "0.0090" } m frente a la trayectoria de referencia, frente a { "0.0111" } / { "0.0083" } m de KF-GINS en C++, los seis umbrales preregistrados se mantuvieron; con el brazo de palanca desactivado { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } tests: referencia independiente y escenarios, bytes de exportación fijados, lectores NMEA y LLH, corte ECEF de cuatro columnas, HALLAZGO de la ejecución 1 sobre el CSV de ancho completo, rejilla de filas de { "10" } Hz)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (perfiles estático/giro/coning, { "30" } épocas cada uno, frente a NaveGo: actitud idéntica bit a bit { "0" } rad; velocidad/posición dentro de cotas analíticas con nombre)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (la síntesis GRS80 reproduce Somigliana hasta { "3.5e-12" }; el mapa real de perturbación de EGM2008 de ICGEM es físico)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } casos: { "12" } épocas de enero de { "2025" } x los puntos L1 y L2, dos estados iniciales de halo austral de L2 y uno de DRO de la API Three-Body Periodic Orbits del JPL y un estado genérico; peor posición { "1.8e-7" } m frente a { "1" } mm, velocidad { "1.2e-9" } m/s frente a { "1e-6" } m/s; inversa { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Mercurio, Venus, la Tierra y la Luna en 2026-01-01, 2030-06-15 y 2040-12-31: peor caso { "3.3e-5" } m y { "1.0e-11" } m/s frente a { "1" } mm y { "1e-6" } m/s; el bloque del kernel y las etiquetas, exactos); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (de la Tierra al baricentro de Marte, { "16" } salidas 2026-09-01..2027-01-29 x { "19" } llegadas 2027-06-01..2028-02-26: { "304" } celdas finitas en ambos lados, peor C3 { "2.5e-14" } y V-infinito { "2.6e-14" } relativo frente a { "1e-8" }, la misma celda de C3 mínimo, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (de la Tierra al baricentro de Marte, salidas 2026-09-15..2027-01-15 x llegadas 2027-05-01..2028-03-01, Tipo I/II x C3 mínimo / V-infinito mínimo: peor objetivo { "8.7e-13" } relativo, fechas dentro de { "1e-5" } días, otra magnitud dentro de { "2.5e-7" } relativo, frente a umbrales preregistrados de { "1e-7" }, { "0.01" } días y { "1e-4" }; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (referencia publicada secundaria NASA/TM-2010-216764 Tabla { "2" }: Tipo II C3 mínimo { "9.182" } frente a { "9.144" } y Tipo II V-infinito mínimo { "2.564" } frente a { "2.565" } MET; Tipo I C3 mínimo { "10.535" } frente a { "11.11" }, -5.18 %, NOT MET y afirmado como no alcanzado, con la referencia independiente de la biblioteca coincidiendo con Kshana)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } casos: { "300" } aleatorios en 3-D, { "18" } cerca de { "180" } grados, { "24" } cerca del tiempo mínimo de M = { "1" }..3, { "40" } heliocéntricos; { "1058" } soluciones; recuentos y orden de ramas iguales; velocidades dentro de { "1e-8" } relativo, peor caso { "1.6e-13" }; dentro del { "1" } % del tiempo mínimo dentro de { "1e-6" }, peor caso { "7.5e-15" }; una guarda interna de aterrizaje de Kepler hace que toda solución aterrice dentro de { "4.2e-12" } de |r2|, salvo un hallazgo fijado en un arco de e = { "0.994" }, una limitación de kepler_universal, no del solucionador)

# text
seg-67d3c2e5a311 = maneuver (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } transferencias frente a izzo2015 de lamberthub; peor |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado de extremo a extremo; vectores SOFA/ERFA)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } instantes UTC: seis alrededor de cada uno de los { "27" } segundos intercalares de 1972-2016, dos fijos, { "60" } con semilla repartidos en 1972-2026; dtf2d, utctai y taiutc, cada uno dentro de { "1e-6" } s, peor caso { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } fechas UT1/TT en dos partes de 1980-2050, incluidos saltos de +{ "1" }, +{ "10" }, +{ "50" } us en dos fechas: gmst82 dentro de { "1e-12" } rad, peor caso { "0" }; elementos de GCRS a ITRS dentro de { "5e-12" }, peor caso { "2.7e-14" }; rotación en +1/+10/+{ "50" } us dentro de { "1e-13" } rad de ERFA, peor caso { "1.1e-14" } rad, donde la ruta de f64 único no detecta en absoluto los saltos de +{ "1" } y +{ "10" } us); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } épocas TT 1950-2100, dX y dY hasta { "0.5" } mas: elementos de precesión dentro de { "1e-13" }, peor caso { "0" }; TEME a GCRS dentro de { "5e-10" } rad, peor caso { "1.10e-10" } rad; CIO con desfases dentro de { "1e-13" }, peor caso { "0" }; desfases nulos idénticos bit a bit a cio::gcrs_to_cirs_matrix)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } instantes UTC: cuatro alrededor de cada uno de los { "15" } inicios de una expresión TAI-UTC 1960-1972 y { "60" } con semilla repartidos en 1960-1971; dtf2d, utctai y taiutc, cada uno dentro de { "1e-6" } s, peor caso { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (los { "224" } instantes de la fila de { "1972" }+ sin cambios bit a bit)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } casos: los { "4" } registros GLONASS del archivo de difusión real de IGS MGEX de 2013-01-01 x { "73" } desfases dentro de +/-900 s; reloj dentro de { "1e-14" } s, peor caso { "0" } s; posición dentro de { "0.01" } m, peor caso { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (tramo { "1" }: { "4432" } posiciones TEME de los { "232" } conjuntos de elementos incluidos en el repositorio frente a python-sgp4 { "2.24" }, peor caso { "6.1e-8" } m, umbral { "1" } cm; tramo { "2" }: { "108" } instantes, { "23" } de ellos con parámetros de orientación de la Tierra y uno en el último segundo de un día con segundo intercalar, frente a ERFA: GCRS -> ITRS peor caso { "2.9e-6" } mas, umbral { "0.1" } mas; TEME -> ITRS peor caso { "0.41" } mas, umbral { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

# text
seg-5235d736ac3e = navsignal (CodeFamily)

# text
seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

# text
seg-6f9de921ca86 = orbit (dop)

# text
seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } geometrías, de bien condicionadas a casi singulares)

# text
seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

# text
seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } casos de elevación/acimut/hora local, dos conjuntos de coeficientes)

# text
seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

# text
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } casos: CDF/cuantil de χ², CDF/cuantil normal, CDF de χ² no central, pbias en los intervalos de P_fa/P_md/redundancia)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq): biblioteca independiente (Cephes/Boost), un algoritmo distinto de la serie de gamma incompleta de Kshana; coincidencia hasta ≤{ "1e-6" } rel. Solo el núcleo. La <em>asignación</em> del presupuesto de P_HMI de ARAIM MHSS ya no carece de una referencia independiente numérica publicada: el propio ejemplo resuelto del Subgrupo Técnico ARAIM del WG-C respalda ahora la fila aparte "ARAIM MHSS protection levels against published reference vectors", con coincidencia en el TOL_PL propio de la referencia = { "5e-2" } m; por tanto, el alcance de esta fila es el núcleo estadístico y aquella fila recoge la asignación (véase docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } épocas reales de EGNOS: HPL contrastado directamente, d_U vertical comprobado sin factor K)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } conjuntos de datos, { "24" } umbrales; recuentos exactos + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (ESA OPS-SAT real, el AUC reproduce scikit-learn hasta { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } casos sobre la partición de test real de OPSSAT-AD: confusión completa en el punto de operación + Pd/Pfa/precisión/F1 frente a scikit-learn, exactos en enteros)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² con grados de libertad de operación ≥ { "48" }; Q de van Loan)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } puntos globales × altitudes frente a ppigrf en la época { "2025.0" }; peor |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } casos frente a norm.cdf/ppf de scipy { "1.17" } + roc_auc_score de scikit-learn; peor |Δ| AUC { "6.9e-8" }, fallo mínimo detectable { "1.3e-8" }, AUC empírico { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } casos frente a scipy { "1.18" } / numpy { "2.4" }: { "61" } τ-b de Kendall hasta { "2e-16" }, ordenación exacta, media de Dirichlet + IC por percentiles hasta { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (tabla de Índice Aleatorio de Saaty { "1980" } n={ "1" }..10 EXACTA; vector de prioridad + λ_max + CR frente a eig de SciPy/LAPACK en un caso consistente de { "3" }×{ "3" } y en casos inconsistentes de { "3" }×{ "3" } / { "4" }×{ "4" }, con coincidencia hasta <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (puntuaciones WSM + ordenación) y tests/mcda_wpm_reference.rs (puntuaciones WPM + ordenación), cada uno frente a pymcdm hasta <{ "1e-9" } sobre una matriz de decisión fija de { "4" }×{ "3" } de beneficio/coste

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (coeficientes de cercanía + ordenación frente a pymcdm hasta <{ "1e-9" } sobre una matriz fija de { "4" }×{ "3" } de beneficio/coste)

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (índice Q + ordenación frente a pymcdm hasta <{ "1e-9" } sobre una matriz fija de { "4" }×{ "3" } de beneficio/coste)

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (flujo neto de superación + ordenación, criterio usual, frente a pymcdm hasta <{ "1e-9" } sobre una matriz fija de { "4" }×{ "3" } de beneficio/coste)

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (matrices de concordancia, discordancia y dominancia elemento a elemento + conjunto núcleo/dominado frente a pyDecision hasta <{ "1e-9" } sobre un conjunto de datos fijo de { "4" }×{ "3" } todo de beneficio)

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (preferencias WASPAS + ordenación) y tests/mcda_moora_reference.rs (puntuaciones MOORA + ordenación), cada uno frente a pymcdm hasta <{ "1e-9" } sobre una matriz de decisión fija de { "4" }×{ "3" } de beneficio/coste

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (grados de utilidad + ordenación frente a pyDecision hasta <{ "1e-9" } sobre una matriz fija de { "4" }×{ "3" } de beneficio/coste)

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } casos de latencia determinista EXACTOS frente a una referencia independiente de primer paso; { "8" } casos de ARL₁, Monte Carlo con 60k ensayos frente a la aproximación de Siegmund + tablas publicadas de Montgomery)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } casos frente a scipy { "1.18" }: { "12" } varianzas de deriva frente a Q₀₀ de Van Loan con linalg.expm, peor error relativo { "1.1e-15" }; { "7" } inversiones de holdover frente a optimize.brentq, peor error relativo { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } casos: { "14" } frente a inv_simpson de scikit-bio + { "3" } de contorno con cero fijado; peor |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-d4dabd188012 = tests/skyline_orekit_oracle.rs (skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered: { "1173" } ángulos de observación en seis emplazamientos y cuatro épocas, seis tablas de máscara, { "142" } conjuntos visibles; peor |d el| { "1.3e-13" } grados y |d az| { "2.3e-13" } grados frente a { "1e-9" }, peor |d mask| { "1.1e-12" } grados frente a { "1e-9" }, conjuntos visibles idénticos sin ninguno en la banda de frontera de { "1e-6" } grados, peor DOP { "3.3e-13" } relativo y cofactor { "6.6e-13" } de la escala de la matriz frente a { "1e-9" }; preregistrado e4b9d912); skyline::tests (table_interpolates_linearly_between_rows; table_wraps_through_north_without_a_seam); tests/skyline_scenarios.rs (every_wired_scenario_is_byte_identical_to_the_0_35_0_release)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-48069ecceb4a = tests/ellipse_numpy_oracle.rs (ellipse_and_cofactor_agree_with_numpy_as_pre_registered: { "270" } casos, los { "142" } conjuntos visibles incluidos en el repositorio de la comparación de skyline con un único reloj común y con un reloj por sistema; peor eje { "5.1e-13" } relativo y orientación { "5.3e-12" } grados, ninguno casi circular, cofactor { "1.0e-12" } de la escala de la matriz, frente a { "1e-9" } y { "1e-6" } grados; preregistrado 0bbeeaee); geometry::tests (ellipse_of_an_analytic_two_by_two_case)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal: los 10 primeros chips de PRN { "1" }–{ "9" } reproducen exactamente los octales de la Tabla 3-Ia de IS-GPS-200 1440/1620/1710/1744/1133/1455/1131/1454/1626; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (identidad UKF==KF lineal; deriva en interrupción; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } casos frente a filterpy { "1.4.5" }: EKF lineal débil/fuerte + posteriores de PNT acoplado hasta ≤{ "2.4e-12" }; ejecución de UKF de 40 épocas, peor |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (solución débilmente acoplada de NaveGo v1.4 sobre el recorrido real de IMU/GNSS Ekinox de NaveGo: RMS horizontal 0.912x, vertical 0.940x, RMS de innovación de posición 0.861x del de NaveGo, innovación normalizada media { "0.395" }; umbrales 1.2x, 1.2x, 1.2x y { "1.5" } fijados antes de la ejecución)

# text
seg-e53182bd8d30 = cr3bp::tests (STM frente a diferencias finitas); tests/cislunar_mission_analysis_reference.rs ({ "5" } miembros NRHO L2-S del JPL: los { "9" }:{ "2" } + { "4" } vecinos; peor |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, periluna { "0.7" } km en unidades de longitud del JPL)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values en la CI sobre diez nodos citados de ICGEM; egm2008_n70_gravity_anomaly_sa_matches_icgem sobre las rejillas completas de 0.25 grados obtenidas de Chad 9-15N 19-25E y Death Valley 35-38N 242-245E, { "794" } nodos: RMS { "1.3e-8" } y { "2.6e-8" } mGal, máx. { "2.9e-8" } mGal frente a umbrales preregistrados de { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief: la decimación de 6 segundos de arco, incluida en el repositorio, de la tesela SRTM v3 N36W117 de dominio público sitúa la Cuenca de Badwater, el punto más bajo de Norteamérica, a −{ "78" } m dentro de la banda de levantamiento [−{ "95" },−{ "70" }] m y lee el verdadero relieve de ~{ "2.2" } km de la cordillera oriental de la tesela; además, sobre dos recortes literales de 361x361 de 1 segundo de arco de N36W119 y N36W117 incluidos en el repositorio, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m en la banda de [{ "4380,4430" }] m alrededor del levantamiento de { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m en [−{ "95" },−{ "70" }] m) y gdal_cross_check (el nodo más cercano coincide exactamente con gdallocationinfo de GDAL { "3.8.4" } sobre las teselas completas en los { "8" } puntos preregistrados, xval/srtm-ungate/; además de las referencias independientes de punto medio bilineal construidas a mano y de analizador con fixtures sintéticos)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } estados / { "2" } fixtures descodificados byte a byte por el analizador independiente <c1/>, Δ de pos/vel = { "0" }); oem::tests (analizar un OEM de una herramienta externa con palabras clave/comentarios/covarianza adicionales, ida y vuelta escritura→lectura del estado completo, se toleran pos+vel+accel, se rechazan el de solo posición y el que carece de metadatos obligatorios, ida y vuelta de escenario de alta fidelidad + ingesta externa); dominance_demonstrators (alcanzable + reproducible + ida y vuelta exacta + MODELLED-not-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Analizador CCSDS-502 independiente de terceros <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>): una base de código distinta que descodifica byte a byte el OEM EME2000/UTC emitido por kshana ({ "24" } estados en { "2" } fixtures, Δ de pos/vel = { "0" }) y cuyo lector estricto confirma los tokens de metadatos; el analizador de kshana concuerda igualmente con él sobre un OEM externo incorporado. Dos hallazgos honestos de interoperabilidad (la biblioteca oem rechaza la convención de varios segmentos por satélite de kshana y sus líneas de covarianza de varias entradas) están documentados en el test; por tanto, esto valida el intercambio de un solo objeto ajustado a la norma, no el ajuste a la norma CCSDS-502 completo de cada variante de kshana

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (radio angular de { "64" }° a { "700" } km + disminuye con la altitud, nadir→cenit/distancia cero, horizonte→ε=0/ángulo central máximo, errores más allá del horizonte, la franja crece con el FOV / el GSD con la altitud, separación de nodos de ~{ "2750" } km, escenario reproducible/MODELLED + rechazo de entradas erróneas); dominance_demonstrators (alcanzable + reproducible + radio angular de { "64" }° + MODELLED-not-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (altitudes de 400-1500 km, inclinaciones de 1-98 grados, semi-FOV de 7.5-50 grados, IFOV de 10-50 microrad, giro de { "30" } y { "89" } grados: toda magnitud dentro de su umbral preregistrado, indicador de contigüidad 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regresión tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (los bits de la cabecera coinciden con la disposición de CCSDS-133, la codificación→descodificación de ida y vuelta conserva todos los campos, se rechazan los valores fuera de rango/truncados); tests/ccsds_space_packet_reference.rs ({ "33" } casos frente a spacepackets { "0.32.0" }, incluidas { "12" } comparaciones de paquete completo; cero octetos discordantes)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, control de errores de paquete, segmentación y reensamblado, descodificación de flujos)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (cinco umbrales preregistrados: CRC, códigos de tiempo, flujos, huecos y orden, PUS TM; cero discrepancias); space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (inventario, evaluación, identidad de bits y de bytes, conversión de épocas de OEM; cuatro comprobaciones de mutación planificadas lo ponen en rojo)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (inventario, evaluación en ambos sentidos, identidad de bytes); spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 Orekit lee { "33" } archivos de Kshana, L2 Kshana lee { "31" } archivos de Orekit, L3 { "135" } rotaciones de registro; hallazgos fijados); adm::tests; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 Orekit lee { "30" } archivos de Kshana, L2 Kshana lee { "25" } archivos de Orekit; hallazgos fijados y afirmados como recurrentes); odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (el par de gradiente de gravedad se anula para un cuerpo simétrico, crece a menor altitud, lineal en ΔI, suma en cuadratura RSS, las fracciones de varianza suman 1); tests/attitude_gg_torque_reference.rs ({ "20" } casos frente a un par de gradiente de gravedad independiente de tensor completo T=(3μ/R³)(n̂×(I·n̂)) maximizado numéricamente sobre la actitud con linalg de Hipparchus { "3.1" }; peor error relativo { "6e-15" }, + banda publicada de Wertz/Sidi de O({ "1e-6" }) s⁻²); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } casos frente al GravityGradientEffector de Basilisk { "2.9.1" }: pico en la actitud de { "45" } grados dentro de { "1e-12" } relativo, peor caso { "2.1e-15" }; ningún par por encima del pico en { "2000" } actitudes aleatorias por caso, { "3" } tensores de inercia diagonales y { "5" } generales, { "5" } altitudes)

# text
seg-49b30066ff1b = passes::tests (cruce de interpolación lineal y seguro ante degeneración, pasadas de polar→latitud media, máscara más alta ⇒ igual o menor número); tests/ground_station_pass_prediction_reference.rs ({ "22" } escenarios / { "129" } pasadas frente a ElevationDetector de Orekit { "12.2" }; peor |Δ| de AOS/LOS { "0.0000" } s, elevación máxima { "0.0014" }°, acceso total { "0.0001" } s, mismo número de pasadas)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } casos, { "1210" } pasadas: AOS/LOS dentro de { "3.4e-6" } s, umbral { "5" } ms; elevación máxima dentro de { "5.5e-7" } grados, umbral { "1e-3" } grados; { "8979" } direcciones aparentes dentro de { "8.8e-7" } grados, umbral { "1e-4" } grados); tests/earth_orbit_path_sgp4_erfa_oracle.rs (la trayectoria); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (hallazgo de la ronda 1, fijado; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (forma de la pérdida en el espacio libre, cierre de la ecuación del enlace); tests/one_way_link_budget_reference.rs (DCT de banda X de Galileo de DESCANSO/JPL reproducido de extremo a extremo + { "6" } casos de FSL de ITU-R P.525 en los centros de banda S/X/Ka de la DSN; peor |ΔFSL| { "4.6e-3" } dB, |Δportadora| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (tasa en forma cerrada; ida y vuelta); tests/lunar_coordinate_time_reference.rs (términos de autopotencial y de tasa secular de LTC frente a los valores publicados de Ashby y Patla { "2024" } + velocidad geocéntrica de la Luna frente a JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests y realtime_frame_eop::tests (los tres componentes llevan conjuntos de épocas iguales, idénticos elemento a elemento y estrictamente ascendentes sobre ambos extractos reales del IERS; el conjunto conjunto se reduce a la intersección cuando los dos bloques del Boletín B discrepan realmente, y un horizonte sin filas compartidas se omite en lugar de rellenarse con ceros; la ausencia de contenido de la tabla de predicho frente a final se declara en el documento en lugar de insinuarse con un campo ausente; una segunda edición real la rellena, contrastada fila por fila; una edición posterior ausente es un error, no una tabla vacía silenciosa); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tablas { "3" }, { "4" } y { "6" } del escenario de extremo a extremo: conjuntos de épocas exactos, estadísticos de UT1 y del polo dentro de { "1e-9" }, la combinación en la Luna dentro de { "1e-5" } de una rotación ERFA completa, el estado declarado de cada caso de predicho frente a final); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } a { "1.100" } a { "1" } a { "90" } días); censo de filas: tests/embedded_eop_vintage_astropy_preregistered.rs (fila de entrada sin conexión); regresión de la ronda 1: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (seis criterios exactos: los bytes del extracto; { "174" } filas; recuentos por edición y listas completas de MJD 30/54/90; indicador P tanto en el movimiento polar como en UT1 de cada fila predicha; el censo de la ejecución por defecto sin más; cada fila predicha igual al Boletín A del IERS Vol. XXXIX N.º { "039" } dentro de su último dígito impreso, peor caso { "5.0e-5" } segundos de arco y { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (fijación de regresión del antiguo extracto de 32 filas con el clasificador de indicadores: { "20" } finales, { "12" } rápidas, { "0" } predichas); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (el hallazgo de la ronda 1, conservado); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } retardos en { "25" } épocas cercanas a J2000 sobre DSS-14, DSS-43 y DSS-63: retardos dentro de { "1" } ps, peor caso { "0.06" } ps; parciales de baliza en el marco del cuerpo dentro de { "1e-6" }, peor caso { "7.4e-9" }; parciales de estación ITRF93 dentro de { "1e-6" }, peor caso { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (contraste cruzado de evaluación del kernel); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } estados de de440s.bsp y { "200" } rotaciones MOON_PA_DE440 en { "200" } épocas de 1849-2150 y pares aleatorios de cuerpos obtenidos del propio hash del commit de preregistro, frente a SPICE y ANISE sobre kernels recortados idénticos bit a bit a los de NAIF: la peor diferencia es el { "0.6" } % de su umbral, { "1.95e-3" } m en absoluto); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (lo mismo sobre los archivos completos de NAIF, con SHA-256 comprobado; condicionado a datos); tests/naif_kernel_reader_check.rs (salvaguarda de ingeniería, no evidencia); naif_kernel::tests; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } tests de biblioteca: la división es aditiva y reconstruye dy; una covarianza de modo común produce un nivel de protección de modo común positivo, mientras que una covarianza solo de paridad produce uno casi nulo; el proyector anula range(G)); tests/lunar_common_mode_integrity_reference.rs (la división del motor frente a un cálculo independiente con numpy sobre entradas idénticas byte a byte en la muestra de 366 épocas incluida en el repositorio, error relativo Y absoluto < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } casos con paridad sobre la geometría de 8 satélites y un subconjunto de 6 satélites en ambos pares reales entre efemérides: blind_dx, residuo y normas dentro de { "1e-12" } de |dy|, peor caso { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (recupera la verdad simulada; VLBI restablece la observabilidad 3-D de la estación; determinista); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } geometrías × { "16" } parámetros, { "31" } observaciones cada una, frente a Levenberg-Marquardt de Orekit { "12.2" } / Hipparchus sobre observaciones idénticas; estado recuperado, peor |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (seis redes, una de ellas sin VLBI: pasos de Gauss-Newton dentro de { "4.3e-11" }, sigmas formales dentro de { "1.9e-11" }, errores de estación iguales; con las entradas de matemática portable de { "0.36" }, { "2.4e-11" } y { "1.3e-11" } con las entradas de { "0.30" })

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (autovalores frente a numpy.linalg.eigh; covarianza CRLB frente a σ²(XᵀX)⁻¹ mediante numpy.linalg.inv; GDOP/PDOP/HDOP/VDOP/TDOP de GNSS a partir de la matriz de información frente a numpy; todo coincide hasta { "1e-9" }); fim::tests (resolutor de autovalores de Jacobi frente a espectros en forma cerrada; CRLB frente a las formas cerradas de Kay { "1993" }: DC en WGN σ²/N y ajuste de recta σ²(XᵀX)⁻¹; alcance de la CRLB por Monte Carlo; identidad de Moore–Penrose MM⁺M=M; espacio nulo del defecto de datum)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (recupera la transformación de Helmert inyectada); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } casos frente a un resolutor independiente en forma cerrada de Umeyama-SVD; peor |Δ| traslación { "2.0e-5" } m, rotación { "5.3e-12" } rad, escala { "9.3e-2" } ppb, RMS tras el ajuste { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (el DOP reutiliza el kernel validado; el PL se reduce al caso del polo sur); tests/lunar_navigation_service_volume_reference.rs (posición MCI por satélite hasta <{ "1e-3" } m + conjunto de satélites visibles EXACTO en todo el barrido de rejilla×época frente a ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (los { "210" } códigos primarios AFS-Q siempre; con KSHANA_LANS_RUN y la caché de LSIS, los { "630" } códigos, cero discrepancias de chips); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (con la caché de LSIS: { "3" } tramas, cero discrepancias de símbolos; { "24" } ventanas de { "2" } ms incluidas en el repositorio, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (condicionado a datos: ejecución completa de { "23.9" } s, |rho| = { "0.999990" }, peor bloque de { "2" } ms { "0.999948" }, fase { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (con la caché de LSIS: las { "3" } tramas que transmite LANS-AFS-SIM, construidas a partir del mismo FID, TOI y bits de datos: ninguno de { "18 000" } símbolos difiere); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (Figura { "8" } de LSIS: 0x045 -> 0x229f61dbb84a0; valor de comprobación CRC-24/LTE-A 0xCDE703; se ejecuta siempre); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } palabras de código, cero comprobaciones insatisfechas de la H impresa); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (descodificador solo a partir de H, sin ruido y con Es/N0 de { "3" } dB, y { "10" } tramas completas); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } canales: peor pseudodistancia { "1.6e-3" } m frente a { "0.05" } m, fase de código { "5.5e-6" } chip frente a { "2e-4" }, Doppler { "7.4e-5" } Hz frente a { "0.02" } Hz, ángulos de observación { "4e-9" } grados frente a { "1e-4" }, conjunto visible idéntico); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (el arnés de referencia independiente reproduce exactamente el propio listado de canales impreso por el programa)

# text
seg-80e62d2d7748 = lunar_service::tests (topocéntrico frente a geometría calculada a mano: cenital, justo al norte/este/oeste, antipodal y la dirección este polar degenerada; el indicador de visible exportado concuerda con el filtro de visibilidad independiente en un barrido completo de { "6" } h; la exportación está desactivada por defecto y se demuestra que no cambia nada más; los niveles de protección son exactamente lineales en el sigma expuesto mientras que la geometría subyacente no se toca); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } muestras en { "8" } emplazamientos, { "12" } épocas y { "8" } satélites frente a ANISE { "0.10.2" }: acimut y elevación dentro de { "1e-6" } grados, distancia y posición del emplazamiento dentro de { "1" } mm; peor caso { "2.2e-12" } grados, { "2.1e-13" } grados, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (inversa aplicar/resolver, par nulo de la peonza esférica, punto fijo de eje principal, conservación de energía+momento en ejecución corta, q̇=½q⊗ω, signo de la velocidad de la peonza simétrica + precesión del cono del cuerpo); tests/attitude_dynamics_reference.rs ({ "200" } 000 ejecuciones de pasos sin par: |q|={ "1" } hasta { "1e-10" }, energía cinética T=½ωᵀIω conservada hasta { "1e-9" } rel, |Iω| y el vector de momento inercial conservados hasta 1e-9/1e-8 rel, ambos con una inercia triaxial y con una general no diagonal; precesión del cono del cuerpo de peonza simétrica oblata + prolata reproducida hasta { "1e-6" } frente al λ=ω₃(I_a−I_t)/I_t analítico); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (dos inercias generales no diagonales, { "1e4" } s sin par frente al hub de nave de Basilisk { "2.9.1" } con RKF78: cuaternio dentro de { "1e-9" }, peor caso { "3.3e-11" }; velocidades del cuerpo dentro de { "1e-9" } rad/s, peor caso { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, MAS desacoplado en dirección transversal); tests/cw_dynamics_reference.rs (Φ en forma cerrada frente a una integración RK4 independiente de paso fijo de las mismas EDO de Hill hasta <{ "1e-6" } durante un tercio de órbita; Φ(t)Φ(−t)=I hasta { "1e-9" }; la condición acotada ẏ₀=−2n·x₀ cierra el estado completo tras un periodo hasta { "1e-9" } sin deriva secular a lo largo de la traza en { "10" } órbitas; un desplazamiento puramente radial deriva el −12π·x₀ analítico por órbita); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (cuatro casos a { "100" } m durante un tercio de una órbita de { "500" } km: peor caso { "1.15e-7" } m frente a { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (solo la Φ lineal: de { "1.2" } a { "6.3" } mm, fijado)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (pico de { "35.44" } g frente a los { "33.4" } g publicados, +{ "6.1" } %, umbral { "10" } %; velocidad de entrada relativa al planeta { "12.551" } km/s frente a { "12.6" }, umbral { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (la energía en el marco rotatorio disminuye exactamente en el trabajo de arrastre; la deriva en vacío conserva la energía de Jacobi; el caso balístico no rotatorio coincide con la masa puntual plana del módulo reentry; la forma cerrada de Allen-Eggers en su régimen)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } casos, { "601" } muestras cada uno: MRP peor caso { "2.4e-14" }, umbral { "1e-9" }; velocidad angular del cuerpo { "1.6e-15" } rad/s, umbral { "1e-9" }; velocidad de la rueda { "2.9e-11" } rad/s, umbral { "1e-6" }; par de motor aplicado { "1.2e-13" } N m, umbral { "1e-9" }; pares en t = { "0" } dentro de { "1e-12" } N m; saturación alcanzada en ambas herramientas); aocs::tests (momento angular conservado, mapeo de norma mínima, rama de MRP, convergencia bajo saturación); aocs_kind::tests

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(cuaternio identidad)=I; el resolutor de autovalores de Jacobi satisface Kv=λv y conserva la traza en una matriz simétrica conocida; K es simétrica); tests/wahba_reference.rs (TRIAD, el método q de Davenport y QUEST reproducen la DCM óptima de scipy.spatial.transform.Rotation.align_vectors en conjuntos de vectores ponderados sin ruido hasta <{ "1e-9" } rad mediante el ángulo de error de actitud independiente del marco; además, el método q recupera una rotación conocida con λ_max=Σ pesos y pérdida de Wahba nula, la solución del método q minimiza la pérdida de Wahba bajo perturbación, QUEST concuerda con el método q óptimo hasta <{ "1e-7" } rad, y el estimador óptimo supera a TRIAD de dos vectores en error RMS de actitud a lo largo de { "2000" } ensayos ruidosos de Monte Carlo)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (caso central de Marcum-Q Q_1({ "0" },b)=exp(−b²/2); la identidad P_d=Q_M(√(2Mρ),√γ); ida y vuelta P_fa↔umbral en M y P_fa; monotonía de la ROC: P_d aumenta con la SNR, disminuye con el umbral, P_d→P_fa cuando SNR→{ "0" }; la ganancia de integración no coherente aumenta P_d con P_fa fija; Marcum-Q monótona en a y b y acotada en [{ "0,1" }]); tests/acquisition_reference.rs (la Q_M(a,b) de Marcum generalizada, P_d, P_fa y la inversión P_fa→umbral contrastadas con scipy.stats.ncx2/chi2 sobre una rejilla (M,a,b)/(M,P_fa)/(M,SNR) hasta ~{ "1e-6" })

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ reconstruye Q); tests/lambda_reference.rs (la transformada Z es unimodular |det Z|={ "1" } con Q_z=ZᵀQZ SPD, conserva el determinante y reduce la correlación total fuera de la diagonal; el ILS de Schnorr–Euchner coincide con la enumeración por fuerza bruta sobre { "300" } covarianzas aleatorias; la cadena completa decorrelación→búsqueda→transformación inversa es igual al ILS directo y Z⁻ᵀZᵀ conserva los enteros en ida y vuelta; la tasa de éxito bootstrap en forma cerrada coincide con un Monte Carlo de 200k ensayos de redondeo condicional secuencial hasta <{ "0.01" }); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (los enteros fijados son iguales a lambda() de RTKLIB v2.4.2-p13 sobre { "300" } covarianzas aleatorias, n de { "2" } a { "10" }, { "226" } de ellas no resolubles por redondeo; las dos mejores normas al cuadrado concuerdan hasta { "1e-9" } relativo, medido { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (los escalares del sobrevuelo satisfacen las formas cerradas con dos identidades de |B| concordantes y |B|>r_p; el ángulo de giro disminuye con el radio del periapsis y alcanza los límites δ→{ "0" } / δ→π; la deflexión conserva la velocidad v∞ y gira exactamente δ; la magnitud del Δv de asistencia es igual a { "2" }·v∞·sin(δ/2) y está acotada por { "2" }·v∞; los ejes del plano B son ortonormales y ⊥ Ŝ con |B|²=(B·T̂)²+(B·R̂)²; el parámetro de Tisserand es invariante ante una deflexión que conserva v∞ y que sí cambia a,e,i, y es igual a { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (identidades de aritmética compleja, incl. z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; el anulamiento determinista da una ganancia unitaria exacta hacia el SV y nulos de interferente de <{ "1e-9" } en una ULA de 4 elementos con { "3" } interferentes; una matriz de N elementos rechaza >N−{ "1" } interferentes y anula con norma mínima menos; MVDR se mantiene sin distorsión hacia el SV mientras que el nulo del interferente se profundiza monótonamente con la potencia del interferente hasta <{ "1e-3" } a { "60" } dB); tests/crpa_reference.rs (los vectores de pesos de MVDR y de anulamiento de norma mínima y las ganancias de respuesta de la matriz resultantes contrastados con un cálculo independiente de LAPACK con numpy/scipy hasta ~{ "1e-9" })

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (cada tipo de ruido puro muestra su pendiente característica logarítmica de ADEV: FM blanco −½, FM flicker { "0" }, FM de paseo aleatorio +½, PM blanco −{ "1" }; el término de FM flicker es un suelo plano igual a √({ "2" } ln2·h_{ "{" }-1{ "}" }) a lo largo de cinco décadas de τ; el ajuste de la familia FM recupera en ida y vuelta h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 conocidos a partir de una curva sintética hasta <{ "1e-6" }; y el suelo de una curva dominada por flicker se recupera aquí mientras que el ajuste de base de deriva (quantum_trade::qparams_from_adev_curve) falla en más del >{ "10" }% a τ largo, cerrando una brecha documentada); tests/powerlaw_oadev_reference.rs (σ_y(τ) contrastada con las formas cerradas de Noise.adev de allantools { "2024.06" } a lo largo de la escalera de τ para los cinco tipos de ruido, más una corroboración del nivel h_a con el generador de Kasdin de allantools→estimador oadev)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (una covarianza SPD simétrica hace la ida y vuelta KVN→análisis hasta el redondeo de f64 y sigue siendo simétrica; el bloque emite exactamente las { "21" } entradas triangulares inferiores, i+{ "1" } por fila de matriz, con/sin COV_REF_FRAME; se rechazan tanto un bloque con un número erróneo de valores como un bloque ausente); tests/ccsds_oem_covariance_reference.rs (la biblioteca independiente oem { "0.4.5" } analiza un segmento OEM emitido por kshana y reconstruye la matriz simétrica de { "6" }×{ "6" }, coincidiendo con la covarianza de entrada de kshana hasta el redondeo de f64; con un control negativo perturbado y una comprobación de que oem rechaza la variante etiquetada CX_X)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>): el MISMO analizador CCSDS-502 independiente en el que se apoya la fila validada 'CCSDS OEM interoperability', una base de código completamente distinta (con su propio tokenizador KVN, su máquina de estados de la sección de covarianza y su ensamblado de matrices con numpy). kshana emite un segmento OEM completo que lleva su bloque COVARIANCE triangular inferior de números sin etiquetas; oem lo analiza y reconstruye la matriz simétrica de { "6" }×{ "6" }, coincidiendo con la covarianza de entrada de kshana elemento a elemento hasta el redondeo de f64: una auténtica ida y vuelta de intercambio de biblioteca contra biblioteca (comparada con la reconstrucción de oem, no con un nuevo análisis de kshana), que cierra la brecha anterior de la fila, "sin fixture de terceros"

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); tipo de escenario <c1/>

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } puntos, seis términos de error de { "30" } s a { "3600" } s, grado Tactical, { "45" } grados N, nivelado y apuntando al norte: cada punto dentro del { "5" } %, peor caso +{ "3.70" } % de paseo aleatorio de velocidad a { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (el hallazgo de la ronda 1 sobre las leyes de orden principal de Tierra plana, conservado como regresión)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } tests de biblioteca: el jacobiano analítico frente a una diferencia finita central de lunar_vlbi::vlbi_delay_s tomada por una ruta que rota hacia delante las propias coordenadas del estado y nunca toca una derivada parcial, concordando hasta < { "1e-6" } de 1/c por columna, con las dos matrices de información concordando hasta < { "1e-6" } de la mayor diagonal y las covarianzas hasta < { "1e-5" } relativo; una geometría unitaria ortogonal cuya covarianza es c·σ_τ por eje en forma cerrada hasta { "1e-12" }, que es también el único caso en que el vínculo de equipartición es exacto; el espectro de covarianza y el sigma 3-D de cada estación invariantes ante una rotación rígida de toda la red hasta { "1e-9" } con C_rot = R·C·Rᵀ fijada por bloques Y una aserción explícita de que los sigmas por eje sí se movieron, de modo que el test no puede pasar en vacío; la covarianza escala exactamente como σ² y como 1/N; la cota de traza AM-HM nunca se supera; el cierre de retardos τ_ik = τ_ij + τ_jk fijado a un ULP en los retardos y en las filas del jacobiano, con una línea base redundante que se demuestra que añade información pero nunca rango; una sola época se notifica con rango deficiente y con cifra principal nula; un arco más largo se mide con mejor condicionamiento con igual número de observaciones; el bloque de la baliza se demuestra inobservable con este calendario; el parcial de Shapiro diferenciado que se desprecia se mide por diferencia finita en tiempo de ejecución y se emite en lugar de descartarse); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (red anclada por defecto y red libre: jacobiano construido con SPICE, el calendario de 16 observaciones idéntico, sigmas de estación dentro de { "2.2e-3" }, autovalores { "2.3e-3" }, condición { "2.4e-3" }, cifra principal { "1.0e-3" }, línea de visión { "0.018" } grados, declinación { "0.007" } grados, frente a umbrales de { "1" } % y { "0.1" } grados; red libre de rango 8/9 con cifra principal nula, espacio nulo separado { "0.006" } grados; NumPy sobre el jacobiano incluido en el repositorio hasta { "2e-13" })

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } observaciones idénticas; rango 3/3; autovalores dentro de { "5.9e-5" }; condición { "5.9e-5" }; sigmas de baliza dentro de { "1.7e-3" } frente a { "1e-2" }; RMS { "2.9e-5" }; brazo de palanca { "1.4e-8" }; sigmas de P2 { "3.9e-14" } frente a { "1e-9" }); lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } casos de volumen de servicio (polar sur, latitud media, ecuatorial, meseta elevada), de { "6" } a { "19" } satélites, σ_URE 10/30/60 m, P_HMI de { "1e-3" } a { "1e-7" }, niveles de protección que abarcan de { "1.7e2" } a { "6.9e3" } m: HPL/VPL frente a la referencia independiente compuesta de RTKLIB + SciPy, peor |Δ| { "1.061e-8" } m y { "1.044e-8" } m frente a una tolerancia de { "1e-6" } m; DOP frente al (GᵀG)⁻¹ propio de RTKLIB hasta { "1.790e-14" } relativo; K_fa frente a scipy.stats.norm.isf hasta { "2.716e-11" } relativo; tres controles negativos (un desplazamiento de satélite de { "5" } km, un cambio relativo de σ_URE de { "1e-6" } y un P_HMI un { "0.1" } % más estricto), cada uno medido de modo que mueve el nivel de protección al menos { "171" }× la tolerancia; y una guarda de fixture obsoleto que fija bit a bit la geometría incluida en el repositorio a lo que producen el propio código de constelación y visibilidad del motor, de modo que un resultado en verde no pueda sobrevivir a un cambio de la constelación por debajo)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } vectores publicados + { "6" } controles negativos, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: omitir el sesgo nominal falla el VPL publicado por { "2.6457" } m, un error de ISM del { "10" } % por { "0.2798" } m, K_fa con { "57" } modos en lugar de { "12" } por { "0.4015" } m, un error de varianza de integridad de +{ "2" } %/+{ "5" } % por 0.0750/0.1971 m, y un error de +{ "1" } % lo mueve solo { "0.0339" } m, notificado como el límite de resolución de la comprobación en lugar de ocultarse; las respuestas de los dos documentos fallan cada una la del otro por más que la tolerancia, de modo que los vectores no son intercambiables; el fixture incluido en el repositorio y las constantes compiladas son dos transcripciones independientes cuya coincidencia se afirma, de modo que una cifra publicada no puede editarse en un lado para hacer pasar una comprobación; y C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² vale para las { "40" } varianzas transcritas, una identidad aritmética que rompería una errata de transcripción)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (componiendo fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } tests: los { "15" } archivos CRD incluidos en el repositorio, idénticos byte a byte a sus resúmenes registrados; los { "349" } registros contabilizados, { "337" } usados y { "12" } omitidos por un motivo con nombre; cada distancia archivada dentro de la envolvente real de perigeo/apogeo; se muestra que los pesos SON bin_rms/√n_raw; la coordenada de línea de visión es la mejor determinada para cada matriz, con el barrido de libración que la proporciona medido por separado; el residuo y su confirmación independiente frente a JPL Horizons; la sensibilidad a la inclinación de geometría de 0.1 grados; se muestra que la comparación de campaña simulada es igual a una ejecución independiente de ese escenario; una fijación bit a bit R1 en los tres paquetes de marco lunar preexistentes); lunar_llr::tests ({ "12" }: el parcial de la distancia frente a una diferencia finita central del tiempo de vuelo modelado hasta < { "1e-6" } relativo; el tiempo de luz de un viaje de ida y vuelta lunar convergido; el sigma del datum exactamente lineal en la escala de pesos hasta { "1e-9" }; diagonalidad por bloques exacta; se rechaza un directorio de datos ausente en lugar de sustituirlo; una fila editada del catálogo detectada por su propia columna de radio); realdata::llr_crd::tests ({ "7" }: semántica de los campos, cambio de medianoche, rechazo de una escala de tiempo no UTC y de una versión de formato no admitida, y ningún sigma sustituido para un intervalo vacío); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, fijado; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } puntos normales no vistos del 2025-Q2; sigmas y normas, peor caso { "1.11e-3" } de { "1e-2" }, condición { "8.95e-4" } de { "2e-2" }, cocientes { "1.79e-3" } de { "2e-2" }, contabilidad, rangos y acoplamiento exactos)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } puntos normales no vistos del 2019-Q2; sigmas y normas dentro de { "4.0e-5" } de { "1e-2" }, condición { "1.6e-5" } de { "2e-2" }, cocientes { "7.6e-5" } de { "2e-2" }, contabilidad y rangos exactos); tests/validate_llr_datum_kernel_moon.rs (el diagnóstico de datos ya vistos de { "2015" }, { "0.049" } % en tz; no es evidencia para esta fila); lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } estados geocéntricos semanales, ángulo de la peor época afirmado < { "0.3" }° y RMS < { "5e5" } m frente a la propia afirmación documentada del módulo, además de afirmar que el residuo de LLR concuerda con la discrepancia radial hasta < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } puntos normales reales)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (rango 1, fusionar/excluir, dominancia del sesgo, contraste cruzado de IR); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } casos incluidos en el repositorio: estimadores de subconjunto con lstsq de numpy, covarianza de separación general, PL con brentq de scipy; PL dentro de { "1e-9" } relativo, peor caso { "1.2e-10" }; subconjunto determinante exacto)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } casos SPD incluidos en el repositorio: factor, residuo blanqueado, operador de blanqueo y cuadrado de Mahalanobis frente a LAPACK de numpy dentro de { "1e-12" } relativo, peor caso { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } casos incluidos en el repositorio: alpha_ss, alpha_cm y el mínimo dentro de { "1e-12" } relativo en { "210" } casos bien condicionados y de contorno, peor caso { "3.3e-15" }; { "40" } mal condicionados hasta una condición de { "1.3e8" } dentro de una cota declarada escalada por la condición, peor caso { "1.1e-9" }; seis infinitos exactos)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } matrices SPD sintéticas de 7x7 que abarcan desde bien condicionadas hasta casi degeneradas de { "{" }{ "0,3" }{ "}" }; lambda_min de Schur / CRLB del origen / |corr| frente a SciPy/NumPy hasta <{ "1e-9" } rel)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } épocas aleatorias fuera de nodo frente a pxform de SPICE sobre el PCK binario: ángulo de rotación dentro de { "1.7e-5" } rad, peor caso { "1.7e-6" } rad, { "3" } m al radio medio)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } puntos normales de ILRS: RMS { "2.81" } m; solo las dos estaciones ITRF2020 { "2.96" } m; ambos como máximo { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (el modelo geocéntrico de tiempo de luz sustituido, { "10.94" } m, fijado)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } autovalores, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm y el marginal de Schur de { "{" }scale,offset{ "}" } para las redes well_posed de 120 filas y single_epoch de 30 filas, hasta rel<{ "1e-3" } y abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m dentro de { "2.8e-6" } del de Ashby y Patla { "2024" } con J2 de AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: la entrada radial dentro de { "8.3e-5" } de la gravedad ecuatorial de grado 350 de pyshtools; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: la entrada de velocidad dentro de { "2.5e-3" } de la velocidad lunar de DE441 en { "2000" } épocas); lunar_gauge::tests; regresión tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation: una base nula alineada con los ejes y su rotación de { "0.6" } rad dan idénticos defect, dim_spatial, dim_temporal, coupled_dim y p_st_norm; classify_direct_sum_null y classify_coupled_null: casos construidos de suma directa y genuinamente acoplados confirman la descomposición de dimensiones; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } matrices de Fisher de 9x9 construidas sobre { "18" } subespacios nulos, cada una en cuatro rebases ortonormales aleatorios: defect, dim_spatial, dim_temporal y coupled_dim exactos; p_st_norm dentro de { "6.0e-15" }, umbral { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible para { "3" } pares de proveedores frente al ajuste lstsq independiente por SVD de SciPy en tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; fixtures + referencia independiente consistentes byte a byte mediante scripts/gen_interop_ref.py sobre los kernels públicos DE440/INPOP21a/EPM2021 a través de calceph de IMCCE)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: la P⊥ de { "84" }×{ "84" } elemento a elemento, trace(P⊥) = parity_dim = { "52" } y rank(G) = { "32" }, normas de detectabilidad + indicadores, la forma cuadrática del MDB cᵀWP⊥c + valor del MDB, y los recuentos de detección/identificación de block-spark para cada coalición de pares, reproducidos frente a una referencia independiente con numpy/scipy hasta rel<{ "1e-3" } abs<{ "1e-3" } con recuentos enteros exactos; entradas consistentes byte a byte mediante examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } factores de promediado de MTIE y { "12" } de TDEV sobre una serie de holdover de reloj atómico a escala de chip de { "2" } 048 muestras incluida en el repositorio, con envejecimiento, flicker y temperatura, frente a allantools { "2024.06" } hasta <{ "1e-12" } / <{ "1e-9" } relativo, observado exacto / { "1.1e-15" }; las mismas curvas leídas de una ejecución completa de telecom-timing que ingiere el CSV); telecom_timing::tests (MTIE deslizante igual a allan::mtie en cada ventana; MTIE y TDEV derivados a mano; MTIE monótona)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: se ajusta sobre el primer tercio del registro, se predice la superación de un sigma en { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } y { "2.5" } ns, y se mide sobre los otros dos tercios desde un punto de sincronización cada { "997" } s; umbral, fijado antes de la primera ejecución, un factor de { "1.5" } en cualquier sentido; cocientes observados de { "0.84" } a { "1.03" }; un control, la desviación de Allan a un segundo leída como FM blanco, falla por un factor de aproximadamente { "1 000" } y debe fallar el umbral; una mutación que reduce a la mitad el nivel de FM blanco hace fallar el test); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz: BPSK({ "1" }) { "2.046" } MHz y BPSK({ "10" }) { "20.46" } MHz localizados numéricamente sobre la forma cerrada; boc11_lobes_are_centred_at_plus_minus_1_023_mhz: nulo de portadora, primer nulo en { "2.046" } MHz, centro de lóbulo { "1.023" } MHz, y el máximo exacto en { "0.7590" } MHz frente a una resolución independiente de Newton de tan y = 2y; ssc_matches_parseval_closed_forms: C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, cada uno dentro de { "0.02" } dB; q_values_match_kaplan_hegarty: CW en la portadora Q = { "1" }, ruido de espectro adaptado Q = { "1.5" }, ruido plano de nulo a nulo Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power: suelo dentro del { "2" } % de la varianza sobre la frecuencia de muestreo, total de Parseval dentro del { "2" } %, ancho de banda equivalente de ruido de Hann de { "1.5" } bins; noise_like_synthesis_is_unbiased_through_welch: mediana de Welch menos modelo dentro de { "0.1" } dB a través de una ida y vuelta ci16_le; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (PSD de Welch frente a signal.welch de scipy { "1.18.1" } por bin hasta { "1e-12" } relativo en { "27" } casos, observado { "6.0e-14" }; cinco grabaciones de sigmf-python { "1.13.0" } descodificadas bit a bit con metadatos idénticos; grabaciones escritas por el crate releídas bit a bit por sigmf-python y válidas según el esquema de SigMF { "v1.2.6" })

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (baricentros 1800-2050 de la Tabla { "1" } y { "3000" } a. C.-3000 d. C. de la Tabla { "2" }, { "8908" } y { "21857" } épocas, peor RMS { "0.778" } de la cifra de la Tabla { "8.10.1" }); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: la Tierra a través de AnalyticSolarSystem e icrf_to_ecliptic, RMS { "0.483" } de la cifra de EMB; icrf_positions_are_within_the_table_8_10_1_rms: posiciones ICRF de los cuerpos de la Tabla { "1" } y de la Tierra, peor caso { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: la división de la serie lunar, peor caso { "0.088" } grados y { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Regresión no determinante: tests/solar_system_horizons_reference.rs

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } posiciones en { "200" } épocas UTC de 1973-2026 extraídas del hash de preregistro; peor caso { "0.66" } del umbral, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (condicionado a datos); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (los baricentros de Mercurio, Venus, Marte, Júpiter y Saturno, el Sol y la Luna hasta el centro de la Tierra, { "1576" } épocas cada uno sobre posiciones DE441 interpoladas, peor caso { "6.7e-9" } s frente a { "1e-6" } s); declaración de precisión no determinante para la ruta analítica: tests/solar_system_light_time_preregistered.rs (RMS c dLT de { "0.17" } a { "0.30" } del umbral de posición de la Tabla { "8.10.1" }); solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } épocas de { "1955" } a { "2044" }, { "574" } matrices dentro de { "1e-9" } rad, peor caso Fobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } épocas de { "1961" } a { "2038" } nunca comparadas antes, { "574" } matrices dentro de { "1e-9" } rad, peor caso Fobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } de { "84" } constantes de los catorce cuerpos difieren de NAIF)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (las { "24" } filas de RAAN y de anomalía media hasta { "1e-9" } grados); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (la fórmula de ranuras del ICD y un Walker 24/3/1 son los mismos { "24" } pares de nodo y argumento de latitud); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (el cruce ecuatorial de la traza de las { "36" } ubicaciones GPS a partir de RAAN, argumento de latitud y el ángulo horario de { "100.765" } grados: { "35" } dentro de { "0.0108" } grados frente a un umbral de redondeo de { "0.015" } grados, y E3F dentro de { "0.06" } grados porque la propia fila E3F de la tabla es inconsistente con su RAAN y su argumento de latitud en unos { "0.06" } grados; la regresión nodal secular dentro del { "5" } % de los -0.0402 grados/día de la tabla); constellation::tests::walker_geometry_identities_are_exact (las tres identidades de separación para patrones delta y estrella de hasta { "1 584" } satélites, hasta { "1e-9" } grados)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (mediana de HDOP { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, media { "0.965" } frente a { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } y { "0.96" }, umbral { "0.03" } en cada uno fijado antes de la primera ejecución; mediana de PDOP { "1.795" } igual o inferior a { "1.815" } de la Tabla B.3-1 para una mezcla degradada de 20-24 satélites; disponibilidad del { "100" } % global y en el peor emplazamiento frente al { "98" } % y el { "88" } % de la Tabla 3.8-1); constellation::tests::single_epoch_dop_matches_the_hand_computation (cenit más tres satélites a { "30" } grados de elevación: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } hasta { "1e-9" }, e igual a orbit::dop con un reloj común)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit: Si({ "1" }), Si(pi), Si({ "2" } pi) hasta { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric: { "0.9028" } de la potencia en el lóbulo principal para BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), y la forma cerrada igual a la cuadratura hasta { "1e-7" } en { "10" }, { "15" }, { "20" } y { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote: hasta { "1e-4" }, y la asíntota sqrt(B R_c / ({ "2" } pi^{ "2" })); bandlimited_dll_reduces_to_the_textbook_forms: BPSK({ "1" }) coherente anticipado-retrasado a { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms: { "0.0039564" } chips ({ "1.159" } m) dentro del { "1" } %, la forma no coherente igual a navsignal::dll_code_jitter_chips dentro del { "1" } %, el límite de espaciado que se anula igual a su forma cerrada hasta { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form: desfases de { "0" } a { "3.2" } R_c dentro de { "0.01" } dB y -71.86 dB/Hz con desfase cero para BPSK({ "10" }); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures: Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz dentro del intervalo publicado de { "32" } a { "34" } kHz; Iridium ({ "1621" } MHz, { "780" } km) dentro de { "0.5" } kHz de los { "36" } kHz publicados

# text
seg-f1cdf8728c6b = Cifras publicadas: Doppler máximo de Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler de Iridium de hasta +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Se omite la rotación de la Tierra, que desplaza la cifra hasta unos { "2.3" } kHz; ambas cifras publicadas se alcanzan sin ella.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: las { "115" } filas de la Tabla { "5" }, de { "1" } GHz a { "1000" } GHz, cada coeficiente dentro de { "0.6" } de su último dígito impreso; peor caso observado { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } casos en cinco emplazamientos, { "14.25" } y { "29" } GHz, del { "0.001" } % al { "1" } %, dentro de { "1e-4" } dB; observado { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } casos en siete emplazamientos, { "14.25" } y { "20" } GHz, dentro de { "1e-5" } dB; observado { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } valores, { "28" } GHz a { "0" } grados y { "2" } GHz a { "45" } grados, ambas clases, P de { "1e-7" } a { "0.998" }, dentro de { "0.001" } dB)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } hasta { "1e-12" }, amplificación L1/L2 y L1/L5 de { "2.978" } y { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f hasta { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } grados, Pulsar FOC polar { "1080" } km { "97" } grados, Pulsar FOC inclinada { "1080" } km { "53" } grados y GPS { "20180" } km { "55" } grados; velocidad orbital, velocidad ECEF máxima, velocidad relativa máxima y Doppler máximo de portadora en las bandas L1 y L5, { "20" } valores, cada uno dentro del { "0.05" } %)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table: GPS { "0.979" } y 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } y 1/61.1, BeiDou MEO 1/54.2, geoestacionario { "0.992" } y 1/126.2 con una máscara de { "0" } grados, cada uno dentro de { "0.005" } de w_R y de { "0.5" } de 1/w_AC^{ "2" }; leo_weights_shift_toward_the_transverse_axes: ángulo nadir del horizonte { "67.8" } grados a { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre: cuatro efemérides de difusión reales de Galileo E10, E19, E24, E25 en tk = { "0" }, +/-600, +/-1800, +/-3600 s, cada eje dentro de { "1" } mm de RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block: dentro de { "5" } mm tras la trama binaria de Kshana y de { "1" } mm tras el bloque de estilo RINEX)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value: 0xCDE703 para la cadena ASCII { "123456789" }; crc24q_matches_the_rtcm_1005_example_frame: los tres bytes de comprobación 0x360B98 de la trama de ejemplo del tipo de mensaje { "1005" } de RTCM { "10403" }, y cero sobre la trama completa)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (crecimiento monótono de { "1" } a { "15" } minutos y una mejora de al menos el triple a { "15" } minutos); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (órbitas de dinámica reducida de TU Graz ITSG de GRACE-A, GRACE-C, Sentinel-2A y Sentinel-6A ajustadas sobre arcos de { "20" } y { "30" } min: RMS a lo largo, transversal y radial de { "0.804" } a { "1.087" } y SISRE de { "0.716" } a { "0.809" } de Liu et al. { "2025" }, dentro de 1.5x; pesos de SISRE dentro de { "0.0007" } de su Tabla { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, mismo estado inicial y misma entrada de densidad: peor caso { "3.95" } mm dos cuerpos, { "3.92" } mm J2-J6 y EGM2008 hasta grado { "20" } y { "70" }, { "4.55" } mm EGM2008 de grado { "20" } con arrastre a { "400" } km, umbral { "0.02" } m en { "6" } h); contraste cruzado interno, no una referencia independiente: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (cuatro días del artículo: cocientes a lo largo, transversal, radial y de SISRE de { "0.755" } a { "1.138" } de Liu et al. { "2025" }, dentro de 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (ocho días reservados, dos arcos cada uno: de { "0.683" } a { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared: el valor de L1 es el de RTKLIB de { "6.1278" } m; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar en L1, L2 y L5 sobre { "4 320" } casos, peor caso { "7.0e-13" } m; Az sobre { "222" } conjuntos de coeficientes, incluidas las reglas de todo cero y de { "400" } sfu, peor caso { "5.7e-14" } sfu; deriva de UTC sobre { "50" } casos, peor caso { "3.6e-15" } s; los tres casos de segundo intercalar sobre { "21 602" } instantes a lo largo de los segundos intercalares reales de { "2015" } y { "2016" }, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: un satélite a { "780" } km y { "86.4" } grados volado durante un día a { "1621" } MHz sobre cuatro latitudes, máximo dentro del { "5" }% de { "36" } kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: un satélite de cada capa publicada, { "1080" } km a { "53" } y { "97" } grados, { "1593.3225" } MHz, el máximo de la constelación dentro de { "32" } a { "34" } kHz sin ensanchamiento ({ "33.6" } kHz, fijado por la capa de { "97" } grados; la capa de { "53" } grados por sí sola alcanza un máximo de { "31.8" } kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m a mano a { "5" } MHz, { "45" } dB-Hz, { "0.1" } s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (configuraciones A y B, { "4040" } muestras: posiciones fijas a la Tierra dentro de { "6.8e-5" } m, umbral { "0.2" } m; recuentos en vista idénticos en 4040/4040; DOP mediano dentro de { "2.3e-11" } relativo, umbral { "1e-3" }; disponibilidad y media en vista idénticas); tests/earth_orbit_path_sgp4_erfa_oracle.rs (la trayectoria); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (ronda { "2" }, geometría sobre estados dados); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (hallazgo de la ronda 1 sobre la afirmación completa, fijado)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: tres escenarios: estaciones estimadas en una nueva fecha de campaña 2026-03-18 (determinante), estaciones fijas en esa fecha (control), estaciones estimadas en 2024-01-01 (el escenario del fallo anterior en doble precisión); cada sigma del datum, el número de condición y la dirección más débil frente a un umbral escalado por la condición recalculado en el test a partir de las sensibilidades exactas de la referencia independiente; engine_inputs_match_the_committed_fixture: el jacobiano, los pesos y el diseño de Helmert incluidos en el repositorio son lo que construye ahora el motor; record_engine_accuracy_against_a_factorisation_route: la banda de error del motor y el diagnóstico de Cholesky de NumPy, fijados)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: cuatro escenarios: estaciones estimadas en una nueva fecha de campaña 2026-06-09 (determinante), estaciones fijas en esa fecha (control), y las entradas de estaciones estimadas de 2026-03-18 y 2024-01-01; cada sigma del datum, el número de condición y la dirección más débil frente a un umbral en forma de raíz cuadrada recalculado en el test a partir de los ingredientes exactos de la referencia independiente; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } tests de biblioteca: el producto de Dekker igual al residuo de multiplicación-suma fusionada en { "20 000" } pares, suma compensada de una suma con cancelación, R^T R igual a A^T A, actualizaciones secuenciales del filtro iguales a una actualización por lotes, el bloque final igual a la raíz cuadrada del complemento de Schur, la inversa triangular, la SVD de Jacobi, concordancia con el datum espectral en un caso bien condicionado, repeticiones idénticas bit a bit); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected y the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) frente a tests/fixtures/maritime_trust/reference.json, regenerado por scripts/gen_maritime_trust_ref.py a partir del NMEA sintético escrito por examples/gen_maritime_trust_ref_inputs.rs; tolerancias preregistradas en tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (comparación con la referencia independiente pynmea2); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } códigos NACp, { "59" } filas de NIC); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } tramas); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } puntos, cuatro tamaños de celda); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } rutas, { "420" } tramos, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } puntos); tests unitarios de interference_map

# text
seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

# text
seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces; esquema { "1.3" }: prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged); tests/telemetry_cli.rs; telemetry::prometheus::tests (exposición de referencia)

# text
seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

# text
seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered); telemetry::syslog::tests (cadenas CEF exactas, escape, severidad, envoltura de RFC { "5424" }); tests/telemetry_cli.rs

# text
seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

# text
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (vectores de RFC { "8032" } sección { "7.1" } { "1" }, { "2" }, { "3" } y { "1024" }; ejemplos de SHA-256 de FIPS 180-4; exactos); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } casos); tests/evidence_pack.rs (tests de manipulación)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (la comparación preregistrada); evidence::tsa::tests (fechas y horas civiles, base64, la operación pública de RSA); evidence::verify::tests::anchors_make_the_authority_checked (un token sin firmar falla con anclas; sin ellas el informe no cambia)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } tests: fijaciones de la referencia independiente, bytes de exportación, peor caso sobre cada fila, columnas de posición, velocidad local frente a velocidad NED real, ángulos de Euler frente a scipy, NMEA frente a pynmea2); tests/interop_testbench.rs (las propias idas y vueltas del escritor)

# text
seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

# text
seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

# text
seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

# text
seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

# text
seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay); tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

# text
seg-af826b47d00e = { "388" } filas: { "176" } validadas externamente, { "208" } modeladas, { "4" } de propiedad del socio.

# text
seg-6bb40f180cf0 = <s1>Anterior</s1>Estado de validación

# text
seg-defb46c5bc80 = <s1>Siguiente</s1>Referencia de capacidades

# text
seg-1103199f019b = La sección opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multitrayecto dependiente de la elevación sigma(el) = a + b exp(-el / el0) en el usuario y en la estación (la forma funcional aerotransportada de RTCA DO-229, con a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grados por defecto; en la Luna cada valor es ILLUSTRATIVE), blanco en el usuario y de Gauss-Markov de primer orden sobre épocas en la estación (rho = exp(-dt / tau)); ruido térmico de código del DLL anticipado menos retardado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); sesgos entre canales por canal constantes durante un ensayo, en el usuario y en la estación. Los términos de estación entran en sus correcciones, los del usuario en las mediciones brutas y corregidas, cada uno con su propio flujo con semilla. Si faltan, cada documento no cambia

# text
seg-13b0ae9a874a = La entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): una corrección aplicada latency_s después de calcularse no recoge el crecimiento g latency_s del error de órbita difundida, siendo g isótropo de tasa RMS 3-D, sorteado por satélite y ensayo en su propio flujo con semilla (tasa de 1 sigma del rango tau / sqrt({ "3" })), además de la reproyección de línea de visión del error congelado. Si falta, cada documento no cambia. Un anexo K5 de la comparación con afirmaciones publicadas, preregistrado por separado, ejecuta K5 a { "0.001" }, { "0.01" } y { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-20eab6e9b925 = Coherencia interna: límites en forma cerrada y monotonía del modelo de diversidad, la forma cerrada del techo de nubes y las identidades de interrupción lognormales. NO se reivindica ninguna referencia independiente externa y no se ha comparado ninguna: no se usa ningún registro medido de disponibilidad de estaciones ópticas en tierra ni de línea de visión sin nubes. POR QUÉ MODELLED: el clima de nubes (probabilidad de nubes, mediana y dispersión de la columna de agua líquida, duraciones de interrupción), la independencia entre nubes y turbulencia, la forma de cópula gaussiana, la longitud de decorrelación y cada ganancia de técnica son supuestos; los escenarios incluidos indican climas ILLUSTRATIVE, no un conjunto de datos. Mejorar esta fila exige un registro medido de disponibilidad citado y un umbral registrado antes de la comparación

# text
seg-226dedaba243 = Un programa independiente de scipy/numpy integra las mismas ecuaciones variacionales (umbral O1). No se compara nada con una medición de una órbita lunar. La referencia independiente comprueba la numérica de fórmulas indicadas, no la física, por lo que la fila sigue siendo MODELLED. Modelo restringido de tres cuerpos: sin Sol, sin armónicos lunares, con el eje de rotación terrestre a lo largo de la normal de la órbita, entradas de receptor y estación ILLUSTRATIVE.

# text
seg-2308d94fa25e = Aritmética recalculada por un guion independiente de numpy sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; preregistrado en tests/fixtures/lunar_station/PREREGISTRATION.md, confirmado solo en 9caedf97 antes de la primera ejecución): en { "20" } casos con todos los términos de error activados, los conjuntos visibles y el estado son idénticos, los errores de distancia brutos coinciden hasta { "1.4e-14" } m, los vectores y módulos del error de posición hasta { "1.4e-9" } m frente a un umbral de { "1e-6" } m, y el p95 de cada punto iguala a numpy.percentile bit a bit; las correcciones de estación NO CUMPLIERON su umbral de { "1e-9" } m (peor caso { "3.73e-9" } m, { "15" } de { "20" } casos), y con ellas los errores de distancia corregidos: comprobado con aritmética de 60 dígitos, ambos lados quedan dentro del redondeo de doble precisión del valor exacto, siendo el término de levantamiento una diferencia de dos distancias de { "1e7" } m cuya unidad del último lugar es { "1.86e-9" } m; registrado, no ajustado. El tipo de escenario se reduce exactamente al tipo de escenario lunar-differential-pnt con un punto, una época y un ensayo. El modelo de error, el modelo de decorrelación y cada umbral son propios de este proyecto o ILLUSTRATIVE; nada de esto es una afirmación sobre ningún sistema real

# text
seg-29b8e6c12471 = Identidades en forma cerrada y autoconsistencia: la varianza step²/12 del cuantizador uniforme, la propagación exacta de covarianza (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que colapsa a σ·PDOP para σ iguales, la transferencia { "1" }:{ "1" } del término de levantamiento como consecuencia de û_user ≈ û_ref y el cierre en cuadratura al desactivar. El contraste de PDOP con orbit::dop comparte la matriz normal [−û, { "1" }], por lo que es una comprobación de coherencia y se etiqueta como tal y no como referencia independiente. No hay ExternalDataset disponible ni reivindicado: ninguna estación de superficie lunar tiene una exactitud de levantamiento publicada, ningún enlace de corrección diferencial lunar tiene una latencia o un formato de mensaje publicados, y el resultado de cuantización es una forma cerrada y no una medición. RTKLIB, que ya es la referencia independiente de código externo para el núcleo de diferencia simple y mínimos cuadrados ponderados, podría ejecutarse con una base deliberadamente mal levantada para confirmar la transferencia de levantamiento { "1" }:{ "1" }, pero eso es código independiente sobre la misma álgebra de línea de visión de primer orden. LAS MAGNITUDES SON MODELLED: el valor de levantamiento por defecto es la propia asignación de realización de marco lunar de este crate y no una estación medida, la latencia y el número de bits son entradas ILLUSTRATIVE, y el crecimiento del propio VECTOR de error de efemérides difundidas no se modela en absoluto, lo que se indica en la cadena emitida de la ley de envejecimiento, porque es el término con más probabilidad de dominar un enlace real

# text
seg-332ceb320b65 = El sigma en forma cerrada del término de crecimiento y la comprobación de propagación de primer orden (InternalConsistency). El anexo K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, preregistrado por separado en 59d88248): K5 falla a cada tasa, p95 3-D corregido de { "369.8" } m, { "2315" } m y { "22797" } m frente a un umbral de { "1.5" } m ({ "292.96" } m registrados sin crecimiento), como se indicó antes de la ejecución. Ninguna fuente pública da una tasa de crecimiento lunar: ILLUSTRATIVE

# text
seg-3801e9b32309 = Solo coherencia interna: el tiempo hasta el umbral por bisección se comprueba frente a la inversa en forma cerrada del tipo de ruido dominante del reloj, y el término de reloj en marcha libre frente al término de reloj del propio presupuesto. Las clases de reloj se apoyan en especificaciones publicadas de un día (sus propias filas); la tasa del LTC no se rederiva aquí y conserva su propia fila VALIDATED (Tiempo coordenado lunar); el residuo de dirección es ILLUSTRATIVE, el residuo de realización es una asignación de presupuesto y no se incluye ningún modelo térmico. El objetivo de nivel de nanosegundo descrito en el material Lunar PNT del ICG WG-B de junio de { "2024" } se cita como declaración de la fuente, no se adopta como afirmación; nada de lo aquí presente es una declaración sobre ningún reloj de estación real

# text
seg-479a7e6bbedb = Solo coherencia interna: cada emplazamiento añadido es un punto distinto y una distancia láser o un retardo de VLBI de estación fija toca un punto, de modo que su información A_p^T M_p A_p es semidefinida positiva y suma; la prueba comprueba la diferencia de Fisher y cada varianza frente a eso. El resultado de cinco arreglos es la fila de datos reales existente y no cambia. El retrorreflector añadido reutiliza épocas planificadas para los cinco arreglos existentes, un plan ILLUSTRATIVE, y la red, el plan y el sigma de retardo de la baliza añadida son las entradas ILLUSTRATIVE de lunar-frame-campaign; el emplazamiento es una posición polar sur ILLUSTRATIVE. Un emplazamiento polar sur ve la Tierra baja sobre su horizonte o no la ve en absoluto, lo que expresan las pruebas de ángulo de observación existentes; ningún emplazamiento se mide de forma continua. Las cifras son cotas de Cramér-Rao para un conjunto reducido de parámetros, no un datum resuelto ni una afirmación sobre ninguna estación real

# text
seg-4fbc7d86b491 = Formas cerradas y estadísticos de los propios sorteos del modelo (InternalConsistency): la fórmula del DLL frente a un cálculo manual, la forma de DO-229, la diferencia de línea base cero de dos receptores, la correlación de retardo 1 de Gauss-Markov. No existe ninguna medición lunar de multitrayecto ni de receptor con la que comparar; los valores son ILLUSTRATIVE y nada de esto es una afirmación sobre ningún receptor real

# text
seg-7dfedc40da6a = El bloque opcional [time_lab] del escenario lunar-time-budget modela un reloj de estación de referencia lunar (por defecto de la clase miniRAFS, o cualquier clase nombrada, o una tarjeta de dispositivo ajustada a puntos de estabilidad indicados) dirigido al Tiempo Lunar Coordinado y luego en marcha libre o redirigido cada N segundos: la curva de error de tiempo x(t) como raíz de la suma de cuadrados del término de ley de potencias del reloj, un residuo de dirección constante (ILLUSTRATIVE), un residuo constante de realización del LTC y un término opcional de tasa por altura de estación; el tiempo tras una dirección hasta { "1" }, { "10" } y { "100" } ns (o umbrales indicados) por bisección junto a la inversa en forma cerrada para el tipo de ruido dominante, y el término dominante en cada horizonte indicado, todo con unidades

# text
seg-8eedf0240350 = Identidades en forma cerrada y una vía independiente dentro del repositorio, sin referencia independiente externa reivindicada. El diseño de Helmert, la única derivada nueva del módulo, se rederiva por diferencia finita central de lunar_frame_realise::apply_helmert, una ruta que no comparte ninguna expresión con la forma analítica. La acumulación que compone es la de lunar-vlbi-fim, cuyo jacobiano se deriva por diferencias finitas frente a lunar_vlbi::vlbi_delay_s allí, y cuyo núcleo de álgebra lineal está anclado externamente por separado frente a numpy en tests/fim_observability_reference.rs: esta fila no toma prestado ninguno de esos estados. La referencia independiente de la física es estructural y no numérica: un parcial de retardo de baliza es la DIFERENCIA de campo cercano de dos vectores unitarios casi paralelos, de modo que la dirección de traslación peor determinada DEBE SER la dirección fija al cuerpo hacia la Tierra, y la prueba comprueba la respuesta calculada frente a la dirección medida por separado. MEDIDO: sigma de traslación derivado de la campaña { "6.3975" } m frente al error de recuperación de { "0.3125" } m del escenario de transformación inyectada ({ "20.5" }× más ajustado), mientras que la rotación y la escala van en el sentido CONTRARIO, { "2.32" }× y { "13.5" }× más holgadas: la vía inyectada supone un único sigma isótropo y por tanto reparte su error de forma uniforme entre siete parámetros, lo que el observable de retardo no hace. Rango 7/7 pero condición { "3.8e5" }, con una dirección { "99.57" } % de traslación pura hacia la Tierra y cuarenta veces peor que cualquier otra. LO QUE ESTA FILA NO AFIRMA: que la cifra de la campaña sea correcta en términos absolutos. Establece que la cifra se DERIVA ahora de un plan, una geometría y un modelo de error y no de una respuesta plantada. Se mantiene ReferenceImpl/MODELLED: no existe ningún par publicado de campaña de VLBI lunar más covarianza de datum, la red de estaciones y el sigma de retardo son entradas ILLUSTRATIVE (el catálogo de balizas tiene fuente, la campaña no), las observaciones se tratan como independientes mientras que la troposfera y el reloj de una sesión real están correlacionados entre barridos cercanos, y las efemérides, los relojes, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS. { "0.30" } comparación externa, un hallazgo (se mantiene MODELLED): con cada fila del jacobiano de balizas reconstruida a partir de tiempos de luz de NAIF SPICE (DE440, ITRF93, MOON_ME; preregistrado { "50863551" }), el plan, el rango de Helmert, los sigmas de datum (dentro de { "4.7e-3" }), la condición, la dirección más débil ({ "0.07" } grados), el barrido de libración y el orden de arcos coinciden en seis escenarios dentro de { "1" } % / { "0.2" } / { "0.05" } grados preregistrados. NumPy sobre el jacobiano confirmado del motor coincide hasta { "3e-14" } donde las estaciones están fijas. Con las estaciones estimadas difiere en { "6.8e-6" } frente a { "1e-9" } preregistrado, cuya premisa del número de condición era errónea (condición de Helmert { "2.1e8" }; las vías independientes de NumPy discrepan en { "3e-6" }; no se descarta una contribución del respaldo de pseudoinversa { "1e-9" } del motor), por lo que la fila no se promueve con ese preregistro. { "0.36" } nuevo registro con un umbral escalado por la condición (preregistrado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir del condicionamiento de la información conjunta y su reducción de Helmert), un hallazgo (se mantiene MODELLED, NOT MET): el paso { "0" } DESCARTA el respaldo de pseudoinversa para la brecha de { "6.8e-6" } (ninguna matriz anterior a la matriz de Helmert recurre al respaldo en los seis escenarios originales, con un margen mínimo de un factor { "2.6" }), el tramo de SPICE sigue cumpliéndose en los seis, y NumPy coincide dentro del umbral en seis de ocho escenarios (por defecto, los dos arcos, el sigma de retardo 3x, el defecto colineal y la nueva ejecución con estaciones fijas del 2026-12-01; peor caso { "0.13" } de su umbral). Falla en stations_estimated (sigmas de datum hasta { "6.8e-6" }, condición { "9.1e-6" }, norma con independencia descartada { "3.5e-6" }, frente a t = { "5.9e-7" }), y en la fecha nueva la baliza del polo sur no tiene ninguna observación, de modo que la información de la baliza es de rango deficiente (respaldo de pseudoinversa anterior a la matriz de Helmert en ambos escenarios nuevos) y la referencia independiente NumPy sin cambios no puede evaluar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-aae487789add = Tile N36W117 de NASA/USGS SRTM v3 (1 segundo de arco): datos de elevación PUBLIC-DOMAIN del Gobierno de EE. UU. del espejo abierto AWS elevation-tiles-prod, diezmado a 6 segundos de arco e incluido en tests/fixtures/terrain/ (véase NOTICE.md), más recortes a resolución completa de N36W117 y N36W119 contrastados nodo a nodo con el lector SRTMHGT independiente de GDAL y con las referencias topográficas del Monte Whitney ({ "4421" } m) y Badwater (−{ "86" } m). La referencia documentada de Badwater Basin (−{ "86" } m, el punto más bajo de Norteamérica) ancla la lectura georreferenciada. La corrección de navegación por correspondencia de terreno/TERCOM que consume el DEM sigue siendo modelada (fila aparte de PNT alternativo/complementario)

# text
seg-b915c06fa3f1 = skyline::PRESETS: cuatro geometrías REPRESENTATIVE con las dimensiones indicadas en la nota de diseño y una línea de procedencia cada una: city-street (un cañón, calle { "0" } grados, { "20" } m entre muros de { "30" } m, antena { "1.5" } m), harbour-approach (sectores: abierto hacia el mar en { "180" } grados, edificios de muelle { "8" } grados en { "90" } grados, el rompeolas { "3" } grados), fjord (terreno: paredes { "600" } m por encima de la antena a { "1.5" } km a cada lado de un canal norte-sur, caída por curvatura aplicada), container-terminal (sectores: pilas { "12" } grados sobre la mitad hacia tierra, plumas de grúa { "35" } grados y { "25" } grados sobre dos sectores estrechos); sobrescribible campo por campo

# text
seg-bfe05379b7aa = La reducción instantánea y los casos en forma cerrada del resolutor (InternalConsistency). El anexo (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, preregistrado por separado en 001ca100) con una restricción de altura de { "1" } m, tres satélites y una ventana de 6 épocas (ajustes ILLUSTRATIVE; las fuentes indican un filtro, una restricción de altura y tres satélites pero no sus ajustes): K1 a K5 fallan y K6 pasa, { "1" } de { "6" } como en la ejecución registrada; el error p95 3-D corregido de R300 baja de { "280.6" } m a { "2.11" } m (horizontal { "0.90" } m, no puntuado) y la cobertura sigue en { "0" }. El supuesto de independencia de la ventana la favorece. No es una afirmación sobre ningún sistema real

# text
seg-dd838d199a0d = Superficies en forma cerrada (InternalConsistency): la depresión de la esfera desnuda, un cráter en una meseta sobre la esfera con un observador en su centro y fuera de él, y un cono analítico frente a su propia rasterización. Sobre el recorte real, un trazado de rayos independiente con numpy (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; preregistrado en tests/fixtures/lunar_terrain/PREREGISTRATION.md, confirmado solo en edbb9b02 antes de que existiera el guion) coincide en cinco emplazamientos: alturas de emplazamiento hasta { "1.0e-11" } m y las { "1800" } elevaciones de horizonte hasta { "5.5e-10" } grados frente a umbrales de { "1e-6" }, recuentos de rayos truncados exactos; esto comprueba la aritmética, no el terreno. No se ha reproducido ninguna cifra publicada de horizonte o iluminación polar: el recorte incorporado de { "1200" } m suaviza el relieve submétrico que resuelven los estudios publicados de iluminación, de modo que los horizontes del DEM son una línea de visión MODELLED sobre un DEM real remuestreado, no un horizonte validado. El emplazamiento de la estación y la constelación siguen siendo ILLUSTRATIVE; nada de esto es una afirmación sobre ningún sistema real

# text
seg-eb6d3be85fec = Referencia: las afirmaciones numéricas de cinco fuentes públicas registradas con URL, fecha de obtención, SHA-256 y licencia en tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; presentaciones del IOAG Cislunar PNT Workshop { "2025" } y { "2026" }; UNOOSA ICG WG-B Lunar PNT, junio de { "2024" }), transcritas con referencias de página en tests/fixtures/lunar_station_published/CLAIMS.md. Los umbrales, casos y entradas se preregistraron en tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisión { "2" }, 05bf9a19, confirmada por separado antes de la ejecución). { "0.36" } primera ejecución, un hallazgo (se mantiene MODELLED): { "1" } de { "6" } umbrales se superan. La cobertura es { "0.00" } en ambos círculos frente a >= { "0.95" }, y el error p95 3-D corregido es { "280.6" } m ({ "300" } km) y { "293.0" } m con latencia de { "600" } s, frente a <= { "1.5" } m. El umbral decimétrico (K4) no podía superarse con el ruido de código de { "0.30" } m de las fuentes, lo que refleja un conflicto entre las fuentes y no un resultado del modelo. K6 se supera (razón { "1.39" } frente a <= { "1.5" }), pero como razón de dos cifras dominadas por la geometría no es evidencia sobre la decorrelación en ningún sentido. Causa: los elementos de los satélites no son públicos, y con los elementos ILLUSTRATIVE del árbol un usuario y la estación comparten cuatro satélites por encima de { "5" } grados solo en el { "8.2" } % ({ "300" } km) y el { "6.3" } % ({ "600" } km) de las épocas, con geometría casi singular (p95 sin corregir { "3.8" } km frente a < { "10" } m de las fuentes). Las simulaciones de las fuentes usaron un filtro, una restricción de altura y tres satélites en vista común, lo que el tipo de escenario instantáneo no modela. Por tanto, la comparación ni confirma ni refuta el 'submétrico en todo el polo sur' publicado. Muestra que el resultado de este modelo depende de órbitas que no están publicadas. No es una afirmación sobre ningún sistema real; no está afiliado a ningún organismo ni avalado por él
