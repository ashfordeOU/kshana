# docs--kind-impairment-eval: translations (pt-BR)

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
# c1: docs/kinds/by-kind/impairment-eval.md
seg-2e6b437f3e99 = Fonte: <c1/>

# text
# c1: impairment-eval
seg-134407946837 = <c1/> (tipo de cenário)

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espectro</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-98e740d32860 = Bancada de avaliação de detecção de degradações de RF por aprendizado de máquina ({ "13494" }): gerar um corpus SINTÉTICO rotulado e fundamentado em parâmetros (nominal/jamming/spoof de tempo/spoof de posição/multipercurso), pontuar um detector (energy|agc|sqm|parity|fused) com a estrutura de teste agnóstica ao detector, e informar AUC/ROC/confusão + Pd por classe em um Pfa-alvo, além da lacuna de otimismo dentro versus fora da distribuição. Apenas características operacionais MODELLED — nunca dados de campo/IQ, sem veredito bom/ruim.

# text
# c1: scenarios/impairment-eval.toml
seg-41c3f9559282 = Uma execução de <c1/> resume-se assim: impairment-eval | detector fused(max-z) | AUC { "0.998" } dentro / { "0.981" } fora (lacuna { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ alvo { "0.05" } | { "1000" } casos | MODELLED sintético

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-9b0d7ebaa1f0 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/impairment-eval.toml
seg-283510d17885 = O exemplo <c1/> define, entre outros:

# text
seg-6a64be3b3f07 = fused

# text
seg-3db71c5bdd0a = auc_out usa uma região fora de sintonia mais sutil

# text
seg-667d26b3a2fe = Rótulo do resultado (o do motor): MODELLED — corpus sintético fundamentado em parâmetros (nunca dados de campo/IQ); apenas características operacionais, sem veredito bom/ruim

# attr:alt
seg-7e7b07bc5545 = O gráfico que o motor gera para scenarios/impairment-eval.toml, tipo de cenário impairment-eval

# text
seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, empates ½), matriz de confusão no limiar, P_d/P_md/P_fa/precisão/acurácia/F1 Testes: <a1>eval_metrics_reference.rs</a1>.

# text
seg-ceedc14c623a = <b>VALIDATED</b> AUC da ROC + IC por bootstrap separando anomalias reais rotuladas; detector transparente (reproduz os rótulos) Testes: <a1>opssat_ad_reference.rs</a1>.

# text
seg-0ee5b31cfd09 = <b>MODELLED</b> Corpus sintético rotulado de degradações + estrutura de teste ROC/AUC/confusão/Pfa-Pmd agnóstica ao detector; proteção contra vazamento, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro versus fora do regime).

# text
seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, empates ½), matriz de confusão no limiar, P_d/P_md/P_fa/precisão/acurácia/F1. Referência independente (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — biblioteca independente, coincidência exata

# text
seg-c719d4060e1a = <b>MODELLED</b> Corpus sintético rotulado de degradações + estrutura de teste ROC/AUC/confusão/Pfa-Pmd agnóstica ao detector; proteção contra vazamento, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro versus fora do r. Referência independente (InternalConsistency): Limites de AUC em forma fechada (Mann–Whitney) + um detector de referência independente perfeito; o corpus é SINTÉTICO (fundamentado em parâmetros, não dados de campo/IQ)

# text
# c1: label
seg-5565108cc4d1 = MODELLED — corpus sintético fundamentado em parâmetros (nunca dados de campo/IQ); apenas características operacionais, sem veredito bom/ruim (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d2a9f35ea8cc = Apenas características operacionais MODELLED — nunca dados de campo/IQ, sem veredito bom/ruim. (catálogo de tipos de cenário (<c1/>))

# text
seg-376f86fbdcb7 = ESCOPO HONESTO: apenas características operacionais MODELLED. O corpus é sintético e fundamentado em parâmetros (composto a partir dos modelos de jamming/AGC/SQM/paridade do Kshana) — nunca capturas de campo ou IQ bruto. A estrutura de teste é um árbitro; ela informa características, não emite um veredito bom/ruim. Execução: kshana scenarios/impairment-eval.toml (comentário do arquivo de cenário, linhas { "9" } a { "12" })

# text
seg-882d67b9474f = A avaliação de detecção de degradações de RF por aprendizado de máquina ({ "13494" }) é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espectro</a1>

# text
seg-6cf4bb2d7f7a = Página do tópico: <a1>BENCH.md</a1>

# text
seg-dde90de4270b = <s1>Anterior</s1>hybrid

# text
seg-1e68310f2dc6 = <s1>Próximo</s1>inertial
