# docs--lunanet-afs: translations (es)

# text
seg-33f4c7af9c53 = Portadora

# text
seg-53a7343c076e = Afirmación

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Fuente: <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = Señal directa aumentada de LunaNet: códigos, formato de mensaje y <c1/>

# text
seg-c1a27b995345 = Kshana implementa los códigos de ensanchamiento y la capa de mensaje de la <b>señal directa aumentada (AFS)</b> de LunaNet tal como los define una edición de la especificación, y se comprueba a sí mismo frente a las tablas impresas de esa edición.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Fijación.</b> Especificación de interoperabilidad de LunaNet (LNIS) <b>versión { "5" }</b>, documento aplicable { "1" } volumen A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>versión { "1.0" }, { "29" } de enero de { "2025" }</b> (NASA). Obtenido el 2026-10-18; SHA-256 del PDF <c1/> (<a1>procedencia</a1>). Una edición posterior es otra fijación y puede cambiar los códigos: el documento marca sus tablas de códigos { "{" }LSIS-TBC{ "}" } y dice que se "incluyen únicamente para facilitar las labores de prueba e integración". Cada informe nombra esta edición.

# text
seg-6845e671bf24 = Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-69a98d01f489 = El generador de códigos AFS de LunaNet comprobado frente a las columnas impresas de la especificación, a partir de una ejecución real del motor v{ $version } (`kshana lunanet-afs-check spec`, fijado a LNIS V5, AD1 volumen A (LSIS-AFS) V1.0, { "29" } de enero de { "2025" }; el documento marca sus tablas de códigos { "{" }LSIS-TBC{ "}" }). Se alcanzan { "9" } de { "10" } comprobaciones; B4 es NOT MET ({ "420" } de { "421" } coinciden). Comprueba un flujo de símbolos frente a una edición de una especificación publicada y no dice nada sobre ningún nodo ni servicio de LunaNet. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Comprueba un flujo de símbolos frente a una edición de una especificación publicada y no dice nada sobre ningún nodo ni servicio de LunaNet.

# text
seg-4c3f77d97294 = Qué está implementado

# text
seg-a0b684e44fb0 = Capa

# text
seg-5d987fca539c = Qué

# text
seg-df52127d74b6 = Dónde

# text
seg-637035a0b1c1 = AFS-I (datos)

# text
seg-dbee58df4c92 = Código Gold { "2047" } acortado cíclicamente a { "2046" } chips, G2 retrasado por un número de chips propio de cada PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } símbolos/s, PRN { "1" } a { "210" }

# text
# c1: iq::signals::lunanet::afs_i
# c2: lunanet-afs-i
seg-d4480ead20d1 = <c1/>, nombre de señal <c2/>

# text
seg-6d84dce7f6d0 = AFS-Q (piloto)

# text
# c1: afs_q
# c2: lunanet-afs-q
# c3: afs_q_tiered
seg-2ebf619c9cb6 = Código Weil { "10230" } (la construcción de GPS L1C) en capas con un código secundario de 4 chips (S0 a S3) y un código Weil terciario de 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), sin datos. <c1/> y el nombre de señal <c2/> son la réplica del receptor, primario x secundario ({ "8" } ms): la superposición terciaria de sincronización de trama de { "12" } s queda fuera de ella, porque la adquisición y el seguimiento no correlacionan contra una réplica de { "12" } s. <c3/> es el código completo de { "12" } s

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Trama

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } símbolos entrelazados = { "6000" } símbolos = { "12" } s a { "500" } símbolos/s

# text
seg-a242d95d701f = { "9" } bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generador { "763" } octal, con el decodificador de correlación de 256 hipótesis del documento

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, generador ({ "1" }+X)P(X) (Apéndice H)

# text
seg-e225f10d7848 = Entrelazador

# text
seg-cb075da6f8cf = { "60" } filas x { "98" } columnas, escrito por filas y leído por columnas

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Los dos componentes son aceptados por <c1/>, <c2/>, <c3/> y <c4/> como cualquier otra señal, de modo que se puede buscar AFS-I o AFS-Q en una grabación (<c5/>) y se puede crear una escena sintética para pruebas de receptores por software. Una escena sintética, como en toda otra señal, es un archivo para un receptor por software; nada de esto maneja hardware de radio.

# text
seg-6d7a9d17946d = Qué <b>no</b> está implementado

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>La codificación LDPC de tasa 1/2 de las subtramas { "2" } a { "4" }.</b> Sus matrices de comprobación están en el Anexo { "1" }, un archivo aparte que no está en el PDF y no se incluye. Las subtramas { "2" } a { "4" } se transportan y comprueban como bloques opacos de símbolos de la longitud especificada, y las palabras CRC-24Q que contienen no se verifican. Un flujo que pasa <c1/> no se demuestra que contenga palabras de código válidas.

# text
seg-67bb5d1038c7 = <b>Contenido de los mensajes</b> (MSG-G1, MSG-G2, MSG-G4, ...): el documento deja varias definiciones por redactar (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Asignación de códigos por nodo de LunaNet</b> (la tabla F-1 está por determinar, TBD). Los PRN { "1" } a { "12" } tienen asignaciones de prueba provisionales (tabla { "11" }). <c1/> usa el código primario del PRN <em>n</em> con el secundario S((n-1) mod { "4" }); más allá del PRN { "12" } ese es el patrón de esta implementación, no el del documento. <c2/> y <c3/> admiten cualquier combinación, con el código terciario de cualquier PRN.

# text
seg-6588307842fe = Balance de enlace, error de señal en el espacio, requisitos de potencia y de coherencia (LSIS-100 y siguientes).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> ejecuta la implementación frente a las tablas impresas y los ejemplos resueltos del documento (umbrales B1 a B10 de <a1>el preregistro</a1>) e imprime cada uno con su recuento y su estado. <c2/> termina con { "1" } salvo que se alcancen todos los umbrales.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> lee un flujo de símbolos de decisión dura (texto de <c2/> y <c3/>; se ignoran los espacios en blanco) y comprueba el patrón de sincronización, la decodificación de SB1, el FID (solo está definido { "0" }), la continuidad del TOI (avanza de uno en uno módulo { "100" }) y el espaciado de tramas ({ "6000" } símbolos). Termina con { "1" } ante cualquier problema.

# text
# c1: generate
seg-f12425044025 = <c1/> escribe un flujo de prueba: el patrón de sincronización del documento, las longitudes de SB1 y de trama, con subtramas { "2" } a { "4" } <b>de relleno</b> (el relleno alterno de LSIS-300, sin codificación LDPC y sin mensaje). Son símbolos para probar un verificador o un decodificador, no una forma de onda; Kshana no escribe ninguna señal.

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: lunanet_afs_check
# c5: mode
# c6: /kshana-lunanet-afs-check
seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: los mismos nombres. MCP: <c4/> (<c5/> spec, symbols o generate). Complemento: <c6/>. Studio y JetBrains: N/A (<a1>SURFACES.md</a1>).

# text
# c1: xval/lunanet-afs/PREREGISTRATION.md
# c2: tests/lunanet_afs_codes.rs
seg-2133870991ca = Umbrales fijados en <c1/> antes de que existiera el generador; pruebas en <c2/>.

# text
seg-b74d5800a039 = Umbral

# text
seg-e75915599d5e = AFS-I primeros y últimos { "24" } chips, { "210" } PRN

# text
seg-f654db18922f = <b>MET</b>, { "420" } de { "420" }

# text
seg-55d0d7168ceb = el estado inicial de G2 impreso es el estado tras el retardo impreso

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } de { "210" }: la afirmación tenía el sentido equivocado. A posteriori (B1c, no preregistrado): el estado impreso es el estado tras { "2047" } menos el retardo, { "210" } de { "210" }

# text
seg-b94947c99f9a = Legendre({ "10223" }) es igual a la tabla D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q primarios primeros y últimos { "24" } chips, { "210" } PRN

# text
seg-678604d6e463 = Legendre({ "1499" }) es igual a la tabla E-1 y terciarios primeros y últimos { "24" } chips, { "210" } PRN

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } de { "421" }: la secuencia de Legendre coincide y { "419" } de { "420" } columnas de código coinciden. Los últimos { "24" } chips impresos para el PRN { "147" } (<c1/>) son el mismo valor impreso para el PRN { "151" }, cuyo código reproduce el generador; dos índices de Weil distintos ({ "607" } y { "612" }) no dan los mismos últimos { "24" } chips, por lo que la entrada del PRN { "147" } es muy probablemente una errata del documento. No puede resolverse sin el archivo de códigos aparte del Anexo { "3" }. Fijado por una prueba

# text
seg-aea9620e7bf1 = los códigos secundarios S0 a S3 son iguales a la tabla { "10" }

# text
seg-2996e986d247 = <b>MET</b> (las constantes del propio documento)

# text
seg-23c9277f62e6 = ejemplo resuelto de SB1 de la figura { "8" }

# text
seg-fb70493dcdcf = <b>MET</b>: 0x045 se codifica como 0x229F61DBB84A0 y se decodifica como FID { "0" }, TOI { "69" } (un ejemplo)

# text
# c1: 123456789
seg-acce07c33dec = valor de comprobación CRC-24Q de <c1/>

# text
seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (el valor del catálogo, fuera de la especificación)

# text
seg-789b31d53873 = aritmética de tramas

# text
seg-5b5da00ad1c8 = entrelazar y luego desentrelazar

# text
seg-80f9cd313ec4 = <b>MET</b> (una propiedad, MODELLED)

# text
seg-92a7addfdb8c = patrón de sincronización

# text
seg-215913f74706 = <b>MET</b> ({ "68" } símbolos; una comprobación de transcripción)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 a B4 son VALIDATED frente a las tablas impresas de la edición citada, que el documento marca { "{" }LSIS-TBC{ "}" }. Un recorrido completo de escena, adquisición y seguimiento de ambos componentes pasa los mismos umbrales que las demás señales (<c1/>).

# text
seg-9edb6e5771ca = <s1>Anterior</s1>Verificación de Galileo OSNMA

# text
seg-d0043d0f578a = <s1>Siguiente</s1>Jammertest como árbitro

# text
seg-52946c9ff62a = Qué no está implementado

# text
seg-339c9eeb510b = kshana lunanet-afs-check
