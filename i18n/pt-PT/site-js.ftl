# site-js.ftl (pt-PT): translations

# src/js/t.mjs:4
js-app-engine-failed = Não foi possível carregar o motor ({ $reason }).

# src/js/t.mjs:5
js-ledger-rows =
    { $n ->
        [one] { $n } linha do registo
        [many] { $n } de linhas do registo
       *[other] { $n } linhas do registo
    }

# src/site.js:373
js-site-action-copy-install = Copiar: cargo install kshana

# src/site.js:371
js-site-action-launch = Iniciar { $name }

# src/site.js:375
js-site-action-licence = Fale connosco sobre uma licença comercial

# src/site.js:374
js-site-action-pro-eval = Pedir uma avaliação do Kshana Pro

# src/site.js:376
js-site-action-study = Pedir um estudo

# src/site.js:372
js-site-action-theme = Alternar entre tema claro e escuro

# src/js/capabilities.mjs:689
js-site-capabilities-bd-after = { $m } m após { $s } s

# src/js/capabilities.mjs:675
js-site-capabilities-bd-combined = combinado

# src/js/capabilities.mjs:680
js-site-capabilities-bd-crossing = { $m } m aos { $s } s

# src/js/capabilities.mjs:694
js-site-capabilities-bd-fig-crossing = «{ $m } m» após { $s } s, dominado por { $dom }

# src/js/capabilities.mjs:693
js-site-capabilities-bd-fig-lead = Tempo desde a perda do GNSS, em eixo logarítmico, para uma IMU de classe { $grade } a { $speed } m/s:

# src/js/capabilities.mjs:695
js-site-capabilities-bd-fig-tail = As linhas são as leis de crescimento em deriva curta do motor e a sua raiz da soma dos quadrados; os cruzamentos provêm do seu modelo de erro completo de nove estados (Schuler), que limita os termos de polarização, pelo que, em derivas longas, cada cruzamento surge um pouco mais tarde do que a linha o atinge. As barras: os mesmos cruzamentos para quatro classes de IMU.

# src/js/capabilities.mjs:816
js-site-capabilities-cd-canvas-aria = Constelação em torno do seu corpo, com imagens reais: arraste ou use as teclas de seta para rodar, e mais e menos para ampliar

# src/js/capabilities.mjs:746
js-site-capabilities-cd-design-meta = { $n } satélites · { $body } · { $file }

# src/js/capabilities.mjs:788
js-site-capabilities-cd-foot-frozen = Cada satélite segue a trajetória do próprio motor; o raio da órbita congelada resulta dos elementos da camada.

# src/js/capabilities.mjs:789
js-site-capabilities-cd-foot-mean-motion = Cada satélite segue a trajetória do próprio motor, no raio que o seu movimento médio implica.

# src/js/capabilities.mjs:786
js-site-capabilities-cd-foot-walker = Todos os { $n } satélites são colocados a partir dos parâmetros Walker próprios das camadas (verificados face às { $shown } trajetórias do motor: pior caso { $deg }°); os rastos são as { $shown } trajetórias do motor.

# src/js/capabilities.mjs:819
js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satélites

# src/js/capabilities.mjs:820
js-site-capabilities-cd-hud-mission = Missão «{ $time }»

# src/js/capabilities.mjs:782
js-site-capabilities-cd-legend-shell = camada { $n } · { $inc }°

# src/js/capabilities.mjs:803
js-site-capabilities-cd-map-availability = Fração da execução com PDOP ≤ { $limit } (0 a 100 %)

# src/js/capabilities.mjs:804
js-site-capabilities-cd-map-pdop = PDOP médio por célula de { $step }° ({ $lo } a { $hi }; mais claro é melhor)

# src/js/capabilities.mjs:805
js-site-capabilities-cd-map-visible = Média de satélites à vista ({ $lo } a { $hi })

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-availability = Disponibilidade

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-pdop = PDOP médio

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-visible = À vista

# src/js/capabilities.mjs:809
js-site-capabilities-cd-no-webgl = A vista 3D requer WebGL; o mapa de cobertura e os valores são da mesma execução.

# src/js/capabilities.mjs:812
js-site-capabilities-cd-pause = Pausar as órbitas

# src/js/capabilities.mjs:812
js-site-capabilities-cd-play = Reproduzir as órbitas

# src/js/capabilities.mjs:749
js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

# src/js/capabilities.mjs:750
js-site-capabilities-cd-slots = { $name }: { $n } satélites, tabela de posições do operador

# src/js/capabilities.mjs:784
js-site-capabilities-cd-span = de { $dur }, em ciclo

# src/js/capabilities.mjs:770
js-site-capabilities-cd-stat-in-view = Média à vista

# src/js/capabilities.mjs:771
js-site-capabilities-cd-stat-mask = Máscara · execução

# src/js/capabilities.mjs:769
js-site-capabilities-cd-stat-median = PDOP mediano

# src/js/capabilities.mjs:767
js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, { $body } inteiro

# src/js/capabilities.mjs:766
js-site-capabilities-cd-stat-satellites = Satélites

# src/js/capabilities.mjs:768
js-site-capabilities-cd-stat-worst = Pior local

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-gnss = Quatro GNSS em conjunto

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-leo = Megaconstelação em órbita terrestre baixa

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-lunar = Conjunto de retransmissores lunares

# src/js/capabilities.mjs:779
js-site-capabilities-cd-work-ratio = { $pct } % após o pré-filtro de latitude · { $dop } soluções DOP

# src/js/capabilities.mjs:778
js-site-capabilities-cd-work-tests = { $after } testes de ponto de satélite, em vez dos { $brute } que um varrimento exaustivo faria

# src/js/capabilities.mjs:777
js-site-capabilities-cd-work-title = Trabalho de visibilidade

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-sub = C/N0 face ao limiar de seguimento

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-title = Densidade portadora-ruído

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-availability = Disponibilidade

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-fewest = Menos seguidos

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-js = J/S médio

# src/js/capabilities.mjs:1037
js-site-capabilities-cg-compose-text = Um emissor de interferência, { $power } { $unit }, num só local, associado a { $n } execuções membro do tipo ‹{ $kind }›: um navio num estreito e um automóvel numa estrada costeira veem a mesma causa e obtêm respostas diferentes.

# src/js/capabilities.mjs:973
js-site-capabilities-cg-log-campaign = campanha { $file } · { $phases } fases · { $runs } execuções membro

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase = a fase { $name } começa

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase-carries = a fase { $name } começa · transporta { $carried }

# src/js/capabilities.mjs:1017
js-site-capabilities-cg-monte-axis = erro final do relógio em { $n } sementes ({ $path })

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-ci = Média, intervalo de 95 %

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-mean = Média

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p05 = 5.º

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-p05-p95 = 5.º a 95.º

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p50 = mediana

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p95 = 95.º

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-std = Desvio-padrão

# src/js/capabilities.mjs:1020
js-site-capabilities-cg-monte-text = O mesmo cenário ‹{ $kind }› executado { $n } vezes a partir da semente base { $seed }, uma semente por execução: a dispersão do erro final do relógio em funcionamento livre, com o seu intervalo de confiança de 95 % para a média.

# src/js/capabilities.mjs:969
js-site-capabilities-cg-not-in-phase = não está nesta fase

# src/js/capabilities.mjs:972
js-site-capabilities-cg-now = Fase { $n } de { $total }: { $name } · { $from } a { $to }

# src/js/capabilities.mjs:940
js-site-capabilities-cg-phase-title = { $name }: { $from } a { $to } · terminada por { $by } · tipos membros { $kinds }

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-sub = face ao limite de alerta

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-title = Nível de proteção

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-sub = face ao seu orçamento · log

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-title = Erro de posição inercial

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-range = { $lo } a { $hi }

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-all-lost = Todos perdidos a partir de

# src/js/capabilities.mjs:998
js-site-capabilities-cg-sweep-axis = potência de emissão do emissor de interferência ({ $key })

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-first-loss = Primeira perda

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-availability = disponibilidade

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-js = J/S médio

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-never = nunca

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-nodes = Nós

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-none = nenhum

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-span = Intervalo J/S

# src/js/capabilities.mjs:1002
js-site-capabilities-cg-sweep-text = Um cenário ‹{ $kind }›, executado uma vez por nó, à medida que a potência de emissão do emissor de interferência passa de { $from } a { $to } { $unit }. A disponibilidade sob interferência (linha contínua) e o J/S médio (tracejada) resultam das figuras de mérito próprias de cada execução membro.

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-sub = face à sua margem de guarda

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-title = Erro de tempo do relógio

# src/js/capabilities.mjs:109
js-site-capabilities-copy = Copiar

# src/js/capabilities.mjs:108
js-site-capabilities-copy-aria = Copiar o comando que reproduz a execução: kshana { $file }

# src/js/capabilities.mjs:1387
js-site-capabilities-cz-best = Melhor PDOP

# src/js/capabilities.mjs:1374
js-site-capabilities-cz-failed = Não foi possível carregar aqui a execução registada; abra-a antes no Studio.

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix = Amostras com solução de posição

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix-value = { $n } de { $total } ({ $pct }%)

# src/js/capabilities.mjs:1388
js-site-capabilities-cz-median = PDOP mediano

# src/js/capabilities.mjs:90
js-site-capabilities-engine = Motor v{ $version }

# src/js/capabilities.mjs:91
js-site-capabilities-engine-build = Motor v{ $version }, compilação

# src/js/capabilities.mjs:104
js-site-capabilities-engine-report = Relatório do motor

# src/js/capabilities.mjs:1287
js-site-capabilities-globe-aria = { $name } nas suas imagens reais ({ $credit }). Arraste ou use as teclas de seta para o rodar; mais e menos para ampliar.

# src/js/capabilities.mjs:1334
js-site-capabilities-ho-ends = a execução termina a { $t }

# src/js/capabilities.mjs:1337
js-site-capabilities-ho-past-guard = para além da margem de guarda

# src/js/capabilities.mjs:92
js-site-capabilities-no-seed = determinista, sem semente

# src/js/capabilities.mjs:96
js-site-capabilities-open-in-studio = Abrir no { $studio }

# src/js/capabilities.mjs:104
js-site-capabilities-open-report = Abrir o relatório do motor

# src/js/capabilities.mjs:1186
js-site-capabilities-orrery-aria = O sistema solar na época da execução: arraste ou use as teclas de seta para rodar, e mais e menos para ampliar

# src/js/capabilities.mjs:1228
js-site-capabilities-orrery-bodies = { $n } corpos · observador «{ $observer }»

# src/js/capabilities.mjs:1227
js-site-capabilities-orrery-epoch = Época «{ $epoch }» · TDB (Tempo Dinâmico Baricêntrico), data juliana { $jd }

# src/js/capabilities.mjs:1134
js-site-capabilities-pnt-chart-title = retransmissores à vista (linha) · Terra acima do horizonte (sombreado) · quatro necessários para uma solução de posição

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-kicker = Posicionamento neste corpo · tipo body-pnt

# src/js/capabilities.mjs:1124
js-site-capabilities-pnt-lander = Um módulo de aterragem a { $lat }°, { $lon }° na superfície navega com os retransmissores, com uma medição de distância bidirecional a partir da Terra sempre que a Terra está acima do horizonte (tempo de luz unidirecional { $min } min). Disponibilidade: { $a } % apenas com os retransmissores, { $b } % com a ligação à Terra.

# src/js/capabilities.mjs:1125
js-site-capabilities-pnt-orbiter = Um utilizador em órbita navega com os retransmissores, com uma medição de distância bidirecional a partir da Terra sempre que a Terra está acima do horizonte (tempo de luz unidirecional { $min } min). Disponibilidade: { $a } % apenas com os retransmissores, { $b } % com a ligação à Terra.

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-relays = { $n } retransmissores a { $alt } km em torno de { $body }

# src/js/capabilities.mjs:97
js-site-capabilities-report-data = Relatório e dados

# src/js/capabilities.mjs:107
js-site-capabilities-result-data = Dados do resultado

# src/js/capabilities.mjs:78
js-site-capabilities-saved = Guardado { $name }

# src/js/capabilities.mjs:105
js-site-capabilities-scenario-file = Ficheiro de cenário

# src/js/capabilities.mjs:92
js-site-capabilities-seed = semente { $seed }

# src/js/capabilities.mjs:568
js-site-capabilities-six-clock-fig = «{ $id }» mantém a margem de guarda durante { $dur }

# src/js/capabilities.mjs:563
js-site-capabilities-six-clock-guard = margem de guarda de { $v } ns

# src/js/capabilities.mjs:605
js-site-capabilities-six-coast-budget = orçamento de { $m } m

# src/js/capabilities.mjs:606
js-site-capabilities-six-coast-denied = GNSS negado

# src/js/capabilities.mjs:609
js-site-capabilities-six-coast-fig = «{ $id }» dentro do orçamento durante { $s } s

# src/js/capabilities.mjs:527
js-site-capabilities-six-floor = limiar de seguimento

# src/js/capabilities.mjs:595
js-site-capabilities-six-integ-fig = «{ $ok }» de { $n } épocas disponíveis · limites de alerta de { $h } m na horizontal, { $v } m na vertical

# src/js/capabilities.mjs:590
js-site-capabilities-six-integ-limit = limite de alerta vertical

# src/js/capabilities.mjs:594
js-site-capabilities-six-integ-pl = nível de proteção vertical (contínua) e horizontal (tracejada)

# src/js/capabilities.mjs:534
js-site-capabilities-six-jam-effective = efetivos, { $n } satélites

# src/js/capabilities.mjs:535
js-site-capabilities-six-jam-fig = Seguidos «{ $min }» de { $max } à vista · disponibilidade sob interferência «{ $av }» (nominal { $nom }) · J/S médio «{ $js } dB»

# src/js/capabilities.mjs:533
js-site-capabilities-six-jam-nominal = nominal, sem emissor de interferência (tracejada)

# src/js/capabilities.mjs:581
js-site-capabilities-six-orbit-fig = Altitude «{ $lo }–{ $hi } km» · rasto no solo durante { $dur }

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-label = { $source } · { $n } amostras

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-sgp4 = SGP4 a partir de um conjunto de elementos de duas linhas

# src/js/capabilities.mjs:548
js-site-capabilities-six-spoof-detects = { $id } deteta

# src/js/capabilities.mjs:550
js-site-capabilities-six-spoof-fig = «{ $id }» deteta aos { $s } s (limite { $ns } ns)

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-angle = Ângulo a partir do Sol

# src/js/capabilities.mjs:1053
js-site-capabilities-ss-credit = Imagens: { $credits }. * O mapa não chega aos polos; a lacuna toma a cor média polar do mapa. Anéis de Saturno: { $ring } ({ $licence }).

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-days = { $v } dias

# src/js/capabilities.mjs:1076
js-site-capabilities-ss-frame-origin = Origem do referencial

# src/js/capabilities.mjs:1084
js-site-capabilities-ss-from-sun = Do Sol

# src/js/capabilities.mjs:1088
js-site-capabilities-ss-gloss = NAIF: o código de corpo do Navigation and Ancillary Information Facility da NASA. GM: parâmetro gravitacional. J2: termo de achatamento. Polo IAU: o polo de rotação da União Astronómica Internacional, como ascensão reta (RA) e declinação (Dec).

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-j2-none = nenhum publicado

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind-of = { $class } de { $parent } · NAIF { $naif }

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-light-time = Tempo de luz a partir de { $observer }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-link = { $from } a { $to }, tempo de luz unidirecional { $one }, ida e volta { $two }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Ligação que esta execução calcula:
        [many] Ligações que esta execução calcula:
       *[other] Ligações que esta execução calcula:
    }

# src/js/capabilities.mjs:1094
js-site-capabilities-ss-moons =
    { $n ->
        [one] A sua lua, à escala, na época
        [many] As suas luas, à escala, na época
       *[other] As suas luas, à escala, na época
    }

# src/js/capabilities.mjs:1106
js-site-capabilities-ss-nominal-error = erro nominal de { $km } km em distância

# src/js/capabilities.mjs:1103
js-site-capabilities-ss-north = Vista do norte da eclítica.

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period = Período orbital

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period-about = Período em torno de { $parent }

# src/js/capabilities.mjs:1086
js-site-capabilities-ss-pole = Polo IAU (RA, Dec)

# src/js/capabilities.mjs:1081
js-site-capabilities-ss-radius = Raio médio

# src/js/capabilities.mjs:1080
js-site-capabilities-ss-retrograde = { $v } h, retrógrada

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-rotation = Rotação sideral

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-years = { $v } anos

# src/js/capabilities.mjs:653
js-site-capabilities-st-bound = limite de { $v } m

# src/js/capabilities.mjs:660
js-site-capabilities-st-fig-none = { $n } épocas, nenhuma com o erro acima do seu limite. Na horizontal: o erro de posição verdadeiro; na vertical: o nível de proteção; ambos em eixos logarítmicos.

# src/js/capabilities.mjs:659
js-site-capabilities-st-fig-some = { $n } épocas, { $k } com o erro acima do seu limite. Na horizontal: o erro de posição verdadeiro; na vertical: o nível de proteção; ambos em eixos logarítmicos.

# src/js/capabilities.mjs:649
js-site-capabilities-st-limit = limite de alerta de { $m } m

# src/js/capabilities.mjs:650
js-site-capabilities-st-misleading = enganador: erro acima do limite

# src/js/capabilities.mjs:652
js-site-capabilities-st-normal = funcionamento normal

# src/js/capabilities.mjs:651
js-site-capabilities-st-unavailable = indisponível: limite acima do limite de alerta

# src/js/capabilities.mjs:1408
js-site-capabilities-studio-embedded = { $studio }, incorporado: a execução orbit-multignss

# src/js/capabilities.mjs:1406
js-site-capabilities-studio-load = Carregar o { $studio } aqui

# src/js/capabilities.mjs:1410
js-site-capabilities-studio-outline = Mostrar de novo a estrutura

# src/js/capabilities.mjs:259
js-site-capabilities-wave-chirp = chirp

# src/js/capabilities.mjs:259
js-site-capabilities-wave-cw = tom CW

# src/js/capabilities.mjs:260
js-site-capabilities-wave-noise = ruído

# src/js/capabilities.mjs:388
js-site-capabilities-wf-an-caption = linha T+{ $t } s · dB acima do limiar, escala logarítmica · pico da grelha inteira { $peak } dB

# src/js/capabilities.mjs:357
js-site-capabilities-wf-degraded = Degradado

# src/js/capabilities.mjs:364
js-site-capabilities-wf-degraded-low = degradado

# src/js/capabilities.mjs:134
js-site-capabilities-wf-failed = Não foi possível carregar aqui a execução registada.

# src/js/capabilities.mjs:247
js-site-capabilities-wf-grid = grelha

# src/js/capabilities.mjs:144
js-site-capabilities-wf-iq = Em T+{ $t } s, o motor desenha também o modelo como { $n } amostras IQ (em fase e em quadratura) em torno de { $mhz } MHz e confronta com ele uma estimativa de Welch ({ $segments } segmentos de { $nfft }): razão de potência integrada { $ratio }.

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-off = { $what } desligado

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-on = { $what } ligado

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · de { $on } s até ao fim

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

# src/js/capabilities.mjs:357
js-site-capabilities-wf-lost = Bloqueio perdido

# src/js/capabilities.mjs:364
js-site-capabilities-wf-lost-low = bloqueio perdido

# src/js/capabilities.mjs:392
js-site-capabilities-wf-max = { $peak } dB acima dele · escala logarítmica a partir de { $v0 } dB

# src/js/capabilities.mjs:358
js-site-capabilities-wf-no-jammer = sem emissor de interferência

# src/js/capabilities.mjs:239
js-site-capabilities-wf-now = agora

# src/js/capabilities.mjs:437
js-site-capabilities-wf-pause = Pausar a cascata

# src/js/capabilities.mjs:386
js-site-capabilities-wf-peak = pico { $v } dB

# src/js/capabilities.mjs:437
js-site-capabilities-wf-play = Reproduzir a cascata

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-previous = início da repetição · passagem anterior abaixo

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-start = início da repetição

# src/js/capabilities.mjs:364
js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

# src/js/capabilities.mjs:229
js-site-capabilities-wf-signal = sinal +{ $v } dB

# src/js/capabilities.mjs:395
js-site-capabilities-wf-summary = Execução registada de { $file }: { $bands } bandas, { $jammers } emissores de interferência durante { $seconds } segundos. A pior banda, { $worst }, desce para { $min } dB-Hz aos { $at } s; limiar de seguimento { $floor } dB-Hz.

# src/js/capabilities.mjs:416
js-site-capabilities-wf-tip-above = { $v } dB acima do limiar de ruído

# src/js/capabilities.mjs:417
js-site-capabilities-wf-tip-in = em { $bands }

# src/js/capabilities.mjs:357
js-site-capabilities-wf-tracking = Em seguimento

# src/js/capabilities.mjs:364
js-site-capabilities-wf-tracking-low = em seguimento

# src/js/cap-hero.mjs:60
js-site-caphero-aria = O sistema solar a partir da execução do sistema solar do motor em { $date }: o Sol e { $bodies } corpos a mover-se ao longo das trajetórias orbitais do motor; { $valid } das órbitas estão validadas face ao JPL Horizons.

# src/js/cap-hero.mjs:185
js-site-caphero-clock = +{ $days } dias · { $date }

# src/js/cap-hero.mjs:69
js-site-caphero-copy-command = Copiar comando

# src/js/cap-hero.mjs:69
js-site-caphero-copy-title = Copiar o comando que a reproduz

# src/js/cap-hero.mjs:79
js-site-caphero-credits = Distâncias comprimidas numa escala logarítmica, direções verdadeiras; corpos ampliados, rotação a uma cadência de visualização. Imagens: { $credits }; anéis de Saturno: { $ring } ({ $licence }).

# src/js/cap-hero.mjs:77
js-site-caphero-credits-summary = Créditos de escala e de imagens

# src/js/cap-hero.mjs:64
js-site-caphero-engine-build = Motor v{ $version }, compilação

# src/js/cap-hero.mjs:65
js-site-caphero-explore = Explorar todos os corpos

# src/js/cap-hero.mjs:67
js-site-caphero-file-title = O ficheiro de cenário que foi executado

# src/js/cap-hero.mjs:59
js-site-caphero-list-item = { $name }: { $label }, { $au } au do Sol na época, período orbital { $period }.

# src/js/cap-hero.mjs:58
js-site-caphero-list-item-light = { $name }: { $label }, { $au } au do Sol na época, período orbital { $period }, tempo de luz a partir de { $observer } { $light }.

# src/js/cap-hero.mjs:64
js-site-caphero-no-seed = determinista, sem semente

# src/js/cap-hero.mjs:72
js-site-caphero-open-in-studio = Abrir no { $studio }

# src/js/cap-hero.mjs:203
js-site-caphero-pause = Pausar as órbitas

# src/js/cap-hero.mjs:55
js-site-caphero-period-days = { $value } dias

# src/js/cap-hero.mjs:55
js-site-caphero-period-years = { $value } anos

# src/js/cap-hero.mjs:203
js-site-caphero-play = Reproduzir as órbitas

# src/js/cap-hero.mjs:52
js-site-caphero-rate = { $days } dias da execução por segundo

# src/js/cap-hero.mjs:52
js-site-caphero-rate-epoch = O referencial na época da execução

# src/js/cap-hero.mjs:135
js-site-caphero-read-distance = { $au } au do Sol

# src/js/cap-hero.mjs:136
js-site-caphero-read-light = tempo de luz a partir de { $observer } na época { $light }

# src/js/cap-hero.mjs:135
js-site-caphero-read-orbit = órbita { $period }

# src/js/cap-hero.mjs:64
js-site-caphero-seed = semente { $seed }

# src/site.js:239
js-site-copy-aria = Copiar: { $cmd }

# src/js/developers.mjs:41
js-site-developers-captured-from = capturado { $recorded } de

# src/js/developers.mjs:41
js-site-developers-engine-build = Motor v{ $version }, compilação

# src/js/developers.mjs:51
js-site-developers-exit-stamp = saída { $rc } · { $ms } ms

# src/js/developers.mjs:44
js-site-developers-file-open-in-studio = { $file }: abrir no { $studio }

# src/js/developers.mjs:45
js-site-developers-no-seed = (determinista, sem semente)

# src/js/developers.mjs:44
js-site-developers-open-in-studio = Abrir no { $studio }

# src/js/developers.mjs:89
js-site-developers-pause = Pausar a repetição

# src/js/developers.mjs:89
js-site-developers-play = Reproduzir a repetição

# src/js/developers.mjs:70
js-site-developers-replaying = # a reproduzir a sessão registada

# src/js/developers.mjs:45
js-site-developers-seed = (semente { $seed })

# src/js/developers.mjs:46
js-site-developers-what-runs-write = O que cada execução escreve

# src/js/editions.mjs:89
js-site-editions-builds-on-it = { $label } assenta nele

# src/js/editions.mjs:74
js-site-editions-core-kinds =
    { $n ->
        [one] { $n } tipo
        [many] { $n } de tipos
       *[other] { $n } tipos
    }

# src/js/editions.mjs:73
js-site-editions-core-title = Núcleo aberto

# src/js/editions.mjs:76
js-site-editions-core-validated = validados

# src/js/editions.mjs:75
js-site-editions-core-validated-of = { $validated } de { $total }

# src/js/editions.mjs:89
js-site-editions-free-core = Gratuito no núcleo aberto, como todos os tipos

# src/js/editions.mjs:32
js-site-editions-group-other = Outros

# src/js/editions.mjs:87
js-site-editions-kind-no-ledger = nenhum módulo do registo lhe corresponde pelo nome

# src/js/editions.mjs:87
js-site-editions-kind-validated = { $v } de { $tot } linhas do registo validadas

# src/js/editions.mjs:98
js-site-editions-pause = Pausar os anéis

# src/js/editions.mjs:98
js-site-editions-play = Reproduzir os anéis

# src/js/editions.mjs:48
js-site-editions-ring-pro = Kshana Pro

# src/js/editions.mjs:49
js-site-editions-ring-study = Estudo à medida

# src/js/evidence.mjs:319
js-site-evidence-allan-aria = Quatro desvios do conjunto de dados de 1000 pontos do NIST SP 1065 em função do tempo de média; todos os { $n } valores publicados reproduzidos, pior erro relativo { $err }

# src/js/evidence.mjs:340
js-site-evidence-allan-lg-published = valor publicado, SP 1065 Tabela 31

# src/js/evidence.mjs:312
js-site-evidence-allan-mdev = desvio de Allan modificado

# src/js/evidence.mjs:346
js-site-evidence-allan-na = n/d

# src/js/evidence.mjs:312
js-site-evidence-allan-oadev = desvio de Allan sobreposto

# src/js/evidence.mjs:312
js-site-evidence-allan-ohdev = desvio de Hadamard sobreposto

# src/js/evidence.mjs:347
js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modificado { $mdev } · Hadamard { $ohdev }

# src/js/evidence.mjs:341
js-site-evidence-allan-st-gate = o critério de aceitação do teste

# src/js/evidence.mjs:341
js-site-evidence-allan-st-reproduced = valores publicados reproduzidos

# src/js/evidence.mjs:341
js-site-evidence-allan-st-worst = pior erro relativo

# src/js/evidence.mjs:312
js-site-evidence-allan-tdev = desvio de tempo, em segundos

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-at = «{ $name }» a { $m } s

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-engine = motor: «{ $got }» · erro relativo { $err }

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-table = SP 1065 Tabela 31: «{ $want }»

# src/js/evidence.mjs:469
js-site-evidence-cell-tip = Capacidade { $i } de { $n } · «{ $label }»

# src/js/evidence.mjs:222
js-site-evidence-cowell-aria = Diferença de posição face ao Orekit ao longo de 24 horas: os níveis de força 1 a 5 ficam abaixo de { $worst }; o nível de arrasto atinge { $drag }, uma banda de caracterização

# src/js/evidence.mjs:236
js-site-evidence-cowell-gto = órbita de transferência geoestacionária

# src/js/evidence.mjs:236
js-site-evidence-cowell-leo = órbita terrestre baixa

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-con = níveis 1 a 5, de dois corpos até à pressão da radiação solar, duas órbitas cada

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-drag = nível 6, arrasto: apenas caracterização (modelos de densidade diferentes)

# src/js/evidence.mjs:251
js-site-evidence-cowell-read = { $h } h · níveis 1 a 5 pior { $con } · arrasto { $drag }

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-drag = nível de arrasto, pior

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-epochs = épocas nos níveis 1 a 5

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-tier = «Nível { $tier }: { $label }» · { $regime }

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-worst = pior diferença «{ $err }» às { $h } h

# src/js/evidence.mjs:539
js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

# src/js/evidence.mjs:537
js-site-evidence-hero-no-oracle = Nenhuma referência independente externa indicada.

# src/js/evidence.mjs:536
js-site-evidence-hero-oracle = Referência independente

# src/js/evidence.mjs:539
js-site-evidence-hero-oracle-is = Referência independente: { $o }

# src/js/evidence.mjs:536
js-site-evidence-hero-owner = Responsável

# src/js/evidence.mjs:537
js-site-evidence-hero-partner = Um parceiro é responsável por isto; o motor não reivindica nada disto.

# src/js/evidence.mjs:544
js-site-evidence-hero-pause = Pausar a varredura

# src/js/evidence.mjs:544
js-site-evidence-hero-play = Reproduzir a varredura

# src/js/evidence.mjs:531
js-site-evidence-hero-row = Linha { $i } de { $n }

# src/js/evidence.mjs:381
js-site-evidence-hold-accepted = aceite: dentro de um fator de { $bar }

# src/js/evidence.mjs:359
js-site-evidence-hold-aria = Erro de tempo quadrático médio medido do relógio de césio face ao tempo de deriva, com a previsão do motor; a previsão sobre o medido ultrapassa o limite de { $lo } a { $hi }

# src/js/evidence.mjs:387
js-site-evidence-hold-control = «Controlo:» a previsão ingénua (a estabilidade de um segundo lida como ruído branco de frequência) dá uma razão de { $ratio }, errada por um fator de cerca de { $factor }, e falha o mesmo limiar. O limiar é exigente.

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-meas = medido no registo reservado (ponto: ultrapassagem)

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-pred = previsto a partir do primeiro terço (anel: ultrapassagem)

# src/js/evidence.mjs:354
js-site-evidence-hold-nodata = O registo medido não estava disponível quando esta página foi gerada.

# src/js/evidence.mjs:383
js-site-evidence-hold-perfect = 1 = perfeito

# src/js/evidence.mjs:377
js-site-evidence-hold-ratio-aria = Previsto sobre medido para { $n } limites, todos dentro do fator aceite de { $bar }

# src/js/evidence.mjs:393
js-site-evidence-hold-read = deriva { $h } h · medido { $m } ns · previsto { $p } ns

# src/js/evidence.mjs:388
js-site-evidence-hold-st-fit = usado para o ajuste

# src/js/evidence.mjs:388
js-site-evidence-hold-st-samples = amostras de um segundo

# src/js/evidence.mjs:388
js-site-evidence-hold-st-syncs = pontos de sincronização reservados

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-breach = ultrapassagem prevista { $p } s · medida { $m } s

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-error = «Erro de tempo { $thr } ns»

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-ratio = previsto sobre medido «{ $ratio }»

# src/js/evidence.mjs:382
js-site-evidence-hold-tip-row = «{ $thr } ns» · previsto sobre medido «{ $ratio }»

# src/js/evidence.mjs:171
js-site-evidence-kernel-chi2-cdf = distribuição do qui-quadrado

# src/js/evidence.mjs:172
js-site-evidence-kernel-chi2-quantile = quantil do qui-quadrado

# src/js/evidence.mjs:175
js-site-evidence-kernel-noncentral = qui-quadrado não central

# src/js/evidence.mjs:173
js-site-evidence-kernel-normal-cdf = distribuição normal

# src/js/evidence.mjs:174
js-site-evidence-kernel-normal-quantile = quantil normal

# src/js/evidence.mjs:176
js-site-evidence-kernel-pbias = polarização de deteção

# src/js/evidence.mjs:274
js-site-evidence-ladder-aria = Resíduos de órbita de { $lo } a { $hi } m numa só escala logarítmica, com o limiar de agência de { $bar } m

# src/js/evidence.mjs:284
js-site-evidence-ladder-bar = limiar de agência { $bar } m

# src/js/evidence.mjs:265
js-site-evidence-ladder-cowell = Cowell face ao Orekit 12.2, pior caso

# src/js/evidence.mjs:267
js-site-evidence-ladder-g24 = Galileo E11, ajuste de 24 horas

# src/js/evidence.mjs:266
js-site-evidence-ladder-g8 = Galileo E11, ajuste de 8 horas

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-headline = resíduo principal

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-over = acima do limiar de agência de { $bar } m

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-ring = apenas o modelo de forças, antes das acelerações empíricas

# src/js/evidence.mjs:269
js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, ajuste de 4 horas

# src/js/evidence.mjs:307
js-site-evidence-ladder-read = varredura em { $v } · { $n } de { $total } resíduos principais iguais ou inferiores a esse valor

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-arc = arco de { $arc } · grau e ordem { $do } · { $n } observações

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-rtn = radial { $r } m · ao longo da trajetória { $a } m · transversal { $c } m

# src/js/evidence.mjs:264
js-site-evidence-ladder-sgp4 = SGP4 face aos vetores da AIAA, pior caso

# src/js/evidence.mjs:268
js-site-evidence-ladder-swarm = Swarm-A, ajuste de 3 horas

# src/js/evidence.mjs:265
js-site-evidence-ladder-tip-cowell = «Cowell · pior de { $n } épocas» · { $worst }

# src/js/evidence.mjs:267
js-site-evidence-ladder-tip-g24 = «Galileo E11 · um dia inteiro» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8a = «Galileo E11 · apenas modelo de forças» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8b = «Galileo E11 · com acelerações empíricas» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrd = «Orbitador lunar · dinâmico» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrr = «Orbitador lunar · dinâmico reduzido» · { $rms } m, acima do limiar de { $bar } m e comunicado tal como é

# src/js/evidence.mjs:264
js-site-evidence-ladder-tip-sgp4 = «SGP4 · pior de { $n } vetores» · { $worst }

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swd = «Swarm-A · dinâmico» · { $rms } m, quase todo ao longo da trajetória (arrasto)

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swr = «Swarm-A · dinâmico reduzido» · { $rms } m

# src/js/evidence.mjs:183
js-site-evidence-raim-aria = { $pass } de { $n } casos SciPy dentro da sua banda de tolerância, em { $kernels } núcleos

# src/js/evidence.mjs:187
js-site-evidence-raim-lane = { $kernel } · { $n }

# src/js/evidence.mjs:209
js-site-evidence-raim-lg-most = a maior parte de uma banda usada por qualquer caso

# src/js/evidence.mjs:214
js-site-evidence-raim-read = caso { $q } de { $n } · { $kernel } · { $what }

# src/js/evidence.mjs:214
js-site-evidence-raim-read-band = { $pct } % da banda

# src/js/evidence.mjs:199
js-site-evidence-raim-scale-aria = Escala de cor: fração da banda de tolerância usada, logarítmica de 10 elevado a menos 11 até ao limite da banda

# src/js/evidence.mjs:210
js-site-evidence-raim-st-inside = dentro da banda

# src/js/evidence.mjs:210
js-site-evidence-raim-st-most = maior parte de uma banda usada

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-edge = limite da banda

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-exact = exato

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-case = «{ $kernel }» · caso { $j } de { $n }

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-exact = «coincidência exata» com o SciPy

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-uses = usa «{ $pct } %» da sua banda de tolerância

# src/js/evidence.mjs:132
js-site-evidence-sgp4-aria = { $n } de { $n } vetores da AIAA reproduzidos; pior { $worst }, mediana { $median }, todos dentro da tolerância de { $tol }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-deep = espaço profundo (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-deep = vetor de espaço profundo (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-median = mediana e pior caso na escala

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-near = vetor próximo da Terra (SGP4)

# src/js/evidence.mjs:139
js-site-evidence-sgp4-near = próximo da Terra (SGP4)

# src/js/evidence.mjs:165
js-site-evidence-sgp4-read = vetor { $i } de { $n } · satélite { $sat } · erro { $err }

# src/js/evidence.mjs:164
js-site-evidence-sgp4-read-deep = vetor { $i } de { $n } · satélite { $sat }, espaço profundo · erro { $err }

# src/js/evidence.mjs:144
js-site-evidence-sgp4-scale-aria = Escala de cor de 0,1 micrómetro até à tolerância, logarítmica

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-deep = vetores de espaço profundo

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-sats = satélites de teste

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-sat = «Satélite { $sat }» · { $kind }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-vector = vetor { $j } de { $n } · erro de posição «{ $err }»

# src/js/evidence.mjs:159
js-site-evidence-st-median = mediana

# src/js/evidence.mjs:159
js-site-evidence-st-worst = pior

# src/js/evidence.mjs:148
js-site-evidence-tolerance = tolerância { $v }

# src/site.js:277
js-site-filter-in-all = { $total } no total

# src/site.js:276
js-site-filter-matches =
    { $n ->
        [one] { $n } correspondência
        [many] { $n } de correspondências
       *[other] { $n } correspondências
    }

# src/site.js:276
js-site-filter-n-of-m = { $n } de { $total }

# src/site.js:279
js-site-filter-n-of-m-rows = { $n } de { $total } linhas

# src/site.js:276
js-site-filter-rows = { $total } linhas

# src/js/home.mjs:258
js-site-home-banner-gnss-lost = GNSS perdido · holdover

# src/js/home.mjs:258
js-site-home-banner-holdover-out = Holdover · relógio fora da margem de guarda

# src/js/home.mjs:259
js-site-home-banner-integrity-holdover = Alarme de integridade · o holdover continua

# src/js/home.mjs:259
js-site-home-banner-integrity-none = Alarme de integridade · sem nível de proteção

# src/js/home.mjs:259
js-site-home-banner-integrity-pl = Alarme de integridade · PL > AL

# src/js/home.mjs:256
js-site-home-banner-jamming = Jamming · C/N0 perto do limiar

# src/js/home.mjs:257
js-site-home-banner-spoofing = Alarme de spoofing · detetor de RF

# src/js/home.mjs:251
js-site-home-cap-holdover = O emissor de interferência passa para { $dbw } dBW: { $trk } satélites em seguimento. O relógio funciona livremente a partir dos { $carry } ns que o emissor de spoofing deixou e ultrapassa a sua margem de guarda de { $guard } ns em { $at }; o INS segue em deriva.

# src/js/home.mjs:252
js-site-home-cap-integrity = Os satélites regressam, mas só acima de uma máscara de { $mask }°: { $trk } em seguimento. O nível de proteção excede o limite de alerta de { $al } m ou não pode ser formado, pelo que o monitor dá alarme e o relógio permanece em holdover.

# src/js/home.mjs:249
js-site-home-cap-jamming = Um emissor de interferência de banda larga a { $km } km, a { $dbw } dBW. O C/N0 desce para { $cn } dB-Hz, { $above } dB acima do limiar de seguimento de { $floor } dB-Hz; todos os { $trk } satélites continuam em seguimento.

# src/js/home.mjs:248
js-site-home-cap-nominal = { $trk } satélites em seguimento com um C/N0 médio de { $cn } dB-Hz. O relógio está disciplinado pelo tempo GNSS e o nível de proteção ({ $pl } m) fica abaixo do limite de alerta de { $al } m.

# src/js/home.mjs:253
js-site-home-cap-recovery = GNSS ressincronizado: { $trk } satélites em seguimento, erro de tempo de volta a { $te } ns, nível de proteção { $pl } m.

# src/js/home.mjs:250
js-site-home-cap-spoofing = Um emissor de spoofing empurra o relógio do recetor a { $rate } ns/s. O detetor de RF (radiofrequência) dá alarme de imediato; o monitor assistido pelo relógio dispara após { $det } s, terminando a fase com { $off } ns repuxados.

# src/js/home.mjs:120
js-site-home-cn-no-lock = 0 de { $max } em seguimento · sem bloqueio

# src/js/home.mjs:120
js-site-home-cn-tracking = { $n } de { $max } em seguimento

# src/js/home.mjs:114
js-site-home-no-pl = sem PL

# src/js/home.mjs:329
js-site-home-pause = Pausar a missão

# src/js/home.mjs:121
js-site-home-pl-alarm = alarme · PL acima de AL

# src/js/home.mjs:121
js-site-home-pl-no-sats = sem satélites, sem PL

# src/js/home.mjs:121
js-site-home-pl-not-computed = não calculado nesta fase

# src/js/home.mjs:121
js-site-home-pl-too-few = satélites insuficientes

# src/js/home.mjs:121
js-site-home-pl-under-al = abaixo do AL de { $thr } m

# src/js/home.mjs:329
js-site-home-play = Reproduzir a missão

# src/js/home.mjs:214
js-site-home-receiver-tracking = Recetor · { $n } em seguimento

# src/js/home.mjs:226
js-site-home-replay-restarted = Repetição reiniciada · { $file }

# src/js/home.mjs:119
js-site-home-te-disciplined = disciplinado pelo GNSS

# src/js/home.mjs:119
js-site-home-te-free-running = holdover · funcionamento livre

# src/js/home.mjs:119
js-site-home-te-outside-guard = holdover · fora da margem de guarda

# src/js/home.mjs:119
js-site-home-te-spoofer = emissor de spoofing a puxar o relógio

# src/js/home.mjs:60
js-site-home-thr-floor = limiar

# src/js/home.mjs:59
js-site-home-thr-guard = guarda

# src/site.js:408
js-site-kind-action = Ação

# src/js/mcp-player.mjs:92
js-site-mcp-arguments-excerpt = argumentos (excerto)

# src/js/mcp-player.mjs:70
js-site-mcp-axis-mission-time = tempo de missão

# src/js/mcp-player.mjs:97
js-site-mcp-clock-holdover = holdover de { $clock }

# src/js/mcp-player.mjs:28
js-site-mcp-dir-reply = kshana-mcp → assistente

# src/js/mcp-player.mjs:28
js-site-mcp-dir-request = assistente → kshana-mcp

# src/js/mcp-player.mjs:52
js-site-mcp-figcaption = Desenhado a partir da série devolvida: o erro de tempo de cada relógio face ao limite

# src/js/mcp-player.mjs:46
js-site-mcp-fom-availability = disponibilidade

# src/js/mcp-player.mjs:44
js-site-mcp-fom-caption = Figuras de mérito devolvidas por run_scenario, por relógio

# src/js/mcp-player.mjs:45
js-site-mcp-fom-header = Figura de mérito

# src/js/mcp-player.mjs:46
js-site-mcp-fom-holdover = holdover (s)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-p95 = erro de tempo, percentil 95 (ns)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-rms = erro de tempo, valor quadrático médio (ns)

# src/js/mcp-player.mjs:21
js-site-mcp-lede = Registado { $recorded } · v{ $version } · entrada e saída padrão · protocolo { $protocol } · apenas mensagens exatas

# src/js/mcp-player.mjs:73
js-site-mcp-legend-gnss-lost = GNSS perdido aos { $s } s

# src/js/mcp-player.mjs:73
js-site-mcp-legend-threshold = limite { $v } ns

# src/js/mcp-player.mjs:158
js-site-mcp-pause = Pausar

# src/js/mcp-player.mjs:158
js-site-mcp-play = Reproduzir

# src/js/mcp-player.mjs:51
js-site-mcp-plot-aria = Erro de tempo de { $quantum } e { $classical } devolvido por run_scenario, face ao limite de { $threshold } ns; GNSS (sistema global de navegação por satélite) perdido aos { $lost } s

# src/js/mcp-player.mjs:35
js-site-mcp-recorded-json = JSON registado: { $label }

# src/js/mcp-player.mjs:96
js-site-mcp-scenario-hash = hash do cenário

# src/js/mcp-player.mjs:81
js-site-mcp-server-identity = identidade do servidor

# src/js/mcp-player.mjs:34
js-site-mcp-show-json = Mostrar JSON

# src/js/mcp-player.mjs:109
js-site-mcp-step-aria = Passo { $n } de { $total }: { $name }

# src/js/mcp-player.mjs:100
js-site-mcp-step-result = resultado: figuras de mérito

# src/js/mcp-player.mjs:137
js-site-mcp-step-status = Passo { $n } de { $total } · { $name }

# src/js/mcp-player.mjs:98
js-site-mcp-summary-excerpt = linha de resumo e resultado (excerto)

# src/js/mcp-player.mjs:100
js-site-mcp-tab-result = resultado

# src/js/mcp-player.mjs:96
js-site-mcp-threshold = limite

# src/js/mcp-player.mjs:90
js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } linha
        [many] { $n } de linhas
       *[other] { $n } linhas
    }

# src/js/mcp-player.mjs:38
js-site-mcp-toml-more = … (mais { $n } linhas de { $file })

# src/js/mcp-player.mjs:86
js-site-mcp-tool-count =
    { $n ->
        [one] { $n } ferramenta
        [many] { $n } de ferramentas
       *[other] { $n } ferramentas
    }

# src/js/mcp-player.mjs:87
js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } ferramenta com descrições
        [many] { $n } de ferramentas com descrições
       *[other] { $n } ferramentas com descrições
    }

# src/site.js:71
js-site-menu-close = Fechar o menu

# src/site.js:71
js-site-menu-open = Abrir o menu

# src/js/missions.mjs:658
js-site-missions-avail-title = Disponibilidade: fração da execução com PDOP ≤ { $limit }

# src/js/missions.mjs:657
js-site-missions-avail-uniform = { $v } % em todas as células

# src/js/missions.mjs:880
js-site-missions-chart-error-title = erro de posição (m, log)

# src/js/missions.mjs:875
js-site-missions-chart-four = quatro necessários para uma solução de posição

# src/js/missions.mjs:875
js-site-missions-chart-four-short = quatro para uma solução

# src/js/missions.mjs:885
js-site-missions-chart-lg-earth = Terra visível

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-earth = erro, retransmissores e distância à Terra

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-relays = erro, apenas retransmissores

# src/js/missions.mjs:885
js-site-missions-chart-lg-relays = retransmissores à vista

# src/js/missions.mjs:876
js-site-missions-chart-relays-title = retransmissores à vista · sombreado: Terra acima do horizonte

# src/js/missions.mjs:564
js-site-missions-chip-at-pdop = com PDOP ≤ { $limit }

# src/js/missions.mjs:570
js-site-missions-chip-engine = Motor:

# src/js/missions.mjs:565
js-site-missions-chip-fix-earth = solução de posição, com a Terra

# src/js/missions.mjs:564
js-site-missions-chip-median-pdop = PDOP mediano

# src/js/missions.mjs:565
js-site-missions-chip-relays = retransmissores

# src/js/missions.mjs:565
js-site-missions-chip-rms = erro RMS

# src/js/missions.mjs:564
js-site-missions-chip-satellites = satélites

# src/js/missions.mjs:567
js-site-missions-chip-tracking-held = seguimento de { $label } mantido

# src/js/missions.mjs:284
js-site-missions-clocks-aria = Erro de tempo após um dia de holdover, por classe de relógio, escala logarítmica

# src/js/missions.mjs:295
js-site-missions-clocks-frame = limite mínimo do referencial { $ns } ns

# src/js/missions.mjs:285
js-site-missions-clocks-note = erro de tempo após um dia, segundos (log)

# src/js/missions.mjs:292
js-site-missions-clocks-sigma = σy(1 s) { $sigma }

# src/js/missions.mjs:290
js-site-missions-clocks-title = { $clock }: { $ns } ns após um dia, σy(1 s) { $sigma }

# src/js/missions.mjs:311
js-site-missions-cone-aria = Cone de erro de posição desde a perda do GNSS

# src/js/missions.mjs:314
js-site-missions-cone-axis-x = tempo desde a perda do GNSS (s)

# src/js/missions.mjs:315
js-site-missions-cone-axis-y = erro de posição (m)

# src/js/missions.mjs:322
js-site-missions-cone-budget = orçamento de ±{ $m } m

# src/js/missions.mjs:327
js-site-missions-cone-clipped = cortado em ±{ $m } m

# src/js/missions.mjs:324
js-site-missions-cone-leaves = sai aos { $s } s

# src/js/missions.mjs:335
js-site-missions-cone-readout = t { $t } s · { $errors }

# src/js/missions.mjs:479
js-site-missions-copy-command = Copiar comando

# src/js/missions.mjs:479
js-site-missions-copy-title = Copiar o comando que a reproduz

# src/js/missions.mjs:987
js-site-missions-deterministic = determinista

# src/js/missions.mjs:487
js-site-missions-engine-build = Motor v{ $version }, compilação

# src/js/missions.mjs:590
js-site-missions-engine-build-commit = Motor v{ $version }, compilação { $commit }

# src/js/missions.mjs:393
js-site-missions-fp-aria = Mapa da pegada de jamming. As teclas de seta deslocam entre células, Enter abre essa execução.

# src/js/missions.mjs:370
js-site-missions-fp-aria-svg = Pegada de jamming em torno do emissor de interferência

# src/js/missions.mjs:388
js-site-missions-fp-darker = mais escuro = J/S médio mais elevado · células de { $step } km · { $n } execuções do motor

# src/js/missions.mjs:381
js-site-missions-fp-jammer = emissor de interferência

# src/js/missions.mjs:385
js-site-missions-fp-lg-held = seguimento mantido

# src/js/missions.mjs:385
js-site-missions-fp-lg-lost = todos os satélites perdidos

# src/js/missions.mjs:385
js-site-missions-fp-lg-some = algumas épocas perdidas

# src/js/missions.mjs:418
js-site-missions-fp-open = Abrir esta execução no { $studio }

# src/js/missions.mjs:419
js-site-missions-fp-read = a cerca de { $km } km do emissor de interferência · J/S médio { $js } dB · disponibilidade de seguimento { $av }

# src/js/missions.mjs:382
js-site-missions-fp-ship = o navio do cenário

# src/js/missions.mjs:209
js-site-missions-grades-aria = Deriva inercial livre antes de { $a } m e { $b } m, por classe de IMU

# src/js/missions.mjs:216
js-site-missions-grades-axis = segundos de deriva após a perda do GNSS (log)

# src/js/missions.mjs:223
js-site-missions-grades-point = { $grade }: { $s } s até { $m } m ({ $why })

# src/js/missions.mjs:210
js-site-missions-grades-reaches = o erro atinge { $m } m

# src/js/missions.mjs:211
js-site-missions-grades-speed = a { $v } m/s

# src/js/missions.mjs:221
js-site-missions-grades-this = este cenário

# src/js/missions.mjs:1206
js-site-missions-hud-earth-link = Ligação à Terra

# src/js/missions.mjs:1271
js-site-missions-hud-link-above = Ligação à Terra · acima do horizonte

# src/js/missions.mjs:1271
js-site-missions-hud-link-occulted = Ligação à Terra · ocultada

# src/js/missions.mjs:1203
js-site-missions-hud-orbiter = Orbitador

# src/js/missions.mjs:1204
js-site-missions-hud-receiver = Recetor

# src/js/missions.mjs:1203
js-site-missions-hud-relays = Retransmissores

# src/js/missions.mjs:1204
js-site-missions-hud-selected-lat = latitude selecionada

# src/js/missions.mjs:814
js-site-missions-info-in-view = À vista

# src/js/missions.mjs:814
js-site-missions-info-in-view-value = { $mean } em média · { $fewest } no mínimo

# src/js/missions.mjs:814
js-site-missions-info-pdop-above = { $pdop }, acima de { $limit }

# src/js/missions.mjs:475
js-site-missions-json-title = O resultado do motor, sem modificações

# src/js/missions.mjs:464
js-site-missions-json-unavailable = JSON indisponível

# src/js/missions.mjs:648
js-site-missions-key-avail = Disponibilidade

# src/js/missions.mjs:855
js-site-missions-key-pdop-title = PDOP médio (diluição de precisão da posição)

# src/js/missions.mjs:648
js-site-missions-key-vis = Satélites à vista

# src/js/missions.mjs:648
js-site-missions-key-vis-short = À vista

# src/js/missions.mjs:595
js-site-missions-leo-grid = da grelha com PDOP ≤ { $limit }

# src/js/missions.mjs:595
js-site-missions-leo-in-view = à vista em média

# src/js/missions.mjs:595
js-site-missions-leo-shells = satélites em quatro camadas

# src/js/missions.mjs:809
js-site-missions-map-aria = { $title } sobre { $body }, por célula de 10 graus. As teclas de seta deslocam o recetor; a sua célula é lida abaixo.

# src/js/missions.mjs:853
js-site-missions-map-colour-by = Colorir o mapa por

# src/js/missions.mjs:715
js-site-missions-map-fewest-in-view = mínimo à vista

# src/js/missions.mjs:712
js-site-missions-map-grey = cinzento: sem solução de posição

# src/js/missions.mjs:711
js-site-missions-map-hatched = tracejado: acima do limite de PDOP de { $limit }

# src/js/missions.mjs:774
js-site-missions-map-in-view = à vista

# src/js/missions.mjs:839
js-site-missions-map-live = { $cell }: { $rows }

# src/js/missions.mjs:715
js-site-missions-map-mean-in-view = média à vista

# src/js/missions.mjs:715
js-site-missions-map-mean-pdop = PDOP médio

# src/js/missions.mjs:715
js-site-missions-map-pdop-limit = limite de PDOP { $limit }

# src/js/missions.mjs:509
js-site-missions-matrix-caption = Ficheiros de cenário por setor (linhas) e modo de falha (colunas). Selecione uma contagem para abrir esse setor.

# src/js/missions.mjs:523
js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } ficheiro de cenário
        [many] { $sector }, { $mode }: { $n } de ficheiros de cenário
       *[other] { $sector }, { $mode }: { $n } ficheiros de cenário
    }

# src/js/missions.mjs:525
js-site-missions-matrix-files =
    { $n ->
        [one] { $n } ficheiro:
        [many] { $n } de ficheiros:
       *[other] { $n } ficheiros:
    }

# src/js/missions.mjs:510
js-site-missions-matrix-sector = Setor

# src/js/missions.mjs:492
js-site-missions-mode-int = Interferência

# src/js/missions.mjs:492
js-site-missions-mode-itg = Integridade

# src/js/missions.mjs:492
js-site-missions-mode-nav = Deriva

# src/js/missions.mjs:492
js-site-missions-mode-orb = Geometria

# src/js/missions.mjs:492
js-site-missions-mode-spf = Spoofing

# src/js/missions.mjs:492
js-site-missions-mode-tim = Temporização

# src/js/missions.mjs:925
js-site-missions-n-of-total = { $n } de { $total }

# src/js/missions.mjs:651
js-site-missions-no-fix = sem solução de posição

# src/js/missions.mjs:487
js-site-missions-no-seed = determinista, sem semente

# src/js/missions.mjs:471
js-site-missions-open-in-studio = Abrir no { $studio }

# src/js/missions.mjs:472
js-site-missions-open-report = Abrir o relatório do motor

# src/js/missions.mjs:954
js-site-missions-ow-chart-aria = Resposta do recetor ao longo da execução para { $name }: retransmissores à vista, e erro de posição só com retransmissores e com a distância à Terra

# src/js/missions.mjs:994
js-site-missions-ow-chip-epochs = épocas

# src/js/missions.mjs:994
js-site-missions-ow-chip-mask = máscara

# src/js/missions.mjs:998
js-site-missions-ow-chip-orbiter = orbitador

# src/js/missions.mjs:999
js-site-missions-ow-chip-range = distância σ

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays = retransmissores

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays-value = { $planes } × { $per } a { $alt } km, { $inc }°

# src/js/missions.mjs:994
js-site-missions-ow-chip-span = intervalo

# src/js/missions.mjs:989
js-site-missions-ow-count-relays = { $n } retransmissores e um orbitador · { $body }

# src/js/missions.mjs:989
js-site-missions-ow-count-sats = { $n } satélites · { $body }

# src/js/missions.mjs:987
js-site-missions-ow-engine = motor v{ $version } · compilação { $commit }

# src/js/missions.mjs:991
js-site-missions-ow-lat-label = Latitude do recetor

# src/js/missions.mjs:940
js-site-missions-ow-map-aria = Resposta do recetor para { $name }: um mapa de { $body } por célula de 10 graus, com a média e o mínimo de satélites à vista e o PDOP médio por latitude ao lado

# src/js/missions.mjs:1008
js-site-missions-ow-note-imagery = Imagens de { $body }: NASA.

# src/js/missions.mjs:1007
js-site-missions-ow-note-rebuilt = Órbitas: os retransmissores e o orbitador reconstruídos a partir do cenário exatamente como o motor os constrói; a contagem de satélites à vista que daí resulta é igual à do motor em todas as { $n } épocas.

# src/js/missions.mjs:1006
js-site-missions-ow-note-sats = Órbitas: os satélites da execução repropagados aqui e confrontados com todas as { $n } amostras de trajetória no solo que o motor escreveu (pior caso { $deg }°).

# src/js/missions.mjs:1008
js-site-missions-ow-note-scaled = Os raios orbitais são redimensionados para visualização; planos, faseamento e períodos são os da execução.

# src/js/missions.mjs:1008
js-site-missions-ow-note-tracks = O motor escreveu trajetórias no solo para { $shown } dos { $total } satélites; todos os { $total } são desenhados a partir das suas camadas.

# src/js/missions.mjs:1005
js-site-missions-ow-note-walker = Órbitas: as camadas Walker da execução repropagadas aqui e confrontadas com todas as { $n } amostras de trajetória no solo que o motor escreveu (pior caso { $deg }°).

# src/js/missions.mjs:994
js-site-missions-ow-off = desligado

# src/js/missions.mjs:994
js-site-missions-ow-on = ligado

# src/js/missions.mjs:1025
js-site-missions-ow-pause = Pausar as órbitas

# src/js/missions.mjs:1025
js-site-missions-ow-play = Reproduzir as órbitas

# src/js/missions.mjs:1012
js-site-missions-ow-time = t = { $time }

# src/js/missions.mjs:997
js-site-missions-ow-time-label = Tempo de missão

# src/js/missions.mjs:978
js-site-missions-ow-valuetext = { $time }, { $n } retransmissores à vista

# src/js/missions.mjs:667
js-site-missions-pdop-title = PDOP médio (diluição de precisão da posição), escala logarítmica, quanto menor melhor

# src/js/missions.mjs:474
js-site-missions-report = Relatório

# src/js/missions.mjs:474
js-site-missions-report-title = O relatório do próprio motor sobre esta execução

# src/js/missions.mjs:928
js-site-missions-ro-above-horizon = acima do horizonte

# src/js/missions.mjs:919
js-site-missions-ro-availability = Disponibilidade, PDOP ≤ { $limit }

# src/js/missions.mjs:928
js-site-missions-ro-earth-light = Terra · tempo de luz { $s } s

# src/js/missions.mjs:926
js-site-missions-ro-error-relays = Erro de posição, apenas retransmissores

# src/js/missions.mjs:928
js-site-missions-ro-occulted = ocultada

# src/js/missions.mjs:922
js-site-missions-ro-place-availability = Em { $place }: disponibilidade

# src/js/missions.mjs:921
js-site-missions-ro-place-in-view = Em { $place }: à vista, média · mínimo

# src/js/missions.mjs:925
js-site-missions-ro-relays = Retransmissores à vista

# src/js/missions.mjs:918
js-site-missions-ro-satellites = Satélites

# src/js/missions.mjs:927
js-site-missions-ro-with-earth = Com a distância à Terra

# src/js/missions.mjs:1295
js-site-missions-run-failed = Não foi possível carregar aqui a execução registada; abra-a no { $studio } a partir da ligação abaixo.

# src/js/missions.mjs:487
js-site-missions-seed = semente { $seed }

# src/js/missions.mjs:241
js-site-missions-spoof-aria = Desvio de spoofing em função do tempo, com o limite de deteção e o tempo de deteção de cada monitor

# src/js/missions.mjs:244
js-site-missions-spoof-axis-x = tempo desde o início do spoofing (s)

# src/js/missions.mjs:245
js-site-missions-spoof-axis-y = desvio de tempo (ns)

# src/js/missions.mjs:255
js-site-missions-spoof-detects = { $id } deteta aos { $s } s

# src/js/missions.mjs:257
js-site-missions-spoof-lg-bound = limite de { $id }

# src/js/missions.mjs:257
js-site-missions-spoof-lg-offset = desvio de spoofing

# src/js/missions.mjs:270
js-site-missions-spoof-readout = t { $t } s · desvio { $offset } ns

# src/js/missions.mjs:246
js-site-missions-spoof-spec = especificação { $v } ns

# src/js/missions.mjs:615
js-site-missions-sr-aria = { $members }; emissor de interferência partilhado { $power } dBW

# src/js/missions.mjs:615
js-site-missions-sr-aria-member = { $label }: seguimento mantido { $held } %, relação média entre emissor de interferência e sinal { $js } dB, mínimo de satélites em seguimento { $min }

# src/js/missions.mjs:607
js-site-missions-sr-car = Automóvel

# src/js/missions.mjs:612
js-site-missions-sr-fewest = mínimo em seguimento

# src/js/missions.mjs:610
js-site-missions-sr-held = seguimento mantido

# src/js/missions.mjs:611
js-site-missions-sr-mean-js = J/S médio

# src/js/missions.mjs:607
js-site-missions-sr-ship = Navio

# src/js/missions.mjs:1302
js-site-missions-swipe =
    { $n ->
        [one] Deslize para ver o { $n } ficheiro de cenário
        [many] Deslize para ver todos os { $n } de ficheiros de cenário
       *[other] Deslize para ver todos os { $n } ficheiros de cenário
    }

# src/js/missions.mjs:478
js-site-missions-toml-download-title = Descarregar o ficheiro de cenário que foi executado

# src/js/missions.mjs:477
js-site-missions-toml-title = O ficheiro de cenário que foi executado

# src/js/missions.mjs:663
js-site-missions-vis-title = Satélites à vista, média ao longo da execução

# src/js/missions.mjs:662
js-site-missions-vis-uniform = { $v } em todas as células

# src/site.js:417
js-site-palette-none = Sem resultados

# src/site.js:417
js-site-palette-results = { $count } resultados

# src/js/pro-power.mjs:147
js-site-pro-band-at = Aos { $minutes } minutos: percentis 5 a 95

# src/js/pro-power.mjs:147
js-site-pro-band-range = { $lo } a { $hi } { $unit }

# src/js/pro-power.mjs:148
js-site-pro-band-runs-within = de { $n } execuções dentro de ±{ $limit } { $unit }

# src/js/pro-power.mjs:92
js-site-pro-design-readout = { $sat } satélites, { $av } % de disponibilidade · { $planes } planos a { $alt } km, { $incl }°

# src/js/pro-power.mjs:91
js-site-pro-front-design = Projeto de fronteira { $id }

# src/js/pro-power.mjs:91
js-site-pro-front-design-knee = Projeto de fronteira { $id } · joelho

# src/js/pro-power.mjs:90
js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } projeto de fronteira adicional neste ponto)
        [many] (+{ $n } de projetos de fronteira adicionais neste ponto)
       *[other] (+{ $n } projetos de fronteira adicionais neste ponto)
    }

# src/js/pro-power.mjs:94
js-site-pro-not-rerun = não reexecutado

# src/js/pro-power.mjs:93
js-site-pro-rerun-free = reexecutado no motor gratuito:

# src/js/pro-power.mjs:94
js-site-pro-same-sha = mesmo SHA-256 { $sha }…

# src/js/pro-power.mjs:94
js-site-pro-same-sha-index = mesmo SHA-256 do resultado que o índice

# src/site.js:41
js-site-toast-copied = Copiado: { $text }

# src/site.js:351
js-site-toast-data-failed = Não foi possível carregar o ficheiro de dados

# src/site.js:350
js-site-toast-data-saved = Dados guardados como CSV

# src/site.js:348
js-site-toast-no-data = Sem dados para este gráfico

# src/site.js:340
js-site-toast-svg-saved = Gráfico guardado como SVG

# src/site.js:346
js-site-toast-table-saved = Tabela guardada como CSV

# src/js/home-waterfall.mjs:248
js-site-waterfall-axis-now = agora

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

# src/js/home-waterfall.mjs:303
js-site-waterfall-below-floor = os sinais ficam abaixo do limiar de ruído

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-drives = Campanha que comanda:

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-seed = semente { $seed } · { $phases } fases durante { $duration } s

# src/js/home-waterfall.mjs:119
js-site-waterfall-chip-aria = { $band }, { $fc } megahertz: mostrar esta banda

# src/js/home-waterfall.mjs:120
js-site-waterfall-chip-title = { $band } · { $fc } MHz · largura de banda do recetor { $bw } MHz

# src/js/home-waterfall.mjs:78
js-site-waterfall-engine-build = Motor v{ $version } · compilação

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-head = Recurso ao Galileo · { $s } s, apenas tom CW

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-text = { $band } de volta a { $v } dB-Hz. Monitorização de integridade apenas com o Galileo: nível de proteção { $min }–{ $max } m, abaixo do limite de alerta de { $limit } m.

# src/js/home-waterfall.mjs:107
js-site-waterfall-floor = limiar de seguimento de { $thr } dB-Hz

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-head = Holdover · { $s } s, chirp ativo

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, abaixo do limiar. O relógio funciona livremente: pior { $worst } ns face a uma margem de guarda de { $guard } ns.

# src/js/home-waterfall.mjs:73
js-site-waterfall-jammer-off = { $what } desligado

# src/js/home-waterfall.mjs:72
js-site-waterfall-jammer-on = { $what } ligado

# src/js/home-waterfall.mjs:400
js-site-waterfall-live = { $freq } megahertz, { $time }: { $detail }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-none = nenhuma banda modelada

# src/js/home-waterfall.mjs:12
js-site-waterfall-load-failed = Não foi possível carregar a execução registada. O relatório do motor abaixo mostra a mesma execução.

# src/js/home-waterfall.mjs:298
js-site-waterfall-no-jammer-band = Nenhum emissor de interferência nesta banda

# src/js/home-waterfall.mjs:346
js-site-waterfall-no-jammer-in-band = nenhum emissor de interferência na banda

# src/js/home-waterfall.mjs:78
js-site-waterfall-no-seed = determinista, sem semente

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-head = Início · { $t0 }–{ $t1 } s

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-text = Todas as { $n } bandas em seguimento, até a execução do espectro perder { $band } pela primeira vez aos { $s } s.

# src/js/home-waterfall.mjs:447
js-site-waterfall-pause = Pausar a cascata

# src/js/home-waterfall.mjs:447
js-site-waterfall-play = Reproduzir a cascata

# src/js/home-waterfall.mjs:305
js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:48
js-site-waterfall-run-time = execução T+{ $s } s

# src/js/home-waterfall.mjs:109
js-site-waterfall-scale-caption = PSD acima do limiar de { $floor } dBW/Hz · células de { $bin } MHz × { $step } s

# src/js/home-waterfall.mjs:78
js-site-waterfall-seed = semente { $seed }

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-lost = perdido

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-ok = seguim.

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-rec = recup.

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-lost = Bloqueio perdido

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-lost-low = bloqueio perdido

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-ok = Em seguimento

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-ok-low = em seguimento

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-rec = Recuperado

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-rec-low = recuperado

# src/js/home-waterfall.mjs:94
js-site-waterfall-summary-recovers = { $band } perde o bloqueio aos { $lost } s e recupera aos { $rec } s, mínimo { $min } dB-Hz.

# src/js/home-waterfall.mjs:91
js-site-waterfall-summary-rows = { $n } linhas de { $step } s.

# src/js/home-waterfall.mjs:95
js-site-waterfall-summary-stays-lost = { $band } perde o bloqueio aos { $lost } s e permanece perdido, mínimo { $min } dB-Hz.

# src/js/home-waterfall.mjs:92
js-site-waterfall-summary-tracks = { $band } mantém o seguimento do princípio ao fim, mínimo { $min } dB-Hz.

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-above-floor = acima do limiar de ruído

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-at-floor = No limiar de ruído térmico

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:380
js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-js = J/S { $js } dB

# src/js/home-waterfall.mjs:383
js-site-waterfall-tip-no-band = A largura de banda do recetor de nenhuma banda modelada cobre esta coluna

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-chirp = chirp

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-cw = tom CW

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-noise = ruído

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-cursor = Banda sob o cursor

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-selected = Banda selecionada

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-worst = Pior banda
