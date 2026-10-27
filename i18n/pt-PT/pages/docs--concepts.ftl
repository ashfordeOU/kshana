# docs--concepts: translations (pt-PT)

# text
seg-501402fc366f = Holdover do relógio

# text
seg-9c0eb89a2fbe = Pacote

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Fonte: <c1/>

# text
seg-8ab3fd09812d = Conceitos — uma introdução em linguagem simples

# text
seg-0f86d0a815d2 = Esta página explica <em>o que o Kshana faz e porquê</em>, partindo do zero e construindo até à física. Não se pressupõe nenhum conhecimento prévio na primeira parte; as secções posteriores acrescentam as relações precisas para especialistas. Para definições palavra a palavra, consulte o <a1>Glossário</a1>.

# text
seg-34f76bad58cb = { "1" }. O problema, num parágrafo

# text
seg-45c0199e2224 = Quase tudo o que precisa de saber <em>onde está</em> ou <em>que horas são</em> — telemóveis, aeronaves, navios, satélites, redes elétricas, sistemas financeiros — depende de sinais de satélites de navegação (o GPS (Sistema de Posicionamento Global) e os seus congéneres, coletivamente <b>GNSS</b> (sistema global de navegação por satélite)). Esses sinais são fracos e perdem-se facilmente: sofrem jamming, são bloqueados ou simplesmente ficam fora de vista no espaço. Quando isso acontece, um sistema tem de <b>continuar por si próprio</b> usando sensores de bordo — um relógio para manter o tempo e sensores inerciais para acompanhar o movimento. A pergunta a que o Kshana responde é simples de formular e difícil de medir: <b>durante quanto tempo e com que qualidade consegue continuar?</b>

# text
seg-ea1895772e76 = { "2" }. Porquê «quântico»?

# text
seg-dd6871645f37 = Os sensores de bordo derivam. Um relógio vai perdendo tempo; um sensor inercial vai perdendo a noção da posição. Os relógios e sensores inerciais <b>quânticos</b> derivam <em>muito mais devagar</em> do que as peças clássicas hoje em uso — pelo que um veículo poderia atravessar uma interrupção de GNSS muito mais longa mantendo-se dentro dos seus limites de exatidão. Essa vantagem é toda a promessa do PNT (posicionamento, navegação e temporização) quântico. Mas «muito mais devagar» tem de ser convertido em <b>números</b>: quantos minutos extra de holdover? quantos metros a menos de deriva? Esses números decidem se uma carga útil quântica compensa o seu custo, massa e potência.

# text
seg-a5d9dc0fb159 = { "3" }. O que o Kshana realmente faz

# text
seg-cb3a35ba696f = O Kshana é um <b>simulador</b>, não é hardware nem um projeto de hardware. Ele:

# text
seg-cb7fdaf6738b = Toma um <b>cenário</b> — uma cronologia com um período de interrupção de GNSS e as figuras de desempenho publicadas de um sensor.

# text
seg-701c8c6d0e55 = Conduz um <b>modelo de erros de sensor</b> ao longo dessa cronologia: enquanto o GNSS está disponível o modelo é disciplinado pela referência; durante a interrupção corre livremente, acumulando erro exatamente como a física diz que deve.

# text
seg-bc68e3d54e4c = <b>Pontua</b> o resultado face a figuras de mérito operacionais (quão grande o erro se torna, durante quanto tempo se mantém dentro da especificação, quão fiável é a estimativa).

# text
seg-32d31a9beb71 = Para os pacotes de sensores, faz isto <b>duas vezes</b> — uma para um sensor quântico, outra para a sua contraparte clássica — no <em>mesmo</em> cenário, de modo que a comparação seja em condições idênticas.

# text
seg-07d8c6eb84e9 = É fundamental que o motor não sabe nada sobre «quântico» vs «clássico». Ambos são apenas modelos de erro com parâmetros diferentes (publicados e citados). A diferença que se vê na saída é a diferença na física publicada — nada é ajustado à mão para favorecer um dos lados.

# text
seg-e20a7d3f32dc = { "4" }. Os quatro blocos de construção («pacotes»)

# text
seg-638b8d451550 = Sensor

# text
seg-f891ee876b96 = A que responde

# text
seg-d1b122c389d4 = relógio atómico

# text
seg-768230c2eb02 = Durante quanto tempo se mantém o <em>tempo</em> exato sem GNSS?

# text
seg-029de6b99be0 = Navegação estimada inercial

# text
seg-f66f2d7b1d6d = acelerómetro (+ giroscópio)

# text
seg-e067a035f656 = Com que rapidez deriva a <em>posição</em> sem GNSS?

# text
seg-9ef8f99ca6e4 = Transferência de tempo

# text
seg-1267f82791f9 = ligação ótica / RF (radiofrequência)

# text
seg-6f240700790d = Com que precisão podem duas naves partilhar o tempo?

# text
seg-90be2a6a29b1 = Fusão híbrida

# text
seg-780cf1f1127e = todos os anteriores

# text
seg-6080a05ace19 = A solução PNT <em>combinada</em> mantém-se?

# text
seg-3f74a708a746 = O pacote híbrido é o ponto fulcral: uma solução de navegação precisa de <em>ambos</em> bom tempo <em>e</em> boa posição. Mostra que uma ligação ótica de temporização pode manter bloqueado até um relógio modesto — o que significa que o sensor <b>inercial</b> passa a ser o elo mais fraco, e é exatamente aí que um acelerómetro quântico compensa.

# text
seg-5f55bb0fd7c5 = Para além dos quatro pacotes

# text
# c1: kshana kinds
seg-60191a2cd150 = O mesmo motor executa muitos mais <em>tipos de cenário</em>; <c1/> lista-os a todos. Estendem-se para além dos sensores, até aos sinais e à geometria de que os sensores dependem:

# text
seg-995ed414d83d = <b>Onde estão os satélites</b> — propagação de órbitas, projeto de constelações em torno da Terra, da Lua ou de outro corpo e as posições dos corpos do sistema solar.

# text
seg-bc8abce2a748 = <b>O que o recetor consegue ver</b> — uma linha de horizonte dependente do azimute (uma rua, um cais, um fiorde) sobre a máscara de elevação e a geometria do céu que ela deixa: os satélites à vista, a sua diluição de precisão e a elipse de erro.

# text
seg-b7a2c252c41c = <b>O que o recetor ouve</b> — o espetro da banda L sob um jammer, jamming e spoofing, e a perda de bloqueio do ciclo de seguimento.

# text
seg-f354743045c4 = <b>Se a resposta é fiável</b> — monitorização de integridade (RAIM, monitorização autónoma de integridade pelo recetor, e a sua forma avançada ARAIM) com níveis de proteção.

# text
seg-69aa01a29a49 = <b>Alternativas ao GNSS</b> — correspondência com mapas de gravidade e de terreno, e posicionamento, navegação e temporização a partir de satélites em órbita terrestre baixa (LEO), desde o projeto do sinal, passando pelo orçamento de ligação e pela mensagem de navegação, até à solução de posição.

# text
seg-297c98214b5b = <b>Temporização para redes</b> — holdover de telecomunicações verificado face às máscaras internacionais e temporização de intervalos para escalonamentos indexados no tempo.

# text
seg-7eba216a9bf2 = <b>Para além da Terra</b> — tempo e referenciais lunares, volumes de serviço lunares e navegação por retransmissão em Marte.

# text
seg-b796f49570ed = <b>Muitas execuções de uma vez</b> — as campanhas encadeiam tipos de cenário numa só cronologia, varrem um parâmetro ou executam um ensemble de Monte Carlo.

# text
seg-ef7f4e025018 = { "5" }. Honestidade por construção

# text
seg-65fb8703baf9 = Um simulador só é útil se se puder confiar nele. O Kshana está construído de modo a que se possa:

# text
# c1: provenance
seg-de8fd160db6d = <b>Cada parâmetro é citado.</b> Cada figura de sensor transporta uma cadeia <c1/> que nomeia a folha de especificações ou o artigo de onde veio. Sem constantes anónimas.

# text
seg-09d5cd11b127 = <b>Cada modelo é verificado face a uma relação de manual,</b> e não apenas face a si próprio — por exemplo, o desvio de Allan do relógio simulado tem de coincidir com a figura de estabilidade publicada, e a deriva inercial tem de coincidir com a lei padrão de crescimento de erro. Uma capacidade só é chamada <em>validada</em> quando uma referência independente externa (um conjunto de dados real, uma implementação independente ou vetores de referência publicados) concorda; o resto é <em>modelado</em>, e a <a1>matriz de verificação</a1> indica o que é o quê.

# text
seg-ccb5b2fe93c4 = A maturidade é etiquetada.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> classifica cada efeito como <c1/>, <c2/> ou <c3/> e afirma com clareza que os valores dos relógios óticos são números de <em>laboratório / objetivo espacial</em> — nenhum relógio ótico de estrôncio voou.

# text
seg-de463596fcdb = <b>Os resultados são reprodutíveis ao bit:</b> o mesmo cenário, a mesma semente e a mesma versão produzem sempre a resposta idêntica na mesma plataforma; entre sistemas operativos, os valores coincidem até { "1e-6" } em termos relativos (ver <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. A física, para especialistas

# text
seg-8fc6db9faf83 = As relações que o Kshana implementa e testa (todos os pormenores e tolerâncias em <a1>VALIDATION.md</a1>):

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Holdover do relógio.</b> Modelo de dois estados, fase e frequência, com modulação de frequência branca (white FM, densidade espetral de potência <c1/>), FM de passeio aleatório (<c2/>), FM de cintilação (uma soma de processos de Ornstein–Uhlenbeck espaçados logaritmicamente, calibrados para um patamar de Allan plano) e envelhecimento determinista. Validado por desvio de Allan sobreposto face ao <c3/> publicado (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Navegação inercial por estima.</b> O desvio residual do acelerómetro → <c1/>; o passeio aleatório da velocidade → <c2/>; o desvio opcional do giroscópio e o passeio aleatório angular produzem um erro de inclinação que acopla a gravidade (<c3/>) à aceleração horizontal (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Transferência de tempo.</b> Jitter de temporização branco → precisão de sincronização → medição de distância num só sentido (<c1/>, { "1" } ps ≈ { "0.3" } mm); a média da amostra varia como <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Fusão e integridade.</b> Um filtro de Kalman de dois estados cujo ruído de processo corresponde ao modelo de referência; em navegação inercial livre, a variância do erro de fase cresce exatamente até <c1/> — a relação analítica do holdover — e o seu limite de 1-σ alimenta a figura de mérito de Integridade.

# text
seg-80daa7cb8641 = <b>Geometria.</b> Propagação kepleriana de dois corpos (opcionalmente com J2 secular) ou SGP4 (Simplified General Perturbations { "4" }) a partir de conjuntos reais de elementos de duas linhas, constelações Walker e visibilidade em linha de vista (ocultação pela Terra + máscara de elevação) derivam a disponibilidade GNSS da geometria orbital, e não de janelas escritas à mão.

# text
seg-4ce4c6b79b93 = { "7" }. Para onde ir a seguir

# text
seg-7c8344a26230 = Trabalhar com ele: os <a1>tutoriais</a1> — três exemplos resolvidos + exercícios graduados.

# text
seg-277f1b435cf6 = Executá-lo: ver o arranque rápido no <a1>README</a1>.

# text
seg-c349981bd4f1 = Compreender a estrutura: <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Verificar o que está e o que não está validado: <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Consultar um termo: <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Anterior</s1>Visão geral

# text
seg-2f14e84bfc99 = <s1>Seguinte</s1>Glossário
