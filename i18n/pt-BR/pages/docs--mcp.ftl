# docs--mcp: translations (pt-BR)

# text
seg-261c059bec54 = Consultivo, não é um equipamento de navegação homologado: o operador continua responsável pela navegação. O servidor roda no seu computador; nada é enviado à Ashforde OÜ.

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
seg-d107bc8e1950 = Registro de MCP

# text
seg-842b77a21c5f = Canal

# text
seg-d6476863f862 = Capacidade

# text
seg-fdbb9db68f1d = nenhuma

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
seg-b02bdf7c7661 = Node ou Docker

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
seg-b308519d4c8d = <a1>a página da versão</a1>: <c1/> (Linux x86-64), <c2/>, conferido por <c3/> e <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (encontrado por clientes que consultam o registro)

# text
seg-b1a6e807f06f = um cliente que consulta o registro

# text
seg-d5a3818ac3b6 = Remoto (HTTP em fluxo contínuo)

# text
seg-5f1397b1ea30 = seu próprio host

# text
# c1: mcp/kshana-mcp/README.md
seg-e7acd0ff4c84 = Fonte: <c1/>

# attr:alt
seg-81a87d14efda = Kshana: a marca, uma retícula de bússola que marca o instante preciso, ao lado do logotipo kshana

# text
seg-3d5232472e42 = kshana-mcp: pergunte ao seu assistente de IA, e o motor responde

# text
# c1: kshana-mcp
seg-ef90bf1e0b51 = <c1/> é um servidor de <a1>Model Context Protocol</a1> (MCP) para o <b>Kshana</b>, o simulador de código aberto para a resiliência de PNT (posicionamento, navegação e temporização). Ele permite que um assistente de IA (inteligência artificial) execute o motor real e leia de volta seu JSON (JavaScript Object Notation), em vez de adivinhar a matemática. Fala por stdio (entrada e saída padrão) com qualquer cliente compatível com MCP, inclusive o Cursor e o JetBrains AI Assistant / Junie.

# text
seg-1fddef4e9a49 = A matemática para a qual o Kshana é validado é exatamente onde um modelo de linguagem adivinha mal: propagação de órbita SGP4 (Simplified General Perturbations { "4" }), referenciais da IAU (União Astronômica Internacional), desvios de Allan, disponibilidade de GNSS (sistema global de navegação por satélite) e DOP (diluição da precisão), níveis de proteção ARAIM (monitoramento avançado de integridade autônomo do receptor), fusão de GNSS e INS (sistema de navegação inercial) e modelos de sensores quânticos. Faça uma pergunta; o assistente executa um cenário real e obtém figuras de mérito com sua proveniência e seu rótulo VALIDATED ou MODELLED.

# attr:alt
seg-d51681f30e8f = Um motor aberto no centro, com o servidor MCP como uma de suas superfícies ao lado da linha de comando, da biblioteca Rust, do Python, do WebAssembly e do Kshana Studio, da imagem Docker e do plugin JetBrains; todas as superfícies executam o mesmo motor, e o Kshana Pro depende dele sem fazer um fork

# text
seg-2a56e1f52830 = Ferramentas

# text
# c1: include_chart
seg-b847694d91b5 = Executa um cenário a partir de uma definição TOML (Tom's Obvious, Minimal Language); devolve o resumo + o JSON de resultado completo (JavaScript Object Notation: figuras de mérito, curvas). O opcional <c1/> devolve o gráfico como SVG (Scalable Vector Graphics).

# text
seg-3c00da00ec30 = Verificação prévia: analisa o TOML e detecta seu tipo, sem executar.

# text
# c1: name
# c2: kind
# c3: kind
seg-4516fd1e665c = Os cenários de referência incluídos como JSON: cada <c1/>, seu <c2/> e uma frase sobre o que ele mostra. Filtro <c3/> opcional. Todo exemplo roda como está, de modo que este é o caminho mais rápido para um TOML válido para um tipo.

# text
# c1: scenarios/
seg-61db4a94ad72 = O texto TOML de um cenário de referência incluído, byte a byte o arquivo em <c1/>.

# text
# c1: format
# c2: json
# c3: html
seg-306f7a835bb9 = Executa um cenário e devolve seu relatório: resumo executivo, entradas, cada valor com sua unidade e seu rótulo VALIDATED ou MODELLED, eventos, as capacidades exercitadas e um registro de reprodutibilidade. <c1/> é <c2/> (padrão) ou <c3/> (a página imprimível de arquivo único).

# text
# c1: svg
# c2: html
# c3: frames
seg-bdacef6d5133 = Executa um cenário e devolve suas séries temporais como uma animação: <c1/> (padrão), <c2/> (um reprodutor autossuficiente) ou <c3/> (no máximo { "120" } em uma resposta). O primeiro item de conteúdo é um resumo JSON do que foi desenhado; os arquivos vêm em seguida. Um tipo sem eixo de tempo amostrado é recusado, com o motivo.

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
seg-313f7594bd81 = Quais formatos de interoperabilidade se aplicam a um cenário (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), o motivo quando um não se aplica e a especificação que cada gravador segue. Não executa o cenário.

# text
# c1: .e
# c2: spectrum
# c3: [iq]
seg-e63b7853bb96 = Exporta um cenário como CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit) <c1/> ou SigMF (Signal Metadata Format, para um cenário <c2/> com um bloco <c3/>). O primeiro item de conteúdo é um índice JSON dos arquivos (sufixo, tamanho, codificação e o resumo SHA-256, o Secure Hash Algorithm de 256 bits); os arquivos vêm em seguida, o arquivo binário de amostras SigMF em base64.

# text
# c1: LineString
# c2: terrain-nav
# c3: terrain-slam
# c4: gravity-map
# c5: combined-altpnt
seg-074e914789c5 = Escreve uma rota GeoJSON <c1/> em um cenário que percorre uma trajetória de pontos de passagem (<c2/>, <c3/>, <c4/>, <c5/>) e devolve o novo TOML.

# text
# c1: orbit
seg-ae58a8577aa7 = Exporta a constelação de um cenário <c1/> como efemérides precisas SP3-c (Standard Product { "3" }, revisão c).

# text
# c1: orbit
seg-6a59aacf26bb = Exporta os elementos de um cenário <c1/> como um catálogo OMM (Orbit Mean-elements Message) CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2.

# text
# c1: orbit
# c2: export_sp3
seg-5562b319968b = Exporta a série de estados de um cenário <c1/> como efemérides OEM (Orbit Ephemeris Message) CCSDS { "2.0" } — a série de posição <em>e</em> velocidade TEME (equador verdadeiro, equinócio médio) que as ferramentas de dinâmica de voo (GMAT, o General Mission Analysis Tool; Orekit; STK, o Systems Tool Kit) leem; o complemento com velocidade do <c2/>, que só tem posição.

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
seg-b0cf13e530b7 = Executa um cenário e devolve sua tabela de reprodutibilidade como CSV (valores separados por vírgula) — a tabela estável byte a byte que a CLI (interface de linha de comando) grava como <c1/>. Só <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (sua análise <c7/> sobre um modelo de mensagem <c8/> ou <c9/>) e <c10/> com <c11/> + <c12/> definidos emitem uma; qualquer outro tipo devolve um erro que nomeia estes.

# text
# c1: tle
# c2: epoch
# c3: skyline_preset
# c4: request
# c5: docs/SKYLINE.md
seg-ab242cd0259c = Geometria do céu sob um horizonte dependente do azimute: a partir de um local, de um instante e de predefinições de constelação, de conjuntos de elementos de duas linhas (<c1/>, propagados por SGP4 até um <c2/> em UTC) ou de satélites como azimute/elevação ou ECEF, os satélites visíveis e os ocultos pelo horizonte, GDOP/PDOP/HDOP/VDOP/TDOP a partir do núcleo de DOP verificado com o gnss_lib_py, o cofator e a covariância leste-norte-cima (um relógio por sistema ou um em comum) e a elipse de erro horizontal; com <c3/> em vez de <c4/>, uma predefinição REPRESENTATIVE com sua proveniência e seu corte a cada grau. MODELLED; traz o aviso consultivo; sem Monte Carlo por MCP. Veja <a1><c5/></a1>.

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
seg-d6ed4e8d56e5 = Avalia a confiança de um registro real de receptor GNSS (sistema global de navegação por satélite). O TOML nomeia o <c1/> do registro (<c2/>, <c3/>, <c4/>, <c5/> ou <c6/>) e dá seus bytes em linha como <c7/> ou <c8/>; a ferramenta executa os monitores de confiança (queda da densidade portadora/ruído, perda de sincronismo, AGC (controle automático de ganho), indicador de interferência, salto de posição e, com RINEX mais navegação transmitida, RAIM (monitoramento autônomo de integridade pelo receptor) e um monitor auxiliado por relógio) e devolve quando e por que a posição deixou de ser confiável. Seções opcionais <c9/> e <c10/> pontuam eventos declarados e quedas previstas de C/N0 contra tolerâncias declaradas. Uma tabela <c11/> seleciona os monitores marítimos e acrescenta uma pontuação de confiança de 0-100 por época com os monitores que descontaram (consultivo; MODELLED). O registro vai em linha como <c12/> ou <c13/> (no máximo { "4" } MiB). Gráfico e CSV por época sob solicitação. Veja <a1><c14/></a1>.

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: --listen
# c4: docs/MARITIME-TRUST.md
seg-d1a967a443ea = Pontua um trecho NMEA { "0183" } limitado (no máximo { "2" } MiB e { "20,000" } épocas; deve conter a janela de calibração) do modo como <c1/> o pontua: estado de confiança por época e pontuação de 0-100 com os monitores que descontaram, um resumo e o último <c2/>. A forma limitada do comando ao vivo: nenhum socket é aberto e nada é gravado em uma porta; o portão, <c3/> e os exportadores de telemetria (Prometheus, OTLP, syslog) existem apenas na linha de comando. Somente consultivo; MODELLED. Veja <a1><c4/></a1>.

# text
seg-89e894d4b416 = O registro NMEA { "0183" } de uma embarcação (no máximo { "4" } MiB) como execução em lote, com o TOML de sessão declarando os limites da embarcação: o modelo de pontuação e a pontuação de 0-100 de cada época com seus descontos (a resposta mantém as contagens por estado e as primeiras { "200" } épocas degradadas ou não confiáveis). Somente consultivo; MODELLED.

# text
# c1: kshana jammertest import
# c2: docs/JAMMERTEST.md
seg-27698c80b7f1 = Lê o catálogo de testes e o plano de transmissão do Jammertest publicados (NPRA/jammertest-plan, MIT) como verdade programada (<c1/>): os intervalos de uma área de teste tornam-se eventos de confiança do receptor, com o id do catálogo e o ano em cada rótulo. Intervalos planejados, não horários de transmissão registrados; nenhum campo de contato do plano é lido. MODELLED. Veja <a1><c2/></a1>.

# text
# c1: kshana jammertest score
# c2: log
# c3: ubx
# c4: sbf
# c5: log_base64
seg-23daf6121ca0 = Pontua um registro de receptor contra esse cronograma (<c1/>): por teste, a latência de detecção, os alarmes perdidos e o tempo de recuperação, e os alarmes falsos fora de todo intervalo. Registros de texto como <c2/>, binários (<c3/>, <c4/>) como <c5/>. Um pacote assinado precisa de uma chave: linha de comando. Somente consultivo; MODELLED.

# text
# c1: kshana receiver-trust evidence
# c2: docs/EVIDENCE-PACKS.md
seg-0ca5b319e850 = Um pacote de evidências assinado para uma janela do registro de uma embarcação (<c1/>): os bytes brutos do registro da janela, a configuração, os resultados e motivos por época, uma página-resumo e um manifesto com cada SHA-256 e uma cadeia de hashes, assinado com Ed25519. A semente de assinatura nunca é devolvida nem registrada; sem uma, usa-se uma chave descartável, de modo que o pacote prova integridade, não identidade. Um registro técnico, não um parecer jurídico. Veja <a1><c2/></a1>.

# text
# c1: .tsr
# c2: kshana evidence attach-timestamp
# c3: openssl ts -verify
seg-8df4c6fb851d = Vincula um token de carimbo de tempo RFC { "3161" } (base64 dos bytes <c1/>) a um pacote, em memória (<c2/>); o pacote com o token ainda deve verificar. A assinatura da autoridade de carimbo de tempo não é conferida: use <c3/>.

# text
# c1: kshana evidence verify
# c2: verdict
# c3: verified
# c4: intact-signer-not-pinned
# c5: failed
# c6: require_timestamp
seg-1f7a6f7f005a = Verifica um pacote (<c1/>): cada hash, a cadeia, a assinatura e, com a chave pública do signatário e o registro completo, quem o assinou e que o trecho veio desse registro. Nomeia toda falha e todo arquivo. O <c2/> é <c3/> (signatário fixado), <c4/> (tudo confere, mas nenhuma chave pública foi dada, de modo que o signatário não está estabelecido) ou <c5/>; <c6/> reprova um pacote sem token de carimbo de tempo.

# text
# c1: nmea-scenario
# c2: kshana-nmea-training/1
seg-c43761e01f63 = NMEA { "0183" } de ponte sintético para treinamento de tripulações a partir de um TOML <c1/> (interferência, arrasto de posição, falsificação de tempo, atraso de repetição) com o registro do instrutor (<c2/>); determinístico por semente. Somente texto: nada é sintetizado em RF ou IQ e nada é transmitido; nunca para os sistemas de navegação reais de uma embarcação. A resposta traz as primeiras { "2000" } linhas.

# text
# c1: kshana-interference-map/v1
# c2: docs/INTERFERENCE-MAP.md
seg-8aec8f61dab2 = Um mapa de interferência GNSS a partir de relatos de posição ADS-B ou AIS como texto CSV (no máximo { "4" } MiB): um GeoJSON <c1/> por dia UTC, apenas agregado (sem identificadores, células com menos de { "5" } aeronaves ou embarcações distintas retidas), com a licença do conjunto de dados incorporada. Uma célula degradada não identifica interferência como a causa; não é uma previsão. MODELLED. Veja <a1><c2/></a1>.

# text
# c1: kshana bench-export
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: docs/TEST-BENCH.md
seg-d5959e4f1c96 = O movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório (<c1/>): CSV e JSON de movimento, NMEA, pontos de passagem e eventos como texto, nada gravado em disco. Tipos <c2/>, <c3/>, <c4/>. Nenhum sinal: nada do que é exportado é, modela ou aciona um sinal de radiofrequência ou de banda base; o simulador e seu operador fornecem os sinais. Veja <a1><c5/></a1>.

# text
# c1: kshana evidence round-trip
# c2: kshana.test-conditions/1
seg-1076916237f0 = O pacote assinado de ida e volta de laboratório (<c1/>): o cenário, o documento <a1><c2/></a1> do laboratório, o registro do receptor e sua pontuação contra os eventos declarados, ligados por hash. Recusa condições e eventos de pontuação que discordam. Nenhum sinal; um registro técnico, não uma certificação.

# text
# c1: kshana iq sweep
seg-9e1df2016cd7 = Reproduz uma gravação IQ do diretório de trabalho por vários projetos de laço de rastreamento (<c1/>): por projeto e PRN, o jitter de fase e de código em regime permanente, as frações de sincronismo e o C/N0 médio. No máximo { "256" } canais (projeto, PRN) por chamada; o intervalo deve caber no orçamento de amostras.

# text
# c1: kshana iq monitor
seg-a5af1743f993 = Executa os monitores de detecção de interferência e de falsificação sobre uma gravação IQ do diretório de trabalho (<c1/>): monitores de potência de banda larga e espectrais e monitores de C/N0 e de qualidade de sinal por satélite contra uma linha de base aprendida. Nomes e comprimentos de séries e até { "200" } eventos na resposta; o relatório inteiro sob solicitação, como arquivos. Um evento diz que uma grandeza medida saiu de sua linha de base, não por quê. MODELLED.

# text
# c1: kshana iq labfit
# c2: iq-labfit
# c3: text
# c4: base64
# c5: path
seg-c9c9c909c621 = Ajusta o modelo de perda de sincronismo do laço de rastreamento a execuções de laboratório (<c1/>) a partir de um cenário <c2/> cujos registros estão em linha (<c3/> ou <c4/>; um <c5/> é recusado). Não lê nem grava arquivo. MODELLED.

# text
# c1: kshana.test-conditions/1
seg-4f231cd18d37 = Valida um arquivo <c1/> dado como texto e devolve as condições resolvidas com seu hash. Somente em linha.

# text
# c1: kshana compliance-report
# c2: runs
# c3: {label, result, scenario?}
# c4: statement
# c5: docs/compliance/
seg-2851f2858910 = O mapeamento de estruturas públicas preenchido a partir de documentos de resultado dados como texto (<c1/>): para quais linhas de seis estruturas e normas de resiliência (a estrutura US DHS Resilient PNT v2.0, IMO navios, EASA aviação, NIS2 Artigo { "21" }, EN { "16803" }, NIST IR 8323r1) as execuções fornecem evidências em apoio de, para quais não, e a lacuna de cada linha. Recebe <c2/> de <c3/> (no máximo { "64" }, { "4" } MiB no total). Um estado diz que as execuções fornecem evidências em apoio das capacidades da linha; não é uma constatação de que uma estrutura é atendida nem uma classificação ou aprovação de qualquer produto. A <c4/> é devolvida com todo relatório; mostre-a literalmente. MODELLED. Veja <a1><c5/></a1>.

# text
# c1: sources
seg-0a5161ddea94 = As tabelas estáticas de mapeamento (ou, com <c1/>, os documentos de origem que elas citam, com versões e URLs) em Markdown, encabeçadas pela mesma declaração. Não precisa de execuções.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-ffcc6c72dc1e = Um fluxo de confiança (linhas JSON) ou um resultado de <c1/> renderizado como texto Prometheus, linhas de syslog CEF ou LEEF, uma carga JSON OTLP ou linhas de descoberta e de estado MQTT do Home Assistant, com os codificadores de <c2/>. Texto na resposta: nada é enviado ou servido e nenhum relógio é lido. Somente consultivo.

# text
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
# c4: kshana imu-fit
seg-2b82a8a22298 = Parâmetros de acelerômetro e de giroscópio dos cenários <c1/> e <c2/> ajustados a partir de um registro de IMU estacionária (CSV ou EuRoC) por desvio de Allan, com uma tabela <c3/> pronta para colar e o SHA-256 do registro (<c4/>). Texto na entrada, JSON na saída; MODELLED.

# text
# c1: kshana standards-pack list
seg-30d5bb6b34cb = Os pacotes de normas (<c1/>): conjuntos de cenários pontuados para os perfis de teste da estrutura DHS Resilient PNT (níveis { "1" } a { "4" }), IMO MSC.1/Circ.1575 e ICAO Doc { "9849" } Apêndice F.

# text
# c1: kshana standards-pack run
# c2: MET
# c3: NOT MET
# c4: NEEDS INPUT
# c5: compliance_report
seg-767a05e5df9f = Um pacote executado contra seus limiares declarados antes da execução (<c1/>): cada teste <c2/>, <c3/> ou <c4/>, com valores medidos e esperados; dê o relatório a <c5/> para ver as linhas. MODELLED; não classifica nenhum produto.

# text
# c1: spec
# c2: symbols
# c3: generate
seg-74110e6b530f = O Sinal Direto Aumentado LunaNet conferido com o LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } de janeiro de { "2025" }): <c1/> (a implementação contra as tabelas de código impressas e os exemplos resolvidos do documento), <c2/> (um fluxo de símbolos: padrão de sincronização, SB1, FID, continuidade do TOI) ou <c3/> (um fluxo de teste). LDPC e CRC-24Q dos subquadros { "2" } a { "4" } não são verificados; nenhum sinal é gravado.

# text
# c1: kshana bench score
# c2: bench/SPEC.md
seg-b6abad1f2c9d = Uma submissão kshana-bench pontuada contra um arquivo de verdade, ambos em texto JSON (<c1/>, <c2/>): o arquivo de resultado com a versão da especificação, a divisão, os hashes de entrada e as métricas da tarefa. MODELLED; descreve um registro ou corpus, nunca um produto.

# text
seg-c7a0d7981bfd = Arquivos de resultado do kshana-bench renderizados como a página estática de classificação (texto HTML), cada um validado antes.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-1ec7117c7825 = Um fluxo de confiança (linhas JSON) ou um resultado de <c1/> renderizado como texto Prometheus, linhas de syslog CEF ou LEEF ou uma carga JSON OTLP, com os codificadores de <c2/>. Texto na resposta: nada é enviado ou servido e nenhum relógio é lido. Somente consultivo.

# text
seg-0fc2e3928768 = A parcela do comprimento de uma rota em células degradadas, não degradadas, não avaliadas e não observadas de um ou mais mapas de interferência, opcionalmente dentro de um intervalo de datas. Células não observadas não são evidência de uma rota livre.

# text
seg-62756ba18cf5 = A configuração da camada IQ de GNSS: os nomes de sinal que as ferramentas IQ aceitam, se as ferramentas de arquivo IQ estão ligadas, o diretório de trabalho e o orçamento de amostras por chamada. Chame-a primeiro.

# text
# c1: kshana iq info
seg-98939638409f = Descreve uma gravação IQ (em fase e em quadratura) no diretório de trabalho sem processá-la: formato, taxa de amostragem, frequência central, amostras, duração, arquivos de dados e tamanhos (<c1/>).

# text
# c1: kshana iq scene
seg-c529b1a7ee53 = Gera uma cena IQ GNSS de vários satélites no diretório de trabalho (<c1/>): perfis de Doppler/C/N0 declarados, ou a geometria verdadeira de efemérides transmitidas a partir de um arquivo de navegação RINEX, com um canal de propagação opcional em nível de sinal. Responde com os arquivos gravados e suas contagens de bytes e a primeira época da verdade por satélite.

# text
# c1: kshana iq acquire
# c2: surface_out
seg-0c6f5e26367f = Aquisição por FFT (transformada rápida de Fourier) de um ou mais PRNs (códigos de ruído pseudoaleatório) sobre uma gravação (<c1/>), opcionalmente atrás de estágios de front-end: por PRN, adquirido ou não, Doppler, fase do código, estatística de pico e limiar; <c2/> (um PRN) mantém toda a superfície de correlação Doppler × fase do código com refinamentos de Doppler fino.

# text
# c1: kshana iq track
# c2: kshana.loop-design/1
# c3: design
# c4: reacquire
# c5: epochs_out
# c6: events_out
seg-1da73ad326de = Adquire e depois rastreia com o banco DLL/PLL/FLL (laços de sincronização de atraso, de fase e de frequência) (<c1/>), com os laços de um arquivo TOML <c2/> no diretório de trabalho (<c3/>) ou o projeto incorporado, e reaquisição opcional (<c4/>): por canal, épocas, Doppler final, C/N0 final e médio, frações de sincronismo de fase e de código, sincronizado ao final, o estado final de sincronismo, falsos sincronismos e reaquisições, mais o nome e o hash do projeto. O rastreamento transmite em memória limitada; a saída por época vai apenas para arquivos (<c5/>: E/P/L, discriminadores, estados dos laços, C/N0, estado de sincronismo como .csv/.jsonl/.bin; <c6/>).

# text
# c1: kshana iq frontend
seg-262bb9c592c0 = Aplica DSP (processamento digital de sinais: passa-faixa, notch, blanking, excisão, AGC, quantizador) de front-end de receptor e de mitigação de interferência a uma gravação e grava uma nova (<c1/>).

# text
# c1: kshana iq campaign
# c2: max_cells
seg-cf33e101b144 = Executa uma campanha de reprodução de laboratório (<c1/>): gravações, cada uma com um arquivo de condições de teste declarando a verdade conhecida do laboratório, × cadeias de front-end × projetos de laço. Cada célula é pontuada por tempo até a perda de sincronismo, tempo de reaquisição, degradação de C/N0 contra o J/S declarado (ao lado de uma referência analítica rotulada MODELLED), taxa de falso sincronismo, jitter de PLL/DLL e disponibilidade. Incremental e retomável: cada chamada executa as células pendentes que cabem no orçamento de amostras (ou em <c2/>).

# text
seg-8112428c6226 = O progresso da pasta de saída de uma campanha: células concluídas e pendentes, e o resumo criptográfico depois de concluída. Lê apenas arquivos.

# text
# c1: kshana
seg-8bd76f017ae4 = Cada ferramenta é um invólucro fino e fiel de uma função pública da biblioteca <c1/> — nenhuma lógica de simulação nova mora aqui, de modo que um agente executa exatamente o motor validado.

# text
seg-b37bbaf38900 = As ferramentas IQ de GNSS: arquivos na entrada, JSON compacto na saída

# text
# c1: iq_*
seg-ecf2ec0eb66d = As gravações IQ chegam a gigabytes, de modo que as ferramentas <c1/> nunca passam amostras pelo protocolo. Elas seguem um único contrato:

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: overwrite: true
seg-31a173dfe40d = <b>Um diretório de trabalho.</b> O servidor lê e grava arquivos IQ apenas dentro da pasta nomeada por <c1/>. Todo argumento de caminho é relativo a ela (um caminho absoluto deve resolver-se dentro dela); as entradas são resolvidas por links simbólicos antes da verificação, a pasta de uma saída já deve existir dentro dela e uma saída existente só é substituída com <c2/>. Sem definição, as ferramentas de arquivo IQ ficam desligadas e dizem como ativá-las; todas as outras ferramentas não são afetadas.

# text
# c1: KSHANA_MCP_IQ_MAX_SAMPLES
# c2: cf32_le
# c3: ci16_le
# c4: ci8
# c5: cf32_le
# c6: format
# c7: max_seconds
seg-4f734b84a91a = <b>Um orçamento de amostras.</b> Uma chamada gera ou processa no máximo <c1/> amostras complexas (padrão { "50 000 000" }). Em bytes, isso dá { "400" } MB como <c2/> ({ "8" } bytes por amostra complexa), { "200" } MB como <c3/> ({ "4" } bytes) e { "100" } MB como <c4/> ({ "2" } bytes); uma cena é gravada como <c5/> a menos que <c6/> diga outra coisa. A verificação roda antes de qualquer trabalho, e a recusa nomeia a duração ou o <c7/> que cabe.

# text
# c1: json_out
# c2: csv_out
seg-178284ddfee0 = <b>Respostas compactas.</b> Cada ferramenta responde com um resumo JSON: picos de aquisição, C/N0, estado de sincronismo e todo arquivo gravado com seu caminho e sua contagem de bytes. As tabelas por época vão para os arquivos <c1/> / <c2/> que você nomear.

# text
seg-f375643798e9 = <b>Argumentos desconhecidos são recusados</b>, não ignorados, de modo que uma opção com erro de grafia é um erro.

# text
# c1: kshana iq
# c2: spectrum
seg-41040247770d = Cada ferramenta executa o mesmo caminho de código que <c1/> na linha de comando, no mesmo processo. A camada é só de software: grava arquivos para receptores por software e não aciona hardware de rádio. A camada IQ não acrescenta síntese de interferência nem de falsificador, e nada é jamais transmitido. (O tipo de cenário <c2/>, separado, pode gravar em arquivo instantâneos IQ analíticos de interferidores.)

# text
# c1: docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp
seg-f02d2f6bac7c = Com a imagem Docker, monte a pasta e aponte a variável para ela: <c1/>.

# text
seg-721079aa25e7 = Todo tipo é alcançável

# text
# c1: run_scenario
# c2: kind
# c3: list_scenario_kinds
seg-116ada4f4498 = <c1/> despacha pelo <c2/> do cenário, de modo que todo tipo que <c3/> nomeia roda por ele. Isso inclui as famílias mais novas, cada uma com exemplos incluídos que um agente pode obter:

# text
seg-c7047f5750a9 = Um exemplo para começar

# text
seg-b45752760eca = O sistema solar

# text
seg-1ccf38ab6e24 = Campanhas: fases encadeadas, varreduras, Monte Carlo (conjuntos aleatórios com semente), composição

# text
seg-67fe14962e1c = Navegação em órbita baixa da Terra (LEO): projeto de sinal

# text
seg-c555e5b73203 = Navegação LEO: orçamento de enlace da passagem

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
seg-0561cfd970d8 = <c1/> com um <c2/> nomeia todo exemplo incluído desse tipo. Animações, relatórios e exportações de interoperabilidade não são tipos: são vistas de uma execução, e <c3/>, <c4/> e <c5/> as devolvem para qualquer cenário ao qual se apliquem.

# text
# c1: kshana --study <suite.toml>
# c2: run_scenario
seg-62d106ca4a89 = Não oferecidas: suítes de estudo (<c1/>), porque uma suíte nomeia arquivos de cenário irmãos em disco e as ferramentas de cenário não leem arquivo. Execute cada membro com <c2/>. (As ferramentas IQ leem e gravam arquivos, apenas dentro de seu diretório de trabalho.)

# text
seg-57f592bb676b = Instalar o servidor MCP

# text
seg-77fc92e21295 = Uma passagem que nomeia clientes de IA de terceiros fica de fora aqui; ela está em <a1>mcp/kshana-mcp/README.md</a1> no GitHub.

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-9ec78559983f = <c1/>, hospedagem própria: veja <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

# text
seg-b32b9d4e0f8b = A partir de uma cópia ou do git (desenvolvimento):

# text
seg-73a73af88f08 = Modo HTTP (hospedagem própria)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
# c2: /mcp
# c3: --allow-remote
# c4: KSHANA_MCP_HTTP_TOKEN
seg-4f248ed3e597 = <c1/> serve as mesmas ferramentas por HTTP em fluxo contínuo em <c2/>. Faz bind apenas em loopback; um endereço fora de loopback exige <c3/> e um token de portador (bearer) em <c4/>; as ferramentas de arquivo IQ ficam desligadas; o tamanho, o tempo e a concorrência das requisições são limitados; nenhum cabeçalho CORS é enviado. O Kshana não hospeda um endpoint: você o hospeda por conta própria. Veja <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: cargo install
# c2: kshana-mcp
# c3: PATH
# c4: ~/.cargo/bin/kshana-mcp
# c5: rmcp
# c6: kshana
seg-60f55b197ac2 = <c1/> coloca <c2/> no seu <c3/> (normalmente <c4/>). O servidor fala JSON-RPC (chamada de procedimento remoto em JSON) por stdio; os logs vão para stderr. Compilar a partir do código-fonte exige uma toolchain Rust ≥ { "1.88" } (o SDK <c5/> { "2" }.x corrigido a exige; a própria biblioteca <c6/> precisa apenas de { "1.85" }); a imagem Docker não precisa de nenhuma.

# text
seg-2f3216082425 = Registre-o em um cliente

# text
# c1: mcpServers
# c2: kshana-mcp
seg-1090ae3f689c = Praticamente todo cliente MCP usa o mesmo bloco de configuração <c1/> — registre o binário <c2/> por caminho absoluto:

# text
# c1: PATH
seg-2da393482666 = Ou, com a imagem Docker em vez de um binário local (sem necessidade de <c1/>):

# text
seg-a4f1295bb27a = Onde esse bloco fica depende do cliente:

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-154c7e09063d = <b>Cursor</b> — <c1/> (global) ou <c2/> (por projeto).

# text
seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, cole o bloco e depois reinicie completamente a IDE (ambiente de desenvolvimento integrado).

# text
# c1: …_config.json
# c2: mcpServers
seg-daf0ea451b11 = <b>Assistentes de desktop</b> — a maioria usa um <c1/> com o mesmo formato <c2/>; consulte a documentação do seu cliente para o local do arquivo.

# text
# c1: mcp add
# c2: mcp.json
seg-fc80286aa9bf = <b>Agentes de CLI</b> — muitos aceitam o mesmo JSON por um mecanismo <c1/> / <c2/>.

# text
# c1: RUST_LOG=debug
# c2: env
seg-9f3ef8d76e05 = Use sempre um caminho absoluto para o binário. Defina <c1/> em <c2/> para diagnosticar (os diagnósticos vão para stderr; stdout é reservado ao protocolo JSON-RPC).

# text
seg-283d1eba838a = Experimente

# text
seg-61739e9b6515 = Depois de registrado, pergunte ao seu assistente coisas como:

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
seg-d2e1e4148589 = <em>"Execute o cenário de holdover de relógio do Kshana com um limiar de { "20" } ns e uma interrupção de GNSS de 2 horas; qual é o holdover quântico contra o clássico?"</em> → <c1/>

# text
# c1: export_sp3
seg-f4b83873e280 = <em>"Exporte essa constelação GPS (Sistema de Posicionamento Global) como SP3."</em> → <c1/>

# text
# c1: export_table_csv
seg-54e01c1af45f = <em>"Dê-me a tabela realtime-frame-eop como CSV."</em> → <c1/>

# text
# c1: list_export_formats
# c2: export_interop
seg-478e6fa0e8d8 = <em>"Ponha essa passagem do Iridium em um globo Cesium."</em> → <c1/>, <c2/>

# text
# c1: animate_scenario
seg-90829388d5d9 = <em>"Anime a campanha de jamming."</em> → <c1/>

# text
# c1: report_scenario
seg-9eb1b97ad2fd = <em>"Dê-me o relatório dessa execução, com seu registro de reprodutibilidade."</em> → <c1/>

# text
# c1: iq_signals
# c2: iq_scene
# c3: iq_acquire
# c4: iq_track
seg-dc60d64a3bb8 = <em>"Faça uma cena GPS L1 de um segundo com os PRNs { "3" } e { "17" }, depois adquira e rastreie."</em> → <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-942dc8abe0ec = Nota de projeto — por que um crate separado

# text
# c1: Cargo.lock
# c2: rmcp
# c3: kshana
# c4: rmcp
# c5: rmcp
# c6: cargo deny
# c7: xval/anise-frames
seg-ce6d0ecab448 = O servidor é um <b>crate independente, excluído do workspace</b>, com seu próprio <c1/>, de modo que o SDK oficial de MCP em Rust (kit de desenvolvimento de software) <c2/> e seu runtime assíncrono nunca entram no grafo de dependências do crate <c3/> publicado: quem usa a biblioteca ou o Python não compila um servidor que não executa. (Ele foi separado primeiro porque <c4/> é <b>edition { "2024" }</b>, exigindo rustc ≥ { "1.85" }, enquanto o crate principal então prometia { "1.75" }. A biblioteca agora declara { "1.85" }; este servidor declara { "1.88" }, o piso do <c5/> { "2" }.x corrigido quanto à segurança.) A integração contínua (CI) controla este crate por conta própria — testes e <c6/> contra o seu lockfile. A árvore de licenças do rmcp está limpa (Apache-2.0/MIT/BSD), de modo que, ao contrário do crate de validação cruzada <c7/>, que ele de resto espelha, a separação não tem a ver com licenciamento.

# text
seg-75bf2d74642d = Licença: AGPL-3.0-only, a GNU Affero General Public License versão { "3" } apenas (ou uma licença comercial da Ashforde OÜ; veja o <a1>LICENSING.md</a1> do repositório).

# text
seg-490ebbefb561 = <s1>Anterior</s1>Crate Rust

# text
seg-350b6b914734 = <s1>Próxima</s1>Servidor MCP: todos os canais de instalação

seg-492888115662 = Os { "92" } tipos de cenário incorporados com descrições + campos obrigatórios/opcionais — para que o agente possa montar um cenário válido.

seg-a4a0e399a31e = <c1/> coloca <c2/> no seu <c3/> (normalmente <c4/>). O servidor fala JSON-RPC (chamada de procedimento remoto em JSON) por stdio; os logs vão para stderr. Compilar a partir do código-fonte exige uma toolchain Rust ≥ { "1.88" } (o SDK <c5/> { "2" }.x corrigido a exige, e a biblioteca <c6/> também); a imagem Docker não precisa de nenhuma.

seg-0757e15070d4 = O servidor é um <b>crate independente, excluído do workspace</b>, com seu próprio <c1/>, de modo que o SDK oficial de MCP em Rust (kit de desenvolvimento de software) <c2/> e seu runtime assíncrono nunca entram no grafo de dependências do crate <c3/> publicado: quem usa a biblioteca ou o Python não compila um servidor que não executa. (Ele foi separado primeiro porque <c4/> é <b>edition { "2024" }</b>, exigindo rustc ≥ { "1.85" }, enquanto o crate principal então prometia { "1.75" }. A biblioteca e este servidor agora declaram ambos { "1.88" }, o piso do <c5/> { "2" }.x corrigido quanto à segurança e dos crates RustCrypto atualizados.) A integração contínua (CI) controla este crate por conta própria — testes e <c6/> contra o seu lockfile. A árvore de licenças do rmcp está limpa (Apache-2.0/MIT/BSD), de modo que, ao contrário do crate de validação cruzada <c7/>, que ele de resto espelha, a separação não tem a ver com licenciamento.
