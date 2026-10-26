# docs--campaigns: translations (pt-PT)

# text
seg-f917e7fcac09 = O que é

# text
seg-cae10fb9bff8 = Cenário

# text
# c1: docs/CAMPAIGNS.md
seg-7603033b1c87 = Fonte: <c1/>

# text
# c1: campaign
# c2: kind
# c3: api::run_toml
# c4: kshana <file>.toml
seg-699c946d7d09 = Um único cenário responde a uma pergunta sobre uma situação. Uma missão é uma sequência de situações, e um estudo de projeto é uma família delas. O tipo de cenário <c1/> compõe os tipos existentes numa só execução sem reimplementar nenhum deles: cada membro é uma tabela de cenário normal que traz o seu próprio <c2/>, despachada através de <c3/> exatamente como <c4/> a executaria, e a campanha limita-se a ler números dos documentos de resultados.

# text
seg-cb4f48673970 = Uma campanha é <b>MODELLED</b>. As suas identidades de composição são testadas (abaixo), mas encadear fases é uma escolha de modelação, e cada fase vale apenas o que valer o tipo de cenário que a executou.

# text
seg-80e367fbc391 = Execute-se uma como qualquer outro cenário:

# text
seg-9f9995ebc904 = Uma campanha pode conter qualquer combinação de quatro secções; uma sem nenhuma executa-se e o seu resumo diz que não compôs nada.

# text
# c1: [[phases]]
seg-002ddd72b3a2 = <c1/>: uma missão encadeada numa só cronologia

# text
# c1: [timeline] step_s
seg-e99c4453b79d = Cada fase executa um ou mais cenários sobre uma janela de uma cronologia de missão partilhada, por exemplo um relógio em holdover e um sistema de navegação inercial (INS) a deslizar ao mesmo tempo. As saídas de cada execução são lidas para <b>canais</b> com nome, colocadas no instante de início da fase e reamostradas para uma grelha comum (<c1/>) por retenção de ordem zero: um instante da grelha toma a amostra mais recente da execução da fase a que pertence, nesse instante ou antes dele, e é nulo quando nenhuma execução dessa fase fornece o canal.

# text
seg-842b77a21c5f = Canal

# text
seg-b2eb598fab2a = Fonte predefinida

# text
seg-f42465f7d066 = ns

# text
seg-fdb4600bf100 = erro de tempo do relógio

# text
seg-aef6b877191d = guarda de erro de tempo

# text
# c1: threshold_ns
seg-cc989ca58f1d = o <c1/> da própria execução

# text
seg-5e9f7cd33017 = razão média efetiva entre a portadora e a densidade de ruído (C/N0) nos satélites visíveis

# text
# c1: jamming
# c2: epochs[].sats[].cn0_effective_dbhz
seg-af6f07319f2d = <c1/>: média de <c2/>

# text
seg-f6b4ea158327 = piso de perda de seguimento

# text
# c1: jamming
# c2: tracking_threshold_dbhz
seg-126535297c32 = <c1/>: o <c2/> do cenário, quando o indica

# text
seg-f8f430695a88 = satélites ainda em seguimento

# text
seg-3f9a9f33010b = nível de proteção vertical

# text
seg-2cfc68fa1c15 = limite de alerta vertical

# text
seg-d165177a255c = erro de posição

# text
seg-29651ae6be6f = limiar de erro de posição

# text
seg-c893c5e3ace5 = { "1" } enquanto algum monitor da fase der alarme

# text
seg-ade1d7072512 = ver abaixo

# text
# c1: <side>
# c2: classical
# c3: side = "quantum"
# c4: [[phases.runs.series]]
# c5: []
# c6: epochs[].t
# c7: input:
# c8: mean
# c9: min
# c10: max
# c11: count
seg-e8c7ac7d117f = <c1/> é <c2/> a menos que a execução defina <c3/>. Qualquer outra grandeza é lida com uma entrada <c4/> explícita: um caminho temporal com um <c5/> que indica as linhas (<c6/>), um caminho de valores que partilha essas linhas ou um escalar difundido a todas as linhas (o prefixo <c7/> lê o cenário da execução em vez do seu resultado), uma redução opcional (<c8/>, <c9/>, <c10/>, <c11/>) para vários valores numa só linha, uma escala e uma unidade para um canal que a campanha não conhece.

# text
seg-7d7bc5d19a61 = Os <b>alarmes</b> vêm de três origens, combinadas por OU lógico dentro de uma fase:

# text
# c1: jamming
# c2: integrity
seg-74a10f5283ec = indicadores predefinidos lidos da execução: <c1/> dá alarme enquanto menos de quatro satélites estão em seguimento (a sua própria definição de disponibilidade); <c2/> dá alarme nas épocas que marca como indisponíveis;

# text
# c1: carry
# c2: clock
# c3: guard_ns
# c4: gnss-ins
# c5: position_threshold_m
# c6: [[phases.runs.alarms]]
seg-f22be2880015 = regras predefinidas sobre os canais da fase, avaliadas <b>depois</b> de <c1/>: <c2/> dá alarme enquanto o erro de tempo absoluto excede <c3/>; <c4/> enquanto o erro de posição excede <c5/>; as regras explícitas vão em <c6/>;

# text
# c1: spoof
# c2: detect_time_s
# c3: spoof-detect
seg-ccd94a7cb652 = eventos de alarme: <c1/> gera um no <c2/> do seu monitor assistido por relógio; <c3/> gera um no início da fase quando a sua decisão fundida alerta.

# text
seg-f88b8ad5672f = <b>O estado é transmitido</b> entre fases de três formas explícitas:

# text
# c1: carry = ["time_error_ns"]
seg-0e3a0ee8e172 = <c1/> soma o valor do canal no fim da fase anterior aos valores que esta fase tem dele. A fase de relógio que um spoofer deslocou é o ponto de onde parte o holdover. Somar o desvio é exato para a fase do relógio, que integra a frequência; para um erro de posição, pressupõe que os dois erros são colineares, o caso pessimista.

# text
# c1: [[phases.handoff]]
# c2: channel:<name>
seg-4db8b11391a5 = <c1/> escreve um número da fase anterior (<c2/> para o valor final de um canal, ou qualquer caminho de resultado de uma execução anterior) numa chave com pontos do cenário desta fase antes de ela ser executada, com uma escala e um desvio opcionais.

# text
# c1: end_at = "<result path>"
# c2: duration_s
# c3: classical.detect_time_s
seg-fdd5aa8b9627 = <c1/> termina a fase num instante calculado por uma execução, limitado por <c2/>. A missão incluída termina a sua fase de spoofing em <c3/>.

# text
# c1: skip_s
seg-cdd64676f509 = <c1/> descarta os primeiros segundos da cronologia própria de uma execução (um aquecimento) antes do instante zero da fase.

# text
seg-d48bcd9890d3 = A missão incluída

# text
# c1: scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-52fc5abca41f = <c1/> executa { "18" } cenários membros ao longo de seis fases numa grelha de { "10" } s:

# text
seg-baea4e05ad26 = Fase

# attr:aria-label, text
seg-9d3ee6a5613e = Execuções

# text
seg-87fbeeb9abb9 = O que a cronologia mostra

# text
seg-82bebc2bb038 = nominal, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-cf54dae64cb7 = <c1/>, <c2/> (sem emissor de jamming), <c3/>

# text
seg-5cb80e4a7d4d = erro de tempo { "0" } ns; C/N0 { "43.0" } dB-Hz face a um piso de { "25" } dB-Hz; nível de proteção vertical de { "9.1" } a { "21.6" } m face a um limite de alerta de { "50" } m

# text
seg-13c92a72544a = jamming, { "600" } s

# text
seg-f9c01304734d = o mesmo, emissor de jamming a -30 dBW, { "1" } km

# text
seg-27d3b65152b0 = C/N0 desce para { "27.7" } dB-Hz, todos os { "8" } satélites ainda em seguimento

# text
# c1: end_at
seg-6a052db03815 = spoofing, terminado aos { "370" } s por <c1/>

# text
# c1: spoof
# c2: spoof-detect
# c3: jamming
seg-89856c1f83f8 = <c1/> (rampa de tempo de { "0.1" } ns/s), <c2/>, <c3/>

# text
seg-cfcdd96b1132 = o erro de tempo sobe em rampa até { "36" } ns; o detetor de radiofrequência dá alarme no início da fase, o monitor assistido por relógio aos { "370" } s

# text
seg-92c8a76b84c2 = holdover, { "1800" } s

# text
# c1: clock
# c2: gnss-ins
# c3: jamming
seg-8a6e0b2898d1 = <c1/> (negado, transporta { "37.0" } ns), <c2/> (unidade tática a deslizar), <c3/> a { "10" } dBW

# text
seg-1948491e25ec = todos os satélites perdidos (C/N0 de cerca de -12 dB-Hz); erro de tempo de { "36.4" } a { "62.7" } ns face à guarda de { "50" } ns; erro de posição até { "24" } km

# text
seg-93e59087dd44 = alarme de integridade, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-f28f37baf8fe = <c1/> (transporta { "59.6" } ns), <c2/> e <c3/> com uma máscara de { "25" } graus

# text
seg-83d890c819f8 = { "5" } satélites em seguimento; nível de proteção de { "19" } a { "135" } m, em falta em { "18" } de { "60" } instantes da grelha; o erro de tempo transportado, de { "52.1" } a { "61.7" } ns, permanece acima da guarda de { "50" } ns, pelo que o alarme está ativo durante toda a fase

# text
seg-1ab40b7893db = recuperação, { "600" } s

# text
seg-181d2a2f800b = erro de tempo de volta a { "0" } ns; alarme em silêncio

# text
# c1: integrity
seg-26ef3dc422ff = As execuções de integridade usam a trajetória de utilizador própria do exemplo <c1/> (uma trajetória circular a { "0.4" } km de altitude), e não o local fixo do recetor de jamming, e a máscara de { "25" } graus representa o céu parcial de um recetor que está a readquirir. São escolhas de cenário, indicadas no ficheiro.

# text
seg-03ae98f17988 = Uma missão conduzida pelo espectro da banda L

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: jamming
# c4: scenarios/l-band-waterfall-jamming.toml
seg-5daf8c8fdd83 = <c1/> executa { "8" } cenários membros ao longo de três fases numa grelha de { "1" } s, com o C/N0 do GPS L1 C/A e do Galileo E1 lido a partir do tipo de cenário <c2/> (ver <a1>SPECTRUM.md</a1>) e não a partir da tabela por satélite do tipo de cenário <c3/>. Os emissores de jamming são os de <c4/>.

# text
# c1: end_at
seg-7f34a00af961 = início, terminado aos { "10" } s por <c1/>

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-471ec0d86f76 = <c1/>, <c2/> (chirp a partir dos { "10" } s), <c3/>

# text
# c1: timeline.bands[0].first_loss_t_s
seg-00b032242ebc = L1 C/A { "43.48" } e E1 { "44.73" } dB-Hz; a fase termina na primeira perda de L1 C/A da própria execução de espectro (<c1/>); nível de proteção de { "21.6" } m face a { "50" } m

# text
seg-50220d719d5d = holdover, { "600" } s

# text
# c1: clock
# c2: spectrum
seg-50de7cd69ac0 = <c1/> (negado, transporta o erro de início, { "0" } ns aqui), <c2/> (chirp ativo)

# text
seg-1d59e94d94e5 = L1 C/A { "3.38" } e E1 { "4.44" } dB-Hz, ambos abaixo do piso de { "25" } dB-Hz; erro de tempo de -0.07 a { "5.06" } ns face à guarda de { "50" } ns; alarme ativo

# text
seg-6c56497d74fb = recurso ao Galileo, { "300" } s

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-62bcfd3e8732 = <c1/> (ressincronizado), <c2/> (tom CW na portadora L1), <c3/> numa Walker 24/3/1 semelhante ao Galileo

# text
seg-d455f0c06ee6 = L1 C/A mantido em { "17.98" } dB-Hz, E1 de volta a { "44.73" } dB-Hz; nível de proteção de { "6.1" } a { "17.7" } m; alarme em silêncio

# text
seg-2db37e292efe = A recuperação de E1 sob o tom CW assenta no tratamento de espectro contínuo do tipo de cenário de espectro: o tom situa-se no nulo do espectro MBOC e não acopla nada. Um tom real acoplar-se-ia através das riscas espectrais do código; isso está indicado no ficheiro e em SPECTRUM.md.

# text
# c1: [sweep]
seg-fb8d8636c554 = <c1/>: uma grelha de parâmetros sobre qualquer tipo de cenário

# text
# c1: sweep-nd
# c2: runs > 1
# c3: k
# c4: k
# c5: scenarios/campaign-sweep-jammer-power.toml
seg-b14a11d60e9f = De uma a três chaves de cenário com pontos, cada uma sobre um intervalo linear ou logarítmico, nos mesmos valores de eixo que o tipo de cenário <c1/> usa. Cada eixo tem um nome e uma unidade; cada métrica tem um nome e um caminho de resultado, e a sua unidade é lida do bloco de unidades do próprio tipo de cenário varrido, a menos que a campanha declare uma. Com <c2/>, cada nó é um conjunto de Monte Carlo com semente (realização <c3/> na semente do nó mais <c4/>), apresentado com as estatísticas abaixo. <c5/> varre um emissor de jamming a { "1" } km do recetor, de -50 a +{ "10" } dBW: a razão média entre o jammer e o sinal varia exatamente { "1" } dB por dB ({ "12.2" } a { "72.2" } dB), e a disponibilidade desce de { "1" } para { "0" } entre -30 e -25 dBW.

# text
# c1: system.2.sisre_m
# c2: sisre_m
# c3: [[system]]
# c4: case.0.system.0.shell.0.altitude_km
seg-c1931e311cca = Uma chave com pontos pode indexar por posição uma matriz de tabelas: <c1/> é o <c2/> da terceira tabela <c3/>, e <c4/> desce três níveis.

# text
# c1: [monte_carlo]
seg-e774c578906d = <c1/>: um conjunto com semente

# text
# c1: k
# c2: base_seed + k
# c3: classical.series[-1].error_ns
seg-bbacb9c66f92 = A realização <c1/> executa o cenário com a sua chave de semente definida como <c2/>, a convenção que o conjunto de relógios já usa, de modo que o conjunto se reproduz exatamente. Cada métrica indica a média, o desvio-padrão populacional, os percentis 5, 50 e 95 por posto mais próximo, um intervalo de confiança de { "95" }% por bootstrap de percentis com semente fixa para a média ({ "2000" } reamostragens) e, por predefinição, todas as amostras por ordem de semente. Os caminhos de resultado podem indexar matrizes: <c3/> é a última amostra.

# text
# c1: [compose]
seg-ed182d15151d = <c1/>: vários cenários sob condições partilhadas

# text
# c1: scenarios/campaign-shared-jammer-sea-road.toml
seg-26fab14de534 = Os valores partilhados com nome (um número ou uma matriz de números, com uma unidade) são escritos em cada membro nas chaves a que os associa, de modo que os membros não possam discordar quanto à condição partilhada. Todos os membros são executados e, para cada métrica, o resumo combinado indica o valor mínimo, máximo e médio entre os membros, nomeando o melhor e o pior. <c1/> coloca um emissor de jamming de { "8" } dBW entre um navio no Golfo da Finlândia (a cerca de { "30" } km) e um automóvel numa estrada costeira de Helsínquia (a cerca de { "50" } km): o navio perde todos os satélites (razão média entre o jammer e o sinal de { "39.0" } dB), enquanto o automóvel mantém pelo menos quatro ({ "34.6" } dB).

# text
# c1: [optimize]
seg-c888630c92d7 = <c1/>: o melhor valor de uma métrica

# text
# c1: [lo, hi]
# c2: lin
# c3: log
# c4: goal = "minimize"
# c5: "maximize"
# c6: "target"
# c7: target
seg-b54f0deedd0f = Procura-se o melhor valor de uma métrica (<c4/>, <c5/> ou <c6/>, que minimiza a distância a <c7/>) em uma a três chaves de cenário com pontos, cada uma limitada a <c1/> numa escala <c2/> ou <c3/>.

# text
seg-b57ec5e5168a = Existem dois métodos:

# text
# c1: method = "grid"
# c2: steps
seg-8fba07ce0cde = <c1/> executa todos os nós de uma grelha com <c2/> por chave, nos valores de eixo da varredura.

# text
# c1: method = "nelder-mead"
# c2: max_evals
# c3: step
# c4: ftol
# c5: xtol
seg-844a7c1e3578 = <c1/> (o predefinido) executa um simplex de Nelder–Mead determinista em coordenadas normalizadas para [{ "0" }, { "1" }] por chave. Os pontos de ensaio são projetados sobre a caixa. A secção aceita <c2/>, um <c3/> inicial e as tolerâncias de paragem <c4/> e <c5/>.

# text
# c1: runs > 1
# c2: best_coords
# c3: best_metric
# c4: best_score
# c5: evals
# c6: stop_reason
# c7: trace
seg-2b1159b467f8 = Uma execução cuja métrica está ausente ou não é finita recebe a pior pontuação e fica guardada no rasto. Com <c1/>, a métrica é a média sobre as mesmas sementes em cada avaliação. O resultado indica <c2/>, <c3/>, <c4/>, <c5/>, <c6/> e todas as avaliações em <c7/>.

# text
# c1: scenarios/campaign-optimize-link-budget.toml
seg-778a40736e7b = <c1/> procura o alcance e a taxa de dados para uma margem de ligação de { "3" } dB. O ótimo é local à caixa e ao ponto de partida. É MODELLED, nunca uma afirmação global.

# text
# c1: docs/design/evidence/cap32-optimize/
# c2: tests/campaign_optimize_reference.rs
seg-b94ab5e6dad4 = O protocolo e os seus limiares fixados antecipadamente estão em <c1/>. O teste é <c2/>. Os resultados:

# text
seg-232c68472fa4 = uma resolução de alvo 1-D concorda com a forma fechada até { "6e-15" };

# text
seg-22f7abf70fc4 = o método da grelha concorda bit a bit com um ciclo de força bruta independente;

# text
seg-faea43f01e37 = o simplex faz pelo menos tão bem como a grelha de { "41" } × { "41" }, em cerca de um décimo das suas execuções.

# text
seg-df1533fe6b95 = O limiar 1-D da ronda { "1" } é registado como NOT MET: a caixa fixada antecipadamente excluía a solução.

# text
# c1: scenario_hash
# c2: reproducibility
# c3: run_digest
# c4: scenario_hash
seg-0862a4e9aa61 = Todos os resultados de campanha incluem <c1/>, o SHA-256 (Secure Hash Algorithm { "2" }, resumo de 256 bits) da forma canónica em JavaScript Object Notation (JSON) do documento da campanha (a ordem das chaves e a formatação não o alteram), e um bloco <c2/> com o número de execuções de membros e <c3/>, um SHA-256 sobre o resumo de cada resultado de membro pela ordem de despacho. Duas execuções com o mesmo resumo produziram resultados de membros idênticos byte a byte. Cada execução de fase regista ainda o seu tipo de cenário, o seu próprio <c4/> quando o tipo o tem, e o SHA-256 do seu documento de resultados. Todos os números do documento têm uma entrada de unidades.

# text
seg-2eeddb87e889 = O núcleo é sequencial e não lê ficheiros, pelo que uma campanha executa-se sem alterações na compilação WebAssembly. As campanhas não podem conter campanhas.

# text
seg-f9b8b78dd64a = Exportações

# text
# c1: --export
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
seg-c4443bf160f7 = <c1/> numa campanha escreve cada cenário membro que tenha geometria como o seu próprio conjunto de ficheiros, com a etiqueta do membro inserida antes do sufixo do formato: cada execução de fase (<c2/>, ou <c3/> quando a fase tem várias execuções), o cenário de base da varredura (<c4/>), o cenário de Monte Carlo (<c5/>) e cada membro composto (com a sua própria etiqueta, e com os valores partilhados a que está associado escritos). Um membro idêntico a um anterior é escrito uma só vez; as transferências entre fases e os valores de varredura ou de semente aplicados em tempo de execução não constam dos cenários exportados.

# text
seg-0ba270495309 = Um formato que nenhum dos membros consiga descrever é recusado com essa razão. A tabela por cenário está em <a1>INTEROP.md</a1>.

# text
seg-c20904c9d3b5 = Campanhas LEO-PNT

# text
seg-a598e2c06f51 = Quinze campanhas incluídas enquadram questões de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO); <a1>LEO-PNT.md</a1> descreve o que cada uma mostra. O que cada uma executa, tal como a linha de comandos o resume:

# text
seg-f65b1f2b4182 = Modo

# text
seg-e7d7defa7e71 = Questão

# text
seg-08ab59acfe62 = composição, { "4" } membros

# text
seg-a21e4db0fda9 = dados de serviço da mensagem de navegação face ao comprimento da trama

# text
# c1: leo-pvt
seg-6c29f4690d2c = varredura de <c1/>, { "7" } nós

# text
seg-97fba77aa2ec = posicionamento fundido MEO e LEO face ao erro de alcance do sinal no espaço (SISRE) LEO

# text
seg-7b9fbe34d38c = composição, { "2" } membros

# text
seg-28352bd0c9e3 = LEO-PNT em interiores por banda e classe de edifício

# text
# c1: leo-pass
seg-a447c56022ec = varredura de <c1/>, { "9" } nós

# text
seg-5b3cbfced221 = energia por posição da Internet das Coisas (IoT) face à potência de transmissão UHF LEO

# text
# c1: ntn-positioning
seg-3ebd95e5933a = varredura de <c1/>, { "9" } nós

# text
seg-cfbac004ff64 = posicionamento em redes não terrestres (NTN) face à largura de banda do sinal de referência

# text
# c1: leo-ppp
seg-07e8765975d1 = varredura de <c1/>, { "3" } nós

# text
seg-db872d35033e = convergência do posicionamento preciso de ponto (PPP) face à altitude de uma camada LEO de 192 satélites

# text
seg-a4ec677dc4e6 = cadeia, { "3" } fases ao longo de { "2100" } s

# text
seg-2d91ecf8455d = Sistema Global de Navegação por Satélite (GNSS) sob jamming, a camada LEO assegura o utilizador, integridade mantida

# text
# c1: spectrum
seg-c44991a2a24e = varredura de <c1/>, { "13" } nós

# text
seg-4b6e292d88f5 = diversidade de bandas LEO face a um emissor de jamming de barragem na banda L

# text
seg-30d86b528bee = os monitores de spoofing face a quatro emissores de spoofing

# text
seg-1690baf3a1b8 = cadeia, { "1" } fase ao longo de { "86 400" } s

# text
seg-4d5b507c04de = temporização de estações de base 5G: holdover e tempo LEO

# text
seg-d32a80c40470 = cadeia, { "3" } fases ao longo de { "1440" } s

# text
seg-c38f9d3bd54e = seguimento de contentores com UHF LEO: energia por posição ao longo de uma viagem

# text
seg-9bf38e403696 = cadeia, { "2" } fases ao longo de { "1500" } s

# text
seg-dea7117552f4 = um veículo autónomo num desfiladeiro urbano com uma camada LEO

# text
seg-dbbd9ffcbfb4 = cadeia, { "2" } fases ao longo de { "1800" } s

# text
# c1: city-street
seg-37c0c3570023 = o mesmo desfiladeiro urbano como um corte plano de { "35" } graus e como um horizonte de edifícios <c1/>

# text
seg-ccaa34122145 = cadeia, { "2" } fases ao longo de { "87 000" } s

# text
seg-d16d8b2e9089 = temporização de infraestruturas críticas: holdover com tempo LEO

# text
seg-4ee0b3036f4a = cadeia, { "3" } fases ao longo de { "10 800" } s

# text
seg-157c5bec7f5f = utilizadores polares e árticos com uma camada LEO polar

# text
seg-64404160d0e7 = cadeia, { "3" } fases ao longo de { "2520" } s

# text
seg-a35e1603ba32 = utilizadores ferroviários e marítimos com uma camada LEO

# text
seg-3d819fa3fd1c = MEO é órbita terrestre média, UHF frequência ultra-alta e 5G a quinta geração de redes móveis.

# text
seg-490920844143 = O que é verificado

# text
# c1: tests/campaign_composition_reference.rs
seg-483b1d4efb20 = <c1/> fixa as identidades de composição:

# text
# c1: clock
# c2: integrity
# c3: jamming
# c4: run_toml
seg-881d97a3fa2b = <b>Uma campanha de uma só fase reproduz a execução autónoma bit a bit.</b> Para <c1/>, <c2/> e <c3/>, o documento de resultados do membro é idêntico byte a byte a <c4/> sobre o ficheiro de cenário, o seu resumo é o que a campanha indica e, com a grelha ao passo da própria execução, cada valor alinhado é igual ao valor da série autónoma (o C/N0 de jamming é igual à média calculada de forma independente a partir do documento autónomo).

# text
seg-1a9e1ed5b18c = <b>Uma varredura de um só nó e uma composição de um só membro</b> leem exatamente o número autónomo.

# text
# c1: k
# c2: seed + k
seg-883bb72e1239 = <b>Um conjunto de semente fixa é estável byte a byte</b>, e a realização <c1/> é exatamente a execução autónoma em <c2/>; o hash da campanha ignora a ordem das chaves.

# text
seg-170bc86059fa = Um caso analítico.

# text
# c1: scenarios/campaign-monte-carlo-clock-holdover.toml
seg-0fd27291d6f4 = <c1/> executa { "200" } sementes de um relógio atómico à escala de chip com apenas ruído branco de frequência (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), sincronizado até aos { "590" } s e a deslizar até aos { "3600" } s. O erro de tempo final é gaussiano com média { "0" } e desvio-padrão sqrt(q_wf * { "3010" } s) = { "16.459" } ns (o passeio aleatório da fase sob ruído branco de frequência, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). O intervalo apresentado, [-2.52, { "1.59" }] ns, contém a verdadeira média { "0" }; o desvio-padrão amostral, { "14.93" } ns, dá uma estatística de qui-quadrado de { "164.5" } com { "199" } graus de liberdade, dentro do intervalo bilateral de { "99" }% [{ "151.37" }, { "254.14" }]. Com { "3000" } sementes, o mesmo cenário dá { "16.31" } ns.

# text
seg-61b54a16243f = <b>A cadeia conduzida pelo espectro</b> lê os números autónomos: a fase de início dura exatamente o tempo da primeira perda da execução de espectro, e cada valor de L1 C/A e de E1 na cronologia é igual, até { "1e-9" } dB, à linha do exemplo autónomo de cascata para o mesmo estado do emissor de jamming (nominal, só chirp, só tom CW).

# text
seg-5ebc02a24ce1 = <b>A cadeia</b> transmite o estado tal como documentado: a fase de spoofing dura exatamente o tempo de deteção da execução de spoofing, o holdover transporta exatamente o desvio da execução de spoofing na deteção, a recuperação não transporta nada, e o alarme está ativo sempre que o nível de proteção está em falta ou excede o limite de alerta.

# text
seg-153e28bcb38a = Estas verificações mostram que compor não altera nada que não devesse. Não validam uma missão encadeada face a uma medida, razão pela qual as três linhas de campanha em <a1>VERIFICATION-MATRIX.md</a1> são MODELLED.

# text
seg-e82860f2d902 = <s1>Anterior</s1>Utilizar TLE reais

# text
seg-e40757a0b4cb = <s1>Seguinte</s1>Relatórios de execução

# text
seg-e65edbaca6bf = [[phases]]: uma missão encadeada numa só cronologia

# text
seg-a433ddf74e55 = [sweep]: uma grelha de parâmetros sobre qualquer tipo de cenário

# text
seg-7ca90ac531bf = [monte_carlo]: um conjunto com semente

# text
seg-03d764a4cb56 = [compose]: vários cenários sob condições partilhadas

# text
seg-61a0db2550ba = [optimize]: o melhor valor de uma métrica
