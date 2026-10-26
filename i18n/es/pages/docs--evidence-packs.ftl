# docs--evidence-packs: translations (es)

# text
seg-2247a2344710 = Significado

# text
seg-ade1d7072512 = véase más abajo

# text
# c1: docs/EVIDENCE-PACKS.md
seg-802d8b6f3afd = Fuente: <c1/>

# text
seg-710e7e630acb = Paquetes de evidencias: un registro firmado de un evento de confianza GNSS

# text
seg-dbc796deac2a = <b>Un paquete es un registro técnico, no un dictamen jurídico.</b> Indica qué calculó el motor de Kshana a partir de un registro de receptor determinado con una configuración determinada, y permite a cualquiera comprobar que nada se modificó después. No dice qué causó un evento, quién fue responsable, si se cumplió alguna obligación, ni que el registro muestre lo que el receptor recibió realmente. El manifiesto y el resumen lo dicen ambos.

# text
seg-d99cb540310c = Un paquete de evidencias sirve para un informe de incidente, una aseguradora o la pregunta de un regulador: «¿qué dijo su sistema sobre la señal GNSS entre estos dos instantes, y podemos fiarnos de ese registro?»

# text
seg-2fa31fe443b4 = Crear un paquete

# text
# c1: --lab-attestation lab.toml
# c2: HARDWARE-SAFETY.md
seg-983924cb2eea = En un paquete creado a partir de una sesión de laboratorio, <c1/> registra en el manifiesto firmado la declaración del operador sobre el montaje (conducido o apantallado, atenuación o recinto, qué emitía cualquier RF); véase <a1><c2/></a1>. Se registra tal como se da y nunca se verifica.

# text
# c1: --from
# c2: --to
# c3: --out
# c4: --created-utc
# c5: 2026-01-02T03:04:05Z
# c6: none
seg-f01e59c876a3 = <c1/> y <c2/> son segundos desde la primera época del registro, o una hora UTC ISO-8601 cuando el registro indica su propia hora de inicio. <c3/> no debe contener ya archivos. <c4/> admite una hora UTC real como <c5/> (cualquier otra cosa se rechaza) o <c6/>, que omite la hora de creación y hace que el paquete sea reproducible byte a byte. La hora de creación es la que declara el firmante; nada la contrasta con un reloj, y para eso sirve el token de sello de tiempo opcional.

# text
# c1: keygen
# c2: kshana
# c3: .gitignore
# c4: *.evidence-key
seg-c72ddd97ad0b = El archivo de clave contiene una semilla Ed25519 de 32 bytes como { "64" } dígitos hexadecimales; aporte la suya (por ejemplo, una guardada en su sistema de gestión de claves) o deje que <c1/> genere una. <c2/> avisa si otros usuarios pueden leer el archivo. <c3/> excluye <c4/>; ponga ese nombre a su clave si está dentro de una copia de trabajo.

# text
seg-077cbd944c5d = Qué contiene un paquete

# attr:alt
seg-7cf2608b2b2f = La estructura de un paquete de evidencias. Un registro de receptor (NMEA, u-blox UBX, RINEX { "3" } o un registro de Android) y una ventana de tiempo entran en kshana receiver-trust evidence, que escribe siete archivos: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig y un timestamp.tsr opcional. El manifiesto registra el SHA-256 del registro completo y de cada archivo, y una cadena de hashes sobre los archivos; la firma cubre el manifiesto. kshana evidence verify comprueba la firma, el hash de cada archivo, la cadena y que no haya ningún archivo no listado, y termina con { "0" } cuando está verificado, { "1" } cuando algo falló y { "3" } cuando el firmante no estaba fijado. Un paquete es un registro técnico, no un dictamen jurídico.

# text
seg-e305279d5b11 = Contenido

# text
seg-05107c0bd3c8 = los bytes en bruto del registro del receptor correspondientes a la ventana

# text
# c1: geometry_model
# c2: [geometry]
seg-b19ce12544a5 = el escenario tal como se ejecutó (cada umbral de monitor, evento y regla de comparación), los monitores que se ejecutaron, la línea base de calibración y el hash del escenario; para una embarcación, también la declaración de carácter consultivo que lleva toda salida de embarcación (software de carácter consultivo, no un equipo de navegación homologado); desde { "0.36" }, el <c1/> (la tabla <c2/> realmente usada, el peso del monitor de geometría, cada procedencia y las reglas de clase). Se eliminan los nombres de directorio y las cargas en línea.

# text
# c1: geometry
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
seg-e3c2457161bc = cada época de la ventana con las estadísticas del motor, las alarmas (los motivos) y el estado de confianza; desde { "0.36" }, también su <c1/> de satélites (buena, degradada con motivos, o desconocida cuando el registro no da geometría de satélites) y una <c2/> en cada deducción (<c3/>, <c4/>, <c5/>)

# text
seg-2e309765271f = un resumen autónomo y sin scripts: identificación, hashes, resultados, motivos, un carril de geometría (épocas por estado de geometría) separado de las clases de las deducciones ({ "0.36" }), cada umbral, la tabla por época y los límites del registro

# text
seg-467277f816d2 = versión del motor, ventana, hora de creación, el formato y el nombre del registro, <b>el SHA-256 del registro completo</b>, el rango y el SHA-256 del fragmento, la clave pública y la huella del firmante, el tamaño y el SHA-256 de cada archivo, y una cadena de hashes sobre los archivos

# text
# c1: manifest.json
seg-7a92ff70ed7f = firma Ed25519 sobre los bytes exactos de <c1/>

# text
seg-b517814b077d = token de sello de tiempo RFC { "3161" } opcional

# text
# c1: byte-range
# c2: whole-log
seg-6ad4c5f3afbe = <b>Fragmento del registro.</b> El lector informa del intervalo de bytes de origen de cada época, de modo que el fragmento es el menor intervalo de bytes que contiene todas las épocas de la ventana (<c1/>): NMEA, u-blox UBX, observaciones RINEX { "3" } y registros de Android. Se calcula su hash como bytes en bruto, nunca como texto decodificado. Para una fuente en directo o RINEX { "2" } no hay intervalo; entonces se incluye el registro completo y el manifiesto dice <c2/> (la ventana limita qué épocas se informan, no qué bytes se incluyen). El resumen indica cuál de los casos se aplica. Un fragmento es un registro de los bytes de la ventana, no un registro independiente: por ejemplo, un fragmento RINEX no tiene cabecera de archivo.

# text
# c1: link₀ = SHA-256("kshana- evidence-chain/1")
# c2: linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖ name)
# c3: chain_head
seg-c4c81cbd4981 = <b>Cadena de hashes.</b> El manifiesto lista los archivos en un orden fijo. <c1/>; para cada archivo, <c2/> (longitud como { "4" } bytes, big-endian). El último eslabón es <c3/>. Reordenar, quitar o sustituir un archivo cambia la cadena; la firma cubre la cadena.

# text
seg-1147c5b0d348 = Verificar un paquete

# text
seg-e716ddf7bcc9 = El estado de salida { "0" } significa verificado; { "1" } significa que algo falló; { "2" } significa un error de uso; { "3" } significa que el paquete está íntegro pero su firmante no estaba fijado (véase más abajo). Cada comprobación informa de superada, fallida u omitida, y cada fallo se nombra:

# text
seg-f6f2cebd9cb0 = Código de fallo

# text
seg-312a5d784f42 = no se puede leer el manifiesto

# text
# c1: manifest.json
seg-6f1b5d9d6711 = no hay firma, no es una firma hexadecimal en minúsculas de 64 bytes, o no se verifica sobre <c1/>

# text
seg-129b78f142f1 = la clave no es válida, o difiere de la que usted aportó

# text
seg-c86b25543d55 = un archivo listado falta o difiere del manifiesto; se nombra el archivo

# text
seg-f98d26abf045 = hay un archivo en el paquete que no está en el manifiesto

# text
seg-842bac6a9e69 = un eslabón no es lo que dan sus entradas; se nombra el archivo

# text
# c1: epochs.json
seg-413034467a64 = el manifiesto se contradice a sí mismo o contradice <c1/>

# text
# c1: --log
seg-ef4bfbedca33 = con <c1/>: el registro que usted tiene no es el registrado, o el fragmento no es ese intervalo del registro

# text
seg-dcd686ac77f7 = Cambiar un solo byte de cualquier archivo hace fallar la verificación con el motivo correspondiente: un artefacto modificado se informa como discrepancia del hash de ese archivo y nada más; un manifiesto modificado hace fallar la firma. Recalcular los hashes y la cadena tras editar un archivo no sirve sin la clave de firma; entonces falla solo la firma.

# text
# c1: --pubkey
# c2: --allow-unpinned
# c3: --pubkey
# c4: .pub
seg-066fe7c07bf6 = <b>Fije la clave.</b> Sin <c1/>, un paquete solo demuestra que está íntegro frente a la clave que él mismo nombra, y que cualquiera puede generar. Por eso la verificación termina entonces con { "3" } y dice «INTACT, BUT THE SIGNER IS NOT PINNED» en lugar de «VERIFIED»; <c2/> acepta a sabiendas la clave propia del paquete e imprime «VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)». Obtenga la clave pública del firmante por una vía de su confianza (no del paquete) y pásela con <c3/>: { "64" } dígitos hexadecimales o el archivo <c4/>. Si por error se pasa la clave privada, se reconoce y se rechaza. La huella (los primeros { "128" } bits del SHA-256 de la clave, { "32" } dígitos hexadecimales) se imprime para compararla a simple vista; fijar la clave completa es la vía fiable.

# text
seg-a01c7ba606c9 = Formato del paquete y procedimiento de verificación (normativo)

# text
seg-fa43e16b6aba = Esta sección es la especificación a partir de la cual se escribe un verificador independiente. Las palabras en mayúsculas son requisitos. Un paquete es un directorio (o cualquier correspondencia de nombre de archivo a bytes) de archivos con exactamente los nombres siguientes; un verificador trabaja con los bytes de cada archivo tal como están almacenados y nunca vuelve a serializar nada.

# text
# c1: log-slice.bin
# c2: config.json
# c3: epochs.json
# c4: summary.html
# c5: manifest.json
# c6: manifest.sig
# c7: timestamp.tsr
seg-1fbabb3f1092 = <b>Archivos.</b> Los archivos de artefacto, en este orden fijo, son <c1/>, <c2/>, <c3/>, <c4/>. Un paquete tiene además <c5/> y <c6/>, y MAY tener <c7/>. Cualquier otro nombre es un <em>archivo no listado</em>.

# text
# c1: 0-9a-f
seg-3ed6e38ad2ee = <b>Hexadecimal.</b> Toda cadena hexadecimal está en minúsculas, solo <c1/>, sin espacios en blanco; no se aceptan mayúsculas. Los valores SHA-256 son de { "64" } dígitos, la clave pública es de { "64" } dígitos y la firma es de { "128" } dígitos.

# text
# c1: manifest.sig
# c2: manifest.json
# c3: \n
seg-6609210d003a = <b><c1/>.</b> El hexadecimal en minúsculas de 128 dígitos de la firma Ed25519 de 64 bytes (RFC { "8032" }, el esquema Ed25519 puro) sobre los bytes exactos de <c2/>, seguido de exactamente un <c3/> y nada más. La firma MUST comprobarse de forma estricta: una firma cuyo valor S no sea menor que el orden de grupo L no es válida.

# text
# c1: manifest.json
seg-b163e9f5db66 = <b><c1/>.</b> Un objeto JSON en UTF-8. Sus miembros (un verificador MUST encontrar cada uno con el tipo JSON indicado; los miembros adicionales se ignoran):

# text
seg-ace92bcbfd8a = miembro

# text
seg-04f69a0edb2f = tipo

# text
seg-45425f378b61 = significado

# text
seg-6940543aa3c0 = cadena

# text
# c1: kshana-evidence/1
seg-48d303baac62 = MUST ser igual a <c1/>

# text
seg-6e57561e7f01 = descriptivo

# text
seg-abec93a4a488 = cadena o null

# text
seg-7d059c0b6372 = hora de creación, descriptiva

# text
# c1: {from_s, to_s}
seg-507d53a53380 = objeto <c1/>

# text
seg-bb2bcbbf404a = números, segundos

# text
seg-64572c65426f = entero no negativo

# text
# c1: epochs.json
seg-14d421e391dd = el número de entradas de la matriz JSON de <c1/>

# text
seg-f5e7215e6835 = objeto

# text
# c1: format
# c2: file_name
# c3: full_sha256
# c4: full_bytes
# c5: start_label
# c6: slice
seg-a4117217030c = <c1/> cadena, <c2/> cadena, <c3/> hexadecimal, <c4/> entero no negativo, <c5/> cadena o null, y <c6/>

# text
# c1: kind
# c2: byte-range
# c3: whole-log
# c4: start
# c5: end
# c6: sha256
seg-02389e71a339 = <c1/> (exactamente <c2/> o <c3/>; cualquier otro valor hace que el manifiesto esté mal formado), <c4/> y <c5/> enteros no negativos (desplazamientos de bytes, final excluido), <c6/> hexadecimal

# text
# c1: algorithm
# c2: ed25519
# c3: public_key
# c4: fingerprint
seg-6c9176965aae = <c1/> cadena (<c2/>), <c3/> hexadecimal ({ "32" } bytes), <c4/> cadena

# text
seg-dcba59304030 = matriz de objetos

# text
# c1: name
# c2: role
# c3: bytes
# c4: sha256
# c5: link
seg-e42ed5e07430 = uno por archivo de artefacto, en el orden fijo: <c1/> cadena, <c2/> cadena, <c3/> entero no negativo, <c4/> hexadecimal, <c5/> hexadecimal

# text
seg-b79c9500b744 = hexadecimal

# text
seg-697592bd3757 = el último eslabón

# text
seg-9da5d92757bd = objeto, opcional

# text
# c1: --lab-attestation
# c2: operator
# c3: organisation
# c4: date
# c5: setup
# c6: conducted
# c7: shielded
# c8: attenuation_db
# c9: enclosure
# c10: emitter
# c11: statement
# c12: signature
seg-2032c208038d = presente solo en un paquete creado a partir de una sesión de laboratorio (<c1/>): la declaración del operador <c2/>, <c3/>, <c4/>, <c5/> (<c6/> o <c7/>), <c8/> o <c9/>, <c10/>, <c11/> y, opcionalmente, <c12/>, registrada tal como se da. Está cubierta por la firma del manifiesto y nunca se verifica; un verificador la informa como «attested by the named operator; not verified by Kshana». Ausente en los demás casos, y un paquete sin ella no cambia

# text
# c1: signer.fingerprint
seg-9411be425a80 = <c1/> son los primeros { "32" } dígitos hexadecimales del SHA-256 de los { "32" } bytes de la clave pública.

# text
seg-80e55f2d3496 = Cadena de hashes.

# text
# c1: link0
# c2: kshana-evidence-chain/1
# c3: link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file) (32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )
# c4: SHA-256(file)
# c5: sha256
seg-9346fe50efac = <c1/> es el SHA-256 de los { "23" } bytes ASCII <c2/>. Para cada artefacto en orden, <c3/>, donde <c4/> se toma del <c5/> registrado en el manifiesto para ese artefacto (de modo que la cadena es una propiedad del manifiesto y se comprueba contra él, no contra los archivos).

# text
# c1: code
# c2: name
# c3: pin
seg-9dd985d8cb03 = <b>Procedimiento.</b> Un verificador realiza estos pasos en orden y reúne todos los fallos; el resultado es el <em>conjunto</em> de fallos, cada uno un <c1/> y, donde se indica, el archivo <c2/>. MUST NOT detenerse en el primer fallo, salvo donde se indique. <c3/> es la clave pública en la que se indicó al verificador que confiara, si la hay.

# text
# c1: manifest.json
# c2: manifest-missing
seg-abb1d2635143 = Sin <c1/>: fallo <c2/>; detenerse.

# text
# c1: manifest.json
# c2: artifacts
# c3: log.slice
# c4: manifest-malformed
# c5: format
# c6: unsupported-format
seg-73a4aeb463e8 = Si <c1/> no es un objeto JSON con todos los miembros anteriores en los tipos indicados (incluidas las entradas de <c2/> con todos sus miembros, y <c3/>): fallo <c4/>. En caso contrario, si <c5/> no es el valor anterior: <c6/>.

# text
# c1: signer.public_key
# c2: public-key-malformed
# c3: signer.fingerprint
# c4: public-key-malformed
# c5: pin
# c6: public-key-mismatch
# c7: pin
# c8: pin
# c9: manifest.sig
# c10: signature-missing
# c11: \n
# c12: signature-malformed
# c13: public-key-malformed
# c14: manifest.json
# c15: signature-invalid
seg-36c9df2abf34 = Fase de firma. Esta fase se realiza se haya podido leer el manifiesto o no. Si el manifiesto se pudo leer, la <em>clave nombrada</em> es <c1/>; si no son { "64" } dígitos hexadecimales en minúsculas, fallo <c2/> (sin clave nombrada); en caso contrario, si <c3/> no es su huella, fallo <c4/> (la clave sigue siendo utilizable). Si existen tanto un <c5/> como una clave nombrada y difieren: fallo <c6/>. La <em>clave de comprobación</em> es <c7/> si se dio uno, y en caso contrario la clave nombrada si la hay; con ninguno de los dos no hay clave de comprobación (esto incluye todos los casos en que el manifiesto no se pudo leer y no se dio ningún <c8/>). Si no hay <c9/>: <c10/>. Si no, si el archivo no son exactamente { "128" } dígitos hexadecimales en minúsculas más un <c11/>: <c12/>. Si no, si hay una clave de comprobación que no es una codificación válida de clave pública Ed25519: <c13/>. Si no, si hay una clave de comprobación y la firma no se verifica de forma estricta sobre los bytes de <c14/> (sean cuales sean): <c15/>. (Sin clave de comprobación no se comprueba la firma y no se genera ningún fallo por ello.)

# text
# c1: manifest-malformed
seg-3dbe07af8fa8 = Si el manifiesto no se pudo leer (el paso { "2" } dio <c1/>): detenerse aquí.

# text
# c1: artifacts
# c2: artifact-list-malformed
# c3: file-missing
# c4: bytes
# c5: file-size-mismatch
# c6: sha256
# c7: file-hash-mismatch
seg-b7e03ef2dea5 = Artefactos. Si los nombres de <c1/> no son exactamente los cuatro anteriores y en orden: <c2/>. Después, para cada entrada del manifiesto, en orden: si el paquete no tiene ningún archivo con ese nombre, <c3/> (nombre); si no, si su longitud difiere de <c4/>, <c5/> (nombre); y, de forma independiente, si el SHA-256 del archivo difiere de <c6/>, <c7/> (nombre).

# text
# c1: manifest.json
# c2: manifest.sig
# c3: timestamp.tsr
# c4: artifacts
# c5: unlisted-file
seg-24cda5a1d9d8 = Archivos no listados: para cada archivo del paquete distinto de <c1/>, <c2/>, <c3/> y de los nombres de <c4/> del manifiesto: <c5/> (nombre).

# text
# c1: artifacts
# c2: link0
# c3: sha256
# c4: manifest-malformed
# c5: link
# c6: chain-mismatch
# c7: chain_head
# c8: chain-head-mismatch
seg-d103ade9a7c7 = Cadena. Recorra <c1/> del manifiesto en orden desde <c2/>. Si el <c3/> de una entrada no son { "64" } dígitos hexadecimales en minúsculas: <c4/> y se abandona la cadena (sin comprobación de cabeza). En caso contrario, calcule el eslabón; si difiere del <c5/> de la entrada: <c6/> (nombre). Tras el recorrido, si no se abandonó la cadena y el último eslabón difiere de <c7/>: <c8/>.

# text
# c1: slice-record-inconsistent
# c2: start > end
# c3: end > full_bytes
# c4: log-slice.bin
# c5: sha256
# c6: slice.sha256
# c7: bytes
# c8: end - start
# c9: kind
# c10: whole-log
# c11: start != 0
# c12: end != full_bytes
# c13: slice.sha256 != full_sha256
# c14: epochs.json
# c15: epochs_in_window
# c16: epoch-count-mismatch
seg-be9fade3f879 = Fragmento y épocas. Genere <c1/> (como máximo una vez por motivo, y un verificador informa del código una sola vez aunque se apliquen varios motivos) si se da cualquiera de estos casos: <c2/>; <c3/>; el <c5/> de la entrada <c4/> difiere de <c6/>; el <c7/> de esa entrada difiere de <c8/>; o <c9/> es <c10/> y se da cualquiera de <c11/>, <c12/>, <c13/>. Si <c14/> existe y se interpreta como una matriz JSON cuya longitud difiere de <c15/>: <c16/>.

# text
# c1: log.full_sha256
# c2: full-log-hash-mismatch
# c3: start..end
# c4: log-slice.bin
# c5: slice-not-from-full-log
seg-0dc49ed14c1f = Registro completo. Solo si se dio al verificador los bytes del registro original: si su SHA-256 difiere de <c1/>, <c2/>; en caso contrario, si el intervalo <c3/> no está dentro del registro o los bytes del registro en ese intervalo difieren de <c4/>, <c5/>.

# text
# c1: timestamp.tsr
# c2: timestamp-missing
# c3: timestamp-malformed
# c4: manifest.json
# c5: timestamp-imprint-mismatch
seg-a7f787d6e6df = Sello de tiempo. Sin <c1/>: si se indicó al verificador que exigiera uno, <c2/>; en caso contrario, nada. Con uno: si no se puede leer como un token o una respuesta RFC { "3161" } (véase más abajo), <c3/>; en caso contrario, si su huella de mensaje no es el hash, en el algoritmo propio de la huella (SHA-256, SHA-384 o SHA-512), de los bytes de <c4/>: <c5/>.

# text
seg-f7d908c6bf38 = El paquete está verificado exactamente cuando el conjunto de fallos está vacío. Si el firmante estaba fijado se informa por separado y no cambia el conjunto de fallos.

# text
# c1: ContentInfo
# c2: id-ct-TSTInfo
# c3: TimeStampResp
# c4: PKIStatusInfo
# c5: TSTInfo
# c6: genTime
# c7: --tsa-ca
seg-b0d74519122d = <b>Token de sello de tiempo.</b> Un token es un <c1/> DER cuyo tipo de contenido es CMS SignedData ({ "1.2.840.113549.1.7.2" }) y cuyo tipo de contenido encapsulado es <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); una respuesta es un <c3/> DER (un <c4/> seguido del token) cuyo estado es { "0" } o { "1" }. El algoritmo de huella de mensaje de <c5/> debe ser SHA-256, SHA-384 o SHA-512 con un resumen de la longitud de ese algoritmo, y su <c6/> una hora de calendario UTC real. No se acepta BER de longitud indefinida. La firma de la autoridad y la cadena de certificados solo se comprueban cuando se dan anclas de confianza (<c7/>, más abajo).

# text
seg-2156bf4dabb3 = Sello de tiempo RFC { "3161" } (opcional)

# text
# c1: manifest.json
# c2: create_bundle
seg-27a71ea73d7d = Un token de sello de tiempo de una autoridad de sellado de tiempo muestra que el manifiesto existía en un instante que la autoridad atestigua. El token es sobre <c1/>, por lo que se solicita después de crear el paquete (no hay forma de aportar uno al crear el paquete, y <c2/> rechaza un token que no sea sobre ese manifiesto exacto):

# text
# c1: kshana evidence verify
# c2: manifest.json
# c3: authority_signature_verified: false
# c4: openssl ts -verify
seg-7ae6e0326b65 = <c1/> lee el token (un token solo o una respuesta completa), comprueba que se concedió y que su huella de mensaje es igual al hash de <c2/>, e imprime la hora que indica. Sin anclas de confianza añade «timestamp authority signature not verified by Kshana» e informa de <c3/>; ejecute la línea <c4/> anterior para esa parte. Un token cuya huella difiere, o que no se puede interpretar, es un fallo. Se comprueba que los tipos de contenido, la longitud de la huella y la hora de generación tengan sentido.

# text
# c1: --tsa-ca authority-ca.pem
# c2: verify
# c3: openssl ts -verify
# c4: genTime
# c5: timestamp-authority-invalid
# c6: authority_signature_verified
# c7: tests/fixtures/evidence_tsa/PREREGISTRATION.md
seg-88359c107bf1 = Con <c1/> (uno o más certificados PEM, todos de confianza), <c2/> comprueba también la autoridad, sin conexión, como lo hace <c3/>: el resumen de mensaje de los atributos firmados, la firma (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 o P-384), el vínculo ESS con el certificado de firma, el uso extendido de clave timeStamping crítico del firmante y la cadena hasta un ancla autoemitida, con cada certificado válido en el <c4/> del token. Un fallo se informa como <c5/> con la primera comprobación que falló, y <c6/> es verdadero solo cuando todo se superó. No se comprueba la revocación (CRL u OCSP). Este verificador coincide con OpenSSL { "3.0.13" } en { "27" } casos autogenerados (<c7/>).

# text
# c1: verify
# c2: --require-timestamp
# c3: timestamp-missing
# c4: attach-timestamp
# c5: --replace
seg-f534ae37f10c = <b>El token está junto al manifiesto firmado, no dentro de él.</b> Nada en la firma ni en la cadena lo cubre, de modo que un token puede eliminarse, o sustituirse por otro token válido distinto, sin que la firma falle. Por eso <c1/> anota cuándo un paquete no tiene ninguno, y <c2/> convierte la falta de token en un fallo (<c3/>); un token sustituido solo se detecta si no coincide con el manifiesto. <c4/> se niega a sobrescribir un token existente salvo que se pase <c5/>. Si un sello de tiempo es importante para usted, conserve el token y el resultado de la verificación junto con sus propios registros, y exíjalo.

# text
seg-b993ef559bd0 = Desde código

# text
# c1: kshana::evidence::build_receiver_trust_pack
# c2: create_bundle
# c3: verify_bundle
# c4: EvidenceInput
# c5: BTreeMap<String, Vec<u8>>
# c6: Files
# c7: VerifyReport
# c8: wasm32
seg-de24fd02c7c2 = <c1/> es el único punto de entrada al que llaman la línea de comandos y todas las demás superficies para crear un paquete: entran un escenario, los bytes del registro (y los del archivo de navegación, para RINEX), la ventana como texto, un título y una hora de creación opcional, además de la semilla de firma; salen los archivos, el número de épocas, el fragmento, el hash del manifiesto y la huella del firmante. No lee archivos ni reloj, de modo que las mismas entradas dan los mismos bytes. Por debajo, <c2/> y <c3/> son funciones puras: entran bytes (<c4/>, una semilla de 32 bytes, un <c5/> de archivos) y salen resultados serializables (<c6/>, <c7/>). No usan archivos, reloj ni estado de proceso, y se compilan para <c8/>, de modo que las superficies de Python, WebAssembly y servidor las llaman sin cambios. La línea de comandos es una envoltura fina sobre ellas.

# text
seg-292a5bc48548 = Lo que un paquete no hace

# text
# c1: config.json
# c2: kshana receiver-trust
# c3: epochs.json
seg-852aca7fc407 = No vuelve a ejecutar la evaluación. Cualquiera que tenga el registro completo y <c1/> puede volver a ejecutar <c2/> y comparar con <c3/>; el paquete demuestra lo que se registró, no que el motor tuviera razón.

# text
seg-91639deac47d = No demuestra que el registro sea genuino ni completo. El hash del registro completo vincula el registro a un solo archivo; establecer de dónde procede ese archivo corresponde al operador.

# text
seg-0f721c314fa1 = No contiene ninguna afirmación de rendimiento sobre la detección o el rechazo de interferencias.

# text
seg-9c361736bf27 = Es un registro técnico y no un dictamen jurídico ni una certificación.

# text
seg-68bcf43b4e27 = <s1>Anterior</s1>Cobertura de líneas

# text
seg-09c0b5fa6e52 = <s1>Siguiente</s1>Enlaces ópticos a través de la atmósfera
