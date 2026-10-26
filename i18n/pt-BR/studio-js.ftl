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

js-cat-domain-deepspace-label = Lua, espaço cislunar e Marte

js-cat-domain-deepspace-line = Navegação e tempo na Lua, no espaço cislunar e em Marte.

js-cat-domain-integrity-label = Integridade e posicionamento

js-cat-domain-integrity-line = Fixações de posição e se é possível confiar nelas: RAIM (monitoramento autônomo de integridade pelo receptor) e sua forma avançada, o ARAIM.

js-cat-domain-interference-label = Jamming e interferência

js-cat-domain-interference-line = Jammers contra receptores de navegação por satélite: o que se perde e quando.

js-cat-domain-leo-label = Navegação em órbita terrestre baixa (LEO)

js-cat-domain-leo-line = Sinais, passagens, mensagens e fixações de navegação em órbita terrestre baixa.

js-cat-domain-leo-missions-label = Missões e estudos LEO

js-cat-domain-leo-missions-line = Estudos e serviços construídos sobre uma camada em órbita terrestre baixa.

js-cat-domain-navigation-label = Navegação inercial e alternativa

js-cat-domain-navigation-line = Navegação inercial, por terreno, por gravidade e outras formas de navegação sem satélites.

js-cat-domain-orbits-label = Órbitas e geometria GNSS

js-cat-domain-orbits-line = Propagação de órbita, efemérides e a geometria dos satélites de navegação.

js-cat-domain-solar-label = Sistema solar

js-cat-domain-solar-line = Todos os planetas e luas em uma única época, com os tempos de luz.

js-cat-domain-spaceops-label = Análise de missão e operações espaciais

js-cat-domain-spaceops-line = Passagens, janelas de lançamento, reentrada e orçamentos de enlace e de atitude.

js-cat-domain-spectrum-label = Espectro

js-cat-domain-spectrum-line = Cascatas da banda de rádio: jammers, sinais e o que o receptor rastreia.

js-cat-domain-spoofing-label = Spoofing e segurança de sinal

js-cat-domain-spoofing-line = Sinais falsos e meaconing, e os monitores que os detectam.

js-cat-domain-studies-label = Quântica, estudos de compromisso e interoperabilidade

js-cat-domain-studies-line = Sensores quânticos, estudos de compromisso e formatos de interoperabilidade.

js-cat-domain-timing-label = Relógios e temporização

js-cat-domain-timing-line = Relógios sem satélites: holdover, estabilidade, máscaras de telecomunicações, transferência de tempo.

js-cat-earth-gnss-lunar-question = Um receptor perto da Lua consegue ouvir o GNSS da Terra, e isso chega a bastar para uma fixação? (modelado)

js-cat-earth-gnss-lunar-title = GNSS da Terra na Lua

js-cat-entry-heating-stardust-question = O modelo de entrada reproduz a desaceleração máxima publicada da cápsula de retorno de amostras Stardust?

js-cat-entry-heating-stardust-title = Entrada da cápsula Stardust

js-cat-eo-coverage-question = Que faixa de imageamento, que distância de amostragem no solo e que revisita uma órbita de observação da Terra oferece?

js-cat-eo-coverage-title = Cobertura de observação da Terra

js-cat-eo-radiometry-question = Para uma pequena câmera de observação da Terra, que relação sinal-ruído, MTF em Nyquist e NIIRS uma cena com 15 % de refletância oferece? (modelado)

js-cat-eo-radiometry-title = Radiometria e qualidade de imagem do imageador

js-cat-ephemeris-question = Onde está o satélite, e quando ele passa sobre o local?

js-cat-ephemeris-title = Traço no solo

js-cat-europa-surface-pnt-question = É possível posicionar um módulo de pouso em Europa, lua de Júpiter, a partir de uma pequena constelação de retransmissão e de uma medida de distância a partir da Terra? (modelado)

js-cat-europa-surface-pnt-title = Módulo de pouso em Europa

js-cat-fusion-pnt-coupled-question = Com um único filtro de Kalman empilhado sobre posição, relógio e viés do acelerômetro, como o navegador atravessa uma interrupção do GNSS? (modelado)

js-cat-fusion-pnt-coupled-title = Navegador acoplado de fusão de sensores

js-cat-fusion-pnt-question = O que um único estimador conjunto oferece sobre relógio + posição?

js-cat-fusion-pnt-title = Fusão de sensores

js-cat-gnss-ins-aviation-question = Em uma negação de GNSS de dois minutos que cobre uma curva inclinada, quanto deriva um INS fortemente acoplado de grau de navegação ou de grau tático? (modelado)

js-cat-gnss-ins-aviation-title = Curva de aeronave em uma lacuna de GNSS

js-cat-gnss-ins-maritime-question = Após uma interrupção de GNSS de cinco minutos em uma embarcação em zigue-zague, quanto deriva um INS de grau de navegação ou de grau tático? (modelado)

js-cat-gnss-ins-maritime-title = Navio em zigue-zague em uma interrupção do GNSS

js-cat-gnss-ins-question = Com que qualidade um navegador inercial auxiliado se mantém durante uma interrupção do GNSS?

js-cat-gnss-ins-rail-question = Em um corte profundo com dois satélites e depois em um túnel, quanto deriva um INS fortemente acoplado? (modelado)

js-cat-gnss-ins-rail-title = Trem em um corte e em um túnel

js-cat-gnss-ins-title = Fusão GNSS/INS

js-cat-gnss-sim-container-terminal-skyline-question = Com guindastes do lado do mar e pilhas do lado da terra, quantos satélites restam e o que acontece com a proteção do RAIM? (modelado; perfil do horizonte representativo)

js-cat-gnss-sim-container-terminal-skyline-title = Carro de pórtico em um cais de contêineres

js-cat-gnss-sim-raim-question = Como a ionosfera e a troposfera moldam as pseudodistâncias brutas, e o RAIM ainda protege?

js-cat-gnss-sim-raim-title = Medidas GNSS

js-cat-gnss-ssv-formation-heo-question = Com que qualidade um filtro conhece a posição relativa de duas espaçonaves separadas por um quilômetro, em comparação com a diferença de suas fixações absolutas? (modelado; execução registrada com o motor nativo)

js-cat-gnss-ssv-formation-heo-title = Navegação relativa em formação, órbita altamente elíptica

js-cat-gnss-ssv-heo-question = O que uma órbita altamente elíptica ouve ao longo de seu trajeto: sinais à vista, melhor C/N0, lóbulo principal contra lóbulo lateral, DOP e sinais rasantes? (modelado; execução registrada com o motor nativo)

js-cat-gnss-ssv-heo-title = Sinais GNSS em uma órbita altamente elíptica

js-cat-gnss-ssv-lunar-weak-question = O que um receptor projetado para os sinais mais fracos pode usar no caminho para a Lua? (modelado; execução registrada com o motor nativo)

js-cat-gnss-ssv-lunar-weak-title = Sinais GNSS em uma transferência lunar, receptor de sinal fraco

js-cat-gnss-ssv-nav-lunar-question = Com que qualidade um filtro de bordo mantém uma transferência lunar, em relação ao limite que ele declara? (modelado; execução registrada com o motor nativo)

js-cat-gnss-ssv-nav-lunar-title = Filtro GNSS de bordo em uma transferência lunar

js-cat-gnss-ssv-shell-question = Com que frequência uma espaçonave à altura geoestacionária ouve pelo menos um e pelo menos quatro sinais de navegação, por constelação e banda? (modelado; execução registrada com o motor nativo)

js-cat-gnss-ssv-shell-title = Sinais GNSS acima dos satélites: uma casca a 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = No campo gravitacional real EGM2008 até o grau 70, o casamento com o mapa consegue manter uma trajetória sem GPS? (modelado)

js-cat-gps-denied-gravity-nav-egm2008-title = Navegação gravitacional no campo real

js-cat-gps-denied-gravity-nav-question = Quanto a posição deriva ao longo de uma hora inteira sem GNSS, e um mapa gravitacional consegue contê-la?

js-cat-gps-denied-gravity-nav-title = Navegação sem GNSS

js-cat-gravity-map-error-mc-question = À medida que o mapa gravitacional armazenado fica mais ruidoso, com que frequência o casamento com o mapa ainda mantém uma fixação sem GPS dentro de sua meta? (modelado)

js-cat-gravity-map-error-mc-title = Monte Carlo do erro do mapa gravitacional

js-cat-gravity-map-nav-question = Um gravímetro de átomos frios consegue manter a posição sem GNSS ao casar o campo gravitacional pelo qual voa?

js-cat-gravity-map-nav-title = Navegação por mapa gravitacional

js-cat-holdover-test-example-question = Tirar a antena, pontuar o holdover: um registro dividido nos dois instantes informados pelo operador, cada degrau medido em relação às máscaras ITU-T escritas para ele. (modelado; o registro é inventado para o exemplo)

js-cat-holdover-test-example-title = Teste de holdover: um registro de erro de tempo contra as máscaras

js-cat-holdover-test-ptp4l-question = Os mesmos quatro degraus lidos de um registro de servo do ptp4l: até onde o próprio deslocamento do daemon fica das máscaras enquanto o GNSS está ausente? (modelado; o registro é inventado para o exemplo)

js-cat-holdover-test-ptp4l-title = Teste de holdover: um registro do linuxptp

js-cat-hybrid-optical-rf-question = Que continuidade e integridade a combinação de PNT óptico e de RF oferece? (modelado)

js-cat-hybrid-optical-rf-title = Híbrido óptico/RF

js-cat-hybrid-pnt-question = O que um conjunto combinado de relógio + inercial oferece?

js-cat-hybrid-pnt-title = PNT híbrido

js-cat-hybrid-ukf-question = O UKF fortemente acoplado de 17 estados é autoconsistente (NEES + brancura da inovação)? Uma verificação de autoconsistência, não uma afirmação de exatidão.

js-cat-hybrid-ukf-title = UKF híbrido de 17 estados

js-cat-impairment-eval-question = Com que qualidade um detector separa jamming / spoofing / multipercurso do nominal? (ROC/AUC modelados)

js-cat-impairment-eval-title = Avaliação de degradações de RF

js-cat-imu-deadreckoning-question = Quanto a posição deriva navegando apenas com uma IMU?

js-cat-imu-deadreckoning-title = Navegação inercial por estima

js-cat-ins-trn-coast-question = Quanto a posição deriva durante uma interrupção de navegação, e quando ela ultrapassa 10 m e 50 m? (modelado)

js-cat-ins-trn-coast-title = Navegação à deriva INS/TRN

js-cat-integrity-harbour-approach-question = Com edifícios do cais e um quebra-mar escondendo os satélites baixos, o GPS e o Galileo mantêm a proteção do ARAIM dentro dos limites de alerta? (modelado; perfil do horizonte representativo)

js-cat-integrity-harbour-approach-title = ARAIM na entrada do porto

js-cat-integrity-raim-question = A geometria atende aos limites de alerta (HPL / VPL)?

js-cat-integrity-raim-title = Integridade RAIM

js-cat-jamming-demo-question = Com que relação jammer-sinal o receptor perde o travamento?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Sob um jammer costeiro de 2 W, quantos satélites um navio mantém, e quantos o próprio cais esconde? (modelado; perfil do horizonte representativo)

js-cat-jamming-harbour-approach-skyline-title = Navio sob jamming ao entrar no porto

js-cat-l-band-waterfall-jamming-question = Como fica toda a banda L do GNSS enquanto um jammer de varredura, um de tom e um de ruído são ligados, e quais sinais cada um tira? (modelado)

js-cat-l-band-waterfall-jamming-title = Cascata da banda L sob jamming

js-cat-launch-window-question = Que azimute de lançamento e que Δv de dogleg alcançam uma inclinação-alvo a partir de um local?

js-cat-launch-window-title = Janela de lançamento

js-cat-leo-band-trade-question = O que um sinal de navegação em órbita baixa ganha e perde em cada banda, da frequência ultra alta (UHF) à banda C? (projetos representativos)

js-cat-leo-band-trade-title = Compromisso de bandas, da UHF à banda C

js-cat-leo-doppler-positioning-question = Qual a qualidade de uma fixação a partir de dez minutos de Doppler em uma constelação de navegação em órbita baixa? (modelado)

js-cat-leo-doppler-positioning-title = Posicionamento apenas por Doppler

js-cat-leo-focus-data-services-question = Quanto cada serviço de dados adicional custa em bits da mensagem de navegação? (modelado)

js-cat-leo-focus-data-services-title = Dados de serviço contra comprimento do quadro

js-cat-leo-focus-fused-pnt-sisre-question = Quão bom precisa ser o erro de distância do sinal no espaço em órbita baixa para que a camada em órbita baixa ajude uma fixação fundida? (modelado)

js-cat-leo-focus-fused-pnt-sisre-title = Fixação fundida contra erro de órbita e de relógio

js-cat-leo-focus-indoor-uhf-question = Que banda ainda alcança um usuário dentro de um edifício tradicional e de um termicamente eficiente? (modelado)

js-cat-leo-focus-indoor-uhf-title = Recepção em ambientes internos por banda e edifício

js-cat-leo-focus-iot-eirp-question = Quanta potência de transmissão do satélite uma etiqueta a bateria precisa para durar? (modelado)

js-cat-leo-focus-iot-eirp-title = Energia do rastreador contra potência de transmissão

js-cat-leo-focus-ntn-bandwidth-question = Como o erro de posicionamento diminui à medida que o sinal de referência se alarga de 180 kHz para 20 MHz? (modelado)

js-cat-leo-focus-ntn-bandwidth-title = Posicionamento por downlink 5G contra largura de banda

js-cat-leo-focus-ppp-altitude-question = Uma camada em órbita baixa mais baixa ou mais alta encurta mais a convergência? (modelado; lento, cerca de um minuto em um navegador)

js-cat-leo-focus-ppp-altitude-title = Posicionamento preciso contra altitude da camada

js-cat-leo-focus-science-iono-sounding-question = Com que qualidade a diferença de atraso entre duas bandas mede o conteúdo de elétrons abaixo de um satélite em órbita baixa? (modelado)

js-cat-leo-focus-science-iono-sounding-title = Sondagem da ionosfera a partir de duas bandas

js-cat-leo-indoor-uhf-question = Por que uma portadora UHF alcança o interior de um edifício quando as bandas L, S e C têm dificuldade? (modelado)

js-cat-leo-indoor-uhf-title = Em ambientes internos na UHF

js-cat-leo-iot-energy-question = Quanta energia uma etiqueta a bateria gasta em cada fixação de posição a partir de um sinal em órbita baixa? (modelado)

js-cat-leo-iot-energy-title = Energia por fixação para um rastreador

js-cat-leo-navmsg-encode-decode-question = O que custa a quantização de cada campo, e o quadro sobrevive à codificação, à decodificação e a um bit corrompido? (modelado)

js-cat-leo-navmsg-encode-decode-title = Mensagem de navegação: quadro binário

js-cat-leo-navmsg-fit-interval-trade-question = Por quanto tempo uma mensagem transmitida pode cobrir antes que seu erro de órbita ultrapasse a meta? (modelado; lento, cerca de 30 s em um navegador)

js-cat-leo-navmsg-fit-interval-trade-title = Mensagem de navegação: intervalo de ajuste

js-cat-leo-navmsg-midpass-update-question = Quando um satélite passa para uma nova mensagem no meio de uma passagem, o usuário vê um salto? (modelado)

js-cat-leo-navmsg-midpass-update-title = Mensagem de navegação: atualização no meio da passagem

js-cat-leo-navmsg-model-comparison-question = Qual modelo de efemérides representa melhor uma órbita baixa, e como ele se compara a uma tabela publicada? (modelado)

js-cat-leo-navmsg-model-comparison-title = Mensagem de navegação: quatro modelos

js-cat-leo-pass-iridium-question = Que intensidade de sinal e que Doppler um avião comercial vê durante uma passagem do Iridium? (modelado)

js-cat-leo-pass-iridium-title = Rajadas do Iridium vistas de uma aeronave

js-cat-leo-pass-vs-gnss-cn0-question = Como a intensidade de sinal de uma passagem em órbita baixa se compara à dos satélites Galileo à vista? (modelado)

js-cat-leo-pass-vs-gnss-cn0-title = Uma passagem contra o GNSS

js-cat-leo-pass-xona-pulsar-question = Como são os sinais X1 e X5 ao longo de uma passagem, para um navio no Golfo da Biscaia? (modelado)

js-cat-leo-pass-xona-pulsar-title = Passagem do Xona Pulsar

js-cat-leo-pnt-end-to-end-question = Do projeto do sinal à fixação final, o que cada etapa entrega à seguinte? (modelado)

js-cat-leo-pnt-end-to-end-title = Ponta a ponta, constelação genérica

js-cat-leo-pnt-mega-shell-question = Que cobertura e que geometria uma constelação de navegação de 5.000 satélites em órbita terrestre baixa oferece? (modelado; um projeto de exemplo)

js-cat-leo-pnt-mega-shell-title = Projeto de 5.000 satélites em órbita baixa

js-cat-leo-ppp-convergence-question = Quanto mais rápido o posicionamento preciso por ponto (PPP) converge quando se acrescenta uma camada em órbita baixa? (modelado; lento, cerca de 30 s em um navegador)

js-cat-leo-ppp-convergence-title = Convergência do posicionamento preciso

js-cat-leo-pvt-fjord-skyline-question = Onde as paredes do fiorde deixam uma faixa de céu ao longo do canal, quanto uma camada em órbita baixa acrescenta ao GPS e ao Galileo? (modelado; perfil do horizonte representativo)

js-cat-leo-pvt-fjord-skyline-title = Balsa no fundo de um fiorde

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Quando o GNSS sofre jamming, uma camada em órbita baixa em outras bandas consegue manter a fixação e sua integridade? (modelado)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS sob jamming, a órbita baixa continua

js-cat-leo-resilience-js-margin-question = Quanto mais jamming um sinal mais forte em órbita baixa suporta do que um sinal GNSS de órbita média? (modelado)

js-cat-leo-resilience-js-margin-title = Margem de jammer a partir da potência recebida

js-cat-leo-resilience-multiband-diversity-question = À medida que um jammer de banda L é intensificado, quais de quatro bandas continuam rastreando? (modelado)

js-cat-leo-resilience-multiband-diversity-title = Diversidade de bandas sob um jammer de barragem

js-cat-leo-resilience-spoof-doppler-question = Quando um spoofer desloca a posição calculada em 30 m, com que rapidez uma verificação de Doppler e de geometria da passagem o detecta? (modelado)

js-cat-leo-resilience-spoof-doppler-title = Spoofing detectado por Doppler

js-cat-leo-resilience-spoof-monitors-question = Que monitor enxerga que tipo de spoofer? (modelado)

js-cat-leo-resilience-spoof-monitors-title = Monitores de spoofing contra quatro spoofers

js-cat-leo-timing-utc-question = Com que precisão um receptor consegue recuperar o Tempo Universal Coordenado (UTC) a partir de satélites em órbita baixa, por oscilador e nível de sinal? (modelado)

js-cat-leo-timing-utc-title = Transferência de tempo para o UTC

js-cat-leo-vertical-5g-network-timing-question = Quando o GNSS se perde por um dia, o tempo em órbita baixa mantém uma estação-base dentro de seu limite de temporização? (modelado)

js-cat-leo-vertical-5g-network-timing-title = Temporização de estação-base 5G

js-cat-leo-vertical-asset-tracking-iot-question = Ao longo da viagem de um contêiner, quanto cada fixação de posição custa a uma etiqueta a bateria? (modelado)

js-cat-leo-vertical-asset-tracking-iot-title = Rastreamento de contêineres

js-cat-leo-vertical-autonomous-vehicle-question = Quando edifícios escondem os satélites baixos, uma camada em órbita baixa mantém um carro dentro de um erro de nível de faixa? (modelado)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Modelado como uma rua real em vez de um corte plano de 35°, uma camada em órbita baixa ainda mantém um carro dentro de um erro de nível de faixa? (modelado; perfil do horizonte representativo)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Veículo em uma rua, não em um corte plano

js-cat-leo-vertical-autonomous-vehicle-title = Veículo em um cânion urbano

js-cat-leo-vertical-critical-infrastructure-timing-question = Quando o GNSS se perde, o tempo em órbita baixa mantém a sincronização de uma subestação? (modelado)

js-cat-leo-vertical-critical-infrastructure-timing-title = Temporização de subestação

js-cat-leo-vertical-polar-arctic-question = De Tromsø ao Polo Norte, o que uma camada polar em órbita baixa acrescenta ao GNSS? (modelado)

js-cat-leo-vertical-polar-arctic-title = Viagem ao Ártico

js-cat-leo-vertical-rail-maritime-question = Quando os cenários incluídos de navio e de trem perdem o GNSS, uma passagem em órbita baixa ainda os alcança? (modelado)

js-cat-leo-vertical-rail-maritime-title = Ferrovia e navegação marítima com uma camada em órbita baixa

js-cat-link-budget-question = O enlace unidirecional fecha com margem na distância e na taxa de dados indicadas?

js-cat-link-budget-title = Orçamento de enlace

js-cat-lunanet-araim-question = Um conjunto esparso de retransmissores lunares atende aos limites de integridade para um receptor na região do Artemis?

js-cat-lunanet-araim-title = Integridade lunar

js-cat-lunar-attack-surface-question = O que é preciso para fazer spoofing ou negar o serviço a um receptor na superfície lunar, e que orçamento de autenticação responde a isso? (modelado)

js-cat-lunar-attack-surface-title = Superfície de ataque lunar

js-cat-lunar-beacon-question = Quanto um punhado de balizas de superfície levantadas topograficamente reduz o DOP no polo sul? (modelado)

js-cat-lunar-beacon-title = Balizas na superfície lunar

js-cat-lunar-differential-pnt-question = Quanto a correção diferencial cancela o erro de modo comum em relação à linha de base na Lua? (modelado)

js-cat-lunar-differential-pnt-title = PNT diferencial lunar

js-cat-lunar-frame-campaign-question = Que exatidão de datum resulta de uma campanha de observação, e não de uma transformação injetada? (modelado)

js-cat-lunar-frame-campaign-title = Campanha de referencial lunar

js-cat-lunar-frame-realisation-question = Um ajuste de datum de Helmert consegue recuperar uma transformação de referencial lunar? (modelado)

js-cat-lunar-frame-realisation-title = Referencial lunar

js-cat-lunar-infrastructure-carrier-phase-question = Uma estação de superfície e um orbitador conseguem resolver juntos as ambiguidades inteiras da fase da portadora dos sinais GNSS da Terra? A execução rápida de exemplo. (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-carrier-phase-title = Fase da portadora lunar: estação de superfície e orbitador

js-cat-lunar-infrastructure-frame-coestimation-question = Quanta informação adicional as distâncias entre orbitador e estação de superfície acrescentam aos sete parâmetros do datum lunar? (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-frame-coestimation-title = Coestimação do referencial lunar com enlaces do orbitador

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Qual a sensibilidade da telemetria a laser, do rastreamento por orbitador, de um gravímetro e de um relógio de superfície a h2, k2, l2 e à libração? (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Sensibilidade dos números de Love lunares e da libração

js-cat-lunar-infrastructure-od-consistency-model-error-question = A mesma comparação com uma pequena aceleração não modelada injetada: a verificação de consistência a percebe? (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Determinação de órbita lunar, com um erro de modelagem injetado

js-cat-lunar-infrastructure-od-consistency-question = A determinação de órbita de bordo por GNSS da Terra em uma órbita de halo lunar e a determinação de órbita radiométrica independente em solo concordam dentro de suas incertezas declaradas? (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-od-consistency-title = Determinação de órbita lunar: GNSS de bordo contra rastreamento em solo

js-cat-lunar-infrastructure-space-tie-question = Com que precisão os deslocamentos entre três técnicas podem ser amarrados, em relação ao erro da amarração local? (modelado; execução registrada com o motor nativo)

js-cat-lunar-infrastructure-space-tie-title = Amarração espacial: GNSS, VLBI e telemetria a laser em uma única espaçonave

js-cat-lunar-interop-export-question = Referencial, tempo e efemérides lunares podem fazer o percurso de ida e volta por CCSDS OEM + um envelope KIF?

js-cat-lunar-interop-export-title = Exportação de interoperabilidade lunar

js-cat-lunar-jamming-question = A que distância um jammer pode ficar e ainda negar o serviço a um receptor na superfície lunar? (modelado)

js-cat-lunar-jamming-title = Jamming lunar

js-cat-lunar-joint-od-clock-question = Uma amarração VLBI de linha de base terrestre torna observável a posição absoluta de uma estação lunar? (modelado)

js-cat-lunar-joint-od-clock-title = OD + relógio lunar conjuntos

js-cat-lunar-llr-datum-question = Como fica o datum lunar quando a campanha é de telemetria a laser lunar (LLR) real arquivada? (modelado; execução registrada com o motor nativo)

js-cat-lunar-llr-datum-title = Datum de telemetria a laser lunar

js-cat-lunar-relay-constellation-question = Que cobertura uma constelação de retransmissão e navegação em órbitas lunares congeladas e baixas oferece sobre toda a Lua? (modelado; um projeto de exemplo)

js-cat-lunar-relay-constellation-title = Constelação de retransmissão lunar

js-cat-lunar-station-coverage-public-sources-question = Apenas com as hipóteses declaradas publicamente, que erro corrigido a estação oferece sobre o polo sul? O resultado é dominado pelos elementos orbitais, que não são públicos e foram definidos como ILUSTRATIVOS; esta é a entrada da previsão congelada. (modelado; não é uma afirmação sobre nenhum sistema real)

js-cat-lunar-station-coverage-public-sources-title = Estação de referência lunar, hipóteses públicas

js-cat-lunar-station-coverage-question = Sobre a região do polo sul e ao longo de um dia, que erro corrigido uma estação de referência lunar oferece, e até que distância dela a cobertura se mantém? (modelado; não é uma afirmação sobre nenhum sistema real)

js-cat-lunar-station-coverage-terrain-question = Com o horizonte de cada local traçado por ray-marching sobre um modelo de elevação lunar real, quanta cobertura a estação perde para o terreno? (modelado)

js-cat-lunar-station-coverage-terrain-title = Estação lunar com terreno real

js-cat-lunar-station-coverage-title = Cobertura da estação de referência lunar

js-cat-lunar-station-geodesy-baseline-question = Com que qualidade os cinco arranjos de retrorrefletores de hoje fixam o datum lunar em um cronograma real, antes de qualquer estação ser acrescentada? A linha de base de um par. (modelado; execução registrada com o motor nativo)

js-cat-lunar-station-geodesy-baseline-title = Geodésia da estação lunar: os cinco arranjos sozinhos

js-cat-lunar-station-geodesy-with-station-question = O mesmo cronograma arquivado com um refletor adicional no polo sul e uma baliza VLBI: quanto o limite do datum se estreita? (modelado, local ilustrativo; execução registrada com o motor nativo)

js-cat-lunar-station-geodesy-with-station-title = Geodésia da estação lunar: com uma estação no polo sul

js-cat-lunar-station-time-lab-question = Depois que o relógio miniaturizado de rubídio de uma estação é disciplinado pela última vez ao tempo lunar, por quanto tempo ele permanece dentro de 1, 10 e 100 ns, e que termo de erro domina? (modelado)

js-cat-lunar-station-time-lab-title = Laboratório de tempo da estação lunar

js-cat-lunar-time-budget-question = Qual o tamanho do deslocamento do tempo-coordenada Terra–Lua, e qual o seu orçamento de erro? (modelado)

js-cat-lunar-time-budget-title = Orçamento de tempo lunar

js-cat-lunar-time-offset-question = Com que rapidez um relógio lunar diverge do tempo terrestre (~56–59 µs/dia)?

js-cat-lunar-time-offset-title = Deslocamento do tempo lunar

js-cat-lunar-vlbi-fim-question = Que exatidão de coordenadas de estação um dado cronograma de rastreamento VLBI de fato oferece? (modelado)

js-cat-lunar-vlbi-fim-title = Informação VLBI lunar

js-cat-lunar-vlbi-question = Que atraso um par VLBI de linha de base terrestre vê para uma baliza na superfície lunar? (modelado)

js-cat-lunar-vlbi-title = VLBI lunar

js-cat-maritime-port-approach-coast-question = Ao entrar no porto sem GNSS, quando um INS de grau de navegação sai dos orçamentos do porto e do oceano? (modelado)

js-cat-maritime-port-approach-coast-title = Aproximação do porto por navegação inercial

js-cat-maritime-spoof-position-push-question = Quando um spoofer arrasta a fixação de um navio em 500 m, que camadas de detecção o apanham? (modelado)

js-cat-maritime-spoof-position-push-title = Posição de navio sob spoofing

js-cat-maritime-strait-jamming-question = Em 30 km de mar aberto, um jammer de 50 W tira o GNSS de uma embarcação? (modelado)

js-cat-maritime-strait-jamming-title = Navio sob jamming em um estreito

js-cat-mars-orbit-pnt-question = Com que qualidade um orbitador baixo de Marte é posicionado a partir de doze retransmissores de navegação, e o que uma medida de distância a partir da Terra acrescenta? (modelado)

js-cat-mars-orbit-pnt-title = Orbitador de Marte com retransmissores e um enlace com a Terra

js-cat-mars-pnt-lmo-question = Uma constelação de retransmissão MARCONI consegue navegar um usuário em Marte? (FoM de covariância, não um PL certificado)

js-cat-mars-pnt-lmo-title = PNT em Marte, órbita baixa

js-cat-mars-pnt-surface-question = Com que qualidade um módulo de pouso ou um veículo explorador na superfície giratória de Marte pode ser navegado em relação à constelação de retransmissão?

js-cat-mars-pnt-surface-title = PNT em Marte, superfície

js-cat-mars-pnt-transfer-question = Com que qualidade um veículo em um arco de aproximação ou de captura alto e excêntrico é navegado em Marte?

js-cat-mars-pnt-transfer-title = PNT em Marte, transferência

js-cat-meo-leo-fused-pvt-question = O que acrescentar uma camada em órbita baixa ao GPS e ao Galileo faz com o erro de posição e a geometria? (modelado)

js-cat-meo-leo-fused-pvt-title = Fixação fundida de GNSS e órbita baixa

js-cat-moonlight-service-volume-question = Que DOP, cobertura e integridade uma constelação da classe Moonlight/LCNS oferece ao polo sul? (modelado)

js-cat-moonlight-service-volume-title = Volume de serviço lunar

js-cat-multi-band-jamming-waterfall-question = Com sinais de navegação distribuídos em quatro bandas, o que um jammer construído para uma banda deixa de pé? (modelado)

js-cat-multi-band-jamming-waterfall-title = Cascata de jamming multibanda

js-cat-notinbrowser-elevation-model = Requer o recorte do modelo de elevação lunar ({ $path }) que vem com o repositório, e não com a versão para navegador.

js-cat-notinbrowser-laser-ranging-data = Requer o recorte arquivado dos dados de telemetria a laser que vem com o repositório, e não com a versão para navegador.

js-cat-notinbrowser-study-suite = Um conjunto de estudos, não um cenário único. Execute-o com a ferramenta de linha de comando: { $command }.

js-cat-ntn-5g-positioning-question = Com que precisão um aparelho pode se posicionar a partir de um downlink de rede não terrestre 5G, por largura de banda do sinal? (modelado)

js-cat-ntn-5g-positioning-title = Posicionamento por downlink de satélite 5G

js-cat-oem-interop-question = Uma efeméride OEM do GMAT / Orekit / STK pode ser importada e fazer o percurso de ida e volta?

js-cat-oem-interop-title = Ponte CCSDS OEM

js-cat-optical-atmosphere-network-question = Com que frequência um enlace óptico de temporização funciona através de nuvens e turbulência, e o que sítios terrestres adicionais oferecem? (modelado; climas de nuvens ilustrativos)

js-cat-optical-atmosphere-network-title = Enlace óptico através da atmosfera, três sítios

js-cat-optical-atmosphere-techniques-question = O que uma abertura maior, outro comprimento de onda ou óptica adaptativa oferecem a um enlace óptico de subida em nuvem e turbulência? (modelado; clima de nuvens ilustrativo)

js-cat-optical-atmosphere-techniques-title = Técnicas de enlace óptico

js-cat-orbit-gnss-challenged-question = Quando uma fixação é sequer possível a partir da geometria dos satélites?

js-cat-orbit-gnss-challenged-title = Disponibilidade do GNSS

js-cat-orbit-molniya-question = Um usuário em órbita Molniya, muito excêntrica, ainda vê satélites GNSS suficientes perto do apogeu?

js-cat-orbit-molniya-title = Usuário em órbita Molniya

js-cat-orbit-multignss-question = Quanto o GPS + Galileo juntos elevam a disponibilidade e reduzem a diluição de precisão?

js-cat-orbit-multignss-title = Disponibilidade multi-GNSS

js-cat-orbit-real-tle-question = Que cobertura uma constelação real, dada como conjuntos de elementos de duas linhas, oferece?

js-cat-orbit-real-tle-title = Elementos de duas linhas reais

js-cat-orbit-rinex-question = Que disponibilidade resulta de uma efeméride de transmissão RINEX 3 real?

js-cat-orbit-rinex-title = Efeméride de transmissão

js-cat-orbit-sgp4-gps-question = Como uma constelação real do tipo GPS se propaga ao longo de um dia?

js-cat-orbit-sgp4-gps-title = Órbitas SGP4

js-cat-orbit-urban-canyon-skyline-question = No fundo de uma rua da cidade, durante quanto do dia o GPS e o Galileo fornecem quatro satélites, e o que a faixa de céu faz com o PDOP? (modelado; perfil do horizonte representativo)

js-cat-orbit-urban-canyon-skyline-title = Disponibilidade em uma rua da cidade

js-cat-passes-question = Quando um satélite nasce e se põe sobre uma estação, e por quanto tempo?

js-cat-passes-title = Passagens sobre o solo

js-cat-polar-arctic-leo-coverage-question = Do equador ao polo, como mudam os satélites à vista e a geometria só com GNSS, só com uma camada polar em órbita baixa e com ambos? (modelado)

js-cat-polar-arctic-leo-coverage-title = Do equador ao polo

js-cat-pvt-abmf-question = A posição de um receptor real pode ser resolvida a partir de medidas RINEX brutas?

js-cat-pvt-abmf-title = Posicionamento (SPP)

js-cat-quantum-anomaly-detect-question = Com que qualidade as falhas de sistemas quânticos são detectadas a uma taxa de falso alarme fixa? (modelado)

js-cat-quantum-anomaly-detect-title = Detecção de anomalias quânticas

js-cat-quantum-cai-coast-question = Por quanto tempo um interferômetro de átomos frios, especificado por sua física, mantém a navegação por estima dentro de 100 m após a perda do GNSS, em comparação com um acelerômetro de quartzo de grau de navegação? (modelado)

js-cat-quantum-cai-coast-title = Navegação à deriva com acelerômetro quântico

js-cat-quantum-gnss-free-nav-question = Até onde um navegador de átomos frios segue à deriva em comparação com um INS de grau de navegação, sem GNSS? (modelado)

js-cat-quantum-gnss-free-nav-title = Navegação quântica sem GNSS

js-cat-quantum-pnt-demonstrator-suite-question = As três áreas de aplicação quântica como um único estudo (um conjunto de estudos de linha de comando: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Estudo demonstrador de PNT quântico

js-cat-quantum-time-transfer-question = O que a temporização quântica confiável oferece em relação a uma cadeia clássica de CSAC + RF? (modelado)

js-cat-quantum-time-transfer-title = Transferência de tempo quântica

js-cat-quantum-trade-question = Que holdover de temporização / inercial um relógio candidato oferece em relação a uma linha de base clássica? (modelado)

js-cat-quantum-trade-title = Estudo de compromisso de PNT quântico

js-cat-rail-tunnel-coast-question = A 160 km/h em um túnel, em quanto tempo um INS de grau tático sai de seu orçamento? (modelado)

js-cat-rail-tunnel-coast-title = Trem em um túnel

js-cat-realtime-frame-eop-question = Quanto erro de referencial a orientação da Terra em tempo real (predita) introduz? (modelado)

js-cat-realtime-frame-eop-title = Referencial/EOP em tempo real

js-cat-reentry-question = Que pico de g e que velocidade de pico de aquecimento uma reentrada balística enfrenta?

js-cat-reentry-title = Corredor de reentrada

js-cat-slot-timing-ocxo-leo-question = Por quanto tempo um oscilador a cristal com controle de forno em um pequeno satélite em órbita baixa permanece dentro de sua guarda de slot após a última fixação GNSS? (modelado)

js-cat-slot-timing-ocxo-leo-title = Temporização de slot

js-cat-small-uas-jammed-nav-question = Depois que um jammer tira o GNSS, quanto deriva uma unidade inercial da classe de controlador de voo, em comparação com uma de grau tático?

js-cat-small-uas-jammed-nav-title = Drone pequeno sob jamming

js-cat-solar-system-tour-question = Onde está cada corpo que o motor conhece, do Sol a Plutão e às grandes luas, e quanto tempo a luz leva entre eles?

js-cat-solar-system-tour-title = Sistema solar em uma única época

js-cat-space-packet-question = Um fluxo de pacotes CCSDS 133.0 é codificado e decodificado bit a bit de forma exata?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Como a atividade solar / geomagnética altera a densidade termosférica? (modelado)

js-cat-space-weather-title = Clima espacial

js-cat-spoof-attack-question = Um spoofing de tempo em rampa é detectado antes de atingir a especificação?

js-cat-spoof-attack-title = Detecção de spoofing

js-cat-spoof-detect-question = Um monitor fundido de RF + medidas consegue detectar um spoofing coordenado?

js-cat-spoof-detect-title = Detecção de spoofing em várias camadas

js-cat-spoof-meaconing-question = Com uma forma de ataque explícita, com que frequência um detector de energia auxiliado pelo relógio detecta o spoofing a uma taxa de falso alarme fixa?

js-cat-spoof-meaconing-title = Estatísticas do detector de spoofing

js-cat-starlink-sop-doppler-positioning-question = Com que qualidade um receptor consegue se posicionar a partir do Doppler de uma constelação de banda larga que não envia mensagem de navegação? (modelado)

js-cat-starlink-sop-doppler-positioning-title = Sinais de oportunidade de banda larga

js-cat-sweep-clock-stability-question = Como o holdover muda quando um parâmetro do relógio é varrido?

js-cat-sweep-clock-stability-title = Varredura de parâmetro

js-cat-sweep-nd-inertial-question = Como uma figura de mérito varia em uma grade de vários parâmetros?

js-cat-sweep-nd-inertial-title = Varredura N-D

js-cat-telecom-prtc-holdover-24h-question = Uma referência de rubídio que perde o GNSS por 24 horas permanece dentro das máscaras de erro de tempo da ITU-T? (modelado)

js-cat-telecom-prtc-holdover-24h-title = Holdover de telecomunicações, 24 h

js-cat-telecom-synce-eec-question = Um oscilador com controle de forno em operação livre permanece dentro das máscaras de wander do relógio de equipamento do Ethernet síncrono? (modelado)

js-cat-telecom-synce-eec-title = Sincronização de frequência contra as máscaras do SyncE

js-cat-telecom-tie-ingest-question = Um registro de erro de intervalo de tempo passa nas máscaras MTIE e TDEV da ITU-T?

js-cat-telecom-tie-ingest-title = Verificação de máscaras de telecomunicações, seus dados

js-cat-terrain-nav-question = Um altímetro consegue corrigir a deriva do INS casando um perfil de elevação do terreno?

js-cat-terrain-nav-title = Navegação por terreno

js-cat-terrain-slam-question = Um filtro de partículas consegue acompanhar uma deriva do INS variável no tempo em relação a um mapa de terreno?

js-cat-terrain-slam-title = SLAM por terreno

js-cat-time-transfer-budget-question = O que os termos de estação, transponder, ionosfera e Sagnac fazem com um deslocamento de tempo bidirecional, e qual é o seu orçamento de incerteza? (modelado)

js-cat-time-transfer-budget-title = Transferência de tempo bidirecional por satélite

js-cat-timetransfer-question = Com que firmeza dois locais conseguem se manter sincronizados por um enlace?

js-cat-timetransfer-title = Transferência de tempo

js-cat-tracking-loop-question = Em que C/N0 um receptor de fato perde o travamento, e um spoofer consegue arrastar as malhas? (modelado)

js-cat-tracking-loop-title = Malha de rastreamento

js-cat-xona-pulsar-end-to-end-question = A mesma cadeia com números públicos do Xona Pulsar: sinal, passagem, mensagem, fixação fundida e posicionamento preciso. (modelado)

js-cat-xona-pulsar-end-to-end-title = Ponta a ponta, Xona Pulsar

js-cat-xona-pulsar-signals-question = Com que precisão um receptor consegue medir distância nos sinais X1 e X5 publicados, e qual o tamanho da busca de aquisição? (tabela pública de sinais)

js-cat-xona-pulsar-signals-title = Sinais do Xona Pulsar

js-geo-a-place = Um lugar…

js-geo-axis-east = L +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = A forma de cânion de rua requer o motor 0.36.

js-geo-canyon-out-of-range = Os valores do cânion de rua estão fora do intervalo (azimute de 0 a 359,9°, largura de 1 a 200 m, alturas de 0 a 500 m, antena de 0 a 50 m); é usado um horizonte aberto.

js-geo-canyon-reduced = A redução do cânion a uma tabela de 360 intervalos feita pelo motor.

js-geo-compute-failed = O motor não conseguiu calcular este céu: { $reason }

js-geo-computing = Calculando…

js-geo-copy-link = Copie este link: { $url }

js-geo-count-below = Abaixo do horizonte

js-geo-count-hidden = Ocultos pelo perfil do horizonte

js-geo-count-in-view = À vista

js-geo-count-open-sky = Céu aberto

js-geo-count-used = Na solução

js-geo-cursor-live = Azimute { $az }°, perfil do horizonte { $el }°.

js-geo-dated-sky = Um céu datado, tão bom quanto os elementos e a idade deles; as predefinições ficam de fora.

js-geo-dop-geometric = geométrico

js-geo-dop-geometric-title = diluição geométrica da precisão

js-geo-dop-horizontal = horizontal

js-geo-dop-horizontal-title = diluição horizontal da precisão

js-geo-dop-position = posição, 3D

js-geo-dop-position-title = diluição da precisão da posição, 3D

js-geo-dop-time = tempo

js-geo-dop-time-title = diluição da precisão do tempo

js-geo-dop-vertical = vertical

js-geo-dop-vertical-title = diluição vertical da precisão

js-geo-east = L

js-geo-engine-not-running = O motor não está em execução neste navegador ({ $reason }).

js-geo-err-geometry-object = a resposta de geometria do motor não é um objeto

js-geo-err-mc-object = a resposta de Monte Carlo do motor não é um objeto

js-geo-err-no-sentences = a resposta do motor não tem sentenças

js-geo-err-reply-kind-not-json = a resposta de { $what } do motor não era JSON

js-geo-err-reply-not-json = a resposta do motor não era JSON

js-geo-error-line = Com σ_UERE = { $uere } m, sob o modelo de erro declarado (valores do motor): { $bits }.

js-geo-error-line-needs = Erro de posição ≈ σ_UERE × HDOP na horizontal e σ_UERE × VDOP na vertical; o valor requer o motor 0.36.

js-geo-error-rms-3d = RMS 3D σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = RMS horizontal σ_UERE × HDOP = { $m } m

js-geo-error-sigma = erro de 1 sigma leste { $east } m, norte { $north } m

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

js-geo-gj-too-many = { $name }: { $count } feições; esta página desenha no máximo { $max }.

js-geo-legend-item = { $label }: { $used } na solução de { $total }

js-geo-link-copied = Link copiado.

js-geo-link-copied-no-tle = Link copiado (sem os seus elementos colados: um link abre as predefinições).

js-geo-mc-off = Desligado

js-geo-missing-ellipse = a elipse de erro

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = a nuvem de Monte Carlo

js-geo-missing-open-sky = a fração de céu aberto

js-geo-missing-skyline = o perfil do horizonte

js-geo-missing-tdop = TDOP

js-geo-needs = requer o motor 0.36

js-geo-needs-cap = Requer o motor 0.36

js-geo-no = Não

js-geo-no-ellipse = Sem elipse

js-geo-no-sats = Não há satélites para mostrar.

js-geo-north = N

js-geo-not-given = não informado

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } conjunto de elementos foi ignorado: { $list }.
        [many] { $count } de conjuntos de elementos foram ignorados: { $list }.
       *[other] { $count } conjuntos de elementos foram ignorados: { $list }.
    }

js-geo-note-latitude-limited = Esta versão do motor modela locais a até 89° do equador; a latitude foi limitada a isso.

js-geo-note-leo-left-out = LEO: requer o motor 0.36; deixado de fora.

js-geo-note-no-engine = O motor não está em execução neste navegador, então não há nada para mostrar. Ele roda como WebAssembly; um navegador ou host que bloqueia WebAssembly não consegue executar esta visualização.

js-geo-note-pick-one = Escolha pelo menos um entre GPS, Galileo e BeiDou.

js-geo-note-skyline-not-applied = O perfil do horizonte é desenhado, mas não aplicado: aplicá-lo requer o motor 0.36. Os satélites atrás dele ainda contam aqui.

js-geo-note-skyline-source = Perfil do horizonte: { $source }.

js-geo-note-training-model = Modelo de céu de treinamento do motor { $version } (nmea_training) em { $instant }: ângulos em graus inteiros e DOPs com uma casa decimal, como as sentenças de receptor os trazem; a fixação usa no máximo 12 satélites, escolhidos pela intensidade do sinal.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } registro de satélite de um sistema que esta visualização não desenha foi deixado de fora.
        [many] { $count } de registros de satélite de um sistema que esta visualização não desenha foram deixados de fora.
       *[other] { $count } registros de satélite de um sistema que esta visualização não desenha foram deixados de fora.
    }

js-geo-off-leo = LEO: requer o motor 0.36.

js-geo-off-monte-carlo = A nuvem de Monte Carlo requer o motor 0.36.

js-geo-off-skyline = Aplicar um perfil do horizonte requer o motor 0.36: aqui ele é apenas desenhado.

js-geo-offset-own = Deslocamento a partir da época dos seus elementos ({ $epoch })

js-geo-offset-ref = Deslocamento a partir da época de referência das constelações

js-geo-open-sky-share = { $pct } % do hemisfério superior

js-geo-out-of-range = Fora do intervalo, por isso mantido no último valor válido: { $names }.

js-geo-own-elements-at = Seus próprios elementos em { $epoch }.

js-geo-pick-constellation = Escolha pelo menos uma constelação.

js-geo-place-geiranger = Geirangerfjord, Noruega

js-geo-place-manhattan = Centro de Manhattan, Estados Unidos

js-geo-place-oslo = Porto de Oslo, Noruega

js-geo-place-rotterdam = Porto de Roterdã, Países Baixos

js-geo-place-singapore = Estreito de Singapura

js-geo-place-tallinn = Porto de Tallinn, Estônia

js-geo-place-tromso = Tromsø, Noruega

js-geo-plot-desc = { $total } satélites no gráfico, { $used } na solução.

js-geo-preset-illustrative = Contorno ilustrativo desenhado por esta página; aplicar um perfil do horizonte requer o motor 0.36.

js-geo-ready = Pronto.

js-geo-ready-needs = Pronto. Requer o motor 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: azimute { $az }°, elevação { $el }°, oculto pelo perfil do horizonte

js-geo-sat-unused = { $label } { $id }: azimute { $az }°, elevação { $el }°, não usado

js-geo-sat-used = { $label } { $id }: azimute { $az }°, elevação { $el }°, na solução

js-geo-scenarios-under = Os cenários do motor sob este perfil do horizonte:

js-geo-sky-canyon = Cânion de rua

js-geo-sky-drawn = Desenhado no skyplot

js-geo-sky-open = Horizonte aberto

js-geo-sky-preset = Predefinição: { $name }

js-geo-sky-source = Céu: { $source }.

js-geo-skyline-city-street = Rua da cidade

js-geo-skyline-container = Terminal de contêineres

js-geo-skyline-fjord = Fiorde

js-geo-skyline-harbour = Aproximação do porto

js-geo-skyline-load-failed = Não foi possível carregar o perfil do horizonte ({ $reason }).

js-geo-skyplot-downloaded = Skyplot baixado.

js-geo-skyplot-export-failed = Não foi possível exportar o skyplot ({ $reason }).

js-geo-source-geometry = Motor { -brand } { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Motor { -brand } { $version }, modelo de céu de treinamento

js-geo-south = S

js-geo-style-own-elements = Seus elementos

js-geo-svg-refused = o SVG do motor foi recusado

js-geo-table-count =
    { $n ->
        [one] { $n } satélite, o mesmo do skyplot.
        [many] { $n } de satélites, os mesmos do skyplot.
       *[other] { $n } satélites, os mesmos do skyplot.
    }

js-geo-tle-epoch = Informe uma época UTC de 2000 a 2099.

js-geo-tle-paste-first = Cole primeiro um ou mais conjuntos de elementos de duas linhas.

js-geo-tle-too-large = Os elementos colados são maiores que 4 MiB, o limite de entrada do motor.

js-geo-used-masked = Não: oculto pelo perfil do horizonte

js-geo-using-own = Usando seus próprios elementos. Um link informa apenas que você os usou, não os elementos em si.

js-geo-wasm-blocked = O WebAssembly está bloqueado

js-geo-west = O

js-geo-why = Por quê

js-geo-why-interim = A elipse de erro e a nuvem de Monte Carlo requerem o motor 0.36 (suas funções sky_geometry e sky_monte_carlo); o motor desta página é mais antigo.

js-geo-why-no-ellipse = O motor não forneceu elipse para esta geometria (satélites insuficientes para uma fixação, ou uma geometria singular).

js-geo-why-no-ellipse-reason = O motor não forneceu elipse para esta geometria (satélites insuficientes para uma fixação, ou uma geometria singular): { $reason }.

js-geo-why-waiting = Aguardando o motor.

js-geo-yes = Sim

js-hold-axis-seconds = segundos desde a primeira amostra

js-hold-axis-tau = tempo de observação τ, s (log)

js-hold-axis-te = erro de tempo, ns

js-hold-band-title = Faixa de recuperação ±{ $band } ns

js-hold-blurb-example = Amostras a cada 5 s: 600 s travado, GNSS removido aos 600 s, holdover, GNSS restabelecido aos 2400 s. O registro é gerado para o exemplo; não é uma medição.

js-hold-blurb-ptp4l = Os mesmos quatro degraus lidos de um registro de servo do ptp4l (o próprio deslocamento do daemon, em ns). O registro é escrito para o exemplo; nenhum daemon foi executado.

js-hold-budget-exceeded = { $name } excedido pela primeira vez { $s } s após a remoção

js-hold-chip-baseline = Linha de base contra suas máscaras

js-hold-chip-envelope = Envelope de holdover ePRTC-A

js-hold-chip-holdover = Holdover contra suas máscaras

js-hold-chip-measured = medido em relação à máscara

js-hold-chip-recovery = Recuperação

js-hold-chip-words = Palavras

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } contra o tempo de observação, com os limites das máscaras

js-hold-envelope-exceeded = Envelope de holdover ePRTC-A excedido pela primeira vez { $s } s após a remoção

js-hold-envelope-exceeded-short = { $verdict }, excedido pela primeira vez { $s } s após a remoção (o registro é mais curto que o período do envelope)

js-hold-envelope-exceeded-value = { $verdict }, excedido pela primeira vez { $s } s após a remoção

js-hold-envelope-short = { $verdict } (o registro é mais curto que o período do envelope)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: não é JSON.

js-hold-file-read-here = { $name }, lido aqui; nada foi enviado.

js-hold-file-too-large = { $name } é maior do que esta página lê.

js-hold-from-record = o registro do resultado

js-hold-from-record-decimated = o registro do resultado, decimado para { $have } de { $total } amostras

js-hold-gnss-removed = GNSS removido

js-hold-gnss-removed-stated = GNSS removido (informado pelo operador)

js-hold-gnss-restored = GNSS restabelecido

js-hold-gnss-restored-stated = GNSS restabelecido (informado pelo operador)

js-hold-largest-at = { $value } em T+{ $time } s

js-hold-limit-label = máscara de ±{ $ns } ns, degrau { $step }

js-hold-limit-title = { $id }: ±{ $ns } ns, o erro de tempo absoluto máximo no degrau { $step }

js-hold-mark-title = { $id } limite { $limit } ns em τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n/d

js-hold-no-curve = Sem curva de erro de tempo: o registro não pôde ser reproduzido para o desenho.

js-hold-no-which-curve = Não há curva de { $which } neste resultado.

js-hold-not-exceeded = não excedido

js-hold-not-recovered = não permaneceu dentro da faixa

js-hold-not-result = este não é um resultado de teste de holdover

js-hold-open-failed = Não foi possível abrir { $title }: { $reason }.

js-hold-opening = Abrindo { $title }…

js-hold-phase-baseline = Linha de base: travado

js-hold-phase-holdover = Holdover: GNSS removido

js-hold-phase-recovery = Recuperação: GNSS restabelecido

js-hold-phase-title = { $phase }, T+{ $from } s a { $to } s

js-hold-read-failed = Não foi possível ler ou desenhar ({ $reason }).

js-hold-recorded = { $title }: o resultado registrado do motor (versão { $version }).

js-hold-recovered = dentro de ±{ $band } ns por { $dwell } s, { $after } s depois do retorno do GNSS

js-hold-result-not-json = o resultado não é JSON ({ $reason })

js-hold-result-not-loaded = o resultado registrado não foi carregado

js-hold-row-envelope = Envelope de holdover ePRTC-A

js-hold-row-frequency = Deslocamento de frequência mantido (inclinação ajustada)

js-hold-row-largest = Maior erro de tempo absoluto

js-hold-row-length = Duração do holdover

js-hold-row-margin = Menor margem dentro do envelope

js-hold-row-peak = Pico após o restabelecimento

js-hold-row-recovery = Recuperação

js-hold-row-recovery-step = Maior degrau durante a recuperação

js-hold-row-residual = Resíduo em torno dessa reta (rms)

js-hold-row-step = Degrau no momento da remoção

js-hold-status-final = { $status } { $label }; medido em relação à máscara.

js-hold-step-span = T+{ $from } a { $to } s

js-hold-te-aria = Erro de tempo ao longo do registro, com as fases e os limites das máscaras

js-hold-te-line-title = Erro de tempo, ns

js-hold-te-note = Erro de tempo a partir de { $from }. Os dois instantes foram informados por { $by }.

js-hold-th-budget = Orçamento

js-hold-th-budget-limit = Limite |TE|, ns

js-hold-th-first-exceeded = Primeiro excesso após a remoção, s

js-hold-th-largest = Maior |TE|, ns

js-hold-th-limit = Limite, ns

js-hold-th-margin = Margem, ns

js-hold-th-mask = Máscara

js-hold-th-mean = Média, ns

js-hold-th-measured-on = Medido sobre

js-hold-th-metric = Métrica

js-hold-th-rms = RMS, ns

js-hold-th-samples = Amostras

js-hold-th-source = Fonte

js-hold-th-span = Intervalo

js-hold-th-step = Degrau

js-hold-th-value = Valor, ns

js-hold-th-verdict = Veredito

js-hold-th-worst-at = Pior em τ ou T+, s

js-hold-title-example = Um registro de erro de tempo

js-hold-title-ptp4l = Um registro do linuxptp

js-hold-why-no-samples = o resultado não traz amostras de erro de tempo (record.series), por isso nenhuma curva é desenhada

js-hold-why-not-series = a série do resultado não é uma série temporal (menos de duas amostras, ou tempo não crescente), por isso nenhuma curva é desenhada

js-hold-why-sentence = { $why }.

js-hold-why-too-many = a série do resultado tem { $have } amostras onde o motor pontuou { $scored }, por isso nenhuma curva é desenhada

js-interf-attribution = Atribuição

js-interf-build-failed = { $name }: não foi possível construir ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Construído { $n } mapa diário a partir de { $name } com o motor { $version }, neste navegador.
        [many] Construídos { $n } de mapas diários a partir de { $name } com o motor { $version }, neste navegador.
       *[other] Construídos { $n } mapas diários a partir de { $name } com o motor { $version }, neste navegador.
    }

js-interf-built-detail = { $date }: { $published } células publicadas, { $flagged } sinalizadas

js-interf-built-from-sample = Construído a partir da amostra sintética de { $kind } com o motor, neste navegador. Relatos inventados; nenhuma aeronave, embarcação ou dia reais.

js-interf-built-maps =
    { $n ->
        [one] Construído { $n } mapa ({ $detail }). Apenas agregado: uma célula sinalizada não aponta a interferência como causa.
        [many] Construídos { $n } de mapas ({ $detail }). Apenas agregado: uma célula sinalizada não aponta a interferência como causa.
       *[other] Construídos { $n } mapas ({ $detail }). Apenas agregado: uma célula sinalizada não aponta a interferência como causa.
    }

js-interf-built-none = { $name }: o motor não construiu nenhum mapa.

js-interf-caveat-coverage = A cobertura segue a fonte de dados; leia as notas de cobertura.

js-interf-caveat-no-colour = Uma célula sem cor não foi observada. Isso não é evidência de que a área estava livre.

js-interf-caveat-not-finding = Uma célula degradada ou anômala não é uma constatação de interferência. Existem outras causas.

js-interf-caveat-past-reports = Isto é uma descrição de relatos de posição passados, não uma previsão nem uma medição de qualquer receptor.

js-interf-caveats = Ressalvas

js-interf-cell-size-rule = O tamanho da célula deve ser um número de graus maior que 0 e no máximo 10, ou vazio para 0,5.

js-interf-check-failed = { $name }: não foi possível verificar ({ $reason }).

js-interf-click-cell = Clique em uma célula, ou foque o mapa e use as teclas de seta, para ver seus valores.

js-interf-close = Fechar

js-interf-close-file = Fechar { $name }

js-interf-col-affected = Afetadas

js-interf-col-cell-area = Área da célula

js-interf-col-detectors = Detectores

js-interf-col-observed = Observadas

js-interf-col-sampled = Amostradas

js-interf-col-share = Proporção

js-interf-col-status = Estado

js-interf-coverage-limits = Limites de cobertura desta fonte

js-interf-csv-too-big = { $name }: maior que 24 MiB; construa a partir de um trecho (a ferramenta de linha de comando aceita um arquivo inteiro).

js-interf-csv-too-big-short = { $name }: maior que 24 MiB; construa a partir de um trecho.

js-interf-custom-needs-licence = Um conjunto de dados personalizado requer a licença, o URL dela e o texto de atribuição: eles são gravados no arquivo do mapa.

js-interf-dataset = Conjunto de dados

js-interf-dates-rule = As datas são AAAA-MM-DD, ou vazio para nenhum limite.

js-interf-day = Dia

js-interf-day-aria = Dia de { $kind }

js-interf-day-confounded-note = Este dia é confundido: nenhuma célula foi classificada como degradada por causa do fundo do dia. As células que de outro modo teriam se destacado são mostradas como não avaliadas.

js-interf-day-figures-aria = Valores do dia

js-interf-demo-csv-name = { $file } (amostra sintética)

js-interf-demo-failed = Não foi possível abrir a demonstração: { $reason }.

js-interf-demo-opened = Demonstração sintética: três arquivos inventados sobre uma região inventada de oceano aberto (dois dias de ADS-B, um deles confundido, e um dia de AIS). Nenhuma aeronave, embarcação ou dia reais estão por trás deles. Use o seletor de dia na camada ADS-B.

js-interf-demo-route-name = route.csv (sintético)

js-interf-describe-map = Mapa de { $kind } para { $date }: { $cells } células desenhadas, { $parts }. As células não desenhadas não foram observadas.

js-interf-did-not-load = { $url } não foi carregado

js-interf-engine-no-fn = Esta versão do motor (versão { $version }) não tem { $fn }; ela é anterior a esta página. O equivalente de linha de comando está na página Ferramentas.

js-interf-engine-start-failed = O motor não pôde iniciar aqui ({ $reason }). Abrir arquivos de mapa acima continua funcionando.

js-interf-err-format-version = { $name }: não é um mapa de interferência do { -brand } com suporte (format_version { $version }; esta página oferece suporte a { $supported }).

js-interf-err-no-rows = { $name }: não há rows[] neste relatório.

js-interf-err-not-json = { $name }: não é JSON ({ $reason }).

js-interf-err-not-map = { $name }: isto é GeoJSON, mas não um mapa de interferência do { -brand } (sem o membro kshana_interference_map).

js-interf-err-not-route = { $name }: não é um relatório de exposição de rota do { -brand } (sem o membro kshana_route_exposure).

js-interf-err-route-schema = { $name }: o esquema { $schema } não é { $expected }, que esta página lê.

js-interf-err-source-kind = { $name }: source_kind { $kind } não é nem adsb nem ais.

js-interf-err-unknown-schema = { $name }: esquema desconhecido { $schema }; esta página lê { $supported }.

js-interf-foot-attribution = Atribuição: { $text }

js-interf-foot-coverage = Cobertura: { $notes }

js-interf-foot-layer = Camada de { $kind }, { $date }. As células não desenhadas não foram observadas.

js-interf-foot-licence = Licença: { $licence }

js-interf-foot-licence-url = Licença: { $licence } ({ $url })

js-interf-grid = Grade: células quadradas de { $size }° em latitude e longitude ({ $type }). A largura leste-oeste diminui com a latitude.

js-interf-guards = Salvaguardas contra outras causas

js-interf-input = Entrada

js-interf-land-set = Polígonos de terra: { $name }.

js-interf-land-too-big = Esse arquivo de terra é maior que 24 MiB.

js-interf-larger-than = { $name }: maior que { $limit }; esta página lê arquivos de mapa até esse tamanho.

js-interf-layer-adsb-sub = células em que aeronaves informaram baixa exatidão de navegação

js-interf-layer-ais-sub = células em que embarcações informaram posições ou movimentos implausíveis

js-interf-layer-heading = Camada de { $kind }

js-interf-layer-hidden = A camada de { $kind } está oculta.

js-interf-layers-separate = ADS-B e AIS são camadas separadas, com seus próprios controles, legendas e linhas de licença. Elas nunca são fundidas em um único campo de cor nem em uma única contagem.

js-interf-legend-aria = O que cada estado de célula significa; desmarque um para esmaecer essas células

js-interf-licence = Licença

js-interf-licence-aria = Licença de dados de { $name }

js-interf-licence-heading = Licença de dados e atribuição

js-interf-map-aria = { $summary } As teclas de seta se movem entre as células desenhadas.

js-interf-maps-open =
    { $n ->
        [one] { $n } mapa aberto.
        [many] { $n } de mapas abertos.
       *[other] { $n } mapas abertos.
    }

js-interf-method-summary = Método e ressalvas

js-interf-no-cell-at = Nenhuma célula em { $lat }, { $lon }: não observada. Isso não é evidência de que a área estava livre.

js-interf-no-cell-drawn = nenhuma célula desenhada

js-interf-no-cells-draw = Este arquivo não tem células para desenhar.

js-interf-no-day-figures = Este arquivo não informa valores no nível do dia.

js-interf-no-file-opened = Nenhum arquivo pôde ser aberto.

js-interf-no-file-text = Os mapas abertos não trazem texto de arquivo para verificar (eles não foram abertos como arquivos).

js-interf-none = nenhum

js-interf-none-stated = (nenhum informado)

js-interf-none-stated-file = (nenhum informado neste arquivo)

js-interf-north-abbr = N

js-interf-not-evaluated = não avaliado

js-interf-not-opened-full = { $name }: não aberto, { $max } mapas já estão abertos. Feche alguns primeiro.

js-interf-nothing-open = Nada aberto ainda.

js-interf-nothing-opened = Nada foi aberto.

js-interf-one-day = um dia por vez

js-interf-opened-file-map = Aberto { $files } arquivo; { $maps } mapa aberto.

js-interf-opened-file-maps = Aberto { $files } arquivo; { $maps } mapas abertos.

js-interf-opened-files-map = Abertos { $files } arquivos; { $maps } mapa aberto.

js-interf-opened-files-maps = Abertos { $files } arquivos; { $maps } mapas abertos.

js-interf-opening-demo = Abrindo a demonstração sintética…

js-interf-parameters = Parâmetros, fixados antes de qualquer dado ser lido

js-interf-read-draw-failed = { $name }: não foi possível ler ou desenhar ({ $reason }).

js-interf-read-failed = { $name }: não foi possível ler ({ $reason }).

js-interf-read-with-map = Leia isto junto com o mapa

js-interf-reading = Lendo…

js-interf-route-aria = Exposição da rota { $name }

js-interf-route-chip = Rota

js-interf-route-done =
    { $n ->
        [one] Exposição da rota calculada a partir de { $n } mapa com o motor { $version }; o relatório é mostrado abaixo.
        [many] Exposição da rota calculada a partir de { $n } de mapas com o motor { $version }; o relatório é mostrado abaixo.
       *[other] Exposição da rota calculada a partir de { $n } mapas com o motor { $version }; o relatório é mostrado abaixo.
    }

js-interf-route-explain = Proporção do comprimento da rota em cada estado, por dia e fonte. As quatro proporções somam 1 e são lidas em conjunto: uma proporção degradada baixa com uma proporção não observada alta não foi mostrada como livre. As linhas de ADS-B e de AIS nunca são combinadas.

js-interf-route-exposure = Exposição da rota

js-interf-route-needs-map = Abra ou construa pelo menos um mapa primeiro: a rota é verificada em relação aos mapas desta página.

js-interf-route-open-failed = Não foi possível abrir a rota: { $reason }.

js-interf-route-range = { $from } a { $to }

js-interf-route-too-big = { $name }: maior que 24 MiB.

js-interf-row-affected-share = Proporção afetada

js-interf-row-aircraft-affected = Aeronaves afetadas

js-interf-row-aircraft-observed = Aeronaves observadas

js-interf-row-aircraft-sampled = Aeronaves amostradas

js-interf-row-area = Área

js-interf-row-cell = Célula

js-interf-row-detectors = Detectores que se qualificaram

js-interf-row-flagged = Sinalizada: { $detector }

js-interf-row-status = Estado

js-interf-row-vessels-observed = Embarcações observadas

js-interf-rows-skipped =
    { $count ->
        [one] { $count } linha não era válida e foi ignorada.
        [many] { $count } de linhas não eram válidas e foram ignoradas.
       *[other] { $count } linhas não eram válidas e foram ignoradas.
    }

js-interf-rt-day = Dia

js-interf-rt-km = km da rota

js-interf-rt-licence = Licença e atribuição do mapa

js-interf-rt-shares = Proporções da rota

js-interf-rt-source = Fonte

js-interf-sample-failed = Não foi possível abrir a amostra: { $reason }.

js-interf-save = Salvar:

js-interf-save-report = Salvar o relatório (JSON)

js-interf-show-layer = Mostrar esta camada

js-interf-st-anomalous-label = Anômala

js-interf-st-anomalous-text = Pelo menos um detector sinalizou aqui, naquele dia, embarcações distintas em número suficiente (pelo menos 3 embarcações e 20% das observadas). As causas possíveis incluem interferência, mas também muitas causas comuns.

js-interf-st-confounded-label = Dia confundido

js-interf-st-confounded-text = A proporção mediana de células do dia inteiro foi alta, o que aponta para uma causa de área ampla. Nenhuma célula é declarada degradada em um dia assim; esta célula teria se destacado de outro modo.

js-interf-st-degraded-label = Degradada

js-interf-st-degraded-text = Uma proporção alta das aeronaves amostradas informou aqui, naquele dia, baixa exatidão de navegação, bem acima da célula mediana do dia. Isso não diz por quê.

js-interf-st-no-background-label = Sem estimativa de fundo

js-interf-st-no-background-text = O fundo do dia (a proporção típica de aeronaves que informam baixa exatidão) não pôde ser estimado a partir de células suficientes; por isso nenhuma célula é comparada com ele e nenhuma é classificada.

js-interf-st-not-anomalous-label = Não anômala

js-interf-st-not-anomalous-text = Observada, e nenhum detector se qualificou. Não é prova de que nada aconteceu.

js-interf-st-not-degraded-label = Não degradada

js-interf-st-not-degraded-text = Amostrada, e a proporção de aeronaves que informam baixa exatidão não se destacou. Não é prova de que nada aconteceu.

js-interf-st-too-few-label = Aeronaves insuficientes

js-interf-st-too-few-text = Publicada (pelo menos 5 aeronaves distintas observadas), mas menos de 10 aeronaves puderam ser amostradas; por isso nenhuma classificação é feita.

js-interf-starting-build = Iniciando o motor e construindo…

js-interf-starting-route = Iniciando o motor e verificando a rota…

js-interf-state-clear-adsb = Livre

js-interf-state-clear-adsb-text = Observada com aeronaves suficientes e não sinalizada. Não é prova de que nada aconteceu.

js-interf-state-clear-ais = Livre

js-interf-state-clear-ais-text = Observada com embarcações suficientes e não sinalizada. Não é prova de que nada aconteceu.

js-interf-state-degraded-adsb = Degradada

js-interf-state-degraded-adsb-text = Uma proporção alta das aeronaves amostradas informou aqui, naquele dia, baixa exatidão de navegação, bem acima da célula mediana do dia.

js-interf-state-degraded-ais = Anômala

js-interf-state-degraded-ais-text = Pelo menos um detector sinalizou aqui, naquele dia, embarcações distintas em número suficiente (pelo menos 3 embarcações e 20% das observadas).

js-interf-state-notobs-adsb = Não observada

js-interf-state-notobs-adsb-text = Nenhuma célula desenhada: aeronaves observadas em número insuficiente para publicá-la. Isso não é evidência de que a área estava livre.

js-interf-state-notobs-ais = Não observada

js-interf-state-notobs-ais-text = Nenhuma célula desenhada: embarcações observadas em número insuficiente para publicá-la. Isso não é evidência de que a área estava livre.

js-interf-state-unassessed-adsb = Não avaliada

js-interf-state-unassessed-adsb-text = Observada, mas aeronaves em número insuficiente puderam ser amostradas, o dia foi confundido ou o fundo do dia não pôde ser estimado; por isso nenhuma classificação é feita.

js-interf-state-unassessed-ais = Não avaliada

js-interf-state-unassessed-ais-text = Observada, mas nenhuma classificação é feita.

js-interf-status-unknown = Um estado que esta página não descreve.

js-interf-table-first = Primeiras { $shown } de { $total } células mostradas, com as classificações que importam primeiro.

js-interf-table-summary = Cada célula desenhada como uma tabela ({ $n })

js-interf-the-day = O dia

js-interf-unknown-date = data desconhecida

js-interf-warn-cell-size = Este arquivo usa um tamanho de célula de { $size }° que não é o pré-registrado: não é o método pré-registrado; por isso suas classificações não são comparáveis às de arquivos que o usam.

js-interf-warn-cell-size-known = Este arquivo usa um tamanho de célula de { $size }° que não é o pré-registrado ({ $registered }°): não é o método pré-registrado; por isso suas classificações não são comparáveis às de arquivos que o usam.

js-interf-warn-day-confounded = Este dia é confundido: nenhuma célula foi classificada como degradada por causa do fundo do dia (a própria proporção mediana de células foi alta).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } célula tem um sinalizador "degraded" que discorda do seu estado. O estado é o que é desenhado.
        [many] { $count } de células têm um sinalizador "degraded" que discorda do seu estado. O estado é o que é desenhado.
       *[other] { $count } células têm um sinalizador "degraded" que discorda do seu estado. O estado é o que é desenhado.
    }

js-interf-warn-no-licence = Este arquivo não traz texto de { $fields }. Ele é mostrado, mas um mapa sem sua licença e atribuição não deve ser republicado.

js-interf-warn-on-land-off = O detector de posição em terra estava desligado para este arquivo (nenhum polígono de terra foi fornecido).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } feição não era GeoJSON válido e foi ignorada.
        [many] { $count } de feições não eram GeoJSON válido e foram ignoradas.
       *[other] { $count } feições não eram GeoJSON válido e foram ignoradas.
    }

js-interf-warn-unknown-status = Valores de estado que esta página não conhece: { $values }. Eles são desenhados como "sem classificação".

js-interf-withheld = retido (menos de 5)

js-interf-written-by = escrito pelo { -brand } { $version }

js-kind-axis-3-d-position-error-m = erro de posição 3D (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = jitter do código (m)

js-kind-axis-code-tracking-jitter-m = jitter do rastreamento de código (m)

js-kind-axis-doppler-shift-hz = deslocamento Doppler (Hz)

js-kind-axis-effective-c-n0-db-hz = C/N0 efetivo (dB-Hz)

js-kind-axis-elevation = elevação (°)

js-kind-axis-fit-interval-s = intervalo de ajuste (s)

js-kind-axis-formal-position-sigma-m = sigma formal da posição (m)

js-kind-axis-latitude = latitude (°)

js-kind-axis-leo-satellites-added-to-the = satélites LEO acrescentados à fixação

js-kind-axis-mean-satellites-in-view = média de satélites à vista

js-kind-axis-median-dilution-of-precision = diluição da precisão mediana

js-kind-axis-median-error-m = erro mediano (m)

js-kind-axis-median-pdop = PDOP mediano

js-kind-axis-metres = metros

js-kind-axis-observation-window-s = janela de observação (s)

js-kind-axis-offset-from-the-signal-s = deslocamento a partir do centro do sinal (MHz)

js-kind-axis-offset-from-the-snapshot-centre = deslocamento a partir do centro do instantâneo (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = erro de posição (m)

js-kind-axis-power-spectral-density-db-hz = densidade espectral de potência (dB/Hz, potência unitária)

js-kind-axis-power-spectral-density-dbw-hz = densidade espectral de potência (dBW/Hz)

js-kind-axis-probability-of-detection = probabilidade de detecção

js-kind-axis-range-error-m = erro de distância (m)

js-kind-axis-relays = retransmissores

js-kind-axis-sisre-root-mean-square-m = SISRE, valor quadrático médio (m)

js-kind-axis-time-error-ns = erro de tempo (ns)

js-kind-axis-time-s = tempo (s)

js-kind-axis-time-since-the-start-min = tempo desde o início (min)

js-kind-axis-update-period-s = período de atualização (s)

js-kind-cap-body-pnt-label = Posicionamento por retransmissores

js-kind-cap-campaign-label = Campanha

js-kind-cap-constellation-design-label = Cobertura

js-kind-cap-leo-navmsg-label = Mensagem de navegação

js-kind-cap-leo-pass-label = Passagem e enlace

js-kind-cap-leo-pnt-chain-label = Cadeia ponta a ponta

js-kind-cap-leo-ppp-label = Posicionamento

js-kind-cap-leo-pvt-label = Posicionamento

js-kind-cap-leo-signal-label = Projeto do sinal

js-kind-cap-lunar-llr-datum-label = Datum de telemetria a laser

js-kind-cap-ntn-positioning-label = Posicionamento

js-kind-cap-solar-system-label = Sistema solar

js-kind-cap-spectrum-label = Espectro

js-kind-guided-doppler-error-hz = Erro de Doppler (Hz)

js-kind-guided-duration-s = Duração (s)

js-kind-guided-earth-range-error-m = Erro de distância à Terra (m)

js-kind-guided-elevation-mask = Máscara de elevação (°)

js-kind-guided-first-jammer-bandwidth-mhz = Largura de banda do primeiro jammer (MHz)

js-kind-guided-first-jammer-power-dbw = Potência do primeiro jammer (dBW)

js-kind-guided-first-jammer-range-m = Distância do primeiro jammer (m)

js-kind-guided-first-jammer-received-power-dbw = Potência recebida do primeiro jammer (dBW)

js-kind-guided-first-phase-length-s = Duração da primeira fase (s)

js-kind-guided-first-shell-altitude-km = Altitude da primeira casca (km)

js-kind-guided-first-shell-inclination = Inclinação da primeira casca (°)

js-kind-guided-first-signal-bandwidth-hz = Largura de banda do primeiro sinal (Hz)

js-kind-guided-first-system-range-error-m = Erro de distância do primeiro sistema (m)

js-kind-guided-fit-interval-s = Intervalo de ajuste (s)

js-kind-guided-gravity-field-degree = Grau do campo gravitacional

js-kind-guided-grid-step = Passo da grade (°)

js-kind-guided-integration-time-s = Tempo de integração (s)

js-kind-guided-leo-satellites-in-the-sweep = Satélites LEO na varredura

js-kind-guided-loop-bandwidth-hz = Largura de banda da malha (Hz)

js-kind-guided-monte-carlo-runs = Execuções de Monte Carlo

js-kind-guided-network-synchronisation-error-m = Erro de sincronização da rede (m)

js-kind-guided-orbit-altitude-km = Altitude da órbita (km)

js-kind-guided-orbit-determination-error-m = Erro de determinação de órbita (m)

js-kind-guided-orbit-inclination = Inclinação da órbita (°)

js-kind-guided-pdop-threshold = Limiar de PDOP

js-kind-guided-peak-elevation-of-the-pass = Elevação máxima da passagem (°)

js-kind-guided-points-per-orbit-track = Pontos por trajetória orbital

js-kind-guided-receiver-noise-figure-db = Figura de ruído do receptor (dB)

js-kind-guided-receiver-power-when-awake-mw = Potência do receptor quando ativo (mW)

js-kind-guided-reference-c-n0-db-hz = C/N0 de referência (dB-Hz)

js-kind-guided-relay-altitude-km = Altitude dos retransmissores (km)

js-kind-guided-relay-inclination = Inclinação dos retransmissores (°)

js-kind-guided-relay-planes = Planos de retransmissores

js-kind-guided-relay-range-error-m = Erro de distância ao retransmissor (m)

js-kind-guided-relays-per-plane = Retransmissores por plano

js-kind-guided-runs-per-case = Execuções por caso

js-kind-guided-satellite-altitude-km = Altitude do satélite (km)

js-kind-guided-second-system-range-error-m = Erro de distância do segundo sistema (m)

js-kind-guided-shared-condition = Condição compartilhada

js-kind-guided-slant-electron-content-tecu = Conteúdo de elétrons oblíquo (TECU)

js-kind-guided-slant-range-km = Distância oblíqua (km)

js-kind-guided-spoofed-offset-m = Deslocamento do spoofing (m)

js-kind-guided-spoofing-starts-s = Início do spoofing (s)

js-kind-guided-sweep-from = Varredura de

js-kind-guided-sweep-steps = Passos da varredura

js-kind-guided-sweep-to = Varredura até

js-kind-guided-timeline-step-s = Passo da linha do tempo (s)

js-kind-guided-tracking-threshold-db-hz = Limiar de rastreamento (dB-Hz)

js-kind-guided-transmit-power-dbw = Potência de transmissão (dBW)

js-kind-guided-update-period-s = Período de atualização (s)

js-kind-guided-user-latitude = Latitude do usuário (°)

js-kind-hint-a-band-under-this-carrier = uma banda abaixo desta densidade portadora-ruído perdeu o travamento

js-kind-hint-a-grid-point-is-available = um ponto da grade está disponível enquanto sua diluição de precisão de posição estiver abaixo deste valor

js-kind-hint-a-satellite-must-be-this = um satélite precisa estar tão alto para contar como à vista

js-kind-hint-a-satellite-must-be-this-2 = um satélite precisa estar tão alto para ser usado

js-kind-hint-a-satellite-of-the-first = um satélite do primeiro sistema precisa estar tão alto

js-kind-hint-arc-one-message-is-fitted = arco sobre o qual uma mensagem é ajustada

js-kind-hint-code-tracking-loop-noise-bandwidth = largura de banda de ruído da malha de rastreamento de código

js-kind-hint-detail-of-the-truth-orbit = nível de detalhe do modelo gravitacional da órbita de referência

js-kind-hint-distance-from-the-first-jammer = distância do primeiro jammer ao receptor

js-kind-hint-distance-to-the-satellite-in = distância ao satélite no estudo de compromisso de bandas

js-kind-hint-drawn-while-acquiring-and-tracking = desenhado durante a aquisição e o rastreamento

js-kind-hint-equivalent-isotropically-radiated-power-of = potência isotrópica radiada equivalente do primeiro jammer

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = potência isotrópica radiada equivalente da banda

js-kind-hint-filter-runs-averaged-for-each = execuções do filtro com média para cada caso (mais execuções, mais lento)

js-kind-hint-first-value-of-the-swept = primeiro valor do parâmetro varrido

js-kind-hint-height-of-the-chain-s = altura do satélite da cadeia

js-kind-hint-height-of-the-first-shell = altura das órbitas da primeira casca

js-kind-hint-height-of-the-relay-orbits = altura das órbitas dos retransmissores acima do corpo

js-kind-hint-height-of-the-satellite-whose = altura do satélite cuja mensagem é ajustada

js-kind-hint-how-far-the-spoofer-moves = quanto o spoofer desloca a posição calculada

js-kind-hint-how-finely-each-orbit-is = com que finura cada órbita é amostrada para o desenho

js-kind-hint-how-high-the-satellite-climbs = até que altura o satélite sobe

js-kind-hint-how-long-the-first-phase = quanto dura a primeira fase

js-kind-hint-how-long-the-receiver-integrates = por quanto tempo o receptor integra para uma medida de distância

js-kind-hint-how-many-low-orbit-satellites = quantos satélites em órbita baixa a varredura de geometria acrescenta

js-kind-hint-how-many-seeded-runs-make = quantas execuções com semente formam o conjunto

js-kind-hint-how-many-values-are-run = quantos valores são executados

js-kind-hint-how-often-a-new-message = com que frequência uma nova mensagem é emitida

js-kind-hint-how-wide-the-first-jammer = quão largo o primeiro jammer espalha sua potência

js-kind-hint-ionosphere-along-the-path-in = ionosfera ao longo do trajeto, em unidades de conteúdo total de elétrons

js-kind-hint-last-value-of-the-swept = último valor do parâmetro varrido

js-kind-hint-length-of-each-filter-run = duração de cada execução do filtro

js-kind-hint-length-of-the-run = duração da execução

js-kind-hint-length-of-the-timeline = duração da linha do tempo

js-kind-hint-occupied-bandwidth-of-the-first = largura de banda ocupada do primeiro sinal de referência

js-kind-hint-one-sigma-doppler-measurement-error = erro de medida Doppler de um sigma

js-kind-hint-one-sigma-error-of-a = erro de um sigma de uma medida de distância a um retransmissor

js-kind-hint-one-sigma-error-of-the = erro de um sigma da medida de distância bidirecional a partir da Terra

js-kind-hint-orbital-planes-of-the-navigation = planos orbitais dos retransmissores de navegação

js-kind-hint-power-of-the-first-jammer = potência do primeiro jammer no receptor

js-kind-hint-raises-the-noise-floor-under = eleva o piso de ruído sob todas as bandas

js-kind-hint-satellites-in-each-plane = satélites em cada plano

js-kind-hint-sets-the-doppler-range-a = define a faixa de Doppler que uma busca a frio precisa cobrir

js-kind-hint-signal-in-space-range-error = erro de distância do sinal no espaço do primeiro sistema

js-kind-hint-signal-in-space-range-error-2 = erro de distância do sinal no espaço do segundo sistema

js-kind-hint-signal-level-the-tracking-figures = nível de sinal em que os valores de rastreamento são citados

js-kind-hint-spacing-of-the-latitude-and = espaçamento da grade de latitude e longitude

js-kind-hint-spacing-of-the-shared-mission = espaçamento da grade de tempo compartilhada da missão

js-kind-hint-the-part-of-the-range = a parte do erro de distância que a mensagem não consegue remover

js-kind-hint-the-value-every-member-runs = o valor sob o qual cada membro é executado

js-kind-hint-tilt-of-that-orbit = inclinação dessa órbita

js-kind-hint-tilt-of-the-first-shell = inclinação dos planos da primeira casca

js-kind-hint-tilt-of-the-relay-planes = inclinação dos planos dos retransmissores

js-kind-hint-timing-error-between-satellites-as = erro de temporização entre satélites, como distância

js-kind-hint-when-the-spoofer-captures-the = quando o spoofer captura o receptor

js-kind-hint-where-the-receiver-stands = onde o receptor está

js-kind-hint-where-the-user-stands = onde o usuário está

js-kind-label-3-d-error = Erro 3D

js-kind-label-3-d-error-time-of = Erro 3D, tempo de chegada

js-kind-label-a-corrupted-frame-is-rejected = um quadro corrompido é rejeitado

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

js-kind-label-fewest-in-view = Menos à vista

js-kind-label-field = Campo

js-kind-label-first-detection-after-onset = Primeira detecção após o início

js-kind-label-frame-length = Comprimento do quadro

js-kind-label-fused = fundido

js-kind-label-fused-cap = Fundido

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS e LEO

js-kind-label-gnss-channels = Canais GNSS

js-kind-label-gnss-highest-in-sky = GNSS { $id } (o mais alto no céu)

js-kind-label-gnss-only = apenas GNSS

js-kind-label-gnss-only-cap = Apenas GNSS

js-kind-label-gnss-signal = Sinal GNSS

js-kind-label-hdop = HDOP

js-kind-label-highest = Maior

js-kind-label-horizontal-error = erro horizontal

js-kind-label-horizontal-error-2 = Erro horizontal

js-kind-label-jammer = Jammer

js-kind-label-jump-threshold = Limiar de salto

js-kind-label-largest-range-jump = Maior salto de distância

js-kind-label-largest-range-jump-against-the = maior salto de distância contra o limiar

js-kind-label-leo = LEO

js-kind-label-leo-channels = Canais LEO

js-kind-label-leo-only = apenas LEO

js-kind-label-light-time-from-observer = Tempo de luz a partir de { $observer }

js-kind-label-light-time-from-the-observer = Tempo de luz a partir do observador

js-kind-label-light-time-one-way = Tempo de luz, ida

js-kind-label-lowest = Menor

js-kind-label-lowest-c-n0 = Menor C/N0

js-kind-label-mean = Média

js-kind-label-mean-in-view = Média à vista

js-kind-label-median-convergence = Convergência mediana

js-kind-label-median-pdop = PDOP mediano

js-kind-label-member-runs = Execuções dos membros

js-kind-label-message-switch-iod = troca de mensagem, emissão de dados { $old } para { $new }

js-kind-label-mission-length = Duração da missão

js-kind-label-model = modelo

js-kind-label-monte-carlo-runs = Execuções de Monte Carlo

js-kind-label-noise-floor = Piso de ruído

js-kind-label-parameters = Parâmetros

js-kind-label-payload = Carga útil

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, percentil 95

js-kind-label-peak-elevation = Elevação máxima

js-kind-label-peak-tracked-c-n0 = C/N0 rastreado máximo

js-kind-label-phase = Fase

js-kind-label-predicted-horizontal-sigma = sigma horizontal predito

js-kind-label-quantisation-position = Quantização, posição

js-kind-label-range-error = erro de distância

js-kind-label-relays-above-the-mask = retransmissores acima da máscara

js-kind-label-relays-and-earth-link = retransmissores e enlace com a Terra

js-kind-label-relays-only = apenas retransmissores

js-kind-label-satellite = Satélite

js-kind-label-satellites = Satélites

js-kind-label-satellites-used = Satélites usados

js-kind-label-signal = Sinal

js-kind-label-signal-chip-spacing = { $name } (espaçamento de chip de { $spacing })

js-kind-label-sisre-after-quantisation = SISRE após a quantização

js-kind-label-sisre-root-mean-square = SISRE, valor quadrático médio

js-kind-label-spoofing-starts = início do spoofing

js-kind-label-standard-deviation = Desvio-padrão

js-kind-label-sun-separation = Separação do Sol

js-kind-label-sweep-runs = Execuções da varredura

js-kind-label-system = Sistema

js-kind-label-time-above-the-mask = Tempo acima da máscara

js-kind-label-time-error-root-mean-square = Erro de tempo, valor quadrático médio

js-kind-label-tracked-component = componente rastreado

js-kind-label-tracking-threshold = Limiar de rastreamento

js-kind-label-transmit-bandwidth = Largura de banda de transmissão

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Estimativa de Welch das amostras sintetizadas

js-kind-label-whole-signal = sinal inteiro

js-kind-label-wideband-j-s-tolerated = J/S de banda larga tolerado

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Disponibilidade do pior local

js-kind-no = não

js-kind-note-a-gap-is-an-epoch = Uma lacuna é uma época com poucos retransmissores à vista para uma fixação.

js-kind-note-a-helmert-transform-is-the = Uma transformação de Helmert é o deslocamento, a rotação e a escala de sete parâmetros entre dois referenciais.

js-kind-note-a-low-earth-orbit-leo = Um satélite em órbita terrestre baixa (LEO) cruza o céu em minutos, de modo que seu C/N0 (relação portadora-densidade de ruído) sobe e desce em forma de sino; um satélite GNSS mal se move no mesmo tempo.

js-kind-note-a-receiver-independent-exchange-format = Um registro no estilo RINEX 4 (Receiver Independent Exchange Format). Os tipos de registro LEO são uma extensão do { -brand }, como diz o cabeçalho.

js-kind-note-a-single-pass-fixes-the = Uma única passagem fixa a direção ao longo da trajetória muito melhor que a direção transversal.

js-kind-note-aos-is-acquisition-of-signal = AOS é a aquisição do sinal, TCA o instante de maior aproximação e LOS a perda do sinal.

js-kind-note-c-n0-is-the-carrier = C/N0 é a relação portadora-densidade de ruído. Uma banda abaixo do limiar de rastreamento do receptor perdeu o travamento.

js-kind-note-cells-are-the-code-and = As células são os intervalos de código e de Doppler que uma busca a frio precisa testar.

js-kind-note-cold-is-a-first-fix = A frio é uma primeira fixação sem nenhum conhecimento prévio; a quente é uma fixação logo após a anterior.

js-kind-note-dilution-of-precision-dop-scales = A diluição de precisão (DOP) converte um erro de distância em um erro de posição: G é geométrica, P de posição, H horizontal, V vertical. Os percentis são sobre todos os pontos da grade e todas as épocas.

js-kind-note-drawn-at-the-strongest-signal = Desenhado no nível de sinal mais forte da execução. Uma lacuna é um trecho sem nenhum satélite à vista.

js-kind-note-each-body-carries-its-own = Cada corpo traz seu próprio rótulo de evidência. O tempo de luz é de ida, a partir do observador indicado no cenário.

js-kind-note-each-row-is-one-full = Cada linha é uma execução completa do motor do cenário varrido.

js-kind-note-each-rule-is-a-switch = Cada regra é uma troca para uma mensagem mais nova no meio da passagem.

js-kind-note-each-signal-is-drawn-about = Cada sinal é desenhado em torno de sua própria frequência central. Uma lacuna é um nulo espectral.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP é a potência isotrópica radiada equivalente.

js-kind-note-every-phase-is-an-ordinary = Cada fase é uma execução de cenário comum. Os hashes identificam a entrada de cada membro e seu documento de resultado.

js-kind-note-iod-is-the-issue-of = IOD é a emissão de dados: o número de série da mensagem.

js-kind-note-j-s-is-the-jammer = J/S é a relação de potência jammer-sinal. A fração de rastreamento é a parte da execução em que a banda permanece acima do limiar.

js-kind-note-p05-p50-and-p95-are = p05, p50 e p95 são os percentis 5, 50 e 95. ci95 é o intervalo de confiança de 95% da média.

js-kind-note-parameters-are-public-with-a = Os parâmetros são PÚBLICOS (com uma fonte), REPRESENTATIVOS ou DE OFICINA, conforme cada predefinição indica.

js-kind-note-precise-point-positioning-ppp-converges = O posicionamento preciso por ponto (PPP) converge quando o erro permanece abaixo do critério. NEES é o erro de estimação normalizado ao quadrado, uma verificação de consistência do filtro.

js-kind-note-sisre-defined = SISRE é o erro de distância do sinal no espaço: o que a mensagem transmitida acrescenta à distância de um usuário. Aqui é o erro de representação da mensagem em relação à órbita de referência do próprio motor.

js-kind-note-sisre-is-the-signal-in = SISRE é o erro de distância do sinal no espaço assumido para a órbita e o relógio transmitidos de cada sistema.

js-kind-note-ssc-is-the-spectral-separation = SSC é o coeficiente de separação espectral: quanto da potência de um sinal cai dentro do receptor do outro. Um traço significa que os dois não se sobrepõem.

js-kind-note-the-chain-runs-the-signal = A cadeia executa, em ordem, as etapas de sinal, passagem, mensagem de navegação, posicionamento e posicionamento preciso. Cada linha é um número que uma etapa calculou e a seguinte usou.

js-kind-note-the-doppler-and-pass-geometry = O monitor de Doppler e de geometria da passagem compara as taxas de variação de distância medidas com as previstas a partir das órbitas. A regra marca o início do spoofer.

js-kind-note-the-engine-draws-its-spectrum = O motor desenha seu modelo de espectro como amostras em fase e em quadratura (IQ) em um instante e estima de volta o espectro a partir delas. As mesmas amostras são a exportação SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = O quadro binário documentado do próprio motor, fechado por uma verificação de redundância cíclica de 24 bits (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = A largura de banda de Gabor (valor quadrático médio) define com que nitidez um sinal pode ser usado para medir distância.

js-kind-note-the-largest-jammer-to-signal = A maior relação jammer-sinal (J/S) que cada sinal suporta rastrear, para um jammer de onda contínua (CW), um de espectro casado e um de banda larga.

js-kind-note-the-shapiro-delay-is-the = O atraso de Shapiro é o tempo de luz adicional causado pela gravidade do Sol ao longo do trajeto.

js-kind-note-the-spectrum-kind-and-the = O tipo espectro e o tipo jamming calculam o mesmo enlace de duas maneiras; a última coluna é a diferença entre eles.

js-kind-note-time-of-arrival-toa-ranging = Medição de distância por tempo de chegada (TOA) em um downlink de rede não terrestre (NTN): um sinal mais largo mede a distância com mais nitidez.

js-kind-note-what-half-a-least-significant = O que meio bit menos significativo (LSB) de cada campo custa em posição e em relógio, como distância.

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

js-kind-sub-doppler-only = apenas Doppler

js-kind-sub-from-to = { $from } a { $to }

js-kind-sub-fused = fundido

js-kind-sub-gnss-and-leo-latitude = GNSS e LEO, latitude { $lat }°

js-kind-sub-gnss-only = apenas GNSS

js-kind-sub-gnss-only-latitude = apenas GNSS, latitude { $lat }°

js-kind-sub-model-fit-seconds = { $model }, ajuste de { $fit } s

js-kind-threshold-4-needed-for-a-fix = 4 necessários para uma fixação

js-kind-threshold-convergence-criterion = critério de convergência

js-kind-threshold-elevation-mask = máscara de elevação

js-kind-threshold-gnss-median = mediana do GNSS

js-kind-threshold-tracking-threshold = limiar de rastreamento

js-kind-title-acquisition = Aquisição

js-kind-title-against-a-simulated-campaign = Contra uma campanha simulada

js-kind-title-assumptions = Hipóteses

js-kind-title-band-trade-at-equal-transmit = Compromisso de bandas com a mesma potência de transmissão

js-kind-title-bands = Bandas

js-kind-title-beside-the-published-figures = Ao lado dos valores publicados

js-kind-title-beside-the-published-speed-up = Ao lado do ganho de velocidade publicado

js-kind-title-bodies = Corpos

js-kind-title-body = Corpo

js-kind-title-by-latitude = Por latitude

js-kind-title-c-n0-by-band-over = C/N0 por banda ao longo da execução

js-kind-title-c-n0-over-the-pass = C/N0 ao longo da passagem

js-kind-title-cases = Casos

js-kind-title-central-body = Corpo central

js-kind-title-closed-form-doppler-against-finite = Doppler em forma fechada contra diferenças finitas

js-kind-title-code-tracking-jitter = Jitter do rastreamento de código

js-kind-title-code-tracking-jitter-against-c = Jitter do rastreamento de código contra C/N0

js-kind-title-combined-over-the-members = Combinado sobre os membros

js-kind-title-compatibility-with-gnss-signals = Compatibilidade com sinais GNSS

js-kind-title-constellations = Constelações

js-kind-title-continuity-across-message-switches = Continuidade entre trocas de mensagem

js-kind-title-cross-check-against-the-jamming = Verificação cruzada com o tipo jamming

js-kind-title-datum-accuracy = Exatidão do datum

js-kind-title-dilution-of-precision-over-the = Diluição de precisão sobre toda a grade

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Envoltórias de Doppler

js-kind-title-doppler-only-fix = Fixação apenas por Doppler

js-kind-title-doppler-over-the-pass = Doppler ao longo da passagem

js-kind-title-doppler-positioning-from-one-pass = Posicionamento por Doppler a partir de uma passagem

js-kind-title-earth-link = Enlace com a Terra

js-kind-title-elevation = Elevação

js-kind-title-encoded-frame = Quadro codificado

js-kind-title-epoch = Época

js-kind-title-epoch-and-frame = Época e referencial

js-kind-title-events = Eventos

js-kind-title-every-node-of-the-sweep = Cada nó da varredura

js-kind-title-field-table = Tabela de campos

js-kind-title-figures-of-merit = Figuras de mérito

js-kind-title-filter-noise = Ruído do filtro

js-kind-title-fit-interval-trade = Compromisso do intervalo de ajuste

js-kind-title-fix-quality-against-observation-window = Qualidade da fixação contra janela de observação

js-kind-title-frame-checks = Verificações do quadro

js-kind-title-frame-hexadecimal = Quadro, hexadecimal

js-kind-title-geometry-against-latitude = Geometria contra latitude

js-kind-title-geometry-as-leo-satellites-are = Geometria à medida que satélites LEO são acrescentados

js-kind-title-geometry-position-dilution-of-precision = Geometria: diluição de precisão de posição

js-kind-title-global-coverage = Cobertura global

js-kind-title-gnss-leo-and-fused = GNSS, LEO e fundido

js-kind-title-gnss-reference = Referência GNSS

js-kind-title-hand-offs-between-phases = Passagens de dados entre fases

js-kind-title-helmert-fit = Ajuste de Helmert

js-kind-title-helmert-transform-parameters = Parâmetros da transformação de Helmert

js-kind-title-inputs = Entradas

js-kind-title-ionosphere-free-band-pairs = Pares de bandas livres de ionosfera

js-kind-title-jammer-tolerance = Tolerância a jammer

js-kind-title-jammers = Jammers

js-kind-title-joint-fix = Fixação conjunta

js-kind-title-leo-against-gnss = LEO contra GNSS

js-kind-title-limitations = Limitações

js-kind-title-links = Enlaces

js-kind-title-member-runs = Execuções dos membros

js-kind-title-members-under-the-shared-conditions = Membros sob as condições compartilhadas

js-kind-title-message = Mensagem

js-kind-title-message-models-compared = Modelos de mensagem comparados

js-kind-title-message-switches = Trocas de mensagem

js-kind-title-metric-against-axis = { $metric } contra { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: distribuição sobre as execuções

js-kind-title-mid-pass-update = Atualização no meio da passagem

js-kind-title-modelled = Modelado

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Etapa da mensagem de navegação

js-kind-title-not-modelled = Não modelado

js-kind-title-notes = Notas

js-kind-title-notes-on-the-spoofing-model = Notas sobre o modelo de spoofing

js-kind-title-observation-windows = Janelas de observação

js-kind-title-one-pass-alone = Uma passagem sozinha

js-kind-title-orbit = Órbita

js-kind-title-over-the-message-sequence = Ao longo da sequência de mensagens

js-kind-title-pass = Passagem

js-kind-title-pass-c-n0-of-the = Passagem: C/N0 do sinal inteiro e do componente rastreado

js-kind-title-pass-code-tracking-jitter = Passagem: jitter do rastreamento de código

js-kind-title-pass-doppler = Passagem: Doppler

js-kind-title-pass-stage = Etapa da passagem

js-kind-title-passes = Passagens

js-kind-title-phases = Fases

js-kind-title-position-error-gnss-leo-and = Erro de posição: GNSS, LEO e a fixação fundida

js-kind-title-position-uncertainty-relays-alone-and = Incerteza de posição: retransmissores sozinhos e com o enlace com a Terra

js-kind-title-positioning-by-signal-bandwidth = Posicionamento por largura de banda do sinal

js-kind-title-positioning-gnss-alone-against-the = Posicionamento: GNSS sozinho contra a fixação fundida

js-kind-title-power-spectral-density = Densidade espectral de potência

js-kind-title-power-spectral-density-of-each = Densidade espectral de potência de cada sinal

js-kind-title-precise-point-positioning = Posicionamento preciso por ponto

js-kind-title-published-comparison = Comparação publicada

js-kind-title-quantisation-budget = Orçamento de quantização

js-kind-title-range-residuals = Resíduos de distância

js-kind-title-ranging-stations = Estações de telemetria

js-kind-title-reading-the-trade = Lendo o compromisso

js-kind-title-realised-position-error = Erro de posição realizado

js-kind-title-receiver = Receptor

js-kind-title-receiver-power-budget = Orçamento de potência do receptor

js-kind-title-reflector-information = Informação dos refletores

js-kind-title-relay-constellation = Constelação de retransmissores

js-kind-title-relays-in-view = Retransmissores à vista

js-kind-title-reproducibility = Reprodutibilidade

js-kind-title-retroreflectors = Retrorrefletores

js-kind-title-rinex-style-record = Registro no estilo RINEX

js-kind-title-round-trips = Percursos de ida e volta

js-kind-title-run = Execução

js-kind-title-satellites-in-view-against-latitude = Satélites à vista contra latitude

js-kind-title-sensitivity-to-a-line-of = Sensibilidade a uma inclinação da linha de visada

js-kind-title-shared-conditions = Condições compartilhadas

js-kind-title-signal-components = Componentes do sinal

js-kind-title-signal-stage = Etapa do sinal

js-kind-title-signals = Sinais

js-kind-title-sisre-against-fit-interval = SISRE contra intervalo de ajuste

js-kind-title-sisre-against-update-period = SISRE contra período de atualização

js-kind-title-sisre-weights = Pesos do SISRE

js-kind-title-snapshot = Instantâneo

js-kind-title-snapshot-against-the-model = Instantâneo contra o modelo

js-kind-title-snapshot-spectrum-welch-estimate-against = Espectro do instantâneo: estimativa de Welch contra o modelo

js-kind-title-sources = Fontes

js-kind-title-spoofer-and-monitor-settings = Configurações do spoofer e do monitor

js-kind-title-spoofing-monitor-probability-of-detection = Monitor de spoofing: probabilidade de detecção

js-kind-title-statistics-over-the-runs = Estatísticas sobre as execuções

js-kind-title-sweep = Varredura

js-kind-title-systems = Sistemas

js-kind-title-systems-in-the-fix = Sistemas na fixação

js-kind-title-the-archived-campaign = A campanha arquivada

js-kind-title-time-error = Erro de tempo

js-kind-title-time-error-by-receiver-clock = Erro de tempo por relógio do receptor

js-kind-title-time-scale = Escala de tempo

js-kind-title-time-to-first-fix-and = Tempo até a primeira fixação e energia por fixação

js-kind-title-time-transfer-by-clock-and = Transferência de tempo por relógio e nível de sinal

js-kind-title-trade-conditions = Condições do compromisso

js-kind-title-update-period-trade = Compromisso do período de atualização

js-kind-title-user = Usuário

js-kind-title-user-range-error-through-the = Erro de distância do usuário ao longo da passagem

js-kind-title-validated = Validado

js-kind-title-what-each-stage-hands-to = O que cada etapa entrega à seguinte

js-kind-title-what-this-run-is-and = O que esta execução é, e o que não é

js-kind-title-when-each-monitor-detects = Quando cada monitor detecta

js-kind-title-work-done = Trabalho realizado

js-kind-yes = sim

js-ledger-rows =
    { $n ->
        [one] { $n } linha do registro
        [many] { $n } de linhas do registro
       *[other] { $n } linhas do registro
    }

js-lib-abbr-apv = aproximação com guia vertical

js-lib-abbr-araim = monitoramento autônomo avançado de integridade pelo receptor

js-lib-abbr-auc = área sob a curva

js-lib-abbr-c-n0 = densidade portadora-ruído

js-lib-abbr-ccsds = Comitê Consultivo para Sistemas de Dados Espaciais

js-lib-abbr-cli = interface de linha de comando

js-lib-abbr-csac = relógio atômico em escala de chip

js-lib-abbr-cw = onda contínua

js-lib-abbr-doi = identificador de objeto digital

js-lib-abbr-dop = diluição de precisão

js-lib-abbr-eo = observação da Terra

js-lib-abbr-gnss = sistema global de navegação por satélite

js-lib-abbr-gps = Sistema de Posicionamento Global

js-lib-abbr-hal = limite de alerta horizontal

js-lib-abbr-hpl = nível de proteção horizontal

js-lib-abbr-imu = unidade de medição inercial

js-lib-abbr-ins = sistema de navegação inercial

js-lib-abbr-iot = Internet das Coisas

js-lib-abbr-itu-t = União Internacional de Telecomunicações, Setor de Normalização das Telecomunicações

js-lib-abbr-j-s = relação jammer-sinal

js-lib-abbr-leo = órbita terrestre baixa

js-lib-abbr-llr = telemetria a laser lunar

js-lib-abbr-meo = órbita terrestre média

js-lib-abbr-mtie = erro máximo de intervalo de tempo

js-lib-abbr-ntn = rede não terrestre

js-lib-abbr-ocxo = oscilador a cristal com controle de forno

js-lib-abbr-oem = Mensagem de Efemérides de Órbita

js-lib-abbr-omm = Mensagem de Elementos Médios de Órbita

js-lib-abbr-pdop = diluição de precisão de posição

js-lib-abbr-pnt = posicionamento, navegação e temporização

js-lib-abbr-ppp = posicionamento preciso por ponto

js-lib-abbr-raim = monitoramento autônomo de integridade pelo receptor

js-lib-abbr-rf = radiofrequência

js-lib-abbr-rinex = Formato de Intercâmbio Independente de Receptor

js-lib-abbr-roc = característica de operação do receptor

js-lib-abbr-sbas = sistema de aumento baseado em satélites

js-lib-abbr-sgp4 = Simplified General Perturbations 4, um propagador de órbita

js-lib-abbr-sisre = erro de distância do sinal no espaço

js-lib-abbr-slam = localização e mapeamento simultâneos

js-lib-abbr-spp = posicionamento de ponto único

js-lib-abbr-tdev = desvio de tempo

js-lib-abbr-tle = conjunto de elementos de duas linhas

js-lib-abbr-toml = o formato de arquivo de cenário

js-lib-abbr-trn = navegação referenciada ao terreno

js-lib-abbr-uhf = frequência ultra alta

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

js-lib-compare-timing-rms = RMS da temporização

js-lib-counts-explorer-tally = { $validated } de { $total } capacidades validadas em relação a uma referência independente · { $modelled } modeladas · { $partner } de responsabilidade do parceiro — mostradas aqui como { $cards } cartões de capacidade em { $domains } áreas, { $evidence } afirmações de evidência

js-lib-counts-validated-tally = { $validated } de { $total } capacidades validadas em relação a uma referência independente — mostradas aqui como { $cards } cartões de capacidade e { $evidence } afirmações de evidência

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = o arquivo do motor retornou HTTP { $status }

js-lib-engine-page-not-running = o motor não está em execução aqui

js-lib-engine-worker-crashed = o worker do motor falhou

js-lib-evidence-aria = Evidência: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } linha do registro
        [many] { $n } de linhas do registro
       *[other] { $n } linhas do registro
    }

js-lib-evidence-rows-behind = Linhas do registro por trás deste resultado

js-lib-geometry-url-bad-mc = O número de amostras de Monte Carlo não é um de { $choices }; é usado { $default }.

js-lib-geometry-url-bad-number = "{ $key }" não é um número de { $min } a { $max }; é usado o padrão.

js-lib-geometry-url-bad-site = O local não está no formato latitude,longitude[,altura] dentro do intervalo; é usado o local padrão.

js-lib-geometry-url-bad-sky = O perfil do horizonte não é uma predefinição, uma tabela de 360 intervalos nem um cânion dentro do intervalo; é usado um horizonte aberto.

js-lib-geometry-url-bad-sys = A lista de constelações não é G, E, C e no máximo um L:<predefinição LEO> que esta visualização conhece; é usada a combinação padrão.

js-lib-geometry-url-own-tle = Quem enviou usou seus próprios elementos orbitais (TLE), que um link não carrega; as predefinições são mostradas no lugar.

js-lib-geometry-url-repeated = "{ $key }" aparece mais de uma vez; é usado o primeiro valor.

js-lib-geometry-url-too-long = O endereço tem mais de { $max } caracteres; por isso nenhuma de suas configurações foi lida.

js-lib-geometry-url-unreadable = Não foi possível ler o endereço.

js-lib-guided-duration-s-hint = por quanto tempo propagar o traço no solo

js-lib-guided-duration-s-label = Duração (s)

js-lib-guided-dut1-s-hint = deslocamento da rotação da Terra; desloca o traço no solo para leste/oeste

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = um satélite precisa estar tão alto para contar como visível

js-lib-guided-mask-deg-label = Máscara de elevação (°)

js-lib-guided-seed-hint = uma amostragem de ruído diferente da mesma física

js-lib-guided-seed-label = Semente aleatória

js-lib-guided-sigma-uere-m-hint = erro de distância equivalente do usuário de 1 σ para o resumo de posição

js-lib-guided-sigma-uere-m-label = Erro de distância σ (m)

js-lib-guided-station-lat-deg-hint = latitude da estação terrestre — define a geometria da passagem

js-lib-guided-station-lat-deg-label = Latitude da estação (°)

js-lib-guided-station-lon-deg-hint = longitude da estação terrestre

js-lib-guided-station-lon-deg-label = Longitude da estação (°)

js-lib-guided-step-s-hint = cadência de amostragem do traço no solo

js-lib-guided-step-s-label = Passo de tempo (s)

js-lib-guided-threshold-ns-hint = orçamento dentro da especificação; "disponível" enquanto o erro ficar abaixo dele

js-lib-guided-threshold-ns-label = Limiar da especificação (ns)

js-lib-guided-time-duration-s-hint = duração total da execução

js-lib-guided-time-duration-s-label = Duração (s)

js-lib-guided-time-step-s-hint = cadência de integração / amostragem

js-lib-guided-time-step-s-label = Passo de tempo (s)

js-lib-guided-user-altitude-km-hint = a altitude orbital da espaçonave do usuário

js-lib-guided-user-altitude-km-label = Altitude do usuário (km)

js-lib-guided-user-inclination-deg-hint = a inclinação da órbita do usuário

js-lib-guided-user-inclination-deg-label = Inclinação do usuário (°)

js-lib-imufit-card-accel-slope = Inclinação de Allan do acelerômetro, inicial (cerca de -0,5 para ruído branco)

js-lib-imufit-card-bias = Viés do acelerômetro, média (m/s²)

js-lib-imufit-card-bias-instability = Instabilidade de viés do acelerômetro (m/s²), 0 quando a curva não tem piso

js-lib-imufit-card-gyro-bias = Viés do giroscópio, média (rad/s)

js-lib-imufit-card-gyro-slope = Inclinação de Allan do giroscópio, inicial (cerca de -0,5 para ruído branco)

js-lib-imufit-card-note-n = Nota { $n }

js-lib-imufit-card-q-arw = Passeio aleatório de ângulo do giroscópio, q_arw (rad²/s)

js-lib-imufit-card-q-va = Passeio aleatório de velocidade do acelerômetro, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Taxa de amostragem

js-lib-imufit-card-samples = Amostras

js-lib-imufit-card-span = Intervalo

js-lib-jammertest-card-clean-epochs = Épocas limpas

js-lib-jammertest-card-clean-hours = Horas limpas

js-lib-jammertest-card-detected = Detectado dentro da tolerância

js-lib-jammertest-card-detection-rate = Taxa de detecção (qualquer alarme)

js-lib-jammertest-card-evaluable = Avaliável

js-lib-jammertest-card-fa-epochs = Épocas de falso alarme

js-lib-jammertest-card-fa-per-hour = Ocorrências de falso alarme por hora

js-lib-jammertest-card-fa-runs = Ocorrências de falso alarme

js-lib-jammertest-card-in-tol-rate = Detectado dentro da tolerância, taxa

js-lib-jammertest-card-late = Tardio

js-lib-jammertest-card-median-latency = Latência mediana de detecção

js-lib-jammertest-card-median-recover = Tempo mediano de recuperação

js-lib-jammertest-card-missed = Perdido

js-lib-jammertest-card-na = n/d

js-lib-jammertest-card-not-assessable = Nenhum teste foi avaliável neste registro, por isso nenhuma taxa de detecção nem latência pode ser informada. Isso é um resultado, não uma falha da página: nada aqui é uma aprovação.

js-lib-jammertest-card-not-json = { $name }: não é JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: não é um placar do jammertest (requer tests[] e summary).

js-lib-jammertest-card-tests = Testes na parte do plano

js-lib-jammertest-card-too-large = { $name }: maior que 8 MiB; esta página lê um placar até esse tamanho.

js-lib-kpi-available-everywhere = disponível em todo lugar, em toda época

js-lib-kpi-available-everywhere-pdop = disponível em todo lugar, em toda época (PDOP, diluição de precisão de posição, abaixo de { $thr })

js-lib-kpi-drops-under = cai abaixo do limiar de rastreamento de { $thr } dB-Hz: travamento perdido

js-lib-kpi-end-of-mission = no fim da missão

js-lib-kpi-figure-tiers = Níveis dos valores: { $parts }.

js-lib-kpi-n-modelled =
    { $n ->
        [one] { $n } modelado
        [many] { $n } de modelados
       *[other] { $n } modelados
    }

js-lib-kpi-n-partner = { $n } de responsabilidade do parceiro

js-lib-kpi-n-validated =
    { $n ->
        [one] { $n } validado
        [many] { $n } de validados
       *[other] { $n } validados
    }

js-lib-kpi-no-change = sem alteração

js-lib-kpi-no-fix = { $pct } % do tempo ou dos lugares sem fixação

js-lib-kpi-no-fix-pdop = { $pct } % do tempo ou dos lugares sem fixação com PDOP abaixo de { $thr }

js-lib-kpi-over-jump = acima do limiar de salto de { $thr } m

js-lib-kpi-over-pdop = acima do limiar de PDOP { $thr }

js-lib-kpi-stays-above = permanece acima do limiar de rastreamento de { $thr } dB-Hz

js-lib-kpi-under-jump = abaixo do limiar de salto de { $thr } m

js-lib-kpi-under-pdop = abaixo do limiar de PDOP { $thr }

js-lib-orbit3d-apogee = apogeu

js-lib-orbit3d-perigee = perigeu

js-lib-orbit3d-prov-scenario = cenário { $hash }

js-lib-orbit3d-title = Órbita (ECI, ortográfica)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Viés do relógio

js-lib-overlay-meta-converged-pos-3sigma-m = Posição 3σ

js-lib-overlay-meta-converged-pos-rms-m = RMS da posição

js-lib-overlay-meta-converged-pos-sigma-m = Posição σ

js-lib-overlay-meta-final-clock-freq-sigma = σ da frequência do relógio

js-lib-overlay-meta-mean-relays-in-view = Retransmissores à vista

js-lib-overlay-meta-pos-p95-m = Posição p95

js-lib-overlay-meta-pos-rms-m = RMS da posição

js-lib-overlay-meta-postfit-rms-m = RMS pós-ajuste

js-lib-overlay-prov-scenario = cenário { $hash }

js-lib-overlay-subtitle =
    { $n ->
        [one] |erro| (ns) vs tempo — { $n } execução
        [many] |erro| (ns) vs tempo — { $n } de execuções
       *[other] |erro| (ns) vs tempo — { $n } execuções
    }

js-lib-overlay-time-s = tempo (s)

js-lib-overlay-title = Sobreposição: erro de temporização durante a interrupção

js-lib-packs-cannot-unpack = este navegador não consegue descompactar o arquivo registrado

js-lib-replay-demos-below-130 = Mantidos apenas azimutes abaixo de 130° (informado)

js-lib-replay-demos-coastal-drag-off = Arrasto costeiro

js-lib-replay-demos-combined-event = Evento combinado

js-lib-replay-demos-drag-off-stated = Arrasto de posição (informado pela demonstração)

js-lib-replay-demos-ferry-drag-off = Travessia de balsa, arrasto de posição

js-lib-replay-demos-ferry-drag-off-description = Um registro inventado de balsa, de Tallinn a Helsinque, a 1 Hz. A partir de 1500 s, um arrasto de posição afasta a posição informada enquanto o receptor continua informando uma fixação válida.

js-lib-replay-demos-fjord = Degradação natural em fiorde

js-lib-replay-demos-masked-sky = Travessia de balsa, metade do céu mascarada

js-lib-replay-demos-masked-sky-description = O mesmo registro de balsa com a metade oeste do céu silenciada a partir de 600 s, um céu mais estreito de 900 s a 1200 s e o arrasto a partir de 1500 s: uma única execução em que o céu, o sinal e a posição falham, cada um por vez.

js-lib-replay-demos-open-sea-jamming = Jamming em mar aberto

js-lib-replay-demos-port-approach = Spoofing de tempo na aproximação do porto

js-lib-replay-demos-source-training = Cenário sintético { $id }: o fluxo nmea_training e o registro do instrutor do motor, pontuados pelo receiver-trust dele.

js-lib-replay-demos-source-trust = Registro sintético { $id }: NMEA inventado, pontuado pelo receiver-trust do motor.

js-lib-replay-demos-west-masked = Metade oeste do céu mascarada (informado)

js-lib-replay-demos-west-masked-again = Metade oeste mascarada novamente (informado)

js-lib-report-charts = Gráficos

js-lib-report-eyebrow = o instante preciso

js-lib-report-figures-of-merit = Figuras de mérito

js-lib-report-footer = Kshana { $version } · cenário { $hash } · gerado em { $iso }. Reproduzível a partir de cenário + semente + versão do motor. Executa localmente; nada é enviado.

js-lib-report-not-applicable = não aplicável (nenhum ataque configurado)

js-lib-report-scenario-definition = Definição do cenário (TOML)

js-lib-report-th-clock = Relógio

js-lib-report-th-metric = Métrica

js-lib-report-th-validation = Validação

js-lib-report-th-value = Valor

js-lib-report-tier-note = Cada figura de mérito é marcada como { $validated } (verificada em relação a uma referência independente) ou { $modelled } (a partir de primeiros princípios, testada internamente) — derivada da matriz de verificação.

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
        [one] { $listed } satélite listado, { $heard } com sinal, média { $snr } dB-Hz
        [many] { $listed } de satélites listados, { $heard } com sinal, média { $snr } dB-Hz
       *[other] { $listed } satélites listados, { $heard } com sinal, média { $snr } dB-Hz
    }

js-lib-skydraw-east = L

js-lib-skydraw-no-signal-from = nenhum sinal de { $sectors }

js-lib-skydraw-none-listed = Nenhum satélite listado no registro neste momento.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: elevação { $el }, azimute { $az }, sinal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: elevação { $el }, azimute { $az }, listado, sem sinal

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satélites listados entre os azimutes { $from } e { $to } graus, nenhum com sinal

js-lib-skydraw-west = O

js-lib-skyline-edit-describe = Perfil do horizonte sobre { $blocked } de 360 graus de azimute; máximo de { $el }° no azimute { $az }°.

js-lib-skyline-edit-open = Horizonte aberto: sem perfil do horizonte.

js-lib-stages-all-planets = Todos os planetas

js-lib-stages-au-from-sun = { $d } au do Sol

js-lib-stages-band-carrier = Portadora { $name }, { $mhz } MHz

js-lib-stages-bin-title =
    { $count ->
        [one] { $from } a { $to }{ $unit }: { $count } execução
        [many] { $from } a { $to }{ $unit }: { $count } de execuções
       *[other] { $from } a { $to }{ $unit }: { $count } execuções
    }

js-lib-stages-body-and-moons = { $name } e suas luas

js-lib-stages-cell-title = lat { $lat }°, lon { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Mensagem de navegação

js-lib-stages-chain-pass = Passagem e enlace

js-lib-stages-chain-ppp = Posicionamento preciso por ponto

js-lib-stages-chain-pvt = Posicionamento fundido

js-lib-stages-chain-signal = Projeto do sinal

js-lib-stages-coverage-aria = { $field } sobre { $body }, por latitude e longitude

js-lib-stages-feature-n = feição { $n }

js-lib-stages-flag = sinalizador

js-lib-stages-frequency-mhz = frequência (MHz)

js-lib-stages-from-to = { $from } a { $to }

js-lib-stages-geojson-aria = A exportação GeoJSON desenhada em um mapa

js-lib-stages-histogram = Histograma

js-lib-stages-inner-planets = Planetas internos

js-lib-stages-km-from-centre = { $d } km de { $centre }

js-lib-stages-linear-scale = escala linear

js-lib-stages-link-light-time = { $from } a { $to }: tempo de luz de ida { $time } s

js-lib-stages-longitude-axis = longitude · latitude ao longo do lado

js-lib-stages-mission-time = tempo da missão (s)

js-lib-stages-noise-floor = piso de ruído

js-lib-stages-orrery-note = { $scale } · plano x-y do referencial, visto do seu polo norte

js-lib-stages-panel-n = Painel { $n }

js-lib-stages-plan-view-aria = Vista em planta de { $centre } e dos corpos ao redor, { $scale }

js-lib-stages-psd-at-t = Densidade espectral de potência em t = { $t } s

js-lib-stages-psd-axis = densidade espectral de potência (dBW/Hz)

js-lib-stages-runs = execuções

js-lib-stages-sat-title = { $constellation } { $id } · lat { $lat }°, lon { $lon }°

js-lib-stages-satellites = satélites

js-lib-stages-spectrum-at-t = espectro em t = { $t } s

js-lib-stages-sqrt-scale = escala de distância de raiz quadrada

js-lib-stages-the-body = o corpo

js-lib-stages-time-s = tempo (s)

js-lib-stages-unit-alarm = Alarme

js-lib-stages-unit-cn0 = Densidade portadora-ruído

js-lib-stages-unit-position = Posição e proteção

js-lib-stages-unit-satellites = Satélites

js-lib-stages-unit-time-error = Erro de tempo

js-lib-stages-waterfall-aria = Cascata de densidade espectral de potência: frequência na horizontal, tempo para baixo

js-lib-stages-whole-band = Banda inteira

js-lib-sweep-clock-availability = Disponibilidade de { $who }

js-lib-sweep-clock-holdover = Holdover de { $who } (s)

js-lib-sweep-clock-timing-p95 = Temporização p95 de { $who } (ns)

js-lib-sweep-clock-timing-rms = RMS da temporização de { $who } (ns)

js-lib-sweep-max-altitude = altitude máxima (km)

js-lib-sweep-max-elevation = elevação máxima (°)

js-lib-sweep-max-speed = velocidade máxima (m/s)

js-lib-sweep-min-altitude = altitude mínima (km)

js-lib-sweep-peak-doppler = Doppler de pico (Hz)

js-lib-sweep-prov-scenario = cenário { $hash }

js-lib-sweep-y-vs-x = { $y } vs { $x }

js-lib-tabs-3d-orbit = Órbita 3D

js-lib-tabs-figures-of-merit = Figuras de mérito

js-lib-tabs-stability = Estabilidade

js-lib-tabs-sweep = Varredura

js-lib-tabs-time-series = Séries temporais

js-lib-tour-ashforde-body = Obrigado por explorar o Kshana. Construímos engenharia aberta, reprodutível e baseada primeiro em evidências para missões que não podem falhar — honesta sobre o que é validado e o que é modelado. Perguntas, uma colaboração ou um estudo? Fale conosco em contact@ashforde.org.

js-lib-tour-ashforde-title = Da Ashforde® OÜ

js-lib-tour-capabilities-body = Escolha uma aba de área — Órbitas, Temporização, Inercial, GNSS, Resiliência, Lunar, IA/ML, Interoperabilidade — para ver suas capacidades, cada uma rotulada como Validada ou Modelada, com um botão ▸ executar para os cenários elaborados. Abra “Evidências e proveniência” em qualquer área para rastrear a prova, ou ative “Somente validadas” para mostrar apenas o que é verificado em relação a uma referência independente.

js-lib-tour-capabilities-title = Explore o motor, uma área de cada vez

js-lib-tour-cite-body = O Kshana é construído para ser referenciado — uma versão de software citável, com um DOI, além de artigos em estilo de pares sobre a lacuna de otimismo nas degradações de RF e um nível de proteção de temporização condicional. Copie a citação diretamente daqui.

js-lib-tour-cite-title = Publicações e como citar

js-lib-tour-download-report-body = A aba Varredura varia um parâmetro ao longo de um intervalo; “Fixar para comparar” sobrepõe duas ou mais execuções lado a lado com o Δ entre elas (funciona entre tipos de cenário — relógio, PNT em Marte, posicionamento…); e este botão baixa a execução como um relatório HTML autônomo, para uso offline.

js-lib-tour-download-report-title = Varrer, comparar e exportar

js-lib-tour-guided-body = Os controles guiados se adaptam ao cenário — semente, limiar da especificação, duração, máscara de elevação, altitude da órbita — e cada alteração reexecuta na hora.

js-lib-tour-guided-title = Ajuste os controles deslizantes

js-lib-tour-mcp-body = Um servidor MCP permite que assistentes de IA executem o motor validado em vez de adivinhar; um plugin do JetBrains executa cenários com um clique com o botão direito.

js-lib-tour-mcp-title = Use-o a partir de um agente de IA ou da sua IDE

js-lib-tour-playground-body = Escolha um cenário na lista suspensa — ou clique em ▸ executar em qualquer capacidade acima — e o motor roda como WebAssembly na sua máquina. Nada é enviado.

js-lib-tour-playground-title = Execute no seu navegador

js-lib-tour-run-body = Execute o cenário atual. Abra “Avançado” para editar o TOML e alterar qualquer coisa; “Copiar link de compartilhamento” reproduz esta mesma execução para outra pessoa.

js-lib-tour-run-title = Execute

js-lib-tour-tabs-body = Alterne entre as figuras de mérito, o gráfico de séries temporais, a estabilidade do relógio (desvio de Allan) e, nas execuções de órbita, uma visão 3D interativa da órbita.

js-lib-tour-tabs-title = Leia os resultados

js-lib-tour-validation-body = O mesmo explorador é também o registro de evidências: cada área traz uma gaveta “Evidências e proveniência” — o valor, a referência independente em relação à qual ele é verificado e um estado Validado / Modelado honesto para cada afirmação. “Somente validadas” filtra para as linhas verificadas por conjunto de dados.

js-lib-tour-validation-title = Evidências, não adjetivos

js-lib-views-3-sigma-bound = limite de 3 sigma

js-lib-views-3d-position-error = Erro de posição 3D

js-lib-views-a-parameter = um parâmetro

js-lib-views-band-runs = Faixa de erro de tempo em { $runs } execuções de Monte Carlo

js-lib-views-band-the-runs = Faixa de erro de tempo nas execuções de Monte Carlo

js-lib-views-below-tracking = abaixo do limiar de rastreamento

js-lib-views-chart = gráfico

js-lib-views-classical = clássico

js-lib-views-epoch = época

js-lib-views-four-needed = 4 necessários para uma fixação

js-lib-views-free-inertial = inercial livre

js-lib-views-gnss-denied = GNSS negado

js-lib-views-ground-track = Traço no solo

js-lib-views-heatmap-effective = Densidade portadora-ruído efetiva por satélite e tempo

js-lib-views-heatmap-nominal = Densidade portadora-ruído nominal (sem jammer) por satélite e tempo

js-lib-views-horizontal-alert-limit = limite de alerta horizontal

js-lib-views-horizontal-hpl = horizontal (HPL)

js-lib-views-id-bound = limite de { $id }

js-lib-views-id-median = mediana de { $id }

js-lib-views-id-offset = deslocamento de { $id }

js-lib-views-id-p95 = p95 de { $id }

js-lib-views-map-matched = casado com o mapa

js-lib-views-map-matched-title = Casado com o mapa contra erro de posição inercial livre

js-lib-views-metric = métrica

js-lib-views-oscillator = oscilador

js-lib-views-oscillator-source = oscilador ({ $source })

js-lib-views-position-error-axis = erro de posição ({ $unit })

js-lib-views-position-error-m = erro de posição (m)

js-lib-views-position-error-run = Erro de posição ao longo da execução
