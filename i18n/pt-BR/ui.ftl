# Texto da interface (português do Brasil): estrutura do site, avisos, seletor de idioma, estrutura do Studio.

## Site chrome
site-skip-link = Ir para o conteúdo
site-nav-primary = Principal
site-nav-missions = Missões
site-nav-capabilities = Capacidades
site-nav-evidence = Evidências
site-nav-research = Pesquisa
site-nav-developers = Desenvolvedores
site-nav-docs = Documentação
site-nav-editions = Edições
site-nav-search = Buscar
site-nav-launch = Iniciar
site-nav-studio = { -brand } Studio
site-nav-home = Início do { -brand }
site-nav-theme = Alternar entre o tema claro e o escuro
site-version = v{ $version }

site-footer-tagline = Simulador de código aberto de resiliência PNT (posicionamento, navegação e temporização). Ele não controla nenhum equipamento de rádio e não transmite nada: sua saída em nível de sinal são arquivos de amostras IQ em banda base, e seu receptor GNSS por software é uma ferramenta de análise. Não é um produto de voo.
site-footer-product = Produto
site-footer-company = Empresa
site-footer-benchmark = Benchmark
site-footer-install = Instalação
site-footer-mcp = Servidor MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · por Ashforde® OÜ · AGPL-3.0, com opção de licença comercial
site-footer-provenance = Cada gráfico é desenhado a partir de uma execução registrada do motor v{ $version } e indica seu cenário, sua semente e o caminho para reproduzi-lo.

## Language switcher
site-lang-label = Idioma
site-lang-switch-aria = Escolha o idioma desta página
site-lang-auto = Idioma do navegador
site-lang-remembered = Sua escolha fica memorizada neste dispositivo.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } parte desta página foi alterada desde a tradução e é exibida em inglês.
        [many] { $n } de partes desta página foram alteradas desde a tradução e são exibidas em inglês.
       *[other] { $n } partes desta página foram alteradas desde a tradução e são exibidas em inglês.
    }
notice-not-started = Esta página ainda não foi traduzida. Ela é exibida em inglês.
notice-detected = Exibindo em { $language }. <a1>Mudar para inglês</a1>
notice-dismiss = Fechar
notice-recorded-in-english = Registrado em inglês
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Início do { -brand }
studio-search-label = Encontrar um cenário, uma área, uma configuração ou um comando
studio-search-placeholder = Busque por nome, pergunta ou configuração, por exemplo máscara de elevação
studio-search-scenarios = Buscar cenários, áreas ou configurações
studio-search-commands = Buscar cenários e comandos
studio-search-all = Encontrar um cenário, uma área, uma configuração, uma visualização ou um comando
studio-search = Buscar
studio-theme = Alternar entre o tema claro e o escuro
studio-starting-questions = Perguntas para começar
studio-where-you-are = Onde você está
studio-engine-status = Onde o motor está sendo executado
studio-views = Visualizações: Geometria, Confiança do receptor, Mapa de interferência, Relatório de treinamento, Ferramentas
studio-more-views = Mais visualizações
studio-advanced-full = O painel completo: todos os painéis, campos e abas
studio-advanced-switch = Mudar para a visualização avançada
studio-view-geometry = Geometria: skyplot, horizonte e DOP
studio-view-training = Relatório de treinamento: abrir um registro de instrutor
studio-view-interference = Mapa de interferência: abrir arquivos de mapa
studio-view-receiver-trust = Confiança do receptor: abrir uma execução de embarcação
studio-view-tools = Ferramentas: evidências, bench, compliance, OSNMA
studio-result = Resultado
studio-result-meaning = O que o resultado significa
studio-key-figures = Números principais
studio-result-views = Visualizações deste resultado
studio-figures-of-merit = Figuras de mérito
studio-find-result-field = Encontrar um campo do resultado
studio-capability-view = Visualização de capacidades
studio-time-series = Séries temporais
studio-chart-source = Origem do gráfico
studio-signal-band = Sinal e banda
studio-signal-field = Campo de sinal
studio-clock-holdover = Holdover do relógio
studio-telecom-masks = Máscaras de temporização de telecomunicações
studio-clock-stability = Estabilidade do relógio
studio-orbit-3d = Órbita 3D
studio-ground-track = Traço no solo
studio-parameter-sweep = Varredura de parâmetros
studio-compare-runs = Comparar execuções
studio-animation = Animação
studio-engine-report = Relatório do motor
studio-exports = Exportações e relatório
studio-full-result = Documento de resultado completo
studio-settings = Configurações e detalhes
studio-find-setting = Encontrar uma configuração, por exemplo máscara
studio-find-scenario-setting = Encontrar uma configuração deste cenário
studio-engine-summary = O resumo do próprio motor
studio-restore-scenario = Restaurar o cenário incluído
studio-copy-scenario = Copiar o texto do cenário
studio-scenario-source = Fonte do cenário (TOML)
studio-install-engine = Instalar o motor
studio-run-history = Histórico de execuções
studio-scenarios-count =
    { $n ->
        [one] Cenário que ele executa ({ $n })
        [many] Cenários que ele executa ({ $n })
       *[other] Cenários que ele executa ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } linha do registro
        [many] { $n } de linhas do registro
       *[other] { $n } linhas do registro
    }
studio-recorded-in-english = Registrado em inglês
studio-lang-engine-fallback = Não foi possível carregar o texto do motor para este idioma; o inglês é exibido.
