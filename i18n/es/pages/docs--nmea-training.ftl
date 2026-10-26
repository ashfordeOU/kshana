# docs--nmea-training: translations (es)

# text
seg-2247a2344710 = Significado

# text
seg-45425f378b61 = significado

# text
seg-6940543aa3c0 = cadena

# text
seg-f5e7215e6835 = objeto

# text
seg-c5fb6b91dc68 = grados

# text
seg-99427ab75a03 = campo

# text
seg-bbcdd898d24d = entero

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Fuente: <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = Flujos NMEA de formación: <c1/>

# text
seg-3663955f80c7 = Las academias marítimas y los centros de simuladores pueden alimentar un simulador de puente o un trazador de cartas con NMEA { "0183" } generado por Kshana para formar a las tripulaciones en el reconocimiento de jamming y spoofing de GNSS.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Solo para formación y pruebas.</b> Los flujos generados son sintéticos. Nunca deben introducirse en los sistemas de navegación en servicio de un buque. Kshana es de carácter consultivo, no un equipo de navegación homologado. Cada flujo comienza con una sentencia de marcador propietaria, <c1/>, y la repite cada diez segundos; los receptores la ignoran, y <c2/> la elimina para un simulador que rechace sentencias desconocidas. Esto escribe <b>solo texto</b> NMEA: no hay salida de RF, IQ ni de forma de onda, y nada transmite salvo el texto a la dirección que usted indique.

# attr:alt
seg-b66ff9ca2ff4 = Flujo de formación del escenario coastal-drag-off (motor v{ $version }, semilla { "22" }, { "25" } minutos con una posición cada { "10" } s del registro del instructor). Un mapa muestra la trayectoria real del buque y la que informa el receptor: coinciden hasta que comienza un arrastre de posición programado a los { "421" } s; entonces la trayectoria informada se aleja de la real mientras el receptor mantiene una posición válida, y vuelve a ella cuando termina el evento a los { "1140" } s. Junto a ella, la distancia entre las dos trayectorias a lo largo del tiempo y la densidad media de portadora a ruido que informa el receptor, que sube a un nivel elevado mientras dura el evento. Datos de formación sintéticos generados por Kshana. Solo para formación y pruebas: no introduzca nunca este flujo en los sistemas de navegación en servicio de un buque. De carácter consultivo, no es un equipo de navegación homologado. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque. Las posiciones, las fechas y las trayectorias son inventadas.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = La figura se dibuja a partir del registro del instructor de <c1/>.

# text
seg-32b620b3574e = Uso

# text
seg-9cbd24964be4 = Opción

# text
# c1: <name>.nmea
seg-aadcf289aed2 = escribe el flujo en un archivo; sin salida de red, el valor por defecto es <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = escribe <c1/> y <c2/> (por defecto: junto al archivo)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> o <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = servidor TCP; la ejecución comienza cuando se ha conectado un cliente (<c1/>). Un puerto sin dirección escucha solo en <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> o <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, una sentencia por datagrama; <c1/> permite una dirección de difusión. Un puerto sin dirección envía a <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = marca el ritmo del flujo; <c1/> es lo más rápido posible. La salida de red va por defecto en tiempo real y los archivos, lo más rápido posible

# text
seg-97b82dfe97a7 = sustituye la semilla del escenario

# text
seg-86ac66fd2771 = omite la sentencia de marcador

# text
seg-f6cc05a6d39a = <b>No hay autenticación.</b> Un servidor TCP con una dirección no local sirve el flujo a cualquiera que pueda alcanzarlo, y UDP envía a la dirección que usted indique. Un cliente TCP que no toma sus datos en dos segundos se descarta, de modo que un consumidor bloqueado no puede retener a los demás.

# text
seg-b4abb5a132ba = La misma semilla da los mismos bytes en una plataforma, y el ritmo nunca cambia los bytes. Entre plataformas, la aritmética propia del generador es idéntica bit a bit (usa la capa de matemática portátil), pero las posiciones de los satélites y los ángulos de vista proceden de funciones del motor que llaman a la biblioteca matemática del host, de modo que en un caso límite poco frecuente un dígito redondeado de elevación, acimut o C/N0 en GSV puede diferir entre plataformas.

# text
seg-97e31fc7f0d1 = Qué se escribe

# text
# c1: GN
seg-632a4ca26567 = Cada época ({ "1" }, { "2" }, { "5" } o { "10" } por segundo) incluye: <b>RMC, GGA, GNS</b> (posición, ubicación, hora), <b>GSA</b> (satélites usados y DOP, una por constelación), <b>GSV</b> (satélites a la vista con elevación, acimut y SNR en dB-Hz, un conjunto por constelación, ID de señal NMEA { "4.10" }), <b>VTG</b> (rumbo y velocidad sobre el fondo), <b>ZDA</b> (hora y fecha), <b>HDT</b> (rumbo giroscópico) y <b>VBW</b> (velocidad respecto al agua y al fondo según la corredera). El emisor es <c1/> con varias constelaciones y, en caso contrario, el de la propia constelación. Las líneas terminan en CRLF y tienen suma de comprobación válida.

# text
seg-942803ad8c49 = HDT y VBW hacen las veces de sensores independientes (un girocompás y una corredera Doppler). <b>Ningún evento los afecta</b>, lo cual es deliberado: la diferencia entre lo que informa el GNSS y lo que indican el girocompás y la corredera es una pista para el análisis posterior.

# text
# c1: V
seg-2d9a9ea38dde = Cuando se pierde la posición, la calidad de GGA es { "0" }, el estado de RMC es <c1/>, los campos de posición quedan vacíos y los campos de hora continúan (el reloj del receptor sigue en marcha), como hacen los receptores reales.

# text
seg-c1c51ff381e7 = El buque

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> y <c2/> dan una posición inicial, una velocidad y los puntos por los que gobernar. El buque se gobierna hacia el siguiente punto de ruta con un <b>límite de velocidad de giro</b> (<c3/>, por defecto { "30" }), un límite de la rapidez con que aumenta la velocidad de giro (<c4/>) y un <b>límite de cambio de velocidad</b> (<c5/>). La velocidad de un tramo es el <c6/> del punto de ruta. <c7/> añade una corriente, de modo que la velocidad sobre el fondo difiere de la velocidad respecto al agua y el rumbo de proa difiere del rumbo sobre el fondo, y una variación magnética. <c8/> detiene el buque en el último punto de ruta.

# text
seg-4fc2cb8a1388 = Geometría de los satélites

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Los satélites proceden de las constelaciones nominales propias del motor (tabla de ranuras de GPS, patrones Walker MEO de Galileo y BeiDou, ICD de GLONASS), propagadas por <c1/> (dos cuerpos más J2 secular, rotación de la Tierra) y vistas desde el buque con los ángulos de vista WGS-84 del motor. El número de satélites visibles, las elevaciones y los acimuts en GSV son verosímiles para el lugar y la hora del día. <b>Es un cielo nominal, no unas efemérides para la fecha del flujo</b>: los PRN se asignan por orden de ranura y cada constelación conserva su disposición de ranuras publicada, propagada de forma continua desde la época de la tabla de ranuras de GPS (2016-12-31) bajo J2, de modo que la disposición se mantiene íntegra pero su orientación no es la del cielo real en la fecha del flujo. El C/N0 sigue la elevación (un nivel cenital nominal, fijado en <c2/>), con un desfase fijo por satélite, desvanecimiento lento y ruido. Un satélite por debajo de <c3/> tiene el campo SNR vacío; uno por debajo de <c4/> se sigue pero no se usa. Se usan hasta <c5/> (por defecto { "12" }, el máximo de NMEA GGA) satélites utilizables, elegidos por geometría (primero el satélite más alto de cada sector de acimut de { "30" } grados). Con menos de cuatro satélites utilizables se pierde la posición, y vuelve tras <c6/> de señal utilizable.

# text
seg-f2be7442bdf2 = Eventos

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Cada <c1/> tiene un <c2/>, un inicio <c3/>, una <c4/> (del inicio al comienzo de la liberación), una rampa de inicio <c5/> y una rampa de liberación <c6/>. La intensidad sube linealmente durante <c7/>, se mantiene y luego baja durante <c8/>; <c9/> es un escalón. Todos los efectos escalan con esa intensidad. Se rechazan los parámetros que no pertenecen al tipo.

# text
seg-3255e99c7265 = tipo

# text
seg-9285a9d699c0 = parámetros

# text
seg-e83c9db4f9c7 = efecto

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (por defecto { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = el C/N0 de cada satélite cae hasta <c1/> (dispersión por satélite), los satélites se pierden empezando por el más bajo, la posición se pierde cuando hay menos de cuatro utilizables y se recupera tras la liberación y <c2/>

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, uno de <c2/> (verdadero) o <c3/> (respecto al rumbo <b>al inicio</b>, y luego mantenido), opcional <c4/>, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = el receptor mantiene una <b>posición válida</b> cuya posición se aleja de la real; SOG y COG incluyen el arrastre. El arrastre sigue una función smoothstep en las rampas, de modo que la trayectoria falsa empieza y termina sin escalón de velocidad; sus picos son <c1/> m/s y <c2/> m/s al cuadrado para una rampa de <c3/> s sobre <c4/> m (ambos registrados), y se rechaza un escenario que superase <c5/>. Un escalón (<c6/>) mueve la posición sin tocar la velocidad

# text
seg-7da039c3262e = la hora de RMC, GGA, GNS y ZDA se desplaza respecto al UTC verdadero; la posición sigue siendo la verdadera

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (por defecto verdadero), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = la posición, la velocidad (y la hora) son las del buque de hace <c1/>, con el retardo siguiendo smoothstep en sus rampas y la velocidad informada escalada por <c2/> mientras cambia: una abstracción simplificada, al estilo del meaconing, no un modelo de propagación

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: mientras un arrastre, una falsificación de hora o un retardo de repetición está activo, todos los satélites seguidos muestran ese único nivel elevado, un indicio clásico. Omítalo para un evento sutil en el que se conserva el patrón genuino de C/N0. Mientras haya cualquier evento falsificado activo, el receptor sigue la señal falsificada, de modo que el jamming no la hace caer; una posición perdida por un jamming anterior vuelve tras <c2/> con la señal falsificada (véase <c3/>). Se rechaza un cambio de hora que haría que la hora informada se detuviera o retrocediera (una tasa de { "1" } s por segundo o más), salvo que sea un escalón (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Los eventos pueden solaparse; sus efectos se suman (desplazamientos, cambios de hora, retardos) o prevalece el más fuerte (jamming). El <c1/> de la cronología es la primera época en la que el evento tiene efecto, una época después del <c2/> programado cuando el evento entra en rampa.

# text
seg-09e311ade9e6 = El registro del instructor

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Junto con el flujo, <c1/> y <c2/> aportan:

# text
seg-51930977a6fe = los eventos tal como se inyectaron, en lenguaje llano con todos sus parámetros, y su inicio en UTC;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = una cronología: inicio, efecto pleno, comienzo de la recuperación, recuperado, y los propios <c1/> y <c2/> del receptor;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = la trayectoria real frente a la informada con un espaciado de <c1/>: posición, velocidad y rumbo reales e informados, error de posición en metros, desfase de hora, satélites usados y seguidos, C/N0 medio y qué eventos estaban activos;

# text
seg-303f5fbe0351 = la velocidad y la aceleración máximas de la trayectoria real y de la informada;

# text
# c1: trainer_note
seg-593a4a1ef296 = el <c1/> del escenario.

# text
seg-8c4aebcd0eff = Muestre el registro solo en el análisis posterior.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = Campos JSON (esquema <c1/>)

# text
seg-60b5b11cdc0b = tipo, unidad

# text
seg-f4963d090155 = la declaración de uso exclusivo para formación

# text
seg-7ad14e03d9e4 = del escenario

# text
seg-fac0fb50b31b = semilla utilizada

# text
seg-f05d18516bd8 = ISO { "8601" } UTC

# text
seg-8752c09baa6a = inicio de la ejecución

# text
seg-f0d8bb5aafef = duración de la ejecución

# text
seg-0989e14f1e51 = nudos

# text
seg-b657b979a455 = mayor velocidad sobre el fondo, real e informada

# text
seg-24e947df31ae = m/s al cuadrado

# text
seg-a1ca3847c8d8 = mayor cambio de velocidad por segundo, real y entre posiciones informadas consecutivas

# text
seg-e1daadeb7d48 = uno por evento programado

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = base 1; lo usan <c1/> y <c2/>

# text
seg-6bbb9db14f7b = descripción en lenguaje llano con los parámetros

# text
seg-2f3eac27a997 = inicio programado

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = el evento exactamente como se escribió (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> y los parámetros propios del tipo; los ausentes se omiten)

# text
seg-88db26711d77 = grados verdaderos o null

# text
seg-2f30c3d8b17b = arrastre: la dirección aplicada (un rumbo relativo se resuelve al inicio)

# text
seg-55d6dd667365 = m/s, m/s al cuadrado o null

# text
seg-021df000164f = arrastre: los picos que el arrastre añade a la trayectoria falsa

# text
seg-d3a2c65ebcd4 = momentos para el análisis posterior, en orden temporal

# text
seg-b2b72301c1c9 = s desde el inicio, ISO { "8601" } UTC

# text
seg-34e24e21ac7e = cuándo (hora verdadera)

# text
seg-cf29ba5ed968 = entero o null

# text
seg-8dbc5e7239be = el identificador del evento; null para los cambios de estado del receptor

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (eventos); <c5/>, <c6/> (receptor)

# text
seg-cd7c4057601b = explicación

# text
# c1: log_interval_s
seg-90e65cbe1a59 = una fila por <c1/>

# text
seg-a57e27a3c470 = s, ISO { "8601" } UTC

# text
seg-24376fe24496 = posición real

# text
seg-f23b251a0e33 = nudos, grados verdaderos

# text
seg-242c1f2ccbd3 = velocidad y rumbo reales sobre el fondo, y rumbo giroscópico

# text
seg-696dd61f8bbb = booleano

# text
seg-ea264ef0395c = el receptor informó de una posición

# text
seg-b073b87a813e = grados, nudos, grados verdaderos o null

# text
seg-b56345697092 = lo que informó el receptor; null mientras se pierde la posición

# text
seg-c4a33c03d9da = m o null

# text
seg-463f6fc42ae5 = distancia horizontal entre la posición real y la informada

# text
seg-b68dfce8d81d = UTC informado menos UTC real

# text
seg-ec28faa1efcc = enteros

# text
seg-2bf397f77392 = satélites usados en la posición y satélites seguidos

# text
seg-96b87348e90e = dB-Hz o null

# text
seg-40f30b4a88cf = C/N0 medio de los satélites seguidos

# text
seg-3671c8aa3c1a = identificadores de los eventos con efecto en este instante

# text
# c1: /2
seg-8401fa92aae1 = Añadir un campo no cambia la etiqueta del esquema. Renombrar o eliminar un campo, o cambiar su significado o su unidad, incrementa el número (<c1/>).

# text
seg-656ee92a3130 = La biblioteca de escenarios

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, cada uno de unos pocos minutos de travesía con una nota para el instructor en su TOML:

# text
seg-665b9b46b49b = archivo

# text
seg-11ed1f85d4be = qué muestra

# text
seg-50ffa85a1128 = el C/N0 cae en conjunto, los satélites se pierden, la posición se pierde y vuelve

# text
seg-10bc30b9c57b = una posición válida y de aspecto sano se arrastra { "1.4" } km hacia la costa; C/N0 uniformemente elevado

# text
seg-f141692988e4 = posición correcta, el UTC se desplaza { "45" } s por delante durante una aproximación lenta a puerto

# text
seg-ce06a5ebdd42 = jamming, luego toma de control falsificada con arrastre y desfase de hora, y después un retardo de repetición

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = un cielo bloqueado, no interferencia: las paredes de un fiordo (el preajuste de horizonte REPRESENTATIVE <c1/>) ocultan los satélites al este y al oeste, y después el canal se abre de nuevo (evento <c2/>, con una tabla <c3/>)

# text
seg-5462f6b21fae = Las posiciones, las fechas y las trayectorias son inventadas; la biblioteca no incluye ningún buque, operador ni grabación reales. No hace ninguna afirmación sobre cómo se comportaría ningún receptor o sistema frente a interferencias.

# text
seg-9831ab537b36 = Decisiones de modelado

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = El generador es una herramienta de formación sin referencia independiente externa, y sus números son decisiones de modelado, no mediciones de ningún receptor. Se eligen para que parezcan un registro de receptor corriente: la pendiente de C/N0 de { "14" } dB del cenit al horizonte por debajo del nivel cenital (por defecto { "47" } dB-Hz) y el desfase por satélite de +/-1.5 dB, un desvanecimiento lento de { "0.8" } dB en { "97" } s y de { "0.5" } dB en { "31" } s, un jitter de { "0.3" } dB; los umbrales de seguimiento ({ "20" } dB-Hz) y de uso ({ "28" } dB-Hz); el ruido de posición ({ "1.5" } m con HDOP { "1" }, correlacionado en { "30" } s, el vertical el doble); un ruido de girocompás de { "0.05" } grados y un ruido de deriva de { "0.03" } kn; la constante de tiempo de gobierno de { "20" } s y los radios de llegada a los puntos de ruta del modelo del buque; y la elección de satélites por sector de acimut. Los valores por defecto residen en <c1/> y <c2/> y todos se pueden cambiar en el escenario.

# text
seg-84913be532a0 = Lectura posterior

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> puede ingerir estos archivos (<c2/>). Las pruebas comprueban cada sentencia de cada escenario de la biblioteca con sus propias reglas de número de campos y suma de comprobación, y pasan los archivos por ese lector, que interpreta GGA, RMC y GSV y deja pasar los demás tipos sin omitir ninguno. Las pruebas fijan un extracto de referencia por escenario (<c3/>); se regenera con <c4/> tras un cambio intencionado.

# text
seg-b94fbc3b1dd3 = <s1>Anterior</s1>Confianza marítima

# text
seg-ecdf748cb63d = <s1>Siguiente</s1>Mapa de interferencias y exposición de rutas

# text
seg-24ad8471ff2a = Campos JSON (esquema kshana-nmea-training/1)
