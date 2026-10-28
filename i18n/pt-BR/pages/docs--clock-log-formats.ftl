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

seg-9c8042f0d3d7 = <b><c1/></b>: arquivos de relógio RINEX, versões { "2.00" } e { "3.00" } a { "3.04" } (incluindo o campo de nome de nove caracteres da { "3.04" }). O registro <c2/> é verificado e qualquer outra versão é recusada, nomeando a versão encontrada: o IGS publica o formato de relógio (<c3/>, <c4/>, <c5/>) até a { "3.04" }, e os documentos RINEX { "4.00" }, { "4.01" } e { "4.02" } definem apenas arquivos de observação, de navegação e meteorológicos, portanto não existe versão { "4.00" } do arquivo de relógio a ser lida. O cabeçalho é lido apenas para o seu <c6/> e é ignorado até <c7/>. Dos registros de dados, apenas os registros <c8/> (satélite) e <c9/> (receptor ou estação) de um relógio, selecionado pelo nome, são mantidos. Seu primeiro campo de valor, o viés do relógio em segundos, é a fase. As linhas de continuação e os registros <c10/>, <c11/> e <c12/> são ignorados. As épocas são os campos de calendário do registro, em segundos a partir de 1980-01-06 { "00" }:{ "00" }:{ "00" } no sistema de tempo do próprio arquivo, sem conversão.

seg-b65f4a928891 = <b><c1/></b>: registros do contador TICC da TAPR (Manual de Operação do TICC, revisões de { "23" } de novembro de { "2016" } e { "15" } de dezembro de { "2025" }, "modos de medição"). Todo campo de dados é em segundos com { "12" } casas decimais ({ "11" } por padrão a partir do firmware { "20251101" }: qualquer quantidade até { "15" } é lida). Um carimbo de tempo é lido a partir do seu texto decimal como um número inteiro de femtossegundos, e não como um número binário de ponto flutuante, de modo que a fase de um registro obtido dias após o início do contador mantém a resolução própria do contador: um carimbo de tempo <c2/> em { "3.0e5" } s tem um espaçamento de { "5.8e-11" } s, cerca dos { "60" } ps do contador.

seg-bb51bfa2a834 = O modo Paired Timestamp imprime as mesmas linhas na ordem dos canais e é lido como modo Timestamp; o modo 3-Corner Hat acrescenta o <c1/> sintetizado, lido como acima.

seg-220bc7450e83 = A saída dos modos Period e Debug é recusada. Um canal cujas leituras não crescem é informado como modo Period. O modo Binary Timestamp não é texto, e um arquivo nesse modo é recusado com uma mensagem que o diz.

seg-1138c53b3eac = Seu próprio relógio

seg-1f9cce016fa0 = Uma tabela <c1/> no tipo de cenário de relógio informa quão estável foi o seu próprio relógio, ao lado da simulação: <c2/> (<c3/>) é <c4/> com um trecho de 96 leituras de um relógio de satélite do IGS como um registro TimeLab embutido. Substitua <c5/> por <c6/> e <c7/> para o seu próprio arquivo. O bloco <c8/> no resultado contém como o registro foi lido (formato, <c9/> e a origem, cada lacuna) e suas ADEV, TDEV e MTIE; ele não altera a simulação.

seg-584564d1a734 = Conduzir o holdover com o seu próprio relógio: <c1/>

seg-56799b5fea19 = O registro é ajustado com o procedimento de cartão de dispositivo de <c1/> (condicionamento, remoção do termo quadrático, identificação do ruído de defasagem 1, mínimos quadrados ponderados em PM branco, FM branco, FM de cintilação e FM de passeio aleatório nos tempos de média com pelo menos { "30" } graus de liberdade). O relógio nomeado passa então a usar <c2/>, <c3/>, <c4/> e o <c5/> ajustado; <c6/> permanece como está no cenário, porque um registro traz o deslocamento da sua referência, e não o do relógio após a disciplina. O ruído de fase branco é ajustado e informado, mas não simulado. O resultado ganha um bloco <c7/> (os coeficientes, os pontos de ajuste, os valores usados pela execução, o que foi deixado de fora, o SHA-256 do registro) e o relógio recebe o id <c8/>. Com <c9/> o conjunto sorteia a partir do relógio ajustado (o bloco <c10/> exige <c11/>). Um ajuste sem ruído de frequência, um registro curto demais para ajustar e um <c12/> diferente de <c13/> ou <c14/> são erros que o dizem. <c15/> é um exemplo ({ "6" } horas de um relógio de satélite do IGS).

seg-fe695061eed3 = O que a comparação com ruído conhecido (<c1/>) mostra e o que se deve ter em mente:

seg-90657795ba62 = Atingido: o nível de FM branco é recuperado dentro de { "5" } % em todo registro sintético que o tem; o cartão ajustado reproduz o desvio de Allan verdadeiro dentro de um fator de { "1.35" } em todo tempo de média em que foi ajustado; o expoente de ruído que o ajuste identifica é igual ao do allantools em todos os pontos (no registro 5071A, depois que o salto de fase que o condicionamento remove é removido também da entrada do allantools).

seg-f1ec27a393ae = <b>Não atingido, e fixado pelo teste:</b> o FM de passeio aleatório só é recuperado quando domina os maiores tempos de média do registro e, mesmo assim, em um de três registros de uma série de { "131 072" } s com cruzamento em { "3 000" } s, o ajuste o atribuiu ao FM de cintilação e à deriva. A divisão entre FM de passeio aleatório e FM de cintilação não é confiável a partir de um único registro. A execução reproduz a estabilidade do registro nos tempos de média que o registro cobre; além deles as duas escolhas divergem (o FM de cintilação é um piso constante, o FM de passeio aleatório cresce com a raiz quadrada do tempo de média).

seg-88ba5ae782d4 = MODELLED: um cenário hipotético para o ruído desse relógio como o registro o mostra, não uma calibração do relógio e não uma previsão do seu comportamento futuro.

seg-6e88b597bbf0 = Um registro malformado é um erro que nomeia o que foi encontrado (a linha, a versão, o seletor ausente), nunca um resultado parcial: <c1/> fixa { "24" } desses casos.

seg-4a05abb27420 = MODELLED. Este é um analisador, e sua saída alimenta estimadores que são validados em outro lugar em relação ao allantools. Os testes unitários de <c1/> usam pequenos registros escritos à mão e, para os formatos linuxptp e chrony, os arquivos de teste de <c2/>. <c3/> executa a comparação fixada antecipadamente em <c4/>: três registros sintéticos com semente, um por formato, relidos por um leitor independente escrito a partir desta página pelo mesmo autor, com as ADEV, TDEV e MTIE verificadas em relação ao allantools { "2024.6" }; essa comparação cobre apenas os três primeiros formatos, e os leitores de linuxptp e chrony têm testes de analisador, mas nenhuma comparação com referência independente. Os registros dessa comparação são sintéticos, portanto nada ali descreve um relógio ou contador real; a comparação com séries medidas é descrita abaixo.

seg-576211abf0b4 = Com dados medidos

seg-3c8d10e8bd1c = <c1/> executa a comparação fixada antecipadamente em <c2/> (versionada antes de qualquer arquivo de teste ou execução) em quatro séries medidas: o <c3/> do Stable32, as primeiras { "65 536" } leituras de um relógio de césio 5071A contra um maser de hidrogênio, e os relógios do satélite G01 do IGS ({ "30" } s) e da estação ABMF ({ "300" } s) a partir do relógio final do IGS de 2026-08-02, como um recorte incorporado com seu NOTICE. Os dois primeiros não têm concessão de redistribuição: os registros escritos a partir deles estão em <c4/>, ignorado pelo git (<c5/>), e o teste o diz e passa quando estão ausentes, a menos que <c6/>. Cada registro é lido pelo motor e por um leitor independente, e ADEV, TDEV e MTIE são comparados com o allantools { "2024.6" }. Registrado em <c7/>: no leitor distribuído, os registros TICC, a versão do cabeçalho e cinco mensagens de erro falharam nos limiares fixados antecipadamente; foram corrigidos e a comparação foi executada de novo sem alterações. Atingido, exceto um par: o MTIE de um registro de frequência difere do do allantools, porque o allantools integra a frequência menos a sua média (fixado como NOT MET; a comparação em condições equivalentes é atingida). A linha permanece MODELLED: os registros TICC são dados de relógio medidos recodificados no formato do contador pelo nosso script (nenhuma captura TICC real foi encontrada), e o leitor de referência tem o mesmo autor que o do motor.

seg-52778d17f4db = Conduzir o holdover com o seu próprio relógio: [clock_fit]
