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

js-interf-close = Fechar

js-interf-close-file = Fechar { $name }

js-interf-col-affected = Afetadas

js-interf-col-cell-area = Área da célula

js-interf-col-detectors = Detetores

js-interf-col-observed = Observadas

js-interf-col-sampled = Amostradas

js-interf-col-share = Proporção

js-interf-col-status = Estado

js-interf-coverage-limits = Limites de cobertura desta fonte

js-interf-csv-too-big = { $name }: maior do que 24 MiB; construa a partir de um excerto (a ferramenta de linha de comandos aceita um ficheiro inteiro).

js-interf-csv-too-big-short = { $name }: maior do que 24 MiB; construa a partir de um excerto.

js-interf-custom-needs-licence = Um conjunto de dados personalizado precisa da licença, do respetivo URL e do texto de atribuição: são escritos no ficheiro do mapa.

js-interf-dataset = Conjunto de dados

js-interf-dates-rule = As datas são AAAA-MM-DD, ou vazias para não haver limite.

js-interf-day = Dia

js-interf-day-aria = Dia { $kind }

js-interf-day-confounded-note = Este dia é confundido: nenhuma célula foi classificada como degradada por causa do fundo do dia. As células que, de outro modo, se teriam destacado são mostradas como não avaliadas.

js-interf-day-figures-aria = Valores do dia

js-interf-demo-csv-name = { $file } (amostra sintética)

js-interf-demo-failed = Não foi possível abrir a demonstração: { $reason }.

js-interf-demo-opened = Demonstração sintética: três ficheiros inventados sobre uma região de oceano aberto inventada (dois dias de ADS-B, um deles confundido, e um dia de AIS). Não há nenhuma aeronave, embarcação ou dia real por trás deles. Use o seletor de dia na camada ADS-B.

js-interf-demo-route-name = route.csv (sintético)

js-interf-describe-map = Mapa { $kind } de { $date }: { $cells } células desenhadas, { $parts }. As células não desenhadas não foram observadas.

js-interf-did-not-load = { $url } não foi carregado

js-interf-engine-no-fn = Esta compilação do motor (versão { $version }) não tem { $fn }; é anterior a esta página. O equivalente na linha de comandos está na página Ferramentas.

js-interf-engine-start-failed = O motor não conseguiu arrancar aqui ({ $reason }). Abrir ficheiros de mapa acima continua a funcionar.

js-interf-err-format-version = { $name }: não é um mapa de interferência do Kshana suportado (format_version { $version }; esta página suporta { $supported }).

js-interf-err-no-rows = { $name }: não há rows[] neste relatório.

js-interf-err-not-json = { $name }: não é JSON ({ $reason }).

js-interf-err-not-map = { $name }: é GeoJSON, mas não é um mapa de interferência do Kshana (sem o membro kshana_interference_map).

js-interf-err-not-route = { $name }: não é um relatório de exposição de rota do Kshana (sem o membro kshana_route_exposure).

js-interf-err-route-schema = { $name }: o esquema { $schema } não é { $expected }, que esta página lê.

js-interf-err-source-kind = { $name }: source_kind { $kind } não é adsb nem ais.

js-interf-err-unknown-schema = { $name }: esquema { $schema } desconhecido; esta página lê { $supported }.

js-interf-foot-attribution = Atribuição: { $text }

js-interf-foot-coverage = Cobertura: { $notes }

js-interf-foot-layer = Camada { $kind }, { $date }. As células não desenhadas não foram observadas.

js-interf-foot-licence = Licença: { $licence }

js-interf-foot-licence-url = Licença: { $licence } ({ $url })

js-interf-grid = Grelha: células quadradas de { $size }° em latitude e longitude ({ $type }). A largura este-oeste diminui com a latitude.

js-interf-guards = Salvaguardas contra outras causas

js-interf-input = Entrada

js-interf-land-set = Polígonos de terra: { $name }.

js-interf-land-too-big = Esse ficheiro de terra é maior do que 24 MiB.

js-interf-larger-than = { $name }: maior do que { $limit }; esta página lê ficheiros de mapa até esse tamanho.

js-interf-layer-adsb-sub = células onde as aeronaves comunicaram baixa precisão de navegação

js-interf-layer-ais-sub = células onde as embarcações comunicaram posições ou movimentos implausíveis

js-interf-layer-heading = Camada { $kind }

js-interf-layer-hidden = A camada { $kind } está oculta.

js-interf-layers-separate = O ADS-B e o AIS são camadas separadas, com os seus próprios interruptores, legendas e linhas de licença. Nunca são fundidos num único campo de cor nem numa única contagem.

js-interf-legend-aria = O que significa cada estado de célula; desmarque um para esbater essas células

js-interf-licence = Licença

js-interf-licence-aria = Licença de dados de { $name }

js-interf-licence-heading = Licença de dados e atribuição

js-interf-map-aria = { $summary } As teclas de seta deslocam entre as células desenhadas.

js-interf-maps-open =
    { $n ->
        [one] { $n } mapa aberto.
        [many] { $n } de mapas abertos.
       *[other] { $n } mapas abertos.
    }

js-interf-method-summary = Método e ressalvas

js-interf-no-cell-at = Nenhuma célula em { $lat }, { $lon }: não observada. Isso não é prova de que a área estivesse livre.

js-interf-no-cell-drawn = nenhuma célula desenhada

js-interf-no-cells-draw = Este ficheiro não tem células para desenhar.

js-interf-no-day-figures = Este ficheiro não indica valores ao nível do dia.

js-interf-no-file-opened = Não foi possível abrir nenhum ficheiro.

js-interf-no-file-text = Os mapas abertos não têm texto de ficheiro para verificar (não foram abertos como ficheiros).

js-interf-none = nenhum

js-interf-none-stated = (nenhum indicado)

js-interf-none-stated-file = (nenhum indicado neste ficheiro)

js-interf-north-abbr = N

js-interf-not-evaluated = não avaliado

js-interf-not-opened-full = { $name }: não aberto, já há { $max } mapas abertos. Feche alguns primeiro.

js-interf-nothing-open = Ainda nada aberto.

js-interf-nothing-opened = Nada aberto.

js-interf-one-day = um dia de cada vez

js-interf-opened-file-map = Aberto { $files } ficheiro; { $maps } mapa aberto.

js-interf-opened-file-maps = Aberto { $files } ficheiro; { $maps } mapas abertos.

js-interf-opened-files-map = Abertos { $files } ficheiros; { $maps } mapa aberto.

js-interf-opened-files-maps = Abertos { $files } ficheiros; { $maps } mapas abertos.

js-interf-opening-demo = A abrir a demonstração sintética…

js-interf-parameters = Parâmetros, fixados antes de qualquer dado ser lido

js-interf-read-draw-failed = { $name }: não foi possível ler ou desenhar ({ $reason }).

js-interf-read-failed = { $name }: não foi possível ler ({ $reason }).

js-interf-read-with-map = Leia isto em conjunto com o mapa

js-interf-reading = A ler…

js-interf-route-aria = Exposição da rota { $name }

js-interf-route-chip = Rota

js-interf-route-done =
    { $n ->
        [one] Exposição da rota calculada a partir de { $n } mapa com o motor { $version }; o relatório é mostrado abaixo.
        [many] Exposição da rota calculada a partir de { $n } de mapas com o motor { $version }; o relatório é mostrado abaixo.
       *[other] Exposição da rota calculada a partir de { $n } mapas com o motor { $version }; o relatório é mostrado abaixo.
    }

js-interf-route-explain = Proporção do comprimento da rota em cada estado, por dia e por fonte. As quatro proporções somam 1 e leem-se em conjunto: uma proporção degradada baixa com uma proporção não observada alta não demonstra que a rota esteja livre. As linhas de ADS-B e de AIS nunca são combinadas.

js-interf-route-exposure = Exposição da rota

js-interf-route-needs-map = Abra ou construa primeiro pelo menos um mapa: a rota é verificada em relação aos mapas desta página.

js-interf-route-open-failed = Não foi possível abrir a rota: { $reason }.

js-interf-route-range = { $from } a { $to }

js-interf-route-too-big = { $name }: maior do que 24 MiB.

js-interf-row-affected-share = Proporção afetada

js-interf-row-aircraft-affected = Aeronaves afetadas

js-interf-row-aircraft-observed = Aeronaves observadas

js-interf-row-aircraft-sampled = Aeronaves amostradas

js-interf-row-area = Área

js-interf-row-cell = Célula

js-interf-row-detectors = Detetores que qualificaram

js-interf-row-flagged = Assinalada: { $detector }

js-interf-row-status = Estado

js-interf-row-vessels-observed = Embarcações observadas

js-interf-rows-skipped =
    { $count ->
        [one] { $count } linha não era válida e foi ignorada.
        [many] { $count } de linhas não eram válidas e foram ignoradas.
       *[other] { $count } linhas não eram válidas e foram ignoradas.
    }

js-interf-rt-day = Dia

js-interf-rt-km = Km da rota

js-interf-rt-licence = Licença e atribuição do mapa

js-interf-rt-shares = Proporções da rota

js-interf-rt-source = Fonte

js-interf-sample-failed = Não foi possível abrir a amostra: { $reason }.

js-interf-save = Guardar:

js-interf-save-report = Guardar o relatório (JSON)

js-interf-show-layer = Mostrar esta camada

js-interf-st-anomalous-label = Anómala

js-interf-st-anomalous-text = Pelo menos um detetor assinalou aqui, nesse dia, embarcações distintas em número suficiente (pelo menos 3 embarcações e 20% das observadas). As causas possíveis incluem interferência, mas também muitas causas comuns.

js-interf-st-confounded-label = Dia confundido

js-interf-st-confounded-text = A proporção mediana das células do dia inteiro foi alta, o que aponta para uma causa de área alargada. Nenhuma célula é declarada degradada num dia assim; esta célula, de outro modo, teria sido destacada.

js-interf-st-degraded-label = Degradada

js-interf-st-degraded-text = Uma proporção alta das aeronaves amostradas comunicou aqui, nesse dia, baixa precisão de navegação, muito acima da célula mediana do dia. Não diz porquê.

js-interf-st-no-background-label = Sem estimativa de fundo

js-interf-st-no-background-text = O fundo do dia (a proporção típica de aeronaves que comunicam baixa precisão) não pôde ser estimado a partir de células suficientes, pelo que nenhuma célula é comparada com ele e nenhuma é classificada.

js-interf-st-not-anomalous-label = Não anómala

js-interf-st-not-anomalous-text = Observada, e nenhum detetor qualificou. Não é prova de que nada tenha acontecido.

js-interf-st-not-degraded-label = Não degradada

js-interf-st-not-degraded-text = Amostrada, e a proporção de aeronaves que comunicam baixa precisão não se destacou. Não é prova de que nada tenha acontecido.

js-interf-st-too-few-label = Aeronaves insuficientes

js-interf-st-too-few-text = Publicada (pelo menos 5 aeronaves distintas observadas), mas foi possível amostrar menos de 10 aeronaves, pelo que não é feita nenhuma classificação.

js-interf-starting-build = A arrancar o motor e a construir…

js-interf-starting-route = A arrancar o motor e a verificar a rota…

js-interf-state-clear-adsb = Livre

js-interf-state-clear-adsb-text = Observada com aeronaves suficientes e não assinalada. Não é prova de que nada tenha acontecido.

js-interf-state-clear-ais = Livre

js-interf-state-clear-ais-text = Observada com embarcações suficientes e não assinalada. Não é prova de que nada tenha acontecido.

js-interf-state-degraded-adsb = Degradada

js-interf-state-degraded-adsb-text = Uma proporção alta das aeronaves amostradas comunicou aqui, nesse dia, baixa precisão de navegação, muito acima da célula mediana do dia.

js-interf-state-degraded-ais = Anómala

js-interf-state-degraded-ais-text = Pelo menos um detetor assinalou aqui, nesse dia, embarcações distintas em número suficiente (pelo menos 3 embarcações e 20% das observadas).

js-interf-state-notobs-adsb = Não observada

js-interf-state-notobs-adsb-text = Nenhuma célula desenhada: foram observadas poucas aeronaves para a publicar. Isto não é prova de que a área estivesse livre.

js-interf-state-notobs-ais = Não observada

js-interf-state-notobs-ais-text = Nenhuma célula desenhada: foram observadas poucas embarcações para a publicar. Isto não é prova de que a área estivesse livre.

js-interf-state-unassessed-adsb = Não avaliada

js-interf-state-unassessed-adsb-text = Observada, mas foi possível amostrar poucas aeronaves, o dia foi confundido, ou o fundo do dia não pôde ser estimado, pelo que não é feita nenhuma classificação.

js-interf-state-unassessed-ais = Não avaliada

js-interf-state-unassessed-ais-text = Observada, mas não é feita nenhuma classificação.

js-interf-status-unknown = Um estado que esta página não descreve.

js-interf-table-first = Primeiras { $shown } de { $total } células mostradas, as classificações relevantes primeiro.

js-interf-table-summary = Todas as células desenhadas como tabela ({ $n })

js-interf-the-day = O dia

js-interf-unknown-date = data desconhecida

js-interf-warn-cell-size = Este ficheiro usa um tamanho de célula de { $size }° que não é o pré-registado: não é o método pré-registado, pelo que as suas classificações não são comparáveis com as dos ficheiros que o usam.

js-interf-warn-cell-size-known = Este ficheiro usa um tamanho de célula de { $size }° que não é o pré-registado ({ $registered }°): não é o método pré-registado, pelo que as suas classificações não são comparáveis com as dos ficheiros que o usam.

js-interf-warn-day-confounded = Este dia é confundido: nenhuma célula foi classificada como degradada por causa do fundo do dia (a proporção mediana das células era, ela própria, alta).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } célula tem um indicador "degraded" que não concorda com o seu estado. O estado é o que é desenhado.
        [many] { $count } de células têm um indicador "degraded" que não concorda com o seu estado. O estado é o que é desenhado.
       *[other] { $count } células têm um indicador "degraded" que não concorda com o seu estado. O estado é o que é desenhado.
    }

js-interf-warn-no-licence = Este ficheiro não tem texto de { $fields }. É mostrado, mas um mapa sem a sua licença e atribuição não deve ser republicado.

js-interf-warn-on-land-off = O detetor em terra estava desligado para este ficheiro (não foram fornecidos polígonos de terra).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } elemento não era GeoJSON válido e foi ignorado.
        [many] { $count } de elementos não eram GeoJSON válido e foram ignorados.
       *[other] { $count } elementos não eram GeoJSON válido e foram ignorados.
    }

js-interf-warn-unknown-status = Valores de estado que esta página não conhece: { $values }. São desenhados como "sem classificação".

js-interf-withheld = retido (menos de 5)

js-interf-written-by = escrito pelo Kshana { $version }

js-kind-axis-3-d-position-error-m = erro de posição 3D (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = jitter do código (m)

js-kind-axis-code-tracking-jitter-m = jitter do seguimento do código (m)

js-kind-axis-doppler-shift-hz = desvio Doppler (Hz)

js-kind-axis-effective-c-n0-db-hz = C/N0 efetivo (dB-Hz)

js-kind-axis-elevation = elevação (°)

js-kind-axis-fit-interval-s = intervalo de ajuste (s)

js-kind-axis-formal-position-sigma-m = sigma formal da posição (m)

js-kind-axis-latitude = latitude (°)

js-kind-axis-leo-satellites-added-to-the = satélites LEO adicionados à solução de posição

js-kind-axis-mean-satellites-in-view = média de satélites à vista

js-kind-axis-median-dilution-of-precision = diluição de precisão mediana

js-kind-axis-median-error-m = erro mediano (m)

js-kind-axis-median-pdop = PDOP mediano

js-kind-axis-metres = metros

js-kind-axis-observation-window-s = janela de observação (s)

js-kind-axis-offset-from-the-signal-s = desvio em relação ao centro do sinal (MHz)

js-kind-axis-offset-from-the-snapshot-centre = desvio em relação ao centro do instantâneo (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = erro de posição (m)

js-kind-axis-power-spectral-density-db-hz = densidade espetral de potência (dB/Hz, potência unitária)

js-kind-axis-power-spectral-density-dbw-hz = densidade espetral de potência (dBW/Hz)

js-kind-axis-probability-of-detection = probabilidade de deteção

js-kind-axis-range-error-m = erro de distância (m)

js-kind-axis-relays = retransmissores

js-kind-axis-sisre-root-mean-square-m = SISRE, valor quadrático médio (m)

js-kind-axis-time-error-ns = erro de tempo (ns)

js-kind-axis-time-s = tempo (s)

js-kind-axis-time-since-the-start-min = tempo desde o início (min)

js-kind-axis-update-period-s = período de atualização (s)

js-kind-cap-body-pnt-label = Posicionamento por retransmissão

js-kind-cap-campaign-label = Campanha

js-kind-cap-constellation-design-label = Cobertura

js-kind-cap-leo-navmsg-label = Mensagem de navegação

js-kind-cap-leo-pass-label = Passagem e ligação

js-kind-cap-leo-pnt-chain-label = Cadeia de ponta a ponta

js-kind-cap-leo-ppp-label = Posicionamento

js-kind-cap-leo-pvt-label = Posicionamento

js-kind-cap-leo-signal-label = Projeto do sinal

js-kind-cap-lunar-llr-datum-label = Datum da telemetria laser

js-kind-cap-ntn-positioning-label = Posicionamento

js-kind-cap-solar-system-label = Sistema solar

js-kind-cap-spectrum-label = Espetro

js-kind-guided-doppler-error-hz = Erro de Doppler (Hz)

js-kind-guided-duration-s = Duração (s)

js-kind-guided-earth-range-error-m = Erro de distância à Terra (m)

js-kind-guided-elevation-mask = Máscara de elevação (°)

js-kind-guided-first-jammer-bandwidth-mhz = Largura de banda do primeiro jammer (MHz)

js-kind-guided-first-jammer-power-dbw = Potência do primeiro jammer (dBW)

js-kind-guided-first-jammer-range-m = Distância do primeiro jammer (m)

js-kind-guided-first-jammer-received-power-dbw = Potência recebida do primeiro jammer (dBW)

js-kind-guided-first-phase-length-s = Duração da primeira fase (s)

js-kind-guided-first-shell-altitude-km = Altitude da primeira camada orbital (km)

js-kind-guided-first-shell-inclination = Inclinação da primeira camada orbital (°)

js-kind-guided-first-signal-bandwidth-hz = Largura de banda do primeiro sinal (Hz)

js-kind-guided-first-system-range-error-m = Erro de distância do primeiro sistema (m)

js-kind-guided-fit-interval-s = Intervalo de ajuste (s)

js-kind-guided-gravity-field-degree = Grau do campo gravítico

js-kind-guided-grid-step = Passo da grelha (°)

js-kind-guided-integration-time-s = Tempo de integração (s)

js-kind-guided-leo-satellites-in-the-sweep = Satélites LEO no varrimento

js-kind-guided-loop-bandwidth-hz = Largura de banda da malha (Hz)

js-kind-guided-monte-carlo-runs = Execuções de Monte Carlo

js-kind-guided-network-synchronisation-error-m = Erro de sincronização da rede (m)

js-kind-guided-orbit-altitude-km = Altitude da órbita (km)

js-kind-guided-orbit-determination-error-m = Erro de determinação de órbita (m)

js-kind-guided-orbit-inclination = Inclinação da órbita (°)

js-kind-guided-pdop-threshold = Limiar de PDOP

js-kind-guided-peak-elevation-of-the-pass = Elevação máxima da passagem (°)

js-kind-guided-points-per-orbit-track = Pontos por traço de órbita

js-kind-guided-receiver-noise-figure-db = Fator de ruído do recetor (dB)

js-kind-guided-receiver-power-when-awake-mw = Potência do recetor quando ativo (mW)

js-kind-guided-reference-c-n0-db-hz = C/N0 de referência (dB-Hz)

js-kind-guided-relay-altitude-km = Altitude dos retransmissores (km)

js-kind-guided-relay-inclination = Inclinação dos retransmissores (°)

js-kind-guided-relay-planes = Planos dos retransmissores

js-kind-guided-relay-range-error-m = Erro de distância ao retransmissor (m)

js-kind-guided-relays-per-plane = Retransmissores por plano

js-kind-guided-runs-per-case = Execuções por caso

js-kind-guided-satellite-altitude-km = Altitude do satélite (km)

js-kind-guided-second-system-range-error-m = Erro de distância do segundo sistema (m)

js-kind-guided-shared-condition = Condição partilhada

js-kind-guided-slant-electron-content-tecu = Conteúdo eletrónico oblíquo (TECU)

js-kind-guided-slant-range-km = Distância oblíqua (km)

js-kind-guided-spoofed-offset-m = Desvio de spoofing (m)

js-kind-guided-spoofing-starts-s = Início do spoofing (s)

js-kind-guided-sweep-from = Varrer desde

js-kind-guided-sweep-steps = Passos do varrimento

js-kind-guided-sweep-to = Varrer até

js-kind-guided-timeline-step-s = Passo da cronologia (s)

js-kind-guided-tracking-threshold-db-hz = Limiar de seguimento (dB-Hz)

js-kind-guided-transmit-power-dbw = Potência de transmissão (dBW)

js-kind-guided-update-period-s = Período de atualização (s)

js-kind-guided-user-latitude = Latitude do utilizador (°)

js-kind-hint-a-band-under-this-carrier = uma banda abaixo desta densidade portadora-ruído perdeu o bloqueio

js-kind-hint-a-grid-point-is-available = um ponto da grelha está disponível enquanto a sua diluição de precisão de posição for inferior a este valor

js-kind-hint-a-satellite-must-be-this = um satélite tem de estar a esta altura para contar como à vista

js-kind-hint-a-satellite-must-be-this-2 = um satélite tem de estar a esta altura para ser usado

js-kind-hint-a-satellite-of-the-first = um satélite do primeiro sistema tem de estar a esta altura

js-kind-hint-arc-one-message-is-fitted = arco sobre o qual uma mensagem é ajustada

js-kind-hint-code-tracking-loop-noise-bandwidth = largura de banda de ruído da malha de seguimento de código

js-kind-hint-detail-of-the-truth-orbit = detalhe do modelo gravítico da órbita de referência

js-kind-hint-distance-from-the-first-jammer = distância do primeiro jammer ao recetor

js-kind-hint-distance-to-the-satellite-in = distância ao satélite na comparação de bandas

js-kind-hint-drawn-while-acquiring-and-tracking = consumida durante a aquisição e o seguimento

js-kind-hint-equivalent-isotropically-radiated-power-of = potência isotrópica radiada equivalente do primeiro jammer

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = potência isotrópica radiada equivalente da banda

js-kind-hint-filter-runs-averaged-for-each = execuções do filtro em média para cada caso (mais execuções, mais lento)

js-kind-hint-first-value-of-the-swept = primeiro valor do parâmetro varrido

js-kind-hint-height-of-the-chain-s = altura do satélite da cadeia

js-kind-hint-height-of-the-first-shell = altura das órbitas da primeira camada orbital

js-kind-hint-height-of-the-relay-orbits = altura das órbitas dos retransmissores acima do corpo

js-kind-hint-height-of-the-satellite-whose = altura do satélite cuja mensagem é ajustada

js-kind-hint-how-far-the-spoofer-moves = quanto o spoofer desloca a posição calculada

js-kind-hint-how-finely-each-orbit-is = com que finura cada órbita é amostrada para o desenho

js-kind-hint-how-high-the-satellite-climbs = a que altura o satélite sobe

js-kind-hint-how-long-the-first-phase = quanto tempo dura a primeira fase

js-kind-hint-how-long-the-receiver-integrates = durante quanto tempo o recetor integra para uma distância

js-kind-hint-how-many-low-orbit-satellites = quantos satélites de órbita baixa o varrimento de geometria acrescenta

js-kind-hint-how-many-seeded-runs-make = quantas execuções com semente formam o conjunto

js-kind-hint-how-many-values-are-run = quantos valores são executados

js-kind-hint-how-often-a-new-message = com que frequência é emitida uma nova mensagem

js-kind-hint-how-wide-the-first-jammer = quão largamente o primeiro jammer espalha a sua potência

js-kind-hint-ionosphere-along-the-path-in = ionosfera ao longo do percurso, em unidades de conteúdo eletrónico total

js-kind-hint-last-value-of-the-swept = último valor do parâmetro varrido

js-kind-hint-length-of-each-filter-run = duração de cada execução do filtro

js-kind-hint-length-of-the-run = duração da execução

js-kind-hint-length-of-the-timeline = duração da cronologia

js-kind-hint-occupied-bandwidth-of-the-first = largura de banda ocupada do primeiro sinal de referência

js-kind-hint-one-sigma-doppler-measurement-error = erro de medição de Doppler a um sigma

js-kind-hint-one-sigma-error-of-a = erro a um sigma de uma distância a um retransmissor

js-kind-hint-one-sigma-error-of-the = erro a um sigma da distância de ida e volta a partir da Terra

js-kind-hint-orbital-planes-of-the-navigation = planos orbitais dos retransmissores de navegação

js-kind-hint-power-of-the-first-jammer = potência do primeiro jammer no recetor

js-kind-hint-raises-the-noise-floor-under = eleva o nível de ruído sob todas as bandas

js-kind-hint-satellites-in-each-plane = satélites em cada plano

js-kind-hint-sets-the-doppler-range-a = define o intervalo de Doppler que uma pesquisa a frio tem de cobrir

js-kind-hint-signal-in-space-range-error = erro de distância do sinal no espaço do primeiro sistema

js-kind-hint-signal-in-space-range-error-2 = erro de distância do sinal no espaço do segundo sistema

js-kind-hint-signal-level-the-tracking-figures = nível de sinal a que os valores de seguimento são indicados

js-kind-hint-spacing-of-the-latitude-and = espaçamento da grelha de latitude e longitude

js-kind-hint-spacing-of-the-shared-mission = espaçamento da grelha de tempo partilhada da missão

js-kind-hint-the-part-of-the-range = a parte do erro de distância que a mensagem não consegue remover

js-kind-hint-the-value-every-member-runs = o valor com que cada membro é executado

js-kind-hint-tilt-of-that-orbit = inclinação dessa órbita

js-kind-hint-tilt-of-the-first-shell = inclinação dos planos da primeira camada orbital

js-kind-hint-tilt-of-the-relay-planes = inclinação dos planos dos retransmissores

js-kind-hint-timing-error-between-satellites-as = erro de temporização entre satélites, como distância

js-kind-hint-when-the-spoofer-captures-the = quando o spoofer captura o recetor

js-kind-hint-where-the-receiver-stands = onde se encontra o recetor

js-kind-hint-where-the-user-stands = onde se encontra o utilizador

js-kind-label-3-d-error = Erro 3D

js-kind-label-3-d-error-time-of = Erro 3D, tempo de chegada

js-kind-label-a-corrupted-frame-is-rejected = uma trama corrompida é rejeitada

js-kind-label-all-channels = todos os canais

js-kind-label-availability = Disponibilidade

js-kind-label-band = Banda

js-kind-label-bodies = Corpos

js-kind-label-body = Corpo

js-kind-label-both = ambos

js-kind-label-case = Caso

js-kind-label-class = Classe

js-kind-label-code-jitter = jitter do código

js-kind-label-constellation = Constelação

js-kind-label-doppler = Doppler

js-kind-label-event = Evento

js-kind-label-evidence = Evidência

js-kind-label-fewest-in-view = Mínimo à vista

js-kind-label-field = Campo

js-kind-label-first-detection-after-onset = Primeira deteção após o início

js-kind-label-frame-length = Comprimento da trama

js-kind-label-fused = fundido

js-kind-label-fused-cap = Fundido

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS e LEO

js-kind-label-gnss-channels = Canais GNSS

js-kind-label-gnss-highest-in-sky = GNSS { $id } (o mais alto no céu)

js-kind-label-gnss-only = só GNSS

js-kind-label-gnss-only-cap = Só GNSS

js-kind-label-gnss-signal = Sinal GNSS

js-kind-label-hdop = HDOP

js-kind-label-highest = Máximo

js-kind-label-horizontal-error = erro horizontal

js-kind-label-horizontal-error-2 = Erro horizontal

js-kind-label-jammer = Jammer

js-kind-label-jump-threshold = Limiar de salto

js-kind-label-largest-range-jump = Maior salto de distância

js-kind-label-largest-range-jump-against-the = maior salto de distância face ao limiar

js-kind-label-leo = LEO

js-kind-label-leo-channels = Canais LEO

js-kind-label-leo-only = só LEO

js-kind-label-light-time-from-observer = Tempo-luz desde { $observer }

js-kind-label-light-time-from-the-observer = Tempo-luz desde o observador

js-kind-label-light-time-one-way = Tempo-luz, num só sentido

js-kind-label-lowest = Mínimo

js-kind-label-lowest-c-n0 = C/N0 mínimo

js-kind-label-mean = Média

js-kind-label-mean-in-view = Média à vista

js-kind-label-median-convergence = Convergência mediana

js-kind-label-median-pdop = PDOP mediano

js-kind-label-member-runs = Execuções dos membros

js-kind-label-message-switch-iod = mudança de mensagem, emissão de dados { $old } para { $new }

js-kind-label-mission-length = Duração da missão

js-kind-label-model = modelo

js-kind-label-monte-carlo-runs = Execuções de Monte Carlo

js-kind-label-noise-floor = Nível de ruído

js-kind-label-parameters = Parâmetros

js-kind-label-payload = Carga útil

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, percentil 95

js-kind-label-peak-elevation = Elevação máxima

js-kind-label-peak-tracked-c-n0 = C/N0 seguido máximo

js-kind-label-phase = Fase

js-kind-label-predicted-horizontal-sigma = sigma horizontal previsto

js-kind-label-quantisation-position = Quantização, posição

js-kind-label-range-error = erro de distância

js-kind-label-relays-above-the-mask = retransmissores acima da máscara

js-kind-label-relays-and-earth-link = retransmissores e ligação à Terra

js-kind-label-relays-only = só retransmissores

js-kind-label-satellite = Satélite

js-kind-label-satellites = Satélites

js-kind-label-satellites-used = Satélites usados

js-kind-label-signal = Sinal

js-kind-label-signal-chip-spacing = { $name } (espaçamento de chip de { $spacing })

js-kind-label-sisre-after-quantisation = SISRE após quantização

js-kind-label-sisre-root-mean-square = SISRE, valor quadrático médio

js-kind-label-spoofing-starts = início do spoofing

js-kind-label-standard-deviation = Desvio-padrão

js-kind-label-sun-separation = Separação do Sol

js-kind-label-sweep-runs = Execuções do varrimento

js-kind-label-system = Sistema

js-kind-label-time-above-the-mask = Tempo acima da máscara

js-kind-label-time-error-root-mean-square = Erro de tempo, valor quadrático médio

js-kind-label-tracked-component = componente seguida

js-kind-label-tracking-threshold = Limiar de seguimento

js-kind-label-transmit-bandwidth = Largura de banda de transmissão

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Estimativa de Welch das amostras sintetizadas

js-kind-label-whole-signal = sinal inteiro

js-kind-label-wideband-j-s-tolerated = J/S de banda larga tolerado

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Disponibilidade do pior local

js-kind-no = não

js-kind-note-a-gap-is-an-epoch = Uma lacuna é uma época com poucos retransmissores à vista para uma solução de posição.

js-kind-note-a-helmert-transform-is-the = Uma transformação de Helmert é o deslocamento, a rotação e a escala de sete parâmetros entre dois referenciais.

js-kind-note-a-low-earth-orbit-leo = Um satélite de órbita terrestre baixa (LEO) atravessa o céu em minutos, pelo que o seu C/N0 (razão densidade portadora-ruído) sobe e desce em forma de sino; um satélite GNSS quase não se move no mesmo intervalo.

js-kind-note-a-receiver-independent-exchange-format = Um registo ao estilo do Receiver Independent Exchange Format (RINEX) 4. Os tipos de registo LEO são uma extensão do Kshana, como o cabeçalho indica.

js-kind-note-a-single-pass-fixes-the = Uma única passagem determina muito melhor a direção ao longo da pista do que a transversal.

js-kind-note-aos-is-acquisition-of-signal = AOS é a aquisição do sinal, TCA o instante de maior aproximação e LOS a perda do sinal.

js-kind-note-c-n0-is-the-carrier = C/N0 é a razão densidade portadora-ruído. Uma banda abaixo do limiar de seguimento do recetor perdeu o bloqueio.

js-kind-note-cells-are-the-code-and = As células são os compartimentos de código e de Doppler que uma pesquisa a frio tem de testar.

js-kind-note-cold-is-a-first-fix = A frio é uma primeira solução de posição sem conhecimento prévio; a quente é uma solução de posição pouco depois da anterior.

js-kind-note-dilution-of-precision-dop-scales = A diluição de precisão (DOP) converte um erro de distância num erro de posição: G é geométrica, P de posição, H horizontal, V vertical. Os percentis são sobre todos os pontos da grelha e épocas.

js-kind-note-drawn-at-the-strongest-signal = Desenhado ao nível de sinal mais forte da execução. Uma lacuna é um troço sem nenhum satélite à vista.

js-kind-note-each-body-carries-its-own = Cada corpo tem a sua própria etiqueta de evidência. O tempo-luz é num só sentido, a partir do observador indicado no cenário.

js-kind-note-each-row-is-one-full = Cada linha é uma execução completa do motor do cenário varrido.

js-kind-note-each-rule-is-a-switch = Cada regra é uma mudança para uma mensagem mais recente a meio da passagem.

js-kind-note-each-signal-is-drawn-about = Cada sinal é desenhado em torno da sua própria frequência central. Uma lacuna é um nulo espetral.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP é a potência isotrópica radiada equivalente.

js-kind-note-every-phase-is-an-ordinary = Cada fase é uma execução de cenário normal. Os hashes identificam a entrada de cada membro e o seu documento de resultado.

js-kind-note-iod-is-the-issue-of = IOD é a emissão de dados: o número de série da mensagem.

js-kind-note-j-s-is-the-jammer = J/S é a razão de potência entre o jammer e o sinal. A fração de seguimento é a parte da execução em que a banda se mantém acima do limiar.

js-kind-note-p05-p50-and-p95-are = p05, p50 e p95 são os percentis 5, 50 e 95. ci95 é o intervalo de confiança de 95% da média.

js-kind-note-parameters-are-public-with-a = Os parâmetros são PUBLIC (com uma fonte), REPRESENTATIVE ou WORKSHOP, conforme cada predefinição indica.

js-kind-note-precise-point-positioning-ppp-converges = O posicionamento preciso de ponto (PPP) converge quando o erro se mantém abaixo do critério. NEES é o erro de estimação normalizado ao quadrado, uma verificação de consistência do filtro.

js-kind-note-sisre-defined = SISRE é o erro de distância do sinal no espaço: o que a mensagem difundida acrescenta à distância de um utilizador. Aqui é o erro de representação da mensagem face à órbita de referência do próprio motor.

js-kind-note-sisre-is-the-signal-in = SISRE é o erro de distância do sinal no espaço assumido para a órbita e o relógio difundidos de cada sistema.

js-kind-note-ssc-is-the-spectral-separation = SSC é o coeficiente de separação espetral: quanta potência de um sinal cai dentro do recetor do outro. Um traço significa que os dois não se sobrepõem.

js-kind-note-the-chain-runs-the-signal = A cadeia executa por ordem as fases de sinal, passagem, mensagem de navegação, posicionamento e posicionamento preciso. Cada linha é um número que uma fase calculou e a seguinte usou.

js-kind-note-the-doppler-and-pass-geometry = O monitor de Doppler e de geometria da passagem compara as taxas de variação da distância medidas com as previstas a partir das órbitas. A regra assinala o início do spoofer.

js-kind-note-the-engine-draws-its-spectrum = O motor desenha o seu modelo de espetro como amostras em fase e em quadratura (IQ) num instante e estima de volta o espetro a partir delas. As mesmas amostras são a exportação SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = A trama binária documentada do próprio motor, fechada por uma verificação de redundância cíclica de 24 bits (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = A largura de banda de Gabor (valor quadrático médio) define com que nitidez um sinal permite medir distâncias.

js-kind-note-the-largest-jammer-to-signal = A maior razão jammer-sinal (J/S) que cada sinal consegue seguir, para um jammer de onda contínua (CW), de espetro adaptado e de banda larga.

js-kind-note-the-shapiro-delay-is-the = O atraso de Shapiro é o tempo-luz adicional devido à gravidade do Sol ao longo do percurso.

js-kind-note-the-spectrum-kind-and-the = O tipo spectrum e o tipo jamming calculam a mesma ligação de duas maneiras; a última coluna é a diferença entre eles.

js-kind-note-time-of-arrival-toa-ranging = Medição de distância por tempo de chegada (TOA) numa ligação descendente de rede não terrestre (NTN): um sinal mais largo mede distâncias com mais nitidez.

js-kind-note-what-half-a-least-significant = O que custa meio bit menos significativo (LSB) de cada campo em posição e em relógio, como distância.

js-kind-rowhead-block = Bloco

js-kind-rowhead-condition = Condição

js-kind-rowhead-figure = Valor

js-kind-rowhead-member = Membro

js-kind-rowhead-metric = Métrica

js-kind-rowhead-monitor = Monitor

js-kind-rowhead-phase = Fase

js-kind-rowhead-satellite = Satélite

js-kind-rowhead-signal = Sinal

js-kind-rowhead-solution = Solução

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = só Doppler

js-kind-sub-from-to = { $from } a { $to }

js-kind-sub-fused = fundido

js-kind-sub-gnss-and-leo-latitude = GNSS e LEO, latitude { $lat }°

js-kind-sub-gnss-only = só GNSS

js-kind-sub-gnss-only-latitude = só GNSS, latitude { $lat }°

js-kind-sub-model-fit-seconds = { $model }, ajuste de { $fit } s

js-kind-threshold-4-needed-for-a-fix = 4 necessários para uma solução de posição

js-kind-threshold-convergence-criterion = critério de convergência

js-kind-threshold-elevation-mask = máscara de elevação

js-kind-threshold-gnss-median = mediana GNSS

js-kind-threshold-tracking-threshold = limiar de seguimento

js-kind-title-acquisition = Aquisição

js-kind-title-against-a-simulated-campaign = Face a uma campanha simulada

js-kind-title-assumptions = Pressupostos

js-kind-title-band-trade-at-equal-transmit = Comparação de bandas com igual potência de transmissão

js-kind-title-bands = Bandas

js-kind-title-beside-the-published-figures = Ao lado dos valores publicados

js-kind-title-beside-the-published-speed-up = Ao lado da aceleração publicada

js-kind-title-bodies = Corpos

js-kind-title-body = Corpo

js-kind-title-by-latitude = Por latitude

js-kind-title-c-n0-by-band-over = C/N0 por banda ao longo da execução

js-kind-title-c-n0-over-the-pass = C/N0 ao longo da passagem

js-kind-title-cases = Casos

js-kind-title-central-body = Corpo central

js-kind-title-closed-form-doppler-against-finite = Doppler em forma fechada face a diferenças finitas

js-kind-title-code-tracking-jitter = Jitter do seguimento do código

js-kind-title-code-tracking-jitter-against-c = Jitter do seguimento do código face ao C/N0

js-kind-title-combined-over-the-members = Combinado sobre os membros

js-kind-title-compatibility-with-gnss-signals = Compatibilidade com os sinais GNSS

js-kind-title-constellations = Constelações

js-kind-title-continuity-across-message-switches = Continuidade entre mudanças de mensagem

js-kind-title-cross-check-against-the-jamming = Verificação cruzada com o tipo jamming

js-kind-title-datum-accuracy = Exatidão do datum

js-kind-title-dilution-of-precision-over-the = Diluição de precisão em toda a grelha

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Envelopes de Doppler

js-kind-title-doppler-only-fix = Solução de posição só por Doppler

js-kind-title-doppler-over-the-pass = Doppler ao longo da passagem

js-kind-title-doppler-positioning-from-one-pass = Posicionamento por Doppler a partir de uma passagem

js-kind-title-earth-link = Ligação à Terra

js-kind-title-elevation = Elevação

js-kind-title-encoded-frame = Trama codificada

js-kind-title-epoch = Época

js-kind-title-epoch-and-frame = Época e referencial

js-kind-title-events = Eventos

js-kind-title-every-node-of-the-sweep = Todos os nós do varrimento

js-kind-title-field-table = Tabela de campos

js-kind-title-figures-of-merit = Figuras de mérito

js-kind-title-filter-noise = Ruído do filtro

js-kind-title-fit-interval-trade = Compromisso do intervalo de ajuste

js-kind-title-fix-quality-against-observation-window = Qualidade da solução de posição face à janela de observação

js-kind-title-frame-checks = Verificações da trama

js-kind-title-frame-hexadecimal = Trama, hexadecimal

js-kind-title-geometry-against-latitude = Geometria face à latitude

js-kind-title-geometry-as-leo-satellites-are = Geometria à medida que se acrescentam satélites LEO

js-kind-title-geometry-position-dilution-of-precision = Geometria: diluição de precisão de posição

js-kind-title-global-coverage = Cobertura global

js-kind-title-gnss-leo-and-fused = GNSS, LEO e fundido

js-kind-title-gnss-reference = Referência GNSS

js-kind-title-hand-offs-between-phases = Passagens entre fases

js-kind-title-helmert-fit = Ajuste de Helmert

js-kind-title-helmert-transform-parameters = Parâmetros da transformação de Helmert

js-kind-title-inputs = Entradas

js-kind-title-ionosphere-free-band-pairs = Pares de bandas livres de ionosfera

js-kind-title-jammer-tolerance = Tolerância ao jammer

js-kind-title-jammers = Jammers

js-kind-title-joint-fix = Solução de posição conjunta

js-kind-title-leo-against-gnss = LEO face a GNSS

js-kind-title-limitations = Limitações

js-kind-title-links = Ligações

js-kind-title-member-runs = Execuções dos membros

js-kind-title-members-under-the-shared-conditions = Membros sob as condições partilhadas

js-kind-title-message = Mensagem

js-kind-title-message-models-compared = Modelos de mensagem comparados

js-kind-title-message-switches = Mudanças de mensagem

js-kind-title-metric-against-axis = { $metric } face a { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: distribuição sobre as execuções

js-kind-title-mid-pass-update = Atualização a meio da passagem

js-kind-title-modelled = Modelado

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Fase da mensagem de navegação

js-kind-title-not-modelled = Não modelado

js-kind-title-notes = Notas

js-kind-title-notes-on-the-spoofing-model = Notas sobre o modelo de spoofing

js-kind-title-observation-windows = Janelas de observação

js-kind-title-one-pass-alone = Uma passagem isolada

js-kind-title-orbit = Órbita

js-kind-title-over-the-message-sequence = Ao longo da sequência de mensagens

js-kind-title-pass = Passagem

js-kind-title-pass-c-n0-of-the = Passagem: C/N0 do sinal inteiro e da componente seguida

js-kind-title-pass-code-tracking-jitter = Passagem: jitter do seguimento do código

js-kind-title-pass-doppler = Passagem: Doppler

js-kind-title-pass-stage = Fase da passagem

js-kind-title-passes = Passagens

js-kind-title-phases = Fases

js-kind-title-position-error-gnss-leo-and = Erro de posição: GNSS, LEO e a solução de posição fundida

js-kind-title-position-uncertainty-relays-alone-and = Incerteza de posição: só retransmissores e com a ligação à Terra

js-kind-title-positioning-by-signal-bandwidth = Posicionamento por largura de banda do sinal

js-kind-title-positioning-gnss-alone-against-the = Posicionamento: só GNSS face à solução de posição fundida

js-kind-title-power-spectral-density = Densidade espetral de potência

js-kind-title-power-spectral-density-of-each = Densidade espetral de potência de cada sinal

js-kind-title-precise-point-positioning = Posicionamento preciso de ponto

js-kind-title-published-comparison = Comparação publicada

js-kind-title-quantisation-budget = Orçamento de quantização

js-kind-title-range-residuals = Resíduos de distância

js-kind-title-ranging-stations = Estações de medição de distância

js-kind-title-reading-the-trade = Como ler o compromisso

js-kind-title-realised-position-error = Erro de posição realizado

js-kind-title-receiver = Recetor

js-kind-title-receiver-power-budget = Orçamento de potência do recetor

js-kind-title-reflector-information = Informação sobre os refletores

js-kind-title-relay-constellation = Constelação de retransmissores

js-kind-title-relays-in-view = Retransmissores à vista

js-kind-title-reproducibility = Reprodutibilidade

js-kind-title-retroreflectors = Retrorrefletores

js-kind-title-rinex-style-record = Registo ao estilo RINEX

js-kind-title-round-trips = Ciclos de ida e volta

js-kind-title-run = Execução

js-kind-title-satellites-in-view-against-latitude = Satélites à vista face à latitude

js-kind-title-sensitivity-to-a-line-of = Sensibilidade a uma inclinação da linha de vista

js-kind-title-shared-conditions = Condições partilhadas

js-kind-title-signal-components = Componentes do sinal

js-kind-title-signal-stage = Fase do sinal

js-kind-title-signals = Sinais

js-kind-title-sisre-against-fit-interval = SISRE face ao intervalo de ajuste

js-kind-title-sisre-against-update-period = SISRE face ao período de atualização

js-kind-title-sisre-weights = Pesos do SISRE

js-kind-title-snapshot = Instantâneo

js-kind-title-snapshot-against-the-model = Instantâneo face ao modelo

js-kind-title-snapshot-spectrum-welch-estimate-against = Espetro do instantâneo: estimativa de Welch face ao modelo

js-kind-title-sources = Fontes

js-kind-title-spoofer-and-monitor-settings = Definições do spoofer e dos monitores

js-kind-title-spoofing-monitor-probability-of-detection = Monitor de spoofing: probabilidade de deteção

js-kind-title-statistics-over-the-runs = Estatísticas sobre as execuções

js-kind-title-sweep = Varrimento

js-kind-title-systems = Sistemas

js-kind-title-systems-in-the-fix = Sistemas na solução de posição

js-kind-title-the-archived-campaign = A campanha arquivada

js-kind-title-time-error = Erro de tempo

js-kind-title-time-error-by-receiver-clock = Erro de tempo por relógio do recetor

js-kind-title-time-scale = Escala de tempo

js-kind-title-time-to-first-fix-and = Tempo até à primeira solução de posição e energia por solução

js-kind-title-time-transfer-by-clock-and = Transferência de tempo por relógio e nível de sinal

js-kind-title-trade-conditions = Condições da comparação

js-kind-title-update-period-trade = Compromisso do período de atualização

js-kind-title-user = Utilizador

js-kind-title-user-range-error-through-the = Erro de distância do utilizador ao longo da passagem

js-kind-title-validated = Validado

js-kind-title-what-each-stage-hands-to = O que cada fase entrega à seguinte

js-kind-title-what-this-run-is-and = O que esta execução é, e não é

js-kind-title-when-each-monitor-detects = Quando cada monitor deteta

js-kind-title-work-done = Trabalho realizado

js-kind-yes = sim

js-ledger-rows =
    { $n ->
        [one] { $n } linha do registo
        [many] { $n } de linhas do registo
       *[other] { $n } linhas do registo
    }

js-lib-abbr-apv = aproximação com guiamento vertical

js-lib-abbr-araim = monitorização avançada da integridade autónoma do recetor

js-lib-abbr-auc = área sob a curva

js-lib-abbr-c-n0 = densidade portadora-ruído

js-lib-abbr-ccsds = Consultative Committee for Space Data Systems

js-lib-abbr-cli = interface de linha de comandos

js-lib-abbr-csac = relógio atómico à escala de chip

js-lib-abbr-cw = onda contínua

js-lib-abbr-doi = identificador de objeto digital

js-lib-abbr-dop = diluição de precisão

js-lib-abbr-eo = observação da Terra

js-lib-abbr-gnss = sistema global de navegação por satélite

js-lib-abbr-gps = Global Positioning System

js-lib-abbr-hal = limite de alerta horizontal

js-lib-abbr-hpl = nível de proteção horizontal

js-lib-abbr-imu = unidade de medição inercial

js-lib-abbr-ins = sistema de navegação inercial

js-lib-abbr-iot = Internet das Coisas

js-lib-abbr-itu-t = União Internacional das Telecomunicações, Setor de Normalização das Telecomunicações

js-lib-abbr-j-s = razão jammer-sinal

js-lib-abbr-leo = órbita terrestre baixa

js-lib-abbr-llr = telemetria laser lunar

js-lib-abbr-meo = órbita terrestre média

js-lib-abbr-mtie = erro máximo de intervalo de tempo

js-lib-abbr-ntn = rede não terrestre

js-lib-abbr-ocxo = oscilador de cristal com controlo de forno

js-lib-abbr-oem = Orbit Ephemeris Message

js-lib-abbr-omm = Orbit Mean-elements Message

js-lib-abbr-pdop = diluição de precisão de posição

js-lib-abbr-pnt = posicionamento, navegação e temporização

js-lib-abbr-ppp = posicionamento preciso de ponto

js-lib-abbr-raim = monitorização autónoma da integridade pelo recetor

js-lib-abbr-rf = radiofrequência

js-lib-abbr-rinex = Receiver Independent Exchange Format

js-lib-abbr-roc = característica de funcionamento do recetor

js-lib-abbr-sbas = sistema de aumento baseado em satélites

js-lib-abbr-sgp4 = Simplified General Perturbations 4, um propagador de órbitas

js-lib-abbr-sisre = erro de distância do sinal no espaço

js-lib-abbr-slam = localização e mapeamento simultâneos

js-lib-abbr-spp = posicionamento de ponto único

js-lib-abbr-tdev = desvio de tempo

js-lib-abbr-tle = conjunto de elementos de duas linhas

js-lib-abbr-toml = o formato de ficheiro de cenário

js-lib-abbr-trn = navegação referenciada ao terreno

js-lib-abbr-uhf = frequência ultra-alta

js-lib-abbr-ukf = filtro de Kalman unscented

js-lib-abbr-utc = Tempo Universal Coordenado

js-lib-abbr-val = limite de alerta vertical

js-lib-abbr-vlbi = interferometria de linha de base muito longa

js-lib-abbr-vpl = nível de proteção vertical

js-lib-abbr-wg = Grupo de Trabalho

js-lib-areas-ground-track = Traço no solo

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Disponibilidade

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Temporização p95

js-lib-compare-timing-rms = Temporização RMS

js-lib-counts-explorer-tally = { $validated } de { $total } capacidades validadas face a uma referência independente externa · { $modelled } modeladas · { $partner } da responsabilidade do parceiro — mostradas aqui como { $cards } cartões de capacidade em { $domains } domínios, { $evidence } afirmações de evidência

js-lib-counts-validated-tally = { $validated } de { $total } capacidades validadas face a uma referência independente externa — mostradas aqui como { $cards } cartões de capacidade e { $evidence } afirmações de evidência

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = o ficheiro do motor devolveu HTTP { $status }

js-lib-engine-page-not-running = o motor não está a ser executado aqui

js-lib-engine-worker-crashed = o processo de trabalho do motor falhou

js-lib-evidence-aria = Evidência: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } linha do registo
        [many] { $n } de linhas do registo
       *[other] { $n } linhas do registo
    }

js-lib-evidence-rows-behind = Linhas do registo por trás deste resultado

js-lib-geometry-url-bad-mc = O número de amostras de Monte Carlo não é um de { $choices }; é usado { $default }.

js-lib-geometry-url-bad-number = "{ $key }" não é um número de { $min } a { $max }; é usado o valor predefinido.

js-lib-geometry-url-bad-site = O local não é latitude,longitude[,altura] dentro do intervalo; é usado o local predefinido.

js-lib-geometry-url-bad-sky = A skyline não é uma predefinição, uma tabela de 360 intervalos nem um desfiladeiro urbano dentro do intervalo; é usado um horizonte aberto.

js-lib-geometry-url-bad-sys = A lista de constelações não é G, E, C e no máximo um L:<predefinição LEO> que esta vista conheça; é usada a combinação predefinida.

js-lib-geometry-url-own-tle = Quem enviou usou os seus próprios elementos orbitais (TLE), que uma ligação não transporta; são mostradas as predefinições.

js-lib-geometry-url-repeated = "{ $key }" aparece mais de uma vez; é usado o primeiro valor.

js-lib-geometry-url-too-long = O endereço tem mais de { $max } carateres, pelo que nenhuma das suas definições foi lida.

js-lib-geometry-url-unreadable = Não foi possível ler o endereço.

js-lib-guided-duration-s-hint = durante quanto tempo propagar o traço no solo

js-lib-guided-duration-s-label = Duração (s)

js-lib-guided-dut1-s-hint = desvio de rotação da Terra; desloca o traço no solo para este/oeste

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = um satélite tem de estar a esta altura para contar como visível

js-lib-guided-mask-deg-label = Máscara de elevação (°)

js-lib-guided-seed-hint = uma extração de ruído diferente da mesma física

js-lib-guided-seed-label = Semente aleatória

js-lib-guided-sigma-uere-m-hint = erro de distância equivalente do utilizador a 1 σ para o resumo da posição

js-lib-guided-sigma-uere-m-label = σ do erro de distância (m)

js-lib-guided-station-lat-deg-hint = latitude da estação terrena — determina a geometria da passagem

js-lib-guided-station-lat-deg-label = Latitude da estação (°)

js-lib-guided-station-lon-deg-hint = longitude da estação terrena

js-lib-guided-station-lon-deg-label = Longitude da estação (°)

js-lib-guided-step-s-hint = cadência de amostragem do traço no solo

js-lib-guided-step-s-label = Passo de tempo (s)

js-lib-guided-threshold-ns-hint = orçamento dentro da especificação; "disponível" enquanto o erro se mantiver abaixo dele

js-lib-guided-threshold-ns-label = Limiar da especificação (ns)

js-lib-guided-time-duration-s-hint = duração total da execução

js-lib-guided-time-duration-s-label = Duração (s)

js-lib-guided-time-step-s-hint = cadência de integração / amostragem

js-lib-guided-time-step-s-label = Passo de tempo (s)

js-lib-guided-user-altitude-km-hint = a altitude orbital da nave espacial do utilizador

js-lib-guided-user-altitude-km-label = Altitude do utilizador (km)

js-lib-guided-user-inclination-deg-hint = a inclinação da órbita do utilizador

js-lib-guided-user-inclination-deg-label = Inclinação do utilizador (°)

js-lib-imufit-card-accel-slope = Declive de Allan do acelerómetro, inicial (cerca de -0.5 para ruído branco)

js-lib-imufit-card-bias = Enviesamento do acelerómetro, média (m/s²)

js-lib-imufit-card-bias-instability = Instabilidade do enviesamento do acelerómetro (m/s²), 0 quando a curva não tem patamar

js-lib-imufit-card-gyro-bias = Enviesamento do giroscópio, média (rad/s)

js-lib-imufit-card-gyro-slope = Declive de Allan do giroscópio, inicial (cerca de -0.5 para ruído branco)

js-lib-imufit-card-note-n = Nota { $n }

js-lib-imufit-card-q-arw = Passeio aleatório de ângulo do giroscópio, q_arw (rad²/s)

js-lib-imufit-card-q-va = Passeio aleatório de velocidade do acelerómetro, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Taxa de amostragem

js-lib-imufit-card-samples = Amostras

js-lib-imufit-card-span = Extensão

js-lib-jammertest-card-clean-epochs = Épocas limpas

js-lib-jammertest-card-clean-hours = Horas limpas

js-lib-jammertest-card-detected = Detetado dentro da tolerância

js-lib-jammertest-card-detection-rate = Taxa de deteção (qualquer alarme)

js-lib-jammertest-card-evaluable = Avaliáveis

js-lib-jammertest-card-fa-epochs = Épocas de falso alarme

js-lib-jammertest-card-fa-per-hour = Sequências de falso alarme por hora

js-lib-jammertest-card-fa-runs = Sequências de falso alarme

js-lib-jammertest-card-in-tol-rate = Detetado dentro da tolerância, taxa

js-lib-jammertest-card-late = Tardio

js-lib-jammertest-card-median-latency = Latência mediana de deteção

js-lib-jammertest-card-median-recover = Tempo mediano de recuperação

js-lib-jammertest-card-missed = Não detetado

js-lib-jammertest-card-na = n/d

js-lib-jammertest-card-not-assessable = Nenhum ensaio foi avaliável neste registo, pelo que não é possível indicar nenhuma taxa de deteção nem latência. Isto é um resultado, não uma falha da página: nada aqui é um resultado favorável.

js-lib-jammertest-card-not-json = { $name }: não é JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: não é um quadro de resultados do jammertest (precisa de tests[] e summary).

js-lib-jammertest-card-tests = Ensaios na parte do plano

js-lib-jammertest-card-too-large = { $name }: maior do que 8 MiB; esta página lê um quadro de resultados até esse tamanho.

js-lib-kpi-available-everywhere = disponível em todo o lado, em todas as épocas

js-lib-kpi-available-everywhere-pdop = disponível em todo o lado, em todas as épocas (PDOP, diluição de precisão de posição, abaixo de { $thr })

js-lib-kpi-drops-under = desce abaixo do limiar de seguimento de { $thr } dB-Hz: bloqueio perdido

js-lib-kpi-end-of-mission = no fim da missão

js-lib-kpi-figure-tiers = Níveis dos valores: { $parts }.

js-lib-kpi-n-modelled = { $n } modelados

js-lib-kpi-n-partner = { $n } da responsabilidade do parceiro

js-lib-kpi-n-validated = { $n } validados

js-lib-kpi-no-change = sem alteração

js-lib-kpi-no-fix = { $pct } % do tempo ou dos locais sem solução de posição

js-lib-kpi-no-fix-pdop = { $pct } % do tempo ou dos locais sem solução de posição com PDOP abaixo de { $thr }

js-lib-kpi-over-jump = acima do limiar de salto de { $thr } m

js-lib-kpi-over-pdop = acima do limiar de PDOP { $thr }

js-lib-kpi-stays-above = mantém-se acima do limiar de seguimento de { $thr } dB-Hz

js-lib-kpi-under-jump = abaixo do limiar de salto de { $thr } m

js-lib-kpi-under-pdop = abaixo do limiar de PDOP { $thr }

js-lib-orbit3d-apogee = apogeu

js-lib-orbit3d-perigee = perigeu

js-lib-orbit3d-prov-scenario = cenário { $hash }

js-lib-orbit3d-title = Órbita (ECI, ortográfica)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Enviesamento do relógio

js-lib-overlay-meta-converged-pos-3sigma-m = Posição 3σ

js-lib-overlay-meta-converged-pos-rms-m = Posição RMS

js-lib-overlay-meta-converged-pos-sigma-m = Posição σ

js-lib-overlay-meta-final-clock-freq-sigma = σ da frequência do relógio

js-lib-overlay-meta-mean-relays-in-view = Retransmissores à vista

js-lib-overlay-meta-pos-p95-m = Posição p95

js-lib-overlay-meta-pos-rms-m = Posição RMS

js-lib-overlay-meta-postfit-rms-m = RMS pós-ajuste

js-lib-overlay-prov-scenario = cenário { $hash }

js-lib-overlay-subtitle = |erro| (ns) vs tempo — { $n } execuções

js-lib-overlay-time-s = tempo (s)

js-lib-overlay-title = Sobreposição: erro de temporização durante a interrupção

js-lib-packs-cannot-unpack = este navegador não consegue descompactar o ficheiro registado

js-lib-replay-demos-below-130 = Só azimutes abaixo de 130° mantidos (declarado)

js-lib-replay-demos-coastal-drag-off = Arrastamento costeiro

js-lib-replay-demos-combined-event = Evento combinado

js-lib-replay-demos-drag-off-stated = Arrastamento da posição (declarado pela demonstração)

js-lib-replay-demos-ferry-drag-off = Travessia de ferry, arrastamento da posição

js-lib-replay-demos-ferry-drag-off-description = Um registo de ferry inventado, de Tallinn a Helsínquia, a 1 Hz. A partir de 1500 s, um arrastamento da posição afasta a posição comunicada enquanto o recetor continua a comunicar uma solução de posição válida.

js-lib-replay-demos-fjord = Degradação natural em fiorde

js-lib-replay-demos-masked-sky = Travessia de ferry, metade do céu mascarada

js-lib-replay-demos-masked-sky-description = O mesmo registo de ferry com a metade ocidental do céu silenciada a partir de 600 s, um céu mais estreito de 900 s a 1200 s e o arrastamento a partir de 1500 s: uma execução em que o céu, o sinal e a posição falham, cada um por sua vez.

js-lib-replay-demos-open-sea-jamming = Jamming em mar aberto

js-lib-replay-demos-port-approach = Spoofing de tempo na aproximação a porto

js-lib-replay-demos-source-training = Cenário sintético { $id }: o fluxo nmea_training do motor e o registo do instrutor, pontuados pelo seu receiver-trust.

js-lib-replay-demos-source-trust = Registo sintético { $id }: NMEA inventado, pontuado pelo receiver-trust do motor.

js-lib-replay-demos-west-masked = Metade ocidental do céu mascarada (declarado)

js-lib-replay-demos-west-masked-again = Metade ocidental mascarada outra vez (declarado)

js-lib-report-charts = Gráficos

js-lib-report-eyebrow = o instante preciso

js-lib-report-figures-of-merit = Figuras de mérito

js-lib-report-footer = Kshana { $version } · cenário { $hash } · gerado em { $iso }. Reproduzível a partir do cenário + semente + versão do motor. Executa localmente; nada é carregado.

js-lib-report-not-applicable = não aplicável (nenhum ataque configurado)

js-lib-report-scenario-definition = Definição do cenário (TOML)

js-lib-report-th-clock = Relógio

js-lib-report-th-metric = Métrica

js-lib-report-th-validation = Validação

js-lib-report-th-value = Valor

js-lib-report-tier-note = Cada figura de mérito é etiquetada { $validated } (verificada face a uma referência independente externa) ou { $modelled } (de princípios fundamentais, testada internamente) — derivado da matriz de verificação.

js-lib-report-title = Kshana — relatório do cenário

js-lib-skydraw-azimuth-range = azimute de { $from } a { $to } graus

js-lib-skydraw-describe =
    { $listed ->
        [one] { $listed } satélite listado, { $heard } com sinal
        [many] { $listed } de satélites listados, { $heard } com sinal
       *[other] { $listed } satélites listados, { $heard } com sinal
    }

js-lib-skydraw-describe-mean =
    { $listed ->
        [one] { $listed } satélite listado, { $heard } com sinal, média de { $snr } dB-Hz
        [many] { $listed } de satélites listados, { $heard } com sinal, média de { $snr } dB-Hz
       *[other] { $listed } satélites listados, { $heard } com sinal, média de { $snr } dB-Hz
    }

js-lib-skydraw-east = E

js-lib-skydraw-no-signal-from = sem sinal de { $sectors }

js-lib-skydraw-none-listed = Nenhum satélite listado no registo neste momento.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: elevação { $el }, azimute { $az }, sinal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: elevação { $el }, azimute { $az }, listado, sem sinal

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satélites listados entre o azimute { $from } e { $to } graus, nenhum com sinal

js-lib-skydraw-west = O

js-lib-skyline-edit-describe = Skyline sobre { $blocked } de 360 graus de azimute; máximo de { $el }° no azimute { $az }°.

js-lib-skyline-edit-open = Horizonte aberto: sem skyline.

js-lib-stages-all-planets = Todos os planetas

js-lib-stages-au-from-sun = { $d } ua do Sol

js-lib-stages-band-carrier = Portadora { $name }, { $mhz } MHz

js-lib-stages-bin-title =
    { $count ->
        [one] { $from } a { $to }{ $unit }: { $count } execução
        [many] { $from } a { $to }{ $unit }: { $count } de execuções
       *[other] { $from } a { $to }{ $unit }: { $count } execuções
    }

js-lib-stages-body-and-moons = { $name } e as suas luas

js-lib-stages-cell-title = lat { $lat }°, lon { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Mensagem de navegação

js-lib-stages-chain-pass = Passagem e ligação

js-lib-stages-chain-ppp = Posicionamento preciso de ponto

js-lib-stages-chain-pvt = Posicionamento fundido

js-lib-stages-chain-signal = Projeto do sinal

js-lib-stages-coverage-aria = { $field } sobre { $body }, por latitude e longitude

js-lib-stages-feature-n = elemento { $n }

js-lib-stages-flag = indicador

js-lib-stages-frequency-mhz = frequência (MHz)

js-lib-stages-from-to = { $from } a { $to }

js-lib-stages-geojson-aria = A exportação GeoJSON desenhada num mapa

js-lib-stages-histogram = Histograma

js-lib-stages-inner-planets = Planetas interiores

js-lib-stages-km-from-centre = { $d } km de { $centre }

js-lib-stages-linear-scale = escala linear

js-lib-stages-link-light-time = { $from } a { $to }: tempo-luz num só sentido { $time } s

js-lib-stages-longitude-axis = longitude · latitude na lateral

js-lib-stages-mission-time = tempo de missão (s)

js-lib-stages-noise-floor = nível de ruído

js-lib-stages-orrery-note = { $scale } · plano x-y do referencial, visto do seu polo norte

js-lib-stages-panel-n = Painel { $n }

js-lib-stages-plan-view-aria = Vista em planta de { $centre } e dos corpos à sua volta, { $scale }

js-lib-stages-psd-at-t = Densidade espetral de potência em t = { $t } s

js-lib-stages-psd-axis = densidade espetral de potência (dBW/Hz)

js-lib-stages-runs = execuções

js-lib-stages-sat-title = { $constellation } { $id } · lat { $lat }°, lon { $lon }°

js-lib-stages-satellites = satélites

js-lib-stages-spectrum-at-t = espetro em t = { $t } s

js-lib-stages-sqrt-scale = escala de distância em raiz quadrada

js-lib-stages-the-body = o corpo

js-lib-stages-time-s = tempo (s)

js-lib-stages-unit-alarm = Alarme

js-lib-stages-unit-cn0 = Densidade portadora-ruído

js-lib-stages-unit-position = Posição e proteção

js-lib-stages-unit-satellites = Satélites

js-lib-stages-unit-time-error = Erro de tempo

js-lib-stages-waterfall-aria = Cascata de densidade espetral de potência: frequência na horizontal, tempo para baixo

js-lib-stages-whole-band = Banda inteira

js-lib-sweep-clock-availability = Disponibilidade de { $who }

js-lib-sweep-clock-holdover = Holdover de { $who } (s)

js-lib-sweep-clock-timing-p95 = Temporização p95 de { $who } (ns)

js-lib-sweep-clock-timing-rms = Temporização RMS de { $who } (ns)

js-lib-sweep-max-altitude = altitude máxima (km)

js-lib-sweep-max-elevation = elevação máxima (°)

js-lib-sweep-max-speed = velocidade máxima (m/s)

js-lib-sweep-min-altitude = altitude mínima (km)

js-lib-sweep-peak-doppler = Doppler máximo (Hz)

js-lib-sweep-prov-scenario = cenário { $hash }

js-lib-sweep-y-vs-x = { $y } vs { $x }

js-lib-tabs-3d-orbit = Órbita 3D

js-lib-tabs-figures-of-merit = Figuras de mérito

js-lib-tabs-stability = Estabilidade

js-lib-tabs-sweep = Varrimento

js-lib-tabs-time-series = Série temporal

js-lib-tour-ashforde-body = Obrigado por explorar o Kshana. Construímos engenharia aberta, reprodutível e baseada primeiro em evidências para missões que não podem falhar — honesta quanto ao que é validado e ao que é modelado. Perguntas, uma colaboração ou um estudo? Contacte-nos em contact@ashforde.org.

js-lib-tour-ashforde-title = Da Ashforde® OÜ

js-lib-tour-capabilities-body = Escolha um separador de domínio — Órbitas, Temporização, Inercial, GNSS, Resiliência, Lunar, IA/AA, Interoperabilidade — para ver as suas capacidades, cada uma etiquetada como Validado ou Modelado, com um botão ▸ executar para os cenários trabalhados. Abra “Evidências e proveniência” em qualquer domínio para seguir a prova, ou ative “Só validados” para mostrar apenas o que é verificado face a uma referência independente externa.

js-lib-tour-capabilities-title = Explore o motor, um domínio de cada vez

js-lib-tour-cite-body = O Kshana foi construído para ser referenciado — uma versão de software citável com um DOI, além de artigos ao estilo de revisão por pares sobre a lacuna de otimismo nas degradações de RF e um nível de proteção de temporização condicional. Copie a citação diretamente daqui.

js-lib-tour-cite-title = Publicações e como citar

js-lib-tour-download-report-body = O separador Varrimento faz variar um parâmetro ao longo de um intervalo; “Fixar para comparar” sobrepõe duas ou mais execuções lado a lado com o Δ entre elas (funciona entre tipos de cenário — relógio, PNT em Marte, posicionamento…); e este botão descarrega a execução como um relatório HTML autónomo, offline.

js-lib-tour-download-report-title = Varrer, comparar e exportar

js-lib-tour-guided-body = Os controlos guiados adaptam-se ao cenário — semente, limiar da especificação, duração, máscara de elevação, altitude da órbita — e cada alteração volta a executar instantaneamente.

js-lib-tour-guided-title = Ajuste os controlos deslizantes

js-lib-tour-mcp-body = Um servidor MCP permite que assistentes de IA executem o motor validado em vez de adivinhar; um plugin do JetBrains executa cenários com um clique com o botão direito.

js-lib-tour-mcp-title = Use-o a partir de um agente de IA ou do seu IDE

js-lib-tour-playground-body = Escolha um cenário na lista — ou clique em ▸ executar em qualquer capacidade acima — e o motor executa-se como WebAssembly na sua máquina. Nada é carregado.

js-lib-tour-playground-title = Execute-o no seu navegador

js-lib-tour-run-body = Execute o cenário atual. Abra “Avançado” para editar o TOML e alterar o que quiser; “Copiar ligação de partilha” reproduz exatamente esta execução para outra pessoa.

js-lib-tour-run-title = Executar

js-lib-tour-tabs-body = Alterne entre as figuras de mérito, o gráfico de série temporal, a estabilidade do relógio (desvio de Allan) e — nas execuções de órbita — uma vista de órbita 3D interativa.

js-lib-tour-tabs-title = Ler os resultados

js-lib-tour-validation-body = O mesmo explorador é também o registo de evidências: cada domínio tem uma gaveta “Evidências e proveniência” — o valor, a referência independente externa face à qual é verificado e um estado Validado / Modelado honesto por afirmação. “Só validados” filtra para as linhas verificadas por conjuntos de dados.

js-lib-tour-validation-title = Evidências, não adjetivos

js-lib-views-3-sigma-bound = limite de 3 sigma

js-lib-views-3d-position-error = erro de posição 3D

js-lib-views-a-parameter = um parâmetro

js-lib-views-band-runs = Banda de erro de tempo em { $runs } execuções de Monte Carlo

js-lib-views-band-the-runs = Banda de erro de tempo nas execuções de Monte Carlo

js-lib-views-below-tracking = abaixo do limiar de seguimento

js-lib-views-chart = gráfico

js-lib-views-classical = clássico

js-lib-views-epoch = época

js-lib-views-four-needed = 4 necessários para uma solução de posição

js-lib-views-free-inertial = inercial livre

js-lib-views-gnss-denied = GNSS negado

js-lib-views-ground-track = Traço no solo

js-lib-views-heatmap-effective = Densidade portadora-ruído efetiva por satélite e tempo

js-lib-views-heatmap-nominal = Densidade portadora-ruído nominal (sem jammer) por satélite e tempo

js-lib-views-horizontal-alert-limit = limite de alerta horizontal

js-lib-views-horizontal-hpl = horizontal (HPL)

js-lib-views-id-bound = limite de { $id }

js-lib-views-id-median = mediana de { $id }

js-lib-views-id-offset = desvio de { $id }

js-lib-views-id-p95 = p95 de { $id }

js-lib-views-map-matched = correspondência com mapa

js-lib-views-map-matched-title = Correspondência com mapa face ao erro de posição inercial livre

js-lib-views-metric = métrica

js-lib-views-oscillator = oscilador

js-lib-views-oscillator-source = oscilador ({ $source })

js-lib-views-position-error-axis = erro de posição ({ $unit })

js-lib-views-position-error-m = erro de posição (m)

js-lib-views-position-error-run = Erro de posição ao longo da execução

js-lib-views-position-m = posição (m)

js-lib-views-predicted-time-error = Erro de tempo previsto desde a última solução de posição

js-lib-views-protection-level-m = nível de proteção (m)

js-lib-views-protection-levels = Níveis de proteção face ao limite de alerta

js-lib-views-quantum = quantum

js-lib-views-relay-error-bound = Erro de posição da navegação por retransmissão e o seu limite de 3 sigma

js-lib-views-satellites = satélites

js-lib-views-satellites-tracking = Satélites visíveis e ainda em seguimento

js-lib-views-shaded-gnss-denied = sombreado: GNSS negado

js-lib-views-slot-guard = guarda do intervalo

js-lib-views-spoofed-offset = Desvio de tempo com spoofing face ao limite de deteção

js-lib-views-sweep-of = Varrimento de { $parameter }: { $metric }

js-lib-views-sync-error-axis = erro de sincronização ({ $unit })

js-lib-views-sync-error-run = Erro de sincronização ao longo da execução

js-lib-views-threshold = limiar

js-lib-views-time-error-ns = erro de tempo (ns)

js-lib-views-time-ns = tempo (ns)

js-lib-views-time-s = tempo (s)

js-lib-views-time-since-fix = tempo desde a última solução de posição (s)

js-lib-views-timing-error-axis = erro de temporização ({ $unit })

js-lib-views-timing-error-run = Erro de temporização ao longo da execução

js-lib-views-tracking = em seguimento

js-lib-views-value = valor

js-lib-views-vertical-vpl = vertical (VPL)

js-lib-views-visible = visíveis

js-lib-views-word-enbw = largura de banda de ruído equivalente

js-lib-views-word-nfft = comprimento da FFT

js-lib-views-word-stec = TEC oblíquo

js-lib-views-word-toa = tempo de chegada

js-lib-views-word-ttff = tempo até à primeira solução de posição

js-lib-views-word-tx = transmissão

js-lib-views-word-zwd = atraso húmido zenital

js-lunar-address-outside-range = { $label }: "{ $raw }" está fora de { $min } a { $max }; é usado o valor do ficheiro.

js-lunar-address-too-long = O endereço era demasiado longo; são mostradas as predefinições.

js-lunar-address-unknown-source = Fonte desconhecida no endereço; é mostrada a gravação.

js-lunar-alert-limit = limite de alerta { $value } (ilustrativo)

js-lunar-alert-not-stated = limite de alerta não indicado

js-lunar-bearing-east = 90° E

js-lunar-bearing-west = 90° O

js-lunar-cell-title = { $lat }°, { $lon }°: corrigido { $corrected }, disponibilidade { $availability }, cobertura { $coverage }

js-lunar-copy-address = Copie o endereço da barra de endereços.

js-lunar-counts = { $sats } satélites, { $points } pontos da grelha, { $epochs } épocas, { $trials } ensaios de Monte Carlo por época. Etiqueta: { $label }.

js-lunar-engine-no-start = O motor não conseguiu arrancar neste navegador ({ $reason }). Abra antes um ficheiro de resultados.

js-lunar-engine-unknown-kind = Este motor ({ $version }) não conhece o tipo { $kind }; precisa do motor 0.36.

js-lunar-fig-availability-region = Disponibilidade na região

js-lunar-fig-corrected-3d = Erro corrigido, { $n } %, 3D

js-lunar-fig-coverage = Cobertura

js-lunar-fig-epochs-within = épocas dentro de { $value }

js-lunar-fig-horizontal-vertical = horizontal { $h }, vertical { $v }

js-lunar-fig-hpl-below-alert = HPL abaixo do limite de alerta

js-lunar-fig-hpl-vpl = HPL, VPL no máximo

js-lunar-fig-improvement = Fator de melhoria

js-lunar-fig-lowest-point = Mínimo num ponto

js-lunar-fig-points-always-available = Pontos disponíveis em todas as épocas

js-lunar-fig-uncorrected-3d = Erro não corrigido, { $n } %, 3D

js-lunar-fig-worst-point = Pior ponto

js-lunar-file-not-json = Este ficheiro não é JSON.

js-lunar-file-not-object = Este ficheiro não é um objeto JSON.

js-lunar-file-too-large = { $name }: maior do que 32 MiB; esta página lê ficheiros de resultados até esse tamanho.

js-lunar-file-value = ficheiro: { $value }

js-lunar-full-of-total = { $full } de { $total }

js-lunar-give-value = { $label }: indique um valor de { $min } a { $max }.

js-lunar-give-whole-value = { $label }: indique um valor de { $min } a { $max } (um número inteiro).

js-lunar-honesty-affiliation = Sem afiliação nem aval de qualquer agência.

js-lunar-honesty-assumptions = Sob os pressupostos públicos indicados, não é uma afirmação sobre o desempenho de nenhum sistema real.

js-lunar-in-grid-spacing = Espaçamento dos anéis da grelha, graus

js-lunar-in-latency = Latência da correção, segundos

js-lunar-in-seed = Semente

js-lunar-in-station-lat = Latitude da estação, graus

js-lunar-in-station-lon = Longitude da estação, graus

js-lunar-in-survey-error = Erro de levantamento da estação (1 sigma), metros

js-lunar-in-threshold = Limiar de exatidão, metros

js-lunar-in-time-step = Passo de tempo, segundos

js-lunar-in-trials = Ensaios de Monte Carlo por época

js-lunar-input-out-of-range = { $label } está fora do intervalo.

js-lunar-json-field-not-json = O campo json do ficheiro não é JSON.

js-lunar-key-50-or-more = 50 % ou mais

js-lunar-key-90-or-more = 90 % ou mais

js-lunar-key-95-or-more = 95 % ou mais

js-lunar-key-99-or-more = 99 % ou mais

js-lunar-key-above = acima de { $value }

js-lunar-key-above-threshold = acima de { $value } × limiar

js-lunar-key-below-50 = abaixo de 50 %

js-lunar-key-between = { $from } a { $to }

js-lunar-key-between-threshold = { $from } a { $to } × limiar

js-lunar-key-up-to = até { $value }

js-lunar-key-up-to-threshold = até { $value } × limiar

js-lunar-layer-availability = disponibilidade

js-lunar-layer-coverage = cobertura

js-lunar-layer-error = erro corrigido

js-lunar-layer-range = erro corrigido no seu próprio intervalo

js-lunar-legend-no-figure = sem valor (indisponível em todo o período)

js-lunar-legend-radius = raio de cobertura

js-lunar-legend-threshold = limiar, { $value }

js-lunar-legend-worst = pior ponto

js-lunar-link-copied = Ligação copiada.

js-lunar-map-desc = { $points } pontos da grelha desde o polo até à latitude { $rim }°. { $meet } deles têm um erro corrigido de percentil { $percentile } dentro do limiar de { $threshold }. Colorido por { $layer }. A estação está em { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % dos pontos caem numa só banda da escala do limiar, pelo que o mapa mostra pouca variação: colora por "o seu próprio intervalo" para ver como o erro varia ao longo da região.

js-lunar-needs-newer-engine = Este estudo precisa do motor { $need } ou posterior; o motor em execução aqui é a v{ $version }. A gravação, ou um ficheiro de resultados, ainda pode ser mostrada.

js-lunar-no = não

js-lunar-no-recording = Ainda não é distribuída nenhuma gravação deste estudo: é feita na versão com o motor 0.36. Execute-o aqui com um motor que tenha o tipo, ou abra um ficheiro de resultados.

js-lunar-no-scenario = Este sítio ainda não tem { $file }: chega com o motor 0.36. Abra antes um ficheiro de resultados.

js-lunar-no-scenario-note = Este sítio ainda não tem { $file } (chega com o motor 0.36), pelo que não é possível uma execução aqui; abra antes um ficheiro de resultados.

js-lunar-not-report = Isto não é um relatório { $kind }.

js-lunar-not-stated = não indicado

js-lunar-note-none = O ficheiro não indica nenhuma nota.

js-lunar-note-withheld = A própria declaração do ficheiro nomeia um programa ou uma agência, pelo que esta página não a mostra; aplica-se a declaração no topo da página.

js-lunar-point-epochs-reason = point-epochs: { $reason }

js-lunar-radius-desc = Raio de cobertura em { $count } azimutes: o mais curto { $lo } km a { $loAz }°, o mais longo { $hi } km a { $hiAz }°.

js-lunar-radius-desc-limited =
    { $count ->
        [one] { $count } alcança o limite da grelha, pelo que a cobertura se estende pelo menos até aí.
        [many] { $count } de azimutes alcançam o limite da grelha, pelo que a cobertura se estende pelo menos até aí.
       *[other] { $count } alcançam o limite da grelha, pelo que a cobertura se estende pelo menos até aí.
    }

js-lunar-radius-hollow = Os pontos ocos alcançam o limite da grelha: a cobertura mantém-se pelo menos até aí ao longo dessa direção.

js-lunar-radius-none = O relatório não indica nenhum raio de cobertura.

js-lunar-radius-per-azimuth = raio de cobertura por azimute

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (alcança o limite da grelha: pelo menos até aí)

js-lunar-radius-zero = Em todas as direções a cobertura já está abaixo de 95 % na própria estação, pelo que o raio é 0 km: o erro corrigido excede aí o limiar de { $value }.

js-lunar-reason-station-missing = a estação não vê todos os satélites que o utilizador usa

js-lunar-reason-user-lt4 = menos de quatro satélites à vista do utilizador

js-lunar-run-stopped = A execução parou: { $message }

js-lunar-running = A executar o estudo neste navegador…

js-lunar-running-elapsed = A executar o estudo neste navegador… { $seconds } s

js-lunar-scenario-missing-keys = O ficheiro do cenário não tem { $keys }; não pode ser alterado aqui.

js-lunar-set-inputs = Defina as entradas e prima Executar aqui.

js-lunar-showing = A mostrar { $what }.

js-lunar-showing-engine = A mostrar { $what } (motor { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = estação

js-lunar-station-title = estação { $lat }°, { $lon }°

js-lunar-table-count =
    { $n ->
        [one] { $n } ponto, o mais próximo da estação primeiro.
        [many] { $n } de pontos, os mais próximos da estação primeiro.
       *[other] { $n } pontos, os mais próximos da estação primeiro.
    }

js-lunar-th-corrected = Erro corrigido, { $n } %

js-lunar-threshold-title = erro corrigido { $value } (o limiar)

js-lunar-what-file = o ficheiro { $name }

js-lunar-what-recording = a gravação distribuída com o Studio

js-lunar-what-run = uma execução neste navegador (motor { $version })

js-lunar-worst-at = em { $lat }°, { $lon }°

js-lunar-worst-title = pior ponto { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = sim: pelo menos até aí

js-lunarinfra-above-95-point = acima do ponto de 95 %

js-lunarinfra-advisory = Software de caráter consultivo, não um equipamento homologado; sem nenhum percurso de transmissão de qualquer tipo.

js-lunarinfra-arc-note = Comprimento de onda da portadora { $value } m.

js-lunarinfra-arc-title = Cada arco

js-lunarinfra-bars-not-loaded = o ficheiro dos limiares não foi carregado

js-lunarinfra-bars-not-shown = Não foi possível mostrar os limiares pré-registados ({ $reason }).

js-lunarinfra-bars-note = Fixados antes de qualquer estudo ser pontuado, com os veredictos de registo (commit do motor { $commit }). Nada é VALIDATED; um limiar marcado NOT MET é fixado por um teste que afirma a falha, e nenhum foi afrouxado.

js-lunarinfra-bars-title = Face aos limiares pré-registados

js-lunarinfra-bars-wrong-file = o ficheiro dos limiares não é o que esta página lê

js-lunarinfra-blurb-carrier-phase = Uma estação à superfície e um orbitador que usam fase da portadora de sinais GNSS terrestres com dupla diferença: é possível fixar as ambiguidades inteiras e que efeito tem isso no limite de posição? A execução de exemplo rápida.

js-lunarinfra-blurb-frame-coestimation = Os sete parâmetros do datum lunar a partir da telemetria laser de estações terrestres, com e sem distâncias do orbitador a estações à superfície: quanto melhora a informação?

js-lunarinfra-blurb-geodesy-sensitivity = Que sensibilidade têm a telemetria laser, o seguimento de orbitadores, um gravímetro e um relógio à superfície aos números de Love de maré da Lua h2, k2 e l2 e à sua libração física?

js-lunarinfra-blurb-od-consistency = Determinação de órbita a bordo com GNSS terrestre numa órbita de halo quase retilínea, face a uma solução radiométrica terrestre independente do mesmo arco: concordam as duas dentro das suas incertezas indicadas, e a verificação de consistência deteta um erro de modelação quando é injetado um? Mostrado lado a lado.

js-lunarinfra-blurb-space-tie = GNSS, VLBI e telemetria laser numa só nave espacial: com que precisão se podem ligar os desvios entre as três técnicas, face ao erro da ligação local na nave espacial?

js-lunarinfra-bound-label = Incerteza de posição, flutuante e fixa, escala logarítmica

js-lunarinfra-bound-note = Incerteza de posição a um sigma da estação e do orbitador com as ambiguidades deixadas flutuantes e com elas fixadas (o que a fixação daria se fosse alcançada).

js-lunarinfra-bound-title = Limite de posição, flutuante e fixo

js-lunarinfra-chip-na = n/d

js-lunarinfra-comp-normal = normal

js-lunarinfra-comp-position = posição (3D)

js-lunarinfra-comp-radial = radial

js-lunarinfra-comp-transverse = transversal

js-lunarinfra-compare-note = Em { $sets } conjuntos aleatórios de estações, o menor valor próprio não foi menor com as ligações do orbitador em { $lambda } e o traço não foi maior em { $trace }; a subida mediana do menor valor próprio foi de { $median } vezes.

js-lunarinfra-compare-title = A comparação em números

js-lunarinfra-crsigma-label = Sigma de Cramér-Rao, escala logarítmica

js-lunarinfra-crsigma-note = Em metros à superfície.

js-lunarinfra-crsigma-title = Sigma de Cramér-Rao por parâmetro

js-lunarinfra-days =
    { $n ->
        [one] { $n } dia
        [many] { $n } de dias
       *[other] { $n } dias
    }

js-lunarinfra-direction = direção { $n }

js-lunarinfra-disclosures = Divulgações

js-lunarinfra-eig-label = Valores próprios da informação, escala logarítmica

js-lunarinfra-eig-note = Os sete valores próprios da matriz de informação, o menor primeiro, sem e com as ligações orbitador-estação. O menor sobe { $times } vezes, e o traço de Cramér-Rao desce para { $share } do seu valor. Isto pressupõe que a órbita é conhecida nos eixos lunares (o seu erro é transportado pelo sigma da distância do orbitador).

js-lunarinfra-eig-title = Informação em cada direção do datum

js-lunarinfra-fact-arc = Arco

js-lunarinfra-fact-hash = Hash do cenário

js-lunarinfra-fact-llr-rows = Linhas de telemetria laser

js-lunarinfra-fact-orbit-family = Família de órbitas

js-lunarinfra-fact-orbiter-arc = Arco do orbitador

js-lunarinfra-fact-orbiter-rows = Linhas do orbitador

js-lunarinfra-fact-study = Estudo

js-lunarinfra-fact-wavelength = Comprimento de onda da portadora

js-lunarinfra-families-note = O RMS da derivada parcial de cada parâmetro sobre as linhas da família, e o número de linhas. Um zero é um parâmetro a que essa família é cega. A sensibilidade a k2 da família do orbitador é um valor do limite superior.

js-lunarinfra-families-title = O que cada família vê

js-lunarinfra-findings = Constatações

js-lunarinfra-fix-note-a = A proporção de ensaios de Monte Carlo que fixaram corretamente todas as ambiguidades inteiras (com o seu erro-padrão), e a taxa que a estimativa por bootstrap prevê.

js-lunarinfra-fix-note-b = A fixação de inteiros NÃO é alcançada nesta entrada: o melhor arco fixa { $share } dos ensaios.

js-lunarinfra-fix-note-c = Não há tempo de fixação para mostrar, porque a fixação não é alcançada.

js-lunarinfra-fix-rate-label = Taxa de fixação de inteiros face ao comprimento do arco

js-lunarinfra-fix-title = Taxa de fixação face ao comprimento do arco

js-lunarinfra-fixed = fixa

js-lunarinfra-float = flutuante

js-lunarinfra-fraction-above-95 = Fração de ensaios acima do ponto de 95 %

js-lunarinfra-ground-radiometric = radiométrica terrestre independente

js-lunarinfra-injected-error = erro injetado { $value } m/s²

js-lunarinfra-mean-consistency = Estatística de consistência média

js-lunarinfra-mean-q = q médio

js-lunarinfra-miss-line = { $id } é { $status }: { $value }

js-lunarinfra-miss-no-fix = A fixação de ambiguidades inteiras NÃO é alcançada nesta entrada: o melhor arco fixa { $share } dos ensaios de Monte Carlo.

js-lunarinfra-na = n/d

js-lunarinfra-nominal = nominal

js-lunarinfra-not-result = este não é um resultado de infraestrutura lunar

js-lunarinfra-not-verified = Não verificado

js-lunarinfra-offset-precision-label = Precisão do desvio face à ligação local, escala log-log

js-lunarinfra-offsets-note = Sigma de translação por eixo, sigma de escala e de rotação à superfície, em metros.

js-lunarinfra-offsets-title = Os desvios para cada erro de ligação (arco de { $days } dias, { $epochs } épocas)

js-lunarinfra-onboard-gnss = a bordo com GNSS terrestre

js-lunarinfra-open-failed = Não foi possível abrir { $title }: { $reason }.

js-lunarinfra-opening = A abrir { $title }…

js-lunarinfra-orbit-uncertainty-log = Incerteza da órbita por componente, escala logarítmica

js-lunarinfra-orbiter-days = orbitador, { $days } d

js-lunarinfra-q-note = Média da estatística de consistência q em { $trials } ensaios; { $expected } é o que um par consistente de soluções dá. A fração de ensaios acima do ponto de 95 % é a taxa de deteção da verificação.

js-lunarinfra-q-title = A verificação de consistência, nominal face ao erro injetado

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: o resultado registado do motor (versão { $version }).
        [many] { $title }: os resultados registados do motor (versão { $version }).
       *[other] { $title }: os resultados registados do motor (versão { $version }).
    }

js-lunarinfra-rel-label = Sigma sobre o nominal, escala logarítmica

js-lunarinfra-rel-note = Sigma de Cramér-Rao como percentagem do valor nominal, com as quatro famílias em conjunto. h2 e l2 são pontos de linearização, não valores verificados; k2 provém de um ajuste publicado.

js-lunarinfra-rel-title = Com que rigor cada parâmetro pode ser fixado, face ao seu valor nominal

js-lunarinfra-result-not-json = o resultado não é JSON ({ $reason })

js-lunarinfra-result-not-loaded = o resultado registado { $file } não foi carregado

js-lunarinfra-row-above-95 = Ensaios acima do ponto de 95 % (qui-quadrado de 95 % = { $chi })

js-lunarinfra-row-crtrace = Traço de Cramér-Rao

js-lunarinfra-row-degeneracy = Métrica de degenerescência

js-lunarinfra-row-formal-diff = Sigma formal dessa diferença

js-lunarinfra-row-ground-meas = Terra: medições, épocas com uma estação

js-lunarinfra-row-mean-diff = Diferença média das duas órbitas

js-lunarinfra-row-mean-q = q médio (6 esperado)

js-lunarinfra-row-observations = Observações

js-lunarinfra-row-onboard-epochs = A bordo: épocas com um ou mais / quatro ou mais satélites

js-lunarinfra-row-onboard-meas = A bordo: medições, média de satélites seguidos

js-lunarinfra-row-origin-scale = Correlação origem-escala

js-lunarinfra-row-origin-sigma = Sigma da origem, m

js-lunarinfra-row-rank-defect = Característica (defeito)

js-lunarinfra-row-smallest-eig = Menor valor próprio

js-lunarinfra-row-trace-ground = Amostra sobre o traço formal, Terra

js-lunarinfra-row-trace-onboard = Amostra sobre o traço formal, a bordo

js-lunarinfra-row-within-95 = Ensaios dentro do ponto de 95 %

js-lunarinfra-series-bootstrapped = por bootstrap

js-lunarinfra-series-floor = patamar

js-lunarinfra-series-monte-carlo = Monte Carlo

js-lunarinfra-side-note = A órbita: { $family }, um arco de { $arc } dias de uma órbita de { $period } dias, amostrado a cada { $sample } s.

js-lunarinfra-side-title = Lado a lado

js-lunarinfra-sigma-note = Incerteza de posição a um sigma por componente, em metros, a partir das duas estimativas do mesmo arco.

js-lunarinfra-sigma-over-nominal = sigma / nominal

js-lunarinfra-sigma-title = Com que rigor cada lado conhece a órbita

js-lunarinfra-station-days = estação, { $days } d

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Acrescentar uma família nunca baixou o menor valor próprio ({ $lambda } de { $pairs } acréscimos), mas o traço da pseudoinversa não foi maior em apenas { $trace } de { $pairs }, porque uma família acrescentada pode aumentar a característica.

js-lunarinfra-subsets-title = Todas as combinações de famílias

js-lunarinfra-sweep-note = A pior componente de translação de cada desvio, em metros, à medida que o erro da ligação entre as três técnicas na nave espacial é varrido. Com os sigmas de técnica registados (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m), os desvios são limitados pelo ruído de medição, não pela ligação; a ligação só define o patamar para técnicas quase perfeitas.

js-lunarinfra-sweep-title = Precisão dos desvios entre técnicas face à ligação local (arco de { $days } dias)

js-lunarinfra-th-arc-days = Arco, dias

js-lunarinfra-th-bar = Limiar

js-lunarinfra-th-bootstrapped = Taxa por bootstrap

js-lunarinfra-th-budget-exhausted = Orçamento de pesquisa esgotado (ensaios)

js-lunarinfra-th-common-sats = Épocas com 2 ou mais satélites comuns

js-lunarinfra-th-crtrace = Traço de Cramér-Rao

js-lunarinfra-th-dd-ambiguities = Ambiguidades de dupla diferença

js-lunarinfra-th-epochs = Épocas

js-lunarinfra-th-families = Famílias

js-lunarinfra-th-family = Família

js-lunarinfra-th-local-tie = Sigma da ligação local, m

js-lunarinfra-th-mc-fix-rate = Taxa de fixação de Monte Carlo

js-lunarinfra-th-median-ambiguity = Sigma mediano da ambiguidade, ciclos

js-lunarinfra-th-offset = Desvio

js-lunarinfra-th-quantity = Grandeza

js-lunarinfra-th-rank = Característica

js-lunarinfra-th-rotation = Rotação à superfície, m

js-lunarinfra-th-rows = Linhas

js-lunarinfra-th-scale = Escala à superfície, m

js-lunarinfra-th-smallest-eig = Menor valor próprio

js-lunarinfra-th-translation = Translação x, y, z, m

js-lunarinfra-th-value = Valor

js-lunarinfra-th-verdict = Veredicto

js-lunarinfra-th-with-links = Com ligações do orbitador

js-lunarinfra-th-without-links = Sem ligações do orbitador

js-lunarinfra-title-carrier-phase = Fase da portadora, superfície e orbitador

js-lunarinfra-title-frame-coestimation = Coestimação do referencial

js-lunarinfra-title-geodesy-sensitivity = Números de Love e libração

js-lunarinfra-title-od-consistency = Consistência da determinação de órbita

js-lunarinfra-title-space-tie = Ligação espacial

js-lunarinfra-unknown-study = este resultado de infraestrutura lunar é o estudo "{ $study }", que esta página não lê

js-lunarinfra-where-missed = Onde este estudo falhou.

js-lunarinfra-with-links = com ligações do orbitador

js-lunarinfra-without-links = sem ligações do orbitador

js-lunarinfra-x-arc-length = comprimento do arco, dias

js-lunarinfra-x-local-tie = sigma da ligação local, m (log)

js-lunarinfra-y-fixed-correctly = fixados corretamente, %

js-lunarinfra-y-offset-sigma = sigma do desvio, m (log); o patamar tracejado é só a ligação, sqrt(2) × o erro da ligação

js-meaning-body-generic = um corpo

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } de { $n } verificação
        [many] { $av } de { $n } de verificações
       *[other] { $av } de { $n } verificações
    }

js-meaning-coverage-average-label = Média à vista

js-meaning-coverage-big-min =
    { $n ->
        [one] Pelo menos { $n } satélite à vista em todos os locais, { $mean } em média.
        [many] Pelo menos { $n } de satélites à vista em todos os locais, { $mean } em média.
       *[other] Pelo menos { $n } satélites à vista em todos os locais, { $mean } em média.
    }

js-meaning-coverage-big-none = Alguns locais não veem nenhum satélite por vezes; { $mean } estão à vista em média.

js-meaning-coverage-fewest-label = Mínimo à vista, em qualquer lugar

js-meaning-coverage-line-many = Com { $names } em conjunto, é possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body }.

js-meaning-coverage-line-many-pdop = Com { $names } em conjunto, é possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

js-meaning-coverage-line-none = É possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body }.

js-meaning-coverage-line-none-pdop = É possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

js-meaning-coverage-line-one = Com { $names }, é possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body }.

js-meaning-coverage-line-one-pdop = Com { $names }, é possível uma solução de posição em { $share } % dos locais e instantes em torno de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

js-meaning-coverage-places-label = Locais que obtêm uma solução de posição

js-meaning-duration-days =
    { $n ->
        [one] { $days } dia
        [many] { $days } de dias
       *[other] { $days } dias
    }

js-meaning-ensemble-big-many = Em muitas extrações de ruído, o { $q } mantém { $thr } ns durante { $qd } em média; o { $c } durante { $cd }.

js-meaning-ensemble-big-runs =
    { $n ->
        [one] Em { $n } extração de ruído, o { $q } mantém { $thr } ns durante { $qd } em média; o { $c } durante { $cd }.
        [many] Em { $n } de extrações de ruído, o { $q } mantém { $thr } ns durante { $qd } em média; o { $c } durante { $cd }.
       *[other] Em { $n } extrações de ruído, o { $q } mantém { $thr } ns durante { $qd } em média; o { $c } durante { $cd }.
    }

js-meaning-ensemble-line = Nove extrações em dez de { $name } mantêm-se de { $band }.

js-meaning-ensemble-mean = média

js-meaning-ensemble-mean-band = média; banda de 90 % { $band }

js-meaning-error-p95-label = Erro, 95 % do tempo, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Também desta execução: { $a }.

js-meaning-generic-line-two = Também desta execução: { $a } e { $b }.

js-meaning-generic-none = Esta execução não tem um único valor principal; o gráfico abaixo mostra o seu resultado.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = nível de proteção horizontal

js-meaning-inside-budget = dentro de { $budget }

js-meaning-integrity-big-checks-mostly = Sim, na maior parte: em { $share } % das verificações.

js-meaning-integrity-big-checks-no = Não: em { $share } % das verificações.

js-meaning-integrity-big-checks-partly = Só em parte: em { $share } % das verificações.

js-meaning-integrity-big-checks-yes = Sim: em { $share } % das verificações.

js-meaning-integrity-big-span-mostly = Sim, na maior parte: durante { $share } % de { $span }.

js-meaning-integrity-big-span-no = Não: durante { $share } % de { $span }.

js-meaning-integrity-big-span-partly = Só em parte: durante { $share } % de { $span }.

js-meaning-integrity-big-span-yes = Sim: durante { $share } % de { $span }.

js-meaning-integrity-bound-label = Limite de erro típico

js-meaning-integrity-bound-sub = horizontal / vertical, mediana

js-meaning-integrity-gap-all-passed = todas as verificações passaram

js-meaning-integrity-gap-label = Lacuna mais longa

js-meaning-integrity-gap-none = nenhuma

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } verificação seguida, a partir de { $from }
        [many] { $n } de verificações seguidas, a partir de { $from }
       *[other] { $n } verificações seguidas, a partir de { $from }
    }

js-meaning-integrity-misleading-label = Soluções de posição enganosas

js-meaning-integrity-misleading-sub = erro real acima do limite

js-meaning-integrity-trusted-label = Tempo em que se pode confiar na solução de posição

js-meaning-jamming-above-label = Jammer acima do sinal

js-meaning-jamming-above-sub = razão jammer-sinal média

js-meaning-jamming-big-gone = O jammer retira por completo a solução de posição.

js-meaning-jamming-big-share = Com o jammer, há solução de posição disponível em { $share } % do tempo.

js-meaning-jamming-clear-label = Solução de posição disponível, sem jammer

js-meaning-jamming-fewest-label = Mínimo de satélites seguidos

js-meaning-jamming-fewest-sub = no pior momento

js-meaning-jamming-jammed-label = Solução de posição disponível, com jammer

js-meaning-jamming-line = Sem o jammer, há solução de posição disponível em { $share } % do tempo.

js-meaning-jamming-line-js = Sem o jammer, há solução de posição disponível em { $share } % do tempo; o jammer chega, em média, { $db } dB acima do sinal.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Sim: em todas as verificações ({ $n }).
        [many] Sim: em todas as verificações ({ $n }).
       *[other] Sim: em todas as verificações ({ $n }).
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Não: em nenhuma das verificações ({ $n }).
        [many] Não: em nenhuma das verificações ({ $n }).
       *[other] Não: em nenhuma das verificações ({ $n }).
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] Em { $av } de { $n } verificação ({ $share } %).
        [many] Em { $av } de { $n } de verificações ({ $share } %).
       *[other] Em { $av } de { $n } verificações ({ $share } %).
    }

js-meaning-lunar-largest-label = Maior limite de erro

js-meaning-lunar-line = O nível de proteção variou de { $min } a { $max } m face a um limite de alerta de { $limit } m.

js-meaning-lunar-meet-label = Verificações que cumprem o limite

js-meaning-lunar-meet-value = { $av } de { $tot }

js-meaning-lunar-smallest-label = Menor limite de erro

js-meaning-median-lower-better = mediana, quanto menor melhor

js-meaning-of-the-time = do tempo

js-meaning-orbit-best-label = Melhor geometria (PDOP)

js-meaning-orbit-best-sub = mínimo ao longo da execução

js-meaning-orbit-big-always = É possível uma solução de posição durante todo o tempo.

js-meaning-orbit-big-share = É possível uma solução de posição em { $share } % do tempo.

js-meaning-orbit-error-label = Erro de posição típico

js-meaning-orbit-error-sub = 1 sigma, mediana

js-meaning-orbit-line =
    { $n ->
        [one] Havia satélites suficientes à vista em { $fix } de { $n } momento.
        [many] Havia satélites suficientes à vista em { $fix } de { $n } de momentos.
       *[other] Havia satélites suficientes à vista em { $fix } de { $n } momentos.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Havia satélites suficientes à vista em { $fix } de { $n } momento; a qualidade típica da geometria (PDOP, diluição de precisão de posição) é { $pdop }, quanto menor melhor.
        [many] Havia satélites suficientes à vista em { $fix } de { $n } de momentos; a qualidade típica da geometria (PDOP, diluição de precisão de posição) é { $pdop }, quanto menor melhor.
       *[other] Havia satélites suficientes à vista em { $fix } de { $n } momentos; a qualidade típica da geometria (PDOP, diluição de precisão de posição) é { $pdop }, quanto menor melhor.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } de { $n } momento
        [many] { $fix } de { $n } de momentos
       *[other] { $fix } de { $n } momentos
    }

js-meaning-orbit-time-label = Tempo em que é possível uma solução de posição

js-meaning-pair-big-diff-pos = O { $best } mantém-se dentro de { $budget } durante { $bestDur }; o { $other } durante { $otherDur }.

js-meaning-pair-big-diff-time = O { $best } mantém o tempo dentro de { $budget } durante { $bestDur }; o { $other } durante { $otherDur }.

js-meaning-pair-big-same-pos = Tanto o { $q } como o { $c } mantêm-se dentro de { $budget } durante { $dur }.

js-meaning-pair-big-same-time = Tanto o { $q } como o { $c } mantêm o tempo dentro de { $budget } durante { $dur }.

js-meaning-pair-line-clock = O holdover é quanto tempo cada relógio se mantém dentro do orçamento de { $budget } depois de perdida a navegação por satélite.

js-meaning-pair-line-navigator = O holdover é quanto tempo cada navegador se mantém dentro do orçamento de { $budget } depois de perdida a navegação por satélite.

js-meaning-pdop-label = Qualidade da geometria (PDOP)

js-meaning-places-times = dos locais e instantes

js-meaning-range-to = { $from } a { $to }

js-meaning-satellites =
    { $n ->
        [one] satélite
        [many] de satélites
       *[other] satélites
    }

js-meaning-spectrum-above = acima do limiar

js-meaning-spectrum-below = abaixo do limiar: perdido

js-meaning-spectrum-big-kept =
    { $n ->
        [one] O único sinal ({ $n }) continua em seguimento.
        [many] Todos os { $n } de sinais continuam em seguimento.
       *[other] Todos os { $n } sinais continuam em seguimento.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] Os jammers retiram { $lost } de { $n } sinal: { $names }.
        [many] Os jammers retiram { $lost } de { $n } de sinais: { $names }.
       *[other] Os jammers retiram { $lost } de { $n } sinais: { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } mantém-se acima do limiar de seguimento do recetor durante toda a execução.
        [many] { $names } mantêm-se acima do limiar de seguimento do recetor durante toda a execução.
       *[other] { $names } mantêm-se acima do limiar de seguimento do recetor durante toda a execução.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } mantém-se acima do limiar de seguimento de { $thr } dB-Hz do recetor durante toda a execução.
        [many] { $names } mantêm-se acima do limiar de seguimento de { $thr } dB-Hz do recetor durante toda a execução.
       *[other] { $names } mantêm-se acima do limiar de seguimento de { $thr } dB-Hz do recetor durante toda a execução.
    }

js-meaning-spectrum-line-none = Nenhum sinal se mantém acima do limiar de seguimento do recetor durante toda a execução.

js-meaning-integrity-line-none =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificação.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } de verificações.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificações.
    }

js-meaning-integrity-line-none-clean =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

js-meaning-integrity-line-none-some =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

js-meaning-integrity-line-h =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificação.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações.
    }

js-meaning-integrity-line-h-clean =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

js-meaning-integrity-line-h-some =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

js-meaning-integrity-line-v =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificação.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações.
    }

js-meaning-integrity-line-v-clean =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

js-meaning-integrity-line-v-some =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

js-meaning-integrity-line-hv =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificação.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações.
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

js-meaning-integrity-line-hv-some =
    { $n ->
        [one] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do recetor (o seu nível de proteção) manteve-se abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

js-meaning-spectrum-line-none-thr = Nenhum sinal se mantém acima do limiar de seguimento de { $thr } dB-Hz do recetor durante toda a execução.

js-meaning-spectrum-weakest-label = Sinal mais fraco, { $name }

js-meaning-whole-run = ao longo de toda a execução

js-meaning-your-setting = a sua definição

js-meankind-acm-line = Modo fixo { $mode }; { $dur } de interrupção.

js-meankind-anomaly-big = O monitor de falhas quântico obtém { $q } contra { $c } do clássico (área sob a curva, 1 é perfeito).

js-meankind-anomaly-line = A menor falha detetável é { $q } contra { $c }.

js-meankind-aocs-big-open = A rotação de { $slew } graus não estabiliza abaixo de { $threshold } graus.

js-meankind-aocs-big-settles = A rotação de { $slew } graus estabiliza abaixo de { $threshold } graus após { $dur }.

js-meankind-aocs-line = Erro final de apontamento de { $final } graus.

js-meankind-aocs-line-filter = Erro final de apontamento de { $final } graus. Um filtro de atitude na malha tem um desvio de { $arcsec } arcsec RMS.

js-meankind-aocs-line-wheel = Erro final de apontamento de { $final } graus. Binário máximo da roda { $torque } N m.

js-meankind-aocs-line-wheel-filter = Erro final de apontamento de { $final } graus. Binário máximo da roda { $torque } N m. Um filtro de atitude na malha tem um desvio de { $arcsec } arcsec RMS.

js-meankind-aperture-big = A navegação usa { $nav } % do tempo da antena e as comunicações { $comms } %.

js-meankind-aperture-big-idle = A navegação usa { $nav } % do tempo da antena e as comunicações { $comms } %; { $idle } % está inativo.

js-meankind-aperture-line-nocount = As aberturas.

js-meankind-aperture-line-nocount-all = As aberturas sob a regra { $policy }, com { $dur } de contenção.

js-meankind-aperture-line-nocount-contention = As aberturas, com { $dur } de contenção.

js-meankind-aperture-line-nocount-policy = As aberturas sob a regra { $policy }.

js-meankind-araim-big-no = Não: os níveis de proteção do motor falham a referência publicada.

js-meankind-araim-big-yes = Sim: os níveis de proteção do motor coincidem com a referência publicada.

js-meankind-araim-line = A pior diferença é { $worst } m face à tolerância da própria referência de { $tol } m.

js-meankind-arc-big = O estimador recupera a órbita quando dispõe de { $dur } do arco de { $h } h.

js-meankind-arc-line =
    { $n ->
        [one] { $n } nave espacial, medições de { $observable }.
        [many] { $n } de naves espaciais, medições de { $observable }.
       *[other] { $n } naves espaciais, medições de { $observable }.
    }

js-meankind-ascent-big = A gravidade, o arrasto, a orientação e a contrapressão retiram { $loss } m/s dos { $ideal } m/s de ganho ideal de velocidade.

js-meankind-ascent-line = Fim da queima a { $km } km e { $speed } m/s; pressão dinâmica máxima { $kpa } kPa.

js-meankind-attack-big-no = Um spoofer na superfície não consegue capturar um recetor lunar.

js-meankind-attack-big-yes = Um spoofer na superfície consegue capturar um recetor lunar.

js-meankind-attack-line = Um transmissor na superfície alcança { $km } km antes de o horizonte o bloquear.

js-meankind-attitude-big = O erro de apontamento totaliza { $total } segundos de arco.

js-meankind-attitude-big-from = O erro de apontamento totaliza { $total } segundos de arco, sobretudo devido a { $from }.

js-meankind-attitude-line = O maior binário de gradiente gravítico é { $torque } N·m.

js-meankind-beacon-big = As balizas na superfície melhoram a qualidade da geometria (PDOP) { $x } vezes.

js-meankind-beacon-line = Acrescentar antes satélites melhora-a { $x } vezes.

js-meankind-bodypnt-big = Só os retransmissores dão uma solução de posição em { $share } % do tempo em torno de { $body }.

js-meankind-bodypnt-big-earth = Só os retransmissores dão uma solução de posição em { $share } % do tempo em torno de { $body }; { $earth } % com ligações à Terra.

js-meankind-bodypnt-line = { $mean } retransmissores estão à vista em média.

js-meankind-by = { $a } por { $b }

js-meankind-campaign-compose-line = Cada membro é uma execução normal do motor; a campanha lê os seus resultados lado a lado.

js-meankind-campaign-mission-alarm = O alarme é ativado durante { $alarm } da missão de { $dur }.

js-meankind-campaign-mission-phases =
    { $phases ->
        [one] Uma missão de { $phases } fase ao longo de { $dur }, encadeada num só relógio.
        [many] Uma missão de { $phases } de fases ao longo de { $dur }, encadeadas num só relógio.
       *[other] Uma missão de { $phases } fases ao longo de { $dur }, encadeadas num só relógio.
    }

js-meankind-campaign-mission-quiet = Nenhum alarme em toda a missão de { $dur }.

js-meankind-campaign-montecarlo-line = A dispersão é um desvio-padrão sobre as execuções.

js-meankind-campaign-optimize-at = Em { $at }.

js-meankind-campaign-sweep-flat-line = O gráfico mostra todas as execuções.

js-meankind-campaign-sweep-goes-line = O gráfico mostra todas as execuções; varia de { $min } a { $max }.

js-meankind-classical-link = ligação clássica

js-meankind-clock-word = relógio

js-meankind-conflict-big = A arquitetura em camadas sobrevive { $ratio } vezes melhor do que uma única camada.

js-meankind-conflict-line-threats = Um Monte Carlo das ameaças dá { $ratio } vezes.

js-meankind-conflict-line-threats-corr = Um Monte Carlo das ameaças dá { $ratio } vezes; com ameaças correlacionadas pode descer para { $low } vezes.

js-meankind-contacts-line = { $sats } satélites e { $stations } estações ao longo de { $hours } h.

js-meankind-dpnt-big = As correções diferenciais reduzem o erro de { $from } m para { $to } m.

js-meankind-dpnt-line = Com uma estação de referência a { $km } km de distância.

js-meankind-earthgnss-line = O melhor sinal é { $best } dB-Hz face a um limiar de seguimento de { $threshold } dB-Hz.

js-meankind-entry-big = A desaceleração máxima é { $g } g a { $km } km, com um fluxo de calor máximo de { $flux } W/cm².

js-meankind-entry-line = Entrada a { $speed } m/s, { $angle } graus abaixo do horizonte.

js-meankind-eo-big = A câmara vê uma faixa de { $swath } km com resolução de { $gsd } m.

js-meankind-eo-line-contiguous = Os traços no solo estão a { $km } km de distância no equador, pelo que a cobertura é contígua.

js-meankind-eo-line-gapped = Os traços no solo estão a { $km } km de distância no equador, pelo que a cobertura tem lacunas.

js-meankind-eop-big = À distância da Lua, a rotação da Terra desloca { $m } m a cada segundo, pelo que a idade dos dados de orientação da Terra ({ $dur } aqui) importa.

js-meankind-eop-line = Entrada: { $source }.

js-meankind-ephemeris-big = O satélite voa entre { $min } e { $max } km, até { $lat }° de latitude.

js-meankind-ephemeris-line = Visto da estação, sobe até { $deg }°.

js-meankind-ephemeris-line-doppler = Visto da estação, sobe até { $deg }°, com até { $khz } kHz de Doppler.

js-meankind-framecampaign-big-yes = Sim: a campanha fixa totalmente o datum do referencial lunar.

js-meankind-framecampaign-line = Número de condição { $n }.

js-meankind-framereal-big = O referencial lunar é realizado com { $m } m de erro residual.

js-meankind-framereal-big-open = O referencial lunar é realizado com { $m } m de erro residual, embora o ajuste não tenha convergido.

js-meankind-framereal-line = Erro de translação { $trans } m, erro de escala { $scale } partes por mil milhões.

js-meankind-gnsssim-big = A monitorização da integridade protege a solução de posição em { $share } % do tempo.

js-meankind-gnsssim-line = A ionosfera acrescenta { $iono } m e a troposfera { $tropo } m a cada distância, em média.

js-meankind-headline-figure = valor principal

js-meankind-holdovertest-big = Medido face às máscaras, o holdover do registo de { $dur } s atinge { $te } ns de erro de tempo.

js-meankind-holdovertest-big-open = Medido face às máscaras, o holdover do registo de { $dur } s atinge { $te } ns de erro de tempo, e não recuperou dentro da banda.

js-meankind-holdovertest-big-recovered = Medido face às máscaras, o holdover do registo de { $dur } s atinge { $te } ns de erro de tempo, e recuperou { $recover } s depois de o GNSS regressar.

js-meankind-holdovertest-line = Medido face à máscara, nunca uma declaração de que um sistema está em conformidade; os dois tempos são a declaração do operador.

js-meankind-holdovertest-line-masks = { $masks }. Medido face à máscara, nunca uma declaração de que um sistema está em conformidade; os dois tempos são a declaração do operador.

js-meankind-impairment-big = O detetor separa sinais degradados de sinais limpos com uma área sob a curva de { $auc } (1 é perfeito).

js-meankind-impairment-line = Em casos diferentes do seu conjunto de treino obtém { $auc }.

js-meankind-infra-carrier = A fixação de inteiros da fase da portadora entre uma estação à superfície e um orbitador fixou { $share } % dos ensaios no arco mais longo ({ $days } dias).

js-meankind-infra-frame = As ligações orbitador-estação elevam { $x } vezes o menor valor próprio da informação do datum lunar e reduzem o traço de Cramér-Rao para { $share } %, se a órbita for conhecida nos eixos lunares.

js-meankind-infra-geodesy = Com as quatro famílias em conjunto, h2, k2 e l2 ficam fixados em { $h2 } %, { $k2 } % e { $l2 } % dos seus valores nominais.

js-meankind-infra-od = A determinação de órbita a bordo com GNSS terrestre em órbita lunar tem uma exatidão de { $gnss } m, o seguimento terrestre independente de { $ground } m; a estatística de consistência tem média { $mean } ({ $expected } esperado).

js-meankind-infra-tail = MODELLED: um modelo restrito com entradas ilustrativas, não uma declaração sobre qualquer missão.

js-meankind-inside-spec = dentro de { $spec }

js-meankind-instrn-big = Em deslocamento só com navegação inercial, o erro de posição ultrapassa { $threshold } m após { $dur }.

js-meankind-instrn-dom = { $dominant } domina.

js-meankind-instrn-line = Ultrapassa { $passes }.

js-meankind-instrn-line-dom = Ultrapassa { $passes }; { $dominant } domina.

js-meankind-instrn-pass = { $threshold } m após { $dur }

js-meankind-interop-big-no = Não: o ficheiro de efemérides lunares não faz o percurso de ida e volta sem perdas.

js-meankind-interop-big-yes = Sim: o ficheiro de efemérides lunares faz o percurso de ida e volta intacto.

js-meankind-interop-line =
    { $n ->
        [one] { $n } estado no referencial { $frame }, tempo { $time }.
        [many] { $n } de estados no referencial { $frame }, tempo { $time }.
       *[other] { $n } estados no referencial { $frame }, tempo { $time }.
    }

js-meankind-its-spec = a sua especificação

js-meankind-jointod-big = Acrescentar um atraso de interferometria baseado na Terra torna a posição da estação { $x } vezes mais nítida.

js-meankind-jointod-line = A estação passa então a ser conhecida com { $m } m.

js-meankind-launch-line = A rotação da Terra dá { $speed } m/s de graça.

js-meankind-layer-agc = AGC (controlo automático de ganho)

js-meankind-layer-raim = RAIM (monitorização autónoma da integridade pelo recetor)

js-meankind-layer-sqm = SQM (monitorização da qualidade do sinal)

js-meankind-leochain-big = De ponta a ponta, o sistema de órbita baixa reduz o erro de posição de { $from } m para { $to } m.

js-meankind-leochain-line = O seu sinal é seguido até { $cn0 } dB-Hz.

js-meankind-leopass-big-many = Os satélites passam a { $elev }° de altura e ficam acima da máscara durante { $dur } (o primeiro de { $n }).

js-meankind-leopass-big-one = O satélite passa a { $elev }° de altura e fica acima da máscara durante { $dur }.

js-meankind-leopass-line = No seu pico, o sinal de órbita baixa chega { $db } dB mais forte do que um sinal típico de navegação por satélite.

js-meankind-leoppp-big = O posicionamento preciso converge em { $best } min com a maior camada de órbita baixa, face a { $base } min só com navegação por satélite.

js-meankind-leoppp-line = Mediana das execuções por caso, até { $m } m.

js-meankind-leopvt-doppler-big = O posicionamento por Doppler a partir de satélites de órbita baixa fica a { $m } m da referência (horizontal).

js-meankind-leopvt-joint-big = Acrescentar a camada de órbita baixa reduz o erro de { $from } m para { $to } m (valor quadrático médio 3D).

js-meankind-leopvt-joint-line = A qualidade da geometria (PDOP) passa de { $from } para { $to }.

js-meankind-leopvt-polar-big = Perto do polo, a camada de órbita baixa melhora a qualidade da geometria (PDOP) de { $from } para { $to }.

js-meankind-leopvt-timing-big = A transferência de tempo de órbita baixa mantém o melhor relógio a menos de { $ns } ns do UTC (valor quadrático médio).

js-meankind-acm-big =
    { $n ->
        [one] A codificação adaptativa move { $gain } vezes os dados do melhor modo fixo: { $acm } Gbit contra { $ccm } Gbit em { $n } passagem.
        [many] A codificação adaptativa move { $gain } vezes os dados do melhor modo fixo: { $acm } Gbit contra { $ccm } Gbit em { $n } de passagens.
       *[other] A codificação adaptativa move { $gain } vezes os dados do melhor modo fixo: { $acm } Gbit contra { $ccm } Gbit em { $n } passagens.
    }

js-meankind-aperture-line-all =
    { $n ->
        [one] { $n } abertura sob a regra { $policy }, com { $dur } de contenção.
        [many] { $n } de aberturas sob a regra { $policy }, com { $dur } de contenção.
       *[other] { $n } aberturas sob a regra { $policy }, com { $dur } de contenção.
    }

js-meankind-aperture-line-contention =
    { $n ->
        [one] { $n } abertura, com { $dur } de contenção.
        [many] { $n } de aberturas, com { $dur } de contenção.
       *[other] { $n } aberturas, com { $dur } de contenção.
    }

js-meankind-aperture-line-count =
    { $n ->
        [one] { $n } abertura.
        [many] { $n } de aberturas.
       *[other] { $n } aberturas.
    }

js-meankind-aperture-line-policy =
    { $n ->
        [one] { $n } abertura sob a regra { $policy }.
        [many] { $n } de aberturas sob a regra { $policy }.
       *[other] { $n } aberturas sob a regra { $policy }.
    }

js-meankind-araim-line-vectors =
    { $n ->
        [one] A pior diferença é { $worst } m face à tolerância da própria referência de { $tol } m, em { $n } vetor de referência.
        [many] A pior diferença é { $worst } m face à tolerância da própria referência de { $tol } m, em { $n } de vetores de referência.
       *[other] A pior diferença é { $worst } m face à tolerância da própria referência de { $tol } m, em { $n } vetores de referência.
    }

js-meankind-campaign-compose-range =
    { $n ->
        [one] Em { $n } cenário nas mesmas condições, { $what } varia de { $low } a { $high }.
        [many] Em { $n } de cenários nas mesmas condições, { $what } varia de { $low } a { $high }.
       *[other] Em { $n } cenários nas mesmas condições, { $what } varia de { $low } a { $high }.
    }

js-meankind-campaign-compose-same =
    { $n ->
        [one] Em { $n } cenário nas mesmas condições, { $what } é { $value } em todos.
        [many] Em { $n } de cenários nas mesmas condições, { $what } é { $value } em todos.
       *[other] Em { $n } cenários nas mesmas condições, { $what } é { $value } em todos.
    }

js-meankind-campaign-line =
    { $n ->
        [one] { $n } fase.
        [many] { $n } de fases.
       *[other] { $n } fases.
    }

js-meankind-campaign-line-all =
    { $n ->
        [one] { $n } fase e { $events }, de { $runs }; no fim, { $label } é { $value }.
        [many] { $n } de fases e { $events }, de { $runs }; no fim, { $label } é { $value }.
       *[other] { $n } fases e { $events }, de { $runs }; no fim, { $label } é { $value }.
    }

js-meankind-campaign-line-end =
    { $n ->
        [one] { $n } fase; no fim, { $label } é { $value }.
        [many] { $n } de fases; no fim, { $label } é { $value }.
       *[other] { $n } fases; no fim, { $label } é { $value }.
    }

js-meankind-campaign-line-events =
    { $n ->
        [one] { $n } fase e { $events }.
        [many] { $n } de fases e { $events }.
       *[other] { $n } fases e { $events }.
    }

js-meankind-campaign-line-events-end =
    { $n ->
        [one] { $n } fase e { $events }; no fim, { $label } é { $value }.
        [many] { $n } de fases e { $events }; no fim, { $label } é { $value }.
       *[other] { $n } fases e { $events }; no fim, { $label } é { $value }.
    }

js-meankind-campaign-line-events-runs =
    { $n ->
        [one] { $n } fase e { $events }, de { $runs }.
        [many] { $n } de fases e { $events }, de { $runs }.
       *[other] { $n } fases e { $events }, de { $runs }.
    }

js-meankind-campaign-line-runs =
    { $n ->
        [one] { $n } fase, de { $runs }.
        [many] { $n } de fases, de { $runs }.
       *[other] { $n } fases, de { $runs }.
    }

js-meankind-campaign-line-runs-end =
    { $n ->
        [one] { $n } fase, de { $runs }; no fim, { $label } é { $value }.
        [many] { $n } de fases, de { $runs }; no fim, { $label } é { $value }.
       *[other] { $n } fases, de { $runs }; no fim, { $label } é { $value }.
    }

js-meankind-campaign-montecarlo =
    { $n ->
        [one] Em { $n } execução com semente, { $name } tem média { $mean }, com uma dispersão de { $std }.
        [many] Em { $n } de execuções com semente, { $name } tem média { $mean }, com uma dispersão de { $std }.
       *[other] Em { $n } execuções com semente, { $name } tem média { $mean }, com uma dispersão de { $std }.
    }

js-meankind-campaign-optimize =
    { $n ->
        [one] A pesquisa estabiliza em { $name } igual a { $value } após { $n } execução.
        [many] A pesquisa estabiliza em { $name } igual a { $value } após { $n } de execuções.
       *[other] A pesquisa estabiliza em { $name } igual a { $value } após { $n } execuções.
    }

js-meankind-campaign-optimize-kind =
    { $n ->
        [one] A pesquisa estabiliza em { $name } igual a { $value } após { $n } execução de { $kind }.
        [many] A pesquisa estabiliza em { $name } igual a { $value } após { $n } de execuções de { $kind }.
       *[other] A pesquisa estabiliza em { $name } igual a { $value } após { $n } execuções de { $kind }.
    }

js-meankind-campaign-sweep-flat =
    { $n ->
        [one] Em { $n } execução de { $axis } de { $from } a { $to }, { $metric } mantém-se em { $value }.
        [many] Em { $n } de execuções de { $axis } de { $from } a { $to }, { $metric } mantém-se em { $value }.
       *[other] Em { $n } execuções de { $axis } de { $from } a { $to }, { $metric } mantém-se em { $value }.
    }

js-meankind-campaign-sweep-goes =
    { $n ->
        [one] Em { $n } execução de { $axis } de { $from } a { $to }, { $metric } vai de { $first } a { $last }.
        [many] Em { $n } de execuções de { $axis } de { $from } a { $to }, { $metric } vai de { $first } a { $last }.
       *[other] Em { $n } execuções de { $axis } de { $from } a { $to }, { $metric } vai de { $first } a { $last }.
    }

js-meankind-conflict-line-trials =
    { $n ->
        [one] Um Monte Carlo de { $n } ensaio dá { $ratio } vezes.
        [many] Um Monte Carlo de { $n } de ensaios dá { $ratio } vezes.
       *[other] Um Monte Carlo de { $n } ensaios dá { $ratio } vezes.
    }

js-meankind-conflict-line-trials-corr =
    { $n ->
        [one] Um Monte Carlo de { $n } ensaio dá { $ratio } vezes; com ameaças correlacionadas pode descer para { $low } vezes.
        [many] Um Monte Carlo de { $n } de ensaios dá { $ratio } vezes; com ameaças correlacionadas pode descer para { $low } vezes.
       *[other] Um Monte Carlo de { $n } ensaios dá { $ratio } vezes; com ameaças correlacionadas pode descer para { $low } vezes.
    }

js-meankind-contacts-big =
    { $n ->
        [one] O plano mantém { $kept } de { $n } contacto candidato e entrega { $gbit } Gbit.
        [many] O plano mantém { $kept } de { $n } de contactos candidatos e entrega { $gbit } Gbit.
       *[other] O plano mantém { $kept } de { $n } contactos candidatos e entrega { $gbit } Gbit.
    }

js-meankind-contacts-big-waiting =
    { $n ->
        [one] O plano mantém { $kept } de { $n } contacto candidato e entrega { $gbit } Gbit dos { $waiting } Gbit em espera.
        [many] O plano mantém { $kept } de { $n } de contactos candidatos e entrega { $gbit } Gbit dos { $waiting } Gbit em espera.
       *[other] O plano mantém { $kept } de { $n } contactos candidatos e entrega { $gbit } Gbit dos { $waiting } Gbit em espera.
    }

js-meankind-duration-days =
    { $n ->
        [one] { $days } dia
        [many] { $days } de dias
       *[other] { $days } dias
    }

js-meankind-earthgnss-big =
    { $n ->
        [one] À distância da Lua, { $visible } de { $n } satélite está à vista, mas { $trackable } pode ser seguido.
        [many] À distância da Lua, { $visible } de { $n } de satélites estão à vista, mas { $trackable } podem ser seguidos.
       *[other] À distância da Lua, { $visible } de { $n } satélites estão à vista, mas { $trackable } podem ser seguidos.
    }

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } execução do motor
        [many] { $n } de execuções do motor
       *[other] { $n } execuções do motor
    }

js-meankind-event-count =
    { $n ->
        [one] { $n } evento
        [many] { $n } de eventos
       *[other] { $n } eventos
    }

js-meankind-framecampaign-big-open =
    { $n ->
        [one] A campanha deixa { $n } direção do datum por determinar.
        [many] A campanha deixa { $n } de direções do datum por determinar.
       *[other] A campanha deixa { $n } direções do datum por determinar.
    }

js-meankind-infra-tie =
    { $n ->
        [one] Uma ligação local de { $mm } mm numa só nave espacial liga os referenciais GNSS, VLBI e de telemetria laser ao longo de { $n } erro de ligação varrido.
        [many] Uma ligação local de { $mm } mm numa só nave espacial liga os referenciais GNSS, VLBI e de telemetria laser ao longo de { $n } de erros de ligação varridos.
       *[other] Uma ligação local de { $mm } mm numa só nave espacial liga os referenciais GNSS, VLBI e de telemetria laser ao longo de { $n } erros de ligação varridos.
    }

js-meankind-launch-big =
    { $n ->
        [one] { $n } oportunidade de lançamento por dia permite atingir uma órbita de { $incl }° a partir da latitude { $lat }°.
        [many] { $n } de oportunidades de lançamento por dia permitem atingir uma órbita de { $incl }° a partir da latitude { $lat }°.
       *[other] { $n } oportunidades de lançamento por dia permitem atingir uma órbita de { $incl }° a partir da latitude { $lat }°.
    }

js-meankind-leoppp-line-runs =
    { $n ->
        [one] Mediana de { $n } execução por caso, até { $m } m.
        [many] Mediana de { $n } de execuções por caso, até { $m } m.
       *[other] Mediana de { $n } execuções por caso, até { $m } m.
    }

js-meankind-leopvt-doppler-line =
    { $n ->
        [one] { $n } satélite usado.
        [many] { $n } de satélites usados.
       *[other] { $n } satélites usados.
    }

js-meankind-leopvt-polar-line =
    { $n ->
        [one] Em { $n } latitude.
        [many] Em { $n } de latitudes.
       *[other] Em { $n } latitudes.
    }

js-meankind-leopvt-timing-line =
    { $n ->
        [one] { $n } caso de relógio e sinal comparado.
        [many] { $n } de casos de relógio e sinal comparados.
       *[other] { $n } casos de relógio e sinal comparados.
    }

js-meankind-leosignal-big =
    { $n ->
        [one] Com { $n } projeto de sinal, { $best } é o que tolera mais jamming: { $db } dB acima do sinal.
        [many] De { $n } de projetos de sinal, { $best } é o que tolera mais jamming: { $db } dB acima do sinal.
       *[other] De { $n } projetos de sinal, { $best } é o que tolera mais jamming: { $db } dB acima do sinal.
    }

js-meankind-leosignal-line-fail = As verificações da forma do espetro falham.

js-meankind-leosignal-line-pass = As verificações da forma do espetro passam.

js-meankind-link-big-closes = A ligação fecha com { $margin } dB de folga.

js-meankind-link-big-open = A ligação não fecha: { $margin } dB de margem.

js-meankind-link-line = Ao longo de { $km } km.

js-meankind-link-line-band = Banda { $band } ao longo de { $km } km.

js-meankind-link-line-band-rate = Banda { $band } ao longo de { $km } km a { $rate } bit/s.

js-meankind-link-line-rate = Ao longo de { $km } km a { $rate } bit/s.

js-meankind-list-and = { $head } e { $last }

js-meankind-llr-big = A telemetria laser lunar real fixa o referencial lunar a { $mm } mm.

js-meankind-llr-line = Escala com { $ppb } partes por mil milhões.

js-meankind-mapmatch-altimeter = O altímetro mede com { $sigma } m.

js-meankind-mapmatch-big = A correspondência com o mapa mantém a posição a { $matched } m, contra { $free } m de deriva só com navegação inercial.

js-meankind-mapmatch-gravimeter = O gravímetro mede com { $sigma } mGal.

js-meankind-mapmatch-sources = Só a gravidade dá { $gravity } m, a magnética { $magnetic } m, o terreno { $terrain } m.

js-meankind-marspnt-big = O navegador do { $user } estabiliza em { $m } m (raiz do valor quadrático médio).

js-meankind-marspnt-line =
    { $n ->
        [one] { $mean } retransmissores à vista em média, ao longo de { $n } época.
        [many] { $mean } retransmissores à vista em média, ao longo de { $n } de épocas.
       *[other] { $mean } retransmissores à vista em média, ao longo de { $n } épocas.
    }

js-meankind-moonlight-big = O serviço cobre { $share } % dos locais e instantes verificados.

js-meankind-moonlight-line =
    { $n ->
        [one] Entre { $min } e { $n } satélite estão à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
        [many] Entre { $min } e { $n } de satélites estão à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
       *[other] Entre { $min } e { $n } satélites estão à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
    }

js-meankind-navmsg-big =
    { $n ->
        [one] Uma mensagem de navegação cabe em { $n } byte.
        [many] Uma mensagem de navegação cabe em { $n } de bytes.
       *[other] Uma mensagem de navegação cabe em { $n } bytes.
    }

js-meankind-navmsg-cases-big =
    { $n ->
        [one] Em { $n } caso, o erro de distância da órbita difundida é de { $min } a { $max } mm.
        [many] Em { $n } de casos, o erro de distância da órbita difundida é de { $min } a { $max } mm.
       *[other] Em { $n } casos, o erro de distância da órbita difundida é de { $min } a { $max } mm.
    }

js-meankind-navmsg-cases-line = Erro de distância do sinal no espaço, raiz do valor quadrático médio.

js-meankind-navmsg-line = O arredondamento ao formato da mensagem custa { $mm } mm de erro de distância.

js-meankind-navmsg-midpass-big = Atualizar a mensagem a meio da passagem faz a distância saltar, no máximo, { $mm } mm.

js-meankind-navmsg-midpass-line = O limite é de { $mm } mm.

js-meankind-ntn-big = O posicionamento 5G a partir da órbita atinge { $m } m com { $signal }.

js-meankind-ntn-line = O Doppler numa passagem dá { $m } m.

js-meankind-obs-big-full = A órbita passa a ser totalmente observável após { $dur } de seguimento.

js-meankind-obs-big-partly = A órbita continua parcialmente observável ao longo do arco de { $h } h.

js-meankind-obs-line = Característica { $rank } de { $dim } no fim do arco.

js-meankind-oem-big = O ficheiro de efemérides faz o percurso de ida e volta com, no máximo, { $mm } mm de erro de posição.

js-meankind-oem-line =
    { $n ->
        [one] { $states } estados em { $n } segmento.
        [many] { $states } estados em { $n } de segmentos.
       *[other] { $states } estados em { $n } segmentos.
    }

js-meankind-optical-big-alone = O melhor local isolado mantém a ligação ótica ativa em { $best } % do tempo (limite sem nuvens de { $ceiling } %); nenhuma margem sem nuvens a eleva acima de { $ceiling } %.

js-meankind-optical-big-team = O melhor local isolado mantém a ligação ótica ativa em { $best } % do tempo (limite sem nuvens de { $ceiling } %); { $n } locais em conjunto atingem { $independent } % se o seu estado do tempo for independente, { $correlated } % com a correlação indicada.

js-meankind-optical-line-sites =
    { $n ->
        [one] { $n } local modelado; os climas de nebulosidade são ilustrativos.
        [many] { $n } de locais modelados; os climas de nebulosidade são ilustrativos.
       *[other] { $n } locais modelados; os climas de nebulosidade são ilustrativos.
    }

js-meankind-optical-line-tech = { $name }: { $base } % passa a { $with } %.

js-meankind-opticalrf-big = Combinar a medição de distância ótica e por rádio dá níveis de proteção de { $h } m na horizontal e { $v } m na vertical.

js-meankind-opticalrf-line-fault = O teste de consistência indica { $stat } face a um limiar de { $threshold }: é assinalada uma falha.

js-meankind-opticalrf-line-ok = O teste de consistência indica { $stat } face a um limiar de { $threshold }: não é assinalada nenhuma falha.

js-meankind-packet-big-no = Não: o fluxo descodificado difere do que foi enviado.

js-meankind-packet-big-yes = Sim: o fluxo de pacotes é descodificado de volta, bit a bit.

js-meankind-packet-line =
    { $n ->
        [one] { $n } pacote, { $octets } octetos no total.
        [many] { $n } de pacotes, { $octets } octetos no total.
       *[other] { $n } pacotes, { $octets } octetos no total.
    }

js-meankind-passes-big-day =
    { $n ->
        [one] { $n } passagem por dia, { $dur } de contacto no total.
        [many] { $n } de passagens por dia, { $dur } de contacto no total.
       *[other] { $n } passagens por dia, { $dur } de contacto no total.
    }

js-meankind-passes-big-window =
    { $n ->
        [one] { $n } passagem numa janela de { $hours } h, { $dur } de contacto no total.
        [many] { $n } de passagens numa janela de { $hours } h, { $dur } de contacto no total.
       *[other] { $n } passagens numa janela de { $hours } h, { $dur } de contacto no total.
    }

js-meankind-passes-line = A melhor passagem sobe até { $deg }°.

js-meankind-percentile-word = percentil

js-meankind-pnt-big = O conjunto quântico mantém a posição e o tempo durante { $q }; o conjunto clássico durante { $c }.

js-meankind-pnt-classical-label = Holdover, conjunto clássico

js-meankind-pnt-line = O holdover é o tempo que cada conjunto (relógio { $q }, face ao relógio { $c }) se mantém dentro de { $spec } depois de a navegação por satélite se perder.

js-meankind-pnt-quantum-label = Holdover, conjunto quântico

js-meankind-pnt-timing-classical-label = Erro de temporização, 95 %, clássico

js-meankind-pnt-timing-quantum-label = Erro de temporização, 95 %, quântico

js-meankind-pvt-big =
    { $n ->
        [one] É resolvida uma posição em { $solved } de { $n } época, com { $rms } m (raiz do valor quadrático médio 3D).
        [many] É resolvida uma posição em { $solved } de { $n } de épocas, com { $rms } m (raiz do valor quadrático médio 3D).
       *[other] É resolvida uma posição em { $solved } de { $n } épocas, com { $rms } m (raiz do valor quadrático médio 3D).
    }

js-meankind-pvt-line = A partir de { $mean } satélites em média, lido de medições reais de recetor.

js-meankind-qnav-big = Após a interrupção, o navegador de átomos frios está desviado { $q } m; o de qualidade de navegação, { $c } m.

js-meankind-qnav-big-outage = Após { $dur } sem satélites, o navegador de átomos frios está desviado { $q } m; o de qualidade de navegação, { $c } m.

js-meankind-qnav-line = Dentro do orçamento: { $q } contra { $c }.

js-meankind-qnav-line-threshold = Dentro de { $threshold } m: { $q } contra { $c }.

js-meankind-qtt-big = A transferência de tempo quântica mantém { $q } ps (1 sigma) contra { $c } ns da cadeia clássica.

js-meankind-qtt-line = O monitor de segurança deteta { $pd } % dos ataques.

js-meankind-qtt-line-pfa = O monitor de segurança deteta { $pd } % dos ataques com uma taxa de falsos alarmes de { $pfa }.

js-meankind-quantum-link = ligação quântica

js-meankind-radiometry-big = A câmara atinge NIIRS { $niirs } com { $gsd } m de distância de amostragem no solo, com uma relação sinal-ruído de { $snr }.

js-meankind-radiometry-line = MTF do sistema à frequência de Nyquist: { $mtf }.

js-meankind-reentry-big = A desaceleração máxima é de { $g } g, a { $km } km.

js-meankind-reentry-line = O veículo está então a { $speed } m/s.

js-meankind-slam-big = A correspondência com o terreno termina a { $matched } m, contra { $free } m só com navegação inercial.

js-meankind-slam-line =
    { $n ->
        [one] Ao longo de { $n } ponto de passagem, correspondido a um mapa de terreno com { $sigma } m de ruído do altímetro.
        [many] Ao longo de { $n } de pontos de passagem, correspondidos a um mapa de terreno com { $sigma } m de ruído do altímetro.
       *[other] Ao longo de { $n } pontos de passagem, correspondidos a um mapa de terreno com { $sigma } m de ruído do altímetro.
    }

js-meankind-slot-big = O relógio sai do seu intervalo de guarda do slot { $dur } após a última posição por satélite.

js-meankind-slot-line = Por isso precisa de uma posição a cada { $interval }, cerca de { $perDay } por dia.

js-meankind-solar-big =
    { $n ->
        [one] { $n } corpo posicionado numa época.
        [many] { $n } de corpos posicionados numa época.
       *[other] { $n } corpos posicionados numa época.
    }

js-meankind-solar-big-link =
    { $n ->
        [one] { $n } corpo posicionado numa época; a luz demora { $dur } de { $from } até { $to }.
        [many] { $n } de corpos posicionados numa época; a luz demora { $dur } de { $from } até { $to }.
       *[other] { $n } corpos posicionados numa época; a luz demora { $dur } de { $from } até { $to }.
    }

js-meankind-solar-line = No total, são cronometradas { $n } ligações.

js-meankind-spoof-caught = O spoofing é detetado antes de quebrar a especificação de temporização.

js-meankind-spoof-caught-both = O spoofing é detetado por ambos os relógios antes de quebrar a especificação de temporização.

js-meankind-spoof-caught-label = Detetado após, { $name }

js-meankind-spoof-caught-thr = O spoofing é detetado antes de quebrar a especificação de temporização de { $thr } ns.

js-meankind-spoof-caught-thr-both = O spoofing é detetado por ambos os relógios antes de quebrar a especificação de temporização de { $thr } ns.

js-meankind-spoof-detects = { $name } deteta-o após { $dur }, com um desvio de { $offset } ns.

js-meankind-spoof-missed =
    { $n ->
        [one] O spoofing quebra a especificação de temporização antes de { $names } o detetar.
        [many] O spoofing quebra a especificação de temporização antes de { $names } o detetar.
       *[other] O spoofing quebra a especificação de temporização antes de { $names } o detetar.
    }

js-meankind-spoof-offset = desvio { $offset } ns

js-meankind-spoofdetect-big-by = Sim: o spoofing é detetado, por { $by }.

js-meankind-spoofdetect-big-no = Não: o monitor fundido não deteta o spoofing.

js-meankind-spoofdetect-big-yes = Sim: o spoofing é detetado.

js-meankind-spoofdetect-line =
    { $n ->
        [one] { $on } de { $n } camada de deteção dá alarme.
        [many] { $on } de { $n } de camadas de deteção dão alarme.
       *[other] { $on } de { $n } camadas de deteção dão alarme.
    }

js-meankind-spoofdetect-line-score =
    { $n ->
        [one] { $on } de { $n } camada de deteção dá alarme; a pontuação fundida é { $score }.
        [many] { $on } de { $n } de camadas de deteção dão alarme; a pontuação fundida é { $score }.
       *[other] { $on } de { $n } camadas de deteção dão alarme; a pontuação fundida é { $score }.
    }

js-meankind-ssv-formation = Com { $km } km de separação, o filtro conhece a posição relativa com { $filter } m RMS, contra { $absolute } m obtidos pela diferença das duas posições absolutas.

js-meankind-ssv-navigation = O filtro de bordo mantém a posição com { $inside } m RMS dentro das órbitas GNSS e { $above } m acima delas.

js-meankind-ssv-shell = Na camada esférica, todas as constelações em conjunto dão pelo menos um sinal em { $one } % do tempo e pelo menos quatro em { $four } % (L1).

js-meankind-ssv-tail = MODELLED: um varrimento geométrico e de orçamento de ligação, não uma medição de qualquer sinal no espaço.

js-meankind-ssv-trajectory = De { $from } a { $to } km de altitude, há pelo menos um sinal à vista em { $one } % das épocas e pelo menos quatro em { $four } % (L1, todas as constelações).

js-meankind-station-big = Sobre a região polar sul, as correções de uma estação de referência lunar reduzem o erro de { $percentile } de { $from } m para { $to } m (modelado).

js-meankind-station-line = Dentro do limiar de exatidão em { $share } % das épocas; não é uma afirmação sobre nenhum sistema real.

js-meankind-sweep-big =
    { $n ->
        [one] Ao longo de { $n } valor de { $param }, { $parts }.
        [many] Ao longo de { $n } de valores de { $param }, { $parts }.
       *[other] Ao longo de { $n } valores de { $param }, { $parts }.
    }

js-meankind-sweep-line = { $param } varia de { $from } a { $to }.

js-meankind-sweep-line-log = { $param } varia de { $from } a { $to } numa escala logarítmica.

js-meankind-sweep-part-flat = { $metric } de { $key } mantém-se em { $value }

js-meankind-sweep-part-goes = { $metric } de { $key } passa de { $first } para { $last }

js-meankind-sweep-result-word = resultado

js-meankind-sweepnd-big =
    { $n ->
        [one] Ao longo de { $n } combinação de { $keys }, { $metric } varia entre { $min } e { $max }.
        [many] Ao longo de { $n } de combinações de { $keys }, { $metric } varia entre { $min } e { $max }.
       *[other] Ao longo de { $n } combinações de { $keys }, { $metric } varia entre { $min } e { $max }.
    }

js-meankind-sweepnd-line = Uma grelha de { $shape } execuções do motor.

js-meankind-telecom-fail =
    { $n ->
        [one] O relógio falha { $fail } de { $n } verificação do erro de tempo de telecomunicações.
        [many] O relógio falha { $fail } de { $n } de verificações do erro de tempo de telecomunicações.
       *[other] O relógio falha { $fail } de { $n } verificações do erro de tempo de telecomunicações.
    }

js-meankind-telecom-line = Verificações de MTIE (erro máximo de intervalo de tempo), TDEV (desvio de tempo) e do envelope de holdover face às máscaras da ITU-T indicadas em cada linha.

js-meankind-telecom-line-margin = Verificações de MTIE (erro máximo de intervalo de tempo), TDEV (desvio de tempo) e do envelope de holdover face às máscaras da ITU-T indicadas em cada linha. A menor margem face ao envelope de holdover é de { $margin } ns.

js-meankind-telecom-pass =
    { $n ->
        [one] O relógio passa todas as { $n } verificação do erro de tempo de telecomunicações.
        [many] O relógio passa todas as { $n } de verificações do erro de tempo de telecomunicações.
       *[other] O relógio passa todas as { $n } verificações do erro de tempo de telecomunicações.
    }

js-meankind-the-best = o melhor

js-meankind-the-body = o corpo

js-meankind-the-first = o primeiro

js-meankind-the-name = o { $name }

js-meankind-the-second = o segundo

js-meankind-the-widest-signal = o sinal mais largo

js-meankind-timebudget-big = O erro do { $clock } e o erro do referencial cruzam-se a um tempo de média de { $tau }.

js-meankind-timebudget-line = Neste cruzamento, o erro de tempo é de { $x } s.

js-meankind-timeoffset-big = Um relógio na Lua adianta-se { $rate } µs por dia em relação a um na Terra.

js-meankind-timeoffset-line = A banda publicada vai de { $low } a { $high } µs por dia.

js-meankind-timetransfer-big = Com { $q }, os dois locais ficam a menos de { $qps } ps (raiz do valor quadrático médio); com { $c }, a menos de { $cps } ps.

js-meankind-timetransfer-line = Dentro da especificação de medição de distância em { $q } % do tempo, contra { $c } %.

js-meankind-timetransfer-line-mm = Dentro da especificação de medição de distância de { $mm } mm em { $q } % do tempo, contra { $c } %.

js-meankind-tracking-big = Um spoofer pode capturar o recetor a até { $km } km de distância.

js-meankind-tracking-line = Sob a dinâmica de malha do próprio recetor, o bloqueio perde-se com { $db } dB de interferente acima do sinal.

js-meankind-trade-big = Os sensores quânticos são { $timing } vezes melhores na temporização e { $inertial } vezes melhores na navegação inercial do que a linha de base clássica.

js-meankind-trade-line = Sem satélites, o conjunto quântico aguenta-se durante { $dur }.

js-meankind-ttbudget-big = O desvio bidirecional é de { $offset } ns, com uma incerteza combinada de { $uncertainty } ns.

js-meankind-ttbudget-line = Sagnac { $sagnac } ns; ionosfera { $iono } ns.

js-meankind-ukf-big-no = Não: o filtro não é autoconsistente.

js-meankind-ukf-big-yes = Sim: o filtro é autoconsistente.

js-meankind-ukf-line-in = A sua inovação normalizada ao quadrado tem média { $mean }, dentro da banda de 95 % de { $low } a { $high }. Isto verifica a consistência, não a exatidão.

js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] A sua inovação normalizada ao quadrado tem média { $mean }, dentro da banda de 95 % de { $low } a { $high }, ao longo de { $n } semente. Isto verifica a consistência, não a exatidão.
        [many] A sua inovação normalizada ao quadrado tem média { $mean }, dentro da banda de 95 % de { $low } a { $high }, ao longo de { $n } de sementes. Isto verifica a consistência, não a exatidão.
       *[other] A sua inovação normalizada ao quadrado tem média { $mean }, dentro da banda de 95 % de { $low } a { $high }, ao longo de { $n } sementes. Isto verifica a consistência, não a exatidão.
    }

js-meankind-ukf-line-out = A sua inovação normalizada ao quadrado tem média { $mean }, fora da banda de 95 % de { $low } a { $high }. Isto verifica a consistência, não a exatidão.

js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] A sua inovação normalizada ao quadrado tem média { $mean }, fora da banda de 95 % de { $low } a { $high }, ao longo de { $n } semente. Isto verifica a consistência, não a exatidão.
        [many] A sua inovação normalizada ao quadrado tem média { $mean }, fora da banda de 95 % de { $low } a { $high }, ao longo de { $n } de sementes. Isto verifica a consistência, não a exatidão.
       *[other] A sua inovação normalizada ao quadrado tem média { $mean }, fora da banda de 95 % de { $low } a { $high }, ao longo de { $n } sementes. Isto verifica a consistência, não a exatidão.
    }

js-meankind-user-word = utilizador

js-meankind-vlbi-big = Numa linha de base de { $km } km, o sinal da baliza chega com { $ms } ms de diferença às duas estações.

js-meankind-vlbi-line = A correção de campo próximo é de { $us } µs.

js-meankind-vlbifim-big = Cada coordenada de estação é conhecida com { $m } m a partir deste calendário de observação.

js-meankind-vlbifim-line = A estimativa simples de partes iguais indicaria { $m } m.

js-meankind-weather-big = A atmosfera superior aquece até { $k } K.

js-meankind-weather-big-ref = A atmosfera superior aquece até { $k } K, contra { $ref } K da referência.

js-meankind-weather-line = O índice de atividade geomagnética ap é { $ap }.

js-meankind-whole-run = ao longo de toda a execução

js-mthread-bcol-label = Rótulo

js-mthread-bcol-share = Tamanho face ao maior termo de posição

js-mthread-bcol-sigma = 1 sigma

js-mthread-bcol-source = Contribuição

js-mthread-budget-caption = { $phase }: 1 sigma à entrada { $entry }, no pico { $peak }, à saída { $exit } (posição); cada contribuição abaixo, da maior para a menor.

js-mthread-chart-title = { $metric } em função do tempo decorrido da missão, uma banda por fase

js-mthread-col-kind = Tipo

js-mthread-col-label = Rótulo

js-mthread-col-limit = Maior contribuição

js-mthread-col-margin = Face ao limite

js-mthread-col-peak-pos = Posição máxima

js-mthread-col-peak-time = Desvio máximo do relógio

js-mthread-col-peak-vel = Velocidade máxima

js-mthread-col-phase = Fase

js-mthread-col-window = Tempo de missão

js-mthread-example-not-loaded = o resultado registado não foi carregado

js-mthread-file-failed = Não foi possível ler { $name }: { $reason }.

js-mthread-kv-elapsed = Tempo decorrido da missão

js-mthread-kv-engine = Motor

js-mthread-kv-epoch = Época (UTC)

js-mthread-kv-limits = Fases com um limite indicado

js-mthread-kv-limits-value = { $n } ({ $met } atingidos, { $missed } não atingidos)

js-mthread-kv-phases = Fases

js-mthread-kv-seed = Semente

js-mthread-kv-title = Fio

js-mthread-layout-phases = Largura igual por fase

js-mthread-layout-time = Tempo real da missão

js-mthread-limit-title = { $phase }: o limite indicado, { $limit }

js-mthread-log-scale = escala logarítmica

js-mthread-margin-met = { $m }× o limite, atingido

js-mthread-margin-missed = { $m }× o limite, não atingido

js-mthread-metric-pos = Posição, 1 sigma

js-mthread-metric-time = Desvio do relógio, 1 sigma

js-mthread-metric-vel = Velocidade, 1 sigma

js-mthread-na = n/d

js-mthread-no-events = Esta fase não regista eventos.

js-mthread-no-phases = o resultado não contém fases

js-mthread-no-requirement = nenhum limite indicado

js-mthread-no-series = O resultado não contém amostras desta grandeza.

js-mthread-no-weak = O resultado não indica nenhum elo mais fraco.

js-mthread-not-json = o resultado não é JSON ({ $reason })

js-mthread-not-thread = isto não é um resultado de fio de missão (esquema { $schema } esperado)

js-mthread-note-phases = Cada fase é desenhada com a mesma largura, para que uma fase curta seja tão visível como uma longa; o instante em que cada uma começa está por baixo da banda. Mude para o tempo real da missão para ver as proporções reais. As linhas tracejadas são os limites indicados no documento; uma quebra na linha é uma transferência.

js-mthread-note-time = Tempo real da missão: uma fase de poucos minutos pode ser demasiado estreita para se ver. Mude para larguras iguais para a ler. As linhas tracejadas são os limites indicados no documento; uma quebra na linha é uma transferência.

js-mthread-open-failed = Não foi possível abrir o exemplo: { $reason }.

js-mthread-opened = { $name } lido nesta página; nada foi enviado para parte alguma.

js-mthread-opening = A abrir o exemplo da classe Artemis…

js-mthread-prov = Todos os rótulos desta página são do próprio motor; a página copia cada número do resultado e apenas o dimensiona.

js-mthread-recorded = O resultado registado do motor (versão { $version }): uma cadeia ilustrativa construída a partir de descrições públicas de missões; os números são modelados e não representam nada de real.

js-mthread-sets-peak = define o pico

js-mthread-too-large = Esse ficheiro é maior do que { $mb } MB; não é lido.

js-mthread-weak-line = O elo mais fraco é a fase <b>{ $phase }</b>: { $margin }× o seu limite indicado, definido por { $source }. A margem é o menor quociente entre um limite indicado e o pico da fase; acima de 1 satisfaz o requisito.

js-mthread-weakest-flag = elo mais fraco

js-mthread-weakest-mark = elo mais fraco

js-obs-cell-extent = { $south }° a { $north }° N, { $west }° a { $east }° E

js-obs-cell-read = { $state }: { $cell }. Amostradas { $sampled }, afetadas { $affected }.

js-obs-cell-title = { $state }; amostradas { $sampled }, afetadas { $affected }

js-obs-cell-title-reason = { $state } ({ $reason }); amostradas { $sampled }, afetadas { $affected }

js-obs-clear-note = { $notClear } Uma célula sem entrada foi vista por menos de 5 aeronaves distintas e é retida; não é desenhada. A cor nunca é a única pista: «não observada» tem tracejado e a tabela descreve todos os estados.

js-obs-col-affected = Aeronaves afetadas

js-obs-col-bbox = Caixa delimitadora (S, O, N, E)

js-obs-col-bytes = Bytes

js-obs-col-cause = Causa

js-obs-col-cell = Célula (latitude, longitude)

js-obs-col-cells = Células

js-obs-col-check = Verificação

js-obs-col-file = Ficheiro

js-obs-col-incident = Incidente

js-obs-col-sampled = Aeronaves amostradas

js-obs-col-sha = SHA-256 (manifesto)

js-obs-col-share = Proporção afetada

js-obs-col-state = Estado

js-obs-col-why = Porquê não observada

js-obs-day-alt = { $degraded } células degradadas, { $notDegraded } não degradadas, { $notObserved } não observadas, em { $date }.

js-obs-day-heading = Dia { $date } (UTC)

js-obs-ds-attribution = Atribuição

js-obs-ds-coverage = Cobertura

js-obs-ds-dataset = Conjunto de dados

js-obs-ds-licence = Licença

js-obs-ds-licence-address = Endereço da licença

js-obs-ds-product = Produto

js-obs-ds-written-by = Escrito pelo Kshana

js-obs-err-cause = { $name } indica uma causa diferente de "não atribuída"; esta página não mostra nenhuma

js-obs-err-feature-polygon = { $name }: o elemento { $n } não é um polígono de célula

js-obs-err-feature-state = { $name }: o elemento { $n } tem o estado "{ $state }", que não é um de { $states }

js-obs-err-incident-object = { $name }: o incidente { $n } não é um objeto

js-obs-err-no-date = { $name } não indica nenhuma data

js-obs-err-no-features = { $name } não tem elementos

js-obs-err-no-incidents = { $name } não tem lista de incidentes

js-obs-err-not-day = { $name } não é um ficheiro { $schema }

js-obs-err-not-incident = { $name } não é um ficheiro { $schema }

js-obs-err-not-json = { $what } não é JSON ({ $reason })

js-obs-err-not-manifest = { $name } não é um ficheiro { $schema }

js-obs-err-not-object = { $what } não é um objeto JSON

js-obs-err-not-text = { $what } não é texto ou é maior do que { $mib } MiB

js-obs-err-states = { $name } indica estados diferentes dos três que esta página mostra

js-obs-file-matches = coincide

js-obs-file-mismatch = não coincide

js-obs-file-no-hash = nenhum hash indicado

js-obs-file-not-opened = não aberto

js-obs-files-note = Método { $method }. O SHA-256 de cada ficheiro é calculado aqui a partir do ficheiro que abriu e comparado com o manifesto; um ficheiro que não abriu não é verificado.

js-obs-incident = incidente

js-obs-incident-note = As células degradadas contíguas (diagonais incluídas) formam um incidente. A causa de cada incidente é: não atribuída. Isto não é uma confirmação nem um NOTAM.

js-obs-kv-cells = Células publicadas

js-obs-kv-day-wide = Efeito a todo o dia

js-obs-kv-degraded = Degradadas

js-obs-kv-not-degraded = Não degradadas

js-obs-kv-not-observed = Não observadas (publicadas)

js-obs-kv-scope = Âmbito

js-obs-map-aria = { $summary } A tabela abaixo lista todas as células.

js-obs-means-degraded = Uma proporção elevada das aeronaves amostradas na célula comunicou baixa exatidão de navegação nesse dia, claramente acima do fundo desse dia.

js-obs-means-not-degraded = Foram amostradas aeronaves suficientes e a proporção não atingiu a regra.

js-obs-means-not-observed = Os dados não permitiram uma classificação. Isto não significa "livre".

js-obs-na = n/d

js-obs-no = não

js-obs-no-cells = Nenhuma célula neste ficheiro

js-obs-no-day-file = Os ficheiros de { $date } não têm ficheiro do dia (.geojson), pelo que não há nada para mostrar.

js-obs-no-degraded = Nenhuma célula degradada neste dia.

js-obs-no-file-read = Não foi possível ler nenhum ficheiro.

js-obs-no-incident-file = Não foi aberto nenhum ficheiro de incidentes para este dia.

js-obs-no-manifest = Não foi aberto nenhum manifesto para este dia, pelo que os ficheiros não podem ser verificados face aos seus hashes.

js-obs-no-notice = Este ficheiro não traz aviso. A declaração consultiva no topo desta página aplica-se, ainda assim.

js-obs-no-reason = nenhum motivo indicado

js-obs-not-clear = Não observada não significa livre.

js-obs-not-readable = { $name }: não é um ficheiro que esta página leia (.geojson, .incidents.json, .manifest.json ou .png).

js-obs-not-stated = não indicado

js-obs-note-day-wide = Este foi um dia de efeito a todo o dia: o fundo do dia era, ele próprio, elevado, pelo que nenhuma célula pôde ser classificada nesse dia. Isto não é uma afirmação de que o céu estivesse limpo.

js-obs-note-summary-mismatch = O resumo indicado no ficheiro não coincide com as células que lista; os números são mostrados tal como estão escritos.

js-obs-nothing-yet = Ainda nada para mostrar: abra também o ficheiro .geojson do dia.

js-obs-notice = Aviso incluído no ficheiro: { $notice }

js-obs-opened-day-file = Aberto { $days } dia a partir de { $files } ficheiro. Lido aqui; nada foi carregado.

js-obs-opened-day-files = Aberto { $days } dia a partir de { $files } ficheiros. Lido aqui; nada foi carregado.

js-obs-opened-days-file = Abertos { $days } dias a partir de { $files } ficheiro. Lido aqui; nada foi carregado.

js-obs-opened-days-files = Abertos { $days } dias a partir de { $files } ficheiros. Lido aqui; nada foi carregado.

js-obs-read-failed = { $name }: não foi possível ler ({ $reason }).

js-obs-reason-day-wide = o fundo do dia era, ele próprio, elevado, pelo que nenhuma célula pôde ser classificada nesse dia

js-obs-reason-insufficient = foram amostradas aeronaves a menos para fazer uma classificação

js-obs-reason-no-background = não havia fundo do dia com que comparar a célula

js-obs-release = Publicado não antes de { $when }: os produtos são publicados pelo menos { $hours } h após o fim do dia, em células de { $deg } graus. Isto não é uma vista em direto.

js-obs-release-default = o fim do dia mais o atraso

js-obs-show-all = Mostrar todas as { $n } células

js-obs-state-degraded = Degradada

js-obs-state-not-degraded = Não degradada

js-obs-state-not-observed = Não observada

js-obs-the-day-file = o ficheiro do dia

js-obs-the-incident-file = o ficheiro de incidentes

js-obs-the-manifest = o manifesto

js-obs-too-large = { $name }: maior do que { $mib } MiB; abra um ficheiro mais pequeno.

js-obs-unstated-number = um número não indicado de

js-obs-withheld = retida

js-obs-yes-no-call = sim: nenhuma célula pôde ser classificada

js-opt-avail-label = Disponibilidade, limite máximo e disponibilidade em céu limpo por local

js-opt-avail-note = Por local: a disponibilidade da ligação face aos desvanecimentos por nuvens e turbulência, o limite máximo que nenhuma margem adicional consegue elevar (nuvens e apontamento) e a disponibilidade sem quaisquer nuvens.

js-opt-avail-title = Disponibilidade face ao limite máximo

js-opt-bar-available = { $name }: disponível

js-opt-bar-ceiling = { $name }: limite máximo

js-opt-bar-clear-sky = { $name }: céu limpo

js-opt-blurb-network = Um local do norte mais nublado, um central intermédio e um do sul mais limpo observam um terminal ótico LEO a 30 graus: com que frequência a ligação está ativa e o que acrescentam locais adicionais?

js-opt-blurb-techniques = Uma ligação ascendente a 25 graus com nuvens e turbulência: o que acrescentam outro comprimento de onda, uma abertura maior, ótica adaptativa ou mais margem?

js-opt-cloud-episode = episódio de nuvens

js-opt-correlated = correlacionado

js-opt-default-bars = barras

js-opt-default-chart = gráfico

js-opt-direction-wave = { $direction }, comprimento de onda { $wave }

js-opt-diversity-label = Disponibilidade da rede face ao número de locais

js-opt-diversity-note = Disponibilidade dos melhores 1, 2 e 3 locais, com condições meteorológicas independentes e com condições meteorológicas correlacionadas ao longo de { $km } km.

js-opt-diversity-title = Diversidade de locais

js-opt-fact-capture-loss = Perda de captura geométrica

js-opt-fact-direction = Direção

js-opt-fact-elevation = Elevação

js-opt-fact-footprint = Pegada do feixe

js-opt-fact-margin = Margem sem atmosfera

js-opt-fact-received = Potência recebida, sem atmosfera

js-opt-fact-sensitivity = Sensibilidade do recetor

js-opt-fact-wavelength = Comprimento de onda

js-opt-gain-points =
    { $n ->
        [one] +{ $n } ponto
        [many] +{ $n } de pontos
       *[other] +{ $n } pontos
    }

js-opt-hours = horas

js-opt-independent = independente

js-opt-link-down = ligação inativa

js-opt-margin-label = Margem adicional necessária para cada objetivo de disponibilidade

js-opt-margin-line-title = { $name }: margem da ligação, dB

js-opt-margin-note = Margem de ligação adicional, em dB, por cima da ligação atual, para cada objetivo de disponibilidade; negativa significa que a ligação já tem mais do que precisa. Um objetivo acima do limite máximo de um local não tem margem que o alcance (o motor omite-o).

js-opt-margin-title = Margem de que cada objetivo de disponibilidade precisa

js-opt-model-output = Saída do modelo

js-opt-na = n/d

js-opt-no-data = Sem dados neste resultado.

js-opt-no-series = Sem série temporal neste resultado.

js-opt-no-source = nenhuma origem indicada

js-opt-not-result = isto não é um resultado de atmosfera ótica com locais

js-opt-open-failed = Não foi possível abrir { $title }: { $reason }.

js-opt-opening = A abrir { $title }…

js-opt-outage-label = Probabilidade de uma interrupção durar mais do que uma dada duração

js-opt-outage-note = Probabilidade de uma interrupção durar mais do que uma dada duração, por local (eixo de tempo logarítmico).

js-opt-outage-title = Quanto duram as interrupções

js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-opt-prov = { $label } Locais: { $sites }.

js-opt-realised-up = { $value } ativa

js-opt-recorded = { $title }: o resultado registado do motor (versão { $version }). Saída do modelo, não uma medição.

js-opt-result-not-json = o resultado não é JSON ({ $reason })

js-opt-result-not-loaded = o resultado registado não foi carregado

js-opt-series-label = Margem da ligação ao longo do tempo

js-opt-series-note = Uma realização com semente do modelo de local indicado (semente { $seed }, { $hours } h com passos de { $step } s): episódios de nuvens, uma coluna de água líquida para cada um, uma amostra de cintilação por passo. A margem é o orçamento de desvanecimento menos os desvanecimentos por nuvens e por cintilação; a ligação está inativa abaixo de 0 dB. É uma única extração, não o clima: a sua disponibilidade difere da indicada pelo erro de amostragem da extração. A margem é limitada a −40 dB para o desenho.

js-opt-series-title = Margem da ligação ao longo do tempo

js-opt-stated = indicada { $value }

js-opt-stripe-cloud = nuvens

js-opt-stripe-down = inativa

js-opt-stripe-title = { $what }, hora { $from } a { $to }

js-opt-techniques-label = Ganho de disponibilidade por técnica

js-opt-techniques-note = Ganho de disponibilidade em pontos percentuais sobre a linha de base, para um local.

js-opt-techniques-title = O que cada técnica acrescenta

js-opt-th-availability = Disponibilidade

js-opt-th-ceiling = Limite máximo

js-opt-th-clear-air = Perda em ar limpo

js-opt-th-cloud-prob = Probabilidade de nuvens (entrada)

js-opt-th-fade-budget = Orçamento de desvanecimento

js-opt-th-latlon = Latitude, longitude

js-opt-th-mean-outage = Interrupção média

js-opt-th-outages-year = Interrupções por ano

js-opt-th-scint = Índice de cintilação

js-opt-th-site = Local

js-opt-timing-label = Disponibilidade de temporização por local e relógio

js-opt-timing-note = Fração de todo o tempo em que o erro de temporização se mantém dentro do limiar, por local e classe de relógio: o holdover do relógio face às durações das interrupções.

js-opt-timing-title = Temporização mantida durante as interrupções

js-opt-title-network = Três locais em terra, diversidade de locais

js-opt-title-techniques = Uma ligação ascendente, técnicas de melhoria

js-opt-x-best-n = melhores n locais

js-opt-x-outage-duration = duração da interrupção, h (log)

js-opt-x-target = objetivo de disponibilidade, %

js-opt-y-availability = disponibilidade, %

js-opt-y-extra-margin = margem adicional, dB

js-opt-y-p-longer = P(mais longa)

js-replay-band-calibrating = a calibrar

js-replay-band-degraded = degradado

js-replay-band-nominal = nominal

js-replay-band-run-ended = { $band } · execução terminada

js-replay-band-untrusted = não fiável

js-replay-clock = T+{ $t } de { $max }

js-replay-coast-hidden = costa oculta: as posições inventadas deste registo caem em terra

js-replay-coast-note = Costa: { $source }, apenas ilustração.

js-replay-coast-note-hidden = { $reason }.

js-replay-coast-window = Natural Earth 1:10 milhões, janela { $window }

js-replay-coast-world = Natural Earth 1:110 milhões (o contorno do mundo do Studio), grosseiro

js-replay-demo-trust-log = { $title } (registo de confiança)

js-replay-dir-east = este

js-replay-dir-north = norte

js-replay-dir-south = sul

js-replay-dir-west = oeste

js-replay-dirs-and = { $list } e { $last }

js-replay-drawing-animation = A desenhar a animação…

js-replay-drawing-frames = A desenhar os fotogramas…

js-replay-every-direction = todas as direções

js-replay-file-error = { $name }: { $error }

js-replay-kinds-convergence-horizontal = Convergência: erro horizontal mediano
