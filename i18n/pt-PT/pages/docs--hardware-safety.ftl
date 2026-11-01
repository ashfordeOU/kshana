# docs--hardware-safety: translations (pt-PT)

# text
seg-fdbb9db68f1d = none

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Fonte: <c1/>

# text
seg-10c7eaab58c5 = Segurança do hardware: o que o Kshana faz com o hardware e o que nunca faz

# text
seg-fe4873962140 = <b>Estado: revisão jurídica pelo proprietário pendente.</b> As notas jurídicas abaixo são a leitura que os responsáveis pela manutenção fazem de fontes públicas, escritas para que um utilizador saiba onde estão os limites. Não são aconselhamento jurídico, não foram revistas por um advogado e a lei difere de país para país. Leia-as como um motivo para consultar um advogado, não como uma permissão.

# text
seg-bd2fbb355834 = Software de caráter consultivo para investigação, simulação e ensaio. Não é um equipamento homologado e não classifica nem aprova um recetor, um relógio ou um laboratório. Ver a declaração consultiva no README.

# text
seg-f27c286787b1 = A regra

# text
seg-88638e41faab = A receção é o produto. A transmissão nunca faz parte do motor aberto.

# text
seg-614d381dd0d0 = O Kshana não contém qualquer código que controle um transmissor. Não existe nenhum caminho de transmissão SDR (nenhuma chamada de transmissão UHD, HackRF, bladeRF ou Soapy), e nenhuma forma de onda de jamming ou de spoofing é escrita num ficheiro destinado a reprodução.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Os ficheiros que o Kshana escreve (cenas IQ, gravações SigMF e ION <c1/>, exportações NMEA e de bench) descrevem sinais ou movimento <b>simulados e legítimos</b>, e os metadados que o Kshana escreve para uma cena indicam que foi escrita por <c2/> (o comentário ION <c3/> indica que se trata de uma cena simulada, não de uma gravação).

# text
seg-8ce652bc1af6 = Quando uma experiência necessita de RF numa bancada, é o <b>equipamento do próprio operador</b> que a produz, no recinto do próprio operador, sob a autorização do próprio operador. O Kshana regista o que o operador afirma ter sido feito e nunca o infere.

# text
seg-c74fc5d82071 = Fases

# text
seg-01e7633921dc = Cada fase indica o que o Kshana faz, que equipamento está envolvido, quem emite RF (se alguém o fizer) e a condição que tem de se verificar antes de o Kshana tratar o resultado como evidência.

# text
seg-324e16b11186 = Fase

# text
seg-bb269645d988 = Papel do Kshana

# text
seg-76c0861cbe83 = Equipamento

# text
seg-92ab27525ed1 = Emissão de RF

# text
seg-c822f981cfcf = Condição

# text
seg-00727bb577f9 = Estado na { "0.38" }

# text
seg-1c566ec98a03 = Ficheiros: registos de reprodução, IQ, exportações de bench, NMEA ou UBX em direto através de stdin, TCP ou UDP

# text
seg-0435986aa760 = incluída

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Receção passiva: recetores só de leitura; registos de temporização (linuxptp, chrony, TICC); CSV de IMU; <c1/> num ficheiro SigMF em crescimento

# text
seg-608fc0a99107 = os recetores, o grandmaster e o SDR em receção do utilizador

# text
# c1: --configure
seg-786d9e5ccf93 = qualquer escrita de configuração num recetor exige um <c1/> explícito; a predefinição é só de leitura

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = parcialmente incluída: formatos de registos de temporização, <c1/>, <c2/>; a entrada de recetor série está prevista

# text
seg-6b0a194d3f64 = Orquestração de laboratório sem RF do Kshana: uma especificação das condições de ensaio, passos do operador (retirar a antena, iniciar o simulador) pedidos e com marca temporal, pontuação de ida e volta e evidências

# text
seg-8e2847bce9ac = simuladores do laboratório, caixas blindadas

# text
seg-121fe22c92ec = apenas pelo simulador <b>do laboratório</b>, por condução

# text
# c1: lab-attestation
seg-0a704c5443c5 = um <c1/> assinado (abaixo) registado no pacote de evidências; o Kshana recusa pontuar uma execução de laboratório sem ele

# text
seg-9e94d44cd197 = o registo está implementado nos pacotes de evidências; a recusa de pontuar sem ele ainda não (não existe nenhum comando de execução de laboratório)

# text
seg-ee5333e346ad = Reprodução por condução de cenas IQ GNSS <b>legítimas</b>: o Kshana escreve o ficheiro da cena e o utilizador reproduz-o com a sua própria ferramenta, através de um cabo com atenuadores e de um dispositivo em ensaio num recinto de RF

# text
seg-fa5b0f1b41f7 = o SDR, os atenuadores e o recinto do utilizador

# text
seg-9049203a2a6e = apenas por condução, da responsabilidade do utilizador

# text
seg-b4392e583cb8 = nenhum código de transmissão no motor aberto; as formas de onda de interferência e de spoofing ficam fora do âmbito; revisão de controlo de exportações; assessoria jurídica

# text
seg-ced2afbf108f = não consta do motor aberto; um item da edição comercial a tratar com assessoria jurídica

# text
seg-0f8a0fce4d20 = Hardware-in-the-loop de RF em malha fechada e em tempo real

# text
seg-d109f8e36ce8 = equipamento de parceiros

# text
seg-fb26b352f56e = parceiro

# text
seg-38c768d5faa7 = integrar antes através da especificação da fase { "2" }

# text
seg-458f37b807ba = não prevista

# text
seg-2e59d363e31b = "Incluída" significa que o código consta desta versão. Nada nesta tabela afirma que alguma fase tenha sido utilizada com algum parceiro, laboratório ou autoridade; nenhuma foi.

# text
seg-1524fb5b0aba = Princípios

# text
seg-82b8ed15bbe6 = A receção é o produto, e a transmissão nunca consta do código aberto.

# text
seg-63c000eccfc2 = Cada sessão de hardware produz um pacote de evidências com os hashes das entradas, das condições e dos limiares utilizados.

# text
seg-63cc5d9513ff = Uma atestação de condução ou de blindagem é registada, nunca inferida.

# text
seg-da1e4f5da956 = Os números provenientes de hardware permanecem <b>MODELLED</b> até que uma referência independente externa concorde (por exemplo, uma trajetória de referência de laboratório ou um relógio de referência). Um limiar fixado antecipadamente não é afrouxado depois de uma execução.

# text
seg-d8e445427d02 = As antenas com diagramas controlados, as unidades inerciais e os relógios atómicos à escala de chip são tratados como fontes de dados (diagramas, registos, curvas de estabilidade publicadas), e não como dispositivos que o Kshana controla.

# text
seg-7a22a9591fa3 = Formulação: um resultado é "medido face à máscara" ou "fornece elementos de prova em apoio de" um requisito. O Kshana não afirma que um dispositivo satisfaz uma norma, e ninguém o classificou nem aprovou.

# text
seg-913509e5d6b2 = Notas jurídicas (revisão jurídica do titular pendente)

# text
seg-c18b68936406 = Receber sinais GNSS é legal em quase todo o lado. Transmitir em bandas GNSS não é.

# text
seg-070d8a8d5494 = <b>Estados Unidos.</b> A interferência deliberada em radiocomunicações é proibida ao abrigo de { "47" } U.S.C. §{ "333" }, e a FCC atua contra os jammers (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Uma transmissão a partir de uma bancada pode chegar para além da bancada.

# text
seg-336b48c6f5f2 = <b>Noutros países.</b> Os responsáveis pela manutenção não reviram a legislação de outros países. A comunidade em torno do gps-sdr-sim declara que transmitir a sua saída é proibido por lei na maioria dos países; deve tratar-se isso como pressuposto de trabalho onde a assessoria jurídica não tenha dito o contrário.

# text
seg-8d31cbd38718 = <b>Uma montagem blindada ou por condução é uma salvaguarda, não uma licença.</b> A atestação abaixo regista a salvaguarda que o operador afirma ter estado em vigor. Não torna lícita nenhuma emissão.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Gravação.</b> Gravar sinais de rádio pode suscitar questões de privacidade e de legalidade em alguns locais. O <c1/> e qualquer receita de captura são apenas de receção, e o operador é responsável pelo local e pelo que grava.

# text
seg-2edf9b14e62c = <b>Controlo de exportações.</b> O software de hardware-in-the-loop que controla geradores de sinais pode estar abrangido por regras de controlo de exportações. É por isso que a fase { "3" } fica fora do motor aberto.

# text
seg-bcd59f201022 = <b>Nada aqui constitui um aval ou um acordo.</b> Nenhum regulador, campo de ensaios, laboratório ou fornecedor foi consultado sobre este documento nem acordou seja o que for do seu conteúdo.

# text
# c1: lab-attestation
seg-81091020e648 = O campo <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = Da fase { "2" } em diante, uma execução que envolva equipamento de laboratório inclui um objeto <c1/>, registado no pacote de evidências junto dos hashes das entradas. É uma declaração de um operador identificado, não uma medição, e o Kshana não a verifica.

# text
seg-3bf153c63fa3 = O que está implementado na { "0.38" }:

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> valida o ficheiro e regista a atestação no <c2/> do pacote. O manifesto é coberto pela assinatura Ed25519 do pacote, pelo que o registo não pode ser editado sem quebrar a verificação. O mesmo está disponível como argumento <c3/> do <c4/> de Python e como argumento <c5/> da ferramenta MCP <c6/> (a versão de navegador não cria pacotes).

# text
seg-431036f13a37 = Um pacote criado sem atestação é, byte a byte, o que era antes.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> comunica a atestação e indica que é "atestada pelo operador identificado; não verificada pelo Kshana".

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Uma atestação que esteja incompleta, ou cujo <c1/> não seja <c2/> nem <c3/> (uma montagem por via aérea não é aceite como execução de laboratório), é recusada e não é criado nenhum pacote.

# text
seg-c8c40ed88dde = O que <b>não</b> está ainda implementado: a regra da fase { "2" } segundo a qual o Kshana recusa <em>pontuar</em> uma execução de laboratório sem atestação. Nenhum comando aceita uma opção de execução de laboratório na { "0.38" }, pelo que não há nada a recusar; a regra chegará com os comandos de orquestração de laboratório. Uma atestação regista a declaração do operador sobre uma salvaguarda. Não torna lícita nenhuma emissão e não altera a etiqueta de um resultado: uma execução de laboratório pontuada é MODELLED, a menos que uma referência independente externa concorde.

# text
seg-b0db377bce58 = O que isto significa para quem contribui

# text
seg-c2e215edd86c = Não adicione ao motor aberto um caminho de transmissão, uma dependência de transmissão nem um exemplo de transmissão.

# text
seg-452b44a9ca8a = Não adicione um gerador de formas de onda cuja saída seja um sinal de jamming ou de spoofing destinado a reprodução.

# text
seg-4df4d15a5f1c = As novas entradas de hardware são só de leitura por predefinição; uma escrita exige uma opção explícita e uma linha neste ficheiro.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Um novo comando que toque em hardware consta de todas as superfícies ou é marcado como N/A com uma justificação em <a1><c1/></a1>, e indica aqui a sua fase.

# text
seg-7d65c3565acd = <s1>Anterior</s1>Formatos de registos de relógio

# text
seg-82eb53d4efbd = <s1>Seguinte</s1>Integridade e segurança

# text
seg-8a78e520fc9e = O campo de atestação de laboratório
