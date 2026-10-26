# studio-js.ftl (pt-PT): translations

js-adv-all-domains = Todos os domínios

js-adv-animation-frame-title = Animação desta execução, escrita pelo motor

js-adv-animation-html-player = Leitor HTML

js-adv-animation-html-player-title = O leitor de ficheiro único, tal como o motor o escreveu

js-adv-animation-load-failed = Não foi possível carregar a animação registada ({ $reason }).

js-adv-animation-loading = A carregar a animação registada…

js-adv-animation-none = Não existe nenhuma animação registada para este cenário.

js-adv-animation-note = O motor escreve uma animação de qualquer execução que tenha um eixo temporal: um SVG de reprodução automática e um leitor HTML de ficheiro único com os seus próprios controlos de reprodução e de deslocamento. A versão para navegador não inclui esse escritor, pelo que este é o ficheiro que o motor nativo de linha de comandos escreveu para o cenário incluído.

js-adv-animation-svg = SVG animado

js-adv-animation-svg-title = O SVG de reprodução automática, tal como o motor o escreveu

js-adv-axis-averaging-time = tempo de média τ (s)

js-adv-axis-observation-interval = intervalo de observação τ (s)

js-adv-axis-value = valor

js-adv-badge-live-engine = Motor em direto

js-adv-badge-recorded = Registado

js-adv-badge-recorded-engine = Execução registada, motor v{ $version }

js-adv-badge-recorded-native = Execução registada, motor nativo v{ $version }

js-adv-band-carrier = Portadora

js-adv-band-carrier-not-set = não definida neste cenário

js-adv-band-chip-rate = Taxa de chip

js-adv-band-jammer-bandwidth = Largura de banda do jammer

js-adv-band-jammer-label = jammer { $bandwidth } MHz

js-adv-band-jammer-power = Potência do jammer

js-adv-band-jammer-type = Tipo de jammer

js-adv-band-no-carrier-note = O motor calcula a razão entre a potência do jammer e a do sinal a partir do orçamento de ligação. Este cenário não indica uma frequência de portadora, pelo que não é desenhado nenhum espetro.

js-adv-band-satellites = Satélites

js-adv-band-signal-main-lobe = lóbulo principal do sinal

js-adv-band-svg-label = Bandas do sinal e do jammer em torno da portadora

js-adv-band-tracking-threshold = Limiar de seguimento

js-adv-browser-cannot-run = A versão para navegador não consegue executar este cenário.

js-adv-busy-running = A executar

js-adv-busy-sweeping = A varrer

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } valor transmitido
        [many] { $n } de valores transmitidos
       *[other] { $n } valores transmitidos
    }

js-adv-chain-note = Um sistema seguido ao longo de todas as etapas do motor. A tabela abaixo indica cada número que uma etapa calculou e que a etapa seguinte utilizou.

js-adv-chain-stage = Etapa { $n }

js-adv-chain-sub = a saída de cada etapa alimenta a seguinte

js-adv-chain-title = A cadeia

js-adv-chart-allan-title = Desvio de Allan

js-adv-chart-budget-label = orçamento

js-adv-chart-default-title = Gráfico do Kshana

js-adv-chart-effective-cn0 = C/N0 efetivo por satélite

js-adv-chart-ground-track = Traço no solo

js-adv-chart-holdover-budget = Holdover face a um orçamento de temporização

js-adv-chart-mtie-title = MTIE (erro máximo de intervalo de tempo)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · cenário { $hash } · kshana.dev

js-adv-chart-stability-title = Estabilidade do relógio (desvio de Allan sobreposto)

js-adv-chart-tdev-title = TDEV (desvio de tempo)

js-adv-chart-undrawable = Não foi possível desenhar este gráfico.

js-adv-chip-live = Motor em direto · v{ $version }

js-adv-chip-live-title = O motor do Kshana está a ser executado neste navegador como WebAssembly

js-adv-chip-recorded = Execuções registadas · v{ $version }

js-adv-chip-recorded-title = Não foi possível iniciar o WebAssembly aqui. São apresentadas execuções registadas reais dos cenários incluídos.

js-adv-chip-recorded-title-reason = Não foi possível iniciar o WebAssembly aqui ({ $reason }). São apresentadas execuções registadas reais dos cenários incluídos.

js-adv-chip-unavailable = Motor indisponível

js-adv-cmd-all-fields = Mostrar todos os campos numéricos

js-adv-cmd-compare = Comparar as execuções fixadas

js-adv-cmd-embed-code = Copiar o código de incorporação

js-adv-cmd-exports = Descarregar os resultados (exportações)

js-adv-cmd-history = Abrir o histórico de execuções

js-adv-cmd-parameters = Abrir os parâmetros

js-adv-cmd-pin = Fixar esta execução para comparar

js-adv-cmd-report = Descarregar o relatório

js-adv-cmd-reset = Repor o texto do cenário

js-adv-cmd-run = Executar o cenário

js-adv-cmd-share-link = Copiar a ligação de partilha

js-adv-cmd-start = Ir para o ecrã inicial

js-adv-cmd-theme = Alternar entre tema claro e escuro

js-adv-cmd-tour = Iniciar a visita guiada

js-adv-command-line-only = apenas linha de comandos

js-adv-compare-deltas-note = As diferenças são relativas à execução A. O verde assinala o melhor valor de cada indicador.

js-adv-compare-no-common = Estas execuções não partilham indicadores de mérito comparáveis. Fixe execuções da mesma família de cenários para ver números e diferenças.

js-adv-compare-one-pinned = Está fixada uma execução. Altere um parâmetro, execute novamente e fixe essa execução para comparar as duas.

js-adv-compare-overlay = Sobreposição das execuções fixadas

js-adv-compare-overlay-diff = Sobreposição com a diferença B − A

js-adv-compare-overlay-note = As linhas contínuas são a execução A e as tracejadas a execução B, nos mesmos eixos.

js-adv-compare-overlay-title = { $title }: execução { $a } (A) face à execução { $b } (B)

js-adv-compare-pin-two = Fixe pelo menos duas execuções para as comparar lado a lado. Fixe uma execução, altere um parâmetro ou escolha outro cenário da mesma família, execute-o e volte a fixar.

js-adv-compare-run-heading = { $letter } · execução { $run }

js-adv-copy-blocked = A cópia está bloqueada aqui.

js-adv-copy-command = Copiar: { $command }

js-adv-could-not-load = Não foi possível carregar { $file }.

js-adv-coverage-dots = Os pontos são { $shown } de { $total } satélites, percorridos ao longo dos seus traços no solo; reproduza a repetição para os mover.

js-adv-coverage-field-label = Campo a mapear

js-adv-coverage-map = Mapa de cobertura

js-adv-coverage-map-over = sobre { $body }

js-adv-coverage-map-select = Mapa

js-adv-coverage-note = Cada célula é um ponto da grelha em { $body }, avaliado em todas as épocas da execução.

js-adv-coverage-title = { $field } sobre { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = O ecrã inicial: todos os domínios

js-adv-decrease-field = Diminuir { $field }

js-adv-domain = Domínio

js-adv-domain-line-campaigns = Missões encadeadas, varrimentos e execuções de Monte Carlo num único relógio.

js-adv-domain-line-constellations = Projetar uma constelação e mapear a sua cobertura e o PDOP (diluição da precisão da posição).

js-adv-domain-line-deepspace = Navegação e tempo na Lua, no espaço cislunar e em Marte.

js-adv-domain-line-integrity = Soluções de posição e se são de confiança: RAIM (monitorização autónoma da integridade pelo recetor) e a sua forma avançada, ARAIM.

js-adv-domain-line-interference = Jammers contra recetores GNSS: o que se perde e quando.

js-adv-domain-line-leo = Sinais de navegação em órbita terrestre baixa, passagens, mensagens e soluções de posição.

js-adv-domain-line-leo-missions = Estudos e serviços construídos sobre uma camada em órbita terrestre baixa.

js-adv-domain-line-navigation = Navegação inercial, por terreno, por gravidade e outra sem GNSS.

js-adv-domain-line-optional = Um grupo opcional de cenários.

js-adv-domain-line-orbits = Propagação de órbitas, efemérides e geometria GNSS.

js-adv-domain-line-solar = Todos os planetas e luas numa só época, com tempos de luz.

js-adv-domain-line-spaceops = Passagens, janelas de lançamento, reentrada, orçamentos de ligação e de atitude.

js-adv-domain-line-spectrum = Cascatas da banda de rádio: jammers, sinais e o que o recetor segue.

js-adv-domain-line-spoofing = Sinais falsos e meaconing, e os monitores que os detetam.

js-adv-domain-line-studies = Sensores quânticos, estudos comparativos e formatos de interoperabilidade.

js-adv-domain-line-timing = Relógios sem GNSS: holdover, estabilidade, máscaras de telecomunicações, transferência de tempo.

js-adv-domain-pick-hint = Escolha um: abre e executa-se no seu navegador. A seguir, pode alterar os respetivos parâmetros.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } cenário
        [many] { $label }: { $n } de cenários
       *[other] { $label }: { $n } cenários
    }

js-adv-domain-select-label = Mostrar um domínio

js-adv-download = Descarregar

js-adv-edited-cli-only-status = Editado: este cenário só é executado no motor de linha de comandos.

js-adv-edited-needs-engine = Editado: requer o motor { $need }.

js-adv-edited-needs-live-engine = Os cenários editados requerem o motor em direto.

js-adv-embed-copied = Código de incorporação copiado.

js-adv-engine-chart = Gráfico do motor

js-adv-engine-chart-alt = Gráfico do motor para esta execução

js-adv-engine-file-http-error = o ficheiro do motor devolveu HTTP { $status }

js-adv-engine-load-failed-no-recordings = não foi possível carregar o motor ({ $reason }) e não foram encontradas execuções registadas

js-adv-engine-loading = A carregar o motor…

js-adv-engine-loading-title = O motor em direto ainda está a ser descarregado. Este resultado registado é substituído por uma execução em direto quando estiver pronto.

js-adv-engine-start-failed = Não foi possível iniciar o motor: { $reason }. Sirva esta pasta por HTTP (por exemplo python3 -m http.server) em vez de abrir o ficheiro diretamente.

js-adv-entries-count =
    { $n ->
        [one] { $n } entrada
        [many] { $n } de entradas
       *[other] { $n } entradas
    }

js-adv-export-card-title = Exportação { $format }

js-adv-export-csv-desc = Os mesmos bytes que a ferramenta de linha de comandos escreve como { $file }.

js-adv-export-csv-title = Tabela de reprodutibilidade

js-adv-export-ephemeris-checking = A verificar que formatos de efemérides esta execução pode exportar…

js-adv-export-ephemeris-waiting = As exportações de efemérides aparecem aqui quando o motor tiver carregado.

js-adv-export-json-desc = A saída completa do motor para esta execução, com unidades e proveniência.

js-adv-export-json-title = Documento de resultado completo

js-adv-export-large-not-recorded = Esta exportação é grande, pelo que não foi registada. Requer o motor em direto.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) para GMAT, Orekit ou STK

js-adv-export-omm-desc = Catálogo CCSDS OMM (Orbit Mean-elements Message)

js-adv-export-report-desc = Um ficheiro offline: resumo, valores com os respetivos níveis, todos os gráficos e o texto exato do cenário, com a versão do motor e o hash do cenário.

js-adv-export-report-title = Relatório reprodutível

js-adv-export-sp3-desc = Efemérides precisas SP3-c desta constelação

js-adv-export-toml-desc = A entrada exata desta execução. Execute-a novamente em qualquer lugar com a ferramenta de linha de comandos ou com os pacotes Python e npm.

js-adv-export-toml-title = Ficheiro do cenário

js-adv-export-too-large = { $desc }. Demasiado grande para registar: requer o motor em direto.

js-adv-field-find-match =
    { $n ->
        [one] { $n } controlo guiado e { $fields } de { $total } campos correspondem a “{ $query }”.
        [many] { $n } de controlos guiados e { $fields } de { $total } campos correspondem a “{ $query }”.
       *[other] { $n } controlos guiados e { $fields } de { $total } campos correspondem a “{ $query }”.
    }

js-adv-field-find-none = Nenhum campo deste cenário corresponde a “{ $query }”. Pesquise em todos os cenários com a pesquisa da biblioteca.

js-adv-field-hit-in = em { $title }

js-adv-field-not-single-number = Esse campo não é um número único neste cenário: edite-o na fonte.

js-adv-field-opened = Aberto em { $field }. Altere-o e o cenário volta a ser executado.

js-adv-fields-matching = Campos que correspondem a “{ $query }”

js-adv-fields-more = mais { $n }: refine as palavras ou pesquise no ecrã inicial.

js-adv-fields-top-level = nível superior

js-adv-filter-check-tuning = verificar o ajuste

js-adv-filter-consistent = consistente

js-adv-from-the-link = a partir da ligação

js-adv-geo-sub = { $name } · { $shown } de { $total } elementos desenhados · registado com o motor nativo

js-adv-geo-title = Exportação GeoJSON: { $name }

js-adv-gt-note = Realçado: satélite visível a partir da estação.

js-adv-gt-note-both = Realçado: satélite visível a partir da estação. Elevação máxima { $elevation }°. Doppler máximo { $doppler } Hz.

js-adv-gt-note-doppler = Realçado: satélite visível a partir da estação. Doppler máximo { $doppler } Hz.

js-adv-gt-note-elevation = Realçado: satélite visível a partir da estação. Elevação máxima { $elevation }°.

js-adv-heatmap-label = Mapa de calor de { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } execução.
        [many] { $n } de execuções.
       *[other] { $n } execuções.
    }

js-adv-history-pin = Fixar

js-adv-history-restore = Restaurar

js-adv-history-run-time = execução { $run } · { $time }

js-adv-holdover-engine-figure = Holdover do motor ao orçamento do cenário: { $duration }

js-adv-holdover-engine-figure-budget = Holdover do motor ao orçamento do cenário ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = erro após a perda do GNSS em t = { $loss } s

js-adv-holdover-error-since-fix = erro desde a última solução de posição

js-adv-holdover-stays-inside = permanece dentro deste orçamento durante todo o registo

js-adv-holdover-until-breached = até o orçamento ser ultrapassado

js-adv-honesty-modelled = Física de primeiros princípios com testes, ainda não verificada face a uma referência independente externa. { $text }

js-adv-honesty-partner = Valores da responsabilidade de um parceiro. { $text }

js-adv-honesty-validated = Verificado face a uma referência independente externa. { $text }

js-adv-increase-field = Aumentar { $field }

js-adv-install-version = Instalar a v{ $version }

js-adv-interop-no-file = O motor não escreveu nenhum ficheiro deste formato para esta execução.

js-adv-interop-not-applicable = Não se aplica a este cenário: { $reason }.

js-adv-interop-not-bundled = Não incluído aqui (tamanho): o comando acima escreve-o.

js-adv-interop-note = O motor escreve a geometria e as amostras de sinal de uma execução em formatos que outras ferramentas abrem: CZML para o Cesium, KML (Keyhole Markup Language) para o Google Earth, GeoJSON para mapas, ficheiros de efemérides STK (.e) e gravações SigMF (Signal Metadata Format). A versão para navegador não inclui estes escritores, pelo que os ficheiros abaixo são os que o motor nativo de linha de comandos escreveu para o cenário incluído.

js-adv-js-range-label = intervalo J/S

js-adv-js-range-value = { $low } a { $high } dB

js-adv-json-copied = JSON copiado.

js-adv-kind-default = kind: clock holdover (a predefinição)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Verificação

js-adv-kpi-delta-since-run = { $arrow } { $change } desde a execução { $run }

js-adv-kpi-fail = Falha

js-adv-kpi-first-run = primeira execução

js-adv-kpi-not-in-previous = não consta da sua execução anterior

js-adv-kpi-pass = Aprovado

js-adv-lib-count-all = { $scenarios } cenários · { $domains } domínios

js-adv-lib-count-filtered = { $n } de { $total } cenários

js-adv-lib-no-match = Nenhum cenário ou campo corresponde. Experimente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-adv-loaded-shared = Foi carregado um cenário partilhado a partir da ligação.

js-adv-mask-envelope = Envolvente do erro de tempo em holdover ({ $source })

js-adv-mask-exceeded-after = excedido após { $duration }

js-adv-mask-limit-label = limite { $limit } ns

js-adv-mask-max-te = |TE| máx.

js-adv-mask-not-exceeded = não excedido

js-adv-matrix-counts = { $validated } de { $total }

js-adv-matrix-line = { $counts } capacidades verificadas face a referências independentes externas · { $modelled } modeladas · { $partner } da responsabilidade de parceiros

js-adv-max-close = Fechar

js-adv-max-close-label = Fechar o ecrã inteiro

js-adv-max-expand = Expandir

js-adv-max-expand-label = Expandir este painel para ecrã inteiro

js-adv-max-title = Mostrar este painel em ecrã inteiro (Escape fecha-o)

js-adv-meta-engine = motor

js-adv-meta-file = ficheiro

js-adv-meta-scenario = cenário

js-adv-meta-seed = semente

js-adv-meta-time = hora

js-adv-mission-timeline = Cronologia da missão

js-adv-native-edited-notice = { $why } A execução registada é a do ficheiro incluído, pelo que uma cópia editada não pode ser mostrada aqui: execute-a com a ferramenta de linha de comandos ou use Repor para ver a gravação.

js-adv-native-notice-command = { $why } O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ao executar { $command }, apresentada sem alterações. Não volta a ser executada quando edita.

js-adv-native-notice-plain = { $why } O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version }, apresentada sem alterações. Não volta a ser executada quando edita.

js-adv-native-notice-platform = { $why } O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ({ $platform }), apresentada sem alterações. Não volta a ser executada quando edita.

js-adv-native-notice-platform-command = { $why } O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ({ $platform }) ao executar { $command }, apresentada sem alterações. Não volta a ser executada quando edita.

js-adv-needs-live-engine = Isto requer o motor em direto.

js-adv-needs-newer-engine-status = Requer um motor mais recente.

js-adv-nees-line = NEES { $mean } (banda de 95% { $low }–{ $high }, alvo 2.0)

js-adv-newer-engine-edited-notice = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é a v{ $version }. Só pode ser mostrada a gravação do ficheiro incluído: use Repor para a ver, ou execute uma cópia editada com o motor { $need }.

js-adv-newer-engine-no-recording = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é a v{ $version }. Não existe aqui nenhuma gravação do mesmo.

js-adv-newer-engine-shown-commit = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é a v{ $version }. O que vê é a execução registada com uma compilação do motor no commit { $commit }, apresentada sem alterações; não volta a ser executada aqui.

js-adv-newer-engine-shown-version = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é a v{ $version }. O que vê é a execução registada com o motor v{ $recorded }, apresentada sem alterações; não volta a ser executada aqui.

js-adv-nis-line = NIS { $mean } (banda de 95% { $low }–{ $high }, alvo 1.0)

js-adv-no-guided-controls = Este cenário não tem nenhum dos controlos guiados. Use Todos os campos ou edite a fonte.

js-adv-no-numeric-fields = Não há campos numéricos individuais para ajustar aqui. Edite diretamente a fonte.

js-adv-no-recorded-run = Não existe nenhuma execução registada para este cenário. Requer o motor em direto.

js-adv-no-summary = (este cenário não publica nenhum resumo de uma linha)

js-adv-noise-floor = nível de ruído { $level }

js-adv-not-in-browser-status = Este cenário não é executado no navegador.

js-adv-open-and-run = Abrir e executar

js-adv-open-at-field = abrir neste campo

js-adv-opened-from-simple = Aberto com as definições que alterou na vista Simples.

js-adv-optional-preset = predefinição opcional: scenarios/{ $file }

js-adv-orbit-canvas-label = Vista 3D interativa do traço propagado

js-adv-orbit-fallback-alt = Vista ortográfica do traço propagado

js-adv-orbit-note-epoch = Arraste para rodar, use a roda do rato ou o gesto de pinça para ampliar. Terra à escala, imagens NASA Blue Marble. Rodada para a época da execução.

js-adv-orbit-note-no-epoch = Arraste para rodar, use a roda do rato ou o gesto de pinça para ampliar. Terra à escala, imagens NASA Blue Marble. Esta execução não indica uma época, pelo que o ângulo de rotação da Terra não tem significado aqui.

js-adv-orbit-static-note = Vista estática (a biblioteca 3D não pôde ser carregada aqui).

js-adv-pal-commands = Comandos

js-adv-pal-domain = Domínio: { $name }

js-adv-pal-domains = Domínios

js-adv-pal-field = Campo: { $name }

js-adv-pal-fields = Campos

js-adv-pal-nothing = Nada corresponde

js-adv-pal-opens-page = abre uma página

js-adv-pal-page = Página: { $name }

js-adv-pal-pages = Páginas

js-adv-pal-panel = Painel: { $name }

js-adv-pal-panels = Painéis

js-adv-pal-scenarios = Cenários

js-adv-params-hint-all = Todos os números individuais do cenário. Altere-os por passos, escreva-os ou use as teclas de seta; o cenário volta a ser executado.

js-adv-params-hint-guided = Arraste um cursor e o cenário volta a ser executado. Cada controlo escreve diretamente no texto do cenário abaixo.

js-adv-pin-already = Essa execução já está fixada.

js-adv-pin-first = Execução { $run } fixada. Altere um parâmetro, execute novamente e fixe também essa execução.

js-adv-pin-label = { $letter } · { $title } · execução { $run }

js-adv-pin-opening-compare =
    { $n ->
        [one] { $n } execução fixada. A abrir Comparar.
        [many] { $n } de execuções fixadas. A abrir Comparar.
       *[other] { $n } execuções fixadas. A abrir Comparar.
    }

js-adv-plan-view = Vista em planta

js-adv-plan-view-epoch = em { $epoch }

js-adv-plan-view-note = Cada ponto é um corpo na época da execução e cada curva é o traço orbital que o motor calculou para ele. Uma linha tracejada é uma ligação pedida pelo cenário. Escolha um planeta para ver as suas luas em torno dele.

js-adv-player-name-mission = repetição da missão

js-adv-player-name-orbit = repetição da órbita

js-adv-player-name-replay = repetição

js-adv-player-name-waterfall = repetição da cascata

js-adv-player-pause = Pausar a { $name }

js-adv-player-play = Reproduzir a { $name }

js-adv-player-position = Posição na { $name }

js-adv-png-download-title = Imagem de alta resolução para diapositivos e documentos

js-adv-png-export-failed = A exportação PNG falhou: { $reason }

js-adv-ready-live = Pronto. Executa-se localmente no seu navegador.

js-adv-ready-recorded = Pronto. A mostrar execuções registadas.

js-adv-receiver-at-time = Recetor em t = { $time }

js-adv-recorded-edit-notice = O WebAssembly está bloqueado nesta página, pelo que esta página mostra execuções reais dos cenários incluídos, registadas com o motor v{ $version }. Os cenários editados, os varrimentos e as novas exportações requerem o motor em direto: abra kshana.dev ou sirva esta pasta localmente. Repor restaura o cenário registado.

js-adv-recorded-edited-warning = Editou o cenário: esta gravação é do ficheiro incluído, não da sua edição. Execute o comando no seu próprio ficheiro para obter a sua.

js-adv-recorded-intro = O WebAssembly está bloqueado nesta página, pelo que esta página mostra execuções reais dos cenários incluídos, registadas com o motor v{ $version }. A edição, os varrimentos e as novas exportações requerem o motor em direto em kshana.dev.

js-adv-recorded-run-native = execução registada, motor nativo

js-adv-recorded-written-by = Escrito pelo motor nativo de linha de comandos v{ $version } ({ $platform }) com { $command }. Apresentado sem alterações.

js-adv-replay = Repetição

js-adv-report-downloaded = Relatório descarregado.

js-adv-report-frame-title = Relatório da execução escrito pelo motor

js-adv-report-html = Relatório (HTML)

js-adv-report-html-title = O ficheiro do relatório, tal como o motor o escreveu

js-adv-report-load-failed = Não foi possível carregar o relatório registado ({ $reason }).

js-adv-report-loading = A carregar o relatório registado…

js-adv-report-none = Não existe nenhum relatório registado para este cenário.

js-adv-report-note = Cada execução em linha de comandos escreve um relatório: resumo, entradas, resultados, o gráfico, o que está verificado e o que está modelado, e um registo de reprodutibilidade. A versão para navegador não inclui esse escritor, pelo que este é o relatório que o motor nativo de linha de comandos escreveu para o cenário incluído. O relatório próprio do Studio sobre a execução no ecrã encontra-se em Exportações.

js-adv-report-open-tab = Abrir num novo separador

js-adv-report-open-tab-title = Abrir o relatório isoladamente

js-adv-report-orbit-title = Órbita (inercial centrada na Terra, ortográfica)

js-adv-report-stability-chart = Estabilidade do relógio

js-adv-report-stability-title = Estabilidade do relógio (desvio de Allan)

js-adv-restored-run = Execução { $run } restaurada.

js-adv-result = Resultado

js-adv-run-cancelled = Execução cancelada.

js-adv-run-cancelled-previous = Execução cancelada. O resultado anterior continua visível.

js-adv-run-failed = A execução falhou. Consulte a mensagem nos resultados.

js-adv-scenario-copied = Cenário copiado.

js-adv-scenarios-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-adv-share-link-copied = Ligação de partilha copiada. Contém o cenário exato.

js-adv-share-link-in-bar = Ligação colocada na barra de endereço.

js-adv-shared-link = ligação partilhada

js-adv-shared-needs-live = Esta ligação contém o seu próprio cenário, que requer o motor em direto. Abra-a em kshana.dev.

js-adv-shared-scenario = Cenário partilhado

js-adv-shared-scenario-question = Um cenário aberto a partir de uma ligação de partilha. É executado exatamente como foi partilhado.

js-adv-solar-bodies-label = Que corpos desenhar

js-adv-spectrum-part-label = Que parte do espetro

js-adv-spectrum-row-note = O espetro ao longo da linha da cascata em que a repetição se encontra.

js-adv-spectrum-row-title = Espetro ao longo da linha em exibição

js-adv-start-field-meta = { $domain } · campo { $field }

js-adv-start-fields-hint = Cada um abre o cenário com esse controlo realçado, pronto a alterar.

js-adv-start-fields-named =
    { $n ->
        [one] Campos com nome semelhante a “{ $query }”: em { $n } cenário
        [many] Campos com nome semelhante a “{ $query }”: em { $n } de cenários
       *[other] Campos com nome semelhante a “{ $query }”: em { $n } cenários
    }

js-adv-start-more-matches = mais { $n } correspondências: acrescente uma palavra para as reduzir.

js-adv-start-nothing = Nada corresponde a “{ $query }”. Experimente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-adv-start-scenarios-count = Cenários ({ $count })

js-adv-status-fetching-recorded = A carregar o motor… A obter o resultado registado deste cenário.

js-adv-status-ran-locally = Executado localmente às { $time }, execução { $run }.

js-adv-status-ran-locally-secs = Executado localmente às { $time }, execução { $run }, { $secs } s.

js-adv-status-recorded-native = Execução registada mostrada às { $time } (motor nativo).

js-adv-status-recorded-needs-engine = Execução registada mostrada às { $time } (requer o motor { $need }).

js-adv-status-recorded-shown = Execução registada mostrada às { $time }, execução { $run }.

js-adv-status-recorded-shown-secs = Execução registada mostrada às { $time }, execução { $run }, { $secs } s.

js-adv-status-showing-recorded = A carregar o motor… A mostrar o resultado registado deste cenário até o motor em direto estar pronto.

js-adv-subtabs-label = Mosaicos desta vista (telemóvel)

js-adv-suggest-campaign = Repetir uma missão de jamming, spoofing e holdover

js-adv-suggest-coverage = Mapear a cobertura de quatro constelações GNSS (sistema global de navegação por satélite)

js-adv-suggest-holdover = Tempo de manutenção quando o GNSS se perde

js-adv-suggest-waterfall = Observar um jammer na cascata da banda L

js-adv-svg-download-title = Gráfico vetorial com título e proveniência

js-adv-sweep-cancelled = Varrimento cancelado.

js-adv-sweep-done-line = Varridas { $done } de { $total } execuções localmente em { $time }.

js-adv-sweep-enter-range = Introduza um intervalo numérico.

js-adv-sweep-enter-range-second = Introduza um intervalo numérico para o segundo parâmetro.

js-adv-sweep-failed = O varrimento falhou: { $reason }

js-adv-sweep-interrupted = Varrimento interrompido por uma nova execução.

js-adv-sweep-needs-live = Um varrimento executa o motor muitas vezes, pelo que requer o motor em direto.

js-adv-sweep-none-line-chart = Nenhum (gráfico de linhas)

js-adv-sweep-nothing = Não há nada para varrer neste cenário.

js-adv-sweep-progress = A varrer a execução { $n } de { $total }…

js-adv-sweep-status-done = Varridas { $total } execuções às { $time }.

js-adv-sweep-title-grid = { $metric } sobre { $first } e { $second }

js-adv-sweep-title-line = { $metric } em função de { $parameter }

js-adv-sweep-wait = Aguarde que a execução atual termine e depois execute o varrimento.

js-adv-tab-animation = Animação

js-adv-tab-compare = Comparar

js-adv-tab-engine-report = Relatório do motor

js-adv-tab-exports-report = Exportações e relatório

js-adv-tab-ground-track = Traço no solo

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = Órbita 3D

js-adv-tab-overview = Resumo

js-adv-tab-signal-band = Sinal e banda

js-adv-tab-stability = Estabilidade

js-adv-tab-sweep = Varrimento

js-adv-tab-time-series = Série temporal

js-adv-tab-timing-masks = Máscaras de temporização

js-adv-th-at-tau-or-time = Em τ ou no tempo

js-adv-th-body = Corpo

js-adv-th-clock = Relógio

js-adv-th-distance-sun = Distância ao Sol

js-adv-th-figure = Valor

js-adv-th-file = Ficheiro

js-adv-th-format = Formato

js-adv-th-key-figure = Valor principal

js-adv-th-light-time-from = Tempo de luz unidirecional desde { $observer }

js-adv-th-light-time-observer = Tempo de luz unidirecional desde o observador

js-adv-th-limit = Limite

js-adv-th-margin = Margem

js-adv-th-mask-or-budget = Máscara ou orçamento

js-adv-th-metric = Métrica

js-adv-th-orbital-period = Período orbital

js-adv-th-provenance = Proveniência

js-adv-th-size = Tamanho

js-adv-th-source = Fonte

js-adv-th-tier = Nível

js-adv-th-unit = Unidade

js-adv-th-value = Valor

js-adv-th-verdict = Veredicto

js-adv-th-what-it-is = O que é

js-adv-the-body = o corpo

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-adv-timeline-chart-title = Cronologia da missão: { $title }

js-adv-timeline-latest-event = Último evento, às { $time }: { $label }

js-adv-timeline-no-event = Ainda não há nenhum evento neste momento.

js-adv-timeline-note = Um único cursor comanda todos os gráficos abaixo. Cada fase executa cenários normais; a campanha lê as suas saídas para uma única grelha temporal. As bandas sombreadas são as fases, as linhas verticais os eventos. Os valores acima são os canais da campanha no momento da repetição.

js-adv-timeline-on-one-clock = { $duration } num único relógio

js-adv-timeline-phase = Fase: { $phase }

js-adv-tour-back = Anterior

js-adv-tour-done = Concluir

js-adv-tour-eyebrow = Visita guiada

js-adv-tour-headline-body = O resumo de uma linha, a versão do motor e a impressão digital do cenário, e se cada valor está verificado ou modelado.

js-adv-tour-headline-title = Ler a resposta

js-adv-tour-keyboard-body = ⌘K encontra qualquer cenário, vista ou comando. [ e ] alternam entre vistas.

js-adv-tour-keyboard-title = Tudo a partir do teclado

js-adv-tour-library-body = Todos os cenários incluídos, agrupados por domínio de missão: jamming, espetro, spoofing, relógios, navegação, integridade, órbitas, projeto de constelações, navegação em órbita terrestre baixa, campanhas, a Lua, Marte e o sistema solar. Pesquise com /.

js-adv-tour-library-title = Escolher uma missão

js-adv-tour-next = Seguinte

js-adv-tour-params-body = Cursores guiados para os ajustes mais comuns, ou todos os campos numéricos do cenário. Cada alteração volta a executar.

js-adv-tour-params-title = Ajustar

js-adv-tour-pin-body = Fixe até quatro execuções e veja-as lado a lado, com diferenças e um traço de diferença.

js-adv-tour-pin-title = Comparar execuções

js-adv-tour-run-body = O motor Rust é executado no seu navegador como WebAssembly. Nada é enviado. ⌘↵ executa a partir de qualquer lugar.

js-adv-tour-run-title = Executar, localmente

js-adv-tour-share-body = Descarregue o relatório, o resultado, o cenário e as exportações do motor, ou copie uma ligação que contém o cenário exato, ou um iframe para uma página de curso ou wiki.

js-adv-tour-share-title = Partilhar ou exportar

js-adv-tour-skip = Saltar

js-adv-tour-source-body = O cenário completo em TOML. O que executa é exatamente o que pode partilhar e reproduzir.

js-adv-tour-source-title = Ou editar tudo

js-adv-tour-tabs-body = As vistas aparecem quando o resultado as suporta: sinal e banda para jamming, a cascata para o espetro, a cronologia da missão para campanhas, mapas de cobertura para constelações, holdover para relógios, máscaras para temporização de telecomunicações, órbitas 3D, traços no solo, varrimentos, e a animação e o relatório do próprio motor.

js-adv-tour-tabs-title = Todas as vistas da execução

js-adv-tracking-threshold-value = Limiar de seguimento { $value }

js-adv-transport-label = Repetição: um único cursor comanda todos os painéis desta execução

js-adv-transport-sub = um único cursor comanda todos os painéis desta execução

js-adv-unpin-run = Desafixar a execução { $run }

js-adv-waterfall = Cascata

js-adv-waterfall-note = A cor é a potência acima do nível de ruído do recetor. Os sinais de navegação ficam abaixo desse nível, pelo que o que se ilumina são os jammers. Reproduza a repetição ou arraste-a, e as bandas à direita mostram o que o recetor ainda segue nesse momento.

js-adv-waterfall-sub = densidade espetral de potência: frequência na horizontal, tempo na vertical

js-adv-waterfall-title = Cascata, { $name }

js-adv-webassembly-unavailable = WebAssembly indisponível

js-app-all-questions = Todas as perguntas

js-app-anim-frame-title = Animação desta execução, escrita pelo motor

js-app-anim-html-player = Leitor HTML

js-app-anim-html-player-title = O leitor de ficheiro único, tal como o motor o escreveu

js-app-anim-load-failed = Não foi possível carregar a animação registada ({ $reason }).

js-app-anim-loading = A carregar a animação registada…

js-app-anim-none = Não existe nenhuma animação registada para este cenário.

js-app-anim-note = O motor escreve uma animação de qualquer execução que tenha um eixo temporal: um SVG de reprodução automática e um leitor HTML de ficheiro único com os seus próprios controlos de reprodução e de deslocamento. A versão para navegador não inclui esse escritor, pelo que este é o ficheiro que o motor nativo de linha de comandos escreveu para o cenário incluído.

js-app-anim-svg = SVG animado

js-app-anim-svg-title = O SVG de reprodução automática, tal como o motor o escreveu

js-app-axis-averaging-time = tempo de média τ (s)

js-app-axis-observation-interval = intervalo de observação τ (s)

js-app-axis-value = valor

js-app-badge-modelled =
    { $n ->
        [one] { $n } modelado
        [many] { $n } de modelados
       *[other] { $n } modelados
    }

js-app-badge-recorded = Registado

js-app-badge-validated =
    { $n ->
        [one] { $n } verificado
        [many] { $n } de verificados
       *[other] { $n } verificados
    }

js-app-band-carrier = Portadora

js-app-band-carrier-unset = não definida neste cenário

js-app-band-chip-rate = Taxa de chip

js-app-band-jammer-bandwidth = Largura de banda do jammer

js-app-band-jammer-mhz = jammer { $mhz } MHz

js-app-band-jammer-power = Potência do jammer

js-app-band-jammer-type = Tipo de jammer

js-app-band-main-lobe = lóbulo principal do sinal

js-app-band-no-carrier-note = O motor calcula a razão entre a potência do jammer e a do sinal a partir do orçamento de ligação. Este cenário não indica uma frequência de portadora, pelo que não é desenhado nenhum espetro.

js-app-band-satellites = Satélites

js-app-band-svg-label = Bandas do sinal e do jammer em torno da portadora

js-app-band-tracking-threshold = Limiar de seguimento

js-app-browse-all-title = Todos os { $n } cenários

js-app-browse-area-kicker =
    { $n ->
        [one] Área · { $n } cenário
        [many] Área · { $n } de cenários
       *[other] Área · { $n } cenários
    }

js-app-browse-area-lede = Escolha um: abre-se logo no respetivo resultado.

js-app-browse-evidence = Os métodos do motor que os seus cenários executam têm { $validated } linhas verificadas e { $modelled } modeladas na matriz de verificação.

js-app-browse-evidence-title = Evidências por trás desta área.

js-app-browse-kicker = Explorar

js-app-browse-lede = Pesquise ou escolha uma área. Cada cenário abre-se logo no respetivo resultado.

js-app-browse-validated-examples = Verificados, por exemplo: { $examples }.

js-app-browser-cannot-run = A versão para navegador não consegue executar este cenário.

js-app-btn-all-exports = Todas as exportações

js-app-btn-all-exports-title = Todas as exportações desta execução, incluindo os formatos do próprio motor

js-app-btn-compare-pinned = Comparar as execuções fixadas

js-adv-sweep-done-grid =
    { $total ->
        [one] Varrida { $total } execução ({ $columns } × { $rows }) localmente em { $time }.
        [many] Varridas { $total } de execuções ({ $columns } × { $rows }) localmente em { $time }.
       *[other] Varridas { $total } execuções ({ $columns } × { $rows }) localmente em { $time }.
    }

js-app-btn-copy-embed = Copiar o código de incorporação

js-app-btn-copy-link = Copiar uma ligação para este cenário exato

js-app-btn-figure-png = Figura (PNG)

js-app-btn-figure-png-title = O gráfico no ecrã como imagem de alta resolução

js-app-btn-figure-svg = Figura (SVG)

js-app-btn-figure-svg-title = O gráfico no ecrã, com o seu título, a versão do motor e o DOI

js-app-btn-pin-compare = Fixar esta execução para comparar

js-app-btn-pin-count = Fixar esta execução ({ $n } fixadas)

js-app-btn-report-html = Relatório reprodutível (HTML)

js-app-btn-report-html-title = Um ficheiro offline: resumo, valores com níveis, gráficos e o cenário exato

js-app-btn-result-json = Dados do resultado (JSON)

js-app-btn-result-json-title = A saída completa do motor para esta execução

js-app-btn-run-history = Histórico de execuções

js-app-btn-scenario-toml = Ficheiro do cenário (TOML)

js-app-btn-scenario-toml-title = A entrada exata desta execução

js-app-btn-table-csv = Tabela (CSV)

js-app-btn-table-csv-title = Os mesmos bytes que a ferramenta de linha de comandos escreve como { $file }

js-app-bytes =
    { $n ->
        [one] { $n } byte
        [many] { $n } de bytes
       *[other] { $n } bytes
    }

js-app-cap-sub = { $areas } áreas, { $total } cenários prontos a executar. Cada área mostra um resultado real registado e a combinação de evidências que o sustenta: a parte dos seus métodos do motor verificada face a uma referência externa.

js-app-chain-hint = a saída de cada etapa alimenta a seguinte

js-app-chain-note = Um sistema seguido ao longo de todas as etapas do motor. A tabela abaixo indica cada número que uma etapa calculou e que a etapa seguinte utilizou.

js-app-chain-stage = Etapa { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } valor transmitido
        [many] { $n } de valores transmitidos
       *[other] { $n } valores transmitidos
    }

js-app-chart-allan-deviation = Desvio de Allan

js-app-chart-cn0-by-satellite = C/N0 efetivo por satélite

js-app-chart-default-title = Gráfico do Kshana

js-app-chart-ground-track = Traço no solo

js-app-chart-holdover-title = Holdover face a um orçamento de temporização

js-app-chart-mtie-title = MTIE (erro máximo de intervalo de tempo)

js-app-chart-not-drawn = Não foi possível desenhar este gráfico.

js-app-chart-scenario-hash = cenário { $hash }

js-app-chart-stability-title = Estabilidade do relógio (desvio de Allan sobreposto)

js-app-chart-tdev-title = TDEV (desvio de tempo)

js-app-chip-failed-title = Não foi possível iniciar o WebAssembly aqui. São apresentadas execuções registadas reais dos cenários incluídos.

js-app-chip-failed-title-reason = Não foi possível iniciar o WebAssembly aqui ({ $reason }). São apresentadas execuções registadas reais dos cenários incluídos.

js-app-chip-live = Motor em direto · v{ $version }

js-app-chip-live-title = O motor do Kshana está a ser executado neste navegador como WebAssembly

js-app-chip-loading = A carregar o motor

js-app-chip-loading-title = O motor está a ser descarregado. Entretanto, são apresentados resultados registados.

js-app-chip-recorded = Execuções registadas · v{ $version }

js-app-chip-unavailable = Motor indisponível

js-app-cli-note = Instale com { $command }. A execução escreve { $file }, um gráfico e um relatório.

js-app-cli-only-title = Este cenário é executado na linha de comandos, não no navegador.

js-app-cli-save-comment = # guarde o ficheiro do cenário abaixo como { $file } e depois

js-app-cmd-advanced = Mostrar todas as definições (definições avançadas)

js-app-cmd-browse = Explorar todos os cenários

js-app-cmd-compare = Comparar as execuções fixadas

js-app-cmd-embed = Copiar o código de incorporação

js-app-cmd-exports = Descarregar os resultados (exportações)

js-app-cmd-history = Abrir o histórico de execuções

js-app-cmd-home = Ir para o ecrã de abertura

js-app-cmd-how = Como isto é calculado

js-app-cmd-pin = Fixar esta execução para comparar

js-app-cmd-report = Descarregar o relatório

js-app-cmd-research = Código, dados e citação (para investigadores)

js-app-cmd-reset = Repor o texto do cenário

js-app-cmd-run = Executar o cenário

js-app-cmd-share = Copiar a ligação de partilha

js-app-cmd-theme = Alternar entre tema claro e escuro

js-app-cmd-tour = Iniciar a visita guiada

js-app-compare-deltas = As diferenças são relativas à execução A. O verde assinala o melhor valor de cada indicador.

js-app-compare-none = Estas execuções não partilham indicadores de mérito comparáveis. Fixe execuções da mesma família de cenários para ver números e diferenças.

js-app-compare-pin-two = Fixe pelo menos duas execuções para as comparar lado a lado. Fixe uma execução, altere um parâmetro ou escolha outro cenário da mesma família, execute-o e volte a fixar.

js-app-compare-run-head = { $letter } · execução { $id }

js-app-coverage-cell-note = Cada célula é um ponto da grelha em { $body }, avaliado em todas as épocas da execução.

js-app-coverage-dots-of = de

js-app-coverage-dots-post = satélites, percorridos ao longo dos seus traços no solo; reproduza a repetição para os mover.

js-app-coverage-dots-pre = Os pontos são

js-app-coverage-field-label = Campo a mapear

js-app-coverage-map = Mapa de cobertura

js-app-coverage-map-select = Mapa

js-app-coverage-over = sobre

js-app-coverage-title = { $field } sobre { $body }

js-app-crumb-all-scenarios = Todos os cenários

js-app-crumb-area = Área

js-app-crumb-search = Pesquisa: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Descarregar

js-app-edited-cli-only = Editado: este cenário só é executado no motor de linha de comandos.

js-app-edited-needs-engine = Editado: requer o motor { $need }.

js-app-edited-needs-live = Os cenários editados requerem o motor em direto.

js-app-embed-copied = Código de incorporação copiado.

js-app-engine-chart = Gráfico do motor

js-app-engine-chart-alt = Gráfico do motor para esta execução

js-app-engine-could-not-start = Não foi possível iniciar o motor: { $reason }. Sirva esta pasta por HTTP (por exemplo { $command }) em vez de abrir o ficheiro diretamente.

js-app-engine-failed = Não foi possível carregar o motor ({ $reason }).

js-app-engine-file-http = O ficheiro do motor devolveu HTTP { $status }.

js-app-engine-no-recordings = Não foi possível carregar o motor ({ $reason }) e não foram encontradas execuções registadas.

js-app-entries-count =
    { $n ->
        [one] { $n } entrada
        [many] { $n } de entradas
       *[other] { $n } entradas
    }

js-app-ev-aria = { $validated } linhas verificadas e { $modelled } modeladas na matriz de verificação

js-app-ev-title = { $validated } linhas verificadas · { $modelled } modeladas na matriz de verificação

js-app-ev-validated = verificadas

js-app-export-card-title = Exportação { $format }

js-app-export-checking = A verificar que formatos de efemérides esta execução pode exportar…

js-app-export-csv-desc = Os mesmos bytes que a ferramenta de linha de comandos escreve como { $file }.

js-app-export-csv-title = Tabela de reprodutibilidade

js-app-export-engine-loading = As exportações de efemérides aparecem aqui quando o motor tiver carregado.

js-app-export-json-desc = A saída completa do motor para esta execução, com unidades e proveniência.

js-app-export-json-title = Documento de resultado completo

js-app-export-not-recorded = Esta exportação é grande, pelo que não foi registada. Requer o motor em direto.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) para GMAT, Orekit ou STK

js-app-export-omm-desc = Catálogo CCSDS OMM (Orbit Mean-elements Message)

js-app-export-report-desc = Um ficheiro offline: resumo, valores com os respetivos níveis, todos os gráficos e o texto exato do cenário, com a versão do motor e o hash do cenário.

js-app-export-report-title = Relatório reprodutível

js-app-export-sp3-desc = Efemérides precisas SP3-c desta constelação

js-app-export-toml-desc = A entrada exata desta execução. Execute-a novamente em qualquer lugar com a ferramenta de linha de comandos ou com os pacotes Python e npm.

js-app-export-toml-title = Ficheiro do cenário

js-app-export-too-large = { $desc }. Demasiado grande para registar: requer o motor em direto.

js-app-fields-more = mais { $n }

js-app-fields-none = nenhum

js-app-fields-none-hint = Não há outros números individuais para alterar aqui. Edite o ficheiro em “Para investigadores”.

js-app-fields-top-of-file = início do ficheiro

js-app-find-matches =
    { $n ->
        [one] { $n } controlo guiado e { $m } de { $total } campos correspondem a “{ $query }”.
        [many] { $n } de controlos guiados e { $m } de { $total } campos correspondem a “{ $query }”.
       *[other] { $n } controlos guiados e { $m } de { $total } campos correspondem a “{ $query }”.
    }

js-app-find-none = Nenhum campo deste cenário corresponde a “{ $query }”. Pesquise em todos os cenários com a pesquisa da biblioteca.

js-app-geo-sub = { $name } · { $features } de { $total } elementos desenhados · registado com o motor nativo

js-app-geojson-title = Exportação GeoJSON: { $name }

js-app-gt-highlighted = Realçado: satélite visível a partir da estação.

js-app-gt-peak-doppler = Doppler máximo { $value } Hz.

js-app-gt-peak-elevation = Elevação máxima { $value }°.

js-app-health-check-tuning = verificar o ajuste

js-app-health-consistent = consistente

js-app-health-nees-band = NEES { $mean } (banda de 95% { $lo }–{ $hi }, alvo 2.0)

js-app-health-nis-band = NIS { $mean } (banda de 95% { $lo }–{ $hi }, alvo 1.0)

js-app-heat-map-label = Mapa de calor de { $metric }

js-app-hero-clock = { $elapsed } de { $total }

js-app-hero-mask = máscara de elevação de { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } local
        [many] { $n } de locais
       *[other] { $n } locais
    }

js-app-hero-positions-only = Apenas posições de satélites: sem potência de sinal, estado de saúde dos satélites nem terreno.

js-app-hero-ramp = { $lo } a { $hi } { $field }

js-app-hero-ramp-over = { $lo } a { $hi } { $field }, ao longo de { $duration }

js-app-hero-recorded-bare = Resultado registado

js-app-hero-satellites =
    { $n ->
        [one] { $n } satélite
        [many] { $n } de satélites
       *[other] { $n } satélites
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } passo de tempo
        [many] { $n } de passos de tempo
       *[other] { $n } passos de tempo
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } execução.
        [many] { $n } de execuções.
       *[other] { $n } execuções.
    }

js-app-history-pin = Fixar

js-app-history-restore = Restaurar

js-app-history-restored = Execução { $id } restaurada.

js-app-history-run = execução { $id } · { $time }

js-app-hit-in-scenario = em { $title }

js-app-hit-native-note = execução registada, motor nativo

js-app-hit-setting-meta = { $area } · definição { $name }

js-app-ho-budget = orçamento

js-app-ho-engine-budget = Holdover do motor ao orçamento do cenário ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover do motor ao orçamento do cenário: { $duration }

js-app-ho-error-after-loss = erro após a perda do GNSS em t = { $t } s

js-app-ho-error-since-fix = erro desde a última solução de posição

js-app-ho-stays-inside = permanece dentro deste orçamento durante todo o registo

js-app-ho-until-breached = até o orçamento ser ultrapassado

js-app-hover-classical = clássico

js-app-hover-quantum = quântico

js-app-how-checks = (verifica: { $requirement })

js-app-how-matrix = Os métodos do motor que este cenário executa têm { $validated } linhas verificadas e { $modelled } modeladas na matriz de verificação:

js-app-how-matrix-partner = Os métodos do motor que este cenário executa têm { $validated } linhas verificadas e { $modelled } modeladas na matriz de verificação, e { $partner } da responsabilidade de parceiros:

js-app-how-mix-chip = { $validated } verificadas · { $modelled } modeladas

js-app-how-more-notes =
    { $n ->
        [one] Mais { $n } nota do ficheiro do cenário
        [many] Mais { $n } de notas do ficheiro do cenário
       *[other] Mais { $n } notas do ficheiro do cenário
    }

js-app-how-more-rows =
    { $n ->
        [one] Mais { $n } linha na matriz de verificação (página Evidências do sítio).
        [many] Mais { $n } de linhas na matriz de verificação (página Evidências do sítio).
       *[other] Mais { $n } linhas na matriz de verificação (página Evidências do sítio).
    }

js-app-how-no-header = Este ficheiro de cenário não tem nota de cabeçalho. O resumo do motor abaixo indica o que foi executado.

js-app-how-no-matrix-row = Nenhuma linha da matriz de verificação nomeia ainda o tipo de motor deste cenário.

js-app-how-no-sources = O ficheiro do cenário não cita nenhuma fonte e nenhuma linha verificada da matriz cobre o seu tipo.

js-app-how-own-label = A própria etiqueta desta execução: { $label }

js-app-how-per-figure = Por valor, a partir do bloco figure_tiers do motor: { $validated } verificados, { $modelled } modelados. O nível de cada valor encontra-se na vista Resumo.

js-app-install-copy = Copiar: { $command }

js-app-install-label = Instalar a v{ $version }

js-app-interop-no-file = O motor não escreveu nenhum ficheiro deste formato para esta execução.

js-app-interop-not-apply = Não se aplica a este cenário: { $reason }.

js-app-interop-not-bundled = Não incluído aqui (tamanho): o comando acima escreve-o.

js-app-interop-note = O motor escreve a geometria e as amostras de sinal de uma execução em formatos que outras ferramentas abrem: CZML para o Cesium, KML (Keyhole Markup Language) para o Google Earth, GeoJSON para mapas, ficheiros de efemérides STK (.e) e gravações SigMF (Signal Metadata Format). A versão para navegador não inclui estes escritores, pelo que os ficheiros abaixo são os que o motor nativo de linha de comandos escreveu para o cenário incluído.

js-app-job-running = A executar

js-app-job-sweeping = A varrer

js-app-js-range-label = intervalo J/S

js-app-js-range-value = { $lo } a { $hi } dB

js-app-latest-event-at = Último evento, às

js-app-legend-all = capacidades do motor estão verificadas em toda a matriz de verificação; { $modelled } estão modeladas e { $partner } são da responsabilidade de parceiros.

js-app-legend-count = { $validated } de { $total }

js-app-load-failed = Não foi possível carregar { $file }.

js-app-mask-envelope = Envolvente do erro de tempo em holdover ({ $source })

js-app-mask-exceeded-after = excedido após { $duration }

js-app-mask-limit = limite { $value } ns

js-app-mask-not-exceeded = não excedido

js-app-meta-engine = motor

js-app-meta-file = ficheiro

js-app-meta-scenario = cenário

js-app-meta-seed = semente

js-app-meta-shared-link = ligação partilhada

js-app-meta-time = hora

js-app-mission-timeline = Cronologia da missão

js-app-native-edited-notice = A execução registada é a do ficheiro incluído, pelo que uma cópia editada não pode ser mostrada aqui: execute-a com a ferramenta de linha de comandos ou use Repor para ver a gravação.

js-app-native-recorded = O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version }, apresentada sem alterações. Não volta a ser executada quando edita.

js-app-native-recorded-c = O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ao executar { $command }, apresentada sem alterações. Não volta a ser executada quando edita.

js-app-native-recorded-p = O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ({ $platform }), apresentada sem alterações. Não volta a ser executada quando edita.

js-app-native-recorded-pc = O que vê é uma execução registada com o motor nativo de linha de comandos v{ $version } ({ $platform }) ao executar { $command }, apresentada sem alterações. Não volta a ser executada quando edita.

js-app-needs-live-engine = Isto requer o motor em direto.

js-app-needs-newer-engine = Requer um motor mais recente.

js-app-needs-newer-why = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é a v{ $version }.

js-app-no-chart-export = Esta vista não tem nenhum gráfico para exportar.

js-app-no-event-yet = Ainda não há nenhum evento neste momento.

js-app-no-recorded-run = Não existe nenhuma execução registada para este cenário. Requer o motor em direto.

js-app-no-recording-here = Não existe aqui nenhuma gravação do mesmo.

js-app-no-summary = (este cenário não publica nenhum resumo de uma linha)

js-app-noise-floor = nível de ruído { $value }

js-app-not-in-browser = Este cenário não é executado no navegador.

js-app-notice-shared-needs-live = Esta ligação contém o seu próprio cenário, que requer o motor em direto. Abra-a em kshana.dev.

js-app-on-one-clock = num único relógio

js-app-only-bundled-recording = Só pode ser mostrada a gravação do ficheiro incluído: use Repor para a ver, ou execute uma cópia editada com o motor { $need }.

js-app-opening-result = A abrir o resultado…

js-app-orbit-canvas-label = Vista 3D interativa do traço propagado

js-app-orbit-epoch-set = Rodada para a época da execução.

js-app-orbit-epoch-unset = Esta execução não indica uma época, pelo que o ângulo de rotação da Terra não tem significado aqui.

js-app-orbit-img-alt = Vista ortográfica do traço propagado

js-app-orbit-note = Arraste para rodar, use a roda do rato ou o gesto de pinça para ampliar. Terra à escala, imagens NASA Blue Marble.

js-app-orbit-static = Vista estática (a biblioteca 3D não pôde ser carregada aqui).

js-app-overlay-note = As linhas contínuas são a execução A e as tracejadas a execução B, nos mesmos eixos.

js-app-overlay-pinned = Sobreposição das execuções fixadas

js-app-overlay-title = { $title }: execução { $a } (A) face à execução { $b } (B)

js-app-overlay-with-diff = Sobreposição com a diferença B − A

js-app-pal-area = Área: { $label }

js-app-pal-nothing = Nada corresponde

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-app-pal-sec-areas = Áreas

js-app-pal-sec-commands = Comandos

js-app-pal-sec-scenarios = Cenários

js-app-pal-sec-settings = Definições

js-app-pal-sec-views = Vistas

js-app-pal-setting = Definição: { $label }

js-app-pal-view = Vista: { $label }

js-app-panel-close = Fechar

js-app-panel-close-full = Fechar o ecrã inteiro

js-app-panel-expand = Expandir

js-app-panel-expand-full = Expandir este painel para ecrã inteiro

js-app-panel-expand-title = Mostrar este painel em ecrã inteiro (Escape fecha-o)

js-app-params-hint = Altere um valor e execute novamente. A resposta e o gráfico são atualizados no próprio local.

js-app-phase = Fase:

js-app-pin-already = Essa execução já está fixada.

js-app-pin-compare =
    { $n ->
        [one] { $n } execução fixada. A abrir Comparar.
        [many] { $n } de execuções fixadas. A abrir Comparar.
       *[other] { $n } execuções fixadas. A abrir Comparar.
    }

js-app-pin-first = Execução { $id } fixada. Altere um parâmetro, execute novamente e fixe também essa execução.

js-app-pin-label = { $letter } · { $title } · execução { $id }

js-app-plan-view = Vista em planta

js-app-plan-view-at = em

js-app-player-pause = Pausar a repetição

js-app-player-pause-mission = Pausar a repetição da missão

js-app-player-pause-orbit = Pausar a repetição da órbita

js-app-player-pause-waterfall = Pausar a repetição da cascata

js-app-player-play = Reproduzir a repetição

js-app-player-play-mission = Reproduzir a repetição da missão

js-app-player-play-orbit = Reproduzir a repetição da órbita

js-app-player-play-waterfall = Reproduzir a repetição da cascata

js-app-player-position = Posição na repetição

js-app-player-position-mission = Posição na repetição da missão

js-app-player-position-orbit = Posição na repetição da órbita

js-app-player-position-waterfall = Posição na repetição da cascata

js-app-png-button-title = Imagem de alta resolução para diapositivos e documentos

js-app-png-export-failed = A exportação PNG falhou: { $reason }

js-app-py-note = Instale com { $command }.

js-app-ran-locally = Executado localmente às { $time }, execução { $n }.

js-app-ran-locally-took = Executado localmente às { $time }, execução { $n }, { $took } s.

js-app-receiver-at = Recetor em t =

js-app-recorded-edit-notice = O WebAssembly está bloqueado nesta página, pelo que esta página mostra execuções reais dos cenários incluídos, registadas com o motor v{ $version }. Os cenários editados, os varrimentos e as novas exportações requerem o motor em direto: abra kshana.dev ou sirva esta pasta localmente. Repor restaura o cenário registado.

js-app-recorded-intro = O WebAssembly está bloqueado nesta página, pelo que esta página mostra execuções reais dos cenários incluídos, registadas com o motor v{ $version }. A edição, os varrimentos e as novas exportações requerem o motor em direto em kshana.dev.

js-app-recorded-shown-native = Execução registada mostrada às { $time } (motor nativo).

js-app-recorded-shown-needs = Execução registada mostrada às { $time } (requer o motor { $need }).

js-app-recorded-shown-run = Execução registada mostrada às { $time }, execução { $n }.

js-app-recorded-shown-took = Execução registada mostrada às { $time }, execução { $n }, { $took } s.

js-app-recorded-with-commit = O que vê é a execução registada com uma compilação do motor no commit { $commit }, apresentada sem alterações; não volta a ser executada aqui.

js-app-recorded-with-engine = O que vê é a execução registada com o motor v{ $version }, apresentada sem alterações; não volta a ser executada aqui.

js-app-recording-edited-warning = Editou o cenário: esta gravação é do ficheiro incluído, não da sua edição. Execute o comando no seu próprio ficheiro para obter a sua.

js-app-replay = Repetição

js-app-report-downloaded = Relatório descarregado.

js-app-report-frame-title = Relatório da execução escrito pelo motor

js-app-report-html = Relatório (HTML)

js-app-report-html-title = O ficheiro do relatório, tal como o motor o escreveu

js-app-report-load-failed = Não foi possível carregar o relatório registado ({ $reason }).

js-app-report-loading = A carregar o relatório registado…

js-app-report-none = Não existe nenhum relatório registado para este cenário.

js-app-report-note = Cada execução em linha de comandos escreve um relatório: resumo, entradas, resultados, o gráfico, o que está verificado e o que está modelado, e um registo de reprodutibilidade. A versão para navegador não inclui esse escritor, pelo que este é o relatório que o motor nativo de linha de comandos escreveu para o cenário incluído. O relatório próprio do Studio sobre a execução no ecrã encontra-se em Exportações.

js-app-report-open-tab = Abrir num novo separador

js-app-report-open-tab-title = Abrir o relatório isoladamente

js-app-report-orbit-title = Órbita (inercial centrada na Terra, ortográfica)

js-app-report-stability-short = Estabilidade do relógio

js-app-report-stability-title = Estabilidade do relógio (desvio de Allan)

js-app-run-again = Executar novamente

js-app-run-cancelled = Execução cancelada.

js-app-run-cancelled-previous = Execução cancelada. O resultado anterior continua visível.

js-app-run-failed = A execução falhou. Consulte a mensagem nos resultados.

js-app-run-when-ready = Executar quando o motor estiver pronto

js-app-run-will-run = Será executado quando o motor estiver pronto

js-app-run-with-settings = Executar com estas definições

js-app-search-more-matches =
    { $n ->
        [one] mais { $n } correspondência: acrescente uma palavra para a reduzir.
        [many] mais { $n } de correspondências: acrescente uma palavra para as reduzir.
       *[other] mais { $n } correspondências: acrescente uma palavra para as reduzir.
    }

js-app-search-nothing = Nada corresponde a “{ $query }”. Experimente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-app-search-scenarios = Cenários ({ $n })

js-app-search-settings =
    { $n ->
        [one] Definições com nome semelhante a “{ $query }”: em { $n } cenário
        [many] Definições com nome semelhante a “{ $query }”: em { $n } de cenários
       *[other] Definições com nome semelhante a “{ $query }”: em { $n } cenários
    }

js-app-search-settings-hint = Cada uma abre o cenário com essa definição realçada, pronta a alterar.

js-app-share-copied = Ligação de partilha copiada. Contém o cenário exato.

js-app-share-in-address-bar = Ligação colocada na barra de endereço.

js-app-share-link-sub = É executado exatamente como foi partilhado.

js-app-share-link-title = Um cenário aberto a partir de uma ligação de partilha

js-app-shared-scenario = Cenário partilhado

js-app-shown-unchanged = Apresentado sem alterações.

js-app-solar-note = Cada ponto é um corpo na época da execução e cada curva é o traço orbital que o motor calculou para ele. Uma linha tracejada é uma ligação pedida pelo cenário. Escolha um planeta para ver as suas luas em torno dele.

js-app-solar-which-bodies = Que corpos desenhar

js-app-source-live = Resultado em direto · motor v{ $version }

js-app-source-native = Resultado registado, motor nativo · v{ $version }

js-app-source-recorded = Resultado registado · v{ $version }

js-app-source-recorded-loading = Resultado registado · v{ $version } · a carregar o motor

js-app-spectrum-row-note = O espetro ao longo da linha da cascata em que a repetição se encontra.

js-app-spectrum-row-title = Espetro ao longo da linha em exibição

js-app-spectrum-which-part = Que parte do espetro

js-app-status-last-run-took = A última execução demorou { $ms } ms no seu navegador. Nada é enviado.

js-app-status-loading-kept = O motor ainda está a carregar. As suas alterações são guardadas e executadas assim que estiver pronto.

js-app-status-loading-recorded = O motor ainda está a carregar. O resultado acima é uma execução registada.

js-app-status-not-run-yet = As suas alterações ainda não foram executadas.

js-app-status-runs-in-browser = Executa-se no seu navegador. Nada é enviado.

js-app-status-wasm-blocked = O WebAssembly está bloqueado aqui, pelo que são mostradas execuções registadas dos cenários incluídos.

js-app-stepper-decrease = Diminuir { $key }

js-app-stepper-increase = Aumentar { $key }

js-app-subtabs-label = Mosaicos desta vista (telemóvel)

js-app-svg-button-title = Gráfico vetorial com título e proveniência

js-app-sweep-cancelled = Varrimento cancelado.

js-app-sweep-done-1d = Varridas { $done } de { $total } execuções localmente em { $duration }.

js-app-sweep-done-2d =
    { $total ->
        [one] Varrida { $total } execução ({ $a } × { $b }) localmente em { $duration }.
        [many] Varridas { $total } de execuções ({ $a } × { $b }) localmente em { $duration }.
       *[other] Varridas { $total } execuções ({ $a } × { $b }) localmente em { $duration }.
    }

js-app-sweep-enter-range = Introduza um intervalo numérico.

js-app-sweep-enter-range-2 = Introduza um intervalo numérico para o segundo parâmetro.

js-app-sweep-failed = O varrimento falhou: { $reason }

js-app-sweep-interrupted = Varrimento interrompido por uma nova execução.

js-app-sweep-needs-live = Um varrimento executa o motor muitas vezes, pelo que requer o motor em direto.

js-app-sweep-none-line = Nenhum (gráfico de linhas)

js-app-sweep-nothing = Não há nada para varrer neste cenário.

js-app-sweep-progress = A varrer a execução { $n } de { $total }…

js-app-sweep-status-done =
    { $total ->
        [one] Varrida { $total } execução às { $time }.
        [many] Varridas { $total } de execuções às { $time }.
       *[other] Varridas { $total } execuções às { $time }.
    }

js-app-sweep-title-1d = { $metric } em função de { $knob }

js-app-sweep-title-2d = { $metric } sobre { $knob1 } e { $knob2 }

js-app-sweep-wait = Aguarde que a execução atual termine e depois execute o varrimento.

js-app-tab-animation = Animação

js-app-tab-compare = Comparar

js-app-tab-exports = Exportações e relatório

js-app-tab-ground = Traço no solo

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Máscaras de temporização

js-app-tab-orbit = Órbita 3D

js-app-tab-overview = Resumo

js-app-tab-report = Relatório do motor

js-app-tab-signal = Sinal e banda

js-app-tab-stability = Estabilidade

js-app-tab-sweep = Varrimento

js-app-tab-timeseries = Série temporal

js-app-th-at-tau = Em τ ou no tempo

js-app-th-body = Corpo

js-app-th-clock = Relógio

js-app-th-figure = Valor

js-app-th-file = Ficheiro

js-app-th-format = Formato

js-app-th-key-figure = Valor principal

js-app-th-light-time = Tempo de luz unidirecional desde { $observer }

js-app-th-limit = Limite

js-app-th-margin = Margem

js-app-th-mask-or-budget = Máscara ou orçamento

js-app-th-metric = Métrica

js-app-th-metric-2 = Métrica

js-app-th-orbital-period = Período orbital

js-app-th-provenance = Proveniência

js-app-th-size = Tamanho

js-app-th-source = Fonte

js-app-th-sun-distance = Distância ao Sol

js-app-th-tier = Nível

js-app-th-unit = Unidade

js-app-th-value = Valor

js-app-th-value-2 = Valor

js-app-th-value-3 = Valor

js-app-th-verdict = Veredicto

js-app-th-what-it-is = O que é

js-app-the-body = o corpo

js-app-the-chain = A cadeia

js-app-the-observer = o observador

js-app-tile-browse-all = Explorar todos os { $n } cenários

js-app-tile-browse-sub = Pesquisar por nome, pergunta ou definição

js-app-tile-preview-label = Pré-visualização registada de { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-app-timeline-chart-title = Cronologia da missão: { $title }

js-app-timeline-note = Um único cursor comanda todos os gráficos abaixo. Cada fase executa cenários normais; a campanha lê as suas saídas para uma única grelha temporal. As bandas sombreadas são as fases, as linhas verticais os eventos. Os valores acima são os canais da campanha no momento da repetição.

js-app-toast-copied = Copiado.

js-app-toast-copy-blocked = A cópia está bloqueada aqui.

js-app-toast-copy-blocked-select = A cópia está bloqueada aqui: selecione antes o texto.

js-app-toast-json-copied = JSON copiado.

js-app-toast-loading-run = O motor ainda está a carregar. A sua execução começa assim que estiver pronto.

js-app-toast-no-scenario = Não existe aqui nenhum cenário chamado { $name }. Estas são as correspondências mais próximas.

js-app-toast-not-single-number = Essa definição não é um número único neste cenário: edite-a no ficheiro do cenário.

js-app-toast-one-pinned = Está fixada uma execução. Altere uma definição, execute novamente e fixe essa execução para comparar as duas.

js-app-toast-opened-advanced = Aberto com as definições que alterou na vista Avançada.

js-app-toast-opened-at = Aberto em { $label }. Altere-o e execute novamente.

js-app-toast-scenario-copied = Cenário copiado.

js-app-tour-answer-body = Uma frase simples lida a partir do resultado, e a origem do resultado: uma execução em direto no seu navegador ou uma execução registada com o mesmo motor.

js-app-tour-answer-title = Primeiro, a resposta

js-app-tour-back = Anterior

js-app-tour-done = Concluir

js-app-tour-eyebrow = Visita guiada

js-app-tour-figures-body = Cada cartão é lido a partir do documento de resultado do motor.

js-app-tour-figures-title = Os valores que lhe respondem

js-app-tour-how-body = O método, o nível de evidência e as referências.

js-app-tour-how-title = Como isto é calculado

js-app-tour-next = Seguinte

js-app-tour-research-body = A linha de comandos e o Python para a executar por si próprio, os dados e as figuras, e como a citar.

js-app-tour-research-title = Para investigadores

js-app-tour-search-body = ⌘K encontra qualquer cenário, área, definição, vista ou comando.

js-app-tour-search-title = Pesquisar

js-app-tour-settings-body = As cinco definições mais importantes para esta pergunta. Altere uma e execute novamente. O motor é executado no seu navegador; nada é enviado.

js-app-tour-settings-title = Experimentar outras definições

js-app-tour-skip = Saltar

js-app-tour-views-body = Gráficos, mapas, repetições, o relatório do próprio motor e exportações. [ e ] alternam entre vistas.

js-app-tour-views-title = Todas as vistas da execução

js-app-tracking-threshold = Limiar de seguimento

js-app-transport-hint = um único cursor comanda todos os painéis desta execução

js-app-transport-label = Repetição: um único cursor comanda todos os painéis desta execução

js-app-unpin-run = Desafixar a execução { $id }

js-app-waterfall = Cascata

js-app-waterfall-hint = densidade espetral de potência: frequência na horizontal, tempo na vertical

js-app-waterfall-note = A cor é a potência acima do nível de ruído do recetor. Os sinais de navegação ficam abaixo desse nível, pelo que o que se ilumina são os jammers. Reproduza a repetição ou arraste-a, e as bandas à direita mostram o que o recetor ainda segue nesse momento.

js-app-waterfall-title = Cascata, { $name }

js-app-webassembly-unavailable = WebAssembly indisponível

js-app-written-by-native = Escrito pelo motor nativo de linha de comandos v{ $version } ({ $platform }) com

js-cat-acm-link-question = Ao longo de cada passagem, que modo DVB-S2 a ligação mantém e quantos dados move a passagem? (modelado)

js-cat-acm-link-title = Ligação descendente por satélite com codificação adaptativa

js-cat-aocs-slew-mekf-question = Com o controlador alimentado por um filtro de atitude e um giroscópio com enviesamento, como se compara a rotação com o caso de estado verdadeiro? (modelado)

js-cat-aocs-slew-mekf-title = Rotação sobre uma estimativa de atitude

js-cat-aocs-slew-question = A lei de realimentação estabiliza uma rotação de grande ângulo com quatro rodas e quanto trabalham as rodas? (a malha de controlo está verificada; a nave espacial é ilustrativa)

js-cat-aocs-slew-title = Rotação com rodas de reação

js-cat-aperture-duty-cycle-question = Quando uma abertura serve a navegação e as comunicações, que interrupção isso custa? (modelado)

js-cat-aperture-duty-cycle-title = Ciclo de trabalho da abertura

js-cat-araim-gps-galileo-question = Com GPS + Galileo e a hipótese de falha em toda a constelação, qual é a disponibilidade do RAIM avançado?

js-cat-araim-gps-galileo-title = ARAIM com duas constelações

js-cat-araim-reference-check-question = Os níveis de proteção do motor coincidem com os exemplos práticos publicados do Working Group C?

js-cat-araim-reference-check-title = Verificação de referência do ARAIM

js-cat-ascent-losses-question = Que parte do ganho de velocidade ideal de um lançador de dois estágios é consumida pela gravidade, pelo arrasto, pela orientação e pela contrapressão? (modelado)

js-cat-ascent-losses-title = Perdas na ascensão do lançamento

js-cat-attitude-budget-question = Qual é o binário perturbador no pior caso e o orçamento de erro de apontamento?

js-cat-attitude-budget-title = Orçamento de apontamento

js-cat-automotive-urban-canyon-question = Ao passar por uma passagem inferior e por um jammer na berma da estrada, um automóvel mantém-se dentro de um orçamento de meia faixa? (modelado)

js-cat-automotive-urban-canyon-title = Automóvel num desfiladeiro urbano

js-cat-campaign-jam-spoof-holdover-integrity-question = O que acontece a um recetor ao longo de jamming, spoofing, perda de GNSS, um alarme de integridade e a recuperação, numa única cronologia? (modelado)

js-cat-campaign-jam-spoof-holdover-integrity-title = Missão encadeada: jamming, spoofing, holdover, alarme

js-cat-campaign-monte-carlo-clock-holdover-question = Ao longo de muitas execuções com semente, o erro de tempo de um relógio em funcionamento livre corresponde à sua dispersão em forma fechada?

js-cat-campaign-monte-carlo-clock-holdover-title = Holdover de relógio por Monte Carlo

js-cat-campaign-optimize-link-budget-question = Em função da distância e da taxa de dados, onde é que uma ligação em banda X deixa exatamente 3 dB de margem?

js-cat-campaign-optimize-link-budget-title = Otimizar um orçamento de ligação

js-cat-campaign-shared-jammer-sea-road-question = Sob um único jammer, que plataforma perde a solução de posição: o navio a 30 km ou o automóvel a 50 km? (modelado)

js-cat-campaign-shared-jammer-sea-road-title = Um jammer, um navio e um automóvel

js-cat-campaign-spectrum-holdover-integrity-question = Um jammer afeta dois sinais da banda L, o relógio entra em holdover e o recetor recorre apenas ao Galileo: a monitorização de integridade continua a funcionar? (modelado)

js-cat-campaign-spectrum-holdover-integrity-title = Missão orientada pelo espetro

js-cat-campaign-sweep-jammer-power-question = À medida que um jammer a 1 km é aumentado de 10 nW para 10 W, quando é que o recetor perde a solução de posição? (modelado)

js-cat-campaign-sweep-jammer-power-title = Varrimento da potência do jammer

js-cat-cislunar-arc-recovery-question = Um estimador independente de mínimos quadrados recupera de facto o estado a partir do comprimento de arco que o teste de ordem prevê? (modelado; lento: cerca de 15 s num navegador)

js-cat-cislunar-arc-recovery-title = Recuperação de arco cislunar

js-cat-cislunar-observability-question = Que parte do estado de uma nave espacial cislunar um arco entre satélites torna observável?

js-cat-cislunar-observability-title = Observabilidade cislunar

js-cat-clock-ensemble-question = Em muitos sorteios de ruído, em que banda de confiança se situa o holdover?

js-cat-clock-ensemble-title = Conjunto de holdover de relógios

js-cat-clock-holdover-labsr-question = Como se compara um relógio ótico de estrôncio de laboratório com um relógio atómico à escala de chip em holdover?

js-cat-clock-holdover-labsr-title = Holdover de relógio, relógio ótico de laboratório

js-cat-clock-holdover-question = Durante quanto tempo um relógio consegue manter a hora depois de o GNSS falhar?

js-cat-clock-holdover-title = Holdover de relógio

js-cat-combined-altpnt-question = O que ganha a fusão de três canais de mapas escalares face a qualquer um deles isolado?

js-cat-combined-altpnt-title = alt-PNT combinado

js-cat-conflict-resilience-question = Como se degrada uma arquitetura PNT em camadas sob ameaças de jamming / spoofing / cinéticas / cibernéticas? (modelado)

js-cat-conflict-resilience-title = Resiliência em conflito

js-cat-constellation-multi-gnss-coverage-question = Com os quatro sistemas globais em conjunto, quantos satélites estão à vista e qual é a qualidade da geometria, em toda a Terra? (modelado)

js-cat-constellation-multi-gnss-coverage-title = Quatro constelações GNSS, um mapa

js-cat-contact-schedule-question = Para três satélites e três estações ao longo de 12 horas, que passagens mantém um plano sem conflitos e quantos dados move? (modelado)

js-cat-contact-schedule-title = Plano de contactos em terra

js-cat-domain-campaigns-label = Campanhas

js-cat-domain-campaigns-line = Missões encadeadas, varrimentos e execuções de Monte Carlo num único relógio.

js-cat-domain-constellations-label = Projeto de constelações

js-cat-domain-constellations-line = Projetar uma constelação e mapear a sua cobertura e o PDOP (diluição da precisão da posição).

js-cat-domain-deepspace-label = Lua, cislunar e Marte

js-cat-domain-deepspace-line = Navegação e tempo na Lua, no espaço cislunar e em Marte.

js-cat-domain-integrity-label = Integridade e posicionamento

js-cat-domain-integrity-line = Soluções de posição e se são de confiança: RAIM (monitorização autónoma da integridade pelo recetor) e a sua forma avançada, ARAIM.

js-cat-domain-interference-label = Jamming e interferência

js-cat-domain-interference-line = Jammers contra recetores de navegação por satélite: o que se perde e quando.

js-cat-domain-leo-label = Navegação em órbita terrestre baixa (LEO)

js-cat-domain-leo-line = Sinais de navegação em órbita terrestre baixa, passagens, mensagens e soluções de posição.

js-cat-domain-leo-missions-label = Missões e estudos LEO

js-cat-domain-leo-missions-line = Estudos e serviços construídos sobre uma camada em órbita terrestre baixa.

js-cat-domain-navigation-label = Navegação inercial e alternativa

js-cat-domain-navigation-line = Navegação inercial, por terreno, por gravidade e outra sem satélites.

js-cat-domain-orbits-label = Órbitas e geometria GNSS

js-cat-domain-orbits-line = Propagação de órbitas, efemérides e geometria dos satélites de navegação.

js-cat-domain-solar-label = Sistema solar

js-cat-domain-solar-line = Todos os planetas e luas numa só época, com tempos de luz.

js-cat-domain-spaceops-label = Análise de missão e operações espaciais

js-cat-domain-spaceops-line = Passagens, janelas de lançamento, reentrada, orçamentos de ligação e de atitude.

js-cat-domain-spectrum-label = Espetro

js-cat-domain-spectrum-line = Cascatas da banda de rádio: jammers, sinais e o que o recetor segue.

js-cat-domain-spoofing-label = Spoofing e segurança de sinal

js-cat-domain-spoofing-line = Sinais falsos e meaconing, e os monitores que os detetam.

js-cat-domain-studies-label = Quântica, estudos comparativos e interoperabilidade

js-cat-domain-studies-line = Sensores quânticos, estudos comparativos e formatos de interoperabilidade.

js-cat-domain-timing-label = Relógios e temporização

js-cat-domain-timing-line = Relógios sem satélites: holdover, estabilidade, máscaras de telecomunicações, transferência de tempo.

js-cat-earth-gnss-lunar-question = Um recetor perto da Lua consegue captar o GNSS da Terra e chega alguma vez para uma solução de posição? (modelado)

js-cat-earth-gnss-lunar-title = GNSS da Terra na Lua

js-cat-entry-heating-stardust-question = O modelo de entrada reproduz a desaceleração máxima publicada da cápsula de retorno de amostras Stardust?

js-cat-entry-heating-stardust-title = Entrada da cápsula Stardust

js-cat-eo-coverage-question = Que faixa de varrimento, distância de amostragem no solo e tempo de revisita dá uma órbita de observação da Terra (EO)?

js-cat-eo-coverage-title = Cobertura EO

js-cat-eo-radiometry-question = Para uma pequena câmara de observação da Terra, que relação sinal-ruído, MTF em Nyquist e NIIRS dá uma cena com 15 % de refletância? (modelado)

js-cat-eo-radiometry-title = Radiometria e qualidade de imagem do imageador

js-cat-ephemeris-question = Onde está o satélite e quando passa na vertical?

js-cat-ephemeris-title = Traço no solo

js-cat-europa-surface-pnt-question = Pode um módulo de aterragem na lua de Júpiter Europa ser posicionado a partir de uma pequena constelação de retransmissão e de uma distância à Terra? (modelado)

js-cat-europa-surface-pnt-title = Módulo de aterragem em Europa

js-cat-fusion-pnt-coupled-question = Com um único filtro de Kalman empilhado sobre a posição, o relógio e o enviesamento do acelerómetro, como supera o navegador uma falha de GNSS? (modelado)

js-cat-fusion-pnt-coupled-title = Navegador de fusão de sensores acoplado

js-cat-fusion-pnt-question = O que ganha um único estimador conjunto sobre relógio e posição?

js-cat-fusion-pnt-title = Fusão de sensores

js-cat-gnss-ins-aviation-question = Durante uma negação de GNSS de dois minutos que abrange uma curva inclinada, quanto deriva um INS fortemente acoplado de classe de navegação ou de classe tática? (modelado)

js-cat-gnss-ins-aviation-title = Curva de aeronave através de uma lacuna de GNSS

js-cat-gnss-ins-maritime-question = Após uma falha de GNSS de cinco minutos num navio em ziguezague, quanto deriva um INS de classe de navegação ou de classe tática? (modelado)

js-cat-gnss-ins-maritime-title = Navio em ziguezague durante uma falha de GNSS

js-cat-gnss-ins-question = Com que qualidade um navegador inercial assistido se mantém durante uma falha de GNSS?

js-cat-gnss-ins-rail-question = Ao atravessar uma trincheira profunda com dois satélites e depois um túnel, quanto deriva um INS fortemente acoplado? (modelado)

js-cat-gnss-ins-rail-title = Comboio através de uma trincheira e de um túnel

js-cat-gnss-ins-title = Fusão GNSS/INS

js-cat-gnss-sim-container-terminal-skyline-question = Com guindastes do lado do mar e pilhas do lado de terra, quantos satélites restam e o que acontece à proteção do RAIM? (modelado; skyline representativa)

js-cat-gnss-sim-container-terminal-skyline-title = Straddle carrier num cais de contentores

js-cat-gnss-sim-raim-question = Como é que a ionosfera e a troposfera moldam as pseudodistâncias em bruto, e o RAIM continua a proteger?

js-cat-gnss-sim-raim-title = Medições GNSS

js-cat-gnss-ssv-formation-heo-question = Com que qualidade um filtro conhece a posição relativa de duas naves espaciais a um quilómetro de distância, face à diferença das suas soluções de posição absolutas? (modelado; uma execução registada com o motor nativo)

js-cat-gnss-ssv-formation-heo-title = Navegação relativa em formação, órbita muito elíptica

js-cat-gnss-ssv-heo-question = O que ouve uma órbita muito elíptica ao longo do seu percurso: sinais à vista, melhor C/N0, lóbulo principal face ao lóbulo secundário, DOP e sinais rasantes? (modelado; uma execução registada com o motor nativo)

js-cat-gnss-ssv-heo-title = Sinais GNSS numa órbita muito elíptica

js-cat-gnss-ssv-lunar-weak-question = O que pode utilizar, a caminho da Lua, um recetor concebido para os sinais mais fracos? (modelado; uma execução registada com o motor nativo)

js-cat-gnss-ssv-lunar-weak-title = Sinais GNSS numa transferência lunar, recetor de sinais fracos

js-cat-gnss-ssv-nav-lunar-question = Com que qualidade um filtro de bordo mantém uma transferência lunar, face ao limite que declara? (modelado; uma execução registada com o motor nativo)

js-cat-gnss-ssv-nav-lunar-title = Filtro GNSS de bordo numa transferência lunar

js-cat-gnss-ssv-shell-question = Com que frequência uma nave espacial à altitude geoestacionária ouve pelo menos um e pelo menos quatro sinais de navegação, por constelação e banda? (modelado; uma execução registada com o motor nativo)

js-cat-gnss-ssv-shell-title = Sinais GNSS acima dos satélites: uma camada a 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = No campo gravítico real EGM2008 até ao grau 70, a correspondência com mapas consegue manter uma trajetória sem GPS? (modelado)

js-cat-gps-denied-gravity-nav-egm2008-title = Navegação gravítica no campo real

js-cat-gps-denied-gravity-nav-question = Quanto deriva a posição ao longo de uma hora inteira sem GNSS, e pode um mapa gravítico contê-la?

js-cat-gps-denied-gravity-nav-title = Navegação sem GNSS

js-cat-gravity-map-error-mc-question = À medida que o mapa gravítico guardado fica mais ruidoso, com que frequência a correspondência com mapas ainda mantém uma solução de posição sem GPS dentro do seu alvo? (modelado)

js-cat-gravity-map-error-mc-title = Monte Carlo do erro do mapa gravítico

js-cat-gravity-map-nav-question = Pode um gravímetro de átomos frios manter a posição sem GNSS, fazendo corresponder o campo gravítico que atravessa?

js-cat-gravity-map-nav-title = Navegação por mapa gravítico

js-cat-holdover-test-example-question = Desligar a antena e avaliar o holdover: um registo dividido nos dois instantes que o operador indica, cada passo medido face às máscaras ITU-T escritas para ele. (modelado; o registo é inventado para o exemplo)

js-cat-holdover-test-example-title = Ensaio de holdover: um registo de erro de tempo face às máscaras

js-cat-holdover-test-ptp4l-question = Os mesmos quatro passos lidos a partir de um registo de servo do ptp4l: a que distância das máscaras se mantém o desvio do próprio daemon enquanto o GNSS está ausente? (modelado; o registo é inventado para o exemplo)

js-cat-holdover-test-ptp4l-title = Ensaio de holdover: um registo do linuxptp

js-cat-hybrid-optical-rf-question = Que continuidade e integridade ganha a combinação de PNT ótico e de RF? (modelado)

js-cat-hybrid-optical-rf-title = Híbrido ótico/RF

js-cat-hybrid-pnt-question = O que ganha com um conjunto combinado de relógio e sensores inerciais?

js-cat-hybrid-pnt-title = PNT híbrido

js-cat-hybrid-ukf-question = O UKF fortemente acoplado de 17 estados é autoconsistente (NEES + brancura da inovação)? Uma verificação de autoconsistência, não uma afirmação de exatidão.

js-cat-hybrid-ukf-title = UKF híbrido de 17 estados

js-cat-impairment-eval-question = Com que qualidade um detetor separa jamming / spoofing / multipercurso do nominal? (ROC/AUC modelado)

js-cat-impairment-eval-title = Avaliação de degradações de RF

js-cat-imu-deadreckoning-question = Quanto deriva a posição ao avançar apenas com uma IMU?

js-cat-imu-deadreckoning-title = Navegação inercial por estima

js-cat-ins-trn-coast-question = Quanto deriva a posição durante uma falha de navegação e quando ultrapassa 10 m e 50 m? (modelado)

js-cat-ins-trn-coast-title = Navegação por inércia em INS/TRN

js-cat-integrity-harbour-approach-question = Com edifícios de cais e um quebra-mar a ocultar os satélites baixos, o GPS e o Galileo mantêm a proteção do ARAIM dentro dos limites de alerta? (modelado; skyline representativa)

js-cat-integrity-harbour-approach-title = ARAIM à entrada do porto

js-cat-integrity-raim-question = A geometria cumpre os limites de alerta (HPL / VPL)?

js-cat-integrity-raim-title = Integridade RAIM

js-cat-jamming-demo-question = A que razão entre jammer e sinal o recetor perde o bloqueio?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Sob um jammer de 2 W em terra, quantos satélites mantém um navio e quantos oculta o próprio cais? (modelado; skyline representativa)

js-cat-jamming-harbour-approach-skyline-title = Navio com jamming à entrada do porto

js-cat-l-band-waterfall-jamming-question = Que aspeto tem toda a banda L do GNSS enquanto se ligam um jammer de chirp, um de tom e um de ruído, e que sinais retira cada um? (modelado)

js-cat-l-band-waterfall-jamming-title = Cascata da banda L sob jamming

js-cat-launch-window-question = Que azimute de lançamento e Δv de dogleg alcançam uma inclinação alvo a partir de um local?

js-cat-launch-window-title = Janela de lançamento

js-cat-leo-band-trade-question = O que ganha e perde um sinal de navegação em órbita baixa em cada banda, desde as frequências ultra-altas (UHF) até à banda C? (conceções representativas)

js-cat-leo-band-trade-title = Compromisso de bandas, da UHF à banda C

js-cat-leo-doppler-positioning-question = Que qualidade tem uma solução de posição obtida com dez minutos de Doppler numa constelação de navegação em órbita baixa? (modelado)

js-cat-leo-doppler-positioning-title = Posicionamento apenas por Doppler

js-cat-leo-focus-data-services-question = Quanto custa, em bits da mensagem de navegação, cada serviço de dados adicional? (modelado)

js-cat-leo-focus-data-services-title = Dados de serviço face ao comprimento da trama

js-cat-leo-focus-fused-pnt-sisre-question = Quão bom tem de ser o erro de distância do sinal no espaço em órbita baixa para que a camada em órbita baixa ajude uma solução de posição fundida? (modelado)

js-cat-leo-focus-fused-pnt-sisre-title = Solução de posição fundida face ao erro de órbita e de relógio

js-cat-leo-focus-indoor-uhf-question = Que banda ainda chega a um utilizador no interior de um edifício tradicional e de um termicamente eficiente? (modelado)

js-cat-leo-focus-indoor-uhf-title = Receção em interiores por banda e edifício

js-cat-leo-focus-iot-eirp-question = Que potência de emissão do satélite necessita uma etiqueta a pilhas para durar? (modelado)

js-cat-leo-focus-iot-eirp-title = Energia do localizador face à potência de emissão

js-cat-leo-focus-ntn-bandwidth-question = Como diminui o erro de posicionamento à medida que o sinal de referência se alarga de 180 kHz para 20 MHz? (modelado)

js-cat-leo-focus-ntn-bandwidth-title = Posicionamento por ligação descendente 5G face à largura de banda

js-cat-leo-focus-ppp-altitude-question = Uma camada em órbita baixa mais baixa ou mais alta encurta mais a convergência? (modelado; lento, cerca de um minuto num navegador)

js-cat-leo-focus-ppp-altitude-title = Posicionamento preciso face à altitude da camada

js-cat-leo-focus-science-iono-sounding-question = Com que qualidade a diferença de atraso entre duas bandas mede o conteúdo eletrónico abaixo de um satélite em órbita baixa? (modelado)

js-cat-leo-focus-science-iono-sounding-title = Sondagem da ionosfera com duas bandas

js-cat-leo-indoor-uhf-question = Porque é que uma portadora UHF chega ao interior de um edifício quando as bandas L, S e C têm dificuldades? (modelado)

js-cat-leo-indoor-uhf-title = Interiores em UHF

js-cat-leo-iot-energy-question = Quanta energia gasta uma etiqueta a pilhas em cada solução de posição a partir de um sinal em órbita baixa? (modelado)

js-cat-leo-iot-energy-title = Energia por solução de posição de um localizador

js-cat-leo-navmsg-encode-decode-question = Quanto custa a quantização de cada campo e a trama sobrevive à codificação, à descodificação e a um bit corrompido? (modelado)

js-cat-leo-navmsg-encode-decode-title = Mensagem de navegação: trama binária

js-cat-leo-navmsg-fit-interval-trade-question = Durante quanto tempo pode uma mensagem difundida cobrir antes de o seu erro de órbita ultrapassar o alvo? (modelado; lento, cerca de 30 s num navegador)

js-cat-leo-navmsg-fit-interval-trade-title = Mensagem de navegação: intervalo de ajuste

js-cat-leo-navmsg-midpass-update-question = Quando um satélite passa a uma nova mensagem a meio de uma passagem, o utilizador vê um salto? (modelado)

js-cat-leo-navmsg-midpass-update-title = Mensagem de navegação: atualização a meio da passagem

js-cat-leo-navmsg-model-comparison-question = Que modelo de efemérides representa melhor uma órbita baixa e como se compara com uma tabela publicada? (modelado)

js-cat-leo-navmsg-model-comparison-title = Mensagem de navegação: quatro modelos

js-cat-leo-pass-iridium-question = Que intensidade de sinal e Doppler vê um avião comercial numa passagem do Iridium? (modelado)

js-cat-leo-pass-iridium-title = Rajadas do Iridium vistas de uma aeronave

js-cat-leo-pass-vs-gnss-cn0-question = Como se compara a intensidade de sinal de uma passagem em órbita baixa com a dos satélites Galileo à vista? (modelado)

js-cat-leo-pass-vs-gnss-cn0-title = Uma passagem face ao GNSS

js-cat-leo-pass-xona-pulsar-question = Que aspeto têm os sinais X1 e X5 numa passagem, para um navio no golfo da Biscaia? (modelado)

js-cat-leo-pass-xona-pulsar-title = Passagem do Xona Pulsar

js-cat-leo-pnt-end-to-end-question = Do projeto do sinal até à solução de posição final, o que entrega cada etapa à seguinte? (modelado)

js-cat-leo-pnt-end-to-end-title = De ponta a ponta, constelação genérica

js-cat-leo-ppp-convergence-question = Quanto mais depressa converge o posicionamento de ponto preciso (PPP) quando se acrescenta uma camada em órbita baixa? (modelado; lento, cerca de 30 s num navegador)

js-cat-leo-ppp-convergence-title = Convergência do posicionamento preciso

js-cat-leo-pvt-fjord-skyline-question = Quando as paredes do fiorde deixam uma faixa de céu ao longo do canal, quanto acrescenta uma camada em órbita baixa ao GPS e ao Galileo? (modelado; skyline representativa)

js-cat-leo-pvt-fjord-skyline-title = Ferry no interior de um fiorde

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Quando o GNSS sofre jamming, pode uma camada em órbita baixa noutras bandas manter a solução de posição e a sua integridade? (modelado)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS com jamming, a órbita baixa prossegue

js-cat-leo-resilience-js-margin-question = Quanto mais jamming sobrevive um sinal em órbita baixa mais forte do que um sinal GNSS de órbita média? (modelado)

js-cat-leo-resilience-js-margin-title = Margem de jammer a partir da potência recebida

js-cat-leo-resilience-multiband-diversity-question = À medida que um jammer na banda L é aumentado, qual das quatro bandas continua a seguir? (modelado)

js-cat-leo-resilience-multiband-diversity-title = Diversidade de bandas sob um jammer de barragem

js-cat-leo-resilience-spoof-doppler-question = Quando um spoofer desloca a posição calculada 30 m, com que rapidez uma verificação de Doppler e de geometria da passagem o deteta? (modelado)

js-cat-leo-resilience-spoof-doppler-title = Spoofing detetado por Doppler

js-cat-leo-resilience-spoof-monitors-question = Que monitor deteta que tipo de spoofer? (modelado)

js-cat-leo-resilience-spoof-monitors-title = Monitores de spoofing face a quatro spoofers

js-cat-leo-timing-utc-question = Com que proximidade pode um recetor recuperar o Tempo Universal Coordenado (UTC) a partir de satélites em órbita baixa, por oscilador e nível de sinal? (modelado)

js-cat-leo-timing-utc-title = Transferência de tempo para UTC

js-cat-leo-vertical-5g-network-timing-question = Quando o GNSS se perde durante um dia, o tempo em órbita baixa mantém uma estação de base dentro do seu limite de temporização? (modelado)

js-cat-leo-vertical-5g-network-timing-title = Temporização de estações de base 5G

js-cat-leo-vertical-asset-tracking-iot-question = Ao longo da viagem de um contentor, quanto custa cada solução de posição a uma etiqueta a pilhas? (modelado)

js-cat-leo-vertical-asset-tracking-iot-title = Localização de contentores

js-cat-leo-vertical-autonomous-vehicle-question = Quando edifícios ocultam os satélites baixos, uma camada em órbita baixa mantém um automóvel dentro de um erro ao nível da faixa? (modelado)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Modelado como uma rua real em vez de um corte plano a 35°, uma camada em órbita baixa continua a manter um automóvel dentro de um erro ao nível da faixa? (modelado; skyline representativa)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Veículo numa rua, não num corte plano

js-cat-leo-vertical-autonomous-vehicle-title = Veículo num desfiladeiro urbano

js-cat-leo-vertical-critical-infrastructure-timing-question = Quando o GNSS se perde, o tempo em órbita baixa mantém a sincronização de uma subestação? (modelado)

js-cat-leo-vertical-critical-infrastructure-timing-title = Temporização de uma subestação

js-cat-leo-vertical-polar-arctic-question = De Tromsø ao Polo Norte, o que acrescenta ao GNSS uma camada polar em órbita baixa? (modelado)

js-cat-leo-vertical-polar-arctic-title = Viagem ao Ártico

js-cat-leo-vertical-rail-maritime-question = Quando os cenários incluídos do navio e do comboio perdem o GNSS, uma passagem em órbita baixa ainda os alcança? (modelado)

js-cat-leo-vertical-rail-maritime-title = Ferrovia e navegação marítima com uma camada em órbita baixa

js-cat-link-budget-question = A ligação unidirecional fecha com margem à distância e à taxa de dados indicadas?

js-cat-link-budget-title = Orçamento de ligação

js-cat-lunanet-araim-question = Um conjunto lunar esparso de retransmissão cumpre os limites de integridade para um recetor na região do Artemis?

js-cat-lunanet-araim-title = Integridade lunar

js-cat-lunar-attack-surface-question = O que é preciso para fazer spoofing ou negar o acesso a um recetor na superfície lunar, e que orçamento de autenticação lhe responde? (modelado)

js-cat-lunar-attack-surface-title = Superfície de ataque lunar

js-cat-leo-pnt-mega-shell-question = Que cobertura e geometria dá uma constelação de navegação de 5,000 satélites em órbita terrestre baixa? (modelado; um projeto de exemplo)

js-cat-leo-pnt-mega-shell-title = Projeto de 5,000 satélites em órbita baixa

js-cat-lunar-beacon-question = Quanto reduz um punhado de balizas de superfície levantadas topograficamente o DOP do polo sul? (modelado)

js-cat-lunar-beacon-title = Balizas na superfície lunar

js-cat-lunar-differential-pnt-question = Quanto cancela a correção diferencial o erro de modo comum face à linha de base na Lua? (modelado)

js-cat-lunar-differential-pnt-title = PNT diferencial lunar

js-cat-lunar-frame-campaign-question = Que exatidão de datum resulta de uma campanha de observação em vez de uma transformação injetada? (modelado)

js-cat-lunar-frame-campaign-title = Campanha de referencial lunar

js-cat-lunar-frame-realisation-question = Pode um ajuste de datum de Helmert recuperar uma transformação de referencial lunar? (modelado)

js-cat-lunar-frame-realisation-title = Referencial lunar

js-cat-lunar-infrastructure-carrier-phase-question = Podem uma estação de superfície e um orbitador resolver em conjunto as ambiguidades inteiras da fase da portadora dos sinais GNSS da Terra? A execução rápida de exemplo. (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-carrier-phase-title = Fase da portadora lunar: estação de superfície e orbitador

js-cat-lunar-infrastructure-frame-coestimation-question = Quanta informação adicional acrescentam as distâncias orbitador-estação de superfície aos sete parâmetros do datum lunar? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-frame-coestimation-title = Coestimação do referencial lunar com ligações ao orbitador

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Quão sensíveis são a medição de distância por laser, o seguimento de orbitadores, um gravímetro e um relógio de superfície a h2, k2, l2 e à libração? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Sensibilidade dos números de Love lunares e da libração

js-cat-lunar-infrastructure-od-consistency-model-error-question = A mesma comparação com uma pequena aceleração não modelada injetada: a verificação de consistência deteta-a? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Determinação de órbita lunar, com um erro de modelação injetado

js-cat-lunar-infrastructure-od-consistency-question = A determinação de órbita a bordo por GNSS da Terra numa órbita de halo lunar e a determinação de órbita radiométrica independente a partir do solo concordam dentro das suas incertezas declaradas? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-od-consistency-title = Determinação de órbita lunar: GNSS a bordo face ao seguimento a partir do solo

js-cat-lunar-infrastructure-space-tie-question = Com que precisão podem ser ligados os desvios entre três técnicas, face ao erro da ligação local? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-infrastructure-space-tie-title = Ligação espacial: GNSS, VLBI e medição de distância por laser numa só nave espacial

js-cat-lunar-interop-export-question = Podem o referencial, o tempo e as efemérides lunares fazer uma viagem de ida e volta através de CCSDS OEM + um envelope KIF?

js-cat-lunar-interop-export-title = Exportação de interoperabilidade lunar

js-cat-lunar-jamming-question = A que distância pode estar um jammer e ainda impedir um recetor na superfície lunar? (modelado)

js-cat-lunar-jamming-title = Jamming lunar

js-cat-lunar-joint-od-clock-question = Uma ligação VLBI de linha de base terrestre torna observável a posição absoluta de uma estação lunar? (modelado)

js-cat-lunar-joint-od-clock-title = OD + relógio lunares conjuntos

js-cat-lunar-llr-datum-question = Que aspeto tem o datum lunar quando a campanha é de medição de distância lunar por laser (LLR) arquivada e real? (modelado; uma execução registada com o motor nativo)

js-cat-lunar-llr-datum-title = Datum lunar por medição de distância a laser

js-cat-lunar-relay-constellation-question = Que cobertura dá sobre toda a Lua uma constelação de retransmissão e navegação em órbitas lunares congeladas e baixas? (modelado; um projeto de exemplo)

js-cat-lunar-relay-constellation-title = Constelação de retransmissão lunar

js-cat-lunar-station-coverage-public-sources-question = Apenas com os pressupostos declarados publicamente, que erro corrigido dá a estação sobre o polo sul? O resultado é dominado pelos elementos orbitais, que não são públicos e estão definidos como ILUSTRATIVOS; esta é a entrada da previsão congelada. (modelado; não é uma afirmação sobre nenhum sistema real)

js-cat-lunar-station-coverage-public-sources-title = Estação de referência lunar, pressupostos públicos

js-cat-lunar-station-coverage-question = Sobre a região do polo sul e ao longo de um dia, que erro corrigido dá uma estação de referência lunar e até que distância dela a cobertura se mantém? (modelado; não é uma afirmação sobre nenhum sistema real)

js-cat-lunar-station-coverage-terrain-question = Com o horizonte de cada local traçado por ray-marching sobre um modelo real de elevação lunar, quanta cobertura perde a estação para o terreno? (modelado)

js-cat-lunar-station-coverage-terrain-title = Estação lunar com terreno real

js-cat-lunar-station-coverage-title = Cobertura da estação de referência lunar

js-cat-lunar-station-geodesy-baseline-question = Com que qualidade os cinco refletores retrorrefletores atuais fixam o datum lunar num calendário real, antes de se acrescentar qualquer estação? A linha de base de um par. (modelado; uma execução registada com o motor nativo)

js-cat-lunar-station-geodesy-baseline-title = Geodesia de estação lunar: apenas os cinco refletores

js-cat-lunar-station-geodesy-with-station-question = O mesmo calendário arquivado com um refletor adicional no polo sul e uma baliza VLBI: quanto se aperta o limite do datum? (modelado, local ilustrativo; uma execução registada com o motor nativo)

js-cat-lunar-station-geodesy-with-station-title = Geodesia de estação lunar: com uma estação no polo sul

js-cat-lunar-station-time-lab-question = Depois de o relógio de rubídio miniatura de uma estação ser sincronizado pela última vez com o tempo lunar, durante quanto tempo se mantém dentro de 1, 10 e 100 ns e que termo de erro domina? (modelado)

js-cat-lunar-station-time-lab-title = Laboratório de tempo da estação lunar

js-cat-lunar-time-budget-question = Qual é a dimensão do desvio de tempo coordenado Terra–Lua e o seu orçamento de erro? (modelado)

js-cat-lunar-time-budget-title = Orçamento de tempo lunar

js-cat-lunar-time-offset-question = Com que rapidez um relógio lunar diverge do tempo da Terra (~56–59 µs/dia)?

js-cat-lunar-time-offset-title = Desvio de tempo lunar

js-cat-lunar-vlbi-fim-question = Que exatidão de coordenadas da estação compra de facto um dado calendário de seguimento VLBI? (modelado)

js-cat-lunar-vlbi-fim-title = Informação VLBI lunar

js-cat-lunar-vlbi-question = Que atraso vê um par VLBI de linha de base terrestre para uma baliza na superfície lunar? (modelado)

js-cat-lunar-vlbi-title = VLBI lunar

js-cat-maritime-port-approach-coast-question = Ao entrar no porto sem GNSS, quando é que um INS de classe de navegação sai dos orçamentos do porto e do oceano? (modelado)

js-cat-maritime-port-approach-coast-title = Aproximação ao porto por inércia

js-cat-maritime-spoof-position-push-question = Quando um spoofer arrasta a solução de posição de um navio 500 m, que camadas de deteção o apanham? (modelado)

js-cat-maritime-spoof-position-push-title = Posição de navio alvo de spoofing

js-cat-maritime-strait-jamming-question = Ao longo de 30 km de mar aberto, um jammer de 50 W retira o GNSS a uma embarcação? (modelado)

js-cat-maritime-strait-jamming-title = Navio com jamming num estreito

js-cat-mars-orbit-pnt-question = Com que qualidade é posicionado um orbitador baixo de Marte a partir de doze retransmissores de navegação e o que acrescenta uma distância à Terra? (modelado)

js-cat-mars-orbit-pnt-title = Orbitador de Marte com retransmissores e uma ligação à Terra

js-cat-mars-pnt-lmo-question = Pode uma constelação de retransmissão MARCONI navegar um utilizador em Marte? (valor de mérito de covariância, não um PL certificado)

js-cat-mars-pnt-lmo-title = PNT de Marte, órbita baixa

js-cat-mars-pnt-surface-question = Com que qualidade se pode navegar um módulo de aterragem ou um veículo na superfície rotativa de Marte face à constelação de retransmissão?

js-cat-mars-pnt-surface-title = PNT de Marte, superfície

js-cat-mars-pnt-transfer-question = Com que qualidade é navegado em Marte um veículo numa trajetória de aproximação ou captura alta e excêntrica?

js-cat-mars-pnt-transfer-title = PNT de Marte, transferência

js-cat-meo-leo-fused-pvt-question = O que faz à exatidão da posição e à geometria o acréscimo de uma camada em órbita baixa ao GPS e ao Galileo? (modelado)

js-cat-meo-leo-fused-pvt-title = Solução de posição fundida GNSS e órbita baixa

js-cat-moonlight-service-volume-question = Que DOP, cobertura e integridade dá ao polo sul uma constelação da classe Moonlight/LCNS? (modelado)

js-cat-moonlight-service-volume-title = Volume de serviço lunar

js-cat-multi-band-jamming-waterfall-question = Com sinais de navegação distribuídos por quatro bandas, o que deixa de pé um jammer construído para uma banda? (modelado)

js-cat-multi-band-jamming-waterfall-title = Cascata de jamming multibanda

js-cat-notinbrowser-elevation-model = Requer o recorte do modelo de elevação lunar ({ $path }) que é distribuído com o repositório, não com a versão para navegador.

js-cat-notinbrowser-laser-ranging-data = Requer o excerto arquivado de dados de medição de distância por laser que é distribuído com o repositório, não com a versão para navegador.

js-cat-notinbrowser-study-suite = Um conjunto de estudos, não um cenário único. Execute-o com a ferramenta de linha de comandos: { $command }.

js-cat-ntn-5g-positioning-question = Com que precisão pode um telemóvel posicionar-se a partir de uma ligação descendente de uma rede 5G não terrestre, por largura de banda do sinal? (modelado)

js-cat-ntn-5g-positioning-title = Posicionamento por ligação descendente de satélite 5G

js-cat-oem-interop-question = Pode uma efeméride OEM do GMAT / Orekit / STK ser importada e feita viajar de ida e volta?

js-cat-oem-interop-title = Ponte CCSDS OEM

js-cat-optical-atmosphere-network-question = Com que frequência uma ligação ótica de temporização está ativa através de nuvens e turbulência e o que acrescentam locais em terra adicionais? (modelado; climas de nuvens ilustrativos)

js-cat-optical-atmosphere-network-title = Ligação ótica através da atmosfera, três locais

js-cat-optical-atmosphere-techniques-question = O que acrescentam uma abertura maior, outro comprimento de onda ou ótica adaptativa a uma ligação ótica ascendente com nuvens e turbulência? (modelado; clima de nuvens ilustrativo)

js-cat-optical-atmosphere-techniques-title = Técnicas de ligação ótica

js-cat-orbit-gnss-challenged-question = Quando é sequer possível uma solução de posição a partir da geometria dos satélites?

js-cat-orbit-gnss-challenged-title = Disponibilidade GNSS

js-cat-orbit-molniya-question = Um utilizador numa órbita Molniya muito excêntrica ainda vê satélites GNSS suficientes perto do apogeu?

js-cat-orbit-molniya-title = Utilizador Molniya

js-cat-orbit-multignss-question = Quanto aumentam GPS + Galileo em conjunto a disponibilidade e reduzem a diluição da precisão?

js-cat-orbit-multignss-title = Disponibilidade multi-GNSS

js-cat-orbit-real-tle-question = Que cobertura proporciona uma constelação real, dada como conjuntos de elementos de duas linhas?

js-cat-orbit-real-tle-title = Elementos reais de duas linhas

js-cat-orbit-rinex-question = Que disponibilidade resulta de uma efeméride de difusão RINEX 3 real?

js-cat-orbit-rinex-title = Efemérides de difusão

js-cat-orbit-sgp4-gps-question = Como se propaga ao longo de um dia uma constelação real semelhante ao GPS?

js-cat-orbit-sgp4-gps-title = Órbitas SGP4

js-cat-orbit-urban-canyon-skyline-question = No fundo de uma rua da cidade, durante quanto do dia o GPS e o Galileo dão quatro satélites e o que faz a faixa de céu ao PDOP? (modelado; skyline representativa)

js-cat-orbit-urban-canyon-skyline-title = Disponibilidade numa rua da cidade

js-cat-passes-question = Quando nasce e se põe um satélite sobre uma estação e durante quanto tempo?

js-cat-passes-title = Passagens sobre o solo

js-cat-polar-arctic-leo-coverage-question = Do equador ao polo, como mudam os satélites à vista e a geometria só com GNSS, só com uma camada polar em órbita baixa e com ambos? (modelado)

js-cat-polar-arctic-leo-coverage-title = Do equador ao polo

js-cat-pvt-abmf-question = Pode a posição de um recetor real ser resolvida a partir de medições RINEX em bruto?

js-cat-pvt-abmf-title = Posicionamento (SPP)

js-cat-quantum-anomaly-detect-question = Com que qualidade são detetadas falhas de sistemas quânticos a uma taxa de falsos alarmes fixa? (modelado)

js-cat-quantum-anomaly-detect-title = Deteção de anomalias quânticas

js-cat-quantum-cai-coast-question = Durante quanto tempo um interferómetro de átomos frios, especificado pela sua física, mantém a navegação por estima dentro de 100 m após a perda do GNSS, face a um acelerómetro de quartzo de classe de navegação? (modelado)

js-cat-quantum-cai-coast-title = Navegação por inércia com acelerómetro quântico

js-cat-quantum-gnss-free-nav-question = Quanto deriva um navegador de átomos frios face a um INS de classe de navegação sem GNSS? (modelado)

js-cat-quantum-gnss-free-nav-title = Navegação quântica sem GNSS

js-cat-quantum-pnt-demonstrator-suite-question = As três áreas de aplicação quântica como um único estudo (um conjunto de estudos em linha de comandos: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Estudo demonstrador de PNT quântico

js-cat-quantum-time-transfer-question = O que ganha a temporização quântica fiável face a uma cadeia clássica CSAC + RF? (modelado)

js-cat-quantum-time-transfer-title = Transferência de tempo quântica

js-cat-quantum-trade-question = Que holdover de temporização / inercial compra um relógio candidato face a uma linha de base clássica? (modelado)

js-cat-quantum-trade-title = Compromisso de PNT quântico

js-cat-rail-tunnel-coast-question = A 160 km/h através de um túnel, em quanto tempo um INS de classe tática sai do seu orçamento? (modelado)

js-cat-rail-tunnel-coast-title = Comboio através de um túnel

js-cat-realtime-frame-eop-question = Quanto erro de referencial introduz a orientação da Terra em tempo real (prevista)? (modelado)

js-cat-realtime-frame-eop-title = Referencial/EOP em tempo real

js-cat-reentry-question = Que g máximo e velocidade de aquecimento máximo vê uma reentrada balística?

js-cat-reentry-title = Corredor de reentrada

js-cat-slot-timing-ocxo-leo-question = Durante quanto tempo um oscilador de cristal controlado por forno, num pequeno satélite em órbita baixa, se mantém dentro da guarda do seu intervalo de tempo após a última solução de posição GNSS? (modelado)

js-cat-slot-timing-ocxo-leo-title = Temporização de intervalos

js-cat-small-uas-jammed-nav-question = Depois de um jammer retirar o GNSS, quanto deriva uma unidade inercial da classe de controlador de voo, face a uma de classe tática?

js-cat-small-uas-jammed-nav-title = Pequeno drone sob jamming

js-cat-solar-system-tour-question = Onde está cada corpo que o motor conhece, do Sol a Plutão e às luas grandes, e quanto tempo demora a luz entre eles?

js-cat-solar-system-tour-title = Sistema solar numa só época

js-cat-space-packet-question = Um fluxo de pacotes CCSDS 133.0 codifica e descodifica com exatidão ao bit?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Como é que a atividade solar / geomagnética altera a densidade termosférica? (modelado)

js-cat-space-weather-title = Meteorologia espacial

js-cat-spoof-attack-question = Um spoofing de tempo em rampa é detetado antes de atingir a especificação?

js-cat-spoof-attack-title = Deteção de spoofing

js-cat-spoof-detect-question = Pode um monitor fundido de RF + medições detetar um spoofing coordenado?

js-cat-spoof-detect-title = Deteção de spoofing multicamada

js-cat-spoof-meaconing-question = Com uma forma de ataque explícita, com que frequência um detetor de energia assistido por relógio deteta o spoofing a uma taxa de falsos alarmes fixa?

js-cat-spoof-meaconing-title = Estatísticas do detetor de spoofing

js-cat-starlink-sop-doppler-positioning-question = Com que qualidade pode um recetor posicionar-se a partir do Doppler de uma constelação de banda larga que não envia mensagem de navegação? (modelado)

js-cat-starlink-sop-doppler-positioning-title = Sinais de oportunidade de banda larga

js-cat-sweep-clock-stability-question = Como muda o holdover quando se varre um parâmetro do relógio?

js-cat-sweep-clock-stability-title = Varrimento de parâmetros

js-cat-sweep-nd-inertial-question = Como varia um valor de mérito numa grelha de vários parâmetros?

js-cat-sweep-nd-inertial-title = Varrimento N-D

js-cat-telecom-prtc-holdover-24h-question = Uma referência de rubídio que perde o GNSS durante 24 horas mantém-se dentro das máscaras de erro de tempo da ITU-T? (modelado)

js-cat-telecom-prtc-holdover-24h-title = Holdover de telecomunicações, 24 h

js-cat-telecom-synce-eec-question = Um oscilador controlado por forno em funcionamento livre mantém-se dentro das máscaras de deriva do relógio do equipamento de Ethernet síncrona? (modelado)

js-cat-telecom-synce-eec-title = Sincronização de frequência face às máscaras SyncE

js-cat-telecom-tie-ingest-question = Um registo de erro de intervalo de tempo cumpre as máscaras MTIE e TDEV da ITU-T?

js-cat-telecom-tie-ingest-title = Verificação de máscaras de telecomunicações, os seus dados

js-cat-terrain-nav-question = Pode um altímetro corrigir a deriva do INS fazendo corresponder um perfil de elevação do terreno?

js-cat-terrain-nav-title = Navegação por terreno

js-cat-terrain-slam-question = Pode um filtro de partículas acompanhar uma deriva do INS variável no tempo face a um mapa do terreno?

js-cat-terrain-slam-title = SLAM por terreno

js-cat-time-transfer-budget-question = O que fazem os termos da estação, do transponder, da ionosfera e de Sagnac a um desvio de tempo bidirecional e qual é o seu orçamento de incerteza? (modelado)

js-cat-time-transfer-budget-title = Transferência de tempo bidirecional por satélite

js-cat-timetransfer-question = Com que rigor podem dois locais manter-se sincronizados através de uma ligação?

js-cat-timetransfer-title = Transferência de tempo

js-cat-tracking-loop-question = A que C/N0 um recetor perde de facto o bloqueio e pode um spoofer arrastar as malhas? (modelado)

js-cat-tracking-loop-title = Malha de seguimento

js-cat-xona-pulsar-end-to-end-question = A mesma cadeia com números públicos do Xona Pulsar: sinal, passagem, mensagem, solução de posição fundida e posicionamento preciso. (modelado)

js-cat-xona-pulsar-end-to-end-title = De ponta a ponta, Xona Pulsar

js-cat-xona-pulsar-signals-question = Com que precisão pode um recetor medir distâncias nos sinais X1 e X5 publicados e qual é a dimensão da pesquisa de aquisição? (tabela pública de sinais)

js-cat-xona-pulsar-signals-title = Sinais do Xona Pulsar

js-geo-a-place = Um local…

js-geo-axis-east = E +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = A forma de desfiladeiro urbano requer o motor 0.36.

js-geo-canyon-out-of-range = Os valores do desfiladeiro urbano estão fora do intervalo (azimute 0 a 359.9°, largura 1 a 200 m, alturas 0 a 500 m, antena 0 a 50 m); é utilizado um horizonte aberto.

js-geo-canyon-reduced = A redução do desfiladeiro a uma tabela de 360 caixas feita pelo motor.

js-geo-compute-failed = O motor não conseguiu calcular este céu: { $reason }

js-geo-computing = A calcular…

js-geo-copy-link = Copiar esta ligação: { $url }

js-geo-count-below = Abaixo do horizonte

js-geo-count-hidden = Ocultos pela skyline

js-geo-count-in-view = À vista

js-geo-count-open-sky = Céu aberto

js-geo-count-used = Na solução

js-geo-cursor-live = Azimute { $az }°, skyline { $el }°.

js-geo-dated-sky = Um céu datado, apenas tão bom quanto os elementos e a sua idade; as predefinições ficam de fora.

js-geo-dop-geometric = geométrico

js-geo-dop-geometric-title = diluição geométrica da precisão

js-geo-dop-horizontal = horizontal

js-geo-dop-horizontal-title = diluição horizontal da precisão

js-geo-dop-position = posição, 3D

js-geo-dop-time = tempo

js-geo-dop-time-title = diluição da precisão do tempo

js-geo-dop-vertical = vertical

js-geo-dop-vertical-title = diluição vertical da precisão

js-geo-east = E

js-geo-engine-not-running = O motor não está a ser executado neste navegador ({ $reason }).

js-geo-err-geometry-object = a resposta de geometria do motor não é um objeto

js-geo-err-mc-object = a resposta de Monte Carlo do motor não é um objeto

js-geo-err-no-sentences = a resposta do motor não contém frases

js-geo-err-reply-kind-not-json = a resposta { $what } do motor não era JSON

js-geo-err-reply-not-json = a resposta do motor não era JSON

js-geo-error-line = Com σ_UERE = { $uere } m, sob o modelo de erro indicado (valores do motor): { $bits }.

js-geo-error-line-needs = Erro de posição ≈ σ_UERE × HDOP na horizontal e σ_UERE × VDOP na vertical; o valor requer o motor 0.36.

js-geo-error-rms-3d = RMS 3D σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = RMS horizontal σ_UERE × HDOP = { $m } m

js-geo-error-sigma = erro de 1 sigma este { $east } m, norte { $north } m

js-geo-fact-ellipse-1s = Elipse, 1 sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, eixo maior a { $deg }° do norte

js-geo-fact-ellipse-pct = Elipse, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1 sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Dentro da elipse de 95 %

js-geo-fact-inside-value = { $pct } % dos pontos

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } solução de mínimos quadrados, semente { $seed }
        [many] { $n } de soluções de mínimos quadrados, semente { $seed }
       *[other] { $n } soluções de mínimos quadrados, semente { $seed }
    }

js-geo-fact-rms-3d = RMS da nuvem, 3D

js-geo-fact-rms-3d-beside = { $rms } m, ao lado de σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = RMS da nuvem, horizontal

js-geo-fact-rms-h-beside = { $rms } m, ao lado de σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: não é GeoJSON (era esperado um FeatureCollection, um Feature ou uma geometria).

js-geo-gj-not-json = { $name }: não é JSON ({ $reason }).

js-geo-gj-not-object = { $name }: não é um objeto GeoJSON.

js-geo-gj-too-many =
    { $count ->
        [one] { $name }: { $count } elemento; esta página desenha no máximo { $max }.
        [many] { $name }: { $count } de elementos; esta página desenha no máximo { $max }.
       *[other] { $name }: { $count } elementos; esta página desenha no máximo { $max }.
    }

js-geo-legend-item = { $label }: { $used } na solução de { $total }

js-geo-link-copied = Ligação copiada.

js-geo-link-copied-no-tle = Ligação copiada (sem os seus elementos colados: uma ligação abre as predefinições).

js-geo-mc-off = Desligado

js-geo-missing-ellipse = a elipse de erro

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = a nuvem de Monte Carlo

js-geo-missing-open-sky = a fração de céu aberto

js-geo-missing-skyline = a skyline

js-geo-missing-tdop = TDOP

js-geo-needs = requer o motor 0.36

js-geo-needs-cap = Requer o motor 0.36

js-geo-no = Não

js-geo-no-ellipse = Sem elipse

js-geo-no-sats = Não há satélites para mostrar.

js-geo-north = N

js-geo-not-given = não indicado

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } conjunto de elementos foi ignorado: { $list }.
        [many] { $count } de conjuntos de elementos foram ignorados: { $list }.
       *[other] { $count } conjuntos de elementos foram ignorados: { $list }.
    }

js-geo-note-latitude-limited = Esta compilação do motor modela locais a menos de 89° do equador; a latitude foi limitada a esse valor.

js-geo-note-leo-left-out = LEO: requer o motor 0.36; deixado de fora.

js-geo-note-no-engine = O motor não está a ser executado neste navegador, pelo que não há nada para mostrar. É executado como WebAssembly; um navegador ou anfitrião que bloqueie o WebAssembly não consegue executar esta vista.

js-geo-note-pick-one = Escolha pelo menos um entre GPS, Galileo e BeiDou.

js-geo-note-skyline-not-applied = A skyline é desenhada mas não aplicada: a sua aplicação requer o motor 0.36. Os satélites atrás dela continuam a contar aqui.

js-geo-note-skyline-source = Skyline: { $source }.

js-geo-note-training-model = Modelo de céu de treino do motor { $version } (nmea_training) em { $instant }: ângulos em graus inteiros e DOP com uma casa decimal, como as frases do recetor os transportam; a solução de posição utiliza no máximo 12 satélites, escolhidos pela intensidade do sinal.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } registo de satélite de um sistema que esta vista não desenha foi deixado de fora.
        [many] { $count } de registos de satélites de um sistema que esta vista não desenha foram deixados de fora.
       *[other] { $count } registos de satélites de um sistema que esta vista não desenha foram deixados de fora.
    }

js-geo-off-leo = LEO: requer o motor 0.36.

js-geo-off-monte-carlo = A nuvem de Monte Carlo requer o motor 0.36.

js-geo-off-skyline = Aplicar uma skyline requer o motor 0.36: aqui é apenas desenhada.

js-geo-offset-own = Desvio face à época dos seus elementos ({ $epoch })

js-geo-offset-ref = Desvio face à época de referência das constelações

js-geo-open-sky-share = { $pct } % do hemisfério superior

js-geo-out-of-range = Fora do intervalo, pelo que se mantém o último valor válido: { $names }.

js-geo-own-elements-at = Os seus próprios elementos em { $epoch }.

js-geo-pick-constellation = Escolha pelo menos uma constelação.

js-geo-place-geiranger = Geirangerfjord, Noruega

js-geo-place-manhattan = Midtown Manhattan, Estados Unidos

js-geo-place-oslo = Porto de Oslo, Noruega

js-geo-place-rotterdam = Porto de Roterdão, Países Baixos

js-geo-place-singapore = Estreito de Singapura

js-geo-place-tallinn = Porto de Talin, Estónia

js-geo-place-tromso = Tromsø, Noruega

js-geo-plot-desc = { $total } satélites no gráfico, { $used } na solução.

js-geo-preset-illustrative = Contorno ilustrativo desenhado por esta página; aplicar uma skyline requer o motor 0.36.

js-geo-ready = Pronto.

js-geo-ready-needs = Pronto. Requer o motor 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: azimute { $az }°, elevação { $el }°, oculto pela skyline

js-geo-sat-unused = { $label } { $id }: azimute { $az }°, elevação { $el }°, não utilizado

js-geo-sat-used = { $label } { $id }: azimute { $az }°, elevação { $el }°, na solução

js-geo-scenarios-under = Os cenários do motor sob esta skyline:

js-geo-sky-canyon = Desfiladeiro urbano

js-geo-sky-drawn = Desenhado no skyplot

js-geo-sky-open = Horizonte aberto

js-geo-sky-preset = Predefinição: { $name }

js-geo-sky-source = Céu: { $source }.

js-geo-skyline-city-street = Rua da cidade

js-geo-skyline-container = Terminal de contentores

js-geo-skyline-fjord = Fiorde

js-geo-skyline-harbour = Aproximação ao porto

js-geo-skyline-load-failed = Não foi possível carregar a skyline ({ $reason }).

js-geo-skyplot-downloaded = Skyplot descarregado.

js-geo-skyplot-export-failed = Não foi possível exportar o skyplot ({ $reason }).

js-geo-source-geometry = Motor Kshana { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Motor Kshana { $version }, modelo de céu de treino

js-geo-south = S

js-geo-style-own-elements = Os seus elementos

js-geo-svg-refused = o SVG do motor foi recusado

js-geo-table-count =
    { $n ->
        [one] { $n } satélite, o mesmo do skyplot.
        [many] { $n } de satélites, os mesmos do skyplot.
       *[other] { $n } satélites, os mesmos do skyplot.
    }

js-geo-tle-epoch = Indique uma época UTC entre 2000 e 2099.

js-geo-tle-paste-first = Cole primeiro um ou mais conjuntos de elementos de duas linhas.

js-geo-tle-too-large = Os elementos colados são maiores do que 4 MiB, o limite de entrada do motor.

js-geo-used-masked = Não: oculto pela skyline

js-geo-using-own = A utilizar os seus próprios elementos. Uma ligação indica apenas que os utilizou, não os próprios elementos.

js-geo-wasm-blocked = O WebAssembly está bloqueado

js-geo-west = O

js-geo-why = Porquê

js-geo-why-interim = A elipse de erro e a nuvem de Monte Carlo requerem o motor 0.36 (as suas funções sky_geometry e sky_monte_carlo); o motor desta página é mais antigo.

js-geo-why-no-ellipse = O motor não deu nenhuma elipse para esta geometria (poucos satélites para uma solução de posição, ou uma geometria singular).

js-geo-why-no-ellipse-reason = O motor não deu nenhuma elipse para esta geometria (poucos satélites para uma solução de posição, ou uma geometria singular): { $reason }.

js-geo-why-waiting = A aguardar o motor.

js-geo-yes = Sim

js-hold-axis-seconds = segundos desde a primeira amostra

js-hold-axis-tau = tempo de observação τ, s (log)

js-hold-axis-te = erro de tempo, ns

js-hold-band-title = Banda de recuperação ±{ $band } ns

js-hold-blurb-example = Amostras a cada 5 s: 600 s bloqueado, GNSS removido aos 600 s, holdover, GNSS restabelecido aos 2400 s. O registo é gerado para o exemplo; não é uma medição.

js-hold-blurb-ptp4l = Os mesmos quatro passos lidos a partir de um registo de servo do ptp4l (o desvio do próprio daemon, em ns). O registo é escrito para o exemplo; nenhum daemon foi executado.

js-hold-budget-exceeded = { $name } excedido pela primeira vez { $s } s após a remoção

js-hold-chip-baseline = Linha de base face às suas máscaras

js-hold-chip-envelope = Envolvente de holdover ePRTC-A

js-hold-chip-holdover = Holdover face às suas máscaras

js-hold-chip-measured = medido face à máscara

js-hold-chip-recovery = Recuperação

js-hold-chip-words = Palavras

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } face ao tempo de observação, com os limites das máscaras

js-hold-envelope-exceeded = Envolvente de holdover ePRTC-A excedida pela primeira vez { $s } s após a remoção

js-hold-envelope-exceeded-short = { $verdict }, excedida pela primeira vez { $s } s após a remoção (o registo é mais curto do que o período da envolvente)

js-hold-envelope-exceeded-value = { $verdict }, excedida pela primeira vez { $s } s após a remoção

js-hold-envelope-short = { $verdict } (o registo é mais curto do que o período da envolvente)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: não é JSON.

js-hold-file-read-here = { $name }, lido aqui; nada foi enviado.

js-hold-file-too-large = { $name } é maior do que esta página consegue ler.

js-hold-from-record = o registo do resultado

js-hold-from-record-decimated = o registo do resultado, reduzido a { $have } de { $total } amostras

js-hold-gnss-removed = GNSS removido

js-hold-gnss-removed-stated = GNSS removido (indicado pelo operador)

js-hold-gnss-restored = GNSS restabelecido

js-hold-gnss-restored-stated = GNSS restabelecido (indicado pelo operador)

js-hold-largest-at = { $value } em T+{ $time } s

js-hold-limit-label = máscara de ±{ $ns } ns { $step }

js-hold-limit-title = { $id }: ±{ $ns } ns, o erro de tempo absoluto máximo no passo { $step }

js-hold-mark-title = { $id } limite { $limit } ns em τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n/d

js-hold-no-curve = Sem curva de erro de tempo: o registo não pôde ser reproduzido para desenho.

js-hold-no-which-curve = Nenhuma curva { $which } neste resultado.

js-hold-not-exceeded = não excedido

js-hold-not-recovered = não se manteve dentro da banda

js-hold-not-result = este não é um resultado de ensaio de holdover

js-hold-open-failed = Não foi possível abrir { $title }: { $reason }.

js-hold-opening = A abrir { $title }…

js-hold-phase-baseline = Linha de base: bloqueado

js-hold-phase-holdover = Holdover: GNSS removido

js-hold-phase-recovery = Recuperação: GNSS restabelecido

js-hold-phase-title = { $phase }, T+{ $from } s a { $to } s

js-hold-read-failed = Não foi possível ler ou desenhar ({ $reason }).

js-hold-recorded = { $title }: o resultado registado do motor (versão { $version }).

js-hold-recovered = dentro de ±{ $band } ns durante { $dwell } s, { $after } s após o regresso do GNSS

js-hold-result-not-json = o resultado não é JSON ({ $reason })

js-hold-result-not-loaded = o resultado registado não foi carregado

js-hold-row-envelope = Envolvente de holdover ePRTC-A

js-hold-row-frequency = Desvio de frequência mantido (declive ajustado)

js-hold-row-largest = Maior erro de tempo absoluto

js-hold-row-length = Duração do holdover

js-hold-row-margin = Menor margem dentro da envolvente

js-hold-row-peak = Pico após o restabelecimento

js-hold-row-recovery = Recuperação

js-hold-row-recovery-step = Maior passo durante a recuperação

js-hold-row-residual = Resíduo em torno dessa reta (rms)

js-hold-row-step = Passo no momento da remoção

js-hold-status-final = { $status } { $label }; medido face à máscara.

js-hold-step-span = T+{ $from } a { $to } s

js-hold-te-aria = Erro de tempo ao longo do registo, com as fases e os limites das máscaras

js-hold-te-line-title = Erro de tempo, ns

js-hold-te-note = Erro de tempo a partir de { $from }. Os dois instantes foram indicados por { $by }.

js-hold-th-budget = Orçamento

js-hold-th-budget-limit = Limite |TE|, ns

js-hold-th-first-exceeded = Primeiro excedido após a remoção, s

js-hold-th-largest = Maior |TE|, ns

js-hold-th-limit = Limite, ns

js-hold-th-margin = Margem, ns

js-hold-th-mask = Máscara

js-hold-th-mean = Média, ns

js-hold-th-measured-on = Medido em

js-hold-th-metric = Métrica

js-hold-th-rms = RMS, ns

js-hold-th-samples = Amostras

js-hold-th-source = Fonte

js-hold-th-span = Intervalo

js-hold-th-step = Passo

js-hold-th-value = Valor, ns

js-hold-th-verdict = Veredicto

js-hold-th-worst-at = Pior em τ ou T+, s

js-hold-title-example = Um registo de erro de tempo

js-hold-title-ptp4l = Um registo do linuxptp

js-hold-why-no-samples = o resultado não contém amostras de erro de tempo (record.series), pelo que não é desenhada nenhuma curva

js-hold-why-not-series = a série do resultado não é uma série temporal (menos de duas amostras, ou tempo não crescente), pelo que não é desenhada nenhuma curva

js-hold-why-sentence = { $why }.

js-hold-why-too-many = a série do resultado tem { $have } amostras quando o motor avaliou { $scored }, pelo que não é desenhada nenhuma curva

js-interf-attribution = Atribuição

js-interf-build-failed = { $name }: não foi possível construir ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Construído { $n } mapa diário a partir de { $name } com o motor { $version }, neste navegador.
        [many] Construídos { $n } de mapas diários a partir de { $name } com o motor { $version }, neste navegador.
       *[other] Construídos { $n } mapas diários a partir de { $name } com o motor { $version }, neste navegador.
    }

js-interf-built-detail = { $date }: { $published } células publicadas, { $flagged } sinalizadas

js-interf-built-from-sample = Construído a partir da amostra sintética { $kind } com o motor, neste navegador. Relatórios inventados; nenhuma aeronave, embarcação ou dia reais.

js-interf-built-maps =
    { $n ->
        [one] Construído { $n } mapa ({ $detail }). Apenas agregado: uma célula sinalizada não indica interferência como causa.
        [many] Construídos { $n } de mapas ({ $detail }). Apenas agregado: uma célula sinalizada não indica interferência como causa.
       *[other] Construídos { $n } mapas ({ $detail }). Apenas agregado: uma célula sinalizada não indica interferência como causa.
    }

js-interf-built-none = { $name }: o motor não construiu nenhum mapa.

js-interf-caveat-coverage = A cobertura depende da fonte de dados; leia as notas de cobertura.

js-interf-caveat-no-colour = Uma célula sem cor não foi observada. Não é prova de que a área estava livre.

js-interf-caveat-not-finding = Uma célula degradada ou anómala não é uma constatação de interferência. Existem outras causas.

js-interf-caveat-past-reports = Esta é uma descrição de relatórios de posição passados, não uma previsão nem uma medição de qualquer recetor.

js-interf-caveats = Ressalvas

js-interf-cell-size-rule = O tamanho da célula tem de ser um número de graus superior a 0 e no máximo 10, ou vazio para 0.5.

js-interf-check-failed = { $name }: não foi possível verificar ({ $reason }).

js-interf-click-cell = Clique numa célula, ou foque o mapa e use as teclas de seta, para ver os seus valores.

js-geo-dop-position-title = posição, diluição da precisão 3-D
