# benchmark: translations (pt-BR)

# text
seg-0c0ce6abb920 = Mesmos registros, mesmas regras. <s1>Pontuações às claras.</s1>

# text
seg-cb2911864ea1 = O kshana-bench é um conjunto fixo de tarefas, divisões e métricas para detecção de interferência em GNSS e holdover de temporização, de modo que métodos diferentes possam ser comparados sobre os mesmos dados. Uma submissão é um arquivo; nada é executado em nome de quem a submete. As linhas de base são os próprios monitores do motor, com limiares escritos antes da primeira execução pontuada.

# text
seg-11b19c2fd000 = Ver o quadro

# text
seg-b77706a0b8b5 = Ler a especificação

# attr:aria-label
seg-63a783e8fa0b = Quadro de classificação

# text
seg-556a1861ad9c = O quadro

# text
seg-64052578c384 = Arquivos de resultados, pontuados pelo motor.

# text
seg-0ac1117a39b8 = Quadro de classificação do kshana-bench

# text
# c1: kshana-bench/2.0.0
seg-b71ad83b27ad = Arquivos de resultados pontuados sob <c1/>. Uma linha diz que este arquivo obteve esta pontuação nesta divisão. Isso não significa que algum produto tenha sido classificado ou aprovado por quem quer que seja, e nenhuma organização é citada como avalista.

# text
seg-6a2052a10b6e = Consultivo: modelado ou medido em relação a referências indicadas, não uma aprovação, certificação nem declaração de conformidade. Uma pontuação descreve um registro ou um corpus, nunca um produto.

# text
seg-2918ee229bdd = Tarefa (a): detecção em registros de receptor

# attr:aria-label
seg-7f2573819278 = Tarefa (a): detecção em registros de receptor, resultados de dev

# text
seg-082f44ff5710 = Divisão: dev

# text
seg-46c7e6f003dd = Sistema

# text
seg-5aa5efd6b7da = AUC

# text
seg-dc9137d28ced = P_d no limite de P_fa (limite superior)

# text
seg-75ada2743d1d = SHA-256 da verdade de referência

# text
seg-e77eb0d4b34b = kshana receiver-trust agc_k_sigma (estatística padrão do monitor { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-c9d7efecc1d9 = pontuado

# text
seg-b47a5173a65c = kshana receiver-trust cn0_drop_db (estatística padrão do monitor { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-8b5d25c24aee = kshana receiver-trust jam_ind_threshold (estatística padrão do monitor { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-9c794cbe6919 = Tarefa (a): detecção em registros de receptor, resultados do conjunto reservado

# text
seg-bf455fb5bda5 = Divisão: conjunto reservado

# attr:aria-label
seg-d69e976e0fa9 = Tarefa (a): detecção em registros de receptor, resultados de teste

# text
seg-c163c8084e23 = Divisão: teste

# text
seg-4c475a58619d = Tarefa (b): detecção em IQ

# attr:aria-label
seg-26740783c99e = Tarefa (b): detecção em IQ, resultados de teste

# text
seg-6f1b3b3729bf = monitores de IQ do kshana: cn0_drop (CUSUM) <s1>kshana-bench/2.0.0</s1>

# text
seg-7e2dd8e3fb49 = herdado: docs/design/DETECTION-ROC.md seção { "3" }: a campanha R1 de tests/iq_campaign_roc.rs, executada em 2026-10-13; não reexecutada para o bench v1. O limiar R1 (AUC >= { "0.95" }) foi NOT MET.

# text
seg-e7c2cfbb1e8c = Tarefa (c): predição de holdover de temporização

# attr:aria-label
seg-9198e0e61f53 = Tarefa (c): predição de holdover de temporização, resultados de dev

# text
seg-46487e0c8856 = RMSE de { "3600" } s (ns)

# text
seg-6c032477c78f = RMSE de { "300" } s (ns)

# text
seg-780fda205195 = RMSE de { "7200" } s (ns)

# text
seg-2246c31f1782 = linha de base do kshana-bench: linear <s1>kshana-bench/2.0.0</s1>

# text
seg-af33c581ac95 = linha de base do kshana-bench: quadrática <s1>kshana-bench/2.0.0</s1>

# text
seg-d8bb527fe5be = linha de base do kshana-bench: manutenção <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-18fd676cd356 = Tarefa (c): predição de holdover de temporização, resultados de teste

# text
seg-ca13357b9f63 = Tarefa (d): lacuna de otimismo fora da distribuição

# attr:aria-label
seg-dbbcfa3baaf4 = Tarefa (d): lacuna de otimismo fora da distribuição, resultados de dev

# text
seg-b022faebf582 = AUC dentro

# text
seg-824b2aff7e8d = AUC fora

# text
seg-835f66c4ee63 = Lacuna de otimismo

# text
seg-fea8fb19c38c = Sinalização

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
seg-ee090c2f6612 = Tarefa (d): lacuna de otimismo fora da distribuição, resultados de teste

# text
seg-88c3cc6c3800 = Toda pontuação é modelada, a menos que uma linha diga que uma referência independente externa concordou. Licença da especificação e dos manifestos: CC-BY-4.0 / CC0 propostas, decisão do titular pendente. O conjunto reservado de dados reais não é secreto: veja a especificação, seção { "4" }.

# attr:aria-label
seg-68e7ed4fc6ee = O que uma linha pode dizer

# text
seg-7912ad415e48 = O que uma linha significa

# text
seg-7b6aa7dbc2e4 = Uma pontuação descreve um registro, não um produto.

# text
seg-69cc3c1470b3 = Uma linha diz: este arquivo obteve X na divisão S sob a versão V da especificação. Ela não diz que um produto é certificado, aderente à norma, aprovado ou endossado, e nenhuma organização é citada como avalista.

# text
seg-dd289a4fc50a = Os dados são registrados ou sintéticos e estão nomeados na especificação. Dados de terceiros nunca são copiados para o repositório: manifestos e scripts de obtenção fixam cada arquivo por SHA-256, e cada licença é registrada antes de os dados serem usados.

# text
seg-d48b2ec4cbe8 = A verdade de referência de um registro gravado são os intervalos programados do plano de teste, e não os horários de transmissão gravados, de modo que uma probabilidade de detecção é um limite inferior. A especificação diz isso junto a cada tarefa.

# text
seg-6883a66f3bdd = Um conjunto reservado lacrado só é pontuado em uma rodada do quadro de classificação, e sua semente é revelada depois dela. Os limiares de qualquer linha de base que alegue um número são registrados antes da execução pontuada e nunca são afrouxados depois; um resultado aquém é registrado como NOT MET.

# text
seg-97d14f361df5 = Veredictos como registrados no arquivo de resultados: os limiares do pontuador, C1 a C3 e D2 foram atingidos; A2 é NOT MET (AUC de agc_k_sigma { "0.766" } contra pelo menos { "0.80" } na divisão de teste), D1 é NOT MET (maior lacuna { "0.0301" }) e R1 da tarefa (b) é NOT MET (herdado, não reexecutado). Nenhum limiar foi afrouxado.

# text
seg-23023a10ef10 = Apenas consultivo: os resultados do Kshana são modelados ou medidos em relação a referências declaradas, não uma aprovação nem uma declaração de aderência à norma.

# text
# c1: kshana bench score
# c2: kshana bench leaderboard
seg-b30115d8c2eb = Execute você mesmo: <c1/> transforma uma submissão e a verdade de referência de uma divisão em um arquivo de resultados; <c2/> renderiza arquivos de resultados nesta página.
