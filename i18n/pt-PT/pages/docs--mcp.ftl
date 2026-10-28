# docs--mcp: translations (pt-PT)

# text
seg-261c059bec54 = Consultivo, não um equipamento de navegação homologado: o operador continua a ser responsável pela navegação. O servidor é executado no seu computador; nada é enviado à Ashforde OÜ.

# text
seg-13641146503d = Cursor (um clique)

# text
seg-3bd13fe295f4 = VS Code (um clique)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Binário pré-compilado

# text
seg-d107bc8e1950 = Registo do MCP

# text
seg-842b77a21c5f = Canal

# text
seg-d6476863f862 = Capacidade

# text
seg-fdbb9db68f1d = none

# text
seg-1759a8cce7d6 = Tipos de cenário

# text
seg-564133d6a0c4 = Constelações em torno de qualquer corpo

# text
seg-b88a2a9497c2 = Ferramenta

# text
seg-a683980168f7 = Docker

# text
seg-f3a2279d6df7 = Comando ou botão

# text
seg-20c5ae650eb7 = Requer

# text
seg-af4d3ce85e11 = Forma fixada

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node, ou Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ com uv ou pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = fórmula para v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> e depois <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifesto para v{ $version }

# text
seg-f7c0a2fbb0b5 = winget

# text
seg-9e599ab3c0a3 = winget (Windows)

# text
seg-091d1404bb8a = cargo

# text
seg-145ddf98e77f = Rust { "1.88" }+

# text
# c1: kshana-mcp
# c2: kshana-mcp-<target>[.exe]
# c3: SHA256SUMS
# c4: gh attestation verify
seg-b308519d4c8d = <a1>a página da versão</a1>: <c1/> (Linux x86-64), <c2/>, verificado por <c3/> e <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (encontrado por clientes que reconhecem o registo)

# text
seg-b1a6e807f06f = um cliente que reconhece o registo

# text
seg-d5a3818ac3b6 = Remoto (HTTP em fluxo contínuo)

# text
seg-5f1397b1ea30 = o seu próprio anfitrião

# text
# c1: mcp/kshana-mcp/README.md
seg-e7acd0ff4c84 = Fonte: <c1/>

# attr:alt
seg-81a87d14efda = Kshana: a marca, uma retícula de bússola que assinala o instante preciso, ao lado do logótipo kshana

# text
seg-3d5232472e42 = kshana-mcp: pergunte ao seu assistente de IA, e o motor responde

# text
# c1: kshana-mcp
seg-ef90bf1e0b51 = <c1/> é um servidor de <a1>Model Context Protocol</a1> (MCP) para o <b>Kshana</b>, o simulador de código aberto para a resiliência de PNT (posicionamento, navegação e temporização). Permite que um assistente de IA (inteligência artificial) execute o motor real e leia o seu JSON (JavaScript Object Notation), em vez de adivinhar a matemática. Comunica por stdio (entrada e saída padrão) com qualquer cliente compatível com MCP, incluindo o Cursor e o JetBrains AI Assistant / Junie.

# text
seg-1fddef4e9a49 = A matemática para a qual o Kshana é validado é exatamente aquela em que um modelo de linguagem adivinha mal: propagação de órbita SGP4 (Simplified General Perturbations { "4" }), referenciais da IAU (União Astronómica Internacional), desvios de Allan, disponibilidade de GNSS (Global Navigation Satellite System) e DOP (diluição da precisão), níveis de proteção ARAIM (advanced receiver autonomous integrity monitoring), fusão de GNSS e INS (sistema de navegação inercial) e modelos de sensores quânticos. Faça uma pergunta; o assistente executa um cenário real e obtém figuras de mérito com a sua proveniência e a sua etiqueta VALIDATED ou MODELLED.

# attr:alt
seg-d51681f30e8f = Um motor aberto ao centro, com o servidor MCP como uma das suas superfícies ao lado da linha de comandos, da biblioteca Rust, de Python, de WebAssembly e do Kshana Studio, da imagem Docker e do plugin JetBrains; todas as superfícies executam o mesmo motor, e o Kshana Pro depende dele sem o bifurcar

# text
seg-2a56e1f52830 = Ferramentas

# text
# c1: include_chart
seg-b847694d91b5 = Executa um cenário a partir de uma definição TOML (Tom's Obvious, Minimal Language); devolve o resumo + o JSON completo do resultado (JavaScript Object Notation: figuras de mérito, curvas). A opção <c1/> devolve o gráfico como SVG (Scalable Vector Graphics).

# text
seg-3c00da00ec30 = Verificação prévia: analisa o TOML e deteta o seu tipo de cenário, sem executar.

# text
# c1: name
# c2: kind
# c3: kind
seg-4516fd1e665c = Os cenários de referência incluídos como JSON: cada <c1/>, o seu <c2/> e uma frase sobre o que mostra. Filtro facultativo <c3/>. Todos os exemplos são executados tal como estão, pelo que este é o caminho mais rápido para um TOML válido de um tipo de cenário.

# text
# c1: scenarios/
seg-61db4a94ad72 = O texto TOML de um cenário de referência incluído, byte a byte o ficheiro em <c1/>.

# text
# c1: format
# c2: json
# c3: html
seg-306f7a835bb9 = Executa um cenário e devolve o seu relatório: resumo executivo, entradas, cada valor com a sua unidade e a sua etiqueta VALIDATED ou MODELLED, eventos, as capacidades exercidas e um registo de reprodutibilidade. <c1/> é <c2/> (predefinição) ou <c3/> (a página de ficheiro único imprimível).

# text
# c1: svg
# c2: html
# c3: frames
seg-bdacef6d5133 = Executa um cenário e devolve as suas séries temporais como animação: <c1/> (predefinição), <c2/> (um leitor autónomo) ou <c3/> (no máximo { "120" } numa resposta). O primeiro item de conteúdo é um resumo JSON do que foi desenhado; seguem-se os ficheiros. Um tipo de cenário sem eixo de tempo amostrado é recusado com o motivo.

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
seg-313f7594bd81 = Que formatos de interoperabilidade se aplicam a um cenário (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), o motivo quando um não se aplica e a especificação que cada gravador segue. Não executa o cenário.

# text
# c1: .e
# c2: spectrum
# c3: [iq]
seg-e63b7853bb96 = Exporta um cenário como CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit) <c1/>, ou SigMF (Signal Metadata Format, para um cenário <c2/> com um bloco <c3/>). O primeiro item de conteúdo é um índice JSON dos ficheiros (sufixo, tamanho, codificação e o resumo SHA-256, o Secure Hash Algorithm de 256 bits); seguem-se os ficheiros, o ficheiro binário de amostras SigMF em base64.

# text
# c1: LineString
# c2: terrain-nav
# c3: terrain-slam
# c4: gravity-map
# c5: combined-altpnt
seg-074e914789c5 = Escreve uma rota GeoJSON <c1/> num cenário que percorre uma trajetória de pontos de passagem (<c2/>, <c3/>, <c4/>, <c5/>) e devolve o novo TOML.

# text
# c1: orbit
seg-ae58a8577aa7 = Exporta a constelação de um cenário <c1/> como efemérides precisas SP3-c (Standard Product { "3" }, revisão c).

# text
# c1: orbit
seg-6a59aacf26bb = Exporta os elementos de um cenário <c1/> como um catálogo OMM (Orbit Mean-elements Message) CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2.

# text
# c1: orbit
# c2: export_sp3
seg-5562b319968b = Exporta a série de estados de um cenário <c1/> como efemérides CCSDS OEM (Orbit Ephemeris Message) { "2.0" } — a série de posição <em>e</em> velocidade em TEME (true equator, mean equinox) que as ferramentas de dinâmica de voo (GMAT, o General Mission Analysis Tool; Orekit; STK, o Systems Tool Kit) leem; o complemento com velocidade de <c2/>, que só tem posição.

# text
# c1: <scenario>.table.csv
# c2: realtime-frame-eop
# c3: lunar-time-budget
# c4: lunar-jamming
# c5: telecom-timing
# c6: leo-navmsg
# c7: encode-decode
# c8: kepler16
# c9: kepler-rac
# c10: moonlight-service-volume
# c11: export_site_lat_deg
# c12: export_site_lon_deg
seg-b0cf13e530b7 = Executa um cenário e devolve a sua tabela de reprodutibilidade como CSV (comma-separated values) — a tabela estável byte a byte que a CLI (command-line interface) escreve como <c1/>. Só <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (a sua análise <c7/> sobre um modelo de mensagem <c8/> ou <c9/>) e <c10/> com <c11/> + <c12/> definidos emitem uma; qualquer outro tipo de cenário devolve um erro que os indica.

# text
# c1: tle
# c2: epoch
# c3: skyline_preset
# c4: request
# c5: docs/SKYLINE.md
seg-ab242cd0259c = Geometria do céu sob uma linha do horizonte dependente do azimute: a partir de um local, um instante e predefinições de constelações, conjuntos de elementos de duas linhas (<c1/>, propagados por SGP4 para um <c2/> UTC) ou satélites como azimute/elevação ou ECEF, os satélites visíveis e os ocultados pela linha do horizonte, GDOP/PDOP/HDOP/VDOP/TDOP a partir do núcleo de DOP verificado com gnss_lib_py, o cofator e a covariância este-norte-cima (um relógio por sistema ou um em comum) e a elipse de erro horizontal; com <c3/> em vez de <c4/>, uma predefinição REPRESENTATIVE com a sua proveniência e o seu corte a cada grau. MODELLED; traz o aviso consultivo; sem Monte Carlo sobre MCP. Ver <a1><c5/></a1>.

# text
# c1: format
# c2: ubx
# c3: rinex
# c4: android
# c5: nmea
# c6: sbf
# c7: text
# c8: base64
# c9: [[events]]
# c10: [compare]
# c11: [platform] kind = "vessel"
# c12: text
# c13: base64
# c14: docs/RECEIVER-TRUST.md
seg-d6ed4e8d56e5 = Avalia a confiança num registo real de um recetor GNSS (global navigation satellite system). O TOML indica o <c1/> do registo (<c2/>, <c3/>, <c4/>, <c5/> ou <c6/>) e dá os seus bytes em linha como <c7/> ou <c8/>; a ferramenta executa os monitores de confiança (queda da densidade portadora-ruído, perda de bloqueio, AGC (controlo automático de ganho), indicador de jamming, salto de posição e, com RINEX mais navegação difundida, RAIM (receiver autonomous integrity monitoring) e um monitor assistido por relógio) e devolve quando e porquê a solução de posição deixou de ser fiável. As secções facultativas <c9/> e <c10/> pontuam eventos declarados e quedas de C/N0 previstas face a tolerâncias declaradas. Uma tabela <c11/> seleciona os monitores marítimos e acrescenta uma pontuação de confiança de 0-100 por época com os monitores que deduziram (consultivo; MODELLED). O registo vai em linha como <c12/> ou <c13/> (no máximo { "4" } MiB). Gráfico e CSV por época a pedido. Ver <a1><c14/></a1>.

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: --listen
# c4: docs/MARITIME-TRUST.md
seg-d1a967a443ea = Pontua um excerto NMEA { "0183" } limitado (no máximo { "2" } MiB e { "20,000" } épocas; tem de conter a janela de calibração) como <c1/> o pontua: estado de confiança por época e pontuação de 0-100 com os monitores que deduziram, um resumo e o último <c2/>. A forma limitada do comando em direto: não é aberto nenhum socket e nada é escrito numa porta; o gate, <c3/> e os exportadores de telemetria (Prometheus, OTLP, syslog) são apenas de linha de comandos. Apenas consultivo; MODELLED. Ver <a1><c4/></a1>.

# text
seg-89e894d4b416 = Um registo NMEA { "0183" } de uma embarcação (no máximo { "4" } MiB) como execução em lote, com o TOML de sessão a indicar os limites da embarcação: o modelo de pontuação e a pontuação de 0-100 de cada época com as suas deduções (a resposta mantém contagens por estado e as primeiras { "200" } épocas degraded ou untrusted). Apenas consultivo; MODELLED.

# text
# c1: kshana jammertest import
# c2: docs/JAMMERTEST.md
seg-27698c80b7f1 = Lê o catálogo de testes e o plano de transmissão do Jammertest publicados (NPRA/jammertest-plan, MIT) como referência programada (<c1/>): os intervalos de uma área de teste tornam-se eventos de confiança do recetor, com o id do catálogo e o ano em cada etiqueta. Intervalos planeados, não horas de emissão registadas; nenhum campo de contacto do plano é lido. MODELLED. Ver <a1><c2/></a1>.

# text
# c1: kshana jammertest score
# c2: log
# c3: ubx
# c4: sbf
# c5: log_base64
seg-23daf6121ca0 = Pontua um registo de recetor face a esse calendário (<c1/>): por teste, a latência de deteção, os alarmes perdidos e o tempo de recuperação, e os falsos alarmes fora de todos os intervalos. Registos de texto como <c2/>, binários (<c3/>, <c4/>) como <c5/>. Um pacote assinado precisa de uma chave: linha de comandos. Apenas consultivo; MODELLED.

# text
# c1: kshana receiver-trust evidence
# c2: docs/EVIDENCE-PACKS.md
seg-0ca5b319e850 = Um pacote de evidências assinado para uma janela do registo de uma embarcação (<c1/>): os bytes brutos do registo para a janela, a configuração, os resultados e motivos por época, uma página de resumo e um manifesto com cada SHA-256 e uma cadeia de hashes, assinado com Ed25519. A semente de assinatura nunca é devolvida nem registada; sem uma, é usada uma chave única, pelo que o pacote prova a integridade, não a identidade. Um registo técnico, não um parecer jurídico. Ver <a1><c2/></a1>.

# text
# c1: .tsr
# c2: kshana evidence attach-timestamp
# c3: openssl ts -verify
seg-8df4c6fb851d = Associa um token de marca temporal RFC { "3161" } (base64 dos bytes <c1/>) a um pacote, em memória (<c2/>); o pacote com o token tem ainda de ser verificado. A assinatura da autoridade de marca temporal não é verificada: use <c3/>.

# text
# c1: kshana evidence verify
# c2: verdict
# c3: verified
# c4: intact-signer-not-pinned
# c5: failed
# c6: require_timestamp
seg-1f7a6f7f005a = Verifica um pacote (<c1/>): cada hash, a cadeia, a assinatura e, com a chave pública do signatário e o registo completo, quem o assinou e que o excerto veio desse registo. Indica cada falha e cada ficheiro. O <c2/> é <c3/> (signatário fixado), <c4/> (tudo confere mas não foi dada nenhuma chave pública, pelo que o signatário não é estabelecido) ou <c5/>; <c6/> faz falhar um pacote sem token de marca temporal.

# text
# c1: nmea-scenario
# c2: kshana-nmea-training/1
seg-c43761e01f63 = NMEA { "0183" } sintético de ponte para formação de tripulações a partir de um TOML <c1/> (jamming, arrastamento de posição, spoofing de tempo, atraso de repetição) com o registo do instrutor (<c2/>); determinista por semente. Apenas texto: nada é sintetizado em RF nem em IQ e nada é transmitido; nunca para os sistemas de navegação em direto de uma embarcação. A resposta traz as primeiras { "2000" } linhas.

# text
# c1: kshana-interference-map/v1
# c2: docs/INTERFERENCE-MAP.md
seg-8aec8f61dab2 = Um mapa de interferência GNSS a partir de relatórios de posição ADS-B ou AIS como texto CSV (no máximo { "4" } MiB): um GeoJSON <c1/> por dia UTC, apenas agregado (sem identificadores, células com menos de { "5" } aeronaves ou embarcações distintas retidas), com a licença do conjunto de dados incorporada. Uma célula degradada não identifica a interferência como causa; não é uma previsão. MODELLED. Ver <a1><c2/></a1>.

# text
# c1: kshana bench-export
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: docs/TEST-BENCH.md
seg-d5959e4f1c96 = O movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório (<c1/>): CSV e JSON de movimento, NMEA, pontos de passagem e eventos como texto, nada escrito em disco. Tipos de cenário <c2/>, <c3/>, <c4/>. Sem sinal: nada do que é exportado é, modela ou comanda um sinal de radiofrequência ou de banda de base; o simulador e o seu operador fornecem os sinais. Ver <a1><c5/></a1>.

# text
# c1: kshana evidence round-trip
# c2: kshana.test-conditions/1
seg-1076916237f0 = O pacote assinado de ida e volta de laboratório (<c1/>): o cenário, o documento <a1><c2/></a1> do laboratório, o registo do recetor e a sua pontuação face aos eventos declarados, ligados por hash. Recusa condições e eventos de pontuação que discordem. Sem sinal; um registo técnico, não uma certificação.

# text
# c1: kshana iq sweep
seg-9e1df2016cd7 = Repete uma gravação IQ do diretório de trabalho com vários projetos de malha de seguimento (<c1/>): por projeto e PRN, o jitter de fase e de código em regime estacionário, as frações de bloqueio e o C/N0 médio. No máximo { "256" } canais (projeto, PRN) por chamada; o intervalo tem de caber no orçamento de amostras.

# text
# c1: kshana iq monitor
seg-a5af1743f993 = Executa os monitores de deteção de interferência e de spoofing sobre uma gravação IQ do diretório de trabalho (<c1/>): monitores de potência e espetrais de banda larga e monitores de C/N0 e de qualidade de sinal por satélite face a uma linha de base aprendida. Nomes e comprimentos das séries e até { "200" } eventos na resposta; o relatório completo a pedido como ficheiros. Um evento indica que uma grandeza medida saiu da sua linha de base, não porquê. MODELLED.

# text
# c1: kshana iq labfit
# c2: iq-labfit
# c3: text
# c4: base64
# c5: path
seg-c9c9c909c621 = Ajusta o modelo de perda de bloqueio da malha de seguimento a execuções de laboratório (<c1/>) a partir de um cenário <c2/> cujos registos vão em linha (<c3/> ou <c4/>; um <c5/> é recusado). Não lê nem escreve nenhum ficheiro. MODELLED.

# text
# c1: kshana.test-conditions/1
seg-4f231cd18d37 = Valida um ficheiro <c1/> dado como texto e devolve as condições resolvidas com o seu hash. Apenas em linha.

# text
# c1: kshana compliance-report
# c2: runs
# c3: {label, result, scenario?}
# c4: statement
# c5: docs/compliance/
seg-2851f2858910 = O mapeamento do quadro público preenchido a partir de documentos de resultados dados como texto (<c1/>): de seis quadros de resiliência e normas (US DHS Resilient PNT framework v2.0, IMO ships, EASA aviation, NIS2 Article { "21" }, EN { "16803" }, NIST IR 8323r1), as linhas em apoio das quais as execuções fornecem elementos de prova, as que não têm esse apoio e a lacuna de cada linha. Recebe <c2/> de <c3/> (no máximo { "64" }, { "4" } MiB no total). Um estado indica que as execuções fornecem elementos de prova em apoio das capacidades da linha; não é uma conclusão de que um quadro seja atingido nem uma classificação ou aprovação de qualquer produto. O <c4/> é devolvido com cada relatório; mostre-o tal como está. MODELLED. Ver <a1><c5/></a1>.

# text
# c1: sources
seg-0a5161ddea94 = As tabelas de mapeamento estáticas (ou, com <c1/>, os documentos de origem que citam, com versões e URL) como Markdown, encabeçadas pela mesma declaração. Não precisa de execuções.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-ffcc6c72dc1e = Um fluxo de confiança (linhas JSON) ou um resultado <c1/> apresentado como texto Prometheus, linhas syslog CEF ou LEEF, uma carga JSON OTLP ou linhas de descoberta e de estado MQTT do Home Assistant, com os codificadores <c2/>. Texto na resposta: nada é enviado nem servido e nenhum relógio é lido. Apenas consultivo.

# text
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
# c4: kshana imu-fit
seg-2b82a8a22298 = Parâmetros do acelerómetro e do giroscópio dos cenários <c1/> e <c2/> ajustados a partir de um registo de IMU parada (CSV ou EuRoC) por desvio de Allan, com uma tabela <c3/> pronta a colar e o SHA-256 do registo (<c4/>). Texto à entrada, JSON à saída; MODELLED.

# text
# c1: kshana standards-pack list
seg-30d5bb6b34cb = Os pacotes de normas (<c1/>): conjuntos de cenários pontuados para os perfis de teste do quadro DHS Resilient PNT (níveis { "1" } a { "4" }), a IMO MSC.1/Circ.1575 e o ICAO Doc { "9849" } Apêndice F.

# text
# c1: kshana standards-pack run
# c2: MET
# c3: NOT MET
# c4: NEEDS INPUT
# c5: compliance_report
seg-767a05e5df9f = Uma execução de um pacote face aos seus limiares declarados antes da execução (<c1/>): cada teste <c2/>, <c3/> ou <c4/>, com valores medidos e esperados; dê o relatório a <c5/> para ver as linhas. MODELLED; não classifica nenhum produto.

# text
# c1: spec
# c2: symbols
# c3: generate
seg-74110e6b530f = O LunaNet Augmented Forward Signal verificado face ao LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } de janeiro de { "2025" }): <c1/> (a implementação face às tabelas de códigos impressas do documento e aos exemplos resolvidos), <c2/> (um fluxo de símbolos: padrão de sincronização, SB1, FID, continuidade de TOI) ou <c3/> (um fluxo de teste). O LDPC e o CRC-24Q das subtramas { "2" } a { "4" } não são verificados; nenhum sinal é escrito.

# text
# c1: kshana bench score
# c2: bench/SPEC.md
seg-b6abad1f2c9d = Uma submissão kshana-bench pontuada face a um ficheiro de referência, ambos como texto JSON (<c1/>, <c2/>): o ficheiro de resultados com a versão da especificação, a divisão, os hashes de entrada e as métricas da tarefa. MODELLED; descreve um registo ou um corpus, nunca um produto.

# text
seg-c7a0d7981bfd = Ficheiros de resultados do kshana-bench apresentados como a página estática de classificação (texto HTML), cada um validado primeiro.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-1ec7117c7825 = Um fluxo de confiança (linhas JSON) ou um resultado <c1/> apresentado como texto Prometheus, linhas syslog CEF ou LEEF ou uma carga JSON OTLP, com os codificadores <c2/>. Texto na resposta: nada é enviado nem servido e nenhum relógio é lido. Apenas consultivo.

# text
seg-0fc2e3928768 = A proporção do comprimento de uma rota em células degradadas, não degradadas, não avaliadas e não observadas de um ou mais mapas de interferência, opcionalmente dentro de um intervalo de datas. As células não observadas não são evidência de uma rota livre.

# text
seg-62756ba18cf5 = A configuração da camada GNSS IQ: os nomes de sinais que as ferramentas IQ aceitam, se as ferramentas de ficheiros IQ estão ativas, o diretório de trabalho e o orçamento de amostras por chamada. Chame-a primeiro.

# text
# c1: kshana iq info
seg-98939638409f = Descreve uma gravação IQ (em fase e em quadratura) do diretório de trabalho sem a processar: formato, taxa de amostragem, frequência central, amostras, duração, ficheiros de dados e tamanhos (<c1/>).

# text
# c1: kshana iq scene
seg-c529b1a7ee53 = Gera uma cena GNSS IQ com vários satélites no diretório de trabalho (<c1/>): perfis de Doppler/C/N0 declarados, ou geometria verdadeira de efemérides difundidas a partir de um ficheiro de navegação RINEX, com um canal de propagação ao nível do sinal facultativo. Responde com os ficheiros escritos e as suas contagens de bytes e a primeira época da referência por satélite.

# text
# c1: kshana iq acquire
# c2: surface_out
seg-0c6f5e26367f = Aquisição por FFT (fast Fourier transform) de um ou mais PRN (pseudo-random noise codes) sobre uma gravação (<c1/>), opcionalmente atrás de estágios de front-end: por PRN, adquirido ou não, Doppler, fase do código, estatística de pico e limiar; <c2/> (um PRN) conserva toda a superfície de correlação Doppler × fase do código com refinamentos de Doppler fino.

# text
# c1: kshana iq track
# c2: kshana.loop-design/1
# c3: design
# c4: reacquire
# c5: epochs_out
# c6: events_out
seg-1da73ad326de = Adquire e depois segue com o banco de DLL/PLL/FLL (malhas de bloqueio de atraso, de fase e de frequência) (<c1/>), com as malhas de um ficheiro TOML <c2/> no diretório de trabalho (<c3/>) ou o projeto incorporado, e reaquisição facultativa (<c4/>): por canal, épocas, Doppler final, C/N0 final e médio, frações de bloqueio de fase e de código, bloqueado no fim, o estado de bloqueio final, falsos bloqueios e reaquisições, mais o nome e o hash do projeto. O seguimento processa fluxos em memória limitada; a saída por época vai apenas para ficheiros (<c5/>: E/P/L, discriminadores, estados das malhas, C/N0, estado de bloqueio como .csv/.jsonl/.bin; <c6/>).

# text
# c1: kshana iq frontend
seg-262bb9c592c0 = Aplica DSP (digital signal processing: passa-banda, notch, blanking, excisão, AGC, quantizador) de front-end do recetor e de mitigação de interferência a uma gravação e escreve uma nova (<c1/>).

# text
# c1: kshana iq campaign
# c2: max_cells
seg-cf33e101b144 = Executa uma campanha de repetição em laboratório (<c1/>): gravações, cada uma com um ficheiro de condições de teste que indica a referência conhecida do laboratório, × cadeias de front-end × projetos de malha. Cada célula é pontuada quanto ao tempo até à perda de bloqueio, ao tempo de reaquisição, à degradação do C/N0 face ao J/S declarado (ao lado de uma referência analítica etiquetada MODELLED), à taxa de falso bloqueio, ao jitter de PLL/DLL e à disponibilidade. Incremental e retomável: cada chamada executa as células pendentes que cabem no orçamento de amostras (ou <c2/>).

# text
seg-8112428c6226 = O progresso de uma pasta de saída de campanha: células concluídas e pendentes, e o resumo digest quando estiver completa. Só lê ficheiros.

# text
# c1: kshana
seg-8bd76f017ae4 = Cada ferramenta é um invólucro fino e fiel de uma função pública da biblioteca <c1/> — nenhuma lógica de simulação nova reside aqui, pelo que um agente executa exatamente o motor validado.

# text
seg-b37bbaf38900 = As ferramentas GNSS IQ: ficheiros à entrada, JSON compacto à saída

# text
# c1: iq_*
seg-ecf2ec0eb66d = As gravações IQ atingem gigabytes, pelo que as ferramentas <c1/> nunca passam amostras pelo protocolo. Seguem um só contrato:

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: overwrite: true
seg-31a173dfe40d = <b>Um diretório de trabalho.</b> O servidor lê e escreve ficheiros IQ apenas dentro da pasta indicada por <c1/>. Cada argumento de caminho é relativo a ela (um caminho absoluto tem de resolver para dentro dela); as entradas são resolvidas através de ligações simbólicas antes da verificação, a pasta de uma saída tem de já existir dentro dela, e uma saída existente só é substituída com <c2/>. Se não estiver definida, as ferramentas de ficheiros IQ ficam desligadas e dizem como as ativar; todas as outras ferramentas não são afetadas.

# text
# c1: KSHANA_MCP_IQ_MAX_SAMPLES
# c2: cf32_le
# c3: ci16_le
# c4: ci8
# c5: cf32_le
# c6: format
# c7: max_seconds
seg-4f734b84a91a = <b>Um orçamento de amostras.</b> Uma chamada gera ou processa no máximo <c1/> amostras complexas (predefinição { "50 000 000" }). Em bytes, isso são { "400" } MB como <c2/> ({ "8" } bytes por amostra complexa), { "200" } MB como <c3/> ({ "4" } bytes) e { "100" } MB como <c4/> ({ "2" } bytes); uma cena é escrita como <c5/> a menos que <c6/> indique outra coisa. A verificação corre antes de qualquer trabalho, e a recusa indica a duração ou o <c7/> que cabe.

# text
# c1: json_out
# c2: csv_out
seg-178284ddfee0 = <b>Respostas compactas.</b> Cada ferramenta responde com um resumo JSON: picos de aquisição, C/N0, estado de bloqueio e todos os ficheiros escritos com o seu caminho e contagem de bytes. As tabelas por época vão para os ficheiros <c1/> / <c2/> que indicar.

# text
seg-f375643798e9 = <b>Os argumentos desconhecidos são recusados</b>, não ignorados, pelo que uma opção com erro ortográfico é um erro.

# text
# c1: kshana iq
# c2: spectrum
seg-41040247770d = Cada ferramenta executa o mesmo caminho de código que <c1/> na linha de comandos, no mesmo processo. A camada é apenas software: escreve ficheiros para recetores de software e não aciona nenhum equipamento de radiofrequência. A camada IQ não acrescenta síntese de interferência nem de spoofer, e nada é alguma vez transmitido. (O tipo de cenário <c2/>, separado, pode escrever instantâneos IQ analíticos de jammer num ficheiro.)

# text
# c1: docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp
seg-f02d2f6bac7c = Com a imagem Docker, monte a pasta e aponte a variável para ela: <c1/>.

# text
seg-721079aa25e7 = Todos os tipos de cenário são acessíveis

# text
# c1: run_scenario
# c2: kind
# c3: list_scenario_kinds
seg-116ada4f4498 = <c1/> despacha segundo o <c2/> do cenário, pelo que todos os tipos de cenário que <c3/> indica são executados através dele. Isso inclui as famílias mais recentes, cada uma com exemplos incluídos que um agente pode obter:

# text
seg-c7047f5750a9 = Um exemplo para começar

# text
seg-b45752760eca = O sistema solar

# text
seg-1ccf38ab6e24 = Campanhas: fases encadeadas, varrimentos, Monte Carlo (conjuntos aleatórios com semente), composição

# text
seg-67fe14962e1c = Navegação em órbita terrestre baixa (LEO): projeto do sinal

# text
seg-c555e5b73203 = Navegação LEO: orçamento da ligação de passagem

# text
seg-67de12cac6f0 = Navegação LEO: mensagem de navegação

# text
seg-b8badd962245 = Navegação LEO: posicionamento e temporização fundidos

# text
# c1: list_example_scenarios
# c2: kind
# c3: animate_scenario
# c4: report_scenario
# c5: export_interop
seg-0561cfd970d8 = <c1/> com um <c2/> indica todos os exemplos incluídos desse tipo de cenário. As animações, os relatórios e as exportações de interoperabilidade não são tipos de cenário: são vistas de uma execução, e <c3/>, <c4/> e <c5/> devolvem-nas para qualquer cenário a que se apliquem.

# text
# c1: kshana --study <suite.toml>
# c2: run_scenario
seg-62d106ca4a89 = Não servidos: os conjuntos de estudo (<c1/>), porque um conjunto indica ficheiros de cenário irmãos em disco e as ferramentas de cenário não leem ficheiros. Execute cada membro com <c2/>. (As ferramentas IQ leem e escrevem ficheiros, mas apenas dentro do seu diretório de trabalho.)

# text
seg-57f592bb676b = Instalar o servidor MCP

# text
seg-77fc92e21295 = Uma passagem que menciona clientes de IA de terceiros é omitida aqui; consta de <a1>mcp/kshana-mcp/README.md</a1> no GitHub.

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-9ec78559983f = <c1/>, em alojamento próprio: ver <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

# text
seg-b32b9d4e0f8b = A partir de um checkout ou de git (desenvolvimento):

# text
seg-73a73af88f08 = Modo HTTP (alojamento próprio)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
# c2: /mcp
# c3: --allow-remote
# c4: KSHANA_MCP_HTTP_TOKEN
seg-4f248ed3e597 = <c1/> serve as mesmas ferramentas sobre HTTP em fluxo contínuo em <c2/>. Liga-se apenas ao loopback; um endereço que não seja de loopback precisa de <c3/> e de um token de portador em <c4/>; as ferramentas de ficheiros IQ ficam desligadas; o tamanho, o tempo e a concorrência dos pedidos são limitados; não é enviado nenhum cabeçalho CORS. O Kshana não aloja um ponto de acesso: é o utilizador quem o aloja. Ver <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: cargo install
# c2: kshana-mcp
# c3: PATH
# c4: ~/.cargo/bin/kshana-mcp
# c5: rmcp
# c6: kshana
seg-60f55b197ac2 = <c1/> coloca <c2/> no seu <c3/> (tipicamente <c4/>). O servidor fala JSON-RPC (JSON remote procedure call) sobre stdio; os registos vão para o stderr. Compilar a partir do código-fonte exige uma cadeia de ferramentas Rust ≥ { "1.88" } (o SDK <c5/> { "2" }.x corrigido exige-o; a própria biblioteca <c6/> exige apenas { "1.85" }); a imagem Docker não exige nenhuma.

# text
seg-2f3216082425 = Registá-lo num cliente

# text
# c1: mcpServers
# c2: kshana-mcp
seg-1090ae3f689c = Praticamente todos os clientes MCP usam o mesmo bloco de configuração <c1/> — registe o binário <c2/> por caminho absoluto:

# text
# c1: PATH
seg-2da393482666 = Ou, com a imagem Docker em vez de um binário local (sem necessidade de <c1/>):

# text
seg-a4f1295bb27a = O local onde esse bloco fica depende do cliente:

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-154c7e09063d = <b>Cursor</b> — <c1/> (global) ou <c2/> (por projeto).

# text
seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, cole o bloco e reinicie por completo o IDE (ambiente de desenvolvimento integrado).

# text
# c1: …_config.json
# c2: mcpServers
seg-daf0ea451b11 = <b>Assistentes de ambiente de trabalho</b> — a maioria usa um <c1/> com a mesma estrutura <c2/>; consulte a documentação do seu cliente para saber a localização do ficheiro.

# text
# c1: mcp add
# c2: mcp.json
seg-fc80286aa9bf = <b>Agentes de CLI</b> — muitos aceitam o mesmo JSON através de um mecanismo <c1/> / <c2/>.

# text
# c1: RUST_LOG=debug
# c2: env
seg-9f3ef8d76e05 = Use sempre um caminho absoluto para o binário. Defina <c1/> em <c2/> para diagnosticar problemas (o diagnóstico vai para o stderr; o stdout está reservado ao protocolo JSON-RPC).

# text
seg-283d1eba838a = Experimente

# text
seg-61739e9b6515 = Depois de registado, peça ao seu assistente coisas como:

# text
# c1: list_scenario_kinds
seg-256276ac933d = <em>"Liste os tipos de cenário do Kshana."</em> → <c1/>

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: run_scenario
seg-2a8e3c76b939 = <em>"Mostre-me um exemplo de spectrum do Kshana e execute-o."</em> → <c1/>, <c2/>, <c3/>

# text
# c1: run_scenario
seg-d2e1e4148589 = <em>"Execute o cenário de holdover de relógio do Kshana com um limiar de { "20" } ns e uma falha de GNSS de 2 horas; qual é o holdover quântico face ao clássico?"</em> → <c1/>

# text
# c1: export_sp3
seg-f4b83873e280 = <em>"Exporte essa constelação GPS (Global Positioning System) como SP3."</em> → <c1/>

# text
# c1: export_table_csv
seg-54e01c1af45f = <em>"Dê-me a tabela realtime-frame-eop como CSV."</em> → <c1/>

# text
# c1: list_export_formats
# c2: export_interop
seg-478e6fa0e8d8 = <em>"Coloque essa passagem de Iridium num globo Cesium."</em> → <c1/>, <c2/>

# text
# c1: animate_scenario
seg-90829388d5d9 = <em>"Anime a campanha de jamming."</em> → <c1/>

# text
# c1: report_scenario
seg-9eb1b97ad2fd = <em>"Dê-me o relatório dessa execução, com o seu registo de reprodutibilidade."</em> → <c1/>

# text
# c1: iq_signals
# c2: iq_scene
# c3: iq_acquire
# c4: iq_track
seg-dc60d64a3bb8 = <em>"Crie uma cena GPS L1 de um segundo com os PRN { "3" } e { "17" }, depois adquira-a e siga-a."</em> → <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-942dc8abe0ec = Nota de conceção — porque um crate separado

# text
# c1: Cargo.lock
# c2: rmcp
# c3: kshana
# c4: rmcp
# c5: rmcp
# c6: cargo deny
# c7: xval/anise-frames
seg-ce6d0ecab448 = O servidor é um <b>crate autónomo, excluído do workspace</b>, com o seu próprio <c1/>, pelo que o SDK (software development kit) oficial de MCP para Rust, <c2/>, e o seu runtime assíncrono nunca entram no grafo de dependências do crate <c3/> publicado: quem usa a biblioteca ou Python não compila um servidor que não executa. (Foi separado primeiro porque <c4/> é <b>edition { "2024" }</b>, o que exige rustc ≥ { "1.85" }, enquanto o crate principal prometia então { "1.75" }. A biblioteca declara agora { "1.85" }; este servidor declara { "1.88" }, o mínimo do <c5/> { "2" }.x corrigido em segurança.) A integração contínua (CI) condiciona este crate por si só — testes e <c6/> face ao seu ficheiro de bloqueio. A árvore de licenças do rmcp está limpa (Apache-2.0/MIT/BSD), pelo que, ao contrário do crate de validação cruzada <c7/>, que de resto espelha, a separação não tem que ver com licenciamento.

# text
seg-75bf2d74642d = Licença: AGPL-3.0-only, a GNU Affero General Public License versão { "3" } apenas (ou uma licença comercial da Ashforde OÜ; ver o <a1>LICENSING.md</a1> do repositório).

# text
seg-490ebbefb561 = <s1>Anterior</s1>Crate Rust

# text
seg-350b6b914734 = <s1>Seguinte</s1>Servidor MCP: todos os canais de instalação
