# site-js.ftl (pt-BR): translations

# src/js/t.mjs:4
js-app-engine-failed = Não foi possível carregar o motor ({ $reason }).

# src/js/t.mjs:5
js-ledger-rows =
    { $n ->
        [one] { $n } linha do registro
        [many] { $n } de linhas do registro
       *[other] { $n } linhas do registro
    }

# src/site.js:373
js-site-action-copy-install = Copiar: cargo install kshana

# src/site.js:371
js-site-action-launch = Iniciar { $name }

# src/site.js:375
js-site-action-licence = Fale conosco sobre uma licença comercial

# src/site.js:374
js-site-action-pro-eval = Solicitar uma avaliação do Kshana Pro

# src/site.js:376
js-site-action-study = Solicitar um estudo

# src/site.js:372
js-site-action-theme = Alternar entre o tema claro e o escuro

# src/js/capabilities.mjs:689
js-site-capabilities-bd-after = { $m } m após { $s } s

# src/js/capabilities.mjs:675
js-site-capabilities-bd-combined = combinado

# src/js/capabilities.mjs:680
js-site-capabilities-bd-crossing = { $m } m em { $s } s

# src/js/capabilities.mjs:694
js-site-capabilities-bd-fig-crossing = «{ $m } m» após { $s } s, dominado por { $dom }

# src/js/capabilities.mjs:693
js-site-capabilities-bd-fig-lead = Tempo desde a perda do GNSS no eixo logarítmico, com uma IMU de grau { $grade } a { $speed } m/s:

# src/js/capabilities.mjs:695
js-site-capabilities-bd-fig-tail = As linhas são as leis de crescimento do motor para trechos curtos sem GNSS e sua soma quadrática; os cruzamentos vêm do modelo de erro completo de nove estados (Schuler), que limita os termos de viés, de modo que em trechos longos cada cruzamento ocorre um pouco depois de a linha alcançá-lo. As barras: os mesmos cruzamentos para quatro graus de IMU.

# src/js/capabilities.mjs:816
js-site-capabilities-cd-canvas-aria = Constelação em torno de seu corpo, com imagens reais: arraste ou use as teclas de seta para girar, mais e menos para aproximar ou afastar

# src/js/capabilities.mjs:746
js-site-capabilities-cd-design-meta = { $n } satélites · { $body } · { $file }

# src/js/capabilities.mjs:788
js-site-capabilities-cd-foot-frozen = Cada satélite segue a trajetória própria do motor; o raio da órbita congelada vem dos elementos da camada.

# src/js/capabilities.mjs:789
js-site-capabilities-cd-foot-mean-motion = Cada satélite segue a trajetória própria do motor, no raio que seu movimento médio implica.

# src/js/capabilities.mjs:786
js-site-capabilities-cd-foot-walker = Os { $n } satélites são posicionados a partir dos parâmetros Walker próprios das camadas (conferidos com as { $shown } trajetórias do motor: pior caso { $deg }°); os rastros são as { $shown } trajetórias do motor.

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
js-site-capabilities-cd-no-webgl = A visualização 3D requer WebGL; o mapa de cobertura e as figuras são da mesma execução.

# src/js/capabilities.mjs:812
js-site-capabilities-cd-pause = Pausar as órbitas

# src/js/capabilities.mjs:812
js-site-capabilities-cd-play = Reproduzir as órbitas

# src/js/capabilities.mjs:749
js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

# src/js/capabilities.mjs:750
js-site-capabilities-cd-slots = { $name }: { $n } satélites, tabela de slots do operador

# src/js/capabilities.mjs:784
js-site-capabilities-cd-span = de { $dur }, em repetição

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
js-site-capabilities-cd-title-gnss = Quatro GNSS juntos

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-leo = Megaconstelação de órbita terrestre baixa

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-lunar = Conjunto de relés lunares

# src/js/capabilities.mjs:779
js-site-capabilities-cd-work-ratio = { $pct } % após o pré-filtro de latitude · { $dop } soluções DOP

# src/js/capabilities.mjs:778
js-site-capabilities-cd-work-tests = { $after } testes satélite-ponto, dos { $brute } que uma varredura por força bruta faria

# src/js/capabilities.mjs:777
js-site-capabilities-cd-work-title = Trabalho de visibilidade

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-sub = C/N0 em relação ao limiar de rastreamento

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-title = Densidade de portadora para ruído

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-availability = Disponibilidade

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-fewest = Mínimo rastreado

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-js = J/S médio

# src/js/capabilities.mjs:1037
js-site-capabilities-cg-compose-text = Um jammer, { $power } { $unit }, em um lugar, vinculado a { $n } execuções-membro do tipo ‹{ $kind }›: um navio em um estreito e um carro em uma estrada costeira veem a mesma causa e obtêm respostas diferentes.

# src/js/capabilities.mjs:973
js-site-capabilities-cg-log-campaign = campanha { $file } · { $phases } fases · { $runs } execuções-membro

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase = a fase { $name } começa

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase-carries = a fase { $name } começa · carrega { $carried }

# src/js/capabilities.mjs:1017
js-site-capabilities-cg-monte-axis = erro final do relógio em { $n } sementes ({ $path })

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-ci = Média, intervalo de 95 %

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-mean = Média

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p05 = percentil 5

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-p05-p95 = percentil 5 a 95

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p50 = mediana

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p95 = percentil 95

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-std = Desvio-padrão

# src/js/capabilities.mjs:1020
js-site-capabilities-cg-monte-text = O mesmo cenário ‹{ $kind }› executado { $n } vezes a partir da semente-base { $seed }, uma semente por execução: a dispersão do erro final do relógio em operação livre, com seu intervalo de confiança de 95 % para a média.

# src/js/capabilities.mjs:969
js-site-capabilities-cg-not-in-phase = fora desta fase

# src/js/capabilities.mjs:972
js-site-capabilities-cg-now = Fase { $n } de { $total }: { $name } · de { $from } a { $to }

# src/js/capabilities.mjs:940
js-site-capabilities-cg-phase-title = { $name }: de { $from } a { $to } · encerrada por { $by } · tipos-membro { $kinds }

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-sub = em relação ao limite de alerta

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-title = Nível de proteção

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-sub = em relação ao seu orçamento · log

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-title = Erro de posição inercial

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-range = { $lo } a { $hi }

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-all-lost = Todos perdidos a partir de

# src/js/capabilities.mjs:998
js-site-capabilities-cg-sweep-axis = potência de transmissão do jammer ({ $key })

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
js-site-capabilities-cg-sweep-span = Faixa de J/S

# src/js/capabilities.mjs:1002
js-site-capabilities-cg-sweep-text = Um cenário ‹{ $kind }›, executado uma vez por nó à medida que a potência de transmissão do jammer passa de { $from } a { $to } { $unit }. A disponibilidade sob jamming (linha contínua) e o J/S médio (tracejada) vêm das figuras de mérito de cada execução-membro.

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-sub = em relação à sua margem de guarda

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-title = Erro de tempo do relógio

# src/js/capabilities.mjs:109
js-site-capabilities-copy = Copiar

# src/js/capabilities.mjs:108
js-site-capabilities-copy-aria = Copiar o comando que reproduz a execução: kshana { $file }

# src/js/capabilities.mjs:1387
js-site-capabilities-cz-best = Melhor PDOP

# src/js/capabilities.mjs:1374
js-site-capabilities-cz-failed = Não foi possível carregar aqui a execução registrada; abra-a no Studio.

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix = Amostras com solução de posição

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix-value = { $n } de { $total } ({ $pct }%)

# src/js/capabilities.mjs:1388
js-site-capabilities-cz-median = PDOP mediano

# src/js/capabilities.mjs:90
js-site-capabilities-engine = Motor v{ $version }

# src/js/capabilities.mjs:91
js-site-capabilities-engine-build = Motor v{ $version }, build

# src/js/capabilities.mjs:104
js-site-capabilities-engine-report = Relatório do motor

# src/js/capabilities.mjs:1287
js-site-capabilities-globe-aria = { $name } sobre suas imagens reais ({ $credit }). Arraste ou use as teclas de seta para girá-lo; mais e menos aproximam ou afastam.

# src/js/capabilities.mjs:1334
js-site-capabilities-ho-ends = a execução termina em { $t }

# src/js/capabilities.mjs:1337
js-site-capabilities-ho-past-guard = fora da margem de guarda

# src/js/capabilities.mjs:92
js-site-capabilities-no-seed = determinístico, sem semente

# src/js/capabilities.mjs:96
js-site-capabilities-open-in-studio = Abrir no { $studio }

# src/js/capabilities.mjs:104
js-site-capabilities-open-report = Abrir o relatório do motor

# src/js/capabilities.mjs:1186
js-site-capabilities-orrery-aria = O sistema solar na época da execução: arraste ou use as teclas de seta para girar, mais e menos para aproximar ou afastar

# src/js/capabilities.mjs:1228
js-site-capabilities-orrery-bodies = { $n } corpos · observador «{ $observer }»

# src/js/capabilities.mjs:1227
js-site-capabilities-orrery-epoch = Época «{ $epoch }» · TDB (tempo dinâmico baricêntrico), data juliana { $jd }

# src/js/capabilities.mjs:1134
js-site-capabilities-pnt-chart-title = relés à vista (linha) · Terra acima do horizonte (sombreado) · quatro necessários para uma solução

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-kicker = Posicionamento neste corpo · tipo body-pnt

# src/js/capabilities.mjs:1124
js-site-capabilities-pnt-lander = Um módulo de pouso em { $lat }°, { $lon }° na superfície navega com os relés, com uma medição de distância bidirecional a partir da Terra sempre que ela estiver acima do horizonte (tempo de luz unidirecional { $min } min). Disponibilidade: { $a } % só com os relés, { $b } % com o enlace com a Terra.

# src/js/capabilities.mjs:1125
js-site-capabilities-pnt-orbiter = Um usuário em órbita navega com os relés, com uma medição de distância bidirecional a partir da Terra sempre que ela estiver acima do horizonte (tempo de luz unidirecional { $min } min). Disponibilidade: { $a } % só com os relés, { $b } % com o enlace com a Terra.

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-relays = { $n } relés a { $alt } km em torno de { $body }

# src/js/capabilities.mjs:97
js-site-capabilities-report-data = Relatório e dados

# src/js/capabilities.mjs:107
js-site-capabilities-result-data = Dados do resultado

# src/js/capabilities.mjs:78
js-site-capabilities-saved = Salvo { $name }

# src/js/capabilities.mjs:105
js-site-capabilities-scenario-file = Arquivo de cenário

# src/js/capabilities.mjs:92
js-site-capabilities-seed = semente { $seed }

# src/js/capabilities.mjs:568
js-site-capabilities-six-clock-fig = «{ $id }» permanece dentro da margem de guarda por { $dur }

# src/js/capabilities.mjs:563
js-site-capabilities-six-clock-guard = margem de guarda de { $v } ns

# src/js/capabilities.mjs:605
js-site-capabilities-six-coast-budget = orçamento de { $m } m

# src/js/capabilities.mjs:606
js-site-capabilities-six-coast-denied = GNSS negado

# src/js/capabilities.mjs:609
js-site-capabilities-six-coast-fig = «{ $id }» dentro do orçamento por { $s } s

# src/js/capabilities.mjs:527
js-site-capabilities-six-floor = limiar de rastreamento

# src/js/capabilities.mjs:595
js-site-capabilities-six-integ-fig = «{ $ok }» de { $n } épocas disponíveis · limites de alerta { $h } m horizontal, { $v } m vertical

# src/js/capabilities.mjs:590
js-site-capabilities-six-integ-limit = limite de alerta vertical

# src/js/capabilities.mjs:594
js-site-capabilities-six-integ-pl = nível de proteção vertical (linha contínua) e horizontal (tracejada)

# src/js/capabilities.mjs:534
js-site-capabilities-six-jam-effective = efetivo, { $n } satélites

# src/js/capabilities.mjs:535
js-site-capabilities-six-jam-fig = Rastreados «{ $min }» de { $max } à vista · disponibilidade sob jamming «{ $av }» (nominal { $nom }) · J/S médio «{ $js } dB»

# src/js/capabilities.mjs:533
js-site-capabilities-six-jam-nominal = nominal, sem jammer (tracejada)

# src/js/capabilities.mjs:581
js-site-capabilities-six-orbit-fig = Altitude «{ $lo }–{ $hi } km» · traço no solo ao longo de { $dur }

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-label = { $source } · { $n } amostras

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-sgp4 = SGP4 a partir de um conjunto de elementos de duas linhas

# src/js/capabilities.mjs:548
js-site-capabilities-six-spoof-detects = { $id } detecta

# src/js/capabilities.mjs:550
js-site-capabilities-six-spoof-fig = «{ $id }» detecta em { $s } s (limite { $ns } ns)

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-angle = Ângulo em relação ao Sol

# src/js/capabilities.mjs:1053
js-site-capabilities-ss-credit = Imagens: { $credits }. * O mapa não chega aos polos; a lacuna recebe a cor média polar do mapa. Anéis de Saturno: { $ring } ({ $licence }).

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-days = { $v } dias

# src/js/capabilities.mjs:1076
js-site-capabilities-ss-frame-origin = Origem do referencial

# src/js/capabilities.mjs:1084
js-site-capabilities-ss-from-sun = A partir do Sol

# src/js/capabilities.mjs:1088
js-site-capabilities-ss-gloss = NAIF: o código de corpo do Navigation and Ancillary Information Facility da NASA. GM: parâmetro gravitacional. J2: termo de achatamento. Polo IAU: o polo de rotação da União Astronômica Internacional, como ascensão reta (RA) e declinação (Dec).

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
        [one] Enlace que esta execução calcula:
        [many] Enlaces que esta execução calcula:
       *[other] Enlaces que esta execução calcula:
    }

# src/js/capabilities.mjs:1094
js-site-capabilities-ss-moons =
    { $n ->
        [one] Sua lua, em escala, na época
        [many] Suas luas, em escala, na época
       *[other] Suas luas, em escala, na época
    }

# src/js/capabilities.mjs:1106
js-site-capabilities-ss-nominal-error = erro nominal de { $km } km em distância

# src/js/capabilities.mjs:1103
js-site-capabilities-ss-north = Visto do norte da eclíptica.

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period = Período orbital

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period-about = Período em torno de { $parent }

# src/js/capabilities.mjs:1086
js-site-capabilities-ss-pole = Polo IAU (RA, Dec)

# src/js/capabilities.mjs:1081
js-site-capabilities-ss-radius = Raio médio

# src/js/capabilities.mjs:1080
js-site-capabilities-ss-retrograde = { $v } h, retrógrado

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-rotation = Rotação sideral

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-years = { $v } anos

# src/js/capabilities.mjs:653
js-site-capabilities-st-bound = limite de { $v } m

# src/js/capabilities.mjs:660
js-site-capabilities-st-fig-none = { $n } épocas, nenhuma com o erro acima do seu limite. Horizontal: o erro de posição verdadeiro; vertical: o nível de proteção; ambos em eixos logarítmicos.

# src/js/capabilities.mjs:659
js-site-capabilities-st-fig-some = { $n } épocas, { $k } com o erro acima do seu limite. Horizontal: o erro de posição verdadeiro; vertical: o nível de proteção; ambos em eixos logarítmicos.

# src/js/capabilities.mjs:649
js-site-capabilities-st-limit = limite de alerta de { $m } m

# src/js/capabilities.mjs:650
js-site-capabilities-st-misleading = enganoso: erro acima do limite

# src/js/capabilities.mjs:652
js-site-capabilities-st-normal = operação normal

# src/js/capabilities.mjs:651
js-site-capabilities-st-unavailable = indisponível: limite acima do limite de alerta

# src/js/capabilities.mjs:1408
js-site-capabilities-studio-embedded = { $studio }, incorporado: a execução orbit-multignss

# src/js/capabilities.mjs:1406
js-site-capabilities-studio-load = Carregar o { $studio } aqui

# src/js/capabilities.mjs:1410
js-site-capabilities-studio-outline = Mostrar o esboço novamente

# src/js/capabilities.mjs:259
js-site-capabilities-wave-chirp = chirp

# src/js/capabilities.mjs:259
js-site-capabilities-wave-cw = tom CW

# src/js/capabilities.mjs:260
js-site-capabilities-wave-noise = ruído

# src/js/capabilities.mjs:388
js-site-capabilities-wf-an-caption = linha T+{ $t } s · dB acima do piso, escala logarítmica · pico de toda a grade { $peak } dB

# src/js/capabilities.mjs:357
js-site-capabilities-wf-degraded = Degradado

# src/js/capabilities.mjs:364
js-site-capabilities-wf-degraded-low = degradado

# src/js/capabilities.mjs:134
js-site-capabilities-wf-failed = Não foi possível carregar aqui a execução registrada.

# src/js/capabilities.mjs:247
js-site-capabilities-wf-grid = grade

# src/js/capabilities.mjs:144
js-site-capabilities-wf-iq = Em T+{ $t } s o motor também desenha o modelo como { $n } amostras IQ (em fase e em quadratura) em torno de { $mhz } MHz e confronta com ele uma estimativa de Welch ({ $segments } segmentos de { $nfft }): razão de potência integrada { $ratio }.

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-off = { $what } desligado

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-on = { $what } ligado

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · de { $on } s até o fim

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

# src/js/capabilities.mjs:357
js-site-capabilities-wf-lost = Sincronismo perdido

# src/js/capabilities.mjs:364
js-site-capabilities-wf-lost-low = sincronismo perdido

# src/js/capabilities.mjs:392
js-site-capabilities-wf-max = { $peak } dB acima · escala logarítmica a partir de { $v0 } dB

# src/js/capabilities.mjs:358
js-site-capabilities-wf-no-jammer = sem jammer

# src/js/capabilities.mjs:239
js-site-capabilities-wf-now = agora

# src/js/capabilities.mjs:437
js-site-capabilities-wf-pause = Pausar a cascata

# src/js/capabilities.mjs:386
js-site-capabilities-wf-peak = pico { $v } dB

# src/js/capabilities.mjs:437
js-site-capabilities-wf-play = Reproduzir a cascata

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-previous = início da reprodução · passagem anterior abaixo

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-start = início da reprodução

# src/js/capabilities.mjs:364
js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

# src/js/capabilities.mjs:229
js-site-capabilities-wf-signal = sinal +{ $v } dB

# src/js/capabilities.mjs:395
js-site-capabilities-wf-summary = Execução registrada de { $file }: { $bands } bandas, { $jammers } jammers ao longo de { $seconds } segundos. A pior banda, { $worst }, cai para { $min } dB-Hz em { $at } s; limiar de rastreamento { $floor } dB-Hz.

# src/js/capabilities.mjs:416
js-site-capabilities-wf-tip-above = { $v } dB acima do piso de ruído

# src/js/capabilities.mjs:417
js-site-capabilities-wf-tip-in = em { $bands }

# src/js/capabilities.mjs:357
js-site-capabilities-wf-tracking = Rastreando

# src/js/capabilities.mjs:364
js-site-capabilities-wf-tracking-low = rastreando

# src/js/cap-hero.mjs:60
js-site-caphero-aria = O sistema solar a partir da execução solar-system do motor em { $date }: o Sol e { $bodies } corpos que se movem por suas trajetórias orbitais do motor; { $valid } das órbitas são validadas em relação ao JPL Horizons.

# src/js/cap-hero.mjs:185
js-site-caphero-clock = +{ $days } dias · { $date }

# src/js/cap-hero.mjs:69
js-site-caphero-copy-command = Copiar comando

# src/js/cap-hero.mjs:69
js-site-caphero-copy-title = Copiar o comando que o reproduz

# src/js/cap-hero.mjs:79
js-site-caphero-credits = Distâncias comprimidas em escala logarítmica, direções verdadeiras; corpos ampliados, rotação em velocidade de exibição. Imagens: { $credits }; anéis de Saturno: { $ring } ({ $licence }).

# src/js/cap-hero.mjs:77
js-site-caphero-credits-summary = Créditos de escala e imagens

# src/js/cap-hero.mjs:64
js-site-caphero-engine-build = Motor v{ $version }, build

# src/js/cap-hero.mjs:65
js-site-caphero-explore = Explorar todos os corpos

# src/js/cap-hero.mjs:67
js-site-caphero-file-title = O arquivo de cenário que foi executado

# src/js/cap-hero.mjs:59
js-site-caphero-list-item = { $name }: { $label }, a { $au } au do Sol na época, período orbital { $period }.

# src/js/cap-hero.mjs:58
js-site-caphero-list-item-light = { $name }: { $label }, a { $au } au do Sol na época, período orbital { $period }, tempo de luz a partir de { $observer } { $light }.

# src/js/cap-hero.mjs:64
js-site-caphero-no-seed = determinístico, sem semente

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
js-site-caphero-rate-epoch = O quadro na época da execução

# src/js/cap-hero.mjs:135
js-site-caphero-read-distance = a { $au } au do Sol

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
js-site-developers-engine-build = Motor v{ $version }, build

# src/js/developers.mjs:51
js-site-developers-exit-stamp = saída { $rc } · { $ms } ms

# src/js/developers.mjs:44
js-site-developers-file-open-in-studio = { $file }: abrir no { $studio }

# src/js/developers.mjs:45
js-site-developers-no-seed = (determinístico, sem semente)

# src/js/developers.mjs:44
js-site-developers-open-in-studio = Abrir no { $studio }

# src/js/developers.mjs:89
js-site-developers-pause = Pausar a reprodução

# src/js/developers.mjs:89
js-site-developers-play = Iniciar a reprodução

# src/js/developers.mjs:70
js-site-developers-replaying = # reproduzindo a sessão registrada

# src/js/developers.mjs:45
js-site-developers-seed = (semente { $seed })

# src/js/developers.mjs:46
js-site-developers-what-runs-write = O que cada execução grava

# src/js/editions.mjs:89
js-site-editions-builds-on-it = { $label } se baseia nele

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
js-site-editions-kind-no-ledger = nenhum módulo do registro corresponde a ele pelo nome

# src/js/editions.mjs:87
js-site-editions-kind-validated = { $v } de { $tot } linhas do registro validadas

# src/js/editions.mjs:98
js-site-editions-pause = Pausar os anéis

# src/js/editions.mjs:98
js-site-editions-play = Reproduzir os anéis

# src/js/editions.mjs:48
js-site-editions-ring-pro = Kshana Pro

# src/js/editions.mjs:49
js-site-editions-ring-study = Estudo sob medida

# src/js/evidence.mjs:319
js-site-evidence-allan-aria = Quatro desvios do conjunto de dados de 1000 pontos do NIST SP 1065 em relação ao tempo de média; os { $n } valores publicados foram reproduzidos, pior erro relativo { $err }

# src/js/evidence.mjs:340
js-site-evidence-allan-lg-published = valor publicado, SP 1065 Table 31

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
js-site-evidence-allan-st-gate = o limite do teste

# src/js/evidence.mjs:341
js-site-evidence-allan-st-reproduced = valores publicados reproduzidos

# src/js/evidence.mjs:341
js-site-evidence-allan-st-worst = pior erro relativo

# src/js/evidence.mjs:312
js-site-evidence-allan-tdev = desvio de tempo, em segundos

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-at = «{ $name }» em { $m } s

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-engine = motor: «{ $got }» · erro relativo { $err }

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-table = SP 1065 Table 31: «{ $want }»

# src/js/evidence.mjs:469
js-site-evidence-cell-tip = Capacidade { $i } de { $n } · «{ $label }»

# src/js/evidence.mjs:222
js-site-evidence-cowell-aria = Diferença de posição em relação ao Orekit em 24 horas: os níveis de força 1 a 5 ficam abaixo de { $worst }; o nível de arrasto chega a { $drag }, uma faixa de caracterização
