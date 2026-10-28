# docs--kind-campaign: translations (pt-PT)

# text
seg-8784979d6569 = dBW

# text
# c1: docs/kinds/by-kind/campaign.md
seg-68a2bcb6eedd = Fonte: <c1/>

# text
# c1: campaign
seg-24ce6aee5e53 = <c1/> (tipo de cenário)

# text
seg-931a3d27c0f0 = Tipo de cenário do motor v{ $version }, família <a1>Campanhas</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a07990e776cb = Campanha: tipos de cenário existentes compostos numa só execução, com cada número lido de uma execução real do tipo de cenário nomeado. Quatro secções, em qualquer combinação. PHASES: uma missão encadeada numa cronologia partilhada -- cada fase executa um ou mais cenários (por exemplo jamming, depois spoofing, depois um relógio em holdover com um sistema de navegação inercial a deslizar ao lado, depois um alarme de integridade, depois a recuperação), as suas saídas são lidas em canais nomeados (erro de tempo do relógio contra a sua guarda, relação portadora/densidade de ruído contra o limiar mínimo de seguimento, nível de proteção contra o limite de alerta, erro de posição, satélites em seguimento, indicadores de alarme) por uma predefinição por tipo de cenário ou por caminhos de resultado explícitos, e reamostradas numa grelha comum por retentor de ordem zero, com fronteiras de fase e eventos; o estado é repassado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número da fase anterior gravado no cenário desta fase) e end_at (uma fase termina num instante que uma execução calculou, como o instante de deteção de um monitor de spoofing). SWEEP: uma grelha sobre uma a três chaves de cenário com pontos de qualquer tipo de cenário (um segmento de número inteiro indexa um array de tabelas, como em system.2.sisre_m), com métricas lidas por caminho de resultado e, com execuções acima de uma, um conjunto de Monte Carlo com semente em cada nó. MONTE_CARLO: a realização k executa em base_seed + k; cada métrica indica média, desvio padrão, percentis 5.º/50.º/95.º pelo método do posto mais próximo e um intervalo de confiança de { "95" }% por bootstrap com semente fixa sobre a média. COMPOSE: vários cenários sob valores partilhados (a potência e a posição de um jammer gravadas num recetor marítimo e num rodoviário), com um resumo combinado de melhor/pior caso. O resultado traz um hash de campanha, um resumo sobre o resultado de cada membro e uma entrada de unidades para cada número emitido; as exportações de interoperabilidade gravam cada cenário membro que tem geometria como seu próprio conjunto de ficheiros. As identidades de composição são testadas: uma campanha de uma fase reproduz a execução isolada bit a bit, um conjunto de semente fixa é estável byte a byte e, num relógio com ruído de frequência branco, a média do conjunto cai dentro do intervalo indicado, com a dispersão a coincidir com sqrt(q_wf * tau). MODELLED: o carry aditivo e o retentor de ordem zero são escolhas de modelação, e cada fase traz o rótulo do tipo de cenário que a executou.

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
# c2: jamming
seg-05e842f80dbb = Uma execução de <c1/> resume-se assim: campaign 46aa07cb58fb | Varrimento de potência do jammer: disponibilidade e J/S contra a potência de transmissão | sweep de <c2/>: { "13" } nós sobre [jammer_power] | { "13" } execuções de membros (MODELLED)

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-bf339fa14645 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
seg-abd3eac6da41 = O exemplo <c1/> define, entre outros:

# text
seg-c4f955d5f506 = disponibilidade

# text
# c1: scenarios/
seg-7bcf77278958 = { "22" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-38faa927b2bd = lin

# text
seg-1a33a746eeee = Rótulo do resultado (o do motor): composição MODELLED de tipos de cenário existentes. Cada número é lido de uma execução real do tipo de cenário nomeado; o encadeamento (carry aditivo de um canal através de uma fronteira de fase, retentor de ordem zero sobre a grelha da cronologia, uma fase encerrada num instante calculado) é uma escolha de modelação, e cada fase traz o rótu

# attr:alt
seg-b2c7cd1f9712 = O gráfico que o motor escreve para scenarios/campaign-sweep-jammer-power.toml, tipo de cenário campaign

# text
seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect e o executor de campanha: uma tabela opcional [monitors] executa os monitores de IQ em cada célula na passagem única do executor. Testes: <a1>iq_campaign.rs</a1>.

# text
seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada célula de uma campanha com monitores guarda, por tipo de alarme e canal, o máximo da própria estatística de teste do monitor sobre cada janela de evento declarada (positivo) e sobre t

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) e <c1/> em <c2/>, Python <c3/> e a ferramenta labfit do MCP (apenas pastas de campanha dentro do seu diretório de trabalho): lê uma pasta de saída de <c4/> pelo seu Testes: <a1>iq_labfit_followup.rs</a1>.

# text
# c1: campaign
seg-f16a176dc1f8 = <b>MODELLED</b> As fases do tipo de cenário <c1/>: cada fase executa um ou mais cenários de tipos de cenário existentes por meio de run_toml, lê as suas saídas em canais nomeados (erro de tempo do relógio e guarda, relação portadora/densidade de ruído efetiva média e limiar mínimo de seguimento, v Testes: <a1>campaign_composition_reference.rs</a1>.

# text
seg-be831b52a339 = e mais { "4" } na matriz.

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Orçamento de enlace de J/S geométrico, C/N₀ antijamming, perda de sincronismo por satélite. Referência independente (InternalConsistency): Equação do orçamento de enlace de C/N₀ antijamming conferida contra uma nova derivação independente em numpy (partilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } ronda { "2" }, bloqueado (permanece MODELLED): a queda de C/N0 medida no JammerTest { "2024" } contra uma previsão do orçamento de enlace (pré-registada 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e o apontamento da antena F8.1 em

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por conceção

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> O varrimento do tipo de cenário <c1/> (uma a três chaves com pontos de qualquer tipo de cenário, sobre os valores de eixo do varrimento genérico, opcionalmente um conjunto em cada nó) e a secção monte_carlo. Referência independente (InternalConsistency): A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções isoladas para a semeadura. Ela verifica a aritmética do conjunto sobre o próprio modelo de relógio do motor, não um conjunto de dados externo

# text
# c1: label
seg-c15b5ac32282 = Composição MODELLED de tipos de cenário existentes. Cada número é lido de uma execução real do tipo de cenário nomeado; o encadeamento (carry aditivo de um canal através de uma fronteira de fase, retentor de ordem zero sobre a grelha da cronologia, uma fase encerrada num instante calculado) é uma escolha de modelação, e cada fase traz o rótulo do tipo de cenário que a produziu. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-9e33dcc39c27 = MODELLED: o carry aditivo e o retentor de ordem zero são escolhas de modelação, e cada fase traz o rótulo do tipo de cenário que a executou. (catálogo de tipos de cenário (<c1/>))

# text
# c1: jamming
seg-adcc6ea59840 = MODELLED: como o é o tipo de cenário <c1/>. (comentário do ficheiro de cenário, linha { "14" })

# text
seg-143f3f1cc521 = A resiliência a jamming em ambientes sem GNSS é MODELLED, não validada: verificada contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d1c11e493795 = As varreduras de parâmetros e os conjuntos de Monte Carlo com semente sobre qualquer tipo de cenário são MODELLED, não validados: verificados contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-edbda7aca5b9 = Página da família: <a1>Campanhas</a1>

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c4ed27a559df = Página do tópico: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-774e035da605 = <s1>Anterior</s1>body-pnt

# text
seg-fadd92303a4d = <s1>Seguinte</s1>cislunar-arc-recovery

# text
seg-a349aa76b0ed = PARTNER
