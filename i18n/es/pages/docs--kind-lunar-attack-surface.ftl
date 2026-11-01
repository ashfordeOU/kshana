# docs--kind-lunar-attack-surface: translations (es)

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Balance de enlace J/S geométrico, C/N₀ antiinterferencia, pérdida de enganche por satélite. Referencia independiente (InternalConsistency): ecuación del balance de enlace de C/N₀ antiinterferencia contrastada con una rederivación independiente en numpy (comparte la misma forma cerrada → InternalConsistency) más una caracterización de la degradación de C/N₀ de JammerTest-2024 real. { "0.30" } ronda { "2" }, bloqueado (sigue siendo MODELLED): no se ejecutó la comparación de la caída de C/N0 medida en JammerTest { "2024" } con una predicción del balance de enlace (preregistrada 6a66994b, dentro de { "3" } dB) porque la posición y el apuntamiento de la antena F8.1 en

# text
seg-143f3f1cc521 = La resiliencia a la inhibición en entornos sin GNSS es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
# c1: docs/kinds/by-kind/lunar-attack-surface.md
seg-c14d2343d802 = Fuente: <c1/>

# text
# c1: lunar-attack-surface
seg-9c0b5e933472 = <c1/> (tipo de escenario)

# text
seg-004c56ded47f = Superficie de ataque a la seguridad de señales de navegación en la superficie lunar (P1): compone los análisis abiertos de seguridad de señales en una única ejecución alcanzable desde el binario. Informa de ({ "1" }) la potencia recibida de AFS y su SUPERÁVIT de potencia frente a una referencia terrestre de GPS, además de la banda de sensibilidad de 12-18 dB como un barrido genuino multieje sobre las entradas del enlace (nivel de referencia x EIRP x distancia oblicua) con la conciliación del factor lineal de 25x redondeado / 28x sin redondear. REVISADO (regla R4): esto informaba de un DÉFICIT de potencia de { "15.6" } dB y de un factor de 32x/36x hasta que se corrigió la referencia de GPS de -125 / -128.5 (que son las cifras en dBm) a -155 / -158.5 dBW, los valores del ICD-GPS-200 que el módulo de jamming siempre ha llevado. El signo se invierte: la señal AFS lunar modelada es { "14.4" } dB MÁS FUERTE que la de GPS L1 C/A terrestre, no más débil. La potencia recibida en sí no se movió ni un bit, y el factor lineal es el antiguo dividido exactamente por { "1000" }, que es exactamente el desfase de { "30" } dB de dBm a dBW; ({ "2" }) la potencia de transmisión que necesita el atacante para falsificar (J/S = { "3" } dB) y para denegar (J/S = { "30" } dB) a cada distancia de seguridad, la inversa del enlace J/S; ({ "3" }) la huella de captura orbital bajo un patrón real de antena de apertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), un casquete subhemisférico limitado por altitud cuyo limbo NO se captura; ({ "4" }) un resultado calculado de enganche forzado de captura de falsificación del lazo de seguimiento (si un falsificador de código coincidente con una ventaja de potencia y un desfase de código dados arrastra realmente el DLL/PLL) en lugar del umbral afirmado de { "3" } dB; ({ "5" }) el alcance del horizonte geométrico de un transmisor de superficie elevado en un cuerpo sin atmósfera; y ({ "6" }) el presupuesto de autenticación OSNMA/TESLA (sobrecarga de { "20" } bit/s = ~{ "40" } % de un mensaje de navegación AFS de { "50" } bit/s, latencia de divulgación de clave, falsificación { "2" }^-40). Un cuerpo vacío reproduce la línea base de P1; toda entrada tiene un valor por defecto y puede sobrescribirse. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (radiometría en dB de forma cerrada; ida y vuelta de J/S inverso; patrón de Airy frente a Bessel de A&S y geometría de casquete esférico; enganche forzado de DLL/PLL frente a Kaplan & Hegarty; identidad de horizonte tangente esférico frente a eo_payload; dimensionado de campos del SIS-ICD de OSNMA). MODELLED: las magnitudes representativas de geometría/potencia y los valores concretos de las celdas del mapa de captura. No es un producto de seguridad certificado.

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Una ejecución de <c1/> se resume así: lunar-attack-surface | AFS -140.6 dBW, superávit { "14.4" } dB (banda -17.9–-12.0, superávit { "25" }×/28×) | falsificación@{ "1000" } m { "0.000" } W | huella { "3" }% casquete, limbo falso | captura de falsificación true (enganche { "0.00" } s) | alcance de mástil { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% de { "50" } bit/s), latencia de { "30" } s | barrido de huella 7x5 (alt 20-500 km x HPBW 1.83-29.20 deg), captura 0.6-42.9% | limbo NO alcanzado en esta cuadrícula (mejor -0.8 dB, { "3.8" } dB por debajo; necesita { "19.8" } dBW frente a { "16.0" } dBW)

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-781a7094b955 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

# text
# c1: scenarios/lunar-attack-surface.toml
seg-87e0c97de011 = El ejemplo <c1/> establece, entre otros:

# text
seg-6ea8f1132b57 = lineal

# text
seg-8b701f465117 = log

# attr:alt
seg-de295af20c55 = El gráfico que el motor escribe para scenarios/lunar-attack-surface.toml, tipo de escenario lunar-attack-surface

# text
seg-c853e3e832c0 = <b>MODELLED</b> Barrido de dos ejes de la huella de captura en superficie ponderada por el patrón y limitada por altitud sobre la altitud del transmisor y el diámetro del plato, emitida una fila por punto de operación. Referencia independiente (InternalConsistency): Inclusión de conjuntos: la razón interferente-señal entra como un desplazamiento uniforme en decibelios, de modo que el conjunto capturado a mayor potencia de transmisión contiene al conjunto capturado a una menor y la fracción solo puede aumentar; una propiedad que el patrón de Airy NO da en anchura de haz ni en altitud, donde la región capturada se rompe en anillos y la fracción es genuinamente no monótona. Ninguna tabla publicada da la fracción de disco capturado de un transmisor orbital lunar

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED: las magnitudes representativas de geometría/potencia y los valores concretos de las celdas del mapa de captura. (catálogo de tipos de escenario (<c1/>))

# text
seg-95be70748647 = La huella de captura frente a la altitud y la anchura de haz es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Siguiente</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Anterior</s1>lunar-ascent
