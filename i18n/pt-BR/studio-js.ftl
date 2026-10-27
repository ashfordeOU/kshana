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

js-cat-lunar-station-coverage-public-sources-question = Apenas com as hipóteses declaradas publicamente, que erro corrigido a estação oferece sobre o polo sul? O resultado é dominado pelos elementos orbitais, que não são públicos e foram definidos como ILLUSTRATIVE; esta é a entrada da previsão congelada. (modelado; não é uma afirmação sobre nenhum sistema real)

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

js-kind-note-parameters-are-public-with-a = Os parâmetros são PUBLIC (com uma fonte), REPRESENTATIVE ou WORKSHOP, conforme cada predefinição indica.

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

# 2026-10-01-studio-rebuild/lib/views.mjs:186
js-lib-views-position-m = posição (m)

# 2026-10-01-studio-rebuild/lib/views.mjs:98
js-lib-views-predicted-time-error = Erro de tempo previsto desde a última solução de posição

# 2026-10-01-studio-rebuild/lib/views.mjs:142
js-lib-views-protection-level-m = nível de proteção (m)

# 2026-10-01-studio-rebuild/lib/views.mjs:141
js-lib-views-protection-levels = Níveis de proteção em relação ao limite de alerta

# 2026-10-01-studio-rebuild/lib/views.mjs:78
js-lib-views-quantum = quântico

# 2026-10-01-studio-rebuild/lib/views.mjs:185
js-lib-views-relay-error-bound = Erro de posição da navegação por retransmissão e seu limite de 3 sigma

# 2026-10-01-studio-rebuild/lib/views.mjs:116
js-lib-views-satellites = satélites

# 2026-10-01-studio-rebuild/lib/views.mjs:114
js-lib-views-satellites-tracking = Satélites visíveis e ainda rastreados

# 2026-10-01-studio-rebuild/lib/views.mjs:482
js-lib-views-shaded-gnss-denied = sombreado: GNSS negado

# 2026-10-01-studio-rebuild/lib/views.mjs:105
js-lib-views-slot-guard = guarda do intervalo de tempo

# 2026-10-01-studio-rebuild/lib/views.mjs:161
js-lib-views-spoofed-offset = Deslocamento de tempo falsificado em relação ao limite de detecção

# 2026-10-01-studio-rebuild/lib/views.mjs:166
js-lib-views-sweep-of = Varredura de { $parameter }: { $metric }

# 2026-10-01-studio-rebuild/lib/views.mjs:57
js-lib-views-sync-error-axis = erro de sincronização ({ $unit })

# 2026-10-01-studio-rebuild/lib/views.mjs:57
js-lib-views-sync-error-run = Erro de sincronização ao longo da execução

# 2026-10-01-studio-rebuild/lib/views.mjs:531
js-lib-views-threshold = limiar

# 2026-10-01-studio-rebuild/lib/views.mjs:100
js-lib-views-time-error-ns = erro de tempo (ns)

# 2026-10-01-studio-rebuild/lib/views.mjs:161
js-lib-views-time-ns = tempo (ns)

# 2026-10-01-studio-rebuild/lib/views.mjs:87
js-lib-views-time-s = tempo (s)

# 2026-10-01-studio-rebuild/lib/views.mjs:99
js-lib-views-time-since-fix = tempo desde a última solução de posição (s)

# 2026-10-01-studio-rebuild/lib/views.mjs:58
js-lib-views-timing-error-axis = erro de temporização ({ $unit })

# 2026-10-01-studio-rebuild/lib/views.mjs:58
js-lib-views-timing-error-run = Erro de temporização ao longo da execução

# 2026-10-01-studio-rebuild/lib/views.mjs:120
js-lib-views-tracking = rastreados

# 2026-10-01-studio-rebuild/lib/views.mjs:167
js-lib-views-value = valor

# 2026-10-01-studio-rebuild/lib/views.mjs:145
js-lib-views-vertical-vpl = vertical (VPL)

# 2026-10-01-studio-rebuild/lib/views.mjs:119
js-lib-views-visible = visíveis

# 2026-10-01-studio-rebuild/lib/views.mjs:390
js-lib-views-word-enbw = largura de banda equivalente de ruído

# 2026-10-01-studio-rebuild/lib/views.mjs:391
js-lib-views-word-nfft = comprimento da FFT

# 2026-10-01-studio-rebuild/lib/views.mjs:388
js-lib-views-word-stec = TEC oblíquo

# 2026-10-01-studio-rebuild/lib/views.mjs:393
js-lib-views-word-toa = tempo de chegada

# 2026-10-01-studio-rebuild/lib/views.mjs:392
js-lib-views-word-ttff = tempo até a primeira solução de posição

# 2026-10-01-studio-rebuild/lib/views.mjs:389
js-lib-views-word-tx = transmitir

# 2026-10-01-studio-rebuild/lib/views.mjs:394
js-lib-views-word-zwd = atraso zenital úmido

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:146
js-lunar-address-outside-range = { $label }: "{ $raw }" está fora do intervalo de { $min } a { $max }; o valor do arquivo é usado.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:139
js-lunar-address-too-long = O endereço era longo demais; os valores padrão são exibidos.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:142
js-lunar-address-unknown-source = Fonte desconhecida no endereço; a gravação é exibida.

# 2026-10-01-studio-rebuild/lunar/lunar.js:181
js-lunar-alert-limit = limite de alerta { $value } (ilustrativo)

# 2026-10-01-studio-rebuild/lunar/lunar.js:181
js-lunar-alert-not-stated = limite de alerta não informado

# 2026-10-01-studio-rebuild/lunar/lunar.js:146
js-lunar-bearing-east = 90° E

# 2026-10-01-studio-rebuild/lunar/lunar.js:146
js-lunar-bearing-west = 90° W

# 2026-10-01-studio-rebuild/lunar/lunar.js:141
js-lunar-cell-title = { $lat }°, { $lon }°: corrigido { $corrected }, disponibilidade { $availability }, cobertura { $coverage }

# 2026-10-01-studio-rebuild/lunar/lunar.js:245
js-lunar-copy-address = Copie o endereço da barra de endereços.

# 2026-10-01-studio-rebuild/lunar/lunar.js:183
js-lunar-counts = { $sats } satélites, { $points } pontos de grade, { $epochs } épocas, { $trials } ensaios Monte Carlo por época. Rótulo: { $label }.

# 2026-10-01-studio-rebuild/lunar/lunar.js:76
js-lunar-engine-no-start = O motor não pôde ser iniciado neste navegador ({ $reason }). Abra um arquivo de resultado.

# 2026-10-01-studio-rebuild/lunar/lunar.js:90
js-lunar-engine-unknown-kind = Este motor ({ $version }) não conhece o tipo { $kind }; é necessário o motor 0.36.

# 2026-10-01-studio-rebuild/lunar/lunar.js:210
js-lunar-fig-availability-region = Disponibilidade na região

# 2026-10-01-studio-rebuild/lunar/lunar.js:176
js-lunar-fig-corrected-3d = Erro corrigido, { $n } %, 3‑D

# 2026-10-01-studio-rebuild/lunar/lunar.js:179
js-lunar-fig-coverage = Cobertura

# 2026-10-01-studio-rebuild/lunar/lunar.js:179
js-lunar-fig-epochs-within = épocas dentro de { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:176
js-lunar-fig-horizontal-vertical = horizontal { $h }, vertical { $v }

# 2026-10-01-studio-rebuild/lunar/lunar.js:181
js-lunar-fig-hpl-below-alert = HPL abaixo do limite de alerta

# 2026-10-01-studio-rebuild/lunar/lunar.js:180
js-lunar-fig-hpl-vpl = HPL, VPL no máximo

# 2026-10-01-studio-rebuild/lunar/lunar.js:178
js-lunar-fig-improvement = Fator de melhoria

# 2026-10-01-studio-rebuild/lunar/lunar.js:212
js-lunar-fig-lowest-point = Menor valor em um ponto

# 2026-10-01-studio-rebuild/lunar/lunar.js:211
js-lunar-fig-points-always-available = Pontos disponíveis em todas as épocas

# 2026-10-01-studio-rebuild/lunar/lunar.js:177
js-lunar-fig-uncorrected-3d = Erro não corrigido, { $n } %, 3‑D

# 2026-10-01-studio-rebuild/lunar/lunar.js:182
js-lunar-fig-worst-point = Pior ponto

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:54
js-lunar-file-not-json = Este arquivo não é JSON.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:55
js-lunar-file-not-object = Este arquivo não é um objeto JSON.

# 2026-10-01-studio-rebuild/lunar/lunar.js:97
js-lunar-file-too-large = { $name }: maior que 32 MiB; esta página lê arquivos de resultado de até esse tamanho.

# 2026-10-01-studio-rebuild/lunar/lunar.js:47
js-lunar-file-value = arquivo: { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:211
js-lunar-full-of-total = { $full } de { $total }

# 2026-10-01-studio-rebuild/lunar/lunar.js:56
js-lunar-give-value = { $label }: informe um valor de { $min } a { $max }.

# 2026-10-01-studio-rebuild/lunar/lunar.js:56
js-lunar-give-whole-value = { $label }: informe um valor de { $min } a { $max } (um número inteiro).

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:19
js-lunar-honesty-affiliation = Sem afiliação nem aval de qualquer agência.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:18
js-lunar-honesty-assumptions = Sob as premissas públicas declaradas; não é uma afirmação sobre o desempenho de nenhum sistema real.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:130
js-lunar-in-grid-spacing = Espaçamento dos anéis da grade, graus

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:127
js-lunar-in-latency = Latência da correção, segundos

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:131
js-lunar-in-seed = Semente

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:123
js-lunar-in-station-lat = Latitude da estação, graus

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:124
js-lunar-in-station-lon = Longitude da estação, graus

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:126
js-lunar-in-survey-error = Erro de levantamento da estação (1 sigma), metros

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:125
js-lunar-in-threshold = Limiar de exatidão, metros

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:129
js-lunar-in-time-step = Passo de tempo, segundos

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:128
js-lunar-in-trials = Ensaios Monte Carlo por época

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:172
js-lunar-input-out-of-range = { $label } está fora do intervalo.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:58
js-lunar-json-field-not-json = O campo json do arquivo não é JSON.

# 2026-10-01-studio-rebuild/lunar/lunar.js:113
js-lunar-key-50-or-more = 50 % ou mais

# 2026-10-01-studio-rebuild/lunar/lunar.js:113
js-lunar-key-90-or-more = 90 % ou mais

# 2026-10-01-studio-rebuild/lunar/lunar.js:113
js-lunar-key-95-or-more = 95 % ou mais

# 2026-10-01-studio-rebuild/lunar/lunar.js:113
js-lunar-key-99-or-more = 99 % ou mais

# 2026-10-01-studio-rebuild/lunar/lunar.js:115
js-lunar-key-above = acima de { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:116
js-lunar-key-above-threshold = acima de { $value } × limiar

# 2026-10-01-studio-rebuild/lunar/lunar.js:113
js-lunar-key-below-50 = abaixo de 50 %

# 2026-10-01-studio-rebuild/lunar/lunar.js:115
js-lunar-key-between = de { $from } a { $to }

# 2026-10-01-studio-rebuild/lunar/lunar.js:116
js-lunar-key-between-threshold = de { $from } a { $to } × limiar

# 2026-10-01-studio-rebuild/lunar/lunar.js:115
js-lunar-key-up-to = até { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:116
js-lunar-key-up-to-threshold = até { $value } × limiar

# 2026-10-01-studio-rebuild/lunar/lunar.js:117
js-lunar-layer-availability = disponibilidade

# 2026-10-01-studio-rebuild/lunar/lunar.js:118
js-lunar-layer-coverage = cobertura

# 2026-10-01-studio-rebuild/lunar/lunar.js:116
js-lunar-layer-error = erro corrigido

# 2026-10-01-studio-rebuild/lunar/lunar.js:115
js-lunar-layer-range = erro corrigido na sua própria faixa

# 2026-10-01-studio-rebuild/lunar/lunar.js:165
js-lunar-legend-no-figure = sem valor (indisponível durante todo o período)

# 2026-10-01-studio-rebuild/lunar/lunar.js:167
js-lunar-legend-radius = raio de cobertura

# 2026-10-01-studio-rebuild/lunar/lunar.js:166
js-lunar-legend-threshold = limiar, { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:169
js-lunar-legend-worst = pior ponto

# 2026-10-01-studio-rebuild/lunar/lunar.js:245
js-lunar-link-copied = Link copiado.

# 2026-10-01-studio-rebuild/lunar/lunar.js:161
js-lunar-map-desc = { $points } pontos de grade do polo até { $rim }° de latitude. { $meet } deles têm um erro corrigido do percentil { $percentile } dentro do limiar de { $threshold }. Colorido por { $layer }. A estação está em { $lat }°, { $lon }°.

# 2026-10-01-studio-rebuild/lunar/lunar.js:137
js-lunar-map-note-one-band = { $share } % dos pontos caem em uma única faixa da escala de limiar, portanto o mapa mostra pouca variação: colora por "sua própria faixa" para ver como o erro varia pela região.

# 2026-10-01-studio-rebuild/lunar/lunar.js:80
js-lunar-needs-newer-engine = Este estudo requer o motor { $need } ou posterior; o motor em execução aqui é o v{ $version }. A gravação ou um arquivo de resultado ainda pode ser exibido.

# 2026-10-01-studio-rebuild/lunar/lunar.js:203
js-lunar-no = não

# 2026-10-01-studio-rebuild/lunar/lunar.js:67
js-lunar-no-recording = Ainda não há gravação deste estudo: ela é feita na versão com o motor 0.36. Execute-o aqui com um motor que tenha esse tipo ou abra um arquivo de resultado.

# 2026-10-01-studio-rebuild/lunar/lunar.js:72
js-lunar-no-scenario = Este site ainda não tem { $file }: ele chega com o motor 0.36. Abra um arquivo de resultado.

# 2026-10-01-studio-rebuild/lunar/lunar.js:262
js-lunar-no-scenario-note = Este site ainda não tem { $file } (ele chega com o motor 0.36), portanto não é possível executar aqui; abra um arquivo de resultado.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:61
js-lunar-not-report = Este não é um relatório { $kind }.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:284
js-lunar-not-stated = não informado

# 2026-10-01-studio-rebuild/lunar/lunar.js:237
js-lunar-note-none = O arquivo não informa nenhuma nota.

# 2026-10-01-studio-rebuild/lunar/lunar.js:237
js-lunar-note-withheld = A declaração do próprio arquivo cita um programa ou uma agência, por isso esta página não a exibe; vale a declaração no topo da página.

# 2026-10-01-studio-rebuild/lunar/lunar.js:215
js-lunar-point-epochs-reason = pontos-época: { $reason }

# 2026-10-01-studio-rebuild/lunar/lunar.js:200
js-lunar-radius-desc = Raio de cobertura em { $count } azimutes: o menor { $lo } km a { $loAz }°, o maior { $hi } km a { $hiAz }°.

# 2026-10-01-studio-rebuild/lunar/lunar.js:200
js-lunar-radius-desc-limited =
    { $count ->
        [one] { $count } alcança a borda da grade, portanto a cobertura chega pelo menos até essa distância ali.
        [many] { $count } alcançam a borda da grade, portanto a cobertura chega pelo menos até essa distância ali.
       *[other] { $count } alcançam a borda da grade, portanto a cobertura chega pelo menos até essa distância ali.
    }

# 2026-10-01-studio-rebuild/lunar/lunar.js:202
js-lunar-radius-hollow = Pontos vazados alcançam a borda da grade: a cobertura se mantém pelo menos até essa distância ao longo dessa direção.

# 2026-10-01-studio-rebuild/lunar/lunar.js:200
js-lunar-radius-none = O relatório não informa nenhum raio de cobertura.

# 2026-10-01-studio-rebuild/lunar/lunar.js:151
js-lunar-radius-per-azimuth = raio de cobertura por azimute

# 2026-10-01-studio-rebuild/lunar/lunar.js:196
js-lunar-radius-point = { $az }°: { $km } km

# 2026-10-01-studio-rebuild/lunar/lunar.js:196
js-lunar-radius-point-limited = { $az }°: { $km } km (alcança a borda da grade: pelo menos essa distância)

# 2026-10-01-studio-rebuild/lunar/lunar.js:202
js-lunar-radius-zero = Em toda direção a cobertura já está abaixo de 95 % na própria estação, portanto o raio é de 0 km: ali o erro corrigido excede o limiar de { $value }.

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:39
js-lunar-reason-station-missing = a estação não vê todos os satélites que o usuário utiliza

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:38
js-lunar-reason-user-lt4 = menos de quatro satélites à vista do usuário

# 2026-10-01-studio-rebuild/lunar/lunar.js:90
js-lunar-run-stopped = A execução foi interrompida: { $message }

# 2026-10-01-studio-rebuild/lunar/lunar.js:84
js-lunar-running = Executando o estudo neste navegador…

# 2026-10-01-studio-rebuild/lunar/lunar.js:83
js-lunar-running-elapsed = Executando o estudo neste navegador… { $seconds } s

# 2026-10-01-studio-rebuild/lib/lunar-station.mjs:177
js-lunar-scenario-missing-keys = O arquivo de cenário não tem { $keys }; ele não pode ser alterado aqui.

# 2026-10-01-studio-rebuild/lunar/lunar.js:108
js-lunar-set-inputs = Defina as entradas e pressione Run it here.

# 2026-10-01-studio-rebuild/lunar/lunar.js:104
js-lunar-showing = Exibindo { $what }.

# 2026-10-01-studio-rebuild/lunar/lunar.js:104
js-lunar-showing-engine = Exibindo { $what } (motor { $version }).

# 2026-10-01-studio-rebuild/lunar/lunar.js:102
js-lunar-source-error = { $what }: { $error }

# 2026-10-01-studio-rebuild/lunar/lunar.js:157
js-lunar-station = estação

# 2026-10-01-studio-rebuild/lunar/lunar.js:156
js-lunar-station-title = estação { $lat }°, { $lon }°

# 2026-10-01-studio-rebuild/lunar/lunar.js:222
js-lunar-table-count =
    { $n ->
        [one] { $n } ponto, o mais próximo da estação primeiro.
        [many] { $n } de pontos, os mais próximos da estação primeiro.
       *[other] { $n } pontos, os mais próximos da estação primeiro.
    }

# 2026-10-01-studio-rebuild/lunar/lunar.js:219
js-lunar-th-corrected = Erro corrigido, { $n } %

# 2026-10-01-studio-rebuild/lunar/lunar.js:147
js-lunar-threshold-title = erro corrigido { $value } (o limiar)

# 2026-10-01-studio-rebuild/lunar/lunar.js:98
js-lunar-what-file = o arquivo { $name }

# 2026-10-01-studio-rebuild/lunar/lunar.js:68
js-lunar-what-recording = a gravação que acompanha o Studio

# 2026-10-01-studio-rebuild/lunar/lunar.js:87
js-lunar-what-run = uma execução neste navegador (motor { $version })

# 2026-10-01-studio-rebuild/lunar/lunar.js:182
js-lunar-worst-at = em { $lat }°, { $lon }°

# 2026-10-01-studio-rebuild/lunar/lunar.js:153
js-lunar-worst-title = pior ponto { $lat }°, { $lon }°: { $value }

# 2026-10-01-studio-rebuild/lunar/lunar.js:203
js-lunar-yes-at-least = sim: pelo menos essa distância

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:92
js-lunarinfra-above-95-point = acima do ponto de 95 %

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:57
js-lunarinfra-advisory = Software de caráter consultivo, não um equipamento homologado; nenhum caminho de transmissão de qualquer tipo.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:106
js-lunarinfra-arc-note = Comprimento de onda da portadora { $value } m.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:106
js-lunarinfra-arc-title = Cada arco

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:16
js-lunarinfra-bars-not-loaded = o arquivo de limiares não foi carregado

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:19
js-lunarinfra-bars-not-shown = Os limiares fixados antecipadamente não puderam ser exibidos ({ $reason }).

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:136
js-lunarinfra-bars-note = Fixados antes de qualquer estudo ser avaliado, com os veredictos registrados (commit do motor { $commit }). Nada é VALIDATED; um limiar marcado como NOT MET é fixado por um teste que afirma a falha, e nenhum foi afrouxado.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:136
js-lunarinfra-bars-title = Em relação aos limiares fixados antecipadamente

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:63
js-lunarinfra-bars-wrong-file = o arquivo de limiares não é o que esta página lê

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:20
js-lunarinfra-blurb-carrier-phase = Uma estação de superfície e um orbitador usando fase da portadora de dupla diferença dos sinais GNSS terrestres: é possível fixar as ambiguidades inteiras e o que isso faz com o limite de posição? O exemplo de execução rápida.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:21
js-lunarinfra-blurb-frame-coestimation = Os sete parâmetros do datum lunar a partir de medições a laser de estações na Terra, com e sem distâncias entre o orbitador e a estação de superfície: quanto a informação melhora?

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:23
js-lunarinfra-blurb-geodesy-sensitivity = Qual é a sensibilidade da medição a laser, do rastreamento de orbitador, de um gravímetro e de um relógio de superfície aos números de Love de maré da Lua h2, k2 e l2 e à sua libração física?

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:19
js-lunarinfra-blurb-od-consistency = Determinação de órbita a bordo com GNSS terrestre em uma órbita de halo quase retilínea, comparada a uma solução radiométrica independente em solo do mesmo arco: as duas concordam dentro de suas incertezas declaradas, e a verificação de consistência percebe um erro de modelagem quando um é injetado? Exibidas lado a lado.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:22
js-lunarinfra-blurb-space-tie = GNSS, VLBI e medição a laser em uma única espaçonave: com que precisão é possível amarrar os deslocamentos entre as três técnicas, em comparação com o erro da amarração local na espaçonave?

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:105
js-lunarinfra-bound-label = Incerteza de posição, float e fixa, escala logarítmica

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:104
js-lunarinfra-bound-note = Incerteza de posição de um sigma da estação e do orbitador com as ambiguidades deixadas float e com elas fixadas (o que a fixação daria se fosse alcançada).

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:104
js-lunarinfra-bound-title = Limite de posição, float e fixo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:69
js-lunarinfra-chip-na = n/d

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-comp-normal = normal

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-comp-position = posição (3-D)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-comp-radial = radial

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-comp-transverse = transversal

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:115
js-lunarinfra-compare-note = Em { $sets } conjuntos aleatórios de estações, o menor autovalor não foi menor com os enlaces do orbitador em { $lambda } e o traço não foi maior em { $trace }; o aumento mediano do menor autovalor foi de { $median } vezes.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:115
js-lunarinfra-compare-title = A comparação em números

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:114
js-lunarinfra-crsigma-label = Sigma de Cramér-Rao, escala logarítmica

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:113
js-lunarinfra-crsigma-note = Em metros na superfície.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:113
js-lunarinfra-crsigma-title = Sigma de Cramér-Rao por parâmetro

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:143
js-lunarinfra-days = { $n } dias

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:112
js-lunarinfra-direction = direção { $n }

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:54
js-lunarinfra-disclosures = Divulgações

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:112
js-lunarinfra-eig-label = Autovalores de informação, escala logarítmica

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:111
js-lunarinfra-eig-note = Os sete autovalores da matriz de informação, do menor ao maior, sem e com os enlaces entre o orbitador e a estação. O menor aumenta { $times } vezes, e o traço de Cramér-Rao cai para { $share } do seu valor. Isso pressupõe que a órbita é conhecida nos eixos lunares (seu erro é carregado pelo sigma de distância do orbitador).

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:111
js-lunarinfra-eig-title = Informação em cada direção do datum

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:143
js-lunarinfra-fact-arc = Arco

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:142
js-lunarinfra-fact-hash = Hash do cenário

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:145
js-lunarinfra-fact-llr-rows = Linhas de medição a laser

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:143
js-lunarinfra-fact-orbit-family = Família de órbita

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:145
js-lunarinfra-fact-orbiter-arc = Arco do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:145
js-lunarinfra-fact-orbiter-rows = Linhas do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:141
js-lunarinfra-fact-study = Estudo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:144
js-lunarinfra-fact-wavelength = Comprimento de onda da portadora

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:131
js-lunarinfra-families-note = O RMS da derivada parcial de cada parâmetro sobre as linhas da família e o número de linhas. Um zero é um parâmetro para o qual essa família é cega. A sensibilidade a k2 da família do orbitador é um valor de limite superior.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:131
js-lunarinfra-families-title = O que cada família enxerga

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:54
js-lunarinfra-findings = Constatações

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:102
js-lunarinfra-fix-note-a = A parcela dos ensaios Monte Carlo que fixou corretamente todas as ambiguidades inteiras (com seu erro-padrão) e a taxa que a estimativa por bootstrap prevê.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:102
js-lunarinfra-fix-note-b = A fixação de inteiros NÃO é alcançada nesta entrada: o melhor arco fixa { $share } dos ensaios.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:102
js-lunarinfra-fix-note-c = Não há tempo de fixação a mostrar, porque a fixação não é alcançada.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:103
js-lunarinfra-fix-rate-label = Taxa de fixação de inteiros em função do comprimento do arco

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:102
js-lunarinfra-fix-title = Taxa de fixação em função do comprimento do arco

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:105
js-lunarinfra-fixed = fixa

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:105
js-lunarinfra-float = float

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:92
js-lunarinfra-fraction-above-95 = Fração dos ensaios acima do ponto de 95 %

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-ground-radiometric = radiométrica independente em solo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:89
js-lunarinfra-injected-error = erro injetado { $value } m/s²

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:92
js-lunarinfra-mean-consistency = Estatística de consistência média

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:92
js-lunarinfra-mean-q = q médio

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:79
js-lunarinfra-miss-line = { $id } está { $status }: { $value }

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:81
js-lunarinfra-miss-no-fix = A fixação de ambiguidades inteiras NÃO é alcançada nesta entrada: o melhor arco fixa { $share } dos ensaios Monte Carlo.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:72
js-lunarinfra-na = n/d

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:89
js-lunarinfra-nominal = nominal

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:30
js-lunarinfra-not-result = este não é um resultado de infraestrutura lunar

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:54
js-lunarinfra-not-verified = Não verificado

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:122
js-lunarinfra-offset-precision-label = Precisão do deslocamento em relação à amarração local, log-log

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:123
js-lunarinfra-offsets-note = Sigma de translação por eixo, sigma de escala e de rotação na superfície, em metros.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:123
js-lunarinfra-offsets-title = Os deslocamentos em cada erro de amarração (arco de { $days } dias, { $epochs } épocas)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-onboard-gnss = GNSS terrestre a bordo

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:39
js-lunarinfra-open-failed = Não foi possível abrir { $title }: { $reason }.

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:27
js-lunarinfra-opening = Abrindo { $title }…

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:94
js-lunarinfra-orbit-uncertainty-log = Incerteza da órbita por componente, escala logarítmica

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:105
js-lunarinfra-orbiter-days = orbitador, { $days } d

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:91
js-lunarinfra-q-note = Média da estatística de consistência q em { $trials } ensaios; { $expected } é o que um par consistente de soluções fornece. A fração de ensaios acima do ponto de 95 % é a taxa de detecção da verificação.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:91
js-lunarinfra-q-title = A verificação de consistência, nominal em relação ao erro injetado

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:37
js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: o resultado registrado do motor (versão { $version }).
        [many] { $title }: os resultados registrados do motor (versão { $version }).
       *[other] { $title }: os resultados registrados do motor (versão { $version }).
    }

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:130
js-lunarinfra-rel-label = Sigma sobre o nominal, escala logarítmica

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:129
js-lunarinfra-rel-note = Sigma de Cramér-Rao como porcentagem do valor nominal, com as quatro famílias em conjunto. h2 e l2 são pontos de linearização, não valores verificados; k2 vem de um ajuste publicado.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:129
js-lunarinfra-rel-title = Com que precisão cada parâmetro pode ser determinado, em relação ao seu valor nominal

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:29
js-lunarinfra-result-not-json = o resultado não é JSON ({ $reason })

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:31
js-lunarinfra-result-not-loaded = o resultado registrado { $file } não foi carregado

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:96
js-lunarinfra-row-above-95 = Ensaios acima do ponto de 95 % (qui-quadrado 95 % = { $chi })

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-crtrace = Traço de Cramér-Rao

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-degeneracy = Métrica de degeneração

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:97
js-lunarinfra-row-formal-diff = Sigma formal dessa diferença

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:98
js-lunarinfra-row-ground-meas = Solo: medições, épocas com uma estação

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:97
js-lunarinfra-row-mean-diff = Diferença média das duas órbitas

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:96
js-lunarinfra-row-mean-q = q médio (6 esperado)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-observations = Observações

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:98
js-lunarinfra-row-onboard-epochs = A bordo: épocas com um ou mais / quatro ou mais satélites

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:98
js-lunarinfra-row-onboard-meas = A bordo: medições, média de satélites rastreados

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-origin-scale = Correlação entre origem e escala

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-origin-sigma = Sigma da origem, m

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-rank-defect = Posto (defeito)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-row-smallest-eig = Menor autovalor

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:97
js-lunarinfra-row-trace-ground = Amostral sobre traço formal, solo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:97
js-lunarinfra-row-trace-onboard = Amostral sobre traço formal, a bordo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:96
js-lunarinfra-row-within-95 = Ensaios dentro do ponto de 95 %

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:103
js-lunarinfra-series-bootstrapped = por bootstrap

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:120
js-lunarinfra-series-floor = piso

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:103
js-lunarinfra-series-monte-carlo = Monte Carlo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:95
js-lunarinfra-side-note = A órbita: { $family }, um arco de { $arc } dias de uma órbita de { $period } dias, amostrado a cada { $sample } s.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:95
js-lunarinfra-side-title = Lado a lado

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:93
js-lunarinfra-sigma-note = Incerteza de posição de um sigma por componente, em metros, a partir das duas estimativas do mesmo arco.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:130
js-lunarinfra-sigma-over-nominal = sigma / nominal

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:93
js-lunarinfra-sigma-title = Quão bem cada lado conhece a órbita

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:105
js-lunarinfra-station-days = estação, { $days } d

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:75
js-lunarinfra-status-verdict = { $status }: { $verdict }

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:133
js-lunarinfra-subsets-note = Acrescentar uma família nunca reduziu o menor autovalor ({ $lambda } de { $pairs } acréscimos), mas o traço da pseudoinversa não foi maior em apenas { $trace } de { $pairs }, porque uma família acrescentada pode elevar o posto.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:133
js-lunarinfra-subsets-title = Todas as combinações de famílias

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:121
js-lunarinfra-sweep-note = O pior componente de translação de cada deslocamento, em metros, conforme o erro da amarração entre as três técnicas na espaçonave é varrido. Com os sigmas registrados das técnicas (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m), os deslocamentos são limitados pelo ruído de medição, não pela amarração; a amarração define o piso apenas para técnicas quase perfeitas.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:121
js-lunarinfra-sweep-title = Precisão dos deslocamentos entre técnicas em relação à amarração local (arco de { $days } dias)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-arc-days = Arco, dias

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:75
js-lunarinfra-th-bar = Limiar

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-bootstrapped = Taxa por bootstrap

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-budget-exhausted = Orçamento de busca esgotado (ensaios)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-common-sats = Épocas com 2 ou mais satélites em comum

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:134
js-lunarinfra-th-crtrace = Traço de Cramér-Rao

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-dd-ambiguities = Ambiguidades de dupla diferença

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-epochs = Épocas

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:134
js-lunarinfra-th-families = Famílias

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:132
js-lunarinfra-th-family = Família

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:124
js-lunarinfra-th-local-tie = Sigma da amarração local, m

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-mc-fix-rate = Taxa de fixação Monte Carlo

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:107
js-lunarinfra-th-median-ambiguity = Sigma mediano da ambiguidade, ciclos

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:124
js-lunarinfra-th-offset = Deslocamento

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:96
js-lunarinfra-th-quantity = Grandeza

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:134
js-lunarinfra-th-rank = Posto

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:124
js-lunarinfra-th-rotation = Rotação na superfície, m

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:132
js-lunarinfra-th-rows = Linhas

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:124
js-lunarinfra-th-scale = Escala na superfície, m

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:134
js-lunarinfra-th-smallest-eig = Menor autovalor

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:124
js-lunarinfra-th-translation = Translação x, y, z, m

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:75
js-lunarinfra-th-value = Valor

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:75
js-lunarinfra-th-verdict = Veredicto

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-th-with-links = Com enlaces do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:116
js-lunarinfra-th-without-links = Sem enlaces do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:20
js-lunarinfra-title-carrier-phase = Fase da portadora, superfície e orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:21
js-lunarinfra-title-frame-coestimation = Coestimação do referencial

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:23
js-lunarinfra-title-geodesy-sensitivity = Números de Love e libração

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:19
js-lunarinfra-title-od-consistency = Consistência da determinação de órbita

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:22
js-lunarinfra-title-space-tie = Amarração espacial

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:31
js-lunarinfra-unknown-study = este resultado de infraestrutura lunar é o estudo "{ $study }", que esta página não lê

# 2026-10-01-studio-rebuild/lunar-infra/lunar-infra.js:50
js-lunarinfra-where-missed = Onde este estudo falhou.

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:112
js-lunarinfra-with-links = com enlaces do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:112
js-lunarinfra-without-links = sem enlaces do orbitador

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:103
js-lunarinfra-x-arc-length = comprimento do arco, dias

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:122
js-lunarinfra-x-local-tie = sigma da amarração local, m (log)

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:103
js-lunarinfra-y-fixed-correctly = fixado corretamente, %

# 2026-10-01-studio-rebuild/lib/lunar-infra.mjs:122
js-lunarinfra-y-offset-sigma = sigma do deslocamento, m (log); o piso tracejado é a amarração sozinha, sqrt(2) × o erro da amarração

# 2026-10-01-studio-rebuild/lib/meaning.mjs:120
js-meaning-body-generic = um corpo celeste

# 2026-10-01-studio-rebuild/lib/meaning.mjs:120
js-meaning-body-the = { $name }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:252
js-meaning-card-label-sub = { $k }, { $sub }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:91
js-meaning-checks-of = { $av } de { $n ->
        [one] { $n } verificação
        [many] { $n } de verificações
       *[other] { $n } verificações
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:133
js-meaning-coverage-average-label = Média à vista

# 2026-10-01-studio-rebuild/lib/meaning.mjs:129
js-meaning-coverage-big-min =
    { $n ->
        [one] Pelo menos { $n } satélite à vista em cada lugar, { $mean } em média.
        [many] Pelo menos { $n } de satélites à vista em cada lugar, { $mean } em média.
       *[other] Pelo menos { $n } satélites à vista em cada lugar, { $mean } em média.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:129
js-meaning-coverage-big-none = Alguns lugares ficam, por vezes, sem nenhum satélite; { $mean } estão à vista em média.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:132
js-meaning-coverage-fewest-label = Menos à vista, em qualquer lugar

# 2026-10-01-studio-rebuild/lib/meaning.mjs:124
js-meaning-coverage-line-many = Com { $names } juntos, é possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:124
js-meaning-coverage-line-many-pdop = Com { $names } juntos, é possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

# 2026-10-01-studio-rebuild/lib/meaning.mjs:127
js-meaning-coverage-line-none = É possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:127
js-meaning-coverage-line-none-pdop = É possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

# 2026-10-01-studio-rebuild/lib/meaning.mjs:126
js-meaning-coverage-line-one = Com { $names }, é possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:126
js-meaning-coverage-line-one-pdop = Com { $names }, é possível obter uma solução de posição em { $share } % dos lugares e momentos ao redor de { $body } (qualidade da geometria, PDOP, abaixo de { $thr }).

# 2026-10-01-studio-rebuild/lib/meaning.mjs:134
js-meaning-coverage-places-label = Lugares que obtêm uma solução de posição

# 2026-10-01-studio-rebuild/lib/meaning.mjs:29
js-meaning-duration-days =
    { $n ->
        [one] { $days } dia
        [many] { $days } de dias
       *[other] { $days } dias
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:227
js-meaning-ensemble-big-many = Ao longo de muitos sorteios de ruído, { $q } mantém { $thr } ns por { $qd } em média; { $c }, por { $cd }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:227
js-meaning-ensemble-big-runs =
    { $n ->
        [one] Ao longo de { $n } sorteio de ruído, { $q } mantém { $thr } ns por { $qd } em média; { $c }, por { $cd }.
        [many] Ao longo de { $n } de sorteios de ruído, { $q } mantém { $thr } ns por { $qd } em média; { $c }, por { $cd }.
       *[other] Ao longo de { $n } sorteios de ruído, { $q } mantém { $thr } ns por { $qd } em média; { $c }, por { $cd }.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:228
js-meaning-ensemble-line = Nove em cada dez sorteios de { $name } mantêm de { $band }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:225
js-meaning-ensemble-mean = média

# 2026-10-01-studio-rebuild/lib/meaning.mjs:225
js-meaning-ensemble-mean-band = média; faixa de 90 % { $band }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:155
js-meaning-error-p95-label = Erro, 95 % do tempo, { $name }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:274
js-meaning-generic-big = { $label }: { $value }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:275
js-meaning-generic-line-one = Também desta execução: { $a }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:275
js-meaning-generic-line-two = Também desta execução: { $a } e { $b }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:269
js-meaning-generic-none = Esta execução não tem um único valor de destaque; o gráfico abaixo mostra o resultado.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:151
js-meaning-holdover-label = Holdover, { $name }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:109
js-meaning-hpl-sub = nível de proteção horizontal

# 2026-10-01-studio-rebuild/lib/meaning.mjs:151
js-meaning-inside-budget = dentro de { $budget }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:59
js-meaning-integrity-big-checks-mostly = Sim, na maior parte: em { $share } % das verificações.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:61
js-meaning-integrity-big-checks-no = Não: em { $share } % das verificações.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:60
js-meaning-integrity-big-checks-partly = Apenas em parte: em { $share } % das verificações.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:58
js-meaning-integrity-big-checks-yes = Sim: em { $share } % das verificações.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:53
js-meaning-integrity-big-span-mostly = Sim, na maior parte: durante { $share } % de { $span }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:55
js-meaning-integrity-big-span-no = Não: durante { $share } % de { $span }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:54
js-meaning-integrity-big-span-partly = Apenas em parte: durante { $share } % de { $span }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:52
js-meaning-integrity-big-span-yes = Sim: durante { $share } % de { $span }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:95
js-meaning-integrity-bound-label = Limite de erro típico

# 2026-10-01-studio-rebuild/lib/meaning.mjs:95
js-meaning-integrity-bound-sub = horizontal / vertical, mediana

# 2026-10-01-studio-rebuild/lib/meaning.mjs:93
js-meaning-integrity-gap-all-passed = todas as verificações passaram

# 2026-10-01-studio-rebuild/lib/meaning.mjs:93
js-meaning-integrity-gap-label = Maior intervalo

# 2026-10-01-studio-rebuild/lib/meaning.mjs:93
js-meaning-integrity-gap-none = nenhum

# 2026-10-01-studio-rebuild/lib/meaning.mjs:93
js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } verificação seguida, a partir de { $from }
        [many] { $n } de verificações seguidas, a partir de { $from }
       *[other] { $n } verificações seguidas, a partir de { $from }
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:84
js-meaning-integrity-line-h =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificação.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:82
js-meaning-integrity-line-h-clean =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:83
js-meaning-integrity-line-h-some =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:80
js-meaning-integrity-line-hv =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificação.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:78
js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:79
js-meaning-integrity-line-hv-some =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $h } m na horizontal e { $v } m na vertical) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:76
js-meaning-integrity-line-none =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificação.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } de verificações.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:74
js-meaning-integrity-line-none-clean =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:75
js-meaning-integrity-line-none-some =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo do limite de alerta em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:88
js-meaning-integrity-line-v =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificação.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } de verificações.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:86
js-meaning-integrity-line-v-clean =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificação, e nenhuma solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } de verificações, e nenhuma solução de posição foi enganosa.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações, e nenhuma solução de posição foi enganosa.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:87
js-meaning-integrity-line-v-some =
    { $n ->
        [one] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } solução de posição foi enganosa.
        [many] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } de soluções de posição foram enganosas.
       *[other] O limite de erro do receptor (seu nível de proteção) ficou abaixo dos limites de alerta ({ $v } m na vertical) em { $av } de { $tot } verificações; { $n } soluções de posição foram enganosas.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:96
js-meaning-integrity-misleading-label = Soluções de posição enganosas

# 2026-10-01-studio-rebuild/lib/meaning.mjs:96
js-meaning-integrity-misleading-sub = erro real acima do limite

# 2026-10-01-studio-rebuild/lib/meaning.mjs:91
js-meaning-integrity-trusted-label = Tempo em que a solução de posição é confiável

# 2026-10-01-studio-rebuild/lib/meaning.mjs:176
js-meaning-jamming-above-label = Jammer acima do sinal

# 2026-10-01-studio-rebuild/lib/meaning.mjs:176
js-meaning-jamming-above-sub = razão média entre jammer e sinal

# 2026-10-01-studio-rebuild/lib/meaning.mjs:171
js-meaning-jamming-big-gone = O jammer elimina completamente a solução de posição.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:171
js-meaning-jamming-big-share = Com o jammer, uma solução de posição está disponível em { $share } % do tempo.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:175
js-meaning-jamming-clear-label = Solução de posição disponível, sem jammer

# 2026-10-01-studio-rebuild/lib/meaning.mjs:177
js-meaning-jamming-fewest-label = Menos satélites rastreados

# 2026-10-01-studio-rebuild/lib/meaning.mjs:177
js-meaning-jamming-fewest-sub = no pior momento

# 2026-10-01-studio-rebuild/lib/meaning.mjs:174
js-meaning-jamming-jammed-label = Solução de posição disponível, com jammer

# 2026-10-01-studio-rebuild/lib/meaning.mjs:172
js-meaning-jamming-line = Sem o jammer, a solução de posição está disponível em { $share } % do tempo.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:172
js-meaning-jamming-line-js = Sem o jammer, a solução de posição está disponível em { $share } % do tempo; o jammer chega { $db } dB acima do sinal em média.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:317
js-meaning-kicker = { $domain } · { $title }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:105
js-meaning-lunar-big-all =
    { $n ->
        [one] Sim: em cada uma das { $n } verificação.
        [many] Sim: em cada uma das { $n } de verificações.
       *[other] Sim: em cada uma das { $n } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:105
js-meaning-lunar-big-none =
    { $n ->
        [one] Não: em nenhuma das { $n } verificação.
        [many] Não: em nenhuma das { $n } de verificações.
       *[other] Não: em nenhuma das { $n } verificações.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:105
js-meaning-lunar-big-some =
    { $n ->
        [one] Em { $av } de { $n } verificação ({ $share } %).
        [many] Em { $av } de { $n } de verificações ({ $share } %).
       *[other] Em { $av } de { $n } verificações ({ $share } %).
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:110
js-meaning-lunar-largest-label = Maior limite de erro

# 2026-10-01-studio-rebuild/lib/meaning.mjs:106
js-meaning-lunar-line = O nível de proteção variou de { $min } a { $max } m contra um limite de alerta de { $limit } m.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:108
js-meaning-lunar-meet-label = Verificações que atendem ao limite

# 2026-10-01-studio-rebuild/lib/meaning.mjs:108
js-meaning-lunar-meet-value = { $av } de { $tot }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:109
js-meaning-lunar-smallest-label = Menor limite de erro

# 2026-10-01-studio-rebuild/lib/meaning.mjs:135
js-meaning-median-lower-better = mediana, quanto menor, melhor

# 2026-10-01-studio-rebuild/lib/meaning.mjs:174
js-meaning-of-the-time = do tempo

# 2026-10-01-studio-rebuild/lib/meaning.mjs:211
js-meaning-orbit-best-label = Melhor geometria (PDOP)

# 2026-10-01-studio-rebuild/lib/meaning.mjs:211
js-meaning-orbit-best-sub = o menor valor ao longo da execução

# 2026-10-01-studio-rebuild/lib/meaning.mjs:206
js-meaning-orbit-big-always = É possível obter uma solução de posição o tempo todo.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:206
js-meaning-orbit-big-share = É possível obter uma solução de posição em { $share } % do tempo.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:212
js-meaning-orbit-error-label = Erro de posição típico

# 2026-10-01-studio-rebuild/lib/meaning.mjs:212
js-meaning-orbit-error-sub = 1 sigma, mediana

# 2026-10-01-studio-rebuild/lib/meaning.mjs:207
js-meaning-orbit-line =
    { $n ->
        [one] Havia satélites suficientes à vista em { $fix } de { $n } momento.
        [many] Havia satélites suficientes à vista em { $fix } de { $n } de momentos.
       *[other] Havia satélites suficientes à vista em { $fix } de { $n } momentos.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:207
js-meaning-orbit-line-pdop =
    { $n ->
        [one] Havia satélites suficientes à vista em { $fix } de { $n } momento; a qualidade típica da geometria (PDOP, diluição de precisão da posição) é { $pdop }, quanto menor, melhor.
        [many] Havia satélites suficientes à vista em { $fix } de { $n } de momentos; a qualidade típica da geometria (PDOP, diluição de precisão da posição) é { $pdop }, quanto menor, melhor.
       *[other] Havia satélites suficientes à vista em { $fix } de { $n } momentos; a qualidade típica da geometria (PDOP, diluição de precisão da posição) é { $pdop }, quanto menor, melhor.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:209
js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } de { $n } momento
        [many] { $fix } de { $n } de momentos
       *[other] { $fix } de { $n } momentos
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:209
js-meaning-orbit-time-label = Tempo em que uma solução de posição é possível

# 2026-10-01-studio-rebuild/lib/meaning.mjs:160
js-meaning-pair-big-diff-pos = { $best } permanece dentro de { $budget } por { $bestDur }; { $other }, por { $otherDur }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:160
js-meaning-pair-big-diff-time = { $best } mantém a hora dentro de { $budget } por { $bestDur }; { $other }, por { $otherDur }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:159
js-meaning-pair-big-same-pos = Tanto { $q } quanto { $c } permanecem dentro de { $budget } por { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:159
js-meaning-pair-big-same-time = Tanto { $q } quanto { $c } mantêm a hora dentro de { $budget } por { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:161
js-meaning-pair-line-clock = Holdover é por quanto tempo cada relógio permanece dentro do orçamento de { $budget } depois que a navegação por satélite é perdida.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:161
js-meaning-pair-line-navigator = Holdover é por quanto tempo cada navegador permanece dentro do orçamento de { $budget } depois que a navegação por satélite é perdida.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:135
js-meaning-pdop-label = Qualidade da geometria (PDOP)

# 2026-10-01-studio-rebuild/lib/meaning.mjs:134
js-meaning-places-times = dos lugares e momentos

# 2026-10-01-studio-rebuild/lib/meaning.mjs:223
js-meaning-range-to = de { $from } a { $to }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:132
js-meaning-satellites =
    { $n ->
        [one] satélite
        [many] de satélites
       *[other] satélites
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:196
js-meaning-spectrum-above = acima do limiar

# 2026-10-01-studio-rebuild/lib/meaning.mjs:196
js-meaning-spectrum-below = abaixo do limiar: perdido

# 2026-10-01-studio-rebuild/lib/meaning.mjs:192
js-meaning-spectrum-big-kept =
    { $n ->
        [one] Cada um dos { $n } sinal continua sendo rastreado.
        [many] Cada um dos { $n } de sinais continua sendo rastreado.
       *[other] Cada um dos { $n } sinais continua sendo rastreado.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:192
js-meaning-spectrum-big-lost =
    { $n ->
        [one] Os jammers eliminam { $lost } de { $n } sinal: { $names }.
        [many] Os jammers eliminam { $lost } de { $n } de sinais: { $names }.
       *[other] Os jammers eliminam { $lost } de { $n } sinais: { $names }.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:194
js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } permanece acima do limiar de rastreamento do receptor durante toda a execução.
        [many] { $names } permanecem acima do limiar de rastreamento do receptor durante toda a execução.
       *[other] { $names } permanecem acima do limiar de rastreamento do receptor durante toda a execução.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:194
js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } permanece acima do limiar de rastreamento de { $thr } dB-Hz do receptor durante toda a execução.
        [many] { $names } permanecem acima do limiar de rastreamento de { $thr } dB-Hz do receptor durante toda a execução.
       *[other] { $names } permanecem acima do limiar de rastreamento de { $thr } dB-Hz do receptor durante toda a execução.
    }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:195
js-meaning-spectrum-line-none = Nenhum sinal permanece acima do limiar de rastreamento do receptor durante toda a execução.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:195
js-meaning-spectrum-line-none-thr = Nenhum sinal permanece acima do limiar de rastreamento de { $thr } dB-Hz do receptor durante toda a execução.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:196
js-meaning-spectrum-weakest-label = Sinal mais fraco, { $name }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:155
js-meaning-whole-run = ao longo de toda a execução

# 2026-10-01-studio-rebuild/lib/meaning.mjs:249
js-meaning-your-setting = sua configuração

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:506
js-meankind-acm-big = A codificação adaptativa move { $gain } vezes os dados do melhor modo fixo: { $acm } Gbit contra { $ccm } Gbit em { $n } { $n ->
        [one] passagem
        [many] de passagens
       *[other] passagens
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:506
js-meankind-acm-line = Modo fixo { $mode }; { $dur } de interrupção.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:246
js-meankind-anomaly-big = O monitor de falhas quântico obtém { $q }, contra { $c } do monitor clássico (área sob a curva, 1 é perfeito).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:246
js-meankind-anomaly-line = A menor falha detectável é { $q } contra { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:511
js-meankind-aocs-big-open = A manobra de { $slew } graus não se estabiliza abaixo de { $threshold } graus.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:511
js-meankind-aocs-big-settles = A manobra de { $slew } graus se estabiliza abaixo de { $threshold } graus após { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:517
js-meankind-aocs-line = Erro final de apontamento de { $final } graus.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:516
js-meankind-aocs-line-filter = Erro final de apontamento de { $final } graus. Um filtro de atitude na malha erra em { $arcsec } arcsec RMS.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:515
js-meankind-aocs-line-wheel = Erro final de apontamento de { $final } graus. Torque máximo da roda de { $torque } N m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:514
js-meankind-aocs-line-wheel-filter = Erro final de apontamento de { $final } graus. Torque máximo da roda de { $torque } N m. Um filtro de atitude na malha erra em { $arcsec } arcsec RMS.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:360
js-meankind-aperture-big = A navegação usa { $nav } % do tempo da antena e as comunicações { $comms } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:360
js-meankind-aperture-big-idle = A navegação usa { $nav } % do tempo da antena e as comunicações { $comms } %; { $idle } % está ocioso.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:350
js-meankind-aperture-line-all = { $n } { $n ->
        [one] abertura
        [many] de aberturas
       *[other] aberturas
    } sob a regra { $policy }, com { $dur } de contenção.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:352
js-meankind-aperture-line-contention = { $n } { $n ->
        [one] abertura
        [many] de aberturas
       *[other] aberturas
    }, com { $dur } de contenção.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:353
js-meankind-aperture-line-count = { $n } { $n ->
        [one] abertura
        [many] de aberturas
       *[other] aberturas
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:358
js-meankind-aperture-line-nocount = As aberturas.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:355
js-meankind-aperture-line-nocount-all = As aberturas sob a regra { $policy }, com { $dur } de contenção.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:357
js-meankind-aperture-line-nocount-contention = As aberturas, com { $dur } de contenção.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:356
js-meankind-aperture-line-nocount-policy = As aberturas sob a regra { $policy }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:351
js-meankind-aperture-line-policy = { $n } { $n ->
        [one] abertura
        [many] de aberturas
       *[other] aberturas
    } sob a regra { $policy }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-big-no = Não: os níveis de proteção do motor divergem da referência publicada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-big-yes = Sim: os níveis de proteção do motor coincidem com a referência publicada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-line = A pior diferença é de { $worst } m contra a própria tolerância da referência, de { $tol } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-line-vectors = A pior diferença é de { $worst } m contra a própria tolerância da referência, de { $tol } m, em { $n } { $n ->
        [one] vetor de referência
        [many] de vetores de referência
       *[other] vetores de referência
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:499
js-meankind-arc-big = O estimador recupera a órbita quando dispõe de { $dur } do arco de { $h } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:499
js-meankind-arc-line = { $n } espaçonaves, medições de { $observable }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:522
js-meankind-ascent-big = Gravidade, arrasto, direcionamento e contrapressão consomem { $loss } m/s do ganho ideal de velocidade de { $ideal } m/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:522
js-meankind-ascent-line = Fim da queima a { $km } km e { $speed } m/s; pressão dinâmica máxima de { $kpa } kPa.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-big-no = Um spoofer na superfície não consegue capturar um receptor lunar.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-big-yes = Um spoofer na superfície consegue capturar um receptor lunar.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-line = Um transmissor na superfície alcança { $km } km antes que o horizonte o bloqueie.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-big = O erro de apontamento soma { $total } segundos de arco.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-big-from = O erro de apontamento soma { $total } segundos de arco, principalmente devido a { $from }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-line = O maior torque de gradiente de gravidade é de { $torque } N·m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:442
js-meankind-beacon-big = As balizas de superfície melhoram a qualidade da geometria (PDOP) em { $x } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:442
js-meankind-beacon-line = Acrescentar satélites em vez disso a melhora em { $x } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-big = Só os relés dão uma solução de posição em { $share } % do tempo ao redor de { $body }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-big-earth = Só os relés dão uma solução de posição em { $share } % do tempo ao redor de { $body }; { $earth } % com enlaces com a Terra.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-line = { $mean } relés estão à vista em média.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:23
js-meankind-by = { $a } por { $b }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-line = Cada membro é uma execução comum do motor; a campanha lê seus resultados lado a lado.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-range = Em { $n } { $n ->
        [one] cenário
        [many] de cenários
       *[other] cenários
    } nas mesmas condições, { $what } varia de { $low } a { $high }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-same = Em { $n } { $n ->
        [one] cenário
        [many] de cenários
       *[other] cenários
    } nas mesmas condições, { $what } é { $value } em todos.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:67
js-meankind-campaign-line = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:74
js-meankind-campaign-line-all = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    } e { $events }, de { $runs }; ao final, { $label } é { $value }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:68
js-meankind-campaign-line-end = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    }; ao final, { $label } é { $value }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:71
js-meankind-campaign-line-events = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    } e { $events }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:72
js-meankind-campaign-line-events-end = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    } e { $events }; ao final, { $label } é { $value }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:73
js-meankind-campaign-line-events-runs = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    } e { $events }, de { $runs }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:69
js-meankind-campaign-line-runs = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    }, de { $runs }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:70
js-meankind-campaign-line-runs-end = { $n } { $n ->
        [one] fase
        [many] de fases
       *[other] fases
    }, de { $runs }; ao final, { $label } é { $value }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-alarm = O alarme é emitido por { $alarm } da missão de { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-phases = Uma missão de { $phases } { $phases ->
        [one] fase
        [many] de fases
       *[other] fases
    } ao longo de { $dur }, encadeada em um único relógio.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-quiet = Nenhum alarme em toda a missão de { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:82
js-meankind-campaign-montecarlo = Em { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    } com semente, { $name } tem média de { $mean }, com dispersão de { $std }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:82
js-meankind-campaign-montecarlo-line = A dispersão é um desvio-padrão ao longo das execuções.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize = A busca se estabiliza em { $name } de { $value } após { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize-at = Em { $at }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize-kind = A busca se estabiliza em { $name } de { $value } após { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    } de { $kind }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:102
js-meankind-campaign-sweep-flat = Em { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    } de { $axis } de { $from } a { $to }, { $metric } permanece em { $value }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:102
js-meankind-campaign-sweep-flat-line = O gráfico mostra cada execução.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:103
js-meankind-campaign-sweep-goes = Em { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    } de { $axis } de { $from } a { $to }, { $metric } vai de { $first } a { $last }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:103
js-meankind-campaign-sweep-goes-line = O gráfico mostra cada execução; ele varia de { $min } a { $max }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:163
js-meankind-classical-link = enlace clássico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-clock-word = relógio

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:237
js-meankind-conflict-big = A arquitetura em camadas sobrevive { $ratio } vezes melhor do que uma única camada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:236
js-meankind-conflict-line-threats = Um Monte Carlo das ameaças dá { $ratio } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:236
js-meankind-conflict-line-threats-corr = Um Monte Carlo das ameaças dá { $ratio } vezes; com ameaças correlacionadas, pode cair para { $low } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:235
js-meankind-conflict-line-trials = Um Monte Carlo de { $n } { $n ->
        [one] ensaio
        [many] de ensaios
       *[other] ensaios
    } dá { $ratio } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:235
js-meankind-conflict-line-trials-corr = Um Monte Carlo de { $n } { $n ->
        [one] ensaio
        [many] de ensaios
       *[other] ensaios
    } dá { $ratio } vezes; com ameaças correlacionadas, pode cair para { $low } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-big = O plano mantém { $kept } de { $n } { $n ->
        [one] contato candidato
        [many] de contatos candidatos
       *[other] contatos candidatos
    } e entrega { $gbit } Gbit.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-big-waiting = O plano mantém { $kept } de { $n } { $n ->
        [one] contato candidato
        [many] de contatos candidatos
       *[other] contatos candidatos
    } e entrega { $gbit } Gbit dos { $waiting } Gbit em espera.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-line = { $sats } satélites e { $stations } estações ao longo de { $hours } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:446
js-meankind-dpnt-big = As correções diferenciais reduzem o erro de { $from } m para { $to } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:446
js-meankind-dpnt-line = Com uma estação de referência a { $km } km de distância.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:33
js-meankind-duration-days =
    { $n ->
        [one] { $days } dia
        [many] { $days } de dias
       *[other] { $days } dias
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:438
js-meankind-earthgnss-big =
    { $n ->
        [one] À distância da Lua, { $visible } de { $n } satélite está à vista, mas { $trackable } pode ser rastreado.
        [many] À distância da Lua, { $visible } de { $n } de satélites estão à vista, mas { $trackable } podem ser rastreados.
       *[other] À distância da Lua, { $visible } de { $n } satélites estão à vista, mas { $trackable } podem ser rastreados.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:438
js-meankind-earthgnss-line = O melhor sinal é de { $best } dB-Hz contra um limiar de rastreamento de { $threshold } dB-Hz.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:61
js-meankind-engine-run-count =
    { $n ->
        [one] { $n } execução do motor
        [many] { $n } de execuções do motor
       *[other] { $n } execuções do motor
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:533
js-meankind-entry-big = A desaceleração máxima é de { $g } g a { $km } km, com fluxo de calor máximo de { $flux } W/cm².

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:533
js-meankind-entry-line = Entrada a { $speed } m/s, { $angle } graus abaixo do horizonte.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-big = A câmera enxerga uma faixa de { $swath } km com resolução de { $gsd } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-line-contiguous = As trilhas no solo estão a { $km } km uma da outra no equador, portanto a cobertura é contígua.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-line-gapped = As trilhas no solo estão a { $km } km uma da outra no equador, portanto a cobertura tem lacunas.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:415
js-meankind-eop-big = À distância da Lua, a rotação da Terra varre { $m } m a cada segundo, portanto a idade dos dados de orientação da Terra ({ $dur } aqui) importa.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:415
js-meankind-eop-line = Entrada: { $source }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-big = O satélite voa entre { $min } e { $max } km, até { $lat }° de latitude.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-line = Visto da estação, ele sobe até { $deg }°.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-line-doppler = Visto da estação, ele sobe até { $deg }°, com até { $khz } kHz de Doppler.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:60
js-meankind-event-count =
    { $n ->
        [one] { $n } evento
        [many] { $n } de eventos
       *[other] { $n } eventos
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-big-open =
    { $n ->
        [one] A campanha deixa { $n } direção do datum indeterminada.
        [many] A campanha deixa { $n } de direções do datum indeterminadas.
       *[other] A campanha deixa { $n } direções do datum indeterminadas.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-big-yes = Sim: a campanha fixa totalmente o datum do referencial lunar.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-line = Número de condição { $n }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-big = O referencial lunar é realizado com { $m } m de erro residual.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-big-open = O referencial lunar é realizado com { $m } m de erro residual, embora o ajuste não tenha convergido.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-line = Erro de translação de { $trans } m, erro de escala de { $scale } partes por bilhão.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:261
js-meankind-gnsssim-big = O monitoramento de integridade protege a solução de posição em { $share } % do tempo.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:261
js-meankind-gnsssim-line = A ionosfera acrescenta { $iono } m e a troposfera { $tropo } m a cada distância, em média.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:89
js-meankind-headline-figure = valor de destaque

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big = Medido em relação às máscaras, o holdover de { $dur } s do registro chega a { $te } ns de erro de tempo.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big-open = Medido em relação às máscaras, o holdover de { $dur } s do registro chega a { $te } ns de erro de tempo e não se recuperou dentro da faixa.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big-recovered = Medido em relação às máscaras, o holdover de { $dur } s do registro chega a { $te } ns de erro de tempo e se recuperou { $recover } s depois que o GNSS voltou.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-line = Medido em relação à máscara, nunca uma declaração de que um sistema está em conformidade; os dois tempos são uma declaração do operador.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-line-masks = { $masks }. Medido em relação à máscara, nunca uma declaração de que um sistema está em conformidade; os dois tempos são uma declaração do operador.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:242
js-meankind-impairment-big = O detector separa sinais prejudicados de sinais limpos com uma área sob a curva de { $auc } (1 é perfeito).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:242
js-meankind-impairment-line = Em casos diferentes do seu conjunto de treinamento, ele obtém { $auc }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:602
js-meankind-infra-carrier = A fixação de inteiros da fase da portadora entre uma estação de superfície e um orbitador fixou { $share } % dos ensaios no arco mais longo ({ $days } dias).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:606
js-meankind-infra-frame = Os enlaces entre orbitador e estação elevam o menor autovalor de informação do datum lunar em { $x } vezes e reduzem o traço de Cramér-Rao a { $share } %, se a órbita for conhecida nos eixos lunares.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:612
js-meankind-infra-geodesy = Com as quatro famílias em conjunto, h2, k2 e l2 são determinados a { $h2 } %, { $k2 } % e { $l2 } % de seus valores nominais.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:598
js-meankind-infra-od = A determinação de órbita a bordo com GNSS terrestre em órbita lunar tem precisão de { $gnss } m e o rastreamento independente em solo, de { $ground } m; a estatística de consistência tem média de { $mean } ({ $expected } esperado).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:594
js-meankind-infra-tail = MODELLED: um modelo restrito com entradas ilustrativas, não uma afirmação sobre nenhuma missão.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:609
js-meankind-infra-tie = Uma amarração local de { $mm } mm em uma única espaçonave amarra os referenciais GNSS, VLBI e de medição a laser ao longo de { $n } { $n ->
        [one] erro de amarração varrido
        [many] de erros de amarração varridos
       *[other] erros de amarração varridos
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:148
js-meankind-inside-spec = dentro de { $spec }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-big = Navegando apenas por inércia, o erro de posição ultrapassa { $threshold } m após { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-dom = { $dominant } domina.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-line = Ele ultrapassa { $passes }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-line-dom = Ele ultrapassa { $passes }; { $dominant } domina.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:205
js-meankind-instrn-pass = { $threshold } m após { $dur }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-big-no = Não: o arquivo de efemérides lunares não faz a viagem de ida e volta.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-big-yes = Sim: o arquivo de efemérides lunares faz a viagem de ida e volta intacto.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-line = { $n } { $n ->
        [one] estado
        [many] de estados
       *[other] estados
    } no referencial { $frame }, tempo { $time }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:151
js-meankind-its-spec = sua especificação

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:460
js-meankind-jointod-big = Acrescentar um atraso de interferometria baseado na Terra melhora a posição da estação em { $x } vezes.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:460
js-meankind-jointod-line = A estação passa então a ser conhecida com { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:369
js-meankind-launch-big =
    { $n ->
        [one] { $n } oportunidade de lançamento por dia alcança uma órbita de { $incl }° a partir da latitude { $lat }°.
        [many] { $n } de oportunidades de lançamento por dia alcançam uma órbita de { $incl }° a partir da latitude { $lat }°.
       *[other] { $n } oportunidades de lançamento por dia alcançam uma órbita de { $incl }° a partir da latitude { $lat }°.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:369
js-meankind-launch-line = A rotação da Terra dá { $speed } m/s de graça.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:269
js-meankind-layer-agc = AGC (controle automático de ganho)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:268
js-meankind-layer-raim = RAIM (monitoramento autônomo de integridade pelo receptor)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:270
js-meankind-layer-sqm = SQM (monitoramento da qualidade do sinal)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:328
js-meankind-leochain-big = De ponta a ponta, o sistema de órbita baixa reduz o erro de posição de { $from } m para { $to } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:328
js-meankind-leochain-line = Seu sinal é rastreado a até { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-big-many = Os satélites passam a { $elev }° de altura e ficam acima da máscara por { $dur } (a primeira de { $n }).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-big-one = O satélite passa a { $elev }° de altura e fica acima da máscara por { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-line = No pico, o sinal de órbita baixa chega { $db } dB mais forte do que um sinal típico de navegação por satélite.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-big = O posicionamento preciso converge em { $best } min com a maior camada de órbita baixa, contra { $base } min só com navegação por satélite.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-line = Mediana das execuções por caso, até { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-line-runs = Mediana de { $n } { $n ->
        [one] execução
        [many] de execuções
       *[other] execuções
    } por caso, até { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:303
js-meankind-leopvt-doppler-big = O posicionamento Doppler com satélites de órbita baixa fica a { $m } m da referência verdadeira (horizontal).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:303
js-meankind-leopvt-doppler-line = { $n } { $n ->
        [one] satélite usado
        [many] de satélites usados
       *[other] satélites usados
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:304
js-meankind-leopvt-joint-big = Acrescentar a camada de órbita baixa reduz o erro de { $from } m para { $to } m (raiz do erro quadrático médio 3-D).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:304
js-meankind-leopvt-joint-line = A qualidade da geometria (PDOP) passa de { $from } para { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:308
js-meankind-leopvt-polar-big = Perto do polo, a camada de órbita baixa melhora a qualidade da geometria (PDOP) de { $from } para { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:308
js-meankind-leopvt-polar-line = Em { $n } { $n ->
        [one] latitude
        [many] de latitudes
       *[other] latitudes
    }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:306
js-meankind-leopvt-timing-big = A transferência de tempo em órbita baixa mantém o melhor relógio a até { $ns } ns do UTC (raiz do erro quadrático médio).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:306
js-meankind-leopvt-timing-line =
    { $n ->
        [one] { $n } caso de relógio e sinal comparado.
        [many] { $n } de casos de relógio e sinal comparados.
       *[other] { $n } casos de relógio e sinal comparados.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-big =
    { $n ->
        [one] Dos { $n } projeto de sinal, { $best } tolera mais jamming: { $db } dB acima do sinal.
        [many] Dos { $n } de projetos de sinal, { $best } tolera mais jamming: { $db } dB acima do sinal.
       *[other] Dos { $n } projetos de sinal, { $best } tolera mais jamming: { $db } dB acima do sinal.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-line-fail = As verificações do formato do espectro falham.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-line-pass = As verificações do formato do espectro passam.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:378
js-meankind-link-big-closes = O enlace fecha com { $margin } dB de sobra.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:378
js-meankind-link-big-open = O enlace não fecha: { $margin } dB de margem.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:377
js-meankind-link-line = Ao longo de { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:376
js-meankind-link-line-band = Banda { $band } ao longo de { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:376
js-meankind-link-line-band-rate = Banda { $band } ao longo de { $km } km a { $rate } bit/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:377
js-meankind-link-line-rate = Ao longo de { $km } km a { $rate } bit/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:21
js-meankind-list-and = { $head } e { $last }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:488
js-meankind-llr-big = A medição real a laser fixa o referencial lunar em { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:488
js-meankind-llr-line = Escala em { $ppb } partes por bilhão.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-altimeter = O altímetro mede com { $sigma } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-big = A correspondência de mapas mantém a posição em { $matched } m, contra { $free } m de deriva só com inércia.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-gravimeter = O gravímetro mede com { $sigma } mGal.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-sources = A gravidade sozinha dá { $gravity } m, a magnética { $magnetic } m, o terreno { $terrain } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-marspnt-big = O navegador { $user } se estabiliza em { $m } m (raiz do erro quadrático médio).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-marspnt-line =
    { $n ->
        [one] { $mean } relés à vista em média, ao longo de { $n } época.
        [many] { $mean } relés à vista em média, ao longo de { $n } de épocas.
       *[other] { $mean } relés à vista em média, ao longo de { $n } épocas.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:433
js-meankind-moonlight-big = O serviço cobre { $share } % dos lugares e momentos verificados.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:433
js-meankind-moonlight-line =
    { $n ->
        [one] Entre { $min } e { $n } satélite à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
        [many] Entre { $min } e { $n } de satélites à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
       *[other] Entre { $min } e { $n } satélites à vista; a qualidade da geometria (PDOP) varia de { $pmin } a { $pmax }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:318
js-meankind-navmsg-big =
    { $n ->
        [one] Uma mensagem de navegação cabe em { $n } byte.
        [many] Uma mensagem de navegação cabe em { $n } de bytes.
       *[other] Uma mensagem de navegação cabe em { $n } bytes.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:321
js-meankind-navmsg-cases-big =
    { $n ->
        [one] Em { $n } caso, o erro de distância a partir da órbita transmitida é de { $min } a { $max } mm.
        [many] Em { $n } de casos, o erro de distância a partir da órbita transmitida é de { $min } a { $max } mm.
       *[other] Em { $n } casos, o erro de distância a partir da órbita transmitida é de { $min } a { $max } mm.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:321
js-meankind-navmsg-cases-line = Erro de distância do sinal no espaço, raiz do erro quadrático médio.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:318
js-meankind-navmsg-line = Arredondar para o formato da mensagem custa { $mm } mm de erro de distância.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:322
js-meankind-navmsg-midpass-big = Atualizar a mensagem no meio da passagem faz a distância saltar no máximo { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:322
js-meankind-navmsg-midpass-line = O limite é de { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-ntn-big = O posicionamento 5G a partir da órbita alcança { $m } m com { $signal }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-ntn-line = O Doppler ao longo de uma passagem dá { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-big-full = A órbita se torna totalmente observável após { $dur } de rastreamento.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-big-partly = A órbita permanece parcialmente observável ao longo do arco de { $h } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-line = Posto { $rank } de { $dim } no fim do arco.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:405
js-meankind-oem-big = O arquivo de efemérides faz a viagem de ida e volta com no máximo { $mm } mm de erro de posição.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:405
js-meankind-oem-line =
    { $n ->
        [one] { $states } estados em { $n } segmento.
        [many] { $states } estados em { $n } de segmentos.
       *[other] { $states } estados em { $n } segmentos.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-big-alone = O melhor local isolado mantém o enlace óptico ativo em { $best } % do tempo (teto sem nuvens de { $ceiling } %); nenhuma margem sem nuvens o eleva acima de { $ceiling } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-big-team = O melhor local isolado mantém o enlace óptico ativo em { $best } % do tempo (teto sem nuvens de { $ceiling } %); { $n } locais juntos chegam a { $independent } % se o tempo meteorológico deles for independente e a { $correlated } % com a correlação declarada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-line-sites =
    { $n ->
        [one] { $n } local modelado; os climas de nuvens são ilustrativos.
        [many] { $n } de locais modelados; os climas de nuvens são ilustrativos.
       *[other] { $n } locais modelados; os climas de nuvens são ilustrativos.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-line-tech = { $name }: { $base } % passa a { $with } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-big = Combinar medição óptica e por rádio dá níveis de proteção de { $h } m na horizontal e { $v } m na vertical.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-line-fault = O teste de consistência indica { $stat } contra um limiar de { $threshold }: uma falha é sinalizada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-line-ok = O teste de consistência indica { $stat } contra um limiar de { $threshold }: nenhuma falha é sinalizada.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-big-no = Não: o fluxo decodificado difere do que foi enviado.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-big-yes = Sim: o fluxo de pacotes é decodificado de volta bit a bit.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-line =
    { $n ->
        [one] { $n } pacote, { $octets } octetos no total.
        [many] { $n } de pacotes, { $octets } octetos no total.
       *[other] { $n } pacotes, { $octets } octetos no total.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-big-day =
    { $n ->
        [one] { $n } passagem por dia, { $dur } de contato no total.
        [many] { $n } de passagens por dia, { $dur } de contato no total.
       *[other] { $n } passagens por dia, { $dur } de contato no total.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-big-window =
    { $n ->
        [one] { $n } passagem em uma janela de { $hours } h, { $dur } de contato no total.
        [many] { $n } de passagens em uma janela de { $hours } h, { $dur } de contato no total.
       *[other] { $n } passagens em uma janela de { $hours } h, { $dur } de contato no total.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-line = A melhor passagem sobe até { $deg }°.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:451
js-meankind-percentile-word = percentil

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:150
js-meankind-pnt-big = O conjunto quântico mantém posição e tempo por { $q }; o conjunto clássico, por { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:154
js-meankind-pnt-classical-label = Holdover, conjunto clássico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:151
js-meankind-pnt-line = Holdover é por quanto tempo cada conjunto (relógio { $q }, contra relógio { $c }) permanece dentro de { $spec } depois que a navegação por satélite é perdida.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:153
js-meankind-pnt-quantum-label = Holdover, conjunto quântico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:156
js-meankind-pnt-timing-classical-label = Erro de temporização, 95 %, clássico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:155
js-meankind-pnt-timing-quantum-label = Erro de temporização, 95 %, quântico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:265
js-meankind-pvt-big =
    { $n ->
        [one] Uma posição é resolvida em { $solved } de { $n } época, com { $rms } m (raiz do erro quadrático médio 3-D).
        [many] Uma posição é resolvida em { $solved } de { $n } de épocas, com { $rms } m (raiz do erro quadrático médio 3-D).
       *[other] Uma posição é resolvida em { $solved } de { $n } épocas, com { $rms } m (raiz do erro quadrático médio 3-D).
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:265
js-meankind-pvt-line = A partir de { $mean } satélites em média, lidos de medições reais do receptor.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-big = Depois da interrupção, o navegador de átomos frios está { $q } m fora; o de grau de navegação, { $c } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-big-outage = Depois de { $dur } sem satélites, o navegador de átomos frios está { $q } m fora; o de grau de navegação, { $c } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-line = Dentro do orçamento: { $q } contra { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-line-threshold = Dentro de { $threshold } m: { $q } contra { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-big = A transferência de tempo quântica mantém { $q } ps (1 sigma) contra { $c } ns da cadeia clássica.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-line = O monitor de segurança detecta { $pd } % dos ataques.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-line-pfa = O monitor de segurança detecta { $pd } % dos ataques com uma taxa de falso alarme de { $pfa }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:163
js-meankind-quantum-link = enlace quântico

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:537
js-meankind-radiometry-big = A câmera atinge NIIRS { $niirs } com distância de amostragem no solo de { $gsd } m, com relação sinal-ruído de { $snr }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:537
js-meankind-radiometry-line = MTF do sistema em Nyquist { $mtf }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:387
js-meankind-reentry-big = A desaceleração máxima é de { $g } g, a { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:387
js-meankind-reentry-line = O veículo está então a { $speed } m/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:199
js-meankind-slam-big = A correspondência de terreno termina com { $matched } m de erro, contra { $free } m só com inércia.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:199
js-meankind-slam-line =
    { $n ->
        [one] Em { $n } ponto de passagem, comparado a um mapa de terreno com { $sigma } m de ruído do altímetro.
        [many] Em { $n } de pontos de passagem, comparados a um mapa de terreno com { $sigma } m de ruído do altímetro.
       *[other] Em { $n } pontos de passagem, comparados a um mapa de terreno com { $sigma } m de ruído do altímetro.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:176
js-meankind-slot-big = O relógio sai da sua guarda do intervalo de tempo { $dur } após a última solução de posição por satélite.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:176
js-meankind-slot-line = Por isso ele precisa de uma solução de posição a cada { $interval }, cerca de { $perDay } por dia.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-big =
    { $n ->
        [one] { $n } corpo posicionado em uma época.
        [many] { $n } de corpos posicionados em uma época.
       *[other] { $n } corpos posicionados em uma época.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-big-link =
    { $n ->
        [one] { $n } corpo posicionado em uma época; a luz leva { $dur } de { $from } a { $to }.
        [many] { $n } de corpos posicionados em uma época; a luz leva { $dur } de { $from } a { $to }.
       *[other] { $n } corpos posicionados em uma época; a luz leva { $dur } de { $from } a { $to }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-line = { $n } enlaces são cronometrados no total.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:135
js-meankind-spoof-caught = O spoofing é detectado antes de romper a especificação de temporização.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:135
js-meankind-spoof-caught-both = O spoofing é detectado antes de romper a especificação de temporização nos dois relógios.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:140
js-meankind-spoof-caught-label = Detectado após, { $name }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:134
js-meankind-spoof-caught-thr = O spoofing é detectado antes de romper a especificação de temporização de { $thr } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:134
js-meankind-spoof-caught-thr-both = O spoofing é detectado antes de romper a especificação de temporização de { $thr } ns nos dois relógios.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:139
js-meankind-spoof-detects = { $name } o detecta após { $dur }, com um deslocamento de { $offset } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:138
js-meankind-spoof-missed =
    { $n ->
        [one] O spoofing rompe a especificação de temporização antes que { $names } o detecte.
        [many] O spoofing rompe a especificação de temporização antes que { $names } o detectem.
       *[other] O spoofing rompe a especificação de temporização antes que { $names } o detectem.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:140
js-meankind-spoof-offset = deslocamento { $offset } ns

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-by = Sim: o spoofing é detectado, por { $by }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-no = Não: o monitor fundido não detecta o spoofing.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-yes = Sim: o spoofing é detectado.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-line =
    { $n ->
        [one] { $on } de { $n } camada de detecção emite alarme.
        [many] { $on } de { $n } de camadas de detecção emitem alarme.
       *[other] { $on } de { $n } camadas de detecção emitem alarme.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-line-score =
    { $n ->
        [one] { $on } de { $n } camada de detecção emite alarme; a pontuação fundida é { $score }.
        [many] { $on } de { $n } de camadas de detecção emitem alarme; a pontuação fundida é { $score }.
       *[other] { $on } de { $n } camadas de detecção emitem alarme; a pontuação fundida é { $score }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:587
js-meankind-ssv-formation = Com { $km } km de separação, o filtro conhece a posição relativa com { $filter } m RMS, contra { $absolute } m obtidos pela diferença entre as duas soluções de posição absolutas.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:582
js-meankind-ssv-navigation = O filtro a bordo mantém a posição com { $inside } m RMS dentro das órbitas GNSS e { $above } m acima delas.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:572
js-meankind-ssv-shell = Na casca esférica, todas as constelações juntas dão pelo menos um sinal em { $one } % do tempo e pelo menos quatro em { $four } % (L1).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:568
js-meankind-ssv-tail = MODELLED: uma varredura geométrica e de orçamento de enlace, não uma medição de qualquer sinal no espaço.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:577
js-meankind-ssv-trajectory = De { $from } a { $to } km de altitude, pelo menos um sinal está à vista em { $one } % das épocas e pelo menos quatro em { $four } % (L1, todas as constelações).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:452
js-meankind-station-big = Sobre a região polar sul, as correções de uma estação de referência lunar reduzem o erro, { $percentile }, de { $from } m para { $to } m (modelado).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:452
js-meankind-station-line = Dentro do limiar de exatidão em { $share } % das épocas; não é uma afirmação sobre nenhum sistema real.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-big =
    { $n ->
        [one] Em { $n } valor de { $param }, { $parts }.
        [many] Em { $n } de valores de { $param }, { $parts }.
       *[other] Em { $n } valores de { $param }, { $parts }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-line = { $param } vai de { $from } a { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-line-log = { $param } vai de { $from } a { $to } em escala logarítmica.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:114
js-meankind-sweep-part-flat = { $key } { $metric } permanece em { $value }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:114
js-meankind-sweep-part-goes = { $key } { $metric } vai de { $first } a { $last }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:113
js-meankind-sweep-result-word = resultado

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:122
js-meankind-sweepnd-big =
    { $n ->
        [one] Em { $n } combinação de { $keys }, { $metric } varia de { $min } a { $max }.
        [many] Em { $n } de combinações de { $keys }, { $metric } varia de { $min } a { $max }.
       *[other] Em { $n } combinações de { $keys }, { $metric } varia de { $min } a { $max }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:122
js-meankind-sweepnd-line = Uma grade de { $shape } execuções do motor.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-fail =
    { $n ->
        [one] O relógio falha em { $fail } de { $n } verificação de erro de tempo de telecomunicações.
        [many] O relógio falha em { $fail } de { $n } de verificações de erro de tempo de telecomunicações.
       *[other] O relógio falha em { $fail } de { $n } verificações de erro de tempo de telecomunicações.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-line = Verificações de MTIE (erro máximo de intervalo de tempo), TDEV (desvio de tempo) e do envelope de holdover contra as máscaras ITU-T indicadas em cada linha.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-line-margin = Verificações de MTIE (erro máximo de intervalo de tempo), TDEV (desvio de tempo) e do envelope de holdover contra as máscaras ITU-T indicadas em cada linha. A menor margem em relação ao envelope de holdover é de { $margin } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-pass =
    { $n ->
        [one] O relógio passa na verificação ({ $n }) de erro de tempo de telecomunicações.
        [many] O relógio passa em todas as { $n } de verificações de erro de tempo de telecomunicações.
       *[other] O relógio passa em todas as { $n } verificações de erro de tempo de telecomunicações.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:289
js-meankind-the-best = o melhor

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:422
js-meankind-the-body = o corpo

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:410
js-meankind-the-first = o primeiro

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:138
js-meankind-the-name = { $name }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:410
js-meankind-the-second = o segundo

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-the-widest-signal = o sinal mais largo

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-timebudget-big = O erro de { $clock } e o erro do referencial se cruzam em um tempo de média de { $tau }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-timebudget-line = Nesse cruzamento, o erro de tempo é de { $x } s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:184
js-meankind-timeoffset-big = Um relógio na Lua adianta { $rate } µs por dia em relação a um na Terra.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:184
js-meankind-timeoffset-line = A faixa publicada vai de { $low } a { $high } µs por dia.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-big = { $q } mantém os dois locais dentro de { $qps } ps (raiz do erro quadrático médio); { $c }, dentro de { $cps } ps.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-line = Dentro da especificação de medição de distância em { $q } % do tempo, contra { $c } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-line-mm = Dentro da especificação de medição de distância de { $mm } mm em { $q } % do tempo, contra { $c } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:283
js-meankind-tracking-big = Um spoofer pode capturar o receptor a até { $km } km de distância.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:283
js-meankind-tracking-line = Sob a dinâmica de malha do próprio receptor, o travamento é perdido com { $db } dB de jammer acima do sinal.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:250
js-meankind-trade-big = Os sensores quânticos são { $timing } vezes melhores em temporização e { $inertial } vezes melhores em navegação inercial do que a linha de base clássica.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:250
js-meankind-trade-line = Sem satélites, o conjunto quântico segue por inércia durante { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:541
js-meankind-ttbudget-big = O deslocamento bidirecional é de { $offset } ns, com incerteza combinada de { $uncertainty } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:541
js-meankind-ttbudget-line = Sagnac { $sagnac } ns; ionosfera { $iono } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:215
js-meankind-ukf-big-no = Não: o filtro não é autoconsistente.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:215
js-meankind-ukf-big-yes = Sim: o filtro é autoconsistente.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:213
js-meankind-ukf-line-in = O quadrado da sua inovação normalizada tem média de { $mean }, dentro da faixa de 95 % de { $low } a { $high }. Isso verifica a consistência, não a exatidão.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:213
js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] O quadrado da sua inovação normalizada tem média de { $mean }, dentro da faixa de 95 % de { $low } a { $high }, em { $n } semente. Isso verifica a consistência, não a exatidão.
        [many] O quadrado da sua inovação normalizada tem média de { $mean }, dentro da faixa de 95 % de { $low } a { $high }, em { $n } de sementes. Isso verifica a consistência, não a exatidão.
       *[other] O quadrado da sua inovação normalizada tem média de { $mean }, dentro da faixa de 95 % de { $low } a { $high }, em { $n } sementes. Isso verifica a consistência, não a exatidão.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:214
js-meankind-ukf-line-out = O quadrado da sua inovação normalizada tem média de { $mean }, fora da faixa de 95 % de { $low } a { $high }. Isso verifica a consistência, não a exatidão.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:214
js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] O quadrado da sua inovação normalizada tem média de { $mean }, fora da faixa de 95 % de { $low } a { $high }, em { $n } semente. Isso verifica a consistência, não a exatidão.
        [many] O quadrado da sua inovação normalizada tem média de { $mean }, fora da faixa de 95 % de { $low } a { $high }, em { $n } de sementes. Isso verifica a consistência, não a exatidão.
       *[other] O quadrado da sua inovação normalizada tem média de { $mean }, fora da faixa de 95 % de { $low } a { $high }, em { $n } sementes. Isso verifica a consistência, não a exatidão.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-user-word = usuário

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:473
js-meankind-vlbi-big = Em uma linha de base de { $km } km, o sinal da baliza chega com { $ms } ms de diferença nas duas estações.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:473
js-meankind-vlbi-line = A correção de campo próximo é de { $us } µs.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:478
js-meankind-vlbifim-big = Cada coordenada de estação é conhecida com { $m } m a partir deste cronograma de observação.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:478
js-meankind-vlbifim-line = A estimativa simples de partes iguais alegaria { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-big = A alta atmosfera aquece até { $k } K.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-big-ref = A alta atmosfera aquece até { $k } K, contra { $ref } K da referência.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-line = O índice de atividade geomagnética ap é { $ap }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:155
js-meankind-whole-run = ao longo de toda a execução

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-label = Rótulo

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-share = Tamanho em relação ao maior termo de posição

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-sigma = 1 sigma

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-source = Contribuição

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:65
js-mthread-budget-caption = { $phase }: 1 sigma na entrada { $entry }, no pico { $peak }, na saída { $exit } (posição); cada contribuição abaixo, da maior para a menor.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:131
js-mthread-chart-title = { $metric } em função do tempo decorrido da missão, uma faixa por fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-kind = Tipo

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-label = Rótulo

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-limit = Maior contribuição

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-margin = Em relação ao limite

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-pos = Posição de pico

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-time = Desvio de pico do relógio

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-vel = Velocidade de pico

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-phase = Fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-window = Tempo da missão

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:81
js-mthread-example-not-loaded = o resultado registrado não foi carregado

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:97
js-mthread-file-failed = Não foi possível ler { $name }: { $reason }.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:27
js-mthread-kv-elapsed = Tempo decorrido da missão

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:31
js-mthread-kv-engine = Motor

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:29
js-mthread-kv-epoch = Época (UTC)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:28
js-mthread-kv-limits = Fases com limite declarado

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:28
js-mthread-kv-limits-value = { $n } ({ $met } atendidos, { $missed } não atendidos)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:26
js-mthread-kv-phases = Fases

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:30
js-mthread-kv-seed = Semente

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:25
js-mthread-kv-title = Fio

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:39
js-mthread-layout-phases = Largura igual por fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:39
js-mthread-layout-time = Tempo real da missão

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:148
js-mthread-limit-title = { $phase }: o limite declarado, { $limit }

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:163
js-mthread-log-scale = escala logarítmica

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-margin-met = { $m }× o limite, atendido

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-margin-missed = { $m }× o limite, não atendido

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-pos = Posição, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-time = Desvio do relógio, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-vel = Velocidade, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:21
js-mthread-na = n/d

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:67
js-mthread-no-events = Esta fase não registra nenhum evento.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:67
js-mthread-no-phases = o resultado não contém nenhuma fase

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-no-requirement = nenhum limite declarado

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:127
js-mthread-no-series = O resultado não contém amostras desta grandeza.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:23
js-mthread-no-weak = O resultado não nomeia nenhum elo mais fraco.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:46
js-mthread-not-json = o resultado não é JSON ({ $reason })

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:47
js-mthread-not-thread = este não é um resultado de fio da missão (esquema { $schema } esperado)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:46
js-mthread-note-phases = Cada fase é desenhada com a mesma largura, de modo que uma fase curta seja tão visível quanto uma longa; o instante em que cada uma começa fica abaixo da faixa. Mude para o tempo real da missão para ver as proporções reais. As linhas tracejadas são os limites que o documento declara; uma interrupção na linha é uma transferência.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:47
js-mthread-note-time = Tempo real da missão: uma fase de poucos minutos pode ser estreita demais para ser vista. Mude para larguras iguais para lê-la. As linhas tracejadas são os limites que o documento declara; uma interrupção na linha é uma transferência.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:86
js-mthread-open-failed = Não foi possível abrir o exemplo: { $reason }.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:96
js-mthread-opened = { $name } lido nesta página; nada foi enviado a lugar nenhum.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:78
js-mthread-opening = Abrindo o exemplo da classe Artemis…

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:74
js-mthread-prov = Todo rótulo desta página é do próprio motor; a página copia cada número do resultado e apenas o escala.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:85
js-mthread-recorded = O resultado registrado do motor (versão { $version }): uma cadeia ilustrativa construída a partir de descrições públicas de missões; os números são modelados e não representam nada real.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:66
js-mthread-sets-peak = define o pico

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:91
js-mthread-too-large = Esse arquivo é maior que { $mb } MB; ele não é lido.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:22
js-mthread-weak-line = O elo mais fraco é a fase <b>{ $phase }</b>: { $margin }× seu limite declarado, definido por { $source }. A margem é a menor razão entre um limite declarado e o pico da fase; acima de 1, atende ao requisito.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:53
js-mthread-weakest-flag = elo mais fraco

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:158
js-mthread-weakest-mark = elo mais fraco

# 2026-10-01-studio-rebuild/lib/observatory.mjs:147
js-obs-cell-extent = { $south }° a { $north }° N, { $west }° a { $east }° E

# 2026-10-01-studio-rebuild/observatory/observatory.js:89
js-obs-cell-read = { $state }: { $cell }. Amostradas { $sampled }, afetadas { $affected }.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:175
js-obs-cell-title = { $state }; amostradas { $sampled }, afetadas { $affected }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:174
js-obs-cell-title-reason = { $state } ({ $reason }); amostradas { $sampled }, afetadas { $affected }

# 2026-10-01-studio-rebuild/observatory/observatory.js:71
js-obs-clear-note = { $notClear } Uma célula sem registro foi vista por menos de 5 aeronaves distintas e é retida; ela não é desenhada. A cor nunca é a única pista: não observado é hachurado, e a tabela descreve cada estado por extenso.

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-affected = Aeronaves afetadas

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-bbox = Caixa delimitadora (S, W, N, E)

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-bytes = Bytes

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-cause = Causa

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-cell = Célula (latitude, longitude)

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-cells = Células

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-check = Verificação

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-file = Arquivo

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-incident = Incidente

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-sampled = Aeronaves amostradas

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-sha = SHA-256 (manifesto)

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-share = Proporção afetada

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-state = Estado

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-why = Por que não observado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:132
js-obs-day-alt = { $degraded } células degradadas, { $notDegraded } não degradadas, { $notObserved } não observadas, em { $date }.

# 2026-10-01-studio-rebuild/observatory/observatory.js:63
js-obs-day-heading = Dia { $date } (UTC)

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-attribution = Atribuição

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-coverage = Cobertura

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-dataset = Conjunto de dados

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-licence = Licença

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-licence-address = Endereço da licença

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-product = Produto

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-written-by = Escrito pelo Kshana

# 2026-10-01-studio-rebuild/lib/observatory.mjs:96
js-obs-err-cause = { $name } declara uma causa diferente de "not attributed"; esta página não mostra nenhuma

# 2026-10-01-studio-rebuild/lib/observatory.mjs:70
js-obs-err-feature-polygon = { $name }: o elemento { $n } não é um polígono de célula

# 2026-10-01-studio-rebuild/lib/observatory.mjs:68
js-obs-err-feature-state = { $name }: o elemento { $n } tem o estado "{ $state }", que não é um de { $states }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:100
js-obs-err-incident-object = { $name }: o incidente { $n } não é um objeto

# 2026-10-01-studio-rebuild/lib/observatory.mjs:62
js-obs-err-no-date = { $name } não declara nenhuma data

# 2026-10-01-studio-rebuild/lib/observatory.mjs:63
js-obs-err-no-features = { $name } não tem elementos

# 2026-10-01-studio-rebuild/lib/observatory.mjs:97
js-obs-err-no-incidents = { $name } não tem lista de incidentes

# 2026-10-01-studio-rebuild/lib/observatory.mjs:61
js-obs-err-not-day = { $name } não é um arquivo { $schema }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:95
js-obs-err-not-incident = { $name } não é um arquivo { $schema }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:46
js-obs-err-not-json = { $what } não é JSON ({ $reason })

# 2026-10-01-studio-rebuild/lib/observatory.mjs:110
js-obs-err-not-manifest = { $name } não é um arquivo { $schema }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:46
js-obs-err-not-object = { $what } não é um objeto JSON

# 2026-10-01-studio-rebuild/lib/observatory.mjs:45
js-obs-err-not-text = { $what } não é texto ou é maior que { $mib } MiB

# 2026-10-01-studio-rebuild/lib/observatory.mjs:64
js-obs-err-states = { $name } cita estados diferentes dos três que esta página mostra

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-matches = confere

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-mismatch = não confere

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-no-hash = nenhum hash declarado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:122
js-obs-file-not-opened = não aberto

# 2026-10-01-studio-rebuild/observatory/observatory.js:119
js-obs-files-note = Método { $method }. O SHA-256 de cada arquivo é calculado aqui a partir do arquivo que você abriu e comparado com o manifesto; um arquivo que você não abriu não é verificado.

# 2026-10-01-studio-rebuild/observatory/observatory.js:102
js-obs-incident = incidente

# 2026-10-01-studio-rebuild/observatory/observatory.js:97
js-obs-incident-note = Células degradadas contíguas (diagonais incluídas) formam um incidente. A causa de todo incidente é: não atribuída. Isto não é uma confirmação nem um NOTAM.

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-cells = Células publicadas

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-day-wide = Efeito em todo o dia

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-degraded = Degradado

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-not-degraded = Não degradado

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-not-observed = Não observado (publicado)

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-scope = Escopo

# 2026-10-01-studio-rebuild/lib/observatory.mjs:178
js-obs-map-aria = { $summary } A tabela abaixo lista todas as células.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:20
js-obs-means-degraded = Uma alta proporção das aeronaves amostradas na célula informou baixa exatidão de navegação naquele dia, claramente acima do fundo daquele dia.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:21
js-obs-means-not-degraded = Aeronaves suficientes foram amostradas e a proporção não atendeu à regra.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:22
js-obs-means-not-observed = Os dados não permitiram uma conclusão. Isso não é "livre".

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-na = n/d

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-no = não

# 2026-10-01-studio-rebuild/lib/observatory.mjs:161
js-obs-no-cells = Nenhuma célula neste arquivo

# 2026-10-01-studio-rebuild/observatory/observatory.js:45
js-obs-no-day-file = Os arquivos de { $date } não têm arquivo do dia (.geojson), portanto não há nada a mostrar para ele.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:139
js-obs-no-degraded = Nenhuma célula degradada neste dia.

# 2026-10-01-studio-rebuild/observatory/observatory.js:47
js-obs-no-file-read = Nenhum arquivo pôde ser lido.

# 2026-10-01-studio-rebuild/observatory/observatory.js:96
js-obs-no-incident-file = Nenhum arquivo de incidentes foi aberto para este dia.

# 2026-10-01-studio-rebuild/observatory/observatory.js:118
js-obs-no-manifest = Nenhum manifesto foi aberto para este dia, portanto os arquivos não podem ser verificados em relação aos seus hashes.

# 2026-10-01-studio-rebuild/observatory/observatory.js:129
js-obs-no-notice = Este arquivo não traz nenhum aviso. A declaração consultiva no topo desta página vale da mesma forma.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:148
js-obs-no-reason = nenhum motivo declarado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:28
js-obs-not-clear = Não observado não significa livre.

# 2026-10-01-studio-rebuild/observatory/observatory.js:41
js-obs-not-readable = { $name }: não é um arquivo que esta página lê (.geojson, .incidents.json, .manifest.json ou .png).

# 2026-10-01-studio-rebuild/observatory/observatory.js:68
js-obs-not-stated = não declarado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:138
js-obs-note-day-wide = Este foi um dia de efeito em todo o dia: o fundo do dia já era alto, portanto nenhuma célula pôde ser avaliada naquele dia. Isso não é uma afirmação de que o céu estava limpo.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:141
js-obs-note-summary-mismatch = O resumo declarado pelo arquivo não coincide com as células que ele lista; os números são mostrados como escritos.

# 2026-10-01-studio-rebuild/observatory/observatory.js:47
js-obs-nothing-yet = Nada a mostrar ainda: abra também o arquivo .geojson do dia.

# 2026-10-01-studio-rebuild/observatory/observatory.js:129
js-obs-notice = Aviso trazido pelo arquivo: { $notice }

# 2026-10-01-studio-rebuild/observatory/observatory.js:24
js-obs-opened-day-file = Aberto { $days } dia a partir de { $files } arquivo. Lido aqui; nada foi enviado.

# 2026-10-01-studio-rebuild/observatory/observatory.js:23
js-obs-opened-day-files = Aberto { $days } dia a partir de { $files } arquivos. Lido aqui; nada foi enviado.

# 2026-10-01-studio-rebuild/observatory/observatory.js:22
js-obs-opened-days-file = Abertos { $days } dias a partir de { $files } arquivo. Lido aqui; nada foi enviado.

# 2026-10-01-studio-rebuild/observatory/observatory.js:21
js-obs-opened-days-files = Abertos { $days } dias a partir de { $files } arquivos. Lido aqui; nada foi enviado.

# 2026-10-01-studio-rebuild/observatory/observatory.js:43
js-obs-read-failed = { $name }: não pôde ser lido ({ $reason }).

# 2026-10-01-studio-rebuild/lib/observatory.mjs:32
js-obs-reason-day-wide = o fundo do dia já era alto, portanto nenhuma célula pôde ser avaliada naquele dia

# 2026-10-01-studio-rebuild/lib/observatory.mjs:30
js-obs-reason-insufficient = poucas aeronaves foram amostradas para uma conclusão

# 2026-10-01-studio-rebuild/lib/observatory.mjs:31
js-obs-reason-no-background = não havia fundo do dia com que comparar a célula

# 2026-10-01-studio-rebuild/observatory/observatory.js:66
js-obs-release = Liberado não antes de { $when }: os produtos são publicados pelo menos { $hours } horas depois do fim do dia, em células de { $deg } graus. Esta não é uma visualização ao vivo.

# 2026-10-01-studio-rebuild/observatory/observatory.js:66
js-obs-release-default = o fim do dia mais o atraso

# 2026-10-01-studio-rebuild/observatory/observatory.js:113
js-obs-show-all =
    { $n ->
        [one] Mostrar { $n } célula
        [many] Mostrar todas as { $n } de células
       *[other] Mostrar todas as { $n } células
    }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:15
js-obs-state-degraded = Degradado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:16
js-obs-state-not-degraded = Não degradado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:17
js-obs-state-not-observed = Não observado

# 2026-10-01-studio-rebuild/lib/observatory.mjs:57
js-obs-the-day-file = o arquivo do dia

# 2026-10-01-studio-rebuild/lib/observatory.mjs:92
js-obs-the-incident-file = o arquivo de incidentes

# 2026-10-01-studio-rebuild/lib/observatory.mjs:107
js-obs-the-manifest = o manifesto

# 2026-10-01-studio-rebuild/observatory/observatory.js:32
js-obs-too-large = { $name }: maior que { $mib } MiB; abra um arquivo menor.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:131
js-obs-unstated-number = um número não declarado de

# 2026-10-01-studio-rebuild/lib/observatory.mjs:40
js-obs-withheld = retida

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-yes-no-call = sim: nenhuma célula pôde ser avaliada

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-avail-label = Disponibilidade, teto e disponibilidade em céu limpo por local

# 2026-10-01-studio-rebuild/lib/optical.mjs:145
js-opt-avail-note = Por local: a disponibilidade do enlace diante de desvanecimentos por nuvens e turbulência, o teto que nenhuma margem extra consegue elevar (nuvens e apontamento) e a disponibilidade sem nenhuma nuvem.

# 2026-10-01-studio-rebuild/lib/optical.mjs:145
js-opt-avail-title = Disponibilidade em relação ao teto

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-available = { $name }: disponível

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-ceiling = { $name }: teto

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-clear-sky = { $name }: céu limpo

# 2026-10-01-studio-rebuild/lib/optical.mjs:19
js-opt-blurb-network = Um local ao norte, mais nublado, um central, intermediário, e um ao sul, mais limpo, observam um terminal óptico LEO a 30 graus: com que frequência o enlace está ativo e o que locais adicionais proporcionam?

# 2026-10-01-studio-rebuild/lib/optical.mjs:20
js-opt-blurb-techniques = Um enlace de subida a 25 graus em nuvens e turbulência: o que proporcionam outro comprimento de onda, uma abertura maior, óptica adaptativa ou mais margem?

# 2026-10-01-studio-rebuild/lib/optical.mjs:128
js-opt-cloud-episode = episódio de nuvens

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-correlated = correlacionado

# 2026-10-01-studio-rebuild/lib/optical.mjs:69
js-opt-default-bars = barras

# 2026-10-01-studio-rebuild/lib/optical.mjs:80
js-opt-default-chart = gráfico

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-direction-wave = { $direction }, onda { $wave }

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-diversity-label = Disponibilidade da rede em função do número de locais

# 2026-10-01-studio-rebuild/lib/optical.mjs:153
js-opt-diversity-note = Disponibilidade dos melhores 1, 2 e 3 locais, com tempo meteorológico independente e com tempo meteorológico correlacionado em { $km } km.

# 2026-10-01-studio-rebuild/lib/optical.mjs:153
js-opt-diversity-title = Diversidade de locais

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-capture-loss = Perda geométrica de captura

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-direction = Direção

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-elevation = Elevação

# 2026-10-01-studio-rebuild/lib/optical.mjs:175
js-opt-fact-footprint = Pegada do feixe

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-margin = Margem sem atmosfera

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-received = Potência recebida, sem atmosfera

# 2026-10-01-studio-rebuild/lib/optical.mjs:175
js-opt-fact-sensitivity = Sensibilidade do receptor

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-wavelength = Comprimento de onda

# 2026-10-01-studio-rebuild/lib/optical.mjs:155
js-opt-gain-points = +{ $n } { $n ->
        [one] ponto
        [many] de pontos
       *[other] pontos
    }

# 2026-10-01-studio-rebuild/lib/optical.mjs:133
js-opt-hours = horas

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-independent = independente

# 2026-10-01-studio-rebuild/lib/optical.mjs:127
js-opt-link-down = enlace inativo

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-margin-label = Margem extra necessária para cada meta de disponibilidade

# 2026-10-01-studio-rebuild/lib/optical.mjs:125
js-opt-margin-line-title = { $name }: margem do enlace, dB

# 2026-10-01-studio-rebuild/lib/optical.mjs:147
js-opt-margin-note = Margem extra do enlace, em dB além do enlace atual, para cada meta de disponibilidade; negativo significa que o enlace já tem mais do que precisa. Uma meta acima do teto de um local não tem margem que a alcance (o motor a omite).

# 2026-10-01-studio-rebuild/lib/optical.mjs:147
js-opt-margin-title = Margem de que cada meta de disponibilidade precisa

# 2026-10-01-studio-rebuild/optical/optical.js:39
js-opt-model-output = Saída do modelo

# 2026-10-01-studio-rebuild/lib/optical.mjs:167
js-opt-na = n/d

# 2026-10-01-studio-rebuild/lib/optical.mjs:83
js-opt-no-data = Nenhum dado neste resultado.

# 2026-10-01-studio-rebuild/lib/optical.mjs:112
js-opt-no-series = Nenhuma série temporal neste resultado.

# 2026-10-01-studio-rebuild/optical/optical.js:42
js-opt-no-source = nenhuma fonte declarada

# 2026-10-01-studio-rebuild/lib/optical.mjs:37
js-opt-not-result = este não é um resultado de atmosfera óptica com locais

# 2026-10-01-studio-rebuild/optical/optical.js:30
js-opt-open-failed = Não foi possível abrir { $title }: { $reason }.

# 2026-10-01-studio-rebuild/optical/optical.js:20
js-opt-opening = Abrindo { $title }…

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-outage-label = Probabilidade de uma interrupção durar mais que uma duração

# 2026-10-01-studio-rebuild/lib/optical.mjs:149
js-opt-outage-note = Probabilidade de uma interrupção durar mais que uma duração, por local (eixo de tempo logarítmico).

# 2026-10-01-studio-rebuild/lib/optical.mjs:149
js-opt-outage-title = Quanto duram as interrupções

# 2026-10-01-studio-rebuild/lib/optical.mjs:96
js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

# 2026-10-01-studio-rebuild/optical/optical.js:42
js-opt-prov = { $label } Locais: { $sites }.

# 2026-10-01-studio-rebuild/lib/optical.mjs:119
js-opt-realised-up = { $value } ativo

# 2026-10-01-studio-rebuild/optical/optical.js:28
js-opt-recorded = { $title }: o resultado registrado do motor (versão { $version }). Saída de modelo, não uma medição.

# 2026-10-01-studio-rebuild/lib/optical.mjs:36
js-opt-result-not-json = o resultado não é JSON ({ $reason })

# 2026-10-01-studio-rebuild/optical/optical.js:23
js-opt-result-not-loaded = o resultado registrado não foi carregado

# 2026-10-01-studio-rebuild/lib/optical.mjs:110
js-opt-series-label = Margem do enlace em função do tempo

# 2026-10-01-studio-rebuild/lib/optical.mjs:143
js-opt-series-note = Uma realização com semente do modelo de local declarado (semente { $seed }, { $hours } h em passos de { $step } s): episódios de nuvens, uma coluna de água líquida para cada um, uma amostra de cintilação por passo. A margem é o orçamento de desvanecimento menos os desvanecimentos por nuvens e cintilação; o enlace fica inativo abaixo de 0 dB. É um único sorteio, não o clima: sua disponibilidade difere da declarada pelo erro amostral do sorteio. A margem é limitada a −40 dB para o desenho.

# 2026-10-01-studio-rebuild/lib/optical.mjs:143
js-opt-series-title = Margem do enlace em função do tempo

# 2026-10-01-studio-rebuild/lib/optical.mjs:119
js-opt-stated = declarado { $value }

# 2026-10-01-studio-rebuild/lib/optical.mjs:129
js-opt-stripe-cloud = nuvem

# 2026-10-01-studio-rebuild/lib/optical.mjs:129
js-opt-stripe-down = inativo

# 2026-10-01-studio-rebuild/lib/optical.mjs:126
js-opt-stripe-title = { $what }, hora { $from } a { $to }

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-label = Ganho de disponibilidade por técnica

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-note = Ganho de disponibilidade em pontos percentuais em relação à linha de base, para um local.

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-title = O que cada técnica proporciona

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-availability = Disponibilidade

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-ceiling = Teto

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-clear-air = Perda em ar limpo

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-cloud-prob = Probabilidade de nuvens (entrada)

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-fade-budget = Orçamento de desvanecimento

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-latlon = Latitude, longitude

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-mean-outage = Interrupção média

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-outages-year = Interrupções por ano

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-scint = Índice de cintilação

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-site = Local

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-label = Disponibilidade de temporização por local e relógio

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-note = Fração de todo o tempo em que o erro de temporização permanece dentro do limiar, por local e classe de relógio: o holdover do relógio em relação às durações das interrupções.

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-title = Temporização mantida durante as interrupções

# 2026-10-01-studio-rebuild/lib/optical.mjs:19
js-opt-title-network = Três locais em solo, diversidade de locais

# 2026-10-01-studio-rebuild/lib/optical.mjs:20
js-opt-title-techniques = Um enlace de subida, técnicas de melhoria

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-x-best-n = melhores n locais

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-x-outage-duration = duração da interrupção, h (log)

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-x-target = meta de disponibilidade, %

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-y-availability = disponibilidade, %

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-y-extra-margin = margem extra, dB

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-y-p-longer = P(maior)

# 2026-10-01-studio-rebuild/lib/replay.mjs:47
js-replay-band-calibrating = calibrando

# 2026-10-01-studio-rebuild/lib/replay.mjs:49
js-replay-band-degraded = degradado

# 2026-10-01-studio-rebuild/lib/replay.mjs:48
js-replay-band-nominal = nominal

# 2026-10-01-studio-rebuild/replay/replay.js:89
js-replay-band-run-ended = { $band } · execução encerrada

# 2026-10-01-studio-rebuild/lib/replay.mjs:50
js-replay-band-untrusted = não confiável

# 2026-10-01-studio-rebuild/replay/replay.js:101
js-replay-clock = T+{ $t } de { $max }

# 2026-10-01-studio-rebuild/lib/replay.mjs:235
js-replay-coast-hidden = costa oculta: as posições inventadas deste registro caem em terra

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-coast-note = Costa: { $source }, apenas ilustração.

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-coast-note-hidden = { $reason }.

# 2026-10-01-studio-rebuild/lib/replay.mjs:217
js-replay-coast-window = Natural Earth 1:10 milhões, janela { $window }

# 2026-10-01-studio-rebuild/lib/replay.mjs:226
js-replay-coast-world = Natural Earth 1:110 milhões (o contorno do mundo do Studio), grosseiro

# 2026-10-01-studio-rebuild/replay/replay.js:63
js-replay-demo-trust-log = { $title } (registro de confiança)

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-east = leste

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-north = norte

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-south = sul

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-west = oeste

# 2026-10-01-studio-rebuild/lib/replay.mjs:141
js-replay-dirs-and = { $list } e { $last }

# 2026-10-01-studio-rebuild/replay/replay.js:168
js-replay-drawing-animation = Desenhando a animação…

# 2026-10-01-studio-rebuild/replay/replay.js:177
js-replay-drawing-frames = Desenhando os quadros…

# 2026-10-01-studio-rebuild/lib/replay.mjs:140
js-replay-every-direction = todas as direções

# 2026-10-01-studio-rebuild/replay/replay.js:149
js-replay-file-error = { $name }: { $error }

# 2026-10-01-studio-rebuild/lib/kinds.mjs:481
js-replay-kinds-convergence-horizontal = Convergência: erro horizontal mediano

# 2026-10-01-studio-rebuild/lib/kinds.mjs:482
js-replay-kinds-convergence-vertical = Convergência: erro vertical mediano

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-course = Rumo informado

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-heading = Proa (giroscópio)

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-position-error = Erro de posição

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-receiver = Receptor

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-run-time = Tempo de execução

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-satellites = Satélites usados / à vista

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-sky = Céu

# 2026-10-01-studio-rebuild/replay/replay.js:52
js-replay-legend = Legenda

# 2026-10-01-studio-rebuild/replay/replay.js:54
js-replay-legend-no-fix = sem solução de posição

# 2026-10-01-studio-rebuild/replay/replay.js:54
js-replay-legend-true-track = trajetória verdadeira

# 2026-10-01-studio-rebuild/replay/replay.js:107
js-replay-moment = Momento em T+{ $t }:

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-no-coast = Nenhuma costa é desenhada: nenhuma acompanha esta janela.

# 2026-10-01-studio-rebuild/replay/replay.js:92
js-replay-no-gsv = sem GSV neste registro

# 2026-10-01-studio-rebuild/replay/replay.js:143
js-replay-not-json = { $name }: não é JSON.

# 2026-10-01-studio-rebuild/replay/replay.js:89
js-replay-not-scored = sem pontuação

# 2026-10-01-studio-rebuild/lib/observatory.mjs:27
js-replay-obs-not-attributed = não atribuída

# 2026-10-01-studio-rebuild/replay/replay.js:135
js-replay-open-failed = Não foi possível abrir { $id }: { $reason }.

# 2026-10-01-studio-rebuild/replay/replay.js:47
js-replay-open-file = Abrir um arquivo…

# 2026-10-01-studio-rebuild/replay/replay.js:153
js-replay-opened = { $name } aberto no painel { $n }. Lido aqui; nada foi enviado.

# 2026-10-01-studio-rebuild/replay/replay.js:133
js-replay-opening = Abrindo { $id }…

# 2026-10-01-studio-rebuild/replay/replay.js:104
js-replay-pause = Pausar

# 2026-10-01-studio-rebuild/replay/replay.js:104
js-replay-play = Reproduzir

# 2026-10-01-studio-rebuild/replay/replay.js:154
js-replay-read-failed = { $name }: não pôde ser lido ou desenhado ({ $reason }).

# 2026-10-01-studio-rebuild/replay/replay.js:139
js-replay-reading = Lendo { $name }…

# 2026-10-01-studio-rebuild/replay/replay.js:217
js-replay-reduced-motion = Há preferência por movimento reduzido, portanto a reprodução começa em 1x e não é executada sozinha.

# 2026-10-01-studio-rebuild/replay/replay.js:46
js-replay-run = Execução

# 2026-10-01-studio-rebuild/replay/replay.js:46
js-replay-run-shown = Execução exibida no painel { $n }

# 2026-10-01-studio-rebuild/replay/replay.js:172
js-replay-saved-svg = { $name } salvo ({ $size } kB): todos os quadros em um único arquivo, desenhados a partir das mesmas linhas desta página.

# 2026-10-01-studio-rebuild/replay/replay.js:181
js-replay-saved-zip = { $name } salvo ({ $size } MB): um SVG por quadro, um manifesto das linhas por trás de cada um e um README.

# 2026-10-01-studio-rebuild/replay/replay.js:147
js-replay-src-instructor = Seu arquivo { $name }: nenhuma pontuação do motor nem céu acompanha um registro de instrutor isolado.

# 2026-10-01-studio-rebuild/replay/replay.js:150
js-replay-src-trust = Seu arquivo { $name }: um resultado de confiança não traz céu nem proa, portanto eles não são desenhados.

# 2026-10-01-studio-rebuild/replay/replay.js:254
js-replay-status-ready = { $a } e { $b }: execuções sintéticas, pontuadas pelo motor. Pressione Reproduzir ou mova o relógio.

# 2026-10-01-studio-rebuild/replay/replay.js:134
js-replay-status-synthetic = { $titles }: execuções sintéticas, pontuadas pelo motor.

# 2026-10-01-studio-rebuild/replay/replay.js:134
js-replay-status-synthetic-no-coast = { $titles }: execuções sintéticas, pontuadas pelo motor. Linha de costa indisponível.

# 2026-10-01-studio-rebuild/replay/replay.js:51
js-replay-strip-label = Pontuação de confiança ao longo da execução

# 2026-10-01-studio-rebuild/replay/replay.js:23
js-replay-titles-and = { $a } e { $b }

# 2026-10-01-studio-rebuild/replay/replay.js:141
js-replay-too-large = { $name } é maior do que esta página lê.

# 2026-10-01-studio-rebuild/replay/replay.js:75
js-replay-track = Trajetória de { $n } linhas de registro, norte para cima.

# 2026-10-01-studio-rebuild/replay/replay.js:75
js-replay-track-widened = Trajetória de { $n } linhas de registro, norte para cima, ampliada para mostrar a costa mais próxima.

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict = Veredicto

# 2026-10-01-studio-rebuild/lib/replay.mjs:198
js-replay-verdict-degraded = { $dur } degradado, nenhum não confiável

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-early = Veredicto (preliminar)

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-fine = Apenas a partir do registro e da pontuação do motor; sintético, consultivo, não um valor de desempenho de detecção.

# 2026-10-01-studio-rebuild/lib/replay.mjs:196
js-replay-verdict-first = primeira queda abaixo do nominal em T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:195
js-replay-verdict-first-after = primeira queda abaixo do nominal em T+{ $t }, { $dur } depois do início do primeiro evento (T+{ $onset })

# 2026-10-01-studio-rebuild/lib/replay.mjs:196
js-replay-verdict-first-before = primeira queda abaixo do nominal em T+{ $t }, antes do início do primeiro evento (T+{ $onset })

# 2026-10-01-studio-rebuild/lib/replay.mjs:193
js-replay-verdict-lowest = Menor pontuação de confiança { $score } ({ $band }) em T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:194
js-replay-verdict-never-left = a pontuação nunca saiu da faixa nominal

# 2026-10-01-studio-rebuild/lib/replay.mjs:201
js-replay-verdict-no-fix = sem solução de posição por { $dur }

# 2026-10-01-studio-rebuild/lib/replay.mjs:199
js-replay-verdict-not-scored = Sem pontuação: a pontuação de confiança do motor é exibida para as execuções da biblioteca

# 2026-10-01-studio-rebuild/lib/replay.mjs:200
js-replay-verdict-peak-error = maior erro de posição registrado { $err } m em T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:197
js-replay-verdict-untrusted = { $dur } na faixa não confiável

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-wait = Exibido quando esta execução terminar, em T+{ $t }.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-altitude-label = Altitude e medições usadas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-at-least-1 = pelo menos 1 sinal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-at-least-4 = pelo menos 4 sinais

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-avail-label = Disponibilidade, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:96
js-ssv-bar-title = { $label }, { $name }: { $value }{ $unit }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:26
js-ssv-blurb-formation-heo = Um chefe e um adjunto separados por um quilômetro em uma órbita muito elíptica: com que precisão o filtro conhece a posição relativa deles, em comparação com o que as duas soluções de posição absolutas dariam.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:23
js-ssv-blurb-heo = Uma órbita muito elíptica (apogeu perto de 58 600 km) com uma antena de alto ganho apontada ao nadir, uma antena patch ao zênite e um modelo paramétrico de lóbulos laterais: sinais à vista, melhor C/N0, lóbulo principal contra lóbulo lateral, diluição de precisão e os sinais que tangenciam a atmosfera.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:24
js-ssv-blurb-lunar-weak = Uma trajetória de transferência lunar com um receptor construído para funcionar nos sinais mais fracos: o que ele precisa para adquirir e rastrear e quanto da trajetória ele consegue usar.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:25
js-ssv-blurb-nav-lunar = Um filtro de navegação a bordo em uma transferência lunar: seu erro de posição em relação ao limite que ele declara, abaixo e acima das órbitas dos próprios satélites GNSS.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:22
js-ssv-blurb-shell = Uma casca esférica na altitude geoestacionária, amostrada em uma grade: com que frequência uma espaçonave ali escuta pelo menos um e pelo menos quatro sinais a 20 dB-Hz, em L1 e L5, para cada constelação e para todas juntas?

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-cn0-altitude-label = Melhor C/N0 e altitude em função do tempo, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-label = Melhor C/N0, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-note = Dos sinais à vista, o mais forte em cada época: do menor ao maior ao longo das épocas, com a média marcada.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-title = Melhor densidade de portadora em relação ao ruído, { $band }

# 2026-10-01-studio-rebuild/ssv/ssv.js:57
js-ssv-comparison-failed = A comparação não pôde ser exibida ({ $reason }).

# 2026-10-01-studio-rebuild/ssv/ssv.js:53
js-ssv-comparison-not-loaded = o arquivo de comparação não foi carregado

# 2026-10-01-studio-rebuild/lib/ssv.mjs:82
js-ssv-default-bars = barras

# 2026-10-01-studio-rebuild/lib/ssv.mjs:104
js-ssv-default-chart = gráfico

# 2026-10-01-studio-rebuild/lib/ssv.mjs:133
js-ssv-default-ranges = faixas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:184
js-ssv-deputies-note = RMS absoluto do chefe de { $rms } m ao longo de { $epochs } épocas.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:184
js-ssv-deputies-title = Cada adjunto

# 2026-10-01-studio-rebuild/lib/ssv.mjs:170
js-ssv-dop-note = Mediana, percentil 95 e pior PDOP nas épocas que têm uma solução de posição e, quando o cenário define uma atmosfera, os sinais que a tangenciam.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:170
js-ssv-dop-title = Diluição de precisão e a atmosfera, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-err-label = Erro de posição em relação ao limite declarado

# 2026-10-01-studio-rebuild/lib/ssv.mjs:176
js-ssv-err-note = A linha tracejada é o limite de um sigma que o filtro declara; a linha contínua é o seu erro em relação à verdade que o cenário conhece. Decimado pelo motor.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:176
js-ssv-err-title = Erro de posição em relação ao limite do próprio filtro

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-antenna = Antena

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-apogee = Altitude do apogeu

# 2026-10-01-studio-rebuild/lib/ssv.mjs:225
js-ssv-fact-cn0-threshold = Limiar de densidade de portadora em relação ao ruído

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-duration = Duração

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-eccentricity = Excentricidade

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-grid-points = Pontos de grade

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-inclination = Inclinação

# 2026-10-01-studio-rebuild/lib/ssv.mjs:221
js-ssv-fact-mode = Modo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-perigee = Altitude do perigeu

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-period = Período

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-shell-altitude = Altitude da casca

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-sma = Semieixo maior

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-step = Passo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-filter = filtro

# 2026-10-01-studio-rebuild/lib/ssv.mjs:182
js-ssv-formation-note = Erro de posição relativa RMS, a partir do filtro e da diferença entre as duas soluções de posição absolutas, ao longo de toda a execução e acima das órbitas GNSS.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:182
js-ssv-formation-title = Posição relativa dos adjuntos

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-from-absolute = a partir de duas soluções de posição absolutas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:78
js-ssv-group-combined = todas juntas

# 2026-10-01-studio-rebuild/ssv/ssv.js:56
js-ssv-icg-note = { $label }; os veredictos por limiar dos arquivos de resultado confirmados do motor (commit do motor { $commit }). As tabelas do livreto são públicas; nada aqui é VALIDATED.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:208
js-ssv-icg-wrong-file = o arquivo de comparação do ICG não é o que esta página lê

# 2026-10-01-studio-rebuild/lib/ssv.mjs:165
js-ssv-lobe-note = Quantos dos enlaces utilizáveis vieram pelo lóbulo principal e quantos por um lóbulo lateral, conforme contado pelo motor.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:165
js-ssv-lobe-title = Lóbulo principal e lóbulo lateral, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:17
js-ssv-na = n/d

# 2026-10-01-studio-rebuild/lib/ssv.mjs:179
js-ssv-nav-note = Medições usadas e descartadas, o maior intervalo com menos de quatro sinais, o erro final e a estimativa da pressão de radiação solar em relação à verdade que o cenário conhece.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:179
js-ssv-nav-title = A execução em números

# 2026-10-01-studio-rebuild/lib/ssv.mjs:190
js-ssv-never = nunca

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-never-had-four = nunca teve quatro

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-never-had-one = nunca teve um

# 2026-10-01-studio-rebuild/lib/ssv.mjs:135
js-ssv-no-range = Nenhuma faixa neste resultado.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:107
js-ssv-no-series = O resultado não traz nenhuma série para este gráfico.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:216
js-ssv-not-in-variant = não faz parte da variante

# 2026-10-01-studio-rebuild/lib/ssv.mjs:35
js-ssv-not-result = este não é um resultado gnss-ssv

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-of = { $n } de { $total }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-offset = deslocamento de { $deg }°

# 2026-10-01-studio-rebuild/ssv/ssv.js:29
js-ssv-open-failed = Não foi possível abrir { $title }: { $reason }.

# 2026-10-01-studio-rebuild/ssv/ssv.js:19
js-ssv-opening = Abrindo { $title }…

# 2026-10-01-studio-rebuild/lib/ssv.mjs:157
js-ssv-outage-note = Em minutos, ao longo da execução. "Nunca" indica um grupo que nunca teve essa quantidade de sinais em lugar algum da casca.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:157
js-ssv-outage-title = Maiores interrupções na casca

# 2026-10-01-studio-rebuild/lib/ssv.mjs:175
js-ssv-phases-note = Uma estatística do filtro ao longo da execução e das duas partes dela. Um NEES médio de posição próximo de 3 significa que o limite declarado do filtro é consistente com o seu erro.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:175
js-ssv-phases-title = Erro de posição por fase

# 2026-10-01-studio-rebuild/lib/ssv.mjs:122
js-ssv-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:143
js-ssv-range-title = { $label }: mín. { $min }, média { $mean }, máx. { $max } { $unit }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:145
js-ssv-range-value = { $min } a { $max }

# 2026-10-01-studio-rebuild/ssv/ssv.js:27
js-ssv-recorded = { $title }: o resultado registrado do motor (versão { $version }).

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-relative-label = Erro de posição relativa

# 2026-10-01-studio-rebuild/lib/ssv.mjs:34
js-ssv-result-not-json = o resultado não é JSON ({ $reason })

# 2026-10-01-studio-rebuild/ssv/ssv.js:22
js-ssv-result-not-loaded = o resultado registrado não foi carregado

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-acquires = Adquire até

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-carrier = Rastreamento de portadora até

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-code = Rastreamento de código até

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-coherent = Integração coerente

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-delay-mean = Atraso, média

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-detection = Limiar de detecção

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-false-alarm = Probabilidade de falso alarme por célula

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-final-error = Erro final de posição

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-gap = Maior intervalo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-gated = Medições descartadas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-grazing = Tangenciando abaixo de 100 km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-limb-links = Enlaces através do limbo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-loss-mean = Perda, média

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-lost = Perdidos para a atmosfera

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-median = PDOP, mediana

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-p95 = PDOP, percentil 95

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-worst = PDOP, pior

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-plasma-mean = TEC plasmasférico, média

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-search-cells = Células de busca

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-search-time = Tempo de busca

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-srp-est = Pressão de radiação solar, estimada

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-srp-truth = Pressão de radiação solar, verdade

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-stec-mean = TEC oblíquo, média

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-tangent = Altura tangente, mín. a máx.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-tracking = Limiar de rastreamento usado

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-used = Medições usadas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-altitude = altitude/1000

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-series-altitude-name = altitude

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-best-cn0 = melhor C/N0

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-series-error = erro

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-series-measurements = medições

# 2026-10-01-studio-rebuild/lib/ssv.mjs:167
js-ssv-series-note = Uma série decimada da contagem combinada de todas as constelações. O motor não grava nenhuma série por constelação, portanto nenhuma é desenhada.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-signals = sinais à vista

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-signals-label = Sinais à vista em função do tempo, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-series-stated-bound = limite declarado

# 2026-10-01-studio-rebuild/lib/ssv.mjs:167
js-ssv-series-title = Sinais e melhor C/N0 ao longo da órbita, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:155
js-ssv-shell-avail-note = Proporção de pontos de grade e instantes com pelo menos um e pelo menos quatro sinais acima de { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:155
js-ssv-shell-avail-title = Disponibilidade na casca, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-tangent-value = { $min } a { $max } km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-above-absolute = Acima do GNSS: a partir do absoluto, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-above-filter = Acima do GNSS: filtro, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-band-group = Banda e grupo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-bar = Limiar

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-baseline = Linha de base, km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-common-4 = Épocas com 4 sinais em comum

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-common-mean = Média de sinais em comum

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-compares = O que compara

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-deputy = Adjunto

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-epochs = Épocas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-group = Grupo

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-main-lobe = Enlaces do lóbulo principal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-nees = NEES médio de posição

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-phase = Fase

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-pos-p95 = Posição, percentil 95, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-pos-rms = Posição RMS, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:199
js-ssv-th-quantity = Grandeza

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-absolute = RMS relativo, a partir do absoluto, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-filter = RMS relativo, filtro, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-vel = RMS da velocidade relativa, m/s

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-run1-cells = Execução 1: células dentro da tolerância

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-run1-verdict = Veredicto da execução 1

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-sidelobe = Enlaces de lóbulo lateral

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-sidelobe-share = Proporção de lóbulo lateral

# 2026-10-01-studio-rebuild/lib/ssv.mjs:199
js-ssv-th-value = Valor

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-variant = Variante (diagnóstico, ângulos de referência do GLONASS da tabela 4.2)

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-vel-rms = Velocidade RMS, m/s

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-with-4 = Com 4 ou mais sinais

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-without-1 = Maior período sem 1 sinal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-without-4 = Maior período sem 4 sinais

# 2026-10-01-studio-rebuild/lib/ssv.mjs:26
js-ssv-title-formation-heo = Formação, órbita muito elíptica

# 2026-10-01-studio-rebuild/lib/ssv.mjs:23
js-ssv-title-heo = Órbita muito elíptica

# 2026-10-01-studio-rebuild/lib/ssv.mjs:24
js-ssv-title-lunar-weak = Transferência lunar, receptor de sinais fracos

# 2026-10-01-studio-rebuild/lib/ssv.mjs:25
js-ssv-title-nav-lunar = Filtro a bordo, transferência lunar

# 2026-10-01-studio-rebuild/lib/ssv.mjs:22
js-ssv-title-shell = Casca a 36 000 km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:161
js-ssv-traj-avail-note = Proporção das épocas com pelo menos um e pelo menos quatro sinais acima de { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:161
js-ssv-traj-avail-title = Disponibilidade ao longo da trajetória, { $band }

# 2026-10-01-studio-rebuild/ssv/ssv.js:37
js-ssv-transmit-pattern = Diagrama de transmissão: { $pattern }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-unit-signals = sinais

# 2026-10-01-studio-rebuild/lib/ssv.mjs:36
js-ssv-unknown-mode = este resultado gnss-ssv tem o modo "{ $mode }", que esta página não lê

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-variant-met = { $n } de { $total }, seria atendido

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-variant-not-met = { $n } de { $total }, ainda não atendido

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-view-note = Do menor ao maior número à vista ao longo das épocas, com a média marcada.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-view-title = Sinais à vista, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:172
js-ssv-weak-note = O que o projeto do receptor precisa, conforme o motor calcula a partir da integração declarada.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:172
js-ssv-weak-title = O receptor de sinais fracos

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-x-minutes = minutos

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-y-altitude-measurements = altitude, mil km; medições usadas

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-y-cn0-altitude = dB-Hz; altitude em mil km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-y-position-log = posição, metros (log)

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-y-signals-all = sinais à vista, todas as constelações

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:127
js-t35data-ai-q-bench-export = Exportar o movimento e os eventos de um cenário para um simulador de laboratório

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:128
js-t35data-ai-q-compliance-rows = Estas execuções fornecem evidências em apoio de quais linhas do arcabouço público?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:125
js-t35data-ai-q-evidence-pack = Verificar ou criar um pacote de evidências de um evento de confiança

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:124
js-t35data-ai-q-interference-route = Onde o GNSS pareceu degradado e quanto desta rota está nessa condição?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:129
js-t35data-ai-q-iq-recordings = Gravações IQ de GNSS (cena, aquisição, rastreamento, front end, campanhas)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:126
js-t35data-ai-q-osnma-satellites = O fluxo deste receptor autentica os dados de navegação de quais satélites Galileo (OSNMA)?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:121
js-t35data-ai-q-run-scenario = Executar ou explicar um cenário PNT (órbitas, GNSS, temporização, fusão, lunar)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:123
js-t35data-ai-q-training-nmea = Preciso de NMEA sintético com um evento de jamming, drag-off, spoofing de tempo ou reprodução para treinamento

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:122
js-t35data-ai-q-trustworthy-log = Este registro do receptor, ou o NMEA desta embarcação, era confiável e quando deixou de ser?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:126
js-t35data-ai-tool-osnma-satellites = nenhuma no MCP: use osnma_verify (o cartão OSNMA aqui, WebAssembly), kshana osnma verify (CLI) ou kshana.osnma_verify (Python)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:104
js-t35data-card-evidence-create-title = Criar um pacote de evidências

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:105
js-t35data-card-evidence-create-what = Assina uma janela de um registro do receptor e o que o motor calculou a partir dela, para que qualquer pessoa possa verificar que nada foi alterado depois. O Studio verifica pacotes.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:106
js-t35data-card-evidence-create-why = A assinatura exige uma chave privada, que não deve passar por uma página web.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:89
js-t35data-card-iq-title = Monitores e ferramentas de IQ de GNSS

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:90
js-t35data-card-iq-what = Monte uma cena, adquira e rastreie sinais, varra parâmetros, modele um front end, execute monitores e campanhas de IQ, ajuste um registro de laboratório. Também disponível em Python e, dentro de uma pasta de trabalho, nas ferramentas do assistente de IA.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:91
js-t35data-card-iq-why = Uma gravação tem gigabytes de amostras. Uma página não consegue contê-la, e os comandos que convertem, extraem e decimam reescrevem gravações no disco.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:109
js-t35data-card-land-title = Download de polígonos de terra para o detector de AIS em terra

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:110
js-t35data-card-land-what = Busca um arquivo de terra fixo (Natural Earth, domínio público) e verifica seu SHA-256. O construtor de mapas recebe o arquivo de terra como texto.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:111
js-t35data-card-land-why = É o único comando que abre uma conexão de rede e exige o curl do sistema e uma opção explícita.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:94
js-t35data-card-marine-title = Integrações marítimas

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:95
js-t35data-card-marine-what = Um plugin de servidor Signal K e o OpenCPN, por meio de NMEA em modo gate sobre TCP, levam a pontuação de confiança a programas que os navegadores recreativos já usam; uma compilação de referência a leva a um computador pequeno ao lado do receptor.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:96
js-t35data-card-marine-why = São consumidores do processo ao vivo em execução e do seu gate TCP: implantações no computador de bordo.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:84
js-t35data-card-telemetry-title = Confiança como telemetria de segurança

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:85
js-t35data-card-telemetry-what = Transforma o fluxo de confiança (pontuação, faixa, motivos) em métricas Prometheus, eventos syslog em CEF ou LEEF para um SIEM e OpenTelemetry. Ele lê o fluxo e nunca altera a avaliação.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:86
js-t35data-card-telemetry-why = É um processo que serve métricas e envia aos seus sistemas de monitoramento, por isso roda ao lado do receptor, não em uma página.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:99
js-t35data-card-training-stream-title = Fluxos de treinamento para um endereço TCP ou UDP

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:100
js-t35data-card-training-stream-what = Envia um fluxo de treinamento gerado a um simulador de ponte ou a um plotter de cartas em tempo real ou mais rápido. A página de treinamento do Studio gera o mesmo texto e permite baixá-lo.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:101
js-t35data-card-training-stream-why = Enviar a um endereço de rede é algo que uma página de navegador não faz. O fluxo é somente texto e nunca se destina aos sistemas de navegação ao vivo de uma embarcação.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:77
js-t35data-feat-ai-ai = Opções de instalação do servidor MCP, com as perguntas que cada ferramenta responde

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:76
js-t35data-feat-ai-name = Usar a partir de um assistente de IA (servidor MCP)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:56
js-t35data-feat-bench-bench = Exporte o movimento, o NMEA, os pontos de passagem e os eventos de um cenário, aqui

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:55
js-t35data-feat-bench-name = Exportação test-bench para um simulador de laboratório

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:59
js-t35data-feat-compliance-compliance = Veja quais linhas do arcabouço suas execuções fornecem evidências em apoio de, e as tabelas de mapeamento, aqui

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:58
js-t35data-feat-compliance-name = Mapeamento de compliance para arcabouços públicos de resiliência

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:52
js-t35data-feat-evidence-evidence = Verifique um pacote e anexe um token de carimbo de data/hora, aqui

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:51
js-t35data-feat-evidence-name = Pacotes de evidências assinados

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:54
js-t35data-feat-evidence-why = Criar um pacote exige uma chave de assinatura privada, que não deve passar por uma página web. Os pacotes são feitos com a linha de comando, o Python ou as ferramentas do assistente de IA.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:46
js-t35data-feat-interference-map-interference = Abra arquivos de mapa, ou crie um mapa a partir de CSV aqui, e verifique uma rota em relação a ele

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:45
js-t35data-feat-interference-map-name = Mapa de interferência (ADS-B e AIS) e exposição da rota

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:61
js-t35data-feat-iq-name = Monitores e ferramentas de IQ de GNSS (cena, aquisição, rastreamento, varredura, front end, monitor, campanhas)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:63
js-t35data-feat-iq-why = Uma gravação tem gigabytes de amostras, que uma página não consegue conter, e alguns comandos reescrevem gravações no disco. A compilação para navegador não tem funções de IQ.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:71
js-t35data-feat-jammertest-jammertest = Importe o plano para o intervalo de tempo de um registro, ou pontue um registro de receptor (UBX, RINEX, Android, NMEA ou Septentrio SBF) por teste: latência de detecção, perdas, falsos alarmes, tempo de recuperação; MODELLED

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:70
js-t35data-feat-jammertest-name = Jammertest como árbitro: o plano de teste publicado como verdade programada, com um registro de receptor pontuado em relação a ele (0.38)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:36
js-t35data-feat-live-gate-name = Fluxo de confiança ao vivo, gate e listener (stdin, arquivo, TCP, UDP, --gate, --listen)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:38
js-t35data-feat-live-gate-why = É um processo em execução no caminho dos dados. Uma página retorna quando termina e não consegue manter um socket aberto para um plotter de cartas, nem marcar uma solução de posição como inválida em um fluxo ao vivo. O Studio pontua, em vez disso, um trecho limitado, no mesmo formato ao vivo, sem gate.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:74
js-t35data-feat-machines-imufit = Ajuste os parâmetros do acelerômetro e do giroscópio dos cenários híbrido e de fusão a partir de um registro de IMU estacionária; MODELLED

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:73
js-t35data-feat-machines-name = Entradas de receptor e de sensor: RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, uma IMU para a proa e um ajuste de IMU para os cenários híbrido e de fusão (0.38)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:74
js-t35data-feat-machines-trust = Abra um registro em qualquer um destes formatos (e um arquivo de IMU opcional) na execução genérica de receiver-trust; o próprio sinalizador de jammer da NovAtel é comparado com os alarmes do Kshana

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:64
js-t35data-feat-marine-name = Integrações marítimas: plugin Signal K e OpenCPN

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:66
js-t35data-feat-marine-why = Elas consomem o processo ao vivo em execução e o seu gate TCP, portanto são implantações em um computador de bordo, não algo que uma página possa executar.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:33
js-t35data-feat-maritime-trust-name = Pontuação de confiança marítima para uma embarcação em movimento (0 a 100, com motivos)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:34
js-t35data-feat-maritime-trust-trust = Abra um resultado ou uma execução JSON-lines ao vivo e veja a trajetória, a pontuação, os motivos e o gate; pontue um registro NMEA aqui

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:39
js-t35data-feat-nmea-training-name = Fluxos NMEA de treinamento com um registro de instrutor

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:40
js-t35data-feat-nmea-training-training = Gere um fluxo e o seu registro de instrutor aqui, baixe-os e execute o relatório do treinador

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:67
js-t35data-feat-osnma-name = Verificação Galileo OSNMA (entrada UBX SFRBX)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:68
js-t35data-feat-osnma-osnma = Carregue um arquivo gravado e veja o estado de autenticação por satélite e por tag

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:48
js-t35data-feat-telemetry-name = Exportação de telemetria: métricas Prometheus, syslog CEF e LEEF, OpenTelemetry

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:50
js-t35data-feat-telemetry-why = Ele serve métricas, envia syslog e exporta OpenTelemetry a partir de um fluxo em execução: um processo que conversa com os seus sistemas de monitoramento, o que uma página não consegue ser.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:42
js-t35data-feat-training-stream-name = Transmissão de um fluxo de treinamento para um endereço TCP ou UDP

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:44
js-t35data-feat-training-stream-why = Ele envia a um endereço de rede, o que uma página web não faz. O Studio gera o texto e você o baixa.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:28
js-t35data-page-ai = Usar a partir do seu assistente de IA

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:22
js-t35data-page-bench = Exportação test-bench

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:27
js-t35data-page-cli = Recursos de linha de comando

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:23
js-t35data-page-compliance = Mapeamento de compliance

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:21
js-t35data-page-evidence = Pacotes de evidências

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:17
js-t35data-page-geometry = Geometria: skyplot, horizonte e DOP

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:26
js-t35data-page-imufit = Ajuste de IMU

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:20
js-t35data-page-interference = Mapa de interferência

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:25
js-t35data-page-jammertest = Pontuação Jammertest

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:24
js-t35data-page-osnma = Verificação OSNMA

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:19
js-t35data-page-training = Relatório de treinamento

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:18
js-t35data-page-trust = Confiança marítima

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:93
js-t35data-sample-iq-help = A lista de comandos de IQ

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:88
js-t35data-sample-telemetry-cef = Syslog em CEF para a execução de demonstração

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:88
js-t35data-sample-telemetry-leef = Syslog em LEEF para a execução de demonstração

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:88
js-t35data-sample-telemetry-metrics = Métricas Prometheus para a execução de demonstração

# 2026-10-01-studio-rebuild/tools/tools.js:359
js-tools-ai-group-engine = Instalar o motor e suas bibliotecas

# 2026-10-01-studio-rebuild/tools/tools.js:359
js-tools-ai-group-integrations = Integrações marítimas, de plugins e de painéis

# 2026-10-01-studio-rebuild/tools/tools.js:359
js-tools-ai-group-mcp = Instalar o servidor MCP para o seu assistente

# 2026-10-01-studio-rebuild/tools/tools.js:354
js-tools-ai-heading = Use o Kshana a partir do seu assistente de IA

# 2026-10-01-studio-rebuild/tools/tools.js:362
js-tools-ai-install-mcp = Instalar o servidor MCP

# 2026-10-01-studio-rebuild/tools/tools.js:354
js-tools-ai-intro = O servidor MCP do Kshana permite que um assistente de IA execute o motor em vez de adivinhar números. Ele roda no seu computador; nada é enviado ao Kshana. Escolha a forma que combina com a sua ferramenta.

# 2026-10-01-studio-rebuild/tools/tools.js:392
js-tools-ai-load-failed = As opções de instalação não foram carregadas ({ $reason }). Consulte a documentação do servidor MCP.

# 2026-10-01-studio-rebuild/tools/tools.js:397
js-tools-ai-mcp-docs = Documentação do servidor MCP

# 2026-10-01-studio-rebuild/tools/tools.js:361
js-tools-ai-more-ways = Mais formas de instalar

# 2026-10-01-studio-rebuild/tools/tools.js:391
js-tools-ai-none-listed = Nenhuma opção de instalação está listada nesta compilação.

# 2026-10-01-studio-rebuild/tools/tools.js:362
js-tools-ai-other-ways = Outras formas de instalar o Kshana

# 2026-10-01-studio-rebuild/tools/tools.js:397
js-tools-ai-read-agent-guide = Ler o guia do agente

# 2026-10-01-studio-rebuild/tools/tools.js:397
js-tools-ai-rule = A regra para toda resposta: o assistente executa o motor e informa o que uma ferramenta retornou, com a sua unidade e o seu nível de evidência (validado em relação a uma referência independente externa, ou modelado), o cenário, a semente e a versão do motor, de modo que a execução possa ser repetida. As ressalvas de um resultado permanecem com ele. O servidor MCP não lê nem grava arquivos fora de uma única pasta opt-in.

# 2026-10-01-studio-rebuild/tools/tools.js:393
js-tools-ai-what-to-ask = O que perguntar e qual ferramenta responde

# 2026-10-01-studio-rebuild/tools/tools.js:397
js-tools-ai-where-reachable = Onde cada capacidade está acessível

# 2026-10-01-studio-rebuild/tools/tools.js:216
js-tools-bench-files-written =
    { $n ->
        [one] { $n } arquivo gravado na memória do seu navegador
        [many] { $n } de arquivos gravados na memória do seu navegador
       *[other] { $n } arquivos gravados na memória do seu navegador
    }

# 2026-10-01-studio-rebuild/tools/tools.js:216
js-tools-bench-note = Apenas movimento e intervalos de eventos rotulados. Baixe-os para carregar em um simulador de laboratório.

# 2026-10-01-studio-rebuild/tools/tools.js:233
js-tools-bench-wrong-kind = { $name } é um cenário do tipo { $kind }. Existe uma trajetória de veículo para os tipos { $kinds }; os outros tipos dizem por que não têm uma.

# 2026-10-01-studio-rebuild/tools/tools.js:246
js-tools-building-report = Gerando o relatório…

# 2026-10-01-studio-rebuild/tools/tools.js:440
js-tools-choose-catalogue-first = Escolha primeiro o JSON do catálogo.

# 2026-10-01-studio-rebuild/tools/tools.js:319
js-tools-choose-file-first = Escolha primeiro um arquivo.

# 2026-10-01-studio-rebuild/tools/tools.js:484
js-tools-choose-imu-log = Escolha primeiro um registro de IMU estacionária.

# 2026-10-01-studio-rebuild/tools/tools.js:140
js-tools-choose-pack-first = Escolha primeiro os arquivos do pacote.

# 2026-10-01-studio-rebuild/tools/tools.js:175
js-tools-choose-pack-first-above = Escolha primeiro os arquivos do pacote (acima).

# 2026-10-01-studio-rebuild/tools/tools.js:441
js-tools-choose-plan-file = Escolha pelo menos um arquivo de plano.

# 2026-10-01-studio-rebuild/tools/tools.js:468
js-tools-choose-receiver-log = Escolha primeiro o registro do receptor.

# 2026-10-01-studio-rebuild/tools/tools.js:243
js-tools-choose-result-first = Escolha primeiro pelo menos um arquivo de resultado (*.result.json).

# 2026-10-01-studio-rebuild/tools/tools.js:232
js-tools-choose-scenario-first = Escolha primeiro um cenário.

# 2026-10-01-studio-rebuild/tools/tools.js:177
js-tools-choose-tsr-first = Escolha primeiro a resposta de carimbo de data/hora (.tsr).

# 2026-10-01-studio-rebuild/tools/tools.js:190
js-tools-chosen = Escolhido

# 2026-10-01-studio-rebuild/tools/tools.js:160
js-tools-col-check = Verificação

# 2026-10-01-studio-rebuild/tools/tools.js:160
js-tools-col-detail = Detalhe

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-first-monitors = Primeiros monitores

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-gap-that-stays = Lacuna que permanece

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-col-last-auth-tag = Última tag autenticada (Galileo System Time)

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-latency = Latência, s

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-name = Nome

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-outcome = Desfecho

# 2026-10-01-studio-rebuild/tools/tools.js:394
js-tools-col-question = Pergunta

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-recovered = Recuperado

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-reference = Referência

# 2026-10-01-studio-rebuild/tools/tools.js:160
js-tools-col-result = Resultado

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-row = Linha

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-col-satellite = Satélite

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-slot = Intervalo, s

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-col-status = Status

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-col-tags = Tags

# 2026-10-01-studio-rebuild/tools/tools.js:447
js-tools-col-test = Teste

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-these-runs = Estas execuções

# 2026-10-01-studio-rebuild/tools/tools.js:394
js-tools-col-tool = Ferramenta

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-what-is-missing = O que falta

# 2026-10-01-studio-rebuild/tools/tools.js:261
js-tools-col-what-it-asks = O que ele exige

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-col-why-not-auth = Por que não autenticado

# 2026-10-01-studio-rebuild/tools/tools.js:103
js-tools-copied = Copiado

# 2026-10-01-studio-rebuild/tools/tools.js:102
js-tools-copy = Copiar

# 2026-10-01-studio-rebuild/tools/tools.js:102
js-tools-copy-command-aria = Copiar: { $cmd }

# 2026-10-01-studio-rebuild/tools/tools.js:366
js-tools-copy-labelled-aria = Copiar { $label }: { $text }

# 2026-10-01-studio-rebuild/tools/tools.js:49
js-tools-did-not-work = Isso não funcionou

# 2026-10-01-studio-rebuild/tools/tools.js:384
js-tools-documentation = Documentação

# 2026-10-01-studio-rebuild/tools/tools.js:220
js-tools-download = Baixar

# 2026-10-01-studio-rebuild/tools/tools.js:225
js-tools-download-all-zip = Baixar tudo (zip)

# 2026-10-01-studio-rebuild/tools/tools.js:460
js-tools-download-events-toml = Baixar os eventos (TOML)

# 2026-10-01-studio-rebuild/tools/tools.js:277
js-tools-download-md = Baixar (Markdown)

# 2026-10-01-studio-rebuild/tools/tools.js:267
js-tools-download-report-json = Baixar o relatório (JSON)

# 2026-10-01-studio-rebuild/tools/tools.js:266
js-tools-download-report-md = Baixar o relatório (Markdown)

# 2026-10-01-studio-rebuild/tools/tools.js:474
js-tools-download-scorecard-json = Baixar o quadro de pontuação (JSON)

# 2026-10-01-studio-rebuild/tools/tools.js:492
js-tools-download-table-toml = Baixar a tabela (TOML)

# 2026-10-01-studio-rebuild/tools/tools.js:183
js-tools-download-updated-pack = Baixar o pacote atualizado (zip)

# 2026-10-01-studio-rebuild/tools/tools.js:493
js-tools-download-whole-report-json = Baixar o relatório completo (JSON)

# 2026-10-01-studio-rebuild/tools/tools.js:45
js-tools-engine-lacks-error = Esta compilação do motor (versão { $version }) não tem { $need }, portanto ainda não pode executar isto aqui. Os resultados registrados e a linha de comando continuam funcionando.

# 2026-10-01-studio-rebuild/tools/tools.js:43
js-tools-engine-lacks-status = Esta compilação do motor (versão { $version }) não tem { $need }: ela é anterior à versão de que esta ferramenta precisa. O equivalente em linha de comando está na aba Linha de comando.

# 2026-10-01-studio-rebuild/tools/tools.js:41
js-tools-engine-running = O motor (versão { $version }) está em execução neste navegador. Nada é enviado.

# 2026-10-01-studio-rebuild/tools/tools.js:39
js-tools-engine-starting = Iniciando o motor neste navegador…

# 2026-10-01-studio-rebuild/tools/tools.js:40
js-tools-engine-unavailable = O motor não pôde iniciar aqui ({ $reason }). Abrir arquivos funciona; executar as ferramentas exige WebAssembly.

# 2026-10-01-studio-rebuild/lib/tools35.mjs:91
js-tools-epoch-format = Use YYYY-MM-DDTHH:MM:SS, com um Z opcional (UTC).

# 2026-10-01-studio-rebuild/lib/tools35.mjs:94
js-tools-epoch-not-real = Isso não é um instante UTC real entre os anos 2000 e 2099.

# 2026-10-01-studio-rebuild/tools/tools.js:166
js-tools-every-check = Todas as verificações

# 2026-10-01-studio-rebuild/tools/tools.js:169
js-tools-evidence-disclaimer = Um pacote de evidências é um registro técnico do que o motor calculou a partir de um registro declarado sob configurações declaradas. Não é um parecer jurídico, uma constatação de fato sobre qualquer evento nem uma certificação. Uma verificação bem-sucedida indica que o registro não foi alterado.

# 2026-10-01-studio-rebuild/tools/tools.js:132
js-tools-example-pack = Pacote de exemplo sintético

# 2026-10-01-studio-rebuild/tools/tools.js:134
js-tools-example-pack-note = Um pacote sintético feito pela linha de comando do motor a partir do registro de demonstração da balsa, com uma chave de demonstração. A chave é preenchida abaixo; a chave de um signatário real vem do signatário por outra via.

# 2026-10-01-studio-rebuild/tools/tools.js:132
js-tools-example-pack-tampered = Pacote de exemplo com um byte de epochs.json alterado

# 2026-10-01-studio-rebuild/tools/tools.js:284
js-tools-example-runs = Execuções de exemplo sintéticas

# 2026-10-01-studio-rebuild/tools/tools.js:134
js-tools-example-tampered-note = Um byte de um arquivo do pacote foi alterado depois da assinatura. Verifique-o: a verificação nomeia o arquivo.

# 2026-10-01-studio-rebuild/tools/tools.js:213
js-tools-exporting = Exportando…

# 2026-10-01-studio-rebuild/tools/tools.js:322
js-tools-field-whole-number = { $field } deve ser um número inteiro

# 2026-10-01-studio-rebuild/lib/tools35.mjs:63
js-tools-file-not-chosen = { $file } não está entre os arquivos escolhidos

# 2026-10-01-studio-rebuild/tools/tools.js:53
js-tools-file-too-large = { $name } é maior que 64 MiB

# 2026-10-01-studio-rebuild/tools/tools.js:282
js-tools-files-selected = { $label }: { $files }

# 2026-10-01-studio-rebuild/tools/tools.js:157
js-tools-fingerprint-not-pinned = Impressão digital do signatário: { $fingerprint } (não fixada: a chave que o próprio pacote nomeia)

# 2026-10-01-studio-rebuild/tools/tools.js:157
js-tools-fingerprint-pinned = Impressão digital do signatário: { $fingerprint } (fixada)

# 2026-10-01-studio-rebuild/tools/tools.js:488
js-tools-fitting = Ajustando…

# 2026-10-01-studio-rebuild/tools/tools.js:260
js-tools-framework-summary = { $name }: { $evidenced } evidenciados, { $partly } em parte, { $notEvidenced } não evidenciados, { $outOfScope } fora do escopo

# 2026-10-01-studio-rebuild/lib/tools35.mjs:131
js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework, v2.0

# 2026-10-01-studio-rebuild/lib/tools35.mjs:133
js-tools-fw-easa-aviation = Orientações da EASA sobre interferência em GNSS para a aviação

# 2026-10-01-studio-rebuild/lib/tools35.mjs:135
js-tools-fw-en-16803 = EN 16803 (somente por número de parte e de cláusula)

# 2026-10-01-studio-rebuild/lib/tools35.mjs:132
js-tools-fw-imo-ships = Orientações da IMO sobre interferência em GNSS para navios

# 2026-10-01-studio-rebuild/lib/tools35.mjs:134
js-tools-fw-nis2-art21 = Diretiva NIS2 da UE, Artigo 21

# 2026-10-01-studio-rebuild/lib/tools35.mjs:183
js-tools-gst-none = nenhum

# 2026-10-01-studio-rebuild/lib/tools35.mjs:183
js-tools-gst-text = semana { $week }, { $tow } s

# 2026-10-01-studio-rebuild/tools/tools.js:90
js-tools-how-to-run = Como executar

# 2026-10-01-studio-rebuild/tools/tools.js:502
js-tools-imu-file-too-large = { $name } é maior que 32 MiB; abra um trecho.

# 2026-10-01-studio-rebuild/tools/tools.js:486
js-tools-imu-mean-not-number = A força específica em repouso não é um número (0 para um eixo horizontal, cerca de 9.80665 para o vertical).

# 2026-10-01-studio-rebuild/tools/tools.js:494
js-tools-imu-notice = { $evidence }: o estimador é verificado em registros sintéticos de ruído branco com coeficientes conhecidos, e não em relação a uma referência independente externa. A tabela nomeia o SHA-256 do registro ({ $sha }…).

# 2026-10-01-studio-rebuild/tools/tools.js:505
js-tools-imu-selected = { $name } ({ $size }), lido aqui, nunca enviado.

# 2026-10-01-studio-rebuild/tools/tools.js:461
js-tools-jt-events-count = { $n } evento(s) programado(s)

# 2026-10-01-studio-rebuild/tools/tools.js:461
js-tools-jt-events-note = como verdade programada: intervalos planejados, não horários de transmissão registrados. Fora de RF: { $nonRf }; fora do registro: { $outside }; ids desconhecidos: { $unknown }.

# 2026-10-01-studio-rebuild/tools/tools.js:449
js-tools-jt-guard-hold = Guarda de { $guard } s, retenção de recuperação de { $hold } s.

# 2026-10-01-studio-rebuild/tools/tools.js:449
js-tools-jt-guard-hold-overlap = Guarda de { $guard } s, retenção de recuperação de { $hold } s. A linha de base de calibração se sobrepôs a um intervalo programado.

# 2026-10-01-studio-rebuild/tools/tools.js:456
js-tools-jt-import-needs-start = A importação precisa da primeira época do registro em UTC (ISO 8601), porque o plano está em horário local.

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-catalogue = catálogo { $name }

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-log = registro { $name } ({ $size })

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-no-catalogue = nenhum catálogo

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-no-log = nenhum registro

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-no-plan = nenhum plano

# 2026-10-01-studio-rebuild/tools/tools.js:433
js-tools-jt-sel-plans = { $n } arquivo(s) de plano

# 2026-10-01-studio-rebuild/tools/tools.js:448
js-tools-jt-slot-range = { $from } a { $to }

# 2026-10-01-studio-rebuild/tools/tools.js:443
js-tools-jt-what-area = A área de teste

# 2026-10-01-studio-rebuild/tools/tools.js:443
js-tools-jt-what-guard = A guarda

# 2026-10-01-studio-rebuild/tools/tools.js:443
js-tools-jt-what-hold = A retenção de recuperação

# 2026-10-01-studio-rebuild/tools/tools.js:443
js-tools-jt-what-offset = O deslocamento em relação ao UTC

# 2026-10-01-studio-rebuild/tools/tools.js:443
js-tools-jt-what-year = O ano do plano

# 2026-10-01-studio-rebuild/tools/tools.js:377
js-tools-label-command = comando

# 2026-10-01-studio-rebuild/tools/tools.js:378
js-tools-label-pinned-command = comando fixado

# 2026-10-01-studio-rebuild/tools/tools.js:380
js-tools-label-settings-example = exemplo de configurações { $n }

# 2026-10-01-studio-rebuild/tools/tools.js:108
js-tools-loading = Carregando…

# 2026-10-01-studio-rebuild/tools/tools.js:244
js-tools-max-runs = No máximo { $max } execuções.

# 2026-10-01-studio-rebuild/tools/tools.js:324
js-tools-merkle-root-format = A raiz de Merkle tem 64 dígitos hexadecimais.

# 2026-10-01-studio-rebuild/tools/tools.js:438
js-tools-must-be-number = { $what } deve ser um número

# 2026-10-01-studio-rebuild/tools/tools.js:439
js-tools-must-be-whole-zero = { $what } deve ser um número inteiro, 0 para "não informado"

# 2026-10-01-studio-rebuild/tools/tools.js:448
js-tools-na = n/d

# 2026-10-01-studio-rebuild/tools/tools.js:376
js-tools-needs = Requer: { $requires }

# 2026-10-01-studio-rebuild/tools/tools.js:448
js-tools-no = não

# 2026-10-01-studio-rebuild/tools/tools.js:448
js-tools-none = nenhum

# 2026-10-01-studio-rebuild/tools/tools.js:338
js-tools-none-in-build = nenhum nesta compilação

# 2026-10-01-studio-rebuild/tools/tools.js:90
js-tools-not-in-browser = Não em um navegador.

# 2026-10-01-studio-rebuild/tools/tools.js:294
js-tools-not-osnma = Não é um resultado OSNMA

# 2026-10-01-studio-rebuild/tools/tools.js:258
js-tools-not-used = Não usado: { $item }

# 2026-10-01-studio-rebuild/tools/tools.js:168
js-tools-notes = Observações

# 2026-10-01-studio-rebuild/tools/tools.js:382
js-tools-open = Abrir

# 2026-10-01-studio-rebuild/tools/tools.js:299
js-tools-osnma-advisory = Consultivo: esta é uma saída de análise e monitoramento, e não um equipamento de navegação homologado. O estado de autenticação informado aqui não é um serviço de integridade de navegação e não deve ser a única base de nenhuma decisão de navegação ou de segurança.

# 2026-10-01-studio-rebuild/lib/tools35.mjs:176
js-tools-osnma-authenticated = Autenticado

# 2026-10-01-studio-rebuild/tools/tools.js:306
js-tools-osnma-caption = Estado de autenticação por satélite

# 2026-10-01-studio-rebuild/tools/tools.js:340
js-tools-osnma-demo-note = A chave pública descartável está preenchida; pressione Verificar para executar o verificador aqui ou exiba o resultado registrado.

# 2026-10-01-studio-rebuild/lib/tools35.mjs:180
js-tools-osnma-discarded = Descartado

# 2026-10-01-studio-rebuild/tools/tools.js:310
js-tools-osnma-events = O que o verificador viu

# 2026-10-01-studio-rebuild/tools/tools.js:336
js-tools-osnma-examples-missing = os exemplos sintéticos ainda não estão nesta compilação

# 2026-10-01-studio-rebuild/lib/tools35.mjs:177
js-tools-osnma-failed = Falhou

# 2026-10-01-studio-rebuild/tools/tools.js:303
js-tools-osnma-nma-alert = Status NMA { $status }; o sistema emitiu uma mensagem de alerta.

# 2026-10-01-studio-rebuild/tools/tools.js:303
js-tools-osnma-nma-status = Status NMA { $status }.

# 2026-10-01-studio-rebuild/lib/tools35.mjs:186
js-tools-osnma-not-json = Este não é o JSON de kshana osnma verify --json (ele precisa de overall e satellites).

# 2026-10-01-studio-rebuild/tools/tools.js:300
js-tools-osnma-overall = Geral: { $status }

# 2026-10-01-studio-rebuild/tools/tools.js:302
js-tools-osnma-pages-read =
    { $n ->
        [one] { $n } página lida.
        [many] { $n } de páginas lidas.
       *[other] { $n } páginas lidas.
    }

# 2026-10-01-studio-rebuild/lib/tools35.mjs:179
js-tools-osnma-pending = Pendente

# 2026-10-01-studio-rebuild/tools/tools.js:344
js-tools-osnma-recorded-failed = o resultado registrado não foi carregado

# 2026-10-01-studio-rebuild/tools/tools.js:344
js-tools-osnma-recorded-result = Resultado registrado de kshana osnma verify --json para { $file }.

js-tools-osnma-tag-counts = { $authenticated } autenticadas, { $failed } com falha, { $pending } pendentes, { $discarded } descartadas

js-tools-osnma-tag-totals =
    { $n ->
        [one] { $n } tag: { $authenticated } autenticadas, { $failed } com falha, { $pending } pendentes, { $discarded } descartadas.
        [many] { $n } de tags: { $authenticated } autenticadas, { $failed } com falha, { $pending } pendentes, { $discarded } descartadas.
       *[other] { $n } tags: { $authenticated } autenticadas, { $failed } com falha, { $pending } pendentes, { $discarded } descartadas.
    }

js-tools-osnma-time-caveat = Tempo: toda verificação é relativa aos carimbos de tempo das páginas entregues ao verificador, que aqui vêm dos próprios dados e não oferecem nenhuma proteção contra a repetição de dados antigos. A autenticação diz que os dados vieram do sistema; ela não diz nada sobre o sinal em que chegaram nem sobre a qualidade da posição.

js-tools-osnma-unavailable = Indisponível

js-tools-osnma-word-authenticated = Pelo menos um satélite está autenticado e nenhum falhou

js-tools-osnma-word-failed = Uma verificação dos dados de algum satélite falhou

js-tools-osnma-word-unavailable = Nenhum satélite está autenticado

js-tools-pack-selected = { $label }: { $files } ({ $size })

js-tools-pinned-to-release = Fixado nesta versão:

js-tools-preview = Pré-visualizar

js-tools-public-key-format = Uma chave pública tem 64 dígitos hexadecimais (32 bytes). Nada além disso é aceito.

js-tools-read-documentation = Ler a documentação

js-tools-reading-plan = Lendo o plano…

js-tools-refused-file-name = nome de arquivo recusado: { $name }

js-tools-run = Executar

js-tools-runs-read =
    { $n ->
        [one] { $n } execução lida: { $runs }
        [many] { $n } de execuções lidas: { $runs }
       *[other] { $n } execuções lidas: { $runs }
    }

js-tools-runs-read-engine =
    { $n ->
        [one] { $n } execução lida, pelo motor { $engine }: { $runs }
        [many] { $n } de execuções lidas, pelo motor { $engine }: { $runs }
       *[other] { $n } execuções lidas, pelo motor { $engine }: { $runs }
    }

js-tools-sample-load-failed = O exemplo não foi carregado ({ $reason }).

js-tools-sample-note = Uma saída real do comando, registrada pelo motor na execução de demonstração sintética. Não é a medição de nada.

js-tools-sample-output = Saída de exemplo: { $label }

js-tools-scenario-list-failed = A lista de cenários não foi carregada

js-tools-scoring = Pontuando…

js-tools-select-and-copy = Selecionar e copiar

js-tools-settings-example = Exemplo de configurações { $n }:

js-tools-status-evidenced-label = As execuções fornecem evidências em apoio desta linha

js-tools-status-evidenced-short = Com evidências

js-tools-status-not-evidenced-label = Estas execuções não mostram nada para esta linha

js-tools-status-not-evidenced-short = Sem evidências

js-tools-status-out-of-scope-label = Fora do que o Kshana pode mostrar

js-tools-status-out-of-scope-short = Fora do escopo

js-tools-status-partly-label = As execuções fornecem evidências em apoio de parte desta linha

js-tools-status-partly-short = Em parte

js-tools-tab-ai = Assistente de IA

js-tools-tab-bench = Test bench

js-tools-tab-cli = Linha de comando

js-tools-tab-compliance = Compliance

js-tools-tab-evidence = Pacotes de evidências

js-tools-tab-imufit = Ajuste de IMU

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = Um evento syslog por época (padrão: um por mudança de banda)

js-tools-tele-file-aria = Arquivo de resultado ou de linhas JSON

js-tools-tele-fmt-cef = Syslog, CEF

js-tools-tele-fmt-leef = Syslog, LEEF

js-tools-tele-fmt-mqtt = MQTT, descoberta do Home Assistant (tópico, tabulação, carga)

js-tools-tele-fmt-otlp = OpenTelemetry (OTLP JSON)

js-tools-tele-fmt-prometheus = Métricas do Prometheus

js-tools-tele-format-aria = Formato

js-tools-tele-host = Host

js-tools-tele-host-aria = Nome do host gravado nos eventos syslog

js-tools-tele-include-position = Incluir a posição informada (desativado por padrão)

js-tools-tele-intro = Converta um arquivo de resultado (session.result.json) ou as linhas JSON ao vivo em um dos formatos, neste navegador. Exige uma versão do motor com a exportação de telemetria (0.35 e posteriores, com a exportação); os comandos acima funcionam em qualquer lugar.

js-tools-tele-note = As linhas syslog aqui não trazem carimbo de tempo (a página não lê nenhum relógio); a ferramenta de linha de comando os insere. O Prometheus dá o estado final. O MQTT dá uma linha por mensagem, o tópico, depois uma tabulação e a carga; nada é publicado daqui. O texto é o mesmo que o comando imprime.

js-tools-tele-run-here = Executar aqui

js-tools-that-file-too-large = Esse arquivo é maior que 64 MiB.

js-tools-token-attached = Token anexado

js-tools-token-attached-note = O pacote atualizado está abaixo. A assinatura da autoridade de carimbo de tempo NÃO foi verificada aqui: execute openssl ts -verify.

js-tools-trust-monitor-sentence = Frase do monitor de confiança: { $sentence }

js-tools-two-files-same-name = dois arquivos se chamam { $name }

js-tools-ubx-bad-crc =
    { $n ->
        [one] { $n } página falhou no CRC.
        [many] { $n } de páginas falharam no CRC.
       *[other] { $n } páginas falharam no CRC.
    }

js-tools-ubx-file = O arquivo UBX

js-tools-ubx-frames-pages = { $frames } quadros UBX; { $pages } páginas I/NAV decodificadas.

js-tools-ubx-skipped-bytes =
    { $n ->
        [one] { $n } byte foi ignorado entre os quadros.
        [many] { $n } de bytes foram ignorados entre os quadros.
       *[other] { $n } bytes foram ignorados entre os quadros.
    }

js-tools-ubx-time-conflicts =
    { $n ->
        [one] { $n } página teve um tempo em conflito com o de suas vizinhas.
        [many] { $n } de páginas tiveram um tempo em conflito com o de suas vizinhas.
       *[other] { $n } páginas tiveram um tempo em conflito com o de suas vizinhas.
    }

js-tools-ubx-unstamped =
    { $n ->
        [one] { $n } página não pôde ser situada no tempo.
        [many] { $n } de páginas não puderam ser situadas no tempo.
       *[other] { $n } páginas não puderam ser situadas no tempo.
    }

js-tools-unknown = desconhecido

js-tools-unused-scenarios = Arquivos de cenário sem resultado correspondente não foram usados: { $files }.

js-tools-verdict-failed-text = A verificação falhou.

js-tools-verdict-failed-title = Falhou

js-tools-verdict-intact-text = O pacote está íntegro em relação à chave que ele mesmo indica, a qual qualquer pessoa pode gerar. Obtenha a chave pública do signatário por outra via e fixe-a.

js-tools-verdict-intact-title = Íntegro, mas o signatário não está fixado

js-tools-verdict-verified-text = O pacote não foi alterado e está assinado pela chave que você fixou.

js-tools-verdict-verified-title = Verificado

js-tools-verifying = Verificando…

js-tools-what-failed = O que falhou

js-tools-why-not-browser = Por que não em um navegador:

js-tools-yes = sim

js-training-active-events = Eventos ativos

js-training-band-large = acima de 100 m

js-training-band-medium = de 25 a 100 m

js-training-band-small = abaixo de 25 m

js-training-chart-max = máx. { $v }

js-training-chart-mean-cn0 = C/N0 médio

js-training-chart-position-error = erro de posição

js-training-chart-s-reported-minus-true = s, informado menos verdadeiro

js-training-chart-satellites = satélites

js-training-chart-time-offset = deslocamento de tempo

js-training-chart-used-tracked = usados / rastreados

js-training-col-reported = Informado pelo receptor

js-training-col-true = Verdadeiro

js-training-cue-course = O rumo do giro e a velocidade da barquilha não são tocados por nenhum evento. Aqui o curso informado difere do rumo do giro em { $course }. Uma corrente também separa o rumo do curso, então compare com o início da execução.

js-training-cue-course-speed = O rumo do giro e a velocidade da barquilha não são tocados por nenhum evento. Aqui o curso informado difere do rumo do giro em { $course } e a velocidade informada difere da velocidade verdadeira em { $speed } kn. Uma corrente também separa o rumo do curso, então compare com o início da execução.

js-training-cue-title = Pista para o debriefing.

js-training-cue-unknown-amount = um valor desconhecido

js-training-debrief-now = Fazer o debriefing agora

js-training-default-warning = Dados de treinamento sintéticos. Somente para treinamento e testes: nunca envie este fluxo aos sistemas de navegação em operação de uma embarcação.

js-training-demo-coastal-drag-off = Arrasto de posição costeiro

js-training-demo-combined-event = Evento combinado

js-training-demo-fjord-degradation = Degradação natural em fiorde

js-training-demo-open-sea-jamming = Jamming em mar aberto

js-training-demo-port-time-spoof = Spoofing de tempo na aproximação do porto

js-training-dl-log-json = Baixar o registro do instrutor (JSON)

js-training-dl-log-text = Baixar o registro do instrutor (texto)

js-training-dl-nmea = Baixar o fluxo NMEA

js-training-err-demo-open = Não foi possível abrir { $title }: { $reason }.

js-training-err-engine-old = Esta versão do motor (versão { $version }) não tem gerador de treinamento NMEA; ela é anterior a esta página. O comando é { $command }.

js-training-err-engine-start = O motor não pôde ser iniciado aqui ({ $reason }). Os cenários da biblioteca acima ainda abrem sem ele.

js-training-err-file-not-loaded = o arquivo não foi carregado

js-training-err-generate = Não foi possível gerar: { $reason }.

js-training-err-newer-schema = { $name }: o esquema { $schema } é mais novo ou diferente de { $supported }, que esta página lê. Atualize o Studio em vez de adivinhar seus campos.

js-training-err-no-schema = { $name }: não é um registro de instrutor de treinamento do Kshana (sem etiqueta de esquema).

js-training-err-no-track = { $name }: o registro não tem linhas de trajetória para desenhar.

js-training-err-no-usable-rows = { $name }: nenhuma linha de trajetória utilizável.

js-training-err-not-json = { $name }: não é JSON ({ $reason }).

js-training-err-read = { $name }: não pôde ser lido ({ $reason }).

js-training-err-read-or-draw = { $name }: não pôde ser lido nem desenhado ({ $reason }).

js-training-err-scenario-not-loaded = o arquivo de cenário não foi carregado

js-training-err-seed = A semente deve ser um número inteiro, ou ficar vazia para usar a do próprio cenário.

js-training-err-too-large = { $name }: maior que { $max }. Esta página lê registros de até esse tamanho.

js-training-err-too-many-rows =
    { $count ->
        [one] { $name }: o registro tem { $count } linha de trajetória; esta página desenha no máximo { $max }. Registre com menos frequência (log_interval_s) ou abra um trecho.
        [many] { $name }: o registro tem { $count } de linhas de trajetória; esta página desenha no máximo { $max }. Registre com menos frequência (log_interval_s) ou abra um trecho.
       *[other] { $name }: o registro tem { $count } linhas de trajetória; esta página desenha no máximo { $max }. Registre com menos frequência (log_interval_s) ou abra um trecho.
    }

js-training-err-unknown-schema = { $name }: esquema { $schema } desconhecido; esta página lê { $supported }.

js-training-event-n = Evento { $id }

js-training-event-onset = Início { $utc }

js-training-extra-bearing = Rumo aplicado, graus verdadeiros

js-training-extra-peak-accel = Aceleração de pico que o arrasto acrescenta, m/s²

js-training-extra-peak-speed = Velocidade de pico que o arrasto acrescenta, m/s

js-training-fact-duration = Duração

js-training-fact-events = Eventos injetados

js-training-fact-max-error = Maior erro de posição

js-training-fact-max-time-offset = Maior deslocamento de tempo

js-training-fact-no-fix = Tempo sem posição

js-training-fact-peak-accel = Aceleração de pico, verdadeira / informada

js-training-fact-peak-speed = Velocidade de pico, verdadeira / informada

js-training-fact-seed = Semente

js-training-fact-start = Início (UTC)

js-training-fix-reported-span = posição informada, de { $from } a { $to }

js-training-generated = "{ $title }" gerado com o motor { $version }: { $lines } sentenças NMEA. Sintético: somente para treinamento e testes; nunca o envie aos sistemas de navegação em operação de uma embarcação.

js-training-generated-here = Gerado aqui pelo motor ("{ $title }"). Sintético: posições e datas inventadas.

js-training-generating = Iniciando o motor e gerando…

js-training-kind-drag-off = Arrasto de posição

js-training-kind-jamming = Jamming

js-training-kind-natural-degradation = Degradação natural (céu bloqueado)

js-training-kind-replay-delay = Atraso de repetição (replay)

js-training-kind-time-spoof = Spoofing de tempo

js-training-legend-no-fix = Sem posição: o receptor não informou nada

js-training-legend-reported = Informado, { $band } do verdadeiro

js-training-legend-true = Trajetória verdadeira

js-training-library-label = Cenário sintético da biblioteca "{ $title }", gravado por { $command }. Posições e datas inventadas; nenhuma embarcação nem gravação reais.

js-training-log-row = Linha { $row } de { $total } do registro, { $utc }

js-training-max-error-at = { $m } m em T+{ $s } s

js-training-moment-event = (evento { $id })

js-training-moment-title = T+{ $s } s { $what }: { $text }

js-training-moments-shown =
    { $shown ->
        [one] Primeiro de { $total } momentos exibido.
        [many] Primeiros { $shown } de { $total } momentos exibidos.
       *[other] Primeiros { $shown } de { $total } momentos exibidos.
    }

js-training-no-events = Nenhum: esta é uma execução limpa.

js-training-no-fix-nothing = sem posição: nada informado

js-training-no-fix-span = sem posição, de { $from } a { $to }

js-training-no-moments = Nenhum momento registrado.

js-training-none = nenhum

js-training-none-now = Nenhum neste momento.

js-training-none-reported = nenhum informado

js-training-north = N

js-training-not-touched = não tocado por nenhum evento

js-training-opened = { $name } aberto: { $rows } linhas de registro ao longo de { $secs } s.

js-training-opening = Abrindo { $title }…

js-training-param-affect-time = Afeta o tempo

js-training-param-bearing-deg = Rumo, graus verdadeiros

js-training-param-cn0-drop-db = Queda de C/N0, dB

js-training-param-counterfeit-cn0-dbhz = C/N0 falsificado, dB-Hz

js-training-param-delay-s = Atraso, s

js-training-param-duration-s = Duração, s

js-training-param-final-offset-m = Deslocamento final, m

js-training-param-kind = Tipo

js-training-param-label = Rótulo

js-training-param-offset-s = Deslocamento de tempo, s

js-training-param-ramp-s = Rampa de início, s

js-training-param-recovery-s = Rampa de recuperação, s

js-training-param-relative-bearing-deg = Rumo relativo ao curso, graus

js-training-param-skyline = Linha do horizonte

js-training-param-spread-db = Dispersão por satélite, dB

js-training-param-start-s = Início, s

js-training-pause = Pausar

js-training-play = Reproduzir

js-training-reading = Lendo…

js-training-readout-fix = posição

js-training-readout-no-fix = sem posição

js-training-reduced-motion = A preferência é por movimento reduzido, então a reprodução começa em 1x. Use o controle deslizante ou as setas do teclado para se mover sem animação.

js-training-row-cn0 = C/N0 médio, dB-Hz

js-training-row-cog = Curso sobre o fundo, graus

js-training-row-error = Erro de posição, m

js-training-row-fix = posição

js-training-row-heading = Rumo (giro), graus

js-training-row-moments = momentos

js-training-row-position = Posição

js-training-row-sats = Satélites usados / rastreados

js-training-row-sog = Velocidade sobre o fundo, kn

js-training-row-time-offset = Deslocamento de tempo, s

js-training-say-active = ativos: { $list }

js-training-say-event-id = evento { $id }

js-training-say-fix = o receptor informa uma posição

js-training-say-mean-cn0 = C/N0 médio { $cn0 } dB-Hz

js-training-say-no-fix = sem posição

js-training-say-position-from-true = posição informada a { $m } m da verdadeira

js-training-say-sats-used =
    { $used ->
        [one] { $used } de { $tracked } satélites usado
        [many] { $used } de { $tracked } satélites usados
       *[other] { $used } de { $tracked } satélites usados
    }

js-training-say-time-ahead = tempo informado adiantado em relação ao verdadeiro em { $s } s

js-training-say-time-behind = tempo informado atrasado em relação ao verdadeiro em { $s } s

js-training-sky-no-gsv = sem GSV

js-training-sky-none = Nenhum céu para este registro: um registro de instrutor sozinho não tem satélites. Abra um cenário da biblioteca, ou gere um fluxo aqui e faça o debriefing dele, para ver os satélites que seu GSV lista.

js-training-skyline-preset = predefinição { $name }

js-training-skyline-stated = perfil informado

js-training-span-no-fix = T+{ $from } a { $to } s

js-training-track-desc = Trajetória verdadeira e trajetória informada, norte para cima. Maior erro de posição { $error }. { $periods } período(s) sem posição.

js-training-track-end = fim

js-training-track-start = início

js-training-trainer-note = Nota do instrutor

js-training-warn-no-warning-text = Este arquivo não traz texto de aviso. É um registro de treinamento: não envie seu fluxo à navegação em operação.

js-training-warn-rows-skipped = { $count } linha(s) de trajetória não eram válidas e foram ignoradas.

js-training-what-fix-lost = Posição perdida

js-training-what-fix-regained = Posição recuperada

js-training-what-full-effect = Efeito pleno

js-training-what-onset = Início

js-training-what-recovered = Recuperado

js-training-what-recovery-begins = Início da recuperação

js-trust-adv-carried = Declaração consultiva trazida por este arquivo:

js-trust-adv-none = Este arquivo não traz nenhuma declaração consultiva

js-trust-adv-none-rest = (saídas mais antigas não trazem). O aviso consultivo no alto desta página vale para tudo da mesma forma.

js-trust-agree-both = ambos sinalizam: o alarme do próprio receptor e um monitor do Kshana

js-trust-agree-calibrating = dentro da janela de calibração: não comparado

js-trust-agree-kshana-only = só o Kshana alarma: o receptor não sinaliza

js-tools-ubx-ignored-sfrbx = { $n } mensagens SFRBX foram ignoradas (outros sistemas, E5b, alertas, checksums inválidos).

js-trust-agree-neither = nenhum sinaliza

js-trust-agree-receiver-only = só o receptor sinaliza: nenhum monitor do Kshana alarma

js-trust-assessed = { $name } avaliado com o motor { $version }, neste navegador.

js-trust-assessed-as = { $name } avaliado como { $format }, com o motor, neste navegador. Nada foi enviado.

js-trust-assessing = Iniciando o motor e avaliando…

js-trust-class-also-costing = { $class } (também custando pontos)

js-trust-class-environment = ambiente: o sinal (potência, jamming, satélites perdidos com o céu aberto)

js-trust-class-geometry = geometria: o céu, não o sinal

js-trust-class-inconsistency = inconsistência: semelhante a um ataque, não explicada pelo céu nem pelo sinal

js-trust-dl-result-json = Baixar o resultado (JSON)

js-trust-dl-table-csv = Baixar a tabela por época (CSV)

js-trust-edge-degraded = { $v } degradado

js-trust-edge-nominal = { $v } nominal

js-trust-err-assess = { $name }: não pôde ser avaliado ({ $reason }).

js-trust-err-demo-files = os arquivos da demonstração não foram carregados

js-trust-err-demo-log-open = O registro da demonstração não pôde ser aberto: { $reason }.

js-trust-err-demo-open = A demonstração não pôde ser aberta: { $reason }.

js-trust-err-engine-no-receiver-trust = Esta versão do motor (versão { $version }) não tem receiver_trust.

js-trust-err-engine-no-scorer = Esta versão do motor (versão { $version }) não tem pontuador de registros; ela é anterior a esta página. O comando é { $command }.

js-trust-err-engine-start = O motor não pôde ser iniciado aqui ({ $reason }).

js-trust-err-engine-start-open = O motor não pôde ser iniciado aqui ({ $reason }). Abrir os arquivos de resultado acima ainda funciona.

js-trust-err-example-files = os arquivos de exemplo não foram carregados

js-trust-err-example-open = O exemplo não pôde ser aberto: { $reason }.

js-trust-err-file-2mib = { $name }: maior que 2 MiB. Abra um trecho.

js-trust-err-file-too-large = { $name }: maior que { $max }. Esta página lê arquivos de até esse tamanho; abra um trecho.

js-trust-err-gen-too-large = { $name }: maior que 2 MiB. Abra um trecho (a ferramenta de linha de comando aceita um registro inteiro).

js-trust-err-imu-format = "{ $format }" não é um formato IMU que esta página lê (csv ou euroc)

js-trust-err-imu-heading = o rumo do IMU em sua primeira amostra não é um número

js-trust-err-log-format = "{ $format }" não é um formato de registro que esta página pode enviar ao motor

js-trust-err-no-epochs = O arquivo não tem épocas.

js-trust-err-no-epochs-result = Este arquivo de resultado não tem epochs[]. Ele precisa vir de `{ $command }` para uma sessão de embarcação.

js-trust-err-no-epochs-returned = { $name }: o motor não devolveu nenhuma época.

js-trust-err-no-score-model = Este resultado não tem score_model, então é uma execução de plataforma estática, sem pontuação de confiança. A visualização desenha execuções de embarcação (plataforma em movimento).

js-trust-err-not-readable = { $name }: não é um arquivo que esta visualização lê (um JSON de resultado, linhas JSON, trust.csv, um registro NMEA ou um arquivo de verdade de campo).

js-trust-err-nothing-to-draw = Nada para desenhar: escolha um JSON de resultado, linhas JSON ou trust.csv.

js-trust-err-read = { $name }: não pôde ser lido ({ $reason }).

js-trust-err-read-or-draw = { $name }: não pôde ser lido nem desenhado ({ $reason }).

js-trust-err-score = { $name }: não pôde ser pontuado ({ $reason }).

js-trust-err-score-file-too-large = { $name }: maior que 2 MiB. O pontuador no navegador aceita um trecho que contenha a janela de calibração de cinco minutos.

js-trust-err-score-too-large = { $name }: maior que 2 MiB. O pontuador no navegador aceita um trecho (o comando { $command } aceita um registro inteiro); abra um trecho que contenha a janela de calibração de cinco minutos.

js-trust-err-scorecard-too-large = { $name }: maior que 8 MiB; esta página lê um placar de até esse tamanho.

js-trust-err-session-empty = As configurações da sessão estão vazias. Elas declaram a embarcação ({ $setting }).

js-trust-err-too-many-epochs =
    { $count ->
        [one] O arquivo tem { $count } época; esta página desenha no máximo { $max }. Abra um trecho.
        [many] O arquivo tem { $count } de épocas; esta página desenha no máximo { $max }. Abra um trecho.
       *[other] O arquivo tem { $count } épocas; esta página desenha no máximo { $max }. Abra um trecho.
    }

js-trust-err-triple-quote = { $what } contém três aspas simples seguidas, o que não pode ser incorporado às configurações

js-trust-err-what-file = o arquivo

js-trust-err-what-imu = o arquivo IMU

js-trust-event-label = evento: { $label }

js-trust-event-onset = início

js-trust-evt-col-first-alarm = Primeiro alarme, s

js-trust-evt-col-latency = Latência, s

js-trust-evt-col-onset = Início, s

js-trust-evt-col-outcome = Resultado

js-trust-evt-col-stated = Evento declarado

js-trust-fmt-android = Android GNSS Logger (texto)

js-trust-fmt-gnss-sdr = Linhas JSON retransmitidas do GNSS-SDR (texto)

js-trust-fmt-nmea = NMEA 0183 (texto)

js-trust-fmt-novatel = NovAtel OEM7 (ASCII ou binário)

js-trust-fmt-rinex = Observação RINEX (texto)

js-trust-fmt-rtcm3 = RTCM 3 MSM4 / MSM7 (binário)

js-trust-fmt-rtklib-pos = Solução .pos do RTKLIB (texto)

js-trust-fmt-sbf = Septentrio SBF (binário)

js-trust-fmt-ubx = u-blox UBX (binário)

js-trust-gate-note-derived = Esta execução não tem registro de portão. A faixa mostra onde um portão teria retido a posição: épocas na faixa não confiável, retidas até 30 s depois de saírem dela. Derivado aqui, não lido de um portão. Um portão é opcional e acrescenta latência.

js-trust-gate-note-read = O portão de cada época como o fluxo ao vivo o informou: desligado, liberado ou retido (a posição foi marcada como inválida no ciclo encaminhado).

js-trust-gate-now-derived = { $gate } · derivado

js-trust-gate-off = Desligado

js-trust-gate-off-cal = Desligado (calibrando)

js-trust-gate-passed = Liberado: a posição é encaminhada sem alteração

js-trust-gate-span = portão { $gate }, de { $from } a { $to }

js-trust-gate-span-derived = portão { $gate } (derivado), de { $from } a { $to }

js-trust-gate-withheld = Retido: a posição seria marcada como inválida adiante

js-trust-gen-chart-label = O gráfico do motor para a execução: densidade de portadora sobre ruído, estado e alarmes ao longo do tempo

js-trust-gen-epochs = Épocas: { $nominal } nominais, { $degraded } degradadas, { $untrusted } não confiáveis após a janela de calibração de { $window } épocas.

js-trust-gen-self-heading = Os sinalizadores do próprio receptor, contra os alarmes do Kshana

js-trust-gen-self-note = Uma comparação, não uma verificação de nenhum dos dois: o sinalizador do receptor é um relato próprio.

js-trust-geo-deduction-class =
    { $points ->
        [one] { $points } ponto ({ $class })
        [many] { $points } de pontos ({ $class })
       *[other] { $points } pontos ({ $class })
    }

js-trust-geo-deduction-points =
    { $points ->
        [one] { $points } ponto
        [many] { $points } de pontos
       *[other] { $points } pontos
    }

js-trust-geo-flag-mismatch = O HDOP declarado pelo receptor discorda do derivado do céu que ele informa: uma dedução de geometria conta como inconsistência.

js-trust-geo-flag-signal-loss = Perda de sinal: satélites à vista não são rastreados apesar de sua geometria ser boa, então uma dedução de geometria conta como ambiente.

js-trust-geo-heading-label = geometria { $label }

js-trust-geo-label-fair = { $label } (não pontuado)

js-trust-geo-label-poor = { $label } (o único rótulo pelo qual a pontuação deduz)

js-trust-geo-none-in-run = Nenhuma geometria nesta execução (um motor anterior à 0.36 não a grava).

js-trust-geo-reason-few-satellites = menos satélites que o mínimo

js-trust-geo-reason-high-hdop = HDOP acima do seu limite

js-trust-geo-reason-high-pdop = PDOP acima do seu limite

js-trust-geo-reason-sky-blocked = os satélites rastreados deixam uma grande lacuna em azimute (um lado do céu bloqueado)

js-trust-geo-row-deduction = Dedução de geometria

js-trust-geo-row-from = De

js-trust-geo-row-gap = Maior lacuna em azimute

js-trust-geo-row-label = Rótulo

js-trust-geo-row-open-sky = Céu aberto

js-trust-geo-row-reported-hdop = HDOP declarado pelo receptor

js-trust-geo-row-sats-used = Satélites usados

js-trust-geo-row-sky-age = Idade do céu

js-trust-geo-row-status = Estado

js-trust-geo-say-deduction =
    { $points ->
        [one] dedução de geometria: { $points } ponto
        [many] dedução de geometria: { $points } de pontos
       *[other] dedução de geometria: { $points } pontos
    }

js-trust-geo-say-label-hdop = geometria { $label } (HDOP { $hdop })

js-trust-geo-say-mismatch = o HDOP declarado discorda

js-trust-geo-source-derived = derivada dos satélites que o registro informa (GSV)

js-trust-geo-source-none = nada

js-trust-geo-source-reported = o DOP declarado pelo receptor (GSA)

js-trust-geo-status-reasons = { $status }: { $reasons }

js-trust-geo-status-title = geometria { $status }

js-trust-geo-unknown-no-gsv = geometria desconhecida: nenhum GSV nem GSA no registro

js-trust-geo-unknown-no-gsv-sentence = Geometria desconhecida: nenhum GSV nem GSA no registro.

js-trust-geo-unknown-odd = Geometria desconhecida (o arquivo diz "{ $odd }", que esta página não conhece).

js-trust-geo-used-of-view = { $used } de { $inView } à vista

js-trust-got-file-kind = { $name }: { $kind }

js-trust-got-lines-skipped =
    { $count ->
        [one] { $count } linha de { $name } não era época e foi ignorada
        [many] { $count } de linhas de { $name } não eram épocas e foram ignoradas
       *[other] { $count } linhas de { $name } não eram épocas e foram ignoradas
    }

js-trust-imu-csv = CSV com linha de cabeçalho

js-trust-imu-euroc = EuRoC MAV imu0 data.csv

js-trust-imu-file = Arquivo IMU: { $name } ({ $chars } caracteres). Usado na próxima avaliação.

js-trust-imu-file-press = Arquivo IMU: { $name } ({ $chars } caracteres). Usado na próxima avaliação; pressione Avaliar o arquivo escolhido.

js-trust-imu-none = Nenhum arquivo IMU.

js-trust-jt-col-latency = Latência, s

js-trust-jt-col-monitors = Primeiros monitores

js-trust-jt-col-name = Nome

js-trust-jt-col-outcome = Resultado

js-trust-jt-col-recovered = Recuperado

js-trust-jt-col-slot = Intervalo, s

js-trust-jt-col-test = Teste

js-trust-jt-label = { $label } Guarda de { $guard } s, retenção de recuperação de { $hold } s.

js-trust-jt-label-contaminated = { $label } Guarda de { $guard } s, retenção de recuperação de { $hold } s. A linha de base de calibração se sobrepôs a um intervalo programado.

js-trust-jt-opened =
    { $count ->
        [one] { $name } aberto: { $count } teste. Lido aqui; nada foi enviado.
        [many] { $name } aberto: { $count } de testes. Lido aqui; nada foi enviado.
       *[other] { $name } aberto: { $count } testes. Lido aqui; nada foi enviado.
    }

js-trust-kind-batch-result = resultado em lote

js-trust-kind-json-lines = linhas JSON

js-trust-kind-nmea-log = registro NMEA

js-trust-kind-truth-file = arquivo de verdade de campo

js-trust-label-demo = Demonstração sintética: um registro inventado de uma balsa com um desvio de posição inventado, pontuado pelo Kshana. Gravado a partir do motor; o registro é texto, não uma medição.

js-trust-label-example = Exemplo ilustrativo: um registro NMEA inventado com um jammer inventado de 120 s a 240 s, avaliado aqui pelo motor. Texto, não uma medição.

js-trust-label-geo-demo = Demonstração sintética de céu mascarado: o registro da balsa com a metade oeste do céu apagada a partir de 600 s (degradação natural, atribuída à geometria) e o mesmo desvio de posição inventado a partir de 1500 s (semelhante a um ataque). Gravado a partir de um motor com a geometria 0.36; texto, não uma medição.

js-trust-label-score-demo = Registro de demonstração sintético, pontuado aqui pelo motor. Registro de balsa e desvio inventados; texto, não uma medição.

js-trust-legend-calibrating = Calibrando (nunca pontuado)

js-trust-legend-class = Classe de dedução:

js-trust-legend-class-environment = ambiente: o sinal

js-trust-legend-class-geometry = geometria: o céu, não o sinal

js-trust-legend-class-inconsistency = inconsistência (semelhante a um ataque)

js-trust-legend-degraded = Degradado

js-trust-legend-demo = Nesta demonstração o receptor informa uma posição válida o tempo todo (qualidade GGA 1, estado RMC A). O que cai é a pontuação.

js-trust-legend-geo-degraded = geometria degradada

js-trust-legend-geo-good = geometria boa

js-trust-legend-geo-unknown = geometria desconhecida (sem GSV nem GSA; não é boa)

js-trust-legend-nominal = Nominal

js-trust-legend-self = Sinalizador do próprio receptor contra os alarmes do Kshana:

js-trust-legend-self-both = ambos sinalizam

js-trust-legend-self-kshana = só o Kshana

js-trust-legend-self-neither = nenhum

js-trust-legend-self-receiver = só o receptor

js-trust-legend-sky = Céu:

js-trust-legend-true-track = Trajetória verdadeira (somente dados sintéticos)

js-trust-legend-underline = sublinhado: geometria também custando pontos

js-trust-legend-untrusted = Não confiável

js-trust-marks-cleared = Marcas removidas.

js-trust-marks-set =
    { $count ->
        [one] { $name } esteve acima do seu limiar de início em { $count } época; ela está marcada na linha do tempo e na trajetória.
        [many] { $name } esteve acima do seu limiar de início em { $count } de épocas; elas estão marcadas na linha do tempo e na trajetória.
       *[other] { $name } esteve acima do seu limiar de início em { $count } épocas; elas estão marcadas na linha do tempo e na trajetória.
    }

js-trust-mon-agc = O controle automático de ganho se deslocou em relação à sua linha de base.

js-trust-mon-clock = O monitor auxiliado pelo relógio: o relógio do receptor contra sua linha prevista.

js-trust-mon-cn0-drop = Negação de potência: intensidade do sinal caída em relação à linha de base de calibração.

js-trust-mon-cn0-rise = Procura a assinatura de um único transmissor: a intensidade do sinal nos satélites subindo em conjunto em relação à linha de base.

js-trust-mon-cn0-spread = Procura a assinatura de um único transmissor: a intensidade do sinal nos satélites colapsando em conjunto em relação à linha de base de calibração.

js-trust-mon-geometry = A geometria dos satélites (0.36): custa pontos somente quando a geometria é ruim (HDOP, PDOP ou satélites usados além de seus limites), com teto, e nunca abaixo da faixa degradada.

js-trust-mon-heading-course = Compara a direção da trajetória com a direção para onde o navio aponta, dentro do ângulo de deriva declarado.

js-trust-mon-jam-ind = O próprio indicador de jamming do receptor.

js-trust-mon-kinematic = Compara cada passo de posição com a velocidade e o curso informados, e com os limites declarados de velocidade, aceleração e taxa de giro da embarcação.

js-trust-mon-loss-of-lock = Perda de satélites rastreados.

js-trust-mon-osnma = Lê uma falha de autenticação OSNMA informada. O estado é lido, não verificado.

js-trust-mon-position-jump = Um salto na posição informada maior que a linha de base permite.

js-trust-mon-raim = A estatística de teste do monitoramento autônomo de integridade do receptor contra o seu limite.

js-trust-mon-receiver-self-report = O próprio sinalizador de spoofing ou jamming do receptor (por exemplo u-blox UBX-SEC-SIG ou NAV-STATUS spoofDetState), mostrado ao lado dos monitores do Kshana. Lido do registro, não verificado; o espaço está pronto para o monitor do motor 0.38 e é desenhado como uma faixa assim que um resultado o traz.

js-trust-mon-sea-level = Verifica se a altitude está onde a superfície do mar e a altura declarada da antena a colocam.

js-trust-mon-solve-failure = A solução de posição não pôde ser calculada.

js-trust-mon-speed-log = Compara a velocidade sobre o fundo com a velocidade na água, dentro da tolerância de corrente declarada.

js-trust-mon-time-consistency = Verifica se o tempo do receptor tem passos irregulares ou retrocede, e o compara com o relógio deste computador nos fluxos em tempo real.

js-trust-mon-unknown = Um monitor para o qual esta visualização não tem descrição (mais novo que a página). Trate-o como um monitor.

js-trust-na = n/d

js-trust-name-colon-text = { $name }: { $text }

js-trust-never = nunca

js-trust-no = não

js-trust-no-deduction = nenhuma dedução

js-trust-none = nenhum

js-trust-north = N

js-trust-not-stated = não declarado

js-trust-note-advisories =
    { $count ->
        [one] As linhas trazem { $count } declaração consultiva diferente; ela é exibida.
        [many] As linhas trazem { $count } de declarações consultivas diferentes; a primeira é exibida.
       *[other] As linhas trazem { $count } declarações consultivas diferentes; a primeira é exibida.
    }

js-trust-note-csv-limits = trust.csv traz pontuações e motivos, mas não razões nem posições.

js-trust-note-live-no-model = Um fluxo ao vivo não declara quais monitores rodaram nem o modelo de pontuação; as bordas das faixas abaixo são os padrões documentados e as faixas de monitor mostram somente os monitores que custam pontos.

js-trust-note-nmea-no-match = Nenhuma posição NMEA pôde ser associada a uma época pelo tempo.

js-trust-note-nmea-skipped =
    { $count ->
        [one] { $count } sentença NMEA com checksum ou campos inválidos foi ignorada.
        [many] { $count } de sentenças NMEA com checksum ou campos inválidos foram ignoradas.
       *[other] { $count } sentenças NMEA com checksum ou campos inválidos foram ignoradas.
    }

js-trust-note-skipped-epochs =
    { $count ->
        [one] { $count } época sem t_s numérico foi ignorada.
        [many] { $count } de épocas sem t_s numérico foram ignoradas.
       *[other] { $count } épocas sem t_s numérico foram ignoradas.
    }

js-trust-note-truth-no-match = Os tempos do arquivo de verdade de campo não coincidem com nenhuma época.

js-trust-note-unknown-state =
    { $count ->
        [one] { $count } época traz um estado que esta página não conhece ({ $states }); ela é desenhada como em calibração, nunca pontuada.
        [many] { $count } de épocas trazem um estado que esta página não conhece ({ $states }); elas são desenhadas como em calibração, nunca pontuadas.
       *[other] { $count } épocas trazem um estado que esta página não conhece ({ $states }); elas são desenhadas como em calibração, nunca pontuadas.
    }

js-trust-offset-at = Em { $time } a posição informada pelo receptor está a { $m } m de onde a embarcação realmente estava (verdade de campo sintética).

js-trust-offset-no-truth = Nenhuma posição verdadeira neste instante.

js-trust-opened =
    { $count ->
        [one] { $count } época aberta ({ $source }).
        [many] { $count } de épocas abertas ({ $source }).
       *[other] { $count } épocas abertas ({ $source }).
    }

js-trust-opening-demo = Abrindo a demonstração sintética…

js-trust-opening-demo-log = Abrindo o registro de demonstração sintético…

js-trust-opening-example = Abrindo o exemplo ilustrativo…

js-trust-opening-geo-demo = Abrindo a demonstração de céu mascarado…

js-trust-pause = Pausar

js-trust-play = Reproduzir

js-trust-reading = Lendo…

js-trust-reasons-calibrating = Calibrando: os primeiros segundos formam a linha de base e nunca são pontuados.

js-trust-reasons-class-note = Cada dedução traz a classe do motor: geometria (o céu), ambiente (o sinal) ou inconsistência (semelhante a um ataque)

js-trust-reasons-live-unknown = Quais monitores rodaram não é declarado em um fluxo ao vivo; uma verificação ausente aqui pode não ter rodado.

js-trust-reasons-marked-none = marcado; nenhuma dedução aqui

js-trust-reasons-no-score = Nenhuma pontuação nesta época.

js-trust-reasons-no-score-note = Nenhuma pontuação nesta época: { $note }.

js-trust-reasons-not-run = Não executado (não é uma aprovação)

js-trust-reasons-nothing = Nada foi deduzido nesta época. Isso não é evidência de que a posição seja boa: veja o que as verificações não conseguem ver, abaixo.

js-trust-reasons-pts = { $points } pts

js-trust-reasons-ran-free = Executado, não custou nada

js-trust-reasons-ratio = razão { $ratio }

js-trust-reasons-row-title = { $name }: { $text } Clique para marcar onde ele esteve acima do seu limiar de início.

js-trust-reasons-weight = peso { $weight }

js-trust-reduced-motion = A preferência é por movimento reduzido, então a reprodução começa em 1x. Use o controle deslizante ou as setas do teclado para se mover sem animação.

js-trust-say-gate = portão { $gate }

js-trust-say-gate-derived = portão { $gate } (derivado)

js-trust-say-monitor-points =
    { $points ->
        [one] { $monitor } { $points } ponto
        [many] { $monitor } { $points } de pontos
       *[other] { $monitor } { $points } pontos
    }

js-trust-say-position-from-true = posição informada a { $m } m da verdadeira

js-trust-say-reasons = motivos: { $list }

js-trust-say-score = pontuação { $score }

js-trust-scored-label =
    { $count ->
        [one] { $count } época de { $name } pontuada com o motor { $version }, neste navegador.
        [many] { $count } de épocas de { $name } pontuadas com o motor { $version }, neste navegador.
       *[other] { $count } épocas de { $name } pontuadas com o motor { $version }, neste navegador.
    }

js-trust-scored-summary =
    { $count ->
        [one] { $count } época pontuada com o motor { $version }: { $summary }. Somente consultivo.
        [many] { $count } de épocas pontuadas com o motor { $version }: { $summary }. Somente consultivo.
       *[other] { $count } épocas pontuadas com o motor { $version }: { $summary }. Somente consultivo.
    }

js-trust-scoring = Iniciando o motor e pontuando…

js-trust-self-code-meaning = { $code }: { $meaning }

js-trust-self-none-at-time = O registro não traz nenhum sinalizador do receptor neste instante.

js-trust-self-not-in-log = não está no registro

js-trust-self-row-flags = Sinalizadores do receptor

js-trust-self-row-jamming = Estado de jamming do receptor

js-trust-self-row-kshana-alarms = Um monitor do Kshana alarma

js-trust-self-row-spoofing = Estado de spoofing do receptor

js-trust-self-unknown-agreement = uma concordância que esta página não conhece ({ $odd })

js-trust-self-yes-state-2 = sim (estado 2 ou mais)

js-trust-set-degraded-edge = a borda de degradado

js-trust-set-degraded-min = degradado a partir de

js-trust-set-epochs = Épocas

js-trust-set-epochs-counts = { $total } no total: { $calibrating } em calibração, { $nominal } nominais, { $degraded } degradadas, { $untrusted } não confiáveis.

js-trust-set-epochs-counts-class = { $total } no total: { $calibrating } em calibração, { $nominal } nominais, { $degraded } degradadas, { $untrusted } não confiáveis. Por classe de dedução: geometria { $geometry }, ambiente { $environment }, inconsistência { $inconsistency }.

js-trust-set-evidence-hold = retenção de evidência, s

js-trust-set-full-ratio = peso total na razão

js-trust-set-geo-counts = Céu: { $good } bom, { $degraded } degradado, { $unknown } desconhecido. Rótulo: { $lgood } bom, { $fair } regular, { $poor } ruim (só o ruim custa pontos). Épocas com dedução da classe geometria { $geometry }, ambiente { $environment }, inconsistência { $inconsistency }.

js-trust-set-geo-counts-odd = Céu: { $good } bom, { $degraded } degradado, { $unknown } desconhecido ({ $odd } com um valor que esta página não conhece, lido como desconhecido). Rótulo: { $lgood } bom, { $fair } regular, { $poor } ruim (só o ruim custa pontos). Épocas com dedução da classe geometria { $geometry }, ambiente { $environment }, inconsistência { $inconsistency }.

js-trust-set-geometry = Geometria (configurações de [geometry])

js-trust-set-gloss = O que cada verificação examina

js-trust-set-live-geometry = Um fluxo ao vivo não declara os limites de geometria; valem os padrões documentados (ruim acima de HDOP 4 ou PDOP 6, ou abaixo de 5 satélites; no máximo 15 pontos, nunca abaixo da faixa degradada).

js-trust-set-no-geometry = Esta execução não traz geometria: ela vem de um motor anterior à 0.36, ou de trust.csv. Nada sobre o céu é mostrado, e nada é mostrado como bom.

js-trust-set-nominal-min = nominal a partir de

js-trust-set-onset-ratio = custa pontos a partir da razão

js-trust-set-provenance = De onde vêm os limites e como as deduções são classificadas

js-trust-set-ran = Verificações executadas

js-trust-set-weights = Peso de cada verificação, pontos

js-trust-settings-assumed = Este fluxo não declara seu modelo de pontuação. As bordas das faixas mostradas são os padrões documentados, presumidos.

js-trust-show-in-replay = Mostrar esta execução na reprodução abaixo (trajetória, pontuação, o sinalizador do próprio receptor)

js-trust-sky-no-gsv = sem GSV

js-trust-sky-none = Nenhum céu: abra o registro NMEA da execução (ou uma demonstração) para ver os satélites que ele lista.

js-trust-span-title = { $what }, de { $from } a { $to }

js-trust-state-0 = desconhecido ou não ativado

js-trust-state-1 = nenhuma indicação

js-trust-state-2 = indicado

js-trust-state-3 = várias indicações ou confirmado

js-trust-strip-band = faixa

js-trust-strip-class = classe

js-trust-strip-gate = portão

js-trust-strip-marked = marcado

js-trust-strip-receiver = receptor

js-trust-strip-sky = céu

js-trust-strips-none = Nenhuma razão de monitor neste arquivo.

js-trust-strips-note-ran = razão da estatística sobre o limite; a linha tracejada é o alarme em 1

js-trust-strips-note-seen = somente monitores vistos custando pontos; razão sobre o limite

js-trust-sum-both-flag = Ambos sinalizam

js-trust-sum-epochs-compared = Épocas comparadas (após a calibração)

js-trust-sum-first-kshana = Primeiro alarme do Kshana entre essas épocas

js-trust-sum-first-receiver = Primeiro sinalizador do receptor

js-trust-sum-jamming-flag = Sinalizador de jamming do receptor (estado 2+)

js-trust-sum-neither = Nenhum

js-trust-sum-only-kshana = Só o Kshana alarma

js-trust-sum-only-receiver = Só o receptor sinaliza

js-trust-sum-spoofing-flag = Sinalizador de spoofing do receptor (estado 2+)

js-trust-thr-azimuth-gap = lacuna em azimute, em graus, a partir da qual o céu está parcialmente bloqueado

js-trust-thr-cap-in-force = máximo de pontos que a dedução de geometria toma nesta execução

js-trust-thr-cap-points = máximo de pontos que a dedução de geometria pode tomar

js-trust-thr-floor = menor pontuação que a geometria sozinha pode deixar (vazio: a borda da faixa degradada)

js-trust-thr-floor-in-force = menor pontuação que a geometria sozinha pode deixar nesta execução

js-trust-thr-full-ratio = razão na qual a dedução de geometria atinge seu teto

js-trust-thr-hdop-good = HDOP até o qual a geometria é boa

js-trust-thr-hdop-max = HDOP acima do qual a geometria é ruim

js-trust-thr-hold = por quanto tempo as posições do céu e o GSA valem depois de chegarem, s

js-trust-thr-low-elev = elevação, em graus, abaixo da qual um satélite perdido é atribuído ao céu

js-trust-thr-min-used = menor número de satélites usados antes de a geometria ser ruim

js-trust-thr-pdop-good = PDOP até o qual a geometria é boa

js-trust-thr-pdop-max = PDOP acima do qual a geometria é ruim

js-trust-thr-reported-rel = o mesmo, como proporção do HDOP derivado

js-trust-thr-reported-tol = diferença entre o HDOP declarado e o derivado antes de os dois discordarem

js-trust-thr-sigma-uere = erro de distância equivalente do usuário que os limites pressupõem, metros

js-trust-thr-used-good = número de satélites usados a partir do qual a geometria é boa

js-trust-track-desc = Trajetória de { $positions } posições informadas, norte para cima. { $untrusted } épocas não são confiáveis.

js-trust-track-desc-none = Nenhuma trajetória: os arquivos não trazem posições.

js-trust-track-desc-truth = Trajetória de { $positions } posições informadas, norte para cima. { $untrusted } épocas não são confiáveis. Uma linha cinza fina mostra a trajetória verdadeira.

js-trust-track-end = fim

js-trust-track-no-positions = Nenhuma posição nos arquivos abertos

js-trust-track-note = Norte para cima, uma escala nos dois eixos. A linha é onde o receptor disse que a embarcação estava, colorida pela faixa de confiança de cada época.

js-trust-track-note-none = Este arquivo não traz posições. Adicione o registro NMEA de onde a execução veio (ou um fluxo v1.1 com posição) para desenhar a trajetória.

js-trust-track-start = início

js-trust-unknown-agreement = uma concordância que esta página não conhece

js-trust-yes = sim
