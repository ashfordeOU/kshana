# docs--surfaces: translations (pt-PT)

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
seg-4d8a164605fb = Todas as capacidades estão disponíveis nas superfícies onde fazem sentido; onde uma superfície não pode suportar uma capacidade, a célula diz <b>N/A</b> e porquê. O mesmo motor corre por trás de todas as superfícies: os pontos de entrada Python, WebAssembly e MCP das capacidades da { "0.35" } são invólucros finos sobre <c1/>, que chama o código que a linha de comandos executa.

# text
seg-8a7389e86887 = Uma passagem que nomeia clientes de IA de terceiros é omitida aqui; consta de <a1>docs/SURFACES.md</a1> no GitHub.

# text
seg-d18c05fd2838 = Plugin

# text
seg-d78822583c64 = Notebook

# text
seg-334caeae9fba = Studio

# text
seg-00c6ee5bf2ea = Confiança do recetor de embarcação, registo em lote (pontuação de 0-100, motivos)

# text
# c1: /kshana-assess-receiver
# c2: vessel-receiver-trust
seg-b43593b3ede8 = <c1/>, skill <c2/>

# text
seg-6f33cfd0477e = Avaliar a confiança do recetor

# text
seg-3d7149c8caba = Página de confiança marítima

# text
seg-892f8b2c1dc9 = Confiança do recetor num excerto limitado de um fluxo (pontuações, estados, motivos; sem gate)

# text
seg-e9f5fc58fe12 = igual

# text
seg-b3ff5c36ef39 = Avaliar fluxo do recetor (um registo guardado)

# text
# c1: geometry
# c2: label
# c3: geometry
# c4: monitors_run
# c5: class
# c6: geometry_model
# c7: geometry_summary
seg-0b94fa406ab3 = Geometria dos satélites e classes de dedução ({ "0.36" }: <c1/> boa/degradada/desconhecida com motivos e DOP, uma <c2/> boa/razoável/fraca sempre reportada, o monitor <c3/> (nada, a menos que a geometria seja fraca, e então até { "15" } pontos; listado em último em <c4/> quando decidiu, pelo que a contagem de monitores do veredicto inclui a geometria), uma <c5/> em cada dedução, <c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: receiver-trust live
# c3: $PKSHT
seg-611550e6f227 = <c1/>, <c2/> (no JSON de resultado e em cada linha JSON; o CSV, o SVG, o veredicto de uma linha e <c3/> trazem uma dedução de geometria como qualquer outra e, no mais, não se alteram)

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
seg-4d764d29cebe = <c1/>, <c2/>, <c3/> (nos dicionários devolvidos)

# text
seg-3e381a941742 = os mesmos três (no JSON devolvido)

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
# c4: geometry_model
# c5: geometry_summary
# c6: trust_telemetry
seg-8411558f9852 = <c1/>, <c2/>, <c3/> (na resposta; a resposta de um registo de embarcação mantém <c4/> e <c5/>); <c6/> apresenta-o

# text
# c1: vessel-receiver-trust
# c2: trust-telemetry
seg-d397f9a330d2 = igual, skills <c1/>, <c2/>

# text
seg-95093013d169 = as ações acima imprimem a saída da CLI, que o transporta

# text
# c1: vessel-trust-and-training
seg-f0bc22ec95d3 = <c1/> (no resultado que carrega)

# text
# c1: docs/MARITIME-TRUST.md
seg-86c0548edb03 = <b>pendente</b>: a página de confiança marítima ainda não o mostra (campos listados em <c1/>, item { "6" } da vista Studio)

# text
# c1: receiver-trust live
# c2: --gate
# c3: --listen
seg-dffdbf379423 = <c1/> como processo em execução (stdin, ficheiro seguido, TCP, UDP, <c2/>, <c3/>)

# text
seg-bb4f68155884 = Ferramentas: cartão Linha de comandos (o comando a executar; um navegador não é um processo no percurso dos dados)

# text
# c1: lab-attestation
seg-a783976420e6 = Pacote de evidências: criar (assinado, janela de um registo; { "0.38" }: um <c1/> opcional, a declaração do operador sobre uma montagem de laboratório, registada no manifesto assinado, nunca verificada)

# text
seg-65826be9b437 = <b>N/A</b> (chave de assinatura)

# text
# c1: /kshana-evidence-pack
# c2: evidence-pack
seg-95395e63565d = <c1/>, skill <c2/>

# text
seg-cc9b1d83ed15 = Criar pacote de evidências (sem campo de atestação na caixa de diálogo na { "0.38" }: <b>pendente</b>; a linha de comandos aceita-o)

# text
seg-70534bdc6c87 = <b>N/A</b> (uma chave de assinatura não deve estar numa página); Ferramentas: cartão Linha de comandos

# text
# c1: import
# c2: score
seg-83d9a9e9603a = Jammertest como árbitro ({ "0.38" }): o catálogo e o plano de transmissão publicados da NPRA lidos como referência agendada (<c1/>), um registo de recetor pontuado face a ela por ensaio (<c2/>: latência de deteção, falhas, falsos alarmes, tempo de recuperação; MODELLED)

# text
# c1: /kshana-jammertest
# c2: jammertest
seg-38dcbafd214a = <c1/>, skill <c2/>

# text
seg-c61ff1d0f579 = <b>N/A</b> (precisa dos ficheiros do plano e de um registo em disco; execute-o a partir de um terminal)

# text
seg-5a9087e23823 = <b>N/A</b> (ainda sem notebook)

# text
seg-c92ea39fb2d1 = <b>pendente</b>: um cartão de Ferramentas para a linha de comandos (a faixa e as vistas do Studio são da WS-A)

# text
# c1: jammertest score --key
# c2: config.json
seg-3eae6f848b58 = Pacote de pontuação Jammertest assinado (<c1/>: o pacote de evidências de confiança do recetor com a folha de pontuação e o calendário dentro de <c2/>)

# text
# c1: create_evidence_pack
seg-f1695a89c33b = <b>N/A</b> (chave de assinatura: utilize <c1/> numa janela, ou a linha de comandos)

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
seg-a3655f428a0c = Autorrelato do recetor ({ "0.38" }): UBX-NAV-STATUS <c1/> e UBX-SEC-SIG lidos para <c2/> em cada época, e a comparação <c3/> (ambos / só o recetor / só o Kshana / nenhum) no resultado; não dispara qualquer alarme e não altera qualquer pontuação

# text
# c1: receiver-trust
# c2: jammertest score
seg-b0190b99d9fd = <c1/> (no JSON de resultado; <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-70c1a825afa5 = <c1/>, <c2/> (nos dicionários devolvidos)

# text
# c1: receiver_trust
seg-0cd306174106 = <c1/> (no JSON devolvido)

# text
# c1: assess_receiver_log
seg-0b7d16c95d12 = <c1/> (na resposta)

# text
# c1: epochs[].self_report
seg-833ac4d6bded = <b>pendente</b>: a faixa da página Confiança (WS-A; o campo é <c1/>)

# text
seg-c56746c298f2 = Formato de registo SBF da Septentrio ({ "0.38" }, só de leitura: PVTGeodetic, MeasEpoch, RFStatus)

# text
# c1: receiver-trust
# c2: [log] format = "sbf"
seg-1f4c22e8bf78 = <c1/> com <c2/>

# text
# c1: receiver_trust
# c2: assess_receiver_log
# c3: format = "sbf"
# c4: base64
seg-741ee07949d0 = <c1/>, <c2/> (<c3/>, registo como <c4/>)

# text
seg-003608556fc0 = igual

# text
seg-ae8bf32d890b = as ações acima

# text
seg-20f086cdea29 = <b>N/A</b> (o carregamento de registos binários não é oferecido na página Confiança na { "0.38" })

# text
# c1: receiver-trust live --serial <device> [--baud n]
# c2: --configure
seg-1303f81c2407 = <c1/>: um fluxo NMEA série ou USB, só de leitura (abre o dispositivo para leitura, nunca escreve no recetor; <c2/> é recusado)

# text
seg-59610023b124 = <b>N/A</b> (um dispositivo e um processo)

# text
seg-1fcba825118e = Pacote de evidências: criar (assinado, janela de um registo)

# text
seg-fa4022137830 = Criar pacote de evidências

# text
seg-e6b694a68935 = Pacote de ida e volta de laboratório (cenário, condições de ensaio, registo do recetor e pontuação ligados por resumo criptográfico)

# text
seg-bfcfc5d28be8 = <b>N/A</b> (as ações do JetBrains estão associadas a um único ficheiro selecionado; o pacote precisa de um cenário, de condições, de um registo e de uma chave: execute-o a partir do terminal do IDE)

# text
seg-7942dacc8476 = Pacote de evidências: verificar

# text
seg-93a0c989870b = Verificar pacote de evidências (apenas chave fixada)

# text
seg-bf617fa341c8 = Ferramentas: Pacotes de evidências (verificar, anexar marca temporal)

# text
# c1: format = "mqtt"
# c2: --mqtt-tcp
seg-49df5efbbd2b = Telemetria de confiança (Prometheus, syslog CEF/LEEF, OTLP; { "0.38" }: <c1/>, deteção do Home Assistant e linhas de estado; <c2/> publica a partir da CLI)

# text
# c1: trust_telemetry
seg-60d46f0e3ead = <c1/> (saída de texto; sem socket)

# text
# c1: /kshana-trust-telemetry
# c2: trust-telemetry
seg-45ee1c8b6f70 = <c1/>, skill <c2/>

# text
seg-9eff7c00723a = Apresentar telemetria de confiança (um resultado guardado)

# text
seg-1b60ff4652cd = Ferramentas: cartão Telemetria (separador Linha de comandos; apenas formatos, sem sockets)

# text
# c1: receiver-trust
# c2: rtklib-pos
# c3: novatel
# c4: gnss-sdr
# c5: [log.imu]
# c6: csv
# c7: euroc
seg-3e332170d963 = Entradas de máquina e de sensor ({ "0.38" }): formatos <c2/>, <c3/>, <c4/> de <c1/>, e <c5/> (<c6/>, <c7/>)

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
seg-4c6056fb8884 = <b>N/A</b> (a página Confiança do Studio lê os formatos que lista; os novos formatos seguem-se com a sua próxima portagem)

# text
# c1: [accel_classical]
seg-5d69867fc6f8 = Registo de IMU para parâmetros de sensor híbrido/de fusão (tabela <c1/> a partir de um registo estacionário, ajuste de Allan)

# text
seg-426814dbf8dd = <b>N/A</b> (ainda sem ação no IDE)

# text
seg-e8477119c213 = <b>N/A</b> (o editor de cenários do Studio aceita a tabela colada)

# text
# c1: trust-telemetry --mqtt-tcp
# c2: integrations/ros2
# c3: integrations/gnss-sdr
seg-7cacfab5931c = Nó ROS { "2" }, retransmissor UDP do GNSS-SDR, <c1/> (<c2/>, <c3/>)

# text
seg-70e2e895a01f = processos

# text
# c1: trust_telemetry
# c2: mqtt
seg-c1ad125a051e = <b>N/A</b> (processos de longa duração e sockets; formas em texto: <c1/> com <c2/>)

# text
# c1: docs/OSNMA.md
seg-7527df567fc3 = Verificação Galileo OSNMA de páginas I/NAV ou de um fluxo UBX (<c1/>)

# text
seg-e5295f10cf3f = <b>N/A</b> (um fluxo longo e bruto de recetor convém à CLI e ao Python; uma ferramenta de agente acrescentaria uma superfície de entradas grandes sem benefício)

# text
# c1: kshana osnma verify
seg-32560c9024ff = <b>N/A</b> (os comandos do plugin correm sobre o servidor MCP, que não tem ferramenta OSNMA pelo motivo indicado na célula do MCP; execute <c1/>)

# text
# c1: kshana osnma verify
seg-e4b399062eca = <b>N/A</b> (o resultado nada significa sem uma raiz de Merkle ou uma chave pública de confiança obtidas do ICD por outra via e, para a atualidade, um tempo de referência independente; uma ação de clique com o botão direito não tem onde as obter, e uma predefinição sem fixação seria lida como verificação; execute <c1/>)

# text
seg-dac011642033 = <b>N/A</b> (um fluxo à entrada, um relatório JSON à saída; sem notebook)

# text
seg-dbe4907cd74c = Ferramentas: OSNMA

# text
seg-5ee6c4f68127 = NMEA de treino com um registo do instrutor

# text
# c1: /kshana-training-scenario
# c2: training-nmea-scenario
seg-e321d52ad21d = <c1/>, skill <c2/>

# text
seg-79776273210a = Gerar NMEA de treino

# text
seg-899995619176 = Página de debriefing de formação

# text
seg-9cb27f0adfb3 = NMEA de treino transmitido para um endereço TCP ou UDP

# text
seg-71e498158f5d = Ferramentas: cartão Linha de comandos (transmite para um endereço)

# text
seg-6a3b4cf33177 = Mapa de interferência (ADS-B, AIS)

# text
# c1: /kshana-interference-map
# c2: interference-map-route-exposure
seg-3d7c2700cf7d = <c1/>, skill <c2/>

# text
seg-3740aafd1749 = Construir mapa de interferência

# text
seg-b164d99daf08 = Página do mapa de interferência

# text
seg-81d53d4f3a11 = Exposição do percurso

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-c73605fe5e59 = Plugin Signal K e alimentação de gate do OpenCPN (<c1/>)

# text
seg-10037d51a377 = <b>N/A</b> (processos)

# text
# c1: /kshana-marine-integrations
# c2: marine-integrations
seg-0360c13bb637 = apenas guia prático: <c1/>, skill <c2/>

# text
seg-e3acebdb4cd0 = Ferramentas: cartão Linha de comandos (guia prático; uma implementação)

# text
seg-38fafad3482b = Exportação de test bench (CSV de movimento, NMEA, pontos de passagem, eventos para um simulador de laboratório)

# text
# c1: /kshana-bench-export
# c2: test-bench-export
seg-ffe594484ff8 = <c1/>, skill <c2/>

# text
seg-af0be6bf84c7 = Exportar ficheiros de test bench

# text
seg-e676bae4b98d = Ferramentas: exportação de test bench

# text
seg-394eee3f0c0f = Mapeamento de compliance a partir de execuções (para que linhas de quadros públicos as execuções fornecem elementos de prova em apoio de)

# text
# c1: /kshana-compliance-report
# c2: compliance-mapping
seg-c7782a49a50e = <c1/>, skill <c2/>

# text
seg-a97d66893e2c = Construir relatório de compliance

# text
seg-314d03d7d075 = Ferramentas: mapeamento de compliance

# text
seg-02601f519c92 = Tabelas e fontes do mapeamento de compliance

# text
seg-31d29baca4c2 = Mostrar mapeamento de compliance

# text
seg-01418b04e9bf = Pacotes de normas (conjuntos de cenários pontuados com limiares declarados antes da execução: perfis de ensaio DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F)

# text
# c1: kshana standards-pack
seg-72ea3b5bf39d = <b>N/A</b> (as ações do JetBrains estão associadas a um ficheiro selecionado; os pacotes estão incorporados e não precisam de nenhum: execute <c1/> a partir do terminal do IDE)

# text
seg-731504a1218f = <b>N/A</b> (os cartões de Ferramentas do Studio para pacotes pertencem à frente de trabalho do Studio; a CLI ou a saída de qualquer superfície alimenta o cartão Mapeamento de compliance)

# text
# c1: docs/LUNANET-AFS.md
seg-ffab4fc439d9 = LunaNet Augmented Forward Signal: códigos, SB1/CRC/entrelaçador, e uma verificação face à LSIS-AFS V1.0 (<c1/>)

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
seg-3fddaefc42f4 = <c1/>, <c2/>, <c3/>; <c4/> etc. através das execuções curtas em memória

# text
# c1: kshana lunanet-afs-check
seg-338350a8097c = <b>N/A</b> (as ações do JetBrains estão associadas a um ficheiro selecionado; execute <c1/> a partir do terminal do IDE)

# text
seg-01a840e0bdc8 = <b>N/A</b> (um cartão do Studio é um item da frente de trabalho do Studio; a CLI e todas as outras superfícies suportam-no)

# text
# c1: docs/SKYLINE.md
seg-d04d7f608263 = Geometria do céu sob uma linha de horizonte: satélites visíveis e mascarados, DOP, covariância ENU, elipse de erro (<c1/>)

# text
# c1: /kshana-run
seg-9dfe4289533b = <c1/> (aponta para a ferramenta)

# text
# c1: kshana sky
seg-f21f2810b363 = <b>N/A</b> (um gráfico de céu interativo é uma vista de navegador; <c1/> cobre os números)

# text
seg-f923796dab30 = — (a vista Geometria do Studio é acrescentada em separado na { "0.36" })

# text
seg-26c89146e670 = Nuvem de Monte Carlo do céu (erros de mínimos quadrados com semente, RMS, contenção de { "95" } %)

# text
seg-3627b76a3778 = <b>N/A</b> (amostras em massa que um agente deve resumir, e não transportar)

# text
seg-4ebfbca0614e = <b>N/A</b> (sem ferramenta MCP)

# text
seg-8b6155019a17 = <b>N/A</b> (como acima)

# text
seg-586e8d98ecd9 = — (como acima)

# text
# c1: docs/SKYLINE.md
seg-ae43880fd2cc = Predefinições e perfis de linha de horizonte (<c1/>)

# text
seg-ad514737bf83 = Gráfico de céu em SVG

# text
# c1: sky_geometry
seg-9a6087f458bc = <b>N/A</b> (um agente lê os números a partir de <c1/>)

# text
# c1: [skyline]
# c2: user_site
seg-6de10d28a5fc = Secção de linha de horizonte num cenário (<c1/>: orbit e integrity com <c2/>, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario)

# text
seg-65ffc53b15fa = o ficheiro do cenário

# text
seg-74fac0bacb76 = Executar cenário Kshana

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
seg-f71e5e2eb4f3 = Ligação ótica de temporização através da atmosfera: disponibilidade por local, diversidade de locais, técnicas de melhoria, acoplamento de interrupção a holdover (tipo de cenário <c1/>; <c2/>; MODELLED, locais ILLUSTRATIVE, consultivo)

# text
seg-490147c5e7ec = <b>pendente</b>: ainda sem vista no Studio; o cenário corre no executor de cenários do Studio e no cartão Linha de comandos das Ferramentas

# text
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-de2c788670aa = Teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador: linha de base, GNSS retirado pelo operador, holdover, recuperação, medidos face a máscaras ITU-T (tipo de cenário <c1/>; <c2/>; MODELLED, consultivo; o Kshana não transmite nem aciona nada)

# text
# c1: run
# c2: samples
# c3: clock_log.text
seg-3fdb9a269cd0 = <c1/> (<c2/> ou <c3/> em linha; as chaves de ficheiro são recusadas)

# text
# c1: run_scenario
seg-d946c75f821a = <c1/> (apenas em linha)

# text
# c1: run
seg-b91e77ef7186 = <b>N/A</b> (sem notebook na { "0.38" }; os cenários de exemplo correm em qualquer notebook através de <c1/>)

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-5041a1d6272f = O GNSS para além da constelação: disponibilidade de sinais GPS, GLONASS, Galileo, BDS, QZSS e NavIC para um utilizador numa casca ou numa trajetória de LEO a transferência lunar (caderno, diagrama de transmissão paramétrico ou medido, meio de raio rasante, projeto de recetor de sinal fraco), um EKF GNSS a bordo para naves de órbita alta e de transferência lunar, e navegação relativa em formação (tipo de cenário <c1/>; <c2/>; MODELLED, consultivo; comparado com o caderno ICG SSV ao abrigo de um pré-registo, <c3/>)

# text
# c1: run
# c2: transmit.pattern_text
seg-3e16823c1c90 = <c1/> (em linha; <c2/> transporta um diagrama medido em linha)

# text
# c1: run_scenario
# c2: transmit.pattern_csv
seg-126a59c992d9 = <c1/> (apenas em linha; <c2/> é recusado)

# text
# c1: run
seg-2010eb196565 = <b>N/A</b> (sem notebook na { "0.38" }; os cenários correm em qualquer notebook através de <c1/>)

# text
# c1: lunar-infrastructure
# c2: study = ...
# c3: docs/LUNAR-INFRASTRUCTURE.md
seg-593b7761803d = Órbita e superfície lunares como infraestrutura de navegação e geodésica: consistência da determinação de órbita, resolução da ambiguidade da fase da portadora, coestimação de referencial, ligação espacial e sensibilidade ao número de Love (tipo de cenário <c1/>, <c2/>; <c3/>; MODELLED, entradas ILLUSTRATIVE, consultivo)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-34ed7b4d59e4 = <c1/> (e os cinco exemplos irmãos)

# text
# c1: run
seg-ba584b2da776 = <b>N/A</b> (sem notebook; os exemplos correm em qualquer notebook através de <c1/>)

# text
seg-b5ae9f9fd5df = <b>pendente</b>: ainda sem vista no Studio; os cenários correm no executor de cenários do Studio e no cartão Linha de comandos das Ferramentas

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
# c4: tracking
# c5: statistics
# c6: [clock_log]
# c7: [series.clock_log]
# c8: docs/CLOCK-LOG-FORMATS.md
seg-3103be5ffa0a = Registos de relógio medidos lidos para uma série de fase: linuxptp <c1/>, <c2/>, <c3/>, chrony <c4/> e <c5/>, além de RINEX clock, TimeLab e TICC (<c6/> / <c7/>; <c8/>; MODELLED, nenhuma referência independente compara uma análise com outro leitor)

# text
# c1: [clock_log]
seg-5b9d4cfbbbf7 = um cenário com <c1/>

# text
# c1: run
# c2: text
seg-f0ac32797edb = <c1/> (<c2/> apenas em linha; sem leitura de ficheiros num navegador)

# text
# c1: run_scenario
# c2: text
# c3: path
seg-bf0495255831 = <c1/> (<c2/> apenas em linha; <c3/> é recusado)

# text
seg-aa26d73d9b79 = <b>N/A</b> (sem notebook; um registo é um ficheiro que o utilizador fornece)

# text
seg-d1ebbe70e454 = <b>pendente</b>: sem vista no Studio; o executor de cenários do Studio aceita o texto do cenário

# text
# c1: /studio/optical/
seg-04edbdcaf5c7 = a vista PNT ótica do Studio (<c1/>, { "0.38" }) desenha os resultados registados dos dois cenários incluídos, incluindo a série temporal com semente; o cenário corre também no executor de cenários do Studio e no cartão Linha de comandos das Ferramentas

# text
# c1: interference-map fetch-land
seg-dbe94c1cb4b0 = Descarregamento de polígonos de terra (<c1/>)

# text
seg-d61b28df9367 = Código da CLI

# text
# c1: --allow-network
seg-3c816222df90 = Ferramentas: cartão Linha de comandos (precisa de <c1/>)

# text
# c1: docs/BENCH.md
seg-858b2c4a1451 = Benchmark (kshana-bench v1: pontuar uma submissão face a um ficheiro de referência, página de classificação; <c1/>, MODELLED, consultivo)

# text
seg-f6e2271206a6 = <b>N/A</b> (as duas ferramentas MCP suportam-no; um comando de barra sobre dois ficheiros JSON não acrescenta nada)

# text
seg-4edd4fe793f1 = <b>N/A</b> (não é uma ação de IDE)

# text
seg-15ffa4639a46 = <b>N/A</b> (os notebooks educativos são uma frente de trabalho separada)

# text
# c1: bench/site/
seg-5d48d48ae295 = <b>N/A</b> (a classificação é a página estática <c1/>, portada para o sítio tal como está; o Studio não calcula nada)

# text
# c1: bench truth|cases|baseline|seal|reveal-check|manifest|verify-manifest|validate
seg-f730ab44ca82 = Dados de benchmark e ferramentas de conjunto reservado (<c1/>)

# text
# c1: seal
seg-efdc66eff3d8 = <b>N/A</b> (a CLI lê diretórios de conjuntos de dados e ficheiros de relógio e, para <c1/>, um ficheiro de semente secreta; uma semente não deve passar por um agente nem por uma página)

# text
# c1: interference-map daily|sensitivity
# c2: docs/observatory/METHOD.md
seg-2146297abaf0 = Produto diário e estudo de sensibilidade do observatório (<c1/>; <c2/>)

# text
seg-f359f5223666 = <b>N/A</b> (os comandos leem um diretório de arquivo com centenas de milhares de ficheiros, escrevem quatro ficheiros, incluindo um PNG, e impõem o atraso de publicação de { "24" } h face ao relógio da máquina que publica; o mapa CSV está em todas as superfícies na linha acima)

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
seg-55cf42830155 = O Kshana Studio é a aplicação web construída sobre a compilação WebAssembly, pelo que existe uma vista do Studio onde a coluna WASM tem um ponto de entrada, e onde não tem a célula aponta para um <b>cartão Linha de comandos</b> (o comando a executar, com os seus argumentos), nunca para um resultado que o Studio tenha calculado. Páginas (kshana.dev/studio/, do lado do cliente): <b>Confiança marítima</b> (<c1/>), <b>Debriefing de formação</b> (<c2/>), <b>Mapa de interferência</b> (<c3/>), <b>Geometria</b> (<c4/>: um gráfico de céu representativo, linha de horizonte, DOP, elipse de erro e nuvem de Monte Carlo a partir do motor; { "0.36" }), <b>Estação lunar</b> (<c5/>: a cobertura modelada de uma estação de referência lunar a partir do tipo de cenário <c6/>; { "0.36" }) e a página de <b>Ferramentas</b>, cujas secções são OSNMA (<c7/>), Pacotes de evidências (<c8/>), Exportação de test bench (<c9/>), Mapeamento de compliance (<c10/>), o separador Linha de comandos (cartão de telemetria, IQ, integrações marítimas: comandos a executar) e Utilização a partir do seu assistente de IA (<c11/>). Um <c12/> na coluna Studio da tabela de subcomandos é um comando que não é uma das capacidades da { "0.35" } que o Studio apresenta.

# text
seg-73006c42aef2 = Porque é que as células N/A são N/A

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-6d586f5fbaa3 = <b>Signal K e OpenCPN.</b> São consumidores do processo em direto e da sua gate TCP, pelo que são implementações de linha de comandos; o plugin traz um comando de guia prático e uma skill que apontam para <c1/> e não chamam nenhuma ferramenta.

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
seg-17fcf959153f = <c1/> mantém um fluxo aberto, pode servir o fluxo filtrado a qualquer número de clientes TCP e corre até ser parado. Uma chamada Python, uma chamada de navegador, uma chamada de ferramenta MCP e uma ação de IDE devolvem cada uma o resultado quando terminam e não mantêm um socket aberto para outros. Python, WASM e MCP suportam, em vez disso, a forma limitada: um excerto pontuado pelo mesmo motor, no esquema em direto (linhas JSON { "1.3" }: <c2/>, uma declaração <c3/> e a <c4/> dos satélites em cada época, uma <c5/> em cada dedução), sem socket e sem gate (a gate marca uma solução de posição como inválida num fluxo em direto, o que só um processo no percurso dos dados pode fazer). Dois comportamentos pertencem ao processo e não estão nas ferramentas de excerto: um fluxo repetido mais depressa do que em tempo real através de <c6/> sem <c7/> é pontuado como não fiável (o seu tempo discorda do relógio do anfitrião; um excerto é lido sem relógio do anfitrião), e <c8/> e <c9/> ligam-se ao endereço de loopback, a menos que seja indicado um endereço.

# text
# c1: trust_telemetry(input, format, host, input_kind, options_json)
# c2: trust_telemetry
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: trust-telemetry
# c6: kshana trust-telemetry --result session.result.json --print-metrics
# c7: TRUST-TELEMETRY.md
seg-824d2bbbf280 = <b>Telemetria de confiança.</b> O WASM suporta <c1/>: os mesmos codificadores, devolvendo texto Prometheus, linhas syslog CEF ou LEEF, ou a carga OTLP em JSON para um fluxo ou um resultado em lote, sem relógio (as linhas syslog trazem a marca temporal nula do RFC { "5424" }) e sem nada enviado. O Python (<c2/>) e o MCP (<c3/>, com o comando de plugin <c4/>) também o suportam. O resto de <c5/> serve métricas Prometheus, envia syslog e exporta OpenTelemetry a partir de um fluxo em execução, pelo que é um processo por natureza. Guia prático: encaminhe o comando em direto para ele, ou repita um ficheiro de resultado (<c6/>); ver <a1><c7/></a1>. Um agente ou um notebook que queira as pontuações por época chama antes as funções de lote ou de excerto.

# text
# c1: evidence_verify
seg-a5c2ef208191 = <b>Criar um pacote no navegador.</b> A assinatura precisa de uma chave privada, que não deve passar por uma página web; a compilação para navegador verifica pacotes (<c1/>) e as outras superfícies criam-nos. A ferramenta MCP nunca devolve nem regista a semente de assinatura e, sem uma, assina com uma chave de uso único (integridade, não identidade); para uma chave que importe, utilize a CLI. O mesmo se aplica à transmissão de NMEA de treino para um endereço: Python, WASM e MCP devolvem o texto gerado, e a CLI envia-o.

# text
seg-dea93c47b3b1 = Conjuntos de estudo.

# text
# c1: --study <suite.toml>
# c2: run
# c3: run_scenario
# c4: run_all
seg-2e88bb410874 = <c1/> executa um manifesto que nomeia ficheiros de cenário irmãos em disco. As superfícies em memória aceitam texto de cenário, e não uma pasta de ficheiros, pelo que executam cada membro como um cenário (<c2/>, <c3/>, <c4/>).

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: iq extract
# c3: convert
# c4: decimate
# c5: iq labfit
# c6: iq conditions
seg-d08f585c4f02 = <b>IQ de GNSS no navegador, e gravações que são reescritas.</b> Uma gravação tem gigabytes de amostras, que uma página não consegue conter e que o protocolo MCP não deve transportar, pelo que o WASM não tem funções de IQ e as ferramentas MCP leem e escrevem apenas um diretório de trabalho (<c1/>, com um orçamento de amostras por chamada). <c2/>, <c3/> e <c4/> existem para reescrever gravações em disco e ficam apenas na linha de comandos. <c5/> e <c6/> transportam texto, pelo que o MCP os aceita em linha (um registo que nomeia um ficheiro é recusado).

# text
# c1: curl
# c2: --allow-network
# c3: curl
# c4: land_geojson
seg-f571dc5c2330 = <b>O descarregamento de terra.</b> É o único comando que abre uma ligação de rede, precisa do <c1/> do sistema e de um <c2/> explícito, e verifica um SHA-256 fixado. O navegador não tem <c3/>, e um agente de IA não deve obter dados em nome de um utilizador; as outras superfícies aceitam, em vez disso, o ficheiro de terra como texto (<c4/>).

# text
seg-f81f6b6a2e67 = Arquivos e diretórios de traços.

# text
# c1: interference-map adsb
seg-2f226f3955d9 = <c1/> sobre um diretório de traços readsb lê ficheiros do disco e é apenas de linha de comandos; as superfícies em memória aceitam texto CSV.

# text
seg-6fb9f23090ca = Todos os subcomandos da linha de comandos, e quem os cobre

# text
# c1: kshana --help
seg-4a225d5d59af = Uma linha por subcomando ou modo de <c1/>. <b>sim</b> nomeia o ponto de entrada; <b>não</b> é uma lacuna com o seu motivo; <b>N/A</b> é uma superfície que não o pode suportar pelo motivo indicado acima ou na última coluna. As ações do JetBrains executam a linha de comandos, pelo que um <b>N/A</b> aí indica porque não existe uma ação de IDE.

# text
seg-35720f38b1a5 = Subcomando

# text
# c1: kshana <scenario.toml>
seg-d46c11fa6dea = <c1/> (executar, gráfico, tabela)

# text
# c1: error_kind
seg-af645810cc0c = <c1/> (uma execução gera uma exceção perante um cenário inválido)

# text
seg-7d6c8218a4a6 = Validar cenário

# text
seg-d75a5f64c7cc = <b>N/A</b> (nomeia ficheiros irmãos em disco)

# text
seg-16775dd25139 = Um conjunto de estudo nomeia ficheiros de cenário irmãos em disco (N/A acima); execute cada membro como um cenário

# text
seg-1742459cb792 = Exportar cenário

# text
# c1: utf-8
seg-2bc957bd567b = Os ficheiros regressam como texto (<c1/>) ou base64 (as amostras SigMF)

# text
seg-bf69da729efd = Importar percurso

# text
seg-6d762f20af07 = Animar cenário

# text
seg-052c13118454 = No máximo { "120" } fotogramas por chamada; sequências mais longas usam a CLI

# text
# c1: sky <request>
# c2: --monte-carlo
# c3: --svg
seg-5580a1a89bcb = <c1/> (ou opções), <c2/>, <c3/>

# text
# c1: sky_geometry
seg-b96c18c1f157 = <c1/> (sem Monte Carlo, sem SVG)

# text
seg-5b62ca019ebd = <b>N/A</b> (ver a linha da capacidade)

# text
seg-4f7453d89d9d = Geometria MODELLED; saída em JSON ou SVG

# text
seg-c853beadb55e = Predefinições REPRESENTATIVE com proveniência

# text
seg-52638393d72d = Listar tipos de cenário

# text
seg-69bc0d382eb7 = Inserir cenário de exemplo

# text
# c1: python
# c2: wasm
seg-611dbcb5a15c = As funcionalidades <c1/> e <c2/> compilam o texto de exemplo no binário (cerca de { "0.7" } MB)

# text
# c1: receiver-trust <scenario.toml>
seg-51e0c2c100f8 = <c1/> (em lote)

# text
# c1: receiver_trust_replay
seg-c9421c4d744f = excerto: <c1/>

# text
# c1: assess_vessel_stream
seg-6a2439967519 = excerto: <c1/>

# text
seg-efe5e5dbe710 = excerto

# text
# c1: --file
seg-816f9bd210d5 = Avaliar fluxo do recetor (um registo guardado, <c1/>)

# text
seg-d81457d8f038 = Página de confiança marítima (excerto); cartão Linha de comandos para o processo

# text
seg-9cf210dd2301 = Um processo em execução; o excerto não tem socket nem gate (N/A acima)

# text
seg-315d0dcd39fb = Apenas texto em todas as superfícies, sem socket; os exportadores em execução são um processo (ver acima)

# text
seg-5c93482c9ae4 = Texto à entrada, JSON à saída; MODELLED

# text
seg-3763f34af33d = N/A (ver acima)

# text
# c1: --json
# c2: advisory
seg-4110fadc04db = O mesmo JSON que <c1/>, com o aviso consultivo no seu campo <c2/>; a leitura de ficheiro passa a bytes em memória. Apenas estado de autenticação: não é um serviço de integridade da navegação, e não há qualquer afirmação de desempenho anti-spoofing

# text
# c1: receiver-trust evidence
seg-399524b468f3 = <c1/> (criar um pacote)

# text
seg-6dfc4b352892 = Ferramentas: cartão Linha de comandos (sem chave de assinatura numa página)

# text
seg-69dadb564662 = Sem chave de assinatura num navegador

# text
seg-fd26107fa3cd = <b>N/A</b> (terminal; precisa de ficheiros)

# text
seg-38dc9c30191a = <b>pendente</b>: Ferramentas: cartão Linha de comandos

# text
# c1: --key
seg-57257e80468f = O plano e o catálogo são dados como texto; o pacote assinado (<c1/>) só existe na linha de comandos (chave de assinatura)

# text
seg-3ea5db063974 = Sem chave de assinatura num navegador; nenhum sinal é escrito nem repetido

# text
seg-8b27a6ca1aef = <b>N/A</b> (uma chave privada nunca é criada nem lida pelo plugin)

# text
seg-dda21be14d64 = Ferramentas: cartão Linha de comandos

# text
seg-03376576d0b6 = O Python devolve a chave em memória com um aviso; uma chave privada não deve passar por uma conversa nem por uma página

# text
seg-cd21674be5d7 = Anexar marca temporal

# text
# c1: openssl ts -verify
seg-6c0caa6e1be2 = Token como bytes ou base64, pacote atualizado devolvido em memória; a assinatura da autoridade não é verificada (<c1/>)

# text
seg-907eedb51849 = <b>N/A</b> (ver Nota)

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
seg-b611fd739914 = Lê um diretório de arquivo e escreve ficheiros; o atraso de publicação é imposto na máquina que publica (N/A acima)

# text
seg-96b313373128 = N/A (a ferramenta MCP suporta-o)

# text
seg-cb1fc7c162e3 = Texto à entrada, texto à saída; nada é lido nem escrito

# text
# c1: bench/site/
seg-5292a4966861 = a página estática <c1/>

# text
seg-839999463148 = Texto HTML

# text
seg-bb10d5a1eb50 = Ficheiros de conjuntos de dados e uma semente secreta (N/A acima)

# text
seg-45bbda779645 = Devolve texto, não escreve nada; sem sinal

# text
seg-0e64b97b025b = <b>N/A</b> (as gravações são ficheiros de gigabytes; ver Nota)

# text
# c1: --format sdrx[:ci16_le]
# c2: .sdrx
# c3: format: "sdrx"
seg-7c9273837b73 = As amostras são ficheiros. <c1/> (ou um caminho de saída terminado em <c2/>) escreve metadados ION GNSS SDR junto das amostras: a CLI e o MCP (<c3/>) escrevem-nos; o Python devolve as amostras em memória e não escreve ficheiro, pelo que os metadados não têm forma em Python (<b>N/A</b>)

# text
# c1: rows
# c2: tests
seg-4f1cc14c9af4 = Os cenários estão incorporados; sem sistema de ficheiros; <c1/> e <c2/> imprimem as tabelas da documentação registadas e são apenas de CLI

# text
seg-5de02dcfb151 = Os fluxos de símbolos são texto de { "0" } e { "1" }, no máximo { "4" } MiB (MCP) ou { "100" } tramas geradas por chamada; o LDPC e o CRC-24Q das subtramas { "2" } a { "4" } não são verificados; nenhum sinal é escrito

# text
seg-db29ea94222b = As amostras são ficheiros

# text
# c1: iq_labfit
seg-9b7afa156e9a = <c1/> (registos em linha, sem ficheiros)

# text
# c1: --follow [--idle-timeout <s>]
# c2: iq::io::follow::open_sigmf_follow
# c3: receiver-trust live
# c4: iq_monitor
seg-295fe0c63fe2 = <c1/> lê uma gravação SigMF que ainda está a ser escrita, apenas em receção (<c2/> em Rust): <b>N/A</b> para Python e MCP, porque uma chamada que espera que um ficheiro cresça não regressa quando o trabalho está feito, o motivo pelo qual <c3/> é também apenas de linha de comandos; a gravação no seu comprimento atual passa por <c4/>

# text
# c1: iq_test_conditions
seg-e651dceda9b2 = <c1/> (texto, em linha)

# text
seg-237bb76fae50 = O inventário de uma pasta é Python e CLI; o servidor MCP lê um único diretório de trabalho

# text
seg-654781b74f2a = Reescrevem gravações em disco (N/A acima)

# text
# c1: iq --help
seg-6a010403db35 = a lista de sinais (<c1/>)

# text
# c1: kshana iq --help
seg-1154d82301ca = <b>N/A</b> (uma lista; execute <c1/>)

# text
seg-8c90b8cb2e78 = Funções utilitárias

# text
seg-3d9ac26ec730 = Pequenos pontos de entrada que não são uma linha de capacidade, e onde está cada um:

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
seg-d5fb77719df2 = Lê um ficheiro binário <c1/> que <c2/> escreveu. <b>N/A</b> nos restantes: lê um ficheiro do disco (o WASM não tem sistema de ficheiros, o MCP lê apenas um diretório de trabalho através das ferramentas <c3/>)

# text
# c1: ?s=
seg-57ef8e3fe6bc = O codec de ligações de partilha <c1/> do playground do navegador (TOML de cenário para um token seguro para URL e vice-versa). <b>N/A</b> nos restantes: uma ligação para uma página web não tem significado para uma linha de comandos, uma chamada Python ou um agente

# text
seg-bd6e451f5cdf = Limites que diferem por superfície

# text
seg-8f3e8345d90d = Limite de entrada

# text
seg-4b5abdf098e3 = Ficheiros

# text
seg-1910f2cef7da = { "4" } MiB por entrada de texto ({ "2" } MiB e { "20,000" } épocas para um excerto de fluxo); as respostas trazem no máximo { "2000" } linhas NMEA, { "200" } linhas de épocas não nominais e { "4" } MiB de ficheiros GeoJSON ou de pacotes

# text
# c1: iq_*
seg-116e2d0202f4 = apenas conteúdo em linha: um campo de cenário que nomeia um ficheiro é recusado; as ferramentas <c1/> usam um único diretório de trabalho opcional, com todos os caminhos confinados a ele

# text
# c1: --http
seg-ee5e8de88144 = MCP sobre HTTP (<c1/>, alojado pelo próprio utilizador)

# text
seg-f095909e9feb = como o MCP, com um corpo de pedido de { "5" } MiB, { "120" } s por pedido e { "8" } pedidos em simultâneo por predefinição

# text
# c1: iq_*
seg-95d4ab7863e6 = nenhum: as ferramentas de ficheiros <c1/> estão desativadas; todas as outras ferramentas aceitam conteúdo em linha

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
seg-e38059970288 = nenhum: o navegador não tem sistema de ficheiros, nada é carregado

# text
seg-241399edb372 = Níveis de evidência e ressalvas em todas as superfícies

# text
seg-b3307ae773f7 = Um pacote de evidências é um <b>registo técnico</b> do que o motor calculou a partir de um registo sob definições declaradas, com todos os resumos criptográficos e uma assinatura sobre eles. Não é um parecer jurídico, uma constatação de facto sobre qualquer evento nem uma aprovação. Um resultado positivo da verificação diz que o registo não foi alterado; sem uma chave pública de confiança, prova apenas a integridade face à chave que o próprio pacote nomeia.

# text
seg-0d8ed8b92a00 = Os monitores de confiança do recetor e a pontuação de confiança são <b>MODELLED</b>: os limiares são entradas declaradas e nada afirma como se comportam face a interferência real. A saída é <b>consultiva</b>; o Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e o operador continua a ser responsável. Uma pontuação elevada não prova uma solução de posição genuína.

# text
seg-606127880e96 = O mapa de interferência é <b>MODELLED</b> (limiares fixados antecipadamente, não validados face a uma medição de referência no terreno). Uma célula degradada não identifica a interferência como causa; uma célula não observada não é evidência de um percurso livre; descreve relatos passados e não é uma previsão. É apenas agregado: nenhum identificador é devolvido.

# text
seg-b2fd2a05842f = O NMEA de treino é <b>apenas texto</b>: nenhum RF, IQ ou forma de onda é sintetizado, nada é transmitido, e nunca se destina aos sistemas de navegação em funcionamento de uma embarcação.

# text
seg-4e3bbacda9ac = <s1>Anterior</s1>Utilizar o Kshana a partir de um agente

# text
seg-c5fbfab85e01 = <s1>Seguinte</s1>Plugin JetBrains

# attr:aria-label, text
seg-6555ff9a6d8e = Saída
