# docs--bench: translations (pt-BR)

# text
seg-5aa5efd6b7da = AUC

# text
# c1: docs/BENCH.md
seg-5fcf52aba837 = Fonte: <c1/>

# text
# c1: bench/SPEC.md
# c2: bench/LICENCES.md
# c3: xval/bench/PREREGISTRATION.md
# c4: PREREGISTRATION-v2.md
# c5: xval/bench/RESULTS-v2.md
seg-d3c3517e3bb2 = Um conjunto aberto de tarefas, partições e métricas para detecção de interferência GNSS e holdover de temporização. A especificação é <a1><c1/></a1> (versão { "2.0.0" }; licença do texto e dos manifestos: CC-BY-4.0 / CC0 propostas, decisão do proprietário pendente). A revisão das licenças dos conjuntos de dados está em <a2><c2/></a2>. Os limiares das linhas de base foram fixados antes da primeira execução pontuada em <a3><c3/></a3> e, para a { "2.0.0" }, em <a4><c4/></a4>, e seus resultados estão em <a5><c5/></a5>.

# text
# c1: agc_k_sigma
seg-6c455061baac = Veredictos conforme registrados ali: os limiares do pontuador, C1 a C3 e D2, são atingidos; <b>A2 é NOT MET</b> (AUC de <c1/> { "0.766" } contra pelo menos { "0.80" } na partição de teste), <b>D1 é NOT MET</b> (maior diferença { "0.0301" }) e <b>a tarefa (b) R1 é NOT MET</b> (herdada, não reexecutada). Nenhum limiar é afrouxado.

# text
seg-ebe1c987bc7c = O que é: uma forma de comparar métodos nos mesmos dados com o mesmo código de métrica. O que não é: um ranking de produtos, uma aprovação ou evidência de que um método funciona em campo. Toda pontuação é MODELLED, e uma pontuação descreve um registro ou um corpus, nunca um produto. Os resultados do Kshana são consultivos.

# attr:alt
seg-874effe5ee80 = As linhas de base embutidas da tarefa D do kshana-bench (a lacuna de otimismo) na partição de teste, a partir de uma execução real do motor v{ $version } (`kshana bench baseline`). Cada par de barras é a área sob a curva ROC nos casos dentro da distribuição e nos casos deslocados; a diferença entre eles é a lacuna de otimismo, contra uma tolerância de { "0.05" }. fused-max-z: { "0.998" } e { "0.983" } (diferença { "0.015" }); sqm-imbalance: { "0.882" } e { "0.882" } (diferença { "0.001" }); agc-excess: { "0.848" } e { "0.819" } (diferença { "0.030" }); raim-parity: { "0.682" } e { "0.672" } (diferença { "0.010" }); energy-cn0-drop: { "0.595" } e { "0.565" } (diferença { "0.030" }). Os rótulos são rótulos de modelo generativo de um corpus sintético, nunca dados de campo: MODELLED. Consultivo: modelado ou medido em relação a referências declaradas, não uma aprovação, certificação nem declaração de aderência à norma. Uma pontuação descreve um registro ou corpus, nunca um produto.

# text
seg-6ce7bd4525d6 = Tarefas

# text
seg-09907c94f04d = Tarefa

# text
seg-1c6199627b90 = Dados

# text
seg-9cdfe78e3b22 = Métrica principal

# text
seg-5093217f24a1 = (a) detecção em registros de receptor

# text
seg-809068c95ddf = uma época de um registro do JammerTest { "2024" }

# text
# c1: scripts/fetch_jammertest2024.sh
seg-f87dda92fbd2 = obtido por <c1/> (GPL-3.0+, nunca incorporado ao repositório)

# text
seg-9493bfc5bd64 = (b) detecção em IQ

# text
seg-8d012e25aa62 = uma janela pontuada de uma cena

# text
seg-69f020ed20da = receita de cena sintética do Kshana; TEXBAT apenas como referência

# text
seg-499ae444224e = AUC por tipo de alarme

# text
seg-73028caefeb0 = (c) previsão de holdover de temporização

# text
seg-0d0b071690cf = (satélite, origem)

# text
seg-6cf42152f523 = relógios IGS a { "300" } s (extrato versionado, hash fixado)

# text
seg-74bd23dfebf5 = RMSE a { "3600" } s

# text
seg-3cc3545250e5 = (d) lacuna de otimismo fora da distribuição

# text
seg-ab343a29b019 = um caso sintético

# text
# c1: impairment-eval
seg-b25d781ff536 = corpus <c1/>, dentro e fora da distribuição

# text
seg-e32f49d34f7b = AUC de saída e a diferença

# text
seg-1ad563733f12 = Comandos

# text
# c1: kshana-bench-predictions/1
# c2: scores
# c3: predictions
# c4: kshana-bench-result/1
seg-c9d00ff2e1d0 = Uma submissão é um arquivo (<c1/>): <c2/> (um número por id de caso; quanto maior, mais provável que esteja comprometido) para as tarefas a, b e d, ou <c3/> (a variação de fase em ns em cada horizonte) para a tarefa c. Um arquivo de resultado (<c4/>) indica a versão da especificação, a partição, o SHA-256 da verdade de referência e das previsões, e as métricas. Resultados de versões principais diferentes da especificação nunca são colocados em uma mesma tabela.

# text
seg-bdc715c52ab5 = Limites honestos

# text
# c1: bench/holdout/COMMITMENTS.json
seg-f26f0e79f2ed = Os conjuntos reservados de dados reais (a e c) são públicos, porque qualquer pessoa pode baixar os dados. Eles protegem contra a escolha de uma partição depois de ver as pontuações, não contra o ajuste nessas pastas. O conjunto reservado selado da tarefa (d) é um compromisso e revelação: o proprietário registra apenas o hash em <c1/> e guarda a semente (nenhum está selado ainda).

# text
# c1: kshana jammertest score
seg-81c3f961230b = A verdade de referência da tarefa (a) são as janelas de ataque programadas dos registros de eventos, com resolução de um minuto, de modo que uma probabilidade de detecção é um limite inferior; as métricas em nível de evento (latência, alarmes perdidos, alarmes falsos) chegam com o pontuador do Jammertest de <c1/>.

# text
# c1: docs/design/DETECTION-ROC.md
seg-47df52b5c5e6 = A linha de base de IQ da tarefa (b) é herdada de <c1/>, não reexecutada para a v1.

# text
seg-d54342791763 = O corpus da tarefa (d) é uma verificação de separabilidade e de pipeline; uma AUC nele é uma AUC sobre rótulos derivados de modelo.

# text
seg-3d8bfdeead6c = <s1>Anterior</s1>Observatório de interferência: resultados

# text
seg-07f5b51844d1 = <s1>Próximo</s1>Executando um receptor contra um cenário
