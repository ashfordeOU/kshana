# docs--kind-quantum-trade: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-eb55d253dd11 = Compromisso PNT quântico-vs-clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o eixo da defensabilidade — ou uma classe de relógio quântico) vs uma classe de linha de base clássica, com a ressalva do pressuposto de patamar a tau longo transportada no artefacto, mais uma envolvente de resiliência-vs-tempo sem GNSS. MODELLED; quantifica (nunca valida) um dispositivo de parceiro. O relógio candidato é uma curva medida (<c1/> + <c2/>, de igual comprimento, com pelo menos { "2" } pontos; prevalece quando ambas as formas são indicadas) ou um <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Uma execução de <c1/> resume-se assim: quantum-trade | candidato ADEV medida | holdover de temporização 2621947s vs 203s (12943.62x) | inercial 14108s vs 378s (37.34x) | deslize de resiliência 14108s | MODELLED [ressalva de patamar assumido]

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
seg-f5fa445702c6 = Etiqueta de resultado (a do motor): MODELLED — quantifica (nunca valida) um relógio/sensor de parceiro; não demonstrado em voo

# attr:alt
seg-c74c63ffd859 = O gráfico que o motor escreve para scenarios/quantum-trade.toml, tipo quantum-trade

# text
seg-93310aaa6ead = <b>VALIDATED</b> Recuperação NNLS de lei de potência (FM branco + patamar de ruído vermelho) a partir de um desvio de Allan medido e publicado da transição de relógio ótico de ⁸⁸Sr — a reproduzir σ_y(τ) e a escala de destaque 4.7e-16/√τ a τ curto com um patamar genuíno medido a τ longo, em vez de Ensaios: <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Ajuste NNLS de ADEV medida, bandas de consistência χ² de NEES/NIS e a covariância de ruído de processo discreto de van Loan do relógio (deslize em holdover) — a espinha dorsal computacional do motor de compromissos Ensaios: <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Ingestão de ADEV medida (NNLS), tabela de compromissos (holdover de temporização/inercial + benefício), envolvente de resiliência-vs-tempo; ressalva de patamar transportada no artefacto.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Ajuste NNLS de ADEV medida, bandas de consistência χ² de NEES/NIS e a covariância de ruído de processo discreto de van Loan do relógio (deslize em holdover) — a espinha dorsal computacional do motor de compromissos. Referência independente (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exatos, χ² <{ "5e-4" } nos graus de liberdade operacionais. Apenas núcleos — os números de desempenho dos dispositivos continuam modelados (linha seguinte)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Ingestão de ADEV medida (NNLS), tabela de compromissos (holdover de temporização/inercial + benefício), envolvente de resiliência-vs-tempo; ressalva de patamar transportada no artefacto. Executável a partir. Referência independente (ExternalDataset): o núcleo de ajuste ADEV medida→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um núcleo externo independente; mas os NÚMEROS do compromisso quantificam (nunca validam) um relógio/CAI de parceiro, pelo que o próprio compromisso continua MODELLED, sem halo de validação

# text
# c1: label
seg-3d678f64e41c = MODELLED — quantifica (nunca valida) um relógio/sensor de parceiro; não demonstrado em voo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Compromisso PNT quântico-vs-clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o eixo da defensabilidade — ou uma classe de relógio quântico) vs uma classe de linha de base clássica, com a ressalva do pressuposto de patamar a tau longo transportada no artefacto, mais uma envolvente de resiliência-vs-tempo sem GNSS. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED; quantifica (nunca valida) um dispositivo de parceiro. (catálogo de tipos (<c1/>))

# text
seg-15275d27252a = Calcula o benefício de holdover de temporização e de holdover inercial de um relógio CANDIDATO face a uma linha de base CLÁSSICA, mais uma envolvente de resiliência-vs-tempo sem GNSS. O patamar do candidato é determinado pela curva de ADEV sobreposta MEASURED de um relógio de parceiro (o eixo da defensabilidade), ajustada por mínimos quadrados não negativos — pelo que o orçamento de holdover assenta em dados reais, e não num patamar assumido a tau longo. (comentário do ficheiro de cenário, linhas { "3" } a { "7" })

# text
seg-ecbdbc9b163e = ÂMBITO HONESTO: MODELLED — QUANTIFICA o benefício do relógio quântico de um parceiro; NÃO valida o dispositivo e nunca pede emprestadas as ilhas de validação SGP4/Allan/IGS. Quando o patamar de alguma linha é uma predefinição de classe assumida, é apresentada no artefacto uma ressalva de patamar. Executar: kshana scenarios/quantum-trade.toml (comentário do ficheiro de cenário, linhas { "9" } a { "12" })

# text
seg-4b59ac409819 = O compromisso PNT quântico-vs-clássico e a resiliência sem GNSS ({ "13503" }) são MODELLED, não validados: uma subalegação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Anterior</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Seguinte</s1>realtime-frame-eop
