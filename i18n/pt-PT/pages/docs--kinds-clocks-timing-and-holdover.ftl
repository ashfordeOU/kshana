# docs--kinds-clocks-timing-and-holdover: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-78cba87823f7 = Holdover do relógio face à especificação; conjunto Monte Carlo opcional (execuções > { "1" }).

# attr:alt
seg-cb0b7da83f5c = O gráfico que o motor gera para scenarios/clock-ensemble.toml, tipo de cenário clock

# text
seg-c0924aa36e64 = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registo de erro de tempo que o OPERADOR fornece (um log do ptp4l, phc2sys ou ts2phc do linuxptp, um log de tracking ou statistics do chrony, um log de relógio TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns). O teste tem quatro etapas e o Kshana não executa nenhuma delas: uma LINHA DE BASE bloqueada, GNSS REMOVIDO pelo operador (o cabo da antena ou a saída do simulador; o Kshana não transmite nem aciona nada) num instante declarado, HOLDOVER no oscilador próprio do sistema e RECUPERAÇÃO depois de o operador restabelecer o GNSS num segundo instante declarado. O registo é dividido nesses dois instantes. Linha de base: estatísticas de erro de tempo e as máscaras da ITU-T escritas para um relógio bloqueado. Holdover: estatísticas, o desvio fracionário de frequência que o sistema manteve (uma reta de mínimos quadrados), as máscaras escritas para holdover ou para um relógio autónomo, o envelope de holdover do ePRTC-A a partir da duração bloqueada declarada e o tempo para exceder cada orçamento de erro de tempo. Recuperação: se e quando |TE| entrou numa banda declarada e permaneceu nela, o pico e o maior degrau. Cada limite é transcrito de uma tabela pública da ITU-T (as máscaras de temporização de telecomunicações); as palavras são 'medido em relação à máscara', e os dois instantes são uma declaração do operador, não verificada. Um registo curto demais para uma máscara é INCOMPLETE, nunca extrapolado. Ver docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = O gráfico que o motor gera para scenarios/holdover-test-ptp4l.toml, tipo de cenário holdover-test

# text
seg-540545e6f846 = Cadeia de temporização quântica fidedigna MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede ótica + ligação por emaranhamento/fotão único) vs clássico (CSAC + RF bidirecional), um nível de proteção de temporização reutilizado + uma FoM de segurança contra ataques de atraso/repetição (1-P_md), uma probabilidade de deteção de anomalias do relógio + latência CUSUM, e o compromisso quântico-vs-clássico como TradeEvidence honesta com um registo de representatividade + lacunas até ao voo. Parâmetros ilustrativos de dispositivos/ligações de fontes públicas; modela a classe, sem alegação de TRL/voo/certificação.

# attr:alt
seg-09760f892c7b = O gráfico que o motor escreve para scenarios/quantum-time-transfer.toml, tipo quantum-time-transfer

# text
seg-1b61962464c5 = Temporização de intervalos: segundos até um relógio em funcionamento livre sair da guarda de um intervalo de encaminhamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o intervalo tolera), a contribuição de cada termo nesse momento com o dominante identificado (incerteza da solução de posição, ruído de fase branco, ruído de frequência branco, flicker, de passeio aleatório e de corrida aleatória, desvio de frequência residual, temperatura, envelhecimento), o tempo restante desde a última solução de posição e o maior intervalo entre soluções de posição que mantém o relógio dentro, líquido da latência da solução de posição. O oscilador é uma predefinição de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan citado a um segundo e um patamar de ruído vermelho assumido), uma PREDEFINIÇÃO DE FICHA TÉCNICA de temporização de telecomunicações ou uma FICHA TÉCNICA em linha (máximos do desvio de Allan ajustados como envolvente, mais envelhecimento e um coeficiente de temperatura), ou um REGISTO DE FASE MEASURED em linha (o seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de fase branca e de modulação de frequência IEEE Std { "1139" }, de modo que o patamar de ruído vermelho é medido e não assumido). Uma violação além do maior tempo de média que a ficha técnica ou o registo suporta é assinalada como extrapolada. Uma secção opcional de spoofing acrescenta o nível de proteção de temporização para um recetor em órbita: velocidade e período orbitais, durante quanto tempo um único spoofer terrestre consegue alcançar o satélite por passagem, o patamar do monitor assistido por relógio e a latência de deteção CUSUM, o limite condicional, o arrastamento que um spoofer a uma taxa de rampa máxima indicada acumula antes de o satélite sair do seu alcance ou de uma verificação independente ser executada, e se cada verificação de contacto terrestre ou de ligação cruzada é independente desse spoofer. VALIDATED: a inversão de holdover a partir de um registo ajustado, reservada num relógio de césio real medido face a um maser de hidrogénio (tests/slot_timing_cs5071a_holdout.rs, condicionado pelos dados); num oscilador de cristal medido, a previsão reservada é conservadora mas não está dentro do limiar, pelo que o caso do cristal é MODELLED. MODELLED: as fontes de classe e de ficha técnica, os termos determinísticos e a avaliação de spoofing.

# attr:alt
seg-97a91c8a60cd = O gráfico que o motor escreve para scenarios/slot-timing-ocxo-leo.toml, tipo slot-timing

# text
seg-4f19d4fb1341 = Varrimento N-D genérico sobre qualquer pacote através de chaves TOML com pontos / caminhos de métricas JSON.

# attr:alt
seg-621a18c07044 = O gráfico que o motor escreve para scenarios/sweep-nd-inertial.toml, tipo sweep-nd

# text
seg-e7ab7b55c969 = Varrimento 1-D de estudo de compromissos sobre um parâmetro de um pacote de relógio.

# attr:alt
seg-c784b8f22f12 = O gráfico que o motor escreve para scenarios/sweep-clock-stability.toml, tipo sweep

# text
seg-a448b24ded2b = Temporização de telecomunicações: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV) de um holdover de GNSS, verificados face a máscaras ITU-T com PASS ou FAIL e uma margem por máscara. A entrada é um HOLDOVER SINTÉTICO (uma predefinição de oscilador -- ocxo, rubídio, césio ou csac, cada uma com os valores de estabilidade, envelhecimento e temperatura de uma ficha técnica pública da Microchip identificada -- mais o instante de perda de GNSS, a duração do registo e o intervalo de amostragem; o relógio em funcionamento livre tem ruído de frequência branco, flicker e, quando o ajuste à ficha técnica o exige, de passeio aleatório, envelhecimento linear e um termo de temperatura sinusoidal) ou uma SÉRIE INGERIDA de pares [time_s, time_error_ns] indicados em linha (e, apenas em compilações nativas, um ficheiro CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A e PRTC-B (máx|TE| { "100" } / { "40" } ns, MTIE Tabelas 1-2, TDEV Tabelas 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado ({ "30" } ns, Tabelas 1-2) e holdover ePRTC-A (a envolvente de erro de tempo da Tabela { "3" } a subir de { "30" } ns para { "100" } ns ao longo do período de holdover H definido pela duração de bloqueio, MTIE Tabela { "4" }, TDEV Tabela { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes A-C de T-BC/T-TSC (máx|TE|, erro de tempo constante, MTIE e TDEV filtrados por passa-baixo) e classe D (máx|TE_L| { "5" } ns, o único valor da classe D que não fica para estudo posterior); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) ponto de referência C (máx|TE_L| { "1100" } / { "600" } / { "100" } ns com MTIE Tabelas 7-1 a 7-3). Cada entrada que uma Recomendação marca para estudo posterior está ausente em vez de preenchida, e cada relatório lista o que não está implementado. Indica também o tempo até exceder cada orçamento de erro de tempo máximo (predefinições: { "100" } ns máx|TE_HO| do ePRTC, { "400" } ns de atribuição de holdover de rede, { "1100" } ns ponto C, { "1.5" } us classe { "4" }), as curvas MTIE/TDEV como uma tabela CSV com cada limite de máscara, e uma entrada de unidades e proveniência por campo numérico. VALIDATED: os estimadores MTIE e TDEV face ao pacote allantools sobre uma série de holdover registada. MODELLED: as tabelas de máscaras são transcrições, e um holdover sintético é um modelo construído a partir de máximos de fichas técnicas, não uma medição de qualquer unidade. Não é um ensaio de aderência à norma.

# attr:alt
seg-ec7745a09d08 = O gráfico que o motor escreve para scenarios/telecom-synce-eec.toml, tipo telecom-timing

# text
seg-9a2bb9809aed = Transferência bidirecional de tempo e frequência por satélite entre duas estações através de um relé geoestacionário: a equação bidirecional resolvida para T_A - T_B com todos os termos não recíprocos (atrasos do equipamento das estações, ionosfera em banda Ku, transponder, Sagnac), um orçamento de incerteza em quadratura cujo termo do tipo A é o TDEV da ligação simulada ao tempo de média, uma ligação simulada com ruído de fase branco e flicker e uma não reciprocidade diurna, e a estabilidade (taxa, RMS residual, TDEV, ADEV) de qualquer série da Secção { "1" } da Circular T do BIPM, CSV MJD,ns ou registos de relógio de estação RINEX do IGS fornecida. MODELLED.

# attr:alt
seg-92d3c84024d7 = O gráfico que o motor escreve para scenarios/time-transfer-budget.toml, tipo time-transfer-budget

# text
seg-ccb244e60d60 = Transferência bidirecional de tempo/frequência ótica vs RF.

# attr:alt
seg-bd76bd68eab3 = O gráfico que o motor escreve para scenarios/timetransfer.toml, tipo timetransfer

# text
seg-4e31c8daf798 = Registo

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Fonte: <c1/>

# text
seg-3b549536beed = Relógios, temporização e holdover (família de tipos de cenário)

# text
seg-9095869ec445 = { "9" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Páginas de tema: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Executar uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Folha de contactos dos gráficos que o motor escreve para os tipos da família Relógios, temporização e holdover

# text
seg-efd15cff3d32 = MODELLED (etiqueta de resultado)

# text
seg-ff7dca09f0f2 = Temporização de telecomunicações: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV) de um holdover de GNSS, verificados face a máscaras ITU-T com PASS ou FAIL e uma margem por máscara.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Temporização de intervalos: segundos até um relógio em funcionamento livre sair da guarda de um intervalo de encaminhamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o intervalo tolera), a contribuição de cada termo nesse

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Transferência bidirecional de tempo e frequência por satélite entre duas estações através de um relé geoestacionário: a equação bidirecional resolvida para T_A - T_B com todos os termos não recíprocos (atrasos do equipamento das estações, Ku

# text
seg-a2a710b3204f = Ensaio de holdover MODELLED de um sistema de temporização, pontuado a partir de um registo de erro de tempo que o OPERADOR fornece (um registo linuxptp ptp4l, phc2sys ou ts2phc, um registo de seguimento ou de estatísticas chrony, um TICC, TimeLab ou RINEX

# text
seg-1da440dd525c = Cadeia de temporização quântica fidedigna MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede ótica + ligação por emaranhamento/fotão único) vs clássico (CSAC + RF bidirecional), um nível de proteção de temporização reutilizado

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
seg-3273244f755c = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>clock</a1>.

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
seg-e359cc42506e = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Campos obrigatórios: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Registo:</b> MODELLED { "5" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Campos obrigatórios: <c1/>, <c2/>. Opcionais: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Registo:</b> MODELLED { "2" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>timetransfer</a1>.

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
seg-09b554a74d49 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Campos obrigatórios: <c1/>, <c2/>. Opcionais: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>holdover-test</a1>.

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
seg-bb6d7df61e2f = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campanhas

# text
seg-960d5c757310 = <s1>Seguinte</s1>Constelações, cobertura e geometria
