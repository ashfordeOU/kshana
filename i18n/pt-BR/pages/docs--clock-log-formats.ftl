# docs--clock-log-formats: translations (pt-BR)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Fonte: <c1/>

# text
seg-0dfd1160c5d7 = Formatos de registro de relógio

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> lê um registro medido de relógio em uma única série de fase normalizada: uma grade uniforme de amostras <c2/>, com o intervalo de amostragem <c3/> declarado ou encontrado, cada lacuna contada e as unidades do registro nomeadas. Oito formatos são lidos, cada um um subconjunto documentado. Tudo o que estiver fora do subconjunto é recusado com um erro que nomeia o que foi encontrado, em vez de ser lido de forma aproximada.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Abreviações.</b> RINEX é o Receiver Independent Exchange Format. TICC é o contador de intervalos de tempo da TAPR (Tucson Amateur Packet Radio). ADEV é o desvio de Allan sobreposto, TDEV o desvio de tempo e MTIE o erro máximo de intervalo de tempo. <c1/> é o intervalo de amostragem em segundos.

# text
seg-1d5a6c2090af = Onde um registro pode ser usado

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b>: <c2/> no lugar de <c3/> ou <c4/>. A fase do registro, em ns, é a série de erro de tempo verificada contra as máscaras, e o relatório ganha um bloco <c5/> que diz como foi lida.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>O tipo de cenário de relógio</b>: uma tabela <c1/> acrescenta um bloco <c2/> à execução: como o registro foi lido, o SHA-256 da tabela (<c3/>; o <c4/> da execução não cobre a tabela) e das amostras de fase, e o ADEV sobreposto, o TDEV e o MTIE em fatores de média oitavados. Exige <c5/>. O holdover simulado permanece inalterado.

# text
seg-2f464fe709c9 = Sem a tabela, ambos os tipos de cenário são analisados, geram hash e informam exatamente como antes.

# text
seg-c931c5ec2f4a = Os formatos

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b>: registros ASCII de fase ou de frequência no estilo TimeLab, a forma em texto simples que o TimeLab exporta e que a importação ASCII dele e o Stable32 leem. Há uma leitura por linha: ou uma única coluna com <c2/> uniforme, ou duas colunas <c3/>. As colunas podem ser separadas por espaço em branco, vírgulas ou ponto e vírgula.

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
seg-a7ae9e712bea = Linhas iniciadas por <c1/>, <c2/> ou <c3/> são comentários. Um comentário da forma <c4/> (ou <c5/>) define <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> ou <c12/>, para fase), <c13/> (<c14/> ou <c15/>) ou <c16/> (<c17/> ou <c18/>, para a primeira de duas colunas).

# text
seg-84cf463d5e74 = Uma linha inicial não numérica é tomada como cabeçalho de coluna.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Dados de frequência (frequência fracionária) são aceitos somente em uma coluna. São integrados em fase como <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = Os arquivos de projeto binários e <c1/> do TimeLab não são lidos.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = As linhas do modo de carimbo de tempo (<c1/>, <c2/>) e o canal de pseudocarimbo de tempo do modo TimeLab (<c3/>) são carimbos de tempo de eventos. A fase do canal selecionado é o seu carimbo de tempo menos o tique nominal: <c4/>, em que <c5/> é o número inteiro de <c6/> desde o primeiro evento. Um evento perdido é uma lacuna.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = As linhas do modo de intervalo (<c1/>, ou qualquer rótulo iniciado por <c2/>) são lidas diretamente como fase, uma leitura por <c3/>. O cenário deve declarar <c4/>, porque a linha não traz tempo.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = Linhas iniciadas por <c1/>, e linhas que não são <c2/> (como o menu de inicialização), são ignoradas e contadas.

# text
seg-cb4b7062dd5a = Registros do linuxptp e do chrony

# text
seg-c6c70813a988 = Estes cinco formatos leem o que um daemon de tempo em execução escreve sobre o próprio relógio. Servem para verificar uma cadeia de temporização depois do fato (um boundary clock, o PHC de um grandmaster, um cliente chrony) com os mesmos estimadores dos demais registros. Não leem a configuração de um daemon, e nada aqui se comunica com um daemon.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: as linhas de servo do linuxptp, cada formato lendo apenas as linhas do seu próprio programa. Uma leitura é uma linha da forma

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = O carimbo de tempo é o primeiro <c1/> da linha (o relógio monotônico do daemon). Ele também é lido depois de um prefixo de syslog, em que um identificador de processo como <c2/> não tem fração e não é tomado.

# text
# c1: offset
seg-72678cd6c03e = A fase é o <c1/> registrado, em nanossegundos, convertido em segundos. É o erro de tempo medido pelo daemon do seu relógio escravo contra a sua referência, como registrado: positivo quando o escravo está adiantado. É o erro que resta sob controle do servo, e não a deriva de um relógio em funcionamento livre.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = As palavras entre o carimbo de tempo e <c1/> nomeiam a fonte (<c2/>, <c3/> para um prefixo <c4/>, <c5/>, <c6/>). Um registro com mais de uma fonte precisa de <c7/>; o erro as lista.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = As leituras anteriores ao primeiro momento em que o servo informa <c1/> (travado) ficam de fora e são contadas em <c2/>: <c3/> e <c4/> são os estados destravado e de salto, cujos desvios são transitórios de acomodação. Um servo que nunca alcança <c5/> é recusado. Uma linha sem campo de estado é lida como está.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = As linhas de resumo (<c1/>), as mensagens <c2/> e <c3/> e as linhas de outros programas são ignoradas e contadas.

# text
seg-92164f4a56be = Carimbos de tempo que retrocedem (um daemon reiniciado) são recusados; divida o registro.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: os arquivos <c3/> e <c4/> do chrony, lidos por posição de coluna. Uma leitura é uma linha com pelo menos { "14" } colunas (tracking) ou { "13" } (statistics) que começa com uma data e hora UTC <c5/>. A linha de cabeçalho de colunas é ignorada e contada; a linha <c6/> abaixo dela é ignorada sem ser contada.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking: coluna { "7" }, o desvio local na atualização do relógio, em segundos. O endereço IP ou o identificador de referência muda com a fonte selecionada, de modo que, sem <c1/>, toda linha é lida como um único relógio local. <c2/> mantém um identificador de referência.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics: coluna { "5" }, o desvio estimado de uma fonte, em segundos. Há uma série por endereço de fonte, e o registro precisa de <c1/> quando contém mais de uma.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = As épocas são segundos a partir de 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, sem tratamento de segundos intercalares. O chrony escreve uma linha por atualização ou por amostra de fonte, de modo que o espaçamento não é uniforme. <c1/> é o espaçamento mediano; uma leitura a menos de meio <c2/> da anterior mantida é descartada e contada em <c3/>, e um espaçamento maior é uma lacuna, que <c4/> informa. Informe <c5/> e <c6/> para um registro com intervalo de consulta constante.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = As colunas do chrony e os formatos de linha do linuxptp são os da documentação pública dos daemons. As fixtures em <c1/> foram escritas para o Kshana com valores inventados (veja o <c2/>); nenhum registro real foi lido, de modo que um formato que difira entre versões do daemon ainda pode ser recusado ou mal lido. Uma linha que não corresponde é ignorada e contada, nunca adivinhada.

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
seg-6fd68aad2fd7 = Quando o registro traz carimbos de tempo e nenhum <c1/> é informado, <c2/> é o espaçamento mediano de carimbos de tempo consecutivos, arredondado para quatro algarismos significativos, e a fonte é informada como <c3/>. O espaçamento de um contador difere do nominal pelo desvio de frequência da referência, partes em { "10" }^{ "6" } ou menos. Um <c4/> no cenário sempre prevalece (fonte <c5/>), seguido de um comentário de cabeçalho <c6/> (fonte <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = As amostras são colocadas na grade <c1/>, e uma época ausente é uma lacuna. Leituras a mais de { "1" } % de <c2/> fora da grade são descartadas e contadas, assim como as duplicatas (a primeira é mantida). A política de lacunas é uma destas:

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (o padrão): qualquer lacuna é um erro que conta as lacunas;

# text
# c1: longest
seg-593c998b65e0 = <c1/>: manter o trecho mais longo sem lacunas;

# text
# c1: linear
seg-f184ce746389 = <c1/>: preencher as lacunas internas por interpolação linear e informar o número de preenchidas.

# text
seg-1f3dc3429615 = Os estimadores precisam de um registro sem lacunas, e é por isso que as lacunas são resolvidas aqui.

# text
seg-0f061f726ec5 = <s1>Anterior</s1>Teste de holdover e hardware de temporização em malha

# text
seg-3c89cfcbbd04 = <s1>Próximo</s1>Segurança do hardware

# text
seg-9b52cd5eb4be = tau0 e lacunas
