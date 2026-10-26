# docs--kind-space-packet: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-98151954f217 = false

# text
seg-2ac27c1e55c0 = octeto

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Fuente: <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (tipo de escenario)

# text
seg-de2448d74c2b = Entramado del CCSDS 133.0-B Space Packet Protocol: codifica un flujo sintético de paquetes TM/TC (cabecera primaria de 6 octetos + campo de datos) e indica la decodificación de la cabecera por paquete, el total de octetos y un recorrido de ida y vuelta exacto de codificación↔decodificación. Entramado determinista de disposición exacta de bits: la capa de interoperabilidad de formato de paquete de las agencias; NO una certificación de ajuste a la norma (sin lógica de cabecera secundaria, CRC ni segmentación más allá de los indicadores).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Una ejecución de <c1/> se resume así: space-packet: { "4" } paquete(s) TM de CCSDS-133.0 entramados, APID { "100" }, { "152" } octetos en total, ida y vuelta exacta (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = El ejemplo <c1/> establece, entre otros:

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-5b3bc9761db4 = First

# text
seg-52036320db9b = TM

# text
seg-f336ba92871f = Etiqueta del resultado (la del motor): entramado de cabecera primaria del CCSDS 133.0-B Space Packet: disposición de bits exacta y determinista, recorrido de ida y vuelta de codificación↔decodificación verificado; NO una certificación de ajuste a la norma (sin lógica de cabecera secundaria, CRC ni segmentación más allá de los indicadores)

# attr:alt
seg-af1cf9aa9938 = El gráfico que el motor genera para scenarios/space-packet.toml, tipo de escenario space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> Codificación y decodificación de la cabecera primaria del CCSDS 133.0-B Space Packet (versión/tipo/cabecera secundaria/APID/indicadores de secuencia/contador/longitud de datos) + un escenario de entramado. Pruebas: <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> Extensiones del CCSDS 133.0-B-2 Space Packet junto a la cabecera primaria: una cabecera secundaria que lleva un código de tiempo CCSDS 301.0-B (CUC o CDS, con campo P explícito o implícito) y datos auxiliares, el campo de control de errores de paquete CRC-16, la segmentación de un Pruebas: <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> Codificación y decodificación de la cabecera primaria del CCSDS 133.0-B Space Packet (versión/tipo/cabecera secundaria/APID/indicadores de secuencia/contador/longitud de datos) + un escenario de entramado. Ejecutable desde la CLI o el binding. Referencia independiente (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0): una implementación independiente de terceros del CCSDS 133.0-B-2; encode_packet/decode_packet de kshana coincidieron byte a byte (la cabecera primaria de 6 octetos para { "33" } casos + el paquete codificado completo para { "12" })

# text
seg-bca17769398b = <s1>Anterior</s1>solar-system

# text
seg-6ef772483f30 = <s1>Siguiente</s1>space-weather
