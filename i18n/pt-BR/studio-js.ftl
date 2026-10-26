# studio-js.ftl (pt-BR): translations

js-adv-all-domains = Todas as áreas

js-adv-animation-frame-title = Animação desta execução, escrita pelo motor

js-adv-animation-html-player = Player HTML

js-adv-animation-html-player-title = O player de arquivo único, como o motor o escreveu

js-adv-animation-load-failed = Não foi possível carregar a animação registrada ({ $reason }).

js-adv-animation-loading = Carregando a animação registrada…

js-adv-animation-none = Não há animação registrada para este cenário.

js-adv-animation-note = O motor escreve uma animação de qualquer execução que tenha um eixo de tempo: um SVG que se reproduz sozinho e um player HTML de arquivo único, com seus próprios controles de reprodução e de navegação. A versão para navegador não inclui esse gerador; por isso este é o arquivo que o motor nativo de linha de comando escreveu para o cenário incluído.

js-adv-animation-svg = SVG animado

js-adv-animation-svg-title = O SVG que se reproduz sozinho, como o motor o escreveu

js-adv-axis-averaging-time = tempo de média τ (s)

js-adv-axis-observation-interval = intervalo de observação τ (s)

js-adv-axis-value = valor

js-adv-badge-live-engine = Motor ao vivo

js-adv-badge-recorded = Registrada

js-adv-badge-recorded-engine = Execução registrada, motor v{ $version }

js-adv-badge-recorded-native = Execução registrada, motor nativo v{ $version }

js-adv-band-carrier = Portadora

js-adv-band-carrier-not-set = não definida neste cenário

js-adv-band-chip-rate = Taxa de chip

js-adv-band-jammer-bandwidth = Largura de banda do jammer

js-adv-band-jammer-label = jammer { $bandwidth } MHz

js-adv-band-jammer-power = Potência do jammer

js-adv-band-jammer-type = Tipo de jammer

js-adv-band-no-carrier-note = O motor calcula a relação jammer-sinal a partir do orçamento de enlace. Este cenário não indica uma frequência de portadora; por isso nenhum espectro é desenhado.

js-adv-band-satellites = Satélites

js-adv-band-signal-main-lobe = lóbulo principal do sinal

js-adv-band-svg-label = Bandas do sinal e do jammer em torno da portadora

js-adv-band-tracking-threshold = Limiar de rastreamento

js-adv-browser-cannot-run = A versão para navegador não consegue executar este cenário.

js-adv-busy-running = Executando

js-adv-busy-sweeping = Varrendo

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } valor repassado
        [many] { $n } de valores repassados
       *[other] { $n } valores repassados
    }

js-adv-chain-note = Um único sistema acompanhado por todas as etapas do motor. A tabela abaixo lista cada número que uma etapa calculou e que a etapa seguinte usou.

js-adv-chain-stage = Etapa { $n }

js-adv-chain-sub = a saída de cada etapa alimenta a seguinte

js-adv-chain-title = A cadeia

js-adv-chart-allan-title = Desvio de Allan

js-adv-chart-budget-label = orçamento

js-adv-chart-default-title = Gráfico do Kshana

js-adv-chart-effective-cn0 = C/N0 efetivo por satélite

js-adv-chart-ground-track = Traço no solo

js-adv-chart-holdover-budget = Holdover em relação a um orçamento de temporização

js-adv-chart-mtie-title = MTIE (erro máximo de intervalo de tempo)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · cenário { $hash } · kshana.dev

js-adv-chart-stability-title = Estabilidade do relógio (desvio de Allan sobreposto)

js-adv-chart-tdev-title = TDEV (desvio de tempo)

js-adv-chart-undrawable = Não foi possível desenhar este gráfico.

js-adv-chip-live = Motor ao vivo · v{ $version }

js-adv-chip-live-title = O motor do Kshana está sendo executado neste navegador como WebAssembly

js-adv-chip-recorded = Execuções registradas · v{ $version }

js-adv-chip-recorded-title = O WebAssembly não pôde ser iniciado aqui. Exibindo execuções registradas reais dos cenários incluídos.

js-adv-chip-recorded-title-reason = O WebAssembly não pôde ser iniciado aqui ({ $reason }). Exibindo execuções registradas reais dos cenários incluídos.

js-adv-chip-unavailable = Motor indisponível

js-adv-cmd-all-fields = Mostrar todos os campos numéricos

js-adv-cmd-compare = Comparar as execuções fixadas

js-adv-cmd-embed-code = Copiar o código de incorporação

js-adv-cmd-exports = Baixar os resultados (exportações)

js-adv-cmd-history = Abrir o histórico de execuções

js-adv-cmd-parameters = Abrir os parâmetros

js-adv-cmd-pin = Fixar esta execução para comparar

js-adv-cmd-report = Baixar o relatório

js-adv-cmd-reset = Redefinir o texto do cenário

js-adv-cmd-run = Executar o cenário

js-adv-cmd-share-link = Copiar o link de compartilhamento

js-adv-cmd-start = Ir para a tela inicial

js-adv-cmd-theme = Alternar entre o tema claro e o escuro

js-adv-cmd-tour = Iniciar o tour guiado

js-adv-command-line-only = somente linha de comando

js-adv-compare-deltas-note = As diferenças são em relação à execução A. O verde marca o melhor valor de cada número.

js-adv-compare-no-common = Estas execuções não têm figuras de mérito comparáveis. Fixe execuções da mesma família de cenários para ver números e diferenças.

js-adv-compare-one-pinned = Uma execução está fixada. Altere um parâmetro, execute de novo e fixe essa execução para comparar as duas.

js-adv-compare-overlay = Sobreposição das execuções fixadas

js-adv-compare-overlay-diff = Sobreposição com a diferença B − A

js-adv-compare-overlay-note = As linhas contínuas são a execução A e as tracejadas, a execução B, nos mesmos eixos.

js-adv-compare-overlay-title = { $title }: execução { $a } (A) contra execução { $b } (B)

js-adv-compare-pin-two = Fixe pelo menos duas execuções para compará-las lado a lado. Fixe uma execução, altere um parâmetro ou escolha outro cenário da mesma família, execute-o e fixe de novo.

js-adv-compare-run-heading = { $letter } · execução { $run }

js-adv-copy-blocked = A cópia está bloqueada aqui.

js-adv-copy-command = Copiar: { $command }

js-adv-could-not-load = Não foi possível carregar { $file }.

js-adv-coverage-dots = Os pontos são { $shown } de { $total } satélites, levados ao longo de seus traços no solo; reproduza a animação para movê-los.

js-adv-coverage-field-label = Campo a mapear

js-adv-coverage-map = Mapa de cobertura

js-adv-coverage-map-over = sobre { $body }

js-adv-coverage-map-select = Mapear

js-adv-coverage-note = Cada célula é um ponto da grade em { $body }, avaliado em todas as épocas da execução.

js-adv-coverage-title = { $field } sobre { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = A tela inicial: todas as áreas

js-adv-decrease-field = Diminuir { $field }

js-adv-domain = Área

js-adv-domain-line-campaigns = Missões encadeadas, varreduras e execuções de Monte Carlo em um único relógio.

js-adv-domain-line-constellations = Projete uma constelação e mapeie sua cobertura e o PDOP (diluição de precisão de posição).

js-adv-domain-line-deepspace = Navegação e tempo na Lua, no espaço cislunar e em Marte.

js-adv-domain-line-integrity = Fixes de posição e se é possível confiar neles: RAIM (monitoramento autônomo de integridade pelo receptor) e sua forma avançada, o ARAIM.

js-adv-domain-line-interference = Jammers contra receptores GNSS: o que se perde e quando.

js-adv-domain-line-leo = Sinais de navegação em órbita terrestre baixa, passagens, mensagens e fixes.

js-adv-domain-line-leo-missions = Estudos e serviços construídos sobre uma camada em órbita terrestre baixa.

js-adv-domain-line-navigation = Navegação inercial, por terreno, por gravidade e outras, sem GNSS.

js-adv-domain-line-optional = Um grupo opcional de cenários.

js-adv-domain-line-orbits = Propagação de órbitas, efemérides e geometria GNSS.

js-adv-domain-line-solar = Todos os planetas e luas em uma única época, com os tempos de luz.

js-adv-domain-line-spaceops = Passagens, janelas de lançamento, reentrada e orçamentos de enlace e de atitude.

js-adv-domain-line-spectrum = Cascatas (waterfalls) da banda de rádio: jammers, sinais e o que o receptor rastreia.

js-adv-domain-line-spoofing = Sinais falsos e meaconing, e os monitores que os detectam.

js-adv-domain-line-studies = Sensores quânticos, estudos de compromisso e formatos de interoperabilidade.

js-adv-domain-line-timing = Relógios sem GNSS: holdover, estabilidade, máscaras de telecomunicações, transferência de tempo.

js-adv-domain-pick-hint = Escolha um: ele abre e é executado no seu navegador. Em seguida, você pode alterar seus parâmetros.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } cenário
        [many] { $label }: { $n } de cenários
       *[other] { $label }: { $n } cenários
    }

js-adv-domain-select-label = Mostrar uma área

js-adv-download = Baixar

js-adv-edited-cli-only-status = Editado: este cenário é executado somente no motor de linha de comando.

js-adv-edited-needs-engine = Editado: requer o motor { $need }.

js-adv-edited-needs-live-engine = Cenários editados requerem o motor ao vivo.

js-adv-embed-copied = Código de incorporação copiado.

js-adv-engine-chart = Gráfico do motor

js-adv-engine-chart-alt = Gráfico do motor para esta execução

js-adv-engine-file-http-error = o arquivo do motor retornou HTTP { $status }

js-adv-engine-load-failed-no-recordings = não foi possível carregar o motor ({ $reason }) e nenhuma execução registrada foi encontrada

js-adv-engine-loading = Carregando o motor…

js-adv-engine-loading-title = O motor ao vivo ainda está sendo baixado. Este resultado registrado é substituído por uma execução ao vivo quando ele estiver pronto.

js-adv-engine-start-failed = Não foi possível iniciar o motor: { $reason }. Sirva esta pasta por HTTP (por exemplo, python3 -m http.server) em vez de abrir o arquivo diretamente.

js-adv-entries-count = { $n } entradas

js-adv-export-card-title = Exportação { $format }

js-adv-export-csv-desc = Os mesmos bytes que a ferramenta de linha de comando escreve como { $file }.

js-adv-export-csv-title = Tabela de reprodutibilidade

js-adv-export-ephemeris-checking = Verificando quais formatos de efemérides esta execução pode exportar…

js-adv-export-ephemeris-waiting = As exportações de efemérides aparecem aqui quando o motor for carregado.

js-adv-export-json-desc = A saída completa do motor para esta execução, com unidades e procedência.

js-adv-export-json-title = Documento completo do resultado

js-adv-export-large-not-recorded = Esta exportação é grande e por isso não foi registrada. Ela requer o motor ao vivo.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) para GMAT, Orekit ou STK

js-adv-export-omm-desc = Catálogo CCSDS OMM (Orbit Mean-elements Message)

js-adv-export-report-desc = Um arquivo offline: resumo, números com seus níveis, todos os gráficos e o texto exato do cenário, carimbado com a versão do motor e o hash do cenário.

js-adv-export-report-title = Relatório reproduzível

js-adv-export-sp3-desc = Efemérides precisas SP3-c desta constelação

js-adv-export-toml-desc = A entrada exata desta execução. Execute-a de novo em qualquer lugar com a ferramenta de linha de comando ou com os pacotes Python e npm.

js-adv-export-toml-title = Arquivo do cenário

js-adv-export-too-large = { $desc }. Grande demais para registrar: requer o motor ao vivo.

js-adv-field-find-match =
    { $n ->
        [one] { $n } controle guiado e { $fields } de { $total } campos correspondem a “{ $query }”.
        [many] { $n } de controles guiados e { $fields } de { $total } campos correspondem a “{ $query }”.
       *[other] { $n } controles guiados e { $fields } de { $total } campos correspondem a “{ $query }”.
    }

js-adv-field-find-none = Nenhum campo deste cenário corresponde a “{ $query }”. Busque em todos os cenários com a busca da biblioteca.

js-adv-field-hit-in = em { $title }

js-adv-field-not-single-number = Esse campo não é um número único neste cenário: edite-o no código-fonte.

js-adv-field-opened = Aberto em { $field }. Altere-o e o cenário é executado de novo.

js-adv-fields-matching = Campos que correspondem a “{ $query }”

js-adv-fields-more = Mais { $n }: refine as palavras ou busque na tela inicial.

js-adv-fields-top-level = nível superior

js-adv-filter-check-tuning = verificar o ajuste

js-adv-filter-consistent = consistente

js-adv-from-the-link = do link

js-adv-geo-sub = { $name } · { $shown } de { $total } feições desenhadas · registrado com o motor nativo

js-adv-geo-title = Exportação GeoJSON: { $name }

js-adv-gt-note = Em destaque: satélite visível da estação.

js-adv-gt-note-both = Em destaque: satélite visível da estação. Elevação máxima { $elevation }°. Doppler máximo { $doppler } Hz.

js-adv-gt-note-doppler = Em destaque: satélite visível da estação. Doppler máximo { $doppler } Hz.

js-adv-gt-note-elevation = Em destaque: satélite visível da estação. Elevação máxima { $elevation }°.

js-adv-heatmap-label = Mapa de calor de { $metric }

js-adv-hist-runs-count = { $n } execuções.

js-adv-history-pin = Fixar

js-adv-history-restore = Restaurar

js-adv-history-run-time = execução { $run } · { $time }

js-adv-holdover-engine-figure = Holdover do motor no orçamento do cenário: { $duration }

js-adv-holdover-engine-figure-budget = Holdover do motor no orçamento do cenário ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = erro após a perda do GNSS em t = { $loss } s

js-adv-holdover-error-since-fix = erro desde o último fix

js-adv-holdover-stays-inside = permanece dentro deste orçamento durante todo o registro

js-adv-holdover-until-breached = até o orçamento ser violado

js-adv-honesty-modelled = Física de primeiros princípios com testes, ainda não confrontada com uma referência externa independente. { $text }

js-adv-honesty-partner = Números de responsabilidade de um parceiro. { $text }

js-adv-honesty-validated = Verificado em relação a uma referência externa independente. { $text }

js-adv-increase-field = Aumentar { $field }

js-adv-install-version = Instalar v{ $version }

js-adv-interop-no-file = O motor não escreveu nenhum arquivo deste formato para esta execução.

js-adv-interop-not-applicable = Não se aplica a este cenário: { $reason }.

js-adv-interop-not-bundled = Não incluído aqui (tamanho): o comando acima o escreve.

js-adv-interop-note = O motor escreve a geometria e as amostras de sinal de uma execução em formatos que outras ferramentas abrem: CZML para o Cesium, KML (Keyhole Markup Language) para o Google Earth, GeoJSON para mapas, arquivos de efemérides STK (.e) e gravações SigMF (Signal Metadata Format). A versão para navegador não inclui esses geradores; por isso os arquivos abaixo são os que o motor nativo de linha de comando escreveu para o cenário incluído.

js-adv-js-range-label = Faixa J/S

js-adv-js-range-value = { $low } a { $high } dB

js-adv-json-copied = JSON copiado.

js-adv-kind-default = kind: clock holdover (o padrão)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Verificar

js-adv-kpi-delta-since-run = { $arrow } { $change } desde a execução { $run }

js-adv-kpi-fail = Falhou

js-adv-kpi-first-run = primeira execução

js-adv-kpi-not-in-previous = não estava na sua execução anterior

js-adv-kpi-pass = Passou

js-adv-lib-count-all = { $scenarios } cenários · { $domains } áreas

js-adv-lib-count-filtered = { $n } de { $total } cenários

js-adv-lib-no-match = Nenhum cenário ou campo corresponde. Tente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-adv-loaded-shared = Um cenário compartilhado foi carregado a partir do link.

js-adv-mask-envelope = Envelope do erro de tempo em holdover ({ $source })

js-adv-mask-exceeded-after = excedido após { $duration }

js-adv-mask-limit-label = limite { $limit } ns

js-adv-mask-max-te = máx. |TE|

js-adv-mask-not-exceeded = não excedido

js-adv-matrix-counts = { $validated } de { $total }

js-adv-matrix-line = { $counts } capacidades verificadas em relação a referências externas independentes · { $modelled } calculadas por modelo · { $partner } de responsabilidade de parceiros

js-adv-max-close = Fechar

js-adv-max-close-label = Fechar a tela cheia

js-adv-max-expand = Expandir

js-adv-max-expand-label = Expandir este painel para a tela cheia

js-adv-max-title = Mostrar este painel em tela cheia (Escape o fecha)

js-adv-meta-engine = motor

js-adv-meta-file = arquivo

js-adv-meta-scenario = cenário

js-adv-meta-seed = semente

js-adv-meta-time = tempo

js-adv-mission-timeline = Linha do tempo da missão

js-adv-native-edited-notice = { $why } A execução registrada é a do arquivo incluído; por isso uma cópia editada não pode ser exibida aqui: execute-a com a ferramenta de linha de comando ou use Redefinir para ver a gravação.

js-adv-native-notice-command = { $why } O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ao executar { $command }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-adv-native-notice-plain = { $why } O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-adv-native-notice-platform = { $why } O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ({ $platform }), exibida sem alterações. Ela não é executada de novo quando você edita.

js-adv-native-notice-platform-command = { $why } O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ({ $platform }) ao executar { $command }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-adv-needs-live-engine = Isto requer o motor ao vivo.

js-adv-needs-newer-engine-status = Requer um motor mais recente.

js-adv-nees-line = NEES { $mean } (faixa de 95% { $low }–{ $high }, alvo 2.0)

js-adv-newer-engine-edited-notice = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }. Só a gravação do arquivo incluído pode ser exibida: use Redefinir para vê-la ou execute uma cópia editada com o motor { $need }.

js-adv-newer-engine-no-recording = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }. Não há gravação dele aqui.

js-adv-newer-engine-shown-commit = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }. O que você vê é a execução registrada com uma versão do motor no commit { $commit }, exibida sem alterações; ela não é executada de novo aqui.

js-adv-newer-engine-shown-version = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }. O que você vê é a execução registrada com o motor v{ $recorded }, exibida sem alterações; ela não é executada de novo aqui.

js-adv-nis-line = NIS { $mean } (faixa de 95% { $low }–{ $high }, alvo 1.0)

js-adv-no-guided-controls = Este cenário não tem nenhum dos controles guiados. Use Todos os campos ou edite o código-fonte.

js-adv-no-numeric-fields = Não há campos numéricos individuais para ajustar aqui. Edite o código-fonte diretamente.

js-adv-no-recorded-run = Não há execução registrada para este cenário. Ele requer o motor ao vivo.

js-adv-no-summary = (este cenário não publica um resumo de uma linha)

js-adv-noise-floor = piso de ruído { $level }

js-adv-not-in-browser-status = Este cenário não é executado no navegador.

js-adv-open-and-run = Abrir e executar

js-adv-open-at-field = abrir neste campo

js-adv-opened-from-simple = Aberto com as configurações que você alterou na visualização Simples.

js-adv-optional-preset = predefinição opcional: scenarios/{ $file }

js-adv-orbit-canvas-label = Visualização 3D interativa da trajetória propagada

js-adv-orbit-fallback-alt = Visualização ortográfica da trajetória propagada

js-adv-orbit-note-epoch = Arraste para girar; role ou faça o gesto de pinça para ampliar. Terra em escala, imagens NASA Blue Marble. Girada para a época da execução.

js-adv-orbit-note-no-epoch = Arraste para girar; role ou faça o gesto de pinça para ampliar. Terra em escala, imagens NASA Blue Marble. Esta execução não indica uma época; por isso o ângulo de rotação da Terra não tem significado aqui.

js-adv-orbit-static-note = Visualização estática (a biblioteca 3D não pôde ser carregada aqui).

js-adv-pal-commands = Comandos

js-adv-pal-domain = Área: { $name }

js-adv-pal-domains = Áreas

js-adv-pal-field = Campo: { $name }

js-adv-pal-fields = Campos

js-adv-pal-nothing = Nada corresponde

js-adv-pal-opens-page = abre uma página

js-adv-pal-page = Página: { $name }

js-adv-pal-pages = Páginas

js-adv-pal-panel = Painel: { $name }

js-adv-pal-panels = Painéis

js-adv-pal-scenarios = Cenários

js-adv-params-hint-all = Cada número do cenário. Aumente ou diminua em passos, digite o valor ou use as setas do teclado; o cenário é executado de novo.

js-adv-params-hint-guided = Arraste um controle deslizante e o cenário é executado de novo. Cada controle escreve diretamente no texto do cenário abaixo.

js-adv-pin-already = Essa execução já está fixada.

js-adv-pin-first = Execução { $run } fixada. Altere um parâmetro, execute de novo e fixe essa execução também.

js-adv-pin-label = { $letter } · { $title } · execução { $run }

js-adv-pin-opening-compare = { $n } execuções fixadas. Abrindo Comparar.

js-adv-plan-view = Vista em planta

js-adv-plan-view-epoch = em { $epoch }

js-adv-plan-view-note = Cada ponto é um corpo na época da execução e cada curva é a trajetória orbital que o motor calculou para ele. Uma linha tracejada é um enlace que o cenário pede. Escolha um planeta para ver suas luas em torno dele.

js-adv-player-name-mission = replay da missão

js-adv-player-name-orbit = replay da órbita

js-adv-player-name-replay = replay

js-adv-player-name-waterfall = replay da cascata (waterfall)

js-adv-player-pause = Pausar o { $name }

js-adv-player-play = Reproduzir o { $name }

js-adv-player-position = Posição no { $name }

js-adv-png-download-title = Bitmap de alta resolução para apresentações e documentos

js-adv-png-export-failed = Falha na exportação do PNG: { $reason }

js-adv-ready-live = Pronto. Executa localmente no seu navegador.

js-adv-ready-recorded = Pronto. Exibindo execuções registradas.

js-adv-receiver-at-time = Receptor em t = { $time }

js-adv-recorded-edit-notice = O WebAssembly está bloqueado nesta página; por isso ela exibe execuções reais dos cenários incluídos, registradas com o motor v{ $version }. Cenários editados, varreduras e novas exportações requerem o motor ao vivo: abra kshana.dev ou sirva esta pasta localmente. Redefinir restaura o cenário registrado.

js-adv-recorded-edited-warning = Você editou o cenário: esta gravação é do arquivo incluído, não da sua edição. Execute o comando no seu próprio arquivo para obter a sua.

js-adv-recorded-intro = O WebAssembly está bloqueado nesta página; por isso ela exibe execuções reais dos cenários incluídos, registradas com o motor v{ $version }. Edição, varreduras e novas exportações requerem o motor ao vivo em kshana.dev.

js-adv-recorded-run-native = execução registrada, motor nativo

js-adv-recorded-written-by = Escrito pelo motor nativo de linha de comando v{ $version } ({ $platform }) com { $command }. Exibido sem alterações.

js-adv-replay = Replay

js-adv-report-downloaded = Relatório baixado.

js-adv-report-frame-title = Relatório da execução, escrito pelo motor

js-adv-report-html = Relatório (HTML)

js-adv-report-html-title = O arquivo do relatório, como o motor o escreveu

js-adv-report-load-failed = Não foi possível carregar o relatório registrado ({ $reason }).

js-adv-report-loading = Carregando o relatório registrado…

js-adv-report-none = Não há relatório registrado para este cenário.

js-adv-report-note = Toda execução de linha de comando escreve um relatório: resumo, entradas, resultados, o gráfico, o que é verificado e o que é calculado por modelo, e um registro de reprodutibilidade. A versão para navegador não inclui esse gerador; por isso este é o relatório que o motor nativo de linha de comando escreveu para o cenário incluído. O relatório do próprio Studio sobre a execução exibida na tela está em Exportações.

js-adv-report-open-tab = Abrir em uma nova aba

js-adv-report-open-tab-title = Abrir o relatório isoladamente

js-adv-report-orbit-title = Órbita (inercial centrada na Terra, ortográfica)

js-adv-report-stability-chart = Estabilidade do relógio

js-adv-report-stability-title = Estabilidade do relógio (desvio de Allan)

js-adv-restored-run = Execução { $run } restaurada.

js-adv-result = Resultado

js-adv-run-cancelled = Execução cancelada.

js-adv-run-cancelled-previous = Execução cancelada. O resultado anterior continua exibido.

js-adv-run-failed = A execução falhou. Veja a mensagem nos resultados.

js-adv-scenario-copied = Cenário copiado.

js-adv-scenarios-count = { $n } cenários

js-adv-share-link-copied = Link de compartilhamento copiado. Ele leva o cenário exato.

js-adv-share-link-in-bar = Link colocado na barra de endereços.

js-adv-shared-link = link compartilhado

js-adv-shared-needs-live = Este link leva seu próprio cenário, que requer o motor ao vivo. Abra-o em kshana.dev.

js-adv-shared-scenario = Cenário compartilhado

js-adv-shared-scenario-question = Um cenário aberto a partir de um link de compartilhamento. Ele é executado exatamente como foi compartilhado.

js-adv-solar-bodies-label = Quais corpos desenhar

js-adv-spectrum-part-label = Qual parte do espectro

js-adv-spectrum-row-note = O espectro ao longo da linha da cascata (waterfall) em que o replay está.

js-adv-spectrum-row-title = Espectro ao longo da linha exibida

js-adv-start-field-meta = { $domain } · campo { $field }

js-adv-start-fields-hint = Cada um abre o cenário com esse controle em destaque, pronto para ser alterado.

js-adv-start-fields-named =
    { $n ->
        [one] Campos com nome parecido com “{ $query }”: em { $n } cenário
        [many] Campos com nome parecido com “{ $query }”: em { $n } de cenários
       *[other] Campos com nome parecido com “{ $query }”: em { $n } cenários
    }

js-adv-start-more-matches = Mais { $n } correspondências: acrescente uma palavra para restringi-las.

js-adv-start-nothing = Nada corresponde a “{ $query }”. Tente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-adv-start-scenarios-count = Cenários ({ $count })

js-adv-status-fetching-recorded = Carregando o motor… Buscando o resultado registrado deste cenário.

js-adv-status-ran-locally = Executado localmente em { $time }, execução { $run }.

js-adv-status-ran-locally-secs = Executado localmente em { $time }, execução { $run }, { $secs } s.

js-adv-status-recorded-native = Execução registrada exibida em { $time } (motor nativo).

js-adv-status-recorded-needs-engine = Execução registrada exibida em { $time } (requer o motor { $need }).

js-adv-status-recorded-shown = Execução registrada exibida em { $time }, execução { $run }.

js-adv-status-recorded-shown-secs = Execução registrada exibida em { $time }, execução { $run }, { $secs } s.

js-adv-status-showing-recorded = Carregando o motor… Exibindo o resultado registrado deste cenário até que o motor ao vivo esteja pronto.

js-adv-subtabs-label = Blocos desta visualização (celular)

js-adv-suggest-campaign = Reproduzir uma missão com jamming, spoofing e holdover

js-adv-suggest-coverage = Mapear a cobertura de quatro constelações GNSS (sistema global de navegação por satélite)

js-adv-suggest-holdover = Quanto tempo se aguenta quando o GNSS é perdido

js-adv-suggest-waterfall = Ver um jammer na cascata (waterfall) da banda L

js-adv-svg-download-title = Gráfico vetorial com título e procedência

js-adv-sweep-cancelled = Varredura cancelada.

js-adv-sweep-done-grid = { $total } execuções varridas ({ $columns } × { $rows }) localmente em { $time }.

js-adv-sweep-done-line = { $done } de { $total } execuções varridas localmente em { $time }.

js-adv-sweep-enter-range = Informe uma faixa numérica.

js-adv-sweep-enter-range-second = Informe uma faixa numérica para o segundo parâmetro.

js-adv-sweep-failed = A varredura falhou: { $reason }

js-adv-sweep-interrupted = Varredura interrompida por uma nova execução.

js-adv-sweep-needs-live = Uma varredura executa o motor muitas vezes; por isso requer o motor ao vivo.

js-adv-sweep-none-line-chart = Nenhum (gráfico de linhas)

js-adv-sweep-nothing = Nada para varrer neste cenário.

js-adv-sweep-progress = Varrendo a execução { $n } de { $total }…

js-adv-sweep-status-done = { $total } execuções varridas em { $time }.

js-adv-sweep-title-grid = { $metric } sobre { $first } e { $second }

js-adv-sweep-title-line = { $metric } em função de { $parameter }

js-adv-sweep-wait = Aguarde o fim da execução atual e então varra.

js-adv-tab-animation = Animação

js-adv-tab-compare = Comparar

js-adv-tab-engine-report = Relatório do motor

js-adv-tab-exports-report = Exportações e relatório

js-adv-tab-ground-track = Traço no solo

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = Órbita 3D

js-adv-tab-overview = Visão geral

js-adv-tab-signal-band = Sinal e banda

js-adv-tab-stability = Estabilidade

js-adv-tab-sweep = Varredura

js-adv-tab-time-series = Séries temporais

js-adv-tab-timing-masks = Máscaras de temporização

js-adv-th-at-tau-or-time = Em τ ou no tempo

js-adv-th-body = Corpo

js-adv-th-clock = Relógio

js-adv-th-distance-sun = Distância do Sol

js-adv-th-figure = Número

js-adv-th-file = Arquivo

js-adv-th-format = Formato

js-adv-th-key-figure = Número principal

js-adv-th-light-time-from = Tempo de luz de ida a partir de { $observer }

js-adv-th-light-time-observer = Tempo de luz de ida a partir do observador

js-adv-th-limit = Limite

js-adv-th-margin = Margem

js-adv-th-mask-or-budget = Máscara ou orçamento

js-adv-th-metric = Métrica

js-adv-th-orbital-period = Período orbital

js-adv-th-provenance = Procedência

js-adv-th-size = Tamanho

js-adv-th-source = Fonte

js-adv-th-tier = Nível

js-adv-th-unit = Unidade

js-adv-th-value = Valor

js-adv-th-verdict = Veredito

js-adv-th-what-it-is = O que é

js-adv-the-body = o corpo

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-adv-timeline-chart-title = Linha do tempo da missão: { $title }

js-adv-timeline-latest-event = Último evento, em { $time }: { $label }

js-adv-timeline-no-event = Nenhum evento ainda neste instante.

js-adv-timeline-note = Um único cursor controla todos os gráficos abaixo. Cada fase executa cenários comuns; a campanha lê suas saídas em uma única grade de tempo. As faixas sombreadas são as fases e as linhas verticais, os eventos. Os valores acima são os canais da campanha no instante do replay.

js-adv-timeline-on-one-clock = { $duration } em um único relógio

js-adv-timeline-phase = Fase: { $phase }

js-adv-tour-back = Voltar

js-adv-tour-done = Concluir

js-adv-tour-eyebrow = Tour guiado

js-adv-tour-headline-body = O resumo de uma linha, a versão do motor e a impressão digital do cenário, e se cada número é verificado ou calculado por modelo.

js-adv-tour-headline-title = Leia a resposta

js-adv-tour-keyboard-body = ⌘K encontra qualquer cenário, visualização ou comando. [ e ] alternam entre visualizações.

js-adv-tour-keyboard-title = Tudo pelo teclado

js-adv-tour-library-body = Todos os cenários incluídos, agrupados por área de missão: jamming, espectro, spoofing, relógios, navegação, integridade, órbitas, projeto de constelações, navegação em órbita terrestre baixa, campanhas, a Lua, Marte e o sistema solar. Busque com /.

js-adv-tour-library-title = Escolha uma missão

js-adv-tour-next = Avançar

js-adv-tour-params-body = Controles deslizantes guiados para os ajustes comuns, ou todos os campos numéricos do cenário. Cada alteração executa de novo.

js-adv-tour-params-title = Ajuste

js-adv-tour-pin-body = Fixe até quatro execuções e veja-as lado a lado, com diferenças e um traço de diferença.

js-adv-tour-pin-title = Compare execuções

js-adv-tour-run-body = O motor em Rust é executado no seu navegador como WebAssembly. Nada é enviado. ⌘↵ executa de qualquer lugar.

js-adv-tour-run-title = Execute, localmente

js-adv-tour-share-body = Baixe o relatório, o resultado, o cenário e as exportações do motor, ou copie um link que leva o cenário exato, ou um iframe para a página de um curso ou uma wiki.

js-adv-tour-share-title = Compartilhe ou exporte

js-adv-tour-skip = Pular

js-adv-tour-source-body = O cenário completo em TOML. O que você executa é exatamente o que você pode compartilhar e reproduzir.

js-adv-tour-source-title = Ou edite qualquer coisa

js-adv-tour-tabs-body = As visualizações aparecem quando o resultado as comporta: sinal e banda para jamming, a cascata (waterfall) para espectro, a linha do tempo da missão para campanhas, mapas de cobertura para constelações, holdover para relógios, máscaras para temporização de telecomunicações, órbitas 3D, traços no solo, varreduras, e a animação e o relatório do próprio motor.

js-adv-tour-tabs-title = Todas as visualizações da execução

js-adv-tracking-threshold-value = Limiar de rastreamento { $value }

js-adv-transport-label = Replay: um único cursor controla todos os painéis desta execução

js-adv-transport-sub = um único cursor controla todos os painéis desta execução

js-adv-unpin-run = Desafixar a execução { $run }

js-adv-waterfall = Cascata (waterfall)

js-adv-waterfall-note = A cor é a potência acima do piso de ruído do receptor. Os sinais de navegação ficam abaixo desse piso; por isso o que se acende são os jammers. Reproduza o replay ou arraste-o, e as bandas à direita mostram o que o receptor ainda rastreia naquele momento.

js-adv-waterfall-sub = densidade espectral de potência: frequência na horizontal, tempo para baixo

js-adv-waterfall-title = Cascata (waterfall), { $name }

js-adv-webassembly-unavailable = WebAssembly indisponível

js-app-all-questions = Todas as perguntas

js-app-anim-frame-title = Animação desta execução, escrita pelo motor

js-app-anim-html-player = Player HTML

js-app-anim-html-player-title = O player de arquivo único, como o motor o escreveu

js-app-anim-load-failed = Não foi possível carregar a animação registrada ({ $reason }).

js-app-anim-loading = Carregando a animação registrada…

js-app-anim-none = Não há animação registrada para este cenário.

js-app-anim-note = O motor escreve uma animação de qualquer execução que tenha um eixo de tempo: um SVG que se reproduz sozinho e um player HTML de arquivo único, com seus próprios controles de reprodução e de navegação. A versão para navegador não inclui esse gerador; por isso este é o arquivo que o motor nativo de linha de comando escreveu para o cenário incluído.

js-app-anim-svg = SVG animado

js-app-anim-svg-title = O SVG que se reproduz sozinho, como o motor o escreveu

js-app-axis-averaging-time = tempo de média τ (s)

js-app-axis-observation-interval = intervalo de observação τ (s)

js-app-axis-value = valor

js-app-badge-modelled = { $n } calculados por modelo

js-app-badge-recorded = Registrada

js-app-badge-validated = { $n } verificados

js-app-band-carrier = Portadora

js-app-band-carrier-unset = não definida neste cenário

js-app-band-chip-rate = Taxa de chip

js-app-band-jammer-bandwidth = Largura de banda do jammer

js-app-band-jammer-mhz = jammer { $mhz } MHz

js-app-band-jammer-power = Potência do jammer

js-app-band-jammer-type = Tipo de jammer

js-app-band-main-lobe = lóbulo principal do sinal

js-app-band-no-carrier-note = O motor calcula a relação jammer-sinal a partir do orçamento de enlace. Este cenário não indica uma frequência de portadora; por isso nenhum espectro é desenhado.

js-app-band-satellites = Satélites

js-app-band-svg-label = Bandas do sinal e do jammer em torno da portadora

js-app-band-tracking-threshold = Limiar de rastreamento

js-app-browse-all-title = Todos os { $n } cenários

js-app-browse-area-kicker =
    { $n ->
        [one] Área · { $n } cenário
        [many] Área · { $n } de cenários
       *[other] Área · { $n } cenários
    }

js-app-browse-area-lede = Escolha um: ele abre direto no seu resultado.

js-app-browse-evidence = Os métodos do motor que seus cenários executam têm { $validated } linhas verificadas e { $modelled } linhas calculadas por modelo na matriz de verificação.

js-app-browse-evidence-title = A evidência por trás desta área.

js-app-browse-kicker = Explorar

js-app-browse-lede = Busque ou escolha uma área. Cada cenário abre direto no seu resultado.

js-app-browse-validated-examples = Verificados, por exemplo: { $examples }.

js-app-browser-cannot-run = A versão para navegador não consegue executar este cenário.

js-app-btn-all-exports = Todas as exportações

js-app-btn-all-exports-title = Todas as exportações desta execução, inclusive os formatos próprios do motor

js-app-btn-compare-pinned = Comparar as execuções fixadas

js-app-btn-copy-embed = Copiar o código de incorporação

js-app-btn-copy-link = Copiar um link para este cenário exato

js-app-btn-figure-png = Figura (PNG)

js-app-btn-figure-png-title = O gráfico exibido na tela como bitmap de alta resolução

js-app-btn-figure-svg = Figura (SVG)

js-app-btn-figure-svg-title = O gráfico exibido na tela, com seu título, a versão do motor e o DOI

js-app-btn-pin-compare = Fixar esta execução para comparar

js-app-btn-pin-count = Fixar esta execução ({ $n } fixadas)

js-app-btn-report-html = Relatório reproduzível (HTML)

js-app-btn-report-html-title = Um arquivo offline: resumo, números com seus níveis, gráficos e o cenário exato

js-app-btn-result-json = Dados do resultado (JSON)

js-app-btn-result-json-title = A saída completa do motor para esta execução

js-app-btn-run-history = Histórico de execuções

js-app-btn-scenario-toml = Arquivo do cenário (TOML)

js-app-btn-scenario-toml-title = A entrada exata desta execução

js-app-btn-table-csv = Tabela (CSV)

js-app-btn-table-csv-title = Os mesmos bytes que a ferramenta de linha de comando escreve como { $file }

js-app-bytes =
    { $n ->
        [one] { $n } byte
        [many] { $n } de bytes
       *[other] { $n } bytes
    }

js-app-cap-sub = { $areas } áreas, { $total } cenários prontos para executar. Cada área mostra um resultado real registrado e a mistura de evidências por trás dele: a parcela de seus métodos do motor verificada em relação a uma referência externa.

js-app-chain-hint = a saída de cada etapa alimenta a seguinte

js-app-chain-note = Um único sistema acompanhado por todas as etapas do motor. A tabela abaixo lista cada número que uma etapa calculou e que a etapa seguinte usou.

js-app-chain-stage = Etapa { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } valor repassado
        [many] { $n } de valores repassados
       *[other] { $n } valores repassados
    }

js-app-chart-allan-deviation = Desvio de Allan

js-app-chart-cn0-by-satellite = C/N0 efetivo por satélite

js-app-chart-default-title = Gráfico do Kshana

js-app-chart-ground-track = Traço no solo

js-app-chart-holdover-title = Holdover em relação a um orçamento de temporização

js-app-chart-mtie-title = MTIE (erro máximo de intervalo de tempo)

js-app-chart-not-drawn = Não foi possível desenhar este gráfico.

js-app-chart-scenario-hash = cenário { $hash }

js-app-chart-stability-title = Estabilidade do relógio (desvio de Allan sobreposto)

js-app-chart-tdev-title = TDEV (desvio de tempo)

js-app-chip-failed-title = O WebAssembly não pôde ser iniciado aqui. Exibindo execuções registradas reais dos cenários incluídos.

js-app-chip-failed-title-reason = O WebAssembly não pôde ser iniciado aqui ({ $reason }). Exibindo execuções registradas reais dos cenários incluídos.

js-app-chip-live = Motor ao vivo · v{ $version }

js-app-chip-live-title = O motor do Kshana está sendo executado neste navegador como WebAssembly

js-app-chip-loading = Carregando o motor

js-app-chip-loading-title = O motor está sendo baixado. Enquanto isso, são exibidos resultados registrados.

js-app-chip-recorded = Execuções registradas · v{ $version }

js-app-chip-unavailable = Motor indisponível

js-app-cli-note = Instale com { $command }. A execução escreve { $file }, um gráfico e um relatório.

js-app-cli-only-title = Este é executado na linha de comando, não no navegador.

js-app-cli-save-comment = # salve o arquivo do cenário abaixo como { $file } e então

js-app-cmd-advanced = Mostrar todas as configurações (configurações avançadas)

js-app-cmd-browse = Explorar todos os cenários

js-app-cmd-compare = Comparar as execuções fixadas

js-app-cmd-embed = Copiar o código de incorporação

js-app-cmd-exports = Baixar os resultados (exportações)

js-app-cmd-history = Abrir o histórico de execuções

js-app-cmd-home = Ir para a tela de abertura

js-app-cmd-how = Como isto é calculado

js-app-cmd-pin = Fixar esta execução para comparar

js-app-cmd-report = Baixar o relatório

js-app-cmd-research = Código, dados e citação (para pesquisadores)

js-app-cmd-reset = Redefinir o texto do cenário

js-app-cmd-run = Executar o cenário

js-app-cmd-share = Copiar o link de compartilhamento

js-app-cmd-theme = Alternar entre o tema claro e o escuro

js-app-cmd-tour = Iniciar o tour guiado

js-app-compare-deltas = As diferenças são em relação à execução A. O verde marca o melhor valor de cada número.

js-app-compare-none = Estas execuções não têm figuras de mérito comparáveis. Fixe execuções da mesma família de cenários para ver números e diferenças.

js-app-compare-pin-two = Fixe pelo menos duas execuções para compará-las lado a lado. Fixe uma execução, altere um parâmetro ou escolha outro cenário da mesma família, execute-o e fixe de novo.

js-app-compare-run-head = { $letter } · execução { $id }

js-app-coverage-cell-note = Cada célula é um ponto da grade em { $body }, avaliado em todas as épocas da execução.

js-app-coverage-dots-of = de

js-app-coverage-dots-post = satélites, levados ao longo de seus traços no solo; reproduza o replay para movê-los.

js-app-coverage-dots-pre = Os pontos são

js-app-coverage-field-label = Campo a mapear

js-app-coverage-map = Mapa de cobertura

js-app-coverage-map-select = Mapear

js-app-coverage-over = sobre

js-app-coverage-title = { $field } sobre { $body }

js-app-crumb-all-scenarios = Todos os cenários

js-app-crumb-area = Área

js-app-crumb-search = Busca: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Baixar

js-app-edited-cli-only = Editado: este cenário é executado somente no motor de linha de comando.

js-app-edited-needs-engine = Editado: requer o motor { $need }.

js-app-edited-needs-live = Cenários editados requerem o motor ao vivo.

js-app-embed-copied = Código de incorporação copiado.

js-app-engine-chart = Gráfico do motor

js-app-engine-chart-alt = Gráfico do motor para esta execução

js-app-engine-could-not-start = Não foi possível iniciar o motor: { $reason }. Sirva esta pasta por HTTP (por exemplo, { $command }) em vez de abrir o arquivo diretamente.

js-app-engine-failed = Não foi possível carregar o motor ({ $reason }).

js-app-engine-file-http = O arquivo do motor retornou HTTP { $status }.

js-app-engine-no-recordings = Não foi possível carregar o motor ({ $reason }) e nenhuma execução registrada foi encontrada.

js-app-entries-count =
    { $n ->
        [one] { $n } entrada
        [many] { $n } de entradas
       *[other] { $n } entradas
    }

js-app-ev-aria = { $validated } linhas verificadas e { $modelled } linhas calculadas por modelo na matriz de verificação

js-app-ev-title = { $validated } verificadas · { $modelled } linhas calculadas por modelo na matriz de verificação

js-app-ev-validated = verificados

js-app-export-card-title = Exportação { $format }

js-app-export-checking = Verificando quais formatos de efemérides esta execução pode exportar…

js-app-export-csv-desc = Os mesmos bytes que a ferramenta de linha de comando escreve como { $file }.

js-app-export-csv-title = Tabela de reprodutibilidade

js-app-export-engine-loading = As exportações de efemérides aparecem aqui quando o motor for carregado.

js-app-export-json-desc = A saída completa do motor para esta execução, com unidades e procedência.

js-app-export-json-title = Documento completo do resultado

js-app-export-not-recorded = Esta exportação é grande e por isso não foi registrada. Ela requer o motor ao vivo.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) para GMAT, Orekit ou STK

js-app-export-omm-desc = Catálogo CCSDS OMM (Orbit Mean-elements Message)

js-app-export-report-desc = Um arquivo offline: resumo, números com seus níveis, todos os gráficos e o texto exato do cenário, carimbado com a versão do motor e o hash do cenário.

js-app-export-report-title = Relatório reproduzível

js-app-export-sp3-desc = Efemérides precisas SP3-c desta constelação

js-app-export-toml-desc = A entrada exata desta execução. Execute-a de novo em qualquer lugar com a ferramenta de linha de comando ou com os pacotes Python e npm.

js-app-export-toml-title = Arquivo do cenário

js-app-export-too-large = { $desc }. Grande demais para registrar: requer o motor ao vivo.

js-app-fields-more = mais { $n }

js-app-fields-none = nenhum

js-app-fields-none-hint = Não há outros números individuais para alterar aqui. Edite o arquivo em “Para pesquisadores”.

js-app-fields-top-of-file = início do arquivo

js-app-find-matches =
    { $n ->
        [one] { $n } controle guiado e { $m } de { $total } campos correspondem a “{ $query }”.
        [many] { $n } de controles guiados e { $m } de { $total } campos correspondem a “{ $query }”.
       *[other] { $n } controles guiados e { $m } de { $total } campos correspondem a “{ $query }”.
    }

js-app-find-none = Nenhum campo deste cenário corresponde a “{ $query }”. Busque em todos os cenários com a busca da biblioteca.

js-app-geo-sub = { $name } · { $features } de { $total } feições desenhadas · registrado com o motor nativo

js-app-geojson-title = Exportação GeoJSON: { $name }

js-app-gt-highlighted = Em destaque: satélite visível da estação.

js-app-gt-peak-doppler = Doppler máximo { $value } Hz.

js-app-gt-peak-elevation = Elevação máxima { $value }°.

js-app-health-check-tuning = verificar o ajuste

js-app-health-consistent = consistente

js-app-health-nees-band = NEES { $mean } (faixa de 95% { $lo }–{ $hi }, alvo 2.0)

js-app-health-nis-band = NIS { $mean } (faixa de 95% { $lo }–{ $hi }, alvo 1.0)

js-app-heat-map-label = Mapa de calor de { $metric }

js-app-hero-clock = { $elapsed } de { $total }

js-app-hero-mask = máscara de elevação de { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } lugares
        [many] { $n } de lugares
       *[other] { $n } lugares
    }

js-app-hero-positions-only = Somente posições de satélites: sem potência de sinal, saúde dos satélites nem terreno.

js-app-hero-ramp = { $lo } a { $hi } { $field }

js-app-hero-ramp-over = { $lo } a { $hi } { $field }, ao longo de { $duration }

js-app-hero-recorded-bare = Resultado registrado

js-app-hero-satellites =
    { $n ->
        [one] { $n } satélites
        [many] { $n } de satélites
       *[other] { $n } satélites
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } passos de tempo
        [many] { $n } de passos de tempo
       *[other] { $n } passos de tempo
    }

js-app-hist-runs = { $n } execuções.

js-app-history-pin = Fixar

js-app-history-restore = Restaurar

js-app-history-restored = Execução { $id } restaurada.

js-app-history-run = execução { $id } · { $time }

js-app-hit-in-scenario = em { $title }

js-app-hit-native-note = execução registrada, motor nativo

js-app-hit-setting-meta = { $area } · configuração { $name }

js-app-ho-budget = orçamento

js-app-ho-engine-budget = Holdover do motor no orçamento do cenário ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover do motor no orçamento do cenário: { $duration }

js-app-ho-error-after-loss = erro após a perda do GNSS em t = { $t } s

js-app-ho-error-since-fix = erro desde o último fix

js-app-ho-stays-inside = permanece dentro deste orçamento durante todo o registro

js-app-ho-until-breached = até o orçamento ser violado

js-app-hover-classical = clássico

js-app-hover-quantum = quântico

js-app-how-checks = (verifica: { $requirement })

js-app-how-matrix = Os métodos do motor que este cenário executa têm { $validated } linhas verificadas e { $modelled } linhas calculadas por modelo na matriz de verificação:

js-app-how-matrix-partner = Os métodos do motor que este cenário executa têm { $validated } linhas verificadas e { $modelled } linhas calculadas por modelo na matriz de verificação, e { $partner } de responsabilidade de parceiros:

js-app-how-mix-chip = { $validated } verificadas · { $modelled } calculadas por modelo

js-app-how-more-notes =
    { $n ->
        [one] Mais { $n } nota do arquivo do cenário
        [many] Mais { $n } de notas do arquivo do cenário
       *[other] Mais { $n } notas do arquivo do cenário
    }

js-app-how-more-rows =
    { $n ->
        [one] Mais { $n } linha na matriz de verificação (página Evidências do site).
        [many] Mais { $n } de linhas na matriz de verificação (página Evidências do site).
       *[other] Mais { $n } linhas na matriz de verificação (página Evidências do site).
    }

js-app-how-no-header = Este arquivo de cenário não tem nota de cabeçalho. O resumo do motor abaixo diz o que foi executado.

js-app-how-no-matrix-row = Nenhuma linha da matriz de verificação nomeia ainda o tipo de motor deste cenário.

js-app-how-no-sources = O arquivo do cenário não cita nenhuma fonte, e nenhuma linha verificada da matriz cobre seu tipo.

js-app-how-own-label = O rótulo próprio desta execução: { $label }

js-app-how-per-figure = Por número, a partir do bloco figure_tiers do motor: { $validated } verificados, { $modelled } calculados por modelo. O nível de cada número está na visualização Visão geral.

js-app-install-copy = Copiar: { $command }

js-app-install-label = Instalar v{ $version }

js-app-interop-no-file = O motor não escreveu nenhum arquivo deste formato para esta execução.

js-app-interop-not-apply = Não se aplica a este cenário: { $reason }.

js-app-interop-not-bundled = Não incluído aqui (tamanho): o comando acima o escreve.

js-app-interop-note = O motor escreve a geometria e as amostras de sinal de uma execução em formatos que outras ferramentas abrem: CZML para o Cesium, KML (Keyhole Markup Language) para o Google Earth, GeoJSON para mapas, arquivos de efemérides STK (.e) e gravações SigMF (Signal Metadata Format). A versão para navegador não inclui esses geradores; por isso os arquivos abaixo são os que o motor nativo de linha de comando escreveu para o cenário incluído.

js-app-job-running = Executando

js-app-job-sweeping = Varrendo

js-app-js-range-label = Faixa J/S

js-app-js-range-value = { $lo } a { $hi } dB

js-app-latest-event-at = Último evento, em

js-app-legend-all = capacidades do motor são verificadas em toda a matriz de verificação; { $modelled } são calculadas por modelo e { $partner } são de responsabilidade de parceiros.

js-app-legend-count = { $validated } de { $total }

js-app-load-failed = Não foi possível carregar { $file }.

js-app-mask-envelope = Envelope do erro de tempo em holdover ({ $source })

js-app-mask-exceeded-after = excedido após { $duration }

js-app-mask-limit = limite { $value } ns

js-app-mask-not-exceeded = não excedido

js-app-meta-engine = motor

js-app-meta-file = arquivo

js-app-meta-scenario = cenário

js-app-meta-seed = semente

js-app-meta-shared-link = link compartilhado

js-app-meta-time = tempo

js-app-mission-timeline = Linha do tempo da missão

js-app-native-edited-notice = A execução registrada é a do arquivo incluído; por isso uma cópia editada não pode ser exibida aqui: execute-a com a ferramenta de linha de comando ou use Redefinir para ver a gravação.

js-app-native-recorded = O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-app-native-recorded-c = O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ao executar { $command }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-app-native-recorded-p = O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ({ $platform }), exibida sem alterações. Ela não é executada de novo quando você edita.

js-app-native-recorded-pc = O que você vê é uma execução registrada com o motor nativo de linha de comando v{ $version } ({ $platform }) ao executar { $command }, exibida sem alterações. Ela não é executada de novo quando você edita.

js-app-needs-live-engine = Isto requer o motor ao vivo.

js-app-needs-newer-engine = Requer um motor mais recente.

js-app-needs-newer-why = Este cenário requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }.

js-app-no-chart-export = Esta visualização não tem gráfico para exportar.

js-app-no-event-yet = Nenhum evento ainda neste instante.

js-app-no-recorded-run = Não há execução registrada para este cenário. Ele requer o motor ao vivo.

js-app-no-recording-here = Não há gravação dele aqui.

js-app-no-summary = (este cenário não publica um resumo de uma linha)

js-app-noise-floor = piso de ruído { $value }

js-app-not-in-browser = Este cenário não é executado no navegador.

js-app-notice-shared-needs-live = Este link leva seu próprio cenário, que requer o motor ao vivo. Abra-o em kshana.dev.

js-app-on-one-clock = em um único relógio

js-app-only-bundled-recording = Só a gravação do arquivo incluído pode ser exibida: use Redefinir para vê-la ou execute uma cópia editada com o motor { $need }.

js-app-opening-result = Abrindo o resultado…

js-app-orbit-canvas-label = Visualização 3D interativa da trajetória propagada

js-app-orbit-epoch-set = Girada para a época da execução.

js-app-orbit-epoch-unset = Esta execução não indica uma época; por isso o ângulo de rotação da Terra não tem significado aqui.

js-app-orbit-img-alt = Visualização ortográfica da trajetória propagada

js-app-orbit-note = Arraste para girar; role ou faça o gesto de pinça para ampliar. Terra em escala, imagens NASA Blue Marble.

js-app-orbit-static = Visualização estática (a biblioteca 3D não pôde ser carregada aqui).

js-app-overlay-note = As linhas contínuas são a execução A e as tracejadas, a execução B, nos mesmos eixos.

js-app-overlay-pinned = Sobreposição das execuções fixadas

js-app-overlay-title = { $title }: execução { $a } (A) contra execução { $b } (B)

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

js-app-pal-sec-settings = Configurações

js-app-pal-sec-views = Visualizações

js-app-pal-setting = Configuração: { $label }

js-app-pal-view = Visualização: { $label }

js-app-panel-close = Fechar

js-app-panel-close-full = Fechar a tela cheia

js-app-panel-expand = Expandir

js-app-panel-expand-full = Expandir este painel para a tela cheia

js-app-panel-expand-title = Mostrar este painel em tela cheia (Escape o fecha)

js-app-params-hint = Altere um valor e execute de novo. A resposta e o gráfico são atualizados no lugar.

js-app-phase = Fase:

js-app-pin-already = Essa execução já está fixada.

js-app-pin-compare = { $n } execuções fixadas. Abrindo Comparar.

js-app-pin-first = Execução { $id } fixada. Altere um parâmetro, execute de novo e fixe essa execução também.

js-app-pin-label = { $letter } · { $title } · execução { $id }

js-app-plan-view = Vista em planta

js-app-plan-view-at = em

js-app-player-pause = Pausar o replay

js-app-player-pause-mission = Pausar o replay da missão

js-app-player-pause-orbit = Pausar o replay da órbita

js-app-player-pause-waterfall = Pausar o replay da cascata (waterfall)

js-app-player-play = Reproduzir o replay

js-app-player-play-mission = Reproduzir o replay da missão

js-app-player-play-orbit = Reproduzir o replay da órbita

js-app-player-play-waterfall = Reproduzir o replay da cascata (waterfall)

js-app-player-position = Posição no replay

js-app-player-position-mission = Posição no replay da missão

js-app-player-position-orbit = Posição no replay da órbita

js-app-player-position-waterfall = Posição no replay da cascata (waterfall)

js-app-png-button-title = Bitmap de alta resolução para apresentações e documentos

js-app-png-export-failed = Falha na exportação do PNG: { $reason }

js-app-py-note = Instale com { $command }.

js-app-ran-locally = Executado localmente em { $time }, execução { $n }.

js-app-ran-locally-took = Executado localmente em { $time }, execução { $n }, { $took } s.

js-app-receiver-at = Receptor em t =

js-app-recorded-edit-notice = O WebAssembly está bloqueado nesta página; por isso ela exibe execuções reais dos cenários incluídos, registradas com o motor v{ $version }. Cenários editados, varreduras e novas exportações requerem o motor ao vivo: abra kshana.dev ou sirva esta pasta localmente. Redefinir restaura o cenário registrado.

js-app-recorded-intro = O WebAssembly está bloqueado nesta página; por isso ela exibe execuções reais dos cenários incluídos, registradas com o motor v{ $version }. Edição, varreduras e novas exportações requerem o motor ao vivo em kshana.dev.

js-app-recorded-shown-native = Execução registrada exibida em { $time } (motor nativo).

js-app-recorded-shown-needs = Execução registrada exibida em { $time } (requer o motor { $need }).

js-app-recorded-shown-run = Execução registrada exibida em { $time }, execução { $n }.

js-app-recorded-shown-took = Execução registrada exibida em { $time }, execução { $n }, { $took } s.

js-app-recorded-with-commit = O que você vê é a execução registrada com uma versão do motor no commit { $commit }, exibida sem alterações; ela não é executada de novo aqui.

js-app-recorded-with-engine = O que você vê é a execução registrada com o motor v{ $version }, exibida sem alterações; ela não é executada de novo aqui.

js-app-recording-edited-warning = Você editou o cenário: esta gravação é do arquivo incluído, não da sua edição. Execute o comando no seu próprio arquivo para obter a sua.

js-app-replay = Replay

js-app-report-downloaded = Relatório baixado.

js-app-report-frame-title = Relatório da execução, escrito pelo motor

js-app-report-html = Relatório (HTML)

js-app-report-html-title = O arquivo do relatório, como o motor o escreveu

js-app-report-load-failed = Não foi possível carregar o relatório registrado ({ $reason }).

js-app-report-loading = Carregando o relatório registrado…

js-app-report-none = Não há relatório registrado para este cenário.

js-app-report-note = Toda execução de linha de comando escreve um relatório: resumo, entradas, resultados, o gráfico, o que é verificado e o que é calculado por modelo, e um registro de reprodutibilidade. A versão para navegador não inclui esse gerador; por isso este é o relatório que o motor nativo de linha de comando escreveu para o cenário incluído. O relatório do próprio Studio sobre a execução exibida na tela está em Exportações.

js-app-report-open-tab = Abrir em uma nova aba

js-app-report-open-tab-title = Abrir o relatório isoladamente

js-app-report-orbit-title = Órbita (inercial centrada na Terra, ortográfica)

js-app-report-stability-short = Estabilidade do relógio

js-app-report-stability-title = Estabilidade do relógio (desvio de Allan)

js-app-run-again = Executar de novo

js-app-run-cancelled = Execução cancelada.

js-app-run-cancelled-previous = Execução cancelada. O resultado anterior continua exibido.

js-app-run-failed = A execução falhou. Veja a mensagem nos resultados.

js-app-run-when-ready = Executar quando o motor estiver pronto

js-app-run-will-run = Será executado quando o motor estiver pronto

js-app-run-with-settings = Executar com estas configurações

js-app-search-more-matches =
    { $n ->
        [one] Mais { $n } correspondência: acrescente uma palavra para restringi-las.
        [many] Mais { $n } de correspondências: acrescente uma palavra para restringi-las.
       *[other] Mais { $n } correspondências: acrescente uma palavra para restringi-las.
    }

js-app-search-nothing = Nada corresponde a “{ $query }”. Tente uma palavra como jamming, relógio, lunar, órbita, máscara ou PDOP.

js-app-search-scenarios = Cenários ({ $n })

js-app-search-settings =
    { $n ->
        [one] Configurações com nome parecido com “{ $query }”: em { $n } cenário
        [many] Configurações com nome parecido com “{ $query }”: em { $n } de cenários
       *[other] Configurações com nome parecido com “{ $query }”: em { $n } cenários
    }

js-app-search-settings-hint = Cada uma abre o cenário com essa configuração em destaque, pronta para ser alterada.

js-app-share-copied = Link de compartilhamento copiado. Ele leva o cenário exato.

js-app-share-in-address-bar = Link colocado na barra de endereços.

js-app-share-link-sub = Ele é executado exatamente como foi compartilhado.

js-app-share-link-title = Um cenário aberto a partir de um link de compartilhamento

js-app-shared-scenario = Cenário compartilhado

js-app-shown-unchanged = Exibido sem alterações.

js-app-solar-note = Cada ponto é um corpo na época da execução e cada curva é a trajetória orbital que o motor calculou para ele. Uma linha tracejada é um enlace que o cenário pede. Escolha um planeta para ver suas luas em torno dele.

js-app-solar-which-bodies = Quais corpos desenhar

js-app-source-live = Resultado ao vivo · motor v{ $version }

js-app-source-native = Resultado registrado, motor nativo · v{ $version }

js-app-source-recorded = Resultado registrado · v{ $version }

js-app-source-recorded-loading = Resultado registrado · v{ $version } · carregando o motor

js-app-spectrum-row-note = O espectro ao longo da linha da cascata (waterfall) em que o replay está.

js-app-spectrum-row-title = Espectro ao longo da linha exibida

js-app-spectrum-which-part = Qual parte do espectro

js-app-status-last-run-took = A última execução levou { $ms } ms no seu navegador. Nada é enviado.

js-app-status-loading-kept = O motor ainda está carregando. Suas alterações são mantidas e executadas assim que ele estiver pronto.

js-app-status-loading-recorded = O motor ainda está carregando. O resultado acima é uma execução registrada.

js-app-status-not-run-yet = Suas alterações ainda não foram executadas.

js-app-status-runs-in-browser = Executa no seu navegador. Nada é enviado.

js-app-status-wasm-blocked = O WebAssembly está bloqueado aqui; por isso são exibidas execuções registradas dos cenários incluídos.

js-app-stepper-decrease = Diminuir { $key }

js-app-stepper-increase = Aumentar { $key }

js-app-subtabs-label = Blocos desta visualização (celular)

js-app-svg-button-title = Gráfico vetorial com título e procedência

js-app-sweep-cancelled = Varredura cancelada.

js-app-sweep-done-1d = { $done } de { $total } execuções varridas localmente em { $duration }.

js-app-sweep-done-2d = { $total } execuções varridas ({ $a } × { $b }) localmente em { $duration }.

js-app-sweep-enter-range = Informe uma faixa numérica.

js-app-sweep-enter-range-2 = Informe uma faixa numérica para o segundo parâmetro.

js-app-sweep-failed = A varredura falhou: { $reason }

js-app-sweep-interrupted = Varredura interrompida por uma nova execução.

js-app-sweep-needs-live = Uma varredura executa o motor muitas vezes; por isso requer o motor ao vivo.

js-app-sweep-none-line = Nenhum (gráfico de linhas)

js-app-sweep-nothing = Nada para varrer neste cenário.

js-app-sweep-progress = Varrendo a execução { $n } de { $total }…

js-app-sweep-status-done = { $total } execuções varridas em { $time }.

js-app-sweep-title-1d = { $metric } em função de { $knob }

js-app-sweep-title-2d = { $metric } sobre { $knob1 } e { $knob2 }

js-app-sweep-wait = Aguarde o fim da execução atual e então varra.

js-app-tab-animation = Animação

js-app-tab-compare = Comparar

js-app-tab-exports = Exportações e relatório

js-app-tab-ground = Traço no solo

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Máscaras de temporização

js-app-tab-orbit = Órbita 3D

js-app-tab-overview = Visão geral

js-app-tab-report = Relatório do motor

js-app-tab-signal = Sinal e banda

js-app-tab-stability = Estabilidade

js-app-tab-sweep = Varredura

js-app-tab-timeseries = Séries temporais

js-app-th-at-tau = Em τ ou no tempo

js-app-th-body = Corpo

js-app-th-clock = Relógio

js-app-th-figure = Número

js-app-th-file = Arquivo

js-app-th-format = Formato

js-app-th-key-figure = Número principal

js-app-th-light-time = Tempo de luz de ida a partir de { $observer }

js-app-th-limit = Limite

js-app-th-margin = Margem

js-app-th-mask-or-budget = Máscara ou orçamento

js-app-th-metric = Métrica

js-app-th-metric-2 = Métrica

js-app-th-orbital-period = Período orbital

js-app-th-provenance = Procedência

js-app-th-size = Tamanho

js-app-th-source = Fonte

js-app-th-sun-distance = Distância do Sol

js-app-th-tier = Nível

js-app-th-unit = Unidade

js-app-th-value = Valor

js-app-th-value-2 = Valor

js-app-th-value-3 = Valor

js-app-th-verdict = Veredito

js-app-th-what-it-is = O que é

js-app-the-body = o corpo

js-app-the-chain = A cadeia

js-app-the-observer = o observador

js-app-tile-browse-all = Explorar todos os { $n } cenários

js-app-tile-browse-sub = Busque por nome, pergunta ou configuração

js-app-tile-preview-label = Prévia registrada de { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } cenário
        [many] { $n } de cenários
       *[other] { $n } cenários
    }

js-app-timeline-chart-title = Linha do tempo da missão: { $title }

js-app-timeline-note = Um único cursor controla todos os gráficos abaixo. Cada fase executa cenários comuns; a campanha lê suas saídas em uma única grade de tempo. As faixas sombreadas são as fases e as linhas verticais, os eventos. Os valores acima são os canais da campanha no instante do replay.

js-app-toast-copied = Copiado.

js-app-toast-copy-blocked = A cópia está bloqueada aqui.

js-app-toast-copy-blocked-select = A cópia está bloqueada aqui: selecione o texto.

js-app-toast-json-copied = JSON copiado.

js-app-toast-loading-run = O motor ainda está carregando. Sua execução começa assim que ele estiver pronto.

js-app-toast-no-scenario = Não há aqui nenhum cenário chamado { $name }. Estas são as correspondências mais próximas.

js-app-toast-not-single-number = Essa configuração não é um número único neste cenário: edite-a no arquivo do cenário.

js-app-toast-one-pinned = Uma execução está fixada. Altere uma configuração, execute de novo e fixe essa execução para comparar as duas.

js-app-toast-opened-advanced = Aberto com as configurações que você alterou na visualização Avançada.

js-app-toast-opened-at = Aberto em { $label }. Altere-o e execute de novo.

js-app-toast-scenario-copied = Cenário copiado.

js-app-tour-answer-body = Uma frase simples lida a partir do resultado e a origem do resultado: uma execução ao vivo no seu navegador ou uma execução registrada com o mesmo motor.

js-app-tour-answer-title = Primeiro, a resposta

js-app-tour-back = Voltar

js-app-tour-done = Concluir

js-app-tour-eyebrow = Tour guiado

js-app-tour-figures-body = Cada cartão é lido do documento de resultado do motor.

js-app-tour-figures-title = Os números que a respondem

js-app-tour-how-body = O método, o nível de evidência e as referências.

js-app-tour-how-title = Como isto é calculado

js-app-tour-next = Avançar

js-app-tour-research-body = A linha de comando e o Python para executar por conta própria, os dados e os números, e como citar.

js-app-tour-research-title = Para pesquisadores

js-app-tour-search-body = ⌘K encontra qualquer cenário, área, configuração, visualização ou comando.

js-app-tour-search-title = Busca

js-app-tour-settings-body = As cinco configurações que mais importam para esta pergunta. Altere uma e execute de novo. O motor é executado no seu navegador; nada é enviado.

js-app-tour-settings-title = Experimente outras configurações

js-app-tour-skip = Pular

js-app-tour-views-body = Gráficos, mapas, replays, o relatório do próprio motor e exportações. [ e ] alternam entre visualizações.

js-app-tour-views-title = Todas as visualizações da execução

js-app-tracking-threshold = Limiar de rastreamento

js-app-transport-hint = um único cursor controla todos os painéis desta execução

js-app-transport-label = Replay: um único cursor controla todos os painéis desta execução

js-app-unpin-run = Desafixar a execução { $id }

js-app-waterfall = Cascata (waterfall)

js-app-waterfall-hint = densidade espectral de potência: frequência na horizontal, tempo para baixo

js-app-waterfall-note = A cor é a potência acima do piso de ruído do receptor. Os sinais de navegação ficam abaixo desse piso; por isso o que se acende são os jammers. Reproduza o replay ou arraste-o, e as bandas à direita mostram o que o receptor ainda rastreia naquele momento.

js-app-waterfall-title = Cascata (waterfall), { $name }

js-app-webassembly-unavailable = WebAssembly indisponível

js-app-written-by-native = Escrito pelo motor nativo de linha de comando v{ $version } ({ $platform }) com

js-cat-acm-link-question = Ao longo de cada passagem, que modo DVB-S2 o enlace mantém e quantos dados a passagem transfere? (calculado por modelo)

js-cat-acm-link-title = Downlink de satélite com codificação adaptativa

js-cat-aocs-slew-mekf-question = Com o controlador alimentado por um filtro de atitude e um giroscópio com viés, como a manobra se compara ao caso com o estado verdadeiro? (calculado por modelo)

js-cat-aocs-slew-mekf-title = Manobra sobre uma estimativa de atitude

js-cat-aocs-slew-question = A lei de realimentação estabiliza uma manobra de grande ângulo com quatro rodas, e quanto as rodas trabalham? (a malha de controle é verificada; a espaçonave é ilustrativa)

js-cat-aocs-slew-title = Manobra com rodas de reação

js-cat-aperture-duty-cycle-question = Quando uma mesma abertura atende à navegação e às comunicações, que interrupção isso custa? (calculado por modelo)

js-cat-aperture-duty-cycle-title = Ciclo de trabalho da abertura

js-cat-araim-gps-galileo-question = Com GPS + Galileo e a hipótese de falha em toda a constelação, qual é a disponibilidade do RAIM avançado?

js-cat-araim-gps-galileo-title = ARAIM de duas constelações

js-cat-araim-reference-check-question = Os níveis de proteção do motor coincidem com os exemplos resolvidos publicados pelo Working Group C?

js-cat-araim-reference-check-title = Verificação de referência do ARAIM

js-cat-ascent-losses-question = Quanto do ganho de velocidade ideal de um lançador de dois estágios é consumido pela gravidade, pelo arrasto, pela direção e pela contrapressão? (calculado por modelo)

js-cat-ascent-losses-title = Perdas na subida do lançamento

js-cat-attitude-budget-question = Qual é o torque perturbador no pior caso e o orçamento de erro de apontamento?

js-cat-attitude-budget-title = Orçamento de apontamento

js-cat-automotive-urban-canyon-question = Ao passar por um viaduto e por um jammer à beira da via, um carro permanece dentro de um orçamento de meia faixa? (calculado por modelo)

js-cat-automotive-urban-canyon-title = Carro em um cânion urbano

js-cat-campaign-jam-spoof-holdover-integrity-question = O que acontece com um receptor ao longo de jamming, spoofing, perda do GNSS, um alarme de integridade e a recuperação, em uma única linha do tempo? (calculado por modelo)

js-cat-campaign-jam-spoof-holdover-integrity-title = Missão encadeada: jamming, spoofing, holdover, alarme

js-cat-campaign-monte-carlo-clock-holdover-question = Ao longo de muitas execuções com semente, o erro de tempo de um relógio livre corresponde à sua dispersão em forma fechada?

js-cat-campaign-monte-carlo-clock-holdover-title = Holdover de relógio por Monte Carlo

js-cat-campaign-optimize-link-budget-question = Em função da distância e da taxa de dados, onde um enlace em banda X deixa exatamente 3 dB de margem?

js-cat-campaign-optimize-link-budget-title = Otimizar um orçamento de enlace

js-cat-campaign-shared-jammer-sea-road-question = Sob um mesmo jammer, qual plataforma perde seu fix: o navio a 30 km ou o carro a 50 km? (calculado por modelo)

js-cat-campaign-shared-jammer-sea-road-title = Um jammer, um navio e um carro

js-cat-campaign-spectrum-holdover-integrity-question = Um jammer derruba dois sinais da banda L, o relógio entra em holdover e o receptor recorre apenas ao Galileo: o monitoramento de integridade ainda se mantém? (calculado por modelo)

js-cat-campaign-spectrum-holdover-integrity-title = Missão conduzida pelo espectro

js-cat-campaign-sweep-jammer-power-question = Quando um jammer a 1 km é aumentado de 10 nW para 10 W, quando o receptor perde seu fix? (calculado por modelo)

js-cat-campaign-sweep-jammer-power-title = Varredura da potência do jammer

js-cat-cislunar-arc-recovery-question = Um estimador independente de mínimos quadrados realmente recupera o estado a partir do comprimento de arco que o teste de posto prevê? (calculado por modelo; lento: cerca de 15 s em um navegador)

js-cat-cislunar-arc-recovery-title = Recuperação de arco cislunar

js-cat-cislunar-observability-question = Que parte do estado de uma espaçonave cislunar um arco entre satélites torna observável?

js-cat-cislunar-observability-title = Observabilidade cislunar

js-cat-clock-ensemble-question = Em muitos sorteios de ruído, em que faixa de confiança cai o holdover?

js-cat-clock-ensemble-title = Conjunto de holdover de relógios

js-cat-clock-holdover-labsr-question = Como um relógio óptico de estrôncio de laboratório se compara a um relógio atômico em escala de chip em holdover?

js-cat-clock-holdover-labsr-title = Holdover de relógio, relógio óptico de laboratório

js-cat-clock-holdover-question = Por quanto tempo um relógio mantém a hora depois que o GNSS se perde?

js-cat-clock-holdover-title = Holdover de relógio

js-cat-combined-altpnt-question = O que a fusão de três canais escalares de mapa traz em relação a qualquer um deles sozinho?

js-cat-combined-altpnt-title = alt-PNT combinado

js-cat-conflict-resilience-question = Como uma arquitetura PNT em camadas se degrada sob ameaças de jamming, spoofing, cinéticas e cibernéticas? (calculado por modelo)

js-cat-conflict-resilience-title = Resiliência em conflito

js-cat-constellation-multi-gnss-coverage-question = Com os quatro sistemas globais juntos, quantos satélites estão à vista e qual é a qualidade da geometria, em toda a Terra? (calculado por modelo)

js-cat-constellation-multi-gnss-coverage-title = Quatro constelações GNSS, um mapa

js-cat-contact-schedule-question = Para três satélites e três estações em 12 horas, que passagens um plano sem conflitos mantém e quantos dados ele transfere? (calculado por modelo)

js-cat-contact-schedule-title = Plano de contatos com o solo

js-cat-domain-campaigns-label = Campanhas

js-cat-domain-campaigns-line = Missões encadeadas, varreduras e execuções de Monte Carlo em um único relógio.

js-cat-domain-constellations-label = Projeto de constelações

js-cat-domain-constellations-line = Projete uma constelação e mapeie sua cobertura e o PDOP (diluição de precisão de posição).
