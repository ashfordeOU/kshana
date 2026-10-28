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
seg-0f061f726ec5 = <s1>Anterior</s1>Teste de holdover e hardware de temporização no circuito

# text
seg-3c89cfcbbd04 = <s1>Seguinte</s1>Segurança do hardware

# text
seg-9b52cd5eb4be = tau0 e lacunas

# text
# c1: rinex-clk
# c2: RINEX VERSION / TYPE
# c3: rinex_clock300.txt
# c4: 302
# c5: 304
# c6: TIME SYSTEM ID
# c7: END OF HEADER
# c8: AS
# c9: AR
# c10: CR
# c11: DR
# c12: MS
seg-9c8042f0d3d7 = <b><c1/></b>: ficheiros de relógio RINEX, versões { "2.00" } e { "3.00" } a { "3.04" } (incluindo o campo de nome de nove caracteres da { "3.04" }). O registo <c2/> é verificado e qualquer outra versão é recusada, nomeando a versão encontrada: o IGS publica o formato de relógio (<c3/>, <c4/>, <c5/>) até à { "3.04" }, e os documentos RINEX { "4.00" }, { "4.01" } e { "4.02" } definem apenas ficheiros de observação, de navegação e meteorológicos, portanto não existe versão { "4.00" } do ficheiro de relógio a ler. O cabeçalho é lido apenas para o seu <c6/> e é ignorado até <c7/>. Dos registos de dados, apenas os registos <c8/> (satélite) e <c9/> (recetor ou estação) de um relógio, selecionado pelo nome, são mantidos. O seu primeiro campo de valor, o viés do relógio em segundos, é a fase. As linhas de continuação e os registos <c10/>, <c11/> e <c12/> são ignorados. As épocas são os campos de calendário do registo, em segundos a partir de 1980-01-06 { "00" }:{ "00" }:{ "00" } no sistema de tempo do próprio ficheiro, sem conversão.

# text
# c1: ticc
# c2: f64
seg-b65f4a928891 = <b><c1/></b>: registos do contador TICC da TAPR (Manual de Operação do TICC, revisões de { "23" } de novembro de { "2016" } e { "15" } de dezembro de { "2025" }, "modos de medição"). Todo campo de dados é em segundos com { "12" } casas decimais ({ "11" } por predefinição a partir do firmware { "20251101" }: qualquer quantidade até { "15" } é lida). Um carimbo de tempo é lido a partir do seu texto decimal como um número inteiro de femtossegundos, e não como um número binário de ponto flutuante, de modo que a fase de um registo obtido dias após o início do contador mantém a resolução própria do contador: um carimbo de tempo <c2/> em { "3.0e5" } s tem um espaçamento de { "5.8e-11" } s, cerca dos { "60" } ps do contador.

# text
# c1: chC
seg-bb51bfa2a834 = O modo Paired Timestamp imprime as mesmas linhas na ordem dos canais e é lido como modo Timestamp; o modo 3-Corner Hat acrescenta o <c1/> sintetizado, lido como acima.

# text
seg-220bc7450e83 = A saída dos modos Period e Debug é recusada. Um canal cujas leituras não crescem é comunicado como modo Period. O modo Binary Timestamp não é texto, e um ficheiro nesse modo é recusado com uma mensagem que o diz.

# text
seg-1138c53b3eac = O seu próprio relógio

# text
# c1: [clock_log]
# c2: scenarios/clock-measured-log.toml
# c3: kshana example clock-measured-log
# c4: clock-holdover.toml
# c5: text
# c6: path
# c7: format
# c8: measured
# c9: tau0
seg-1f9cce016fa0 = Uma tabela <c1/> no tipo de cenário de relógio indica quão estável foi o seu próprio relógio, ao lado da simulação: <c2/> (<c3/>) é <c4/> com um excerto de 96 leituras de um relógio de satélite do IGS como um registo TimeLab embutido. Substitua <c5/> por <c6/> e <c7/> para o seu próprio ficheiro. O bloco <c8/> no resultado contém como o registo foi lido (formato, <c9/> e a origem, cada lacuna) e as suas ADEV, TDEV e MTIE; ele não altera a simulação.

# text
# c1: [clock_fit]
seg-584564d1a734 = Conduzir o holdover com o seu próprio relógio: <c1/>

# text
# c1: src/clock_library/card.rs
# c2: q_wf = h_0 / 2
# c3: q_rw = 2 pi^2 h_-2
# c4: flicker_floor = sqrt(2 ln 2 h_-1)
# c5: drift
# c6: y0
# c7: fitted
# c8: measured:<12 hex of the phase hash>
# c9: runs > 1
# c10: measured
# c11: runs = 1
# c12: replaces
# c13: quantum
# c14: classical
# c15: scenarios/clock-fitted-log.toml
seg-56799b5fea19 = O registo é ajustado com o procedimento de cartão de dispositivo de <c1/> (condicionamento, remoção do termo quadrático, identificação do ruído de desfasamento 1, mínimos quadrados ponderados em PM branco, FM branco, FM de cintilação e FM de passeio aleatório nos tempos de média com pelo menos { "30" } graus de liberdade). O relógio nomeado passa então a usar <c2/>, <c3/>, <c4/> e o <c5/> ajustado; <c6/> permanece como está no cenário, porque um registo traz o deslocamento da sua referência, e não o do relógio após a disciplina. O ruído de fase branco é ajustado e indicado, mas não simulado. O resultado ganha um bloco <c7/> (os coeficientes, os pontos de ajuste, os valores usados pela execução, o que foi deixado de fora, o SHA-256 do registo) e o relógio recebe o id <c8/>. Com <c9/> o conjunto sorteia a partir do relógio ajustado (o bloco <c10/> exige <c11/>). Um ajuste sem ruído de frequência, um registo curto demais para ajustar e um <c12/> diferente de <c13/> ou <c14/> são erros que o dizem. <c15/> é um exemplo ({ "6" } horas de um relógio de satélite do IGS).

# text
# c1: tests/fixtures/clock_fit/RESULTS.md
seg-fe695061eed3 = O que a comparação com ruído conhecido (<c1/>) mostra e o que se deve ter em mente:

# text
seg-90657795ba62 = Atingido: o nível de FM branco é recuperado dentro de { "5" } % em todo registo sintético que o tem; o cartão ajustado reproduz o desvio de Allan verdadeiro dentro de um fator de { "1.35" } em todo tempo de média em que foi ajustado; o expoente de ruído que o ajuste identifica é igual ao do allantools em todos os pontos (no registo 5071A, depois que o salto de fase que o condicionamento remove é removido também da entrada do allantools).

# text
seg-f1ec27a393ae = <b>Não atingido, e fixado pelo teste:</b> o FM de passeio aleatório só é recuperado quando domina os maiores tempos de média do registo e, mesmo assim, num de três registos de uma série de { "131 072" } s com cruzamento em { "3 000" } s, o ajuste atribuiu-o ao FM de cintilação e à deriva. A divisão entre FM de passeio aleatório e FM de cintilação não é fiável a partir de um único registo. A execução reproduz a estabilidade do registo nos tempos de média que o registo cobre; além deles as duas escolhas divergem (o FM de cintilação é um piso constante, o FM de passeio aleatório cresce com a raiz quadrada do tempo de média).

# text
seg-88ba5ae782d4 = MODELLED: um cenário hipotético para o ruído desse relógio como o registo o mostra, não uma calibração do relógio e não uma previsão do seu comportamento futuro.

# text
# c1: tests/clock_log_real_allantools.rs
seg-6e88b597bbf0 = Um registo malformado é um erro que nomeia o que foi encontrado (a linha, a versão, o seletor ausente), nunca um resultado parcial: <c1/> fixa { "24" } desses casos.

# text
# c1: src/clock_log.rs
# c2: tests/fixtures/clock_log/linuxptp_chrony/
# c3: tests/clock_log_allantools.rs
# c4: tests/fixtures/clock_log/PREREGISTRATION.md
seg-4a05abb27420 = MODELLED. Este é um analisador, e a sua saída alimenta estimadores que são validados em outro local face ao allantools. Os testes unitários de <c1/> usam pequenos registos escritos à mão e, para os formatos linuxptp e chrony, os ficheiros de teste de <c2/>. <c3/> executa a comparação fixada antecipadamente em <c4/>: três registos sintéticos com semente, um por formato, relidos por um leitor independente escrito a partir desta página pelo mesmo autor, com as ADEV, TDEV e MTIE verificadas face ao allantools { "2024.6" }; essa comparação cobre apenas os três primeiros formatos, e os leitores de linuxptp e chrony têm testes de analisador, mas nenhuma comparação com referência independente. Os registos dessa comparação são sintéticos, portanto nada ali descreve um relógio ou contador real; a comparação com séries medidas é descrita abaixo.

# text
seg-576211abf0b4 = Com dados medidos

# text
# c1: tests/clock_log_real_allantools.rs
# c2: tests/fixtures/clock_log_real/PREREGISTRATION.md
# c3: PHASE.DAT
# c4: realdata-cache/
# c5: scripts/gen_clock_log_real_ref.py
# c6: KSHANA_REQUIRE_REALDATA=1
# c7: tests/fixtures/clock_log_real/RESULTS.md
seg-3c8d10e8bd1c = <c1/> executa a comparação fixada antecipadamente em <c2/> (versionada antes de qualquer ficheiro de teste ou execução) em quatro séries medidas: o <c3/> do Stable32, as primeiras { "65 536" } leituras de um relógio de césio 5071A contra um maser de hidrogénio, e os relógios do satélite G01 do IGS ({ "30" } s) e da estação ABMF ({ "300" } s) a partir do relógio final do IGS de 2026-08-02, como um recorte incorporado com o seu NOTICE. Os dois primeiros não têm concessão de redistribuição: os registos escritos a partir deles estão em <c4/>, ignorado pelo git (<c5/>), e o teste di-lo e passa quando estão ausentes, a menos que <c6/>. Cada registo é lido pelo motor e por um leitor independente, e ADEV, TDEV e MTIE são comparados com o allantools { "2024.6" }. Registado em <c7/>: no leitor distribuído, os registos TICC, a versão do cabeçalho e cinco mensagens de erro falharam nos limiares fixados antecipadamente; foram corrigidos e a comparação foi executada de novo sem alterações. Atingido, exceto um par: o MTIE de um registo de frequência difere do do allantools, porque o allantools integra a frequência menos a à sua média (fixado como NOT MET; a comparação em condições equivalentes é atingida). A linha permanece MODELLED: os registos TICC são dados de relógio medidos recodificados no formato do contador pelo nosso script (nenhuma captura TICC real foi encontrada), e o leitor de referência tem o mesmo autor que o do motor.

# text
seg-52778d17f4db = Conduzir o holdover com o seu próprio relógio: [clock_fit]
