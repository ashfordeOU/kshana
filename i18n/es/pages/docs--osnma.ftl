# docs--osnma: translations (es)

# text
seg-fcd0ebea49bc = Línea de comandos

# attr:aria-label, text
seg-6816f4e1a0a0 = Versión

# text
seg-94058315dfe4 = Entrada

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Fuente: <c1/>

# text
seg-1e9c104231db = Verificador de Galileo OSNMA en el lado del receptor

# text
seg-17fd702f5997 = Un verificador en el lado del receptor para la autenticación del mensaje de navegación del servicio abierto de Galileo (OSNMA), en Rust puro. Lee páginas I/NAV e informa, por satélite y por época, de si los datos de navegación están autenticados criptográficamente, y de por qué falló una comprobación.

# text
seg-ae081f55c4f1 = <b>De carácter consultivo.</b> Esto es una salida de análisis y monitorización, no un equipo de navegación homologado. El estado de autenticación que se informa aquí no es un servicio de integridad de la navegación y no debe ser la única base de ninguna decisión de navegación o de seguridad.

# text
seg-84d7260098b1 = AVISO: propiedad intelectual de la interfaz Galileo OSNMA

# text
seg-6d78ccef53d5 = Kshana no concede ningún derecho sobre la propiedad intelectual de la Unión Europea en el Documento de Control de Interfaz de la señal en el espacio de Galileo OSNMA (los «ICD IPRs»). El ICD lleva su propia autorización (su Anexo E), que es no exclusiva y libre de regalías y tiene sus propios términos, alcance y límites. Quien use, construya o distribuya software basado en este módulo se apoya directamente en esa autorización y debe leer y aceptar por sí mismo sus términos. La licencia de Kshana (AGPL-3.0-only, o la licencia comercial) cubre únicamente el código propio de Kshana.

# text
seg-c13ad334bf9a = Este módulo implementa los algoritmos que describen los documentos siguientes. El texto del ICD no se reproduce; los valores numéricos (disposiciones de campos, enumeraciones, la tabla de consulta de MAC) se reexpresan en la notación propia de Kshana, con la fuente citada en el código. El ICD y las Receiver Guidelines son © Unión Europea; aquí se reconoce la fuente. Kshana no ha sido desarrollado por la Unión Europea, la Comisión Europea, EUSPA ni ningún otro organismo, ni es utilizado, aprobado o respaldado por ellos.

# text
seg-860096b04999 = Documentos de referencia

# text
seg-04c1e1a6278d = Publicados por el European GNSS Service Centre.

# text
seg-278dd0f9df58 = Documento

# text
seg-3427e40d7bee = Fecha

# text
seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD («SIS ICD»)

# text
seg-f63fbc1175cf = Edición { "1.1" }

# text
seg-fa85e4db2c93 = octubre de { "2023" }

# text
seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

# text
seg-907e4e46056c = Edición { "1.3" }

# text
seg-a9b75bc7f063 = enero de { "2024" }

# text
seg-530ae6421157 = Los números de sección y de tabla citados en el código y aquí se refieren a esas versiones.

# text
seg-143726cc3d5f = Qué se verifica

# text
seg-029a9bb7608f = La cadena de confianza, desde la raíz hasta los datos:

# text
seg-886f1b6556ce = <b>Clave pública (ICD { "3.2.2" }, { "6.2" }).</b> Un DSM-PKR se reensambla a partir de sus bloques y se recorre su camino de Merkle hasta una raíz de Merkle de confianza (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Se reensambla un DSM-KROOT; su firma ECDSA (P-256/SHA-256 o P-521/SHA-512) se comprueba frente a la clave pública que nombra, sobre la cabecera NMA y los parámetros de la cadena.

# text
seg-acc1f06cf63a = <b>Claves TESLA (ICD { "5.5" }, { "6.4" }).</b> Cada clave de un mensaje MACK se recorre hacia atrás hasta la KROOT o hasta una clave verificada anterior, con la función hash de la cadena.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Los campos flexibles Tag-Info se comprueban frente al MACSEQ con la clave que abre ese MACK.

# text
seg-41ba810d7c8d = <b>Etiquetas (ICD { "4.2" }, { "6.7" }).</b> Cada etiqueta se recalcula (HMAC-SHA-256 o CMAC-AES, truncada a la longitud de etiqueta de la cadena) sobre las identidades de los satélites, la hora de la subtrama, la posición de la etiqueta, el estado NMA y los datos de navegación que cubre, y se compara. Se tratan ADKD { "0" } (efemérides, reloj y estado), ADKD { "4" } (parámetros de temporización) y ADKD { "12" } (MAC lenta, clave publicada diez subtramas después), con autenticación cruzada de satélites que no llevan OSNMA por sí mismos, y etiquetas ficticias (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Una etiqueta que nombra un valor reservado, o cuyo ADKD no coincide con la ranura de la tabla de consulta de MAC, se aparta (las Receiver Guidelines indican descartarla) y se informa como <c1/>, no como fallo.

# text
# c1: bad_crc
seg-eb993b3a0d17 = Las páginas se comprueban frente a su CRC (el CRC-24Q de Galileo) antes que nada; una página que falla se descarta y se informa de ello (<c1/>).

# text
seg-c414a30d0840 = Valores de estado

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Por etiqueta: <c1/>, <c2/> con un motivo (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> con un motivo (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), o <c15/>. Una etiqueta ficticia (COP { "0" }) aparece como <c16/> a nivel de etiqueta, ya que demuestra la clave, pero no cubre ningún dato de navegación y nunca cuenta para un satélite.

# text
seg-331a6ab821f3 = Por satélite, en la forma que consume el monitor receiver-trust:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> solo mientras los datos de efemérides y de reloj verificados más recientes (ADKD { "0" } o

# text
# c1: Unavailable
seg-38e7f56293e7 = de ese satélite sean recientes (dentro de { "600" } s de la hora del verificador por defecto) y sigan siendo los datos en uso. La comprobación es sobre los datos, no sobre el IODnav: el verificador conserva el SHA-256 de la cadena de bits autenticada (los Word Types { "1" } a { "5" } tal como los cubre ADKD { "0" }) y de la cadena más reciente de ese tipo que envía el satélite, y deben ser iguales. Un IODnav copiado sobre otras palabras, o bits alterados del Word Type { "5" } (que no llevan IODnav), se lee como <c1/> hasta que los nuevos datos se autentican. Una subtrama que lleva palabras de efemérides pero no un conjunto completo de Word Types { "1" } a { "5" } bajo un mismo IODnav retira el estado de la misma manera (toda subtrama E1-B genuina lleva las cinco); una sin ninguna palabra de efemérides no dice nada. Las etiquetas de otro satélite (autenticación cruzada) cuentan para el satélite cuyos datos cubren.

# text
# c1: Failed
seg-233109ef4428 = <c1/> cuando una comprobación sobre los datos del satélite falló dentro de la memoria de fallos ({ "600" } s por defecto de la hora del verificador), aunque datos posteriores se verifiquen. Una discrepancia se imputa al satélite cuyos datos cubre la etiqueta y al satélite que transmitió la etiqueta, ya que cualquiera de los dos podría tener la culpa; una discrepancia de MACSEQ se imputa al satélite transmisor.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> en caso contrario, y para todos los satélites tras un mensaje de alerta verificado, con un estado NMA «don't use» o un estado reservado, y hasta que se haya verificado la primera clave.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = El valor global es <c1/> si algún satélite falló, <c2/> si al menos uno está autenticado y ninguno falló, y en otro caso <c3/>. <c4/> es la sentencia correspondiente; <c5/> la construye.

# text
seg-446a3218ccbb = Hora

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = La cadena de claves muestra que una clave pertenece a una subtrama dada, no que la subtrama sea la actual. Por ello el verificador nunca toma el «ahora» de una página sin verificar. Su hora es la posterior entre la hora de referencia dada con <c1/> (<c2/>) y la subtrama de la última clave TESLA verificada (una clave no puede conocerse antes de su ranura, así que demuestra que la hora no es anterior). La memoria de fallos, la ventana de validez de una autenticación y la expulsión de datos antiguos funcionan con esa hora. Una subtrama con sello de más de tres subtramas posterior a la última clave verificada se aparta salvo que su propia clave demuestre su hora; los mensajes de clave y de alerta que contiene se siguen procesando, ya que llevan su propia prueba (una firma o la raíz de Merkle).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = El reloj se detiene cuando OSNMA se detiene, ya que solo las claves lo mueven. Quien llama en vivo debe llamar a <c1/> con la hora del host en cada subtrama; la autenticación caduca entonces por sí sola, y <c2/> (que también se ejecuta con cada subtrama) devuelve un evento <c3/> cuando ninguna clave se ha verificado durante más tiempo que la ventana de autenticación.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = Lo que esto no da es frescura. Sin una hora de referencia de una fuente que un atacante no pueda mover, una repetición de datos auténticos antiguos con sellos antiguos se autentica y los sellos de las páginas valen solo lo que valga su fuente: la CLI lo indica (<c1/>) siempre que no se da hora de referencia. Con una hora de referencia la tolerancia es inferior a una subtrama (por defecto { "29" } s; los valores mayores se rechazan). Una hora de referencia es un único instante: las subtramas más alejadas de ella que la tolerancia se apartan y se cuentan, de modo que sirve para datos en vivo o recién grabados, no para una grabación larga. Para una grabación, omita la hora de referencia y lea el resultado como «auténtico, no necesariamente fresco». Las Receiver Guidelines dan el requisito formal.

# text
seg-aa37ce329914 = Los sellos de página de un flujo u-blox proceden de los propios datos sin autenticar (véase Entrada), así que tampoco ofrecen protección de frescura.

# text
seg-a33d72076025 = Cadenas, claves y alertas

# text
# c1: chain_mismatch
seg-be2d9588df65 = Las cadenas verificadas se conservan por identificador de cadena (CID); las etiquetas se comprueban con la cadena que nombra la cabecera NMA, y una cabecera que nombra una cadena que no se verificó deja sin comprobar las etiquetas de la subtrama (<c1/>). Un segundo KROOT de una cadena en vigor añade un ancla; un KROOT de otra cadena se conserva junto a ella, de modo que anunciar de nuevo la cadena antigua tras una renovación no deshace la nueva.

# text
# c1: stale
seg-bbb6574fa258 = La cabecera NMA no está autenticada, así que lo que anuncia cuenta solo cuando se confirma: cuando más de un satélite envía la misma cabecera en una subtrama, o cuando el mensaje firmado de un KROOT verificado la lleva (la cabecera forma parte de ese mensaje). Ambas confirmaciones no son iguales. La coincidencia de más de un satélite protege contra una anomalía de un solo satélite, no contra un suplantador: un suplantador puede falsificar dos identificadores de satélite. Lo que eso le da es denegación de servicio, y nada más, ya que un «don't use» confirmado borra los datos autenticados de todos los satélites: levantarlo, falsificado o genuino, no restablece nada hasta que nuevas etiquetas se verifican bajo subtramas operativas genuinas. (Antes de ese borrado, un levantamiento falsificado podía devolver, durante hasta la ventana de autenticación, datos que ya se habían autenticado.) La confirmación real es la cabecera firmada por el KROOT, que también levanta de nuevo un «don't use» cuando lleva un estado operativo. La cabecera de un solo satélite no cambia nada salvo la comprobación de etiquetas de su propia subtrama. Un KROOT cuyo tiempo de aplicabilidad no es posterior al de la cadena que se tiene para el mismo identificador (una repetición de uno más antiguo) se rechaza (<c1/>); un KROOT de la misma cadena añade un ancla.

# text
seg-5c08dbaa8d43 = El estado y el valor CPKS de la cabecera confirmada dirigen la revocación. Con estado NMA «don't use», CPKS «chain revoked» elimina la cadena que nombra la cabecera y rechaza su KROOT a partir de entonces; CPKS «public key revoked» elimina la clave pública que firmó esa cadena, y toda cadena firmada con ella. Si la cadena de sustitución para ese identificador se adoptó antes de confirmarse la cabecera, por mucho tiempo que antes fuera, la clave revocada es la de la cadena anterior, no la nueva; esa memoria se conserva hasta que se lleva a cabo la revocación o se confirma la cabecera de otro procedimiento, y una cabecera de revocación repetida en cada subtrama se lleva a cabo una sola vez. Los mismos valores CPKS con estado operativo marcan la transición a la sustitución y no revocan nada. La cabecera no está autenticada en sí misma, de modo que una revocación falsificada solo puede quitar autenticación, y es definitiva hasta que se reinicia el verificador. Esa definitividad abarca también la clave vigente: una revocación falsificada de la clave pública restablece la memoria de la clave sustituida y revoca la clave en uso, y solo un reinicio lo deshace.

# text
# c1: Unavailable
seg-e7d43eb18c24 = Un DSM-PKR con NPKT { "4" } es el mensaje de alerta; se verifica a través del árbol de Merkle como una clave, y su campo aleatorio NPK forma parte de la hoja. Una alerta verificada borra todas las cadenas y claves públicas, rechaza todo KROOT y clave pública posteriores, y deja todos los satélites en <c1/>, como indican las Receiver Guidelines, hasta que se reinicia el verificador.

# text
seg-4068e9bda7c1 = El campo de relleno de un DSM-KROOT es un hash del mensaje firmado y de la firma. Se comprueba antes que la firma, y también indica con qué cabecera NMA se construyó el mensaje firmado cuando la cabecera cambió mientras se ensamblaba el mensaje.

# text
seg-8ea31bf25ef0 = Lo que no se verifica, o no se ejercita

# text
seg-3d0808cab632 = <b>Frescura.</b> Véase Hora más arriba: necesita una hora de referencia externa.

# text
seg-b3d63950baa4 = <b>Renovación y revocación.</b> Las cadenas y las claves se siguen en la medida en que las ejercitan los flujos de los vectores publicados (renovación, fin de cadena, revocación de cadena y de clave, nueva clave pública, nuevo árbol de Merkle, alerta), no todos los casos que permite el ICD. Una revocación anunciada por la cabecera sin autenticar se acepta tal cual y es definitiva para la sesión. Un nuevo árbol de Merkle solo se recoge a través de la raíz de Merkle que se da al verificador.

# text
seg-f01d90a44585 = <b>Hash del árbol de Merkle.</b> Los mensajes DSM-PKR se comprueban con un árbol SHA-256. Un árbol SHA3-256, que el ICD permite en el futuro, no se admite. La función hash de la cadena puede ser SHA-256 o SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Listas de estado de claves.</b> La revocación se sigue a través de la cabecera NMA y de los mensajes del flujo; no se leen las listas de revocación de certificados.

# text
seg-73e0b16d03c7 = <b>Cobertura de datos autenticados.</b> ADKD { "4" } con COP { "1" } enviado en una subtrama impar no puede autenticar (el Word Type { "10" } puede enviarse una o dos subtramas antes); esto cuesta solo disponibilidad, nunca corrección.

# text
seg-acc28dcced83 = <b>Operación en tiempo constante.</b> No se proporciona ni hace falta: el verificador no guarda secretos (solo claves públicas, claves de cadena publicadas y datos recibidos).

# text
seg-b2f8ec90ae39 = <b>Calidad de la señal y de los datos.</b> Las páginas se comprueban con CRC y las páginas de alerta se descartan, pero no se sabe nada de la señal por la que llegaron. No se usa la recuperación Reed-Solomon de las palabras I/NAV { "1" } a { "4" }: los datos deben recibirse directamente.

# text
seg-97313ba2bf88 = <b>No es un servicio de integridad de la posición.</b> La autenticación dice que los datos vinieron del sistema. No dice nada de la señal por la que llegaron ni de la calidad de la posición.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Formato de página simple.</b> Un par de páginas por línea: <c1/>, se admiten comentarios <c2/>. <c3/> es el GST en segundos (<c4/>) al inicio de la página; el hexadecimal son los { "240" } bits de las mitades par e impar (colas incluidas), con el bit más significativo primero.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>CSV de vectores de prueba.</b> La disposición de los vectores publicados (<c1/>). La hora de inicio procede de <c2/> o de un nombre de archivo con fecha.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Un flujo de bytes UBX sin procesar (<c1/>, detectado automáticamente). Los mensajes I/NAV E1-B de Galileo se reconstruyen en pares de páginas (<c2/>); se ignoran otros sistemas, E5b, las páginas de alerta y las tramas con suma de comprobación errónea. SFRBX no lleva hora, así que cada página se sella con la hora de sus propios datos (tipos de palabra { "5" } y { "0" }) y solo se acepta si las páginas consecutivas con hora concuerdan con el número de páginas recibidas entre ellas; las páginas que no se pueden situar se descartan, nunca se adivinan. Esa hora procede de los propios datos y no da protección de frescura (véase Hora más arriba). El identificador de señal { "0" } (E1-C) no lleva datos, así que aceptarlo junto con E1-B es inocuo. Un par de sincronización suelto con una longitud absurda no retiene al lector. El código de entramado es una tercera copia del entramado UBX del árbol (<c3/>, la ingesta de receiver-trust); se mantiene aparte para que el comportamiento de receiver-trust no cambie, y las tres podrían compartir un lector más adelante. La disposición de palabras de un mensaje SFRBX se toma de descripciones públicas y se comprueba solo con tramas sintéticas, no con un receptor en vivo.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = La salida de texto da el estado por satélite y, con <c1/>, por etiqueta y época; <c2/> da lo mismo con la lista de etiquetas. El estado de salida { "3" } significa que falló una comprobación sobre los datos de algún satélite, y { "2" } significa un error de uso o de entrada. El aviso de carácter consultivo anterior se imprime primero en todos los caminos, errores y uso incluidos.

# text
seg-e2af23b756f5 = Desde Python y WebAssembly

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) y <c2/> (WebAssembly) ejecutan el mismo verificador sobre bytes en memoria y devuelven el JSON que imprime <c3/>, aviso de carácter consultivo incluido. El servidor MCP no lo incluye: la entrada es un flujo largo de receptor sin procesar que la línea de comandos y Python atienden mejor, y una herramienta de agente añadiría una superficie de entrada grande sin beneficio. Se aplican el mismo aviso y los mismos límites; el estado no es un servicio de integridad de la navegación.

# text
seg-0987c3b00a14 = Pruebas y datos de prueba

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Los datos de prueba son sintéticos y los generan el propio código y las propias pruebas de Kshana. En este repositorio no se almacena ningún vector del ICD ni de las Guidelines, ningún ejemplo resuelto ni material de claves. Las pruebas por defecto (<c1/> y las pruebas unitarias) construyen una cadena, páginas y etiquetas a partir de las ecuaciones y comprueban la coherencia y que se detecta la corrupción deliberada: un bit de navegación invertido, un bit de clave invertido, etiquetas repetidas, sellos de hora erróneos, una hora fuera de la referencia, datos ausentes y los ataques que halló la revisión (una subtrama falsificada de un futuro lejano que no debe borrar un fallo, una autenticación que debe caducar y seguir al IODnav, una alerta, el estado NMA «don't use», etiquetas ficticias, discrepancia de MACSEQ, claves en conflicto, revocación y renovación de cadena, un relleno o una firma erróneos), con CMAC-AES, una cadena SHA3-256 y una firma P-521 llevadas a través del verificador. Como esos datos proceden de nuestra propia lectura del ICD, muestran autoconsistencia, no ajuste a la norma.

# text
seg-4906b14a33a3 = Las primitivas se comprueban frente a pruebas de respuesta conocida publicadas, ninguna tomada del ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) y RFC { "6979" } (ECDSA P-256). Las firmas P-521 se comprueban en cuanto a codificación y selección de hash con una clave desechable creada en la prueba; la aritmética de la curva es la de la biblioteca.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = El ajuste a la norma se comprueba mediante <c1/>, que es opcional: lee una copia del archivo oficial de vectores de prueba que usted mismo descarga, del directorio que nombra <c2/>, y no hace nada cuando la variable no está definida. No almacena ni redistribuye nada, y las ejecuciones de prueba por defecto no usan la red. Da al verificador solo una raíz de Merkle y las claves públicas de un árbol, como las tendría un receptor, de modo que las cadenas se establecen a partir del DSM-KROOT firmado del flujo y se recorre todo el camino: Merkle, firma, cadena de claves, MACSEQ y etiquetas. Afirma, por conjunto de vectores, un mínimo de etiquetas autenticadas, que ninguna falló, qué cadenas y claves anuncia el flujo, etiquetas autenticadas de ADKD { "0" }, { "4" } y { "12" }, que la autenticación se reanuda tras el fin de cadena, la revocación de cadena, la revocación de clave y la nueva clave pública, que el mensaje de alerta se verifica y no deja nada autenticado, y que todo vector usa solo HMAC-SHA-256, una cadena SHA-256, claves de 128 bits, etiquetas de 40 bits y entradas de tabla { "33" } y { "34" }. Otras opciones de algoritmos y parámetros del ICD quedan, por tanto, cubiertas solo por las pruebas de respuesta conocida y sintéticas anteriores.

# text
seg-70bb026ce655 = Dependencias

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = Crates de RustCrypto, Rust puro, MIT OR Apache-2.0, compiladas sin características por defecto: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> y <c6/> (la característica <c7/>, usada solo para la verificación), además de <c8/>, que ya estaba en el árbol. Se compilan para <c9/> y pasan <c10/>.

# text
seg-7ab62b91d469 = <s1>Anterior</s1>La confianza como telemetría de seguridad

# text
seg-5dc48294fbb2 = <s1>Siguiente</s1>Señal directa aumentada de LunaNet
