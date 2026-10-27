# benchmark: translations (pt-PT)

# text
seg-0c0ce6abb920 = Os mesmos registos, as mesmas regras. <s1>Pontuações à vista de todos.</s1>

# text
seg-cb2911864ea1 = O kshana-bench é um conjunto fixo de tarefas, partições e métricas para a deteção de interferência GNSS e o holdover de temporização, para que métodos diferentes possam ser comparados sobre os mesmos dados. Uma submissão é um ficheiro; nada é executado em nome de quem a submete. As linhas de base são os monitores do próprio motor, com limiares escritos antes da primeira execução pontuada.

# text
seg-11b19c2fd000 = Ver a tabela

# text
seg-b77706a0b8b5 = Ler a especificação

# attr:aria-label
seg-63a783e8fa0b = Tabela de classificação

# text
seg-556a1861ad9c = A tabela

# text
seg-64052578c384 = Ficheiros de resultados, pontuados pelo motor.

# text
seg-0ac1117a39b8 = Tabela de classificação do kshana-bench

# text
# c1: kshana-bench/2.0.0
seg-b71ad83b27ad = Ficheiros de resultados pontuados segundo <c1/>. Uma linha diz que este ficheiro obteve esta pontuação nesta partição. Não significa que algum produto tenha sido classificado ou aprovado por quem quer que seja, e nenhuma organização é indicada como avalista.

# text
seg-6a2052a10b6e = Apenas consultivo: modelado ou medido face a referências indicadas, não uma aprovação, certificação nem declaração de aderência à norma. Uma pontuação descreve um registo ou um corpus, nunca um produto.

# text
seg-2918ee229bdd = Tarefa (a): deteção em registos do recetor

# attr:aria-label
seg-7f2573819278 = Tarefa (a): deteção em registos do recetor, resultados de dev

# text
seg-082f44ff5710 = Partição: dev

# text
seg-46c7e6f003dd = Sistema

# text
seg-5aa5efd6b7da = AUC

# text
seg-dc9137d28ced = P_d no limite de P_fa (limite superior)

# text
seg-75ada2743d1d = SHA-256 da referência

# text
seg-e77eb0d4b34b = kshana receiver-trust agc_k_sigma (estatística de monitor predefinida { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-c9d7efecc1d9 = pontuado

# text
seg-b47a5173a65c = kshana receiver-trust cn0_drop_db (estatística de monitor predefinida { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-8b5d25c24aee = kshana receiver-trust jam_ind_threshold (estatística de monitor predefinida { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-9c794cbe6919 = Tarefa (a): deteção em registos do recetor, resultados do conjunto reservado

# text
seg-bf455fb5bda5 = Partição: conjunto reservado

# attr:aria-label
seg-d69e976e0fa9 = Tarefa (a): deteção em registos do recetor, resultados de teste

# text
seg-c163c8084e23 = Partição: teste

# text
seg-4c475a58619d = Tarefa (b): deteção em IQ

# attr:aria-label
seg-26740783c99e = Tarefa (b): deteção em IQ, resultados de teste

# text
seg-6f1b3b3729bf = monitores iq do kshana: cn0_drop (CUSUM) <s1>kshana-bench/2.0.0</s1>

# text
seg-7e2dd8e3fb49 = transitado: docs/design/DETECTION-ROC.md secção { "3" }: a campanha R1 de tests/iq_campaign_roc.rs, executada em 2026-10-13; não voltou a ser executada para o bench v1. O limiar R1 (AUC >= { "0.95" }) foi NOT MET.

# text
seg-e7c2cfbb1e8c = Tarefa (c): previsão de holdover de temporização

# attr:aria-label
seg-9198e0e61f53 = Tarefa (c): previsão de holdover de temporização, resultados de dev

# text
seg-46487e0c8856 = RMSE { "3600" } s (ns)

# text
seg-6c032477c78f = RMSE { "300" } s (ns)

# text
seg-780fda205195 = RMSE { "7200" } s (ns)

# text
seg-2246c31f1782 = linha de base do kshana-bench: linear <s1>kshana-bench/2.0.0</s1>

# text
seg-af33c581ac95 = linha de base do kshana-bench: quadrática <s1>kshana-bench/2.0.0</s1>

# text
seg-d8bb527fe5be = linha de base do kshana-bench: manutenção <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-18fd676cd356 = Tarefa (c): previsão de holdover de temporização, resultados de teste

# text
seg-ca13357b9f63 = Tarefa (d): diferença de otimismo fora da distribuição

# attr:aria-label
seg-dbbcfa3baaf4 = Tarefa (d): diferença de otimismo fora da distribuição, resultados de dev

# text
seg-b022faebf582 = AUC dentro

# text
seg-824b2aff7e8d = AUC fora

# text
seg-835f66c4ee63 = Diferença de otimismo

# text
seg-fea8fb19c38c = Indicador

# text
seg-698f3f00492d = linha de base do impairment-eval: fused(max-z) <s1>kshana-bench/2.0.0</s1>

# text
seg-6320a9edbdca = dentro da tolerância

# text
seg-aa7cda114a64 = linha de base do impairment-eval: sqm-imbalance <s1>kshana-bench/2.0.0</s1>

# text
seg-c272e7fd6a7f = linha de base do impairment-eval: agc-excess <s1>kshana-bench/2.0.0</s1>

# text
seg-02fb2080da2e = linha de base do impairment-eval: raim-parity <s1>kshana-bench/2.0.0</s1>

# text
seg-00c8aea0d4fe = linha de base do impairment-eval: energy(cn0-drop) <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-ee090c2f6612 = Tarefa (d): diferença de otimismo fora da distribuição, resultados de teste

# text
seg-88c3cc6c3800 = Toda a pontuação é modelada, a menos que uma linha indique que uma referência independente externa concordou. Licença da especificação e dos manifestos: CC-BY-4.0 / CC0 propostas, decisão do titular pendente. O conjunto reservado de dados reais não é secreto: consulte a especificação, secção { "4" }.

# attr:aria-label
seg-68e7ed4fc6ee = O que uma linha pode afirmar

# text
seg-7912ad415e48 = O que significa uma linha

# text
seg-7b6aa7dbc2e4 = Uma pontuação descreve um registo, não um produto.

# text
seg-69cc3c1470b3 = Uma linha diz: este ficheiro obteve X na partição S segundo a versão V da especificação. Não diz que um produto é certificado, aderente à norma, aprovado ou avalizado, e nenhuma organização é indicada como avalista.

# text
seg-dd289a4fc50a = Os dados são registados ou sintéticos e estão identificados na especificação. Os dados de terceiros nunca são copiados para o repositório: os manifestos e os scripts de obtenção fixam cada ficheiro por SHA-256, e cada licença é registada antes de os dados serem utilizados.

# text
seg-d48b2ec4cbe8 = A referência de um registo gravado são os intervalos agendados do plano de ensaio, não as horas de emissão efetivamente gravadas, pelo que uma probabilidade de deteção é um limite inferior. A especificação di-lo junto de cada tarefa.

# text
seg-6883a66f3bdd = Um conjunto reservado selado só é pontuado numa ronda da tabela de classificação, e a sua semente é revelada depois dela. Os limiares de qualquer linha de base que reivindique um valor são fixados antes da execução pontuada e nunca são relaxados depois; uma falha é registada como NOT MET.

# text
seg-97d14f361df5 = Veredictos tal como registados no ficheiro de resultados: os limiares do pontuador, C1 a C3 e D2, são atingidos; A2 é NOT MET (AUC de agc_k_sigma { "0.766" } face a pelo menos { "0.80" } na partição de teste), D1 é NOT MET (maior diferença { "0.0301" }) e a tarefa (b) R1 é NOT MET (transitado, não voltou a ser executado). Nenhum limiar é relaxado.

# text
seg-23023a10ef10 = Apenas consultivo: os resultados do Kshana são modelados ou medidos face a referências indicadas, não uma aprovação nem uma declaração de aderência à norma.

# text
# c1: kshana bench score
# c2: kshana bench leaderboard
seg-b30115d8c2eb = Execute-o por si: <c1/> transforma uma submissão e a referência de uma partição num ficheiro de resultados; <c2/> apresenta os ficheiros de resultados nesta página.
