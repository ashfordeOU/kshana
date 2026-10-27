# docs--maritime-trust: translations (pt-PT)

# text
seg-2247a2344710 = Significado

# text
seg-6940543aa3c0 = cadeia de caracteres

# text
seg-abec93a4a488 = cadeia de caracteres ou nulo

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
seg-342f34403ac5 = Confiança marítima: pode a ponte confiar nesta solução de posição?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> pode pontuar, para uma <b>embarcação em movimento</b>, um valor de confiança de 0-100 em direto para cada solução de posição, a partir do que qualquer recetor já coloca no barramento (primeiro NMEA { "0183" }), e dizer que verificações o reduziram. É uma camada de software que fica junto de um recetor. Não é um recetor, não substitui nenhum e não torna uma solução de posição mais exata.

# text
seg-3c66739c9250 = <b>Software de caráter consultivo.</b> O Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e não foi avaliado face a nenhuma norma de desempenho. A sua pontuação e o seu gate são auxiliares do juízo do navegador. O operador continua a ser responsável pela navegação segura da embarcação e por qualquer decisão de confiar, ou de deixar de confiar, numa solução de posição.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Esta página diz o que as verificações observam, o que cada uma pode e não pode detetar, como executá-la em direto e o que faz o gate. O mapeamento da pontuação e todas as predefinições constam de <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = O que lê

# text
seg-e784fdbe26e6 = Uma embarcação é declarada no ficheiro de sessão, com os seus limites indicados antes da execução:

# text
seg-e8e9ee2965cf = Sentença

# text
seg-e127f2f26824 = Lido

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = posição, qualidade da solução de posição ({ "0" } = sem solução), altitude acima do nível médio do mar, separação do geoide, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = estado (<c1/> válida, <c2/> não), velocidade e rumo sobre o fundo, data, modo

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = velocidade e rumo sobre o fundo, quando a RMC não os tem

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = rumo (THS apenas quando o seu modo não é <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = velocidade na água (VBW apenas quando o seu estado é <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = tempo

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = intensidade de sinal por satélite (dB-Hz), elevação e azimute (para a geometria)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = diluição da precisão e satélites usados (para a geometria, quando a GSV não dá céu; e o HDOP indicado que a salvaguarda compara)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = um estado OSNMA indicado por um recetor, traduzido para esta sentença pelo adaptador que lê o recetor: <c1/> autenticado, <c2/> falhado, <c3/> sem resultado

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = As épocas que o próprio recetor diz não serem uma solução de posição por satélite (qualidade GGA { "0" }, ou { "6" } a { "8" }: estimada, manual, simulador; estado RMC <c1/>, ou modo <c2/>, <c3/>, <c4/>, <c5/>) não são usadas nas verificações de posição e não trazem evidência num sentido nem noutro: o recetor já o disse.

# text
# c1: calibration_s
seg-a0ae80781c6e = Os primeiros <c1/> segundos formam a linha de base e nunca são pontuados. Todos os monitores olham apenas para a época atual e as anteriores, pelo que uma decisão numa época não muda quando chegam dados posteriores, e um fluxo em direto dá a mesma pontuação que o mesmo texto lido como ficheiro.

# text
seg-068593ad0a52 = O que cada verificação deteta e o que não pode detetar

# text
seg-094b90f0c701 = As direções entre soluções de posição (o rumo da trajetória usado pela verificação da taxa de viragem, o rumo implícito em duas posições) são a direção da corda entre elas, que é o <b>azimute médio</b> da geodésica entre as soluções de posição, não o azimute direto na primeira solução de posição; os dois diferem em cerca de metade da convergência dos meridianos entre as soluções de posição ({ "0.001" } graus para uma linha de base de { "260" } m a { "59.5" } graus de latitude).

# text
seg-ed3cdfcfbff5 = Uma posição falsificada tem de concordar com a física do navio e com os outros sensores do navio. Cada verificação compara a solução de posição com um deles. Uma verificação é tão independente quanto a sua outra fonte: um rumo de uma bússola GNSS, ou uma "velocidade na água" derivada do GNSS, não é independente do recetor em teste e nada acrescenta.

# text
seg-9480aabf136e = Verificação

# text
seg-20e4f746c7e1 = Deteta

# text
seg-e7b2ebe5eabc = Não pode detetar

# text
seg-21ad9895f606 = um salto de posição; uma trajetória cujo movimento a velocidade e o rumo indicados não explicam; uma velocidade, aceleração ou taxa de viragem implícita acima dos limites declarados da embarcação

# text
seg-dcbc6d4cd17f = um arrastamento cuja velocidade e rumo indicados seguem a trajetória falsificada e se mantém dentro dos limites (o recetor deriva-os da sua própria solução, pelo que concordam entre si); um limite de velocidade declarado demasiado alto

# text
seg-3542f83a7988 = uma trajetória que se afasta do ponto para onde o navio aponta em mais do que o ângulo de deriva declarado

# text
# c1: min_speed_kn
seg-75f4d659f716 = um arrastamento ao longo do rumo (o rumo não muda); um rumo vindo do mesmo recetor ou de uma bússola GNSS; um desvio lateral acima da tolerância (falso alarme); velocidades abaixo de <c1/>

# text
seg-09dde82be447 = um arrastamento que altera a velocidade sobre o fundo face à velocidade na água

# text
seg-6ac740e5f51c = uma barquilha derivada de GNSS; uma corrente acima da margem (falso alarme); um arrastamento mais lento do que a margem

# text
seg-e85d5f0933b7 = uma altitude que não está onde a superfície do mar e a altura declarada da antena a colocam

# text
seg-3806e1d46332 = um spoofer que mantém a altitude plausível; a tolerância é larga porque o erro vertical autónomo é grande; a separação do geoide é registada mas não verificada, porque o motor não tem modelo de geoide

# text
seg-5b70bd80640e = a assinatura de um só emissor: C/N0 em todos os satélites a colapsar em conjunto, ou a subir em conjunto, face à linha de base de calibração

# text
seg-e6874a8047b1 = um spoofer que molda a potência por satélite; qualquer coisa enquanto a própria linha de base está sob spoofing; uma cadência de GSV demasiado lenta para acompanhar

# text
seg-371b17ce936a = o tempo do recetor a avançar de forma irregular ou a recuar; face ao relógio deste computador, o tempo do recetor a divergir dele (apenas fluxos em tempo real)

# text
seg-026479cb7966 = um tempo falsificado que seja consistente e estável; um relógio que esteja errado desde o início

# text
seg-906ab911b73d = uma falha de autenticação OSNMA indicada

# text
seg-a04757b7ae57 = o estado é lido, não verificado; um spoofer que suprima o relatório não é detetado

# text
seg-c36c24a337b8 = negação de potência e perda de satélites, como no caso estático

# text
seg-940b39a3988a = indicam que o ambiente é hostil, não que a solução de posição esteja errada

# text
seg-9d751e1f5938 = <b>O que os monitores apenas NMEA não conseguem fazer.</b> Um spoofer que reproduza toda a constelação com uma posição autoconsistente, velocidade, rumo compatível com a proa, potência por satélite plausível e um relógio coincidente é invisível a todas as verificações acima: nada nas sentenças distingue a sua solução de posição de uma real. O mesmo acontece com uma repetição de sinais reais gravados. A autenticação (OSNMA, ou um recetor com a sua própria proteção contra spoofing) e os sensores de navegação independentes são o que fecha essa lacuna; esta camada só pode usar o estado que eles indicam. Um fluxo que já esteja sob spoofing enquanto a linha de base se forma não tem linha de base limpa. A ausência de alarme não é evidência de uma boa solução de posição.

# text
seg-e3e09e2412fb = Pontuação de confiança

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Cada época após a calibração recebe uma pontuação de { "0" } a { "100" } e os motivos pelos quais não é { "100" }: que verificações deduziram, a sua estatística face ao limiar e os seus pontos. Faixas (limites indicados na sessão): <c1/> a { "90" } ou mais, <c2/> a { "55" } ou mais, <c3/> abaixo. O mapeamento, cada peso e o seu motivo constam de <a1><c4/></a1>; é determinista e fixado antes de um registo ser pontuado, sem aprendizagem e sem nada ajustado a eventos.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Todas as saídas de embarcação trazem a declaração consultiva: a chave <c1/> do JSON do resultado e de cada linha em direto, uma primeira linha de comentário <c2/> do CSV (os leitores ignoram-na com a sua opção de comentário), o <c3/> e um rodapé do SVG. Saídas de uma execução em lote: <c4/> (com o modelo de pontuação e as deduções de cada época), <c5/> (com colunas <c6/> e <c7/>) e <c8/>, que para uma embarcação é a trajetória indicada pelo recetor colorida por faixa de confiança acima da pontuação ao longo do tempo.

# text
seg-918516588036 = Uma demonstração sintética

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> contém um registo NMEA fictício de um ferry numa rota de Tallinn a Helsínquia (um excerto de 50 minutos, cerca de { "17" } kn, { "1" } Hz: GGA, RMC, VTG, um rumo de giroscópio, uma barquilha, GSV com um céu plausível) no qual um arrastamento de posição afasta a posição <em>indicada</em> da posição real da embarcação a partir de { "1500" } s. O recetor continua a indicar uma solução de posição <b>válida</b> durante todo o tempo; o que desce é a pontuação de confiança, através da faixa degraded até à untrusted. <c2/> indica cada limiar, os limites da embarcação e cada peso da pontuação antes da execução.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = O registo é <b>texto escrito num ficheiro</b> por <c1/>: não modela nenhum sinal de rádio e não transmite nada. Não é uma medição e a rota é ilustrativa, não uma carta. <c2/> fixa o registo e a saída esperada como salvaguardas de regressão sobre os dados sintéticos; nada dizem sobre o desempenho de qualquer monitor perante interferência real.

# attr:alt
seg-26ab8544afba = Pontuação de confiança ao longo de uma travessia sintética, a partir de uma execução real do motor v{ $version } sobre examples/maritime-trust (um registo NMEA fictício de um ferry numa rota de Tallinn a Helsínquia, { "3001" } épocas a { "1" } Hz). Três faixas partilham um eixo de tempo. Em cima: a distância entre a posição que o recetor indica e a posição real da embarcação, que se mantém dentro de alguns metros até cerca de { "1576" } s, quando o arrastamento de posição programado no registo a afasta, enquanto o recetor continua a indicar uma solução de posição válida. Ao meio: a pontuação de confiança de { "0" } a { "100" }, não calculada durante os primeiros { "300" } s de calibração, na faixa nominal (pelo menos { "90" }) até ao arrastamento, descendo depois pela faixa degraded (pelo menos { "55" }) até à faixa untrusted. Em baixo: a faixa de cada época como uma fita colorida com o seu nome. A pontuação é consultiva. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação. O registo é fictício para mostrar o formato e os monitores; não é uma medição e nada diz sobre o desempenho de qualquer recetor.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = A figura é desenhada por <c1/> a partir de uma execução real desta demonstração (<c2/>); a pontuação é consultiva e o registo é fictício.

# text
seg-8badaf0d8586 = Especificação da vista do Studio

# text
seg-588092535a89 = Para quem construir a vista do Studio de uma execução de embarcação. Nada nesta secção está ainda implementado no Studio; o lado do motor (os dados abaixo) está.

# text
seg-5c34f31acf1d = <b>Entradas.</b> Qualquer uma de:

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
seg-57ca6d9000b1 = o JSON do resultado de uma execução em lote (<c1/>, ou o mesmo através de <c2/> no pacote WebAssembly com o registo em linha): <c3/> (limites das faixas, rampa, retenção de evidência, cada peso), <c4/>, <c5/> e <c6/>, cada um com <c7/>, <c8/>, <c9/>, <c10/>, <c11/> e, a partir de { "0.36" }, <c12/> e o <c13/> de cada dedução, com <c14/> e <c15/> no nível superior; ou

# text
# c1: position
seg-bfab64386b6c = as linhas JSON em direto (esquema acima), um objeto por época, acrescentado à medida que o fluxo decorre. Cada linha traz o <c1/> indicado pelo recetor (esquema { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = O conjunto de demonstração é <c1/>: <c2/>, <c3/> (o registo) e <c4/> (<c5/>: onde a embarcação realmente estava, o que nenhum registo real tem). Uma vista deve executar a sessão e ler o ficheiro de referência em paralelo.

# text
seg-c015c26cf30a = O que desenhar.

# text
seg-92f452bdbed6 = <em>Trajetória</em>, norte para cima, uma só escala nos dois eixos: as posições indicadas pelo recetor como uma linha colorida pela faixa da época (cinzento a calibrar, verde nominal, âmbar degraded, vermelho untrusted), início e fim marcados, uma barra de escala. Para a demonstração, a trajetória real como uma linha fina neutra por baixo, de modo que o arrastamento se mostre como as duas a separarem-se; um comutador para a trajetória real e uma leitura do desvio em metros no instante do cursor.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Cronologia da pontuação</em>: a pontuação de { "0" } a { "100" } em função do tempo, os limites das faixas (<c1/>, <c2/> de <c3/>) como linhas tracejadas, a faixa como uma tira por baixo e o início de qualquer evento declarado como marcador. O eixo do tempo é partilhado com a trajetória.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Motivos</em>: para a época sob o cursor, as deduções (monitor, razão face ao limiar, pontos) como barras horizontais, da maior para a menor, com o peso que cada monitor tem em <c1/>; os monitores que correram e nada custaram mostrados esbatidos, os monitores que não correram (ausentes de <c2/>) listados como "not run", nunca como a passar. O monitor <c3/> não tem entrada em <c4/>: o seu limite é <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Tiras de monitores</em>: uma tira fina por monitor em <c1/> a mostrar a sua razão ao longo do tempo (alarme em { "1" }), para que o leitor veja que verificação se moveu primeiro.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>Estado do gate</em>: numa vista em direto, o <c1/> de cada época (<c2/>, <c3/>, <c4/>) como uma tira por baixo da tira de faixas, e o último <c5/>. Numa vista em lote, as épocas que um gate teria retido são aquelas cuja faixa é untrusted, com a retenção de libertação aplicada.

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
seg-b96652af3a03 = <em>Faixa de geometria</em> ({ "0.36" }): uma tira por baixo da tira de faixas colorida por <c1/> (verde boa, âmbar degraded, cinzento tracejado desconhecida), numa família de cores distinta das faixas de inconsistência e de ambiente, com a legenda "geometry: the sky, not the signal". Deduções coloridas por <c2/> (geometria, ambiente, inconsistência) no painel de motivos e nas tiras de monitores, e as contagens de épocas por classe de <c3/> ao lado das contagens por faixa. Para a época sob o cursor: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> e um indicador quando <c8/> está definido (a dedução de geometria é então uma inconsistência). <c9/> é mostrado como "geometry unknown: no GSV or GSA in the log", nunca como bom. Os limiares de <c10/> e a sua proveniência a partir de <c11/> ficam ao lado das definições da pontuação. A nota consultiva mantém-se.

# text
seg-c48906d03f90 = <em>Solução de posição indicada pelo recetor</em>: o recetor da demonstração indica uma solução de posição válida durante todo o tempo (qualidade GGA { "1" }, estado RMC A); diga-o na legenda, porque é esse o objetivo da vista.

# text
seg-869c8a92e2cf = <b>Interações.</b> Um cursor de tempo partilhado por todos os painéis (arrastar, teclas de seta e um botão de reprodução que repete de 1x a 60x); pairar sobre a trajetória ou sobre qualquer tira move-o. Clicar numa dedução destaca as épocas em que esse monitor esteve acima do seu limiar de ativação. Um filtro de faixa (mostrar apenas épocas degraded e untrusted) e um salto para a primeira dedução e para a primeira época untrusted. Texto de ajuda em cada nome de monitor com a descrição de uma linha desta página. Os limiares e pesos da sessão são mostrados, só de leitura, ao lado do gráfico, para que o que a pontuação usou esteja no ecrã.

# text
seg-1f97fe8ea2f1 = <b>Redação a manter.</b> A página deve dizer que é software de caráter consultivo e não um equipamento de navegação homologado, que a demonstração é texto sintético com um arrastamento fictício, e que uma solução de posição sem alarme não é por isso uma boa solução de posição (ver os limites acima). Nenhum valor na página deve poder ler-se como uma medida do desempenho das verificações perante interferência real.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Para quem tem a sessão e os bytes em memória (sem ficheiros, sem relógio, sem sockets; seguro para WebAssembly), <c1/> tem:

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/>: um registo completo, pontuado como numa execução em lote; o mesmo resultado que <c2/>, que se serializa para o JSON do resultado (<c3/>, <c4/>, <c5/> com pontuações e deduções).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/>: um excerto limitado de um fluxo (no máximo { "2" } MiB e { "20,000" } épocas, e longo o suficiente para conter a janela de calibração), pontuado como o modo em direto pontua e devolvido no esquema de linhas JSON em direto (<c2/>, o último <c3/>, um resumo das contagens de faixas, pontuação mais baixa e final, primeiro instante untrusted). O tempo do recetor não é comparado com um relógio do anfitrião. O modo em direto de longa duração (sockets, um ficheiro a ser acrescentado, o gate) é do binário.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Ambos precisam de uma sessão com <c1/>; a sua tabela <c2/> é facultativa.

# text
seg-870fece8026e = Execução em direto

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = A sessão é o mesmo <c1/> de uma execução em lote, com uma tabela <c2/> que declara <c3/>; a sua tabela <c4/> não é necessária. As portas série ainda não são abertas diretamente: leia a porta com a ferramenta que já usa (<c5/> e <c6/>, um servidor de terminal, um multiplexador) e encaminhe-a por pipe ou reencaminhamento. A entrada série direta poderá vir mais tarde.

# text
seg-13a043c1ce60 = Cada época concluída escreve uma linha JSON na saída padrão:

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> é <c2/>, <c3/>, <c4/> ou <c5/> (a faixa da pontuação, com os limites na tabela <c6/> da sessão); <c7/> está ausente durante a calibração; <c8/> lista que verificações retiraram pontos e quantos, da maior para a menor.

# text
seg-9b21238a7dc1 = Esquema de linhas JSON (versão { "1.1" })

# text
seg-79306ff2d878 = Um objeto JSON por época concluída, com as chaves por esta ordem:

# text
seg-a129b9e613d0 = Tipo

# text
seg-bbcdd898d24d = inteiro

# text
seg-96958263575f = contagem de épocas indicadas, a partir de { "1" }

# text
seg-16022703e1c0 = número

# text
seg-95dde7698840 = segundos desde a primeira época do fluxo

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = o tempo da época tal como o fluxo o indica (UTC ISO-8601 com data depois de ter sido vista uma RMC, caso contrário <c1/>)

# text
seg-0361f40a8e59 = número ou null

# text
# c1: note
seg-c2418289d966 = { "0" } a { "100" }, uma casa decimal; null durante a calibração ou quando <c1/> explica porque não foi possível produzir nenhuma

# text
seg-00575e5df2e1 = array

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, com os pontos maiores primeiro; <c2/> é a estatística sobre o limiar (alarme a { "1" } ou mais); só são listados os monitores que custaram pontos; <c3/> <em>(acrescentado em { "1.3" })</em> é <c4/>, <c5/> ou <c6/>

# text
seg-24d178dfb34f = array de strings

# text
seg-30948e769405 = monitores no seu limiar ou acima dele

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> ou <c3/>

# text
seg-495aa49df7e2 = porque não foi produzida nenhuma pontuação (por exemplo, um sensor de rumo declarado que está ausente)

# text
seg-3dabfd59cf4b = objeto ou null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(acrescentado em { "1.1" })</em> a posição que o recetor indicou nesta época, <c1/> (altura elipsoidal quando a sentença dá a separação do geoide, caso contrário acima do nível médio do mar); null quando o recetor não deu nenhuma, incluindo épocas de calibração sem solução de posição

# text
seg-3af4806d7d74 = <em>(acrescentado em { "1.2" })</em> o que este software é e não é: consultivo, não é um equipamento de navegação homologado, o operador continua a ser responsável

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
seg-79adcc5ee873 = <em>(acrescentado em { "1.3" })</em> a geometria dos satélites: <c1/> (<c2/>, <c3/>, <c4/> quando o fluxo não tem elevações e azimutes GSV nem GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satélites à vista mas não seguidos enquanto o DOP à vista é bom: a dedução de geometria é então <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: sempre indicado, nunca pontuado; a pontuação só deduz por <c32/>) (ver <a1><c33/></a1>)

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
seg-fc212411bf3c = Nomes dos monitores (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> e, a partir de { "1.3" }, <c17/>. Podem ser acrescentados novos nomes em versões posteriores; os consumidores devem tratar um nome de monitor desconhecido como um monitor. A disposição de <c18/> abaixo traz uma versão de formato no seu primeiro campo; este esquema JSON é a versão { "1.3" }: a { "1.1" } acrescentou <c19/>, a { "1.2" } <c20/>, a { "1.3" } <c21/> no fim e <c22/> em cada dedução, e só muda por acréscimo de chaves no fim.

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
seg-39b3dfbd97cc = O monitor <c1/> recebe o estado de autenticação por satélite de uma fonte de autenticação através de <c2/> (uma lista de <c3/>, estado <c4/>, <c5/> ou <c6/>), ao lado do <c7/> global. Do lado NMEA, o mesmo é transportado por <c8/>, por exemplo <c9/>. Qualquer falha, global ou num só satélite, faz soar o alarme do monitor e custa todo o seu peso (é-lhe dada a razão { "1.5" }); o sucesso não é evidência. O Kshana não verifica nada aqui: a fonte que o faz é responsável pelo estado que indica.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Uma época está completa quando chega a sentença temporizada seguinte; as sentenças de instrumentos mais lentos ou não sincronizados (um giroscópio algumas décimas de segundo atrás do recetor) que cheguem antes pertencem-lhe. Se o fluxo parar durante <c1/> (predefinição { "1.5" } s; defina-o acima da maior lacuna entre as sentenças temporizadas do seu recetor), a época é concluída tal como está. Os primeiros <c2/> segundos do fluxo formam a linha de base e nunca são pontuados, pelo que <b>um fluxo que já esteja sob spoofing quando é ligado pela primeira vez não tem linha de base limpa</b>: inicie a camada antes da viagem, ou enquanto se sabe que a solução de posição é boa. A janela de calibração fecha uma só vez, por chegada: uma época cujo tempo seja anterior a um tempo já visto (um recuo, uma repetição do início do fluxo) nunca é calibração seja qual for o seu tempo; é pontuada com uma dedução <c3/> completa, o que é untrusted. O motor em direto pontua cada época sobre as épocas de calibração e o último minuto, mais ou menos, do fluxo, pelo que o seu custo por época cresce com <c4/> vezes a taxa de épocas; mantenha a janela curta num recetor rápido. Os seus buffers são limitados (uma torrente de linhas sem sentença temporizada é concluída a cada { "5,000" } linhas, a calibração e o histórico estão limitados a { "20,000" } épocas).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = O tempo do recetor é também comparado com o relógio monotónico deste computador, o que só tem significado para um fluxo que chega em tempo real. Um registo guardado introduzido à velocidade máxima por stdin, TCP ou UDP faz disparar essa verificação por construção: passe <c1/>. (<c2/> sem <c3/> já o implica.) Um <c4/> é lido como repetição até ter sido lido até ao fim e o relógio do anfitrião entra em ação a partir daí, para que um atraso acumulado não se leia como falha de relógio; a verificação precisa então de que a janela de calibração ainda esteja aberta (caso contrário não tem linha de base e não é executada).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Fim do fluxo e falhas: o stdin e um ficheiro lido até ao fim terminam normalmente (saída { "0" }). Uma ligação TCP fechada pelo par não é um fim normal para um fluxo que deveria continuar: a camada termina com código diferente de zero depois de pontuar e escrever tudo o que tinha recebido e não volta a ligar-se, pelo que deve ser executada sob um supervisor que a reinicie. Os datagramas UDP que dividem uma sentença são unidos; os leitores de stdin, de um ficheiro e de TCP assentam numa fila limitada que exerce contrapressão sobre o emissor (nada se perde), enquanto o UDP, que não pode exercer contrapressão, descarta os datagramas que o motor não consegue aceitar e di-lo no stderr. <c1/> liga-se ao endereço de loopback; indique <c2/> para escutar noutro local (é impresso um aviso).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/>: a sentença proprietária

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Cada época produz também uma sentença NMEA { "0183" }, com checksum válido, que <c1/> escreve num ficheiro ou na saída padrão e que o gate insere no fluxo reencaminhado:

# text
# c1: 1
seg-df9382f4b055 = <c1/>: a versão do formato

# text
# c1: hhmmss.ss
seg-6986879f86fb = hora UTC da época, <c1/>; vazio se o fluxo não deu nenhuma

# text
seg-34418696f9d2 = pontuação de confiança de { "0" } a { "100" }, uma casa decimal; vazia durante a calibração ou quando não foi possível produzir nenhuma

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = faixa: <c1/> a calibrar, <c2/> nominal, <c3/> degraded, <c4/> untrusted

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = gate: <c1/> desligado, <c2/> passou, <c3/> retido (a solução de posição foi marcada como inválida no ciclo reencaminhado)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = até dois motivos, <c1/> unidos por <c2/>; vazio quando nada foi deduzido

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = O endereço é <c1/> + o mnemónico do fabricante <c2/> + <c3/>. O equipamento que não conhece uma sentença proprietária ignora-a. O Kshana ignora o seu próprio <c4/> na entrada.

# text
seg-d75c9da94f37 = Gate mode

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> coloca o Kshana entre o recetor e o equipamento que usa a sua solução de posição (um sistema de cartas, um sistema de controlo de rumo). O fluxo NMEA entra, sai na saída padrão, e é:

# text
# c1: $PKSHT
seg-aa0692146620 = <b>passado sem alterações</b> enquanto a época não é untrusted (e durante a calibração), com um <c1/> após cada ciclo de sentenças; e

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>marcado como inválido</b> enquanto é untrusted: qualidade GGA <c1/>; estado RMC <c2/> (e o seu indicador de modo <c3/> e estado de navegação <c4/> onde presentes); modo GNS <c5/> em todas as posições; estado GLL <c6/> e modo <c7/>; modo VTG <c8/> onde exista. Os campos de posição ficam como estavam: o objetivo é que o equipamento veja o próprio recetor declarar a solução de posição inválida e emita o seu próprio alarme. Todas as sentenças reescritas têm o checksum recalculado.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Depois de retida, a solução de posição só é libertada depois de as épocas terem estado fora da faixa untrusted durante <c1/> (predefinição { "30" } s), para que uma pontuação no limite da faixa não possa fazer a solução de posição oscilar. As linhas JSON vão apenas para onde <c2/> indicar (por predefinição, para lado nenhum, porque o fluxo ocupa a saída padrão).

# text
seg-6b7b557a4909 = Para permitir que um plotter de cartas se ligue diretamente, sirva o fluxo filtrado por gate por TCP em vez de pela saída padrão:

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> escuta no endereço de loopback; <c2/> escuta noutro local (é impresso um aviso, porque quem consiga alcançar o endereço pode ler o fluxo). Qualquer número de clientes pode ligar-se; cada um recebe o mesmo fluxo a partir do momento em que se liga, e os clientes só leem. Cada cliente tem a sua própria fila limitada e o seu próprio escritor, pelo que um que não consiga acompanhar é descartado (a sua ligação é fechada, uma linha no stderr) e nunca atrasa os outros nem a entrada. <c3/> precisa de <c4/>; a saída padrão não transporta então nada do fluxo, pelo que <c5/> fica livre.

# text
seg-960e0abb0466 = O que o gate não faz, e o que convém saber antes de o usar:

# text
# c1: --gate
seg-ee3f18efa84c = É <b>facultativo</b>. Nada marca uma solução de posição como inválida a menos que <c1/> seja indicado.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = <b>Acrescenta latência</b>: um ciclo fica retido até a sua época ser pontuada, o que corresponde ao tempo até à sentença temporizada seguinte (cerca de um ciclo: um segundo para um recetor de { "1" } Hz), ou <c1/> após a última quando o fluxo para. O equipamento que precise de uma sentença a poucas dezenas de milissegundos da saída do recetor não deve ficar atrás dele.

# text
seg-ec63f8f3230b = É <b>um ponto único na cadeia</b>: se parar, o fluxo pára. Execute-o sob supervisão e decida de antemão o que faz o equipamento a jusante sem fluxo.

# text
# c1: note
seg-536e41a6a5e7 = <b>Falha de forma segura perante as suas próprias falhas</b>: se os monitores não conseguirem produzir uma pontuação após a calibração (um sensor de rumo declarado que não envia nada, poucas épocas de calibração), a época é untrusted, traz um <c1/> e é retida; a retenção de libertação é temporizada pelo relógio deste computador, não pelo tempo do recetor, que é o que um spoofer controla (numa repetição só existe o tempo do recetor).

# text
seg-5dd62cd853c6 = Pode <b>reter uma boa solução de posição</b> (um falso alarme), além de deixar passar uma falsificada (uma falha de deteção). Os monitores verificam uma solução de posição face à física do navio e aos seus outros sensores; uma falsificação consistente com todos eles não é detetada (ver os limites abaixo).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = Espera um <b>fluxo de texto NMEA { "0183" } puro</b>. As tramas binárias misturadas no fluxo são encaminhadas sem alterações, mas um <c1/> pode então cair entre os bytes de uma trama.

# text
seg-0c919698fa92 = <b>Não é homologado</b> e nada nele foi avaliado face à IEC { "61108" } ou à IEC { "61162" }. O operador continua a ser responsável pela navegação da embarcação.

# text
seg-9e3ea39c38cf = <s1>Anterior</s1>Confiança do recetor

# text
seg-136da5c10b2d = <s1>Seguinte</s1>Fluxos NMEA de formação

# text
seg-990a49527516 = $PKSHT: a sentença proprietária
