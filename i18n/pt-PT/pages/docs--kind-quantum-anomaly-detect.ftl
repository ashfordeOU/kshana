# docs--kind-quantum-anomaly-detect: translations (pt-PT)

# text
seg-29e58493fdd4 = Modelado

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-04310cd6cbec = Deteção MODELLED de falhas/anomalias para sistemas PNT quânticos: um catálogo etiquetado de falhas (relógio: salto de frequência/deriva/perda de bloqueio; sensor: degrau de enviesamento/perda de sinal), uma AUC da ROC da estatística de deteção (com um IC bootstrap a partir do eval_stats validado externamente) e uma falha mínima detetável a uma taxa fixa de falsos alarmes, com o monitor assistido por relógio quântico (menor ruído) a detetar falhas mais pequenas — como TradeEvidence honesta + representatividade. Modelo gaussiano da estatística de deteção (AUC = Phi(mu/(sigma*sqrt2))); modela a classe, parâmetros ilustrativos de fontes públicas, sem TRL/voo/certificação.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Uma execução de <c1/> resume-se assim: quantum-anomaly-detect | AUC quântico { "0.9908" } vs clássico { "0.7603" } | falha mínima detetável quântico { "1.312" } vs clássico { "4.372" } | { "5" } classes de falhas | no compromisso o quântico vence 2/2 | MODELLED

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

# text
seg-25da07e56aa8 = deteção de anomalias PNT quântica vs clássica

# attr:alt
seg-2f1d14239d1a = O gráfico que o motor escreve para scenarios/quantum-anomaly-detect.toml, tipo quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> AUC da ROC binormal analítica = Φ(μ/(σ√{ "2" })) e falha mínima detetável σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentam os detetores de falhas quânticas e de anomalias. Referência independente (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), ambas BSD-3-Clause — bibliotecas independentes que calculam as mesmas grandezas de cauda gaussiana / AUC definidas de forma única, coincidentes até ao limite do erf de A&S (~{ "7e-8" }). A vantagem quântico-vs-clássico construída por cima continua MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns quântico-vs-clássico por FoM com benefício de polaridade correta, opcional { "95" }%. Referência independente (InternalConsistency): identidades de forma fechada de benefício/vencedor + envolvimento fiel do quantum_trade::TradeResult existente; honestidade ligada ao registo de representatividade e às etiquetas de verificação

# text
seg-b854cedc8a51 = <b>MODELLED</b> Catálogo etiquetado de falhas quânticas (relógio: salto de frequência/deriva/perda de bloqueio; sensor: degrau de enviesamento/perda de sinal), uma AUC da ROC da estatística de deteção com um IC bootstrap e uma mínim. Referência independente (InternalConsistency): AUC gaussiana de forma fechada = Phi(mu/(sigma*sqrt2)) verificada por comparação com o eval_stats::bootstrap_auc_ci validado externamente (vs scikit-learn) + limiares analíticos de deteção

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = Deteção MODELLED de falhas/anomalias para sistemas PNT quânticos: um catálogo etiquetado de falhas (relógio: salto de frequência/deriva/perda de bloqueio; sensor: degrau de enviesamento/perda de sinal), uma AUC da ROC da estatística de deteção (com um IC bootstrap a partir do eval_stats validado externamente) e uma falha mínima detetável a uma taxa fixa de falsos alarmes, com o monitor assistido por relógio quântico (menor ruído) a detetar falhas mais pequenas — como TradeEvidence honesta + representativ (catálogo de tipos (<c1/>))

# text
seg-7f43972b246d = Deteção de falhas/anomalias para sistemas PNT quânticos — catálogo etiquetado de falhas + AUC da ROC + falha mínima detetável, monitor assistido por relógio quântico vs clássico. MODELLED; parâmetros ilustrativos de fontes públicas; modela a classe, sem alegação de TRL/voo. (comentário do ficheiro de cenário, linhas { "1" } a { "3" })

# text
seg-eb75c6a4dcec = A evidência de compromisso quântico-vs-clássico (forma comum) é MODELLED, não validada: verificada face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = A deteção de falhas/anomalias para sistemas PNT quânticos é MODELLED, não validada: verificada face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Anterior</s1>pvt

# text
seg-aa689568cf84 = <s1>Seguinte</s1>quantum-gnss-free-nav
