# docs--positioning: translations (pt-BR)

# attr:aria-label, text
seg-6555ff9a6d8e = Saída

# text
seg-0be9b5747c00 = Kshana

# text
seg-94058315dfe4 = Entrada

# text
# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Fonte: <c1/>

# text
seg-5b362d7b0903 = O Kshana é um <b>motor aberto e reproduzível de evidências de resiliência de PNT (posicionamento, navegação e temporização)</b>. Você descreve um cenário — os sensores ou relógios, uma interrupção de GNSS (sistema global de navegação por satélite), um ataque de jamming ou spoofing, um orçamento — e ele diz quão bem o tempo e a posição se sustentam, pontuados em relação a figuras de mérito (FoMs) operacionais. Cada capacidade por trás dessas figuras é rotulada em uma matriz verificada por máquina como <b>VALIDATED</b> (verificada em relação a uma referência independente externa), <b>MODELLED</b> (internamente consistente, não verificada externamente) ou <b>PARTNER</b> (de responsabilidade de um parceiro de hardware). Esta página diz aonde ele chega, para que serve e o que ele não é.

# text
seg-48d576a345e3 = Aonde ele chega: temporização e holdover para infraestrutura crítica

# text
seg-f41d8a48ff13 = A parte melhor validada do motor é a temporização. Redes de telecomunicações, redes elétricas e mercados financeiros obtêm seu tempo do GNSS, e cada um precisa dimensionar o <b>holdover</b>: por quanto tempo um relógio local pode funcionar livremente após uma perda de GNSS antes que seu erro de tempo estoure o orçamento.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>O que é VALIDATED.</b> Os estimadores de estabilidade de frequência a partir dos quais uma resposta de holdover é construída — desvio de Allan (ADEV), desvio de Allan modificado (MDEV), desvio de tempo (TDEV), erro máximo de intervalo de tempo (MTIE) e o estimador Theo1 de alcance estendido — são verificados em relação aos desvios de referência do Stable32, à biblioteca independente <c1/> e a um relógio real de césio medido. O cálculo da variância de deriva em holdover e sua inversão para um tempo de holdover são verificados em relação ao SciPy. Consulte <a1><c2/></a1> para cada linha, seu teste e sua referência independente.

# text
seg-9fbedc930565 = <b>O que continua MODELLED.</b> Os pisos de ruído por classe de relógio (por exemplo, o piso de longo prazo de uma dada classe de oscilador) definem a resposta para um relógio estável, e são figuras representativas, não medições do seu dispositivo. Forneça pisos medidos para um número que você pretende defender.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Unidades de telecomunicações.</b> O tipo de cenário <c1/> relata MTIE e TDEV, confere-os com as máscaras do Setor de Normalização das Telecomunicações da União Internacional de Telecomunicações (ITU-T) — G.8272 para um relógio de tempo de referência primário (PRTC), G.8272.1 para um PRTC aprimorado (ePRTC), G.8273.2 para um relógio de fronteira de telecomunicações (T-BC) e G.8271.1 para os limites de rede no ponto de referência C — e relata por quanto tempo um holdover permanece dentro de cada orçamento de erro de tempo. Consulte <a1><c2/></a1>.

# text
seg-50421d8247ab = O que o torna diferente

# text
seg-7ec913b140ed = A física e as normas não são a diferença: a propagação Simplified General Perturbations { "4" } (SGP4), o desvio de Allan, os referenciais e a diluição de precisão estão disponíveis, gratuitos e corretos, em outras bibliotecas, e o Kshana se confere com várias delas. A diferença é a disciplina de evidências:

# text
seg-f7d466d5215b = <b>Aberto.</b> O motor está sob a GNU Affero General Public License (AGPL), de modo que qualquer pessoa pode lê-lo e executá-lo novamente. Existe uma licença comercial para integração fechada.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reproduzível.</b> Um resultado é determinado por <c1/>, bit a bit, e uma execução pode ser compartilhada como um link para o playground do navegador.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Com procedência rotulada.</b> Todo parâmetro de sensor é rastreado até uma fonte publicada (<a1><c1/></a1>), e toda capacidade traz seu nível VALIDATED / MODELLED / PARTNER. Uma salvaguarda de integração contínua (CI) recusa uma linha VALIDATED sem referência independente externa, de modo que uma autoverificação interna não possa ser apresentada como validação.

# text
seg-8bccfe110f4c = Não encontramos outra ferramenta aberta que combine isso em holdover, integridade, deriva inercial e sensores quânticos, mas uma busca que não encontra nada não é prova de que nada exista; não afirmamos ser a única.

# text
seg-e942b2474960 = Quântico: um método neutro de trade, resultados rotulados MODELLED

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = O Kshana compara relógios e sensores inerciais quânticos e clássicos no mesmo cenário com o mesmo código: cada dispositivo é um modelo de erro, e o motor não sabe qual deles é "quântico". Trate-o como <b>um método neutro de trade quântico versus clássico cujos resultados são rotulados MODELLED</b>. A maioria das entradas são coeficientes publicados de Allan/orçamento de ruído; o acelerômetro de interferômetro de átomos frios tem uma camada de primeiros princípios que deriva seu coeficiente de ruído. Os dados medidos de desvio de Allan de um parceiro podem ser fornecidos pelo tipo de cenário <c1/>, que é o caminho para promover as figuras de um dispositivo específico. Consulte <a1><c2/></a1> e <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Lunar, cislunar e espaço profundo: mantidos, não o destaque

# text
seg-4b9bd68b7fb1 = O conjunto lunar / cislunar (monitoramento de integridade lunar, o núcleo de três corpos Terra–Lua, escalas de tempo lunares, análise de volume de serviço) e o motor de navegação radiométrica de espaço profundo são capacidades mantidas. A maioria de suas linhas é MODELLED, e já existem ferramentas dedicadas à navegação lunar, de modo que são oferecidos como capacidades do mesmo motor, cada um com seu próprio nível, e não como destaque.

# text
seg-26f242f1bef8 = O restante do motor

# text
seg-b9b2e29e51d9 = O mesmo motor, com os mesmos níveis, também cobre:

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT em órbita baixa da Terra (LEO), de ponta a ponta.</b> Projeto de sinal (<c1/>), passagem e orçamento de enlace por banda (<c2/>), mensagem de navegação transmitida (<c3/>), posicionamento fundido em órbitas média e baixa da Terra (<c4/>), convergência do posicionamento por ponto preciso (PPP) com aumento por LEO (<c5/>), posicionamento a partir de uma rede não terrestre 5G (<c6/>) e <c7/>, que entrega a saída de cada etapa à seguinte para um único sistema.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Espectro.</b> Uma cascata de densidade espectral de potência em banda L (e em UHF (frequência ultra-alta), banda S e banda C) sob uma linha do tempo roteirizada de jammer, com razão jammer-sinal por banda e densidade efetiva de portadora para ruído (<c1/>), e entrada e saída de gravações Signal Metadata Format (SigMF).

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>O sistema solar e qualquer corpo central.</b> Posições e constantes físicas dos planetas e das principais luas (<c1/>), posicionamento em torno de qualquer um desses corpos (<c2/>), e projeto de constelações Walker e de slots publicados com mapas de cobertura e de diluição de precisão em torno de qualquer um deles (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Campanhas.</b> Tipos de cenário existentes encadeados em uma linha do tempo compartilhada, varridos, executados como conjuntos Monte Carlo com semente ou executados lado a lado sob condições compartilhadas (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Saídas.</b> Cada execução grava um documento de resultado, um gráfico e um relatório em HTML (HyperText Markup Language) e JSON (JavaScript Object Notation); <c1/> grava uma animação em SVG (Scalable Vector Graphics), HTML ou sequência de quadros; <c2/> grava efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ou STK (Systems Tool Kit) para os tipos de cenário que situam objetos na Terra, e SigMF para <c3/>.

# text
seg-75206591a52a = A maioria destas linhas é MODELLED; a matriz de verificação nomeia as poucas que são VALIDATED (por exemplo, as recomendações da União Internacional de Telecomunicações sobre chuva e cintilação, o algoritmo de efemérides transmitidas do Galileo, a verificação de quadro CRC-24Q (verificação de redundância cíclica de 24 bits) e o solucionador de tempo de luz planetário).

# text
seg-785218a0ea66 = O que o Kshana não é

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>Não é um simulador de sinais de radiofrequência (RF) nem uma bancada de hardware-in-the-loop (HIL).</b> O Kshana não aciona nenhum hardware de rádio e não transmite nada. A maior parte dele trabalha no nível de modelos de erro e orçamentos de enlace, antes que se compre hardware ou tempo de laboratório. No nível do sinal ele é apenas software: a camada de IQ GNSS (<c1/>) grava arquivos de amostras IQ (em fase/quadratura) em banda base de sinais GNSS legítimos para receptores de software e executa sobre eles o seu próprio receptor de software; a seção <c3/> do tipo de cenário <c2/> (desde a { "0.29.0" }) grava um snapshot SigMF (Signal Metadata Format) do seu modelo analítico que inclui os jammers configurados (jammers de tipo ruído bin a bin, tons e chirps como formas de onda); e <c4/> soma na memória um sinal autêntico e uma réplica de spoofer para testar a captura da malha, sem gravá-lo. Testar um receptor de hardware contra um estímulo de RF real é tarefa de um simulador de RF.

# text
seg-ca243f3f8e8d = <b>Não substitui o MATLAB/Simulink, o STK nem o Orekit.</b> Ele fica ao lado deles. Lê e grava os formatos de intercâmbio que eles usam — mensagens de efemérides de órbita (Orbit Ephemeris Messages) do CCSDS (Consultative Committee for Space Data Systems), órbitas precisas SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) —, grava CZML, KML, GeoJSON e efemérides STK para os visualizadores deles, e seu modelo numérico de forças é conferido de forma cruzada com o Orekit, em vez de ser oferecido no lugar dele.

# text
seg-8fa4e93c3d0e = <b>Não é um motor de processamento GNSS de fase da portadora nem um serviço de posicionamento</b> (veja abaixo).

# text
seg-8ba4b67bc813 = <b>Não é uma autoridade de certificação.</b> Um rótulo VALIDATED significa que uma capacidade coincide com uma referência independente externa; não é uma certificação de nenhum produto nem operador.

# text
seg-362b857140b9 = O que o Kshana é, e não é, ao lado de um motor de processamento GNSS

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = O Kshana <b>não</b> é um motor de <em>processamento</em> GNSS de fase da portadora, e nenhum tipo de cenário é um serviço de posicionamento. Ele tem, sim, um pé no domínio da medição, como código de biblioteca em que o estudo de desempenho se apoia e que é conferido em relação a referências independentes. O posicionamento cinemático em tempo real (RTK) de linha de base curta com fixação de inteiros por LAMBDA (least-squares ambiguity decorrelation adjustment) roda sobre observações RINEX reais de dupla frequência, assim como um filtro estático de posicionamento por ponto preciso (PPP) com float, com órbitas e relógios finais do IGS, e o relógio do receptor que esse filtro estima é uma solução de tempo em relação ao relógio de estação final do IGS. Cada um dos três é uma linha VALIDATED da <a1>matriz de verificação</a1>, em relação aos dados de estação do IGS que ela nomeia ali, e cada um roda em janelas de observação estáticas e curtas, não como um serviço em fluxo com resolução de ambiguidades em linhas de base longas, suavização por portadora ou um rover cinemático. O tipo de cenário <c1/> executa um filtro PPP float sobre código e fase da portadora, mas sobre medições que ele mesmo simula, para estudar o tempo de convergência com e sem aumento por LEO; ele não processa um arquivo de observações. O tipo de cenário <c2/> (posição, velocidade e tempo) resolve a posição de um receptor a partir de pseudodistâncias de código RINEX reais mais efemérides transmitidas, validado em relação a uma coordenada levantada do International GNSS Service (IGS) (estação ABMF, 2018-05-13) com <b>{ "5.7" } m RMS 3-D (raiz do valor quadrático médio) / { "1.1" } m na horizontal</b>. Mas o produto é o estudo de desempenho, não o serviço de posicionamento, e o enquadramento abaixo pretende poupar a um usuário potencial a decepção de usar a ferramenta errada.

# text
seg-169dd778c45f = Um motor de processamento GNSS (RTKLIB, uma biblioteca aberta de posicionamento cinemático em tempo real; gLAB, o conjunto de ferramentas de laboratório GNSS do grupo gAGE da Universidade Politécnica da Catalunha)

# text
# c1: pvt
seg-4faa1de0ef70 = um cenário: modelos de erro de sensor, janelas de interrupção, geometria — ou, para <c1/>, um arquivo real de observações RINEX mais a navegação transmitida

# text
seg-ae60d0def8af = observações GNSS reais (RINEX), efemérides, correções

# text
# c1: pvt
seg-5fce99bb803d = FoMs de desempenho: holdover, erro de temporização/posição, disponibilidade, limites de integridade/segurança — mais uma posição por posicionamento de ponto único (SPP) de código a partir do tipo de cenário <c1/>

# text
seg-b752bb5c3f64 = uma <b>solução</b> de posição/velocidade/tempo (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Pergunta que responde

# text
seg-b52fd8e0c856 = "quão boa <em>seria</em> esta arquitetura, e onde ela falha?"

# text
seg-09672ca004ac = "dadas estas medições, onde estou <em>agora</em>?"

# text
seg-00d5ebd56088 = Sensores quânticos / ópticos

# text
seg-a55f2bd6c1bf = modelados como modelos de erro (relógios ópticos, unidade de medição inercial (IMU) de átomos frios, transferência óptica de tempo), resultados rotulados MODELLED

# text
seg-7ccfb3395d84 = não modelado

# text
seg-ec21dbf4b910 = Processamento de observações reais

# text
# c1: pvt
seg-324ef9a933d5 = SPP de código a partir de observações RINEX reais (<c1/>, nível de metro); RTK de linha de base curta com LAMBDA e PPP float estático sobre fase da portadora real, como código de biblioteca conferido em relação a estações do IGS (VALIDATED, janelas estáticas e curtas, não um serviço em fluxo); mais geometria / diluição de precisão (DOP) / disponibilidade

# text
seg-e15db8a33a9a = a competência central, até o PPP/RTK de fase da portadora

# text
seg-e6df7ccdba96 = zero — roda em uma aba do navegador (WebAssembly)

# text
seg-812c1c70ce63 = compilação nativa / cadeia de ferramentas

# text
seg-58df67617e1a = Complementar, não concorrente — RTKLIB e gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> e <a2>gLAB</a2> são conjuntos de processamento GNSS maduros e amplamente usados. Eles recebem medições reais e produzem uma solução de posicionamento (SPP/PPP/RTK; o gLAB também é uma excelente ferramenta de ensino, com forte tradição na Agência Espacial Europeia (ESA) e no European Geostationary Navigation Overlay Service (EGNOS)). O Kshana <b>não</b> os substitui e não tenta fazê-lo. Seu caminho de observações é estreito: posicionamento de ponto único por código (<c1/>) e, como código de biblioteca conferido, RTK de linha de base curta com fixação de inteiros por LAMBDA e um filtro PPP float estático sobre observações reais de dupla frequência, cada um VALIDATED em relação a dados de estações do IGS (o filtro PPP também em relação a uma execução do RTKLIB com as mesmas entradas). Ele não tem suavização por portadora, nem processamento cinemático ou em fluxo, nem resolução de ambiguidades em linhas de base longas, e <c2/> não estima a troposfera nem a ionosfera — ele aplica os modelos de troposfera de Saastamoinen/Niell e a combinação livre de ionosfera L1/L2, mas não os resolve como estados.

# text
seg-9c4e70ce8a55 = O pipeline é complementar:

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> respondem <em>"onde estou, a partir destes sinais?"</em>

# text
seg-f5370894cdd1 = O <b>Kshana</b> responde <em>"por quanto tempo mantenho uma boa resposta quando esses sinais cessam — e quanto me rende um relógio ou sensor inercial melhor, clássico ou quântico?"</em>

# text
seg-2403d6b115de = Um fluxo de trabalho natural usa um motor de processamento para o trecho com GNSS disponível e o Kshana para estudar o comportamento de <b>holdover</b> e o espaço de trade de sensores em torno dele. Se você precisa de um serviço de posicionamento por fase da portadora — PPP ou RTK cinemático, linhas de base longas, resolução de ambiguidades em rede — use o RTKLIB ou o gLAB; se você precisa de evidências reproduzíveis e rotuladas sobre resiliência e holdover, esse é o trabalho para o qual o Kshana foi construído.

# text
seg-21631e5c6be3 = Uma camada de navegador sem instalação

# text
seg-9b01dd6721ed = A maioria das ferramentas de simulação nesta área (RTKLIB, gLAB, a General Mission Analysis Tool (GMAT), Orekit, STK) exige uma instalação nativa ou uma licença, e uma curva de aprendizado antes do primeiro resultado. O Kshana é compilado para WebAssembly e roda <b>inteiramente no navegador</b> — o <a1>playground</a1> carrega um cenário prático, executa o motor real no cliente (nada é enviado) e mostra o resultado em segundos. Controles deslizantes guiados e cenários de um clique significam que o primeiro resultado útil não exige TOML (Tom's Obvious Minimal Language, o formato de arquivo de cenário) nem cadeia de ferramentas.

# text
seg-b1cb4b8f0ef1 = Essa camada sem instalação é uma posição deliberada:

# text
seg-33b361bde50d = <b>Alcance</b> — um revisor, estudante ou responsável por compras pode experimentar o motor de verdade a partir de um link, em qualquer dispositivo, sem nenhuma configuração.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reprodutibilidade</b> — o mesmo motor distribuído no navegador é a biblioteca distribuída no crates.io, no Python Package Index (PyPI) e no npm; um resultado é reproduzível a partir de <c1/>, e uma execução pode ser compartilhada como uma URL (endereço web).

# text
seg-3d3d4bda606c = <b>Honestidade</b> — executar o motor você mesmo, às claras, é o contra-argumento mais forte a "confie nos números": a camada de navegador <em>é</em> a superfície de auditoria.

# text
seg-6095bcacb725 = A camada de navegador não faz do Kshana um substituto de um conjunto de processamento de desktop — ela torna a questão do estudo de trade de desempenho acessível a pessoas que nunca instalariam um.

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — o mapa de escopo linha a linha (o escopo completo e os resíduos do solucionador <c2/> estão na linha <b>Processamento GNSS / PNT</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — o que é validado, com evidências.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — o tipo de cenário de temporização de telecomunicações e suas máscaras.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — definições em linguagem simples dos termos usados aqui.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — o playground do navegador.

# text
seg-54e2deeffc7d = <s1>Anterior</s1>Arquitetura

# text
seg-b2f93c49d5c6 = <s1>Próximo</s1>Registro de mudanças
