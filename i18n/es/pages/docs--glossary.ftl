# docs--glossary: translations (es)

# attr:aria-label, text
seg-daf25c6479c1 = Normas

# attr:title, text
seg-c851aa23ea42 = valores separados por comas

# text
seg-366c59b03b4f = CSV

# text
seg-cb273d6705c6 = SVG

# text
seg-49a994d77d2f = oscilador de cristal con compensación de temperatura

# text
seg-1bac97ee312a = patrón atómico de frecuencia de rubidio

# text
seg-b09ffb8a9095 = Monte Carlo

# text
seg-9939da5da283 = JSON

# text
seg-5907283b71da = Abreviatura

# text
seg-900c7c7e99cd = GMAT

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = sesgo entre sistemas

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = ruido de proyección cuántica

# text
seg-430b3c681347 = RTKLIB

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-e464509f3abb = relación entre portadora y densidad de ruido

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = identificador de objeto digital

# text
seg-d41af8f18aed = GLONASS

# text
seg-1df73b95ae4d = IAU

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = Marco de Referencia Celeste Internacional

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Estación Espacial Internacional

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8104773e1484 = STK

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = frecuencia ultraalta

# text
# c1: docs/GLOSSARY.md
seg-6ce4c2164aee = Fuente: <c1/>

# text
seg-bee5d056ef03 = Definiciones en lenguaje llano de los términos usados en Kshana. Cada entrada empieza con un «en pocas palabras» de una línea y luego añade el significado preciso donde ayuda. Las abreviaturas no definidas en una sección están en la tabla de la A a la Z cerca del final, <a1>Todas las demás abreviaturas, de la A a la Z</a1>.

# text
seg-f8c5433d1026 = Navegación y temporización

# text
seg-2a42d84608ea = <b>PNT: posicionamiento, navegación y temporización.</b> Saber <em>dónde</em> está, <em>hacia dónde</em> va y <em>qué hora es</em>, con precisión. La PNT moderna procede sobre todo de señales de satélite (GNSS, los sistemas globales de navegación por satélite que se definen a continuación); Kshana estudia lo que ocurre con el <em>tiempo</em> y la <em>posición</em> cuando se pierden esas señales.

# text
seg-6227db2c94e1 = <b>GNSS: sistema global de navegación por satélite.</b> Las constelaciones de satélites que proporcionan PNT: GPS (el Sistema de Posicionamiento Global, EE. UU. (Estados Unidos de América)), Galileo (UE), GLONASS (el sistema global de navegación por satélite de Rusia), BeiDou (China). Un receptor que ve ≥ { "4" } satélites puede calcular una solución completa de posición 3D y de hora.

# text
seg-f8eda357e640 = <b>Interrupción / denegación / degradación / inhibición del GNSS.</b> Cuando las señales de los satélites no están disponibles (bloqueadas, inhibidas o fuera de vista). Durante una interrupción, el sistema debe «avanzar por inercia» con sus propios sensores a bordo. Todo el propósito de Kshana es medir lo bien que lo hace.

# text
seg-a3ade199f465 = <b>Holdover.</b> En pocas palabras: <em>cuánto tiempo puede el reloj mantener la hora correcta por sí solo tras perder el GNSS.</em> Un reloj mejor aguanta más antes de que su error cruce el límite permitido.

# text
seg-83b33c15312f = <b>Navegación por estima.</b> En pocas palabras: <em>estimar dónde está sumando el movimiento medido, sin ninguna referencia exterior.</em> Los errores se acumulan, así que un sensor inercial mejor se desvía más despacio.

# text
seg-da9bcc994b9c = <b>Especificación / umbral.</b> El error máximo permitido antes de que la solución cuente como «fuera de especificación», p. ej., «la temporización debe mantenerse dentro de { "20" } ns» o «la posición dentro de { "100" } m».

# text
seg-6f37a60a30c7 = Los sensores que compara Kshana

# text
seg-308b59d89586 = <b>Reloj (reloj atómico).</b> Un dispositivo que mantiene la hora contando la oscilación natural de un átomo. Dos ejemplos aquí:

# text
seg-3389d08be6bc = <b>CSAC: reloj atómico a escala de chip.</b> Un reloj comercial, pequeño y ya desplegado (la referencia «clásica»). Bueno, pero se desvía de forma notable en una interrupción larga.

# text
seg-3e121d8e6400 = <b>Reloj de red óptica (p. ej., de estroncio).</b> Un reloj «cuántico» mucho más estable; lo más avanzado en laboratorio, que aún no ha volado en el espacio.

# text
seg-4daa6cdf8ae2 = <b>Acelerómetro.</b> Mide la aceleración (el cambio de movimiento). Integrada dos veces, da la posición, por lo que cualquier error crece rápidamente. El <b>acelerómetro de átomos fríos</b> es la versión cuántica, con una estabilidad a largo plazo mucho mejor; el de <b>grado de navegación</b> es el clásico.

# text
seg-91793676c57c = <b>Giroscopio.</b> Mide la rotación. Un pequeño error de rotación inclina la plataforma, lo que filtra la gravedad hacia la dirección horizontal y corrompe la estimación de posición.

# text
seg-2d36110effc3 = <b>IMU: unidad de medida inercial.</b> El propio conjunto de acelerómetro y giroscopio: tres ejes de cada uno, que informa de la fuerza específica y de la velocidad angular. Mide el movimiento; por sí sola no sabe dónde está.

# text
seg-e3b6b40e0cd0 = <b>INS: sistema de navegación inercial.</b> Una IMU más la «mecanización» que integra su salida en actitud, velocidad y posición. El INS es lo que avanza por estima durante una interrupción del GNSS, y su exactitud la fijan los procesos de error de la IMU que se enumeran más abajo.

# text
seg-a618ff7ee429 = <b>Transferencia de tiempo.</b> Enviar una señal horaria precisa entre dos lugares (p. ej., de satélite a satélite). Los enlaces <b>ópticos</b> son mucho más precisos que los enlaces de <b>RF</b> (radiofrecuencia).

# text
seg-847fbbeecfae = Cómo se modelan los errores (ruido de reloj)

# text
seg-5cf197bdbbad = El error del reloj se construye a partir de «tipos de ruido» estándar, cada uno con una firma conocida:

# text
# c1: q_wf
seg-3806d1b1cb50 = <b>FM blanca (modulación de frecuencia blanca).</b> En pocas palabras: <em>fluctuación rápida y aleatoria en la frecuencia del reloj.</em> Al promediarla mejora con el tiempo. Parámetro <c1/>.

# text
# c1: q_rw
seg-0793fdd3abab = <b>FM de paseo aleatorio.</b> En pocas palabras: <em>la frecuencia del reloj deambula lentamente.</em> Domina en las interrupciones largas. Parámetro <c1/>.

# text
# c1: flicker_floor
seg-42b74c8b88ff = <b>FM de parpadeo (ruido 1/f).</b> En pocas palabras: <em>un suelo de ruido persistente por debajo del cual el reloj nunca puede promediar.</em> Es plano a lo largo de los tiempos de promediado. Parámetro <c1/>.

# text
# c1: drift
seg-b3bd841a5a2d = <b>Envejecimiento / deriva.</b> Un cambio lento y <em>predecible</em> de la frecuencia con el tiempo; como es predecible, el estimador de Kshana lo elimina. Parámetro <c1/>.

# text
# c1: q_va
seg-d929960492e4 = <b>VRW: paseo aleatorio de velocidad.</b> El equivalente en el acelerómetro del ruido blanco: impulsos aleatorios en la velocidad que se acumulan hasta formar error de posición. Parámetro <c1/>.

# text
# c1: q_arw
seg-4a97f8d14174 = <b>ARW: paseo aleatorio angular.</b> El equivalente en el giroscopio: impulsos aleatorios en la orientación. Parámetro <c1/>.

# text
seg-dcd03b326110 = Cómo se mide la estabilidad

# text
# c1: σ_y(τ)
# c2: τ
# c3: σ_y(1 s) = 3×10⁻¹⁰
seg-2181832c6253 = <b>Desviación de Allan (<c1/>).</b> En pocas palabras: <em>la forma estándar de indicar lo estable que es un reloj durante un tiempo de promediado dado <c2/>.</em> La hoja de datos de un reloj cita, p. ej., <c3/>. Kshana valida su modelo de reloj calculando la desviación de Allan de su propia salida y comprobando que coincide con la cifra publicada. (Referencia: Riley, NIST SP { "1065" }, National Institute of Standards and Technology Special Publication { "1065" }.)

# text
seg-11cbe561e633 = <b>PSD: densidad espectral de potencia.</b> Cómo se reparte la potencia de un ruido entre las frecuencias; la forma formal de especificar el ruido blanco, de paseo aleatorio o de parpadeo.

# text
seg-0737d620eb5f = Las cifras de mérito (cómo se puntúa una ejecución)

# text
seg-20b66e0d4809 = Las seis cifras de mérito operativas de PNT que informa Kshana (véase la tabla «Output» del README):

# text
seg-b17d08246e49 = <b>FoM: cifra de mérito.</b> Un número que puntúa un aspecto de una ejecución, informado con su unidad y con indicación de si es validado o modelado. Las seis de abajo son las FoM operativas de Kshana.

# text
seg-b229a69fb4ac = <b>Rendimiento de posicionamiento / temporización</b>: el tamaño del error, como RMS (raíz cuadrática media, el promedio cuadrático) y como percentil 95.

# text
seg-ba3ed5a28518 = <b>Autonomía</b>: la duración del holdover (cuánto tiempo se mantiene dentro de especificación sin GNSS).

# text
seg-13ecdd037098 = <b>Resiliencia</b>: con qué rapidez crece el error una vez perdido el GNSS.

# text
seg-be0168f24d6e = <b>Disponibilidad</b>: la fracción de la ejecución que tiene una solución dentro de especificación.

# text
seg-44ef500b371d = <b>Integridad</b>: <em>¿puede fiarse de la propia estimación del sistema sobre su error?</em> Kshana informa de la fracción de muestras de la interrupción cuyo error verdadero permanece dentro del límite de protección del filtro.

# text
seg-d1cc3819cde9 = <b>Seguridad</b>: robustez frente al spoofing: una puntuación de detectabilidad de spoofing basada en la estabilidad del reloj (desde { "v0.3.0" }), con sentido solo cuando se configura un escenario de ataque de spoofing. <em>No</em> es integridad de grado aeronáutico: no calcula ningún nivel de protección horizontal ni vertical (HPL/VPL) y no ejecuta ninguna monitorización autónoma de integridad del receptor (RAIM), avanzada o no. Eso procede de los tipos de escenario independientes de integridad y ARAIM (RAIM avanzado) y se define en «Integridad y aumentación» más abajo. Sujeto a control de exportación.

# text
seg-5cae59204d9e = Términos usados junto con las cifras de mérito:

# text
seg-7adc0e49a981 = <b>Spoofing.</b> En pocas palabras: <em>una señal de satélite falsa que miente sobre la posición o la hora.</em> Un spoofer da al receptor una respuesta verosímil pero errónea, lo que es peor que el jamming porque puede que el receptor no lo note.

# text
seg-2d2e6cbeade6 = <b>1-DOF: un grado de libertad.</b> Un solo eje. El error de posición del paquete de escenarios de Kshana es de un solo eje; una respuesta 3-D completa requiere el modelo de tres ejes.

# text
seg-14a32d281c4b = <b>Conjunto de Monte Carlo.</b> Ejecutar el mismo escenario muchas veces con distintas semillas aleatorias e informar de la dispersión de los resultados en lugar de una sola ejecución.

# text
seg-fcbea49a3592 = <b>CI: intervalo de confianza.</b> El rango en el que se espera que caiga un estadístico con una probabilidad indicada (por ejemplo, { "95" } %). En las tablas y las insignias del README, «CI» suele significar <b>integración continua</b>: la ejecución automática de compilación y pruebas en cada cambio; el contexto indica cuál.

# text
seg-310abfd6a64c = <b>Límite de k sigmas.</b> Un límite fijado en <em>k</em> desviaciones típicas de la propia incertidumbre del filtro; la cifra de mérito de integridad cuenta con qué frecuencia el error verdadero permanece dentro de él.

# text
# c1: src/fom.rs
seg-ad26afbaa7b4 = <b>CEP / 2DRMS: error circular probable / el doble de la raíz de la distancia cuadrática media.</b> Dos formas estándar de expresar la exactitud horizontal en 2-D: el CEP es el radio que contiene el { "50" } % de las soluciones; el 2DRMS es el doble del error horizontal cuadrático medio. La biblioteca puede calcular ambos a partir de una covarianza de posición (<c1/>), pero ningún tipo de escenario los informa todavía.

# text
seg-fd93c1effba8 = Leer un resultado: los términos de la salida

# text
seg-3432498093cf = Estos son los nombres que encuentra en un archivo de resultados o en el resumen del playground, primero en lenguaje llano.

# text
# c1: holdover_s
seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> En pocas palabras: <em>cuántos segundos permaneció el sistema dentro de su límite de error tras perder el GNSS.</em> Kshana informa del avance por inercia más corto de todas las interrupciones de la ejecución, medido en la rejilla temporal de la ejecución, de modo que es una cota inferior a la resolución del paso de tiempo. Un holdover igual a la duración de la interrupción significa que el límite nunca se cruzó.

# text
# c1: timing_p95_ns
# c2: 0.0
seg-e68708a219f1 = <b>p95 (<c1/>).</b> En pocas palabras: <em>el { "95" } % del tiempo, el error de temporización fue así de pequeño o menor.</em> Es el percentil 95 del error durante la interrupción. Un valor muy pequeño puede mostrarse como <c2/> en un resumen corto; el archivo JSON (JavaScript Object Notation) de resultados contiene el número con precisión completa.

# text
# c1: integrity
# c2: INTEGRITY.md
seg-4dfaee63262d = <b>Integridad (<c1/>).</b> En pocas palabras: <em>con qué frecuencia fue honesta la propia estimación de error del sistema.</em> Es la fracción de muestras de la interrupción cuyo error verdadero permaneció dentro del límite de k sigmas del filtro (definido más abajo). Un valor cercano a { "1" } significa que el estimador no subestimó su error. No es un nivel de protección aeronáutico; véase «Integridad y aumentación» más abajo y <a1><c2/></a1>.

# text
# c1: security
# c2: P_md
# c3: security n/a (no attack)
# c4: applicable: false
# c5: figure_tiers
seg-5af09f5129e0 = <b>Puntuación de seguridad (<c1/>).</b> En pocas palabras: <em>qué probabilidad hay de que se detecte un ataque de spoofing.</em> Es la probabilidad de que se detecte el ataque configurado, uno menos la probabilidad de no detección <c2/>, derivada de la estabilidad del reloj. Solo significa algo cuando el escenario configura un ataque de spoofing. Sin ataque configurado, el resumen de una línea imprime <c3/> y el resultado marca la cifra como <c4/> en su bloque <c5/>; el valor permanece en el documento y significa «no aplicable», no «seguridad cero».

# text
# c1: pdop_min
seg-70113d509997 = <b>PDOP: dilución de precisión de posición (claves como <c1/>).</b> En pocas palabras: <em>cuánto amplifica la geometría de los satélites el error de medición de distancia hasta convertirlo en error de posición.</em> El error de posición es aproximadamente el PDOP por el error de medición de distancia, así que cuanto menor, mejor. Véase <b>DOP</b> en «Estimación y geometría».

# text
# c1: σ_y(τ)
# c2: τ
# c3: sigma_y(1 s) = 3e-10
seg-a445bf9a3c5f = <b>sigma_y (<c1/>, la desviación de Allan).</b> En pocas palabras: <em>cuánto oscila la frecuencia de un reloj al promediarla durante un tiempo <c2/>.</em> Una línea de hoja de datos como <c3/> significa que la frecuencia, promediada durante un segundo, varía en torno a { "3" } partes en 10¹⁰. Menor es un reloj más estable. Véase «Cómo se mide la estabilidad» más arriba.

# text
# c1: σ_y²(τ) = q_wf / τ
# c2: q_wf = sigma_y(1 s)²
# c3: q_rw
# c4: drift
seg-03b4bb05148d = <b>q_wf: intensidad del ruido de frecuencia blanco.</b> En pocas palabras: <em>la intensidad de la fluctuación rápida y aleatoria en la frecuencia de un reloj.</em> Es el coeficiente de <c1/> para el ruido de frecuencia blanco, de modo que un escenario fija <c2/> a partir de la desviación de Allan a un segundo de la hoja de datos. Sus compañeros son <c3/> (ruido de frecuencia de paseo aleatorio) y <c4/> (envejecimiento); véase «Cómo se modelan los errores» más arriba.

# text
seg-074a1337ed99 = Términos de temporización en telecomunicaciones

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-9f61398628e4 = Las redes de telecomunicaciones distribuyen la hora por redes de paquetes (Precision Time Protocol) desde un reloj de referencia alimentado por GNSS, y el Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones (ITU-T) fija límites al error de tiempo que puede añadir cada reloj. Estos términos aparecen en el tipo de escenario <c1/>; véase <a1><c2/></a1>.

# text
seg-f48712300b30 = <b>TE: error de tiempo.</b> En pocas palabras: <em>cuánto se aleja la hora de un reloj de la hora de referencia, en un instante.</em> Positivo o negativo, normalmente en nanosegundos.

# text
seg-ceda70656c6a = <b>max|TE|: error de tiempo absoluto máximo.</b> En pocas palabras: <em>el peor error de tiempo visto durante la medición, sin tener en cuenta su signo.</em> Es el límite principal que fijan la mayoría de las máscaras.

# text
seg-38d2922cd91d = <b>cTE: error de tiempo constante.</b> En pocas palabras: <em>la parte de desfase estable del error de tiempo</em>: el error medio que no cambia durante la medición.

# text
seg-a4a61df332cd = <b>dTE: error de tiempo dinámico.</b> En pocas palabras: <em>la parte oscilante del error de tiempo</em>: lo que queda una vez eliminado el desfase constante. Se juzga con MTIE y TDEV.

# text
seg-31c0a85788b1 = <b>MTIE: error máximo de intervalo de tiempo.</b> En pocas palabras: <em>la mayor oscilación del error de tiempo vista dentro de cualquier ventana de una longitud dada.</em> Para cada longitud de ventana, desliza una ventana a lo largo del registro y toma el mayor cambio de pico a pico; una máscara da el mayor valor permitido para cada longitud de ventana.

# text
seg-53fa12cab0c6 = <b>TDEV: desviación de tiempo.</b> En pocas palabras: <em>la deriva típica (cuadrática media) del error de tiempo para un tiempo de promediado dado,</em> una vez promediada la fluctuación a corto plazo. Es un primo en el dominio del tiempo de la desviación de Allan y, como el MTIE, se comprueba frente a una máscara.

# text
seg-62b5eea14f6c = <b>PRTC: reloj de tiempo de referencia primario.</b> El reloj en lo alto de una cadena de temporización de telecomunicaciones, normalmente guiado por GNSS. Sus límites de rendimiento figuran en la Recomendación ITU-T G.8272.

# text
seg-8d6d4538981b = <b>ePRTC: reloj de tiempo de referencia primario mejorado.</b> Un PRTC con un límite de error de tiempo más estricto, respaldado por un reloj atómico local muy estable para poder mantener la hora durante una pérdida larga de GNSS. Recomendación ITU-T G.8272.1.

# text
seg-93fa4ac7c6fa = <b>T-BC: reloj de frontera de telecomunicaciones.</b> Un reloj de red que recibe la hora de aguas arriba y la transmite aguas abajo, añadiendo un pequeño error de tiempo propio. Recomendación ITU-T G.8273.2.

# text
seg-52d32a5db6b8 = <b>T-TSC: reloj esclavo de tiempo de telecomunicaciones.</b> El reloj al final de la cadena, que recibe la hora y la sirve al equipo que la necesita (por ejemplo, una estación base de radio). También lo cubre la Recomendación ITU-T G.8273.2.

# text
seg-04d8ed12ca88 = <b>OCXO: oscilador de cristal controlado por horno.</b> Un oscilador de cuarzo mantenido a temperatura constante dentro de un pequeño horno, lo que lo hace mucho más estable que un oscilador de cuarzo ordinario. Un reloj de holdover habitual en equipos de red; envejece (se desvía) de forma notable a lo largo de días.

# text
seg-6742f7ba35ac = <b>CSAC: reloj atómico a escala de chip.</b> Un reloj atómico muy pequeño (véase «Los sensores que compara Kshana» más arriba). Más estable que un OCXO en holdovers largos, a mayor coste y consumo.

# text
seg-c0e0c18bd867 = Niveles de evidencia: VALIDATED, MODELLED, PARTNER

# text
# c1: VERIFICATION-MATRIX.md
seg-61c0aa107fd9 = Cada capacidad de la matriz de verificación comprobada por máquina (<a1><c1/></a1>) lleva uno de tres niveles.

# text
seg-13fb20435df3 = <b>VALIDATED.</b> En pocas palabras: <em>comprobado frente a la respuesta de otro.</em> La salida de la capacidad se comparó con una referencia independiente externa (datos medidos reales, una biblioteca independiente escrita por otra persona, o valores de referencia publicados) y coincidió dentro de una tolerancia indicada. Una comprobación de integración continua rechaza una fila VALIDATED que no nombre ninguna referencia independiente externa.

# text
# c1: MODELLED-RATIONALE.md
seg-a5dfb48e4dcb = <b>MODELLED.</b> En pocas palabras: <em>construido a partir de una física sólida y comprobado en cuanto a coherencia interna, pero aún no comparado con una respuesta externa.</em> Las cifras tienen sentido para comparar y para compromisos de diseño; no son evidencia de que un dispositivo real vaya a comportarse así. <a1><c1/></a1> explica por qué cada una de esas filas es modelada.

# text
seg-0512b2d2145a = <b>PARTNER.</b> En pocas palabras: <em>esta parte pertenece a un socio de hardware o de garantía de producto, y Kshana no afirma nada sobre ella.</em> La fila existe para que la laguna sea visible y no quede en silencio.

# text
seg-278dee6d3d4c = Términos de espectro e interferencia

# text
# c1: spectrum
# c2: SPECTRUM.md
seg-285a240c9958 = Estos términos aparecen en el tipo de escenario <c1/>; véase <a1><c2/></a1>.

# text
seg-db4fdef1c562 = <b>BPSK(n): modulación por desplazamiento de fase binaria a n × { "1.023" } Mchip/s.</b> La modulación de chip rectangular de GPS L1 de adquisición gruesa (C/A) y L2 civil (L2C) (n = { "1" }) y de GPS L5 y Galileo E5a (n = { "10" }). Su espectro es un sinc² con nulos cada n × { "1.023" } MHz.

# text
seg-cdd0f4194f42 = <b>BOC(m, n): portadora con desplazamiento binario.</b> Un código de ensanchamiento a n × { "1.023" } Mchip/s multiplicado por una subportadora de onda cuadrada a m × { "1.023" } MHz, que divide el espectro en dos lóbulos a cada lado de la portadora.

# text
seg-35ae5134f2c5 = <b>MBOC(6,1,1/11): portadora con desplazamiento binario multiplexada.</b> La densidad espectral de potencia 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), acordada para el servicio abierto de Galileo E1 y GPS L1C; Galileo la transmite como BOC compuesta (CBOC).

# text
seg-7423f94e3018 = <b>CW: onda continua.</b> Una portadora sin modular: un único tono.

# text
seg-55d03dd4af03 = <b>J/S: relación entre inhibidor y señal.</b> La potencia recibida del inhibidor sobre la potencia recibida de la señal, en decibelios.

# text
seg-b0f2974647d4 = <b>SSC: coeficiente de separación espectral.</b> κ = ∫ G_s(f) G_j(f) df sobre la banda del receptor: qué parte del espectro de un interferente de potencia unidad cae donde cae el de la señal. La densidad efectiva de portadora a ruido es [1/(C/N₀) + (J/S)·κ]⁻¹.

# text
seg-c5affeee5269 = <b>Figura de ruido.</b> Cuánto añade un receptor al ruido térmico, como una razón F en decibelios; la temperatura de ruido del sistema es T_ant + { "290" } K × (F − { "1" }).

# text
seg-5307c38d3036 = <b>Cascada (waterfall).</b> Una imagen tiempo-frecuencia de un espectro: la frecuencia en horizontal, el tiempo hacia abajo y el color para la potencia.

# text
seg-3b1ac094fdc5 = <b>Estimación de Welch.</b> Una densidad espectral de potencia estimada promediando periodogramas con ventana y solapados (Welch { "1967" }).

# text
# c1: .sigmf-meta
# c2: .sigmf-data
# c3: cf32_le
# c4: ci16_le
# c5: ci8
seg-9901d64fb895 = <b>SigMF: formato de metadatos de señal.</b> Un formato de grabación abierto: un archivo JSON <c1/> que describe un archivo <c2/> en bruto de muestras (aquí complejas <c3/>, <c4/> o <c5/>).

# text
seg-83041671f422 = <b>IQ: en fase y en cuadratura.</b> Las dos componentes de una muestra compleja en banda base.

# text
seg-39e6ea8506b3 = Términos de señal LEO-PNT

# text
# c1: leo-signal
# c2: spectrum
# c3: LEO-SIGNAL.md
seg-36452ee3f5cc = Estos términos aparecen en el tipo de escenario <c1/> y en los escenarios multibanda <c2/>; véase <a1><c3/></a1>.
