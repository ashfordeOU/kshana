# docs--timing-hil: translations (pt-BR)

# text
seg-f8cf777c0caa = Superfícies

# text
seg-f2ce7fc60cdf = Formato

# text
seg-d00b65801e9b = Passo

# attr:alt
seg-0d580ea8043d = Um teste de holdover pontuado a partir de um registro de erro de tempo, a partir de uma execução real do motor v{ $version } sobre scenarios/holdover-test-example.toml ({ "601" } amostras a cada { "5" } s). O GNSS é removido pelo operador em { "600" } s e restaurado em { "2400" } s; o erro de tempo deriva até { "299" } ns ao fim do holdover, ultrapassando o orçamento de { "100" } ns após { "675" } s, e volta para dentro da faixa de { "100" } ns { "70" } s após a restauração. Veredictos: máscaras de linha de base PASS, máscaras de holdover FAIL, envelope de holdover FAIL, recuperação RECOVERED. Medido contra a máscara, não uma aprovação. Os horários são a declaração do operador, não verificados pelo Kshana. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# text
# c1: docs/TIMING-HIL.md
seg-7a1246297c82 = Fonte: <c1/>

# text
seg-6ea3dec83080 = Hardware-in-the-loop de temporização: retire a antena, pontue o holdover

# text
# c1: holdover-test
# c2: scenarios/holdover-test-example.toml
# c3: scenarios/holdover-test-ptp4l.toml
seg-5901f0b26939 = Operadores de telecomunicações e de energia testam um sistema de temporização retirando-lhe o GNSS e observando o que o relógio faz. O Kshana não faz isso por eles e não toca em seus equipamentos. Ele lê o registro de erro de tempo que os instrumentos do próprio operador produziram, divide-o nos dois instantes que o operador declara e <b>mede cada etapa contra máscaras públicas da ITU-T</b>. O tipo de cenário é <a1><c1/></a1>; os cenários de exemplo são <c2/> e <c3/>.

# text
# c1: HARDWARE-SAFETY.md
seg-daf4b071bad0 = Este é o <b>estágio { "1" }</b> de segurança de hardware: passivo, somente recepção, sem RF do Kshana (<a1><c1/></a1>). Software de caráter consultivo, não um equipamento homologado. Ninguém classificou, aprovou ou revisou este procedimento, e ele nada diz sobre se um sistema satisfaz uma Recomendação.

# text
seg-da0c48bbe011 = O procedimento

# text
seg-e753ca7a1c99 = O operador executa quatro etapas. O Kshana não executa nenhuma delas.

# text
seg-0c338b956741 = O que o operador faz

# text
seg-ebd95b343349 = O que o registro mostra

# text
seg-03999de98059 = { "1" }. Linha de base

# text
seg-730f2037d22a = Deixa o sistema operar travado no GNSS pelo tempo que o teste exigir (e anota por quantos dias ele estava travado antes).

# text
seg-f45aae4139bd = O erro de tempo enquanto disciplinado.

# text
seg-0f050dcede80 = { "2" }. GNSS removido

# text
seg-50c0df832eda = Remove o GNSS do sistema sob teste, por exemplo o cabo da antena no receptor ou a saída do simulador do próprio laboratório, e <b>anota o horário</b>. Consulte antes o manual do fabricante do receptor: alguns receptores alimentam a antena, e alguns precisam de um terminador na porta aberta.

# text
seg-e371e7e357e3 = O momento em que o erro de tempo começa a divagar (wander).

# text
seg-f05dc0acb396 = { "3" }. Holdover

# text
seg-a98186503e0f = Deixa o sistema em seu próprio oscilador pelo tempo planejado.

# text
seg-1da66cdca856 = O holdover do sistema.

# text
seg-61197c9bad91 = { "4" }. Recuperação

# text
seg-75af1f4fec83 = Restaura o GNSS e <b>anota o horário</b>.

# text
seg-1259d36fc78c = O erro de tempo voltando (ou não).

# text
seg-c09b1ea8f1a4 = Duas coisas que o operador deve fazer, porque o Kshana não consegue:

# text
seg-31f6c357864b = Declarar os dois instantes.

# text
# c1: gnss_removed_s
# c2: gnss_restored_s
seg-59f9eb10035a = <c1/> e <c2/> são declaração do operador. O Kshana não detecta a remoção a partir do registro e não verifica os instantes. Um horário errado move as fronteiras das etapas e, portanto, o resultado.

# text
seg-6d0d3186fbe3 = <b>Use o mesmo relógio para o registro e para os instantes.</b> Em um registro de relógio, o eixo de tempo começa na primeira leitura, de modo que os dois instantes são segundos a partir da primeira linha do registro.

# text
seg-bd181a831803 = O que registrar

# text
# c1: clock_log
# c2: CLOCK-LOG-FORMATS.md
seg-52758c10be0a = Qualquer um destes, pelos leitores <c1/> existentes (<a1><c2/></a1>):

# text
seg-fef0034cb88b = Instrumento

# text
seg-ad6f33d70f3f = Como o registro é feito

# text
# c1: ptp4l
seg-ef7f547609ad = <c1/> do linuxptp (o servo do relógio escravo ou de fronteira)

# text
# c1: -m
# c2: ptp4l[time]: master offset N sK freq ...
seg-f548a2ae96e5 = execute com <c1/> e guarde as linhas <c2/>

# text
# c1: phc2sys
seg-9a3b58be1b0b = <c1/> do linuxptp

# text
# c1: phc2sys[time]: CLOCK_REALTIME phc offset N sK ...
seg-77255f8f5fef = as linhas <c1/>

# text
# c1: ts2phc
seg-2cf9256bd790 = <c1/> do linuxptp

# text
# c1: ts2phc[time]: /dev/ptpN offset N sK ...
seg-c667a97b92a8 = as linhas <c1/>

# text
# c1: tracking.log
seg-ed305bcea4f8 = <c1/> do chrony

# text
# c1: log tracking
# c2: chrony.conf
seg-021b760aae59 = <c1/> em <c2/>

# text
# c1: statistics.log
seg-a7f2d72a5cb7 = <c1/> do chrony

# text
# c1: log statistics
# c2: chrony.conf
seg-a70952a099d5 = <c1/> em <c2/>

# text
seg-6ad29120ffe7 = um contador TAPR TICC

# text
seg-32f703bfcab7 = modo de marca de tempo contra a referência

# text
seg-6862a9ac9a68 = uma exportação ASCII do TimeLab

# text
seg-b5e7e3a272d6 = fase em uma unidade declarada

# text
seg-8af4aac4426f = um arquivo de relógio RINEX

# text
seg-21d5c43719f2 = um relógio

# text
seg-3a82b5295ab1 = qualquer outra coisa

# text
# c1: samples
# c2: csv_path
seg-6bebda4a3c6c = <c1/> ou <c2/>

# text
# c1: time_s,time_error_ns
seg-9a443cc0c444 = pares <c1/>, amostrados uniformemente

# text
seg-b8d1d45df70b = <b>O que o registro mede importa.</b> Um registro de servo (linuxptp, chrony) grava o deslocamento que o daemon mediu e está corrigindo: é o erro de tempo que sobra sob controle do servo, não uma medição independente do relógio contra o UTC. Durante a etapa de holdover de um teste que realmente remove a referência, um registro de servo ainda mostra o que o daemon acreditava, o que pode diferir do erro verdadeiro. Um TICC ou outro contador contra uma referência independente é o registro mais forte; diga qual você usou ao relatar o resultado.

# text
seg-6d4e25914d1c = O cenário

# text
# c1: budgets
# c2: max_abs_te_ns
# c3: clock = "..."
# c4: [series.clock_log]
seg-ca1244db2387 = Chaves opcionais: <c1/> (nome, <c2/>, fonte; os padrões de telecom-timing quando ausente) e <c3/> dentro de <c4/> para escolher uma fonte em um registro que contém várias.

# text
seg-38eb634b7f8f = O que o relatório contém

# text
# c1: steps
seg-6a64755e11d6 = <b><c1/></b>: para a linha de base, o holdover e a recuperação, o início e o fim, o número de amostras e os valores médio, rms, máximo e final do erro de tempo.

# text
# c1: masks
seg-cd11d0838c44 = <b><c1/></b>: cada máscara que você nomeou, medida na etapa que sua condição indica. Uma máscara escrita para um relógio travado é medida na linha de base; uma escrita para holdover ou para um relógio autônomo, no holdover. Cada verificação traz seu limite, o valor medido, a margem e a tabela da qual foi transcrita. Uma máscara que exige um registro mais longo do que a etapa forneceu é <b>INCOMPLETE</b>, nunca extrapolada; uma que o mecanismo não consegue avaliar para o intervalo de amostragem do registro é <b>NOT-EVALUATED</b>, com o motivo.

# text
# c1: holdover
seg-cb54e67ca4eb = <b><c1/></b>: o desvio fracionário de frequência que o sistema manteve (a inclinação de uma reta de mínimos quadrados pelo erro de tempo do holdover, em ns/s, que são partes por bilhão), o resíduo em torno dessa reta, o maior erro de tempo absoluto e quando ocorreu, e o degrau no momento da remoção.

# text
# c1: holdover_envelope
# c2: locked_duration_days
seg-daa40ac07396 = <b><c1/></b>: o envelope de holdover do ePRTC-A da ITU-T G.8272.1 Tabela { "3" }, a partir de <c2/>, com o instante em que é excedido pela primeira vez.

# text
# c1: budgets
seg-cd480a1bf901 = <b><c1/></b>: o tempo após a remoção em que cada orçamento de erro de tempo é excedido pela primeira vez.

# text
# c1: recovery
# c2: |TE|
seg-007a0393cb39 = <b><c1/></b>: se <c2/> entrou na faixa e permaneceu pelo tempo de permanência, quanto tempo depois do retorno do GNSS isso começou, o pico após a restauração e o maior degrau entre amostras consecutivas durante a recuperação.

# text
# c1: curves
seg-199497dfcc09 = <b><c1/></b>: MTIE e TDEV das etapas de linha de base e de holdover.

# text
# c1: verdicts
seg-ce00a41a322f = <b><c1/></b>: um resumo de uma palavra por etapa.

# text
# c1: units
seg-c09fc305ead1 = Todo número traz sua unidade e sua origem no bloco <c1/> do relatório.

# text
seg-5d87a772c132 = As palavras e os limites

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-0810b24c6f3e = O resultado é <b>medido contra a máscara</b>. As máscaras são transcritas de Recomendações da ITU-T de download gratuito (as mesmas tabelas do tipo de cenário <c1/>, listadas em <a1><c2/></a1>), e toda entrada que as Recomendações deixam "para estudo futuro" está ausente, não preenchida. O Kshana não diz que um relógio ou um sistema satisfaz ou é aprovado em relação a uma Recomendação, e o relatório também não diz.

# text
seg-527189cf37c6 = <b>MODELLED.</b> A lógica de etapas, o ajuste de reta e a regra de recuperação são verificados em registros construídos a partir de fórmulas cujas respostas são conhecidas antes da execução; nenhum holdover de laboratório foi pontuado contra uma referência independente externa, e nenhum parceiro ou laboratório concordou com coisa alguma. Seria necessário um laboratório de temporização antes que qualquer valor por classe de relógio pudesse ser promovido.

# text
seg-ad8160fbed46 = <b>O que não é coberto</b>, declarado em todo relatório: se o GNSS realmente foi removido e restaurado nos instantes declarados; qualquer etapa que o operador não registrou; máscaras definidas por meio de um filtro de { "0.1" } Hz para um registro amostrado mais devagar que uma vez por segundo; a incerteza de medição do próprio instrumento; e qualquer procedimento da Recomendação além de um registro de erro de tempo (perfis de temperatura, carga da rede de pacotes).

# text
seg-cf681db42f05 = <b>A faixa de recuperação é escolha do próprio teste.</b> O padrão de { "100" } ns é o erro de tempo absoluto máximo de um PRTC-A (ITU-T G.8272); é uma linha conveniente, não um requisito de nenhuma Recomendação para a recuperação.

# text
seg-4ce2f2052df4 = <b>Sem caminho de transmissão.</b> O Kshana lê arquivos. Não gera sinal, e remover o GNSS em laboratório é feito com o equipamento do próprio laboratório e sob a permissão dele.

# text
# c1: holdover-test
# c2: kshana <scenario.toml>
# c3: kshana::api::run_toml
# c4: kshana.run
# c5: samples
# c6: clock_log.text
# c7: run_scenario
# c8: kshana example holdover-test-example
seg-0cff831a8444 = <c1/> é um tipo de cenário, portanto roda em todo lugar onde os tipos de cenário rodam: <c2/>, a API Rust (<c3/>), o binding Python (<c4/>), a compilação WebAssembly e npm (<c5/> ou <c6/> em linha; as chaves de arquivo não estão disponíveis ali), o servidor MCP (<c7/>, somente conteúdo em linha) e o executor de cenários do Kshana Studio. Os dois arquivos de cenário são incluídos (<c8/>).

# text
seg-432c07a8e6f5 = <s1>Anterior</s1>Tempo enganado

# text
seg-8499ae539222 = <s1>Próximo</s1>Formatos de registro de relógio
