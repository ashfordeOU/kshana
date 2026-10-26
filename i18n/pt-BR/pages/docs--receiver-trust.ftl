# docs--receiver-trust: translations (pt-BR)

# text
seg-adc34608c46b = Classe

# text
seg-2247a2344710 = Significado

# text
seg-fdbb9db68f1d = nenhuma

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Chave

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-a0cc45088f5f = GSV

# text
seg-7670cf4ceda3 = Padrão

# attr:alt
seg-26ab8544afba = Pontuação de confiança ao longo de uma travessia sintética, a partir de uma execução real do motor v{ $version } sobre examples/maritime-trust (um registro NMEA fictício de uma balsa em uma rota de Tallinn a Helsinque, { "3001" } épocas a { "1" } Hz). Três faixas compartilham um eixo de tempo. Em cima: a distância entre a posição que o receptor informa e a posição real da embarcação, que permanece dentro de poucos metros até cerca de { "1576" } s, quando o arrasto de posição roteirizado do registro a afasta, enquanto o receptor continua informando uma posição válida. No meio: a pontuação de confiança de { "0" } a { "100" }, não calculada durante os primeiros { "300" } s de calibração, na faixa nominal (pelo menos { "90" }) até o arrasto, depois caindo pela faixa degradada (pelo menos { "55" }) até a faixa não confiável. Embaixo: a faixa de cada época como uma fita colorida com seu nome. A pontuação é consultiva. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação. O registro é fictício para mostrar o formato e os monitores; não é uma medição e nada diz sobre o desempenho de qualquer receptor.

# attr:alt
seg-7000c522cc93 = O sinalizador de spoofing do próprio receptor frente aos alarmes do Kshana, a partir de uma execução real do motor v{ $version } sobre um registro UBX fictício ({ "200" } épocas a { "1" } Hz). O C/N0 cai { "20" } dB de { "80" } a { "90" } s e de { "120" } a { "130" } s; o receptor sinaliza de { "120" } a { "130" } s e de { "160" } a { "165" } s. Das { "140" } épocas comparadas após a calibração, { "11" } tiveram ambos sinalizando, { "6" } só o receptor, { "11" } só o Kshana e { "112" } nenhum. Nenhum dos lados é verdade de referência e a concordância não é validação. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# text
# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Fonte: <c1/>

# text
seg-4f10c2397fcc = Confiança no receptor: avaliação de um log real de receptor GNSS

# text
# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> lê um log de um receptor real de sistema global de navegação por satélite (GNSS), executa monitores de confiança sobre ele época por época e informa quando e por que a posição do receptor deixou de ser confiável. Também pode pontuar o log em relação a eventos e previsões que você declara <b>antes</b> da execução: se cada evento foi detectado a tempo e se uma queda modelada da densidade de portadora sobre ruído (C/N0) concorda com o que o receptor mediu.

# text
seg-63f24d5f2d5e = As observáveis são as do próprio receptor; os monitores e seus limiares são do motor e seus. Todo resultado traz esse rótulo, o SHA-256 do log e todos os limiares com que foi executado, de modo que uma execução pode ser repetida e auditada.

# text
# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Para uma embarcação em movimento, com pontuação ao vivo e um portão opcional na frente de um sistema de cartas, veja <a1><c1/></a1>.

# text
# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = Isto grava <c1/>, <c2/> (uma linha por época) e <c3/> (C/N0 médio ao longo do tempo com o estado de confiança abaixo) ao lado do cenário, e imprime um veredito de uma linha. O log de exemplo é sintético, feito para mostrar o formato; aponte <c4/> para o log do seu próprio receptor.

# text
# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = A figura acima é a demonstração de embarcação de <a1><c1/></a1>: um log inventado, uma pontuação consultiva.

# text
# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = O mesmo cenário roda a partir do Python (<c1/>), do pacote WebAssembly (<c2/>, com o log embutido) e da ferramenta <c3/> do servidor do Model Context Protocol (MCP).

# text
seg-1f3cc12b6230 = Logs que ele lê

# text
seg-23fd4a5bf5dd = O que é lido

# text
seg-2e1a655cf846 = Binário u-blox

# text
# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT C/N0, elevação e azimute por satélite, posição NAV-PVT, controle automático de ganho (AGC) do MON-RF e o indicador de jamming <c1/>, semana do NAV-TIMEGPS e os próprios indicadores do receptor: NAV-STATUS <c2/> e SEC-SIG (<c3/>, veja <a1>RECEIVER-PROTOCOLS.md</a1>)

# text
seg-cec582f4afa5 = Arquivo de observação RINEX { "3" }

# text
# c1: S
# c2: nav
seg-57708a636148 = códigos <c1/> (C/N0) por satélite e sinal; com um arquivo de navegação por difusão (<c2/>), as pseudodistâncias para a solução de posição do próprio motor

# text
seg-176c2493782e = CSV do Android GnssLogger

# text
# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = linhas <c1/>: C/N0 e <c2/> por satélite; linhas <c3/>: posição

# text
seg-d390120374a9 = Texto NMEA { "0183" }

# text
seg-9eb885aa79af = relação sinal-ruído GSV por satélite (dB-Hz, com ou sem o ID de sinal do { "4.10" }) e sua elevação e azimute, diluição da precisão e satélites usados do GSA, hora e posição do GGA e do RMC

# text
seg-7864926ce37e = Binário Septentrio ({ "0.38" }, somente leitura)

# text
seg-44675c4bdf40 = posição PVTGeodetic, C/N0 do MeasEpoch por satélite e sinal, contagem de bandas do RFStatus; veja <a1>RECEIVER-PROTOCOLS.md</a1>

# text
# c1: .pos
seg-a5367d75c5ee = Arquivo de solução RTKLIB (<c1/>)

# text
seg-37d28ca5ed00 = hora, posição (latitude/longitude ou ECEF, convertida) e satélites usados por época; arquivos em graus-minutos-segundos são recusados com uma mensagem

# text
seg-5e10ecb93f96 = Logs ASCII ou binários NovAtel OEM7

# text
# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = posição <c1/> (somente solução calculada), C/No <c2/> por satélite e sinal; os indicadores de jammer de <c3/> tornam-se o <c4/> da época (estado de jamming { "2" } quando o receptor sinaliza um jammer, { "1" } quando não; não existe indicador de spoofing no RXSTATUS), confrontados com os alarmes do Kshana pela comparação <c5/>

# text
seg-d4735b581cbf = Fluxos Monitor e PVT-monitor do GNSS-SDR como linhas JSON

# text
# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = C/N0 por canal, posição, satélites usados, HDOP, azimute e elevação; gerado por <c1/>

# text
# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Detalhes, fontes e limites destes três: <a1><c1/></a1>.

# text
# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Cada época que os leitores produzem também traz <c1/>, <c2/>, deslocamentos em bytes na entrada: a menor faixa contígua que contém os registros que contribuíram para ela, de modo que a fatia bruta exata possa ter o hash calculado para uma janela de evento. NMEA: todas as linhas lidas enquanto a época está vigente (um superconjunto quando uma linha não relacionada fica entre suas sentenças). UBX: os quadros da época. RINEX { "3" }: os registros da época, de cada linha <c3/> até a seguinte. Android: as linhas <c4/> da época (uma linha <c5/> apenas para uma época sem linhas <c6/>). Ausente em fluxo ao vivo e onde não está bem definido (RINEX { "2" }).

# text
# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = O arquivo entra por <c1/> (resolvido em relação à pasta do próprio cenário) ou embutido como <c2/> ou <c3/> (as únicas opções em um navegador).

# text
seg-3bc4f9c91950 = Um log de IMU como segundo sensor

# text
# c1: [log.imu]
seg-49b10ad5928e = <c1/> acrescenta um log inercial no mesmo relógio:

# text
# c1: heading0_deg
# c2: heading-course
# c3: heading_sensor = true
# c4: hdg_cog_tol_deg
# c5: csv
# c6: MACHINE-INPUTS.md
# c7: text
# c8: base64
# c9: path
seg-9e0560b09f5a = A taxa de guinada é integrada a partir de <c1/> e preenche o rumo onde quer que o log do receptor não traga nenhum, de modo que o monitor <c2/> (que precisa de <c3/> na plataforma) compara o rumo do giroscópio com o curso sobre o fundo. Um giroscópio deriva: o rumo só é tão bom quanto a janela de integração, e <c4/> define o que conta como divergência. O layout <c5/> está documentado em <c6/>. Os bytes da IMU fazem parte do hash do cenário e do hash do cenário de um pacote de evidências. O formato embutido (<c7/>/<c8/>) funciona em todas as superfícies; um <c9/> é recusado onde arquivos não são lidos.

# text
seg-fd3e6ef1cd93 = Plataforma: estática ou embarcação

# text
# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Os monitores acima supõem uma antena fixa. Um cenário declara a plataforma antes da execução em uma tabela <c1/> de nível superior; sem ela, a plataforma é <c2/> e nada muda.

# text
seg-3d6bc18bd83e = Por que esse valor

# text
seg-32f339f63acf = Acima da velocidade de serviço de cascos mercantes e da maioria das embarcações de passageiros, de modo que uma embarcação real nunca a alcança; muito abaixo da velocidade que um arrasto de posição implica. Uma embarcação mais lenta deve declarar um limite menor: quanto menor o limite, mais cedo o arrasto é detectado.

# text
seg-9506e8601857 = Um navio grande varia a velocidade bem abaixo de { "0.1" } m/s²; uma embarcação pequena e rápida chega a algumas décimas em uma mudança brusca de aceleração.

# text
seg-b0b6baaee456 = Um navio grande gira bem abaixo de { "1" } deg/s e uma embarcação pequena, em uma curva fechada, a alguns graus por segundo.

# text
seg-53d0fffb3c09 = Uma propriedade da instalação; um palpite seria um limiar oculto.

# text
# c1: true
seg-ac48403443f9 = Declarado <c1/> e ausente do log é um erro, de modo que um sensor ausente não pode passar por uma verificação limpa.

# text
# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = As chaves de embarcação são rejeitadas sob <c1/>. Para uma embarcação, o monitor <c2/> não roda, porque mede a distância até a média de calibração, o que é errado em uma antena em movimento; o <c3/> do resultado registra a plataforma e os limites usados.

# text
# c1: kshana nmea-scenario
seg-7551792a0cb4 = Os fluxos NMEA sintéticos de <a1><c1/></a1>, feitos para treinamento de tripulações, são aceitos pelo leitor NMEA e podem ser executados por este tipo de cenário como qualquer log NMEA.

# text
seg-18d7538bc56d = Monitores

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Cada monitor precisa de seus dados; um monitor cujos dados não estão no log não é executado e não consta em <c1/>. Os primeiros <c2/> segundos (padrão { "60" }) definem a linha de base e nunca geram alarme.

# text
seg-3be9ee05f087 = Alarma quando

# text
seg-98ead58c671d = Precisa de

# text
# c1: cn0_drop_db
seg-f6e6df453260 = o C/N0 médio dos satélites em comum com a linha de base cai <c1/> ou mais (padrão { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = os satélites rastreados ficam <c1/> ou mais abaixo da mediana da linha de base (padrão { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = a leitura de AGC se afasta de sua linha de base em mais de <c1/> desvios padrão (padrão { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF ou <c1/> do Android

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = o <c1/> da u-blox excede <c2/> (padrão { "80" } de { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = a própria posição do receptor está a mais de <c1/> de sua média de calibração (padrão { "50" } m)

# text
seg-6a3fec1214b9 = uma posição informada

# text
seg-4c05faf783eb = o monitoramento de integridade autônomo pelo receptor (RAIM) por paridade sobre a solução de ponto único do próprio motor rejeita o conjunto de medições

# text
# c1: nav
seg-037ab193613c = log RINEX com <c1/>

# text
seg-8890a4ebf231 = a solução de ponto único do motor falha com cinco ou mais satélites

# text
seg-0a5a708ac75b = o relógio do receptor se afasta de sua reta prevista em mais do que o desvio mínimo detectável do ruído de sua calibração

# text
seg-31b64b635261 = Perfil calibrado (opcional).

# text
# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> substitui os três limiares de interferência por valores calibrados no conjunto de dados público JammerTest { "2024" } (um u-blox ZED-F9P por cenário; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. A calibração foi pré-registrada (<c5/>) e o perfil é MODELLED, ajustado em uma campanha pública: seu limiar <c6/> <b>não atingiu</b> o limiar de falsos alarmes em conjunto reservado fixado antecipadamente ({ "0.0231" } contra { "0.02" }); os limiares de AGC e de indicador de jamming e o limiar da união (falsos alarmes { "0.033" }, detecção { "0.81" }) foram atingidos (<c7/>). Vale para aquele tipo de receptor naquele evento, contra janelas de ataque programadas, e foi calibrado nos logs CSV do conjunto de dados (seus logs UBX dão mais falsos alarmes em duas pastas). Um resultado executado com o perfil repete os limiares aplicados e traz um <c8/> dizendo tudo isso. Sem o perfil, valem os padrões acima e toda saída permanece inalterada.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Para uma plataforma <c1/>, os monitores de plataforma móvel também rodam (limiares em uma tabela <c2/> de nível superior, todos os padrões documentados em <c3/>); cada um precisa de seus dados e só consta em <c4/> quando chegou a decidir:

# text
seg-4b2840d9d0af = a mudança de posição diverge da velocidade e do curso informados, ou implica uma velocidade, aceleração ou taxa de giro acima dos limites da embarcação

# text
seg-656c19cb5b52 = posições; velocidade e curso (RMC ou VTG) para a parte de dead-reckoning

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = o rumo do giroscópio e o curso sobre o fundo diferem em mais de <c1/> (velocidade acima de <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = rumo HDT, THS ou VHW, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = a velocidade na água e a velocidade sobre o fundo diferem em mais de <c1/>

# text
seg-c9101740b235 = VHW ou VBW, e velocidade sobre o fundo

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = a altitude GGA difere de <c1/> em mais de <c2/>

# text
# c1: antenna_height_m
seg-811ec460249c = altitude GGA, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = a dispersão do C/N0 entre os satélites cai para <c1/> de sua mediana de calibração

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = o C/N0 dos satélites em comum subiu <c1/> em média e <c2/> deles subiram

# text
seg-faae07674361 = os tempos de épocas consecutivas avançam de forma irregular, retrocedem ou se afastam do relógio do host

# text
seg-f799a53897ed = tempo NMEA; relógio do host para a última parte

# text
seg-ee4913c9f2ed = o receptor informa uma falha de autenticação OSNMA (um status informado é lido; nada é verificado; para verificar o OSNMA a partir das próprias páginas I/NAV, veja <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = sentença de status <c1/>

# text
seg-ce072f2ebb6c = Uma época é <b>não confiável</b> quando o RAIM, o monitor de relógio, uma falha de solução ou um salto de posição alarma, ou quando a queda de C/N0 atinge o dobro de seu limiar; <b>degradada</b> em qualquer outro alarme; e <b>nominal</b> nos demais casos.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = O caminho do motor (<c1/>, <c2/>, <c3/>) é o mesmo cálculo da referência independente de spoofing do JammerTest { "2024" } em <c4/>: <c5/> verifica que, nos oito inícios publicados, o primeiro alarme cai na mesma época e é do mesmo tipo.

# text
seg-83be3c22a577 = Pontuação de confiança (plataforma de embarcação)

# text
# c1: statistic / threshold
seg-812991f245cd = Para uma embarcação, toda época após a calibração também recebe uma pontuação de { "0" } a { "100" } e os motivos pelos quais não é { "100" }. O mapeamento é determinístico e fixado antes de qualquer log ser pontuado: sem aprendizado, nada ajustado a eventos. Cada monitor reduz sua evidência a uma razão <c1/> (um alarme em { "1" } ou mais); uma razão custa à pontuação

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = de modo que um monitor não custa nada enquanto está abaixo de <c1/> de seu limiar (padrão { "0.5" }), custa metade de seu peso no limiar e todo o peso em <c2/> vezes o limiar (padrão { "1.5" }); a pontuação é não crescente em toda estatística. Uma fonte que não informa em uma época mantém sua última estatística por <c3/> (padrão { "10" } s: dois ciclos de uma sentença de C/N0 enviada a cada { "5" } s), tanto como alarme quanto como dedução.

# text
# c1: floor(x * 10 + 0.5) / 10
# c2: cn0-drop
# c3: agc
# c4: jam-ind
# c5: loss-of-lock
# c6: position-jump
# c7: raim
# c8: clock
# c9: solve-failure
# c10: kinematic
# c11: heading-course
# c12: speed-log
# c13: sea-level
# c14: cn0-spread
# c15: cn0-rise
# c16: time-consistency
# c17: osnma
# c18: geometry
seg-6c06de24ebfe = O arredondamento é para cima na metade (<c1/>), a faixa é a da pontuação arredondada, e o limite vem antes do arredondamento. Apenas os monitores cujos pontos estão acima de zero constam nas deduções, com sua razão e seus pontos não arredondados, primeiro os de maior pontuação; deduções com pontos iguais são listadas na ordem dos nomes dos monitores <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Um monitor cujo teste é passa ou falha (uma solução que falhou, uma autenticação que falhou) recebe a razão { "1.5" }, o peso total. Os pontos listados são os anteriores ao limite em { "0" }.

# text
seg-e36961d46c41 = Peso (pontos)

# text
seg-673f6adcd681 = Por quê

# text
seg-399be3301faf = uma falha de autenticação é uma declaração, não uma estatística

# text
seg-69cfc61477d6 = uma posição falsificada precisa contradizer a física ou as verificações do próprio receptor, e o tempo não pode retroceder; uma violação com força total ({ "1.5" } vez o limiar: { "60" } pontos, pontuação { "40" }) é não confiável, e no limiar ({ "30" } pontos, pontuação { "70" }) é degradada

# text
seg-7fa1e6e67411 = um sensor independente em desacordo é degradado; dois com força total são não confiáveis

# text
seg-4c4825d2957a = o ambiente de sinal, ou uma verificação pouco informativa

# text
seg-b5a364a03714 = o ambiente é hostil; isso sozinho não mostra que a posição está errada

# text
# c1: [geometry]
seg-4e3749965405 = até { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = não é um peso nesta rampa: nada, a menos que o céu seja ruim, e então até <c1/> ({ "15" }); a geometria sozinha chega a degradado, nunca a não confiável, e não gera alarme (veja "Geometria" abaixo)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Os limites das faixas decorrem dos pesos: o monitor mais leve que alarma custa { "12.5" } pontos em seu limiar, de modo que qualquer alarme tira a pontuação da faixa nominal; nenhum monitor isolado com menos de { "60" } pontos pode alcançar sozinho a faixa não confiável (vários juntos podem). O resultado registra o modelo de pontuação (<c1/>) e cada época traz <c2/>: quais monitores deduziram, suas razões e seus pontos. Para uma embarcação, o estado da época é a faixa de sua pontuação.

# text
seg-6f620668ee85 = Geometria: degradação natural distinta da inconsistência semelhante a ataque

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Um receptor ao lado de um guindaste de cais, em uma eclusa ou sob um casco alto perde satélites e sua posição piora por um motivo que não é um ataque. A partir da { "0.36" }, seguindo a nota de projeto de geometria (<c1/>, seção { "4" }), toda época traz sua <b>geometria de satélites</b>, a pontuação de uma embarcação tem um <b>monitor de geometria</b>, e toda dedução traz uma <b>classe</b>: <c2/> (o céu), <c3/> (o ambiente de sinal) ou <c4/> (evidência semelhante a ataque).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>De onde vem a geometria.</b> A elevação e o azimute de cada satélite rastreado (NMEA GSV, UBX NAV-SAT), dos quais a diluição da precisão (DOP) é derivada com o único kernel de DOP do motor (<c1/>, VALIDATED em relação ao gnss_lib_py): <c2/>. Na falta disso, o DOP e os satélites usados que o receptor declara (NMEA GSA): <c3/>. As posições no céu e o GSA contam durante o <c4/> da pontuação (padrão { "10" } s), porque muitos barramentos enviam o GSV a cada poucos segundos; um conjunto GSV incompleto em uma época (o fim de um trecho, uma sentença perdida) não é usado. Um log com nenhum dos dois, como um NMEA só com GGA e RMC, ou os logs Android e RINEX atualmente, recebe o status <b><c5/></b> com a nota "geometria desconhecida": o motor não adivinha uma geometria que não lhe foi dada, e o monitor de geometria não roda.

# text
seg-a267da42ac3d = satélites suficientes e DOP dentro dos limiares

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = um ou mais motivos: <c1/>, <c2/>, <c3/> e (apenas informativo, fora da pontuação) <c4/> quando todos os satélites rastreados estão em uma só metade do horizonte

# text
seg-c255a66d3813 = o log não fornece geometria de satélites para esta época

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = O status é descritivo, e o que importa para a pontuação é o rótulo (abaixo): <c1/> inclui o caso informativo <c2/>, que pode vir com DOP bom ou razoável, e apenas um rótulo <c3/> é pontuado.

# text
# c1: geometry.label
# c2: good
# c3: hdop_good
# c4: pdop_good
# c5: used_good
# c6: poor
# c7: hdop_max
# c8: pdop_max
# c9: min_used
# c10: fair
# c11: unknown
seg-93e49a562493 = <b>O rótulo</b> (sempre informado, nunca pontuado). O <c1/> de cada época é <c2/> (HDOP no máximo <c3/> { "2" }, PDOP no máximo <c4/> { "3" } e ao menos <c5/> { "6" } satélites), <c6/> (HDOP acima de <c7/> { "4" }, PDOP acima de <c8/> { "6" } ou menos de <c9/> { "5" } satélites), <c10/> entre os dois, ou <c11/>. A nota da época sempre começa com o rótulo e os números, por exemplo "geometria razoável: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satélites; não pontuada (a pontuação só deduz acima de HDOP { "4" }, PDOP { "6" } ou abaixo de { "5" } satélites)", e acrescenta ", perda de sinal" quando ela ocorre.

# text
# c1: max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)
# c2: cap_points
# c3: full_ratio
# c4: floor
# c5: degraded_min
# c6: min(cap_points, 100 - floor)
# c7: [score]
# c8: degraded_min
# c9: degraded_min
# c10: 100 - degraded_min
# c11: floor
# c12: degraded_min
# c13: monitors_run
# c14: [score.weights]
# c15: geometry_model.cap_in_force
# c16: geometry_model.floor_in_force
seg-13838e036fae = <b>O monitor de geometria</b> (pontuação de embarcação). Ele <b>não deduz nada a menos que a geometria seja ruim</b>: sua razão é <c1/>, e enquanto ela é no máximo { "1" } (geometria boa ou razoável, inclusive um céu aberto só com GPS de { "8" } satélites), não custa nada, de modo que um log assim é pontuado exatamente como na { "0.35" }. Acima de { "1" }, a dedução cresce linearmente até <c2/> ({ "15" }) em <c3/> ({ "1.5" } vez os limiares: HDOP { "6" }, PDOP { "9" }, { "3" } satélites): { "7.5" } pontos na razão { "1.25" } (HDOP { "5" }, ou { "4" } satélites), { "15" } a partir de { "1.5" } (pontuação { "85" }, degradada). Sozinho, nunca pode levar a pontuação abaixo de <c4/> (padrão: o <c5/> da pontuação, { "55" }), de modo que a geometria sozinha chega no máximo à faixa degradada e nunca à não confiável: o limite em vigor é <c6/>, de modo que uma tabela <c7/> que eleva <c8/> (uma da { "0.35" } com <c9/> { "90" }, por exemplo) reduz o limite para <c10/> em vez de ser recusada, e um <c11/> definido abaixo de <c12/> é recusado. O monitor não gera alarme; consta por último em <c13/> quando decidiu em alguma época (uma embarcação cujo log fornece a geometria), e não entra na identidade da { "0.35" }; não é uma entrada de <c14/> (defini-la é recusado), e o limite e o piso em vigor são registrados em <c15/> e <c16/>. A nota de uma época ruim diz por quê, por exemplo "geometria ruim: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satélites; degradada pela geometria: HDOP { "5.200" } acima de { "4" } (derivado de { "7" } satélites registrados); não é uma inconsistência".

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Classes.</b> Toda dedução (<c1/>):

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (geometria ruim); <c2/> quando todo satélite perdido em relação à linha de base de calibração estava abaixo de <c3/> em seu último relatório

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> nos demais casos; <c7/> durante perda de sinal (abaixo)

# text
# c1: kinematic
# c2: heading-course
# c3: speed-log
# c4: sea-level
# c5: time-consistency
# c6: clock
# c7: raim
# c8: position-jump
# c9: osnma
# c10: solve-failure
# c11: geometry
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; e <c11/> quando a geometria é ruim e o HDOP declarado diverge do céu declarado (abaixo)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>A proteção contra um céu ruim forjado.</b> Um spoofer poderia enviar um GSV esparso, ou informar um HDOP alto, para ganhar tolerância. O motor rotula e não perdoa: nenhuma outra verificação é ampliada por uma geometria ruim, e o HDOP que o receptor declara (GSA dentro da retenção, senão GGA) é comparado com o HDOP derivado do céu que ele declara. Quando diferem em mais de <c1/> ({ "1.0" }, ou { "25" } % do HDOP derivado, o que for maior), a época traz <c2/> e, quando a geometria é ruim, sua dedução é classificada como <c3/>. Com geometria boa ou razoável, a divergência é informada e não pontuada: nada é deduzido a menos que a geometria seja ruim. Esta é uma escolha deliberada ({ "0.36" }): "zero a menos que ruim" vale para toda época, de modo que geometria boa e razoável é pontuada exatamente como na { "0.35" }, e um HDOP forjado nunca passa em silêncio. O indicador (<c4/>) está em toda época do resultado e em toda linha ao vivo, a nota diz "…além da tolerância: informado, não pontuado (a geometria não é ruim)" ou "…: a dedução de geometria é classificada como inconsistência", <c5/> conta as épocas, e a página de resumo de evidências mostra a contagem, inclusive zero. Os { "25" } % são uma escolha de engenharia <b>REPRESENTATIVE</b>, não um valor medido nem normatizado: um receptor que resolve um relógio por constelação, ou com um subconjunto dos satélites que rastreia (uma máscara de elevação, um corte de C/N0, uma exclusão por RAIM), declara um HDOP que difere do HDOP de relógio único de todos os satélites rastreados por uma quantia que cresce com o HDOP, de modo que uma tolerância fixa sozinha leria como inconsistência uma geometria ruim natural. Uma diferença maior ainda é lida como tal. Uma dedução classificada como <c6/> é uma afirmação sobre o céu, não uma constatação de que nenhum ataque ocorreu.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>Perda de sinal não é o céu.</b> Quando satélites que o receptor lista como visíveis (acima de <c1/>) não são rastreados, o motor também deriva o DOP de todos os satélites visíveis. Se esse DOP dos visíveis está dentro dos limiares e nada é rastreado ou os satélites não rastreados estão espalhados pelo horizonte (não confinados a uma metade dele), o céu estava lá e o sinal não: a época traz <c2/>, a nota "satélites visíveis mas não rastreados: ambiente de sinal, não geometria", e a dedução de geometria é classificada como <c3/>. Satélites não rastreados confinados a uma metade do horizonte continuam sendo lidos como céu bloqueado (uma parede, um penhasco, um cais). Uma obstrução de dois lados (um desfiladeiro ou um fiorde estreito) é lida como perda de sinal até que uma linha de horizonte seja configurada. Os sentinelas de ausência de posição do receptor não são DOP: um HDOP ou PDOP declarado de { "99" } ou mais, qualidade GGA { "0" } e modo GSA { "1" } não dão DOP declarado.

# text
# c1: [geometry]
seg-0f218d21843b = chave <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = escolhido (nota de projeto { "4.2" }): com <c1/> { "1.5" } m, um HDOP { "4" } é um 2drms de { "12" } m, o <c2/> da verificação cinemática. A IEC 61108-1 é comumente citada como declarando seus requisitos de exatidão para HDOP ≤ { "4" } (ou PDOP ≤ { "6" }): lembrado da literatura secundária sobre receptores GNSS, sem consulta a uma fonte secundária específica e sem leitura da norma; a ser verificado no texto da norma

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = o limiar de disponibilidade de PDOP de <c1/>; GPS SPS Performance Standard, 5ª ed. ({ "2020" }), PDOP ≤ { "6" }, como citado em <c2/>; a ser verificado no texto da norma

# text
seg-2fffa47378ec = um a mais do que uma posição exige, de modo que uma única perda não encerra a posição; o mínimo com uma medição redundante para o RAIM

# text
# c1: hdop_max
seg-7dc0baed2bc4 = uma entrada declarada para o vínculo 2drms de <c1/>; defina o valor do próprio receptor

# text
seg-7b5778d93d40 = { "1.0" } de HDOP

# text
seg-093cff5d1150 = escolhido (nota de projeto { "4.2" }): a parte absoluta da tolerância; uma divergência além da tolerância não é geometria

# text
seg-be5c3aefd942 = escolha de engenharia REPRESENTATIVE: a parte relativa, para receptores com relógios por constelação ou soluções com subconjunto

# text
seg-e71c6876114b = nota de projeto { "4.3" }: satélites perdidos abaixo dele são perdidos para o céu; uma linha de horizonte (item { "1" } da { "0.36" }) vai estendê-lo

# text
seg-bebe291ca1c0 = geométrico, informativo: todos os satélites em uma metade do horizonte

# text
seg-06519582227b = nota de projeto { "4.2" }: a geometria sozinha move a pontuação de nominal para degradada e nunca para não confiável; deduzida apenas quando a geometria é ruim (decisão do fundador B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = o <c1/> da própria pontuação: a rampa chega a <c2/> em { "1.5" } vez os limiares de geometria ruim

# text
# c1: degraded_min
seg-e922a5342a3c = o <c1/> da pontuação ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = a geometria sozinha nunca alcança a faixa não confiável; o limite em vigor é <c1/>; um piso abaixo de <c2/> é recusado

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, apenas o rótulo: metade de <c1/> (a razão de início da pontuação da { "0.35" })

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, apenas o rótulo: metade de <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, apenas o rótulo: um a mais do que <c1/>, de modo que uma única perda ainda deixa uma medição redundante

# text
# c1: epochs[].geometry
# c2: status
# c3: reasons
# c4: source
# c5: n_used
# c6: hdop
# c7: pdop
# c8: vdop
# c9: open_fraction
# c10: max_azimuth_gap_deg
# c11: age_s
# c12: reported_hdop
# c13: reported_derived_mismatch
# c14: note
# c15: in_view
# c16: low_elev_deg
# c17: signal_loss
# c18: label
# c19: class
# c20: geometry_model
# c21: geometry_summary
# c22: score_model.weights
# c23: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c24: tests/geometry_trust_no_change.rs
# c25: $PKSHT
# c26: tests/geometry_corpus_identity.rs
# c27: $PKSHT
# c28: inconsistency
# c29: tests/geometry_trust.rs
# c30: environment
# c31: geometry
# c32: inconsistency
seg-ef7a4c24e870 = <b>O que mudou nas saídas, e o que não mudou.</b> Nenhuma pontuação muda a menos que a geometria seja ruim; o rótulo é sempre informado. Chaves acrescentadas: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> arredondado a { "0.001" }, <c9/> (nulo até que uma linha de horizonte seja configurada), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satélites listados acima de <c16/>), <c17/>, <c18/>), <c19/> em toda dedução e, ao final, <c20/> (limiares, retenção, o limite e o piso em vigor, procedência, regras de classe) e <c21/> (épocas por status, por rótulo e por classe de dedução, e as épocas com divergência de HDOP declarado); <c22/> é como na { "0.35" }. Dois testes prendem isso aos bytes da linha de base "{ "0.36" } portátil" depois que essas chaves são removidas (os hashes da { "0.35.0" }, rebaseados quando o motor passou à matemática portátil e mantidos nos testes como registro do que a { "0.35.0" } publicou: <c23/>). <c24/> prende toda saída de ambas as sessões de exemplo (JSON de resultado, CSV, SVG, veredito, linhas ao vivo reproduzidas, <c25/>, Prometheus, CEF, LEEF). <c26/> prende o resultado em lote, o resumo, as linhas ao vivo e o <c27/> de todo corpus NMEA de embarcação versionado (a demonstração e as fixtures de referência marítimas, cada uma também como céu aberto só com GPS com { "8" } satélites, e os cenários de treinamento de tripulação gerados a partir de suas sementes); nos dois cenários de treinamento cujo jamming torna a geometria ruim, toda época que não é ruim é idêntica e toda época ruim difere apenas pela dedução de geometria. Um log cuja geometria é ruim perde até { "15" } pontos que não perdia na { "0.35" }; essa é a mudança pretendida. Na demonstração, o arrasto de posição é lido como <c28/>; <c29/> edita o log para mascarar o céu oeste (razoável: rotulado, não pontuado), para mascará-lo junto com dois satélites a leste (ruim: deduções de geometria, perda de travamento <c30/> porque satélites altos também se foram), para perder apenas satélites abaixo de { "15" }° (perda de travamento <c31/>) e para declarar um HDOP que o céu não explica (a dedução de geometria ruim passa a ser <c32/>). Os limiares são MODELLED: escolhidos, não ajustados a nenhum log; nada aqui afirma com que frequência a degradação natural e os ataques são distinguidos em dados reais.

# text
seg-8ddaf82ba00b = Declaração de eventos e previsões

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Para cada evento, o resultado dá os falsos alarmes entre a calibração e o início, o primeiro alarme e seus monitores, a latência, o desfecho (<c1/>, <c2/>, <c3/> ou <c4/>) e a queda mediana observada de C/N0 contra a previsão (<c5/>, <c6/>, <c7/> ou <c8/>). A divergência é informada, nunca ajustada para desaparecer: as tolerâncias estão no cenário, e o cenário está no hash do resultado.

# text
seg-3715df3fd8f7 = O que isto não afirma

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Os monitores de confiança são MODELLED: seus limiares são entradas, e seu desempenho de detecção em interferência real é o que a pontuação de eventos mede, não algo que este tipo de cenário afirme. Nas sessões de spoofing do JammerTest { "2024" }, os monitores do caminho do motor capturam alguns inícios em até { "10" } s e se atrasam em outros; veja a linha "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" em <a1><c1/></a1> para os números. Uma previsão que concorda com um log é um ponto de dados, não uma validação.

# text
seg-0c413c1a491c = <s1>Anterior</s1>Correspondência de resiliência

# text
seg-63fc2b340fd1 = <s1>Próximo</s1>Confiança marítima
