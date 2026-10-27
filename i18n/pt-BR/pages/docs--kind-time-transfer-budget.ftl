# docs--kind-time-transfer-budget: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-dfe78b9d0811 = GHz

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: docs/kinds/by-kind/time-transfer-budget.md
seg-937ebbbd612c = Fonte: <c1/>

# text
# c1: time-transfer-budget
seg-6af6f07f5f5a = <c1/> (tipo de cenário)

# text
seg-9a2bb9809aed = Transferência bidirecional de tempo e frequência por satélite entre duas estações por meio de um relé geoestacionário: a equação bidirecional resolvida para T_A - T_B com todo termo não recíproco (atrasos do equipamento das estações, ionosfera em banda Ku, transponder, Sagnac), um orçamento de incerteza em quadratura cujo termo do tipo A é o TDEV do enlace simulado no tempo de médias, um enlace simulado com ruído de fase branco e flicker e uma não reciprocidade diurna, e a estabilidade (taxa, RMS residual, TDEV, ADEV) de qualquer série fornecida da Seção { "1" } da Circular T do BIPM, CSV MJD,ns ou registros de relógio de estação RINEX do IGS. MODELLED.

# text
# c1: scenarios/time-transfer-budget.toml
seg-a4f8e9a09026 = Uma execução de <c1/> resume-se assim: time-transfer-budget: europe - north-america deslocamento { "12.500" } ns (Sagnac { "204.365" } ns, ionosfera { "0.0213" } ns); u combinada { "1.087" } ns (tipo A { "0.031" } ns em { "86400" } s); { "0" } série real (MODELLED)

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
seg-0353d795ebdf = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: uplink_ghz
# c2: downlink_ghz
# c3: true_offset_ns
# c4: flicker_noise_ns
# c5: diurnal_amplitude_ns
# c6: reciprocity_bias_ns
# c7: step_s
# c8: span_days
# c9: averaging_s
# c10: seed
# c11: series
seg-fe3afa366df2 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/time-transfer-budget.toml
seg-00026a1d3760 = O exemplo <c1/> define, entre outros:

# text
seg-2409cc9397c7 = Rótulo do resultado (do mecanismo): MODELLED — equação bidirecional do TWSTFT (atrasos das estações, ionosfera em banda Ku, transponder, Sagnac) resolvida a partir de atrasos declarados, um orçamento de incerteza em quadratura com o TDEV do enlace simulado como termo do tipo A, um enlace simulado com ruído de fase flicker e não reciprocidade diurna, e a estabilidade de qualquer r

# attr:alt
seg-92d3c84024d7 = O gráfico que o mecanismo gera para scenarios/time-transfer-budget.toml, tipo time-transfer-budget

# text
seg-83b9c66b9e92 = <b>MODELLED</b> A equação bidirecional do TWSTFT resolvida para T_A - T_B com os atrasos de transmissão e recepção das estações, a assimetria ionosférica de subida/descida em banda Ku, a diferença de atraso do transponder e os termos de Sagnac, contra o seu modelo direto exato; uma incerteza em quadratura

# text
seg-58cf4086c7a5 = <b>MODELLED</b> A equação bidirecional do TWSTFT resolvida para T_A - T_B com os atrasos de transmissão e recepção das estações, a assimetria ionosférica de subida/descida em banda Ku, a diferença de atraso do transp. Referência independente (InternalConsistency): consistência interna: o modelo direto e a equação resolvida concordam a { "1e-15" } s, o termo de Sagnac é igual à forma de laço 2A omega/c^{ "2" } do BIPM, independente do módulo, o termo ionosférico é { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, e os processos de ruído mostram os formatos de TDEV esperados. O QUE NÃO É: nenhuma medição ou relatório de calibração real de TWSTFT foi comparado; os atrasos e as incertezas declarados são entradas, não medidos; t

# text
# c1: label
seg-15de1cdaa684 = MODELLED — equação bidirecional do TWSTFT (atrasos das estações, ionosfera em banda Ku, transponder, Sagnac) resolvida a partir de atrasos declarados, um orçamento de incerteza em quadratura com o TDEV do enlace simulado como termo do tipo A, um enlace simulado com ruído de fase flicker e não reciprocidade diurna, e a estabilidade de qualquer série real de UTC-UTC(k) ou de relógio de estação fornecida; não comparado com um enlace TWSTFT real (resultado <c1/>)

# text
seg-70448ca49780 = Transferência bidirecional de tempo e frequência por satélite (TWSTFT) entre duas estações ILLUSTRATIVE, uma na Europa central e outra no leste da América do Norte, por meio de um relé geoestacionário a { "10" } deg W. A execução resolve a equação bidirecional para T_A - T_B a partir dos termos declarados de equipamento, transponder, ionosfera (banda Ku, 14/11 GHz) e Sagnac. Forma um orçamento de incerteza cujo termo estatístico é o TDEV, em um dia, de um simula (comentário do arquivo de cenário, linhas { "1" } a { "8" })

# text
seg-4b0d23aed0ab = A equação bidirecional do TWSTFT, o orçamento de incerteza e a estabilidade do enlace com flicker e não reciprocidade diurna é MODELLED, não validado: conferido com a própria identidade analítica de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-52e06909ccc5 = <s1>Anterior</s1>terrain-slam

# text
seg-a22fa1c51042 = <s1>Seguinte</s1>timetransfer
