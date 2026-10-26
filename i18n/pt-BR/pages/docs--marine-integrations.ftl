# docs--marine-integrations: translations (pt-BR)

# text
seg-2e34ace70d11 = Plugin do Signal K

# text
seg-0857a94a948e = Limites

# text
seg-2247a2344710 = Significado

# text
seg-c3c260b7063e = Testes

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-ab1af8b3d968 = veja acima

# text
seg-c353e7bec219 = Chave

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7e304f816037 = Fonte: <c1/>

# text
seg-fb2b0841a172 = Integrações marítimas: a pontuação de confiança na ponte de comando

# text
# c1: MARITIME-TRUST.md
seg-a88b3968c706 = A pontuação de confiança marítima do Kshana (<a1><c1/></a1>) é acessível a partir de software que os navegadores já usam: um plugin de servidor <b>Signal K</b> e o <b>OpenCPN</b> por NMEA em modo gate sobre TCP. Uma compilação de referência a coloca em um computador pequeno ao lado do receptor.

# text
seg-eb8043b9e269 = <b>Software de caráter consultivo.</b> O Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e não foi avaliado em relação a nenhuma norma de desempenho. Tudo nesta página é um auxílio ao julgamento do navegador. O operador continua responsável pela navegação segura da embarcação e por qualquer decisão de confiar, ou de deixar de confiar, em uma posição. Nada aqui transmite, e nada aqui torna uma posição mais precisa.

# text
seg-dab66f260e56 = Peça

# text
seg-40fd2019e974 = Situação na { "0.35" }

# text
seg-7bcecf49199c = distribuído, com testes unitários sobre saída sintética gravada; não publicado no npm

# text
seg-d5278e683d37 = OpenCPN por NMEA em modo gate sobre TCP

# text
seg-a876f5d43e39 = distribuído e testado (reprodução do lado do consumidor); a própria interface do usuário do OpenCPN não é acionada por nenhum teste

# text
seg-4a6d2f45b403 = Plugin nativo de painel de pontuação para o OpenCPN

# text
# c1: integrations/opencpn/evidence/
seg-b0d4d32612e9 = compilado, lógica com testes unitários e executado dentro do OpenCPN { "5.8.4" } sob uma tela virtual (evidências em <c1/>); não empacotado para o gerenciador de plugins; só será distribuído após revisão

# text
seg-2e0058b5e057 = Compilação de referência

# text
seg-959d93e3a56d = peças, passos do SO, unidades systemd (verificadas em simulação), uma opção de contêiner; não testada em uma embarcação

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: MARITIME-TRUST.md
# c4: integrations/signalk/lib/adapter.js
seg-8524cb32f0a3 = Tudo isso lê uma única coisa: a saída de <c1/> (linhas JSON, a sentença <c2/>, o gate). Os formatos de transmissão estão em <a1><c3/></a1>. O plugin Signal K mantém seu conhecimento deles em um único arquivo, <c4/>; uma mudança de formato é uma edição de um arquivo só.

# text
# c1: signalk-server
# c2: integrations/signalk/
# c3: node_modules
# c4: ~/.signalk/node_modules/signalk-kshana-trust
seg-e5b08ab63d78 = Sem dependências npm. O plugin em si roda no Node { "18" } ou mais recente; as versões atuais do <c1/> exigem Node { "22" } ou mais recente, portanto, na prática, use { "22" }. Copie ou vincule <c2/> à pasta <c3/> do servidor (por exemplo <c4/>), reinicie o servidor e ative <b>Kshana GNSS trust</b> em Server, Plugin Config.

# text
# c1: source
seg-fd80525d7dd1 = De onde vêm as épocas (<c1/>)

# text
seg-013478c9a701 = O que o plugin faz

# text
# c1: spawn-signalk-nmea
seg-abbd00e9cacf = <c1/> (padrão)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: nmea0183
# c3: spawn-args
# c4: --tcp
# c5: tcp-pksht
seg-8ca5f95ed09d = Executa <c1/> e grava em sua entrada padrão cada sentença NMEA { "0183" } bruta que o servidor recebe (o evento <c2/> do servidor). Reinicia-o, com espera crescente, se ele terminar | <b>Use-o apenas em um servidor com uma única fonte NMEA</b>: ele alimenta todas as sentenças de todos os provedores, intercaladas, de modo que um segundo receptor GNSS ou AIS parece um receptor cuja posição salta e pode ser pontuado como spoofing. Com mais de uma fonte, use <c3/> com o fluxo <c4/> próprio daquele receptor, ou <c5/> a partir de um gate.

# text
# c1: kshana receiver-trust live <sessionFile> <inputArgs...>
# c2: ["--tcp","192.0.2.10:10110"]
# c3: ["--udp","10110"]
seg-3b3eadcffb90 = Executa <c1/>, por exemplo <c2/> ou <c3/>

# text
# c1: kshana
# c2: integrations/opencpn/
seg-d69b5ebe1042 = Conecta-se a um fluxo das linhas JSON que <c1/> grava (por exemplo, a partir do relay em <c2/>)

# text
# c1: $PKSHT
seg-cd5a419844cc = Conecta-se a um fluxo NMEA (como a saída do gate do serviço ou do contêiner na compilação de referência, porta { "10110" }) e lê somente as sentenças <c1/> dele

# text
# c1: calibration_s
seg-f17c9b7d7abc = Um fluxo que já está sofrendo spoofing quando o monitor se conecta pela primeira vez não tem linha de base limpa (os primeiros <c1/> segundos nunca são pontuados). Inicie-o antes da viagem.

# text
seg-33fc47100aa6 = Caminhos publicados

# text
# c1: kshana-trust
seg-f032afe8b331 = Cada época atualiza (fonte <c1/>):

# text
seg-b809eaf502ad = Caminho

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> ou <c4/>

# text
# c1: null
seg-d4d4d5d5ec1f = { "0" } a { "100" }, ou <c1/> durante a calibração

# text
# c1: [{monitor, points}]
seg-5280497b5d9f = <c1/>, o maior primeiro: quais verificações reduziram a pontuação

# text
seg-6089a3166c91 = os monitores atualmente acima do seu limite

# text
# c1: off
# c2: passed
# c3: withheld
# c4: null
# c5: $PKSHT
seg-55280b62eb19 = <c1/>, <c2/> ou <c3/> (quando um gate está em execução em outro lugar; <c4/> de <c5/> quando ausente)

# text
# c1: {latitude, longitude, altitude}
# c2: $PKSHT
# c3: kshana
# c4: navigation.position
seg-963da9c0d2a3 = <c1/>: a posição que o receptor sob teste informou naquela época (esquema JSON { "1.1" } ou posterior; não publicada quando o fluxo não traz nenhuma, por exemplo a partir de <c2/> ou de um <c3/> mais antigo). <b>Apenas contexto de confiança</b>: o plugin nunca grava <c4/>, de modo que o caminho de posição da própria embarcação permanece intacto

# text
# c1: {state, method, message}
seg-50599cef740d = emitida quando o estado muda: <c1/>

# text
# c1: score
# c2: reasons[].points
seg-ad58b4599f78 = O plugin também envia metadados do Signal K para esses caminhos uma vez, no início. <c1/> é a pontuação de confiança de { "0" } a { "100" } do Kshana, uma pontuação e não uma razão nem uma probabilidade, portanto não tem unidade SI; seus metadados informam a faixa, uma descrição e zonas que seguem os limiares abaixo. <c2/> são pontos de pontuação subtraídos dessa pontuação de { "0" } a { "100" }.

# text
# c1: normal
# c2: alert
# c3: warn
# c4: alarm
# c5: normal
# c6: null
# c7: null
# c8: normal
# c9: warn
# c10: alarm
# c11: method: ["visual","sound"]
# c12: clearAfterEpochs
# c13: staleAfterS
# c14: $PKSHT
# c15: alarms
seg-bf0c90f5c02a = A notificação é <c1/>, <c2/>, <c3/> ou <c4/>. Ela é encerrada publicando o estado <c5/>, não <c6/>: um consumidor que só trata <c7/> como encerrada deve tratar <c8/> como encerrada também. Por padrão, a faixa <b>degraded</b> resulta em <c9/> e a faixa <b>untrusted</b> resulta em <c10/>, com <c11/>. Ela é reduzida após <c12/> épocas em um estado melhor. Se nenhuma época chegar por <c13/> segundos, ela avisa que a pontuação não está sendo atualizada. A calibração nunca gera notificação. A fonte <c14/> não traz lista <c15/> (a sentença tem apenas a faixa, a pontuação e os dois principais motivos).

# text
seg-89cdf02b58e3 = Configuração (todos os limiares)

# text
seg-d7bdd78470ec = o executável (modos spawn). <b>Ele executa qualquer executável como o usuário do servidor</b>: somente um administrador do servidor Signal K deveria poder alterar a configuração do plugin

# text
seg-73091c431bcf = os limites da embarcação, os limiares e os pesos da pontuação (modos spawn)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: spawn-args
# c3: --replay
# c4: spawn-signalk-nmea
# c5: --gate
# c6: --listen
# c7: --json
# c8: --pksht
# c9: kshana
# c10: spawn-signalk-nmea
# c11: --stdin
# c12: --file
# c13: --tcp
# c14: --udp
# c15: --follow
# c16: --from-end
seg-f5f08c50abc7 = argumentos acrescentados a <c1/> nos dois modos spawn: a entrada para <c2/>, opções extras como <c3/> (um registro armazenado alimentado mais rápido que o tempo real) para <c4/>. O plugin recusa <c5/>, <c6/>, <c7/> e <c8/> (ele lê o JSON de <c9/> na saída padrão) e, para <c10/>, também as opções de entrada (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

# text
# c1: tcp-pksht
seg-01caf7ed213f = Modos TCP (o gate atende em { "10110" }: defina a porta para <c1/>)

# text
# c1: band
# c2: score
seg-72b911dea6bd = <c1/>: a faixa que o Kshana informa, com os limites no arquivo de sessão. <c2/>: as duas pontuações abaixo

# text
# c1: score
# c2: degradedState
seg-76ca56821979 = Modo <c1/>: abaixo deste valor o estado é <c2/> (limite padrão do Kshana para nominal)

# text
# c1: score
# c2: alarm
seg-429d8fc4570f = Modo <c1/>: abaixo deste valor o estado é <c2/> (limite padrão do Kshana para degraded)

# text
# c1: normal
# c2: alert
# c3: warn
seg-6d5c9e402211 = estado para a faixa degraded: <c1/>, <c2/> ou <c3/>

# text
seg-e88a2979ef07 = épocas consecutivas em um estado pior antes de a notificação ser emitida

# text
seg-0eec67224385 = épocas consecutivas em um estado melhor antes de ela ser reduzida

# text
# c1: 0
seg-76b52e312539 = avisa quando nenhuma época chega por esse tempo; <c1/> desativa

# text
seg-87d3fcf7fec9 = métodos de notificação

# text
seg-9a455cf4a2f9 = O plugin não faz gate: nunca altera uma posição. Marcar uma posição como inválida para um sistema de carta é o gate, abaixo.

# text
# c1: node:test
# c2: 127.0.0.1
# c3: $PKSHT
# c4: kshana receiver-trust live
seg-30f48b177c1c = <c1/>, sem dependências, sem rede além de <c2/>. Os testes interpretam e reproduzem um trecho de 66 épocas das linhas JSON e das sentenças <c3/> que <c4/> gravou para a demonstração sintética do Báltico (dados inventados, somente texto), verificam a concordância entre os dois formatos, o comportamento de retenção e de encerramento, o modo de pontuação, a obsolescência e os três caminhos de entrada contra um fluxo local e um processo filho substituto. Esses testes não iniciam um servidor Signal K real; uma execução roteirizada separada o faz, veja abaixo.

# text
seg-024928983177 = Execução em um servidor Signal K real

# text
# c1: integrations/signalk/evidence/
# c2: signalk-server
# c3: kshana
# c4: reportedPosition
# c5: navigation.position
seg-80b5a217d13c = <c1/> contém um script que carrega o plugin no pacote <c2/> { "2.33.0" } fixado (em um namespace de rede privado apenas de loopback) e registra o que as próprias APIs REST e WebSocket do servidor mostram. Os caminhos de confiança aparecem, a notificação passa por warn, alarm, normal (após a retenção) e warn novamente quando os dados cessam e, com o <c3/> real alimentado pela própria entrada NMEA do servidor, ele também publicou <c4/>, nunca <c5/>. Uma versão do servidor, uma execução, nenhuma embarcação real; limites e reprodução no README das evidências.

# text
# c1: kshana receiver-trust live --gate
seg-fea2e7d140c3 = O OpenCPN lê NMEA da rede, e <c1/> pode servir o fluxo filtrado por gate em uma porta TCP por conta própria.

# text
seg-92981e13bc6f = Recomendado: a conexão direta.

# text
# c1: some-nmea-source
# c2: stty
# c3: cat
# c4: --tcp
# c5: --udp
# c6: kshana
# c7: kshana-gate.service
# c8: --listen tcp:<port>
seg-e6caa4d53b9a = (<c1/> é a porta serial do receptor lida com <c2/> e <c3/>, um multiplexador ou as entradas <c4/>/<c5/> do próprio <c6/>; o <c7/> da compilação de referência faz isso sob o systemd.) <c8/> se associa ao endereço de loopback; qualquer número de clientes somente leitura pode se conectar, e um que não consiga acompanhar é desconectado sem atrasar os demais.

# text
seg-311e4379acf1 = Alternativa: o relay.

# text
# c1: integrations/opencpn/nmea-tcp-relay.mjs
# c2: kshana
# c3: --listen
seg-11b4c4791f55 = <c1/> é um distribuidor em Node sem dependências que faz o mesmo para um <c2/> sem <c3/>, ou serve qualquer outro fluxo de linhas (a opção de contêiner o usa para as épocas em JSON):

# text
seg-93cb82966313 = Ele encaminha os bytes sem alteração, apenas linhas inteiras, e desconecta um cliente que não lê. Prefira a conexão direta: um processo a menos na cadeia.

# text
# c1: 127.0.0.1
# c2: 10110
# c3: $PKSHT
# c4: 0
# c5: V
# c6: $PKSHT
seg-4226afc6175c = No OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protocolo <b>TCP</b>, endereço <c1/>, porta <c2/>, direção <b>Input</b>. Enquanto a confiança não está colapsada, o fluxo é o do próprio receptor, mais uma sentença <c3/> por ciclo. Enquanto está colapsada, o GGA encaminhado tem qualidade <c4/>, o RMC tem status <c5/> e os indicadores de modo dizem que não há posição, com checksums recalculados: o equipamento vê o próprio receptor declarar a posição inválida e aciona o seu próprio alarme. As sentenças <c6/> são visíveis na janela de depuração NMEA do OpenCPN (Options, Connections, "NMEA debug window"). Os campos de posição ficam como foram recebidos.

# text
# c1: MARITIME-TRUST.md
seg-8549d49f1b2c = Leia "Gate mode" em <a1><c1/></a1> antes de confiar nisto: ele é opcional, acrescenta latência (um ciclo é retido até que sua época seja pontuada), é um ponto único na cadeia e pode reter uma boa posição, assim como deixar passar uma falsificada.

# text
# c1: test/relay.test.mjs
# c2: kshana receiver-trust live --gate
# c3: $PKSHT
# c4: W
seg-533a911141d6 = <c1/> reproduz um trecho gravado do fluxo sintético filtrado por gate ({ "186" } sentenças em torno do momento em que a confiança colapsa, gravadas por <c2/>) pelo relay, por um socket TCP real, e verifica o que um consumidor recebe: o fluxo byte a byte sob fragmentação arbitrária; checksums válidos em toda sentença, inclusive nas reescritas; GGA e RMC concordando, válidos e depois inválidos, sem oscilação; um <c3/> por ciclo, com seu campo de gate <c4/> exatamente onde a posição é inválida; dois consumidores idênticos; nenhuma linha parcial encaminhada. Isso verifica o fluxo entregue ao OpenCPN, não a tela do próprio OpenCPN.

# text
# c1: kshana
seg-12fc91a3f69b = Uma verificação de ponta a ponta com o binário real, que não faz parte dos testes padrão (exige um <c1/> compilado):

# text
# c1: $PKSHT
seg-fea419a50c52 = Ambas executam a demonstração sintética de uma hora e verificam que a posição passa a válida e depois a inválida, com um <c1/> por época.

# text
seg-e76c11d8f003 = Plugin nativo

# text
# c1: integrations/opencpn/plugin/
# c2: $PKSHT
# c3: ctest
# c4: $PKSHT
# c5: integrations/opencpn/evidence/
# c6: README.md
# c7: LICENSING.md
seg-7a5ac2d2f229 = <c1/> é um painel de pontuação para o OpenCPN (pontuação, faixa, gate, principais motivos, um alerta quando a confiança passa a untrusted) que lê <c2/> do próprio fluxo NMEA do OpenCPN, de modo que não precisa de nenhuma conexão além da acima. É compilado com CMake contra o cabeçalho da API de plugins do OpenCPN (incorporado, com seu commit de origem) e o wxWidgets; <c3/> executa os testes de lógica sem wx e verifica se a biblioteca exporta os pontos de entrada que o OpenCPN procura. Foi executado dentro do OpenCPN { "5.8.4" } sob uma tela virtual com o fluxo sintético filtrado por gate (o OpenCPN entregou <c4/> ao plugin, o painel ficou vermelho e a posição do próprio OpenCPN congelou quando o gate entrou em ação; capturas de tela, registro e script em <c5/>), mas não em um desktop real, em outras versões ou em outras plataformas, e não está empacotado para o gerenciador de plugins do OpenCPN. Veja o <a1><c6/></a1> do plugin. Ele é licenciado sob GPL-3.0-or-later, ao contrário do restante do repositório (<a2><c7/></a2>).

# text
# c1: integrations/opencpn/evidence/
# c2: README.md
seg-a2adfa7ff5fb = Capturas de tela dessa execução, em <c1/> (uma execução, OpenCPN { "5.8.4" } sob uma tela virtual, dados sintéticos; <a1><c2/></a1> indica os limites):

# attr:alt
seg-ee5e8bb5a734 = A janela de carta do OpenCPN executando o plugin de painel de pontuação do Kshana sobre o fluxo sintético filtrado por gate, antes do colapso da confiança: nenhum painel está aberto (ele se abre sozinho no alarme), a posição do navio na barra de status indica { "54" } { "32.4659" } N { "018" } { "46.1670" } E com velocidade de { "16.48" } kn e rumo de { "088" }, e o indicador de posição no canto superior direito mostra três barras.

# attr:alt
seg-1189d82affbb = A mesma janela do OpenCPN após o colapso: o painel do Kshana está aberto em vermelho com a pontuação { "47" } e a palavra UNTRUSTED, as linhas gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 e idade de { "2" } s, e a declaração de que se trata de software de caráter consultivo, não de um equipamento de navegação homologado, e de que o operador continua responsável. A barra de status ainda indica { "54" } { "32.4672" } N { "018" } { "46.2227" } E, e o indicador de posição caiu para duas barras.

# attr:alt
seg-90c7cdee8892 = OpenCPN alimentado diretamente por kshana receiver-trust live --gate --listen: o painel do Kshana está aberto em vermelho com a pontuação { "44" } e UNTRUSTED, as linhas gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 e idade de { "1" } s, e a declaração consultiva. Esta execução não sustenta a observação do congelamento da posição: o OpenCPN ainda estava processando a rajada inicial de épocas.

# text
seg-dce06383cde1 = Elas mostram a instalação e a posição filtrada por gate chegando ao OpenCPN, não que qualquer alarme seja oportuno ou correto para uma embarcação real. Software de caráter consultivo, não um equipamento homologado.

# text
# c1: deploy/reference-build/
# c2: deploy/reference-build/check-units.sh
# c3: systemd-analyze verify
seg-f9f39d089438 = <a1><c1/></a1>: uma lista genérica de peças, a configuração do SO, duas unidades systemd (o monitor consultivo e o gate opcional), uma opção de contêiner e a ligação com o Signal K. <c2/> executa <c3/> nas unidades sem iniciar nada.

# text
# c1: MARITIME-TRUST.md
seg-5e2a2e8af941 = A pontuação vale tanto quanto as verificações por trás dela, que examinam a física de um navio e seus outros sensores; uma falsificação autoconsistente com um relógio coerente não é vista por monitores apenas de NMEA (<a1><c1/></a1>). A ausência de alarme não é evidência de uma boa posição.

# text
seg-be1ed291f7c3 = Nenhum número desta página é uma taxa de detecção ou de falso alarme medida. Os testes acima verificam a instalação em texto sintético; nada dizem sobre o desempenho de qualquer monitor diante de interferência real.

# text
seg-97d775b504c6 = Não homologado; o operador continua responsável.

# text
seg-69222f7d5068 = <s1>Anterior</s1>Mapa de interferência: fontes de dados e licenças

# text
seg-8eba9835d7df = <s1>Próximo</s1>Geometria do céu e linhas do horizonte

# text
seg-2093a1d8a24e = De onde vêm as épocas (fonte)
