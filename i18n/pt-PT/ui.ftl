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

studio-geometry-kshana-home = Página inicial do Kshana

studio-geometry-back-to-the-studio = Voltar ao Studio

studio-geometry-step-the-time = Avançar o tempo

studio-geometry-draw-the-skyline = Desenhar a skyline

studio-geometry-skip-to-the-view = Saltar para a vista

studio-geometry-which-satellites-can-you-see = Que satélites se veem e qual é a qualidade da sua geometria?

studio-geometry-what-this-shows = O que isto mostra

studio-geometry-starting-the-engine = A iniciar o motor…

studio-geometry-every-setting-is-in-the = Todas as definições estão no endereço da página, pelo que uma ligação copiada abre o mesmo céu.

studio-geometry-offset-from-the-constellations-reference = Desvio face à época de referência das constelações

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Os seus próprios elementos orbitais (TLE)

studio-geometry-use-these-elements = Usar estes elementos

studio-geometry-back-to-the-presets = Voltar às predefinições

studio-geometry-clear-the-skyline = Limpar a skyline

studio-geometry-drag-on-the-skyplot-to = Arraste sobre o skyplot para desenhar a skyline (passos de 1° em azimute e 0,5° em elevação). Com o skyplot em foco: as setas Esquerda e Direita deslocam-se ao longo do horizonte (Shift para 10°), as setas Cima e Baixo elevam ou baixam aí a skyline (Shift para 5°) e Delete limpa-a.

studio-geometry-copy-a-link-to-this = Copiar uma ligação para este céu

studio-geometry-download-the-skyplot-svg = Descarregar o skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = Zénite ao centro, horizonte na periferia, norte para cima. As marcas preenchidas são satélites na solução; as marcas ocas estão ocultas pela máscara ou pela skyline, ou não são utilizadas.

studio-geometry-dilution-of-precision = Diluição da precisão

studio-geometry-how-much-the-geometry-multiplies = Quanto a geometria multiplica o erro de distância. Quanto mais baixo, melhor; cerca de 1 é excelente e acima de 6 é fraco.

studio-geometry-horizontal-position-error = Erro de posição horizontal

studio-geometry-satellites-as-a-table = Satélites, em tabela

studio-geometry-the-same-satellites-as-the = Os mesmos satélites do skyplot.

studio-geometry-azimuth = Azimute, °

studio-geometry-elevation = Elevação, °

studio-geometry-in-the-solution = Na solução

studio-geometry-the-engine-runs-here-as = O motor é executado aqui como WebAssembly. Nada é obtido de outro sítio e nada do que definir é enviado para parte alguma.

studio-holdover-holdover-test-scenarios = Cenários de ensaio de holdover

studio-holdover-holdover-test = Ensaio de holdover

studio-holdover-how-far-does-the-time = Até onde vai o erro de tempo quando o GNSS desaparece?

studio-holdover-opening-the-scenarios = A abrir os cenários…

studio-holdover-verdict-step-by-step = Veredicto, passo a passo

studio-holdover-time-error-over-the-record = Erro de tempo ao longo do registo

studio-holdover-the-three-phases-are-shaded = As três fases estão sombreadas; as linhas verticais tracejadas são os dois instantes indicados pelo operador. As linhas horizontais tracejadas são os limites das máscaras para o erro de tempo absoluto máximo, cada uma desenhada sobre o passo que a sua máscara nomeia, e a banda de recuperação; um triângulo assinala quando um orçamento ou o envelope de holdover ePRTC-A é excedido pela primeira vez.

studio-holdover-of-the-baseline-and-the = Da linha de base e do holdover; uma cruz é um limite de máscara no instante em que a sua verificação foi pior.

studio-holdover-the-same-two-steps-against = Os mesmos dois passos face aos limites de TDEV.

studio-holdover-the-numbers = Os números

studio-holdover-everything-below-is-the-engine = Tudo o que se segue é do motor, nas unidades que este indica.

studio-holdover-mask-checks = Verificações de máscara

studio-holdover-each-mask-is-measured-on = Cada máscara é medida no passo que a sua condição nomeia. Uma máscara que precisa de um registo mais longo do que o passo forneceu fica INCOMPLETE, nunca extrapolada; toda a entrada que uma Recomendação deixa para estudo posterior está ausente.

studio-holdover-what-this-does-not-cover = O que isto não abrange

studio-interference-cell-size-in-degrees-empty = Tamanho da célula em graus (vazio para 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Acerca desta página

studio-interference-interference-map = Mapa de interferência

studio-interference-where-did-position-reports-look = Onde pareceram degradados os relatórios de posição?

studio-interference-open-map-files = Abrir ficheiros de mapa

studio-interference-or-drop-them-here = ou largue-os aqui

studio-interference-open-the-synthetic-demo = Abrir a demonstração sintética

studio-interference-close-all-maps = Fechar todos os mapas

studio-interference-nothing-open-yet = Ainda nada aberto.

studio-interference-build-a-map-here = Construir um mapa aqui

studio-interference-build-from-the-synthetic-sample = Construir a partir da amostra sintética

studio-interference-route-exposure-here = Exposição do percurso aqui

studio-interference-use-the-synthetic-route = Usar o percurso sintético

studio-interference-reading-these-maps = Como ler estes mapas

studio-interference-maps-inherit-the-coverage-of = Os mapas herdam a cobertura da sua fonte: os recetores ADS-B voluntários deixam o mar alto pouco coberto, e os dados AIS abertos omitem algumas classes de embarcações. Leia as notas de cobertura de cada ficheiro.

studio-interference-no-coastline-or-basemap-is = Não é desenhada nenhuma linha de costa nem mapa de base e nada é obtido de qualquer servidor; a grelha é apenas de latitude e longitude.

studio-interference-no-identifier-of-any-aircraft = Nenhum identificador de qualquer aeronave ou embarcação consta destes ficheiros; as células com demasiado poucas aeronaves ou embarcações distintas não são publicadas de todo, e uma contagem AIS de um ou dois é retida.

studio-lunar-infra-lunar-infrastructure-scenarios = Cenários de infraestrutura lunar

studio-lunar-infra-lunar-infrastructure = Infraestrutura lunar

studio-lunar-infra-what-can-the-moon-s = O que podem a órbita e a superfície da Lua fazer como infraestrutura de navegação e geodésica, e onde ficam aquém?

studio-lunar-infra-five-studies-of-what-lunar = Cinco estudos sobre o que orbitadores lunares e uma estação de superfície lunar poderiam fazer em conjunto como infraestrutura de navegação e geodésica: determinação de órbita a partir de sinais GNSS terrestres face ao seguimento a partir do solo, fixação da fase da portadora entre uma estação de superfície e um orbitador, co-estimação do referencial lunar, ligação de GNSS, VLBI e telemetria laser num mesmo veículo espacial, e a sensibilidade da telemetria laser e do seguimento às marés e à libração da Lua. As entradas são ilustrativas e o modelo é restrito; quando um estudo falhou o limiar contra o qual foi pré-registado, esta página di-lo. Cada número é copiado de um resultado que o motor registou; a página escala-o e desenha-o, e não calcula mais nada.

studio-lunar-infra-what-the-result-holds = O que o resultado contém

studio-lunar-infra-findings-disclosures-and-what-was = Constatações, divulgações e o que não foi verificado

studio-lunar-what-these-figures-are = O que são estes valores

studio-lunar-map-key = Legenda do mapa

studio-lunar-lunar-station = Estação lunar

studio-lunar-what-accuracy-could-a-reference = Que exatidão poderia dar uma estação de referência junto ao polo sul lunar, e onde?

studio-lunar-the-constellation-its-signal-in = A constelação, o seu erro do sinal no espaço, o erro de levantamento da estação, a latência da correção e a quantização da ligação são entradas indicadas no ficheiro do cenário, cada uma com a sua fonte ou marcada como ilustrativa. Nenhum valor aqui foi verificado face a uma estação real ou a dados de voo.

studio-lunar-the-source-and-every-input = A fonte e cada entrada que alterar estão no endereço da página, pelo que uma ligação copiada abre o mesmo estudo.

studio-lunar-a-result-file-is-the = Um ficheiro de resultado é o JSON que o motor escreve para este tipo (a saída JSON da linha de comandos, ou uma execução guardada a partir daqui). É lido nesta página; nada é enviado.

studio-lunar-each-field-shows-the-scenario = Cada campo mostra o valor do ficheiro do cenário até o alterar. Um dia de épocas sobre toda a grelha demora algum tempo: menos ensaios ou um passo de tempo maior executam mais depressa.

studio-lunar-run-it-here = Executar aqui

studio-lunar-back-to-the-file-s = Voltar aos valores do ficheiro

studio-lunar-copy-a-link = Copiar uma ligação

studio-lunar-save-this-result-json = Guardar este resultado (JSON)

studio-lunar-corrected-error-over-the-south = Erro corrigido sobre a região polar sul

studio-lunar-south-polar-stereographic-the-pole = Estereográfica polar sul: o polo ao centro, a borda da grelha na periferia, longitude 0° para cima, 90° este para a direita. Cada célula é um ponto da grelha; a linha grossa é onde o erro corrigido cruza o limiar, e a linha tracejada é o raio de cobertura por azimute.

studio-lunar-region-figures = Valores da região

studio-lunar-over-the-whole-grid-means = Sobre toda a grelha: médias ponderadas pela área e o pior ponto.

studio-lunar-coverage-radius-per-azimuth = Raio de cobertura por azimute

studio-lunar-along-each-bearing-from-the = Ao longo de cada rumo a partir da estação, a distância a que a cobertura desce pela primeira vez abaixo de 95 %.

studio-lunar-as-a-table = Em tabela

studio-lunar-radius-km = Raio, km

studio-lunar-at-the-grid-edge = Na borda da grelha

studio-lunar-points-along-it = Pontos ao longo dela

studio-lunar-an-epoch-is-unavailable-at = Uma época fica indisponível num ponto quando o utilizador vê menos de quatro satélites, ou a estação não vê todos os satélites que o utilizador usa; não é calculado nenhum erro para ela.

studio-lunar-grid-points-as-a-table = Pontos da grelha, em tabela

studio-lunar-the-same-points-as-the = Os mesmos pontos do mapa, começando pelo mais próximo da estação.

studio-lunar-latitude = Latitude, °

studio-lunar-longitude = Longitude, °

studio-lunar-from-the-station-km = Desde a estação, km

studio-lunar-corrected-error = Erro corrigido

studio-lunar-uncorrected-error = Erro não corrigido

studio-lunar-hpl-median = Mediana do HPL

studio-lunar-the-engine-s-statement-inputs = A declaração do motor, as entradas e o balanço da ligação

studio-lunar-inputs-as-the-engine-read = Entradas, tal como o motor as leu

studio-lunar-error-model = Modelo de erro

studio-lunar-correction-link-budget-at-the = Balanço da ligação de correção na estação e no pior ponto

studio-observatory-previous-day = Dia anterior

studio-observatory-day-opened = Dia aberto

studio-observatory-next-day = Dia seguinte

studio-observatory-interference-observatory = Observatório de interferência

studio-observatory-what-did-one-day-s = Qual foi o aspeto dos relatórios de posição de um dia?

studio-observatory-the-observatory-writes-a-few = O observatório escreve alguns ficheiros por cada dia UTC e região: as células da grelha com um de três estados, uma lista de incidentes e um manifesto. Abra aqui os ficheiros que produziu e leia-os. A página não calcula nada e mostra apenas o que os ficheiros dizem. Não inclui dados do observatório, não obtém nada e não envia nada.

studio-observatory-open-a-day = Abrir um dia

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Os três estados

studio-observatory-the-picture-the-observatory-wrote = A imagem que o observatório escreveu

studio-observatory-the-png-you-opened-as = O PNG que abriu, tal como está. As células que não estão desenhadas não foram observadas.

studio-observatory-cells-drawn-from-the-file = Células, desenhadas a partir do ficheiro

studio-observatory-plate-carr-eacute-e-no = Plate carrée, sem mapa de base. Passe o cursor sobre uma célula, ou use a tabela, para ver o seu estado e as contagens. Um lugar sem célula não foi observado.

studio-observatory-hover-or-focus-a-cell = Passe o cursor sobre uma célula ou ponha-a em foco para ver o seu estado.

studio-observatory-every-cell-in-the-file = Todas as células do ficheiro

studio-observatory-a-count-the-file-withholds = Uma contagem que o ficheiro retém (menos de 5 aeronaves) aparece como “retida”, nunca como 0.

studio-observatory-files-and-their-hashes = Ficheiros e respetivos hashes

studio-observatory-dataset-licence-and-notice = Conjunto de dados, licença e aviso

studio-observatory-what-this-page-does-and = O que esta página mostra e não mostra

studio-observatory-products-are-released-at-least = Os produtos são divulgados pelo menos 24 horas após o fim do dia UTC, em células de 0,5 graus ou mais grosseiras. Nunca é uma vista em direto e nunca diz “agora”.

studio-observatory-it-shows-no-cause-no = Não mostra nenhuma causa, nenhum país, nenhuma força nem nenhuma fonte de interferência, nenhum alerta, nenhuma comparação entre lugares ou dias, e nenhum AIS. O ADS-B e o AIS nunca são combinados.

studio-observatory-the-page-ships-none-of = A página não inclui nenhum dos produtos do observatório. Publicá-los é decisão do proprietário.

studio-optical-optical-atmosphere-scenarios = Cenários de atmosfera ótica

studio-optical-optical-pnt = PNT ótico

studio-optical-can-an-optical-link-get = Pode uma ligação ótica atravessar o mau tempo?

studio-optical-the-link = A ligação

studio-optical-sites-as-the-engine-states = Locais, tal como o motor os indica

studio-optical-inputs-are-marked-everything-else = As entradas estão assinaladas; tudo o resto é a saída do motor para elas.

studio-optical-it-draws-only-what-the = Desenha apenas o que o motor registou para cada cenário, incluindo a sua série temporal com semente. A página não calcula nada: escala os números do motor para o gráfico.

studio-optical-the-sites-their-cloud-climates = Os locais, os seus climas de nuvens, as classes de relógio e as técnicas são entradas escolhidas para ilustrar, e estão rotuladas como tal. Nenhum registo de disponibilidade medida foi comparado.

studio-replay-replay-controls = Controlos de repetição

studio-replay-previous-moment-page-up = Momento anterior (Page Up)

studio-replay-step-back = Recuar um passo

studio-replay-step-back-left-arrow = Recuar um passo (seta Esquerda)

studio-replay-play-or-pause-space = Reproduzir ou pausar (Espaço)

studio-replay-step-forward = Avançar um passo

studio-replay-step-forward-right-arrow = Avançar um passo (seta Direita)

studio-replay-next-moment-page-down = Momento seguinte (Page Down)

studio-replay-replay-speed-mission-seconds-per = Velocidade de repetição, segundos de missão por segundo

studio-replay-mission-clock-seconds-from-the = Relógio da missão, segundos desde o início de cada execução

studio-replay-bridge-replay = Repetição da ponte

studio-replay-two-runs-one-clock-when = Duas execuções, um relógio: quando soube a ponte?

studio-replay-put-two-synthetic-runs-side = Ponha duas execuções sintéticas lado a lado e reproduza-as num único relógio da missão. Cada painel mostra onde a embarcação esteve realmente face a onde o recetor disse que estava, a pontuação de confiança e a banda do motor ao longo do tempo, os satélites que o próprio registo lista (o céu fica em branco onde o registo não ouve nenhum) e um veredicto quando a execução termina. Tudo o que é desenhado provém de um registo ou do resultado do motor para ele; nada é lido da rede.

studio-replay-save-animated-svg = Guardar SVG animado

studio-replay-save-frames-zip = Guardar fotogramas (ZIP)

studio-replay-opening-the-two-demo-runs = A abrir as duas execuções de demonstração…

studio-replay-the-skyplot-is-the-log = O skyplot é o GSV do próprio registo: uma marca preenchida é um satélite com intensidade de sinal, uma marca oca está listada sem nenhuma, e um setor sombreado é um intervalo de azimute onde o registo lista satélites e não ouve nenhum deles. Um céu bloqueado e um sinal sujeito a jamming parecem iguais aqui. Não é uma skyline, e a constelação é nominal, não efemérides para a data do registo.

studio-replay-position-error-is-the-logged = «Erro de posição» é a distância registada entre a posição verdadeira e a comunicada; o anel em torno da embarcação é essa distância desenhada à escala. O tempo desde o início de um evento até à primeira pontuação abaixo do nominal é uma subtração de dois instantes registados, não um valor de desempenho de deteção.

studio-replay-the-vessel-glyph-points-along = O glifo da embarcação aponta ao longo da proa giroscópica (HDT), que nenhum evento afeta; o contorno tracejado é onde o recetor coloca a embarcação, ao longo do rumo que comunica. Uma diferença entre os dois é uma pista para o debriefing.

studio-replay-the-coast-is-natural-earth = A costa é a terra de domínio público da Natural Earth a 1:10 milhões, incluída nesta página (nada é obtido). As posições das demonstrações são inventadas, pelo que a costa mostra onde caem essas coordenadas inventadas. Apenas ilustração, nunca para navegação.

studio-ssv-space-user-gnss-scenarios = Cenários de GNSS para utilizadores no espaço

studio-ssv-space-user-gnss = GNSS para utilizadores no espaço

studio-ssv-which-navigation-signals-can-a = Que sinais de navegação pode ainda usar um veículo espacial muito acima dos satélites GNSS?

studio-ssv-the-satellites-of-a-navigation = Os satélites de um sistema de navegação apontam para a Terra, pelo que um veículo espacial acima deles ouve apenas o que passa para além do limbo ou vaza pelos lóbulos laterais. Esta página mostra o que o motor encontra para cinco casos: disponibilidade numa camada à altitude geoestacionária, uma órbita muito elíptica, uma transferência lunar com um recetor de sinal fraco, um filtro de bordo e uma formação de dois veículos espaciais. Cada número é copiado de um resultado que o motor registou; a página escala-o e desenha-o, e não calcula mais nada.

studio-ssv-against-the-icg-booklet = Face ao livreto do ICG

studio-tools-leave-empty-to-check-integrity = deixe vazio para verificar apenas a integridade

studio-tools-synthetic-osnma-example = Exemplo OSNMA sintético

studio-tools-trust-and-evidence-tools = Ferramentas de confiança e de evidências

studio-tools-trust-evidence-and-test-tools = Ferramentas de confiança, de evidências e de ensaio

studio-tools-the-0-35-features-that = As funcionalidades da 0.35 que correm no seu navegador, e onde encontrar as que não podem. Os ficheiros que abre aqui são lidos nesta página e nunca enviados; o motor corre no seu computador como WebAssembly.

studio-tools-maritime-trust = Confiança marítima

studio-tools-training-debrief = Debriefing de treino

studio-tools-the-engine-starts-when-you = O motor arranca quando utiliza uma ferramenta.

studio-tools-every-0-35-feature-and = Cada funcionalidade da 0.35 e onde está

studio-tools-in-this-browser-where-it = Neste navegador, onde pode ser executada. As restantes são funcionalidades de linha de comandos ou de servidor, e a razão é indicada.

studio-tools-in-the-studio = No Studio

studio-tools-verify-an-evidence-pack = Verificar um pacote de evidências

studio-tools-open-the-synthetic-example-pack = Abrir o pacote de exemplo sintético

studio-tools-open-it-with-one-byte = Abri-lo com um byte alterado

studio-tools-no-pack-files-chosen = Nenhum ficheiro de pacote escolhido.

studio-tools-verify-the-pack = Verificar o pacote

studio-tools-attach-a-timestamp-token = Anexar um token de marca temporal

studio-tools-attach-to-the-chosen-pack = Anexar ao pacote escolhido

studio-tools-export-a-scenario-for-a = Exportar um cenário para um simulador de laboratório

studio-tools-which-public-framework-rows-do = Para que linhas do referencial público as suas execuções fornecem elementos de prova em apoio de?

studio-tools-use-the-synthetic-example-runs = Usar as execuções de exemplo sintéticas

studio-tools-show-the-mapping-tables = Mostrar as tabelas de correspondência

studio-tools-show-the-sources-they-cite = Mostrar as fontes que citam

studio-tools-no-result-files-chosen = Nenhum ficheiro de resultado escolhido.

studio-tools-build-the-report = Construir o relatório

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: os dados de navegação estão autenticados?

studio-tools-load-it = Carregá-lo

studio-tools-show-the-recorded-result = Mostrar o resultado registado

studio-tools-imu-fit-sensor-parameters-for = Ajuste de IMU: parâmetros de sensor para os cenários híbridos e de fusão

studio-tools-fit-the-parameters = Ajustar os parâmetros

studio-tools-jammertest-score-a-receiver-log = Jammertest: pontuar um registo de recetor face ao plano de ensaio publicado

studio-tools-import-the-schedule = Importar o calendário

studio-tools-score-the-log = Pontuar o registo

studio-training-synthetic-library-scenarios = Cenários sintéticos da biblioteca

studio-training-library-scenario-to-generate = Cenário da biblioteca a gerar

studio-training-random-seed-optional = Semente aleatória (opcional)

studio-training-from-the-scenario = do cenário

studio-training-time-cursor = Cursor de tempo

studio-training-replay-speed = Velocidade de repetição

studio-training-time-cursor-in-log-rows = Cursor de tempo, em linhas do registo

studio-training-debrief-timeline-time-cursor = Cronologia do debriefing: cursor de tempo

studio-training-what-did-the-crew-see = O que viu a tripulação e o que estava realmente a acontecer?

studio-training-open-a-log = Abrir um registo

studio-training-choose-an-instructor-log-or = Escolha um registo do instrutor ou abra um dos cinco cenários sintéticos da biblioteca escritos pela CLI.

studio-training-or-drop-it-here-or = ou largue-o aqui, ou abra um cenário da biblioteca:

studio-training-generate-a-stream-here = Gerar um fluxo aqui

studio-training-run-the-engine-s-nmea = Execute o gerador de treino NMEA do motor neste navegador. Obtém o fluxo NMEA 0183 sintético para o exercício e o registo do instrutor, e pode fazer logo o debriefing. Nada é enviado; transmitir para um simulador de ponte por TCP ou UDP é uma funcionalidade de linha de comandos (ver a página Ferramentas).

studio-training-previous-moment = Momento anterior

studio-training-next-moment = Momento seguinte

studio-training-true-track-against-reported = Trajetória verdadeira face à comunicada

studio-training-north-up-one-scale-on = Norte para cima, uma só escala nos dois eixos. A linha cinzenta fina é onde a embarcação esteve realmente. A linha colorida é o que o recetor comunicou, colorida consoante a distância à verdade. Onde o recetor não comunicou nenhuma solução de posição, nada é desenhado para ele.

studio-training-events-and-what-the-receiver = Eventos e o que o recetor disse

studio-training-one-shared-time-axis-drag = Um eixo de tempo partilhado. Arraste ou clique para mover o cursor; as teclas de seta avançam-no passo a passo. As barras de evento mostram a intensidade de cada evento injetado ao longo do tempo.

studio-training-sky-at-the-cursor = Céu no cursor

studio-training-the-satellites-the-stream-s = Os satélites que o próprio GSV do fluxo lista. Uma marca preenchida tem intensidade de sinal; uma marca oca está listada sem nenhuma; um setor sombreado é onde o fluxo lista satélites e nenhum é ouvido. Constelação nominal, não efemérides para a data do fluxo.

studio-training-at-the-cursor = No cursor

studio-training-events-injected = Eventos injetados

studio-training-as-the-instructor-log-states = Tal como o registo do instrutor os indica, com todos os parâmetros.

studio-training-debrief-timeline = Cronologia do debriefing

studio-training-choose-a-moment-to-move = Escolha um momento para mover o cursor para ele.

studio-training-the-satellite-sky-is-a = O céu de satélites é uma constelação nominal, não efemérides para a data do fluxo.

studio-training-nothing-here-is-a-measure = Nada aqui é uma medida do desempenho de qualquer recetor ou sistema face a interferência.

studio-trust-session-settings-in-toml = Definições da sessão em TOML

studio-trust-receiver-trust-session-settings-in = Definições da sessão de confiança do recetor em TOML

studio-trust-time-cursor-and-filters = Cursor de tempo e filtros

studio-trust-time-cursor-in-epochs = Cursor de tempo, em épocas

studio-trust-score-timeline-time-cursor = Cronologia da pontuação: cursor de tempo

studio-trust-each-monitor-s-alarm-ratio = Razão de alarme de cada monitor ao longo do tempo

studio-trust-about-this-view = Acerca desta vista

studio-trust-can-the-bridge-trust-this = Pode a ponte confiar nesta solução de posição?

studio-trust-open-a-run = Abrir uma execução

studio-trust-open-the-masked-sky-demo = Abrir a demonstração de céu mascarado (geometria, 0.36)

studio-trust-score-an-nmea-log-here = Pontuar aqui um registo NMEA

studio-trust-run-the-engine-in-this = Execute o motor neste navegador sobre um registo NMEA 0183 de uma embarcação e veja o resultado na vista abaixo. O registo é lido nesta página e nunca enviado. Tem de ser um excerto de, no máximo, 2 MiB (cerca de 20 000 épocas) e conter a janela de calibração de cinco minutos. As definições são os limites da embarcação e os pesos da pontuação, como num ficheiro de sessão.

studio-trust-score-the-synthetic-demo-log = Pontuar o registo de demonstração sintético

studio-trust-session-settings-toml = Definições da sessão (TOML)

studio-trust-starts-from-the-demo-s = Parte das definições da demonstração: edite os limites de velocidade, aceleração e taxa de viragem da embarcação para corresponderem aos seus. Pode colar aqui um ficheiro de definições da sua própria embarcação.

studio-trust-jammertest-scorecard = Pontuação do Jammertest

studio-trust-no-scorecard-open = Nenhuma pontuação aberta.

studio-trust-generic-receiver-trust-run-not = Execução genérica de confiança do recetor (não de uma embarcação)

studio-trust-run-the-illustrative-jamming-example = Executar o exemplo ilustrativo de jamming

studio-trust-assess-the-chosen-file = Avaliar o ficheiro escolhido

studio-trust-the-format-is-guessed-from = O formato é deduzido do nome do ficheiro; altere-o aqui quando estiver errado e avalie de novo. NovAtel OEM7, RTCM 3 e Septentrio SBF são formatos binários; são enviados ao motor tal como estão, neste navegador.

studio-trust-imu-file-optional-a-second = Ficheiro IMU (opcional): um segundo sensor para a proa

studio-trust-an-imu-log-on-the = Um registo IMU no relógio do registo do recetor preenche a proa que o monitor de proa face ao rumo lê onde quer que o registo do recetor não traga nenhuma. Só uma sessão de embarcação o utiliza.

studio-trust-remove-the-imu-file = Remover o ficheiro IMU

studio-trust-no-imu-file = Sem ficheiro IMU.

studio-trust-session-settings-toml-the-log = Definições da sessão (TOML, o registo é fornecido em linha)

studio-trust-first-deduction = Primeira dedução

studio-trust-first-untrusted = Primeira não fiável

studio-trust-receiver-reported-track = Trajetória comunicada pelo recetor

studio-trust-the-satellites-the-log-s = Os satélites que o próprio GSV do registo lista. Uma marca preenchida tem intensidade de sinal; uma marca oca está listada sem nenhuma; um setor sombreado é onde o registo lista satélites e não ouve nenhum deles (um céu bloqueado e um sinal sujeito a jamming parecem iguais aqui). Constelação nominal, não efemérides para a data do registo.

studio-trust-score-over-time = Pontuação ao longo do tempo

studio-trust-score-0-to-100-dashed = Pontuação de 0 a 100. As linhas tracejadas são os limites das bandas; as faixas por baixo são a banda e a porta. Arraste ou clique para mover o cursor de tempo; as teclas de seta avançam-no passo a passo.

studio-trust-reasons-at-the-cursor = Motivos no cursor

studio-trust-points-each-check-took-off = Pontos que cada verificação retirou nesta época, do maior para o menor. Clique numa verificação para assinalar onde esteve acima do seu início.

studio-trust-geometry-at-the-cursor = Geometria no cursor

studio-trust-the-satellite-geometry-always-shown = A geometria dos satélites, sempre mostrada: a sua etiqueta (boa, razoável ou fraca) e os DOP. Um céu mascarado (um casco, um cais, uma parede de fiorde) é degradação natural, distinguida da inconsistência semelhante a um ataque. A pontuação retira pontos pela geometria apenas quando esta é fraca, no máximo 15, e nunca abaixo da banda degradada.

studio-trust-the-receiver-s-own-flag = O indicador do próprio recetor

studio-trust-what-the-receiver-itself-says = O que o próprio recetor diz sobre spoofing e jamming (u-blox UBX-NAV-STATUS e UBX-SEC-SIG), posto ao lado dos monitores do Kshana. Os códigos são do recetor; nenhum dos detetores é a verdade de referência, e a concordância não é validação. O indicador não altera nenhuma pontuação.

studio-trust-over-the-run = Ao longo da execução

studio-trust-what-the-score-used = O que a pontuação usou

studio-trust-read-from-the-run-read = Lido da execução, só de leitura.

studio-trust-what-this-view-does-and = O que esta vista mostra e não mostra

studio-trust-nmea-only-checks-cannot-see = As verificações apenas de NMEA não conseguem ver um spoofer que reproduza toda a constelação com uma posição, velocidade, proa, potência e relógio autoconsistentes, nem uma repetição de sinais reais gravados. Uma solução de posição sem alarme não é, por isso, uma boa solução de posição.

studio-trust-nothing-on-this-page-is = Nada nesta página é uma medida do desempenho das verificações perante interferência real. O mapeamento da pontuação e cada peso são fixados antes de um registo ser pontuado, sem aprendizagem e sem nada ajustado a eventos.

studio-main-which-satellites-can-you-see = Que satélites se veem a partir de um lugar e qual é a qualidade da sua geometria? Skyplot, skyline e DOP do motor no seu navegador

studio-main-trainer-debrief-for-kshana-nmea = Debriefing do formador para os registos de instrutor de kshana nmea-scenario (apenas para treino; os ficheiros ficam no seu navegador)

studio-main-where-did-aircraft-and-ships = Onde comunicaram aeronaves e navios dados de navegação degradados num dia passado? Abra ficheiros de mapa por dia (ficam no seu navegador)

studio-main-can-the-bridge-trust-this = Pode a ponte confiar nesta solução de posição? Abra uma execução de confiança do recetor de uma embarcação (os ficheiros ficam no seu navegador)

studio-main-evidence-packs-test-bench-export = Pacotes de evidências, exportação test-bench, mapeamento de compliance, OSNMA, ferramentas de linha de comandos e o assistente de IA (os ficheiros ficam no seu navegador)

studio-main-map-of-satellites-in-view = Mapa dos satélites à vista sobre a Terra, a partir da execução registada

studio-main-interactive-3-d-view-of = Vista 3D interativa da trajetória propagada

studio-main-close-history = Fechar o histórico

studio-main-skip-to-the-content = Saltar para o conteúdo

studio-main-receiver-trust = Confiança do recetor

studio-main-advanced-view = Vista avançada

studio-main-what-would-you-like-to = O que gostaria de descobrir?

studio-main-pick-a-question-or-start = Escolha uma pergunta ou parta do resultado abaixo.

studio-main-showing-below = Mostrado abaixo

studio-main-integrity-over-12-hours = Integridade ao longo de 12 horas

studio-main-a-radio-waterfall = Uma cascata de rádio

studio-main-recorded-result = Resultado registado

studio-main-how-many-navigation-satellites-can = Quantos satélites de navegação se veem a partir de qualquer ponto da Terra?

studio-main-loading-the-recorded-result = A carregar o resultado registado…

studio-main-everything-kshana-can-do = Tudo o que o Kshana pode fazer

studio-main-each-area-shows-a-real = Cada área mostra um resultado real registado e a combinação de evidências que o sustenta.

studio-main-open-your-own-files = Abra os seus próprios ficheiros

studio-main-pages-that-run-the-engine = Páginas que executam o motor com as suas próprias definições e ficheiros. Cada uma funciona neste navegador; nada é enviado.

studio-main-which-satellites-can-you-see-2 = Que satélites se veem a partir de um lugar e qual é a qualidade da sua geometria? Desenhe a skyline.

studio-main-what-accuracy-could-a-reference = Que exatidão poderia dar uma estação de referência junto ao polo sul lunar, e onde? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Pode a ponte confiar nesta solução de posição? Pontue um registo NMEA de uma embarcação.

studio-main-where-aircraft-and-ships-reported = Onde aeronaves e navios comunicaram dados de navegação degradados, e a exposição de um percurso.

studio-main-generate-a-drift-or-jamming = Gere um fluxo de exercício de deriva ou de jamming e faça o debriefing do registo do instrutor.

studio-main-two-synthetic-runs-on-one = Duas execuções sintéticas num só relógio: trajetória, pontuação de confiança, skyplot em direto e o veredicto.

studio-main-the-two-optical-atmosphere-scenarios = Os dois cenários de atmosfera ótica: disponibilidade face ao teto de nuvens, interrupções e diversidade de locais.

studio-main-which-navigation-signals-a-spacecraft = Que sinais de navegação pode ainda usar um veículo espacial muito acima dos satélites, e como se saem com eles um filtro de bordo e uma formação.

studio-main-what-lunar-orbiters-and-a = O que podem fazer orbitadores lunares e uma estação de superfície como infraestrutura de navegação e geodésica, com as falhas indicadas.

studio-main-open-a-day-s-observatory = Abra os ficheiros do observatório de um dia e leia-os: três estados, nenhuma causa, nada enviado.

studio-main-pull-the-antenna-score-the = Retire a antena, pontue o holdover: um registo de erro de tempo medido face às máscaras da ITU-T.

studio-main-check-a-signed-pack-or = Verifique um pacote assinado ou anexe uma marca temporal.

studio-main-motion-and-event-files-for = Ficheiros de movimento e de eventos para um simulador de laboratório.

studio-main-what-your-runs-evidence-against = Aquilo para que as suas execuções fornecem elementos de prova face a referenciais publicados.

studio-main-whether-recorded-galileo-data-is = Se os dados Galileo registados estão autenticados, etiqueta a etiqueta.

studio-main-use-kshana-from-your-assistant = Utilize o Kshana a partir do seu assistente através do servidor MCP.

studio-main-all-scenarios = Todos os cenários

studio-main-pick-one-it-opens-on = Escolha um: abre logo no seu resultado.

studio-main-all-questions = Todas as perguntas

studio-main-every-published-figure = Cada valor publicado

studio-main-read-from-the-result-document = Lido do documento de resultado com a unidade, a nota e a proveniência que o motor regista para cada um.

studio-main-kalman-self-consistency = Autoconsistência do Kalman

studio-main-a-consistent-filter-s-reported = A incerteza comunicada por um filtro consistente corresponde aos seus erros reais. O NIS (inovação normalizada ao quadrado) deve ficar perto de 1 e o NEES (erro de estimação normalizado ao quadrado) perto de 2, cada um dentro da sua banda χ² de 95%.

studio-main-engine-chart = Gráfico do motor

studio-main-each-series-this-run-publishes = Cada série que esta execução publica, face ao tempo. Passe o cursor ou arraste sobre o gráfico para ler os valores.

studio-main-carrier-to-noise-density-db = densidade portadora-ruído, dB-Hz

studio-main-with-the-jammer = Com o jammer

studio-main-without-it = Sem ele

studio-main-each-cell-is-one-satellite = Cada célula é um satélite numa época desta execução. As células tracejadas estão abaixo do limiar de seguimento do recetor: esse satélite está perdido.

studio-main-interference-outcome = Resultado da interferência

studio-main-error-since-gnss-was-lost = erro desde que o GNSS se perdeu

studio-main-scenario-budget = Orçamento do cenário

studio-main-move-the-budget-and-the = Mova o orçamento e o tempo até à violação é lido do próprio registo de erro desta execução. O valor de holdover do motor, calculado ao orçamento do cenário, é mostrado ao lado e é o número de referência. Altere o relógio ou a interrupção nos parâmetros para executar de novo a física.

studio-main-maximum-time-interval-error = erro máximo de intervalo de tempo

studio-main-time-deviation = desvio de tempo

studio-main-mask-checks-and-holdover-budgets = Verificações de máscara e orçamentos de holdover

studio-main-each-check-s-limit-is = O limite de cada verificação é desenhado como um anel no tempo de média em que a margem foi pior. As máscaras são transcritas das Recomendações da ITU-T (União Internacional das Telecomunicações, Setor de Normalização das Telecomunicações) indicadas em cada linha.

studio-main-lower-is-better-fractional-frequency = Quanto mais baixo, melhor. Estabilidade de frequência fracionária face ao tempo de média τ, em eixos logarítmicos.

studio-main-earth-centred-inertial-frame = Referencial inercial centrado na Terra

studio-main-drag-to-rotate-scroll-to = Arraste para rodar, use a roda para ampliar.

studio-main-run-the-engine-once-per = Execute o motor uma vez por valor e represente uma figura de mérito. Adicione um segundo parâmetro para um mapa de calor. Cada ponto é uma execução real do motor, até 60.

studio-main-pinned-runs-side-by-side = execuções fixadas lado a lado

studio-main-clear-pins = Limpar fixações

studio-main-key-figures-run-against-run = Valores principais, execução a execução

studio-main-the-headline-readouts-of-each = As leituras principais de cada execução fixada; a variação é face à execução A.

studio-main-the-engine-s-own-export = a exportação do próprio motor

studio-main-written-by-the-engine = escrito pelo motor

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, efemérides STK, SigMF

studio-main-try-other-settings = Experimentar outras definições

studio-main-change-a-value-then-run = Altere um valor e execute de novo. A resposta e o gráfico atualizam-se no lugar.

studio-main-run-again = Executar de novo

studio-main-cancel-the-run = Cancelar a execução

studio-main-runs-in-your-browser-nothing = Executa no seu navegador. Nada é enviado.

studio-main-advanced-settings = Definições avançadas

studio-main-every-setting-comes-from-the = Todas as definições vêm do ficheiro do cenário. Edite o ficheiro inteiro em “Para investigadores”.

studio-main-how-this-is-computed = Como isto é calculado

studio-main-level-of-evidence = Nível de evidência

studio-main-the-engine-s-own-one = O resumo de uma linha do próprio motor

studio-main-every-figure-is-labelled-with = Cada valor está rotulado com o seu nível de evidência. Validado significa verificado face a uma referência externa independente; modelado significa física de primeiros princípios com testes, ainda não verificada face a uma referência.

studio-main-for-researchers = Para investigadores

studio-main-code-data-citation = código, dados, citação

studio-main-run-it-on-your-computer = Execute-o no seu computador

studio-main-run-it-from-python = Execute-o a partir de Python

studio-main-exported-figures-carry-this-doi = Os valores exportados trazem este DOI (identificador de objeto digital) na legenda. O mesmo cenário, a mesma semente e a mesma versão do motor dão os mesmos números.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = No editor, Tab avança a indentação em dois espaços. Prima Escape e depois Tab para seguir em frente. Execute de novo para usar a sua edição.

studio-main-every-panel-and-field = Todos os painéis e campos

studio-main-the-advanced-view-is-the = A vista avançada é o painel completo: todos os painéis desta execução lado a lado, todos os campos do cenário, varrimentos, comparações e o relatório do próprio motor. Abre neste cenário, com as suas definições.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Pedir uma avaliação

studio-main-talk-to-us-about-a = Fale connosco sobre uma licença comercial

studio-main-request-a-study = Pedir um estudo

studio-main-imagery-nasa-visible-earth-blue = Imagens: NASA Visible Earth (Blue Marble). Linhas de costa: Natural Earth. Cada gráfico aqui é desenhado a partir de uma execução do motor; uma execução, relatório, animação ou exportação feita pelo motor nativo de linha de comandos está rotulada como registada.

studio-main-this-session = esta sessão

studio-main-runs-you-make-appear-here = As execuções que fizer aparecem aqui. Selecione uma para recuperar o seu cenário e resultado, ou fixe-a para comparar.

studio-advanced-find-a-scenario-a-domain = Encontrar um cenário, um domínio, um campo ou um comando

studio-advanced-the-runs-you-made-in = As execuções que fez nesta sessão

studio-advanced-a-short-tour-of-the = Uma breve visita guiada ao Studio

studio-advanced-toggle-colour-theme = Alternar o tema de cor

studio-advanced-switch-to-the-simple-view = Mudar para a vista simples

studio-advanced-the-simple-view-the-answer = A vista simples: primeiro a resposta, cinco definições, detalhes a pedido

studio-advanced-scenario-library = Biblioteca de cenários

studio-advanced-close-the-library = Fechar a biblioteca

studio-advanced-find-a-scenario-a-domain-2 = Encontrar um cenário, um domínio ou um campo

studio-advanced-scenario-domain-or-field = Cenário, domínio ou campo

studio-advanced-filter-by-domain = Filtrar por domínio

studio-advanced-scenarios-by-mission-domain = Cenários por domínio de missão

studio-advanced-how-the-studio-works = Como funciona o Studio

studio-advanced-search-scenarios-domains-or-fields = Pesquisar cenários, domínios ou campos

studio-advanced-search-scenarios-domains-or-fields-2 = Pesquisar cenários, domínios ou campos, por exemplo máscara de elevação

studio-advanced-the-engine-kind-this-scenario = O tipo de motor que este cenário executa

studio-advanced-open-the-scenario-library = Abrir a biblioteca de cenários

studio-advanced-show-the-parameters-and-the = Mostrar os parâmetros e a fonte do cenário

studio-advanced-keep-this-run-to-compare = Guardar esta execução para comparar com outra (até 4)

studio-advanced-compare-the-pinned-runs = Comparar as execuções fixadas

studio-advanced-share-this-run-or-download = Partilhar esta execução ou descarregá-la

studio-advanced-result-panels = Painéis de resultado

studio-advanced-run-summary = Resumo da execução

studio-advanced-parameters-and-scenario-source = Parâmetros e fonte do cenário

studio-advanced-close-the-parameters-and-show = Fechar os parâmetros e mostrar os resultados

studio-advanced-find-a-field-of-this = Encontrar um campo deste cenário

studio-advanced-find-a-field-for-example = Encontrar um campo, por exemplo máscara

studio-advanced-parameter-view = Vista de parâmetros

studio-advanced-find-a-scenario-domain-field = Encontrar um cenário, domínio, campo, painel ou comando

studio-advanced-skip-to-results = Saltar para os resultados

studio-advanced-find-anything = Encontrar qualquer coisa

studio-advanced-lunar-station-coverage-of-a = Estação lunar: cobertura de uma estação de referência (MODELLED)

studio-advanced-simple-view = Vista simples

studio-advanced-choose-a-scenario = Escolher um cenário

studio-advanced-what-do-you-want-to = O que pretende fazer?

studio-advanced-pick-a-domain-and-a = Escolha um domínio e um cenário, configure-o, execute o motor no seu navegador e depois leia, compare e exporte os resultados. Nada é enviado.

studio-advanced-share-or-export = Partilhar ou exportar

studio-advanced-good-first-runs = Boas primeiras execuções

studio-advanced-pin-run = Fixar execução

studio-advanced-report-json-scenario-tables-and = relatório, JSON, cenário, tabelas e exportações

studio-advanced-the-exact-scenario-in-the = o cenário exato, na ligação

studio-advanced-an-iframe-for-a-course = um iframe para uma página de curso ou wiki

studio-advanced-opens-in-a-new-tab = abre num novo separador

studio-advanced-loading-the-engine-the-recorded = A carregar o motor. O resultado registado deste cenário aparece primeiro.

studio-advanced-got-it = Percebi

studio-advanced-headline-numbers-from-the-engine = Números principais do resultado do motor, com a variação desde a sua execução anterior deste cenário e uma indicação de êxito ou falha onde a execução declara um limiar.

studio-advanced-set-parameters = Definir parâmetros

studio-advanced-every-change-re-runs-the = Cada alteração volta a executar o motor e atualiza os valores principais e os painéis.

studio-advanced-drag-a-slider-and-the = Arraste um cursor deslizante e o cenário é executado de novo. Cada controlo escreve diretamente no texto do cenário abaixo.

studio-advanced-in-the-editor-tab-indents = No editor, Tab avança a indentação em dois espaços. Prima Escape e depois Tab para seguir em frente.

studio-mission-thread-time-axis = Eixo do tempo

studio-mission-thread-mission-thread = Cadeia da missão

studio-mission-thread-where-does-a-mission-s = Onde se esgota o orçamento de erro de navegação e temporização de uma missão?

studio-mission-thread-a-mission-is-a-chain = Uma missão é uma cadeia de fases: lançamento, encontro, transferência para a Lua, alunagem, regresso. Cada fase tem os seus próprios sensores e o seu próprio orçamento de erro, e cada uma passa a sua incerteza à seguinte. Esta página mostra o orçamento da cadeia inteira, fase a fase, e nomeia o elo mais fraco.

studio-mission-thread-open-the-artemis-class-example = Abrir o exemplo da classe Artemis

studio-mission-thread-open-a-result-file = Abrir um ficheiro de resultado…

studio-mission-thread-the-thread = A cadeia

studio-mission-thread-error-against-mission-elapsed-time = Erro face ao tempo decorrido da missão

studio-mission-thread-the-phases = As fases

studio-mission-thread-the-budget-of-one-phase = O orçamento de uma fase
