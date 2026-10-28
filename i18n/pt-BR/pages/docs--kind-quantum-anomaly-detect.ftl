# docs--kind-quantum-anomaly-detect: translations (pt-BR)

# text
seg-29e58493fdd4 = Modelado

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
# c1: docs/kinds/by-kind/quantum-anomaly-detect.md
seg-836d5102f0d1 = Fonte: <c1/>

# text
# c1: quantum-anomaly-detect
seg-ad4ce0110e8d = <c1/> (tipo de cenário)

# text
seg-04310cd6cbec = Detecção de falhas/anomalias MODELLED para sistemas PNT quânticos: um catálogo rotulado de falhas (salto de frequência/deriva/perda de sincronismo do relógio; salto de viés/perda de dados do sensor), uma AUC ROC da estatística de detecção (com um IC bootstrap a partir do eval_stats validado externamente) e uma falha mínima detectável a uma taxa fixa de falso alarme, com o monitor auxiliado por relógio quântico (menor ruído) detectando falhas menores — como TradeEvidence honesto + representatividade. Modelo gaussiano da estatística de detecção (AUC = Phi(mu/(sigma*sqrt2))); modela a classe, com parâmetros ilustrativos de fonte pública, sem TRL, voo nem certificação.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Uma execução de <c1/> resume-se assim: quantum-anomaly-detect | AUC quantum { "0.9908" } vs classical { "0.7603" } | min-detectable fault quantum { "1.312" } vs classical { "4.372" } | { "5" } fault classes | trade quantum wins 2/2 | MODELLED

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-335b8d87e27d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-c2b10c0bdaf8 = O exemplo <c1/> define, entre outros:

# text
seg-f44afe581836 = { $version }

# attr:alt
seg-2f1d14239d1a = O gráfico que o motor escreve para scenarios/quantum-anomaly-detect.toml, tipo de cenário quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> AUC ROC binormal analítica = Φ(μ/(σ√{ "2" })) e a falha mínima detectável σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentam os detectores de falhas e de anomalias quânticas. Referência independente (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), ambos BSD-3-Clause — bibliotecas independentes que calculam as mesmas grandezas univocamente definidas de cauda gaussiana / AUC, coincidentes até o piso da erf de A&S (~{ "7e-8" }). A vantagem quântico-versus-clássico construída sobre isso continua MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns por figura de mérito, quântico contra clássico, com benefício de polaridade correta, opcional { "95" }%. Referência independente (InternalConsistency): identidades de benefício/vencedor em forma fechada + envoltório fiel do quantum_trade::TradeResult existente; a honestidade está ligada ao registro de representatividade e aos rótulos de verificação

# text
seg-b854cedc8a51 = <b>MODELLED</b> Catálogo rotulado de falhas quânticas (salto de frequência/deriva/perda de sincronismo do relógio; salto de viés/perda de dados do sensor), uma AUC ROC da estatística de detecção com um IC bootstrap, e uma mínim. Referência independente (InternalConsistency): AUC gaussiana em forma fechada = Phi(mu/(sigma*sqrt2)) verificada de forma cruzada contra o eval_stats::bootstrap_auc_ci validado externamente (contra scikit-learn) + limiares analíticos de detecção

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = Detecção de falhas/anomalias MODELLED para sistemas PNT quânticos: um catálogo rotulado de falhas (salto de frequência/deriva/perda de sincronismo do relógio; salto de viés/perda de dados do sensor), uma AUC ROC da estatística de detecção (com um IC bootstrap a partir do eval_stats validado externamente) e uma falha mínima detectável a uma taxa fixa de falso alarme, com o monitor auxiliado por relógio quântico (menor ruído) detectando falhas menores — como TradeEvidence honesto + representativ (catálogo de tipos de cenário (<c1/>))

# text
seg-7f43972b246d = Detecção de falhas/anomalias para sistemas PNT quânticos — catálogo rotulado de falhas + AUC ROC + falha mínima detectável, monitor auxiliado por relógio quântico contra monitor clássico. MODELLED; parâmetros ilustrativos de fonte pública; modela a classe, sem alegação de TRL nem de voo. (comentário do arquivo de cenário, linhas { "1" } a { "3" })

# text
seg-eb75c6a4dcec = A evidência de comparação quântico-versus-clássico (forma comum) é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = A detecção de falhas/anomalias para sistemas PNT quânticos é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Anterior</s1>pvt

# text
seg-aa689568cf84 = <s1>Próximo</s1>quantum-gnss-free-nav
