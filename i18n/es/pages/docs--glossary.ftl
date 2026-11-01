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

# text
seg-8363a15f3c5a = <b>LEO-PNT: posicionamiento, navegación y temporización en órbita terrestre baja.</b> Señales de navegación difundidas desde satélites situados a entre unos cientos y unos { "1200" } km de altura: más potentes y de movimiento más rápido que el GNSS de órbita terrestre media.

# text
seg-523469643156 = <b>RNSS, RDSS, MSS, EESS: Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> Asignaciones de servicio de la UIT (Unión Internacional de Telecomunicaciones) en las que puede situarse una banda.

# text
seg-d1e494623341 = <b>Componentes piloto, de datos y de adquisición.</b> Las partes de una señal: un piloto sin datos para medir distancias, un componente de datos que transporta el mensaje de navegación y un componente de adquisición breve y de baja tasa que es fácil de encontrar.

# text
seg-cce232b7cd6a = <b>FDMA: acceso múltiple por división de frecuencia.</b> Componentes o satélites separados por la frecuencia de portadora y no por el código.

# text
seg-9d9476ee62b1 = <b>Ancho de banda de Gabor (RMS).</b> β = √(∫ f² G df / ∫ G df) sobre la banda del receptor: la dispersión de la potencia de una señal en frecuencia, que determina con qué finura puede medir distancias.

# text
seg-6febe9c2e506 = <b>DLL: lazo de enganche de retardo.</b> El lazo de seguimiento del código; el espaciado de su correlador early-late y su ancho de banda de ruido fijan el jitter térmico de la medida de distancia.

# text
seg-5a55da97daf9 = <b>EFQPSK: modulación por desplazamiento de fase en cuadratura de Feher mejorada.</b> Una modulación de envolvente constante (Xona Pulsar); aquí se aproxima con un espectro de chips rectangulares.

# text
seg-6dcbf1de9904 = <b>OFDM: multiplexación por división de frecuencias ortogonales.</b> Una forma de onda multiportadora (el enlace descendente de Starlink); aquí se dibuja como una banda plana.

# text
seg-548b285c7c8e = <b>TEC: contenido total de electrones.</b> Electrones por metro cuadrado a lo largo del trayecto; { "1" } TECU = 10¹⁶ el/m². El retardo ionosférico de primer orden es { "40.3" }·TEC/f² metros.

# text
seg-dd7e0743f364 = <b>EIRP: potencia isótropa radiada equivalente.</b> Potencia de transmisión multiplicada por la ganancia de la antena hacia el receptor.

# text
seg-aba3b3eaba85 = Integridad y aumentación

# text
seg-eab1b2c6728e = La integridad es la cuestión de la <em>confianza</em>: no «¿qué tamaño tiene mi error?», sino «¿puedo acotarlo y se me avisará cuando se rompa la cota?». Estos son los términos aeronáuticos para ello.

# text
# c1: src/raim.rs
seg-696a73449c49 = <b>RAIM: monitorización autónoma de la integridad por el receptor.</b> En palabras sencillas: <em>el receptor contrasta los satélites entre sí.</em> Con más satélites que los cuatro que necesita una posición, los sobrantes (los residuos) deberían ser pequeños; un residuo grande significa que un satélite miente, y el receptor puede decirlo sin ayuda de tierra. Implementado en <a1><c1/></a1>.

# text
# c1: ARAIM_REFERENCE.md
seg-89237433f01a = <b>ARAIM: monitorización autónoma avanzada de la integridad por el receptor.</b> La forma moderna, de doble frecuencia y multiconstelación, del RAIM. Recibe un mensaje de apoyo a la integridad que indica el error supuesto y la probabilidad de fallo de cada satélite, y devuelve niveles de protección en lugar de un indicador de aprobado/fallo. Tratamiento completo, con todos los supuestos, en <a1><c1/></a1>.

# text
# c1: leo-navmsg
seg-4cc13de05193 = <b>SISRE: error de distancia de la señal en el espacio.</b> En palabras sencillas: <em>cuánto se desvía la distancia que mide un usuario típico por la órbita y el reloj que difunde un satélite.</em> El error de órbita se divide en partes radial, a lo largo de la traza y transversal, se pondera según cuánto aparece cada una a lo largo de una línea de vista media y luego se combina con el error de reloj (Montenbruck et al. { "2018" }). Para un satélite de órbita terrestre baja, las partes a lo largo de la traza y transversal pesan mucho más que para GPS, porque los usuarios lo ven muy alejado del nadir. Lo usa el tipo de escenario <c1/>.

# text
# c1: leo-navmsg
# c2: kepler-rac
seg-847e40a033e1 = <b>RAC: radial, a lo largo de la traza, transversal.</b> Las tres direcciones en las que se descompone un error de órbita: hacia fuera desde el centro de la Tierra, a lo largo de la dirección de vuelo y perpendicular al plano orbital. El modelo <c2/> del tipo de escenario <c1/> añade un polinomio de corrección en cada una.

# text
seg-b725d23c839e = <b>SVID: identificador de vehículo espacial.</b> El número que usa un mensaje de navegación para nombrar el satélite que lo envió.

# text
seg-b0f850eb04b1 = <b>IOD: edición de datos.</b> Un contador que cambia siempre que cambia el contenido del mensaje de navegación de un satélite, de modo que un receptor pueda distinguir un mensaje nuevo de una repetición. (No debe confundirse con una demostración en órbita, también abreviada IOD, como en el Celeste IOD de la ESA.)

# text
seg-985a5e9c9ce9 = <b>TOW: tiempo de la semana.</b> Segundos desde el inicio de la semana GNSS en curso (domingo { "00" }:{ "00" }).

# text
# c1: 0x1864CFB
seg-1fc62dca46d6 = <b>CRC-24Q: comprobación de redundancia cíclica de 24 bits (polinomio de Qualcomm).</b> La comprobación de detección de errores que llevan RTCM { "10403" } y los mensajes de Galileo: un resto de 24 bits de los bits del mensaje divididos por el polinomio <c1/>. Un receptor lo recalcula y descarta un mensaje que no coincide.

# text
# c1: sigma_ure_m
# c2: src/raim.rs
seg-abb4679dab23 = <b>URE: error de distancia del usuario.</b> En palabras sencillas: <em>cuánto falsean la órbita y el reloj difundidos por un satélite cada distancia a él.</em> También se llama error de señal en el espacio (SISE); es el presupuesto de error por satélite con el que se alimentan ARAIM y RAIM (<c1/> en <a1><c2/></a1>).

# text
seg-158c210fd3fe = <b>MHSS: separación de soluciones con hipótesis múltiples.</b> El método que usa ARAIM. Para cada forma en que podría fallar la constelación, forma una solución que excluye los satélites sospechosos y acota cuánto puede alejarse esa subsolución de la de todos los satélites a la vista.

# text
seg-671711003a6f = <b>HPL / VPL: nivel de protección horizontal / vertical.</b> En palabras sencillas: <em>el radio dentro del cual el sistema promete que está el error verdadero, con un riesgo de integridad indicado.</em> Es una cota que calcula el algoritmo, no un error medido. Una ejecución está disponible cuando el nivel de protección se mantiene por debajo del límite de alerta que permite la operación (VAL, el límite de alerta vertical; HAL, el horizontal).

# text
# c1: src/sbas.rs
seg-5bbd2d664862 = <b>SBAS: sistema de aumentación basado en satélites.</b> Una red terrestre que vigila el GNSS, calcula correcciones y cotas de integridad y las difunde desde satélites geoestacionarios. <b>WAAS (Wide Area Augmentation System)</b> es el estadounidense; EGNOS (el Servicio Europeo de Navegación por Complemento Geoestacionario) es el equivalente europeo. Kshana calcula niveles de protección en la forma de mínimos cuadrados ponderados de DO-229E (DO-229E es la norma de rendimiento operativo mínimo de la RTCA para receptores SBAS; la RTCA era antes la Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

# text
seg-ba8b448582af = Estimación y geometría

# text
seg-2eb6e72496b8 = <b>Estimador.</b> El algoritmo que predice la posición y la hora verdaderas durante una interrupción a partir del modelo del sensor. Kshana tiene un predictor analítico de holdover y un <b>filtro de Kalman</b>.

# text
seg-9b4aa612c5a9 = <b>Filtro de Kalman.</b> En palabras sencillas: <em>un algoritmo que sigue una magnitud y también sigue cuán incierta es.</em> Kshana usa su cota de incertidumbre para calcular la Integridad.

# text
seg-8fda81dfccc9 = <b>EKF: filtro de Kalman extendido.</b> Un filtro de Kalman para un problema no lineal: linealiza el modelo alrededor de la estimación actual en cada paso. La opción estándar para acoplar el GNSS a un INS.

# text
seg-9bc2c6f74b29 = <b>UKF: filtro de Kalman unscented.</b> El mismo trabajo sin linealizar: hace pasar un pequeño conjunto de puntos de muestra elegidos de forma determinista por el modelo no lineal verdadero y reconstruye la media y la covarianza a partir de dónde caen. Se comporta mejor cuando la no linealidad es fuerte, que es por lo que la determinación de órbita lo usa.

# text
seg-a1e52820e3a0 = <b>DOP: dilución de la precisión.</b> En palabras sencillas: <em>cuánto amplifica la geometría de los satélites el error de medida de distancia hasta convertirlo en error de posición o de tiempo.</em> Error de posición ≈ PDOP × error de medida de distancia, de modo que un número bajo es buena geometría. La familia: <b>GDOP</b> (geométrico: posición y tiempo juntos), <b>PDOP</b> (posición), <b>HDOP</b> (horizontal), <b>VDOP</b> (vertical), <b>TDOP</b> (tiempo).

# text
seg-e769a91a3e4b = <b>Constelación Walker.</b> Una forma estándar de describir una constelación de satélites por su número de planos orbitales y de satélites por plano (GPS es aproximadamente una capa Walker 24/6).

# text
seg-b557933a4e4d = <b>Máscara de elevación.</b> El ángulo mínimo sobre el horizonte local a partir del cual se considera utilizable un satélite; las señales demasiado bajas se excluyen.

# text
seg-3ac8e11c3e33 = <b>Ocultación.</b> Cuando la Tierra bloquea físicamente la línea de vista a un satélite.

# text
# c1: max(elevation mask, skyline)
# c2: SKYLINE.md
seg-249bf472cb00 = <b>Perfil de horizonte (máscara del horizonte).</b> En palabras sencillas: <em>el contorno de edificios, grúas o colinas contra el cielo, como una elevación para cada acimut.</em> Un satélite cuenta como a la vista solo por encima de <c1/> en su acimut, y uno por encima de la máscara pero detrás del perfil de horizonte está «enmascarado por el perfil de horizonte». Kshana construye uno a partir de una tabla, un cañón urbano, sectores y terreno (su máximo punto a punto) o un preajuste REPRESENTATIVE; solo línea de vista, sin reflexión ni difracción (<a1><c2/></a1>).

# text
# c1: SKYLINE.md
seg-620a88820a2d = <b>Geometría del cielo.</b> Qué satélites ve un emplazamiento bajo un perfil de horizonte y qué efecto tiene eso en la solución: los factores DOP, la covarianza este-norte-arriba de la posición por mínimos cuadrados y su <b>elipse de error</b>, la región horizontal que contiene la proporción indicada de las posiciones ({ "95" } % por defecto) para errores de distancia gaussianos independientes e iguales. Geometría MODELLED bajo un modelo de error indicado, no el error real de un receptor (<a1><c1/></a1>).

# text
# c1: src/integrity/mod.rs
seg-f0e610122425 = <b>CTI: integridad de temporización compuesta.</b> Niveles de protección para el <em>tiempo</em> y no para la posición, calculados a lo largo de un traspaso entre distintas fuentes de tiempo (por ejemplo, de un reloj verificado por satélite (con RAIM disponible) a uno en marcha libre en holdover), de modo que la cota siga siendo válida durante la transición (<a1><c1/></a1>).

# text
# c1: src/benchmark/mod.rs
seg-56642f614c3f = <b>TIB: benchmark de integridad de temporización.</b> Una vara de medir para los monitores de temporización <em>de otros</em>: inyecta un menú de fallos y comprueba si el nivel de protección indicado por el monitor acotó realmente su error. No hace ninguna afirmación propia de exactitud, de modo que no puede exagerarla (<a1><c1/></a1>).

# text
seg-8b89f8b913b9 = Órbitas y cislunar

# text
# c1: src/cr3bp.rs
seg-ba6b669eb8ba = <b>CR3BP: problema circular restringido de tres cuerpos.</b> El sistema Tierra–Luna tratado como dos cuerpos en órbitas circulares alrededor de su centro de masas común, más una nave demasiado ligera para ejercer atracción. Cerca de la Luna, una elipse kepleriana de dos cuerpos es sencillamente la forma equivocada; el CR3BP es la dinámica más barata que es correcta (<a1><c1/></a1>).

# text
seg-2726a22bf14c = <b>NRHO: órbita halo casi rectilínea.</b> Una órbita periódica del CR3BP que pasa cerca de un polo lunar y muy lejos del otro, de modo que vista de punta es casi una línea recta, de ahí «casi rectilínea». Es la órbita elegida para el Gateway lunar y mantiene una línea de vista casi continua con la Tierra.

# text
seg-2b2e6d04376c = <b>DRO: órbita retrógrada distante.</b> Otra familia del CR3BP: una órbita grande y estable que rodea la Luna hacia atrás vista en el sistema giratorio.

# text
# c1: finals2000A
# c2: --eop
seg-6bb9229aee5c = <b>EOP: parámetros de orientación de la Tierra.</b> El bamboleo y el giro medidos, ligeramente irregulares, de la Tierra (movimiento polar, UT1 (Tiempo Universal { "1" }, tiempo de rotación terrestre)−UTC, es decir, tiempo de rotación terrestre menos Tiempo Universal Coordinado, y duración del día) que se necesitan para convertir una posición fija a la Tierra en una inercial con mejor precisión que metros. Los publica el IERS (International Earth Rotation and Reference Systems Service); Kshana lee su archivo <c1/> mediante <c2/>.

# text
seg-7f1e7e523e5b = Normas, formatos y organizaciones

# text
seg-5d8d6144c13a = Las abreviaturas que usan el README y las páginas de los paquetes para normas, formatos de archivo, escalas de tiempo, marcos y los organismos que hay detrás. Cada una se escribe también desarrollada en su primer uso en esas páginas.

# text
seg-800d42de0777 = Órbitas, marcos y tiempo

# text
seg-320a1594dcf1 = <b>SGP4 / SDP4: Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Los propagadores analíticos estándar para órbitas de satélites publicadas.

# text
seg-87a098568846 = <b>TLE: conjunto de elementos de dos líneas.</b> El formato público de órbitas que lee SGP4.

# text
seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO: órbita terrestre baja / órbita terrestre media / órbita de transferencia geoestacionaria / órbita geosíncrona inclinada.</b> Regímenes orbitales; la mayoría de los satélites GNSS vuelan en MEO.

# text
seg-1ec323dbd7a6 = LMO: órbita marciana baja.

# text
seg-d0be640282af = <b>ECI / ECEF: inercial centrado en la Tierra / centrado en la Tierra y fijo a la Tierra.</b> Un marco que no gira con la Tierra y otro que sí.

# text
seg-09a937adc1db = <b>TEME: ecuador verdadero, equinoccio medio.</b> El marco en el que sale SGP4.

# text
seg-eb2a80922118 = <b>GCRS / ITRS / ITRF: Geocentric Celestial Reference System / International Terrestrial Reference System / su realización, el International Terrestrial Reference Frame.</b> Los marcos inercial y fijo a la Tierra modernos.

# text
seg-56b24c3734be = <b>CIO: origen intermedio celeste.</b> El punto de referencia de la cadena moderna de rotación terrestre sin equinoccio.

# text
seg-a23b05c85a63 = <b>LVLH: vertical local, horizontal local.</b> Un marco que se mueve con la nave.

# text
seg-ac37217cda0d = <b>WGS-84: World Geodetic System { "1984" }.</b> El elipsoide terrestre que usa GPS.

# text
seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB: Tiempo Universal Coordinado / Tiempo Atómico Internacional / Tiempo Terrestre / Tiempo Universal { "1" } (tiempo de rotación terrestre) / Tiempo Dinámico Baricéntrico.

# text
seg-ea7eb1f34cae = <b>LTC / TCL: tiempo coordenado lunar (Temps-Coordonnée Lunaire).</b> La escala de tiempo propuesta para la Luna.

# text
seg-c6e5976d9dff = <b>OD: determinación de órbita.</b> Recuperar una órbita a partir de medidas de seguimiento.

# text
seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> y <b>DRO</b> se definen más arriba en «Órbitas y cislunar».

# text
seg-2e6ba9069396 = Formatos de archivo y mensajes

# text
seg-ed5ea0a21e3f = <b>SP3: Standard Product { "3" }.</b> El formato de archivo de órbitas precisas del International GNSS Service (IGS), en las versiones c y d.

# text
seg-1bfa0d083935 = <b>RINEX: Receiver Independent Exchange Format.</b> El formato de archivo estándar para observaciones GNSS y efemérides difundidas.

# text
seg-39ce08a9ae66 = IONEX: IONosphere map EXchange format.

# text
seg-c23ea3515008 = <b>OEM / OMM / TDM: Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Mensajes estándar de órbitas y datos de seguimiento del Consultative Committee for Space Data Systems (CCSDS).

# text
seg-b267b32f3087 = <b>TOML: Tom's Obvious, Minimal Language.</b> El formato de texto plano de los escenarios de Kshana.

# text
seg-2795dff8d607 = <b>KIF: Kshana Interchange Format.</b> La envoltura de resultados versionada y autodescriptiva de Kshana.

# text
seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Normas de rendimiento operativo mínimo de la RTCA para receptores SBAS y para equipos aerotransportados GPS con aumentación basada en la aeronave.

# text
seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Las especificaciones de interfaz de GPS (la segunda cubre la señal L5).

# text
seg-2230000aa30b = <b>NIST SP { "1065" }.</b> El <em>Handbook of Frequency Stability Analysis</em> del National Institute of Standards and Technology.

# text
seg-8b89719c1859 = <b>TRL: nivel de madurez tecnológica.</b> Una escala de 1 a 9 de madurez del hardware.

# text
seg-16c972f4ea0a = Organizaciones

# text
seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b>: la Agencia Espacial Europea, su Centro Europeo de Operaciones Espaciales y su red europea de seguimiento espacial.

# text
seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b>: la Administración Nacional de Aeronáutica y del Espacio de EE. UU., su Laboratorio de Propulsión a Chorro, su Navigation and Ancillary Information Facility (que publica el conjunto de herramientas SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) y su Deep Space Network.

# text
seg-eaa5a2a51169 = <b>IGS</b>: el International GNSS Service. <b>IERS</b>: el International Earth Rotation and Reference Systems Service. <b>IAU</b>: la Unión Astronómica Internacional (cuya biblioteca SOFA, Standards of Fundamental Astronomy, y su portado abierto ERFA, Essential Routines for Fundamental Astronomy, son las referencias de marcos de Kshana).

# text
seg-81af4c0f4c48 = <b>CCSDS</b>: el Consultative Committee for Space Data Systems. <b>AIAA</b>: el American Institute of Aeronautics and Astronautics. <b>RTCA</b>: antes la Radio Technical Commission for Aeronautics.

# text
seg-aa0b395df17f = Software y cadena de suministro

# text
seg-b42188d3a6f4 = CLI: interfaz de línea de comandos.

# text
seg-198c591514ab = <b>MCP: Model Context Protocol</b>, el protocolo que habla el servidor de agentes de Kshana. <b>IDE: entorno de desarrollo integrado.</b>

# text
seg-287bf61a1a16 = SBOM: lista de materiales de software.

# text
seg-80d9d4404221 = <b>SLSA: Supply-chain Levels for Software Artifacts</b>, el marco de procedencia de compilación bajo el que se atestiguan las versiones de Kshana.

# text
seg-7487c6f9ed18 = Todas las demás abreviaturas, de la A a la Z

# text
# c1: docs/
seg-56f6039bb38a = Todas las abreviaturas usadas en la documentación del repositorio (<c1/> y los cuatro README) que no define ninguna sección anterior, más algunas que sí define una, repetidas para su consulta. Cada página también desarrolla sus abreviaturas en el primer uso; esta tabla es el único lugar donde consultarlas todas. Algunas entradas son identificadores o nombres y no abreviaturas, y lo indican.

# text
seg-c0dfa446e523 = Significa

# text
seg-f272d28225ae = Dónde aparece

# text
seg-ffb0596f134b = Third Generation Partnership Project

# text
seg-77c1b4478387 = el organismo que redacta las normas 5G, incluidas las redes no terrestres

# text
seg-eaf19768b977 = red móvil de quinta generación

# text
seg-692ddc163c55 = incluido su posicionamiento en redes no terrestres (NTN)

# text
seg-9524be916f07 = ABI

# text
seg-0e8332db764b = interfaz binaria de aplicación

# text
seg-762ea76708dc = etiquetas de wheel de Python

# text
seg-d419d06ed622 = ABMF

# text
seg-b294c714487d = la estación IGS de Le Moule, Guadalupe

# text
seg-586a8ea87638 = un identificador de estación de cuatro caracteres

# text
seg-4cc9a09495e6 = AC

# text
seg-620e2dc5e4ca = corriente alterna

# text
seg-9cfb5dc4b4bc = como en el efecto AC-Stark (desplazamiento luminoso)

# text
seg-90308009c536 = ADD

# text
seg-49d97c65662d = Algorithm Description Document

# text
seg-493b5ceaa0fb = el algoritmo aerotransportado de referencia ARAIM del WG-C

# text
seg-3fe5d7f41dcd = ADEV / OADEV

# text
seg-089ac7d5ac94 = desviación de Allan / desviación de Allan solapada

# text
seg-23c38ecbc543 = véase desviación de Allan más arriba

# text
seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

# text
seg-4b642742f2d4 = números de pieza de sensores inerciales (Analog Devices; Safran Sensonor; MicroStrain)

# text
seg-c4c0a93477a8 = identificadores, no abreviaturas

# text
seg-36743c7fe98e = AEM

# text
seg-142ca108a070 = Attitude Ephemeris Message

# text
seg-c34185a83d8e = un mensaje del CCSDS

# text
seg-dd89e1deb663 = AESS

# text
seg-898b29aaef84 = Aerospace and Electronic Systems Society

# text
seg-78692bf5addf = del IEEE

# text
seg-f429be16014e = AF

# text
seg-afa04bc28b42 = factor de promediado

# text
seg-b3db60632b92 = el múltiplo entero del intervalo de muestreo en un estimador de tipo Allan

# text
seg-6097c4709542 = AFS

# text
seg-7043ab3fe32b = Augmented Forward Signal

# text
seg-20380d29d286 = la señal de navegación lunar de LunaNet

# text
seg-b33d60fa5832 = AGC

# text
seg-98c9c2809bd6 = control automático de ganancia

# text
seg-750b8717220b = un indicador de jamming en el extremo de entrada de un receptor

# text
seg-31b864b910d5 = AHP

# text
seg-f956cbe86552 = Analytic Hierarchy Process

# text
seg-c2b63847e2dc = un método de ponderación multicriterio (Saaty)

# text
seg-0e00edd7e222 = AI / ML

# text
seg-6d804a116a08 = inteligencia artificial / aprendizaje automático

# text
seg-079020f86d22 = AL / HAL / VAL

# text
seg-1981b764715b = límite de alerta / límite de alerta horizontal / límite de alerta vertical

# text
seg-1e52f04eb047 = el error que debe acotar un monitor de integridad

# text
seg-c7ce4d3299b8 = AltBOC

# text
seg-f630bcd1d523 = portadora de desplazamiento binario alternativa

# text
seg-e3acb231cf4d = la modulación E5 de Galileo

# text
seg-79b130764f97 = media aritmética–media armónica (desigualdad)

# text
seg-190b782b70ce = AOCS

# text
seg-6459d9bce282 = sistema de control de actitud y órbita

# text
seg-14ec3e19c990 = AOS / TCA / LOS

# text
seg-7cdb4a7e6df4 = adquisición de señal / tiempo de máxima aproximación / pérdida de señal

# text
seg-8b73e2c51498 = los sucesos de un paso por una estación terrestre (LOS significa también línea de vista; el contexto indica cuál)

# text
seg-27ceb7163571 = API

# text
seg-7903f5ff4027 = interfaz de programación de aplicaciones

# text
seg-d6bea5dea0dc = APID

# text
seg-d468b4555dbf = identificador de proceso de aplicación

# text
seg-55730824c8cf = el campo de cabecera del paquete espacial del CCSDS

# text
seg-611cd7a0d378 = APS

# text
seg-55842a648c47 = American Physical Society

# text
seg-07dcfba8a3c9 = APV

# text
seg-1a7fbb0deef2 = aproximación con guiado vertical

# text
seg-69a6cc8a532a = APV-I: límites de alerta de { "40" } m horizontal y { "50" } m vertical

# text
seg-f357a0a03c60 = ARL

# text
seg-b4ce3803afa6 = longitud media de ejecución

# text
seg-08a5d53f813c = el tiempo medio que tarda un detector de cambios en dar alarma

# text
seg-519e65f68c85 = ARM / ARM64

# text
seg-1db3bdee5f76 = la arquitectura de procesador Arm / su forma de 64 bits

# text
seg-33f6dff869b2 = ASD

# text
seg-dd98c69872e0 = densidad espectral de amplitud

# text
seg-9fb629e35a25 = la raíz cuadrada de una densidad espectral de potencia

# text
seg-a020de5e94e5 = AU

# text
seg-2342680bc7a6 = unidad astronómica

# text
seg-894bf4353ce3 = { "149 597 870.7" } km

# text
seg-611aec9d1dce = AUC / ROC

# text
seg-a11aa1d8f433 = área bajo la curva / característica operativa del receptor

# text
seg-4d65dbf47a5c = evaluación de detectores

# text
seg-25dc893d746a = AWS

# text
seg-20979dc817ba = Amazon Web Services

# text
seg-569160c6e52d = aloja un espejo abierto de las teselas de elevación SRTM

# text
seg-298c6a00085d = BEL

# text
seg-c7ce8fa2c544 = pérdida por entrada en edificios

# text
seg-b714453f9b2c = ITU-R P.2109

# text
seg-b9aec1857aa9 = BI

# text
seg-40ea7b7e321e = inestabilidad del sesgo

# text
seg-ff2ba8692cbc = el mínimo plano de la desviación de Allan de un sensor inercial

# text
seg-e7c1cfecd45e = BIPM

# text
seg-dc138478d882 = Bureau International des Poids et Mesures (Oficina Internacional de Pesas y Medidas)

# text
seg-6ec98084ac58 = publica la Circular T

# text
seg-4ff08facda60 = BKG

# text
seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Agencia Federal Alemana de Cartografía y Geodesia)

# text
seg-ac4765a77015 = gestiona un espejo de datos del IGS

# text
seg-a85954d9176e = BSD

# text
seg-eb42c5807e5a = Berkeley Software Distribution

# text
seg-a332a259125a = como en las licencias BSD

# text
seg-97764c651815 = BSP

# text
seg-8f85848ee08a = SPK binario

# text
seg-6e01dca47581 = un archivo binario de núcleo de efemérides SPICE

# text
seg-0157bbd7a064 = BSTAR

# text
seg-23772d56a24c = el término de resistencia atmosférica de un conjunto de elementos de dos líneas

# text
seg-628e6c686508 = CAI

# text
seg-a2418a88886c = interferómetro de átomos fríos

# text
seg-273a3b8d5385 = véase QUANTUM.md

# text
seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

# text
seg-fa257dda6d45 = CC / CC BY

# text
seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

# text
seg-a1f55ee72524 = una licencia de datos o de texto

# text
seg-1b8df20680a0 = CDDIS

# text
seg-0a158229f571 = Crustal Dynamics Data Information System

# text
seg-5b3f50bed1f6 = el archivo de geodesia espacial de la NASA

# text
seg-ee2ac06a3023 = CDF

# text
seg-0a54599e470d = función de distribución acumulada

# text
seg-6100157bdc02 = CFAR

# text
seg-43ef1f6cd71d = tasa de falsas alarmas constante

# text
seg-b38b56b63da6 = una regla de umbral de un detector de adquisición

# text
seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

# text
seg-4dab086e5c3d = el datum de BeiDou

# text
seg-8f7751d39781 = CIP

# text
seg-e34a194da574 = Celestial Intermediate Pole

# text
seg-c9b37d94f70b = CIRS

# text
seg-29e69d7f32aa = Celestial Intermediate Reference System

# text
seg-a543c4d02ace = CISA

# text
seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

# text
seg-59c481cb5741 = del DHS de EE. UU.

# text
seg-4f7ba1fd1f4c = CM / CL

# text
seg-4fb8507eb747 = civil moderado / civil largo

# text
seg-cc0c8f1524f8 = los dos códigos GPS L2C multiplexados en el tiempo

# text
seg-2ea49f6a1ae9 = CMPL

# text
seg-68b147628ea1 = nivel de protección de modo común

# text
seg-d469cd44d9d4 = la cota de los errores que una prueba de residuos no puede ver

# text
seg-4e25d07b13c9 = CN

# text
seg-e775ec496f2b = newtoniano convergido

# text
seg-5d679a981a34 = la corrección de aberración por tiempo de luz de SPICE

# text
seg-3da9a2841b6c = C/N0 (C/N₀)

# text
seg-cf60da0631b4 = en dB-Hz

# text
seg-f4488db8194d = COPRAS

# text
seg-6379891c1750 = COmplex PRoportional ASsessment

# text
seg-b99fe66bd09c = un método de clasificación multicriterio

# text
seg-a562dbafa35f = COSPAR

# text
seg-c09ea7bc49b0 = Committee on Space Research

# text
seg-235850ad0d1f = emite designadores internacionales de satélites

# text
seg-dbc3e7c90fe0 = CPR

# text
seg-1fd5b461cc3d = ciclo por revolución

# text
seg-a1d4080ce019 = una aceleración orbital empírica a la frecuencia orbital

# text
seg-96cd47b07b44 = CPU / GPU / NPU

# text
seg-10ad2f10bec0 = unidad de procesamiento central / gráfico / neuronal

# text
seg-93621c1a1e37 = CRB / CRLB

# text
seg-70b6a0b19705 = cota de Cramér–Rao / cota inferior de Cramér–Rao

# text
seg-6eb684e34f56 = la menor varianza que puede alcanzar un estimador insesgado

# text
seg-93c4fe0f2990 = CRD

# text
seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

# text
seg-eb95135f849c = archivos de puntos normales del ILRS

# text
seg-f23ff835b9b0 = CRPA

# text
seg-b5c26297e11b = antena de patrón de recepción controlado

# text
seg-7111b9c4d382 = una agrupación de antenas antijamming

# text
seg-404133a74afc = CR / RI

# text
seg-d35896b2bb24 = razón de consistencia / índice aleatorio

# text
seg-cfa91dc02138 = la comprobación de consistencia del AHP (se acepta CR < { "0.10" })

# text
seg-8572a3faf46a = CS GROUP

# text
seg-5e00428ed929 = la empresa francesa que mantiene Orekit

# text
seg-58d5f143ff3b = un nombre de empresa, no una abreviatura que desarrollar

# text
seg-be388831a3e1 = CSK

# text
seg-9cf6cad11f64 = modulación por desplazamiento de código

# text
seg-a3bd162146d6 = CSS

# text
seg-75ddcc97f9e2 = Cascading Style Sheets

# text
seg-0d5c127b2ee5 = CUSUM

# text
seg-d40da5f47035 = suma acumulada

# text
seg-66f752e15abc = un detector secuencial de cambios

# text
seg-92ac0357d01e = CV

# text
seg-28f75c073917 = (vista común en la transferencia de tiempo; el contexto indica cuál)

# text
seg-507b8c235614 = CZML

# text
seg-0b76641dee1a = Cesium Language

# text
seg-fd0a7af2ebeb = el formato de escena JSON de CesiumJS

# text
seg-1aefbc0b799d = dB / dBW / dB-Hz

# text
seg-8a0d954bd13b = decibelio / decibelio-vatio / decibelio-hercio

# text
seg-c485de5bcd85 = relación de potencias, potencia absoluta y una unidad de C/N0

# text
seg-6c0cbce59df5 = DC

# text
seg-ddd7d412fce7 = corriente continua

# text
seg-0ea7fccee332 = el límite de frecuencia cero

# text
seg-521e2abbe12d = DCM

# text
seg-3db4487dc2a4 = matriz de cosenos directores

# text
seg-9d3d9ca79a9d = una matriz de rotación

# text
seg-364a2fcec10b = DCO

# text
seg-110b1eb4f532 = Developer Certificate of Origin

# text
seg-1545bd59f5ef = DCT

# text
seg-8b6866288bea = tabla de control de diseño

# text
seg-80d95f099e9a = una tabla de balance de enlace (el ejemplo de banda X de Galileo de JPL DESCANSO)

# text
seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

# text
seg-ed8d5c361e79 = JPL Development Ephemeris (versiones { "421" }, { "430" }, { "440" }, { "441" })

# text
seg-748af19e3f0b = efemérides planetarias y lunares; "DE-grade" significa una exactitud de esa clase

# text
seg-6f880928ce0c = DEM

# text
seg-eed6ad669d4c = modelo digital de elevación

# text
seg-920f5ff86fa2 = DESCANSO

# text
seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

# text
seg-2e11a1976171 = serie de monografías de JPL

# text
seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Instituto Alemán de Investigación Geodésica de la Universidad Técnica de Múnich)

# text
seg-e7cedd55549e = aloja el EUROLAS Data Center

# text
seg-4389ecd5c81a = DGNSS

# text
seg-fb8c5992354b = GNSS diferencial

# text
seg-3fed847ae9ec = DHS

# text
seg-2845322fad33 = Departamento de Seguridad Nacional

# text
seg-6b487421c547 = EE. UU.

# text
seg-9e06c8655623 = DoD

# text
seg-7a7ea4a3f0d5 = Departamento de Defensa

# text
seg-1f6c4757bee5 = DOF / DoF

# text
seg-e1daefad0696 = grado de libertad

# text
seg-bf5bc69cb873 = véase 1-DOF más arriba

# text
seg-3b5c7c9b324d = DOR / Δ-DOR

# text
seg-3e0b6392f4d9 = medición de distancia diferencial unidireccional / medición de distancia diferencial unidireccional delta

# text
seg-6ba2d3b5b724 = seguimiento angular del espacio profundo

# text
seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

# text
seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

# text
seg-00ecc6de9912 = integradores numéricos

# text
seg-16c4bf2faef3 = DRMS

# text
seg-8128cc0c1482 = raíz cuadrada del error cuadrático medio de la distancia

# text
seg-a8ed04890ded = véase 2DRMS

# text
seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

# text
seg-371644e70b75 = números de documento de hojas de datos de Microchip

# text
seg-f25e5c4de1e5 = DSAC

# text
seg-aa0d8d4b3a3b = Deep Space Atomic Clock

# text
seg-e80350ed521f = el reloj de iones de mercurio atrapados de la NASA

# text
seg-52e838301c0b = UT1 menos UTC

# text
seg-fbce3b3b7b80 = la corrección de la rotación terrestre

# text
seg-8aa996f34920 = energía por bit sobre densidad de ruido

# text
seg-463b21c0b791 = el marco inercial alineado con el marco fijo a la Tierra al inicio de una ejecución

# text
seg-4dc987bd9dbf = usado por las exportaciones de interoperabilidad de leo-pass

# text
seg-61f975df5e21 = ECMAScript / ES

# text
seg-c66e728cd2fa = el estándar en que se basa JavaScript / un módulo ES

# text
seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

# text
seg-2967e958f353 = un modelo de presión solar para GNSS (CODE: Center for Orbit Determination in Europe)

# text
seg-244af4062ccc = ECSS

# text
seg-b74029376aba = Cooperación Europea para la Normalización Espacial

# text
seg-d452e23d503a = ECSS-E-ST-10-02 es su norma de verificación

# text
seg-becb6685ff13 = ED

# text
seg-b6448e14a567 = documento de EUROCAE

# text
seg-ee4ada9c4c6e = como en ED-259A

# text
seg-8a57ce8403b1 = EDL

# text
seg-0f065f2290f3 = entrada, descenso y aterrizaje

# text
seg-69f37001de44 = EEE

# text
seg-18a1b66286ee = piezas eléctricas, electrónicas y electromecánicas

# text
seg-f814c1301059 = garantía de producto espacial

# text
seg-08e455b17435 = EGM / EGM2008

# text
seg-1ed72a253035 = Earth Gravitational Model (la versión de { "2008" })

# text
seg-074e3ceb394e = NGA

# text
seg-69ba7307ea4c = EIGEN

# text
seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

# text
seg-a49ce7809382 = ELECTRE

# text
seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminación y elección que expresa la realidad)

# text
seg-efb2f919955a = un método multicriterio de sobreclasificación

# text
seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, la versión MPP02 (Chapront)

# text
seg-b1d699d70339 = una teoría lunar analítica

# text
seg-aee5eeb23064 = ecuador medio y equinoccio medio de la Tierra de J2000

# text
seg-16d9b8eac95d = un marco inercial

# text
seg-e676d5eec6e3 = EML

# text
seg-f4bba0abbda7 = un discriminador de código

# text
seg-0e4110d33849 = EMT

# text
seg-103c6de62575 = umbral de monitor efectivo

# text
seg-4b2101113387 = una salida de ARAIM

# text
seg-0e2817aec74a = ENU / NED

# text
seg-56d5cf1544d9 = este-norte-arriba / norte-este-abajo

# text
seg-aae7610833a7 = marcos de nivel local

# text
seg-c7d5c5d5c5b2 = EO

# text
seg-24907930c730 = observación de la Tierra

# text
seg-38f9c209c4ac = EPM / EPM2021

# text
seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (la versión de { "2021" })

# text
seg-bd2a27a17f6d = efemérides del IAA RAS

# text
seg-01a8e43fb6c7 = ERA

# text
seg-eb78ffaf7e1d = ángulo de rotación de la Tierra

# text
seg-966ed500f705 = ESKF

# text
seg-e79112a3132a = filtro de Kalman de estado de error

# text
seg-25c6b6b19d75 = ESS

# text
seg-fe2b7be913f0 = tamaño de muestra efectivo

# text
seg-57ce1c1b617b = de un filtro de partículas

# text
seg-f529300f944b = ESSR

# text
seg-869be8388d26 = European Space Software Repository

# text
seg-536d66d208e4 = ESA

# text
seg-27be9c1d7090 = ET

# text
seg-7cc2ef5b0748 = tiempo de efemérides

# text
seg-e0c49639649e = el nombre que da SPICE a TDB

# text
seg-80de6914a5ec = EUROCAE

# text
seg-76897dd8c3be = Organización Europea para el Equipamiento de la Aviación Civil

# text
seg-b4f12b7813dd = EUROLAS

# text
seg-857527c69d6e = Red Láser Europea

# text
seg-fa7025d88c88 = telemetría láser de satélites y de la Luna

# text
seg-13fc009b947c = FAQ

# text
seg-f5581b33ae89 = preguntas frecuentes

# text
seg-67d10fd4a4e0 = FCC

# text
seg-0a558c281968 = Comisión Federal de Comunicaciones

# text
seg-f6ade8c24d27 = FCNN

# text
seg-6098513947b8 = red neuronal totalmente conectada

# text
seg-1de7b4410369 = FD

# text
seg-4e73ff36d37f = diferencia finita

# text
seg-e43312a5fbbe = FDE

# text
seg-d6c9fb239b59 = detección y exclusión de fallos

# text
seg-8f9d11564223 = FES / FES2004

# text
seg-1a1cf1501056 = Finite Element Solution (la versión de { "2004" })

# text
seg-878b4a645ae9 = un modelo de mareas oceánicas

# text
seg-55c14f474a10 = FIM

# text
seg-b68c86e68570 = matriz de información de Fisher

# text
seg-d39671724dfc = hash de Fowler–Noll–Vo, variante 1a

# text
seg-3354ad42f7dd = usado para fijar las salidas de referencia

# text
seg-efca4decfec0 = FOC / IOV

# text
seg-793d96ab9856 = capacidad operativa plena / validación en órbita

# text
seg-ce13cca7f222 = generaciones de satélites (Galileo, Xona Pulsar)

# text
seg-58df7305e218 = FOV / IFOV

# text
seg-cafe1f8733ec = campo de visión / campo de visión instantáneo

# text
seg-4f7168e895d2 = FPGA / MCU / RTOS

# text
seg-abde801ec70b = matriz de puertas programable en campo / unidad de microcontrolador / sistema operativo en tiempo real

# text
seg-a082e4570309 = FSL / FSPL

# text
seg-3a8ee2932a46 = pérdida en espacio libre / pérdida de trayecto en espacio libre

# text
seg-4535dadf79df = ITU-R P.525

# text
seg-c0209066dc76 = GB / KB / MB

# text
seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

# text
seg-8094e61fdd76 = GCRF

# text
seg-6c6337c7a855 = Geocentric Celestial Reference Frame

# text
seg-f050f2b8dee1 = GDAL

# text
seg-98b12fcceb01 = Geospatial Data Abstraction Library

# text
seg-1cef8718c772 = GEO

# text
seg-6131e4ea7858 = órbita geoestacionaria

# text
seg-bf09433a7342 = GeoJSON

# text
seg-f8654e88af67 = Geographic JavaScript Object Notation

# text
seg-70dc52cd5059 = IETF RFC { "7946" }

# text
seg-bb8fbd2ebc28 = GG

# text
seg-b93ed4ab2b79 = gradiente de gravedad

# text
seg-d8ef4d361e86 = como en par de gradiente de gravedad

# text
seg-12fd4eb15c4d = GHz / kHz

# text
seg-0769cc8be024 = gigahercio / kilohercio

# text
seg-3946b69535e4 = GIM

# text
seg-ef5fc608b0e5 = mapa global de la ionosfera

# text
seg-8cbbff1bc1d1 = GINS / KF-GINS

# text
seg-fbe37a571772 = integración GNSS/INS / el conjunto de datos y código de filtro de Kalman GNSS/INS de la Universidad de Wuhan

# text
seg-deca3cbe41ac = GIS

# text
seg-36275ece527d = sistema de información geográfica

# text
seg-ebe8194d12b3 = GIVE

# text
seg-6a99c12984b5 = error vertical ionosférico en la rejilla

# text
seg-20a40777d78a = un término de mensaje SBAS

# text
seg-6fbfc5108833 = gLAB

# text
seg-1be22ebbedc3 = GNSS-Lab Tool

# text
seg-93b2c5b68af0 = un conjunto de procesamiento de datos GNSS distribuido por la ESA

# text
seg-2aa0f3147ad5 = GLIBC

# text
seg-096e00cb9d9b = la biblioteca C de GNU

# text
seg-2630ae5f0bc5 = el Sistema Global de Navegación por Satélite de Rusia (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

# text
seg-361f1f18d454 = GLS

# text
seg-397d58b727ee = mínimos cuadrados generalizados

# text
seg-9bb2492e5d5d = GM

# text
seg-6bd8e46e9131 = parámetro gravitacional

# text
seg-e3a296392ac0 = la constante gravitacional por la masa de un cuerpo

# text
seg-45a8f50bce06 = General Mission Analysis Tool

# text
seg-60d33e61b446 = NASA

# text
seg-1edd65c52f46 = Goddard Mars Model { "3" }

# text
seg-45abee95253b = un campo gravitatorio de Marte

# text
seg-558ea1e07042 = GMST

# text
seg-d3c4914f0d13 = tiempo sidéreo medio de Greenwich

# text
seg-d853b1084a52 = GNC

# text
seg-34a9ddce3d5f = guiado, navegación y control

# text
seg-d33e343f6635 = GPOD

# text
seg-2ef6bb5a52fc = Grid Processing On Demand

# text
seg-14782f821cde = GR

# text
seg-762f364a05f3 = relatividad general

# text
seg-3e3f45ad1178 = GRGM / GRGM660PRIM

# text
seg-948167f5f1c3 = los modelos de gravedad lunar de GRAIL del Goddard de la NASA (GRAIL: Gravity Recovery and Interior Laboratory)

# text
seg-220fae5cfc61 = Geodetic Reference System { "1980" }

# text
seg-bb3c2a337ae8 = GSD

# text
seg-691791646eb3 = distancia de muestreo en el terreno

# text
seg-448d7036fefe = GSE

# text
seg-d05b88e7d5c5 = equipo de apoyo en tierra

# text
seg-95d29f8138f9 = GSFC

# text
seg-2e1460089fed = Goddard Space Flight Center

# text
seg-7680e0663a5b = HDEV / OHDEV

# text
seg-1fd1e3322c86 = desviación de Hadamard / desviación de Hadamard con solapamiento

# text
seg-bb846135ceb4 = una medida de estabilidad insensible a la deriva

# text
seg-0edc4eed2775 = HIL

# text
seg-956a26e1ff6d = hardware en el bucle

# text
seg-48523cdbbbf5 = HMI / MI

# text
seg-d77e079194df = información peligrosamente engañosa / información engañosa

# text
seg-1cbf9d6f135d = regiones del diagrama de Stanford

# text
seg-b320746fafa5 = HP

# text
seg-465a952272f3 = HTML

# text
seg-45a46390d3ba = HyperText Markup Language

# text
seg-25206f1161f0 = IAA RAS

# text
seg-1a4f063e3583 = Instituto de Astronomía Aplicada de la Academia de Ciencias de Rusia

# text
seg-9f434fdc21f2 = IAG

# text
seg-08fb84d2e01a = Asociación Internacional de Geodesia

# text
seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

# text
seg-01880debd7e0 = Asociación Internacional de Geomagnetismo y Aeronomía / su Grupo de Trabajo V-MOD (modelización del campo geomagnético)

# text
seg-28805f15bae8 = mantiene el IGRF

# text
seg-d4ce72152bf2 = IC

# text
seg-fa95c4e7fdc2 = condición inicial

# text
seg-e4c4373d0c76 = ICAO

# text
seg-2fccffbaf4dc = Organización de Aviación Civil Internacional

# text
seg-c2d2d459177d = ICD

# text
seg-a018300615e2 = documento de control de interfaz

# text
seg-433b45040abd = como en el ICD de SIS del OS de Galileo

# text
seg-5e1e49c5000e = ICGEM

# text
seg-c17be0db9e83 = International Centre for Global Earth Models

# text
seg-e9650a618b38 = ID

# text
seg-e40875ab1090 = identificador (o identificación, como en ID del tipo de ruido)

# text
seg-c643488ba1ea = IEEE

# text
seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

# text
seg-91966e2931d4 = IETF / RFC

# text
seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

# text
seg-ce9375732735 = IF

# text
seg-746eae5ce367 = frecuencia intermedia

# text
seg-ed568f55aa8f = muestras del receptor

# text
seg-cb4aaa2581bb = la realización del IGS de ITRF2014

# text
seg-bfa8e6d5d0d1 = IGRF / IGRF14

# text
seg-55fed0afea05 = International Geomagnetic Reference Field

# text
seg-669611e731d0 = IGRF-14 (archivo IGRF14.shc) es la 14.ª generación

# text
seg-f7cf8ff44256 = IGSO

# text
seg-4833bd1e9c03 = órbita geosíncrona inclinada

# text
seg-2080ff6f98fd = IIF

# text
seg-cf7a31e569cd = GPS Block II Follow-on

# text
seg-8a19be8033a9 = una generación de satélites GPS

# text
seg-68cc1c937ce9 = ILRS

# text
seg-53cc8d1f6824 = International Laser Ranging Service

# text
seg-fb5255ba4bc1 = ILS

# text
seg-b8af4d02e031 = mínimos cuadrados enteros

# text
seg-a214c483b8a8 = resolución de ambigüedades

# text
seg-4740fb9ef0b9 = IMCCE

# text
seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

# text
seg-22048a770612 = Observatorio de París; publica INPOP

# text
seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versión 21a

# text
seg-577acd29f11b = unas efemérides planetarias

# text
seg-cdb9ea77f5a6 = IOAG

# text
seg-87f308314cd4 = Interagency Operations Advisory Group

# text
seg-690414990ad8 = ION / ITM

# text
seg-b2fbe0c3507a = Institute of Navigation / su International Technical Meeting

# text
seg-53abad80634c = IoT

# text
seg-9b766d557bd1 = Internet de las cosas

# text
seg-1b41d114662e = IR

# text
seg-ff2d89b32d07 = riesgo de integridad

# text
seg-2dc9fcadccd6 = la probabilidad de información peligrosamente engañosa

# text
seg-02aeac5e2435 = IRE

# text
seg-9c9c0011de8c = Institute of Radio Engineers

# text
seg-3fbae7e11fca = un predecesor del IEEE

# text
seg-9e3d84279d56 = el desfase de reloj entre dos GNSS

# text
seg-2ffee4396fbd = ISL

# text
seg-505dee046f7a = enlace entre satélites

# text
seg-010ea5a76e2e = ISM

# text
seg-330b25f923db = mensaje de apoyo a la integridad

# text
seg-1f5a14efd417 = ARAIM

# text
seg-0ee7fcdaf5a9 = ISO

# text
seg-8c1341375f17 = Organización Internacional de Normalización

# text
seg-8291ac1ccba6 = ISO { "8601" } es su formato de fecha y hora

# text
seg-5b4dee02dccc = ITRF93 / ITRF2020

# text
seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

# text
seg-14dc2a58e2c3 = Sector de Radiocomunicaciones de la Unión Internacional de Telecomunicaciones

# text
seg-0e8094e4d45c = sus Recomendaciones de la serie P modelan la propagación

# text
seg-3e325d97365e = IVS

# text
seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

# text
seg-2dd00d470e14 = JD / MJD

# text
seg-107e6683f70d = fecha juliana / fecha juliana modificada

# text
seg-996d4952554f = JMLR

# text
seg-a1ef35b98931 = Journal of Machine Learning Research

# text
seg-d370f89393c7 = JOSA

# text
seg-12c154fcd073 = Journal of the Optical Society of America

# text
seg-58fb16c8a046 = JRC / JRC122785

# text
seg-82f85268028f = Centro Común de Investigación de la Comisión Europea / uno de sus números de informe

# text
seg-23f5be8ff49e = JS

# text
seg-516ee91e60c5 = JavaScript

# text
seg-02d421e784cd = JavaScript Object Notation

# text
seg-4da0210abab0 = JSTSP

# text
seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

# text
seg-919a951f3d02 = KF

# text
seg-436a208697f1 = filtro de Kalman

# text
seg-9c92e0bc42aa = KML

# text
seg-caf09d501881 = Keyhole Markup Language

# text
seg-ffe25881cef6 = un estándar del OGC leído por Google Earth

# text
seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

# text
seg-e1552da90a21 = etiquetas de tipo de registro del formato de texto propio de Kshana para mensajes de navegación LEO

# text
seg-3269a4e6b3e3 = una extensión de Kshana, no un estándar

# text
seg-b7f0168b6037 = KPI

# text
seg-a5ff89f0923d = indicador clave de rendimiento

# text
seg-1c4a7ccef434 = KSC

# text
seg-73a4bf4da46f = Centro Espacial Kennedy

# text
seg-e401e5d923f0 = KVN

# text
seg-09f93b4d4d0b = Keyword = Value Notation

# text
seg-7379ade4ee0e = la forma de texto de los mensajes CCSDS

# text
seg-a24cf86216d0 = LANS

# text
seg-2ee81a2bc69b = Lunar Augmented Navigation Service

# text
seg-849e3161b64b = LAPACK

# text
seg-3b4f3c08a5ba = Linear Algebra PACKage

# text
seg-69cd99d2f937 = LCG

# text
seg-bcddea3df96d = generador congruencial lineal

# text
seg-8927ca404e64 = el generador de la serie de pruebas NIST SP { "1065" }

# text
seg-0b9b908055cf = LCNS

# text
seg-f9200a1b7246 = Lunar Communications and Navigation Services

# text
seg-5253cae4b05b = el servicio Moonlight de la ESA

# text
seg-2361aef1e2e3 = LCRNS

# text
seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

# text
seg-8fc87d3026e5 = LFSR

# text
seg-bfecf2f88f17 = registro de desplazamiento con realimentación lineal

# text
seg-5b09c8e3f127 = generación de códigos de ensanchamiento

# text
seg-944b45f65820 = LGPL

# text
seg-1e1bf7d7dc79 = GNU Lesser General Public License

# text
seg-0d4d5316b1d8 = LIL

# text
seg-6d040101c6fa = ley del logaritmo iterado

# text
seg-e48d4b1feeaf = LLI / SSI

# text
seg-81ace10136b6 = indicador de pérdida de enganche / indicador de intensidad de señal

# text
seg-7d95179a5a1f = indicadores de observación de RINEX

# text
seg-2ac0ebb389e7 = LLR

# text
seg-29bcbb78931b = telemetría láser lunar

# text
seg-20deda97c876 = LLVM

# text
seg-5a84a3219546 = la infraestructura de compilador LLVM (originalmente Low Level Virtual Machine)

# text
seg-277ed5c4cbcc = LNAV

# text
seg-d2fa9c420999 = mensaje de navegación heredado

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-6379745571a9 = LNCSS

# text
seg-b8c48f2bfaf0 = sistema de satélites lunares de navegación y comunicación

# text
seg-4ce3c0ea7a31 = los casos de estudio de constelaciones en NAVIGATION { "70" }({ "4" }), navi.613

# text
seg-b13c5776e35b = LNIS

# text
seg-7c67c5753d20 = LunaNet Interoperability Specification

# text
seg-881578d31056 = LNSS

# text
seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

# text
seg-97ff1706b4bd = una constelación lunar propuesta

# text
seg-ec733de1adc5 = LPV / LPV-200

# text
seg-40d72ae4bc9a = rendimiento de localizador con guiado vertical / su categoría de altura de decisión de { "200" } ft

# text
seg-090ba62634a8 = aproximación de aviación

# text
seg-b4921e83ddc9 = LRO

# text
seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

# text
seg-8f782bde5659 = LS

# text
seg-c5bc49526464 = segundos intercalares

# text
seg-54ea05b82cb4 = como en Δt_LS

# text
seg-15111a93c6d7 = LT

# text
seg-35231d8b9b39 = tiempo de luz

# text
seg-4729314afd46 = LTE

# text
seg-1a7e158f020f = Long-Term Evolution

# text
seg-3c1b3acc46d9 = el estándar celular 4G

# text
seg-3530cdaca137 = LU

# text
seg-58ad64b9d450 = (descomposición) inferior–superior

# text
seg-ef1a45eba6aa = LuGRE

# text
seg-72ec36312101 = Lunar GNSS Receiver Experiment

# text
seg-84874825a5d1 = viajó a la Luna en { "2025" }

# text
seg-e6719690faa2 = LuPNT

# text
seg-be19fb902b36 = la biblioteca de PNT lunar de Stanford

# text
seg-893ba320da76 = un nombre

# text
seg-fc68b2fb9529 = MAAST

# text
seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

# text
seg-a24b3840d248 = Stanford

# text
seg-71063143c8be = MAIT

# text
seg-2d7aa60c26ba = fabricación, montaje, integración y ensayo

# text
seg-0397322eae11 = MAR099 / JUP365 / SAT441

# text
seg-bd57191f860b = soluciones de efemérides de satélites de JPL para las lunas de Marte, Júpiter y Saturno

# text
seg-9b0688bfc31e = identificadores

# text
seg-a8748c38de15 = MASPS

# text
seg-e25a3738b952 = normas mínimas de rendimiento de sistemas de aviación

# text
seg-16a3c8f74c1c = MATLAB

# text
seg-bebc110fded7 = MATrix LABoratory

# text
seg-e722ea781fdf = un producto de cálculo numérico

# text
seg-7c03fb6e56f6 = MAUT

# text
seg-e409f72ac9ab = teoría de la utilidad multiatributo

# text
seg-4a29ddd9b24e = MC

# text
seg-19a7ad528cf3 = MCD

# text
seg-202b82bfefcf = Mars Climate Database

# text
seg-371da1e857e8 = MCDA

# text
seg-17d89019fd4a = análisis de decisión multicriterio

# text
seg-b522fc3d6c82 = MCI / MCMF

# text
seg-f5544acf642a = inercial centrado en la Luna / centrado en la Luna y fijo a la Luna

# text
seg-f7b59f61da60 = MDB

# text
seg-0c674a59d087 = sesgo mínimo detectable

# text
seg-c769430226c3 = MDEV

# text
seg-33a4628c6e67 = desviación de Allan modificada

# text
seg-bde3f0e5dfa7 = MEMS

# text
seg-8b08f307de8a = sistemas microelectromecánicos

# text
seg-c960c0e048b7 = MeO / MLRO

# text
seg-48623f76be86 = MéO (Métrologie Optique), la estación láser de Grasse / Matera Laser Ranging Observatory

# text
seg-a8fcbefbbf4c = estaciones de telemetría láser lunar

# text
seg-8b597c678c3f = ME / PA

# text
seg-cb56efe2fb70 = Tierra media / ejes principales

# text
seg-f30f1a2778cf = los dos marcos lunares fijos al cuerpo (MOON_ME, MOON_PA)

# text
seg-308d4c93a8a3 = MGEX

# text
seg-b2b632cd52d2 = Multi-GNSS Experiment

# text
seg-86fd2d84ed21 = IGS

# text
seg-79f8412f30f2 = MIT

# text
seg-70012b81c998 = Massachusetts Institute of Technology

# text
seg-e9d7062835a9 = como en la licencia MIT

# text
seg-a0b70e8c4c38 = MLP

# text
seg-77abd5634603 = perceptrón multicapa

# text
seg-6975432180f6 = una red neuronal pequeña

# text
seg-a4be7b1d83e3 = MOD / TOD

# text
seg-421b9611e897 = medio de la fecha / verdadero de la fecha

# text
seg-1af66f9b771d = marcos de ecuador y equinoccio

# text
seg-b5db821f8008 = MOORA

# text
seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

# text
seg-d26a24b5d9f0 = MOPS

# text
seg-e8707522cf5f = normas mínimas de rendimiento operativo

# text
seg-cd0720a78dbb = MPL

# text
seg-bcdaf8567381 = Mozilla Public License

# text
seg-0f45b55420be = MRO110 / MRO110B2

# text
seg-61415a003e40 = modelos de gravedad { "110" } y 110B2 del Mars Reconnaissance Orbiter

# text
seg-8404f70361e7 = MSRV

# text
seg-26a6a79755f9 = versión mínima admitida de Rust

# text
seg-959fe8ad53df = MTF

# text
seg-70d61ab4eb42 = función de transferencia de modulación

# text
seg-7f60d1ac40ad = imagen óptica

# text
seg-8598e499c145 = MVDR

# text
seg-c767dc9ae21a = respuesta sin distorsión de mínima varianza

# text
seg-83f57219e5b7 = formación de haz adaptativa

# text
seg-e1ee50b3ea0a = MWL

# text
seg-12d9510328d2 = enlace de microondas

# text
seg-639266912f59 = el enlace de transferencia de tiempo de ACES

# text
seg-5ac07401e4f8 = NaN

# text
seg-722d679807ee = no es un número

# text
seg-0e4abc653325 = NavIC

# text
seg-355821380384 = Navigation with Indian Constellation

# text
seg-fc13b86a8365 = NAVISP

# text
seg-2eb6cc573946 = Navigation Innovation and Support Programme

# text
seg-b518d44847fa = NAV / OBS

# text
seg-c6965d4d7202 = navegación (mensaje) / observación

# text
seg-1729ddf0eafa = los dos tipos de archivo RINEX; el Stanford NAV Lab es el Navigation and Autonomous Vehicles Laboratory

# text
seg-f239334e4928 = NBS / NBS14

# text
seg-c8e5edff04d7 = la antigua Oficina Nacional de Normas de EE. UU. / el conjunto de datos de referencia de estabilidad de frecuencia NBS14

# text
seg-3d1ac5146fea = usado para comprobar los estimadores de Allan

# text
seg-37879f5ad9e0 = NEES / NIS

# text
seg-9610f0449fb2 = error de estimación normalizado al cuadrado / innovación normalizada al cuadrado

# text
seg-af167a77a1dc = pruebas de consistencia del filtro

# text
seg-beb7a86721ec = Agencia Nacional de Inteligencia Geoespacial

# text
seg-7aa223cbfe13 = NGS / NOAA

# text
seg-3845b0011dcb = National Geodetic Survey / Administración Nacional Oceánica y Atmosférica

# text
seg-4a1040c5f2fa = NIMA / TR8350

# text
seg-4cf62b739fc6 = National Imagery and Mapping Agency / su informe técnico TR8350.2 (la definición de WGS { "84" })

# text
seg-ffa6025b5a70 = NIMA es el antiguo nombre de la NGA

# text
seg-af4be907e56c = NLOS

# text
seg-22ab7d58324b = una señal solo reflejada

# text
seg-9887902c13a1 = NNLS

# text
seg-b4cb6d6bfce4 = mínimos cuadrados no negativos

# text
seg-af8ca8550600 = NORAD

# text
seg-07428e7224cf = Comando de Defensa Aeroespacial de Norteamérica

# text
seg-4edb033e3432 = mantiene el catálogo público de satélites

# text
seg-dd984e16dbcd = NP

# text
seg-f92816d7c936 = Neyman–Pearson

# text
seg-fc214695fa83 = teoría de la detección

# text
seg-3ef8006482bb = NPA

# text
seg-81a072ee0520 = aproximación de no precisión

# text
seg-b9fd2cf6a2b9 = aviación

# text
seg-e6cb557ee6d1 = NPB

# text
seg-18510a95b308 = nutación–precesión–sesgo

# text
seg-b4562efbafdf = la matriz IAU 2006/2000A

# text
seg-c5d8932f6956 = NRL / NRLMSISE-00

# text
seg-9c9f5eac83b2 = Naval Research Laboratory / su modelo de atmósfera extendida Mass Spectrometer and Incoherent Scatter Radar, { "2000" }

# text
seg-bf373b9cd0c6 = NTN

# text
seg-0ae939342934 = red no terrestre

# text
seg-1ae0305d8455 = 5G desde satélites

# text
seg-20b98c32226f = NTRS

# text
seg-1470d2af037a = NASA Technical Reports Server

# text
seg-243d375db224 = OC-0 … OC-13

# text
seg-d36b43dd505c = identificadores de afirmaciones excesivas

# text
seg-47ba87f3730b = filas de CLAIMS-VS-REALITY.md

# text
seg-e0689f1fc932 = OCI

# text
seg-1a3377171d89 = Open Container Initiative

# text
seg-b5bf07ed6c8c = formato de imagen de contenedor

# text
seg-7b56c21cca93 = ODE / SDE

# text
seg-722bdf2ca73a = ecuación diferencial ordinaria / estocástica

# text
seg-a4da10cb1150 = ODM

# text
seg-b1c25bfe0612 = mensajes de datos de órbita

# text
seg-35fe6a2f3de3 = la familia de CCSDS que incluye OEM y OMM

# text
seg-c06d6aa8ba3a = OGC

# text
seg-eb1feb23de1c = Open Geospatial Consortium

# text
seg-9737495b035c = OLS / WLS

# text
seg-63bf35c31a6a = mínimos cuadrados ordinarios / ponderados

# text
seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

# text
seg-4be3f4155fc8 = el satélite laboratorio de software en órbita de la ESA / su conjunto de datos de detección de anomalías

# text
seg-14b642ea59e1 = OSIP

# text
seg-4871060090a0 = Open Space Innovation Platform

# text
seg-251b3ff3eb9b = OSNMA / TESLA

# text
seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

# text
seg-95b6b14facf1 = autenticación de señales de Galileo

# text
seg-501a89e8b32b = OS / OSes

# text
seg-5a526cda4166 = Open Service (Galileo, BeiDou), o sistema(s) operativo(s)

# text
seg-6db10af375e3 = el contexto indica cuál

# text
seg-584a7e7d4f5e = OU

# text
seg-937187abcdf6 = Ornstein–Uhlenbeck

# text
seg-9be9042ec983 = un proceso de ruido con retorno a la media

# text
seg-08c583f40405 = PA

# text
seg-9a24d9f45aa4 = garantía de producto (también aproximación de precisión, como en K_H,PA)

# text
seg-65ad442b3faa = PCK

# text
seg-c788fe80678e = núcleo de constantes planetarias

# text
seg-46a00fdc9d5b = SPICE

# text
seg-417a52c9c154 = PDF

# text
seg-c462c83b47df = Portable Document Format

# text
seg-98aa544ec4de = Pd / Pfa

# text
seg-0c89f304435e = probabilidad de detección / probabilidad de falsa alarma

# text
seg-5bde4fd55ead = PEF

# text
seg-eb11dcb816ff = el marco entre TEME e ITRF

# text
seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

# text
seg-47cc346307a6 = identificadores de satélite: una etiqueta de satélite GPS de SP3, un número de ruido pseudoaleatorio de SBAS, un nombre de satélite de Galileo

# text
seg-6ad2383f8545 = PHARAO

# text
seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

# text
seg-302c8cb738ac = el reloj de cesio de ACES

# text
seg-2e823cd9d9a6 = PL

# text
seg-099bd07ef3cf = nivel de protección

# text
seg-7d7eaa5eb223 = PLL

# text
seg-9272ad22c094 = lazo de enganche de fase

# text
seg-80e051b734dd = PMC / PMC10301026

# text
seg-1f2a21c5e09f = PubMed Central / uno de los identificadores de sus artículos

# text
seg-3e4617444a63 = PM / FM

# text
seg-c79b1246fb61 = modulación de fase / modulación de frecuencia

# text
seg-279251adb2eb = ruido en la fase o en la frecuencia de un reloj

# text
seg-685fc49957e2 = PN

# text
seg-209dacf76ff3 = como en la medición de distancia PN

# text
seg-f9cfe4e70f9a = PNG

# text
seg-bde68df8ee7e = Portable Network Graphics

# text
seg-06998de7b6be = POD

# text
seg-178f55858efb = determinación precisa de órbita

# text
seg-b7919977bf20 = PPN

# text
seg-ed81960f1282 = post-newtoniano parametrizado

# text
seg-9683f98bec2d = PPP / RTK / SPP

# text
seg-73d777100ecd = posicionamiento puntual preciso / cinemático en tiempo real / posicionamiento de punto único

# text
seg-edb97cd7ef8b = PPS

# text
seg-197b06571b4d = pulso por segundo

# text
seg-2619e854281a = PR

# text
seg-66c53cdfc3d9 = pull request

# text
seg-e4dd8a3101cb = PRN

# text
seg-6fb1378e889a = ruido pseudoaleatorio (número de código)

# text
seg-6f384580af80 = cómo se nombran los satélites GNSS en las señales

# text
seg-e8ca48eb958b = PROMETHEE

# text
seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

# text
seg-d92234e26d53 = PRX

# text
seg-c5774fede0a9 = Physical Review X

# text
seg-8687e6badb6b = una revista

# text
seg-78a947083d45 = PSD

# text
seg-6eb799bd1582 = densidad espectral de potencia

# text
seg-ab1af8b3d968 = véase más arriba

# text
seg-f7c4f1cff2a4 = PS / SPS

# text
seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

# text
seg-2800b3a8cd2e = el PS del SPS de GPS

# text
seg-c8aa5ca0a4ea = PTB

# text
seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

# text
seg-611e7e4a34f4 = el instituto nacional de metrología de Alemania

# text
seg-2d4bc9f59158 = PTP

# text
seg-6291d09d3a93 = Precision Time Protocol

# text
seg-44a14eeae3dd = IEEE { "1588" }

# text
seg-bc4ad791804e = PVT

# text
seg-1939c4e19702 = posición, velocidad y tiempo

# text
seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

# text
seg-95cead42b0d0 = la biblioteca de enlace Rust–Python / Python Packaging Authority / Python Package Index

# text
seg-96b2c707a6b8 = Parametry Zemli { "1990" }

# text
seg-3d5012a62544 = el datum geodésico de GLONASS

# text
seg-9d14fb150c09 = QA

# text
seg-582cb8ea13ac = garantía de calidad

# text
seg-7025be647972 = QEMU

# text
seg-d2209c7eea42 = Quick Emulator

# text
seg-d23b9bd48594 = QPSK

# text
seg-45db179e8e49 = modulación por desplazamiento de fase en cuadratura

# text
seg-b6d487bd53ed = QZSS

# text
seg-c0484340bc52 = Quasi-Zenith Satellite System

# text
seg-531943b17837 = Japón

# text
seg-697c55525b36 = RAAN

# text
seg-85cd6997e07e = ascensión recta del nodo ascendente

# text
seg-79e641db1aae = RAFS

# text
seg-9fa6a6b0e193 = RDRR

# text
seg-19b00c5b9270 = Resist–Detect–Respond–Recover

# text
seg-76da7c5bf39a = el modelo de resiliencia de RethinkPNT/Firesmith

# text
seg-7bb5ed20c788 = RF

# text
seg-35b036272c8e = radiofrecuencia

# text
seg-404104795160 = RHEL

# text
seg-dd1bb2300eb5 = Red Hat Enterprise Linux

# text
seg-34b1e77b1ff0 = RHS

# text
seg-0b4bdbcd1476 = lado derecho

# text
seg-f801cff658be = RMS / RSS

# text
seg-6b758beecbfc = raíz cuadrática media / raíz de la suma de cuadrados

# text
seg-8b2bd83256f1 = RNG

# text
seg-b90957003307 = generador de números aleatorios

# text
seg-354b42e3a5d0 = RNTF

# text
seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

# text
seg-43d17f884c69 = ROI

# text
seg-597432415e53 = retorno de la inversión

# text
seg-7abb945359d0 = RPCF

# text
seg-8c71df162ddd = Resilient PNT Conformance Framework

# text
seg-2f030c1d70c1 = DHS de EE. UU.

# text
seg-82b81c1e28d6 = RTCM

# text
seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

# text
seg-4a7703f1b605 = su estándar de mensajes incluye CRC-24Q

# text
seg-520c91fa0ef0 = una biblioteca de posicionamiento GNSS de código abierto (biblioteca cinemática en tiempo real)

# text
seg-a8b2e577e381 = RTN

# text
seg-6ddf35119d08 = radial, transversal, normal

# text
seg-b1b635ff08e4 = un marco fijo a la órbita

# text
seg-04f4b26e9283 = RW

# text
seg-b8b1a31739aa = paseo aleatorio

# text
seg-8b593d7d5dbd = como en paseo aleatorio del sesgo

# text
seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

# text
seg-928fe3abcd5b = modulación de frecuencia de paseo aleatorio, blanca y flicker / modulación de fase blanca y flicker

# text
seg-7fced178bcc5 = los tipos de ruido de reloj de ley de potencias

# text
seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

# text
seg-0c397d845610 = nombres de producto de Microchip (dos relojes atómicos a escala de chip, un oscilador de cristal con control de horno)

# text
seg-8a1ae00c4a52 = nombres, no abreviaturas

# text
seg-a58426a850fd = SD

# text
seg-d46cb77d53f6 = desviación típica

# text
seg-e29dd726165f = SDD

# text
seg-0ebb68e4b6fd = Service Definition Document

# text
seg-9415da7a79ab = como en el SDD del OS de Galileo

# text
seg-1022626b788c = SDK

# text
seg-2076da4dd4dd = kit de desarrollo de software

# text
seg-9fb492bced01 = SDR

# text
seg-1a1082059103 = radio definida por software

# text
seg-0a647acd4355 = SDS

# text
seg-d0f6ae60b687 = Space Defense Squadron

# text
seg-c3f6fc1456ed = el 18.º SDS mantiene el catálogo de satélites de EE. UU.

# text
seg-cf28e3e14401 = SEP

# text
seg-a67fb04e0911 = ángulo Sol–Tierra–sonda (también error esférico probable)

# text
seg-0c7631f367e8 = SGD

# text
seg-d58ce1e25c08 = descenso de gradiente estocástico

# text
seg-2f25205204e4 = SHM

# text
seg-f2e2253a31b3 = movimiento armónico simple

# text
seg-b0973ab206ed = SI

# text
seg-35624e5e4630 = Sistema Internacional de Unidades

# text
seg-02aa435dc884 = SIB

# text
seg-262a811c8b69 = Safety Information Bulletin

# text
seg-b9ee445609f5 = EASA; EASA es la Agencia de la Unión Europea para la Seguridad Aérea

# text
seg-8d6d4fe3d155 = SINEX

# text
seg-e5c071685532 = Solution INdependent EXchange format

# text
seg-3466519e4c62 = soluciones geodésicas

# text
seg-b21a3d7fb59d = SIR

# text
seg-303809c700e2 = remuestreo por importancia de muestreo

# text
seg-7a2e0e9cac08 = un filtro de partículas

# text
seg-6da637028ef8 = SIS / SISA

# text
seg-9779a20e50d2 = señal en el espacio / exactitud de la señal en el espacio

# text
seg-c0e9f44b333d = SITAN

# text
seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

# text
seg-ceee87dd4b5e = SLR

# text
seg-c8e722f1609c = telemetría láser de satélites

# text
seg-76d80b0d2deb = SMAD

# text
seg-7fbda47e3858 = Space Mission Analysis and Design

# text
seg-dfc105c0178b = el libro de texto

# text
seg-5278559437c5 = SNR

# text
seg-b97c29ce3b37 = relación señal-ruido

# text
seg-ff2faf259a15 = SOS / SSE

# text
seg-5a2e327af384 = suma de cuadrados / suma de residuos al cuadrado

# text
seg-453c4506fd59 = SOTA

# text
seg-7eaa0caa6916 = estado del arte

# text
seg-127e73a3610b = NIST Special Publication { "1065" }

# text
seg-bedc9a3d8d9f = el mismo documento que NIST SP { "1065" }

# text
seg-cf2491c1a488 = SPD / PD

# text
seg-eade81634bf5 = simétrica definida positiva / definida positiva

# text
seg-5fedf0f7b5c0 = SPDX

# text
seg-3aba3c5a5c19 = Software Package Data Exchange

# text
seg-c10b1f20f37e = los identificadores de licencia de las cabeceras de archivo

# text
seg-b377a91a047f = SPK

# text
seg-5603642c612d = núcleo SPICE de efemérides de naves espaciales y planetas

# text
seg-cf18ba9c86d8 = SPOF

# text
seg-cfab8d8a2cdf = punto único de fallo

# text
seg-c06f64211c40 = SQM

# text
seg-7e58d6a4a92c = monitorización de la calidad de la señal

# text
seg-a4e75468e6f9 = comprobaciones de spoofing basadas en la forma del correlador

# text
seg-0bb7a4875914 = SRIF

# text
seg-82da1a1f1be4 = filtro de información de raíz cuadrada

# text
seg-970edb8ec42f = SRP

# text
seg-ae097fbdabf9 = presión de radiación solar

# text
seg-edc814ba451b = SRTM / SRTMHGT

# text
seg-b756bc93d2ea = Shuttle Radar Topography Mission / su formato de archivo de alturas

# text
seg-4692354a98de = las teselas se nombran por su esquina suroeste, por ejemplo N36W117

# text
seg-00f36f1678d6 = SSD

# text
seg-532285d8e6ce = Solar System Dynamics

# text
seg-1d8167212f57 = el grupo de JPL

# text
seg-d21315ea8c52 = STEC

# text
seg-84689b829867 = contenido total de electrones oblicuo

# text
seg-eabee4bfb30e = Systems Tool Kit

# text
seg-a7ff60ab0bd9 = un producto de análisis de misiones

# text
seg-17d792c12885 = el servicio de posicionamiento y temporización de Iridium

# text
seg-3efaadad9c96 = STM

# text
seg-da395fa674ec = matriz de transición de estado

# text
seg-d116578b987b = SV

# text
seg-caa37a1e7d12 = vehículo espacial (un satélite)

# text
seg-845e6f3a37ec = SVD

# text
seg-e775c436db4b = descomposición en valores singulares

# text
seg-3e5561868a7f = Scalable Vector Graphics

# text
seg-4c48f567e37c = TAES

# text
seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

# text
seg-39b93d9b401a = TC / TM

# text
seg-b0df03cff98a = telecomando / telemetría

# text
seg-fafb84a9796a = TDD

# text
seg-ec3b92ad43c3 = desarrollo guiado por pruebas

# text
seg-40defa915d0d = TDOA / FDOA

# text
seg-e7db8768b023 = diferencia de tiempo / de frecuencia de llegada

# text
seg-aecac9c9d2d0 = localización pasiva de emisores

# text
seg-01861b3d63bf = TERCOM

# text
seg-9ef3f9cbbe77 = correlación de contornos del terreno

# text
seg-5da9ae904ae0 = TEXBAT

# text
seg-e90183a6fc69 = Texas Spoofing Test Battery

# text
seg-941eccec7400 = datos grabados de spoofing de GNSS (OAKBAT es un conjunto de datos de la misma clase)

# text
seg-e71c15afe44e = TIE

# text
seg-19bfea0d5c88 = error de intervalo de tiempo

# text
seg-eb12660210bd = TIES

# text
seg-9335f08b6381 = Telecommunication Information Exchange Service

# text
seg-12f4af2b48c1 = cuentas de miembros de la UIT

# text
seg-c05ba396ac1e = ToA

# text
seg-78a41e672189 = tiempo de llegada

# text
seg-7d821e75fdf7 = TOL

# text
seg-4c7600f40479 = tolerancia

# text
seg-1f8b3be77dcc = TOPSIS

# text
seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

# text
seg-c9a6058c9715 = TOTDEV / TOTVAR

# text
seg-53a19d838c2d = desviación total / varianza total

# text
seg-7350da5c5c30 = estimadores de estabilidad de rango extendido

# text
seg-91d2f49dc7c0 = TPAMI

# text
seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

# text
seg-85692b01a12d = TPL

# text
seg-123ed92776a3 = nivel de protección de temporización

# text
seg-10c9563602b7 = véase SLOT-TIMING.md

# text
seg-d1e3f93bc0aa = TPS

# text
seg-579b1467ca5f = sistema de protección térmica

# text
seg-3b7fe44cc552 = TRN

# text
seg-5239a432b919 = navegación referenciada al terreno

# text
seg-1df3bcf7eb97 = TR / TN

# text
seg-ef0ff09dc412 = informe técnico / nota técnica

# text
seg-643fa447bcee = TU Delft

# text
seg-5c5492ecd86f = Universidad Técnica de Delft

# text
seg-f3f22590bc57 = TWSTFT / TWTFT

# text
seg-28c80c27a136 = transferencia bidireccional de tiempo y frecuencia por satélite / transferencia bidireccional de tiempo y frecuencia

# text
seg-e1a149ff6c43 = UBX

# text
seg-fa0e9838530e = el protocolo binario de receptor de u-blox

# text
seg-9555546fed38 = UDRE

# text
seg-5fd7aec5beda = error diferencial de distancia del usuario

# text
seg-a3f5dda611b0 = SBAS

# text
seg-b6f0baa6e478 = UERE

# text
seg-4d1cb1c3ade9 = error de distancia equivalente del usuario

# text
seg-7d87e82154ed = UFFC

# text
seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

# text
seg-f4da31f92a79 = una IEEE Transactions

# text
seg-573db7b5995b = de { "300" } MHz a { "3" } GHz

# text
seg-3688c8d84cdc = UI / UX

# text
seg-42162760360f = interfaz de usuario / experiencia de usuario

# text
seg-7a56f7e38c5a = ULA

# text
seg-4f4d9da7855c = agrupación lineal uniforme

# text
seg-db65f4a7586d = ULP

# text
seg-ae7458813685 = unidad en el último lugar

# text
seg-d7f4df5a9d13 = precisión de coma flotante

# text
seg-81dc0f4f1b2c = URA / URE

# text
seg-c92cbc3e3954 = exactitud de distancia del usuario / error de distancia del usuario

# text
seg-17e8fb142c6c = URA acota la integridad, URE es el RMS de la exactitud

# text
seg-1e02dfc0a52b = URL

# text
seg-f726bcd9d4ad = localizador uniforme de recursos

# text
seg-088e05d67af1 = USGS

# text
seg-ffed8eca324d = Servicio Geológico de EE. UU.

# text
seg-1ded2eb40061 = USNO

# text
seg-2b5f7bbe22e9 = Observatorio Naval de EE. UU.

# text
seg-39ed84639c60 = USO

# text
seg-f9f684640e53 = oscilador ultraestable

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-ba97a4005ee8 = VIKOR

# text
seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optimización multicriterio y solución de compromiso)

# text
seg-7fe170288e4e = interferometría de línea de base muy larga

# text
seg-2e95d53160df = WAAS / EGNOS

# text
seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

# text
seg-1746693259e0 = SBAS; véase más arriba

# text
seg-98f4f946a7ac = WASM

# text
seg-257c477dc510 = WebAssembly

# text
seg-eaf260aa0e21 = WASPAS

# text
seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

# text
seg-c9710476b8b5 = Grupo de Trabajo C de la cooperación Unión Europea–Estados Unidos en navegación por satélite

# text
seg-79f0e87410bf = publica los documentos de referencia de ARAIM

# text
seg-199e55106e0f = WGCCRE

# text
seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

# text
seg-d1939d914701 = WGN

# text
seg-6bbc3adc6a53 = ruido gaussiano blanco

# text
seg-1e422c9001d4 = WGS72 / WGS84

# text
seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

# text
seg-5964aa61f847 = SGP4 usa constantes de WGS72

# text
seg-f4ea25131d04 = WHU

# text
seg-7d30c759d92f = Universidad de Wuhan

# text
seg-5d028f5e2120 = WSM / WPM

# text
seg-ce407535733f = modelo de suma ponderada / modelo de producto ponderado

# text
seg-cc68c85bb2b9 = agregación multicriterio (WPM también significa modulación de fase blanca; el contexto indica cuál)

# text
seg-9041c866d202 = XML

# text
seg-0e55c3adc568 = Extensible Markup Language

# text
seg-93e0e8702167 = XOR

# text
seg-cfa3197f8c1d = o exclusivo

# text
seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

# text
seg-195082605699 = las componentes del campo geomagnético: norte, este, abajo, intensidad total; declinación, inclinación

# text
seg-94835748fcbb = YAGNI

# text
seg-76430d755d74 = you aren't gonna need it

# text
seg-e4e177088376 = un principio de diseño

# text
seg-565c1908393c = ZHD

# text
seg-77a0948bc15d = retardo hidrostático cenital

# text
seg-749be52554c5 = Reproducibilidad y licencias

# text
# c1: scenario + seed + version → identical result
seg-d78d9bbb905c = <b>Reproducible (determinista).</b> La misma entrada siempre da una salida idéntica bit a bit — <c1/>. Sin aleatoriedad oculta.

# text
seg-1412347e2298 = <b>Semilla.</b> El número que inicializa el generador aleatorio (determinista), de modo que las ejecuciones sean repetibles.

# text
seg-3a35740e04a8 = <b>Open core.</b> El modelo de negocio: el motor es libre y de código abierto (AGPL-3.0, la GNU Affero General Public License definida más abajo; con licencia dual comercial); el negocio que lo sostiene es el soporte, la integración, las licencias comerciales y los complementos propietarios, no las cuotas por puesto sobre el motor abierto.

# text
seg-8ea21ebded3c = <b>AGPL-3.0.</b> La GNU Affero General Public License v3, una licencia de código abierto con copyleft fuerte, aprobada por la OSI (Open Source Initiative). Como la GPL (GNU General Public License), pero con una cláusula adicional (§{ "13" }) que abarca el software ofrecido a usuarios <b>a través de una red</b>: una versión modificada a la que se accede por una red debe ofrecer a esos usuarios su código fuente correspondiente. La licencia abierta de Kshana.

# text
# c1: LICENSING.md
seg-f87860d8197d = <b>Licencia dual.</b> Ofrecer el mismo código bajo dos licencias para que los usuarios elijan: aquí, la AGPL-3.0 (abierta, con copyleft) <b>o</b> una licencia comercial de Ashforde OÜ (una sociedad privada de responsabilidad limitada estonia; OÜ = osaühing) para usos propietarios o cerrados a los que la AGPL no se adapta. Véase <c1/>.

# text
seg-dd5f4a1bbbf5 = También se usa en kshana.dev

# text
seg-9d0c42560a90 = Abreviaturas que usa el sitio web y que no están en el glosario del repositorio de arriba.

# text
seg-67a54ce8c89e = Global Positioning System

# text
seg-814b0d29bbb2 = densidad de portadora a ruido, en dB-Hz

# text
seg-f22a269bc575 = la banda de radio de { "1" } a { "2" } GHz que usa GNSS

# text
seg-1f4360a0405c = código de adquisición gruesa de GPS L1

# text
seg-6f7910207534 = señal directa aumentada (lunar)

# text
seg-74f02864ce32 = sistemas microelectromecánicos

# text
seg-0f931242ecc0 = UAS

# text
seg-dddfd223a3b1 = sistema de aeronave no tripulada

# text
seg-7091aabf8b6d = PL · AL

# text
seg-12d88ab45197 = nivel de protección · límite de alerta

# text
seg-78134bcc48da = aproximación con guiado vertical, nivel I

# text
seg-27328b36b476 = LEO · GEO

# text
seg-b1ae7014a663 = órbita terrestre baja · órbita geoestacionaria

# text
seg-c1d933dd3965 = OEM · OMM · TDM

# text
seg-5d0ebe2bc51c = mensajes CCSDS de efemérides de órbita, elementos medios de órbita y datos de seguimiento

# text
seg-fa9240660ec4 = IGRF

# text
seg-c19fd59fdca0 = DSN

# text
seg-7979317c75d2 = Deep Space Network

# text
seg-c194401c2039 = TCXO · OCXO

# text
seg-5c9d0b4c561d = oscilador de cristal con compensación de temperatura · con control de horno

# text
seg-f3a7cc221b63 = PHM

# text
seg-08d5cfc5b460 = máser de hidrógeno pasivo

# text
seg-5ed928b1c6d0 = USO · DSAC

# text
seg-b77f2ea4a521 = oscilador ultraestable · reloj atómico de espacio profundo

# text
seg-553814463110 = MTIE · TDEV

# text
seg-2d9b8af50414 = error máximo de intervalo de tiempo · desviación de tiempo

# text
seg-5b155b60152f = PRTC · ePRTC

# text
seg-93d590e6408d = reloj de tiempo de referencia primario · PRTC mejorado

# text
seg-8541a73eef89 = ADEV · σy(τ)

# text
seg-a2ae4a40f486 = desviación de Allan con tiempo de promediado τ

# text
seg-96fae3b4fb8e = Unión Internacional de Telecomunicaciones, Sector de Normalización de las Telecomunicaciones

# text
seg-24cab92c0fd3 = NIS · NEES

# text
seg-7e82e2927d59 = innovación normalizada al cuadrado · error de estimación normalizado al cuadrado

# text
seg-7175ab55e707 = JSON · CSV · SVG

# text
seg-a9a2906d15de = JavaScript Object Notation · valores separados por comas · Scalable Vector Graphics

# text
seg-d3a9009a35c0 = CLI · API · IDE

# text
seg-c6418e1f785d = interfaz de línea de comandos · interfaz de programación de aplicaciones · entorno de desarrollo integrado

# text
seg-8df86177107a = SBOM · SLSA

# text
seg-e54326c78ab0 = lista de materiales de software · Supply-chain Levels for Software Artifacts

# text
seg-347b23148b8f = NDA

# text
seg-969d2489de28 = acuerdo de confidencialidad

# text
seg-564cfa0d3084 = Digital Object Identifier

# text
seg-5cbd99859d90 = cascada de C/N₀

# text
seg-ed4a9e041a83 = un gráfico de la densidad de portadora a ruido por satélite a lo largo del tiempo

# text
seg-1cb49c7e6c7f = HPL · VPL

# text
seg-ccdc7d672c8f = nivel de protección horizontal · vertical

# text
seg-c7a40ebac7e1 = LROC

# text
seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

# text
seg-c5da9d350518 = <s1>Anterior</s1>Introducción a los conceptos

# text
seg-670504be0531 = <s1>Siguiente</s1>Guía de Studio

seg-6c10aaedf2fc = <s1>Siguiente</s1>Idiomas
