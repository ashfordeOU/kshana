# docs--kinds-jamming-spoofing-and-the-spectrum: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-98e740d32860 = Banco de pruebas de evaluación de detección de deterioros de RF mediante aprendizaje automático ({ "13494" }): genera un corpus SINTÉTICO etiquetado y fundamentado en parámetros (nominal/jamming/spoof-time/spoof-position/multipath), puntúa un detector (energy|agc|sqm|parity|fused) con el arnés independiente del detector, e informa de AUC/ROC/confusión + Pd por clase a una Pfa objetivo, además de la brecha de optimismo dentro frente a fuera de la distribución. Solo características operativas MODELLED: nunca de campo/IQ, sin veredicto bueno/malo.

# attr:alt
seg-7e7b07bc5545 = El gráfico que el motor escribe para scenarios/impairment-eval.toml, tipo de escenario impairment-eval

# text
seg-60bf3f0ff000 = Jamming con presupuesto de enlace: J/S → C/N₀ efectivo → pérdida de enganche.

# attr:alt
seg-42d46b928d09 = El gráfico que el motor escribe para scenarios/jamming-demo.toml, tipo de escenario jamming

# text
seg-fef00c827c6a = Modelo de espectro en banda L y cascada: toda la banda L de GNSS como una única densidad espectral de potencia (PSD), con la frecuencia en horizontal y el tiempo hacia abajo, sobre una cronología programada de inhibidores. SEÑALES: GPS L1 C/A y L2C (BPSK({ "1" })), servicio abierto Galileo E1 (MBOC(6,1,1/11) o BOC({ "1,1" })), GPS L5 y Galileo E5a (BPSK({ "10" })), cada una en su portadora con la potencia recibida mínima de la especificación de interfaz (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) salvo que se sustituya; GLONASS, BeiDou y Galileo E6 no se modelan. INHIBIDORES: tono de onda continua, ruido de banda estrecha plano, chirp lineal en diente de sierra y ruido de banda ancha adaptado a la propia modulación de una banda, cada uno con un centro, un ancho de banda, una potencia recibida (directa, o PIRE y distancia mediante la pérdida de trayecto en espacio libre del tipo de escenario de jamming) y tiempos de encendido y apagado. Cada inhibidor se puntúa frente a cada banda por su coeficiente de separación espectral kappa sobre el ancho de banda del receptor, y (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para un inhibidor, esto equivale a la ecuación antiinterferencia del tipo de escenario de jamming con Q = 1/(R_c kappa), y el informe lleva esa comprobación cruzada (y la cifra de Q representativa del tipo de escenario de jamming a su lado). El suelo de ruido es k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }). La cascada promedia cada celda sobre su intervalo y su fila (los chirps con exactitud, barridos completos más el parcial; los inhibidores que conmutan a mitad de fila, según su ciclo de trabajo), de modo que la cronología de C/N0 y la imagen salen de los mismos números; result.json lleva la cuadrícula promediada por bloques en potencia, C/N0 y J/S por banda y fila, y por inhibidor y banda el SSC, Q, J/S, J/S en banda y C/N0 estacionaria. [iq] opcional: el modelo dibujado como IQ complejo en un instante, escrito y leído de vuelta desde una grabación SigMF (cf32_le o ci16_le) y comparado con una estimación de Welch. [recording] opcional (compilaciones nativas): la PSD de Welch de una grabación SigMF real junto al modelo. VALIDATED: las PSD de las señales frente a los anchos de lóbulo principal de los libros de texto (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados en +/-1.023 MHz) y los coeficientes de separación espectral frente a sus formas cerradas de Parseval y la Q de Kaplan & Hegarty = { "1" } (CW) y { "1.5" } (adaptada). MODELLED: las potencias de los inhibidores, la cronología, los anchos de banda del frontal, el tratamiento de espectro continuo (sin líneas de código) y la ausencia de AGC, supresión y diagrama de antena.

# attr:alt
seg-ea1678eb9e84 = El gráfico que el motor genera para scenarios/l-band-waterfall-jamming.toml, tipo de escenario spectrum

# text
seg-f43fe94d84e0 = Detector combinado de spoofing por RF y por medidas (consistencia RAIM multi-SV + AGC + SQM, fusionados) frente a un ataque parametrizado (ventaja de potencia, alineación de fase de portadora, empuje de tiempo o de posición; al estilo TEXBAT).

# attr:alt
seg-268ebf4cba99 = El gráfico que el motor genera para scenarios/spoof-detect.toml, tipo de escenario spoof-detect

# text
seg-cbd77f6ffd63 = Detector estocástico de spoofing de tiempo (Neyman–Pearson / χ²₁) con P_fa/P_md por Monte Carlo.

# attr:alt
seg-6f6a8c975111 = El gráfico que el motor genera para scenarios/spoof-attack.toml, tipo de escenario spoof

# text
seg-f6ff1c8c78db = Pérdida de enganche del lazo de seguimiento: C/N0 -> enganche y pérdida de enganche CON HISTÉRESIS, el tiempo que se tarda en perder el enganche y el pull-in de spoofing en función de la TASA de desfase de código y de portadora. Los criterios de denegación y de captura que ya tiene el motor son cocientes de potencia recibida (un inhibidor deniega con J/S = { "30" } dB, un spoofer captura con { "3" } dB); la pérdida de enganche real no es un cociente de potencia, es el punto en que la fluctuación de un lazo más el estrés dinámico agotan su presupuesto de umbral de seguimiento. Indica ({ "1" }) la fluctuación térmica de 1 sigma de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N0, con la pérdida por elevación al cuadrado incluida, frente a las reglas indicadas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (la regla de los 15 grados en forma de tres sigma) y { "3" }</em>sigma_DLL + retardo de rampa <= d/2 chips; ({ "2" }) los umbrales de C/N0 de pérdida y de reenganche con el lazo determinante nombrado, el umbral de reenganche DERIVADO del mayor ancho de banda con el que un receptor vuelve a capturar y no afirmado, de modo que el ancho de la histéresis debe quedar entre { "5" }<em>log10(ratio) y { "10" }</em>log10(ratio) dB; ({ "3" }) el tiempo declarado hasta perder el enganche de un detector de enganche de dos umbrales con permanencias de confirmación, accionado sobre una rampa de C/N0, indicado por separado del tiempo físico de escape de fase (el tiempo medio de Viterbi entre saltos de ciclo, en log10 s porque abarca cientos de décadas); ({ "4" }) los límites de pull-in de spoofing: la mayor deriva de código y la mayor tasa Doppler de portadora que pueden seguir los lazos de una víctima, con un mapa sobre ambos ejes, porque un spoofer que se desplaza más rápido que estos no captura el lazo, lo deja atrás; y ({ "5" }) el RADIO DE DENEGACIÓN que implica la dinámica del lazo, indicado JUNTO AL radio existente por cociente de potencia, nunca en su lugar, con su diferencia con signo como campo propio con nombre (denial_radius_delta_km) y una definición a su lado. Cada campo numérico emitido lleva una unidad y una clase de procedencia. Formas cerradas VALIDATED: las expresiones de fluctuación de portadora y de código, la reducción del filtro de lazo sqrt({ "2" }<em>B_n</em>T) y el retardo de rampa de primer orden se contrastan con el propio correlador sdr del motor avanzado sobre FI sintética con semilla (una vía distinta a los mismos números) hasta { "0.6" } %, { "3.7" } % y { "0.17" } % respectivamente, y la Bessel modificada I0 que hay tras el tiempo de salto de ciclo con valores tabulados estándar hasta { "1e-7" }. El límite inferior de validez se afirma, no solo se indica: por debajo de ~{ "32" } dB-Hz a { "1" } ms el discriminador atan real se satura contra su rango de +-pi/2 y mide menos fluctuación que cualquier teoría lineal. MODELLED: los anchos de banda de lazo, el tiempo de integración, el espaciado del correlador, la relación de ancho de banda de pull-in, las permanencias de confirmación, la potencia del inhibidor y las ganancias de antena son cifras representativas de banda, no una hoja de datos. NO modelado: la fluctuación del oscilador (desviación de Allan) y la vibración, la limitación del ancho de banda del frontal, el multitrayecto, la dinámica del AGC, la pérdida por transición de bits de datos, la ayuda externa y cualquier corrección de medio ciclo a la fórmula de salto de ciclo de Costas. Bajo la dinámica del lazo, la captura por spoofing no tiene radio alguno (la restricción determinante es la tasa de desfase, no la potencia), de modo que ese campo es nulo con una razón y no una cifra inventada. No es un producto certificado de rendimiento de receptores.

# attr:alt
seg-72182c1aecd9 = El gráfico que el motor genera para scenarios/tracking-loop.toml, tipo de escenario tracking-loop

# text
seg-4e31c8daf798 = Registro

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Fuente: <c1/>

# text
seg-d4ae70a5d619 = Jamming, spoofing y el espectro (familia de tipos de escenario)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Páginas temáticas: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Ejecute uno: <c1/>. Todas las familias: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia Jamming, spoofing y el espectro

# text
seg-bbbd87f888b9 = Pérdida de enganche del lazo de seguimiento: C/N0 -> enganche/desenganche CON HISTÉRESIS, el tiempo que se tarda en perder el enganche y la captura por spoofing en función de la TASA de desplazamiento de código y de portadora.

# text
seg-e37f1e071b2c = Modelo de espectro de la banda L y cascada: toda la banda L de GNSS como una única densidad espectral de potencia (PSD), con la frecuencia en horizontal y el tiempo hacia abajo, sobre una cronología de jammers guionizada.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Banco de pruebas de evaluación de la detección de degradaciones de RF mediante aprendizaje automático ({ "13494" }): genera un corpus SINTÉTICO etiquetado y fundamentado en parámetros (nominal/jamming/spoofing de tiempo/spoofing de posición/multitrayecto), puntúa un detector (energy/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionales: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Campos obligatorios: <c1/>. Opcionales: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>spoof-detect</a1>.

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-c65b9d45bdcc = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>tracking-loop</a1>.

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
seg-5024b537d000 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Anterior</s1>Fusión inercial y sensores cuánticos

# text
seg-6b9b04e59491 = <s1>Siguiente</s1>Navegación en órbita terrestre baja
