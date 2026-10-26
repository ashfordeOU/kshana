# docs--kind-leo-signal: translations (es)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-1918189ac2bf = ppm

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
seg-ae15d15bf151 = Página temática: <a1>LEO-PASS.md</a1>

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: la integral seno (sine_integral), la fracción de potencia BPSK-R dentro de una banda de doble cara en forma cerrada (bpsk_power_in_band_closed_form), la band-. Referencia independiente (ExternalDataset): Fijados externamente: { "90.3" } por ciento de potencia del lóbulo principal, la fluctuación coherente early-late en el punto de operación declarado, los valores de la tabla de la integral seno y el coeficiente de separación espectral propia de BPSK 2/({ "3" } R_c) con desplazamiento cero. Solo comprobaciones cruzadas internas, no validación externa: la forma cerrada del ancho de banda de Gabor de BPSK limitada en banda y su asíntota, y el coeficiente de separación espectral de BPSK desplazada con desplazamientos distintos de cero, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> El tipo de escenario <c1/>: diseños de señal parametrizados (banda, ancho de banda de transmisión, asignación ITU; componentes de adquisición, de datos y piloto con BPSK(n), BOC(m,n), MB. Referencia independiente (InternalConsistency): Las formas cerradas validadas de las dos filas anteriores, la identidad de falsa alarma de ley cuadrática P_d(snr = { "0" }) = P_fa y el tiempo medio de adquisición de Holmes, y la reducción a la propia cadena SSC del tipo de escenario de espectro (el mismo código Jammer::ssc). Los diseños en sí son entradas: los preajustes marcados REPRESENTATIVE o WORKSHOP no son especificaciones publicadas, los espectros de QPSK de Feher mejorada, de code shift keying y de OFDM son aproximados, y la forma

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Fuente: <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (tipo de escenario)

# text
seg-97b8d07150d4 = Diseños de señal LEO-PNT: señales parametrizadas de posicionamiento, navegación y temporización (PNT) de órbita terrestre baja (LEO) para cualquier sistema, banda y estructura. Una SEÑAL es una banda (frecuencia central, ancho de banda de transmisión, asignación ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) y componentes (adquisición, datos, piloto; cualquier subconjunto), cada uno con una modulación (BPSK(n) con n fraccionario, BOC(m,n), MBOC({ "6,1" },p) o una banda plana de tipo OFDM), un reparto de potencia, desplazamientos de subportadora FDMA opcionales, una longitud de código y una tasa de datos. Las señales proceden de archivos de preajuste públicos compilados (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada uno con su URL de fuente y cada valor no publicado etiquetado REPRESENTATIVE) o se escriben en línea. POR SEÑAL: la densidad espectral de potencia limitada en banda y la fracción de la potencia de cada componente que deja pasar la banda de transmisión (forma cerrada de BPSK junto al valor numérico), el ancho de banda RMS (Gabor), la fluctuación de ruido térmico del seguimiento de código del lazo de enganche de retardo frente a C/N0 y el espaciado early-late a partir de la fórmula early-late coherente (o no coherente) limitada en banda de Betz & Kolodziejski { "2009" } con su forma de manual de banda ilimitada y su cota de Gabor de espaciado evanescente, la precisión de distancia en metros, el espacio de búsqueda de adquisición (casillas de Doppler a partir del Doppler máximo de la órbita más términos de oscilador y de usuario, por casillas de código), la probabilidad de detección de ley cuadrática y el tiempo medio de adquisición serie y paralelo de código, el coeficiente de separación espectral de la señal respecto de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b y E5 AltBOC y de cada una respecto de la señal con la degradación de C/N0, y el J/S CW, de banda ancha y adaptado que tolera el componente seguido, a partir de la propia maquinaria SSC del tipo de escenario de espectro. Un ESTUDIO DE BANDAS: retardo ionosférico de primer orden ({ "40.3" } TEC/f^{ "2" }), pérdida en espacio libre, precisión de distancia a igual C/N0 y a igual EIRP, y tolerancia a jammers. Las COMPROBACIONES DE FORMA opcionales contrastan el espectro de un diseño con una medición descrita (coherencia MODELLED). VALIDATED: las formas cerradas de potencia BPSK en banda ({ "90.3" } % en el lóbulo principal) y de ancho de banda de Gabor, la fluctuación limitada en banda que se reduce a la forma early-late coherente de los manuales y a su cota de Gabor, el coeficiente de separación espectral de BPSK desplazada frente a su forma cerrada de Parseval, el área unidad del espectro AltBOC, y el Doppler LEO máximo frente a las cifras publicadas de Xona Pulsar (32-34 kHz) y de Iridium ({ "36" } kHz). MODELLED: todo diseño, reparto de potencia, C/N0 y nivel de jammer; los espectros EFQPSK, CSK y OFDM son aproximados.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Una ejecución de <c1/> se resume así: escenario leo-signal | { "5" } señales | suelo de ruido -202.0 dBW/Hz | medición de distancia más fina generic-c-wide { "0.022" } m a { "45.0" } dB-Hz

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-b538d3ff9fdb = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/leo-band-trade.toml
seg-6aaf62f55e65 = El ejemplo <c1/> establece, entre otros:

# text
seg-9fd02351d844 = ms

# text
seg-05e8854de548 = chip

# text
seg-d12bc1d2b815 = coherente

# text
seg-0f29946fe4fb = Etiqueta de resultado (la del motor): MODELLED: diseños de señal parametrizados de posicionamiento, navegación y temporización (PNT) de órbita terrestre baja (LEO), limitados en banda a su ancho de banda de transmisión. Las formas cerradas subyacentes son VALIDATED (potencia BPSK en banda y ancho de banda de Gabor, la fluctuación de seguimiento de código early-late limitada en banda que se reduce a la forma de los manuales

# attr:alt
seg-8bf45b6989d1 = El gráfico que el motor escribe para scenarios/leo-band-trade.toml, tipo de escenario leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: la integral seno (sine_integral), la fracción de potencia BPSK-R dentro de una banda de doble cara en forma cerrada (bpsk_power_in_band_closed_form), el ancho de banda de Gabor de BPSK limitada en banda en forma cerrada (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: el mayor Doppler de satélite en un paso por la vertical a la máscara de elevación para una órbita circular, v R_E cos(el) / (R_E + h) por f / c, a partir de la portadora y la altitud orbital propias de cada preajuste; el tipo de escenario <c1/> añade o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> El tipo de escenario <c1/>: diseños de señal parametrizados (banda, ancho de banda de transmisión, asignación ITU; componentes de adquisición, de datos y piloto con BPSK(n), BOC(m,n), MBOC o espectros planos, repartos de potencia, subportadoras FDMA, longitudes de código y tasas de datos Pruebas: <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> El tipo de escenario <c1/> ampliado más allá de la banda L: bandas dadas como un diseño de señal preajustado (dibujado con cada componente, limitado en banda al ancho de banda de transmisión, con C/N0 y J/S referidos al componente seguido) o como una portadora y una modulación personalizadas Pruebas: <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: el mayor Doppler de satélite en un paso por la vertical a la máscara de elevación para una órbita circular, v R_E cos(el) / (R_E + h) por f / c,. Referencia independiente (ExternalDataset): Cifras publicadas: Doppler máximo de Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler de Iridium de hasta +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Se omite la rotación terrestre, que desplaza la cifra hasta unos { "2.3" } kHz; ambas cifras publicadas se alcanzan sin ella.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = los espectros exactos de QPSK de Feher mejorada, de code shift keying y de OFDM: los sustituye una envolvente BPSK de chip rectangular o una banda plana, como indica cada preajuste (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = la estructura de líneas del código de ensanchamiento y la correlación cruzada de acceso múltiple entre códigos (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = los filtros de transmisión y de recepción más allá de una pared ideal al ancho de banda de transmisión: sin emisión fuera de banda, sin retardo de grupo del filtro (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = multitrayecto, cuantización del receptor y control automático de ganancia (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = la rotación terrestre en la cota de Doppler (hasta unos { "0.46" } km/s de velocidad de variación de distancia en el ecuador) (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = el retardo ionosférico más allá del primer orden y el reparto del contenido electrónico por encima y por debajo de un satélite LEO: el TEC oblicuo es una entrada (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = las pérdidas atmosféricas, por lluvia y de polarización: solo se compara la pérdida en espacio libre (la lluvia importa en banda C) (resultado <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = la adquisición más allá de una única permanencia con una penalización por falsa alarma: sin lógica de verificación de múltiples permanencias, con una distribución previa uniforme de fase de código y el peor caso de cruce entre casillas (resultado <c1/>)

# text
seg-8eefe4197d7f = <s1>Anterior</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Siguiente</s1>link-budget
