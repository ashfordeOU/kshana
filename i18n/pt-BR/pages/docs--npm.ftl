# docs--npm: translations (pt-BR)

# text
seg-3d770dd786e4 = Uso

# text
seg-d4a762001549 = Licença

# attr:alt
seg-81a87d14efda = Kshana: a marca, uma retícula de bússola que marca o instante preciso, ao lado do logotipo kshana

# text
# c1: README.npm.md
seg-0ddcab84868f = Fonte: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>o instante preciso</em></b><br/> Um simulador de código aberto para a resiliência de PNT (posicionamento, navegação e temporização).

# text
seg-3b861b2f08b8 = Versão v{ $version }

# text
seg-6a1906d8d4ad = Cerca de { "95" }% de cobertura de linhas, com mínimo exigido de { "85" }% na integração contínua

# text
seg-a9f4f2795fb5 = Licença: AGPL-3.0-only, ou uma licença comercial

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Ensaie o minuto em que o GNSS apaga: o console de missão do Kshana, desenhado a partir de uma execução real do motor, uma campanha encadeada de jamming, spoofing, holdover e integridade sobre os { "102" } satélites de GPS, Galileo, BeiDou e GLONASS

# text
seg-d1153c5e9112 = Ensaie o minuto em que o GNSS apaga

# text
seg-d284448743af = O Kshana reproduz jamming, spoofing e holdover de relógio quando os sinais de GNSS (Global Navigation Satellite System, sistema global de navegação por satélite) falham, e diz por quanto tempo um sistema mantém tempo e posição dentro do seu orçamento e qual relógio ou sensor compra mais margem. Este é o pacote WebAssembly: o motor inteiro em JavaScript, no navegador ou em Node.js. Toda execução é reproduzível bit a bit a partir do cenário, da semente e da versão do motor.

# text
seg-d1a3f78ad8e0 = Experimente primeiro sem nada para instalar: o <a1>Kshana Studio</a1> executa o motor inteiro no seu navegador, compilado para WebAssembly, e não envia nada.

# text
seg-d662055d817f = O pacote é um módulo ES (ECMAScript, JavaScript padrão) com uma carga WebAssembly, construído para o navegador. Inicialize-o uma vez e depois chame o motor de forma síncrona. A única diferença entre o navegador e o Node.js é como o binário WebAssembly é carregado.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>No navegador</b> (por meio de um bundler, ou de uma página que serve <c1/>), <c2/> busca <c3/> ao lado do módulo:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>No Node.js</b>, <c1/> falha com <c2/> (o <c3/> do Node não consegue ler um arquivo local), de modo que se lê o binário do disco e se o entrega a <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Salve a versão para Node.js como um arquivo <c1/> (ou defina <c2/> no seu <c3/>) para que <c4/> funcione. Daí em diante os dois são iguais:

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
seg-06eb982ef260 = O TypeScript vê resultados tipados: <c1/> devolve um <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> um <c9/> cujo <c10/> é a união <c11/> de todos os tipos de cenário, e <c12/> um <c13/> (ou <c14/> em caso de sucesso). Os campos próprios de cada documento de resultado variam conforme o tipo de cenário; <c15/> tipa o envelope compartilhado (<c16/>, <c17/> e o bloco <c18/> de <c19/>s).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Quatro funções a mais descrevem o motor para um front end. <c1/> devolve um objeto JSON do tipo de cenário para os módulos que as linhas da sua matriz de verificação nomeiam, <c2/> um do tipo de cenário para os campos de resultado que respondem à sua pergunta (metadados de exibição; o motor nunca os lê), <c3/> os nomes de sinais que <c4/> aceita, e <c5/> uma cena IQ sintética curta, adquirida e rastreada em memória (no máximo { "0.25" } s, { "1,000,000" } amostras e { "8" } satélites), com a mesma resposta da compilação nativa.

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
seg-ceee5ddc0c36 = Na face WebAssembly cada ponto de entrada é uma chamada separada: <c1/> (o documento de resultado como uma cadeia JSON), <c2/>, <c3/>, <c4/> (a tabela CSV (valores separados por vírgula) do cenário como uma cadeia, ou <c5/> para tipos de cenário que não publicam tabela; lança erro diante de um cenário inválido), <c6/> (uma execução do motor devolvendo <c7/> como uma cadeia JSON — use-a quando quiser mais de uma saída, pois toda outra chamada executa o cenário de novo), <c8/> (as mesmas saídas como um único objeto tipado, com o documento já analisado como <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspecção; <c14/> devolve a lista analisada), <c15/> / <c16/> — o codec de link compartilhável (URL, localizador uniforme de recursos) que o <a1>Kshana Studio</a1> usa para fazer ida e volta de um cenário inteiro pelo fragmento da barra de endereços — e <c17/> / <c18/> / <c19/>, os artefatos de efemérides SP3-c (revisão c do formato Standard Product { "3" }) e CCSDS (Consultative Committee for Space Data Systems) — OMM, a Orbit Mean-elements Message, e OEM, a Orbit Ephemeris Message — que a CLI grava — e <c20/>, que avalia um log real de receptor descrito por um cenário <c21/> e devolve <c22/> como uma cadeia JSON (o navegador não tem sistema de arquivos, de modo que o log, e qualquer arquivo de navegação, deve estar em linha no cenário como <c23/> ou <c24/>; uma tabela <c25/> acrescenta os monitores marítimos e a pontuação de confiança de 0-100, apenas consultiva), <c26/> / <c27/> (quais formatos de interoperabilidade um cenário suporta, sem executá-lo, e uma exportação em memória: <c28/>, <c29/>, <c30/>, <c31/> ou <c32/> como JSON <c33/>, idêntica byte a byte para o mesmo cenário, nada enviado), <c34/> (uma rota GeoJSON escrita num cenário de trajetória por pontos de passagem, o <c35/> da linha de comando), <c36/> (a série temporal da execução como um SVG animado, um único player HTML ou quadros SVG), <c37/> / <c38/> (os cenários de referência incluídos e o seu TOML), <c39/> (vincular um token RFC { "3161" } a um pacote de evidências em memória; o pacote ainda deve verificar, e a assinatura da autoridade de carimbo de tempo não é verificada), <c40/> (quais dados de navegação Galileo de satélites um arquivo de páginas I/NAV ou um fluxo UBX autentica, com a raiz Merkle confiável ou chaves públicas e um tempo de referência independente opcional; ele autentica dados e não faz nenhuma afirmação de desempenho antispoofing; nada é enviado), <c41/> (um trecho NMEA limitado pontuado do modo como o modo ao vivo pontua; sem gate), <c42/> (o log NMEA de uma embarcação como execução em lote), <c43/> (um fluxo ou resultado de confiança como texto Prometheus, linhas syslog CEF ou LEEF ou uma carga OTLP; nada é enviado), <c44/> (verifica um pacote de evidências assinado; nada é enviado; os pacotes são feitos com a CLI, o Python ou o MCP), <c45/> (o movimento e os eventos de um cenário como texto para um simulador de laboratório; nenhum sinal é gravado), <c46/> e <c47/> (quais linhas de requisitos de estruturas públicas os documentos de resultado fornecem evidências em apoio de, com a lacuna de cada linha; não uma constatação de que uma estrutura é satisfeita), e <c48/> (texto CSV de ADS-B ou AIS para um GeoJSON <c49/> por dia UTC; somente agregado), <c50/> (a parcela de uma rota que passa por células degradadas desses mapas; não uma previsão), <c51/> (NMEA sintético de ponte e um log do instrutor para treinamento de tripulação; somente texto, nunca para os sistemas de navegação em operação de uma embarcação) e as funções de geometria do céu <c52/>, <c53/>, <c54/>, <c55/> e <c56/> (quais satélites um sítio vê quando edifícios, cais ou terreno bloqueiam parte do céu, com a diluição de precisão, a elipse de erro horizontal, uma nuvem de Monte Carlo com semente e um skyplot como texto SVG; a decisão de visibilidade e a elipse são verificadas contra bibliotecas independentes, as predefinições são geometrias representativas e não levantamentos, e um skyline remove satélites em linha de visada e nada mais). Não estão na compilação para navegador: <c57/> com o seu gate e o listener TCP, o NMEA de treinamento em fluxo e os exportadores de telemetria (Prometheus, OpenTelemetry, syslog) são processos de rede de longa duração e permanecem na ferramenta de linha de comando; criar um pacote de evidências exige uma chave de assinatura, que pertence à CLI ou ao Python. Não há aqui uma chamada única <c58/>; essa ligação existe apenas no wheel Python.

# text
seg-12a295fba8a5 = Toda capacidade na matriz de verificação é rotulada como <b>validada</b> (verificada contra uma referência independente externa), <b>modelada</b> ou <b>de propriedade de parceiro</b>; as cifras de relógios ópticos são metas espaciais em hardware de solo (nenhum relógio óptico de estrôncio voou). A maturidade <em>não</em> é uniforme entre os domínios — o PNT terrestre é validado contra dados reais; a navegação de espaço profundo e de Marte é modelada, com apenas os seus blocos de construção (tempo de luz, posições de planetas) validados contra referências independentes externas; a OD (determinação de órbita) de espaço profundo em missões reais está no roteiro.

# text
seg-68ed88ec0b32 = <b>Espectro</b>: como um jammer toma a banda L do GNSS, banda a banda.

# text
seg-f04a0aeeee33 = <b>Relógios e temporização</b>: holdover contra um limiar, transferência de tempo e holdover de telecomunicações contra as máscaras do setor de normalização da União Internacional de Telecomunicações (ITU-T).

# text
seg-7e38ac603ef2 = <b>Constelações em torno de qualquer corpo</b>: cobertura, diluição de precisão e disponibilidade em torno da Terra, da Lua ou de Marte, e o sistema solar numa época.

# text
seg-82708b06dcc6 = <b>Navegação em órbita terrestre baixa</b>: sinal, passagem e enlace, mensagem de navegação e uma solução fundida, etapa por etapa.

# text
seg-e21e9bb02d00 = <b>Campanhas</b>: uma missão encadeada, uma varredura ou um ensemble de Monte Carlo num único cenário.

# text
seg-ba5057da54e4 = <b>Relatórios, animação e exportações</b>: toda cifra com a sua unidade e o seu rótulo; um desenho animado de uma execução; arquivos SP3 (Standard Product { "3" }), mensagens de órbita CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) e SigMF (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Um motor aberto no centro, kshana { $version }, com um despacho tipado sobre { "75" } tipos de cenário; ao redor, a linha de comando, a biblioteca Rust, o Python, o WebAssembly e o Kshana Studio, o servidor MCP, a imagem Docker e o plugin JetBrains; abaixo, o Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = O mesmo arquivo de cenário dá os mesmos bytes em todas as superfícies. MCP é o Model Context Protocol: <a1><c1/></a1> permite que um assistente de IA (inteligência artificial) execute o motor.

# text
seg-f51b0a8cd30e = Seis artigos no arXiv são construídos sobre o motor aberto, cada um com o comando por trás dele: <a1>arXiv:{ "2606.22054" }</a1> (a lacuna de otimismo dos detectores de interferência), <a2>arXiv:{ "2606.24210" }</a2> (um nível de proteção de temporização condicional), <a3>arXiv:{ "2607.05415" }</a3> (quão estável é uma pontuação de resiliência de PNT), <a4>arXiv:{ "2607.02566" }</a4> (observabilidade de estações de superfície lunar com interferometria de linha de base muito longa), <a5>arXiv:{ "2607.06212" }</a5> (geometria polar sul lunar e faróis de superfície) e <a6>arXiv:{ "2610.23871" }</a6> (navegação cislunar como problema de observabilidade: comprimento de arco, condicionamento do Gramiano e a alavanca Doppler). Veja <a7>Pesquisa</a7>.

# text
seg-dad7832bf2d2 = O motor inteiro é livre sob a AGPL-3.0. O Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca, e estudos personalizados estão disponíveis sob contrato com a Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Não há preços; veja <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Saiba mais

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
seg-d059e9fc67e1 = Software livre e de código aberto sob a <b>GNU AGPL-3.0-only</b> (a GNU Affero General Public License, versão { "3" } apenas). Uma <b>licença comercial</b> está disponível junto à <a1>Ashforde® OÜ</a1> (uma sociedade privada de responsabilidade limitada da Estônia; OÜ = osaühing) para integração fechada; veja <a2>LICENSING.md</a2>. Desenvolvido e mantido profissionalmente pela Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Anterior</s1>API Python

# text
seg-8af548581ae9 = <s1>Próximo</s1>Crate Rust

seg-c9a297cc51e9 = { "176" } de { "401" } capacidades validadas em relação a referências independentes externas

seg-7b53ee712a36 = <b>{ "176" } de { "401" }</b> capacidades validadas em relação a referências independentes externas; { "221" } rotuladas com honestidade como modeladas, { "4" } pertencentes a parceiros. Cada capacidade traz um único rótulo em um registro verificado por máquina: VALIDATED (uma referência independente externa concorda: dados reais, uma implementação independente ou vetores de referência publicados), MODELLED (internamente consistente, e dito em voz alta) ou PARTNER (um parceiro de hardware é o responsável). Entre as verificações: todos os { "666" } vetores SGP4 (Simplified General Perturbations { "4" }) do AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 até { "4.12" } mm, e o modelo de forças de Cowell até { "0.08" } m em relação ao Orekit { "12.2" }.

seg-b59781ecf257 = Como uma capacidade obtém seu rótulo: capacidade, referência independente, teste, rótulo no registro. O estado de verificação das { "401" } capacidades: { "176" } validadas, { "221" } modeladas, { "4" } pertencentes a parceiros

seg-d0b2811a3d3c = O motor tem { "92" } tipos de cenário; <c1/> os lista com seus campos. Novos na { "0.38.0" }: <c2/> (sinais GNSS para espaçonaves acima, ao redor e além das órbitas GNSS) e <c3/> (órbita e superfície lunares como infraestrutura de navegação e geodésica), ambos MODELLED, e <c4/> (um registro de erro de tempo em relação às máscaras da ITU-T).
