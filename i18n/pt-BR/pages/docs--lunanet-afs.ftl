# docs--lunanet-afs: translations (pt-BR)

# text
seg-33f4c7af9c53 = Portadora

# text
seg-53a7343c076e = Afirmação

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Fonte: <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = Sinal Direto Aumentado LunaNet: códigos, formato de mensagem e <c1/>

# text
seg-c1a27b995345 = O Kshana implementa os códigos de espalhamento e a camada de mensagem do <b>Sinal Direto Aumentado (AFS)</b> do LunaNet como uma edição da especificação os define, e se confere com as tabelas impressas dessa edição.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Fixação.</b> Especificação de Interoperabilidade LunaNet (LNIS) <b>Versão { "5" }</b>, Documento Aplicável { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Versão { "1.0" }, { "29" } de janeiro de { "2025" }</b> (NASA). Obtido em 2026-10-18; SHA-256 do PDF <c1/> (<a1>proveniência</a1>). Uma edição posterior é uma fixação diferente e pode alterar os códigos: o documento marca suas tabelas de códigos como { "{" }LSIS-TBC{ "}" } e diz que elas são "included to facilitate test and integration efforts only". Todo relatório nomeia esta edição.

# text
seg-6845e671bf24 = Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-69a98d01f489 = O gerador de códigos AFS do LunaNet conferido com as colunas impressas da especificação, a partir de uma execução real do motor v{ $version } (`kshana lunanet-afs-check spec`, fixado em LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } de janeiro de { "2025" }; o documento marca suas tabelas de códigos como { "{" }LSIS-TBC{ "}" }). { "9" } de { "10" } verificações são satisfeitas; B4 é NOT MET ({ "420" } de { "421" } coincidiram). Ele confere um fluxo de símbolos com uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Ele confere um fluxo de símbolos com uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet.

# text
seg-4c3f77d97294 = O que está implementado

# text
seg-a0b684e44fb0 = Camada

# text
seg-5d987fca539c = O quê

# text
seg-df52127d74b6 = Onde

# text
seg-637035a0b1c1 = AFS-I (dados)

# text
seg-dbee58df4c92 = Código Gold { "2047" } encurtado ciclicamente para { "2046" } chips, G2 atrasado por um número de chips por PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } símbolo/s, PRN { "1" } a { "210" }

# text
# c1: iq::signals::lunanet::afs_i
# c2: lunanet-afs-i
seg-d4480ead20d1 = <c1/>, nome do sinal <c2/>

# text
seg-6d84dce7f6d0 = AFS-Q (piloto)

# text
# c1: afs_q
# c2: lunanet-afs-q
# c3: afs_q_tiered
seg-2ebf619c9cb6 = Código Weil { "10230" } (a construção do GPS L1C) em camadas com um código secundário de 4 chips (S0 a S3) e um código Weil terciário de 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), sem dados. <c1/> e o nome do sinal <c2/> são a réplica do receptor, primário x secundário ({ "8" } ms): a sobreposição terciária de sincronização de quadro de { "12" } s fica fora dela, porque a aquisição e o rastreamento não correlacionam com uma réplica de { "12" } s. <c3/> é o código completo de { "12" } s

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Quadro

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } símbolos intercalados = { "6000" } símbolos = { "12" } s a { "500" } símbolo/s

# text
seg-a242d95d701f = { "9" } bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), gerador { "763" } octal, com o decodificador de correlação de 256 hipóteses do documento

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, gerador ({ "1" }+X)P(X) (Apêndice H)

# text
seg-e225f10d7848 = Intercalador

# text
seg-cb075da6f8cf = { "60" } linhas x { "98" } colunas, escritas por linha e lidas por coluna

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Os dois componentes são aceitos por <c1/>, <c2/>, <c3/> e <c4/> como qualquer outro sinal, de modo que uma gravação pode ser pesquisada em busca de AFS-I ou AFS-Q (<c5/>) e uma cena sintética pode ser feita para testes de receptores por software. Uma cena sintética, como para todo outro sinal, é um arquivo para um receptor por software; nada aqui aciona hardware de rádio.

# text
seg-6d7a9d17946d = O que <b>não</b> está implementado

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>A codificação LDPC de taxa 1/2 dos subquadros { "2" } a { "4" }.</b> Suas matrizes de verificação estão no Anexo { "1" }, um arquivo separado que não está no PDF e não é incorporado. Os subquadros { "2" } a { "4" } são transportados e conferidos como blocos opacos de símbolos do comprimento especificado, e as palavras CRC-24Q dentro deles não são verificadas. Um fluxo que passa por <c1/> não está demonstrado conter palavras de código válidas.

# text
seg-67bb5d1038c7 = <b>Conteúdo da mensagem</b> (MSG-G1, MSG-G2, MSG-G4, ...): o documento deixa várias definições para serem escritas (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Atribuição de códigos por nó LunaNet</b> (a Tabela F-1 é TBD). Os PRNs { "1" } a { "12" } têm atribuições provisórias de teste (Tabela { "11" }). <c1/> usa o código primário do PRN <em>n</em> com o secundário S((n-1) mod { "4" }); além do PRN { "12" } isso é o padrão desta implementação, não o do documento. <c2/> e <c3/> aceitam qualquer combinação, com o código terciário de qualquer PRN.

# text
seg-6588307842fe = Orçamento de enlace, erro de sinal no espaço, requisitos de potência e de coerência (LSIS-100 e seguintes).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> executa a implementação contra as tabelas impressas e os exemplos resolvidos do documento (limiares B1 a B10 de <a1>o pré-registro</a1>) e imprime cada um com sua contagem e seu estado. <c2/> sai com { "1" } a menos que todos os limiares sejam atingidos.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> lê um fluxo de símbolos de decisão abrupta (texto de <c2/> e <c3/>; espaços em branco ignorados) e confere o padrão de sincronização, a decodificação do SB1, o FID (só { "0" } é definido), a continuidade do TOI (avançando de um em módulo { "100" }) e o espaçamento de quadros ({ "6000" } símbolos). Sai com { "1" } diante de qualquer problema.

# text
# c1: generate
seg-f12425044025 = <c1/> grava um fluxo de teste: o padrão de sincronização do documento, os comprimentos de SB1 e de quadro, com subquadros { "2" } a { "4" } <b>provisórios</b> (o preenchimento alternado do LSIS-300, sem codificação LDPC, sem mensagem). São símbolos para testar um verificador ou um decodificador, não uma forma de onda; o Kshana não grava sinal algum.

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: lunanet_afs_check
# c5: mode
# c6: /kshana-lunanet-afs-check
seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: os mesmos nomes. MCP: <c4/> (<c5/> spec, symbols ou generate). Plugin: <c6/>. Studio e JetBrains: N/D (<a1>SURFACES.md</a1>).

# text
# c1: xval/lunanet-afs/PREREGISTRATION.md
# c2: tests/lunanet_afs_codes.rs
seg-2133870991ca = Limiares declarados em <c1/> antes de o gerador existir; testes em <c2/>.

# text
seg-b74d5800a039 = Limiar

# text
seg-e75915599d5e = AFS-I primeiros e últimos { "24" } chips, { "210" } PRNs

# text
seg-f654db18922f = <b>MET</b>, { "420" } de { "420" }

# text
seg-55d0d7168ceb = o estado inicial de G2 impresso é o estado após o atraso impresso

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } de { "210" }: a afirmação tinha a direção errada. A posteriori (B1c, não pré-registrado): o estado impresso é o estado após { "2047" } menos o atraso, { "210" } de { "210" }

# text
seg-b94947c99f9a = Legendre({ "10223" }) é igual à Tabela D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q primário primeiros e últimos { "24" } chips, { "210" } PRNs

# text
seg-678604d6e463 = Legendre({ "1499" }) é igual à Tabela E-1 e terciário primeiros e últimos { "24" } chips, { "210" } PRNs

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } de { "421" }: a sequência de Legendre coincide e { "419" } de { "420" } colunas de código coincidem. Os últimos { "24" } chips impressos para o PRN { "147" } (<c1/>) são o mesmo valor impresso para o PRN { "151" }, cujo código o gerador reproduz; dois índices de Weil diferentes ({ "607" } e { "612" }) não dão os mesmos últimos { "24" } chips, de modo que a entrada do PRN { "147" } é muito provavelmente um erro de impressão no documento. Isso não pode ser resolvido sem o arquivo separado de códigos do Anexo { "3" }. Fixado por um teste

# text
seg-aea9620e7bf1 = os códigos secundários S0 a S3 são iguais à Tabela { "10" }

# text
seg-2996e986d247 = <b>MET</b> (as constantes do próprio documento)

# text
seg-23c9277f62e6 = exemplo resolvido do SB1 da Figura { "8" }

# text
seg-fb70493dcdcf = <b>MET</b>: 0x045 codifica para 0x229F61DBB84A0 e decodifica para FID { "0" }, TOI { "69" } (um exemplo)

# text
# c1: 123456789
seg-acce07c33dec = valor de verificação CRC-24Q para <c1/>

# text
seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (o valor do catálogo, fora da especificação)

# text
seg-789b31d53873 = aritmética de quadros

# text
seg-5b5da00ad1c8 = intercalar e depois desintercalar

# text
seg-80f9cd313ec4 = <b>MET</b> (uma propriedade, MODELLED)

# text
seg-92a7addfdb8c = padrão de sincronização

# text
seg-215913f74706 = <b>MET</b> ({ "68" } símbolos; uma verificação de transcrição)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 a B4 são VALIDATED contra as tabelas impressas da edição citada, que o documento marca { "{" }LSIS-TBC{ "}" }. Uma viagem de ida e volta de cena, aquisição e rastreamento de ambos os componentes passa pelos mesmos limiares que os demais sinais (<c1/>).

# text
seg-9edb6e5771ca = <s1>Anterior</s1>Verificação do OSNMA do Galileo

# text
seg-d0043d0f578a = <s1>Próxima</s1>Jammertest como árbitro

# text
seg-52946c9ff62a = O que não está implementado

# text
seg-339c9eeb510b = kshana lunanet-afs-check
