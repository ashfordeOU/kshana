# docs--positioning: translations (pt-PT)

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
seg-5b362d7b0903 = O Kshana é um <b>motor aberto e reprodutível de evidências de resiliência de PNT (posicionamento, navegação e temporização)</b>. Descreve-se um cenário — os sensores ou relógios, uma falha de GNSS (global navigation satellite system), um ataque de jamming ou spoofing, um orçamento — e ele indica quão bem o tempo e a posição se mantêm, pontuados face a figuras de mérito operacionais (FoM). Cada capacidade por trás dessas figuras é rotulada numa matriz verificada por máquina como <b>VALIDATED</b> (verificada face a uma referência independente externa), <b>MODELLED</b> (internamente consistente, não verificada externamente) ou <b>PARTNER</b> (da responsabilidade de um parceiro de hardware). Esta página diz onde o Kshana se destaca, para que serve e o que não é.

# text
seg-48d576a345e3 = Onde se destaca: temporização e holdover para infraestruturas críticas

# text
seg-f41d8a48ff13 = A parte do motor melhor validada é a temporização. As redes de telecomunicações, as redes elétricas e as plataformas financeiras obtêm o seu tempo do GNSS, e cada uma tem de dimensionar o <b>holdover</b>: durante quanto tempo um relógio local pode funcionar livremente através de uma perda de GNSS antes de o seu erro de tempo ultrapassar o orçamento.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>O que é VALIDATED.</b> Os estimadores de estabilidade de frequência de que se constrói uma resposta de holdover — desvio de Allan (ADEV), desvio de Allan modificado (MDEV), desvio de tempo (TDEV), erro máximo de intervalo de tempo (MTIE) e o estimador Theo1 de gama alargada — são verificados face a desvios de referência do Stable32, à biblioteca independente <c1/> e a um relógio de césio medido real. O cálculo da variância de deriva em holdover e a sua inversão para um tempo de holdover são verificados face ao SciPy. Consulte <a1><c2/></a1> para cada linha, o seu teste e a sua referência independente.

# text
seg-9fbedc930565 = <b>O que continua MODELLED.</b> Os patamares de ruído por classe de relógio (por exemplo o patamar de longo prazo de uma dada classe de oscilador) determinam a resposta para um relógio estável, e são valores representativos, não medições do seu dispositivo. Forneça patamares medidos para um número que pretenda defender.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Unidades de telecomunicações.</b> O tipo de cenário <c1/> comunica MTIE e TDEV, verifica-os face às máscaras do Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações (ITU-T) — G.8272 para um relógio de tempo de referência primário (PRTC), G.8272.1 para um PRTC melhorado (ePRTC), G.8273.2 para um relógio de fronteira de telecomunicações (T-BC) e G.8271.1 para os limites da rede no ponto de referência C — e comunica durante quanto tempo um holdover se mantém dentro de cada orçamento de erro de tempo. Consulte <a1><c2/></a1>.

# text
seg-50421d8247ab = O que o torna diferente

# text
seg-7ec913b140ed = A física e as normas não são a diferença: a propagação Simplified General Perturbations { "4" } (SGP4), o desvio de Allan, os referenciais e a diluição de precisão estão disponíveis, gratuitos e corretos, noutras bibliotecas, e o Kshana verifica-se face a várias delas. A diferença é a disciplina de evidências:

# text
seg-f7d466d5215b = <b>Aberto.</b> O motor está sob a GNU Affero General Public License (AGPL), pelo que qualquer pessoa o pode ler e voltar a executar. Existe uma licença comercial para integração fechada.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reprodutível.</b> Um resultado é determinado por <c1/>, bit a bit, e uma execução pode ser partilhada como uma ligação para o playground no navegador.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Com proveniência rotulada.</b> Cada parâmetro de sensor é rastreado até uma fonte publicada (<a1><c1/></a1>), e cada capacidade traz o seu nível VALIDATED / MODELLED / PARTNER. Uma salvaguarda de integração contínua (CI) recusa uma linha VALIDATED sem referência independente externa, pelo que uma autoverificação interna não pode ser apresentada como validação.

# text
seg-8bccfe110f4c = Não encontrámos outra ferramenta aberta que combine isto em holdover, integridade, seguimento inercial e sensores quânticos, mas uma pesquisa que não encontra nada não é prova de que nada exista; não afirmamos ser a única.

# text
seg-e942b2474960 = Quântico: um método de compromisso neutro, resultados rotulados MODELLED

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = O Kshana compara relógios e sensores inerciais quânticos e clássicos no mesmo cenário com o mesmo código: cada dispositivo é um modelo de erro, e o motor não sabe qual deles é "quântico". Trate-o como <b>um método neutro de compromisso quântico versus clássico cujos resultados são rotulados MODELLED</b>. A maioria das entradas são coeficientes de Allan/orçamento de ruído publicados; o acelerómetro de interferómetro de átomos frios tem uma camada de princípios fundamentais que deriva o seu coeficiente de ruído. Os dados medidos de desvio de Allan de um parceiro podem ser introduzidos através do tipo <c1/>, que é o caminho para promover os valores de um dispositivo específico. Consulte <a1><c2/></a1> e <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Lunar, cislunar e espaço profundo: mantidos, não em destaque

# text
seg-4b9bd68b7fb1 = O conjunto lunar / cislunar (monitorização de integridade lunar, o núcleo de três corpos Terra–Lua, escalas de tempo lunares, análise de volume de serviço) e o motor de navegação radiométrica de espaço profundo são capacidades mantidas. A maioria das suas linhas é MODELLED, e já existem ferramentas dedicadas que servem a navegação lunar, pelo que são oferecidas como capacidades do mesmo motor, cada uma com o seu nível, e não como destaque.

# text
seg-26f242f1bef8 = O resto do motor

# text
seg-b9b2e29e51d9 = O mesmo motor, com os mesmos níveis, abrange também:

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT em órbita terrestre baixa (LEO), de ponta a ponta.</b> Projeto de sinal (<c1/>), passagem e balanço de ligação por banda (<c2/>), mensagem de navegação difundida (<c3/>), posicionamento fundido em órbitas terrestres média e baixa (<c4/>), convergência de posicionamento preciso de ponto (PPP) com aumentação por LEO (<c5/>), posicionamento a partir de uma rede não terrestre 5G (<c6/>), e <c7/>, que passa a saída de cada fase à seguinte para um só sistema.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Espectro.</b> Uma cascata de densidade espectral de potência em banda L (e em ultra-alta frequência (UHF), banda S e banda C) sob uma cronologia de jammer programada, com relação jammer-sinal por banda e densidade efetiva de portadora-ruído (<c1/>), e entrada e saída de gravações Signal Metadata Format (SigMF).

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>O sistema solar e qualquer corpo central.</b> Posições e constantes físicas dos planetas e das principais luas (<c1/>), posicionamento em torno de qualquer desses corpos (<c2/>), e projeto de constelações Walker e de posições publicadas com mapas de cobertura e de diluição de precisão em torno de qualquer um deles (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Campanhas.</b> Tipos existentes encadeados numa cronologia partilhada, varridos, executados como conjuntos Monte Carlo com semente, ou executados lado a lado sob condições partilhadas (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Saídas.</b> Cada execução escreve um documento de resultado, um gráfico e um relatório em HTML (HyperText Markup Language) e JSON (JavaScript Object Notation); <c1/> escreve uma animação SVG (Scalable Vector Graphics), HTML ou em sequência de imagens; <c2/> escreve efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ou STK (Systems Tool Kit) para os tipos que situam coisas na Terra, e SigMF para <c3/>.

# text
seg-75206591a52a = A maioria destas linhas é MODELLED; a matriz de verificação nomeia as poucas que são VALIDATED (por exemplo as recomendações da União Internacional das Telecomunicações sobre chuva e cintilação, o algoritmo de efemérides difundidas do Galileo, a verificação de trama CRC-24Q (verificação de redundância cíclica de 24 bits) e o resolvedor planetário de tempo de luz).

# text
seg-785218a0ea66 = O que o Kshana não é

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>Não é um simulador de sinais de radiofrequência (RF) nem uma plataforma de hardware-in-the-loop (HIL).</b> O Kshana não aciona nenhum hardware de rádio e não transmite nada. A maior parte funciona ao nível de modelos de erro e balanços de ligação, antes de se comprar hardware ou tempo de laboratório. Ao nível do sinal é apenas software: a camada IQ GNSS (<c1/>) escreve ficheiros de amostras IQ (em fase/quadratura) em banda de base de sinais GNSS legítimos para recetores de software e executa neles o seu próprio recetor de software; a secção <c3/> do tipo <c2/> (desde a { "0.29.0" }) escreve um instantâneo SigMF (Signal Metadata Format) do seu modelo analítico que inclui os jammers configurados (jammers semelhantes a ruído banda a banda, tons e chirps como formas de onda); e <c4/> soma em memória um sinal autêntico e uma réplica de spoofer para testar a captura das malhas, sem a escrever. Testar um recetor de hardware face a um estímulo de RF real é tarefa de um simulador de RF.

# text
seg-ca243f3f8e8d = <b>Não é um substituto de MATLAB/Simulink, STK ou Orekit.</b> Situa-se a par deles. Lê e escreve os formatos de intercâmbio que eles usam — mensagens de efemérides orbitais CCSDS (Consultative Committee for Space Data Systems), órbitas precisas SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) — escreve efemérides CZML, KML, GeoJSON e STK para os seus visualizadores, e o seu modelo numérico de forças é verificado de forma cruzada face ao Orekit em vez de ser oferecido em seu lugar.

# text
seg-8fa4e93c3d0e = <b>Não é um motor de processamento GNSS de fase da portadora nem um serviço de posicionamento</b> (consulte abaixo).

# text
seg-8ba4b67bc813 = <b>Não é uma entidade certificadora.</b> Um rótulo VALIDATED significa que uma capacidade coincide com uma referência independente externa; não é uma certificação de nenhum produto ou operador.

# text
seg-362b857140b9 = O que o Kshana é, e não é, ao lado de um motor de processamento GNSS

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = O Kshana <b>não</b> é um motor de <em>processamento</em> GNSS de fase da portadora, e nenhum tipo de cenário é um serviço de posicionamento. Tem, contudo, um pé no domínio das medições, como código de biblioteca em que o estudo de desempenho se apoia e que é verificado face a referências independentes. O posicionamento cinemático em tempo real (RTK) de linha de base curta com fixação de inteiros LAMBDA (least-squares ambiguity decorrelation adjustment) executa-se sobre observações RINEX reais de dupla frequência, tal como um filtro de posicionamento preciso de ponto (PPP) estático de ambiguidades flutuantes com órbitas e relógios finais do IGS, e o relógio do recetor que esse filtro estima é uma solução de tempo face ao relógio final de estação do IGS. Cada um dos três é uma linha VALIDATED da <a1>matriz de verificação</a1>, face aos dados de estações do IGS que aí nomeia, e cada um executa-se em janelas de observação estáticas e curtas, não como um serviço em contínuo com resolução de ambiguidades em linhas de base longas, suavização por portadora ou um rover cinemático. O tipo <c1/> executa um filtro PPP de ambiguidades flutuantes sobre código e fase da portadora, mas sobre medições que simula por si próprio, para estudar o tempo de convergência com e sem aumentação por LEO; não processa um ficheiro de observações. O tipo <c2/> (posição, velocidade e tempo) resolve a posição de um recetor a partir de pseudodistâncias de código RINEX reais mais efemérides difundidas, validado face a uma coordenada levantada do International GNSS Service (IGS) (estação ABMF, 2018-05-13) com <b>{ "5.7" } m de RMS (raiz do erro quadrático médio) 3-D / { "1.1" } m horizontal</b>. Mas o produto é o estudo de desempenho, não o serviço de posicionamento, e o enquadramento que se segue destina-se a poupar a um potencial utilizador a desilusão de ter escolhido a ferramenta errada.

# text
seg-169dd778c45f = Um motor de processamento GNSS (RTKLIB, uma biblioteca aberta de posicionamento cinemático em tempo real; gLAB, o conjunto de ferramentas de laboratório GNSS do grupo gAGE da Universidade Politécnica da Catalunha)

# text
# c1: pvt
seg-4faa1de0ef70 = um cenário: modelos de erro de sensores, janelas de falha, geometria — ou, para <c1/>, um ficheiro real de observações RINEX mais a navegação difundida

# text
seg-ae60d0def8af = observações GNSS reais (RINEX), efemérides, correções

# text
# c1: pvt
seg-5fce99bb803d = FoM de desempenho: holdover, erro de temporização/posição, disponibilidade, limites de integridade/segurança — mais uma posição de posicionamento de ponto único (SPP) por código a partir do tipo <c1/>

# text
seg-b752bb5c3f64 = uma <b>solução</b> de posição/velocidade/tempo (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Pergunta a que responde

# text
seg-b52fd8e0c856 = "quão boa <em>seria</em> esta arquitetura, e onde falha?"

# text
seg-09672ca004ac = "dadas estas medições, onde estou <em>agora</em>?"

# text
seg-00d5ebd56088 = Sensores quânticos / óticos

# text
seg-a55f2bd6c1bf = modelados como modelos de erro (relógios óticos, unidade de medição inercial (IMU) de átomos frios, transferência ótica de tempo), resultados rotulados MODELLED

# text
seg-7ccfb3395d84 = não modelado

# text
seg-ec21dbf4b910 = Processamento de observações reais

# text
# c1: pvt
seg-324ef9a933d5 = SPP por código a partir de observações RINEX reais (<c1/>, ao nível do metro); RTK de linha de base curta com LAMBDA e PPP estático de ambiguidades flutuantes sobre fase da portadora real, como código de biblioteca verificado face a estações do IGS (VALIDATED, janelas estáticas e curtas, não um serviço em contínuo); mais geometria / diluição de precisão (DOP) / disponibilidade

# text
seg-e15db8a33a9a = a competência central, até ao PPP/RTK de fase da portadora

# text
seg-e6df7ccdba96 = zero — executa-se num separador do navegador (WebAssembly)

# text
seg-812c1c70ce63 = compilação nativa / cadeia de ferramentas

# text
seg-58df67617e1a = Complementares, não concorrentes — RTKLIB e gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = O <a1>RTKLIB</a1> e o <a2>gLAB</a2> são conjuntos de processamento GNSS maduros e amplamente usados. Recebem medições reais e produzem uma solução de posicionamento (SPP/PPP/RTK; o gLAB é também uma excelente ferramenta de ensino com uma forte herança na Agência Espacial Europeia (ESA) e no European Geostationary Navigation Overlay Service (EGNOS)). O Kshana <b>não</b> os substitui e não tenta fazê-lo. O seu percurso de observações é estreito: posicionamento de ponto único por código (<c1/>) e, como código de biblioteca verificado, RTK de linha de base curta com fixação de inteiros LAMBDA e um filtro PPP estático de ambiguidades flutuantes sobre observações reais de dupla frequência, cada um VALIDATED face a dados de estações do IGS (o filtro PPP também face a uma execução do RTKLIB com as mesmas entradas). Não tem suavização por portadora, nem processamento cinemático ou em contínuo, nem resolução de ambiguidades em linhas de base longas, e <c2/> não estima a troposfera nem a ionosfera — aplica os modelos de troposfera de Saastamoinen/Niell e a combinação livre de ionosfera L1/L2, não os resolve como estados.

# text
seg-9c4e70ce8a55 = O pipeline é complementar:

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> respondem a <em>"onde estou, a partir destes sinais?"</em>

# text
seg-f5370894cdd1 = O <b>Kshana</b> responde a <em>"durante quanto tempo mantenho uma boa resposta quando esses sinais cessam — e quanto me proporciona um melhor relógio ou sensor inercial, clássico ou quântico?"</em>

# text
seg-2403d6b115de = Um fluxo de trabalho natural usa um motor de processamento para o segmento com GNSS disponível e o Kshana para estudar o comportamento de <b>holdover</b> e o espaço de compromissos de sensores à sua volta. Se precisar de um serviço de posicionamento por fase da portadora — PPP cinemático ou RTK, linhas de base longas, resolução de ambiguidades em rede — use o RTKLIB ou o gLAB; se precisar de evidências reprodutíveis e rotuladas sobre resiliência e holdover, é para isso que o Kshana foi construído.

# text
seg-21631e5c6be3 = Um nível de instalação zero no navegador

# text
seg-9b01dd6721ed = A maioria das ferramentas de simulação neste domínio (RTKLIB, gLAB, a General Mission Analysis Tool (GMAT), Orekit, STK) exige uma instalação nativa ou uma licença, e uma curva de aprendizagem antes do primeiro resultado. O Kshana compila para WebAssembly e executa-se <b>inteiramente no navegador</b> — o <a1>playground</a1> carrega um cenário resolvido, executa o motor real do lado do cliente (nada é enviado) e mostra o resultado em segundos. Os cursores guiados e os cenários de um clique significam que o primeiro resultado útil não precisa de TOML (Tom's Obvious Minimal Language, o formato de ficheiro de cenário) nem de cadeia de ferramentas.

# text
seg-b1cb4b8f0ef1 = Esse nível de instalação zero é uma posição deliberada:

# text
seg-33b361bde50d = <b>Alcance</b> — um revisor, estudante ou responsável de aquisições pode experimentar o motor verdadeiro a partir de uma ligação, em qualquer dispositivo, sem configuração.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reprodutibilidade</b> — o mesmo motor que é distribuído no navegador é a biblioteca distribuída no crates.io, no Python Package Index (PyPI) e no npm; um resultado é reproduzível a partir de <c1/>, e uma execução pode ser partilhada como um URL (endereço web).

# text
seg-3d3d4bda606c = <b>Honestidade</b> — executar o motor por si, às claras, é o contrapeso mais forte a "confie nos números": o nível do navegador <em>é</em> a superfície de auditoria.

# text
seg-6095bcacb725 = O nível do navegador não faz do Kshana um substituto de um conjunto de processamento de secretária — torna a questão do estudo de compromissos de desempenho acessível a pessoas que nunca instalariam um.

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — o mapa de âmbito linha a linha (o âmbito completo e os resíduos do resolvedor <c2/> estão na linha <b>Processamento GNSS / PNT</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — o que está validado, com evidências.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — o tipo de temporização de telecomunicações e as suas máscaras.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — definições em linguagem simples dos termos aqui usados.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — o playground no navegador.

# text
seg-54e2deeffc7d = <s1>Anterior</s1>Arquitetura

# text
seg-b2f93c49d5c6 = <s1>Seguinte</s1>Registo de alterações
