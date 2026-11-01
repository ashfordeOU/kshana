# docs--lunanet-afs: translations (pt-PT)

# text
seg-33f4c7af9c53 = Portadora

# text
seg-53a7343c076e = Afirmação

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Fonte: <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = LunaNet Augmented Forward Signal: códigos, formato de mensagem e <c1/>

# text
seg-c1a27b995345 = O Kshana implementa os códigos de espalhamento e a camada de mensagem do <b>Augmented Forward Signal (AFS)</b> do LunaNet tal como uma edição da especificação os define, e verifica-se a si próprio face às tabelas impressas dessa edição.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Fixação.</b> LunaNet Interoperability Specification (LNIS) <b>Versão { "5" }</b>, Documento Aplicável { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Versão { "1.0" }, { "29" } de janeiro de { "2025" }</b> (NASA). Obtido em 2026-10-18; PDF SHA-256 <c1/> (<a1>proveniência</a1>). Uma edição posterior é uma fixação diferente e pode alterar os códigos: o documento marca as suas tabelas de códigos { "{" }LSIS-TBC{ "}" } e diz que são "incluídas apenas para facilitar os esforços de teste e integração". Cada relatório nomeia esta edição.

# text
seg-6845e671bf24 = Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-69a98d01f489 = O gerador de códigos AFS do LunaNet verificado face às colunas impressas da especificação, a partir de uma execução real do motor v{ $version } (`kshana lunanet-afs-check spec`, fixado a LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } de janeiro de { "2025" }; o documento marca as suas tabelas de códigos { "{" }LSIS-TBC{ "}" }). { "9" } de { "10" } verificações são satisfeitas; B4 é NOT MET ({ "420" } de { "421" } coincidiram). Verifica um fluxo de símbolos face a uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana. Verifica um fluxo de símbolos face a uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet.

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
seg-dbee58df4c92 = Código Gold { "2047" } com ciclo encurtado para { "2046" } chips, G2 atrasado por um número de chips por PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } símbolos/s, PRN { "1" } a { "210" }

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
seg-2ebf619c9cb6 = Código Weil { "10230" } (a construção do GPS L1C) em camadas com um código secundário de 4 chips (S0 a S3) e um código Weil terciário de 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), sem dados. <c1/> e o nome do sinal <c2/> são a réplica do recetor, primário x secundário ({ "8" } ms): a sobreposição terciária de sincronização de trama de { "12" } s é deixada de fora, porque a aquisição e o seguimento não correlacionam com uma réplica de { "12" } s. <c3/> é o código completo de { "12" } s

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Trama

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } símbolos entrelaçados = { "6000" } símbolos = { "12" } s a { "500" } símbolos/s

# text
seg-a242d95d701f = { "9" } bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), gerador { "763" } em octal, com o descodificador de correlação de 256 hipóteses do documento

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, gerador ({ "1" }+X)P(X) (Apêndice H)

# text
seg-e225f10d7848 = Entrelaçador

# text
seg-cb075da6f8cf = { "60" } linhas x { "98" } colunas, escritas por linha e lidas por coluna

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Os dois componentes são aceites por <c1/>, <c2/>, <c3/> e <c4/> como qualquer outro sinal, pelo que uma gravação pode ser pesquisada em busca de AFS-I ou AFS-Q (<c5/>) e pode ser criada uma cena sintética para testes de recetores por software. Uma cena sintética, como para qualquer outro sinal, é um ficheiro para um recetor por software; nada aqui controla equipamento de rádio.

# text
seg-6d7a9d17946d = O que <b>não</b> está implementado

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>A codificação LDPC de taxa 1/2 das subtramas { "2" } a { "4" }.</b> As suas matrizes de verificação estão no Anexo { "1" }, um ficheiro separado que não consta do PDF e não está incluído. As subtramas { "2" } a { "4" } são transportadas e verificadas como blocos de símbolos opacos do comprimento especificado, e as palavras CRC-24Q no seu interior não são verificadas. Um fluxo que passa em <c1/> não se mostra conter palavras de código válidas.

# text
seg-67bb5d1038c7 = <b>Conteúdo das mensagens</b> (MSG-G1, MSG-G2, MSG-G4, ...): o documento deixa várias definições por escrever (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Atribuição de códigos por nó LunaNet</b> (a Tabela F-1 está por definir, TBD). Os PRN { "1" } a { "12" } têm atribuições de teste provisórias (Tabela { "11" }). <c1/> usa o código primário do PRN <em>n</em> com o secundário S((n-1) mod { "4" }); além do PRN { "12" } esse é o padrão desta implementação, não do documento. <c2/> e <c3/> aceitam qualquer combinação, com o código terciário de qualquer PRN.

# text
seg-6588307842fe = Orçamento de ligação, erro do sinal no espaço, requisitos de potência e de coerência (LSIS-100 e seguintes).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> executa a implementação face às tabelas impressas e aos exemplos resolvidos do documento (limiares B1 a B10 do <a1>pré-registo</a1>) e imprime cada um com a sua contagem e estado. <c2/> termina com { "1" } a menos que todos os limiares sejam atingidos.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> lê um fluxo de símbolos de decisão rígida (texto de <c2/> e <c3/>; espaços em branco ignorados) e verifica o padrão de sincronização, a descodificação de SB1, o FID (só { "0" } está definido), a continuidade de TOI (a avançar de um em módulo { "100" }) e o espaçamento de tramas ({ "6000" } símbolos). Termina com { "1" } perante qualquer problema.

# text
# c1: generate
seg-f12425044025 = <c1/> escreve um fluxo de teste: o padrão de sincronização do documento, os comprimentos de SB1 e de trama, com subtramas <b>de substituição</b> { "2" } a { "4" } (o preenchimento alternado de LSIS-300, sem codificação LDPC, sem mensagem). São símbolos para testar um verificador ou um descodificador, não uma forma de onda; o Kshana não escreve nenhum sinal.

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
seg-2133870991ca = Limiares indicados em <c1/> antes de o gerador existir; testes em <c2/>.

# text
seg-b74d5800a039 = Limiar

# text
seg-e75915599d5e = AFS-I primeiros e últimos { "24" } chips, { "210" } PRN

# text
seg-f654db18922f = <b>MET</b>, { "420" } de { "420" }

# text
seg-55d0d7168ceb = o estado inicial impresso de G2 é o estado após o atraso impresso

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } de { "210" }: a afirmação tinha a direção errada. A posteriori (B1c, não fixado antecipadamente): o estado impresso é o estado após { "2047" } menos o atraso, { "210" } de { "210" }

# text
seg-b94947c99f9a = Legendre({ "10223" }) é igual à Tabela D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q primário primeiros e últimos { "24" } chips, { "210" } PRN

# text
seg-678604d6e463 = Legendre({ "1499" }) é igual à Tabela E-1 e terciário primeiros e últimos { "24" } chips, { "210" } PRN

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } de { "421" }: a sequência de Legendre coincide e { "419" } de { "420" } colunas de código coincidem. Os últimos { "24" } chips impressos para o PRN { "147" } (<c1/>) são o mesmo valor impresso para o PRN { "151" }, cujo código o gerador reproduz; dois índices de Weil diferentes ({ "607" } e { "612" }) não dão os mesmos últimos { "24" } chips, pelo que a entrada do PRN { "147" } é muito provavelmente um erro de impressão no documento. Não pode ser resolvido sem o ficheiro de códigos separado do Anexo { "3" }. Fixado por um teste

# text
seg-aea9620e7bf1 = os códigos secundários S0 a S3 são iguais à Tabela { "10" }

# text
seg-2996e986d247 = <b>MET</b> (as constantes do próprio documento)

# text
seg-23c9277f62e6 = exemplo resolvido de SB1 da Figura { "8" }

# text
seg-fb70493dcdcf = <b>MET</b>: 0x045 codifica-se em 0x229F61DBB84A0 e descodifica-se em FID { "0" }, TOI { "69" } (um exemplo)

# text
# c1: 123456789
seg-acce07c33dec = valor de verificação CRC-24Q para <c1/>

# text
seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (o valor de catálogo, fora da especificação)

# text
seg-789b31d53873 = aritmética de tramas

# text
seg-5b5da00ad1c8 = entrelaçar e depois desentrelaçar

# text
seg-80f9cd313ec4 = <b>MET</b> (uma propriedade, MODELLED)

# text
seg-92a7addfdb8c = padrão de sincronização

# text
seg-215913f74706 = <b>MET</b> ({ "68" } símbolos; uma verificação de transcrição)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 a B4 são VALIDATED face às tabelas impressas da edição citada, que o documento marca { "{" }LSIS-TBC{ "}" }. Uma ida e volta cena-aquisição-seguimento de ambos os componentes satisfaz os mesmos limiares que os outros sinais (<c1/>).

# text
seg-9edb6e5771ca = <s1>Anterior</s1>Verificação Galileo OSNMA

# text
seg-d0043d0f578a = <s1>Seguinte</s1>Jammertest como árbitro

# text
seg-52946c9ff62a = O que não está implementado

# text
seg-339c9eeb510b = kshana lunanet-afs-check
