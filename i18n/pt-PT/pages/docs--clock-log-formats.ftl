# docs--clock-log-formats: translations (pt-PT)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Fonte: <c1/>

# text
seg-0dfd1160c5d7 = Formatos de registos de relógio

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> lê um registo de relógio medido para uma única série de fase normalizada: uma grelha uniforme de amostras <c2/>, com o intervalo de amostragem <c3/> indicado ou encontrado, cada lacuna contada e as unidades do registo nomeadas. São lidos oito formatos, cada um um subconjunto documentado. Tudo o que fica fora do subconjunto é recusado com um erro que nomeia o que foi encontrado, em vez de ser lido de forma aproximada.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Abreviaturas.</b> RINEX é o Receiver Independent Exchange Format. TICC é o contador de intervalos de tempo da TAPR (Tucson Amateur Packet Radio). ADEV é o desvio de Allan sobreposto, TDEV o desvio de tempo e MTIE o erro máximo de intervalo de tempo. <c1/> é o intervalo de amostragem em segundos.

# text
seg-1d5a6c2090af = Onde um registo pode ser usado

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b>: <c2/> em vez de <c3/> ou <c4/>. A fase do registo, em ns, é a série de erro de tempo verificada face às máscaras, e o relatório ganha um bloco <c5/> a indicar como foi lido.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>O tipo de cenário do relógio</b>: uma tabela <c1/> acrescenta à execução um bloco <c2/>: como o registo foi lido, o SHA-256 da tabela (<c3/>; o <c4/> da execução não abrange a tabela) e das amostras de fase, e o ADEV sobreposto, o TDEV e o MTIE a fatores de média em oitavas. Requer <c5/>. O holdover simulado não se altera.

# text
seg-2f464fe709c9 = Sem a tabela, ambos os tipos de cenário são analisados, calculam o hash e reportam exatamente como antes.

# text
seg-c931c5ec2f4a = Os formatos

# text
# c1: rinex-clk
# c2: TIME SYSTEM ID
# c3: END OF HEADER
# c4: AS
# c5: AR
# c6: CR
# c7: DR
# c8: MS
seg-7f608c733407 = <b><c1/></b>: ficheiros de relógio RINEX, versões { "2" } e { "3.00" } a { "3.04" } (incluindo o campo de nome de nove carateres de { "3.04" }). O cabeçalho é lido apenas pelo seu <c2/> e é ignorado até <c3/>. Dos registos de dados, só são mantidos os registos <c4/> (satélite) e <c5/> (recetor ou estação) de um relógio, selecionado pelo nome. O seu primeiro campo de valor, o desvio do relógio em segundos, é a fase. As linhas de continuação e os registos <c6/>, <c7/> e <c8/> são ignorados. As épocas são os campos de calendário do registo, em segundos desde 1980-01-06 { "00" }:{ "00" }:{ "00" } no próprio sistema de tempo do ficheiro, sem conversão.

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b>: registos ASCII de fase ou frequência no estilo TimeLab, a forma em texto simples que o TimeLab exporta e que a sua importação ASCII e o Stable32 leem. Há uma leitura por linha: ou uma única coluna a um <c2/> uniforme, ou duas colunas <c3/>. As colunas podem ser separadas por espaços em branco, vírgulas ou pontos e vírgulas.

# text
# c1: #
# c2: ;
# c3: %
# c4: key = value
# c5: key: value
# c6: tau0
# c7: units
# c8: s
# c9: ms
# c10: us
# c11: ns
# c12: ps
# c13: data
# c14: phase
# c15: frequency
# c16: time_units
# c17: s
# c18: mjd
seg-a7ae9e712bea = As linhas que começam por <c1/>, <c2/> ou <c3/> são comentários. Um comentário da forma <c4/> (ou <c5/>) define <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> ou <c12/>, para fase), <c13/> (<c14/> ou <c15/>) ou <c16/> (<c17/> ou <c18/>, para a primeira de duas colunas).

# text
seg-84cf463d5e74 = Uma linha inicial não numérica é tomada como cabeçalho de colunas.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Os dados de frequência (frequência fracionária) só são aceites como coluna única. São integrados em fase como <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = Os ficheiros binários e de projeto <c1/> do TimeLab não são lidos.

# text
# c1: ticc
seg-3d8853fa9c92 = <b><c1/></b>: registos do contador TAPR TICC (TICC Operation Manual, revisão de { "23" } de novembro de { "2016" }, «measurement modes»). Cada campo de dados é em segundos com { "12" } casas decimais.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = As linhas do modo de marca temporal (<c1/>, <c2/>) e o canal de pseudomarca temporal do modo TimeLab (<c3/>) são marcas temporais de eventos. A fase do canal selecionado é a sua marca temporal menos o tique nominal: <c4/>, em que <c5/> é o número inteiro de <c6/> desde o primeiro evento. Um evento perdido é uma lacuna.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = As linhas do modo de intervalo (<c1/>, ou qualquer etiqueta que comece por <c2/>) são lidas diretamente como fase, uma leitura por <c3/>. O cenário tem de indicar <c4/>, porque a linha não transporta tempo.

# text
seg-75301936698f = A saída em modo de período e em modo de depuração é recusada. Um canal cujas leituras não aumentam é reportado como modo de período.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = As linhas que começam por <c1/>, e as linhas que não são <c2/> (como o menu de arranque), são ignoradas e contadas.

# text
seg-cb4b7062dd5a = registos do linuxptp e do chrony

# text
seg-c6c70813a988 = Estes cinco formatos leem o que um daemon de tempo em execução escreve sobre o seu próprio relógio. Servem para verificar uma cadeia de temporização a posteriori (um relógio de fronteira, o PHC de um grandmaster, um cliente chrony) com os mesmos estimadores que os outros registos. Não leem a configuração de um daemon, e nada aqui comunica com um daemon.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: as linhas de servo do linuxptp, cada formato a ler apenas linhas do seu próprio programa. Uma leitura é uma linha da forma

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = A marca temporal é o primeiro <c1/> da linha (o relógio monótono do daemon). Também é lida após um prefixo de syslog, onde um identificador de processo como <c2/> não tem fração e não é tomado.

# text
# c1: offset
seg-72678cd6c03e = A fase é o <c1/> registado, em nanossegundos, convertido para segundos. É o erro de tempo medido pelo daemon do seu relógio escravo face à sua referência, tal como registado: positivo quando o escravo está adiantado. É o erro que resta sob controlo do servo, não a deriva de um relógio em marcha livre.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = As palavras entre a marca temporal e <c1/> nomeiam a fonte (<c2/>, <c3/> para um prefixo <c4/>, <c5/>, <c6/>). Um registo com mais do que uma fonte precisa de <c7/>; o erro lista-as.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = As leituras anteriores à primeira vez em que o servo reporta <c1/> (bloqueado) são excluídas e contadas em <c2/>: <c3/> e <c4/> são os estados desbloqueado e de salto, cujos desvios são transitórios de entrada. Um servo que nunca atinge <c5/> é recusado. Uma linha sem campo de estado é lida tal como está.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = As linhas de resumo (<c1/>), as mensagens <c2/> e <c3/> e as linhas de outros programas são ignoradas e contadas.

# text
seg-92164f4a56be = As marcas temporais que andam para trás (um daemon reiniciado) são recusadas; divida o registo.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: os ficheiros <c3/> e <c4/> do chrony, lidos por posição de coluna. Uma leitura é uma linha com pelo menos { "14" } colunas (tracking) ou { "13" } (statistics) que começa por uma data e hora UTC <c5/>. A linha de cabeçalho das colunas é ignorada e contada; a linha <c6/> por baixo dela é ignorada sem ser contada.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking: coluna { "7" }, o desvio local na atualização do relógio, em segundos. O endereço IP ou o identificador de referência muda com a fonte selecionada, pelo que, sem <c1/>, cada linha é lida como um único relógio local. <c2/> mantém um identificador de referência.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics: coluna { "5" }, o desvio estimado de uma fonte, em segundos. Há uma série por endereço de fonte, e o registo precisa de <c1/> quando contém mais do que uma.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = As épocas são segundos desde 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, sem tratamento de segundos intercalares. O chrony escreve uma linha por atualização ou por amostra de fonte, pelo que o espaçamento não é uniforme. <c1/> é o espaçamento mediano; uma leitura a menos de meio <c2/> da anteriormente mantida é descartada e contada em <c3/>, e um espaçamento maior é uma lacuna, que <c4/> reporta. Indique <c5/> e <c6/> para um registo com um intervalo de sondagem estável.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = As colunas do chrony e as disposições de linha do linuxptp são as da documentação pública dos daemons. Os ficheiros de apoio em <c1/> foram escritos para o Kshana com valores inventados (ver o seu <c2/>); nenhum registo real foi lido, pelo que uma disposição que difira entre versões do daemon ainda pode ser recusada ou mal lida. Uma linha que não corresponda é ignorada e contada, nunca adivinhada.

# text
# c1: tau0
seg-b120a37b7d60 = <c1/> e lacunas

# text
# c1: tau0
# c2: tau0
# c3: median-spacing
# c4: tau0_s
# c5: input
# c6: tau0
# c7: header
seg-6fd68aad2fd7 = Quando o registo transporta marcas temporais e não é indicado <c1/>, <c2/> é o espaçamento mediano das marcas temporais consecutivas, arredondado a quatro algarismos significativos, e a fonte é reportada como <c3/>. O espaçamento de um contador difere do nominal pelo desvio de frequência da referência, partes em { "10" }^{ "6" } ou menos. Um <c4/> no cenário prevalece sempre (fonte <c5/>), seguido de um comentário de cabeçalho <c6/> (fonte <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = As amostras são colocadas na grelha <c1/>, e uma época em falta é uma lacuna. As leituras a mais de { "1" } % de <c2/> fora da grelha são descartadas e contadas, tal como as duplicadas (mantém-se a primeira). A política de lacunas é uma das seguintes:

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (a predefinição): qualquer lacuna é um erro que conta as lacunas;

# text
# c1: longest
seg-593c998b65e0 = <c1/>: manter o troço sem lacunas mais longo;

# text
# c1: linear
seg-f184ce746389 = <c1/>: preencher as lacunas interiores por interpolação linear e reportar o número preenchido.

# text
seg-1f3dc3429615 = Os estimadores precisam de um registo sem lacunas, razão pela qual as lacunas são resolvidas aqui.

# text
# c1: src/clock_log.rs
# c2: tests/fixtures/clock_log/linuxptp_chrony/
# c3: tests/clock_log_allantools.rs
# c4: tests/fixtures/clock_log/PREREGISTRATION.md
seg-fe7d27a473aa = MODELLED. Isto é um analisador, e a sua saída alimenta estimadores que são validados noutro local face ao allantools. Os testes unitários em <c1/> usam pequenos registos escritos à mão e, para os formatos linuxptp e chrony, os ficheiros de apoio em <c2/>. <c3/> executa a comparação pré-registada em <c4/>: três registos sintéticos com semente, um por formato, relidos por um leitor independente escrito a partir desta página pelo mesmo autor, com o ADEV, o TDEV e o MTIE verificados face ao allantools { "2024.6" }; essa comparação abrange apenas os três primeiros formatos, e os leitores linuxptp e chrony têm testes de analisador mas nenhuma comparação com uma referência independente. Os registos são sintéticos, pelo que nada aqui descreve um relógio ou contador real.

# text
seg-0f061f726ec5 = <s1>Anterior</s1>Teste de holdover e hardware de temporização no circuito

# text
seg-3c89cfcbbd04 = <s1>Seguinte</s1>Segurança do hardware

# text
seg-9b52cd5eb4be = tau0 e lacunas
