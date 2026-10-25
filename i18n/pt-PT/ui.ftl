# Texto da interface (pt-PT): estrutura do sítio, avisos, seletor de idioma, estrutura do Studio.

## Site chrome
site-skip-link = Saltar para o conteúdo
site-nav-primary = Principal
site-nav-missions = Missões
site-nav-capabilities = Capacidades
site-nav-evidence = Evidências
site-nav-research = Investigação
site-nav-developers = Programadores
site-nav-docs = Documentação
site-nav-editions = Edições
site-nav-search = Pesquisar
site-nav-launch = Iniciar
site-nav-studio = { -brand } Studio
site-nav-home = Página inicial do { -brand }
site-nav-theme = Alternar entre claro e escuro
site-version = v{ $version }

site-footer-tagline = Simulador de código aberto de resiliência PNT (posicionamento, navegação e temporização). Não aciona nenhum equipamento de rádio e não transmite nada: a sua saída ao nível do sinal são ficheiros de amostras IQ em banda base, e o seu recetor GNSS por software é uma ferramenta de análise. Não é um produto de voo.
site-footer-product = Produto
site-footer-company = Empresa
site-footer-benchmark = Benchmark
site-footer-install = Instalar
site-footer-mcp = Servidor MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · por Ashforde® OÜ · AGPL-3.0, com opção de licença comercial
site-footer-provenance = Cada gráfico é desenhado a partir de uma execução registada do motor v{ $version } e indica o seu cenário, a semente e o percurso para o reproduzir.

## Language switcher
site-lang-label = Idioma
site-lang-switch-aria = Escolher o idioma desta página
site-lang-auto = Idioma do navegador
site-lang-remembered = A sua escolha fica memorizada neste dispositivo.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } parte desta página foi alterada desde que foi traduzida e é apresentada em inglês.
        [many] { $n } de partes desta página foram alteradas desde que foram traduzidas e são apresentadas em inglês.
       *[other] { $n } partes desta página foram alteradas desde que foram traduzidas e são apresentadas em inglês.
    }
notice-not-started = Esta página ainda não foi traduzida. É apresentada em inglês.
notice-detected = A apresentar em { $language }. <a1>Mudar para inglês</a1>
notice-dismiss = Dispensar
notice-recorded-in-english = Registado em inglês
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Página inicial do { -brand }
studio-search-label = Encontrar um cenário, uma área, uma definição ou um comando
studio-search-placeholder = Pesquisar por nome, pergunta ou definição, por exemplo máscara de elevação
studio-search-scenarios = Pesquisar cenários, áreas ou definições
studio-search-commands = Pesquisar cenários e comandos
studio-search-all = Encontrar um cenário, uma área, uma definição, uma vista ou um comando
studio-search = Pesquisar
studio-theme = Alternar entre claro e escuro
studio-starting-questions = Perguntas para começar
studio-where-you-are = Onde se encontra
studio-engine-status = Onde o motor está a ser executado
studio-views = Vistas: Geometria, Confiança do recetor, Mapa de interferência, Análise do treino, Ferramentas
studio-more-views = Mais vistas
studio-advanced-full = O painel completo: todos os painéis, campos e separadores
studio-advanced-switch = Mudar para a vista avançada
studio-view-geometry = Geometria: skyplot, skyline e DOP
studio-view-training = Análise do treino: abrir um registo do instrutor
studio-view-interference = Mapa de interferência: abrir ficheiros de mapa
studio-view-receiver-trust = Confiança do recetor: abrir uma execução de embarcação
studio-view-tools = Ferramentas: evidências, bench, compliance, OSNMA
studio-result = Resultado
studio-result-meaning = O que o resultado significa
studio-key-figures = Valores principais
studio-result-views = Vistas deste resultado
studio-figures-of-merit = Figuras de mérito
studio-find-result-field = Encontrar um campo do resultado
studio-capability-view = Vista de capacidade
studio-time-series = Série temporal
studio-chart-source = Origem do gráfico
studio-signal-band = Sinal e banda
studio-signal-field = Campo do sinal
studio-clock-holdover = Holdover do relógio
studio-telecom-masks = Máscaras de temporização de telecomunicações
studio-clock-stability = Estabilidade do relógio
studio-orbit-3d = Órbita 3D
studio-ground-track = Traço no solo
studio-parameter-sweep = Varrimento de parâmetros
studio-compare-runs = Comparar execuções
studio-animation = Animação
studio-engine-report = Relatório do motor
studio-exports = Exportações e relatório
studio-full-result = Documento de resultado completo
studio-settings = Definições e detalhes
studio-find-setting = Encontrar uma definição, por exemplo máscara
studio-find-scenario-setting = Encontrar uma definição deste cenário
studio-engine-summary = O resumo do próprio motor
studio-restore-scenario = Repor o cenário incluído
studio-copy-scenario = Copiar o texto do cenário
studio-scenario-source = Fonte do cenário (TOML)
studio-install-engine = Instalar o motor
studio-run-history = Histórico de execuções
studio-scenarios-count =
    { $n ->
        [one] Cenário que executa ({ $n })
        [many] Cenários que executa ({ $n })
       *[other] Cenários que executa ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } linha do registo
        [many] { $n } de linhas do registo
       *[other] { $n } linhas do registo
    }
studio-recorded-in-english = Registado em inglês
studio-lang-engine-fallback = Não foi possível carregar o texto do motor para este idioma; é apresentado o inglês.
