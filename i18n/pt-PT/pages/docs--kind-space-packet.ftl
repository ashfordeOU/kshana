# docs--kind-space-packet: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-98151954f217 = false

# text
seg-2ac27c1e55c0 = octeto

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Fonte: <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (tipo de cenário)

# text
seg-de2448d74c2b = Enquadramento CCSDS 133.0-B Space Packet Protocol: codifica um fluxo sintético de pacotes TM/TC (cabeçalho primário de 6 octetos + campo de dados) e indica a descodificação do cabeçalho de cada pacote, o total de octetos e uma viagem de ida e volta codificação↔descodificação exata. Enquadramento determinístico com disposição exata de bits — a camada de interoperabilidade de formato de pacotes das agências; NÃO é uma certificação de aderência à norma (sem lógica de cabeçalho secundário/CRC/segmentação além dos indicadores).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Uma execução de <c1/> resume-se assim: space-packet: { "4" } pacote(s) TM CCSDS-133.0 enquadrado(s) APID { "100" }, { "152" } octetos no total, ida e volta exata (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = O exemplo <c1/> define, entre outros:

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-5b3bc9761db4 = Primeiro

# text
seg-52036320db9b = TM

# text
seg-f336ba92871f = Etiqueta de resultado (a do motor): enquadramento do cabeçalho primário CCSDS 133.0-B Space Packet — disposição de bits exata e determinística, viagem de ida e volta codificação↔descodificação verificada; NÃO é uma certificação de aderência à norma (sem lógica de cabeçalho secundário / CRC / segmentação além dos indicadores)

# attr:alt
seg-af1cf9aa9938 = O gráfico que o motor escreve para scenarios/space-packet.toml, tipo space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> Codificação/descodificação do cabeçalho primário CCSDS 133.0-B Space Packet (versão/tipo/cab-sec/APID/indicadores de sequência/contagem/comprimento de dados) + um cenário de enquadramento. Ensaios: <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> Extensões CCSDS 133.0-B-2 Space Packet além do cabeçalho primário: um cabeçalho secundário que transporta um código de tempo CCSDS 301.0-B (CUC ou CDS, campo P explícito ou implícito) e dados auxiliares, o campo de controlo de erros do pacote CRC-16, a segmentação de um Ensaios: <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> Codificação/descodificação do cabeçalho primário CCSDS 133.0-B Space Packet (versão/tipo/cab-sec/APID/indicadores de sequência/contagem/comprimento de dados) + um cenário de enquadramento. Executável a partir da CLI/bind. Referência independente (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — uma implementação independente de terceiros do CCSDS 133.0-B-2; o encode_packet/decode_packet do kshana coincidiu byte a byte (o cabeçalho primário de 6 octetos para { "33" } casos + o pacote codificado completo para { "12" })

# text
seg-bca17769398b = <s1>Anterior</s1>solar-system

# text
seg-6ef772483f30 = <s1>Seguinte</s1>space-weather
