# docs--kinds-clocks-timing-and-holdover: translations (pt-BR)

# text
seg-b03d56f501c3 = Tipo

# text
seg-78cba87823f7 = Holdover do relógio em relação à especificação; conjunto Monte Carlo opcional (execuções > { "1" }).

# attr:alt
seg-cb0b7da83f5c = O gráfico que o motor gera para scenarios/clock-ensemble.toml, tipo de cenário clock

# text
seg-c0924aa36e64 = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registro de erro de tempo que o OPERADOR fornece (um log do ptp4l, phc2sys ou ts2phc do linuxptp, um log de tracking ou statistics do chrony, um log de relógio TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns). O teste tem quatro etapas e o Kshana não executa nenhuma delas: uma LINHA DE BASE travada, GNSS REMOVIDO pelo operador (o cabo da antena ou a saída do simulador; o Kshana não transmite nem aciona nada) em um instante declarado, HOLDOVER no oscilador próprio do sistema e RECUPERAÇÃO depois que o operador restabelece o GNSS em um segundo instante declarado. O registro é dividido nesses dois instantes. Linha de base: estatísticas de erro de tempo e as máscaras da ITU-T escritas para um relógio travado. Holdover: estatísticas, o desvio fracionário de frequência que o sistema manteve (uma reta de mínimos quadrados), as máscaras escritas para holdover ou para um relógio autônomo, o envelope de holdover do ePRTC-A a partir da duração travada declarada e o tempo para exceder cada orçamento de erro de tempo. Recuperação: se e quando |TE| entrou em uma faixa declarada e permaneceu nela, o pico e o maior degrau. Todo limite é transcrito de uma tabela pública da ITU-T (as máscaras de temporização de telecomunicações); as palavras são 'medido em relação à máscara', e os dois instantes são uma declaração do operador, não verificada. Um registro curto demais para uma máscara é INCOMPLETE, nunca extrapolado. Ver docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = O gráfico que o motor gera para scenarios/holdover-test-ptp4l.toml, tipo de cenário holdover-test

# text
seg-540545e6f846 = Cadeia de temporização quântica confiável, MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede óptica + enlace de emaranhamento/fóton único) contra clássico (CSAC + RF de dois sentidos), um nível de proteção de temporização reaproveitado + uma figura de mérito de segurança contra ataque de atraso/repetição (1-P_md), uma probabilidade de detecção de anomalia de relógio + latência do CUSUM, e a comparação quântico-versus-clássico como TradeEvidence honesto, com um registro de representatividade + lacunas até o voo. Parâmetros ilustrativos de dispositivo/enlace de fonte pública; modela a classe, sem alegação de TRL, voo nem certificação.

# attr:alt
seg-09760f892c7b = O gráfico que o motor escreve para scenarios/quantum-time-transfer.toml, tipo de cenário quantum-time-transfer

# text
seg-1b61962464c5 = Temporização de slot: segundos até um relógio em operação livre sair da guarda de um slot de roteamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o slot tolera), a contribuição de cada termo nesse instante com o dominante indicado (incerteza da correção, ruído de fase branco, ruído de frequência branco, flicker, de passeio aleatório e de corrida aleatória, deslocamento de frequência residual, temperatura, envelhecimento), o tempo restante desde a última correção e o maior intervalo de correção que mantém o relógio dentro, descontada a latência da correção. O oscilador é um padrão de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan de um segundo citado e um piso de ruído vermelho assumido), uma PREDEFINIÇÃO DE DATASHEET de temporização de telecomunicações ou um DATASHEET em linha (máximos do desvio de Allan ajustados como envoltória, mais envelhecimento e um coeficiente de temperatura), ou um REGISTRO DE FASE MEDIDO em linha (seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de ruído de fase branco e de modulação de frequência da IEEE Std { "1139" }, de modo que o piso de ruído vermelho é medido em vez de assumido). Uma violação além do maior tempo de médias que o datasheet ou o registro suporta é sinalizada como extrapolada. Uma seção opcional de spoofing acrescenta o nível de proteção de temporização para um receptor em órbita: velocidade e período orbitais, por quanto tempo um único spoofer em solo alcança o satélite a cada passagem, o piso do monitor auxiliado pelo relógio e a latência de detecção do CUSUM, o limite condicional, o desvio que um spoofer com uma taxa de rampa máxima declarada acumula antes de o satélite sair do seu alcance ou de uma verificação independente ser executada, e se cada verificação de contato com o solo ou de crosslink é independente desse spoofer. VALIDATED: a inversão de holdover a partir de um registro ajustado, mantida de reserva em um relógio real de césio medido contra um maser de hidrogênio (tests/slot_timing_cs5071a_holdout.rs, condicionado a dados); em um oscilador de cristal medido, a predição reservada é conservadora, mas não está dentro do limiar, portanto o caso do cristal é MODELLED. MODELLED: as fontes de classe e de datasheet, os termos determinísticos e a avaliação de spoofing.

# attr:alt
seg-97a91c8a60cd = O gráfico que o mecanismo gera para scenarios/slot-timing-ocxo-leo.toml, tipo slot-timing

# text
seg-4f19d4fb1341 = Varredura genérica N-D sobre qualquer pacote por meio de chaves TOML pontuadas / caminhos de métricas JSON.

# attr:alt
seg-621a18c07044 = O gráfico que o mecanismo gera para scenarios/sweep-nd-inertial.toml, tipo sweep-nd

# text
seg-e7ab7b55c969 = Varredura 1-D de estudo de compromissos sobre um parâmetro do pacote de relógio.

# attr:alt
seg-c784b8f22f12 = O gráfico que o mecanismo gera para scenarios/sweep-clock-stability.toml, tipo sweep

# text
seg-a448b24ded2b = Temporização de telecomunicações: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV) de um holdover de GNSS, conferidos contra máscaras da ITU-T com PASS ou FAIL e uma margem por máscara. A entrada é um HOLDOVER SINTÉTICO (uma predefinição de oscilador -- ocxo, rubídio, césio ou csac, cada uma com os valores de estabilidade, envelhecimento e temperatura de um datasheet público e nomeado da Microchip -- mais o tempo de perda do GNSS, a duração do registro e o intervalo de amostragem; o relógio em operação livre tem ruído de frequência branco, flicker e, quando o ajuste ao datasheet exige, de passeio aleatório, envelhecimento linear e um termo senoidal de temperatura) ou uma SÉRIE INGERIDA de pares [time_s, time_error_ns] fornecidos em linha (e, apenas em compilações nativas, um arquivo CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A e PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabelas 1-2, TDEV Tabelas 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado ({ "30" } ns, Tabelas 1-2) e holdover de ePRTC-A (o envelope de erro de tempo da Tabela { "3" } que sobe de { "30" } ns a { "100" } ns ao longo do período de holdover H definido pela duração em bloqueio, MTIE Tabela { "4" }, TDEV Tabela { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes A-C de T-BC/T-TSC (max|TE|, erro de tempo constante, MTIE e TDEV filtrados por passa-baixa) e classe D (max|TE_L| { "5" } ns, o único valor da classe D não deixado para estudo futuro); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) ponto de referência C (max|TE_L| { "1100" } / { "600" } / { "100" } ns com MTIE Tabelas 7-1 a 7-3). Toda entrada que uma Recomendação marca para estudo futuro está ausente em vez de preenchida, e cada relatório lista o que não está implementado. Informa também o tempo para exceder cada orçamento de erro de tempo máximo (padrões: { "100" } ns max|TE_HO| de ePRTC, { "400" } ns de alocação de holdover de rede, { "1100" } ns ponto C, { "1.5" } us classe { "4" }), as curvas de MTIE/TDEV como uma tabela CSV com o limite de cada máscara, e uma entrada de unidades e proveniência por campo numérico. VALIDATED: os estimadores de MTIE e TDEV contra o pacote allantools em uma série de holdover versionada. MODELLED: as tabelas de máscaras são transcrições, e um holdover sintético é um modelo construído a partir de máximos de datasheet, não uma medição de qualquer unidade. Não é um teste de aderência à norma.

# attr:alt
seg-ec7745a09d08 = O gráfico que o mecanismo gera para scenarios/telecom-synce-eec.toml, tipo telecom-timing

# text
seg-9a2bb9809aed = Transferência bidirecional de tempo e frequência por satélite entre duas estações por meio de um relé geoestacionário: a equação bidirecional resolvida para T_A - T_B com todo termo não recíproco (atrasos do equipamento das estações, ionosfera em banda Ku, transponder, Sagnac), um orçamento de incerteza em quadratura cujo termo do tipo A é o TDEV do enlace simulado no tempo de médias, um enlace simulado com ruído de fase branco e flicker e uma não reciprocidade diurna, e a estabilidade (taxa, RMS residual, TDEV, ADEV) de qualquer série fornecida da Seção { "1" } da Circular T do BIPM, CSV MJD,ns ou registros de relógio de estação RINEX do IGS. MODELLED.

# attr:alt
seg-92d3c84024d7 = O gráfico que o mecanismo gera para scenarios/time-transfer-budget.toml, tipo time-transfer-budget

# text
seg-ccb244e60d60 = Transferência bidirecional de tempo/frequência óptica versus RF.

# attr:alt
seg-bd76bd68eab3 = O gráfico que o mecanismo gera para scenarios/timetransfer.toml, tipo timetransfer

# text
seg-4e31c8daf798 = Registro

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Fonte: <c1/>

# text
seg-3b549536beed = Relógios, temporização e holdover (família de tipos de cenário)

# text
seg-9095869ec445 = { "9" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Páginas de tópico: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Execute uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Relógios, temporização e holdover

# text
seg-efd15cff3d32 = MODELLED (rótulo do resultado)

# text
seg-ff7dca09f0f2 = Temporização de telecomunicações: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV) de um holdover de GNSS, conferidos contra máscaras da ITU-T com PASS ou FAIL e uma margem por máscara.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Temporização de slot: segundos até um relógio em operação livre sair da guarda de um slot de roteamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o slot tolera), a contribuição de cada termo nesse

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Transferência bidirecional de tempo e frequência por satélite entre duas estações por meio de um relé geoestacionário: a equação bidirecional resolvida para T_A - T_B com todo termo não recíproco (atrasos do equipamento das estações, Ku

# text
seg-a2a710b3204f = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registro de erro de tempo que o OPERADOR fornece (um log do linuxptp ptp4l, phc2sys ou ts2phc, um log de tracking ou de estatísticas do chrony, um TICC, TimeLab ou RINEX

# text
seg-1da440dd525c = Cadeia de temporização quântica confiável MODELLED: um orçamento de transferência de tempo ponta a ponta quântico (relógio de rede óptica + enlace de emaranhamento/fóton único) versus clássico (CSAC + RF bidirecional), um nível de proteção de temporização reutilizado

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionais: <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionais: <c7/>.

# text
seg-e359cc42506e = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Campos obrigatórios: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Registro:</b> MODELLED { "5" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Campos obrigatórios: <c1/>, <c2/>. Opcionais: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Opcionais: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Campos obrigatórios: <c1/>, <c2/>. Opcionais: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campanhas

# text
seg-960d5c757310 = <s1>Seguinte</s1>Constelações, cobertura e geometria
