# docs--kind-telecom-timing: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: uma camada de análise sintática que converte um arquivo de relógio RINEX (registros AS/AR de um relógio nomeado, versões { "2" } e { "3.00" } a { "3.04" }), um registro ASCII de fase ou frequência no estilo TimeLab, ou um registro de carimbos de tempo ou intervalos do TAPR TICC em um pha uniforme Testes: <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> informa, em um registro de holdover em escala de telecomunicações: uma janela deslizante O(n) de fila monotônica. Referência independente (ExternalDataset): allantools { "2024.06" } — uma biblioteca independente de terceiros de estabilidade de frequência — mtie() e tdev() em tests/fixtures/telecom_timing/holdover_te_series.csv, a série analisada a partir do mesmo texto de 17 algarismos significativos em ambos os lados; a referência independente registra o SHA-256 da série e pode ser regenerada offline por tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida os ESTIMADORES neste registro, não o syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC travado e holdover do ePRTC-A (incluindo o envelope de erro de tempo da Tabela { "3" }. Referência independente (InternalConsistency): Transcrição das Recomendações indicadas (disponíveis gratuitamente em itu.int), cada limite com a sua tabela ou cláusula, listada com todo item não confirmado ou não implementado em docs/TELECOM-TIMING.md; as identidades de continuidade de pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de normas com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } rodada { "2" } (fixada antecipada

# text
seg-5547f1f662d3 = e mais { "2" } na matriz.

# text
seg-8aee75a55007 = ocxo

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Fonte: <c1/>

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (tipo de cenário)

# text
seg-a448b24ded2b = Temporização de telecomunicações: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV) de um holdover de GNSS, conferidos contra máscaras da ITU-T com PASS ou FAIL e uma margem por máscara. A entrada é um HOLDOVER SINTÉTICO (uma predefinição de oscilador -- ocxo, rubídio, césio ou csac, cada uma com os valores de estabilidade, envelhecimento e temperatura de um datasheet público e nomeado da Microchip -- mais o tempo de perda do GNSS, a duração do registro e o intervalo de amostragem; o relógio em operação livre tem ruído de frequência branco, flicker e, quando o ajuste ao datasheet exige, de passeio aleatório, envelhecimento linear e um termo senoidal de temperatura) ou uma SÉRIE INGERIDA de pares [time_s, time_error_ns] fornecidos em linha (e, apenas em compilações nativas, um arquivo CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A e PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabelas 1-2, TDEV Tabelas 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado ({ "30" } ns, Tabelas 1-2) e holdover de ePRTC-A (o envelope de erro de tempo da Tabela { "3" } que sobe de { "30" } ns a { "100" } ns ao longo do período de holdover H definido pela duração em bloqueio, MTIE Tabela { "4" }, TDEV Tabela { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes A-C de T-BC/T-TSC (max|TE|, erro de tempo constante, MTIE e TDEV filtrados por passa-baixa) e classe D (max|TE_L| { "5" } ns, o único valor da classe D não deixado para estudo futuro); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) ponto de referência C (max|TE_L| { "1100" } / { "600" } / { "100" } ns com MTIE Tabelas 7-1 a 7-3). Toda entrada que uma Recomendação marca para estudo futuro está ausente em vez de preenchida, e cada relatório lista o que não está implementado. Informa também o tempo para exceder cada orçamento de erro de tempo máximo (padrões: { "100" } ns max|TE_HO| de ePRTC, { "400" } ns de alocação de holdover de rede, { "1100" } ns ponto C, { "1.5" } us classe { "4" }), as curvas de MTIE/TDEV como uma tabela CSV com o limite de cada máscara, e uma entrada de unidades e proveniência por campo numérico. VALIDATED: os estimadores de MTIE e TDEV contra o pacote allantools em uma série de holdover versionada. MODELLED: as tabelas de máscaras são transcrições, e um holdover sintético é um modelo construído a partir de máximos de datasheet, não uma medição de qualquer unidade. Não é um teste de aderência à norma.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Uma execução de <c1/> resume-se assim: telecom-timing: max|TE| { "488.2" } ns em { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = O exemplo <c1/> define, entre outros:

# text
seg-e7cab30ef039 = [] (sem elementos)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Rótulo do resultado (do mecanismo): MODELLED — erro de tempo, MTIE e TDEV conferidos contra máscaras ITU-T transcritas. Os estimadores são validados contra o allantools; as tabelas de máscaras são transcrições das Recomendações citadas; um holdover sintético é um modelo construído a partir de valores públicos de datasheet, não uma medição de qualquer unidade. Não é um teste de aderência

# attr:alt
seg-ec7745a09d08 = O gráfico que o mecanismo gera para scenarios/telecom-synce-eec.toml, tipo telecom-timing

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que citam este tipo.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> informa, em um registro de holdover em escala de telecomunicações: um MTIE de janela deslizante com fila monotônica O(n) (telecom_timing::mtie_sliding, necessário para que um dia de amostras de um segundo Testes: <a1>telecom_timing_reference.rs</a1>.

# text
seg-75aa6f7234ae = <b>MODELLED</b> Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Testes: <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Sete máscaras de geração de wander de MTIE e TDEV a temperatura constante para o tipo <c1/>: G.811 (09/1997) PRC (autônomo), G.812 (06/2004) Tipos I, II e III, G.8262 (10/2024) EEC Opções { "1" } e { "2" } e G.8262.1 (11/2025) eEEC (locked

# text
seg-d4bd840708db = <b>MODELLED</b> Quatro predefinições — OCXO (Microchip OX-208), rubídio (Microchip 8040C), césio (tubo de alto desempenho Microchip 5071A) e CSAC (Microchip SA.45s) — cada uma com . Referência independente (InternalConsistency): os quatro datasheets nomeados da Microchip (números de documento e URLs em cada predefinição e em docs/TELECOM-TIMING.md) para os valores de entrada; a rampa de envelhecimento em forma fechada e a propriedade de envoltória do ajuste como verificações internas. Como os valores viram um modelo de ruído — o ajuste, a regra do piso, o mês de 30 dias, a leitura linear da temperatura — é uma escolha de modelagem; nenhuma predefinição é uma medição de uma unidade. { "0.30" } rodada { "2" }, limiares unilaterais contra

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = todo requisito que as Recomendações marcam como 'para estudo futuro' (classe D além de max|TE_L|, holdover de ePRTC-B, holdover de T-BC/T-TSC com as duas entradas perdidas, limites de rede de TDEV, MTIE e TDEV do holdover de ePRTC-A além de { "10 000" } s) (resultado <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = erro de tempo dinâmico filtrado por passa-alta (dTE_H, G.8273.2 Tabela 7-7 e G.8271.1 cláusulas 7.3.2-7.3.3) (resultado <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = o MTIE de temperatura variável da G.8273.2 Tabela 7-6 e o MTIE de holdover assistido pela camada física da G.8273.2 Tabela 7-10 (resultado <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = erro de tempo relativo (cTE_R, dTE_R,L) entre duas saídas (resultado <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = o filtro de pacotes de média móvel que a G.8272 e a G.8272.1 definem para interfaces PTP: a série é tratada como um erro de intervalo de tempo de um pulso por segundo (resultado <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — erro de tempo, MTIE e TDEV conferidos contra máscaras ITU-T transcritas. Os estimadores são validados contra o allantools; as tabelas de máscaras são transcrições das Recomendações citadas; um holdover sintético é um modelo construído a partir de valores públicos de datasheet, não uma medição de qualquer unidade. Não é um teste de aderência à norma. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED: as tabelas de máscaras são transcrições, e um holdover sintético é um modelo construído a partir de máximos de datasheet, não uma medição de qualquer unidade. (catálogo de tipos (<c1/>))

# text
seg-a0ddb65b00af = O relógio: a predefinição OCXO (datasheet Microchip OX-208, Rev 12-1-2021), em operação livre desde a primeira amostra, com ruído de frequência branco, flicker e (quando o ajuste exige) de passeio aleatório ajustado aos máximos do desvio de Allan do datasheet, e seu envelhecimento linear. A temperatura é mantida constante (amplitude { "0" } K), como as máscaras supõem. (comentário do arquivo de cenário, linhas { "12" } a { "15" })

# text
seg-101dbde1c65b = Página do tópico: <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Anterior</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Seguinte</s1>terrain-nav
