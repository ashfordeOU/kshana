# docs--kinds-campaigns: translations (pt-BR)

# text
seg-b03d56f501c3 = Tipo

# text
seg-a07990e776cb = Campanha: tipos de cenário existentes compostos em uma só execução, com cada número lido de uma execução real do tipo de cenário nomeado. Quatro seções, em qualquer combinação. PHASES: uma missão encadeada em uma linha do tempo compartilhada -- cada fase executa um ou mais cenários (por exemplo jamming, depois spoofing, depois um relógio em holdover com um sistema de navegação inercial deslizando ao lado, depois um alarme de integridade, depois a recuperação), as suas saídas são lidas em canais nomeados (erro de tempo do relógio contra a sua guarda, relação portadora/densidade de ruído contra o piso de rastreamento, nível de proteção contra o limite de alerta, erro de posição, satélites rastreados, sinalizadores de alarme) por uma predefinição por tipo de cenário ou por caminhos de resultado explícitos, e reamostradas em uma grade comum por retentor de ordem zero, com fronteiras de fase e eventos; o estado é repassado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número da fase anterior gravado no cenário desta fase) e end_at (uma fase termina em um instante que uma execução calculou, como o instante de detecção de um monitor de spoofing). SWEEP: uma grade sobre uma a três chaves de cenário com pontos de qualquer tipo de cenário (um segmento de número inteiro indexa um array de tabelas, como em system.2.sisre_m), com métricas lidas por caminho de resultado e, com execuções acima de uma, um conjunto de Monte Carlo com semente em cada nó. MONTE_CARLO: a realização k executa em base_seed + k; cada métrica informa média, desvio padrão, percentis 5º/50º/95º pelo posto mais próximo e um intervalo de confiança de { "95" }% por bootstrap com semente fixa sobre a média. COMPOSE: vários cenários sob valores compartilhados (a potência e a posição de um jammer gravadas em um receptor marítimo e em um rodoviário), com um resumo combinado de melhor/pior caso. O resultado traz um hash de campanha, um resumo sobre o resultado de cada membro e uma entrada de unidades para cada número emitido; as exportações de interoperabilidade gravam cada cenário membro que tem geometria como seu próprio conjunto de arquivos. As identidades de composição são testadas: uma campanha de uma fase reproduz a execução isolada bit a bit, um conjunto de semente fixa é estável byte a byte e, em um relógio com ruído de frequência branco, a média do conjunto cai dentro do intervalo informado, com a dispersão coincidindo com sqrt(q_wf * tau). MODELLED: o carry aditivo e o retentor de ordem zero são escolhas de modelagem, e cada fase traz o rótulo do tipo de cenário que a executou.

# attr:alt
seg-b2c7cd1f9712 = O gráfico que o motor grava para scenarios/campaign-sweep-jammer-power.toml, tipo de cenário campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Fonte: <c1/>

# text
seg-7f8e8af56bc0 = Campanhas (família de tipos de cenário)

# text
seg-c8012ee549ea = { "1" } tipo de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Páginas de tópico: <a1>CAMPAIGNS</a1>. Execute uma: <c1/>. Todas as famílias: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Campanhas

# text
seg-4e31c8daf798 = Registro

# text
seg-b2016159c9d0 = Campanha: tipos de cenário existentes compostos em uma só execução, com cada número lido de uma execução real do tipo citado.

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
seg-e0334a6899b6 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Anterior</s1>Código de conduta

# text
seg-cdf23ced49bd = <s1>Seguinte</s1>Relógios, temporização e holdover
