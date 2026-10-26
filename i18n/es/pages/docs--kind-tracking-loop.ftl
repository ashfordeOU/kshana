# docs--kind-tracking-loop: translations (es)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = sin valor

# text
seg-59afd80736c5 = <b>PARTNER</b> No se proporciona — Kshana modela las prestaciones de la señal, no el hardware de carga útil ni de antenas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de escenario del motor v{ $version }, familia <a1>Jamming, spoofing y el espectro</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-5d23d7f8f872 = Página de familia: <a1>Jamming, spoofing y el espectro</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> El informe <c1/> ya no apoya su contorno de denegación en un único escalar.

# text
seg-05e8854de548 = chip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Fuente: <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (tipo de escenario)

# text
seg-f6ff1c8c78db = Pérdida de enganche del lazo de seguimiento: C/N0 -> enganche y pérdida de enganche CON HISTÉRESIS, el tiempo que se tarda en perder el enganche y el pull-in de spoofing en función de la TASA de desfase de código y de portadora. Los criterios de denegación y de captura que ya tiene el motor son cocientes de potencia recibida (un inhibidor deniega con J/S = { "30" } dB, un spoofer captura con { "3" } dB); la pérdida de enganche real no es un cociente de potencia, es el punto en que la fluctuación de un lazo más el estrés dinámico agotan su presupuesto de umbral de seguimiento. Indica ({ "1" }) la fluctuación térmica de 1 sigma de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N0, con la pérdida por elevación al cuadrado incluida, frente a las reglas indicadas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (la regla de los 15 grados en forma de tres sigma) y { "3" }</em>sigma_DLL + retardo de rampa <= d/2 chips; ({ "2" }) los umbrales de C/N0 de pérdida y de reenganche con el lazo determinante nombrado, el umbral de reenganche DERIVADO del mayor ancho de banda con el que un receptor vuelve a capturar y no afirmado, de modo que el ancho de la histéresis debe quedar entre { "5" }<em>log10(ratio) y { "10" }</em>log10(ratio) dB; ({ "3" }) el tiempo declarado hasta perder el enganche de un detector de enganche de dos umbrales con permanencias de confirmación, accionado sobre una rampa de C/N0, indicado por separado del tiempo físico de escape de fase (el tiempo medio de Viterbi entre saltos de ciclo, en log10 s porque abarca cientos de décadas); ({ "4" }) los límites de pull-in de spoofing: la mayor deriva de código y la mayor tasa Doppler de portadora que pueden seguir los lazos de una víctima, con un mapa sobre ambos ejes, porque un spoofer que se desplaza más rápido que estos no captura el lazo, lo deja atrás; y ({ "5" }) el RADIO DE DENEGACIÓN que implica la dinámica del lazo, indicado JUNTO AL radio existente por cociente de potencia, nunca en su lugar, con su diferencia con signo como campo propio con nombre (denial_radius_delta_km) y una definición a su lado. Cada campo numérico emitido lleva una unidad y una clase de procedencia. Formas cerradas VALIDATED: las expresiones de fluctuación de portadora y de código, la reducción del filtro de lazo sqrt({ "2" }<em>B_n</em>T) y el retardo de rampa de primer orden se contrastan con el propio correlador sdr del motor avanzado sobre FI sintética con semilla (una vía distinta a los mismos números) hasta { "0.6" } %, { "3.7" } % y { "0.17" } % respectivamente, y la Bessel modificada I0 que hay tras el tiempo de salto de ciclo con valores tabulados estándar hasta { "1e-7" }. El límite inferior de validez se afirma, no solo se indica: por debajo de ~{ "32" } dB-Hz a { "1" } ms el discriminador atan real se satura contra su rango de +-pi/2 y mide menos fluctuación que cualquier teoría lineal. MODELLED: los anchos de banda de lazo, el tiempo de integración, el espaciado del correlador, la relación de ancho de banda de pull-in, las permanencias de confirmación, la potencia del inhibidor y las ganancias de antena son cifras representativas de banda, no una hoja de datos. NO modelado: la fluctuación del oscilador (desviación de Allan) y la vibración, la limitación del ancho de banda del frontal, el multitrayecto, la dinámica del AGC, la pérdida por transición de bits de datos, la ayuda externa y cualquier corrección de medio ciclo a la fórmula de salto de ciclo de Costas. Bajo la dinámica del lazo, la captura por spoofing no tiene radio alguno (la restricción determinante es la tasa de desfase, no la potencia), de modo que ese campo es nulo con una razón y no una cifra inventada. No es un producto certificado de rendimiento de receptores.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Una ejecución de <c1/> se resume así: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> pérdida { "25.4744" } dB-Hz (determina la portadora), reenganche { "27.4413" } dB-Hz, histéresis { "1.9669" } dB | pérdida de enganche declarada { "39.101" } s después del inicio de la rampa | radio de denegación por umbral (J/S { "30" } dB) { "127.413" } km frente a dinámica del lazo { "53.1694" } km, delta -74.2438 km | pull-in de spoofing <= { "0.966" } chip/s de código y { "41.45" } Hz/s de portadora (lazo MODELLED, formas cerradas VALIDATED)

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
seg-7614718317f4 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = El ejemplo <c1/> establece, entre otros:

# text
seg-773fff0feaf7 = bracketed

# text
seg-23f3aa5c2064 = Etiqueta del resultado (la del motor): MIXED — formas cerradas del lazo VALIDATED, configuración del lazo MODELLED. Las expresiones de fluctuación térmica de portadora y de código, la reducción del filtro de lazo sqrt({ "2" }<em>B_n</em>T) y el retardo de rampa de primer orden se contrastan con el propio correlador sdr del motor avanzado sobre FI sintética con semilla (una vía distinta

# attr:alt
seg-72182c1aecd9 = El gráfico que el motor genera para scenarios/tracking-loop.toml, tipo de escenario tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Pérdida de enganche calculada a partir de la dinámica del lazo en lugar de un cociente de potencia: fluctuación térmica de 1σ de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N₀ con la pérdida por elevación al cuadrado, frente a las reglas indicadas 3σ_PLL + θ_e ≤ { "45" }° y 3σ_DLL + retardo de rampa

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Pérdida de enganche calculada a partir de la dinámica del lazo en lugar de un cociente de potencia: fluctuación térmica de 1σ de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N₀ con la. Referencia independiente (ReferenceImpl): El propio correlador sdr del motor (sdr::correlate / synth_if / CaCode) avanzado sobre FI sintética con semilla a un C/N₀ calibrado: una vía de código separada que llega a los mismos números por correlación numérica de IQ muestreada y no mediante una expresión algebraica de fluctuación, de modo que es una vía distinta y no una reformulación, más valores tabulados estándar de la Bessel modificada I₀ para el término de salto de ciclo. Teoría de lazos según Kaplan & Hegar

# text
# c1: label
seg-de048f9cf1f6 = MIXED — formas cerradas del lazo VALIDATED, configuración del lazo MODELLED. Las expresiones de fluctuación térmica de portadora y de código, la reducción del filtro de lazo sqrt({ "2" }<em>B_n</em>T) y el retardo de rampa de primer orden se contrastan con el propio correlador sdr del motor avanzado sobre FI sintética con semilla (una vía distinta a los mismos números), y la Bessel modificada I0 con valores tabulados estándar. MODELLED: los anchos de banda de lazo, la integ (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: los anchos de banda de lazo, el tiempo de integración, el espaciado del correlador, la relación de ancho de banda de pull-in, las permanencias de confirmación, la potencia del inhibidor y las ganancias de antena son cifras representativas de banda, no una hoja de datos. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = NO modelado: la fluctuación del oscilador (desviación de Allan) y la vibración, la limitación del ancho de banda del frontal, el multitrayecto, la dinámica del AGC, la pérdida por transición de bits de datos, la ayuda externa y cualquier corrección de medio ciclo a la fórmula de salto de ciclo de Costas. (catálogo de tipos (<c1/>))

# text
seg-f8d50cbc6f2c = Todo parámetro del lazo que figura a continuación es una cifra representativa de banda MODELLED, no una hoja de datos. (comentario del archivo de escenario, línea { "22" })

# text
seg-9241a57823cd = --- geometría del lazo ----------------------------------------------------------------- Un lazo de portadora Costas de { "10" } Hz y un lazo de código asistido por portadora de { "1" } Hz, integración coherente de { "1" } ms (un periodo del código C/A, de modo que no se supone sincronización de bits de datos), correlador estrecho de { "0.5" } chip. (comentario del archivo de escenario, líneas { "25" } a { "28" })

# text
seg-3a677e343081 = La pérdida de enganche del lazo de seguimiento y el pull-in de spoofing bajo interferencia son MODELLED, no validados: se comprueban frente a una implementación distinta dentro de este mismo código, independiente de la unidad sometida a prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Anterior</s1>timetransfer
