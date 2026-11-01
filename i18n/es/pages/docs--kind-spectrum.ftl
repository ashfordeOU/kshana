# docs--kind-spectrum: translations (es)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> No se proporciona — Kshana modela las prestaciones de la señal, no el hardware de carga útil ni de antenas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de escenario del motor v{ $version }, familia <a1>Jamming, spoofing y el espectro</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-5d23d7f8f872 = Página de familia: <a1>Jamming, spoofing y el espectro</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-3319b18ac61f = y { "1" } más en la matriz.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> El tipo de escenario <c1/> ampliado más allá de la banda L: bandas dadas como un diseño de señal preajustado (dibujado con cada componente, limitado en banda al ancho de banda de transmisión, con C/N0 y J/S referidos al componente seguido) o como una portadora y una modulación personalizadas Pruebas: <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Fuente: <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (tipo de escenario)

# text
seg-fef00c827c6a = Modelo de espectro en banda L y cascada: toda la banda L de GNSS como una única densidad espectral de potencia (PSD), con la frecuencia en horizontal y el tiempo hacia abajo, sobre una cronología programada de inhibidores. SEÑALES: GPS L1 C/A y L2C (BPSK({ "1" })), servicio abierto Galileo E1 (MBOC(6,1,1/11) o BOC({ "1,1" })), GPS L5 y Galileo E5a (BPSK({ "10" })), cada una en su portadora con la potencia recibida mínima de la especificación de interfaz (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) salvo que se sustituya; GLONASS, BeiDou y Galileo E6 no se modelan. INHIBIDORES: tono de onda continua, ruido de banda estrecha plano, chirp lineal en diente de sierra y ruido de banda ancha adaptado a la propia modulación de una banda, cada uno con un centro, un ancho de banda, una potencia recibida (directa, o PIRE y distancia mediante la pérdida de trayecto en espacio libre del tipo de escenario de jamming) y tiempos de encendido y apagado. Cada inhibidor se puntúa frente a cada banda por su coeficiente de separación espectral kappa sobre el ancho de banda del receptor, y (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para un inhibidor, esto equivale a la ecuación antiinterferencia del tipo de escenario de jamming con Q = 1/(R_c kappa), y el informe lleva esa comprobación cruzada (y la cifra de Q representativa del tipo de escenario de jamming a su lado). El suelo de ruido es k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }). La cascada promedia cada celda sobre su intervalo y su fila (los chirps con exactitud, barridos completos más el parcial; los inhibidores que conmutan a mitad de fila, según su ciclo de trabajo), de modo que la cronología de C/N0 y la imagen salen de los mismos números; result.json lleva la cuadrícula promediada por bloques en potencia, C/N0 y J/S por banda y fila, y por inhibidor y banda el SSC, Q, J/S, J/S en banda y C/N0 estacionaria. [iq] opcional: el modelo dibujado como IQ complejo en un instante, escrito y leído de vuelta desde una grabación SigMF (cf32_le o ci16_le) y comparado con una estimación de Welch. [recording] opcional (compilaciones nativas): la PSD de Welch de una grabación SigMF real junto al modelo. VALIDATED: las PSD de las señales frente a los anchos de lóbulo principal de los libros de texto (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados en +/-1.023 MHz) y los coeficientes de separación espectral frente a sus formas cerradas de Parseval y la Q de Kaplan & Hegarty = { "1" } (CW) y { "1.5" } (adaptada). MODELLED: las potencias de los inhibidores, la cronología, los anchos de banda del frontal, el tratamiento de espectro continuo (sin líneas de código) y la ausencia de AGC, supresión y diagrama de antena.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Una ejecución de <c1/> se resume así: escenario spectrum | { "5" } bandas | { "3" } inhibidores | suelo de ruido -202.0 dBW/Hz | peor banda gps-l1ca C/N0 mínima { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = El ejemplo <c1/> establece, entre otros:

# text
seg-df78607f9cdb = Etiqueta del resultado (la del motor): MODELLED: una densidad espectral de potencia en banda L construida a partir de espectros de señal de forma cerrada (VALIDATED frente a los anchos de lóbulo principal de los libros de texto y a los coeficientes de separación espectral), espectros de inhibidores y un suelo de ruido kT, reducida a J/S y C/N0 efectiva mediante el coeficiente de separación espectral. Las potencias de los inhibidores, t

# attr:alt
seg-ea1678eb9e84 = El gráfico que el motor genera para scenarios/l-band-waterfall-jamming.toml, tipo de escenario spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Densidades espectrales de potencia de área unitaria de GPS L1 C/A y L2C (BPSK({ "1" })), GPS L5 y Galileo E5a (BPSK({ "10" })), BOC({ "1,1" }) seno y Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, con una variante MBOC añadida), sus nulos localizados numéricamente y

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> El tipo de escenario <c1/>: una cuadrícula de frecuencia por tiempo de la densidad espectral de potencia en banda L (suelo térmico k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }), las señales en sus potencias recibidas mínimas de la especificación de interfaz, y de onda continua, de banda estrecha

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: lectura y escritura de grabaciones Signal Metadata Format (JSON .sigmf-meta con los campos core global, captures y annotations; .sigmf-data en bruto como cf32_le, ci16_le o ci8, los decodificadores de enteros compartidos con realdata::iqif::load_iq), todo en s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Densidades espectrales de potencia de área unitaria de GPS L1 C/A y L2C (BPSK({ "1" })), GPS L5 y Galileo E5a (BPSK({ "10" })), BOC({ "1,1" }) seno y Galileo E1 MBOC(6,1,1/11) (navsignal::M. Referencia independiente (ExternalDataset): Valores publicados de libros de texto: el lóbulo principal de BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo y los coeficientes antiinterferencia Q = { "1" } para un inhibidor de banda estrecha (CW) y Q = { "1.5" } para un inhibidor de espectro ensanchado adaptado a C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3.ª ed., sección { "9.4" }); los lóbulos principales de BOC(m,n) centrados en más o menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); el

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> El tipo de escenario <c1/>: una cuadrícula de frecuencia por tiempo de la densidad espectral de potencia en banda L (suelo térmico k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }), las señales en las. Referencia independiente (InternalConsistency): Reducción a la ecuación antiinterferencia y al balance de enlace del tipo de escenario <c2/> existente (el mismo código, llamado con las mismas entradas), y la forma cerrada del suelo de ruido k T0 F. Los espectros de señal subyacentes son la fila validada anterior; las potencias de los inhibidores, la cronología y los anchos de banda del frontal son entradas del escenario, los espectros son continuos (sin líneas de código de ensanchamiento), y ningún control automático de ganancia, supresión ni diagrama de antena actúa sobre el j

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: lectura y escritura de grabaciones Signal Metadata Format (JSON .sigmf-meta con los campos core global, captures y annotations; .sigmf-data en bruto como cf32_le, ci1. Referencia independiente (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) con la misma ventana de Hann periódica, solapamiento, escalado de densidad, sin eliminación de tendencia y promedio de media bilateral: cada intervalo dentro de { "1e-12" } relativo (observado { "6.0e-14" }) sobre { "27" } casos, con los recuentos de segmentos tomados del propio espectrograma de scipy. sigmf-python { "1.13.0" } (LGPL-3.0, ejecutado como herramienta) escribe cinco grabaciones de terceros (cf32_le, ci16_le, ci8, dos capturas con anotaciones, una de desfase no nulo

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = estructura de líneas del código de ensanchamiento (por ejemplo las líneas de { "1" } kHz de C/A): los tonos se puntúan frente a la envolvente suave (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = control automático de ganancia, cuantificación, supresión de pulsos y filtrado de muesca (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = el diagrama de la antena receptora hacia el inhibidor más allá de una única cifra de ganancia (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = interferencia de acceso múltiple dentro del sistema entre satélites de una misma banda (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 y Galileo E6 (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = las emisiones de una señal diseñada fuera de su ancho de banda de transmisión: su espectro se trunca allí, de modo que ninguna emisión fuera de banda llega a una banda vecina (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = el efecto de un chirp sobre el lazo con velocidades de barrido comparables al ancho de banda del lazo: su C/N0 usa el espectro promediado por filas (resultado <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: una densidad espectral de potencia en banda L construida a partir de espectros de señal de forma cerrada (VALIDATED frente a los anchos de lóbulo principal de los libros de texto y a los coeficientes de separación espectral), espectros de inhibidores y un suelo de ruido kT, reducida a J/S y C/N0 efectiva mediante el coeficiente de separación espectral. Las potencias de los inhibidores, la cronología y los anchos de banda del frontal son entradas del escenario, no mediciones. (resultado <c1/>)

# text
seg-95879767c438 = Página temática: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Anterior</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Siguiente</s1>spoof-detect

seg-a349aa76b0ed = PARTNER
