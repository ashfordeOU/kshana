# docs--kinds-campaigns: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-a07990e776cb = Campanha: tipos de cenário existentes compostos numa só execução, com cada número lido de uma execução real do tipo de cenário nomeado. Quatro secções, em qualquer combinação. PHASES: uma missão encadeada numa cronologia partilhada -- cada fase executa um ou mais cenários (por exemplo jamming, depois spoofing, depois um relógio em holdover com um sistema de navegação inercial a deslizar ao lado, depois um alarme de integridade, depois a recuperação), as suas saídas são lidas em canais nomeados (erro de tempo do relógio contra a sua guarda, relação portadora/densidade de ruído contra o limiar mínimo de seguimento, nível de proteção contra o limite de alerta, erro de posição, satélites em seguimento, indicadores de alarme) por uma predefinição por tipo de cenário ou por caminhos de resultado explícitos, e reamostradas numa grelha comum por retentor de ordem zero, com fronteiras de fase e eventos; o estado é repassado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número da fase anterior gravado no cenário desta fase) e end_at (uma fase termina num instante que uma execução calculou, como o instante de deteção de um monitor de spoofing). SWEEP: uma grelha sobre uma a três chaves de cenário com pontos de qualquer tipo de cenário (um segmento de número inteiro indexa um array de tabelas, como em system.2.sisre_m), com métricas lidas por caminho de resultado e, com execuções acima de uma, um conjunto de Monte Carlo com semente em cada nó. MONTE_CARLO: a realização k executa em base_seed + k; cada métrica indica média, desvio padrão, percentis 5.º/50.º/95.º pelo método do posto mais próximo e um intervalo de confiança de { "95" }% por bootstrap com semente fixa sobre a média. COMPOSE: vários cenários sob valores partilhados (a potência e a posição de um jammer gravadas num recetor marítimo e num rodoviário), com um resumo combinado de melhor/pior caso. O resultado traz um hash de campanha, um resumo sobre o resultado de cada membro e uma entrada de unidades para cada número emitido; as exportações de interoperabilidade gravam cada cenário membro que tem geometria como seu próprio conjunto de ficheiros. As identidades de composição são testadas: uma campanha de uma fase reproduz a execução isolada bit a bit, um conjunto de semente fixa é estável byte a byte e, num relógio com ruído de frequência branco, a média do conjunto cai dentro do intervalo indicado, com a dispersão a coincidir com sqrt(q_wf * tau). MODELLED: o carry aditivo e o retentor de ordem zero são escolhas de modelação, e cada fase traz o rótulo do tipo de cenário que a executou.

# attr:alt
seg-b2c7cd1f9712 = O gráfico que o motor escreve para scenarios/campaign-sweep-jammer-power.toml, tipo de cenário campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Fonte: <c1/>

# text
seg-7f8e8af56bc0 = Campanhas (família de tipos de cenário)

# text
seg-c8012ee549ea = { "1" } tipo de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Páginas de tema: <a1>CAMPAIGNS</a1>. Executar uma: <c1/>. Todas as famílias: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Folha de contactos dos gráficos que o motor escreve para os tipos da família Campanhas

# text
seg-4e31c8daf798 = Registo

# text
seg-b2016159c9d0 = Campanha: tipos de cenário existentes compostos numa única execução, com cada número lido de uma execução real do tipo indicado.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Anterior</s1>Código de conduta

# text
seg-cdf23ced49bd = <s1>Seguinte</s1>Relógios, temporização e holdover
