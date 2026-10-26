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
