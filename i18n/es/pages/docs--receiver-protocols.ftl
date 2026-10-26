# docs--receiver-protocols: translations (es)

# text
seg-99427ab75a03 = campo

# text
# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Fuente: <c1/>

# text
seg-4540630d4859 = Protocolos de receptor que lee receiver-trust ({ "0.38" })

# text
seg-906a5f9e6cd9 = Solo lectura, en todo momento: nada de esto escribe un solo byte en un receptor y no existe ninguna ruta de transmisión de ningún tipo. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable.

# text
seg-a44353d98d6c = Los indicadores propios del receptor sobre spoofing y jamming (UBX)

# text
seg-b58d3a8f292c = mensaje

# text
seg-24c57b65b8f7 = se lee como

# text
seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

# text
# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = byte <c1/> en el desplazamiento { "7" }, bits { "4" }..3: <c2/>

# text
seg-54d4cf306b49 = { "0" } desconocido o desactivado, { "1" } sin indicación de spoofing, { "2" } spoofing indicado, { "3" } múltiples indicaciones de spoofing (protocolo { "18" } y posteriores; descripción de interfaz de u-blox F9 HPG { "1.32" }, sección { "3.15.20" })

# text
seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versión { "1" }, { "12" } bytes

# text
# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> en { "4" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState); <c2/> en { "8" } (bit { "0" } spfDetEnabled, bits { "3" }..1 spoofingState)

# text
seg-3e117e319518 = los estados se leen solo donde el detector está activado; { "0" } desconocido, { "1" } ninguno, { "2" } aviso o indicado, { "3" } crítico o afirmado

# text
seg-8a5a59761cd0 = UBX-SEC-SIG versión { "2" }

# text
# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> en { "1" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bits { "6" }..4 spoofingState); <c2/> en { "3" } y ese número de grupos de 4 bytes (no se usan)

# text
seg-e0eb14018b2c = como arriba

# text
# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>Fuente del formato de SEC-SIG.</b> Las descripciones de interfaz de u-blox F9 HPG { "1.32" } y M10 SPG { "5.10" } que se pudieron descargar al escribir esto nombran UBX-SEC-SIG pero no lo definen. Los formatos anteriores son los de descripciones de interfaz posteriores de u-blox, tal como se transcriben en la biblioteca pyubx2 (BSD-3-Clause, <c1/> y <c2/>); las pruebas con datos de prueba de <c3/> se construyen a partir de ese formato, no de la salida de un receptor real. Formato obtenido de una transcripción abierta, no comprobado frente a la guía vigente del fabricante: compruébelo frente a la descripción de interfaz vigente de u-blox antes de confiar en SEC-SIG.

# text
seg-6af7d45be34d = Un SEC-SIG no tiene tiempo de semana; pertenece a la época de navegación en curso. Un estado ya leído en una época se conserva salvo que uno posterior sea peor.

# text
# c1: receiver-self-report
seg-f1cf7ee27cb1 = La comparación <c1/>

# text
# c1: self_report
# c2: agreement
# c3: both
# c4: receiver-only
# c5: kshana-only
# c6: neither
# c7: calibrating
# c8: receiver_self_report
# c9: epochs[].self_report
seg-f30ddb83bf99 = Cuando un registro lleva estos indicadores, cada época del resultado tiene <c1/> (los dos estados, si el receptor señala, si alguno de los monitores de Kshana dio alarma y <c2/>: <c3/>, <c4/>, <c5/>, <c6/> o <c7/>), y el resultado tiene <c8/> con los recuentos y la primera época de cada uno. El receptor «señala» con un estado de { "2" } o más. <b>No da ninguna alarma y no cambia ninguna puntuación</b>, y ninguno de los dos lados es la verdad de referencia: la concordancia no es validación, y una discrepancia indica que un detector vio algo que el otro no, sin decir nada sobre cuál tenía razón. La franja de Studio lee <c9/>.

# text
# c1: format = "sbf"
seg-49ae6094c06a = Septentrio SBF (<c1/>)

# text
# c1: receiver_trust::ingest::read_sbf
# c2: sbf-tools
# c3: thiserror
# c4: deny.toml
# c5: band
# c6: L1CA
# c7: Info
# c8: rf_bands_reported
# c9: 2024-09-05T00:00:00.000 GPST
seg-4d6365d9ffd1 = <c1/> decodifica con el crate <c2/> ({ "0.4" }, <b>MIT</b>; su única dependencia es <c3/>; una licencia permisiva que <c4/> admite). Bloques leídos: PVTGeodetic ({ "4007" }) para la solución, MeasEpoch ({ "4027" }) para el C/N0 por satélite y señal (<c5/> es el nombre de la señal, como <c6/>) y RFStatus ({ "4092" }) para el número de bandas de RF cuyo byte <c7/> no es cero (<c8/>, transportado y <b>no interpretado</b>: nunca cuenta como indicador). Las épocas se indexan por tiempo de semana y número de semana y se etiquetan en tiempo GPS (<c9/>). Un bloque que falla su CRC o su análisis cuenta como registro omitido. Este lector no lee el AGC ni un indicador de jamming, de modo que los monitores de caída de C/N0 y de pérdida de enganche se ejecutan y los monitores de AGC y de indicador de jamming no.

# text
# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Fuente de los formatos.</b> La guía de referencia de Septentrio no se pudo descargar al escribir esto (el servidor rechazó la solicitud), de modo que los formatos se tomaron del código fuente de <c1/>, que cita la guía, y los datos de prueba de <c2/> son bloques sintéticos construidos con ese formato y su CRC-16-CCITT. No se usó ningún registro SBF real. Formato obtenido del crate de código abierto, no comprobado frente a la guía vigente del fabricante: compruébelo frente a la guía de referencia de Septentrio antes de confiar en él.

# text
# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Entrada directa por serie y USB (<c1/>)

# text
# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Solo Unix. Abre el dispositivo para lectura, pone la línea <b>local</b> en modo sin procesar a <c1/> (por defecto { "4800" }, la velocidad de NMEA { "0183" }) y lee líneas NMEA como cualquier otra fuente. Nunca escribe en el receptor. <c2/> se rechaza con una explicación: Kshana no configura receptores; configure el receptor para que emita NMEA con la herramienta del propio fabricante y después léalo. La alimentación es NMEA, como en toda fuente de <c3/> (UBX y SBF se leen de archivos). Un dispositivo que desaparece termina el comando como un fallo (salida { "1" }), para que lo reinicie un supervisor; la capa no se reconecta. Probado sobre un bucle de pseudoterminal (<c4/>), incluido que el lado maestro no recibe ningún byte del comando.

# text
seg-97e1ea47c2be = <s1>Anterior</s1>Entradas de máquina y de sensor

# text
seg-55ad3fc908be = <s1>Siguiente</s1>Observatorio de interferencias: método

# text
seg-17c3203ee615 = La comparación con el autoinforme del receptor

# text
seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

# text
seg-8444127e7ee6 = Entrada directa por serie y USB (receiver-trust live --serial)
