# docs--npm: translations (pt-PT)

# text
seg-3d770dd786e4 = Utilização

# text
seg-d4a762001549 = Licença

# attr:alt
seg-81a87d14efda = Kshana: a marca, uma retícula de bússola que assinala o instante preciso, ao lado do logótipo kshana

# text
# c1: README.npm.md
seg-0ddcab84868f = Fonte: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>o instante preciso</em></b><br/> Um simulador de código aberto para a resiliência de PNT (posicionamento, navegação e temporização).

# text
seg-3b861b2f08b8 = Versão v{ $version }

# text
seg-6a1906d8d4ad = Cerca de { "95" }% de cobertura de linhas, com um mínimo de { "85" }% na integração contínua

# text
seg-a9f4f2795fb5 = Licença: AGPL-3.0-only, ou uma licença comercial

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Ensaiar o minuto em que o GNSS fica às escuras: a consola de missão do Kshana, desenhada a partir de uma execução real do motor, uma campanha encadeada de jamming, spoofing, holdover e integridade sobre os { "102" } satélites do GPS, Galileo, BeiDou e GLONASS

# text
seg-d1153c5e9112 = Ensaiar o minuto em que o GNSS fica às escuras

# text
seg-d284448743af = O Kshana repete jamming, spoofing e holdover de relógio quando os sinais GNSS (Global Navigation Satellite System) falham, e diz por quanto tempo um sistema mantém a hora e a posição dentro do seu orçamento, e qual o relógio ou sensor que compra mais margem. Este é o pacote WebAssembly: o motor completo em JavaScript, no navegador ou em Node.js. Cada execução é reproduzível bit a bit a partir do cenário, da semente e da versão do motor.

# text
seg-d1a3f78ad8e0 = Experimente primeiro sem nada para instalar: o <a1>Kshana Studio</a1> executa o motor completo no seu navegador, compilado para WebAssembly, e não carrega nada.

# text
seg-d662055d817f = O pacote é um módulo ES (ECMAScript, JavaScript padrão) com uma carga WebAssembly, construído para o navegador. Inicialize-o uma vez e depois chame o motor de forma síncrona. A única diferença entre o navegador e o Node.js é a forma como o binário WebAssembly é carregado.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>No navegador</b> (através de um empacotador, ou de uma página que sirva <c1/>), <c2/> obtém <c3/> ao lado do módulo:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>No Node.js</b>, <c1/> falha com <c2/> (o <c3/> do Node não consegue ler um ficheiro local), pelo que se lê o binário do disco e se entrega a <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Guarde a versão Node.js como um ficheiro <c1/> (ou defina <c2/> no seu <c3/>) para que <c4/> funcione. A partir daí ambas são iguais:

# text
# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = O TypeScript vê resultados tipados: <c1/> devolve um <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> um <c9/> cujo <c10/> é a união <c11/> de todos os tipos de cenário, e <c12/> um <c13/> (ou <c14/> em caso de êxito). Os campos próprios de cada documento de resultado variam consoante o tipo de cenário; <c15/> tipifica o envelope partilhado (<c16/>, <c17/> e o bloco <c18/> de <c19/>).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Mais quatro funções descrevem o motor a uma interface. <c1/> devolve um objeto JSON de tipo de cenário para os módulos que as suas linhas da matriz de verificação nomeiam, <c2/> um de tipo de cenário para os campos de resultado que respondem à sua pergunta (metadados de apresentação; o motor nunca os lê), <c3/> os nomes de sinais que <c4/> aceita, e <c5/> uma curta cena IQ sintética, adquirida e seguida em memória (no máximo { "0.25" } s, { "1,000,000" } amostras e { "8" } satélites), com a mesma resposta que a compilação nativa.

# text
# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = Na face WebAssembly, cada ponto de entrada é uma chamada separada: <c1/> (o documento de resultado como cadeia JSON), <c2/>, <c3/>, <c4/> (a tabela CSV (valores separados por vírgulas) do cenário como cadeia, ou <c5/> para tipos de cenário que não publicam tabela; lança um erro perante um cenário inválido), <c6/> (uma execução do motor que devolve <c7/> como cadeia JSON — usá-la quando se quer mais de uma saída, uma vez que cada outra chamada executa o cenário de novo), <c8/> (as mesmas saídas como um objeto tipado, com o documento já analisado como <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspeção; <c14/> devolve a lista analisada), <c15/> / <c16/> — o codec de ligação partilhável (URL, localizador uniforme de recursos) que o <a1>Kshana Studio</a1> usa para fazer a ida e volta de um cenário inteiro através do fragmento da barra de endereços — e <c17/> / <c18/> / <c19/>, os artefactos de efemérides SP3-c (revisão c do formato Standard Product { "3" }) e CCSDS (Consultative Committee for Space Data Systems) — OMM, a Orbit Mean-elements Message, e OEM, a Orbit Ephemeris Message — que a CLI escreve — e <c20/>, que avalia um registo real de recetor descrito por um cenário <c21/> e devolve <c22/> como cadeia JSON (o navegador não tem sistema de ficheiros, pelo que o registo, e qualquer ficheiro de navegação, tem de estar em linha no cenário como <c23/> ou <c24/>; uma tabela <c25/> acrescenta os monitores marítimos e a pontuação de confiança de 0-100, apenas consultiva), <c26/> / <c27/> (que formatos de interoperabilidade um cenário suporta, sem o executar, e uma exportação em memória: <c28/>, <c29/>, <c30/>, <c31/> ou <c32/> como JSON <c33/>, idêntica byte a byte para o mesmo cenário, nada é carregado), <c34/> (uma rota GeoJSON escrita num cenário de trajetória por pontos de passagem, o <c35/> da linha de comandos), <c36/> (a série temporal da execução como SVG animado, um leitor HTML único ou fotogramas SVG), <c37/> / <c38/> (os cenários de referência fornecidos e o seu TOML), <c39/> (ligar um token RFC { "3161" } a um pacote de evidências em memória; o pacote tem de continuar a verificar-se, e a assinatura da autoridade de carimbo temporal não é verificada), <c40/> (que dados de navegação Galileo de que satélites um ficheiro de páginas I/NAV ou um fluxo UBX autentica, com a raiz de Merkle fiável ou as chaves públicas e uma hora de referência independente opcional; autentica dados e não faz nenhuma afirmação de desempenho antispoofing; nada é carregado), <c41/> (um excerto NMEA limitado pontuado como o modo em direto o pontua; sem barreira), <c42/> (um registo NMEA de uma embarcação como execução em lote), <c43/> (um fluxo ou resultado de confiança como texto Prometheus, linhas syslog CEF ou LEEF ou uma carga OTLP; nada é enviado), <c44/> (verificar um pacote de evidências assinado; nada é carregado; os pacotes são feitos com a CLI, o Python ou o MCP), <c45/> (o movimento e os eventos de um cenário como texto para um simulador de laboratório; nenhum sinal é escrito), <c46/> e <c47/> (a que linhas de requisitos de quadros públicos os documentos de resultado fornecem elementos de prova em apoio de, com a lacuna de cada linha; não é uma constatação de que um quadro é satisfeito), e <c48/> (texto CSV de ADS-B ou AIS para um GeoJSON <c49/> por dia UTC; apenas agregado), <c50/> (a parte de uma rota através de células degradadas desses mapas; não é uma previsão), <c51/> (NMEA de ponte sintético e um registo do instrutor para formação de tripulações; apenas texto, nunca para os sistemas de navegação em funcionamento de uma embarcação) e as funções de geometria do céu <c52/>, <c53/>, <c54/>, <c55/> e <c56/> (que satélites um local vê quando edifícios, cais ou terreno bloqueiam parte do céu, com a diluição da precisão, a elipse de erro horizontal, uma nuvem de Monte Carlo com semente e um skyplot como texto SVG; a decisão de visibilidade e a elipse são verificadas face a bibliotecas independentes, as predefinições são geometrias representativas e não levantamentos, e uma linha do horizonte remove satélites em linha de vista e nada mais). Não existem na compilação para navegador: <c57/> com a sua barreira e o seu recetor TCP, o NMEA de formação em fluxo, e os exportadores de telemetria (Prometheus, OpenTelemetry, syslog) são processos de rede de longa duração e ficam na ferramenta de linha de comandos; criar um pacote de evidências precisa de uma chave de assinatura, que pertence à CLI ou ao Python. Aqui não há uma chamada única <c58/>; essa ligação existe apenas no wheel de Python.

# text
seg-12a295fba8a5 = Cada capacidade da matriz de verificação é etiquetada como <b>validada</b> (verificada face a uma referência independente externa), <b>modelada</b> ou <b>da responsabilidade de parceiros</b>; os valores dos relógios óticos são objetivos espaciais em hardware de solo (nenhum relógio ótico de estrôncio voou). A maturidade <em>não</em> é uniforme entre domínios — o PNT terrestre é validado face a dados reais; a navegação no espaço profundo e em Marte é modelada, com apenas os seus blocos de construção (tempo de luz, posições dos planetas) validados face a referências independentes externas; a determinação de órbita (OD) em espaço profundo de missões reais consta do roteiro.

# text
seg-68ed88ec0b32 = <b>Espetro</b>: como um emissor de jamming ocupa a banda L do GNSS, banda a banda.

# text
seg-f04a0aeeee33 = <b>Relógios e temporização</b>: holdover face a um limiar, transferência de tempo e holdover de telecomunicações face às máscaras do setor de normalização da União Internacional das Telecomunicações (ITU-T).

# text
seg-7e38ac603ef2 = <b>Constelações em torno de qualquer corpo</b>: cobertura, diluição da precisão e disponibilidade em torno da Terra, da Lua ou de Marte, e do sistema solar numa época.

# text
seg-82708b06dcc6 = <b>Navegação em órbita terrestre baixa</b>: sinal, passagem e ligação, mensagem de navegação e uma solução de posição fundida, fase a fase.

# text
seg-e21e9bb02d00 = <b>Campanhas</b>: uma missão encadeada, uma varredura ou um conjunto de Monte Carlo num só cenário.

# text
seg-ba5057da54e4 = <b>Relatórios, animação e exportações</b>: cada valor com a sua unidade e etiqueta; um desenho animado de uma execução; ficheiros SP3 (Standard Product { "3" }), mensagens de órbita CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) e SigMF (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Um motor aberto ao centro, kshana { $version }, com um despacho tipado sobre { "75" } tipos de cenário; à sua volta a linha de comandos, a biblioteca Rust, o Python, o WebAssembly e o Kshana Studio, o servidor MCP, a imagem Docker e o plugin JetBrains; por baixo o Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = O mesmo ficheiro de cenário dá os mesmos bytes em todas as superfícies. MCP é o Model Context Protocol: <a1><c1/></a1> permite a um assistente de IA (inteligência artificial) executar o motor.

# text
seg-f51b0a8cd30e = Seis artigos no arXiv assentam no motor aberto, cada um com o comando que está por trás: <a1>arXiv:{ "2606.22054" }</a1> (a lacuna de otimismo dos detetores de interferência), <a2>arXiv:{ "2606.24210" }</a2> (um nível de proteção de temporização condicional), <a3>arXiv:{ "2607.05415" }</a3> (quão estável é uma pontuação de resiliência de PNT), <a4>arXiv:{ "2607.02566" }</a4> (observabilidade de estações à superfície lunar com interferometria de base muito longa), <a5>arXiv:{ "2607.06212" }</a5> (geometria polar sul lunar e faróis de superfície) e <a6>arXiv:{ "2610.23871" }</a6> (navegação cisluar como um problema de observabilidade: comprimento do arco, condicionamento do Gramiano e a alavanca do Doppler). Ver <a7>Investigação</a7>.

# text
seg-dad7832bf2d2 = O motor completo é gratuito sob a AGPL-3.0. O Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca, e estudos à medida estão disponíveis por contrato com a Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Não há preços; ver <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Saber mais

# text
seg-0e8320f8ea91 = <b>O README completo</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (o motor no seu navegador, como WebAssembly) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Capacidades</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validação e proveniência</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Matriz de verificação</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Citar</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Gratuito e de código aberto sob a <b>GNU AGPL-3.0-only</b> (a GNU Affero General Public License, versão { "3" } apenas). Está disponível uma <b>licença comercial</b> da <a1>Ashforde® OÜ</a1> (uma sociedade privada de responsabilidade limitada estónia; OÜ = osaühing) para integração fechada; ver <a2>LICENSING.md</a2>. Desenvolvido e mantido profissionalmente pela Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Anterior</s1>API Python

# text
seg-8af548581ae9 = <s1>Seguinte</s1>Crate Rust
