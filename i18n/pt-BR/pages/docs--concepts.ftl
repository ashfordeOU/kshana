# docs--concepts: translations (pt-BR)

# text
seg-501402fc366f = Holdover do relógio

# text
seg-9c0eb89a2fbe = Pacote

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Fonte: <c1/>

# text
seg-8ab3fd09812d = Conceitos: uma introdução em linguagem simples

# text
seg-0f86d0a815d2 = Esta página explica <em>o que o Kshana faz e por quê</em>, partindo do zero e chegando à física. Nenhum conhecimento prévio é presumido na primeira parte; as seções posteriores acrescentam as relações precisas para especialistas. Para definições palavra por palavra, veja o <a1>Glossário</a1>.

# text
seg-34f76bad58cb = { "1" }. O problema, em um parágrafo

# text
seg-45c0199e2224 = Quase tudo o que precisa saber <em>onde está</em> ou <em>que horas são</em>, como telefones, aeronaves, navios, satélites, redes elétricas e sistemas financeiros, depende de sinais de satélites de navegação (o GPS (Sistema de Posicionamento Global) e seus irmãos, coletivamente o <b>GNSS</b> (sistema global de navegação por satélite)). Esses sinais são fracos e se perdem com facilidade: sofrem jamming, são bloqueados ou simplesmente ficam fora de vista no espaço. Quando isso acontece, um sistema precisa <b>seguir por conta própria</b> usando sensores de bordo: um relógio para manter o tempo e sensores inerciais para acompanhar o movimento. A pergunta que o Kshana responde é simples de enunciar e difícil de medir: <b>por quanto tempo e com que qualidade ele consegue seguir?</b>

# text
seg-ea1895772e76 = { "2" }. Por que "quântico"?

# text
seg-dd6871645f37 = Os sensores de bordo derivam. Um relógio perde tempo lentamente; um sensor inercial perde lentamente o rastro da posição. Relógios e sensores inerciais <b>quânticos</b> derivam <em>muito mais lentamente</em> do que as peças clássicas em uso hoje, de modo que um veículo poderia atravessar uma interrupção de GNSS muito mais longa mantendo-se dentro dos seus limites de exatidão. Essa vantagem é toda a promessa do PNT (posicionamento, navegação e temporização) quântico. Mas "muito mais lentamente" precisa ser convertido em <b>números</b>: quantos minutos extras de holdover? quantos metros a menos de deriva? Esses números decidem se uma carga útil quântica vale o seu custo, massa e potência.

# text
seg-a5d9dc0fb159 = { "3" }. O que o Kshana realmente faz

# text
seg-cb3a35ba696f = O Kshana é um <b>simulador</b>, não é hardware nem um projeto de hardware. Ele:

# text
seg-cb7fdaf6738b = Recebe um <b>cenário</b>: uma linha do tempo com um trecho de interrupção de GNSS e as figuras de desempenho publicadas de um sensor.

# text
seg-701c8c6d0e55 = Conduz um <b>modelo de erro do sensor</b> por essa linha do tempo: enquanto o GNSS está disponível, o modelo é disciplinado à verdade; durante a interrupção, ele corre livre, acumulando erro exatamente como a física diz que deveria.

# text
seg-bc68e3d54e4c = <b>Pontua</b> o resultado contra figuras de mérito operacionais (quão grande o erro se torna, por quanto tempo permanece dentro da especificação, quão confiável é a estimativa).

# text
seg-32d31a9beb71 = Para os pacotes de sensores, faz isso <b>duas vezes</b>, uma para um sensor quântico e outra para o seu equivalente clássico, sobre o <em>mesmo</em> cenário, de modo que a comparação seja de igual para igual.

# text
seg-07d8c6eb84e9 = O ponto crucial: o motor não sabe nada sobre "quântico" versus "clássico". Ambos são apenas modelos de erro com parâmetros diferentes (publicados e citados). A diferença que se vê na saída é a diferença na física publicada; nada é ajustado à mão para favorecer um lado.

# text
seg-e20a7d3f32dc = { "4" }. Os quatro blocos de construção ("pacotes")

# text
seg-638b8d451550 = Sensor

# text
seg-f891ee876b96 = O que responde

# text
seg-d1b122c389d4 = relógio atômico

# text
seg-768230c2eb02 = Por quanto tempo o <em>tempo</em> permanece exato sem GNSS?

# text
seg-029de6b99be0 = Navegação inercial por estima

# text
seg-f66f2d7b1d6d = acelerômetro (+ giroscópio)

# text
seg-e067a035f656 = Com que rapidez a <em>posição</em> deriva sem GNSS?

# text
seg-9ef8f99ca6e4 = Transferência de tempo

# text
seg-1267f82791f9 = enlace óptico / de RF (radiofrequência)

# text
seg-6f240700790d = Com que precisão duas naves podem compartilhar o tempo?

# text
seg-90be2a6a29b1 = Fusão híbrida

# text
seg-780cf1f1127e = tudo o que foi citado acima

# text
seg-6080a05ace19 = A solução PNT <em>combinada</em> se sustenta?

# text
seg-3f74a708a746 = O pacote híbrido é o ponto principal: uma solução de navegação precisa <em>tanto</em> de bom tempo <em>quanto</em> de boa posição. Ele mostra que um enlace óptico de temporização pode manter travado até um relógio modesto, o que significa que o sensor <b>inercial</b> se torna o elo mais fraco, e é exatamente aí que um acelerômetro quântico compensa.

# text
seg-5f55bb0fd7c5 = Além dos quatro pacotes

# text
# c1: kshana kinds
seg-60191a2cd150 = O mesmo motor executa muitos outros <em>tipos de cenário</em>; <c1/> os lista todos. Eles vão além dos sensores, até os sinais e a geometria de que os sensores dependem:

# text
seg-995ed414d83d = <b>Onde estão os satélites</b>: propagação de órbita, projeto de constelações ao redor da Terra, da Lua ou de outro corpo, e as posições dos corpos do sistema solar.

# text
seg-bc8abce2a748 = <b>O que o receptor pode ver</b>: um horizonte de obstruções dependente do azimute (uma rua, um cais, um fiorde) sobre a máscara de elevação, e a geometria de céu que ele deixa: os satélites à vista, a sua diluição de precisão e a elipse de erro.

# text
seg-b7a2c252c41c = <b>O que o receptor ouve</b>: o espectro da banda L sob um jammer, jamming e spoofing, e a perda de travamento da malha de rastreamento.

# text
seg-f354743045c4 = <b>Se a resposta é confiável</b>: monitoramento de integridade (RAIM, monitoramento autônomo de integridade pelo receptor, e a sua forma avançada, ARAIM) com níveis de proteção.

# text
seg-69aa01a29a49 = <b>Alternativas ao GNSS</b>: correspondência de mapas de gravidade e de terreno, e posicionamento, navegação e temporização a partir de satélites em órbita baixa da Terra (LEO), do projeto do sinal ao orçamento de enlace, à mensagem de navegação e ao fixo de posição.

# text
seg-297c98214b5b = <b>Temporização para redes</b>: holdover de telecomunicações verificado contra as máscaras internacionais, e temporização de slots para programações indexadas no tempo.

# text
seg-7eba216a9bf2 = <b>Além da Terra</b>: tempo e referenciais lunares, volumes de serviço lunares e navegação de retransmissão em Marte.

# text
seg-b796f49570ed = <b>Muitas execuções de uma vez</b>: as campanhas encadeiam tipos de cenário em uma linha do tempo, varrem um parâmetro ou executam um conjunto Monte Carlo.

# text
seg-ef7f4e025018 = { "5" }. Honestidade por construção

# text
seg-65fb8703baf9 = Um simulador só é útil se se pode confiar nele. O Kshana é construído para que você possa:

# text
# c1: provenance
seg-de8fd160db6d = <b>Todo parâmetro é citado.</b> Cada figura de sensor traz uma cadeia <c1/> que nomeia a folha de dados ou o artigo de onde veio. Nenhuma constante anônima.

# text
seg-09d5cd11b127 = <b>Todo modelo é verificado contra uma relação de manual,</b> e não apenas contra si mesmo; por exemplo, o desvio de Allan do relógio simulado deve coincidir com a figura de estabilidade publicada, e a deriva inercial deve coincidir com a lei padrão de crescimento de erro. Uma capacidade só é chamada de <em>validada</em> onde uma referência independente externa (um conjunto de dados real, uma implementação independente ou vetores de referência publicados) concorda; o restante é <em>modelado</em>, e a <a1>matriz de verificação</a1> diz qual é qual.

# text
seg-ccb5b2fe93c4 = A maturidade é rotulada.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> marca cada efeito como <c1/>, <c2/> ou <c3/>, e afirma com clareza que as figuras dos relógios ópticos são números de <em>laboratório / meta espacial</em>: nenhum relógio óptico de estrôncio voou.

# text
seg-de463596fcdb = <b>Os resultados são reprodutíveis até o bit:</b> o mesmo cenário, semente e versão sempre produzem a resposta idêntica na mesma plataforma; entre sistemas operacionais, as figuras concordam até { "1e-6" } em termos relativos (veja <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. A física, para especialistas

# text
seg-8fc6db9faf83 = As relações que o Kshana implementa e testa (detalhes completos e tolerâncias em <a1>VALIDATION.md</a1>):

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Holdover de relógio.</b> Modelo de fase/frequência de dois estados com modulação de frequência branca (FM branco, densidade espectral de potência <c1/>), FM de passeio aleatório (<c2/>), FM flicker (uma soma de processos de Ornstein–Uhlenbeck espaçados logaritmicamente e calibrados para um piso de Allan plano) e envelhecimento determinístico. Validado pelo desvio de Allan sobreposto contra o <c3/> publicado (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Navegação inercial por estima.</b> Viés residual do acelerômetro → <c1/>; passeio aleatório de velocidade → <c2/>; viés opcional do giroscópio e passeio aleatório angular produzem um erro de inclinação que acopla a gravidade (<c3/>) à aceleração horizontal (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Transferência de tempo.</b> Jitter de temporização branco → precisão de sincronização → medição de distância unidirecional (<c1/>, { "1" } ps ≈ { "0.3" } mm); a média amostral se reduz como <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Fusão e integridade.</b> Um filtro de Kalman de dois estados cujo ruído de processo coincide com o modelo verdadeiro; em navegação inercial, a sua variância do erro de fase cresce exatamente até <c1/>, a relação analítica de holdover, e o seu limite de 1 σ alimenta a figura de mérito de Integridade.

# text
seg-80daa7cb8641 = <b>Geometria.</b> A propagação kepleriana de dois corpos (opcionalmente com J2 secular) ou o SGP4 (Simplified General Perturbations { "4" }) a partir de conjuntos reais de elementos de duas linhas, as constelações Walker e a visibilidade em linha de visada (oclusão pela Terra + máscara de elevação) derivam a disponibilidade GNSS da geometria orbital, e não de janelas escritas à mão.

# text
seg-4ce4c6b79b93 = { "7" }. Para onde ir em seguida

# text
seg-7c8344a26230 = Trabalhe nisto: os <a1>tutoriais</a1>, três exemplos resolvidos + exercícios graduados.

# text
seg-277f1b435cf6 = Execute: veja o início rápido do <a1>README</a1>.

# text
seg-c349981bd4f1 = Entenda a estrutura: <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Verifique o que está e o que não está validado: <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Consulte um termo: <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Anterior</s1>Visão geral

# text
seg-2f14e84bfc99 = <s1>Próximo</s1>Glossário
