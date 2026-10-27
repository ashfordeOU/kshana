# docs--trust-telemetry: translations (es)

# text
seg-2247a2344710 = Significado

# text
seg-d4e48c972084 = Etiquetas

# text
seg-ca448daf5ec7 = nominal

# text
seg-a129b9e613d0 = Tipo

# text
seg-2672b7f55371 = degradadas

# attr:alt
seg-c711c7fecbfc = Un resultado de confianza en tres formatos de exportación, a partir de ejecuciones reales del motor v{ $version } (`kshana trust-telemetry`) sobre examples/maritime-trust: exposición de texto de Prometheus (la última puntuación de confianza es { "5.9" } y la banda de no confiable es la activa), y los últimos mensajes CEF y LEEF. El comando no publica nada si no se le da un destino, no guarda credenciales y no transmite ninguna señal de radio. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Fuente: <c1/>

# text
seg-05919ac6cf31 = Confianza en GNSS como telemetría de seguridad

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> convierte el flujo de confianza GNSS por época (puntuación de 0-100, banda, motivos) en señales que un centro de operaciones o de seguridad ya ingiere: métricas de Prometheus, eventos de syslog en CEF o LEEF para un SIEM y, opcionalmente, OpenTelemetry. Lee el flujo; nunca cambia la evaluación de confianza y no transmite nada salvo telemetría.

# text
# c1: docs/MARITIME-TRUST.md
# c2: t_s
# c3: state
# c4: calibrating|nominal|degraded|untrusted
# c5: score
# c6: time
# c7: gate
# c8: off|passed|withheld
# c9: position
# c10: lat_deg
# c11: lon_deg
# c12: height_m
# c13: deductions
# c14: alarms
# c15: geometry
# c16: status
# c17: hdop
# c18: pdop
# c19: n_used
# c20: class
# c21: kshana_trust_input_errors_total
# c22: src/telemetry/sample.rs
seg-14ad6b7911d6 = La entrada es el esquema JSON-lines en vivo v1.1 documentado en <c1/>. Se lee: <c2/>; <c3/> (<c4/>, la banda); <c5/> (0-100 o null); <c6/> (la hora de la época tal como se declara); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/>, o null); los motivos son los monitores de <c13/>, y luego cualesquiera otros de <c14/>; a partir del esquema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) y la <c20/> de cada deducción. Las demás claves se ignoran, ya que el esquema solo crece añadiendo claves al final. Una línea que no se analiza se cuenta en <c21/> y se omite; las puntuaciones fuera de 0-100 se rechazan, no se recortan, de modo que se advierte un cambio de formato. El único código que conoce este formato es <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> se sirve sin autenticación y por defecto en <c2/>. Enlazar a otra dirección imprime una advertencia; póngalo detrás de su propio control de acceso. El punto de conexión atiende una conexión cada vez con un límite de lectura de { "2" } s, de modo que un cliente inactivo puede retrasar una recolección hasta ese tiempo; está pensado para un único recolector, no para la red abierta.

# text
seg-7e66e43f15a8 = Home Assistant y dispositivos NTP (MQTT)

# text
# c1: --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: homeassistant/...
# c4: untrusted
# c5: <prefix>/state
# c6: kshana/trust/state
# c7: state
# c8: score
# c9: untrusted
# c10: t_s
# c11: time
# c12: reasons
# c13: gate
# c14: --mqtt-prefix
# c15: --mqtt-node
# c16: --mqtt-discovery
seg-fbe56ff7f1ed = <c1/> imprime, y <c2/> publica, un documento de estado JSON y mensajes de descubrimiento MQTT de Home Assistant. El descubrimiento (retenido, bajo <c3/>) crea tres entidades: puntuación de confianza, banda de confianza (con los motivos como atributos) y un sensor de problema <c4/>. El documento de estado va a <c5/> (por defecto <c6/>, retenido): <c7/>, <c8/> (null mientras no haya ninguna), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> y la declaración orientativa; la posición nunca se incluye. Opciones: <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = El publicador habla MQTT { "3.1.1" } con QoS { "0" } y solo lee el CONNACK del broker. No tiene credenciales ni TLS, de modo que use un broker de la red local (o un relé local que las añada). La entrega se ejecuta en su propio hilo detrás de una cola de { "1024" }: un broker caído descarta mensajes, que se cuentan y se informan al final, y nunca bloquea el flujo. Un dispositivo NTP o cualquier otro consumidor que quiera JSON simple puede leer la misma línea de estado. No se escribe nada en un receptor ni en un reloj. Python, WebAssembly y MCP admiten <c1/> y devuelven las mismas líneas <c2/> (allí no se publica nada).

# text
seg-ed95ebb0ba1b = Desde Python, WebAssembly y MCP

# text
# c1: kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False, syslog_all=False, unix_nano=0)
# c2: trust_telemetry(input, format, host, input_kind, options_json)
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: format
# c6: prometheus
# c7: cef
# c8: leef
# c9: otlp
# c10: input_kind
# c11: jsonl
# c12: result
# c13: --print-metrics
# c14: --print-syslog
# c15: host
# c16: syslog_all
seg-93be007cdfda = Los codificadores también están disponibles como llamadas de texto de entrada y de salida, sin proceso, socket ni reloj: <c1/> de Python, la exportación de WebAssembly <c2/> y la herramienta MCP <c3/> (comando del plugin <c4/>). <c5/> es <c6/>, <c7/>, <c8/> u <c9/>; <c10/> es <c11/> (el flujo) o <c12/> (un resultado por lotes). Devuelven el mismo texto que imprime la línea de comandos (<c13/>, <c14/>), con los mismos límites: las líneas de syslog no llevan marca de tiempo, <c15/> tiene como máximo { "255" } caracteres ASCII imprimibles sin espacios (se rechaza en caso contrario, aquí y en la línea de comandos), y se rechaza una respuesta mayor que el límite de la superficie ({ "4" } MiB en MCP), porque CEF y LEEF con <c16/> escriben un evento por época. No se envía, sirve ni escribe nada; los exportadores en ejecución siguen siendo un proceso de la línea de comandos.

# text
seg-f8c367611a9e = La entrega nunca bloquea la evaluación

# text
# c1: /metrics
seg-3853bb63c7ad = La entrega de syslog y de OpenTelemetry se ejecuta en sus propios hilos. El bucle de ingesta solo les pasa un mensaje o una instantánea y nunca espera, de modo que un colector caído, lento o que no lee no puede ejercer contrapresión sobre el flujo en vivo ni congelar <c1/>:

# text
seg-589d02c31dfe = cada conexión y cada escritura tiene un límite de { "2" } s; una conexión fallida se descarta y se reconecta de forma diferida, con retroceso exponencial de { "1" } s hasta { "60" } s;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = un mensaje que no puede entregarse (colector caído, escritura agotada por tiempo, cola de { "1024" } llena) se descarta y se cuenta en <c1/>; avise según su tasa;

# text
seg-4a7cd2065731 = al exportador de OpenTelemetry se le entrega una copia del registro, de modo que no se mantiene ningún bloqueo durante la E/S de red; si una exportación sigue en curso, se omite la nueva instantánea (la siguiente lleva los mismos totales acumulados).

# text
seg-57c3bbe405c8 = Al final de la entrada se da a los hilos emisores el tiempo restante que tienen como límite para terminar.

# text
seg-14c13ed8c509 = Métricas de Prometheus

# text
seg-d060b2163513 = Métrica

# text
seg-45c41bf74eb8 = gauge

# text
seg-e43a6814d13c = constante { "1" }

# text
seg-3662d2b8a789 = última puntuación 0-100; ausente si el origen no da ninguna

# text
seg-1c50874472fc = { "1" } para la banda actual, { "0" } para las demás

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para el estado actual, { "0" } para los demás; ausente sin compuerta

# text
# c1: --expose-position
seg-3e01cab63c59 = posición informada por el receptor; <b>solo con <c1/></b> (el punto de conexión no está autenticado y una posición puede identificar un emplazamiento o un buque)

# text
seg-280a5ca2e5d9 = { "1" } si está presente en la última época

# text
seg-22ded4fe7f29 = contador

# text
seg-800b23c30e2f = épocas recibidas

# text
seg-be11849d8a9b = épocas en las que el motivo estuvo presente

# text
seg-0475fe7b26ba = líneas de entrada que no se pueden analizar

# text
# c1: reason="other"
seg-65f1db183cbc = apariciones de motivos agrupadas en <c1/> (véase más abajo)

# text
seg-e756633e7d5c = eventos de syslog no entregados

# text
seg-2de3258f83ee = desfase de la última época respecto del inicio del flujo

# text
seg-c02fe207663e = hora de recepción de reloj de pared; avise según su antigüedad

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = geometría de satélites en la última época, <c1/>, <c2/>, <c3/>: { "1" } para la actual <em>(entradas del esquema { "1.3" })</em>

# text
seg-4878afc243e3 = { "1" } degradada, { "0" } buena; ausente cuando la geometría es desconocida

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" } cuando no se siguen satélites a la vista mientras su geometría es buena (se perdió la señal, no el cielo; <c1/> sigue valiendo { "1" }), y { "0" } en caso contrario; ausente cuando la geometría es desconocida o la entrada no lo indica

# text
seg-db29584bb51c = HDOP, PDOP y satélites usados en la última época; cada uno ausente cuando no hay ninguno

# text
seg-c60ca4530e92 = épocas por estado de geometría

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = etiqueta de geometría en la última época, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para la actual; nunca se puntúa (la puntuación solo deduce por <c5/>); a partir de entradas que llevan la etiqueta ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP en la última época; ausente cuando no hay ninguno

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>La etiqueta de geometría es lo principal.</b> Represente y avise según <c1/> (OTLP <c2/>, el tercer campo <c3/> de CEF, <c4/> de LEEF): <c5/> es la única etiqueta por la que deduce la puntuación. El estado de la geometría es descriptivo: <c6/> incluye el caso informativo <c7/>, que puede darse con un DOP bueno o aceptable, de modo que no dé aviso solo por <c8/>.

# text
# c1: kshana_trust_reason_active
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
# c6: geometry
# c7: unknown
# c8: kshana_trust_reason_active{class="inconsistency"}
# c9: geometry
# c10: docs/RECEIVER-TRUST.md
seg-70343708da03 = A partir de las entradas del esquema { "1.3" }, <c1/> lleva además una etiqueta <c2/> (<c3/>, <c4/>, <c5/>) en cada motivo que vino con una: la clase de la deducción en la última época. Las series de geometría van después de todas las demás y solo una vez que una época de entrada lleva <c6/> (esquema en vivo { "1.3" }, un resultado del motor { "0.36" } o posterior), de modo que un flujo o resultado { "0.35" } se representa byte por byte como antes. Los valores de las etiquetas son conjuntos fijos (un estado desconocido se lee <c7/>; una clase desconocida se descarta). Avise según <c8/> y no solo según la banda, para que un cielo malo no dé aviso como si fuera un ataque; una clase <c9/> es una afirmación sobre el cielo, no una constatación de que no hubo ataque (véase <c10/>).

# text
# c1: class
# c2: loss-of-lock
# c3: environment
# c4: geometry
# c5: geometry
# c6: inconsistency
# c7: reason
# c8: max by (reason)
# c9: class
seg-3f45b21003d5 = La etiqueta <c1/> forma parte de la identidad de una serie: cuando la clase de un motivo cambia entre épocas (<c2/> de <c3/> a <c4/> cuando los satélites perdidos estaban bajos, o de <c5/> a <c6/> cuando el HDOP declarado discrepa del cielo declarado), la serie antigua deja de exportarse y empieza una nueva. Consulte por <c7/> con <c8/> cuando la clase no importe, y espere que un cambio así parezca una serie que termina y otra que empieza. Las series del esquema { "1.3" }, la etiqueta <c9/> y los campos de geometría de CEF/LEEF se comprueban con las propias pruebas del motor y con las referencias independientes de CEF (pycef, Logstash); las referencias independientes externas de Prometheus y de OTLP todavía no tienen ningún flujo { "1.3" }.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Los nombres de motivo se recortan a { "128" } caracteres, y como máximo { "64" } motivos distintos reciben su propia serie; los posteriores se cuentan bajo <c1/> y en <c2/>, de modo que una entrada hostil o con errores no puede crear una cardinalidad de etiquetas ilimitada.

# text
# c1: band
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: unknown
# c7: kinematic
# c8: heading-course
# c9: cn0-drop
# c10: agc
# c11: raim
seg-35f3faf39d1c = <c1/> es una de <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Los nombres de motivo son los nombres de monitores del flujo (<c7/>, <c8/>, ...; para el resultado por lotes, <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Hay un panel de ejemplo en <c1/> (impórtelo y elija su origen de datos de Prometheus).

# text
seg-208f33eda580 = Syslog: CEF y LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Los eventos se envían en un sobre RFC { "5424" } (facility local0, aplicación <c1/>, identificador de mensaje <c2/>) por UDP (un datagrama cada uno; IPv4 o IPv6) o TCP, terminados en nueva línea por defecto o, con <c3/>, enmarcados como <c4/> según la RFC { "6587" }. Por defecto se envía un evento por cada cambio de banda; <c5/> envía uno por época. El proveedor se escribe <c6/> (ASCII) para que ningún SIEM lo decodifique mal.

# text
seg-9cb6e1b9fec0 = Concepto

# text
seg-9e4ce52ac5d9 = Severidad de syslog

# text
seg-084d2e726d3f = Severidad de CEF

# text
# c1: sev
seg-60fa1c602748 = <c1/> de LEEF

# text
seg-7948fbcf87cb = calibrating

# text
seg-453691777f9d = { "6" } info

# text
seg-2ac57280bf6a = { "4" } warning

# text
seg-f757a767bd4a = untrusted

# text
seg-8e4e2d9142f9 = { "2" } critical

# text
seg-4c5b832482cb = unknown

# text
seg-5e4f3b0222cd = { "5" } notice

# text
# c1: gnss-trust.<band>
seg-b07ec4ccabf7 = Asignación de campos (el identificador de evento es <c1/>):

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (delimitador <c1/>)

# text
seg-18a4ca402cd9 = categoría

# text
seg-d3bc36a445cb = host emisor

# text
seg-521cea5013c8 = banda

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (etiqueta <c2/>)

# text
seg-f1be6ef87011 = motivos, separados por comas

# text
seg-e77a9847bc7b = banda anterior

# text
seg-87b7f1652b0c = puntuación

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), se omite si no hay ninguna

# text
seg-fc2aebb988bf = desfase de la época, s

# text
seg-9f9d0d551742 = etiqueta de hora del registro

# text
seg-57ed10b00272 = estado de la compuerta

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = estado de la geometría, luego <c1/> y las clases de las deducciones de la época, separadas por comas (por ejemplo <c2/>) <em>(entradas { "1.3" })</em>; a partir de entradas que llevan la etiqueta ({ "0.36" }) un tercer campo, <c3/> y la etiqueta, y el campo de clases está entonces siempre presente (por ejemplo <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (solo el estado), <c2/> (clases) y <c3/> (etiqueta)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, con la etiqueta)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, con la etiqueta)</em>

# text
seg-42273c09a591 = no se transporta: se ocupan los cuatro campos personalizados de coma flotante

# text
seg-292efe9557d6 = satélites usados <em>({ "0.36" }, con la etiqueta)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), un entero

# text
seg-f69551c20173 = pérdida de señal: satélites a la vista que no se siguen mientras su geometría es buena

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = no se transporta como campo (no queda libre ninguna clave del diccionario CEF para ello): el estado indica <c1/> y la clase de la deducción de geometría, <c2/>, va en <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, solo mientras se da

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = En CEF, la geometría usa solo campos personalizados del diccionario (sin claves inventadas); la etiqueta va en <c1/> en lugar de en <c2/> porque el códec CEF de Logstash no asigna los campos <c3/>. Los eventos de geometría { "1.3" }, incluidos los casos de etiqueta, forman parte de la fila CEF VALIDATED: ambos analizadores de referencia independiente los leen de nuevo tal como se escribieron (<c4/>, enmiendas { "4" } y { "5" }, cada una registrada antes de ejecutar cualquiera de los analizadores sobre sus casos). Los campos de etiqueta, VDOP y número de satélites se añaden después de todos los campos y series anteriores, y solo para entradas que llevan la etiqueta, de modo que una entrada sin ella se representa exactamente como antes.

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Los campos vacíos se omiten (no hay <c1/> sin motivos). El nombre del host se recorta a { "255" } caracteres. Los valores de la cabecera CEF escapan <c2/> y <c3/>; los valores de extensión escapan <c4/>, <c5/> y los saltos de línea. En los valores LEEF, <c6/> y los saltos de línea se sustituyen por espacios.

# text
seg-a3b77e9593eb = OpenTelemetry (desactivado por defecto)

# text
# c1: --features otlp
# c2: --otlp http://host:4318/v1/metrics
# c3: kshana.trust.score
# c4: kshana.trust.band
# c5: kshana.trust.epochs
# c6: kshana.trust.reason.epochs
# c7: kshana.geometry.status
# c8: kshana.geometry.degraded
# c9: kshana.geometry.signal_loss
# c10: kshana.geometry.hdop
# c11: kshana.geometry.pdop
# c12: kshana.geometry.used_satellites
# c13: kshana.geometry.label
# c14: label
# c15: kshana.geometry.vdop
# c16: startTimeUnixNano
# c17: --otlp-every
# c18: https://
seg-396c34d29783 = Compile con <c1/> y pase <c2/>. El exportador envía por POST JSON de OTLP/HTTP (<c3/>, <c4/>, <c5/>, <c6/>, y para entradas del esquema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> y, a partir de entradas que llevan la etiqueta ({ "0.36" }), <c13/> (atributo <c14/>) y <c15/>; las sumas acumuladas llevan <c16/>) cada <c17/> épocas (por defecto { "10" }) y al final de la entrada. No añade ninguna dependencia y no tiene TLS: envíe a un colector en el mismo host o en un segmento de confianza, que reenvíe después por TLS. Los puntos de conexión <c18/> se rechazan.

# text
seg-c3111d73a8b0 = <s1>Anterior</s1>Geometría del cielo y perfiles del horizonte

# text
seg-4c539b667a05 = <s1>Siguiente</s1>Verificación OSNMA de Galileo
