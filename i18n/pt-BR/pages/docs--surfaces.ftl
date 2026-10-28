# docs--surfaces: translations (pt-BR)

# text
seg-f917e7fcac09 = O que é

# text
seg-76dc5d9ec114 = JetBrains

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Superfície

# text
seg-d6476863f862 = Capacidade

# text
seg-e0426ffe2628 = Nota

# text
seg-de6c33774c9c = CLI

# text
seg-98f4f946a7ac = WASM

# text
seg-206c78a69ded = Exposição de rota

# text
seg-4dbf41c0ec3b = Função

# text
seg-d5b5bdf6081c = Rust

# text
seg-40a7552d2ba9 = MCP

# text
# c1: docs/SURFACES.md
seg-1194bde1c9df = Fonte: <c1/>

# text
# c1: kshana::surface
seg-4d8a164605fb = Toda capacidade está disponível nas superfícies em que faz sentido; onde uma superfície não consegue carregar uma capacidade, a célula diz <b>N/A</b> e explica por quê. O mesmo motor roda por trás de cada superfície: os pontos de entrada Python, WebAssembly e MCP das capacidades da { "0.35" } são camadas finas sobre <c1/>, que chama o código que a linha de comando executa.

# text
seg-8a7389e86887 = Uma passagem que cita clientes de IA de terceiros foi omitida aqui; ela está em <a1>docs/SURFACES.md</a1> no GitHub.

# text
seg-d18c05fd2838 = Plugin

# text
seg-d78822583c64 = Notebook

# text
seg-334caeae9fba = Studio

# text
seg-00c6ee5bf2ea = Confiança do receptor de embarcação, log em lote (pontuação de 0 a 100, motivos)

# text
# c1: /kshana-assess-receiver
# c2: vessel-receiver-trust
seg-b43593b3ede8 = <c1/>, skill <c2/>

# text
seg-6f33cfd0477e = Assess Receiver Trust

# text
seg-3d7149c8caba = Página de confiança marítima

# text
seg-892f8b2c1dc9 = Confiança do receptor em um trecho limitado de fluxo (pontuações, estados, motivos; sem gate)

# text
seg-e9f5fc58fe12 = igual

# text
seg-b3ff5c36ef39 = Assess Receiver Stream (um log armazenado)

# text
# c1: geometry
# c2: label
# c3: geometry
# c4: monitors_run
# c5: class
# c6: geometry_model
# c7: geometry_summary
seg-0b94fa406ab3 = Geometria dos satélites e classes de dedução ({ "0.36" }: <c1/> boa/degradada/desconhecida com motivos e DOP, um <c2/> bom/regular/ruim sempre informado, o monitor <c3/> (nada, a menos que a geometria seja ruim; então, até { "15" } pontos; listado por último em <c4/> quando decidiu, de modo que a contagem de monitores do veredito inclui a geometria), uma <c5/> em toda dedução, <c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: receiver-trust live
# c3: $PKSHT
seg-611550e6f227 = <c1/>, <c2/> (no JSON de resultado e em toda linha JSON; o CSV, o SVG, o veredito de uma linha e <c3/> carregam uma dedução de geometria como qualquer outra e, no mais, permanecem inalterados)

# text
# c1: receiver_trust::geometry
# c2: EpochTrust
# c3: Deduction
# c4: EpochReport
seg-863e12c6ef61 = <c1/>, em <c2/>, <c3/> e <c4/>

# text
# c1: receiver_trust
# c2: assess_vessel_log
# c3: receiver_trust_replay
seg-4d764d29cebe = <c1/>, <c2/>, <c3/> (nos dicts retornados)

# text
seg-3e381a941742 = os mesmos três (no JSON retornado)

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
# c4: geometry_model
# c5: geometry_summary
# c6: trust_telemetry
seg-8411558f9852 = <c1/>, <c2/>, <c3/> (na resposta; a resposta de um log de embarcação mantém <c4/> e <c5/>); <c6/> o renderiza

# text
# c1: vessel-receiver-trust
# c2: trust-telemetry
seg-d397f9a330d2 = igual, skills <c1/>, <c2/>

# text
seg-95093013d169 = as ações acima imprimem a saída da CLI, que a traz

# text
# c1: vessel-trust-and-training
seg-f0bc22ec95d3 = <c1/> (no resultado que ele carrega)

# text
# c1: docs/MARITIME-TRUST.md
seg-86c0548edb03 = <b>pendente</b>: a página de confiança marítima ainda não o mostra (campos listados em <c1/>, item { "6" } da visão do Studio)

# text
# c1: receiver-trust live
# c2: --gate
# c3: --listen
seg-dffdbf379423 = <c1/> como um processo em execução (stdin, arquivo acompanhado, TCP, UDP, <c2/>, <c3/>)

# text
seg-bb4f68155884 = Tools: cartão Command line (o comando a executar; um navegador não é um processo no caminho dos dados)

# text
# c1: lab-attestation
seg-a783976420e6 = Pacote de evidências: criar (assinado, janela de um log; { "0.38" }: um <c1/> opcional, a declaração do operador sobre uma montagem de laboratório, registrada no manifesto assinado, nunca verificada)

# text
seg-65826be9b437 = <b>N/A</b> (chave de assinatura)

# text
# c1: /kshana-evidence-pack
# c2: evidence-pack
seg-95395e63565d = <c1/>, skill <c2/>

# text
seg-cc9b1d83ed15 = Create Evidence Pack (sem campo de attestation na caixa de diálogo na { "0.38" }: <b>pendente</b>; a linha de comando o aceita)

# text
seg-70534bdc6c87 = <b>N/A</b> (uma chave de assinatura não pertence a uma página); Tools: cartão Command line

# text
# c1: import
# c2: score
seg-83d9a9e9603a = Jammertest como árbitro ({ "0.38" }): o catálogo e o plano de transmissão publicados da NPRA lidos como verdade agendada (<c1/>), um log de receptor pontuado em relação a ele por teste (<c2/>: latência de detecção, perdidos, falsos alarmes, tempo de recuperação; MODELLED)

# text
# c1: /kshana-jammertest
# c2: jammertest
seg-38dcbafd214a = <c1/>, skill <c2/>

# text
seg-c61ff1d0f579 = <b>N/A</b> (precisa dos arquivos do plano e de um log em disco; execute-o em um terminal)

# text
seg-5a9087e23823 = <b>N/A</b> (ainda não há notebook)

# text
seg-c92ea39fb2d1 = <b>pendente</b>: um cartão de Tools para a linha de comando (a faixa e as visões do Studio são do WS-A)

# text
# c1: jammertest score --key
# c2: config.json
seg-3eae6f848b58 = Pacote assinado de pontuação do Jammertest (<c1/>: o pacote de evidências de confiança do receptor com o placar e o cronograma dentro de <c2/>)

# text
# c1: create_evidence_pack
seg-f1695a89c33b = <b>N/A</b> (chave de assinatura: use <c1/> em uma janela, ou a linha de comando)

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
seg-a3655f428a0c = Autorrelato do receptor ({ "0.38" }): UBX-NAV-STATUS <c1/> e UBX-SEC-SIG lidos em <c2/> a cada época, e a comparação <c3/> (ambos / somente o receptor / somente o Kshana / nenhum) no resultado; não levanta alarme e não altera nenhuma pontuação

# text
# c1: receiver-trust
# c2: jammertest score
seg-b0190b99d9fd = <c1/> (no JSON de resultado; <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-70c1a825afa5 = <c1/>, <c2/> (nos dicts retornados)

# text
# c1: receiver_trust
seg-0cd306174106 = <c1/> (no JSON retornado)

# text
# c1: assess_receiver_log
seg-0b7d16c95d12 = <c1/> (na resposta)

# text
# c1: epochs[].self_report
seg-833ac4d6bded = <b>pendente</b>: a faixa da página Trust (WS-A; o campo é <c1/>)

# text
seg-c56746c298f2 = Formato de log Septentrio SBF ({ "0.38" }, somente leitura: PVTGeodetic, MeasEpoch, RFStatus)

# text
# c1: receiver-trust
# c2: [log] format = "sbf"
seg-1f4c22e8bf78 = <c1/> com <c2/>

# text
# c1: receiver_trust
# c2: assess_receiver_log
# c3: format = "sbf"
# c4: base64
seg-741ee07949d0 = <c1/>, <c2/> (<c3/>, log como <c4/>)

# text
seg-003608556fc0 = igual

# text
seg-ae8bf32d890b = as ações acima

# text
seg-20f086cdea29 = <b>N/A</b> (o envio de logs binários não é oferecido na página Trust na { "0.38" })

# text
# c1: receiver-trust live --serial <device> [--baud n]
# c2: --configure
seg-1303f81c2407 = <c1/>: um fluxo NMEA serial ou USB, somente leitura (abre o dispositivo para leitura, nunca escreve no receptor; <c2/> é recusado)

# text
seg-59610023b124 = <b>N/A</b> (um dispositivo e um processo)

# text
seg-1fcba825118e = Pacote de evidências: criar (assinado, janela de um log)

# text
seg-fa4022137830 = Create Evidence Pack

# text
seg-e6b694a68935 = Pacote de ida e volta de laboratório (cenário, condições de teste, log do receptor e pontuação ligados por hash)

# text
seg-bfcfc5d28be8 = <b>N/A</b> (as ações do JetBrains são vinculadas a um arquivo selecionado; o pacote precisa de um cenário, condições, um log e uma chave: execute-o no terminal da IDE)

# text
seg-7942dacc8476 = Pacote de evidências: verificar

# text
seg-93a0c989870b = Verify Evidence Pack (somente com chave fixada)

# text
seg-bf617fa341c8 = Tools: Evidence packs (verificar, anexar carimbo de tempo)

# text
# c1: format = "mqtt"
# c2: --mqtt-tcp
seg-49df5efbbd2b = Telemetria de confiança (Prometheus, syslog CEF/LEEF, OTLP; { "0.38" }: <c1/>, descoberta do Home Assistant e linhas de estado; <c2/> publica a partir da CLI)

# text
# c1: trust_telemetry
seg-60d46f0e3ead = <c1/> (saída de texto; sem socket)

# text
# c1: /kshana-trust-telemetry
# c2: trust-telemetry
seg-45ee1c8b6f70 = <c1/>, skill <c2/>

# text
seg-9eff7c00723a = Render Trust Telemetry (um resultado armazenado)

# text
seg-1b60ff4652cd = Tools: cartão Telemetry (aba Command line; somente formatos, sem sockets)

# text
# c1: receiver-trust
# c2: rtklib-pos
# c3: novatel
# c4: gnss-sdr
# c5: [log.imu]
# c6: csv
# c7: euroc
seg-3e332170d963 = Entradas de máquina e de sensores ({ "0.38" }): <c1/> formatos <c2/>, <c3/>, <c4/> e <c5/> (<c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: [log] format
seg-060e5931ac62 = <c1/> (cenário <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-9dad5918cbf9 = <c1/>, <c2/> (em linha)

# text
# c1: receiver_trust
seg-de4cb342c417 = <c1/> (em linha)

# text
# c1: assess_receiver_log
# c2: path
seg-4b6a73f5dc13 = <c1/> (texto/base64 em linha; um <c2/> é recusado)

# text
seg-4c6056fb8884 = <b>N/A</b> (a página Trust do Studio lê os formatos que lista; novos formatos virão com o próximo port dela)

# text
# c1: [accel_classical]
seg-5d69867fc6f8 = Log de IMU para parâmetros de sensores híbridos/de fusão (tabela <c1/> a partir de um log estacionário, ajuste de Allan)

# text
seg-426814dbf8dd = <b>N/A</b> (ainda não há ação de IDE)

# text
seg-e8477119c213 = <b>N/A</b> (o editor de cenários do Studio recebe a tabela colada)

# text
# c1: trust-telemetry --mqtt-tcp
# c2: integrations/ros2
# c3: integrations/gnss-sdr
seg-7cacfab5931c = Nó ROS { "2" }, relé UDP do GNSS-SDR, <c1/> (<c2/>, <c3/>)

# text
seg-70e2e895a01f = processos

# text
# c1: trust_telemetry
# c2: mqtt
seg-c1ad125a051e = <b>N/A</b> (processos de longa duração e sockets; formas de texto: <c1/> com <c2/>)

# text
# c1: docs/OSNMA.md
seg-7527df567fc3 = Verificação OSNMA do Galileo de páginas I/NAV ou de um fluxo UBX (<c1/>)

# text
seg-e5295f10cf3f = <b>N/A</b> (um fluxo bruto longo de receptor se adequa à CLI e ao Python; uma ferramenta de agente acrescentaria uma superfície de entrada grande sem benefício)

# text
# c1: kshana osnma verify
seg-32560c9024ff = <b>N/A</b> (os comandos de plugin rodam sobre o servidor MCP, que não tem ferramenta OSNMA pelo motivo indicado na célula do MCP; execute <c1/>)

# text
# c1: kshana osnma verify
seg-e4b399062eca = <b>N/A</b> (o resultado nada significa sem uma raiz de Merkle ou chave pública confiável, obtida do ICD por outra via e, para a atualidade, uma referência de tempo independente; uma ação de clique com o botão direito não tem onde recebê-las, e um padrão sem fixação seria lido como verificação; execute <c1/>)

# text
seg-dac011642033 = <b>N/A</b> (um fluxo de entrada, um relatório JSON de saída; sem notebook)

# text
seg-dbe4907cd74c = Tools: OSNMA

# text
seg-5ee6c4f68127 = NMEA de treinamento com um log de instrutor

# text
# c1: /kshana-training-scenario
# c2: training-nmea-scenario
seg-e321d52ad21d = <c1/>, skill <c2/>

# text
seg-79776273210a = Generate Training NMEA

# text
seg-899995619176 = Página de debriefing de treinamento

# text
seg-9cb27f0adfb3 = NMEA de treinamento transmitido para um endereço TCP ou UDP

# text
seg-71e498158f5d = Tools: cartão Command line (transmite para um endereço)

# text
seg-6a3b4cf33177 = Mapa de interferência (ADS-B, AIS)

# text
# c1: /kshana-interference-map
# c2: interference-map-route-exposure
seg-3d7c2700cf7d = <c1/>, skill <c2/>

# text
seg-3740aafd1749 = Build Interference Map

# text
seg-b164d99daf08 = Página do mapa de interferência

# text
seg-81d53d4f3a11 = Route Exposure

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-c73605fe5e59 = Plugin Signal K e feed de gate do OpenCPN (<c1/>)

# text
seg-10037d51a377 = <b>N/A</b> (processos)

# text
# c1: /kshana-marine-integrations
# c2: marine-integrations
seg-0360c13bb637 = apenas guia prático: <c1/>, skill <c2/>

# text
seg-e3acebdb4cd0 = Tools: cartão Command line (guia prático; uma implantação)

# text
seg-38fafad3482b = Exportação para test bench (CSV de movimento, NMEA, waypoints, eventos para um simulador de laboratório)

# text
# c1: /kshana-bench-export
# c2: test-bench-export
seg-ffe594484ff8 = <c1/>, skill <c2/>

# text
seg-af0be6bf84c7 = Export Test-Bench Files

# text
seg-e676bae4b98d = Tools: exportação para test bench

# text
seg-394eee3f0c0f = Mapeamento de compliance a partir de execuções (de quais linhas de frameworks públicos o conjunto de execuções fornece evidências em apoio de)

# text
# c1: /kshana-compliance-report
# c2: compliance-mapping
seg-c7782a49a50e = <c1/>, skill <c2/>

# text
seg-a97d66893e2c = Build Compliance Report

# text
seg-314d03d7d075 = Tools: mapeamento de compliance

# text
seg-02601f519c92 = Tabelas e fontes do mapeamento de compliance

# text
seg-31d29baca4c2 = Show Compliance Mapping

# text
seg-01418b04e9bf = Pacotes de padrões (conjuntos de cenários pontuados, com limiares declarados antes da execução: perfis de teste do DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Apêndice F)

# text
# c1: kshana standards-pack
seg-72ea3b5bf39d = <b>N/A</b> (as ações do JetBrains são vinculadas a um arquivo selecionado; os pacotes são incorporados e não precisam de nenhum: execute <c1/> no terminal da IDE)

# text
seg-731504a1218f = <b>N/A</b> (os cartões de Tools do Studio para pacotes pertencem à frente de trabalho do Studio; a CLI ou a saída de qualquer superfície alimenta o cartão de mapeamento de compliance)

# text
# c1: docs/LUNANET-AFS.md
seg-ffab4fc439d9 = LunaNet Augmented Forward Signal: códigos, SB1/CRC/entrelaçador e uma verificação em relação ao LSIS-AFS V1.0 (<c1/>)

# text
# c1: lunanet-afs-check
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: iq scene/acquire/track/sweep
seg-c348615fae6f = <c1/>; sinais <c2/>, <c3/> em <c4/>

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-a4f461bbd9fa = <c1/>, <c2/>, <c3/>; <c4/> etc. com os dois nomes de sinal

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-3fddaefc42f4 = <c1/>, <c2/>, <c3/>; <c4/> etc. por meio das execuções curtas em memória

# text
# c1: kshana lunanet-afs-check
seg-338350a8097c = <b>N/A</b> (as ações do JetBrains são vinculadas a um arquivo selecionado; execute <c1/> no terminal da IDE)

# text
seg-01a840e0bdc8 = <b>N/A</b> (um cartão do Studio é um item da frente de trabalho do Studio; a CLI e todas as outras superfícies o trazem)

# text
# c1: docs/SKYLINE.md
seg-d04d7f608263 = Geometria do céu sob um skyline: satélites visíveis e mascarados, DOP, covariância ENU, elipse de erro (<c1/>)

# text
# c1: /kshana-run
seg-9dfe4289533b = <c1/> (aponta para a ferramenta)

# text
# c1: kshana sky
seg-f21f2810b363 = <b>N/A</b> (um skyplot interativo é uma visão de navegador; <c1/> cobre os números)

# text
seg-f923796dab30 = — (a visão Geometry do Studio é acrescentada separadamente na { "0.36" })

# text
seg-26c89146e670 = Nuvem de Monte Carlo do céu (erros de mínimos quadrados com semente fixa, RMS, contenção de { "95" } %)

# text
seg-3627b76a3778 = <b>N/A</b> (amostras em grande volume que um agente deve resumir, não transportar)

# text
seg-4ebfbca0614e = <b>N/A</b> (sem ferramenta MCP)

# text
seg-8b6155019a17 = <b>N/A</b> (como acima)

# text
seg-586e8d98ecd9 = — (como acima)

# text
# c1: docs/SKYLINE.md
seg-ae43880fd2cc = Predefinições e perfis de skyline (<c1/>)

# text
seg-ad514737bf83 = Skyplot como SVG

# text
# c1: sky_geometry
seg-9a6087f458bc = <b>N/A</b> (um agente lê os números de <c1/>)

# text
# c1: [skyline]
# c2: user_site
seg-6de10d28a5fc = Seção skyline em um cenário (<c1/>: orbit e integrity com <c2/>, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario)

# text
seg-65ffc53b15fa = o arquivo do cenário

# text
seg-74fac0bacb76 = Run Kshana Scenario

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
seg-f71e5e2eb4f3 = Enlace óptico de temporização através da atmosfera: disponibilidade por local, diversidade de locais, técnicas de melhoria, acoplamento entre interrupção e holdover (tipo de cenário <c1/>; <c2/>; MODELLED, locais ILLUSTRATIVE, consultivo)

# text
seg-490147c5e7ec = <b>pendente</b>: ainda não há visão no Studio; o cenário roda no executor de cenários do Studio e no cartão Command line de Tools

# text
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-de2c788670aa = Teste de holdover pontuado a partir de um registro de erro de tempo fornecido pelo operador: linha de base, GNSS removido pelo operador, holdover, recuperação, medido em relação a máscaras da ITU-T (tipo de cenário <c1/>; <c2/>; MODELLED, consultivo; o Kshana não transmite nem aciona nada)

# text
# c1: run
# c2: samples
# c3: clock_log.text
seg-3fdb9a269cd0 = <c1/> (<c2/> ou <c3/> em linha; as chaves de arquivo são recusadas)

# text
# c1: run_scenario
seg-d946c75f821a = <c1/> (somente em linha)

# text
# c1: run
seg-b91e77ef7186 = <b>N/A</b> (sem notebook na { "0.38" }; os cenários de exemplo rodam em qualquer notebook por meio de <c1/>)

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-5041a1d6272f = O GNSS além da constelação: disponibilidade dos sinais GPS, GLONASS, Galileo, BDS, QZSS e NavIC para um usuário em uma shell ou em uma trajetória de LEO a transferência lunar (diagrama de transmissão do folheto, paramétrico ou medido, meio de raio no limbo, projeto de receptor de sinal fraco), um EKF GNSS de bordo para naves em órbita alta e de transferência lunar, e navegação relativa em formação (tipo de cenário <c1/>; <c2/>; MODELLED, consultivo; comparado com o folheto SSV do ICG sob um pré-registro, <c3/>)

# text
# c1: run
# c2: transmit.pattern_text
seg-3e16823c1c90 = <c1/> (em linha; <c2/> traz um diagrama medido em linha)

# text
# c1: run_scenario
# c2: transmit.pattern_csv
seg-126a59c992d9 = <c1/> (somente em linha; <c2/> é recusado)

# text
# c1: run
seg-2010eb196565 = <b>N/A</b> (sem notebook na { "0.38" }; os cenários rodam em qualquer notebook por meio de <c1/>)

# text
# c1: lunar-infrastructure
# c2: study = ...
# c3: docs/LUNAR-INFRASTRUCTURE.md
seg-593b7761803d = Órbita e superfície lunares como infraestrutura de navegação e geodésica: consistência da determinação de órbita, resolução de ambiguidade da fase da portadora, coestimação de referencial, space-tie e sensibilidade ao número de Love (tipo de cenário <c1/>, <c2/>; <c3/>; MODELLED, entradas ILLUSTRATIVE, consultivo)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-34ed7b4d59e4 = <c1/> (e os cinco exemplos irmãos)

# text
# c1: run
seg-ba584b2da776 = <b>N/A</b> (sem notebook; os exemplos rodam em qualquer notebook por meio de <c1/>)

# text
seg-b5ae9f9fd5df = <b>pendente</b>: ainda não há visão no Studio; os cenários rodam no executor de cenários do Studio e no cartão Command line de Tools

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
# c4: tracking
# c5: statistics
# c6: [clock_log]
# c7: [series.clock_log]
# c8: docs/CLOCK-LOG-FORMATS.md
seg-3103be5ffa0a = Logs de relógio medidos, lidos como uma série de fase: linuxptp <c1/>, <c2/>, <c3/>, chrony <c4/> e <c5/>, ao lado de RINEX clock, TimeLab e TICC (<c6/> / <c7/>; <c8/>; MODELLED, nenhuma referência independente compara uma leitura com a de outro leitor)

# text
# c1: [clock_log]
seg-5b9d4cfbbbf7 = um cenário com <c1/>

# text
# c1: run
# c2: text
seg-f0ac32797edb = <c1/> (<c2/> somente em linha; sem leitura de arquivos em um navegador)

# text
# c1: run_scenario
# c2: text
# c3: path
seg-bf0495255831 = <c1/> (<c2/> somente em linha; <c3/> é recusado)

# text
seg-aa26d73d9b79 = <b>N/A</b> (sem notebook; um log é um arquivo que o usuário fornece)

# text
seg-d1ebbe70e454 = <b>pendente</b>: ainda não há visão no Studio; o executor de cenários do Studio recebe o texto do cenário

# text
# c1: /studio/optical/
seg-04edbdcaf5c7 = a visão Optical PNT do Studio (<c1/>, { "0.38" }) desenha os resultados registrados dos dois cenários incluídos, inclusive a série temporal com semente fixa; o cenário também roda no executor de cenários do Studio e no cartão Command line de Tools

# text
# c1: interference-map fetch-land
seg-dbe94c1cb4b0 = Download de polígonos de terra (<c1/>)

# text
seg-d61b28df9367 = Código da CLI

# text
# c1: --allow-network
seg-3c816222df90 = Tools: cartão Command line (precisa de <c1/>)

# text
# c1: docs/BENCH.md
seg-858b2c4a1451 = Benchmark (kshana-bench v1: pontuar uma submissão em relação a um arquivo de verdade, página de classificação; <c1/>, MODELLED, consultivo)

# text
seg-f6e2271206a6 = <b>N/A</b> (as duas ferramentas MCP o trazem; um comando de barra sobre dois arquivos JSON não acrescenta nada)

# text
seg-4edd4fe793f1 = <b>N/A</b> (não é uma ação de IDE)

# text
seg-15ffa4639a46 = <b>N/A</b> (notebooks educacionais são uma frente de trabalho separada)

# text
# c1: bench/site/
seg-5d48d48ae295 = <b>N/A</b> (a classificação é a página estática <c1/>, portada para o site como está; o Studio não calcula nada)

# text
# c1: bench truth|cases|baseline|seal|reveal-check|manifest|verify-manifest|validate
seg-f730ab44ca82 = Dados de benchmark e ferramentas de conjunto reservado (<c1/>)

# text
# c1: seal
seg-efdc66eff3d8 = <b>N/A</b> (a CLI lê diretórios de conjuntos de dados e arquivos de relógio e, para <c1/>, um arquivo de semente secreta; uma semente não deve passar por um agente nem por uma página)

# text
# c1: interference-map daily|sensitivity
# c2: docs/observatory/METHOD.md
seg-2146297abaf0 = Produto diário e estudo de sensibilidade do observatório (<c1/>; <c2/>)

# text
seg-f359f5223666 = <b>N/A</b> (os comandos leem um diretório de arquivo com centenas de milhares de arquivos, escrevem quatro arquivos, inclusive um PNG, e impõem o atraso de liberação de { "24" } h em relação ao relógio da máquina que publica; o mapa em CSV está em todas as superfícies na linha acima)

# text
# c1: trust/
# c2: training/
# c3: interference/
# c4: geometry/
# c5: lunar/
# c6: lunar-station-coverage
# c7: #osnma
# c8: #evidence
# c9: #bench
# c10: #compliance
# c11: #ai
# c12: —
seg-55cf42830155 = O Kshana Studio é o aplicativo web construído sobre o build WebAssembly; assim, existe uma visão do Studio onde a coluna WASM tem um ponto de entrada e, onde não tem, a célula aponta para um <b>cartão Command line</b> (o comando a executar, com seus argumentos), nunca para um resultado que o Studio calculou. Páginas (kshana.dev/studio/, no lado do cliente): <b>Maritime trust</b> (<c1/>), <b>Training debrief</b> (<c2/>), <b>Interference map</b> (<c3/>), <b>Geometry</b> (<c4/>: um skyplot representativo, skyline, DOP, elipse de erro e nuvem de Monte Carlo do motor; { "0.36" }), <b>Lunar station</b> (<c5/>: a cobertura modelada de uma estação de referência lunar a partir do tipo <c6/>; { "0.36" }) e a página <b>Tools</b>, cujas seções são OSNMA (<c7/>), Evidence packs (<c8/>), exportação para test bench (<c9/>), mapeamento de compliance (<c10/>), a aba Command line (cartão de telemetria, IQ, integrações marítimas: comandos a executar) e Use from your AI assistant (<c11/>). Um <c12/> na coluna Studio da tabela de subcomandos é um comando que não é uma das capacidades da { "0.35" } que o Studio apresenta.

# text
seg-73006c42aef2 = Por que as células N/A são N/A

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-6d586f5fbaa3 = <b>Signal K e OpenCPN.</b> São consumidores do processo ao vivo em execução e do seu gate TCP; portanto, são implantações de linha de comando; o plugin traz um comando de guia prático e uma skill que apontam para <c1/> e não chamam nenhuma ferramenta.

# text
seg-79ec7e7307da = Um processo em execução.

# text
# c1: receiver-trust live
# c2: position
# c3: advisory
# c4: geometry
# c5: class
# c6: receiver-trust live
# c7: --replay
# c8: --udp <port>
# c9: --listen tcp:<port>
seg-17fcf959153f = <c1/> mantém um fluxo aberto, pode servir o fluxo com gate a qualquer número de clientes TCP e roda até ser interrompido. Uma chamada Python, uma chamada de navegador, uma chamada de ferramenta MCP e uma ação de IDE retornam cada uma quando terminam e não mantêm um socket aberto para outros. Python, WASM e MCP trazem, em vez disso, a forma limitada: um trecho pontuado pelo mesmo motor, no esquema ao vivo (linhas JSON { "1.3" }: <c2/>, uma declaração <c3/> e a <c4/> dos satélites em toda época, uma <c5/> em toda dedução), sem socket e sem gate (o gate marca uma solução como inválida em um fluxo ao vivo, o que só um processo no caminho dos dados pode fazer). Dois comportamentos pertencem ao processo e não estão nas ferramentas de trecho: um fluxo reproduzido mais rápido que o tempo real por <c6/> sem <c7/> é pontuado como não confiável (seu tempo discorda do relógio do host; um trecho é lido sem relógio de host), e <c8/> e <c9/> vinculam o endereço de loopback, a menos que um endereço seja dado.

# text
# c1: trust_telemetry(input, format, host, input_kind, options_json)
# c2: trust_telemetry
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: trust-telemetry
# c6: kshana trust-telemetry --result session.result.json --print-metrics
# c7: TRUST-TELEMETRY.md
seg-824d2bbbf280 = <b>Telemetria de confiança.</b> O WASM traz <c1/>: os mesmos codificadores, retornando texto Prometheus, linhas de syslog CEF ou LEEF, ou o payload JSON OTLP para um fluxo ou um resultado em lote, sem relógio (as linhas de syslog carregam o timestamp nulo da RFC { "5424" }) e sem nada enviado. O Python (<c2/>) e o MCP (<c3/>, com o comando de plugin <c4/>) também a trazem. O restante de <c5/> serve métricas Prometheus, envia syslog e exporta OpenTelemetry a partir de um fluxo em execução; portanto, é um processo por natureza. Guia prático: encaminhe o comando ao vivo para ele, ou reproduza um arquivo de resultado (<c6/>); veja <a1><c7/></a1>. Um agente ou um notebook que queira as pontuações por época chama, em vez disso, as funções de lote ou de trecho.

# text
# c1: evidence_verify
seg-a5c2ef208191 = <b>Criar um pacote no navegador.</b> A assinatura precisa de uma chave privada, que não deve passar por uma página web; o build para navegador verifica pacotes (<c1/>) e as outras superfícies os criam. A ferramenta MCP nunca retorna nem registra a semente de assinatura e, sem uma, assina com uma chave descartável (integridade, não identidade); para uma chave que importe, use a CLI. O mesmo vale para transmitir NMEA de treinamento a um endereço: Python, WASM e MCP retornam o texto gerado, e a CLI o envia.

# text
seg-dea93c47b3b1 = Suítes de estudo.

# text
# c1: --study <suite.toml>
# c2: run
# c3: run_scenario
# c4: run_all
seg-2e88bb410874 = <c1/> executa um manifesto que nomeia arquivos de cenário irmãos em disco. As superfícies em memória recebem texto de cenário, não uma pasta de arquivos; por isso, executam cada membro como um cenário (<c2/>, <c3/>, <c4/>).

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: iq extract
# c3: convert
# c4: decimate
# c5: iq labfit
# c6: iq conditions
seg-d08f585c4f02 = <b>IQ de GNSS no navegador, e gravações reescritas.</b> Uma gravação tem gigabytes de amostras, que uma página não consegue conter e que o protocolo MCP não deve carregar; assim, o WASM não tem funções de IQ e as ferramentas MCP leem e escrevem em um único diretório de trabalho (<c1/>, com um orçamento de amostras por chamada). <c2/>, <c3/> e <c4/> existem para reescrever gravações em disco e permanecem exclusivos da linha de comando. <c5/> e <c6/> carregam texto, de modo que o MCP os recebe em linha (um log que nomeia um arquivo é recusado).

# text
# c1: curl
# c2: --allow-network
# c3: curl
# c4: land_geojson
seg-f571dc5c2330 = <b>O download de terra.</b> É o único comando que abre uma conexão de rede, precisa do <c1/> do sistema e de um <c2/> explícito, e confere um SHA-256 fixado. O navegador não tem <c3/>, e um agente de IA não deve buscar dados em nome do usuário; as outras superfícies recebem o arquivo de terra como texto (<c4/>).

# text
seg-f81f6b6a2e67 = Arquivos e diretórios de traços.

# text
# c1: interference-map adsb
seg-2f226f3955d9 = <c1/> sobre um diretório de traços do readsb lê arquivos do disco e é exclusivo da linha de comando; as superfícies em memória recebem texto CSV.

# text
seg-6fb9f23090ca = Todo subcomando da linha de comando e quem o cobre

# text
# c1: kshana --help
seg-4a225d5d59af = Uma linha por subcomando ou modo de <c1/>. <b>yes</b> indica o ponto de entrada; <b>no</b> é uma lacuna com o seu motivo; <b>N/A</b> é uma superfície que não consegue carregá-lo pelo motivo dado acima ou na última coluna. As ações do JetBrains executam a linha de comando; portanto, um <b>N/A</b> ali declara por que não existe ação de IDE.

# text
seg-35720f38b1a5 = Subcomando

# text
# c1: kshana <scenario.toml>
seg-d46c11fa6dea = <c1/> (executar, gráfico, tabela)

# text
# c1: error_kind
seg-af645810cc0c = <c1/> (uma execução lança erro diante de um cenário inválido)

# text
seg-7d6c8218a4a6 = Validate Scenario

# text
seg-d75a5f64c7cc = <b>N/A</b> (nomeia arquivos irmãos em disco)

# text
seg-16775dd25139 = Uma suíte nomeia arquivos de cenário irmãos em disco (N/A acima); execute cada membro como um cenário

# text
seg-1742459cb792 = Export Scenario

# text
# c1: utf-8
seg-2bc957bd567b = Os arquivos voltam como texto (<c1/>) ou base64 (as amostras SigMF)

# text
seg-bf69da729efd = Import Route

# text
seg-6d762f20af07 = Animate Scenario

# text
seg-052c13118454 = No máximo { "120" } quadros por chamada; sequências mais longas usam a CLI

# text
# c1: sky <request>
# c2: --monte-carlo
# c3: --svg
seg-5580a1a89bcb = <c1/> (ou flags), <c2/>, <c3/>

# text
# c1: sky_geometry
seg-b96c18c1f157 = <c1/> (sem Monte Carlo, sem SVG)

# text
seg-5b62ca019ebd = <b>N/A</b> (veja a linha de capacidade)

# text
seg-4f7453d89d9d = Geometria MODELLED; saída em JSON ou SVG

# text
seg-c853beadb55e = Predefinições REPRESENTATIVE com proveniência

# text
seg-52638393d72d = List Scenario Kinds

# text
seg-69bc0d382eb7 = Insert Example Scenario

# text
# c1: python
# c2: wasm
seg-611dbcb5a15c = Os recursos <c1/> e <c2/> compilam o texto de exemplo no binário (cerca de { "0.7" } MB)

# text
# c1: receiver-trust <scenario.toml>
seg-51e0c2c100f8 = <c1/> (em lote)

# text
# c1: receiver_trust_replay
seg-c9421c4d744f = trecho: <c1/>

# text
# c1: assess_vessel_stream
seg-6a2439967519 = trecho: <c1/>

# text
seg-efe5e5dbe710 = trecho

# text
# c1: --file
seg-816f9bd210d5 = Assess Receiver Stream (um log armazenado, <c1/>)

# text
seg-d81457d8f038 = Página de confiança marítima (trecho); cartão Command line para o processo

# text
seg-9cf210dd2301 = Um processo em execução; o trecho não tem socket nem gate (N/A acima)

# text
seg-315d0dcd39fb = Somente texto em todas as superfícies, sem socket; os exportadores em execução são um processo (veja acima)

# text
seg-5c93482c9ae4 = Texto de entrada, JSON de saída; MODELLED

# text
seg-3763f34af33d = N/A (veja acima)

# text
# c1: --json
# c2: advisory
seg-4110fadc04db = O mesmo JSON de <c1/>, com o aviso consultivo em seu campo <c2/>; a leitura de arquivo passa a ser bytes em memória. Apenas situação de autenticação: não é um serviço de integridade de navegação, e não há alegação de desempenho antispoofing

# text
# c1: receiver-trust evidence
seg-399524b468f3 = <c1/> (criar um pacote)

# text
seg-6dfc4b352892 = Tools: cartão Command line (sem chave de assinatura em uma página)

# text
seg-69dadb564662 = Sem chave de assinatura em um navegador

# text
seg-fd26107fa3cd = <b>N/A</b> (terminal; precisa de arquivos)

# text
seg-38dc9c30191a = <b>pendente</b>: Tools: cartão Command line

# text
# c1: --key
seg-57257e80468f = O plano e o catálogo são dados como texto; o pacote assinado (<c1/>) é exclusivo da linha de comando (chave de assinatura)

# text
seg-3ea5db063974 = Sem chave de assinatura em um navegador; nenhum sinal é escrito ou reproduzido

# text
seg-8b27a6ca1aef = <b>N/A</b> (uma chave privada nunca é criada nem lida pelo plugin)

# text
seg-dda21be14d64 = Tools: cartão Command line

# text
seg-03376576d0b6 = O Python retorna a chave em memória com um aviso; uma chave privada não deve passar por uma conversa nem por uma página

# text
seg-cd21674be5d7 = Attach Timestamp

# text
# c1: openssl ts -verify
seg-6c0caa6e1be2 = Token como bytes ou base64, pacote atualizado retornado em memória; a assinatura da autoridade não é verificada (<c1/>)

# text
seg-907eedb51849 = <b>N/A</b> (veja a Nota)

# text
seg-f70892a9f007 = Envia para um endereço (N/A acima)

# text
# c1: interference-map adsb|ais
seg-76bcb50897c6 = <c1/> (CSV)

# text
# c1: interference-map adsb
seg-79f851a94048 = <c1/> (diretório de traços)

# text
seg-d2cc933b6894 = Lê um diretório (N/A acima)

# text
seg-316b51d83726 = Acesso à rede (N/A acima)

# text
seg-b611fd739914 = Lê um diretório de arquivo e escreve arquivos; o atraso de liberação é imposto na máquina que publica (N/A acima)

# text
seg-96b313373128 = N/A (a ferramenta MCP o traz)

# text
seg-cb1fc7c162e3 = Texto de entrada, texto de saída; nada é lido nem escrito

# text
# c1: bench/site/
seg-5292a4966861 = a página estática <c1/>

# text
seg-839999463148 = Texto HTML

# text
seg-bb10d5a1eb50 = Arquivos de conjunto de dados e uma semente secreta (N/A acima)

# text
seg-45bbda779645 = Retorna texto, não escreve nada; sem sinal

# text
seg-0e64b97b025b = <b>N/A</b> (as gravações têm gigabytes em arquivos; veja a Nota)

# text
# c1: --format sdrx[:ci16_le]
# c2: .sdrx
# c3: format: "sdrx"
seg-7c9273837b73 = As amostras são arquivos. <c1/> (ou um caminho de saída terminado em <c2/>) escreve metadados ION GNSS SDR ao lado das amostras: a CLI e o MCP (<c3/>) os escrevem; o Python retorna as amostras em memória e não escreve arquivo, de modo que os metadados não têm forma em Python (<b>N/A</b>)

# text
# c1: rows
# c2: tests
seg-4f1cc14c9af4 = Os cenários são incorporados; não há sistema de arquivos; <c1/> e <c2/> imprimem as tabelas de documentação versionadas e são exclusivos da CLI

# text
seg-5de02dcfb151 = Os fluxos de símbolos são texto de { "0" } e { "1" }, no máximo { "4" } MiB (MCP) ou { "100" } quadros gerados por chamada; LDPC e CRC-24Q dos subquadros { "2" } a { "4" } não são verificados; nenhum sinal é escrito

# text
seg-db29ea94222b = As amostras são arquivos

# text
# c1: iq_labfit
seg-9b7afa156e9a = <c1/> (logs em linha, sem arquivos)

# text
# c1: --follow [--idle-timeout <s>]
# c2: iq::io::follow::open_sigmf_follow
# c3: receiver-trust live
# c4: iq_monitor
seg-295fe0c63fe2 = <c1/> lê uma gravação SigMF que ainda está sendo escrita, somente recepção (<c2/> em Rust): <b>N/A</b> para Python e MCP, porque uma chamada que espera um arquivo crescer não retorna quando o trabalho termina, o mesmo motivo pelo qual <c3/> também é exclusivo da linha de comando; a gravação em seu comprimento atual passa por <c4/>

# text
# c1: iq_test_conditions
seg-e651dceda9b2 = <c1/> (texto, em linha)

# text
seg-237bb76fae50 = O inventário de uma pasta é feito por Python e CLI; o servidor MCP lê um único diretório de trabalho

# text
seg-654781b74f2a = Eles reescrevem gravações em disco (N/A acima)

# text
# c1: iq --help
seg-6a010403db35 = a lista de sinais (<c1/>)

# text
# c1: kshana iq --help
seg-1154d82301ca = <b>N/A</b> (uma lista; execute <c1/>)

# text
seg-8c90b8cb2e78 = Funções utilitárias

# text
seg-3d9ac26ec730 = Pequenos pontos de entrada que não são uma linha de capacidade, e onde cada um fica:

# text
# c1: kshana.version()
# c2: kshana.__version__
# c3: version
# c4: --version
seg-b8c43ffb2a13 = Python (<c1/>, <c2/>), WASM (<c3/>), CLI (<c4/>), MCP (as informações do servidor)

# text
seg-3f32bbece220 = A versão do motor

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: iq_*
seg-d5fb77719df2 = Lê um arquivo binário <c1/> que <c2/> escreveu. <b>N/A</b> nos demais: ele lê um arquivo do disco (o WASM não tem sistema de arquivos, o MCP lê um único diretório de trabalho apenas por meio das ferramentas <c3/>)

# text
# c1: ?s=
seg-57ef8e3fe6bc = O codec de link de compartilhamento <c1/> do playground do navegador (TOML de cenário para um token seguro para URL e de volta). <b>N/A</b> nos demais: um link para uma página web não tem significado para uma linha de comando, uma chamada Python ou um agente

# text
seg-bd6e451f5cdf = Limites que diferem por superfície

# text
seg-8f3e8345d90d = Limite de entrada

# text
seg-4b5abdf098e3 = Arquivos

# text
seg-1910f2cef7da = { "4" } MiB por entrada de texto ({ "2" } MiB e { "20,000" } épocas para um trecho de fluxo); as respostas trazem no máximo { "2000" } linhas NMEA, { "200" } linhas de época não nominal e { "4" } MiB de GeoJSON ou de arquivos de pacote

# text
# c1: iq_*
seg-116e2d0202f4 = somente conteúdo em linha: um campo de cenário que nomeia um arquivo é recusado; as ferramentas <c1/> usam um único diretório de trabalho opcional, com todo caminho confinado a ele

# text
# c1: --http
seg-ee5e8de88144 = MCP sobre HTTP (<c1/>, hospedado pelo próprio usuário)

# text
seg-f095909e9feb = como o MCP, com um corpo de requisição de { "5" } MiB, { "120" } s por requisição e { "8" } requisições simultâneas por padrão

# text
# c1: iq_*
seg-95d4ab7863e6 = nenhum: as ferramentas de arquivo <c1/> ficam desativadas; toda outra ferramenta recebe conteúdo em linha

# text
seg-a8b290453c39 = Python, Rust

# text
seg-3df89722db78 = { "64" } MiB por entrada de texto

# text
# c1: receiver_trust
# c2: path
seg-00acf8b1ff29 = <c1/> pode nomear um <c2/> que o processo consiga ler

# text
seg-cf23db887749 = { "64" } MiB por entrada de texto, dentro da própria memória do navegador

# text
seg-e38059970288 = nenhum: o navegador não tem sistema de arquivos, nada é enviado

# text
seg-241399edb372 = Níveis de evidência e ressalvas em cada superfície

# text
seg-b3307ae773f7 = Um pacote de evidências é um <b>registro técnico</b> do que o motor calculou a partir de um log sob configurações declaradas, com cada hash e uma assinatura sobre eles. Não é um parecer jurídico, uma constatação de fato sobre qualquer evento nem uma aprovação. Um resultado positivo da verificação diz que o registro não foi alterado; sem uma chave pública confiável, prova apenas a integridade em relação à chave que o próprio pacote nomeia.

# text
seg-0d8ed8b92a00 = Os monitores de confiança do receptor e a pontuação de confiança são <b>MODELLED</b>: os limiares são entradas declaradas e nada afirma como eles se comportam diante de interferência real. A saída é <b>consultiva</b>; o Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e o operador continua responsável. Uma pontuação alta não é prova de uma solução de posição genuína.

# text
seg-606127880e96 = O mapa de interferência é <b>MODELLED</b> (limiares pré-registrados, não validados em relação a uma medição de verdade de campo). Uma célula degradada não identifica a interferência como a causa; uma célula não observada não é evidência de uma rota livre; ele descreve relatos passados e não é uma previsão. É somente agregado: nenhum identificador é retornado.

# text
seg-b2fd2a05842f = O NMEA de treinamento é <b>somente texto</b>: nenhum sinal de RF, IQ ou forma de onda é sintetizado, nada é transmitido, e ele nunca se destina aos sistemas de navegação ao vivo de uma embarcação.

# text
seg-4e3bbacda9ac = <s1>Anterior</s1>Uso do Kshana a partir de um agente

# text
seg-c5fbfab85e01 = <s1>Próximo</s1>Plugin do JetBrains

seg-6555ff9a6d8e = Saída

seg-12471a4b2b57 = Região do emissor (ADS-B, AIS; MODELLED)

seg-0a58678302e5 = <b>N/A</b> (ainda não incluído; as superfícies Rust, Python e WASM o cobrem)

seg-dff1bfe0263e = <b>N/A</b> (a publicação de regiões de emissores no observatório público é uma decisão separada do responsável e está desativada)

seg-ec2d91e2f867 = Verificação de envio de parceiro de dados (formato e metadados de um envio de dados medidos, <c1/>; não pontua nada)

seg-c16a5ff8218b = <b>N/A</b> (a verificação lê arquivos locais e seus SHA-256; a API Rust é a superfície de biblioteca e a CLI é a ferramenta)

seg-ed29039d1dc0 = <b>N/A</b> (sem sistema de arquivos na build para navegador)

seg-b3397901ea5f = <b>N/A</b> (o MCP recusa fontes de arquivo por projeto (apenas texto embutido))

seg-c5fc0c41b9bb = <b>N/A</b> (os comandos com barra chamam ferramentas do MCP, e esta verificação precisa de arquivos em disco)

seg-be971c31e0de = <b>N/A</b> (as ações do JetBrains estão ligadas a um arquivo selecionado; um envio é uma pasta)

seg-b9e56d6ab03b = <b>N/A</b> (o Studio não tem acesso ao sistema de arquivos; execute o comando)

seg-521b58a1080e = Orçamento de erro de navegação e temporização de uma cadeia de fases de missão do lançamento à reentrada: oito tipos de fase, regras de transferência, conversões de referencial e de escala de tempo, uma sobreposição de rede terrestre, margem em relação aos requisitos declarados e o elo mais fraco (tipo de cenário <c1/>; <c2/>; MODELLED, entradas ILLUSTRATIVE, consultivo; apenas fontes públicas, sem aval)

seg-6b451021b87a = <c1/> (a partir de um checkout: ele lê um recorte versionado de kernel da Lua)

seg-ac3e013b5217 = <c1/> (<c2/> é uma chave de arquivo e é recusada; sem um kernel a Lua é a série analítica e a linha de conversão o declara)

seg-e957474f44a8 = <c1/> (apenas embutido; a chave do kernel é recusada)

seg-1c1729fafe99 = <b>N/A</b> (sem notebook; o exemplo é executado em qualquer notebook por meio de <c1/> a partir de um checkout)

seg-39e5b9fc3560 = <c1/> (CSV)

seg-743d33b43d99 = N/A (ainda não incluído)

seg-ab52a3469f6a = Regiões estimadas de emissores, MODELLED; diretórios de rastros e <c1/> são apenas de linha de comando

seg-5f1ce275acbd = Lê um arquivo de envio e seu arquivo de dados em disco e verifica o SHA-256; nenhuma dessas superfícies tem a pasta. Apenas formato e metadados, nada pontuado; veja <c1/>

seg-fc9ab9f71553 = O rótulo de evidência e as saídas que não trazem nenhum

seg-b1e4bcc2ac09 = Cada figura e tabela que uma execução grava traz seu nível de evidência (<c1/>, <c2/> ou <c3/>, o mais fraco das linhas do registro por trás dele) e os ids dessas linhas, em toda superfície que executa um cenário: o JSON de resultado (chave <c4/>), o SVG do gráfico (elemento de metadados e uma linha sob o gráfico) e a tabela CSV (linhas de comentário <c5/>). O mesmo rótulo está nas saídas de receiver-trust (CLI, MCP, Python), <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, no relatório de rota do mapa de interferência, e dentro do <c11/> de cada pacote de evidências (assinado; <c12/> o informa). Os ids das linhas são estáveis (<c13/> e oito dígitos hexadecimais, a coluna <c14/> de <c15/>).

seg-c66058f24f0e = Estas saídas não trazem rótulo, cada uma por um motivo declarado (a lista é <c1/> em <c2/>, que falha diante de um gravador que não está rotulado nem listado):

seg-04ca90423b80 = Por que não traz rótulo

seg-a90c022c4dea = arquivos de resultado do kshana-bench

seg-9f3f0adbcfe6 = um esquema fixo, fixado pelos compromissos do conjunto reservado; cada um traz seu próprio <c1/> (MODELLED ou measured)

seg-9bb126104f12 = produtos diários do observatório de interferência (GeoJSON, PNG, JSON de incidentes)

seg-ddbc60cb14ac = um esquema congelado e publicado; as ressalvas da nota de método os acompanham

seg-874cb55d3457 = arquivos de célula, de placar e de relatório da campanha IQ

seg-8c8cb4bd5110 = fixados por resumo; cada um declara o placar da campanha que reapresenta

seg-8d2645e93451 = amostras IQ, metadados SigMF e SDR, referência de cena, fluxos de épocas e de eventos de rastreamento, registros de sessões ao vivo

seg-9fa872028a08 = arquivos presos a um formato e fluxos de registros lidos por outras ferramentas

seg-6c77071a0d03 = exportações SP3, OMM, OEM, CZML, KML, GeoJSON, STK, de movimento para test bench e NMEA; o fluxo NMEA de treinamento

seg-5c1b92afa402 = arquivos presos a um formato lidos por ferramentas de terceiros

seg-b5c79a0e395c = formatos de transmissão de telemetria (Prometheus, OTLP, CEF, LEEF)

seg-8cd0fdb609e5 = definidos por seus formatos de transmissão

seg-3ba06004fc14 = documentos gerados (o próprio registro, as tabelas de estudo e de dados versionadas)

seg-8be4943acd00 = não são a saída de uma execução
