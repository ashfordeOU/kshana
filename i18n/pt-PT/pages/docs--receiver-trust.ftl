# docs--receiver-trust: translations (pt-PT)

# text
seg-adc34608c46b = Classe

# text
seg-2247a2344710 = Significado

# text
seg-fdbb9db68f1d = none

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Chave

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-7670cf4ceda3 = Predefinição

# text
seg-a0cc45088f5f = GSV

# attr:alt
seg-26ab8544afba = Pontuação de confiança ao longo de uma travessia sintética, a partir de uma execução real do motor v{ $version } sobre examples/maritime-trust (um registo NMEA fictício de um ferry numa rota de Tallinn a Helsínquia, { "3001" } épocas a { "1" } Hz). Três faixas partilham um eixo de tempo. Em cima: a distância entre a posição que o recetor indica e a posição real da embarcação, que se mantém dentro de alguns metros até cerca de { "1576" } s, quando o arrastamento de posição programado no registo a afasta, enquanto o recetor continua a indicar uma solução de posição válida. Ao meio: a pontuação de confiança de { "0" } a { "100" }, não calculada durante os primeiros { "300" } s de calibração, na faixa nominal (pelo menos { "90" }) até ao arrastamento, descendo depois pela faixa degraded (pelo menos { "55" }) até à faixa untrusted. Em baixo: a faixa de cada época como uma fita colorida com o seu nome. A pontuação é consultiva. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação. O registo é fictício para mostrar o formato e os monitores; não é uma medição e nada diz sobre o desempenho de qualquer recetor.

# attr:alt
seg-7000c522cc93 = O indicador de spoofing do próprio recetor posto ao lado dos alarmes do Kshana, a partir de uma execução real do motor v{ $version } sobre um registo UBX fictício ({ "200" } épocas a { "1" } Hz). O C/N0 desce { "20" } dB entre { "80" } e { "90" } s e entre { "120" } e { "130" } s; o recetor assinala { "120" } a { "130" } s e { "160" } a { "165" } s. Das { "140" } épocas comparadas após a calibração, { "11" } tiveram ambos a assinalar, { "6" } só o recetor, { "11" } só o Kshana e { "112" } nenhum. Nenhum dos lados é verdade de referência e a concordância não é validação. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# text
# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Fonte: <c1/>

# text
seg-4f10c2397fcc = Confiança no recetor: avaliar um registo de um recetor GNSS real

# text
# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> lê um registo de um recetor real de sistema global de navegação por satélite (GNSS), executa monitores de confiança sobre ele época a época, e indica quando e porquê a posição do recetor deixou de ser fiável. Pode também pontuar o registo face a eventos e previsões que indique <b>antes</b> da execução: se cada evento foi detetado a tempo, e se uma queda modelada da densidade de portadora-ruído (C/N0) concorda com o que o recetor mediu.

# text
seg-63f24d5f2d5e = As observáveis são as do próprio recetor; os monitores e os seus limiares são os do motor e os seus. Cada resultado traz essa etiqueta, o SHA-256 do registo e todos os limiares com que foi executado, de modo que uma execução possa ser repetida e auditada.

# text
# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Para uma embarcação em andamento, com uma pontuação em direto e uma barreira opcional à frente de um sistema de cartas, consulte <a1><c1/></a1>.

# text
# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = Isto escreve <c1/>, <c2/> (uma linha por época) e <c3/> (C/N0 médio ao longo do tempo com o estado de confiança por baixo) junto ao cenário, e imprime um veredicto de uma linha. O registo de exemplo é sintético, feito para mostrar o formato; aponte <c4/> para o registo do seu próprio recetor.

# text
# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = A figura acima é a demonstração de embarcação de <a1><c1/></a1>: um registo inventado, uma pontuação consultiva.

# text
# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = O mesmo cenário executa-se a partir de Python (<c1/>), a partir do pacote WebAssembly (<c2/>, com o registo em linha) e a partir da ferramenta <c3/> do servidor Model Context Protocol (MCP).

# text
seg-1f3cc12b6230 = Registos que lê

# text
seg-23fd4a5bf5dd = O que é lido

# text
seg-2e1a655cf846 = binário u-blox

# text
# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT C/N0 por satélite, elevação e azimute, posição NAV-PVT, controlo automático de ganho (AGC) MON-RF e o indicador de jamming <c1/>, semana NAV-TIMEGPS, e os indicadores do próprio recetor: NAV-STATUS <c2/> e SEC-SIG (<c3/>, ver <a1>RECEIVER-PROTOCOLS.md</a1>)

# text
seg-cec582f4afa5 = ficheiro de observação RINEX { "3" }

# text
# c1: S
# c2: nav
seg-57708a636148 = códigos <c1/> (C/N0) por satélite e sinal; com um ficheiro de navegação de difusão (<c2/>), as pseudodistâncias para a posição calculada pelo próprio motor

# text
seg-176c2493782e = CSV do GnssLogger do Android

# text
# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = linhas <c1/>: C/N0 e <c2/> por satélite; linhas <c3/>: posição

# text
seg-d390120374a9 = texto NMEA { "0183" }

# text
seg-9eb885aa79af = relação sinal-ruído GSV por satélite (dB-Hz, com ou sem o identificador de sinal { "4.10" }) e a sua elevação e azimute, diluição da precisão e satélites usados GSA, hora e posição GGA e RMC

# text
seg-7864926ce37e = binário Septentrio ({ "0.38" }, apenas leitura)

# text
seg-44675c4bdf40 = posição PVTGeodetic, C/N0 MeasEpoch por satélite e sinal, contagem de bandas RFStatus; ver <a1>RECEIVER-PROTOCOLS.md</a1>

# text
# c1: .pos
seg-a5367d75c5ee = ficheiro de solução RTKLIB (<c1/>)

# text
seg-37d28ca5ed00 = hora, posição (latitude/longitude ou ECEF, convertida) e satélites usados por época; os ficheiros em graus-minutos-segundos são recusados com uma mensagem

# text
seg-5e10ecb93f96 = registos NovAtel OEM7 ASCII ou binários

# text
# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = posição <c1/> (apenas solução calculada), C/No <c2/> por satélite e sinal; os indicadores de emissor de jamming <c3/> tornam-se o <c4/> da época (estado de jamming { "2" } quando o recetor assinala um emissor de jamming, { "1" } quando não; não existe indicador de spoofing no RXSTATUS), confrontados com os alarmes do Kshana pela comparação <c5/>

# text
seg-d4735b581cbf = Fluxos GNSS-SDR Monitor e PVT-monitor como linhas JSON

# text
# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = C/N0 por canal, posição calculada, satélites usados, HDOP, azimute e elevação; produzido por <c1/>

# text
# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Pormenores, fontes e limites destes três: <a1><c1/></a1>.

# text
# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Cada época que os leitores produzem traz também <c1/>, desvios em bytes <c2/> na entrada: o menor intervalo contíguo que contém os registos que contribuíram para ela, de modo que a fatia bruta exata possa ser calculada em hash para uma janela de evento. NMEA: todas as linhas lidas enquanto a época está atual (um superconjunto quando uma linha não relacionada se encontra entre as suas frases). UBX: as tramas da época. RINEX { "3" }: os registos da época desde cada linha <c3/> até à seguinte. Android: as linhas <c4/> da época (uma linha <c5/> apenas para uma época sem linhas <c6/>). Ausente para um fluxo em direto e sempre que não está bem definido (RINEX { "2" }).

# text
# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = O ficheiro entra por <c1/> (resolvido relativamente à pasta do próprio cenário), ou em linha como <c2/> ou <c3/> (as únicas opções num navegador).

# text
seg-3bc4f9c91950 = Um registo IMU como segundo sensor

# text
# c1: [log.imu]
seg-49b10ad5928e = <c1/> acrescenta um registo inercial no mesmo relógio:

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
seg-9e0560b09f5a = A velocidade de guinada é integrada a partir de <c1/> e preenche o rumo sempre que o registo do recetor não o contém, pelo que o monitor <c2/> (que precisa de <c3/> na plataforma) compara o rumo do giroscópio com o rumo sobre o fundo. Um giroscópio deriva: o rumo é tão bom quanto a janela de integração, e <c4/> decide o que conta como discordância. O formato <c5/> está documentado em <c6/>. Os bytes do IMU fazem parte do hash do cenário e do hash do cenário de um pacote de evidências. Em linha (<c7/>/<c8/>) funciona em todas as superfícies; um <c9/> é recusado onde os ficheiros não são lidos.

# text
seg-fd3e6ef1cd93 = Plataforma: estática ou embarcação

# text
# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Os monitores acima assumem uma antena fixa. Um cenário declara a plataforma antes da execução numa tabela <c1/> de nível superior; sem ela, a plataforma é <c2/> e nada muda.

# text
seg-3d6bc18bd83e = Porque esse valor

# text
seg-32f339f63acf = Acima da velocidade de serviço dos cascos mercantes e da maioria das embarcações de passageiros, pelo que uma embarcação real nunca a atinge; muito abaixo da velocidade que um arrastamento de posição implica. Uma embarcação mais lenta deve declarar um limite mais baixo: quanto mais baixo o limite, mais cedo o arrastamento é detetado.

# text
seg-9506e8601857 = Um navio grande altera a velocidade bem abaixo de { "0.1" } m/s²; uma embarcação pequena e rápida atinge algumas décimas numa mudança brusca de aceleração.

# text
seg-b0b6baaee456 = Um navio grande vira bem abaixo de { "1" } deg/s e uma embarcação pequena numa curva fechada a poucos.

# text
seg-53d0fffb3c09 = Uma propriedade da instalação; um palpite seria um limiar oculto.

# text
# c1: true
seg-ac48403443f9 = Declarado <c1/> e ausente do registo é um erro, de modo que um sensor em falta não possa passar por uma verificação limpa.

# text
# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = As chaves de embarcação são rejeitadas em <c1/>. Para uma embarcação, o monitor <c2/> não é executado, porque mede a distância à média de calibração, o que é errado numa antena em movimento; o <c3/> do resultado regista a plataforma e os limites usados.

# text
# c1: kshana nmea-scenario
seg-7551792a0cb4 = Os fluxos NMEA sintéticos de <a1><c1/></a1>, feitos para formação de tripulações, são aceites pelo leitor NMEA e podem ser executados por este tipo de cenário como qualquer registo NMEA.

# text
seg-18d7538bc56d = Monitores

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Cada monitor precisa dos seus dados; um monitor cujos dados não estão no registo não é executado e não consta de <c1/>. Os primeiros <c2/> segundos (predefinição { "60" }) definem a linha de base e nunca dão alarme.

# text
seg-3be9ee05f087 = Dá alarme quando

# text
seg-98ead58c671d = Precisa de

# text
# c1: cn0_drop_db
seg-f6e6df453260 = o C/N0 médio dos satélites comuns com a linha de base desce <c1/> ou mais (predefinição { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = os satélites seguidos ficam <c1/> ou mais abaixo da mediana da linha de base (predefinição { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = a leitura do AGC afasta-se da sua linha de base mais de <c1/> desvios-padrão (predefinição { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF ou <c1/> do Android

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = o <c1/> do u-blox excede <c2/> (predefinição { "80" } de { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = a posição calculada pelo próprio recetor está a mais de <c1/> da sua média de calibração (predefinição { "50" } m)

# text
seg-6a3fec1214b9 = uma posição comunicada

# text
seg-4c05faf783eb = a monitorização autónoma da integridade pelo recetor (RAIM) por paridade, sobre a solução de ponto único do próprio motor, rejeita o conjunto de medições

# text
# c1: nav
seg-037ab193613c = registo RINEX com <c1/>

# text
seg-8890a4ebf231 = a solução de ponto único do motor falha com cinco ou mais satélites

# text
seg-0a5a708ac75b = o relógio do recetor afasta-se da sua reta prevista mais do que o desvio mínimo detetável do seu ruído de calibração

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
seg-a73f2c2dfc9a = <c1/> substitui os três limiares de interferência por valores calibrados no conjunto de dados público JammerTest { "2024" } (um u-blox ZED-F9P por cenário; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. A calibração foi pré-registada (<c5/>) e o perfil é MODELLED, ajustado numa única campanha pública: o seu limiar <c6/> <b>não atingiu</b> o limiar de falsos alarmes fixado antecipadamente sobre o conjunto reservado ({ "0.0231" } contra { "0.02" }); os limiares do AGC e do indicador de jamming e o limiar da união (falsos alarmes { "0.033" }, deteção { "0.81" }) foram satisfeitos (<c7/>). Vale para esse tipo de recetor nesse evento, face a janelas de ataque programadas, e foi calibrado nos registos CSV do conjunto de dados (os seus registos UBX dão mais falsos alarmes em duas pastas). Um resultado executado com o perfil repete os limiares que aplicou e traz uma <c8/> que diz tudo isto. Sem o perfil aplicam-se as predefinições acima e todas as saídas ficam inalteradas.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Para uma plataforma <c1/>, os monitores de plataforma em movimento também são executados (limiares numa tabela <c2/> de nível superior, cada predefinição documentada em <c3/>); cada um precisa dos seus dados e só consta de <c4/> quando chegou a decidir:

# text
seg-4b2840d9d0af = a variação de posição discorda da velocidade e do rumo comunicados, ou implica uma velocidade, aceleração ou taxa de viragem acima dos limites da embarcação

# text
seg-656c19cb5b52 = posições calculadas; velocidade e rumo (RMC ou VTG) para a parte de navegação à estima

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = o rumo do giroscópio e o rumo sobre o fundo diferem mais de <c1/> (velocidade acima de <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = rumo HDT, THS ou VHW, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = a velocidade na água e a velocidade sobre o fundo diferem mais de <c1/>

# text
seg-c9101740b235 = VHW ou VBW, e velocidade sobre o fundo

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = a altitude GGA difere de <c1/> mais de <c2/>

# text
# c1: antenna_height_m
seg-811ec460249c = altitude GGA, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = a dispersão do C/N0 entre satélites desce para <c1/> da sua mediana de calibração

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = o C/N0 dos satélites comuns subiu <c1/> em média e <c2/> deles subiram

# text
seg-faae07674361 = as horas de épocas consecutivas avançam de forma irregular, recuam ou abandonam o relógio do anfitrião

# text
seg-f799a53897ed = hora NMEA; relógio do anfitrião para a última parte

# text
seg-ee4913c9f2ed = o recetor comunica uma falha de autenticação OSNMA (é lido um estado comunicado; nada é verificado; para verificar o OSNMA a partir das próprias páginas I/NAV, consulte <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = frase de estado <c1/>

# text
seg-ce072f2ebb6c = Uma época é <b>não fiável</b> quando o RAIM, o monitor do relógio, uma falha de resolução ou um salto de posição dá alarme, ou quando a queda de C/N0 atinge o dobro do seu limiar; <b>degradada</b> com qualquer outro alarme; e <b>nominal</b> nos restantes casos.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = O caminho do motor (<c1/>, <c2/>, <c3/>) é o mesmo cálculo que a referência independente de spoofing do JammerTest { "2024" } em <c4/>: <c5/> verifica que, nos oito inícios publicados, o primeiro alarme ocorre na mesma época e é do mesmo tipo.

# text
seg-83be3c22a577 = Pontuação de confiança (plataforma embarcação)

# text
# c1: statistic / threshold
seg-812991f245cd = Numa embarcação, cada época após a calibração recebe também uma pontuação de { "0" } a { "100" } e as razões pelas quais não é { "100" }. O mapeamento é determinístico e fixado antes de qualquer registo ser pontuado: sem aprendizagem, nada ajustado a eventos. Cada monitor reduz a sua evidência a uma razão <c1/> (um alarme em { "1" } ou mais); uma razão custa à pontuação

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = de modo que um monitor não custa nada enquanto estiver abaixo de <c1/> do seu limiar (predefinição { "0.5" }), custa metade do seu peso no seu limiar, e o peso todo a <c2/> vezes o limiar (predefinição { "1.5" }); a pontuação é não crescente em cada estatística. Uma fonte que não comunica numa época mantém a sua última estatística durante <c3/> (predefinição { "10" } s: dois ciclos de uma frase de C/N0 enviada a cada { "5" } s), tanto como alarme como como dedução.

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
seg-6c06de24ebfe = O arredondamento é por excesso a partir de meio (<c1/>), a banda é a da pontuação arredondada, e o limite é aplicado antes do arredondamento. Só os monitores cujos pontos são superiores a zero constam das deduções, com a sua razão e pontos não arredondados, primeiro os de mais pontos; as deduções com pontos iguais constam pela ordem dos nomes dos monitores <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. A um monitor cujo teste é passa ou falha (uma resolução falhada, uma autenticação falhada) é atribuída a razão { "1.5" }, o peso total. Os pontos indicados são os anteriores ao limite em { "0" }.

# text
seg-e36961d46c41 = Peso (pontos)

# text
seg-673f6adcd681 = Porquê

# text
seg-399be3301faf = uma falha de autenticação é uma afirmação, não uma estatística

# text
seg-69cfc61477d6 = uma posição falsificada tem de contradizer a física ou as verificações do próprio recetor, e o tempo não pode andar para trás; uma violação em força total ({ "1.5" } vezes o seu limiar: { "60" } pontos, pontuação { "40" }) é não fiável, e no seu limiar ({ "30" } pontos, pontuação { "70" }) é degradada

# text
seg-7fa1e6e67411 = um sensor independente em desacordo é degradado; dois em força total são não fiáveis

# text
seg-4c4825d2957a = o ambiente de sinal, ou uma verificação pouco informativa

# text
seg-b5a364a03714 = o ambiente é hostil; só isso não mostra que a posição está errada

# text
# c1: [geometry]
seg-4e3749965405 = até { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = não é um peso nesta rampa: nada, a menos que o céu seja fraco, e depois até <c1/> ({ "15" }); a geometria sozinha atinge o estado degradado, nunca o não fiável, e não dá alarme (ver "Geometria" abaixo)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Os limites das bandas decorrem dos pesos: o monitor mais leve que dá alarme custa { "12.5" } pontos no seu limiar, pelo que qualquer alarme faz sair da banda nominal; nenhum monitor isolado com menos de { "60" } pontos pode atingir sozinho a banda não fiável (vários em conjunto podem). O resultado regista o modelo de pontuação (<c1/>) e cada época traz <c2/>: que monitores deduziram, as suas razões e os seus pontos. Numa embarcação, o estado da época é a banda da sua pontuação.

# text
seg-6f620668ee85 = Geometria: degradação natural distinta da inconsistência semelhante a um ataque

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Um recetor junto a uma grua de cais, numa eclusa ou sob um casco alto perde satélites e a sua posição calculada piora por uma razão que não é um ataque. A partir de { "0.36" }, segundo a nota de projeto de geometria (<c1/>, secção { "4" }), cada época traz a sua <b>geometria de satélites</b>, a pontuação de uma embarcação tem um <b>monitor de geometria</b>, e cada dedução traz uma <b>classe</b>: <c2/> (o céu), <c3/> (o ambiente de sinal) ou <c4/> (evidência semelhante a um ataque).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>De onde vem a geometria.</b> A elevação e o azimute de cada satélite seguido (NMEA GSV, UBX NAV-SAT), a partir dos quais a diluição da precisão (DOP) é derivada com o único núcleo de DOP do motor (<c1/>, VALIDATED face a gnss_lib_py): <c2/>. Na falta disso, o DOP e os satélites usados que o recetor indica (NMEA GSA): <c3/>. As posições no céu e o GSA contam durante o <c4/> da pontuação (predefinição { "10" } s), porque muitos barramentos enviam GSV de poucos em poucos segundos; um conjunto GSV incompleto numa época (o fim de um excerto, uma frase perdida) não é usado. Um registo sem nenhum dos dois, como NMEA só com GGA e RMC, ou os registos Android e RINEX atualmente, recebe o estado <b><c5/></b> com a nota "geometry unknown": o motor não adivinha uma geometria que não lhe foi dada, e o monitor de geometria não é executado.

# text
seg-a267da42ac3d = satélites suficientes e DOP dentro dos limiares

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = uma ou mais razões: <c1/>, <c2/>, <c3/>, e (informativo, não incluído na pontuação) <c4/> quando todos os satélites seguidos estão numa metade do horizonte

# text
seg-c255a66d3813 = o registo não dá geometria de satélites para esta época

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = O estado é descritivo e o que conta para a pontuação é a etiqueta (abaixo): <c1/> inclui o caso informativo <c2/>, que pode surgir com DOP bom ou razoável, e só uma etiqueta <c3/> é pontuada.

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
seg-93e49a562493 = <b>A etiqueta</b> (sempre comunicada, nunca pontuada). O <c1/> de cada época é <c2/> (HDOP no máximo <c3/> { "2" }, PDOP no máximo <c4/> { "3" } e pelo menos <c5/> { "6" } satélites), <c6/> (HDOP acima de <c7/> { "4" }, PDOP acima de <c8/> { "6" } ou menos de <c9/> { "5" } satélites), <c10/> entre os dois, ou <c11/>. A nota da época abre sempre com a etiqueta e os números, por exemplo "geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)", e acrescenta ", signal loss" quando esta se verifica.

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
seg-13838e036fae = <b>O monitor de geometria</b> (pontuação da embarcação). Não deduz <b>nada a menos que a geometria seja fraca</b>: a sua razão é <c1/>, e enquanto esta for no máximo { "1" } (geometria boa ou razoável, incluindo um céu aberto só com GPS de { "8" } satélites) não custa nada, pelo que um registo assim é pontuado exatamente como em { "0.35" }. Acima de { "1" } a dedução cresce linearmente até <c2/> ({ "15" }) em <c3/> ({ "1.5" } vezes os limiares: HDOP { "6" }, PDOP { "9" }, { "3" } satélites): { "7.5" } pontos na razão { "1.25" } (HDOP { "5" }, ou { "4" } satélites), { "15" } a partir de { "1.5" } (pontuação { "85" }, degradada). Por si só, nunca pode levar a pontuação abaixo de <c4/> (predefinição: o <c5/> da pontuação, { "55" }), pelo que a geometria sozinha atinge no máximo a banda degradada e nunca a não fiável: o limite em vigor é <c6/>, pelo que uma tabela <c7/> que aumente <c8/> (uma de { "0.35" } com <c9/> { "90" }, por exemplo) reduz o limite para <c10/> em vez de ser recusada, e um <c11/> definido abaixo de <c12/> é recusado. O monitor não dá alarme; consta em último lugar de <c13/> quando decidiu em alguma época (uma embarcação cujo registo dá a geometria), e não é contado na identidade com { "0.35" }; não é uma entrada de <c14/> (defini-la é recusado), e o limite e o mínimo em vigor ficam registados em <c15/> e <c16/>. A nota de uma época fraca diz porquê, por exemplo "geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency".

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Classes.</b> Cada dedução (<c1/>):

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (geometria fraca); <c2/> quando todos os satélites perdidos face à linha de base de calibração estavam abaixo de <c3/> no seu último comunicado

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> nos restantes casos; <c7/> durante perda de sinal (abaixo)

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
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; e <c11/> quando a geometria é fraca e o HDOP indicado discorda do céu indicado (abaixo)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>A proteção contra um céu fraco forjado.</b> Um spoofer poderia enviar um GSV escasso, ou comunicar um HDOP elevado, para obter tolerância. O motor etiqueta e não perdoa: nenhuma outra verificação é alargada por uma geometria fraca, e o HDOP que o recetor indica (GSA dentro do período de retenção, senão GGA) é comparado com o HDOP derivado do céu que ele indica. Quando diferem mais de <c1/> ({ "1.0" }, ou { "25" } % do HDOP derivado, o que for maior), a época traz <c2/> e, quando a geometria é fraca, a sua dedução é classificada como <c3/>. Com geometria boa ou razoável, a discordância é comunicada e não pontuada: nada é deduzido a menos que a geometria seja fraca. Esta é uma escolha deliberada ({ "0.36" }): "zero, a menos que seja fraca" vale para todas as épocas, pelo que a geometria boa e razoável é pontuada exatamente como em { "0.35" }, e um HDOP forjado nunca passa em silêncio. O indicador (<c4/>) está em todas as épocas do resultado e em todas as linhas em direto, a nota diz "…beyond the tolerance: reported, not scored (the geometry is not poor)" ou "…: the geometry deduction is classed an inconsistency", <c5/> conta as épocas, e a página de resumo das evidências mostra a contagem, incluindo zero. Os { "25" } % são uma escolha de engenharia <b>REPRESENTATIVE</b>, não um valor medido nem normalizado: um recetor que resolve um relógio por constelação, ou com um subconjunto dos satélites que segue (uma máscara de elevação, um corte de C/N0, uma exclusão RAIM), indica um HDOP que difere do HDOP de relógio único de todos os satélites seguidos numa medida que cresce com o HDOP, pelo que uma tolerância fixa sozinha leria uma geometria fraca natural como uma inconsistência. Uma diferença maior continua a ser lida como tal. Uma dedução classificada como <c6/> é uma afirmação sobre o céu, não uma conclusão de que não ocorreu nenhum ataque.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>Perda de sinal não é o céu.</b> Quando satélites que o recetor lista à vista (acima de <c1/>) não são seguidos, o motor deriva também o DOP de todos os satélites à vista. Se esse DOP à vista estiver dentro dos limiares e ou nada for seguido ou os satélites não seguidos estiverem espalhados pelo horizonte (não confinados a uma metade dele), o céu estava lá e o sinal não: a época traz <c2/>, a nota "satellites in view but not tracked: signal environment, not geometry", e a dedução de geometria é classificada como <c3/>. Os satélites não seguidos confinados a uma metade do horizonte continuam a ser lidos como um céu bloqueado (uma parede, uma falésia, um cais). Uma obstrução bilateral (um desfiladeiro ou um fiorde estreito) é lida como perda de sinal até ser configurada uma linha de horizonte. Os valores sentinela de ausência de posição do recetor não são DOP: um HDOP ou PDOP indicado de { "99" } ou mais, qualidade GGA { "0" } e modo GSA { "1" } não dão DOP indicado.

# text
# c1: [geometry]
seg-0f218d21843b = chave <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = escolhido (nota de projeto { "4.2" }): com <c1/> { "1.5" } m, um HDOP { "4" } é um 2drms de { "12" } m, o <c2/> da verificação cinemática. A IEC 61108-1 é habitualmente citada como indicando os seus requisitos de exatidão para HDOP ≤ { "4" } (ou PDOP ≤ { "6" }): recordado a partir da literatura secundária sobre recetores GNSS, sem consulta de nenhuma fonte secundária específica e sem leitura da norma; a verificar face ao texto da norma

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = o limiar de disponibilidade de PDOP de <c1/>; GPS SPS Performance Standard, 5.ª ed. ({ "2020" }), PDOP ≤ { "6" }, como citado em <c2/>; a verificar face ao texto da norma

# text
seg-2fffa47378ec = mais um do que uma posição calculada precisa, para que uma única perda não termine a posição calculada; o mínimo com uma medição redundante para o RAIM

# text
# c1: hdop_max
seg-7dc0baed2bc4 = uma entrada declarada para a ligação 2drms de <c1/>; defina o valor do próprio recetor

# text
seg-7b5778d93d40 = { "1.0" } HDOP

# text
seg-093cff5d1150 = escolhido (nota de projeto { "4.2" }): a parte absoluta da tolerância; uma discordância para além da tolerância não é geometria

# text
seg-be5c3aefd942 = escolha de engenharia REPRESENTATIVE: a parte relativa, para recetores com relógios por constelação ou soluções por subconjunto

# text
seg-e71c6876114b = nota de projeto { "4.3" }: os satélites perdidos abaixo dele perdem-se para o céu; uma linha de horizonte (item { "1" } de { "0.36" }) alargará isto

# text
seg-bebe291ca1c0 = geométrico, informativo: todos os satélites numa metade do horizonte

# text
seg-06519582227b = nota de projeto { "4.2" }: a geometria sozinha move a pontuação de nominal para degradada e nunca para não fiável; deduzido apenas quando a geometria é fraca (decisão do fundador B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = o <c1/> próprio da pontuação: a rampa atinge <c2/> a { "1.5" } vezes os limiares de geometria fraca

# text
# c1: degraded_min
seg-e922a5342a3c = o <c1/> da pontuação ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = a geometria sozinha nunca atinge a banda não fiável; o limite em vigor é <c1/>; um mínimo abaixo de <c2/> é recusado

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, só para a etiqueta: metade de <c1/> (a razão de início da pontuação de { "0.35" })

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, só para a etiqueta: metade de <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, só para a etiqueta: mais um do que <c1/>, pelo que uma única perda ainda deixa uma medição redundante

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
seg-ef7a4c24e870 = <b>O que mudou nas saídas, e o que não mudou.</b> Nenhuma pontuação muda, a menos que a geometria seja fraca; a etiqueta é sempre comunicada. Chaves acrescentadas: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> arredondado a { "0.001" }, <c9/> (nulo até ser configurada uma linha de horizonte), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satélites listados acima de <c16/>), <c17/>, <c18/>), <c19/> em cada dedução, e no fim <c20/> (limiares, período de retenção, o limite e o mínimo em vigor, proveniência, regras de classe) e <c21/> (épocas por estado, por etiqueta e por classe de dedução, e as épocas com uma discordância do HDOP indicado); <c22/> é como em { "0.35" }. Dois testes mantêm isto ao byte face à linha de base "{ "0.36" } portable" depois de removidas essas chaves (os hashes de { "0.35.0" }, rebaseados quando o motor passou para matemática portátil e mantidos nos testes como registo do que a { "0.35.0" } publicou: <c23/>). <c24/> abrange todas as saídas de ambas as sessões de exemplo (JSON de resultado, CSV, SVG, veredicto, linhas em direto reproduzidas, <c25/>, Prometheus, CEF, LEEF). <c26/> abrange o resultado em lote, o resumo, as linhas em direto e o <c27/> de cada corpus NMEA de embarcação submetido (a demonstração e os ficheiros de teste de referência marítimos, cada um também como céu aberto só com GPS com { "8" } satélites, e os cenários de formação de tripulações gerados a partir das suas sementes); nos dois cenários de formação em que o jamming torna a geometria fraca, todas as épocas que não são fracas são idênticas e todas as fracas diferem apenas pela dedução de geometria. Um registo cuja geometria é fraca perde até { "15" } pontos que não perdia em { "0.35" }; essa é a alteração pretendida. Na demonstração, o arrastamento lê-se como <c28/>; <c29/> edita o registo para mascarar o céu ocidental (razoável: etiquetado, não pontuado), para o mascarar e a dois satélites orientais (fraca: deduções de geometria, perda de bloqueio <c30/> porque os satélites altos também desapareceram), para perder apenas satélites abaixo de { "15" }° (perda de bloqueio <c31/>), e para indicar um HDOP que o céu não explica (a dedução de geometria fraca passa a <c32/>). Os limiares são MODELLED: escolhidos, não ajustados a nenhum registo; nada aqui afirma com que frequência a degradação natural e os ataques são distinguidos em dados reais.

# text
seg-8ddaf82ba00b = Declarar eventos e previsões

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Para cada evento, o resultado dá os falsos alarmes entre a calibração e o início, o primeiro alarme e os seus monitores, a latência, o desfecho (<c1/>, <c2/>, <c3/> ou <c4/>), e a queda mediana de C/N0 observada face à previsão (<c5/>, <c6/>, <c7/> ou <c8/>). A discordância é comunicada, nunca ajustada para desaparecer: as tolerâncias estão no cenário, e o cenário está no hash do resultado.

# text
seg-3715df3fd8f7 = O que isto não afirma

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Os monitores de confiança são MODELLED: os seus limiares são entradas, e o seu desempenho de deteção em interferência real é o que a pontuação de eventos mede, não algo que este tipo de cenário afirme. Nas sessões de spoofing do JammerTest { "2024" }, os monitores do caminho do motor apanham alguns inícios em { "10" } s e chegam tarde noutros; consulte a linha "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" em <a1><c1/></a1> para os números. Uma previsão que concorda com um registo é um ponto de dados, não uma validação.

# text
seg-0c413c1a491c = <s1>Anterior</s1>Correspondência de resiliência

# text
seg-63fc2b340fd1 = <s1>Seguinte</s1>Confiança marítima
