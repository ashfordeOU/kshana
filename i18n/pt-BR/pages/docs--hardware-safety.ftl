# docs--hardware-safety: translations (pt-BR)

# text
seg-fdbb9db68f1d = nenhuma

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Fonte: <c1/>

# text
seg-10c7eaab58c5 = Segurança de hardware: o que o Kshana faz com hardware e o que ele nunca faz

# text
seg-fe4873962140 = <b>Situação: revisão jurídica pelo titular pendente.</b> As notas jurídicas abaixo são a leitura dos mantenedores de fontes públicas, escritas para que um usuário saiba onde estão os limites. Não são aconselhamento jurídico, não foram revisadas por um advogado e a lei difere de país para país. Leia-as como um motivo para consultar um advogado, não como uma permissão.

# text
seg-bd2fbb355834 = Software de caráter consultivo para investigação, simulação e ensaio. Não é um equipamento homologado e não classifica nem aprova um receptor, um relógio ou um laboratório. Veja a declaração consultiva no README.

# text
seg-f27c286787b1 = A regra

# text
seg-88638e41faab = Receber é o produto. Transmitir nunca está no motor aberto.

# text
seg-614d381dd0d0 = O Kshana não contém nenhum código que acione um transmissor. Não há caminho de transmissão SDR (nenhuma chamada de transmissão de UHD, HackRF, bladeRF ou Soapy), e nenhuma forma de onda de jamming ou spoofing é gravada em um arquivo destinado à reprodução.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Os arquivos que o Kshana grava (cenas IQ, gravações SigMF e ION <c1/>, exportações NMEA e de bench) descrevem sinais ou movimento <b>simulados e legítimos</b>, e os metadados que o Kshana grava para uma cena dizem que ela foi escrita por <c2/> (o comentário do ION <c3/> diz que é uma cena simulada, não uma gravação).

# text
seg-8ce652bc1af6 = Onde um experimento precisa de RF em um bench, o <b>equipamento do próprio operador</b> a produz, no invólucro do próprio operador, sob a autorização do próprio operador. O Kshana registra o que o operador diz que foi feito e nunca o infere.

# text
seg-c74fc5d82071 = Etapas

# text
seg-01e7633921dc = Cada etapa indica o que o Kshana faz, qual hardware está envolvido, quem emite RF (se alguém emite) e o gate que precisa ser satisfeito antes que o Kshana trate o resultado como evidência.

# text
seg-324e16b11186 = Etapa

# text
seg-bb269645d988 = Papel do Kshana

# text
seg-76c0861cbe83 = Hardware

# text
seg-92ab27525ed1 = Emissão de RF

# text
seg-c822f981cfcf = Gate

# text
seg-00727bb577f9 = Situação na { "0.38" }

# text
seg-1c566ec98a03 = Arquivos: logs de reprodução, IQ, exportações de bench, NMEA ou UBX ao vivo por stdin, TCP ou UDP

# text
seg-0435986aa760 = distribuído

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Recepção passiva: receptores somente leitura; logs de temporização (linuxptp, chrony, TICC); CSV de IMU; <c1/> sobre um arquivo SigMF em crescimento

# text
seg-608fc0a99107 = os receptores, o grandmaster e o SDR em recepção do usuário

# text
# c1: --configure
seg-786d9e5ccf93 = qualquer escrita de configuração em um receptor exige um <c1/> explícito; o padrão é somente leitura

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = distribuído em parte: formatos de log de temporização, <c1/>, <c2/>; a entrada serial de receptor está planejada

# text
seg-6b0a194d3f64 = Orquestração de laboratório sem RF do Kshana: uma especificação de condições de teste, passos do operador (retirada da antena, início do simulador) solicitados e com carimbo de tempo, pontuação de ida e volta e evidência

# text
seg-8e2847bce9ac = simuladores do laboratório, caixas blindadas

# text
seg-121fe22c92ec = apenas pelo simulador <b>do laboratório</b>, conduzida

# text
# c1: lab-attestation
seg-0a704c5443c5 = um <c1/> assinado (abaixo) registrado no pacote de evidências; o Kshana recusa pontuar uma execução de laboratório sem ele

# text
seg-9e94d44cd197 = o registro está implementado nos pacotes de evidências; a recusa de pontuar sem ele ainda não está (não existe nenhum comando de execução de laboratório)

# text
seg-ee5333e346ad = Reprodução conduzida de cenas IQ GNSS <b>legítimas</b>: o Kshana grava o arquivo de cena, e o usuário o reproduz com sua própria ferramenta em um cabo com atenuadores e um dispositivo sob teste em um invólucro de RF

# text
seg-fa5b0f1b41f7 = o SDR, os atenuadores e o invólucro do usuário

# text
seg-9049203a2a6e = apenas conduzida, sob responsabilidade do usuário

# text
seg-b4392e583cb8 = nenhum código de transmissão no motor aberto; as formas de onda de interferência e de spoofing ficam fora do escopo; revisão de controle de exportação; assessoria jurídica

# text
seg-ced2afbf108f = não está no motor aberto; um item da edição comercial a ser feito com assessoria jurídica

# text
seg-0f8a0fce4d20 = Hardware-in-the-loop de RF em malha fechada e em tempo real

# text
seg-d109f8e36ce8 = equipamento do parceiro

# text
seg-fb26b352f56e = parceiro

# text
seg-38c768d5faa7 = integre-se pela especificação da etapa { "2" }

# text
seg-458f37b807ba = não planejado

# text
seg-2e59d363e31b = "Distribuído" significa que o código está nesta versão. Nada nesta tabela diz que alguma etapa tenha sido usada com algum parceiro, laboratório ou autoridade; nenhuma foi.

# text
seg-1524fb5b0aba = Princípios

# text
seg-82b8ed15bbe6 = Receber é o produto, e transmitir nunca está no código aberto.

# text
seg-63c000eccfc2 = Toda sessão de hardware gera um pacote de evidências com hashes das entradas, das condições e dos limiares usados.

# text
seg-63cc5d9513ff = Uma atestação de condição conduzida ou blindada é registrada, nunca inferida.

# text
seg-da1e4f5da956 = Os números que vêm de hardware permanecem <b>MODELLED</b> até que uma referência independente externa concorde (por exemplo, uma trajetória de verdade de laboratório ou um relógio de referência). Um limiar fixado antecipadamente não é afrouxado depois de uma execução.

# text
seg-d8e445427d02 = Antenas com padrões controlados, unidades inerciais e relógios atômicos em escala de chip são tratados como fontes de dados (padrões, logs, curvas de estabilidade publicadas), não como dispositivos que o Kshana aciona.

# text
seg-7a22a9591fa3 = Redação: um resultado é "medido em relação à máscara" ou "fornece evidências em apoio de" um requisito. O Kshana não diz que um dispositivo atinge um padrão, e ninguém o classificou nem o aprovou.

# text
seg-913509e5d6b2 = Notas jurídicas (revisão jurídica do titular pendente)

# text
seg-c18b68936406 = Receber sinais GNSS é legal em quase toda parte. Transmitir em bandas GNSS não é.

# text
seg-070d8a8d5494 = <b>Estados Unidos.</b> A interferência deliberada em radiocomunicações é vedada pelo { "47" } U.S.C. §{ "333" }, e a FCC age contra jammers (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Uma transmissão a partir de um bench pode alcançar além do bench.

# text
seg-336b48c6f5f2 = <b>Em outros lugares.</b> Os mantenedores não revisaram a legislação de outros países. A comunidade em torno do gps-sdr-sim declara que transmitir sua saída é proibido por lei na maioria dos países; trate isso como a hipótese de trabalho onde um advogado não tenha dito o contrário.

# text
seg-8d31cbd38718 = <b>Uma montagem blindada ou conduzida é uma salvaguarda, não uma licença.</b> A atestação abaixo registra a salvaguarda que o operador diz que estava em vigor. Ela não torna lícita uma emissão.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Gravação.</b> Gravar sinais de rádio pode levantar questões de privacidade e de legalidade em alguns lugares. <c1/> e qualquer receita de captura são apenas de recepção, e o operador é responsável por onde e o que grava.

# text
seg-2edf9b14e62c = <b>Controle de exportação.</b> Software de hardware-in-the-loop que aciona geradores de sinal pode se enquadrar em regras de controle de exportação. É por isso que a etapa { "3" } fica fora do motor aberto.

# text
seg-bcd59f201022 = <b>Nada aqui é um endosso ou um acordo.</b> Nenhum regulador, campo de testes, laboratório ou fornecedor foi consultado sobre este documento nem concordou com qualquer coisa nele.

# text
# c1: lab-attestation
seg-81091020e648 = O campo <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = Da etapa { "2" } em diante, uma execução que envolveu equipamento de laboratório traz um objeto <c1/>, registrado no pacote de evidências ao lado dos hashes das entradas. É uma declaração de um operador nomeado, não uma medição, e o Kshana não a verifica.

# text
seg-3bf153c63fa3 = O que está implementado na { "0.38" }:

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> valida o arquivo e registra a atestação no <c2/> do pacote. O manifesto é coberto pela assinatura Ed25519 do pacote, de modo que o registro não pode ser editado sem quebrar a verificação. O mesmo está disponível como o argumento <c3/> do <c4/> em Python e o argumento <c5/> da ferramenta <c6/> do MCP (a versão para navegador não cria pacotes).

# text
seg-431036f13a37 = Um pacote feito sem uma atestação é, byte a byte, o que era antes.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> informa a atestação e diz que ela é "attested by the named operator; not verified by Kshana".

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Uma atestação incompleta, ou cujo <c1/> não seja nem <c2/> nem <c3/> (uma montagem pelo ar não é aceita como execução de laboratório), é recusada e nenhum pacote é gerado.

# text
seg-c8c40ed88dde = O que <b>não</b> está implementado ainda: a regra da etapa { "2" } segundo a qual o Kshana recusa <em>pontuar</em> uma execução de laboratório que não tem atestação. Nenhum comando aceita um sinalizador de execução de laboratório na { "0.38" }, de modo que não há nada a recusar; a regra chega com os comandos de orquestração de laboratório. Uma atestação registra a declaração do operador sobre uma salvaguarda. Ela não torna lícita nenhuma emissão e não altera o rótulo de um resultado: uma execução de laboratório pontuada é MODELLED, a menos que uma referência independente externa concorde.

# text
seg-b0db377bce58 = O que isto significa para um contribuidor

# text
seg-c2e215edd86c = Não adicione um caminho de transmissão, uma dependência de transmissão nem um exemplo de transmissão ao motor aberto.

# text
seg-452b44a9ca8a = Não adicione um gerador de forma de onda cuja saída seja um sinal de jamming ou de spoofing destinado à reprodução.

# text
seg-4df4d15a5f1c = As novas entradas de hardware são somente leitura por padrão; uma escrita exige um sinalizador explícito e uma linha neste arquivo.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Um novo comando que toca hardware vai em toda superfície ou é marcado N/A com um motivo em <a1><c1/></a1>, e declara aqui sua etapa.

# text
seg-7d65c3565acd = <s1>Anterior</s1>Formatos de log de relógio

# text
seg-82eb53d4efbd = <s1>Próxima</s1>Integridade e segurança

# text
seg-8a78e520fc9e = O campo lab-attestation
