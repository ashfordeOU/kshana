# docs--maritime-trust: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-6940543aa3c0 = string

# text
seg-abec93a4a488 = string ou nulo

# text
seg-f5e7215e6835 = objeto

# text
seg-b993ef559bd0 = A partir do código

# text
seg-c353e7bec219 = Chave

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> ou <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Fonte: <c1/>

# text
seg-342f34403ac5 = Confiança marítima: a ponte de comando pode confiar nesta posição?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> pode calcular, para uma <b>embarcação em movimento</b>, uma pontuação de confiança de 0 a 100 em tempo real para cada posição, a partir do que qualquer receptor já coloca no barramento (primeiro NMEA { "0183" }), e dizer quais verificações a reduziram. É uma camada de software que fica ao lado de um receptor. Não é um receptor, não substitui um e não torna uma posição mais precisa.

# text
seg-3c66739c9250 = <b>Software de caráter consultivo.</b> O Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e não foi avaliado em relação a nenhuma norma de desempenho. Sua pontuação e seu gate são auxílios ao julgamento do navegador. O operador continua responsável pela navegação segura da embarcação e por qualquer decisão de confiar, ou de deixar de confiar, em uma posição.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Esta página diz o que as verificações examinam, o que cada uma pode e não pode detectar, como executá-lo em tempo real e o que o gate faz. O mapeamento da pontuação e todos os valores padrão estão em <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = O que ele lê

# text
seg-e784fdbe26e6 = Uma embarcação é declarada no arquivo de sessão, com seus limites enunciados antes da execução:

# text
seg-e8e9ee2965cf = Sentença

# text
seg-e127f2f26824 = Lido

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = posição, qualidade da posição ({ "0" } = sem posição), altitude acima do nível médio do mar, separação do geoide, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = status (<c1/> válido, <c2/> não), velocidade e rumo sobre o solo, data, modo

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = velocidade e rumo sobre o solo, quando o RMC não traz

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = proa (THS apenas quando seu modo não é <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = velocidade na água (VBW apenas quando seu status é <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = hora

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = intensidade do sinal por satélite (dB-Hz), elevação e azimute (para a geometria)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = diluição de precisão e satélites usados (para a geometria, onde o GSV não dá céu; e o HDOP declarado que a salvaguarda compara)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = um status OSNMA informado por um receptor, traduzido para esta sentença pelo adaptador que lê o receptor: <c1/> autenticado, <c2/> falhou, <c3/> sem resultado

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Épocas que o próprio receptor diz não serem uma posição por satélite (qualidade GGA { "0" }, ou de { "6" } a { "8" }: estimada, manual, simulador; status RMC <c1/>, ou modo <c2/>, <c3/>, <c4/>, <c5/>) não são usadas nas verificações de posição e não carregam evidência em nenhum sentido: o receptor já o disse.

# text
# c1: calibration_s
seg-a0ae80781c6e = Os primeiros <c1/> segundos formam a linha de base e nunca são pontuados. Cada monitor olha apenas para a época atual e as anteriores, de modo que uma decisão em uma época não muda quando chegam dados posteriores, e um fluxo ao vivo dá a mesma pontuação que o mesmo texto lido como arquivo.

# text
seg-068593ad0a52 = O que cada verificação detecta, e o que ela não consegue detectar

# text
seg-094b90f0c701 = As direções entre posições (o rumo da derrota usado pela verificação da taxa de giro, o rumo implicado por duas posições) são a direção da corda entre elas, que é o <b>azimute médio</b> da geodésica entre as posições, não o azimute direto na primeira posição; os dois diferem em cerca de metade da convergência dos meridianos entre as posições ({ "0.001" } grau para uma linha de base de { "260" } m a { "59.5" } graus de latitude).

# text
seg-ed3cdfcfbff5 = Uma posição falsificada precisa concordar com a física de um navio e com os outros sensores do navio. Cada verificação compara a posição com um deles. Uma verificação é tão independente quanto sua outra fonte: uma proa de uma bússola GNSS, ou uma "velocidade na água" derivada do GNSS, não é independente do receptor sob teste e não acrescenta nada.

# text
seg-9480aabf136e = Verificação

# text
seg-20e4f746c7e1 = Detecta

# text
seg-e7b2ebe5eabc = Não consegue

# text
seg-21ad9895f606 = um salto de posição; uma trajetória cujo movimento a velocidade e o rumo informados não explicam; uma velocidade, aceleração ou taxa de giro implícitas acima dos limites declarados da embarcação

# text
seg-dcbc6d4cd17f = um arrasto cuja velocidade e cujo rumo informados seguem a trajetória falsa e permanece dentro dos limites (o receptor os deriva de sua própria solução, de modo que concordam entre si); um limite de velocidade declarado alto demais

# text
seg-3542f83a7988 = uma trajetória que se afasta de onde o navio aponta em mais que o ângulo de deriva declarado

# text
# c1: min_speed_kn
seg-75f4d659f716 = um arrasto ao longo do rumo (o rumo não muda); um aproamento do mesmo receptor ou de uma bússola GNSS; uma deriva transversal acima da tolerância (alarme falso); velocidades abaixo de <c1/>

# text
seg-09dde82be447 = um arrasto que altera a velocidade sobre o fundo em relação à velocidade através da água

# text
seg-6ac740e5f51c = um registro derivado de GNSS; uma corrente acima da margem (alarme falso); um arrasto mais lento que a margem

# text
seg-e85d5f0933b7 = uma altitude que não está onde a superfície do mar e a altura de antena declarada a colocariam

# text
seg-3806e1d46332 = um falsificador que mantém a altitude plausível; a tolerância é larga porque o erro vertical isolado é grande; a separação do geoide é registrada, mas não verificada, porque o motor não tem modelo de geoide

# text
seg-5b70bd80640e = a assinatura de um único transmissor: C/N0 entre os satélites caindo em conjunto, ou subindo em conjunto, em relação à linha de base de calibração

# text
seg-e6874a8047b1 = um falsificador que molda a potência por satélite; qualquer coisa enquanto a própria linha de base está falsificada; uma cadência de GSV lenta demais para acompanhar

# text
seg-371b17ce936a = o tempo do receptor avançando de forma irregular ou retrocedendo; em relação ao relógio deste computador, o tempo do receptor se afastando dele (somente fluxos em tempo real)

# text
seg-026479cb7966 = um tempo falso consistente e estável; um relógio errado desde o início

# text
seg-906ab911b73d = uma falha de autenticação OSNMA informada

# text
seg-a04757b7ae57 = o estado é lido, não verificado; um falsificador que suprime o relatório não é visto

# text
seg-c36c24a337b8 = negação de potência e perda de satélites, como no caso estático

# text
seg-940b39a3988a = indicam que o ambiente é hostil, não que a posição esteja errada

# text
seg-9d751e1f5938 = <b>O que monitores apenas NMEA não conseguem fazer.</b> Um falsificador que reproduz toda a constelação com uma posição autoconsistente, velocidade, rumo compatível com o aproamento, potência plausível por satélite e um relógio coincidente é invisível a todas as verificações acima: nada nas sentenças distingue sua posição de uma real. Tampouco uma repetição de sinais reais gravados. Autenticação (OSNMA, ou um receptor com recursos próprios de antifalsificação) e sensores de navegação independentes são o que fecha essa lacuna; esta camada só pode usar o estado que eles informam. Um fluxo que já está sendo falsificado enquanto a linha de base se forma não tem linha de base limpa. A ausência de um alarme não é evidência de uma boa posição.

# text
seg-e3e09e2412fb = Pontuação de confiança

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Cada época após a calibração recebe uma pontuação de { "0" } a { "100" } e os motivos de ela não ser { "100" }: quais verificações descontaram, sua estatística contra o limiar e seus pontos. Faixas (limites declarados na sessão): <c1/> em { "90" } ou mais, <c2/> em { "55" } ou mais, <c3/> abaixo disso. O mapeamento, cada peso e seu motivo estão em <a1><c4/></a1>; é determinístico e fixado antes de um registro ser pontuado, sem aprendizado e sem nada ajustado a eventos.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Toda saída de embarcação traz o aviso consultivo: a chave <c1/> do JSON de resultado e de cada linha ao vivo, uma primeira linha de comentário <c2/> do CSV (os leitores a pulam com sua opção de comentário), o <c3/> e um rodapé do SVG. Saídas de uma execução em lote: <c4/> (com o modelo de pontuação e os descontos de cada época), <c5/> (com colunas <c6/> e <c7/>) e <c8/>, que para uma embarcação é a trajetória informada pelo receptor colorida pela faixa de confiança acima da pontuação ao longo do tempo.

# text
seg-918516588036 = Uma demonstração sintética

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> contém um registro NMEA fictício de uma balsa em uma rota de Tallinn a Helsinque (um trecho de 50 minutos, cerca de { "17" } nós, { "1" } Hz: GGA, RMC, VTG, um aproamento de giroscópio, um log de velocidade, GSV com um céu plausível) no qual um arrasto de posição afasta a posição <em>informada</em> da posição real da embarcação a partir de { "1500" } s. O receptor continua informando uma posição <b>válida</b> o tempo todo; é a pontuação de confiança que cai, passando pela faixa degradada até a não confiável. <c2/> declara todo limiar, os limites da embarcação e todo peso de pontuação antes da execução.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = O registro é <b>texto gravado em um arquivo</b> por <c1/>: não modela nenhum sinal de rádio e não transmite nada. Não é uma medição e a rota é ilustrativa, não uma carta náutica. <c2/> fixa o registro e a saída esperada como guardas de regressão sobre os dados sintéticos; eles nada dizem sobre o desempenho de qualquer monitor diante de interferência real.

# attr:alt
seg-26ab8544afba = Pontuação de confiança ao longo de uma travessia sintética, a partir de uma execução real do motor v{ $version } sobre examples/maritime-trust (um registro NMEA fictício de uma balsa em uma rota de Tallinn a Helsinque, { "3001" } épocas a { "1" } Hz). Três faixas compartilham um eixo de tempo. Em cima: a distância entre a posição que o receptor informa e a posição real da embarcação, que permanece dentro de poucos metros até cerca de { "1576" } s, quando o arrasto de posição roteirizado do registro a afasta, enquanto o receptor continua informando uma posição válida. No meio: a pontuação de confiança de { "0" } a { "100" }, não calculada durante os primeiros { "300" } s de calibração, na faixa nominal (pelo menos { "90" }) até o arrasto, depois caindo pela faixa degradada (pelo menos { "55" }) até a faixa não confiável. Embaixo: a faixa de cada época como uma fita colorida com seu nome. A pontuação é consultiva. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação. O registro é fictício para mostrar o formato e os monitores; não é uma medição e nada diz sobre o desempenho de qualquer receptor.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = A figura é desenhada por <c1/> a partir de uma execução real desta demonstração (<c2/>); a pontuação é consultiva e o registro é fictício.

# text
seg-8badaf0d8586 = Especificação da vista do Studio

# text
seg-588092535a89 = Para quem constrói a vista do Studio de uma execução de embarcação. Nada nesta seção está implementado ainda no Studio; o lado do motor (os dados abaixo) está.

# text
seg-5c34f31acf1d = <b>Entradas.</b> Qualquer uma destas:

# text
# c1: kshana receiver-trust <session.toml>
# c2: receiver_trust(toml)
# c3: score_model
# c4: monitors_run
# c5: states
# c6: epochs[]
# c7: t_s
# c8: state
# c9: alarms
# c10: score.{score,band,deductions[]}
# c11: marine.{position:[lat,lon], stats, ratios}
# c12: geometry
# c13: class
# c14: geometry_model
# c15: geometry_summary
seg-57ca6d9000b1 = o JSON de resultado de uma execução em lote (<c1/>, ou o mesmo por <c2/> no pacote WebAssembly com o registro em linha): <c3/> (limites de faixa, rampa, retenção de evidência, todo peso), <c4/>, <c5/> e <c6/>, cada um com <c7/>, <c8/>, <c9/>, <c10/>, <c11/> e, a partir da { "0.36" }, <c12/> e a <c13/> de cada desconto, com <c14/> e <c15/> no nível superior; ou

# text
# c1: position
seg-bfab64386b6c = as linhas JSON ao vivo (esquema acima), um objeto por época, acrescentadas à medida que o fluxo corre. Cada linha traz a <c1/> informada pelo receptor (esquema { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = O conjunto de demonstração é <c1/>: <c2/>, <c3/> (o registro) e <c4/> (<c5/>: onde a embarcação realmente esteve, o que nenhum registro real tem). Uma vista deve executar a sessão e ler o arquivo de verdade ao lado.

# text
seg-c015c26cf30a = O que desenhar.

# text
seg-92f452bdbed6 = <em>Trajetória</em>, norte para cima, uma escala nos dois eixos: as posições informadas pelo receptor como uma linha colorida pela faixa da época (cinza em calibração, verde nominal, âmbar degradado, vermelho não confiável), início e fim marcados, uma barra de escala. Para a demonstração, a trajetória verdadeira como uma linha fina neutra por baixo, de modo que o arrasto apareça como as duas se separando; uma chave para a trajetória verdadeira e uma leitura do afastamento em metros no instante do cursor.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Linha do tempo da pontuação</em>: a pontuação de { "0" } a { "100" } contra o tempo, os limites das faixas (<c1/>, <c2/> de <c3/>) como linhas tracejadas, a faixa como uma tira por baixo e o início de qualquer evento declarado como um marcador. O eixo do tempo é compartilhado com a trajetória.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Motivos</em>: para a época sob o cursor, os descontos (monitor, razão contra o limiar, pontos) como barras horizontais, o maior primeiro, com o peso que cada monitor carrega de <c1/>; monitores que rodaram e nada custaram mostrados esmaecidos, monitores que não rodaram (fora de <c2/>) listados como "não executado", nunca como tendo passado. O monitor <c3/> não tem entrada em <c4/>: seu teto é <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Tiras de monitores</em>: uma tira fina por monitor em <c1/> mostrando sua razão ao longo do tempo (alarme em { "1" }), de modo que o leitor veja qual verificação se moveu primeiro.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>Estado do portão</em>: em uma vista ao vivo, o <c1/> de cada época (<c2/>, <c3/>, <c4/>) como uma tira sob a tira de faixa, e o <c5/> mais recente. Em uma vista em lote, as épocas que um portão teria retido são aquelas cuja faixa é não confiável, com a retenção de liberação aplicada.

# text
# c1: geometry.status
# c2: class
# c3: geometry_summary
# c4: geometry.note
# c5: n_used
# c6: source
# c7: age_s
# c8: reported_derived_mismatch
# c9: unknown
# c10: [geometry]
# c11: geometry_model
seg-b96652af3a03 = <em>Faixa de geometria</em> ({ "0.36" }): uma tira sob a tira de faixa colorida por <c1/> (verde boa, âmbar degradada, cinza hachurada desconhecida), em uma família de cores distinta das faixas de inconsistência e de ambiente, com a legenda "geometria: o céu, não o sinal". Descontos coloridos por <c2/> (geometria, ambiente, inconsistência) no painel de motivos e nas tiras de monitores, e as contagens de épocas por classe de <c3/> ao lado das contagens por faixa. Para a época sob o cursor: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> e um sinalizador quando <c8/> está definido (o desconto de geometria é então uma inconsistência). <c9/> é mostrado como "geometria desconhecida: sem GSV nem GSA no registro", nunca como boa. Os limiares de <c10/> e sua proveniência de <c11/> ficam ao lado dos ajustes da pontuação. A nota consultiva permanece.

# text
seg-c48906d03f90 = <em>Posição informada pelo receptor</em>: o receptor da demonstração informa uma posição válida o tempo todo (qualidade GGA { "1" }, estado RMC A); diga isso na legenda, porque esse é o ponto da vista.

# text
seg-869c8a92e2cf = <b>Interações.</b> Um cursor de tempo compartilhado por todos os painéis (arrastar, teclas de seta e um botão de reprodução que repete de 1x a 60x); passar o mouse sobre a trajetória ou sobre qualquer tira o move. Clicar em um desconto destaca as épocas em que aquele monitor esteve acima de seu início. Um filtro de faixa (mostrar apenas épocas degradadas e não confiáveis) e um salto para o primeiro desconto e para a primeira época não confiável. Texto de passagem do mouse em cada nome de monitor dando a descrição de uma linha desta página. Os limiares e pesos da sessão são mostrados, somente leitura, ao lado do gráfico, de modo que o que a pontuação usou fique na tela.

# text
seg-1f97fe8ea2f1 = <b>Redação a manter.</b> A página deve dizer que é um software de caráter consultivo e não um equipamento de navegação homologado, que a demonstração é texto sintético com um arrasto fictício e que uma posição sem alarme não é por isso uma boa posição (veja os limites acima). Nenhum valor na página deve ser lido como medida do desempenho das verificações diante de interferência real.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Para chamadores que mantêm a sessão e os bytes em memória (sem arquivos, sem relógio, sem sockets; seguro para WebAssembly), <c1/> tem:

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/>: um registro inteiro, pontuado como uma execução em lote; o mesmo resultado de <c2/>, que se serializa no JSON de resultado (<c3/>, <c4/>, <c5/> com pontuações e descontos).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/>: um trecho limitado de um fluxo (no máximo { "2" } MiB e { "20,000" } épocas, e longo o bastante para conter a janela de calibração), pontuado como o modo ao vivo pontua e devolvido no esquema de linhas JSON ao vivo (<c2/>, o último <c3/>, um resumo das contagens por faixa, pontuação mais baixa e final, primeiro instante não confiável). O tempo do receptor não é comparado com um relógio do hospedeiro. O modo ao vivo de longa duração (sockets, um arquivo sendo acrescentado, o portão) é do binário.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Ambos precisam de uma sessão com <c1/>; sua tabela <c2/> é opcional.

# text
seg-870fece8026e = Execute ao vivo

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = A sessão é o mesmo <c1/> de uma execução em lote, com uma tabela <c2/> que declara <c3/>; sua tabela <c4/> não é necessária. As portas seriais ainda não são abertas diretamente: leia a porta com a ferramenta que você já usa (<c5/> e <c6/>, um servidor de terminal, um multiplexador) e redirecione ou encaminhe. A entrada serial direta pode vir depois.

# text
seg-13a043c1ce60 = Cada época concluída grava uma linha JSON na saída padrão:

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> é <c2/>, <c3/>, <c4/> ou <c5/> (a faixa da pontuação, com os limites na tabela <c6/> da sessão); <c7/> está ausente durante a calibração; <c8/> lista quais verificações tiraram pontos e quantos, o maior primeiro.

# text
seg-9b21238a7dc1 = Esquema de linhas JSON (versão { "1.1" })

# text
seg-79306ff2d878 = Um objeto JSON por época concluída, chaves nesta ordem:

# text
seg-a129b9e613d0 = Tipo

# text
seg-bbcdd898d24d = inteiro

# text
seg-96958263575f = contagem de épocas informadas, a partir de { "1" }

# text
seg-16022703e1c0 = número

# text
seg-95dde7698840 = segundos desde a primeira época do fluxo

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = o tempo da época como o fluxo o declara (ISO-8601 UTC com data depois que um RMC foi visto, senão <c1/>)

# text
seg-0361f40a8e59 = número ou null

# text
# c1: note
seg-c2418289d966 = { "0" } a { "100" }, uma casa decimal; null durante a calibração ou quando <c1/> diz por que nenhuma pôde ser produzida

# text
seg-00575e5df2e1 = vetor

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, os de mais pontos primeiro; <c2/> é a estatística sobre o limiar (alarme em { "1" } ou mais); só os monitores que custam pontos são listados; <c3/> <em>(acrescentado na { "1.3" })</em> é <c4/>, <c5/> ou <c6/>

# text
seg-24d178dfb34f = vetor de strings

# text
seg-30948e769405 = monitores em seu limiar ou acima dele

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> ou <c3/>

# text
seg-495aa49df7e2 = por que nenhuma pontuação foi produzida (por exemplo, um sensor de aproamento declarado que está ausente)

# text
seg-3dabfd59cf4b = objeto ou null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(acrescentado na { "1.1" })</em> a posição que o receptor informou nesta época, <c1/> (altura elipsoidal quando a sentença dá a separação do geoide, senão acima do nível médio do mar); null quando o receptor não deu nenhuma, inclusive em épocas de calibração sem posição

# text
seg-3af4806d7d74 = <em>(acrescentado na { "1.2" })</em> o que este software é e não é: consultivo, não é um equipamento de navegação homologado, o operador continua responsável

# text
# c1: status
# c2: good
# c3: degraded
# c4: unknown
# c5: reasons
# c6: few-satellites
# c7: high-pdop
# c8: high-hdop
# c9: sky-blocked
# c10: source
# c11: derived
# c12: reported
# c13: none
# c14: n_used
# c15: hdop
# c16: pdop
# c17: vdop
# c18: open_fraction
# c19: max_azimuth_gap_deg
# c20: age_s
# c21: reported_hdop
# c22: reported_derived_mismatch
# c23: note
# c24: in_view
# c25: signal_loss
# c26: environment
# c27: label
# c28: good
# c29: fair
# c30: poor
# c31: unknown
# c32: poor
# c33: RECEIVER-TRUST.md
seg-79adcc5ee873 = <em>(acrescentado na { "1.3" })</em> a geometria dos satélites: <c1/> (<c2/>, <c3/>, <c4/> quando o fluxo não tem elevações e azimutes GSV nem GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satélites à vista mas não rastreados enquanto o DOP à vista é bom: o desconto de geometria é então <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: sempre informado, nunca pontuado; a pontuação desconta apenas por <c32/>) (veja <a1><c33/></a1>)

# text
# c1: cn0-drop
# c2: agc
# c3: jam-ind
# c4: loss-of-lock
# c5: position-jump
# c6: raim
# c7: clock
# c8: solve-failure
# c9: kinematic
# c10: heading-course
# c11: speed-log
# c12: sea-level
# c13: cn0-spread
# c14: cn0-rise
# c15: time-consistency
# c16: osnma
# c17: geometry
# c18: $PKSHT
# c19: position
# c20: advisory
# c21: geometry
# c22: class
seg-fc212411bf3c = Nomes de monitores (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> e, a partir da { "1.3" }, <c17/>. Novos nomes podem ser acrescentados em versões posteriores; os consumidores devem tratar um nome de monitor desconhecido como um monitor. O leiaute <c18/> abaixo leva uma versão de formato em seu primeiro campo; este esquema JSON é a versão { "1.3" }: a { "1.1" } acrescentou <c19/>, a { "1.2" } <c20/>, a { "1.3" } <c21/> no final e <c22/> em cada desconto, e só muda acrescentando chaves no final.

# text
seg-0019bf7fbfcd = Entrada de autenticação

# text
# c1: osnma
# c2: MarineObs::sat_auth
# c3: (satellite, status)
# c4: Authenticated
# c5: Failed
# c6: Unavailable
# c7: MarineObs::osnma
# c8: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c9: $PKSOS,A,E11:A,E19:F
seg-39b3dfbd97cc = O monitor <c1/> recebe o estado de autenticação por satélite de uma fonte de autenticação por meio de <c2/> (uma lista de <c3/>, estado <c4/>, <c5/> ou <c6/>), ao lado do <c7/> geral. Do lado NMEA, o mesmo é levado por <c8/>, por exemplo <c9/>. Qualquer falha, geral ou em um satélite, aciona o alarme do monitor e custa todo o seu peso (recebe a razão { "1.5" }); o sucesso não é evidência. O Kshana não verifica nada aqui: a fonte que o faz é responsável pelo estado que informa.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Uma época está completa quando chega a próxima sentença com marca de tempo; as sentenças de instrumentos mais lentos ou não sincronizados (um giroscópio alguns décimos de segundo atrás do receptor) que chegam antes disso pertencem a ela. Se o fluxo parar por <c1/> (padrão { "1.5" } s, ajuste-o acima da maior lacuna entre as sentenças com marca de tempo do seu receptor), a época é concluída como está. Os primeiros <c2/> segundos do fluxo formam a linha de base e nunca são pontuados, de modo que <b>um fluxo que já está sendo falsificado quando é conectado pela primeira vez não tem linha de base limpa</b>: inicie a camada antes da viagem, ou enquanto se sabe que a posição é boa. A janela de calibração se fecha uma só vez, por chegada: uma época cujo tempo é anterior a um tempo já visto (um retrocesso, uma repetição do início do fluxo) nunca é calibração, qualquer que seja o seu tempo; é pontuada com um desconto cheio de <c3/>, que é não confiável. O motor ao vivo pontua cada época sobre as épocas de calibração e o último minuto, mais ou menos, do fluxo, de modo que seu custo por época cresce com <c4/> vezes a taxa de épocas; mantenha a janela curta em um receptor rápido. Seus buffers são limitados (uma enxurrada de linhas sem sentença com marca de tempo é concluída a cada { "5,000" } linhas, e a calibração e o histórico são limitados a { "20,000" } épocas).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = O tempo do receptor também é comparado com o relógio monotônico deste computador, o que só tem sentido para um fluxo que chega em tempo real. Um registro armazenado alimentado em velocidade total por stdin, TCP ou UDP aciona essa verificação por construção: passe <c1/>. (<c2/> sem <c3/> já a implica.) Um <c4/> é lido como repetição até ser lido até o fim, e o relógio do hospedeiro é acionado a partir daí, de modo que um atraso acumulado não seja lido como falha de relógio; a verificação então precisa que a janela de calibração ainda esteja aberta (caso contrário não tem linha de base e não é executada).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Término e falhas do fluxo: stdin e um arquivo lido até o fim terminam normalmente (saída { "0" }). Uma conexão TCP fechada pelo par não é um término normal para um fluxo que deveria continuar: a camada sai com código diferente de zero depois de pontuar e gravar tudo o que havia recebido e não se reconecta, portanto execute-a sob um supervisor que a reinicie. Os datagramas UDP que dividem uma sentença são unidos; os leitores de stdin, de um arquivo e de TCP são sustentados por uma fila limitada que pressiona o emissor de volta (nada se perde), ao passo que o UDP, que não pode pressionar de volta, descarta os datagramas que o motor não consegue aceitar e avisa em stderr. <c1/> faz o bind no endereço de loopback; dê <c2/> para escutar em outro lugar (um aviso é impresso).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/>: a sentença proprietária

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Cada época também produz uma sentença NMEA { "0183" }, com soma de verificação válida, que <c1/> grava em um arquivo ou em stdout e que o portão insere no fluxo encaminhado:

# text
# c1: 1
seg-df9382f4b055 = <c1/>: a versão do formato

# text
# c1: hhmmss.ss
seg-6986879f86fb = hora UTC da época, <c1/>; vazio se o fluxo não deu nenhuma

# text
seg-34418696f9d2 = pontuação de confiança { "0" } a { "100" }, uma casa decimal; vazio durante a calibração ou quando nenhuma pôde ser produzida

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = faixa: <c1/> em calibração, <c2/> nominal, <c3/> degradada, <c4/> não confiável

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = portão: <c1/> desligado, <c2/> passou, <c3/> retido (a posição foi marcada como inválida no ciclo encaminhado)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = até dois motivos, <c1/> unidos por <c2/>; vazio quando nada foi descontado

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = O endereço é <c1/> + o mnemônico do fabricante <c2/> + <c3/>. Equipamentos que não conhecem uma sentença proprietária a ignoram. O Kshana ignora o seu próprio <c4/> na entrada.

# text
seg-d75c9da94f37 = Modo portão

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> coloca o Kshana entre o receptor e o equipamento que usa sua posição (um sistema de cartas, um sistema de controle de rota). O fluxo NMEA entra, sai em stdout e é:

# text
# c1: $PKSHT
seg-aa0692146620 = <b>repassado sem alteração</b> enquanto a época não é não confiável (e durante a calibração), com um <c1/> após cada ciclo de sentenças; e

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>marcado como inválido</b> enquanto é não confiável: qualidade GGA <c1/>; estado RMC <c2/> (e seu indicador de modo <c3/> e estado de navegação <c4/> onde presentes); modo GNS <c5/> em toda posição; estado GLL <c6/> e modo <c7/>; modo VTG <c8/> onde houver. Os campos de posição são deixados como estavam: o objetivo é que o equipamento veja o próprio receptor declarar a posição inválida e acione seu próprio alarme. Toda sentença reescrita tem sua soma de verificação recalculada.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Uma vez retida, a posição só é liberada depois que as épocas ficarem fora da faixa não confiável por <c1/> (padrão { "30" } s), de modo que uma pontuação no limite da faixa não possa fazer a posição oscilar. As linhas JSON vão apenas para onde <c2/> indicar (por padrão, para lugar nenhum, porque o fluxo ocupa stdout).

# text
seg-6b7b557a4909 = Para deixar um plotter de cartas se conectar diretamente, sirva o fluxo filtrado por TCP em vez de stdout:

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> escuta no endereço de loopback; <c2/> escuta em outro lugar (um aviso é impresso, porque quem alcançar o endereço pode ler o fluxo). Qualquer número de clientes pode se conectar; cada um recebe o mesmo fluxo a partir do instante em que se conecta, e os clientes só leem. Cada cliente tem sua própria fila limitada e seu próprio escritor, de modo que um que não consegue acompanhar é descartado (sua conexão é fechada, uma linha em stderr) e nunca atrasa os outros nem a entrada. <c3/> precisa de <c4/>; stdout então não leva nada do fluxo, portanto <c5/> fica livre.

# text
seg-960e0abb0466 = O que o portão não faz e o que saber antes de usá-lo:

# text
# c1: --gate
seg-ee3f18efa84c = É <b>opcional</b>. Nada marca uma posição como inválida a menos que <c1/> seja dado.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = Ele <b>acrescenta latência</b>: um ciclo fica retido até que sua época seja pontuada, o que leva o tempo até a próxima sentença com marca de tempo (cerca de um ciclo: um segundo para um receptor de { "1" } Hz), ou <c1/> após a última quando o fluxo trava. Equipamentos que precisam de uma sentença a poucas dezenas de milissegundos da saída do receptor não devem ficar atrás dele.

# text
seg-ec63f8f3230b = É <b>um ponto único na cadeia</b>: se ele para, o fluxo para. Execute-o sob supervisão e decida de antemão o que o equipamento a jusante faz sem um fluxo.

# text
# c1: note
seg-536e41a6a5e7 = Ele <b>falha em modo fechado diante de suas próprias falhas</b>: se os monitores não conseguem produzir uma pontuação após a calibração (um sensor de aproamento declarado que não envia nada, épocas de calibração insuficientes), a época é não confiável, leva uma <c1/> e é retida; a retenção de liberação é contada pelo relógio deste computador, não pelo tempo do receptor, que é o que um falsificador controla (para uma repetição só há o tempo do receptor).

# text
seg-5dd62cd853c6 = Ele pode <b>reter uma boa posição</b> (um alarme falso) assim como deixar passar uma falsificada (uma omissão). Os monitores conferem uma posição com a física de um navio e seus outros sensores; uma falsificação que seja consistente com todos eles não é vista (veja os limites abaixo).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = Ele espera um <b>fluxo de texto NMEA { "0183" } puro</b>. Quadros binários misturados ao fluxo são encaminhados sem alteração, mas um <c1/> pode então cair entre os bytes de um quadro.

# text
seg-0c919698fa92 = Ele <b>não é homologado</b> e nada nele foi avaliado segundo a IEC { "61108" } ou a IEC { "61162" }. O operador continua responsável pela navegação da embarcação.

# text
seg-9e3ea39c38cf = <s1>Anterior</s1>Confiança do receptor

# text
seg-136da5c10b2d = <s1>Próxima</s1>Fluxos de treinamento NMEA

# text
seg-990a49527516 = $PKSHT: a sentença proprietária
