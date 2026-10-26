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

studio-geometry-kshana-home = Início do Kshana

studio-geometry-back-to-the-studio = Voltar ao Studio

studio-geometry-step-the-time = Avançar o tempo

studio-geometry-draw-the-skyline = Desenhar o perfil do horizonte

studio-geometry-skip-to-the-view = Ir para a visualização

studio-geometry-which-satellites-can-you-see = Quais satélites você consegue ver e quão boa é a geometria deles?

studio-geometry-what-this-shows = O que isto mostra

studio-geometry-starting-the-engine = Iniciando o motor…

studio-geometry-every-setting-is-in-the = Todas as configurações estão no endereço da página, então um link copiado abre o mesmo céu.

studio-geometry-offset-from-the-constellations-reference = Deslocamento em relação à época de referência das constelações

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Seus próprios elementos orbitais (TLE)

studio-geometry-use-these-elements = Usar estes elementos

studio-geometry-back-to-the-presets = Voltar às predefinições

studio-geometry-clear-the-skyline = Limpar o perfil do horizonte

studio-geometry-drag-on-the-skyplot-to = Arraste sobre o skyplot para desenhar o perfil do horizonte (passos de 1° em azimute e de 0,5° em elevação). Com o foco no skyplot: Esquerda e Direita percorrem o horizonte (Shift para 10°), Cima e Baixo sobem ou descem o perfil nesse ponto (Shift para 5°) e Delete o limpa.

studio-geometry-copy-a-link-to-this = Copiar um link para este céu

studio-geometry-download-the-skyplot-svg = Baixar o skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = O zênite no centro, o horizonte na borda e o norte para cima. As marcas preenchidas são satélites da solução; as marcas vazadas estão ocultas pela máscara ou pelo perfil do horizonte, ou não são usadas.

studio-geometry-dilution-of-precision = Diluição da precisão

studio-geometry-how-much-the-geometry-multiplies = Quanto a geometria multiplica o erro de distância. Quanto menor, melhor; perto de 1 é excelente e acima de 6 é ruim.

studio-geometry-horizontal-position-error = Erro de posição horizontal

studio-geometry-satellites-as-a-table = Satélites, em forma de tabela

studio-geometry-the-same-satellites-as-the = Os mesmos satélites do skyplot.

studio-geometry-azimuth = Azimute, °

studio-geometry-elevation = Elevação, °

studio-geometry-in-the-solution = Na solução

studio-geometry-the-engine-runs-here-as = O motor é executado aqui como WebAssembly. Nada é baixado de outro site e nada do que você configura é enviado a lugar algum.

studio-holdover-holdover-test-scenarios = Cenários de teste de holdover

studio-holdover-holdover-test = Teste de holdover

studio-holdover-how-far-does-the-time = Até onde vai o erro de tempo quando o GNSS some?

studio-holdover-opening-the-scenarios = Abrindo os cenários…

studio-holdover-verdict-step-by-step = Veredito, passo a passo

studio-holdover-time-error-over-the-record = Erro de tempo ao longo do registro

studio-holdover-the-three-phases-are-shaded = As três fases estão sombreadas; as linhas verticais tracejadas são os dois instantes informados pelo operador. As linhas horizontais tracejadas são os limites das máscaras sobre o erro de tempo absoluto máximo, cada uma desenhada sobre o degrau que sua máscara nomeia, e a faixa de recuperação; um triângulo marca o momento em que um orçamento ou o envelope de holdover ePRTC-A é excedido pela primeira vez.

studio-holdover-of-the-baseline-and-the = Da linha de base e do holdover; uma cruz é um limite de máscara no momento em que sua verificação foi a pior.

studio-holdover-the-same-two-steps-against = Os mesmos dois degraus em relação aos limites de TDEV.

studio-holdover-the-numbers = Os números

studio-holdover-everything-below-is-the-engine = Tudo o que segue é do motor, nas unidades que ele informa.

studio-holdover-mask-checks = Verificações de máscara

studio-holdover-each-mask-is-measured-on = Cada máscara é medida sobre o degrau que sua condição nomeia. Uma máscara que exige um registro mais longo do que o degrau forneceu fica INCOMPLETE e nunca é extrapolada; toda entrada que uma Recomendação deixa para estudo posterior está ausente.

studio-holdover-what-this-does-not-cover = O que isto não cobre

studio-interference-cell-size-in-degrees-empty = Tamanho da célula em graus (vazio para 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Sobre esta página

studio-interference-interference-map = Mapa de interferência

studio-interference-where-did-position-reports-look = Onde os relatórios de posição pareciam degradados?

studio-interference-open-map-files = Abrir arquivos de mapa

studio-interference-or-drop-them-here = ou solte-os aqui

studio-interference-open-the-synthetic-demo = Abrir a demonstração sintética

studio-interference-close-all-maps = Fechar todos os mapas

studio-interference-nothing-open-yet = Nada aberto ainda.

studio-interference-build-a-map-here = Criar um mapa aqui

studio-interference-build-from-the-synthetic-sample = Criar a partir da amostra sintética

studio-interference-route-exposure-here = Exposição da rota aqui

studio-interference-use-the-synthetic-route = Usar a rota sintética

studio-interference-reading-these-maps = Como ler estes mapas

studio-interference-maps-inherit-the-coverage-of = Os mapas herdam a cobertura de sua fonte: receptores ADS-B de voluntários deixam o mar aberto pouco coberto, e os dados abertos de AIS omitem algumas classes de embarcação. Leia as notas de cobertura de cada arquivo.

studio-interference-no-coastline-or-basemap-is = Nenhuma linha de costa nem mapa base é desenhado e nada é baixado de nenhum servidor; a grade é apenas de latitude e longitude.

studio-interference-no-identifier-of-any-aircraft = Nenhum identificador de aeronave ou embarcação consta nestes arquivos; células com poucas aeronaves ou embarcações distintas não são publicadas de modo algum, e uma contagem AIS de um ou dois é retida.

studio-lunar-infra-lunar-infrastructure-scenarios = Cenários de infraestrutura lunar

studio-lunar-infra-lunar-infrastructure = Infraestrutura lunar

studio-lunar-infra-what-can-the-moon-s = O que a órbita e a superfície da Lua podem fazer como infraestrutura de navegação e geodésica, e em que ficam aquém?

studio-lunar-infra-five-studies-of-what-lunar = Cinco estudos do que orbitadores lunares e uma estação na superfície lunar poderiam fazer juntos como infraestrutura de navegação e geodésica: determinação de órbita a partir de sinais GNSS terrestres em comparação com o rastreamento em solo, fixação de fase da portadora entre uma estação de superfície e um orbitador, coestimação do referencial lunar, ligação de GNSS, VLBI e telemetria a laser em uma única espaçonave, e quão sensíveis são a telemetria a laser e o rastreamento às marés e à libração da Lua. As entradas são ilustrativas e o modelo é restrito; onde um estudo não atingiu o limiar contra o qual foi pré-registrado, esta página diz isso. Cada número é copiado de um resultado que o motor registrou; a página o escala e o desenha, e não calcula mais nada.

studio-lunar-infra-what-the-result-holds = O que o resultado contém

studio-lunar-infra-findings-disclosures-and-what-was = Achados, divulgações e o que não foi verificado

studio-lunar-what-these-figures-are = O que são estes números

studio-lunar-map-key = Legenda do mapa

studio-lunar-lunar-station = Estação lunar

studio-lunar-what-accuracy-could-a-reference = Que precisão uma estação de referência perto do polo sul lunar poderia dar, e onde?

studio-lunar-the-constellation-its-signal-in = A constelação, seu erro de sinal no espaço, o erro de levantamento da estação, a latência da correção e a quantização do enlace são entradas indicadas no arquivo de cenário, cada uma com sua fonte ou marcada como ilustrativa. Nenhum número aqui foi comparado com uma estação real nem com dados de voo.

studio-lunar-the-source-and-every-input = A fonte e cada entrada que você altera estão no endereço da página, então um link copiado abre o mesmo estudo.

studio-lunar-a-result-file-is-the = Um arquivo de resultado é o JSON que o motor grava para este tipo (a saída JSON da linha de comando, ou uma execução salva daqui). Ele é lido nesta página; nada é enviado.

studio-lunar-each-field-shows-the-scenario = Cada campo mostra o valor do arquivo de cenário até que você o altere. Um dia de épocas sobre toda a grade demora um pouco: menos ensaios ou um passo de tempo maior executam mais rápido.

studio-lunar-run-it-here = Executar aqui

studio-lunar-back-to-the-file-s = Voltar aos valores do arquivo

studio-lunar-copy-a-link = Copiar um link

studio-lunar-save-this-result-json = Salvar este resultado (JSON)

studio-lunar-corrected-error-over-the-south = Erro corrigido na região polar sul

studio-lunar-south-polar-stereographic-the-pole = Estereográfica polar sul: o polo no centro, a borda da grade no limite, a longitude 0° para cima e 90° leste para a direita. Cada célula é um ponto da grade; a linha grossa é onde o erro corrigido cruza o limiar, e a linha tracejada é o raio de cobertura por azimute.

studio-lunar-region-figures = Números da região

studio-lunar-over-the-whole-grid-means = Sobre toda a grade: médias ponderadas por área e o pior ponto.

studio-lunar-coverage-radius-per-azimuth = Raio de cobertura por azimute

studio-lunar-along-each-bearing-from-the = Ao longo de cada rumo a partir da estação, a distância em que a cobertura cai pela primeira vez abaixo de 95 %.

studio-lunar-as-a-table = Em forma de tabela

studio-lunar-radius-km = Raio, km

studio-lunar-at-the-grid-edge = Na borda da grade

studio-lunar-points-along-it = Pontos ao longo dela

studio-lunar-an-epoch-is-unavailable-at = Uma época fica indisponível em um ponto quando o usuário vê menos de quatro satélites, ou quando a estação não vê todos os satélites que o usuário usa; nenhum erro é calculado para ela.

studio-lunar-grid-points-as-a-table = Pontos da grade, em forma de tabela

studio-lunar-the-same-points-as-the = Os mesmos pontos do mapa, os mais próximos da estação primeiro.

studio-lunar-latitude = Latitude, °

studio-lunar-longitude = Longitude, °

studio-lunar-from-the-station-km = A partir da estação, km

studio-lunar-corrected-error = Erro corrigido

studio-lunar-uncorrected-error = Erro não corrigido

studio-lunar-hpl-median = Mediana de HPL

studio-lunar-the-engine-s-statement-inputs = A declaração do motor, as entradas e o orçamento do enlace

studio-lunar-inputs-as-the-engine-read = Entradas, como o motor as leu

studio-lunar-error-model = Modelo de erro

studio-lunar-correction-link-budget-at-the = Orçamento do enlace de correção na estação e no pior ponto

studio-observatory-previous-day = Dia anterior

studio-observatory-day-opened = Dia aberto

studio-observatory-next-day = Dia seguinte

studio-observatory-interference-observatory = Observatório de interferência

studio-observatory-what-did-one-day-s = Como eram os relatórios de posição de um dia?

studio-observatory-the-observatory-writes-a-few = O observatório grava alguns arquivos para cada dia UTC e região: as células da grade com um de três estados, uma lista de incidentes e um manifesto. Abra aqui os arquivos que você produziu e leia-os. A página não calcula nada e mostra apenas o que os arquivos dizem. Ela não inclui dados do observatório, não baixa nada e não envia nada.

studio-observatory-open-a-day = Abrir um dia

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Os três estados

studio-observatory-the-picture-the-observatory-wrote = A imagem que o observatório gravou

studio-observatory-the-png-you-opened-as = O PNG que você abriu, como está. As células que não são desenhadas não foram observadas.

studio-observatory-cells-drawn-from-the-file = Células, desenhadas a partir do arquivo

studio-observatory-plate-carr-eacute-e-no = Plate carrée, sem mapa base. Passe o cursor sobre uma célula, ou use a tabela, para ver seu estado e suas contagens. Um lugar sem célula não foi observado.

studio-observatory-hover-or-focus-a-cell = Passe o cursor sobre uma célula, ou dê foco a ela, para ver seu estado.

studio-observatory-every-cell-in-the-file = Todas as células do arquivo

studio-observatory-a-count-the-file-withholds = Uma contagem que o arquivo retém (menos de 5 aeronaves) aparece como “retido”, nunca 0.

studio-observatory-files-and-their-hashes = Arquivos e seus hashes

studio-observatory-dataset-licence-and-notice = Conjunto de dados, licença e aviso

studio-observatory-what-this-page-does-and = O que esta página mostra e o que não mostra

studio-observatory-products-are-released-at-least = Os produtos são divulgados pelo menos 24 horas após o fim do dia UTC, em células de 0,5 grau ou mais grossas. Nunca é uma visualização ao vivo e nunca diz “agora”.

studio-observatory-it-shows-no-cause-no = Ela não mostra nenhuma causa, nenhum país, nenhuma força nem nenhuma fonte de interferência, nenhum alerta, nenhuma comparação entre lugares ou dias, e nenhum AIS. ADS-B e AIS nunca são combinados.

studio-observatory-the-page-ships-none-of = A página não inclui nenhum dos produtos do observatório. Publicá-los é decisão do proprietário.

studio-optical-optical-atmosphere-scenarios = Cenários de atmosfera óptica

studio-optical-optical-pnt = PNT óptico

studio-optical-can-an-optical-link-get = Um enlace óptico consegue atravessar o tempo atmosférico?

studio-optical-the-link = O enlace

studio-optical-sites-as-the-engine-states = Locais, como o motor os informa

studio-optical-inputs-are-marked-everything-else = As entradas estão marcadas; todo o resto é a saída do motor para elas.

studio-optical-it-draws-only-what-the = Ela desenha apenas o que o motor registrou para cada cenário, incluindo sua série temporal com semente. A página não calcula nada: ela escala os números do motor para o gráfico.

studio-optical-the-sites-their-cloud-climates = Os locais, seus climas de nebulosidade, as classes de relógio e as técnicas são entradas escolhidas para ilustrar e estão rotuladas como tal. Nenhum registro de disponibilidade medido foi comparado.

studio-replay-replay-controls = Controles de reprodução

studio-replay-previous-moment-page-up = Momento anterior (Page Up)

studio-replay-step-back = Voltar um passo

studio-replay-step-back-left-arrow = Voltar um passo (seta para a esquerda)

studio-replay-play-or-pause-space = Reproduzir ou pausar (Espaço)

studio-replay-step-forward = Avançar um passo

studio-replay-step-forward-right-arrow = Avançar um passo (seta para a direita)

studio-replay-next-moment-page-down = Próximo momento (Page Down)

studio-replay-replay-speed-mission-seconds-per = Velocidade de reprodução, segundos de missão por segundo

studio-replay-mission-clock-seconds-from-the = Relógio da missão, segundos desde o início de cada execução

studio-replay-bridge-replay = Reprodução da ponte

studio-replay-two-runs-one-clock-when = Duas execuções, um relógio: quando a ponte soube?

studio-replay-put-two-synthetic-runs-side = Coloque duas execuções sintéticas lado a lado e reproduza-as em um mesmo relógio da missão. Cada painel mostra onde a embarcação realmente estava em comparação com onde o receptor dizia que ela estava, a pontuação de confiança do motor e sua faixa ao longo do tempo, os satélites que o próprio registro lista (o céu fica em branco onde o registro não ouve nenhum) e um veredito ao fim da execução. Tudo o que é desenhado vem de um registro ou do resultado do motor para ele; nada é lido da rede.

studio-replay-save-animated-svg = Salvar SVG animado

studio-replay-save-frames-zip = Salvar quadros (ZIP)

studio-replay-opening-the-two-demo-runs = Abrindo as duas execuções de demonstração…

studio-replay-the-skyplot-is-the-log = O skyplot é o GSV do próprio registro: uma marca preenchida é um satélite com intensidade de sinal, uma vazada está listada sem ela, e um setor sombreado é uma faixa de azimute em que o registro lista satélites e não ouve nenhum deles. Um céu bloqueado e um sinal interferido ficam iguais aqui. Não é um perfil do horizonte, e a constelação é nominal, não efemérides para a data do registro.

studio-replay-position-error-is-the-logged = “Erro de posição” é a distância registrada entre a posição verdadeira e a informada; o anel ao redor da embarcação é essa distância desenhada em escala. O tempo desde o início de um evento até a primeira pontuação abaixo do nominal é uma subtração de dois instantes registrados, não um número de desempenho de detecção.

studio-replay-the-vessel-glyph-points-along = O ícone da embarcação aponta segundo o rumo da giro (HDT), que nenhum evento altera; o contorno tracejado é onde o receptor coloca a embarcação, ao longo do rumo que ele informa. Uma diferença entre os dois é uma pista para o debriefing.

studio-replay-the-coast-is-natural-earth = A costa é terra de domínio público da Natural Earth em 1:10 milhões, incluída nesta página (nada é baixado). As posições das demonstrações são inventadas, então a costa mostra onde essas coordenadas inventadas caem. Apenas ilustração, nunca para navegação.

studio-ssv-space-user-gnss-scenarios = Cenários de GNSS para usuários espaciais

studio-ssv-space-user-gnss = GNSS para usuários espaciais

studio-ssv-which-navigation-signals-can-a = Quais sinais de navegação uma espaçonave muito acima dos satélites GNSS ainda consegue usar?

studio-ssv-the-satellites-of-a-navigation = Os satélites de um sistema de navegação apontam para a Terra, então uma espaçonave acima deles ouve apenas o que escapa além do limbo ou vaza pelos lóbulos laterais. Esta página mostra o que o motor encontra em cinco casos: disponibilidade em uma camada à altitude geoestacionária, uma órbita muito elíptica, uma transferência lunar com um receptor de sinal fraco, um filtro de bordo e uma formação de duas espaçonaves. Cada número é copiado de um resultado que o motor registrou; a página o escala e o desenha, e não calcula mais nada.

studio-ssv-against-the-icg-booklet = Em comparação com o livreto do ICG

studio-tools-leave-empty-to-check-integrity = deixe vazio para verificar apenas a integridade

studio-tools-synthetic-osnma-example = Exemplo OSNMA sintético

studio-tools-trust-and-evidence-tools = Ferramentas de confiança e evidências

studio-tools-trust-evidence-and-test-tools = Ferramentas de confiança, evidências e teste

studio-tools-the-0-35-features-that = Os recursos da 0.35 que são executados no seu navegador e onde encontrar os que não podem ser. Os arquivos que você abre aqui são lidos nesta página e nunca enviados; o motor é executado no seu computador como WebAssembly.

studio-tools-maritime-trust = Confiança marítima

studio-tools-training-debrief = Debriefing de treinamento

studio-tools-the-engine-starts-when-you = O motor inicia quando você usa uma ferramenta.

studio-tools-every-0-35-feature-and = Todos os recursos da 0.35 e onde estão

studio-tools-in-this-browser-where-it = Neste navegador, onde pode ser executado. Os demais são recursos de linha de comando ou de servidor, e o motivo é informado.

studio-tools-in-the-studio = No Studio

studio-tools-verify-an-evidence-pack = Verificar um pacote de evidências

studio-tools-open-the-synthetic-example-pack = Abrir o pacote de exemplo sintético

studio-tools-open-it-with-one-byte = Abri-lo com um byte alterado

studio-tools-no-pack-files-chosen = Nenhum arquivo de pacote escolhido.

studio-tools-verify-the-pack = Verificar o pacote

studio-tools-attach-a-timestamp-token = Anexar um token de carimbo de tempo

studio-tools-attach-to-the-chosen-pack = Anexar ao pacote escolhido

studio-tools-export-a-scenario-for-a = Exportar um cenário para um simulador de laboratório

studio-tools-which-public-framework-rows-do = Para quais linhas de referenciais públicos suas execuções fornecem evidências em apoio?

studio-tools-use-the-synthetic-example-runs = Usar as execuções de exemplo sintéticas

studio-tools-show-the-mapping-tables = Mostrar as tabelas de correspondência

studio-tools-show-the-sources-they-cite = Mostrar as fontes que elas citam

studio-tools-no-result-files-chosen = Nenhum arquivo de resultado escolhido.

studio-tools-build-the-report = Gerar o relatório

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: os dados de navegação estão autenticados?

studio-tools-load-it = Carregá-lo

studio-tools-show-the-recorded-result = Mostrar o resultado registrado

studio-tools-imu-fit-sensor-parameters-for = Ajuste de IMU: parâmetros de sensor para os cenários híbridos e de fusão

studio-tools-fit-the-parameters = Ajustar os parâmetros

studio-tools-jammertest-score-a-receiver-log = Jammertest: pontuar um registro de receptor em relação ao plano de testes publicado

studio-tools-import-the-schedule = Importar o cronograma

studio-tools-score-the-log = Pontuar o registro

studio-training-synthetic-library-scenarios = Cenários sintéticos da biblioteca

studio-training-library-scenario-to-generate = Cenário da biblioteca a gerar

studio-training-random-seed-optional = Semente aleatória (opcional)

studio-training-from-the-scenario = do cenário

studio-training-time-cursor = Cursor de tempo

studio-training-replay-speed = Velocidade de reprodução

studio-training-time-cursor-in-log-rows = Cursor de tempo, em linhas do registro

studio-training-debrief-timeline-time-cursor = Linha do tempo do debriefing: cursor de tempo

studio-training-what-did-the-crew-see = O que a tripulação viu e o que realmente estava acontecendo?

studio-training-open-a-log = Abrir um registro

studio-training-choose-an-instructor-log-or = Escolha um registro de instrutor ou abra um dos cinco cenários sintéticos da biblioteca gravados pela CLI.

studio-training-or-drop-it-here-or = ou solte-o aqui, ou abra um cenário da biblioteca:

studio-training-generate-a-stream-here = Gerar um fluxo aqui

studio-training-run-the-engine-s-nmea = Execute neste navegador o gerador de treinamento NMEA do motor. Você obtém o fluxo NMEA 0183 sintético para o exercício e o registro do instrutor, e pode fazer o debriefing de imediato. Nada é enviado; a transmissão para um simulador de ponte por TCP ou UDP é um recurso de linha de comando (veja a página Ferramentas).

studio-training-previous-moment = Momento anterior

studio-training-next-moment = Próximo momento

studio-training-true-track-against-reported = Trajetória verdadeira em comparação com a informada

studio-training-north-up-one-scale-on = Norte para cima, uma única escala nos dois eixos. A linha cinza fina é onde a embarcação realmente estava. A linha colorida é o que o receptor informou, colorida conforme a distância em relação à realidade. Onde o receptor não informou posição, nada é desenhado.

studio-training-events-and-what-the-receiver = Eventos e o que o receptor disse

studio-training-one-shared-time-axis-drag = Um único eixo de tempo compartilhado. Arraste ou clique para mover o cursor; as teclas de seta o movem passo a passo. As barras de evento mostram a intensidade de cada evento injetado ao longo do tempo.

studio-training-sky-at-the-cursor = Céu no cursor

studio-training-the-satellites-the-stream-s = Os satélites que o próprio GSV do fluxo lista. Uma marca preenchida tem intensidade de sinal; uma vazada está listada sem ela; um setor sombreado é onde o fluxo lista satélites e nenhum é ouvido. Constelação nominal, não efemérides para a data do fluxo.

studio-training-at-the-cursor = No cursor

studio-training-events-injected = Eventos injetados

studio-training-as-the-instructor-log-states = Como o registro do instrutor os informa, com todos os parâmetros.

studio-training-debrief-timeline = Linha do tempo do debriefing

studio-training-choose-a-moment-to-move = Escolha um momento para mover o cursor até ele.

studio-training-the-satellite-sky-is-a = O céu de satélites é uma constelação nominal, não efemérides para a data do fluxo.

studio-training-nothing-here-is-a-measure = Nada aqui é uma medida de como qualquer receptor ou sistema se comporta diante de interferência.

studio-trust-session-settings-in-toml = Configurações de sessão em TOML

studio-trust-receiver-trust-session-settings-in = Configurações de sessão de confiança do receptor em TOML

studio-trust-time-cursor-and-filters = Cursor de tempo e filtros

studio-trust-time-cursor-in-epochs = Cursor de tempo, em épocas

studio-trust-score-timeline-time-cursor = Linha do tempo da pontuação: cursor de tempo

studio-trust-each-monitor-s-alarm-ratio = Proporção de alarmes de cada monitor ao longo do tempo

studio-trust-about-this-view = Sobre esta visualização

studio-trust-can-the-bridge-trust-this = A ponte pode confiar nesta posição?

studio-trust-open-a-run = Abrir uma execução

studio-trust-open-the-masked-sky-demo = Abrir a demonstração de céu mascarado (geometria, 0.36)

studio-trust-score-an-nmea-log-here = Pontuar um registro NMEA aqui

studio-trust-run-the-engine-in-this = Execute o motor neste navegador sobre um registro NMEA 0183 de uma embarcação e veja o resultado na visualização abaixo. O registro é lido nesta página e nunca enviado. Deve ser um trecho de no máximo 2 MiB (cerca de 20.000 épocas) e deve conter a janela de calibração de cinco minutos. As configurações são os limites da embarcação e os pesos da pontuação, como em um arquivo de sessão.

studio-trust-score-the-synthetic-demo-log = Pontuar o registro de demonstração sintético

studio-trust-session-settings-toml = Configurações de sessão (TOML)

studio-trust-starts-from-the-demo-s = Parte das configurações da demonstração: edite os limites de velocidade, aceleração e taxa de giro da embarcação para que correspondam aos seus. Um arquivo de configurações da sua própria embarcação pode ser colado aqui.

studio-trust-jammertest-scorecard = Placar do Jammertest

studio-trust-no-scorecard-open = Nenhum placar aberto.

studio-trust-generic-receiver-trust-run-not = Execução genérica de confiança do receptor (não de uma embarcação)

studio-trust-run-the-illustrative-jamming-example = Executar o exemplo ilustrativo de jamming

studio-trust-assess-the-chosen-file = Avaliar o arquivo escolhido

studio-trust-the-format-is-guessed-from = O formato é deduzido do nome do arquivo; altere-o aqui quando estiver errado e avalie de novo. NovAtel OEM7, RTCM 3 e Septentrio SBF são formatos binários; eles são enviados ao motor como estão, neste navegador.
