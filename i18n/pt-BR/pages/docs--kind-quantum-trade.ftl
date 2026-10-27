# docs--kind-quantum-trade: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-51cac2f918e0 = Página do tema: <a1>POSITIONING.md</a1>

# text
# c1: docs/kinds/by-kind/quantum-trade.md
seg-3a8c76a2396f = Fonte: <c1/>

# text
# c1: quantum-trade
seg-f9af2813532e = <c1/> (tipo de cenário)

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Comparação PNT quântico-versus-clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o ponto central da defensabilidade — ou uma classe de relógio quântico) contra uma classe clássica de linha de base, com a ressalva da hipótese de piso de tau longo carregada no artefato, mais um envelope de resiliência contra o tempo sem GNSS. MODELLED; quantifica (nunca valida) um dispositivo do parceiro. O relógio candidato é uma curva medida (<c1/> + <c2/>, de igual comprimento, com pelo menos { "2" } pontos; ela prevalece quando as duas formas são dadas) ou uma <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Uma execução de <c1/> resume-se assim: quantum-trade | candidate measured-ADEV | timing holdover 2621947s vs 203s (12943.62x) | inertial 14108s vs 378s (37.34x) | resilience coast 14108s | MODELLED [floor-assumed caveat]

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
seg-2639560aeff2 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: baseline_ins
# c2: candidate_ins
# c3: resilience_times_s
# c4: alt_pnt_bound_m
seg-d66f1ef84201 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-trade.toml
seg-f2cc0830b53f = O exemplo <c1/> define, entre outros:

# text
seg-ee5bcbbe0167 = csac

# text
seg-a6551a61cf69 = linha de base clássica

# text
seg-f5fa445702c6 = Rótulo do resultado (o do motor): MODELLED — quantifica (nunca valida) um relógio/sensor do parceiro; não demonstrado em voo

# attr:alt
seg-c74c63ffd859 = O gráfico que o motor escreve para scenarios/quantum-trade.toml, tipo de cenário quantum-trade

# text
seg-93310aaa6ead = <b>VALIDATED</b> Recuperação por NNLS de lei de potência (FM branca + piso de ruído vermelho) a partir de um desvio de Allan medido e publicado da transição de relógio óptico de ⁸⁸Sr — reproduzindo σ_y(τ) e a escala principal de τ curto de 4.7e-16/√τ, com um piso genuíno de τ longo medido, em vez de Testes: <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Ajuste NNLS de ADEV medido, faixas de consistência χ² de NEES/NIS e a covariância de ruído de processo discreto de van Loan do relógio (deriva em holdover) — a espinha computacional do motor de comparação Testes: <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Ingestão de ADEV medido (NNLS), tabela de comparação (holdover de temporização/inercial + benefício), envelope de resiliência contra o tempo; ressalva de piso carregada no artefato.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Ajuste NNLS de ADEV medido, faixas de consistência χ² de NEES/NIS e a covariância de ruído de processo discreto de van Loan do relógio (deriva em holdover) — a espinha computacional do motor de comparação. Referência independente (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exatos, χ² <{ "5e-4" } nos graus de liberdade operacionais. Apenas núcleos — os números de desempenho de dispositivos continuam modelados (linha seguinte)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Ingestão de ADEV medido (NNLS), tabela de comparação (holdover de temporização/inercial + benefício), envelope de resiliência contra o tempo; ressalva de piso carregada no artefato. Executável a partir. Referência independente (ExternalDataset): o núcleo de ajuste ADEV medido→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um núcleo externo independente; mas os NÚMEROS da comparação quantificam (nunca validam) um relógio/CAI do parceiro, de modo que a comparação em si continua MODELLED, sem halo de validação

# text
# c1: label
seg-3d678f64e41c = MODELLED — quantifica (nunca valida) um relógio/sensor do parceiro; não demonstrado em voo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Comparação PNT quântico-versus-clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o ponto central da defensabilidade — ou uma classe de relógio quântico) contra uma classe clássica de linha de base, com a ressalva da hipótese de piso de tau longo carregada no artefato, mais um envelope de resiliência contra o tempo sem GNSS. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED; quantifica (nunca valida) um dispositivo do parceiro. (catálogo de tipos de cenário (<c1/>))

# text
seg-15275d27252a = Calcula o benefício de holdover de temporização e de holdover inercial de um relógio CANDIDATO sobre uma linha de base CLÁSSICA, mais um envelope de resiliência contra o tempo sem GNSS. O piso do candidato é conduzido pela curva ADEV sobreposta MEASURED de um relógio do parceiro (o ponto central da defensabilidade), ajustada por mínimos quadrados não negativos — de modo que o orçamento de holdover se apoia em dados reais, e não em um piso de tau longo presumido. (comentário do arquivo de cenário, linhas { "3" } a { "7" })

# text
seg-ecbdbc9b163e = ESCOPO HONESTO: MODELLED — ele QUANTIFICA o benefício do relógio quântico de um parceiro; NÃO valida o dispositivo, e nunca toma emprestadas as ilhas de validação de SGP4/Allan/IGS. Quando o piso de qualquer linha é um padrão de classe presumido, uma ressalva de piso é exibida no artefato. Execução: kshana scenarios/quantum-trade.toml (comentário do arquivo de cenário, linhas { "9" } a { "12" })

# text
seg-4b59ac409819 = A comparação PNT quântico-versus-clássico e a resiliência sem GNSS ({ "13503" }) são MODELLED, não validadas: uma subalegação é verificada externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Anterior</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Próximo</s1>realtime-frame-eop
