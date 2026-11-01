# docs--marine-integrations: translations (es)

# text
seg-2e34ace70d11 = Plugin de Signal K

# text
seg-0857a94a948e = Límites

# text
seg-2247a2344710 = Significado

# text
seg-c3c260b7063e = Pruebas

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-ab1af8b3d968 = véase más arriba

# text
seg-c353e7bec219 = Clave

# text
seg-df52127d74b6 = Dónde

# text
seg-7670cf4ceda3 = Valor por defecto

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7e304f816037 = Fuente: <c1/>

# text
seg-fb2b0841a172 = Integraciones marinas: la puntuación de confianza en el puente

# text
# c1: MARITIME-TRUST.md
seg-a88b3968c706 = La puntuación de confianza marítima de Kshana (<a1><c1/></a1>) es accesible desde software que los navegantes ya usan: un complemento para servidor <b>Signal K</b> y <b>OpenCPN</b> mediante NMEA en modo de puerta sobre TCP. Una compilación de referencia la pone en un ordenador pequeño junto al receptor.

# text
seg-eb8043b9e269 = <b>Software de carácter consultivo.</b> Kshana no es un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }) y no se ha evaluado frente a ninguna norma de rendimiento. Todo lo de esta página es una ayuda al criterio del navegante. El operador sigue siendo responsable de la navegación segura del buque y de cualquier decisión de fiarse, o de dejar de fiarse, de una posición. Nada de aquí transmite, y nada de aquí hace más exacta una posición.

# text
seg-dab66f260e56 = Pieza

# text
seg-40fd2019e974 = Estado en { "0.35" }

# text
seg-7bcecf49199c = entregado, con pruebas unitarias sobre salida sintética grabada; no publicado en npm

# text
seg-d5278e683d37 = OpenCPN mediante NMEA en modo de puerta sobre TCP

# text
seg-a876f5d43e39 = entregado y probado (reproducción del lado del consumidor); ninguna prueba maneja la propia interfaz de usuario de OpenCPN

# text
seg-4a6d2f45b403 = Complemento nativo de OpenCPN con panel de puntuación

# text
# c1: integrations/opencpn/evidence/
seg-b0d4d32612e9 = compilado, con la lógica probada por unidades y ejecutado dentro de OpenCPN { "5.8.4" } bajo una pantalla virtual (evidencias en <c1/>); no empaquetado para el gestor de complementos; solo se entregará tras revisión

# text
seg-2e0058b5e057 = Compilación de referencia

# text
seg-959d93e3a56d = piezas, pasos del sistema operativo, unidades systemd (comprobadas en simulación), una opción de contenedor; no probado en un buque

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: MARITIME-TRUST.md
# c4: integrations/signalk/lib/adapter.js
seg-8524cb32f0a3 = Todo ello lee una sola cosa: la salida de <c1/> (líneas JSON, la sentencia <c2/>, la puerta). Los formatos de transmisión están en <a1><c3/></a1>. El complemento de Signal K concentra su conocimiento de ellos en un solo archivo, <c4/>; un cambio de formato es una edición de un solo archivo.

# text
# c1: signalk-server
# c2: integrations/signalk/
# c3: node_modules
# c4: ~/.signalk/node_modules/signalk-kshana-trust
seg-e5b08ab63d78 = Sin dependencias de npm. El complemento en sí se ejecuta en Node { "18" } o posterior; las versiones actuales de <c1/> requieren Node { "22" } o posterior, así que en la práctica use { "22" }. Copie o enlace <c2/> en el <c3/> del servidor (por ejemplo <c4/>), reinicie el servidor y active <b>Kshana GNSS trust</b> en Server, Plugin Config.

# text
# c1: source
seg-fd80525d7dd1 = De dónde proceden las épocas (<c1/>)

# text
seg-013478c9a701 = Qué hace el complemento

# text
# c1: spawn-signalk-nmea
seg-abbd00e9cacf = <c1/> (por defecto)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: nmea0183
# c3: spawn-args
# c4: --tcp
# c5: tcp-pksht
seg-8ca5f95ed09d = Ejecuta <c1/> y escribe en su entrada estándar cada sentencia NMEA { "0183" } sin procesar que recibe el servidor (el evento <c2/> del servidor). Lo reinicia, con espera creciente, si termina | <b>Úselo solo en un servidor con una única fuente NMEA</b>: introduce cada sentencia de cada proveedor, entremezcladas, de modo que un segundo receptor GNSS o un AIS parece un receptor cuya posición salta y puede puntuarse como suplantación. Con más de una fuente use <c3/> con el propio flujo <c4/> de ese receptor, o <c5/> desde una puerta.

# text
# c1: kshana receiver-trust live <sessionFile> <inputArgs...>
# c2: ["--tcp","192.0.2.10:10110"]
# c3: ["--udp","10110"]
seg-3b3eadcffb90 = Ejecuta <c1/>, por ejemplo <c2/> o <c3/>

# text
# c1: kshana
# c2: integrations/opencpn/
seg-d69b5ebe1042 = Se conecta a un flujo de las líneas JSON que escribe <c1/> (por ejemplo desde el relé de <c2/>)

# text
# c1: $PKSHT
seg-cd5a419844cc = Se conecta a un flujo NMEA (como la salida de puerta del servicio o del contenedor de la compilación de referencia, puerto { "10110" }) y lee solo sus sentencias <c1/>

# text
# c1: calibration_s
seg-f17c9b7d7abc = Un flujo que ya está siendo suplantado cuando el monitor se conecta por primera vez no tiene una línea base limpia (los primeros <c1/> segundos nunca se puntúan). Inícielo antes de la travesía.

# text
seg-33fc47100aa6 = Rutas publicadas

# text
# c1: kshana-trust
seg-f032afe8b331 = Cada época actualiza (fuente <c1/>):

# text
seg-b809eaf502ad = Ruta

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> o <c4/>

# text
# c1: null
seg-d4d4d5d5ec1f = de { "0" } a { "100" }, o <c1/> durante la calibración

# text
# c1: [{monitor, points}]
seg-5280497b5d9f = <c1/>, de mayor a menor: qué comprobaciones redujeron la puntuación

# text
seg-6089a3166c91 = los monitores que superan actualmente su umbral

# text
# c1: off
# c2: passed
# c3: withheld
# c4: null
# c5: $PKSHT
seg-55280b62eb19 = <c1/>, <c2/> o <c3/> (cuando hay una puerta en funcionamiento en otro lugar; <c4/> desde <c5/> cuando está ausente)

# text
# c1: {latitude, longitude, altitude}
# c2: $PKSHT
# c3: kshana
# c4: navigation.position
seg-963da9c0d2a3 = <c1/>: la posición que el receptor sometido a prueba notificó en esa época (esquema JSON { "1.1" } o posterior; no se publica cuando el flujo no la lleva, por ejemplo desde <c2/> o un <c3/> anterior). <b>Solo contexto de confianza</b>: el complemento nunca escribe <c4/>, por lo que la ruta de posición propia del buque queda intacta

# text
# c1: {state, method, message}
seg-50599cef740d = se emite cuando cambia el estado: <c1/>

# text
# c1: score
# c2: reasons[].points
seg-ad58b4599f78 = El complemento también envía una vez al inicio metadatos de Signal K para estas rutas. <c1/> es la puntuación de confianza de Kshana de { "0" } a { "100" }, una puntuación y no una razón ni una probabilidad, por lo que no lleva unidad SI; sus metadatos dan el intervalo, una descripción y zonas que siguen los umbrales de abajo. <c2/> son puntos de puntuación restados de esa puntuación de { "0" } a { "100" }.

# text
# c1: normal
# c2: alert
# c3: warn
# c4: alarm
# c5: normal
# c6: null
# c7: null
# c8: normal
# c9: warn
# c10: alarm
# c11: method: ["visual","sound"]
# c12: clearAfterEpochs
# c13: staleAfterS
# c14: $PKSHT
# c15: alarms
seg-bf0c90f5c02a = La notificación es <c1/>, <c2/>, <c3/> o <c4/>. Se borra publicando el estado <c5/>, no <c6/>: un consumidor que solo trata <c7/> como borrado debe tratar también <c8/> como borrado. Por defecto, la banda <b>degraded</b> da <c9/> y la banda <b>untrusted</b> da <c10/>, con <c11/>. Se rebaja tras <c12/> épocas en un estado mejor. Si no llega ninguna época durante <c13/> segundos, avisa de que la puntuación no se está actualizando. La calibración nunca genera una notificación. La fuente <c14/> no lleva lista <c15/> (la sentencia solo contiene la banda, la puntuación y los dos motivos principales).

# text
seg-89cdf02b58e3 = Configuración (cada umbral)

# text
seg-d7bdd78470ec = el ejecutable (modos de ejecución). <b>Ejecuta cualquier ejecutable con el usuario del servidor</b>: solo un administrador del servidor Signal K debería poder cambiar la configuración del complemento

# text
seg-73091c431bcf = los límites, umbrales y pesos de puntuación del buque (modos de ejecución)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: spawn-args
# c3: --replay
# c4: spawn-signalk-nmea
# c5: --gate
# c6: --listen
# c7: --json
# c8: --pksht
# c9: kshana
# c10: spawn-signalk-nmea
# c11: --stdin
# c12: --file
# c13: --tcp
# c14: --udp
# c15: --follow
# c16: --from-end
seg-f5f08c50abc7 = argumentos añadidos a <c1/> en ambos modos de ejecución: la entrada para <c2/>, indicadores adicionales como <c3/> (un registro almacenado alimentado más rápido que en tiempo real) para <c4/>. El complemento rechaza <c5/>, <c6/>, <c7/> y <c8/> (lee el JSON de <c9/> en la salida estándar) y, para <c10/>, también los indicadores de entrada (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

# text
# c1: tcp-pksht
seg-01caf7ed213f = Modos TCP (la puerta sirve en { "10110" }: fije el puerto para <c1/>)

# text
# c1: band
# c2: score
seg-72b911dea6bd = <c1/>: la banda que notifica Kshana, con los bordes en el archivo de sesión. <c2/>: las dos puntuaciones de abajo

# text
# c1: score
# c2: degradedState
seg-76ca56821979 = modo <c1/>: por debajo de este valor el estado es <c2/> (el borde por defecto de Kshana para nominal)

# text
# c1: score
# c2: alarm
seg-429d8fc4570f = modo <c1/>: por debajo de este valor el estado es <c2/> (el borde por defecto de Kshana para degraded)

# text
# c1: normal
# c2: alert
# c3: warn
seg-6d5c9e402211 = estado para la banda degraded: <c1/>, <c2/> o <c3/>

# text
seg-e88a2979ef07 = épocas consecutivas en un estado peor antes de emitir la notificación

# text
seg-0eec67224385 = épocas consecutivas en un estado mejor antes de rebajarla

# text
# c1: 0
seg-76b52e312539 = avisa cuando no llega ninguna época durante este tiempo; <c1/> lo desactiva

# text
seg-87d3fcf7fec9 = métodos de notificación

# text
seg-9a455cf4a2f9 = El complemento no actúa como puerta: nunca altera una posición. Marcar una posición como no válida para un sistema de cartas es la puerta, más abajo.

# text
# c1: node:test
# c2: 127.0.0.1
# c3: $PKSHT
# c4: kshana receiver-trust live
seg-30f48b177c1c = <c1/>, sin dependencias, sin red salvo <c2/>. Las pruebas analizan y reproducen un extracto de 66 épocas de las líneas JSON y de las sentencias <c3/> que <c4/> escribió para la demostración sintética del Báltico (datos inventados, solo texto), comprueban la coincidencia entre los dos formatos, el comportamiento de retención y de borrado, el modo de puntuación, la obsolescencia y las tres vías de entrada frente a un flujo local y un proceso hijo sustituto. Esas pruebas no inician un servidor Signal K real; una ejecución con guion aparte sí lo hace, véase abajo.

# text
seg-024928983177 = Ejecución en un servidor Signal K real

# text
# c1: integrations/signalk/evidence/
# c2: signalk-server
# c3: kshana
# c4: reportedPosition
# c5: navigation.position
seg-80b5a217d13c = <c1/> contiene un guion que carga el complemento en el paquete <c2/> { "2.33.0" } fijado (en un espacio de nombres de red privado solo de bucle local) y registra lo que muestran las propias API REST y WebSocket del servidor. Las rutas de confianza aparecen, la notificación pasa por warn, alarm, normal (tras la retención) y warn de nuevo cuando cesan los datos, y con el <c3/> real alimentado por la propia entrada NMEA del servidor también publicó <c4/>, nunca <c5/>. Una versión de servidor, una ejecución, ningún buque real; límites y reproducción en el README de las evidencias.

# text
# c1: kshana receiver-trust live --gate
seg-fea2e7d140c3 = OpenCPN lee NMEA de la red, y <c1/> puede servir por sí mismo el flujo filtrado por la puerta en un puerto TCP.

# text
seg-92981e13bc6f = Recomendado: la conexión directa.

# text
# c1: some-nmea-source
# c2: stty
# c3: cat
# c4: --tcp
# c5: --udp
# c6: kshana
# c7: kshana-gate.service
# c8: --listen tcp:<port>
seg-e6caa4d53b9a = (<c1/> es el puerto serie del receptor leído con <c2/> y <c3/>, un multiplexor, o las entradas <c4/>/<c5/> del propio <c6/>; el <c7/> de la compilación de referencia lo hace bajo systemd.) <c8/> se enlaza a la dirección de bucle local; puede conectarse cualquier número de clientes de solo lectura, y el que no pueda seguir el ritmo se descarta sin retrasar a los demás.

# text
seg-311e4379acf1 = Alternativa: el relé.

# text
# c1: integrations/opencpn/nmea-tcp-relay.mjs
# c2: kshana
# c3: --listen
seg-11b4c4791f55 = <c1/> es un distribuidor Node sin dependencias que hace lo mismo para un <c2/> sin <c3/>, o que sirve cualquier otro flujo de líneas (la opción de contenedor lo usa para las épocas JSON):

# text
seg-93cb82966313 = Reenvía los bytes sin cambios, solo líneas completas, y descarta a un cliente que no lee. Prefiera la conexión directa: un proceso menos en la cadena.

# text
# c1: 127.0.0.1
# c2: 10110
# c3: $PKSHT
# c4: 0
# c5: V
# c6: $PKSHT
seg-4226afc6175c = En OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protocolo <b>TCP</b>, dirección <c1/>, puerto <c2/>, sentido <b>Input</b>. Mientras la confianza no se haya hundido, el flujo es el propio del receptor, más una sentencia <c3/> por ciclo. Mientras está hundida, la GGA reenviada tiene calidad <c4/>, el estado de RMC <c5/>, y los indicadores de modo dicen que no hay solución, con las sumas de comprobación recalculadas: el equipo ve que el propio receptor declara la posición no válida y activa su propia alarma. Las sentencias <c6/> son visibles en la ventana de depuración NMEA de OpenCPN (Options, Connections, "NMEA debug window"). Los campos de posición se dejan tal como se recibieron.

# text
# c1: MARITIME-TRUST.md
seg-8549d49f1b2c = Lea "Gate mode" en <a1><c1/></a1> antes de fiarse de esto: es opcional, añade latencia (un ciclo se retiene hasta que se puntúa su época), es un punto único en la cadena y puede retener una buena posición además de dejar pasar una falsificada.

# text
# c1: test/relay.test.mjs
# c2: kshana receiver-trust live --gate
# c3: $PKSHT
# c4: W
seg-533a911141d6 = <c1/> reproduce un extracto grabado del flujo sintético filtrado por la puerta ({ "186" } sentencias en torno al momento en que se hunde la confianza, escritas por <c2/>) a través del relé sobre un socket TCP real y comprueba lo que recibe un consumidor: el flujo byte a byte con fragmentación arbitraria; sumas de comprobación válidas en cada sentencia, incluidas las reescritas; GGA y RMC coincidentes, válidas y luego no válidas sin parpadeo; una <c3/> por ciclo con su campo de puerta <c4/> exactamente donde la posición no es válida; dos consumidores idénticos; una línea parcial nunca reenviada. Esto comprueba el flujo que se entrega a OpenCPN, no la pantalla propia de OpenCPN.

# text
# c1: kshana
seg-12fc91a3f69b = Una comprobación de extremo a extremo con el binario real, que no forma parte de las pruebas por defecto (necesita un <c1/> compilado):

# text
# c1: $PKSHT
seg-fea419a50c52 = Ambas ejecutan la demostración sintética de una hora y comprueban que la posición pasa a válida y luego a no válida, con una <c1/> por época.

# text
seg-e76c11d8f003 = Complemento nativo

# text
# c1: integrations/opencpn/plugin/
# c2: $PKSHT
# c3: ctest
# c4: $PKSHT
# c5: integrations/opencpn/evidence/
# c6: README.md
# c7: LICENSING.md
seg-7a5ac2d2f229 = <c1/> es un panel de puntuación para OpenCPN (puntuación, banda, puerta, motivos principales, una alerta cuando la confianza pasa a untrusted) que lee <c2/> del propio flujo NMEA de OpenCPN, por lo que no necesita ninguna conexión más allá de la anterior. Se compila con CMake contra la cabecera de la API de complementos de OpenCPN (incluida, con su commit de origen) y wxWidgets; <c3/> ejecuta las pruebas de lógica sin wx y comprueba que la biblioteca exporta los puntos de entrada que busca OpenCPN. Se ha ejecutado dentro de OpenCPN { "5.8.4" } bajo una pantalla virtual con el flujo sintético filtrado por la puerta (OpenCPN entregó <c4/> al complemento, el panel se puso en rojo y la propia posición de OpenCPN se congeló cuando se activó la puerta; capturas, registro y guion en <c5/>), pero no en un escritorio real, ni en otras versiones o plataformas, y no está empaquetado para el gestor de complementos de OpenCPN. Véase el <a1><c6/></a1> del complemento. Tiene licencia GPL-3.0-or-later, a diferencia del resto del repositorio (<a2><c7/></a2>).

# text
# c1: integrations/opencpn/evidence/
# c2: README.md
seg-a2adfa7ff5fb = Capturas de esa ejecución, en <c1/> (una ejecución, OpenCPN { "5.8.4" } bajo una pantalla virtual, datos sintéticos; <a1><c2/></a1> da los límites):

# attr:alt
seg-ee5e8bb5a734 = La ventana de cartas de OpenCPN con el complemento del panel de puntuación de Kshana sobre el flujo sintético filtrado por la puerta, antes del hundimiento de la confianza: no hay ningún panel abierto (se abre solo con la alarma), la posición del buque en la barra de estado indica { "54" } { "32.4659" } N { "018" } { "46.1670" } E con velocidad { "16.48" } kn y rumbo { "088" }, y el indicador de posición de la parte superior derecha muestra tres barras.

# attr:alt
seg-1189d82affbb = La misma ventana de OpenCPN tras el hundimiento: el panel de Kshana está abierto en rojo con la puntuación { "47" } y la palabra UNTRUSTED, las líneas gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 y edad { "2" } s, y la declaración de que es software de carácter consultivo, no un equipo de navegación homologado y de que el operador sigue siendo responsable. La barra de estado sigue indicando { "54" } { "32.4672" } N { "018" } { "46.2227" } E, y el indicador de posición ha bajado a dos barras.

# attr:alt
seg-90c7cdee8892 = OpenCPN alimentado directamente por kshana receiver-trust live --gate --listen: el panel de Kshana está abierto en rojo con la puntuación { "44" } y UNTRUSTED, las líneas gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 y edad { "1" } s, y la declaración consultiva. Esta ejecución no respalda la observación de congelación de la posición: OpenCPN seguía procesando la ráfaga inicial de épocas.

# text
seg-dce06383cde1 = Estas capturas muestran la instalación y la llegada de la posición filtrada por la puerta a OpenCPN, no que alguna alarma sea oportuna o correcta para un buque real. Software de carácter consultivo, no un equipo homologado.

# text
# c1: deploy/reference-build/
# c2: deploy/reference-build/check-units.sh
# c3: systemd-analyze verify
seg-f9f39d089438 = <a1><c1/></a1>: una lista genérica de piezas, la configuración del sistema operativo, dos unidades systemd (el monitor consultivo y la puerta opcional), una opción de contenedor y el cableado de Signal K. <c2/> ejecuta <c3/> sobre las unidades sin iniciar nada.

# text
# c1: MARITIME-TRUST.md
seg-5e2a2e8af941 = La puntuación vale lo que valgan las comprobaciones que la respaldan, que examinan la física de un buque y sus demás sensores; una falsificación autoconsistente con un reloj coincidente no la ven los monitores solo de NMEA (<a1><c1/></a1>). La ausencia de una alarma no es evidencia de una buena posición.

# text
seg-be1ed291f7c3 = Ninguna cifra de esta página es una tasa de detección o de falsa alarma medida. Las pruebas anteriores comprueban la instalación con texto sintético; no dicen nada sobre cómo se comporta ningún monitor frente a interferencias reales.

# text
seg-97d775b504c6 = No homologado; el operador sigue siendo responsable.

# text
seg-69222f7d5068 = <s1>Anterior</s1>Mapa de interferencias: fuentes de datos y licencias

# text
seg-8eba9835d7df = <s1>Siguiente</s1>Geometría del cielo y perfiles del horizonte

# text
seg-2093a1d8a24e = De dónde proceden las épocas (fuente)
