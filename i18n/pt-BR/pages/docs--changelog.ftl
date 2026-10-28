# docs--changelog: translations (pt-BR)

# text
seg-9a2a5f0a8a02 = Sistema solar

# text
seg-20db2c79b998 = Validado

# text
seg-a20b4a6e8f53 = relógio atômico em escala de chip

# text
seg-49a994d77d2f = oscilador de cristal com compensação de temperatura

# text
seg-2247a2344710 = Significado

# text
seg-5770537524d3 = Área

# text
# c1: CHANGELOG.md
seg-40d4fc0d3922 = Fonte: <c1/>

# text
seg-7333b85d448f = Todas as mudanças relevantes no Kshana estão documentadas aqui.

# text
seg-bbc8f38627f1 = O formato é baseado em <a1>Keep a Changelog</a1>, e este projeto segue o <a2>Semantic Versioning</a2>. Enquanto o projeto está antes da versão 1.0, o esquema público de cenários e resultados ainda pode mudar; as mudanças incompatíveis são destacadas explicitamente.

# text
seg-985f7b4c001a = Não lançado

# text
seg-a2f583aadd0b = Sem novos recursos: uma correção de linha de comando, atualizações de dependências nas ferramentas de validação cruzada e documentação. Os resultados do motor permanecem inalterados em relação à { "0.38.0" }.

# text
seg-c9a8a5898ced = Corrigido

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = A linha de comando encerra silenciosamente com o status { "141" } quando sua saída padrão é fechada (<c1/>), em vez de entrar em pânico com "failed printing to stdout: Broken pipe". { "141" } é { "128" } mais SIGPIPE, o status que um shell informa para <c2/>. Apenas um pipe fechado é tratado: um disco cheio ou qualquer outro erro de escrita ainda se reporta, e um fluxo ao vivo que escreve em um socket fechado ainda recebe seu erro de escrita. <c3/> fecha o leitor antes de o programa começar, de modo que a primeira escrita falha em toda execução.

# text
# c1: xval/
seg-2a47e785cc1d = Atualizações de dependências nas ferramentas de validação cruzada (<c1/>); nenhuma alteração em crate, wheel ou pacote distribuído.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } para { "0.9.11" } (RUSTSEC-2026-0186) nos arquivos de lock da verificação cruzada com o ANISE (<c2/>, <c3/>); os locks também ressincronizam a dependência por caminho <c4/> dentro do repositório.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } para { "13.0.0" } e <c2/> { "2026.7.22" } para { "2026.10.19" } nas versões fixadas do ambiente das referências independentes (<c3/>, <c4/>): as versões corrigidas para oito avisos de segurança do pillow e um do certifi.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, o README e este arquivo listam todo limiar do kshana-bench que é NOT MET, como registrado em <c2/>: <b>A2</b> (AUC de <c3/> { "0.766" } contra pelo menos { "0.80" } na divisão de teste), <b>D1</b> (maior diferença { "0.0301" }) e <b>tarefa (b) R1</b> (mantido, não reexecutado). Nenhum limiar foi afrouxado.

# text
# c1: docs/kinds/by-kind/
# c2: docs/KINDS.md
# c3: docs/COMMANDS.md
# c4: docs/ALL-SURFACES.md
# c5: docs/CAPABILITY-DOMAINS.md
# c6: tools/gen_kinds_index.py
# c7: tools/gen_readme_blocks.py
# c8: tools/gen_figures_038.py
# c9: tools/readme_audit.py
# c10: tests/readme_completeness_doc_sync.rs
seg-44d9c9622c24 = Revisão de completude do README: uma lista de conteúdo; os tipos de cenário organizados em famílias, cada um com uma página em <c1/> (a descrição e os campos do motor, as entradas e os resultados de uma execução de exemplo, as linhas do registro e as referências independentes, as limitações que o relatório da execução declara e o gráfico que o motor escreve), uma folha de contato por família, todos indexados por <c2/>; todo comando em <c3/>; toda superfície, comando de plugin, skill e página do Studio em <c4/>; todo domínio de capacidade em <c5/>; diagramas Mermaid incorporados (visão geral do sistema, superfícies, laço interno, confiança do receptor, ida e volta no laboratório, Studio, fluxo de teste e lançamento, mapa de módulos, distribuição). Escritos por <c6/>, <c7/> e <c8/>; auditados por <c9/>; protegidos por <c10/>, que também fixa a descrição e os campos de cada entrada ao motor.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/>: renderiza um diagrama Mermaid em SVG e PNG no Linux e atualiza o registro de renderização.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README: as figuras de usuário espacial e lunar usavam caminhos relativos a <c1/>, de modo que não carregavam a partir do README; um link apontava para <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Removidos dois arquivos de gráfico obsoletos, copiados à mão (<c1/>, <c2/>), que nenhuma página usava e que não correspondiam mais ao motor; <c3/> traz os gráficos atuais.

# text
seg-033d52126d8a = Adicionado

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>GNSS além da constelação (<c1/>).</b> Um novo tipo de cenário para espaçonaves acima, em torno e além das órbitas GNSS (<a1><c2/></a1>): disponibilidade de um e de quatro sinais, durações de interrupção, C/N0, DOP e enlaces de lóbulo principal contra lóbulos laterais para GPS, GLONASS, Galileo, BDS, QZSS e NavIC em uma casca ou ao longo de trajetórias LEO, MEO, GEO, HEO e de transferência lunar; padrões de transmissão do livreto, paramétricos ou fornecidos pelo usuário; um modelo de ionosfera, plasmasfera e atmosfera por raio rasante; um projeto de receptor para sinal fraco; um filtro de Kalman estendido GNSS de bordo para HEO e transferência lunar; e navegação relativa de formação. Comparado com o livreto do Space Service Volume do ICG sob um pré-registro submetido antes da execução: as constantes de potência mínima irradiada e o limiar lunar concordam, os demais limiares não são atingidos sob a leitura pré-registrada (quase todos por causa do ângulo de feixe inconsistente do GLONASS no livreto), e o substituto paramétrico dos lóbulos laterais não reproduz os padrões medidos do painel do GPS. Tudo permanece MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Órbita e superfície lunares como infraestrutura de navegação e geodésica (<c1/>).</b> Um novo tipo de cenário com cinco estudos selecionados por <c2/> (<a1><c3/></a1>): consistência de uma determinação de órbita GNSS da Terra a bordo em uma órbita de halo quase retilínea em relação a uma determinação independente em solo por distância e taxa de variação da distância; fase da portadora com dupla diferença conjunta de estação de superfície e orbitador, com fixação de inteiros por LAMBDA; informação de Fisher do datum lunar de sete parâmetros com e sem distâncias do orbitador à superfície; deslocamentos entre técnicas GNSS, VLBI e telemetria laser em relação à amarração local; e sensibilidade a h2, k2, l2 e à libração física. MODELLED, com entradas ILLUSTRATIVE: a numérica é verificada em relação a programas independentes em numpy e scipy, e nada é comparado com uma medição de uma grandeza lunar. Os limiares foram fixados em <c4/> e em duas emendas divulgadas. Três são NOT MET e cada uma é fixada por um teste que afirma a falha: C3 (um erro de força injetado não é detectado na taxa pré-registrada), Q3 (a taxa de sucesso por bootstrap difere da referência independente em numpy em { "1.7e-6" } contra um limiar de { "1e-9" }, pela aproximação da CDF normal do LAMBDA) e a metade do traço de G3 (acrescentar uma família de medidas de distância nem sempre reduz o traço da pseudoinversa). Os demais são atingidos (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Um sexto artigo na tabela de Pesquisa.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) mostra que a diluição da precisão é indefinida para rastreamento cislunar apenas por distância e usa, em vez dela, o Gramiano de observabilidade em quatro órbitas retrógradas distantes planares: apenas distância tem posto { "2" } de { "4" } em um instante e precisa de um arco de cerca de { "2.09" } h, a taxa de variação da distância (Doppler) dá posto { "4" } instantaneamente, e a coestimação de uma estação com estados e relógios de satélites continua com deficiência de posto de um sem um observável interferométrico externo. Seus números são regenerados pelo tipo de cenário <c1/> (<c2/>); <c3/> testa o limiar com um estimador independente. O cartão de pesquisa do README, os READMEs dos crates, do npm e do PyPI e o gerador o incluem.

# text
seg-d74a1b2dcb38 = O árbitro neutro, tornado mensurável.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> lê o catálogo e o plano de transmissão publicados do Jammertest da NPRA como verdade programada (identificadores do catálogo mantidos) e <c2/> pontua um registro de receptor em relação a ele por ensaio (latência de detecção, alarmes perdidos, alarmes falsos, tempo de recuperação), opcionalmente como um pacote de evidências assinado (<a1><c3/></a1>). Os limiares de pontuação foram fixados antecipadamente, antes de qualquer execução pontuada (<c4/>). No conjunto de dados JammerTest { "2024" } (obtido, nunca incorporado ao repositório), a regra de volume mínimo de dados fixada antecipadamente falhou tanto na primeira execução quanto na revisão do tratamento de dados, de modo que nenhum limiar é avaliável e nada é afirmado; ambas as execuções estão registradas e fixadas. MODELLED: o cronograma são as janelas registradas do conjunto de dados, não horários de transmissão gravados. O conjunto NMEA da SimulaMet de { "2025" } não é adaptado (nenhuma licença declarada em sua página).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Os próprios sinalizadores do receptor, ao lado dos do Kshana.</b> UBX-NAV-STATUS <c1/> e UBX-SEC-SIG são lidos em <c2/> a cada época, e a comparação <c3/> no resultado os confronta com os monitores do Kshana (ambos, apenas o receptor, apenas o Kshana, nenhum); ela não levanta alarme e não altera nenhuma pontuação. Um leitor SBF da Septentrio (PVTGeodetic, MeasEpoch, RFStatus, somente leitura, sobre o crate <c4/> de licença MIT) e <c5/> (um fluxo NMEA serial ou USB, somente leitura; nunca escreve em um receptor) se juntam a eles.

# text
# c1: docs/TIMING-HIL.md
# c2: docs/HARDWARE-SAFETY.md
# c3: holdover-test
# c4: clock_log
# c5: ptp4l
# c6: phc2sys
# c7: ts2phc
# c8: tracking
# c9: statistics
# c10: iq scene --format sdrx
# c11: iq monitor --follow
# c12: compliance-report
# c13: lab-attestation
# c14: HARDWARE-SAFETY.md
seg-90d9927fe3e2 = <b>Temporização e segurança de hardware</b> (<a1><c1/></a1>, <a2><c2/></a2>). O tipo de cenário <c3/> pontua um ensaio de holdover de um sistema de temporização (GNSS removido pelo operador, holdover, recuperação) a partir de um registro medido de erro de tempo, medido em relação às máscaras da ITU-T de tabelas públicas. <c4/> lê registros do linuxptp (<c5/>, <c6/>, <c7/>) e do chrony (<c8/>, <c9/>). <c10/> escreve metadados ION GNSS SDR e <c11/> monitora uma gravação SigMF enquanto ela cresce (apenas recepção). <c12/> ganha o NIST IR 8323r1 Foundational PNT Profile ({ "15" } linhas parafraseadas, fornece evidências em apoio de). Um pacote de evidências pode registrar a <c13/> do operador em seu manifesto assinado, nunca verificada; os estágios de hardware { "0" } a { "4" } e as notas legais estão em <c14/> (aguardando revisão jurídica). Não há nenhum caminho de transmissão de qualquer tipo.

# text
# c1: kshana bench
# c2: bench/SPEC.md
# c3: docs/BENCH.md
# c4: xval/bench/PREREGISTRATION.md
# c5: agc_k_sigma
# c6: xval/bench/RESULTS-v2.md
# c7: bench_score
# c8: bench_leaderboard
# c9: score_benchmark
# c10: render_leaderboard
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): tarefas, divisões e métricas fixas para detecção de interferência GNSS em registros de receptor (JammerTest { "2024" }) e em IQ, previsão de holdover de temporização (relógios IGS) e a lacuna de otimismo fora da distribuição; manifestos de divisão com hashes fixados e scripts de obtenção (nenhum dado incorporado ao repositório), um conjunto reservado selado por commit e revelação, um esquema de arquivo de resultados e uma página estática de classificação. Linhas de base sob limiares fixados antecipadamente em <c4/>: limiares do pontuador atingidos, C1 a C3 atingidos, D2 atingido; <b>A2 NOT MET</b> (AUC de <c5/> { "0.766" } contra pelo menos { "0.80" } na divisão de teste), <b>D1 NOT MET</b> (maior diferença { "0.0301" }) e <b>tarefa (b) R1 NOT MET</b> (mantido, não reexecutado), cada um fixado (<c6/>). Toda pontuação é MODELLED. Python <c7/>, <c8/>; WebAssembly o mesmo; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Observatório de interferência</b> (<c1/>, <c2/>, <a1><c3/></a1>): um GeoJSON diário reproduzível, um PNG e um JSON de relatório de incidentes com três estados (degradado, não degradado, não observado), um atraso mínimo de { "24" } h, células de { "0.5" } grau ou maiores, nenhuma causa atribuída e dados do OpenSky recusados; um estudo de sensibilidade dos parâmetros pré-registrados; um catálogo retroativo de 30 dias do Báltico a partir do adsb.lol.

# text
# c1: receiver-trust
# c2: docs/MACHINE-INPUTS.md
# c3: [log] format
# c4: rtklib-pos
# c5: .pos
# c6: novatel
# c7: BESTPOS
# c8: RANGE
# c9: RXSTATUS
# c10: self_report
# c11: receiver-self-report
# c12: rtcm3
# c13: NOTICE
# c14: gnss-sdr
# c15: integrations/gnss-sdr/relay.py
seg-497ae18bfb03 = <b>Entradas de máquinas e sensores para <c1/></b> (<a1><c2/></a1>). Novos valores de <c3/>, todos somente leitura, MODELLED, com fixtures escritas pelos autores e nenhum dado incorporado ao repositório: <c4/> (arquivos de solução <c5/> do RTKLIB), <c6/> (<c7/> OEM7 ASCII e binário, C/No de <c8/> e <c9/>; o sinalizador de jammer do receptor passa a ser o <c10/> da época, confrontado com os alarmes do Kshana pela comparação <c11/>), <c12/> (C/N0 de MSM4 e MSM7 para GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou e NavIC; layouts das tabelas do pyrtcm, sob licença BSD, cujo aviso está em <c13/>, não da norma RTCM) e <c14/> (mensagens do GNSS-SDR Monitor e do monitor PVT como linhas JSON, retransmitidas por <c15/>).

# text
seg-22e8b434782f = Registros de IMU como um segundo sensor.

# text
# c1: [log.imu]
# c2: csv
# c3: euroc
# c4: heading-course
# c5: kshana imu-fit
# c6: imu_fit
# c7: imu_fit
# c8: fit_imu_log
# c9: /kshana-fit-imu
# c10: hybrid
# c11: fusion
# c12: [accel_classical]
seg-5491196d6421 = <c1/> (<c2/> ou <c3/>) integra a taxa de guinada do giroscópio no rumo que o monitor <c4/> lê; em linha em todas as superfícies e levado adiante por pacotes de evidências. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plugin <c9/>, uma ação do JetBrains) ajusta os parâmetros do acelerômetro e do giroscópio dos cenários <c10/> e <c11/> a partir de um registro estacionário pelo desvio de Allan e imprime uma tabela <c12/> com o SHA-256 do registro em sua proveniência.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Integrações:</b> um pacote ROS { "2" } (<c1/>: NavSatFix e <c2/> na entrada, tópicos de confiança na saída; sua ponte sem ROS é testada contra o motor real, o próprio nó não foi executado em um grafo ROS ativo), uma ponte <c3/> (<c4/>, dependência MIT, opcional) e um relay do GNSS-SDR.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Exportador MQTT do Home Assistant</b> para a telemetria de confiança: <c1/> e <c2/> (mensagens de descoberta e um documento de estado JSON; apenas publicação, sem credenciais nem TLS) e <c3/> como texto em Python, WebAssembly e MCP.

# text
seg-f1cb2c2881c9 = Sete linhas MODELLED do registro para o que foi descrito acima. Nada aqui é VALIDATED: nenhuma captura de um receptor real, de uma estação base, de uma IMU, de uma execução do GNSS-SDR, de um grafo ROS ou de um broker MQTT foi lida.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Margem do enlace óptico ao longo do tempo.</b> O tipo de cenário <c1/> aceita uma tabela opcional <c2/> (<c3/>, <c4/>, <c5/>) e então também escreve, por local, uma realização com semente do modelo de local declarado ao longo do tempo: episódios de nuvens, uma coluna de água líquida por episódio, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem do enlace, os desvanecimentos por nuvens e por cintilação e o sinalizador de enlace ativo, com a disponibilidade realizada, a fração de nuvens, a contagem de interrupções e a interrupção mais longa. MODELLED (um sorteio do modelo, não o clima; nenhuma referência independente externa). Sem a tabela, o resultado é o documento da { "0.37" }. Os dois cenários ópticos incluídos trazem a tabela ({ "336" } h, { "600" } s, semente { "37" }). Limiares fixados antecipadamente em <c6/> antes da primeira execução.

# text
seg-78524dbb3bd2 = Especificação das condições de teste e a ida e volta em laboratório.

# text
# c1: kshana.test-conditions/1
# c2: docs/spec/TEST-CONDITIONS.md
# c3: recording.kind = "receiver-log"
# c4: kshana bench-export
# c5: <base>.conditions.json
# c6: kshana evidence round-trip
# c7: evidence_round_trip
# c8: create_round_trip_pack
# c9: /kshana-evidence-pack
seg-fbf034925641 = <c1/> é publicado como <a1><c2/></a1> com um JSON Schema, e ganha <c3/>. <c4/> também escreve <c5/>. <c6/> constrói um pacote assinado que vincula o hash do cenário, o hash das condições declaradas, o hash do registro do receptor e a pontuação em relação aos eventos declarados, e recusa condições que divergem dos eventos de pontuação. Exemplo trabalhado com gps-sdr-sim escrevendo apenas um arquivo; a reprodução é de responsabilidade do operador e nunca é automatizada. Python <c7/>, MCP <c8/>, plugin <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Pacotes de normas</b> (<c1/>, <c2/>): os perfis de teste do framework de PNT resiliente do DHS para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e monitorar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }, cada um um conjunto de cenários pontuados em relação a limiares declarados antes da execução, com as linhas de compliance-report para as quais fornecem evidências em apoio de. As falhas estão registradas e fixadas: DHS L4-T1 e os quatro testes de exatidão da IMO. O próprio Doc { "9849" } não foi lido (pago); o pacote do ICAO segue a apresentação do próprio ICAO sobre o Plano de Mitigação de RFI. <c3/> ganha uma seção de standards-pack. Tudo MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): códigos Gold AFS-I e Weil AFS-Q para PRN { "1" } a { "210" }, sinais <c2/> e <c3/> em <c4/>, o código SB1 BCH, o CRC-24Q e o entrelaçador, e <c5/> (<c6/>, <c7/>, <c8/>), fixados ao LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } de janeiro de { "2025" }). Códigos VALIDATED em relação às tabelas impressas do documento (que ele marca como TBC); uma coluna terciária impressa (PRN { "147" }) é provavelmente um erro de impressão e a falha está fixada. A codificação LDPC dos subquadros { "2" } a { "4" } não está implementada.

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Notebooks do curso</b> (<c1/>): jamming, spoofing, holdover, integridade, OSNMA e mapa de interferência, cada um com exercícios.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>Estudo de URA máxima do Marco { "3" } do ARAIM do WG-C UE-EUA</b> (<c1/>, <c2/>), substituindo o plano "Table A-3" retirado; MODELLED sob desvios declarados.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Rascunhos para aprovação do proprietário</b> em <c1/>: artigo para o JOSS, emenda ao estatuto do TSC, processo de registro de referências independentes e uma proposta de divisão de <c2/>. Nada ali foi adotado.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Visões do Studio para os recursos da { "0.38" }</b> (kshana.dev/studio/). Reprodução de ponte (duas execuções sintéticas em um mesmo relógio: trajetória, pontuação de confiança, os satélites que o registro ouve e o veredito, com os próprios sinalizadores do receptor ao lado dos alarmes do Kshana); PNT óptico (os dois cenários <c1/>, com uma realização com semente opcional de <c2/>, MODELLED); teste de holdover (o resultado de <c3/> medido em relação às máscaras da ITU-T, desenhado a partir do próprio <c4/> do resultado); um visualizador do observatório de interferência que abre os arquivos que você produziu e não distribui nenhum; na página Ferramentas, um pontuador do Jammertest, um ajuste de IMU e o MQTT como formato de telemetria; e em Confiança, um seletor de formato de registro (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) com um arquivo de IMU opcional. Toda visão lê arquivos no navegador e não envia nada; toda cifra mantém o rótulo que o registro lhe atribui, e cada uma traz a declaração consultiva. A página <c6/> do site mostra o fragmento <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Issue #36: camadas de pin exato em bytes.</b> As camadas de pin exato em bytes são executadas apenas em um host declarado como linha de base (<c1/>, definido por <c2/>), e não em todo Mac com Apple silicon, porque a biblioteca matemática da Apple difere entre versões do macOS; a camada portátil é executada em toda parte, e <c3/> impede que uma camada exata em bytes volte a ser condicionada apenas à plataforma. As próprias comparações com as referências independentes passam no macOS. Nenhum literal foi retomado e nenhuma tolerância foi alterada. <c4/> e <a1><c5/></a1> explicam como triar uma diferença; <c6/> é um diagnóstico manual e semanal, não um gate.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL: um padrão sem âncora no auxiliar trust-open do Studio</b> agora corresponde ao cabeçalho inteiro (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI: disco do runner.</b> O job <c1/> compila os perfis dev e test sem informação de depuração, de modo que a linkedição não enche mais o disco.

# text
seg-38c59868835e = <b>Verificações de código-fonte.</b> Todo arquivo-fonte que contém fixtures de teste com pins declara seu escopo de pin, e os testes que escrevem arquivos temporários usam um caminho único por chamada, de modo que execuções paralelas não colidem.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> é regenerado para o campo opcional <c2/> de optical-atmosphere.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>Plugin do JetBrains: nenhum uso de API da plataforma obsoleta ou com remoção prevista.</b> O IntelliJ Plugin Verifier (<c1/>) em relação ao build { "263" } do IntelliJ IDEA ({ "2026.3" }: { "263.6800.24" } e { "263.7031.23" }) encontrou uma chamada obsoleta, <c2/>, em Insert Example; agora ele abre o novo arquivo com <c3/>. O plugin é compatível e não apresenta avisos no { "2024.3" } (o since-build, inalterado) e em ambos os builds { "263" }. O CI agora executa <c4/> e falha em problemas de compatibilidade e em qualquer uso de API com remoção prevista.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>PNT óptico através da atmosfera</b> (tipo de cenário <c1/>, <a1><c2/></a1>, nota de projeto <c3/>). Para um enlace óptico e um conjunto de locais em solo, informa a perda em céu limpo dependente do comprimento de onda e da elevação, o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, desvanecimentos gama-gama, média de abertura), a disponibilidade em relação à margem do enlace a partir de um clima de nuvens declarado, a margem necessária para disponibilidades-alvo e o teto que nenhuma margem eleva, a distribuição de duração das interrupções, o erro de temporização e de medição de distância por interrupção pelo modelo de holdover do relógio, a diversidade de locais correlacionada pela distância e os ganhos hipotéticos de uma mudança de comprimento de onda, de uma abertura maior, da redução de cintilação por óptica adaptativa e de margem extra. <c4/> ganha um orçamento ciente da atmosfera; sem ele, sua saída é idêntica bit a bit à da { "0.36" } (limiar A5). Dois cenários incluídos trazem climas de nuvens ILLUSTRATIVE. MODELLED: três linhas do registro. A numérica atinge os limiares A1 a A6 fixados antecipadamente em <c5/> em relação a um programa independente em mpmath; isso verifica a implementação das fórmulas declaradas, não a atmosfera, e nenhum registro de disponibilidade medida foi comparado, de modo que nenhuma linha é VALIDATED. O limiar A4 foi inicialmente errado por { "3e-9" } porque a CDF normal em uso era uma aproximação de { "1.5e-7" }; a CDF foi substituída e o limiar foi mantido como registrado. As compilações nativa e WebAssembly retornam documentos idênticos byte a byte para ambos os cenários incluídos (A7, executado no commit de integração da { "0.37.0" }).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>ROC de detecção dos monitores IQ</b> (PRO-32, <a1><c1/></a1>). Uma campanha com monitores mantém o máximo de cada estatística de teste sobre as janelas de eventos declarados (positivas) e sobre janelas ladrilhadas fora dos eventos (negativas, <c2/>). O relatório as reúne por tipo de alarme em uma ROC com sua AUC e o ponto de operação no limiar configurado, como <c3/> e uma seção do relatório. Em campanhas sintéticas, a verificação de nível de acaso é atingida. O limiar de AUC do C/N0 ({ "0.95" }) não é atingido ({ "0.79" }), porque as janelas negativas logo após um evento herdam o decaimento do CUSUM a partir da detecção; isto está registrado. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>Monitores IQ na campanha de reprodução em laboratório</b> (PRO-31, <a1><c1/></a1>). Uma tabela opcional <c2/> em um arquivo de campanha executa os monitores IQ na passagem única do executor: potência e espectral após cada cadeia de front end, e C/N0, SQM e travamento por canal rastreado. Seus alarmes são pontuados em relação aos eventos declarados: detectado ou perdido, tempo até a detecção e alarmes falsos por hora de exposição. O valor de alarme falso em forma fechada de cada teste é declarado, inclusive um novo valor gaussiano bilateral para os testes de SQM (<c3/>). Sem a tabela, nada muda. Em campanhas sintéticas, os limiares de alarme falso de potência e de SQM e o limiar de alarme falso do C/N0 são atingidos; { "18" } de { "18" } atenuações são detectadas, mas o limite do tempo até a detecção, abaixo de uma amostra do detector por construção, não é atingido e está registrado. MODELLED; linha do registro "Monitores IQ pontuados em campanhas de reprodução em laboratório".

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Ajuste em laboratório a partir de campanhas IQ, acompanhamento</b> (<c1/>, job de CI <c2/>). Ele testa as duas hipóteses que o §{ "13.6" } de <c3/> deixou em aberto, em relação a limiares fixados antecipadamente em 1e532f84. Acrescenta duas campanhas sintéticas: S, com um J/S em degraus (semente 2026_1014), e R, uma rampa nova (semente 2026_1015). Os resultados estão em <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 atingido: com cada nível de J/S mantido, <c1/> é recuperado dentro de +{ "0.185" } dB. O erro de −{ "1.1" } dB das campanhas em rampa é defasagem do estimador.

# text
seg-ea9f206c2999 = S2 não atingido, fixado por um teste que afirma a falha: (d) como escrito na campanha em degraus vale para o modelo de laço de rastreamento ({ "0.45" } dB), mas não para o empírico ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 atingido: na campanha em rampa nova, (d), com o tempo de permanência da queda ajustado multiplicado pela taxa de rampa de cada evento e acrescentado, fica dentro de { "1" } dB para ambos os modelos.

# text
seg-24c6725c2c7d = As falhas de (a′) e (d) se repetem em R.

# text
# c1: step
seg-7cbbce356973 = Uma campanha agora pode declarar seu J/S como um perfil <c1/> no harness de teste.

# text
seg-34007ba58a9f = Nenhum veredito do §{ "13" } muda, e a linha do registro permanece MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Entrada em sincronismo do FLL com limite, opcional</b> (DS-LOOP-05): uma nova chave de projeto de laço <c1/> (s), em Rust <c2/>. Com <c3/>, força a transferência de FLL para PLL após esse tempo, qualquer que seja o PLI. Não definida por padrão e, nesse caso, fora do hash do projeto; o projeto padrão e seu hash permanecem inalterados.

# text
seg-ae2794b2d3d5 = Verificado em relação a limiares fixados antecipadamente em 58789af0, sobre verdade injetada. O controle é atingido: o padrão nunca transfere em { "9" } de { "10" } sementes a { "33" } dB-Hz.

# text
seg-6d9483874b35 = Não atingido: com um limite de { "1.0" } s, { "16" } de { "20" } execuções mantêm o travamento a { "33" } dB-Hz e { "8" } de { "20" } a { "31" } dB-Hz; as demais alternam entre transferências forçadas e o retorno do FLL. O jitter de fase é { "1.8" }× o do PLL isolado a { "33" } dB-Hz.

# text
seg-deeefaf50e3e = O piso de entrada em sincronismo de ~{ "35" } dB-Hz continua sendo o limite documentado do padrão.

# text
seg-780de73c01e1 = MODELLED; linha do registro "Entrada em sincronismo do FLL com limite, abaixo do piso de transferência de FLL para PLL do projeto padrão (opcional)".

# text
# c1: jamming
seg-ace6b53749bd = <b>Histerese de aquisição e quantizador do front end no tipo de cenário jamming</b> (CAP-06c): duas seções opcionais para um cenário <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, em ou acima do limiar de rastreamento) e <c3/> (s, padrão { "0" }). Um satélite é adquirido em ou acima do limiar de aquisição, depois de ter ficado não adquirido durante o atraso. É mantido enquanto estiver em ou acima do limiar de rastreamento. Saídas: <c4/> (verdadeiro/falso), <c5/> (contagem) e <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/>: <c2/> ({ "1" } a { "16" }) e <c3/> (MHz, padrão o dobro da taxa de chip). Gera um bloco <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, retirada do C/N0 efetivo de cada enlace) e <c8/>. A perda é a de entrada gaussiana, sinalizada como não válida para jammers CW, de banda estreita e varridos.

# text
seg-0dad81736863 = Sem as seções, toda saída é idêntica byte a byte.

# text
seg-92007bfb6680 = Verificado em relação a limiares fixados antecipadamente em 70c72fcc. A perda do quantizador fica dentro de { "0.0007" } dB de um Monte Carlo independente, e a leitura do AGC dentro de { "0.012" } dB do laço de AGC da camada IQ.

# text
seg-973e451df99d = As execuções de histerese registradas não foram informativas (todo enlace perdido), de modo que esse limiar é NOT MET. Um conjunto suplementar de execuções registrado em { "37793290" } o atinge: todo sinalizador é igual a um recálculo independente, e { "732" } de { "1824" } enlaces mostram a histerese.

# text
seg-912e9f1a4d5b = Constatação: com um jammer CW, um ADC de 1 bit perde cerca de { "5" } dB a mais que o valor gaussiano.

# text
seg-a19aee81b581 = MODELLED; linha do registro "Histerese de aquisição e quantizador do front end no tipo de cenário jamming em relação a recálculos independentes".

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Sombreamento do terreno sobre o jammer no tipo de cenário jamming</b> (CAP-06b): uma seção opcional <c1/> em um cenário <c2/> com um jammer. Campos:

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/>: uma tile SRTM <c2/>, relativa ao diretório de trabalho;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> e <c3/> (deg): o tamanho e o canto da tile;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, padrão { "0" }), <c2/> (padrão 4/3) e <c3/> (m, padrão { "30" }).

# text
seg-ad58fe7ff627 = O motor amostra o perfil do terreno em círculo máximo entre o jammer e o receptor e encontra o gume de faca dominante. A potência recebida do jammer, e portanto todo J/S, é reduzida pela perda por gume de faca único da ITU-R P.526-15 §{ "4.1" }.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = O resultado ganha um bloco <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) e <c7/> (contagem).

# text
seg-b9696f5eda4b = Sem a seção, toda saída é idêntica byte a byte.

# text
# c1: ν
seg-593b6a5b4480 = Verificado em relação a limiares e dez posições fixados antecipadamente em 92cd2bfd, sobre a tile SRTM real registrada do Vale da Morte, em relação a um recálculo independente em numpy. Todos atingidos: pior diferença de { "1.6e-10" } em <c1/> e na perda (limiar { "1e-9" }), a perda monótona na altura do jammer e a perda reduzindo o J/S exatamente por ela mesma.

# text
seg-62e07defd715 = MODELLED; linha do registro "Sombreamento do terreno sobre o jammer no tipo de cenário jamming em relação a um recálculo independente em numpy sobre uma tile SRTM real".

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>Ganhos de antena CRPA no tipo de cenário jamming</b> (CAP-06a): uma seção opcional <c1/> em um cenário <c2/>. Campos: <c3/> (posições dos elementos em leste-norte-cima locais, m), <c4/> (<c5/> ou <c6/>) e <c7/> (largura de banda de ruído do MVDR, MHz, padrão o dobro da taxa de chip).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Cada canal forma um feixe sem distorção em direção ao seu satélite. O ruído do enlace é escalado por <c1/> e o jammer por <c2/> antes da equação C/N0 antijam existente.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Cada enlace ganha um bloco <c1/>: <c2/> (dB) e <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Uma seção inválida (uma lista de elementos vazia, uma ponderação desconhecida, uma largura de banda não positiva) é um erro, tanto por <c1/> e <c2/> quanto por <c3/>.

# text
seg-2464d9dde85f = Verificado em relação a limiares fixados antecipadamente em 08d83b4d. Atingidos: aditividade (depois de uma correção: a primeira versão adicionou as novas unidades à tabela de unidades de toda execução de jamming); um elemento não é um arranjo; ganho de ruído e C/N0 efetivo em relação a um recálculo independente em numpy dentro de { "1e-9" } dB; o MVDR tende ao nulo em JNR alto.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = Não atingido: o ganho do jammer do MVDR em { "194" } de { "456" } enlaces com a matemática portátil de { "0.36" } ({ "202" } com a matemática do hospedeiro; <c1/>) (pior caso { "1.7e-6" } dB). Os resíduos de −{ "100" } a −{ "188" } dB estão abaixo da resolução do float64 nesse limiar, e o numpy discorda de si mesmo na mesma ordem de grandeza.

# text
seg-c10e1c72eb15 = MODELLED; linha do registro "Ganhos de antena CRPA no tipo de cenário jamming em relação a um recálculo independente em numpy".

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>Motor de rastreamento IQ em relação ao GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> e o GNSS-SDR rastreiam as mesmas gravações numpy independentes de GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Limiares fixados antecipadamente em 48edd4a5. A calibração registrada falhou por uma transferência errada do GNSS-SDR (F3), de modo que a Emenda { "1" } (1e4288c4) acrescenta um FLL apenas de entrada em sincronismo a ambos os receptores, submetida antes de qualquer gravação de teste.

# text
seg-1d651ff134f9 = Atingidos: o jitter de portadora e de código e o Doppler concordam dentro de { "5" } % em todo C/N0.

# text
seg-bc9c9a0247d1 = Não atingidos: o C/N0 NWPR do motor lê { "2.3" }–{ "7.1" } dB abaixo do SNV do GNSS-SDR (F4, um limite conhecido do estimador; o M2M4 fica a { "0.06" } dB da verdade); os indicadores de travamento diferem por definição (F5); uma divergência de perda de ciclo a { "30" } dB-Hz (F6).

# text
seg-7c32867b5c27 = MODELLED; linha do registro "Motor de rastreamento IQ em relação ao GNSS-SDR { "0.0.19" } em gravações independentes".

# text
seg-6ba057fab559 = <b>Duas linhas VALIDATED para códigos da camada IQ</b> (DS-GIQ-06b, PRO-39).

# text
seg-55524624777b = <b>BeiDou B1I.</b> Todos os { "63" } códigos primários B1I coincidem chip a chip com o gerador independente do GNSS-SDR { "v0.0.19" } (limiar fixado antecipadamente em 911106d1). Apenas a saída desse programa está registrada: os códigos PRN B1I que o ICD público define, como um prefixo e um hash.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Todos os { "126" } códigos L1CP/L1CD e as { "63" } sobreposições L1CO coincidem com as colunas de verificação que o IS-GPS-800J imprime, e a sequência de Legendre calculada coincide com a sua Tabela 6.2-1 (limiares fixados antecipadamente em fe372e26).

# text
seg-f445784a7f2d = Linhas: "Códigos de alcance primários do BeiDou B1I em relação a um gerador independente" e "Códigos de alcance e de sobreposição do GPS L1C em relação às colunas de verificação impressas no IS-GPS-800J".

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>Bandas GLONASS, BeiDou e Galileo E6 no modelo de espectro</b> (CAP-12, sinais): novos nomes de banda <c1/> e <c2/> (qualquer canal FDMA como <c3/>, K = −{ "7" } a { "6" }), <c4/>, <c5/>, <c6/>, <c7/> e <c8/>. Cada uma traz a portadora, a modulação e a potência mínima recebida de seu ICD. São opcionais, por nome: o conjunto de bandas padrão e toda saída existente permanecem inalterados.

# text
seg-158a6ec19d6b = Verificado em relação a limiares fixados antecipadamente em 5806f28b: os valores do ICD, os nulos, o composto B1C e o caminho C/N0 são atingidos.

# text
seg-805092ae8ca2 = Dois limiares não foram atingidos. O limiar de área unitária era inatingível como escrito (F1). As formas de onda B1I e B1C da camada IQ coincidem com o modelo apenas com média por banda, por causa dos espectros de linhas irregulares de seus códigos (F2).

# text
seg-db88f07d97bb = MODELLED; linha do registro "Modelo de espectro: bandas GLONASS, BeiDou e Galileo E6 (opcional)".

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Opção CFAR por média de células (cell-averaging) na aquisição IQ</b> (PRO-37): <c1/> e <c2/> decidem sobre uma grade de aquisição comparando cada célula com a média de células de referência em sua linha Doppler. O limiar vem da probabilidade de falso alarme do CA-CFAR em forma fechada para <c3/> blocos não coerentes (<c4/>, <c5/>), de modo que a decisão não depende da normalização da potência da amostra. É opcional; o detector padrão e toda saída existente permanecem inalterados.

# text
seg-a56e74b1e091 = Verificado em relação a limiares fixados antecipadamente em 3724aefa: a forma fechada contra Monte Carlo ({ "18" } de { "18" } casos), e uma taxa de projeto de { "1" } % medida em { "0.97" }–{ "1.01" } % em ruído gaussiano e quantizado em 2 bits.

# text
seg-f88fe97e0ee6 = Um limiar não foi atingido: em um sinal de 2 bits sem ruído, { "1.28" } % das células fora do pico excedem o limiar de decisão, nos lóbulos laterais de correlação do código (constatação F1).

# text
seg-8d88b626c31e = MODELLED; linha do registro "Opção CFAR por média de células (cell-averaging) na aquisição IQ".

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Modelo de cintilação em relação a dados medidos</b> (PRO-34): o modelo de cintilação de Cornell do canal IQ foi comparado com a intensidade e a fase GPS L1 medidas a { "50" } Hz em uma noite de cintilação equatorial (registro Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), sob limiares fixados antecipadamente em b6ccb499. Atingidos: a distribuição de intensidade e a cintilação de fase associada ao S4. Não atingido: o modelo desvanece abaixo de −{ "10" } dB { "2.4" } vezes mais frequentemente e { "3.5" } vezes por mais tempo (constatação F1). O processamento registrado lê a fase embrulhada (wrapped) do modelo (constatação F2); o resultado de fase se mantém com ela desembrulhada. <c1/> obtém os dados. A linha permanece MODELLED: "Canal de cintilação ionosférica IQ (modelo de Cornell) em relação à cintilação GPS L1 medida a { "50" } Hz".

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Leitor corrigido de amostras LuGRE</b> (MR-09): <c1/> lê um lote IQ LuGRE com I no nibble alto e os níveis mid-rise <c2/> (<c3/>), que removem a média de −½ que os inteiros em complemento de dois puros carregam em I e Q. <c4/> dá ao GNSS-SDR a mesma leitura. O leitor ION genérico e toda saída existente permanecem inalterados: { "149" } resultados de cenário e um estudo são idênticos byte a byte antes e depois, e as constatações fixadas do LuGRE se leem como registradas (<c5/>). Nenhuma linha do registro muda.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Rastreamento BOC({ "1,1" }) opcional</b> (CAP-07 (a)): <c1/> reescala os discriminadores do DLL para o pico principal do BOC({ "1,1" }) senoidal e acrescenta um monitor bump-jump (correlatores muito adiantado e muito atrasado a ±{ "0.5" } chip, contadores crescente/decrescente, <c2/>) que tira o NCO de código de um pico lateral; <c3/> lista os saltos. Desligado por padrão, e toda saída existente permanece inalterada. Verificado em relação a limiares fixados antecipadamente em 6b68f6cc em um sinal BeiDou B1C sintético: uma partida em pico lateral que fica { "0.55" } chip desviada sem a opção é puxada para o pico principal por um salto em { "0.08" } s com ela, e nenhum salto falso foi visto a partir do pico principal. Um limiar não foi atingido: a grade de testes unitários para a escala alcança fora da faixa linear dos discriminadores (constatação F1 em <c4/>). MODELLED; linha do registro "Rastreamento BOC({ "1,1" }): escala do DLL e resolução de ambiguidade bump-jump (opcional)".

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Ajuste em laboratório a partir de campanhas IQ</b> (B7.1, <a1><c1/></a1>). O <c2/> de um cenário labfit ajusta uma pasta de saída de <c3/> na CLI (<c4/>), em Python (<c5/>) e na ferramenta labfit do MCP (apenas pastas dentro de seu diretório de trabalho). Ele ajusta uma unidade por sinal, projeto de laço, cadeia de front end e tipo de jammer:

# text
seg-1726361b81c4 = o modelo de C/N0 em relação a J/S declarado, com censura;

# text
seg-e1b8a27b06fd = o limiar de rastreamento, diretamente e em forma fechada;

# text
seg-8dce89923619 = os modelos de laço de rastreamento e de travamento empírico, acoplados pelo modelo de C/N0, com seus tempos de permanência;

# text
seg-108646713c97 = um bootstrap de agrupamentos com semente sobre as gravações, intervalos de predição de { "90" } % e reservas deixando uma gravação de fora;

# text
# c1: [validation]
seg-ee5deb4d5d4b = uma tabela <c1/> fixada antecipadamente, com hash, com PASS/FAIL por limiar.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = O relatório é <c1/> em JSON, CSV e Markdown, com um bloco de unidades. <b><c2/> não é identificável a partir de dados de C/N0</b> sem uma medição de potência independente. Ele é declarado, nunca ajustado, e o parâmetro ajustado é <c3/> (emenda de projeto de 2026-10-12). Um tipo de jammer desconhecido assume o <c4/> declarado mais danoso (cw, { "1" }). Em campanhas sintéticas a partir das próprias cenas do Kshana, o limiar de cobertura da reserva (c) é satisfeito. Os limiares de <c5/> (a') e (b') ({ "0" } de { "50" } campanhas cobertas) e o limiar (d) do limiar de rastreamento em forma fechada não são atingidos: estão registrados com seus valores. MODELLED; linha do registro "Calibração dos modelos de C/N0 e de travamento do receptor aberto em relação a resultados de campanhas IQ, com erro de predição declarado". O caminho labfit de registro de receptor e suas saídas permanecem inalterados.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> em um kernel do JPL</b> (CAP-31): <c2/> toma cada corpo que o SPK contém (com de440s: Mercúrio, Vênus, a Terra, a Lua) do kernel, rótulo <c3/>, e acrescenta um bloco <c4/> apenas quando definido. Nova linha, VALIDATED em relação ao SPICE (fixada antecipadamente f8e946ea; pior caso { "3.3e-5" } m, { "1.0e-11" } m/s). O relatório padrão permanece inalterado.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop nas efemérides DE440</b> (CAP-20b): <c1/> varre C3 e V∞ de chegada sobre estados heliocêntricos de um SPK DE440. Nova linha, VALIDATED em relação a estados do SPICE

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (fixada antecipadamente 2d857fb1; Terra a Marte 2026-2028, { "304" } células, pior caso { "2.6e-14" }, a mesma célula de C3 mínimo).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>Macromodelo não gravitacional do LRO: NOT MET</b> (DS-LRO-10, fixado antecipadamente e82047e2). <c1/> (opcional via <c2/>): radiação solar direta em placa plana com a sombra da Lua, um painel que acompanha o Sol e albedo lunar e IR térmico; <c3/> é uma aproximação genérica rotulada do LRO a partir de fatos publicados (sem placas do barramento: a tabela de placas não pôde ser obtida). No arco de { "4" } h do LRO, ele deixa o RMS dinâmico reduzido em { "6.668" } m e o dinâmico em { "11.94" } m, com um fator de radiação implausível (cerca de +{ "21" } / −{ "22" }), de modo que os três limiares são perdidos. A constatação é fixada por um teste, e nenhuma saída padrão muda (<c4/>). O SRP lunar de bola de canhão opcional agora usa a sombra cônica da Lua em vez da da Terra (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>OD lunar: maré sólida k2 opcional e relatividade selenocêntrica</b> (DS-LRO-11), desligadas por padrão (<c1/>, <c2/>); uma chave <c3/> para a validação cruzada com o ANISE (DS-LRO-04); uma fixture de arco de { "24" } h do LRO e um ajuste de arco longo apenas informativo (DS-LRO-09). As execuções informativas estão registradas em <c4/>; nenhum número publicado muda.

# text
seg-b065138adba8 = <b>NRHO { "9" }:{ "2" } do CR3BP em relação ao CAPSTONE</b> (CAP-29d): nova linha MODELLED que mede a NRHO circular restrita do motor em relação à órbita voada do CAPSTONE (JPL Horizons, março de { "2023" }; fixada antecipadamente { "4e868170" }): período { "1.07" } %, apolúnio { "0.05" } %, perilúnio { "4.1" } % a partir das médias do CAPSTONE, dentro dos limiares registrados de { "3" } / { "5" } / { "20" } %. Uma medição, não uma validação.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>Estados rotativos do CR3BP para ICRF centrado na Lua</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> mapeiam um estado rotativo adimensional Terra-Lua para a linha Terra-Lua instantânea do DE440, inclusive a taxa fora do plano do referencial. Nova linha, VALIDATED em relação a um referencial de dois vetores do SPICE (fixada antecipadamente 2313eb1b, emendada antes de qualquer execução d5ef79b3; { "72" } casos, pior caso { "1.8e-7" } m e { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>Membros de famílias do CR3BP em relação à API Three-Body Periodic Orbits do JPL: NOT MET</b> (RM-35, fixado antecipadamente a9074f65). <c1/> (correção de halo, NRHO e DRO, índice de estabilidade da monodromia, continuação por pseudo-comprimento de arco) coincide com { "54" } de { "58" } membros da API em todos os limiares (estado, período e Jacobi dentro de { "1e-10" } em todos os casos). Um índice de estabilidade de halo L1 ({ "9.5e-2" }) e três fechamentos de DRO pequenas ({ "1.5e-8" } a { "3.3e-8" } contra { "1e-8" }) falham, de modo que o módulo é <c2/> e nenhuma linha o afirma. Resultados: <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Orientação e ambiente lunares DE440 opcionais</b> (FUT-05, DS-LRO-08; padrões inalterados): <c1/>, <c2/> / <c3/> (ancoradas na época, eixos principais do DE440) e <c4/> (orientação PA do DE440 incorporada mais o Sol e a Lua geocêntricos a partir de um SPK DE440 fornecido pelo usuário). Em relação ao ANISE (fixado antecipadamente ea537710): orientação dentro de { "3.5e-7" } rad e ajustes do LRO dentro de { "1" } mm, mas a parte das efemérides não atingiu seu limiar (Sol { "30.7" } m, Lua { "1.1" } m, um deslocamento de tempo de ~{ "1" } ms do lado do ANISE), de modo que não é uma linha validada. Resultados: <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Datum da campanha do referencial lunar, limiar do NumPy escalado pela condição: NOT MET</b> (fixado antecipadamente b887eb05; permanece MODELLED). A etapa { "0" } descarta o recurso de pseudoinversa como causa da lacuna de { "0.30" } nas estações estimadas; o NumPy concorda dentro do limiar em seis de oito cenários, mas stations_estimated o excede ({ "6.8e-6" } contra { "5.9e-7" }), e na data nova 2026-12-01 um farol não observado no polo sul torna a informação dos faróis deficiente em posto, o que a referência independente inalterada não consegue avaliar. Resultados: <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Datum do referencial lunar a partir de uma campanha de observação real (Lua analítica) VALIDATED</b> em pontos normais EDC novos de { "2025" } (fixado antecipadamente 31f5283 antes de qualquer um ser obtido): a referência independente inalterada em SPICE e NumPy concorda na contabilidade, nos postos e no acoplamento nulo, e dentro de { "1.11e-3" } nos sigmas (limiar { "1e-2" }), { "8.95e-4" } na condição e { "1.79e-3" } nas razões transversal/longitudinal (limiar { "2e-2" }). Uma verificação de biblioteca apenas do cálculo da covariância; os limiares não discriminam modelos da Lua. Resultados: <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>Orientação IAU dos corpos e GM dos catorze corpos do sistema solar acrescentados</b>, separados da linha "Constantes físicas de todo corpo do sistema solar" em uma linha VALIDATED (fixada antecipadamente 154bc54): <c1/> concorda com o <c2/> do SPICE em pck00011 dentro de { "1e-9" } rad em { "574" } matrizes nas épocas originais e em { "574" } em { "41" } épocas novas nunca comparadas antes (pior caso Fobos { "1.38e-10" } rad), e <c3/> é igual a gm_de440 para os catorze corpos. O restante da linha original (J2, raio médio, o relatório) permanece MODELLED. Resultados: <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Lambert de múltiplas revoluções</b> (<c1/>): toda solução com até três revoluções, ambos os ramos. Nova linha do registro, VALIDATED em relação ao pykep { "3.0.1" } (fixada antecipadamente a75de851; { "382" } casos, { "1058" } soluções, pior diferença de velocidade { "1.6e-13" } contra { "1e-8" }). A proteção interna de pouso de Kepler encontrou uma limitação de <c2/> em um arco com e = { "0.994" }; ela está registrada em <c3/>.

# text
seg-b62dc38b09e9 = Pressão de radiação solar de caixa-asas (box-wing) e ECOM2 (DS-PA-14), opcional.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/>: um modelo de caixa-asas de placas planas com as tabelas do Galileo FOC/IOV dos metadados de satélite do GSC, em direcionamento de guinada GNSS nominal, com fatores de radiação e derivadas parciais por painel, e o modelo empírico ECOM2 com suas derivadas parciais. Selecionado com <c2/> / <c3/> (campos <c4/>, padrão <c5/>: o caminho de bola de canhão e todo golden permanecem inalterados); com um conjunto de caixa-asas, <c6/> é seu fator de radiação. Comparado com o Orekit { "12.2" } sob um pré-registro (<c7/>): todo limiar atingido, cerca de { "1e-15" } relativo; VALIDATED como avaliação de modelo, a previsão de SRP do Galileo permanece MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>Sombra de SRP com Terra achatada e escurecimento de limbo solar (FUT-09, RM-11).</b> Novo módulo <c1/>: <c2/> (elipsoide ocultante WGS-84), <c3/> (lei de Eddington) e <c4/>, selecionados com <c5/> (padrão: a sombra cônica esférica existente, inalterada); <c6/>. A sombra com Terra achatada concorda com a razão de iluminação do Orekit { "12.2" } dentro de { "7.4e-9" } em { "2400" } geometrias (VALIDATED, <c7/>); o escurecimento de limbo não tem referência independente externa (MODELLED).

# text
seg-f09d4b831dfe = Termosfera NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/>: um port de <c2/> e <c3/> (chaves, modos de Ap diário e de arranjo ap a cada 3 horas) a partir da versão em C de domínio público do Fortran do NRL. É idêntica bit a bit a esse port em C e fica dentro de { "1.9e-6" } relativo do pymsis { "0.13.0" } (Fortran do NRL, precisão simples) em uma grade de 720 pontos, e reproduz os { "17" } casos de teste publicados (VALIDATED; <c4/>). Isto valida o port, não a exatidão do modelo em relação à densidade medida.

# text
seg-9e8e9018dbaf = Nível opcional de densidade de arrasto NRLMSISE-00.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> e <c4/>. O modelo exponencial estático continua sendo o padrão, bit a bit. O clima espacial é constante por modelo. VALIDATED em nível de órbita em relação ao próprio arrasto NRLMSISE-00 do Orekit { "12.2" } ao longo de { "24" } h (pior caso { "0.03" } m contra até { "142" } km de deslocamento por arrasto; <c5/>).

# text
seg-b1b2ac9ac91e = Sol e Lua DE440 opcionais no propagador de Cowell (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> aceita qualquer <c2/> (por exemplo, um <c3/> DE440) para os termos de terceiro corpo e de SRP; recusa um provedor que não possa atender à época, conta os recuos para a série analítica e vem desligado por padrão. <c4/> mantém a precisão em duas partes. Em relação ao Orekit { "12.2" } em seu próprio leitor de DE440, órbitas de { "24" } h concordam a { "0.017" } m; o limiar de posição do Sol/Lua fixado antecipadamente não foi atingido ({ "6.4" } m / { "0.24" } m; o SPICE mostra a mesma lacuna), portanto MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Maré atmosférica S1 opcional (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> e <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabela { "1" } modelo N1, graus { "2" }–{ "6" }), habilitadas com <c3/> em <c4/> e <c5/>; desligadas por padrão. MODELLED (coeficientes reverificados em relação à tabela publicada; sem referência independente externa para o efeito de força).

# text
seg-c62d816a93cf = Determinação de órbita em lote por taxa de variação da distância e azimute/elevação com máscara de elevação (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (STM variacional com derivadas parciais analíticas de dois corpos + J2), <c5/>, <c6/>; <c7/>. O caminho apenas por distância permanece inalterado. Comparado com os mínimos quadrados em lote do Orekit { "12.2" } em { "8" } cenários fixados antecipadamente: todo limiar atingido, exceto a concordância de estado sem ruído (≤ { "1" } cm), não atingida em { "2" } de { "4" } cenários, a { "1.46" } e { "1.74" } cm, com o kshana a { "1e-8" } m da verdade; registrado, MODELLED.

# text
seg-223f1e39669f = Ponderação de exatidão do SP3 (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> e <c2/> mapeiam os códigos de exatidão do cabeçalho e de cada registro para sigmas de observação; uma variante de ajuste do Galileo ponderada pelo SP3 (RMS 3D do Tier-2 de { "0.035" } m contra { "0.070" } m sem ponderação) é acrescentada ao lado das execuções registradas inalteradas. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Job de despacho do arco completo do Swarm-A (DS-PA-08)</b> em <c1/>.

# text
seg-cc5e8af7cb0d = Gravidade planetária a partir de tabelas SHADR do PDS (CAP-30, parte do CAP-31).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) lê o Mars GMM-3 (g/o { "120" }) e o GRAIL GL0660B (g/o { "660" }); <c3/> anexa qualquer campo carregado (padrões inalterados). Recortes de grau 20 estão incluídos (NASA PDS, domínio público; <c4/>); os arquivos completos são obtidos por <c5/>. VALIDATED em relação ao pyshtools { "4.14.1" } (dentro de { "4e-15" } da gravidade total em g/o { "120" } sobre toda a esfera, { "5e-14" } em g/o { "660" } para |lat| ≤ { "60" }°); a ligação ao referencial do corpo permanece MODELLED (o referencial nativo de cada campo não é o referencial IAU usado).

# text
seg-afb5fbf86ffc = Gravidade de alto grau até o grau { "2190" } (RM-14, FUT-07).

# text
# c1: SphericalHarmonicField::acceleration_hf
# c2: potential_hf
# c3: prepare_high_degree
# c4: from_gfc_file
# c5: from_gfc_reader
# c6: scripts/fetch_egm2008.sh
# c7: KSHANA_EGM2008_GFC
# c8: propagator::FieldEvaluator
# c9: Geopotential
# c10: xval/
seg-28bc597b06b2 = <c1/> / <c2/> (coluna direta modificada de Holmes–Featherstone, sem underflow, sem singularidade polar), <c3/>, um carregador ICGEM em fluxo <c4/> / <c5/> (verificações de norma e de grau máximo, sistema de marés registrado, termos variáveis no tempo rejeitados) e <c6/> (EGM2008 completo, SHA-256 fixado, não incluído; testes condicionados a <c7/>). <c8/> o seleciona no <c9/> opcional. Concorda com o Orekit { "12.2" } a { "7.3e-17" } m/s² até o grau { "2190" }, e uma órbita de { "24" } h com { "200" }×{ "200" } concorda a { "0.13" } m. MODELLED: o pyshtools não atingiu o limiar de proximidade do polo fixado antecipadamente (rastreado até o pyshtools) e o controle de sensibilidade ao grau 70 da órbita não foi atingido ({ "0.73" } m < { "1" } m); ambos estão registrados em <c10/>.

# text
seg-4ef4f74f21c1 = Integrador DOP853 (FUT-11).

# text
# c1: integrator::integrate_dop853
# c2: integrate_dop853_checked
# c3: integrate_dop853_dense
# c4: dop853_step
# c5: dop853_initial_step
# c6: propagator::Integrator::Dop853
# c7: propagate_dop853
# c8: propagate_dop853_checked
# c9: solve_ivp(method="DOP853")
# c10: xval/dop853-scipy/
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (saída densa de 7ª ordem), <c4/>, <c5/>, com uma proteção de passo que falha de forma segura; <c6/>, <c7/>, <c8/>. O driver padrão permanece inalterado. VALIDATED em relação ao <c9/> do SciPy { "1.18.1" }: passos únicos dentro de { "5.6e-15" }, sequências de passos coincidentes, estados finais dentro de { "1.6e-12" } (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Resolvedor de Kepler robusto (FUT-12).</b> Novo módulo <c1/>: <c2/> (valor inicial de Markley { "1995" }, resíduo sem cancelamento) para todo { "0" } ≤ e < { "1" }, envolvido por <c3/>. VALIDATED em relação a raízes mpmath de 50 dígitos a { "0.9" } ε·|E| até e = { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Gravidade tesseral da Terra opcional no propagador de Cowell (RM-09).

# text
# c1: propagator::ForceModel
# c2: geopotential: Option<Geopotential>
# c3: with_geopotential
# c4: with_egm2008(nmax)
# c5: SphericalHarmonicField
# c6: .gfc
# c7: EarthFixedFrame::Era
# c8: EarthFixedFrame::Cio
# c9: None
# c10: xval/cowell-tesseral-orekit/PREREGISTRATION.md
seg-e1a7ad42211e = <c1/> ganha <c2/> (<c3/>, <c4/>). Ele avalia um <c5/> (EGM2008 incluído até grau/ordem { "70" }, ou qualquer <c6/> do ICGEM) em um referencial terrestre fixo alcançado pelo ângulo de rotação da Terra (<c7/>) ou pela cadeia CIO GCRS para ITRS (<c8/>). Padrão <c9/>: nenhuma saída existente muda. VALIDATED em relação ao Holmes–Featherstone do Orekit { "12.2" } ao longo de { "24" } h ({ "6" } casos, pior caso { "0.036" } m), com os limiares fixados antecipadamente em <c10/>.

# text
# c1: jd2::gmst82
# c2: cio::gcrs_to_itrs_matrix_jd2
# c3: frames::teme_to_itrf_jd2
# c4: itrf_to_teme_jd2
# c5: orbit::Propagator::position_in_frame_jd2
# c6: own_jd2_utc
# c7: From
# c8: jd2::Jd2
# c9: timescales::TwoPartJd
# c10: two_part_jd = true
# c11: ephemeris
# c12: gmst82
# c13: c2t06a
# c14: f64
# c15: f64
seg-957686bb351e = <b>Datas julianas em duas partes pela rotação da Terra no caminho de órbita</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> e <c6/>, conversões <c7/> entre <c8/> e <c9/>, e um <c10/> opcional para o cenário <c11/> (ECEF, trilha no solo e visão da estação; desligado por padrão e inalterado, e a chave é deixada fora do hash do cenário quando desligada). Nova linha do registro, VALIDATED em relação ao pyerfa <c12/>/<c13/> (fixada antecipadamente b10475ee; { "40" } datas: GMST idêntico bit a bit, matriz dentro de { "2.7e-14" }, rotação em passos de { "1" } µs dentro de { "1.1e-14" } rad, onde o caminho de <c14/> único as perde). A época do modelo de forças de Cowell continua em <c15/> único; o motivo está em sua documentação.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>Predição de EOP além da tabela</b> (<c1/>, <c2/>): uma extensão opcional de uma série de orientação da Terra do IERS pelo preditor LS+AR emitido em sua última linha, de modo que os argumentos de referencial de uma época posterior seguem a previsão em vez de ficarem presos à última linha. As respostas dentro da tabela são idênticas bit a bit (testado); a série continua presa à última linha, a menos que isto seja chamado. A exatidão da previsão continua sendo a constatação LS+AR existente em relação ao Bulletin A (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Deslocamentos do polo celeste dX, dY na cadeia CIO</b> (<c1/>), e verificações diretas de vetores do ERFA de <c2/>, <c3/> e da nova função. Nova linha do registro, VALIDATED em relação ao pyerfa (fixada antecipadamente 979c1e39; { "40" } épocas { "1950" }–{ "2100" }: precessão e CIO idênticas bit a bit, TEME→GCRS dentro de { "1.1e-10" } rad, o efeito previsto da série de dois termos da equação dos equinócios). As funções existentes permanecem inalteradas.

# text
# c1: timescales::tai_minus_utc_on_date
# c2: Jd2::from_utc_calendar
# c3: jd2::utc_to_tai
# c4: jd2::tai_to_utc
# c5: dtf2d
# c6: utctai
# c7: taiutc
# c8: f64
# c9: timescales::tai_minus_utc
seg-20d19a2d65ec = <b>UTC anterior a 1972 no caminho de tempo em duas partes</b> (<c1/>, e <c2/>, <c3/> e <c4/> a partir de 1960-01-01): a era da taxa à deriva ("segundo de borracha"), com a tabela de deriva do SOFA, passos fracionários no fim do dia e a escala de UTC para SI da fração do dia. Nova linha do registro, VALIDATED em relação ao pyerfa <c5/>/<c6/>/<c7/> (fixada antecipadamente 23c40661; { "117" } instantes de { "1960" }–{ "1971" }, pior caso { "2.9e-11" } s contra um limiar de { "1" } µs). Todo resultado de { "1972" } em diante é idêntico bit a bit (soma de verificação fixada antes da mudança). Antes de { "1960" }, TAI − UTC é { "0" }, como no SOFA. O <c9/> de <c8/> único permanece inalterado.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>Relógio de satélite transmitido do GLONASS</b> (<c1/>): <c2/> a partir do registro RINEX, em um tempo lido no relógio do satélite (duas iterações de ponto fixo, a convenção do RTKLIB). Os <c3/> e <c4/> analisados antes não eram usados. Nova linha do registro "Relógio de satélite transmitido do GLONASS e propagação de órbita transmitida", VALIDATED em relação ao RTKLIB 2.4.2-p13 <c5/>/<c6/> (fixada antecipadamente e099c42a; { "292" } casos em um arquivo de transmissão real de { "2013" }: diferença de relógio de { "0" } s, pior posição { "1.1" } mm contra um limiar de { "1" } cm). Função de biblioteca; nenhuma saída de cenário muda. Nenhuma transformação PZ-90.11 → ITRF é aplicada, e o módulo o diz.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>Solução de tempo PPP em relação ao relógio de estação do IGS</b> ({ "0.36" }, FUT-19): o relógio do receptor do filtro PPP float em WTZR concorda com o relógio combinado final do IGS para a estação a { "0.075" } ns (desvio-padrão), com um deslocamento constante de −{ "0.66" } ns nas duas horas convergidas. Os limiares foram fixados antecipadamente em <c1/>. VALIDATED (nova linha do registro). Nova fixture <c2/>, os registros de relógio de estação do arquivo de relógio final do IGS já usado para os relógios dos satélites.

# text
seg-463ac67600b1 = <b>Paridade do PPP com o gLAB</b> ({ "0.36" }, WP-07, RM-31): o gLAB { "6.0.0" } foi executado sobre as mesmas entradas WTZR como uma ferramenta separada (núcleo Apache-2.0; checksum do download verificado em relação à lista publicada), com a linha de comando de uma emenda procedimental submetida antes da execução. Em sua primeira execução registrada, o PPP float do Kshana e o do gLAB concordam dentro de { "0.05" } m em { "240" } de { "240" } épocas e a { "5.0" } mm na última. O limiar de SPP não foi atingido (mediana de { "1.187" } m contra { "0.50" } m) e está registrado como constatação: as soluções SPP do próprio gLAB e do RTKLIB diferem entre si em { "0.852" } m. A regra registrada, portanto, deixa as partes de ambas as ferramentas como não atingidas no conjunto, enquanto a paridade do PPP se mantém.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>Leitura de navegação RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> lê arquivos de navegação RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV e F/NAV, BeiDou D1/D2, QZSS LNAV; outros registros ignorados até o próximo cabeçalho de registro), e <c3/> aceita opções. VALIDATED em relação ao arquivo RINEX { "3" } mesclado do IGS do mesmo dia: todo campo decodificado idêntico e { "0" } m em posição. A leitura de RINEX 2/3 permanece inalterada.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>Posições transmitidas dos GEO do BeiDou</b> (opcional): <c1/> e <c2/> (ICD do BDS, inclinação de −{ "5" } graus). <c3/> ainda ignora os GEO. MODELLED: a comparação fixada antecipadamente com uma órbita precisa depende de dados e ainda não foi executada.

# text
seg-416f58111d1f = <b>Arquivos de observação RINEX { "4" }</b>: um arquivo real de observação MGEX RINEX { "4.00" } é lido nos testes (MODELLED, aderência à norma do formato).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK com LAMBDA em RINEX real</b> ({ "0.36" }, WP-07 ★): <c1/>, duplas diferenças de linha de base curta de código e fase GPS de dupla frequência, com um filtro de Kalman float e fixação de inteiros por LAMBDA (teste de razão). VALIDATED nas estações IGS WTZR e WTZZ (a { "1.4" } m uma da outra) em relação à sua linha de base ITRF2020, sob limiares fixados antecipadamente: fixada em toda época após os primeiros dez minutos, erro de linha de base mediano de { "4.5" } mm e percentil 95 de { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>Paridade do PPP com dados reais em relação ao RTKLIB</b> (RM-31): <c1/> e <c2/> com limiares fixados antecipadamente. O PPP do RTKLIB v2.4.2-p13 sobre as mesmas entradas WTZR concorda com o Kshana dentro de { "5" } cm em toda época das duas últimas horas ({ "9.7" } mm no final) no terceiro registro; as duas primeiras execuções, registradas como constatações, tinham a maré sólida desligada e a antena do receptor no slot base do RTKLIB. O limiar de paridade de posicionamento por ponto único não foi atingido (mediana de { "1.09" } m contra { "0.5" } m). A parte do gLAB não foi executada (depende de dados).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Codificadores de mensagem de navegação além do LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> codifica o CNAV do GPS (tipos de mensagem { "10" }, { "11" }, { "30" }; CRC-24Q; codificação contínua de taxa 1/2 K={ "7" }), o I/NAV do Galileo (tipos de palavra 1-5 em páginas nominais pares/ímpares; entrelaçador 30x8; sincronismo <c2/>) e o F/NAV do Galileo (tipos de página 1-4; entrelaçador 61x8; sincronismo <c3/>), com decodificadores de teste. MODELLED: idas e voltas e respostas conhecidas do ICD; uma verificação fixada antecipadamente de que as efemérides transmitidas do Galileo ficam na grade de LSB do codificador se manteve (pior caso { "3.6e-3" } LSB), mas não atingiu seu limiar de contagem de satélites ({ "15" } de { "20" }), registrado. Os codificadores são funções de biblioteca; a ligação com a cena não faz parte desta mudança.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>Leitor de arquivos IONEX</b> ({ "0.36" }, WP-07): <c1/> com <c2/>, <c3/>, <c4/>, <c5/> e <c6/>: um leitor estrito de IONEX { "1.0" } de colunas fixas, com épocas contadas a partir do dia do primeiro mapa, <c7/> lido como ausente, mapas de RMS e as interpolações de tempo do formato por vizinho mais próximo, consecutiva e de mapa rotacionado; TEC oblíquo na altura da casca do cabeçalho. Verificado em um mapa sintético registrado e, dependendo de dados (obtido no momento do teste com um SHA-256 fixado, não incorporado ao repositório), em um recorte de um GIM real do CODE: todo nó exato; a interpolação coincide com uma referência por fórmula a { "4e-13" } TECU. O <c8/> do RTKLIB concorda a { "3.6e-13" } TECU em { "6885" } pontos (B6 fixado antecipadamente). VALIDATED com evidência dependente de dados (decisão do proprietário, 2026-10-13): o teste falha em qualquer mapa que não seja o de SHA fixado.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Suavização de portadora de Hatch</b> ({ "0.36" }, WP-07): <c1/> e <c2/>, a forma sem divergência (livre de ionosfera) na montagem precisa de ponto único. MODELLED com uma constatação registrada: na estação IGS WTZR, reduz o erro mediano de ponto único de { "1.55" } m para { "1.12" } m e o percentil 95 de { "3.47" } m para { "3.21" } m, aquém da redução de { "40" } % fixada antecipadamente (o erro restante é do tipo viés, não ruído).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>PPP float em RINEX real</b> ({ "0.36" }, WP-07): <c1/>, um filtro estático de posicionamento preciso por ponto (PPP) float sobre código e fase GPS de dupla frequência reais com produtos finais do IGS (deslocamentos e variações de antena, maré da Terra sólida, wind-up de fase, atraso de Shapiro, atraso úmido estimado, detecção de perda de ciclo), com <c2/>. VALIDATED na estação IGS reservada WTZR em relação à sua coordenada ITRF2020, sob limiares fixados antecipadamente: após { "6" } h o erro é de { "1.5" } mm na horizontal e { "2.9" } cm na vertical, e toda época das duas últimas horas fica dentro de { "10" } cm.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>Interpolação de relógio preciso do SP3</b> ({ "0.36" }, WP-07): <c1/> e <c2/> interpolam linearmente os relógios de satélite tabulados no SP3 entre os dois nós válidos que os delimitam (sentinela de relógio inválido ignorada), e <c3/> os entrega a <c4/>, de modo que a cadeia precisa funciona apenas a partir de um SP3. VALIDATED em relação aos relógios finais de { "30" } s do IGS de 2025-02-24, sob limiares fixados antecipadamente: { "32" } satélites GPS, RMS no ponto médio de { "0.121" } ns (limiar { "0.15" } ns), percentil 95 de { "0.265" } ns (limiar { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM ao lado das figuras de mérito de holdover do relógio</b> (CAP-05b): uma seção opcional <c1/> no tipo de cenário clock informa um bloco separado <c2/> (RAIM instantâneo sobre um céu predefinido a partir de um local declarado: veredito por época e níveis de proteção, disponibilidade; indisponível enquanto o GNSS está negado, nunca extrapolado). As figuras de holdover permanecem inalteradas; sem a seção, a saída é idêntica byte a byte. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>Limiares de receiver-trust calibrados no JammerTest { "2024" }</b> (CAP-13): uma calibração fixada antecipadamente dos monitores de queda de C/N0, de AGC e de indicador de jamming no conjunto de dados público JammerTest { "2024" } (obtido em tempo de execução, nunca incorporado ao repositório; <c1/>), distribuída apenas como o opcional <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Reservado: os limiares do AGC, do indicador de jamming e da união passam; o limiar de alarme falso do C/N0 falha ({ "0.023" } contra { "0.02" }), de modo que a linha é MODELLED (<c3/>). Os padrões e as saídas sem o perfil permanecem inalterados.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>Hipóteses de falha ARAIM com vários satélites</b> (CAP-05a): a regra de subconjuntos do ADD v4.2 generalizada além de pares (<c1/>, <c2/>; a ordem { "2" } é exatamente o caminho existente verificado pelo MAAST) e um RAIM avançado opcional sobre essas hipóteses (<c3/>), que informa o subconjunto de maior separação quando uma falha é detectada. Probabilidades a priori que exigem subconjuntos mais profundos são recusadas, nunca truncadas. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Linha do horizonte em receiver trust</b> (FUT-01): uma sessão de receiver-trust pode declarar um <c1/>; satélites atrás dele são perdidos para o céu (<c2/>, <c3/>, <c4/>) e suas perdas são classificadas como <c5/>, nunca como <c6/>; sem ele, o recurso de lacuna de azimute e toda saída permanecem como antes. O gerador de treinamento de tripulações ganha um evento <c7/> (um céu bloqueado, não interferência) e o cenário <c8/>. O Monte Carlo de UERE x DOP ganha as duas geometrias de horizonte mascarado da nota de projeto, fixadas antecipadamente isoladamente: todas as { "26" } verificações passam.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>Verificação de carimbo de tempo RFC { "3161" }</b> (CAP-14): <c1/> verifica a assinatura de um token de carimbo de tempo (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 e P-384), sua ligação com o certificado de assinatura ESS, o uso timeStamping do signatário e sua cadeia até uma âncora confiável no genTime do token, offline; <c2/> a aplica ao <c3/> de um pacote (opcional; sem ela, o relatório permanece inalterado). VALIDATED, de forma restrita: todos os { "27" } casos autogerados concordam com o OpenSSL { "3.0.13" } quanto ao veredito e ao genTime, sob uma comparação fixada antecipadamente antes de o verificador ser escrito. A revogação não é verificada.

# text
# c1: figure_tiers
# c2: api::without_figure_tiers
# c3: lunar-station-coverage
# c4: figure_tiers
# c5: leo-ppp
# c6: solar-system
# c7: sweep
# c8: sweep-nd
# c9: lunar-attack-surface
seg-1b7777e600a8 = <b>Níveis de verificação por figura para todo tipo de cenário</b> (RM-04): o resultado de todo tipo de cenário agora termina com um bloco <c1/> que nomeia suas figuras principais, a linha da matriz de verificação que é dona de cada uma e o nível lido nessa linha (figuras que nenhuma linha possui são listadas como sem nível). O bloco é acrescentado após a execução e é removido de volta ao documento anterior byte a byte (<c2/>). <c3/> não tem <c4/> até que uma nova previsão datada substitua a congelada; <c5/>, <c6/>, <c7/> e <c8/> não têm figura principal escalar, e <c9/> escreve JSON compacto. Os membros de campanha mantêm seus documentos sem nível.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Predefinição quântica <c1/></b> (CAP-08c): um cenário inercial incluído em que um acelerômetro interferométrico de átomos frios, especificado pela física de seu interferômetro (<c2/> com um nível declarado de vibração da plataforma), segue em navegação inercial contra um acelerômetro de quartzo de grau de navegação durante uma interrupção de GNSS de 110 minutos. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Graus de liberdade equivalentes exatos de Greenhall</b> (CAP-03): <c1/>, o algoritmo completo de Greenhall e Riley ({ "2003" }) (ordens de diferença { "1" } a { "3" }, expoentes de ruído +{ "2" } a -4, sobrepostos e não sobrepostos, modificados e não modificados, com as tabelas de J grande), com envoltórios para ADEV, MDEV e HDEV. VALIDATED sob uma comparação fixada antecipadamente com o allantools { "2024.6" }: { "4 876" } pontos da grade dentro de { "6.0e-13" } relativo; o allantools falha em { "32" } pontos adicionais, que são registrados sem um valor de referência independente. Os intervalos de confiança de <c2/> permanecem inalterados bit a bit.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Termos de erro do interferômetro de átomos frios</b> (RM-26/27/28): ruído de fase do laser Raman (com o termo de atraso de retrorreflexão), o viés de curvatura de frente de onda de uma nuvem térmica (desfoco puro, com um raio de detecção) e a resolução de ambiguidade de franjas (auxiliada por sensor clássico e com dois tempos de interrogação), como funções de biblioteca em <c1/>, cada forma fechada verificada por quadratura ou Monte Carlo. MODELLED; ainda não acessível a partir de um tipo de cenário (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Formatos de registro de relógio</b> (RM-03): <c1/> lê arquivos de relógio RINEX, registros ASCII de fase ou frequência no estilo TimeLab e registros de contador TAPR TICC em uma única série de fase normalizada (tau0 declarado ou encontrado, lacunas contadas, uma política de lacunas). Opcional: uma série de temporização de telecomunicações pode nomear um registro (<c2/>), e a tabela <c3/> de um cenário de relógio acrescenta um bloco <c4/> (ADEV, TDEV, MTIE). Sem a tabela, ambos os tipos de cenário são idênticos byte a byte (<a1><c5/></a1>). Uma comparação fixada antecipadamente em três registros sintéticos atingiu seus limiares de fase e de ligação; os estimadores concordam com o allantools a { "2.5e-14" } onde quer que ele avalie, e ele não avalia o ponto de MTIE do registro inteiro (registrado). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Máscaras de deriva de sincronização de frequência</b> (RM-01): o tipo de cenário <c1/> ganha sete máscaras de geração de deriva MTIE e TDEV em temperatura constante, ITU-T G.811 PRC, G.812 Tipos I a III, G.8262 EEC Opções { "1" } e { "2" } e G.8262.1 eEEC, com os trechos em lei de potência que as tabelas escrevem, e o cenário de referência <c2/> (um OCXO em operação livre contra as máscaras do EEC: ele falha em { "1 000" } s, onde um laço precisa fazer o trabalho). Cada linha foi relida em relação ao texto do itu.int; a G.812 (06/2004) foi substituída por uma edição pré-publicada de 08/2026 que não pôde ser lida. MODELLED (uma transcrição); as máscaras e saídas existentes permanecem inalteradas.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Orientação sobre o prior do filtro para o tipo de cenário <c1/></b> ({ "0.36" }, WP-09, constatação RM-21): o prior de filtro padrão do pacote é adequado a uma IMU de grau tático. Com uma IMU de grau de navegação, o padrão pode tornar a navegação inercial fundida pior que um INS livre: { "52" } m contra { "11" } m em um perfil de aeronave de { "70" } m/s. Defina <c2/> para corresponder ao grau do sensor, como fazem os novos pacotes marítimo, ferroviário e de aviação. Nenhum cenário incluído combina uma IMU de grau de navegação com o prior padrão: todo cenário que usa o padrão tem vieses residuais do acelerômetro de pelo menos { "0.015" } m/s². Apenas documentação; nenhuma saída muda.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Exportação para test bench verificada com os próprios leitores de um simulador</b> ({ "0.36" }, WP-09, CAP-16): os arquivos de movimento de <c1/> de { "8" } cenários incluídos foram lidos de volta pelos leitores NMEA, de latitude/longitude/altura e de movimento terrestre fixo do gps-sdr-sim (MIT, commit 28ca29a6, usado como ferramenta separada por meio de <c2/>; nenhuma função de sinal é chamada). Eles devolvem a trajetória exportada a { "1.2" } mm, { "0.15" } mm e exatamente. CONSTATAÇÃO: o leitor terrestre fixo desse simulador não consegue ler o CSV de largura total, porque seu buffer de linha de 100 caracteres divide cada linha. <c3/> agora informa os cortes de coluna a usar e o limite de { "300" } s do simulador. VALIDATED (nova linha do registro); os bytes da exportação permanecem inalterados.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS no conjunto de dados KF-GINS</b> ({ "0.36" }, WP-09, FUT-17): carregadores e executor de <c1/> e o modelo de medição de braço de alavanca no EKF em malha fechada. No conjunto de dados de demonstração do KF-GINS (obtido no momento do teste, não incorporado ao repositório), o RMS horizontal do Kshana em relação à trajetória de referência é de { "1.09" } cm contra os { "1.11" } cm do próprio KF-GINS, e todos os limiares fixados antecipadamente foram mantidos. VALIDATED com evidência dependente de dados (decisão do proprietário, 2026-10-13): o conjunto de dados é obtido com SHA-256 fixados e o caminho de reprodução está em <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Filtro PNT acoplado no pacote fusion</b> ({ "0.36" }, WP-09, FUT-16): o tipo de cenário <c1/> aceita uma tabela opcional <c2/> que executa um filtro empilhado sobre pseudodistâncias com um estado de viés do acelerômetro (<c3/>), e <c4/> é a versão 3-D de 8 estados. Novo cenário incluído <c5/>: com acelerômetros enviesados, o modo acoplado mantém a posição da suíte quântica em { "18.7" } m (percentil 95) com integridade total, onde os filtros desacoplados chegam a { "430" } m. Sem a tabela, tanto <c6/> quanto <c7/> permanecem inalterados (fixados); <c8/> recusa a tabela. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>Pacotes GNSS/INS marítimo, ferroviário e de aviação</b> ({ "0.36" }, WP-09, RM-21): cenários incluídos <c1/>, <c2/> e <c3/> sobre a biblioteca de trajetórias, e uma tabela opcional <c4/> para o tipo de cenário <c5/> que funde pseudodistâncias de uma constelação Walker SGP4 (todos os satélites quando nominal, os poucos mais altos quando degradado). No pacote ferroviário, o acoplamento forte mantém a solução de grau de navegação em { "5.3" } m através de uma trincheira e de um túnel, contra { "12.9" } m com acoplamento fraco. Sem <c6/>, o pacote permanece inalterado (fixado). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Acoplamento forte com fase da portadora</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, um EKF de estado de erro com um relógio de receptor explícito de dois estados e ambiguidades flutuantes da portadora, conduzido por uma constelação Walker SGP4 com correções de Klobuchar e Saastamoinen no laço de medição, detecção de perdas de ciclo por portadora diferenciada no tempo e reinicialização de ambiguidades, e uma execução apenas com código sobre as mesmas medições para comparação. MODELLED: em um percurso em figura-8, a solução com portadora é de { "2.5" } cm contra { "47" } cm apenas com código, e NIS/NEES são consistentes entre sementes.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>Biblioteca de trajetórias GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): o tipo de cenário <c1/> aceita uma tabela opcional <c2/> com <c3/>. Os perfis comandam taxas de Euler e aceleração ao longo da trajetória a partir do estado verdadeiro e derivam a IMU verdadeira da cinemática de corpo rígido (curvas coordenadas, subidas, Coriolis); <c4/> importa uma trajetória verdadeira (<c5/>) e resolve a IMU que a reproduz. Sem a tabela, o pacote voa seu percurso histórico, bit a bit (fixado). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>Tiles de DEM em latitude/longitude para o horizonte lunar</b>: <c1/> lê uma tile de texto <c2/> (alturas acima da esfera média em uma grade de latitude/longitude) no lugar da <c3/> estereográfica polar, tanto para <c4/> quanto para <c5/>; o relatório repete a tile (<c6/>, com seu SHA-256). <c7/> agora está ligado ao traçado de raios do horizonte. Uma tile reamostrada do recorte incluído dá à estação o horizonte do recorte a { "0.22" } deg. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Terreno no local de exportação do volume de serviço</b>: com uma seção <c1/>, cada linha da exportação de geometria por satélite de <c2/> traz <c3/> (o satélite supera a máscara plana e o horizonte do local de exportação em seu azimute), o relatório traz o horizonte do local (<c4/>), e o CSV de execução ganha a coluna. Sem terreno, a exportação permanece inalterada. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Campos de destaque a partir do motor</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> e o <c3/> do WebAssembly informam, para doze tipos de cenário, quais campos de um cenário respondem à sua pergunta, do melhor para o pior, como caminhos pontilhados (<c4/>). O Studio os lê antes de seu próprio ordenamento. Apenas metadados de exibição: o motor nunca os lê, nenhum arquivo de cenário precisa deles, nenhum resultado depende deles. <c5/> falha se um tipo de cenário não puder ser despachado ou se um caminho não for encontrado em nenhum dos cenários incluídos desse tipo (ele detectou dois caminhos que os identificadores achatados do Studio haviam escrito sem os colchetes do arranjo).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Tabela de tipo de cenário para módulo a partir do motor</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> e o <c3/> do WebAssembly fornecem, para cada tipo de cenário cujas linhas da matriz de verificação nomeiam outro módulo além do seu próprio, os nomes dos módulos. O mapa de capacidades do Studio usava sua própria cópia escrita à mão; <c4/> falha se um tipo de cenário da tabela não puder ser despachado ou se um módulo não aparecer em nenhuma linha da matriz. Nenhuma saída mudou.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Execução IQ curta na compilação para navegador</b> ({ "0.36" }): <c1/> e <c2/> no módulo WebAssembly constroem uma cena sintética, adquirem cada satélite e rastreiam os adquiridos, tudo em memória, limitado a { "0.25" } s, { "1 000 000" } amostras e { "8" } satélites. O construtor de cenas e a busca de sinais por nome saíram de <c3/>, exclusivo do nativo (para <c4/> e <c5/>), de modo que ambas as compilações os compartilham; a saída da linha de comando permanece inalterada. O teste nativo e <c6/> comparam a mesma requisição com um único golden (<c7/>), byte a byte: desde a mudança para matemática portátil (STUDIO-15, abaixo), a compilação para navegador e a compilação nativa dão os mesmos bits.

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: ErrorKind
# c4: ProvenanceClass
# c5: KindMeta
# c6: FieldUnit
# c7: scenario_kinds()
# c8: error_kind()
# c9: run_typed
# c10: RunOutput
# c11: data
# c12: scenario_kinds
# c13: KindMeta[]
# c14: kshana.d.ts
# c15: error_kind
# c16: ErrorKind | ""
# c17: tests/typed_api_sync.rs
seg-c0eab9b97b7d = <b>APIs tipadas em Python e TypeScript</b> (CAP-34): <c1/> tipa os vocabulários fechados (<c2/>, todo nome de tipo de cenário; <c3/>; <c4/>) e os dicionários <c5/> e <c6/>; <c7/> e <c8/> os retornam. O pacote WebAssembly acrescenta <c9/> (uma execução como um objeto <c10/> tipado, com o documento analisado como <c11/>) e <c12/> (os <c13/> analisados), e seu <c14/> traz o mesmo vocabulário; <c15/> é tipado como <c16/>. <c17/> mantém ambas as listas iguais às do motor.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Unidades para toda coluna de <c1/></b> (FUT-28): um resultado <c2/> agora traz <c3/> e <c4/>, a unidade de cada chave varrida e de cada métrica registrada, lida da própria tabela de unidades do pacote varrido. Um eixo pode declarar <c5/> para uma chave que o pacote não repete; uma unidade declarada que contradiz a do pacote é recusada, e uma unidade que nenhum dos dois fornece é <c6/>, nunca adivinhada. <c7/> e <c8/> são descritos, de modo que cada um dos { "76" } tipos de cenário agora está totalmente coberto pelo gate de unidades de campo (teto de tipos de cenário não cobertos { "1" } -> { "0" }).

# text
# c1: RunOutput
# c2: RunOutput
# c3: array(path)
# c4: columns(path)
# c5: series()
# c6: numpy.ndarray
# c7: numpy.asarray
# c8: data()
# c9: kshana.pyi
seg-3a83af8daa43 = <b>Arranjos NumPy a partir de <c1/></b> (FUT-26): o <c2/> do Python ganha <c3/>, <c4/> e <c5/>, que retornam <c6/>s para uma lista numérica, as colunas numéricas de uma lista de registros ou toda série de registros do documento. Cada arranjo é igual a <c7/> dos mesmos valores de <c8/> (dtype e bits). O NumPy é importado apenas quando um deles é chamado e fica fora dos requisitos de execução. Tipado em <c9/> e verificado pelo stubtest.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Otimizador de campanha</b> (CAP-32): a nova seção opcional <c2/> do tipo de cenário <c1/> busca uma a três chaves de cenário dentro de limites declarados pelo melhor valor de uma métrica: minimizar, maximizar ou atingir um alvo. Busca exaustivamente em uma grade, ou com um simplex de Nelder–Mead determinístico e limitado. Cada avaliação é uma execução real do tipo de cenário nomeado e é listada no <c3/> do resultado. Exemplo: <c4/>. Os limiares foram fixados antecipadamente (<c5/>):

# text
seg-f4e79236b6bf = a função de Rosenbrock é atingida (f* = { "1.7e-20" });

# text
seg-3dbe3fdfebcf = uma solução de alvo 1-D em forma fechada é atingida ({ "6e-15" } relativo);

# text
seg-5ab478e03354 = a grade é igual bit a bit a uma força bruta independente;

# text
seg-ea0a04c6e713 = o simplex se sai pelo menos tão bem quanto uma grade de { "41" } × { "41" } em { "177" } execuções.

# text
seg-161d8c5b55e8 = O limiar 1-D da rodada { "1" } está registrado como NOT MET, porque a caixa fixada antecipadamente excluía a solução. MODELLED; linha do registro "Otimização limitada de uma métrica sobre parâmetros de campanha". Aditivo: campanhas sem a seção permanecem inalteradas.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Conjuntos de calibração</b> (CAP-10): três verificações de semente única reexecutadas com { "200" } sementes independentes em relação a limiares fixados antecipadamente, em <a1><c1/></a1> (gerado por <c2/>; valores por semente em <c3/>).

# text
seg-b163e53e06e9 = O intervalo de { "95" } % do bootstrap Monte Carlo da campanha cobre a média verdadeira em { "192" } de { "200" } conjuntos, e sua verificação de qui-quadrado é satisfeita em { "196" }.

# text
seg-022a7fbee13a = A tolerância de percentil de semente única é satisfeita em apenas { "183" } de { "200" }: NOT MET, como previsto. É um limiar de cerca de 2 sigma, registrado e não afrouxado.

# text
seg-096f36d21b02 = As calibrações de ADEV de FM branca são satisfeitas em toda semente, com seu pior erro bem dentro da tolerância.

# text
# c1: Scenario
# c2: BuiltinKind
# c3: api::BuiltinKind
# c4: append_figure_tiers
# c5: inertial
# c6: spoof
# c7: passes
# c8: link-budget
# c9: jamming
# c10: tests/scenario_output_manifest.rs
seg-369c7f2a115c = <b>Tipos de cenário embutidos pelo trait <c1/></b> (FUT-27, em andamento): o trait <c2/> (<c3/>, com um gancho de nível por figura e <c4/>) e os primeiros tipos de cenário movidos para ele (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). A saída permanece inalterada: um manifesto de todo o catálogo com o SHA-256 de cada saída é idêntico antes e depois (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>Verificação de ausência de download no Playground</b> (RM-07): <c1/> verifica três coisas:

# text
seg-3e424188f6e1 = todo cenário da biblioteca do Studio está no pacote do navegador;

# text
# c1: scenarios/
seg-2803ccf8b9ae = o pacote é idêntico byte a byte a <c1/>;

# text
seg-b98016a4a844 = todo cenário do navegador é executado a partir de um diretório de trabalho vazio.

# text
# c1: gravity-map
# c2: [reference]
# c3: .gfc
# c4: gfc_path
# c5: gps-denied-gravity-nav-egm2008
# c6: [map_error_mc]
# c7: gravity-map-error-mc
# c8: combined-altpnt
# c9: [magnetic_grid]
# c10: csv_path
# c11: column
# c12: tools/fetch_emag2_tile.py
# c13: altpnt::sequential::run_sequential_trn_on_map
# c14: xval/terrain-slam-rbpf/
# c15: terrain-slam
# c16: xval/srtm-ungate/
seg-efc143b4f2a9 = <b>Mapas Alt-PNT: campo de gravidade real, Monte Carlo de erro de mapa, SRTM em resolução total</b> ({ "0.36" }, WP-10). O tipo de cenário <c1/> aceita um <c2/> opcional: uma anomalia de gravidade sintetizada a partir dos coeficientes EGM2008 incluídos (ou de um arquivo <c3/> do ICGEM por meio de <c4/>, apenas em compilações nativas). Essa síntese coincide com o ICGEM Calculation Service a cerca de { "1e-8" } mGal em { "794" } nós em duas regiões, contra limiares fixados antecipadamente de { "0.005" } mGal RMS e { "0.02" } mGal máximo (VALIDATED; linha do registro "Síntese de anomalia de gravidade a partir de um modelo de harmônicos esféricos"). O novo cenário incluído <c5/> executa o benchmark de 60 minutos sobre esse campo real de grau 70. Resultado fixado antecipadamente: erro de correspondência de { "3106" } m, de modo que o limiar < { "500" } m é NOT MET, como previsto (o grau { "70" } é suave demais), e o corte de dez vezes na deriva é MET (MODELLED). Um <c6/> opcional reexecuta o benchmark sobre erros de mapa com semente e correlação gaussiana e informa a distribuição do erro de correspondência (cenário incluído <c7/>). Exploratório e não fixado antecipadamente: com um erro de mapa de { "2" } mGal correlacionado ao longo de { "0.2" } deg (o tamanho que o próprio sigma do correlacionador prevê), { "1" } de { "20" } realizações permanece dentro de { "500" } m (mediana de { "2.9" } km, p95 de { "14.7" } km), contra { "144" } m com um mapa perfeito. O fix abaixo de 500 m do benchmark sintético pressupõe que o mapa é exato. Sem nenhuma das opções, o documento é idêntico byte a byte ao de versões anteriores. <c8/> aceita um <c9/> opcional (<c10/>, <c11/>) que lê o canal magnético de um CSV em formato EMAG2v3. O EMAG2 não é incorporado ao repositório porque seus termos não são explícitos: <c12/> o obtém com um SHA-256 fixado e recorta uma caixa. Nenhum resultado de navegação é afirmado na grade real do EMAG2. Estimação conjunta de mapa (terrain SLAM, RM-18): <c13/> executa o navegador de terreno sequencial sobre um mapa armazenado que difere da verdade, seja confiando nele, seja estimando uma correção de mapa por célula com um filtro Rao-Blackwellizado do tipo FastSLAM. Fixado antecipadamente em relação ao SITAN de mapa conhecido com um erro de mapa correlacionado de { "15" } m em { "20" } sementes: um ganho médio de { "1.5" } %, melhor em { "10" } de { "20" }, de modo que ambos os limiares de melhoria são NOT MET ({ "10" } % e { "12" } de { "20" }), sem prejuízo em um mapa perfeito (MET). Uma única passagem sem revisitas não permite que o mapa seja aprendido (<c14/>, MODELLED). Os documentos de <c15/> são idênticos byte a byte. Os testes com SRTM real agora são executados no CI em dois recortes de resolução total registrados; todos os limiares fixados antecipadamente são atingidos, com o nó mais próximo igual ao do GDAL { "3.8.4" } em { "8" } de { "8" } pontos (<c16/>).

# text
seg-aa7ac7a47111 = <b>Interoperabilidade, WP-08</b> ({ "0.36" }; cada item fixado antecipadamente e submetido isoladamente antes de sua execução de referência independente, cada um uma nova linha VALIDATED do registro, exceto o item de telemetria, que amplia uma linha existente):

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 e OCM { "3.0" } (blocos TRAJ, PHYS, COV, MAN, USER) escritos e lidos em KVN e NDM/XML, e uma OMM de precisão total a partir de um conjunto de elementos SGP4 (<c2/>); a saída de <c3/> permanece inalterada. Em relação ao Orekit { "13.1.8" } nos dois sentidos: { "27" } de { "30" } mensagens do Kshana são interpretadas no Orekit e o Kshana lê toda mensagem escrita pelo Orekit, com valores dentro de { "1e-14" } relativo e épocas dentro de { "1e-9" } s; quatro constatações fixadas (o Orekit exige <c4/>, recusa <c5/> em parâmetros definidos pelo usuário em XML, não escreve <c6/> sem <c7/> e lê épocas relativas da OCM em TDB em segundos SI). O <c8/> do escritor legado de OMM é recusado pelo Orekit (registrado). Linha "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 e APM { "2.0" } em KVN e XML em relação ao Orekit { "13.1.8" }, todo limiar atingido; o escritor de APM do Orekit recusa uma manobra sem <c3/> (fixado). Linha "CCSDS Attitude Data Messages (AEM, APM)".

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>Exportação SPICE SPK</b> (<c1/>): escritor e leitor dos tipos SPK { "9" } e { "13" } e exportação de OEM para SPK; em relação ao CSPICE N0067, os kernels são idênticos byte a byte aos do SPICE e são avaliados de forma idêntica bit a bit. Linha "Exportação SPICE SPK (tipos { "9" } e { "13" })".

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>Tipos SPICE SPK { "3" } e { "21" }</b> (<c1/>): segmentos do tipo { "3" } (Chebyshev) e do tipo { "21" } (linhas de diferenças estendidas) escritos a partir de registros dados e avaliados como o SPICE faz; em relação ao CSPICE N0067, os kernels são idênticos byte a byte aos do SPICE e toda avaliação concorda bit a bit nos dois sentidos. Linha "Tipos SPICE SPK { "3" } e { "21" } (Chebyshev, linhas de diferenças estendidas)".

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Extensões de Space Packet</b> (<c1/>): cabeçalho secundário com códigos de tempo CUC/CDS, controle de erro de pacote, segmentação e verificações de fluxo, em relação ao ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } e <c2/> do CPython, zero divergências. Linha "CCSDS Space Packet secondary header, packet error control and segmentation".

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Esquema de telemetria { "1.3" } por meio de consumidores reais</b>: a exposição Prometheus e o JSON OTLP/HTTP de um fluxo sintético do esquema 1.3, incluindo a série de geometria e o rótulo <c1/>, lidos exatamente pelo prometheus_client e pelo proto OTLP, aceitos pelo <c2/> do promtool { "3.5.0" } sem nenhum problema de lint, e repassados inalterados pelo OpenTelemetry Collector contrib { "0.135.0" } (dependente de dados: ferramentas obtidas com SHA-256 fixados, saídas registradas).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Determinação de órbita de Marte, execução { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> escala a matriz normal por sua diagonal e amortece o passo (Levenberg-Marquardt), depois que o ajuste de Gauss-Newton registrado falhou em uma matriz cuja diagonal bruta abrange oito ordens de grandeza. Registrado separadamente (<c2/>, mesmo arco, limiares e edição). Nas passagens do MRO pontuadas, a órbita fica a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução de navegação do MRO, limiares atingidos. O Doppler pós-ajuste é de { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido (constatação fixada). Uma emenda apenas de pontuação, R2-A1, está divulgada em <c3/>. A linha permanece MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Modelo de Doppler 2-way com rampa de Marte e determinação de órbita</b> ({ "0.36" }, WP-14, parte do CAP-30, estágio { "2" }): <c1/> prevê o Doppler 2-way em banda X com rampa da DSN a partir de tabelas de rampa ODF (tempo de luz, Shapiro, troposfera, tempo de estação, estações da DSN pela cadeia CIO e pelos EOP do IERS) e ajusta um orbitador de Marte (GMM-3, terceiros corpos, SRP, arrasto). <c2/> lê o SPK tipo { "1" } (verificado contra o CSPICE) e <c3/> lê campos SHADR do PDS. Fixado antecipadamente em relação à reconstrução de navegação do MRO em passagens reais do MRO (dependente de dados, <c4/>, CI mensal): o Doppler previsto coincide com as observações a { "12.5" } mHz (limiar { "30" } mHz, atingido); o ajuste de órbita registrado falhou no arco pontuado e não produziu órbita (constatação fixada). A linha permanece MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>Leitor de Orbit Data File da DSN</b> ({ "0.36" }, WP-14, parte do CAP-30): <c1/> lê ODFs TRK-2-18. Em um ODF real do Mars Reconnaissance Orbiter (NASA PDS, incluído no repositório), o leitor coincide com a contagem de registros, as posições dos grupos, as estações e os tempos do rótulo do PDS, e todos os seus tipos de dados são conhecidos. A tabela de fim de arquivo do rótulo está uma linha aquém do arquivo, uma inconsistência do rótulo registrada como constatação. MODELLED. A determinação de órbita com esses dados ainda não foi feita.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>Orçamento TWSTFT e estabilidade da transferência de tempo: o tipo de cenário <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Equação bidirecional:

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> a resolve para T_A − T_B com atrasos de equipamento das estações, a assimetria ionosférica de subida/descida em banda Ku, a diferença de atraso do transponder e os termos de Sagnac, e recupera o modelo direto a { "1e-15" } s.

# text
seg-a5468765380d = <b>Orçamento de incerteza:</b> combinado em quadratura, com o TDEV do enlace como o termo do tipo A.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Ruído do enlace:</b> a série bidirecional ganha um piso de ruído de fase flicker, uma não reciprocidade diurna e um resíduo constante de reciprocidade. O pacote <c1/> de jitter branco permanece inalterado.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Séries reais:</b> a estabilidade de séries fornecidas do Circular T do BIPM, de CSV <c1/> ou de relógios de estação do IGS.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Novo cenário incluído <c1/>. A solução de tempo PPP é VALIDATED separadamente em relação ao relógio de estação do IGS no ramo de dados reais do GNSS.

# text
seg-ae33b92da4a6 = <b>Aquecimento na reentrada, radiometria de observação da Terra e perdas na ascensão</b> ({ "0.36" }, WP-14, CAP-28): três novos tipos de cenário.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/>: uma reentrada de massa pontual com 3 graus de liberdade sobre uma Terra ou um Marte em rotação, com aquecimento no ponto de estagnação de Sutton-Graves.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/>: SNR do imageador, MTF em Nyquist, resposta relativa de borda e NIIRS GIQE { "4" }.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/>: uma ascensão em curva gravitacional de vários estágios com perdas por gravidade, arrasto, esterçamento e contrapressão, verificada pela identidade exata de dv ideal menos perdas.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = A desaceleração de pico da reentrada foi verificada em relação ao nominal publicado da Stardust sob um limiar fixado antecipadamente: { "35.44" } g contra { "33.4" } g (+{ "6.1" } %, limiar { "10" } %). Essa linha é VALIDATED. Aquecimento, radiometria e ascensão são MODELLED. Também novos: <c1/>, os cenários incluídos <c2/>, <c3/> e <c4/>, e <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Controle de atitude com rodas de reação: o tipo de cenário <c1/></b> ({ "0.36" }, WP-14, CAP-21). Uma manobra de apontamento inercial de um corpo rígido com três ou mais rodas de reação balanceadas sob realimentação MRP, com torques de roda de norma mínima limitados ao limite de cada motor (<c2/>). Também pode fechar o laço sobre um EKF multiplicativo a partir de um giroscópio e de um rastreador estelar simulados (<c3/>). O laço de estado verdadeiro foi comparado com o Basilisk { "2.9.1" } em três casos fixados antecipadamente antes de o código existir (três rodas ortogonais, uma pirâmide de quatro rodas, um caso de saturação). Todo componente MRP, taxa do corpo, velocidade de roda e torque de motor concordou em toda amostra, com pior caso de { "2.4e-14" } em sigma e { "2.9e-11" } rad/s em velocidade de roda. Esta linha é VALIDATED; o MEKF é MODELLED (consistência NEES). Novos cenários incluídos <c4/> e <c5/>, e <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Agendamento de contatos com o solo e ACM do DVB-S2</b> ({ "0.36" }, WP-14, CAP-22/23): dois novos tipos de cenário. <c1/> informa, para um satélite sobre uma estação, o Es/N0 de cada passagem e o MODCOD do DVB-S2 escolhido ao longo dela (limiares da ETSI EN { "302" } 307-1 Tabela { "13" } mais uma margem). Também informa o volume de dados que o ACM move em relação à linha de base de codificação constante. <c2/> faz o mesmo para vários satélites sobre várias estações e constrói um plano de contatos sem conflitos (tempo de reposicionamento da antena, uma estação por satélite, entrega ponderada por prioridade limitada ao acúmulo de cada satélite). Informa um plano guloso de valor marginal, uma linha de base por ordem de chegada e o ótimo exato em conjuntos pequenos, com a lacuna de otimalidade do guloso. As janelas de acesso vêm do preditor de passagens aparentes VALIDATED. Novos cenários incluídos <c3/> e <c4/> (entradas ilustrativas) e <c5/>. MODELLED (duas novas linhas do registro).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Posicionamento Doppler com Starlink em relação a um experimento publicado</b> ({ "0.36" }, WP-14, parte do CAP-11, MODELLED). Esta é uma comparação por proxy, fixada antecipadamente, do modo Doppler de <c1/> com a predefinição <c2/> em relação aos percentis do conjunto de dados 3 de "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). O modelo usou { "3" } satélites (uma máscara de { "47" } deg escolhida por uma regra fixa), nenhum auxílio de altura e um sigma Doppler de { "30" } Hz, em { "200" } sementes. Seu erro 3-D no percentil 90 é de { "92.2" } m a { "20" } s e de { "870" } m a { "8" } s, contra os { "2" } m e { "10" } m publicados, de modo que ambos os limiares de fator dois são NOT MET. O modelo é pessimista, não otimista como previsto: três satélites fixos dão muito menos diversidade geométrica do que os { "63" } satélites do experimento ao longo de { "10" } minutos, com troca de canal a cada { "15" } s. Ambas as falhas são afirmadas (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Otimizador de transferência impulsiva no DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> encontra as datas de partida e de chegada de uma transferência balística de dois impulsos de uma única revolução que minimizam o C3 de partida ou o V-infinito de chegada dentro do Tipo I ou do Tipo II. Ele busca em uma grade de 2 dias e depois refina com Nelder-Mead 2-D, sobre estados heliocêntricos do kernel DE440; apoia-se em <c2/>. A comparação foi fixada antecipadamente (bf0439e8) em relação a um otimizador independente com SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } na oportunidade Terra-Marte de { "2026" }: todas as quatro otimizações concordam a { "8.7e-13" } relativo, com datas dentro de { "1e-5" } dia (VALIDATED, nova linha do registro). Como referência publicada secundária, o NASA/TM-2010-216764 (o manual Terra-Marte 2026-2045) coincide no C3 mínimo do Tipo II ({ "9.182" } contra { "9.144" }) e no V-infinito mínimo de chegada do Tipo II ({ "2.564" } contra { "2.565" }). Seu C3 mínimo do Tipo I não coincide: { "10.535" } contra { "11.11" } (-5.18 %), onde a referência independente da biblioteca concorda com o Kshana. Essa falha está registrada e afirmada.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Estudo de estação de referência lunar</b> ({ "0.36" }, motivado por material publicado sobre uma estação de referência planejada no polo sul lunar; fontes em <a1><c1/></a1>): o tipo de cenário <c2/>, uma varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas, que fornece, por ponto e sobre a região, o percentil do erro corrigido e não corrigido, a disponibilidade com os motivos, a cobertura em relação a um limiar declarado, os níveis de proteção, o raio de cobertura por azimute e o orçamento do enlace de correção. Reduz-se exatamente a <c3/> em um ponto, uma época e uma tentativa; sua aritmética foi recalculada pelo numpy sob um limiar fixado antecipadamente (posições e percentis atingidos; as correções da estação não atingiram o seu por arredondamento de precisão dupla, registrado). MODELLED; linha do registro "Mapa de cobertura e exatidão de uma estação de referência lunar". Sem afiliação nem endosso de qualquer agência; nenhuma afirmação sobre o desempenho de qualquer sistema real.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Previsão fixada antecipadamente: cobertura de uma estação de referência lunar</b> (não é uma validação; MODELLED). <a1><c1/></a1> congela, no commit c05dac1d, os resultados de <c2/> sob as premissas declaradas publicamente, com hashes SHA-256 das entradas e dos resultados e um protocolo de pontuação fixado agora (fator { "2" } para exatidões e níveis de proteção, { "10" } pontos percentuais para disponibilidade e cobertura; uma premissa alterada recebe uma nova previsão datada, nunca uma edição; uma falha é publicada com tanto destaque quanto um acerto). Toda figura é dominada pelo conjunto de elementos não publicado da constelação de quatro satélites, que é ILLUSTRATIVE, e diz isso. <c3/> o protege; <c4/> ganha uma seção "Previsões fixadas antecipadamente". Nenhuma linha do registro.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Extensões da estação de referência lunar</b> ({ "0.36" }; as limitações { "2" } e { "3" } do estudo da estação e o estilo de solução das fontes), cada uma opcional em <c1/> e ausente por padrão, de modo que todo documento existente, inclusive a previsão congelada, permanece inalterado: <c2/> (multipercurso <c3/> no usuário e na estação, o da estação opcionalmente de Gauss-Markov ao longo das épocas, ruído de código do DLL a partir do C/N0, vieses entre canais; valores ILLUSTRATIVE na Lua); <c4/> (crescimento linear do erro de órbita transmitida ao longo da latência de correção, ILLUSTRATIVE); <c5/> (restrição de altura, um mínimo de três satélites com ela, uma janela de usuário estático ao longo das épocas). Dois adendos à comparação com as afirmações publicadas, cada um fixado antecipadamente isoladamente antes de sua execução, ficam ao lado da execução registrada sem edição: K5 com crescimento falha em toda taxa; com o estilo de solução das fontes, K1 a K5 falham e K6 passa ({ "1" } de { "6" }), com o erro 3-D corrigido no percentil 95 do R300 caindo de { "280.6" } m para { "2.11" } m. MODELLED; três linhas do registro.

# text
# c1: [terrain]
# c2: lunar-station-coverage
# c3: moonlight-service-volume
# c4: station_horizon
# c5: user_horizon
# c6: dem_path
# c7: LDEM_75S_240M
# c8: data/lunar-dem/
# c9: scripts/make_lola_south_polar_crop.py
# c10: scenarios/lunar-station-coverage-terrain.toml
seg-1d0a0dcd42de = <b>Máscaras de horizonte do terreno lunar</b> ({ "0.36" }; a primeira limitação do estudo da estação de referência lunar): uma seção opcional <c1/> em <c2/> (a estação e todo ponto de usuário) e em <c3/> (todo ponto da grade) dá a cada local um horizonte dependente do azimute no formato de tabela de skyline da { "0.36" }, a partir de um perfil declarado rotulado com sua fonte (<c4/>, <c5/>) e/ou de um traçado de raios sobre um DEM polar (<c6/>) ao longo de círculos máximos da esfera lunar com curvatura exata. Inclui no repositório um recorte de { "0.98" } MB do DEM polar sul LRO LOLA <c7/> de domínio público, reamostrado por média de blocos de { "5" } x { "5" } para { "1200" } m (<c8/>, com seu NOTICE, SHA-256 e <c9/>), e o cenário exclusivo do repositório <c10/>. Verificado em relação a horizontes em forma fechada (esfera nua, cratera em um platô, cone rasterizado); MODELLED, linha do registro "Máscaras de horizonte do terreno lunar a partir de um perfil declarado ou de um DEM polar". Sem a seção, todo documento, inclusive o bloco de unidades, é idêntico byte a byte.

# text
# c1: receiver-trust
# c2: good
# c3: degraded
# c4: few-satellites
# c5: high-pdop
# c6: high-hdop
# c7: sky-blocked
# c8: unknown
# c9: orbit::dop
# c10: good
# c11: fair
# c12: poor
# c13: geometry
# c14: geometry
# c15: environment
# c16: inconsistency
# c17: loss-of-lock
# c18: geometry
# c19: inconsistency
# c20: [geometry]
# c21: signal_loss
# c22: environment
# c23: cap_points
# c24: full_ratio
# c25: floor
# c26: degraded_min
# c27: [geometry]
# c28: min(cap_points, 100 - floor)
# c29: [score]
# c30: degraded_min
# c31: degraded_min
seg-ca0c6ca7396a = <b>Confiança ciente da geometria</b> (nota de projeto de geometria da { "0.36" }, seção { "4" }). Toda época de <c1/>, estática ou de embarcação, em lote ou ao vivo, traz sua geometria de satélites: <c2/>, <c3/> (motivos <c4/>, <c5/>, <c6/> e, apenas informativo, <c7/>) ou <c8/> onde o registro não dá geometria de satélites, com HDOP, PDOP, VDOP e os satélites usados. Ela é derivada das elevações e dos azimutes que o receptor informa (NMEA GSV, UBX NAV-SAT) pelo kernel existente <c9/>, ou tomada do NMEA GSA. Toda época também traz um rótulo, <c10/>, <c11/> ou <c12/>, sempre informado e nunca pontuado, e uma nota com o HDOP, o PDOP, o VDOP, a contagem de satélites e a perda de sinal em palavras. A pontuação de uma embarcação ganha um monitor <c13/> que não deduz nada, a menos que a geometria seja ruim (HDOP acima de { "4" }, PDOP acima de { "6" } ou menos de { "5" } satélites usados), e então cresce até um limite de { "15" } pontos; a geometria sozinha chega no máximo à faixa degradada, nunca à não confiável (nenhum alarme). Toda dedução recebe uma classe, <c14/>, <c15/> ou <c16/>, de modo que um céu ruim não seja lido como um ataque. <c17/> é <c18/> quando os satélites perdidos estavam todos abaixo de { "15" } graus em seu último relatório; uma dedução por geometria ruim é <c19/> quando o HDOP declarado pelo receptor discorda do céu declarado por ele em mais de max({ "1.0" }, { "25" } % do HDOP derivado), de modo que um céu ruim forjado não pode comprar o rótulo. Uma nova tabela <c20/> declara todos os limiares com sua proveniência (HDOP { "4" }, PDOP { "6" }, pelo menos { "5" } usados, sigma_UERE { "1.5" } m, uma tolerância de HDOP de max({ "1.0" }, { "25" } % do HDOP derivado), sendo os { "25" } % uma escolha representativa para receptores com relógios por constelação ou soluções por subconjunto, { "15" } graus; as cifras da IEC 61108-1 e do GPS SPS como citadas, a serem conferidas com o texto das normas). A perda total de sinal não é rotulada como céu: quando os satélites à vista não são rastreados e o DOP dos satélites à vista é bom (e os não rastreados não estão confinados a uma metade do horizonte), a época traz <c21/> e a dedução de geometria é <c22/>. Um HDOP ou PDOP declarado de { "99" } ou mais, qualidade GGA { "0" } e modo GSA { "1" } são lidos como ausência de fix, não como DOP. O limite (<c23/> { "15" }), o fim da rampa (<c24/> { "1.5" }) e o piso (<c25/>, por padrão o <c26/> da pontuação) estão em <c27/>, assim como os níveis bons do rótulo (HDOP { "2" }, PDOP { "3" }, { "6" } satélites, representativos); o limite em vigor é <c28/>, de modo que uma tabela <c29/> que eleve <c30/> (inclusive uma de { "0.35" }) reduz o limite em vez de ser recusada, e um piso abaixo de <c31/> é recusado. MODELLED; software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
# c1: epochs[].geometry
# c2: class
# c3: geometry_model
# c4: geometry_summary
# c5: receiver_trust
# c6: assess_vessel_log
# c7: receiver_trust_replay
# c8: assess_*
# c9: epochs.json
# c10: config.json
# c11: trust-telemetry
# c12: kshana_trust_geometry*
# c13: class
# c14: kshana_trust_reason_active
# c15: kshana.geometry.*
# c16: cs6
# c17: cfp3
# c18: cfp4
# c19: geoStatus
# c20: geoHdop
# c21: geoClass
# c22: kshana_trust_geometry_label{label}
# c23: kshana_trust_geometry_vdop
# c24: kshana.geometry.label
# c25: kshana.geometry.vdop
# c26: geoLabel
# c27: geoPdop
# c28: geoVdop
# c29: geoUsed
# c30: cs6
# c31: cn1
# c32: geometry_summary.hdop_mismatch
# c33: degraded
# c34: kshana_trust_geometry_signal_loss
# c35: kshana.geometry.signal_loss
# c36: geoSignalLoss=1
# c37: environment
# c38: cs6
seg-d976d3495695 = A geometria chega a todas as superfícies: o JSON de resultado (<c1/>, <c2/> em toda dedução, <c3/>, <c4/>), as linhas JSON ao vivo (esquema { "1.3" }), o <c5/> de Python e WebAssembly, <c6/> e <c7/>, as ferramentas MCP <c8/>, os pacotes de evidências (<c9/>, <c10/>, uma faixa de geometria na página de resumo) e <c11/> (Prometheus <c12/> e um rótulo <c13/> em <c14/>, OTLP <c15/>, campos personalizados CEF <c16/> (estado e classes da geometria), <c17/> (HDOP) e <c18/> (PDOP), verificados com ambos os analisadores CEF de referência independente, e LEEF <c19/>, <c20/>, <c21/>). O rótulo de geometria também é exportado, acrescentado depois de toda série e campo anteriores e apenas para entradas que o trazem: Prometheus <c22/> e <c23/>, OTLP <c24/> e <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, e CEF um terceiro campo <c30/> (o rótulo) e <c31/> (satélites usados); o VDOP não está no CEF (os campos personalizados de ponto flutuante estão ocupados). Ambos os analisadores CEF de referência independente leem de volta os casos de rótulo como escritos (emenda { "5" }: { "176" } linhas, { "172" } interpretadas pelo pycef, { "176" } pelo Logstash). Um HDOP declarado que o céu declarado não explica é sinalizado em toda época e contado (<c32/>, uma linha na página de resumo das evidências), pontuado apenas quando a geometria é ruim. A perda de sinal é exportada por si só, já que o estado da geometria permanece <c33/> enquanto ela vigora: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; no CEF aparece como a classe <c37/> em <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/>: o fator de covariância <c2/> por trás de <c3/>, extraído dele com a mesma aritmética.

# text
seg-c6cc061a3ed6 = Linha do registro "Erro de posição a partir da geometria: erro RMS = sigma_UERE x DOP" (<b>MODELLED</b>, consistência interna): um Monte Carlo com semente do fix de mínimos quadrados do motor nas { "8" } geometrias de DOP pareadas com o gnss_lib_py, em relação ao fator de covariância do kernel de DOP validado, com tolerâncias fixadas antecipadamente antes da primeira execução e dois controles negativos que falham como exigido; ao lado, uma verificação anterior em quatro céus escolhidos à mão com intervalos de confiança qui-quadrado, informada como executada antes do pré-registro.

# text
# c1: src/skyline.rs
# c2: docs/SKYLINE.md
# c3: max(mask_deg, skyline)
# c4: city-street
# c5: harbour-approach
# c6: fjord
# c7: container-terminal
# c8: [skyline]
# c9: gnss-sim
# c10: jamming
# c11: leo-pvt
# c12: leo-pass
# c13: nmea-scenario
# c14: orbit
# c15: integrity
# c16: user_site = { lat_deg, lon_deg, height_m }
# c17: epoch + t
# c18: epoch
# c19: user
# c20: skyline { source, open_fraction, provenance }
# c21: masked_by_skyline
# c22: orbit-urban-canyon-skyline
# c23: integrity-harbour-approach
# c24: gnss-sim-container-terminal-skyline
# c25: jamming-harbour-approach-skyline
# c26: leo-pvt-fjord-skyline
# c27: leo-vertical-autonomous-vehicle-skyline
seg-b87b6eafd465 = <b>Máscaras de skyline dependentes do azimute</b> (<c1/>, <a1><c2/></a1>, item { "1" } da nota de projeto): um corte de elevação que depende do azimute, o máximo ponto a ponto de tabelas (cada uma interpolada por si, com volta em { "360" }°), um cânion de rua em forma fechada (com extremidades abertas opcionais), setores de borda nítida e um perfil de terreno com a curvatura da Terra; o corte efetivo é <c3/>. Quatro predefinições REPRESENTATIVE com proveniência declarada (<c4/>, <c5/>, <c6/>, <c7/>), substituíveis campo a campo. Uma seção opcional <c8/> em <c9/>, <c10/>, <c11/> (todo modo, inclusive a varredura polar), arquivos de treinamento <c12/> e <c13/>, e em <c14/> e <c15/> por meio de um novo usuário em local de solo, <c16/> (ângulos de visada geodésicos sobre a Terra em rotação, com a vertical geodésica para a separação horizontal e vertical do ARAIM; cada amostra é um instante absoluto, <c17/>, ao qual conjuntos de elementos, efemérides transmitidas e arquivos SP3 são avançados a partir de suas próprias épocas, datados a partir da época de satélite mais recente quando nenhum <c18/> é declarado; um <c19/> em órbita recusa um skyline). Os resultados ganham <c20/> e <c21/> por amostra. Sem a seção, todo cenário é idêntico byte a byte à { "0.35.0" }, verificado em relação a digests do commit da versão. Seis exemplos incluídos: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> e a campanha <c27/> (o cânion do veículo autônomo como um corte plano e como uma rua; a campanha existente permanece inalterada). MODELLED.

# text
# c1: src/geometry.rs
# c2: sky_geometry
# c3: tle
# c4: epoch
# c5: sky_source
# c6: sky_statement
# c7: tle_skipped
# c8: sky_monte_carlo
# c9: skyline_presets
# c10: skyline_profile
# c11: skyplot_svg
# c12: orbit::dop_cov
# c13: orbit::dop
# c14: kshana sky
# c15: kshana skyline
# c16: sky_geometry
# c17: notebooks/geometry.ipynb
# c18: .md
# c19: tests/python/test_notebooks.py
seg-95cdecf341d6 = <b>Funções de geometria do céu</b> (<c1/>, item { "2" } da nota de projeto): <c2/> (satélites visíveis e mascarados a partir de um local, um instante e predefinições de constelação, conjuntos de elementos de duas linhas (<c3/>, no máximo { "4" } MiB, propagados pelo SGP4 do motor até uma <c4/> UTC) ou satélites dados; <c5/> e <c6/> dizem se o céu é representativo ou o céu que os conjuntos de elementos dão naquela época, não uma medição; <c7/> lista toda linha não usada com seu motivo; limites de entrada de { "2000" } satélites acima do horizonte, verificados antes de uma tabela de sistema ser construída, e { "16" } relógios de receptor; os cinco DOPs; o cofator e a covariância ENU com um relógio por sistema ou um em comum; a elipse de erro horizontal a um sigma e a uma confiança declarada), <c8/> (erros de mínimos quadrados com semente, no máximo { "5000" }), <c9/>, <c10/> e <c11/>. <c12/> expõe a covariância por trás de <c13/>, que agora é sua redução (os escalares validados permanecem inalterados). Superfícies: <c14/> e <c15/>, funções de Python e WASM com os mesmos nomes, e a ferramenta MCP <c16/> ({ "40" } ferramentas), e o notebook <c17/> (com seu espelho <c18/>; executado por <c19/>). Todo resultado traz o rótulo MODELLED, a declaração do modelo de erro e o aviso consultivo.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Registro: cinco linhas de skyline e de geometria do céu. <b>VALIDATED</b>, cada uma em uma comparação fixada antecipadamente antes de sua referência independente ser executada: <em>Máscara de skyline dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara</em> em relação ao Orekit { "12.2" } (<c1/>, <c2/>) e ao gnss_lib_py { "1.0.4" } (<c3/>), piores diferenças de ângulo de visada e de máscara de { "1.1e-12" }° contra { "1e-9" }°, conjuntos visíveis idênticos, DOP { "3.3e-13" } relativo (<c4/>); <em>Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria</em> em relação ao numpy <c5/> e <c6/> (P2 padrão), { "270" } casos, eixos { "5.1e-13" } relativo (<c7/>). <b>MODELLED</b>: as reduções de cânion, de setor e de terreno; as predefinições; a composição da geometria do céu (céu predefinido, nuvem Monte Carlo).

# text
seg-8f5ebce999fe = Com as linhas de confiança por geometria, de skyline e de estação de referência lunar, o registro tem { "274" } linhas: { "134" } validadas, { "136" } modeladas, { "4" } de parceiros.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Estação de referência lunar: laboratório de tempo da estação</b> (<b>MODELLED</b>). Um bloco opcional <c1/> em <c2/> (<c3/>). Ele modela um relógio de estação (por padrão a classe miniRAFS, qualquer classe nomeada, ou um cartão de dispositivo ajustado a pontos de estabilidade declarados) conduzido ao LTC, depois em operação livre ou reconduzido a cada N segundos. Emite a curva de erro de tempo x(t), o tempo até { "1" }, { "10" } e { "100" } ns (bisseção ao lado da forma fechada) e o termo dominante por horizonte, tudo com unidades. O resíduo de condução é ILLUSTRATIVE. A taxa do LTC não é rederivada e mantém sua própria linha VALIDATED. A meta em nível de nanossegundos do material público de PNT lunar do ICG WG-B (junho de { "2024" }) é citada como uma declaração da fonte, não como uma afirmação. A ordenação de relógios óptico < PHM < RAFS < miniRAFS vale de { "1" } s a { "7e5" } s, e o teste fixa o cruzamento das curvas do PHM e do RAFS perto de { "7.5e5" } s. Esse cruzamento é uma propriedade dos modelos de relógio de um único tipo de ruído (FM flicker puro contra FM branco puro), não um resultado físico. Sem o bloco, o relatório, sua tabela e seu resumo permanecem inalterados. Exemplo: <c4/>. Acrescenta uma linha do registro, rotulada MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Estação de referência lunar: geodésia da estação</b> (<b>MODELLED</b>). Entradas opcionais <c1/> e <c2/> em <c3/> acrescentam um bloco <c4/>. A informação do datum de cinco arranjos do recorte arquivado de telemetria laser é combinada com o que um retrorrefletor acrescentado e um farol VLBI acrescentado em locais declarados contribuiriam. O refletor é medido nas épocas arquivadas em que pode ser visto, com seus pesos arquivados. O farol usa a rede e o cronograma de <c5/>, com as estações fixas. O bloco dá o 1-sigma de cada Helmert antes e depois, e sua razão. São limites de Cramer-Rao para um conjunto reduzido de parâmetros, sobre um cronograma e um local ILLUSTRATIVE. Entradas ausentes ou vazias deixam o relatório idêntico byte a byte. Exemplos: <c6/> e <c7/>. Acrescenta uma linha do registro, rotulada MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Estação de referência lunar: comparação com afirmações publicadas</b> (<b>MODELLED</b>). Toda afirmação numérica em cinco fontes públicas é listada com sua redação exata, página e premissas declaradas, e classificada como comparável, parcialmente comparável ou não comparável (<c1/>; fontes com URL, data de obtenção, SHA-256 e licença em <c2/>). As afirmações parcialmente comparáveis foram pontuadas sob seis limiares unilaterais fixados antecipadamente antes da execução (<c3/>, revisão { "2" }, 05bf9a19): { "1" } de { "6" } afirmações dentro do limiar fixado antecipadamente (fixado antecipadamente 05bf9a19). A cobertura é { "0.00" } contra >= { "0.95" } em ambos os círculos do polo sul, e o p95 corrigido é { "280.6" } m contra <= { "1.5" } m. A causa são os elementos orbitais dos satélites, que nenhuma fonte publica: nos elementos ILLUSTRATIVE do repositório, quatro satélites estão em visada comum em { "8" } % das épocas, com geometria quase singular. A execução não reproduz as afirmações com esses elementos e não é evidência de que as afirmações estejam erradas. Fixado em <c4/>. Uma linha do registro, rotulada MODELLED com a constatação.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Estação de referência lunar: preparação de dados de arquivos de relógio</b>. <c1/> agora declara o sistema de tempo de suas épocas. É o valor de <c2/> ou, quando este não é declarado, o padrão do sistema de satélites do cabeçalho. O resultado também diz se o sistema foi declarado. A função recusa um sistema de tempo desconhecido (uma escala de tempo lunar, por exemplo), um arquivo de sistemas mistos sem declaração e arquivos que divergem, em vez de lê-los como tempo GPS. Ela traz uma fixture sintética de relógio de estação. Nenhum formato de arquivo de correções é definido, porque não existe nenhum público.

# text
seg-0fb89eb36003 = Alterado

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = A documentação dos módulos <c1/>, <c2/> e <c3/> não chama mais de trabalho futuro o navegador com filtro de Kalman unscented (UKF) de 17 estados, o acoplamento forte com INS completo e o estado de relógio explícito; eles apontam para <c4/>, <c5/> e <c6/>.

# text
seg-aedd06cf6127 = <b>O RINEX { "4" } não é mais recusado</b> ({ "0.36" }, WP-07): um arquivo de navegação RINEX { "4" } costumava ser rejeitado de propósito; agora ele é lido (veja Adicionado). Para arquivos de observação da versão { "4" } e posteriores, os rótulos do cabeçalho são reconhecidos apenas nas colunas 61-80, de modo que os novos registros de texto livre não possam passar por rótulos.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> lê arquivos IONEX reais</b> ({ "0.36" }, WP-07): um registro completo de 16 valores preenche as colunas 61-80, que o leitor tomava por um rótulo, de modo que retornava <c2/> em todo arquivo IONEX real. Agora ele lê como valores um registro cujo campo de rótulo é numérico. Nenhuma saída distribuída o usava.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Potências recebidas do Galileo E1 e E5a segundo o OS SIS ICD Issue { "2.1" }</b> (revisão, 2026-10-14). As bandas de espectro <c1/> e <c2/>, e as vítimas GNSS de sinais LEO que tomam sua potência delas, agora usam as potências mínimas recebidas da Tabela { "12" } do Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (era −{ "157.0" }) e −{ "155.25" } dBW (era −{ "155.0" }).

# text
seg-b0386f62923f = Nove resultados de cenário mudam: os exemplos de espectro, a campanha de espectro, três verticais de resiliência LEO e três projetos de sinal LEO. O C/N0 efetivo muda −{ "0.25" } dB e o J/S +{ "0.25" } dB nessas bandas.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Todo valor alterado ({ "1766" }, antigo → novo) está listado em <c1/> e em seu CSV, com as tabelas da documentação que mudaram. Nenhuma linha do registro muda de estado.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Segunda parte, no mesmo dia: as vítimas de sinais LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Tabela { "12" } E5b) e <c2/> (−{ "152.0" } → −{ "152.24" } dBW). O ICD não tem uma linha de E5 de banda completa, de modo que o valor AltBOC é a soma de potências dos totais de E5a e E5b da Tabela { "12" }, construída como o valor antigo era. Três resultados de projeto de sinal LEO mudam ({ "64" } valores: essas potências recebidas e a degradação de C/N0 de LEO para GNSS nas duas vítimas), listados na mesma revisão (§{ "5" }) e no mesmo CSV. Nada mais muda.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>Correção da maré atmosférica S2</b> (<c1/>). Os harmônicos de pressão do ar S2 de Ray ({ "2001" }) são coeficientes de <c2/> não normalizado com atrasos de fase em cosseno; eles eram usados como totalmente normalizados, com o atraso como o avanço em seno do IERS. Agora entram divididos por <c3/> com <c4/>; o novo <c5/> reproduz o modelo A2 da Tabela { "5" } do GFZ STR06/01 para todas as { "21" } ondas (pior caso { "0.0005" } cm, { "0.05" }°; VALIDATED). Apenas as saídas com marés habilitadas mudam: o ajuste CI do Galileo { "0.132" } → { "0.133" } m, os componentes do Swarm-A em { "1" }–{ "2" } mm (fixado antecipadamente em <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Apenas documentação: <c1/>, <c2/> e <c3/> são documentados como resolvedores legados, numericamente inalterados, apontando para <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>Situação da rodada { "3" } do D9 (<c1/>).</b> O BIPM Circular T { "465" } foi publicado em 2026-10-12. A pontuação prospectiva fixada antecipadamente ainda não foi executada: a edição { "465" } contém cerca de { "285" } valores de teste, e a regra de parada exige { "1000" }, ou seja, cerca das edições { "465" }–{ "468" }. A execução também exige os arquivos por laboratório arquivados de 2026-09-30, porque o BIPM desde então reescreveu { "87" } dos { "113" }. A linha do registro e o cabeçalho do teste dizem isso; o teste, seus limiares e sua divisão permanecem inalterados.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Revisão da veracidade da documentação ({ "0.36" }).</b> Roteiro, linhas de capacidade, linhas de situação de documentos de projeto e comentários de módulos alinhados ao código; nenhuma saída muda. Itens já construídos mas ainda listados como em aberto agora estão marcados como concluídos: as verificações de máscara da ITU-T, o cenário de holdover de { "24" } h e a ingestão de registros de relógio (temporização de telecomunicações), os quickstarts do primeiro minuto, Lense–Thirring e a verificação cruzada do propagador com o Orekit, a cadeia GCRS precisa do ITRF, hashes golden e entre plataformas, proveniência, ARAIM de múltiplas falhas (ADD v4.2), FDE de um único satélite, a biblioteca CRPA, o limite de ambiguidade de franjas do CAI, o dimensionamento de ruas de cobertura e a visão orbital 3-D, a dinâmica de atitude de corpo rígido, o escritor de OMM e o leitor de kernels NAIF, a libração lunar DE440, a frase de significado da execução no playground, <c1/>, o navegador de acoplamento forte de 17 estados e o tipo de cenário gravity-map. As linhas também declaram com precisão o que ainda está em aberto (por exemplo, JD em duas partes em <c2/>, o leitor de <c3/> em relação a um produto real e a exclusão de múltiplos satélites em <c4/>). O <c5/> ausente é escrito a partir de uma execução nova de seus testes (M1–M4 passam), e o rascunho de validação IQ voltado a parceiros tem as contagens atuais do registro.

# text
seg-e2290a640df7 = Os códigos de memória Galileo E1 não são mais distribuídos junto com o pacote.

# text
# c1: data/galileo-os-sis-icd/C7_E1B.txt
# c2: C8_E1C.txt
# c3: LICENSING.md
# c4: galileo::e1b_table
# c5: e1c_table
# c6: Result
# c7: KSHANA_GALILEO_E1B
# c8: KSHANA_GALILEO_E1C
# c9: data/galileo-os-sis-icd/
# c10: scripts/fetch_galileo_e1_codes.sh
# c11: galileo::E1B_TABLE_TEXT
# c12: E1C_TABLE_TEXT
# c13: galileo-e1b
# c14: galileo-e1c
# c15: tests/iq_signals.rs
seg-80f8ca869682 = <c1/> e <c2/> (ICD Anexo C.7/C.8) foram removidos do repositório e dos pacotes. Os termos do ICD (citados em <c3/>) permitem que o usuário armazene os códigos, citando a fonte, e os use em um produto, mas permitem a redistribuição apenas para fins não comerciais, e o Kshana também é oferecido sob licença comercial. <c4/> / <c5/> agora retornam um <c6/> e leem a cópia do próprio usuário a partir de <c7/> / <c8/> ou, em um checkout do código-fonte, a partir de <c9/>, onde o novo <c10/> as extrai do PDF do ICD (com verificação de hash). <c11/> / <c12/> foram removidos. Sem as tabelas, os sinais Galileo E1 (<c13/>, <c14/>) retornam um erro que indica como fornecê-las, e os testes de E1 são ignorados com uma mensagem. Com as tabelas presentes, todas as saídas de E1 permanecem inalteradas. Nenhuma saída de cenário, golden ou espectro usa as tabelas de códigos. Os fixtures de teste do Anexo C.3/C.4 do E5a (a referência independente LFSR em <c15/>) recebem o mesmo tratamento: são obtidos pelo mesmo script, ignorados pelo git, e o teste é ignorado sem eles.

# text
# c1: f64
# c2: rand_distr
# c3: libm
# c4: portable_math::PortableFloat
# c5: portable_distr
# c6: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c7: europa-surface-pnt
# c8: lunar-joint-od-clock
# c9: paper/crossover/inertial.json
# c10: vibration_psd
# c11: cislunar-observability
# c12: skyline_scenarios
# c13: geometry_corpus_identity
# c14: geometry_trust_no_change
# c15: docs/predictions/*.portable-0.36.json
# c16: tests/lunar_joint_od_numpy_oracle.rs
# c17: docs/revisions/STUDIO15-lunar-joint-od-oracle-rerecord.md
# c18: docs/revisions/STUDIO15-batch4-rebaseline.md
# c19: iq_campaign
# c20: gnss-ins
# c21: docs/revisions/STUDIO15-greenhall-edf-portable.md
# c22: docs/revisions/STUDIO15-testbench-gpssdrsim-rerun.md
seg-654d0358137b = <b>Matemática portátil em todo o lugar</b> ({ "0.36" }, STUDIO-15): todas as funções transcendentes de <c1/> da biblioteca, e os amostradores normal, gama e exponencial de <c2/>, agora são calculados por meio de <c3/> em Rust puro (<c4/>, <c5/>), de modo que uma compilação nativa e a compilação WebAssembly retornam JSON de resultados idêntico byte a byte para todos os { "141" } cenários incluídos e para a execução curta de IQ. O custo é que os últimos bits dos resultados calculados com a biblioteca matemática do host mudaram: { "98" } dos { "141" } cenários incluídos mudaram, { "43" } não; { "5" } mudaram em mais de { "1e-3" } no seu maior campo, e os demais em menos. Cada valor alterado está listado como antigo -> novo em <a1><c6/></a1> (com um CSV de todos os { "136,127" } números alterados); nenhum limiar, tolerância ou limite foi alterado. Números publicados que mudaram: disponibilidade de <c7/> com o alcance da Terra { "0.719" } -> { "0.713" } e erro RMS { "86.147" } -> { "86.499" } m (uma época na borda da disponibilidade agora é resolvida da mesma forma em todo lugar; ela imprimia { "0.725" } / { "85.800" } m no macOS arm64); erro de estação de <c8/> { "3.541350" } -> { "3.536885" } m com VLBI e { "2183.558" } -> { "2184.021" } m sem; <c9/>, oito valores de <c10/> em { "3" } unidades na última casa (erratum no relatório técnico); o documento <c11/> publicado em grandezas no piso de arredondamento (oito valores além de seis algarismos significativos, até { "6.8e-5" } em termos relativos; nenhuma posição de ranking ou limite mudou). Os hashes fixados das proteções de identidade byte a byte (<c12/>, <c13/>, <c14/>) foram rebaseados para uma linha de base nomeada "{ "0.36" } portable", com os valores de { "0.35.0" } mantidos como registro histórico; a predição congelada da estação de referência lunar permanece intocada e a sua reexecução portátil é armazenada ao lado dela (<c15/>). <c16/> (a linha validada de OD conjunta lunar): fixtures reexportados e a comparação com o numpy reexecutada com o numpy { "2.4.6" }, a versão registrada, com script e limiar inalterados; todas as seis redes passam (<a2><c17/></a2>). O trabalho dos lotes 2-3 integrado depois do STUDIO-15 também usa matemática portátil ({ "457" } pontos de chamada em { "62" } arquivos); o que isso alterou está em <a3><c18/></a3>: { "12" } cenários incluídos (maior variação relativa { "5.2e-8" }, nenhuma cifra impressa muda), { "28" } linhas de proteção do skyline atualizadas como novas referências, o digest M2M4 de <c19/>, os hashes de verdade de referência legados de <c20/>, o sigma do datum de balizas não observadas ({ "632.3769" } -> { "632.3772" } m) e dois achados registrados (fechamentos de DRO do CR3BP; CRPA A3, { "194" } de { "456" } enlaces). O edf exato de Greenhall mantém o seu limiar validado com um logaritmo de precisão dupla-dupla no seu núcleo (<a4><c21/></a4>), e a referência independente do test bench gps-sdr-sim foi reexecutada sobre as exportações NMEA alteradas, com todos os limiares atendidos (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README: a linha da suíte lunar informa o nível de evidência de cada parte (antes dizia que todas eram MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> retorna <c2/> (série, registro de interpolação em grade, sistema de tempo, se foi declarado, tipo de registro) em vez de uma tupla <c3/>. Agora, na falta de registros de satélite (<c4/>), recorre a registros de receptor/estação (<c5/>) com o nome solicitado.

# text
# c1: tests/geometry_trust_no_change.rs
# c2: tests/geometry_corpus_identity.rs
# c3: score_model.weights
# c4: geometry
# c5: class
# c6: geometry
# c7: class
# c8: geometry
# c9: monitors_run
# c10: [score.weights]
# c11: [geometry]
seg-6777ca96624a = Nenhuma pontuação muda, a menos que a geometria seja ruim; o rótulo é sempre informado. Com geometria boa ou razoável (incluindo um céu aberto só com GPS com { "8" } satélites) ou geometria desconhecida (o monitor não é executado), cada pontuação é igual à de { "0.35" }: <c1/> mantém as saídas de ambas as sessões de exemplo e <c2/> mantém cada corpus NMEA de embarcação confirmado no repositório (também como céu aberto só com GPS) e os cenários de treinamento de tripulação nos bytes de { "0.35.0" }, uma vez removidas as chaves acrescentadas; nos dois cenários de treinamento em que a interferência intencional torna a geometria ruim, as épocas ruins diferem apenas pela dedução de geometria. Um registro com geometria ruim perde até { "15" } pontos que não perdia em { "0.35" }. As demais mudanças pretendidas são todas acréscimos: as chaves acima no JSON de resultados e nos pacotes de evidências (<c3/> não muda); o esquema JSON-lines ao vivo passa de { "1.2" } para { "1.3" } (<c4/> acrescentado, <c5/> em cada dedução); o resumo do trecho ganha <c6/>; a telemetria ganha séries, campos e o rótulo <c7/> de geometria apenas para entradas que os contêm, de modo que um fluxo ou resultado de { "0.35" } é renderizado byte a byte como antes. <c8/> é o 17.º nome de monitor; ele é listado por último em <c9/> quando decidiu (uma embarcação cujo registro informa a geometria; uma lista de { "0.35" } mantém a sua ordem e a contagem de monitores do resumo aumenta em um) e não tem entrada em <c10/> (definir uma é recusado: a sua dedução é definida em <c11/>).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> indicava a licença do gnss_lib_py como Apache-2.0; a versão { "1.0.4" } é MIT.

# text
seg-a1a670a9c63e = O leitor NMEA agora lê GSA (um GSA curto é ignorado, não contado como descartado) e mantém as elevações e os azimutes de GSV, inclusive para satélites listados sem sinal; o leitor UBX mantém a elevação e o azimute de NAV-SAT. O C/N0 é lido exatamente como antes.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Mudança de resultado: interferidores de banda larga e varridos agora usam Q = { "2" }.</b> A equação antijamming usa o ajuste Q de espalhamento espectral dos livros didáticos para esses interferidores, onde antes usava { "1" }. Q = { "2" } é ruído branco sobre o lóbulo principal com a potência do sinal na banda normalizada; está fixado nos testes à forma fechada de <c1/>.

# text
# c1: q_override
seg-21f31ec302de = <b>Inalterados:</b> interferidores CW e de banda estreita (Q = { "1" }), um tipo de interferidor não reconhecido (Q = { "1" }, o valor mais danoso) e <c1/>.

# text
seg-f362499d2ed0 = <b>Efeito:</b> onde um interferidor de banda larga ou varrido atua, o C/N0 efetivo sobe até { "3.0103" } dB, os limiares de J/S derivados sobem { "3.0103" } dB e os raios de negação em espaço livre diminuem por um fator de { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Cenários incluídos alterados:</b> { "12" } de { "144" } mudam, todas como pré-registrado (<c1/>, resultados em <c2/>):

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/>: satélites perdidos { "26" } → { "0" }, mediana da distância de segurança até a perda de travamento { "27.4" } → { "19.4" } km;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/>: raio de negação pela dinâmica do laço { "75.2" } → { "53.2" } km;

# text
seg-096a24491872 = e as campanhas e verificações cruzadas de espectro que os contêm.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Consumidores afetados:</b> os tipos de cenário <c1/>, <c2/>, <c3/> e <c4/>, o <c5/> dos tipos de cenário de espectro, a curva de referência MODELLED da campanha de IQ e o Q padrão do labfit, e a exportação de cena de interoperabilidade.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = Plugin JetBrains: nenhuma API de plataforma obsoleta ou com remoção programada. Os cinco diálogos de escolha usam um pequeno <c1/> com uma lista suspensa no lugar do obsoleto <c2/>; os seletores de arquivo único usam o construtor <c3/> no lugar do obsoleto <c4/>; a animação é aberta com <c5/> no lugar de <c6/>, que a plataforma { "2026.3" } programa para remoção. O since-build permanece { "243" }. O IntelliJ Plugin Verifier informa Compatible, sem uso obsoleto ou com remoção programada, em { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) e { "2026.3" } EAP (IU-263.6259.32); <c7/> verifica { "2024.3" } por padrão e qualquer lista fornecida em <c8/>.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> e <c2/> retornam <c3/>: uma seção <c4/> inválida é um erro quando chamada diretamente, como já era por meio de <c5/>, em vez de um retorno silencioso à máscara plana. <b>Mudança incompatível</b> para chamadores Rust dessas duas funções.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Avaliador da campanha: um falso travamento real do rastreador nunca era contado</b> (<c1/>). A verificação de falso travamento do rastreador move um canal de LOCKED para LOST no momento em que dispara. O avaliador marcava a atualização seguinte do canal, que então já estava destravada e, por isso, nunca era contada. Um evento <c2/> informado a partir de LOCKED agora é um episódio no seu instante, na execução e em cada evento declarado que o contém. Um encontrado durante a captura inicial, ou repetido por um canal já LOST, não é um novo episódio. Um novo teste provoca um falso travamento real: uma portadora GPS L1 C/A legítima com salto de 1/(2T) enquanto travada (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = Na campanha de referência de <c1/>, apenas o PRN { "11" } de ramp/agc-3bit muda (episódios de falso travamento { "0" } → { "1" }, { "426" } e { "437" } por hora travada).

# text
seg-cfc47d9d9237 = Os DIGESTs das suas células são fixados novamente.

# text
seg-fcfa0de18b05 = O pin dos resultados avaliados pré-registrados continua ativo e ainda reproduz exatamente: no seu hash, apenas esses seis campos, alterados por esta correção feita após o registro, são mapeados de volta aos seus valores anteriores à correção. Os valores corrigidos são fixados à parte.

# text
seg-b96d34bb1d36 = Nenhum limiar foi alterado, e nenhuma linha, figura ou número da web VALIDATED mudou.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign: uma baliza sem observação agora é informada</b> (encontrado por MR-05). O relatório ganha <c1/> e <c2/> apenas quando alguma baliza não tem observação, e então os sigmas das balizas observadas vêm da sua própria informação, em vez de serem todos nulos. O datum não muda, e nenhuma saída padrão, incluída ou publicada se altera (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Referencial lunar de eixos principais</b> (<c1/>, usado por <c2/> e pelo ajuste do LRO): o deslocamento do DE421 entre o referencial de Terra média e o de eixos principais, de <c3/>, era aplicado no sentido errado e com a ordem de Euler errada, de modo que o referencial PA analítico ficava a cerca de { "208" }″ do PA em vez de coincidir com ele. Agora ele é transcrito como a Frames Required Reading do SPICE o define e concorda com o SPICE <c4/> até { "2.6e-16" } rad; o referencial PA analítico fica de { "6" }″ a { "8" }″ do PA do DE440 (pré-registrado e1ead19b, registrado de novo be33382e depois que a primeira alteração proposta não atingiu o limiar de { "1e-12" }; <c5/>). Números publicados que mudam: o ajuste do LRO (<c6/>) sobreposição bruta { "53.8" } → { "39.9" } m, dinâmico { "12.6" } → { "12.05" } m, dinâmico reduzido { "6.65" } → { "6.67" } m (limiares inalterados). A pilha analítica agora coincide com a validação cruzada de grau DE do ANISE ({ "12.0" } / { "6.67" } m) nos dois níveis; a diferença anterior no nível dinâmico era este erro.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>O servidor MCP recusa <c1/></b> (acompanhamento de CAP-06b). O caminho do tile de terreno do tipo de cenário jamming agora está em <c2/>. Uma superfície inline recusa um cenário que nomeie um, com uma mensagem que não traz nem o caminho nem um erro do sistema operacional. O teste de proteção de fontes em arquivo agora também sinaliza campos terminados em <c3/>.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> com uma parte fracionária do dia descartava a fração nas conversões de UTC, TAI, UT1 e rotação da Terra (uma hora de parte do dia deixava a Terra { "15" }° errada); a parte do dia agora é normalizada para um inteiro. Nenhum chamador do motor foi afetado: todos passam um dia inteiro, e toda saída distribuída é idêntica bit a bit.

# text
seg-144d90307ec6 = Planejado

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = A geometria a partir de um skyline declarado ({ "0.36" } item { "1" }, agora no motor como <c1/>): <c2/> e <c3/> a partir do skyline quando a entrada fornece um (a lacuna de azimute como alternativa), um evento de degradação natural (fiorde ou terminal) em <c4/>, e as duas geometrias mascaradas da nota de projeto na linha sigma_UERE x DOP, pré-registradas como adendo.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = Geometria para registros RINEX com navegação (a partir da solução de posição do próprio motor) e registros Android (a partir das linhas de <c1/>); ambos leem <c2/> hoje. Geometria em <c3/> (versão { "1" } inalterada em { "0.36" }) e nas integrações Signal K e OpenCPN.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Uma lacuna preexistente, não introduzida em { "0.36" }: quando o campo SNR de todos os satélites está vazio, nenhuma dedução de <c1/> ou de C/N0 dispara; a perda total de sinal só é visível pelo <c2/> do monitor de geometria (classificado como <c3/>). Está planejada uma dedução para esse caso.

# text
seg-a5a7a10ee11c = Um fluxo de esquema { "1.3" } nas referências independentes de telemetria externas (o analisador do formato de texto do Prometheus e o coletor OTLP), que hoje cobrem apenas fluxos { "1.2" }.

# text
seg-caa1977b5b5e = Uma obstrução bilateral (um cânion ou um fiorde estreito) é lida como perda de sinal, e não como céu bloqueado, até que o skyline seja integrado.

# text
seg-4bd0f178ca4e = Uma passagem que nomeia clientes de IA de terceiros foi omitida aqui; ela está em <a1>CHANGELOG.md</a1> no GitHub.

# text
seg-b2689beaba9e = Verificador Galileo OSNMA

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Novo módulo <c1/> e <c2/>: um verificador aberto, em Rust puro, do lado do receptor para o Galileo OSNMA.</b> Ele lê páginas I/NAV e informa, por satélite e época, se os dados de navegação estão autenticados, com um motivo para cada falha ou atraso: análise de HKROOT e MACK, remontagem de DSM-KROOT e DSM-PKR, verificação Merkle da chave pública, verificação da cadeia de chaves TESLA, verificação de MACSEQ e de tags para ADKD { "0" }, { "4" } e { "12" }, incluindo a autenticação cruzada, e um resultado no formato <c3/> para o monitor de confiança do receptor. A saída traz um aviso consultivo de que o estado não é um serviço de integridade de navegação. <c4/> declara o que é e o que não é verificado, o requisito de tempo e que o Kshana não concede direitos sobre a propriedade intelectual do ICD do OSNMA da UE (os usuários se baseiam na autorização do Anexo E do ICD). Implementado de acordo com o SIS ICD Edição { "1.1" } e as Receiver Guidelines Edição { "1.3" }. As páginas têm o CRC verificado, e um fluxo de bytes UBX-RXM-SFRBX da u-blox pode ser lido diretamente (<c5/>). Os testes padrão usam dados sintéticos e testes de resposta conhecida de primitivas publicadas; um teste opcional lê uma cópia baixada localmente dos vetores oficiais. Após revisão independente, o verificador obtém o seu tempo apenas de chaves TESLA verificadas (um subquadro espúrio de futuro distante já não consegue apagar uma falha), faz uma autenticação expirar e acompanhar o IODnav em uso, respeita mensagens de alerta verificadas (cuja folha Merkle agora inclui o campo NPK aleatório) e o estado NMA "don't use", mantém tags fictícias fora do estado do satélite, mantém cadeias por CID com revogação e renovação, verifica o hash de preenchimento do KROOT e limita os comprimentos de quadro UBX e o trabalho de verificação TESLA. Um satélite só é lido como autenticado enquanto os dados mais recentes de efemérides e relógio que ele envia forem, bit a bit, os dados que foram autenticados (e não apenas sob o mesmo IODnav); um estado ou uma revogação do cabeçalho NMA não autenticado só conta quando dois satélites concordam ou um KROOT verificado o transporta; um KROOT mais antigo reenviado não pode substituir uma cadeia; e um fluxo de chaves parado é informado.

# text
seg-3e7df5c888ca = Adicionado (canais do servidor MCP)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, HTTP em streaming, auto-hospedado.</b> Loopback por padrão; um endereço fora do loopback exige <c2/> e um token bearer em <c3/>; nenhuma ferramenta lê ou grava um caminho (as ferramentas de arquivo IQ ficam desligadas); limites de tamanho de requisição, de tempo e de concorrência; nenhum cabeçalho CORS; verificações de Host e Origin. O Kshana não hospeda nenhum endpoint (<c4/>, com modelos para Docker, Fly.io e Cloud Run).

# text
seg-c392cde151c9 = Adicionado (superfícies)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> em Python e WebAssembly.</b> O verificador por trás de <c2/> sobre bytes em memória, retornando o JSON que <c3/> imprime (aviso consultivo no seu campo <c4/>; apenas estado de autenticação, não um serviço de integridade de navegação). As mesmas recusas da linha de comando. Não está no MCP: a entrada é um fluxo bruto longo de receptor, mais bem atendido pela CLI e pelo Python. <c5/> e <c6/> informam isso.

# text
# c1: trust_telemetry
# c2: receiver-trust
# c3: kshana trust-telemetry
# c4: kshana::surface::trust_telemetry
# c5: /kshana-trust-telemetry
# c6: trust-telemetry
# c7: wasm
# c8: python
# c9: otlp
seg-6128929994b4 = <b><c1/> em WebAssembly, Python e MCP, com um comando de plugin e uma ação do JetBrains.</b> Renderiza um fluxo de confiança ou um resultado de <c2/> como texto Prometheus, linhas de syslog CEF ou LEEF ou uma carga JSON OTLP, com os codificadores que <c3/> usa (<c4/>); sem socket e sem relógio. Plugin: <c5/> e a skill <c6/>. JetBrains: Render Trust Telemetry. Os recursos <c7/> e <c8/> e o servidor MCP agora também habilitam <c9/>, que não acrescenta nenhum crate.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Varredura de paridade.</b> Ações do JetBrains Validate Scenario, List Scenario Kinds e Assess Receiver Stream; <c1/> agora lista <c2/>, <c3/>, <c4/> e <c5/>; o notebook <c6/> (mapeamento de compliance e exportação para test bench); e toda célula restante "CLI only" do JetBrains em <c7/> agora é um N/A explícito com o seu motivo.

# text
seg-062ef0cf7ee7 = Adicionado (pacotes de evidências)

# text
# c1: kshana receiver-trust evidence
# c2: kshana evidence verify
# c3: kshana evidence keygen
# c4: *.evidence-key
# c5: verify
# c6: --pubkey
# c7: openssl ts -verify
# c8: kshana::evidence
# c9: wasm32
# c10: ed25519-dalek
# c11: zeroize
# c12: docs/EVIDENCE-PACKS.md
seg-9889575c2df1 = <b><c1/> e <c2/>: pacotes de evidências assinados e verificáveis para um evento de confiança GNSS.</b> Um pacote reúne o trecho bruto do registro e o SHA-256 do registro completo, a configuração com todos os limiares, os resultados e os motivos por época, a versão do motor, um manifesto encadeado por hash e um resumo HTML autocontido, assinados com Ed25519 (uma chave de <c3/> ou o seu próprio arquivo; as chaves nunca são armazenadas em um pacote e <c4/> é ignorado pelo git). <c5/> verifica cada hash, a cadeia e a assinatura e nomeia exatamente o que falha; com <c6/> ele fixa o signatário. Um token RFC { "3161" } pode ser anexado, sendo lido e vinculado ao manifesto (a assinatura da própria autoridade não é verificada por esta compilação; <c7/> a cobre). O trecho do registro corresponde aos bytes exatos da janela quando o leitor informa intervalos de origem (NMEA, UBX, RINEX { "3" }, Android); caso contrário, é o registro inteiro, e o manifesto diz qual. A criação e a verificação são funções públicas puras (<c8/>) que compilam para <c9/>. Os pacotes declaram que são um registro técnico, não um parecer jurídico. As novas dependências são a árvore de <c10/> (BSD-3-Clause e Apache-2.0/MIT, recursos mínimos) e um <c11/> direto (já presente nessa árvore) para apagar o material de chave. Veja <c12/>.

# text
seg-280fd37126c1 = Adicionado (telemetria de confiança)

# text
# c1: kshana trust-telemetry
# c2: receiver-trust
# c3: /metrics
# c4: otlp
# c5: kshana_trust_syslog_send_failures_total
# c6: /metrics
# c7: deploy/grafana/
# c8: docs/TRUST-TELEMETRY.md
# c9: src/telemetry/sample.rs
seg-ebd269c618b0 = <b><c1/>: a confiança GNSS como fonte de telemetria de segurança.</b> Lê o fluxo de confiança por época (JSON lines: pontuação 0-100, faixa, motivos) ou um resultado em lote de <c2/> e alimenta um endpoint Prometheus <c3/> (localhost por padrão), eventos de syslog em CEF ou LEEF dentro de um envelope RFC { "5424" } (UDP ou TCP) e, atrás do recurso <c4/>, desligado por padrão, a exportação JSON OTLP/HTTP. A entrega roda em threads de trabalho com limites de tempo de conexão e de escrita, recuo de reconexão limitado e um contador <c5/>, de modo que um coletor morto ou travado não consegue travar a avaliação ao vivo nem congelar <c6/>; os rótulos de motivo são limitados a { "64" } séries. Sem novas dependências. Um painel Grafana de exemplo está em <c7/>. Os nomes de métricas, os rótulos e o mapeamento de campos CEF/LEEF estão em <c8/>. O formato do fluxo está isolado em <c9/>.

# text
seg-fa5e803edb44 = Confiança marítima: uma pontuação de confiança ao vivo de 0-100 para a solução de posição de uma embarcação em movimento, a partir do NMEA { "0183" } que o receptor já emite, com um bloqueio opcional.

# text
# c1: kshana receiver-trust
# c2: [platform]
# c3: kind = "static"
# c4: "vessel"
# c5: [maritime]
# c6: [score]
# c7: kshana receiver-trust live <session.toml>
# c8: $PKSHT
# c9: --gate
# c10: V
# c11: N
# c12: --listen tcp:<port>
# c13: examples/maritime-trust/
# c14: docs/MARITIME-TRUST.md
seg-c5b3fcb9bba8 = <c1/> aceita uma tabela <c2/> (<c3/> ou <c4/>, a velocidade, a aceleração e a taxa de giro máximas da embarcação, a altura da antena acima da linha d'água e um sensor de rumo opcional; cada valor padrão é documentado com o seu motivo). Para uma embarcação, o monitor estático de salto de posição, que mede a distância em relação à média de calibração e erra em um navio em movimento, é substituído por monitores causais de plataforma móvel: consistência cinemática da posição em relação à velocidade e ao curso informados e em relação aos limites da embarcação, rumo do giroscópio em relação ao curso sobre o fundo, odômetro de velocidade em relação à velocidade sobre o fundo, altitude da antena em relação à altura declarada acima da linha d'água, colapso da dispersão de C/N0 e subida conjunta em relação à linha de base de calibração, e consistência de tempo (também em relação ao relógio deste computador, no modo ao vivo). Ele também lê um estado de autenticação informado, geral ou por satélite (apenas um estado informado: sem criptografia OSNMA). Cada limiar é declarado em uma tabela <c5/> antes da execução. Cada época então recebe uma pontuação de { "0" } a { "100" } por um mapeamento determinístico e pré-registrado (sem aprendizado, nada ajustado a eventos; os pesos, as bordas das faixas e a evidência ficam em uma tabela <c6/>), mapeada sobre os estados de confiança existentes, com os monitores que fizeram deduções e os seus pontos. Os cenários estáticos permanecem inalterados e têm o mesmo hash de antes. <c7/> lê stdin, um arquivo em acréscimo, TCP ou UDP e grava uma linha JSON por época e uma sentença proprietária <c8/>; com <c9/> ele repassa o fluxo sem alterações enquanto a solução de posição é confiável e marca a solução como inválida (qualidade GGA { "0" }, estado RMC e GLL <c10/>, modo GNS e VTG <c11/>) enquanto não é. O bloqueio fica desligado, a menos que seja solicitado; <c12/> serve o fluxo bloqueado a qualquer número de clientes TCP (loopback por padrão; um cliente lento é descartado em vez de bloquear os outros). Este é um software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }); o operador continua responsável. <c13/> é um registro sintético de Tallinn a Helsinki, escrito apenas como texto, com um arrasto de posição no meio do trajeto durante o qual o receptor continua informando uma solução válida; a sua saída esperada é fixada por um teste. Guia: <c14/>. As verificações não conseguem enxergar um spoofer cuja solução é consistente com tudo o que está no barramento; o guia diz isso.

# text
seg-80f3f0aae42c = Mapa de interferência

# text
# c1: kshana interference-map
# c2: kshana route-exposure
# c3: fetch-land --allow-network
# c4: flate2
# c5: null
# c6: <source>-<dataset>-<date>.geojson
# c7: docs/INTERFERENCE-MAP.md
# c8: docs/data/INTERFERENCE-DATA-SOURCES.md
seg-8539a42718cb = <b><c1/> e <c2/>: um retrato público de onde aeronaves e navios informaram dados de navegação degradados e de quanto de uma rota eles atingem.</b> As entradas são arquivos CSV locais feitos a partir de dados ADS-B (adsb.lol, ODbL { "1.0" }) e AIS (NOAA MarineCadastre, Kystverket sob NLOD { "2.0" }) com licença aberta; cada arquivo de saída corresponde a uma fonte e a um dia UTC de GeoJSON, com o método, os seus limiares, a licença dos dados, a atribuição e o viés de cobertura da fonte. O método ADS-B agrega NIC e NACp em uma grade fixa e considera uma célula degradada a partir da proporção de aeronaves distintas, com proteções para equipamentos que nunca informam precisão, baixa altitude e causas de área ampla. O método AIS executa cinco detectores: posições em terra (em relação a uma linha costeira fornecida pelo usuário), trajetórias circulares, saltos implausíveis, velocidades implausíveis e muitas embarcações em uma mesma posição. Os limiares são constantes pré-registradas de uma versão nomeada do método. Apenas agregados: os identificadores passam por hash em memória e nunca são gravados, e células com menos de { "5" } aeronaves ou embarcações distintas não são publicadas. Uma célula degradada não é uma constatação de interferência. Os comandos padrão não usam rede; um auxiliar opcional <c3/> baixa polígonos de terra do Natural Earth de um endereço fixado a um commit e só mantém o arquivo se o seu SHA-256 coincidir. A entrada ADS-B é um CSV ou diretamente os arquivos de histórico readsb do adsb.lol (nova dependência: <c4/> com o seu backend em Rust puro, para gzip). Ambos os métodos estão na versão { "2" }: uma chamada de degradado ou anômalo exige pelo menos { "5" } aeronaves ou embarcações (o mínimo de publicação), toda contagem por célula abaixo de { "5" } é retida como <c5/>, e um dia cujo fundo não pode ser estimado tem as suas chamadas retidas. Os arquivos de saída são nomeados <c6/> e nunca são sobrescritos; a entrada é lida em fluxo, linha a linha; a exposição de rota trata o antimeridiano. Os testes usam apenas dados sintéticos. Veja <c7/> e a revisão de licenças em <c8/>.

# text
seg-7a54dfab93dc = Adicionado (fluxos de treinamento)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/>: NMEA { "0183" } sintético de ponte de comando para o treinamento de tripulações no reconhecimento de jamming e spoofing de GNSS.</b> A partir de um TOML de cenário, ele grava um arquivo ou transmite por TCP ou UDP (unicast ou broadcast; em tempo real, acelerado ou o mais rápido possível) o conjunto completo de sentenças da ponte de comando GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT e VBW para a trajetória de uma embarcação com limites de taxa de giro, aceleração e correnteza, com a geometria de satélites das constelações nominais do próprio motor. Eventos roteirizados em uma linha do tempo: jamming, arrasto de posição (uma solução válida que se afasta), spoofing de tempo e um atraso de replay, cada um com rampas de início e de recuperação. Um registro do instrutor (JSON e texto) anota o que foi injetado e quando, com a trajetória verdadeira em comparação com a informada. Uma biblioteca em <c2/> (jamming em mar aberto, arrasto costeiro, spoofing de tempo na aproximação de porto, combinado) traz notas para o instrutor. A saída tem checksum válido e é determinística por semente; os testes fixam um trecho golden por cenário e leem cada sentença com o leitor NMEA de <c3/>. Apenas texto: sem saída de RF, IQ ou forma de onda; os fluxos servem para treinamento e teste e nunca devem ser enviados aos sistemas de navegação ativos de uma embarcação. Veja <c4/>.

# text
seg-bb8d508c92fa = Integrações marítimas ({ "0.35.0" }, linha de trabalho B)

# text
# c1: integrations/signalk/
# c2: kshana receiver-trust live
# c3: $PKSHT
# c4: navigation.gnss.kshana.*
# c5: navigation.position
# c6: warn
# c7: alarm
seg-538cdf145ac1 = <b>Plugin Signal K</b> (<c1/>, não publicado no npm): executa ou se conecta a <c2/> (a própria entrada NMEA do servidor, argumentos de entrada personalizados, um feed TCP JSON-lines ou as sentenças <c3/> de um fluxo com bloqueio), publica a pontuação de confiança, a faixa, os motivos, os alarmes e o estado do bloqueio em <c4/> (incluindo a posição informada pelo receptor como contexto, nunca <c5/>) e emite uma notificação do Signal K (<c6/> em degradado, <c7/> em não confiável, com limiares de retenção, de limpeza e de obsolescência, todos no esquema de configuração). Sem dependências npm. Testado em saída sintética gravada.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b>: o NMEA em modo de bloqueio é servido diretamente por <c1/> (recomendado); um relé TCP sem dependências (<c2/>) é a alternativa opcional. De qualquer modo, o OpenCPN vê uma solução inválida quando a confiança colapsa e <c3/> na sua janela de depuração NMEA; os testes reproduzem o fluxo sintético bloqueado por um socket TCP real e verificam o que um consumidor recebe. Um plugin nativo de painel de pontuação (<c4/>, API de plugin { "1.18" }, CMake) lê <c5/> do próprio fluxo NMEA do OpenCPN e emite alertas na faixa não confiável; ele compila, a sua lógica tem testes unitários e foi executado dentro do OpenCPN { "5.8.4" } sob um display virtual (evidências e um script de reprodução em <c6/>); não está empacotado para o gerenciador de plugins.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Montagem de referência</b> (<c1/>): lista genérica de peças, configuração do sistema operacional, units do systemd para o monitor consultivo e para o bloqueio opcional (verificadas com <c2/> por <c3/>), uma opção de contêiner, ligação com o Signal K.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = O plugin Signal K aceita o esquema JSON ao vivo { "1.2" } (uma chave <c1/> e depois uma chave <c2/> acrescentadas; chaves acrescentadas desconhecidas são ignoradas), verificado em saída real { "1.2" } e em relação a um signalk-server real.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Correções da revisão: as units do systemd reiniciam sempre e rodam em sandbox (sem shell, sem rede onde ela não é necessária), um trecho de logrotate, <c1/> falha diante de qualquer achado; o contêiner executa o bloqueio a partir de variáveis de ambiente, com verificação de saúde e imagens base fixadas por digest; metadados de pontuação do Signal K, a notificação obsoleta é substituída quando os dados retornam, os erros de processos-filho são mantidos e os encerramentos forçados escalam, <c2/> inseguros são recusados, e a notificação fica em <c3/>; o relé limita uma linha parcial retida; os analisadores de <c4/> rejeitam pontuações fora de { "0" } a { "100" }; uma verificação de links da documentação; um fluxo de CI (<c5/>) que executa tudo isso, inclusive o binário real de ponta a ponta.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Software de caráter consultivo, não um equipamento homologado; o operador continua responsável. Apenas software: nada transmite, e nenhum número de detecção ou de alarme falso é alegado.

# text
seg-72cb9f45ce99 = Adicionado: mapeamento de compliance e exportação para test bench

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> e <c2/>.</b> Um mapeamento das saídas do Kshana para cinco frameworks e normas de resiliência (o Resilient PNT Conformance Framework v2.0 do DHS dos EUA, as orientações da IMO para navios, as orientações da EASA para a aviação, o Artigo { "21" } da NIS2, a EN { "16803" }, uma norma paga citada por parte e pelos poucos números de cláusula visíveis no texto do catálogo), uma tabela por framework: a referência, o que ela pede em nossa paráfrase, as saídas que fornecem evidências em apoio de cada item e a lacuna. As versões das fontes, as URLs e o que foi e o que não foi lido são registrados. <c3/> preenche o mapeamento a partir das execuções fornecidas e marca cada linha como <c4/>, <c5/>, <c6/> ou <c7/>, em Markdown e JSON, com a lacuna mantida em cada linha. A formulação é "fornece evidências em apoio de"; nada é classificado nem aprovado. Os testes usam execuções sintéticas e falham quando uma tabela confirmada no repositório se afasta do código.

# text
# c1: kshana bench-export <scenario.toml>
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: GGA
# c6: RMC
# c7: receiver-trust
# c8: [[events]]
# c9: src/interop/testbench.rs
# c10: tests/interop_testbench.rs
# c11: docs/TEST-BENCH.md
# c12: kshana receiver-trust
seg-ee9a0a43e4b0 = <b><c1/>.</b> Grava o movimento do veículo e os eventos de um cenário <c2/>, <c3/> ou <c4/> para um simulador GNSS de laboratório: um CSV de movimento do usuário com referenciais documentados e um arquivo auxiliar de metadados, NMEA { "0183" } <c5/>/<c6/>, texto de waypoints e os eventos como CSV e como blocos <c8/> de <c7/> (<c9/>). Apenas movimento e eventos: nenhum sinal é gravado. Cada arquivo é relido em <c10/> e comparado dentro da sua tolerância declarada. <a1><c11/></a1> apresenta o método para reproduzir a exportação por um simulador e avaliar o registro do receptor com <c12/>.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>O que conta como evidência.</b> Um resultado só conta para uma capacidade quando traz os campos que o seu tipo de cenário grava; um rótulo de tipo de cenário, sozinho, não conta para nada. Tipos de cenário desconhecidos, um resultado que discorda do seu cenário irmão, hashes não hexadecimais e contagens de receiver-trust malformadas são listados como não usados, com o motivo. O relatório faz o escape das células de Markdown e não entra em pânico com um hash não ASCII. <c1/> e <c2/> recebem textos, não caminhos.

# text
seg-6b46de1164d8 = Exportação para test bench.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> tem o intervalo verificado (<c2/>); o arquivo de waypoints verifica cada intervalo e o comando diz por quê quando um é omitido; a documentação informa que o rumo de <c3/> é a guinada do corpo e não o curso, os campos de preenchimento de <c4/> e a própria variação de altura do cenário. <c5/> e <c6/> estão no texto de uso.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> expõe o histórico do estado verdadeiro do perfil de condução de <c2/> (a mesma sequência de passos que a verdade do próprio tipo de cenário usa), e <c3/> ganha campos de data e hora NMEA.

# text
seg-fbfc1a59e99b = Validação do mapa de interferência

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>A semântica de decodificação e a geometria do mapa de interferência são verificadas contra implementações independentes em entradas sintéticas.</b> Os significados dos códigos NIC e NACp contra a decodificação do pyModeS de quadros ADS-B sintéticos, os valores de não disponível do AIS contra a decodificação do pyais de sentenças AIVDM sintéticas, a atribuição de células da grade contra o shapely, o comprimento de rota por estado de célula contra o shapely e o GeographicLib, e o mascaramento de áreas interiores contra o shapely e o pyproj, cada um com uma tolerância fixada antes da primeira comparação (<c1/>). Isso valida como os códigos e os valores de campo são lidos e a geometria, não que uma célula sinalizada seja interferência. O leitor de polígonos de terra agora fecha um anel que não repete o seu primeiro vértice, que antes era lido sem a sua última aresta. A documentação declara os limiares de baixa precisão de NACp e NIC como o limite que cada código representa (NACp { "6" } é um limite de EPU de { "556" } m, NIC { "5" } um limite de contenção de { "1" } NM).

# text
seg-cf4ffdbba1a6 = Adicionado (validação dos formatos de telemetria e dos pacotes de evidências)

# text
# c1: docs/EVIDENCE-PACKS.md
# c2: cryptography
# c3: opentelemetry-proto
# c4: docs/EVIDENCE-PACKS.md
# c5: VerifyReport
# c6: signature_valid
# c7: scripts/gen_ed25519_rfc8032_ref.py
# c8: scripts/gen_evidence_pack_ref.py
# c9: scripts/evidence_verify_cleanroom.py
# c10: scripts/gen_telemetry_formats_ref.py
# c11: evidence_crypto_reference
# c12: evidence_pack_reference
# c13: telemetry_formats_reference
seg-ad6730e0e891 = <b>Verificações externas da criptografia dos pacotes de evidências, do verificador de pacotes e dos formatos de transmissão da telemetria.</b> Os vetores de teste Ed25519 da RFC { "8032" } seção { "7.1" } ({ "1" }, { "2" }, { "3" } e { "1024" }) e os exemplos de SHA-256 da FIPS 180-4 passam pelas próprias funções de assinatura, verificação e hash do pacote, com igualdade exata. Um verificador escrito em Python apenas a partir da seção normativa de <c1/> (hashlib e <c2/>) concorda com o verificador em Rust em { "71" } pacotes íntegros e adulterados: veredito, conjunto de falhas, veredito de assinatura e ambas as cabeças de cadeia. A nossa exposição Prometheus é lida pelo analisador do cliente Python oficial e o nosso JSON OTLP pela mensagem oficial <c3/>, de forma estrita, e ambos concordam com o estado a partir do qual foram feitos. CEF e LEEF não têm um validador aberto independente e permanecem modelados. <c4/> ganhou o formato normativo do pacote e o procedimento de verificação a partir dos quais o verificador clean-room foi escrito; <c5/> ganhou <c6/>. Referências independentes e fixtures: <c7/>, <c8/> com <c9/>, <c10/>; testes <c11/>, <c12/> e <c13/>. O CI não precisa de Python.

# text
seg-20d1b02bfda4 = Adicionado (validação dos eventos CEF)

# text
seg-8c464e43e43d = Os eventos CEF da telemetria são relidos corretamente por dois analisadores independentes de código aberto.

# text
# c1: pycef
# c2: logstash-codec-cef
# c3: =
# c4: pycef
# c5: tests/cef_reference.rs
# c6: tests/fixtures/cef/
# c7: scripts/gen_cef_ref.py
# c8: scripts/gen_cef_logstash_ref.py
# c9: cfp1
# c10: cfp2
# c11: cn1
# c12: cn2
seg-a6321d13b0ab = <c1/> { "1.11" } e o codec CEF do Logstash (<c2/> { "6.2.7" } no Logstash { "8.15.3" }) analisam { "157" } linhas CEF (cada mudança de faixa e cada época do fluxo de telemetria confirmado no repositório, mais texto adversarial contendo <c3/>, barras invertidas, pipes, quebras de linha, tabulações e texto multibyte) e recuperam todos os campos do cabeçalho, a severidade, o conjunto exato de chaves de extensão e todos os valores exatamente. O codec do Logstash também lê quatro linhas cujo texto de cabeçalho exige escape, o que <c4/> não consegue. O limiar foi registrado antes de qualquer um dos analisadores ser executado (<c5/>); fixtures em <c6/>, scripts de referência independente <c7/> e <c8/>; o CI não precisa de Python nem de Logstash. O LEEF não tem um analisador aberto mantido e permanece modelado. Os eventos CEF agora trazem a pontuação de confiança e o deslocamento de época nos campos personalizados de ponto flutuante do dicionário CEF (<c9/>, <c10/>) em vez dos campos inteiros <c11/> e <c12/>, que não serviam para nenhum dos dois valores; o CEF é novo nesta versão, de modo que nada do que foi distribuído muda.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP: <c1/> aceita o registro como <c2/> ou <c3/>; a entrada da ferramenta é limitada a { "4" } MiB.

# text
seg-8999974aa1fa = O gráfico de jamming também usa as cores da paleta.

# text
# c1: src/jamming.rs
# c2: *.chart.svg
# c3: jamming
# c4: maritime-strait-jamming
# c5: jamming
# c6: src/palette.rs
# c7: tests/palette_sync.rs
# c8: jamming-demo
# c9: maritime-strait-jamming
# c10: font-family
# c11: web/studio/recorded/
seg-8c8ff384dbf6 = <c1/> era o único módulo que a revisão da paleta do Observatory deixou com cores próprias enquanto o trabalho do Q do interferidor era integrado; o seu <c2/> (os cenários <c3/>, <c4/> e outros dos tipos de cenário <c5/>) agora lê <c6/>, e a lista de permissões em <c7/> está vazia. Apenas cores e fonte: os gráficos <c8/> e <c9/> são iguais às suas renderizações gravadas anteriormente depois que a cor, <c10/> e o rodapé de versão são normalizados. Nenhum valor plotado mudou. As cópias gravadas do Studio em <c11/> foram regravadas nas reportações de { "0.33.0" } e { "0.34.0" } (apenas o carimbo de versão): elas ainda trazem a pintura antiga do gráfico de jamming e receberão a pintura da paleta na próxima reportação.

# text
# c1: flicker_floor
# c2: clock-ensemble
# c3: consistent = false
# c4: flicker_floor
# c5: integrity
# c6: clock-ensemble
# c7: filter_health
# c8: holdover_s
# c9: timing_p95_ns
# c10: scenarios/orbit-gnss-challenged.toml
# c11: fom.integrity
# c12: filter_health
# c13: filter_health.consistent
# c14: true
# c15: false
seg-a059d10c5330 = <b>O limite de 3 sigmas do conjunto de relógios agora cobre o piso de flicker, e a verificação de saúde do filtro o enxerga.</b> Com um <c1/>, o relógio verdadeiro trazia FM de flicker, mas o filtro de dois estados que fornece o limite de integridade não, de modo que a cobertura de 3 sigmas do cenário <c2/> distribuído era { "0.41" } (clássico) e { "0.33" } (quântico), e a verificação de NIS/NEES, que extraía a sua própria verdade do modelo do filtro, informava valores idênticos com e sem o piso. O limite agora é a variância de dois estados mais a variância exata da fase de flicker acumulada desde a última sincronização, calculada a partir do mesmo banco que o relógio verdadeiro usa; a verificação de NIS/NEES extrai a sua verdade do modelo estendido com esse banco e executa o filtro estendido correspondente (e o filtro de dois estados contra uma verdade com flicker informa <c3/>). Mudança de saída, apenas para relógios com um <c4/> diferente de zero: <c5/> em <c6/> passa de { "0.40866" } / { "0.33026" } para { "0.99970" } / { "1.0" } (clássico / quântico) e o NIS/NEES de <c7/> agora inclui o flicker; o erro de temporização, <c8/> e <c9/> permanecem inalterados, e cenários sem piso são idênticos byte a byte. <c10/> (tipo de cenário orbit, semente { "7" }, pisos { "1e-16" } / { "2e-11" }) também muda: <c11/> clássico de { "0.7734" } para { "1.0" } e quântico de { "0.9796" } para { "1.0" }, e o NIS/NEES de <c12/> e as suas faixas mudam. O seu <c13/> quântico passa de <c14/> para <c15/>: um evento de amostragem do conjunto de flicker de 16 sementes por 60 passos (NIS { "0.8815" } contra uma faixa de [{ "0.9125" }, { "1.0914" }]), não um defeito. A faixa é de { "95" } %, de modo que cerca de { "5" } % das sementes sinalizam um filtro correspondente por construção ({ "40" } sementes novas deste cenário: { "1" } quântica e { "2" } clássicas sinalizadas); com { "64" } por { "200" } a mesma semente fica dentro da faixa para ambos os relógios (NIS { "0.990" } e { "1.001" }). Acompanhamento conhecido: o tipo de cenário fusion tem a mesma lacuna (integridade clássica { "0.80" } com um piso); o tipo de cenário hybrid permanece acima de { "0.99" }.

# text
seg-c7308350b6d4 = <b>Entrada do servidor MCP reforçada.</b> As ferramentas de cenário do servidor MCP agora aceitam apenas conteúdo inline e recusam campos de fonte em arquivo; o tamanho da entrada é limitado. Aviso consultivo: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-065c4431197e = Replay de laboratório: um motor de rastreamento, monitores de detecção e um executor de campanhas para gravações IQ de GNSS, com os projetos de malha, os estimadores de C/N0 e as pontuações que os acompanham. Classe de evidência: tudo o que segue é <b>MODELLED</b> ou verificado quanto à consistência interna contra formas fechadas e simulação com semente; nada disso acrescenta uma linha VALIDATED, e o registro de verificação permanece inalterado ({ "251" } linhas: { "124" } validadas, { "123" } modeladas, { "4" } de parceiro). É uma camada de análise por software: nada aqui sintetiza uma forma de onda de interferidor ou de spoofer, e nada transmite.

# text
seg-912ecb44cee4 = Replay de laboratório: condições de teste, executor de campanhas e pontuação ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> reproduz gravações × cadeias de front-end × projetos de malha (<c2/>) e avalia cada célula contra um arquivo de condições de teste por gravação (<c3/>, TOML ou JSON). Esse arquivo declara o que um laboratório sabe sobre a gravação: os satélites esperados e, para cada evento, o seu rótulo de tipo, o início e o fim, os satélites afetados e o J/S declarado ou o perfil de potência do interferidor. São apenas metadados. As pontuações por satélite, para a execução inteira e por evento, são:

# text
seg-180447aaf31e = disponibilidade, tempo até a perda de travamento e o J/S declarado no momento da perda;

# text
seg-1ababddb0d87 = tempo de reaquisição, a partir do fim do evento e a partir da perda;

# text
seg-a6468323c971 = degradação medida de C/N0 por faixa de J/S declarado;

# text
seg-4cb6f510e159 = episódios de falso travamento por hora travada (o indicador do rastreador, ou o Doppler contra um arquivo auxiliar de verdade de referência);

# text
seg-97c6243bac2e = jitter dos discriminadores de PLL e DLL.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = Ao lado de cada curva de degradação medida, uma referência analítica de separação espectral (<c1/> com o <c2/> do tipo) é desenhada e rotulada MODELLED onde quer que apareça.

# text
# c1: data_class
# c2: synthetic
# c3: client-confidential
# c4: run.epochs
# c5: kshana.track-epoch/1
# c6: cell_key
# c7: report::digest
# c8: scorecard.csv
# c9: .json
# c10: report.html
# c11: DIGEST
# c12: [scoring.bars]
seg-eb5c38197dab = As células são executadas em paralelo pela máquina de estados de travamento da sessão de rastreamento, e cada uma é gravada de forma atômica sob uma chave de hash de conteúdo. A chave cobre o SHA-256 da gravação, os hashes de condição, front-end, projeto, execução e pontuação, o <c1/> exigido (<c2/> | <c3/>) e a versão do motor. Com <c4/> definido, o fluxo <c5/> e os eventos de travamento de cada célula também são mantidos, nomeados pela chave da célula e incluídos no hash da célula. <c6/> e <c7/> são públicos, de modo que um consumidor pode rederivar cada chave e o digest. Uma reexecução, portanto, pula as células concluídas, e as saídas nunca dependem do número de workers. A execução grava <c8/>/<c9/>, um <c10/> autocontido e um <c11/>. Os limiares de sucesso ou falha (<c12/>, substituíveis por gravação) são aplicados quando o relatório é montado.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (padrão <c2/>, parte do hash de pontuação) escolhe o C/N0 por trás do C/N0 informado e da curva de degradação. Ambas as estimativas são sempre avaliadas e informadas (medianas da execução inteira e da linha de base, e por faixa de J/S), e a célula e o scorecard registram o estimador. O NWPR lê baixo em cerca de { "8" } dB × Bn·T sob o jitter da própria malha; o M2M4 não.

# text
seg-baf1a2422a66 = Também novo:

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> reconstrói os scorecards, o relatório e o digest a partir das células;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> verifica um arquivo de condições de teste contra o seu esquema;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> importa as anotações <c2/> de uma gravação SigMF como eventos;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = O Python ganha <c1/>, <c2/> e <c3/>;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> ganha <c2/>, que é incremental e retomável dentro do orçamento de amostras por chamada, com todos os arquivos confinados ao diretório de trabalho, e <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Testes: <c1/> executa uma campanha sintética de { "3" } gravações × { "2" } front-ends × { "2" } projetos. As suas cenas trazem perfis de C/N0 declarados, e ele cobre:

# text
seg-3f2fbdecb101 = cada métrica verificada contra a verdade injetada;

# text
seg-e103a30260db = a retomada após uma execução parcial com um único worker e uma célula corrompida, idêntica byte a byte a uma execução ininterrupta com quatro workers;

# text
seg-79164d8b0b22 = arquivos de épocas por célula;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = uma regressão de reaquisição de três satélites de { "20" } s: com <c1/> ligado, todos os canais voltam em até { "2" } s depois de uma lacuna de { "2" } s; o resultado com <c2/> desligado é fixado;

# text
seg-1deb4ab83054 = limiares rejulgados sem reexecução;

# text
seg-351f9cdcbcd6 = a CLI;

# text
seg-2c35af369a36 = verificações ignoradas de vazão e memória em modo release, incluindo uma gravação de { "4" } GB ({ "5.45" }× o tempo real, memória de pico { "2" } MB acima do RSS inicial; medições em uma única máquina, não limiares).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Apenas software: nada transmite, e nenhuma forma de onda de interferência ou de spoofing é sintetizada. Notas de projeto e de como foi construído: <c1/>.

# text
seg-c9871226c82f = Motor de rastreamento para replay de laboratório ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Arquivos de projeto de malha</em>: TOML <c1/> (<c2/>; analisador <c3/>). Um ou mais projetos nomeados definem todos os campos da malha:

# text
seg-0437148324ca = tipo de portadora (PLL, FLL ou PLL assistido por FLL), ordens e larguras de banda;

# text
seg-4e722960f8c6 = discriminadores de PLL/FLL/DLL e auxílio de portadora;

# text
seg-44976e3ad4e7 = espaçamento e integração;

# text
seg-5c06173036d6 = limiares de travamento e janelas de C/N0, e sincronismo de bit;

# text
seg-405e693dd757 = a máquina de estados de travamento;

# text
# c1: "auto"
seg-e6908584e2f4 = a aquisição de transferência (<c1/> ou explícita).

# text
# c1: extends
seg-8844cc963705 = Os projetos podem estender uns aos outros com <c1/>. Chaves desconhecidas são recusadas. Cada projeto resolvido tem um hash SHA-256 sobre uma forma JSON canônica (chaves ordenadas em todos os níveis, formatação numérica fixa), de modo que o hash não depende da ordem dos campos; toda saída o registra. Superfícies:

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, em que as opções explícitas substituem o projeto e são registradas;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, que executa todos os projetos do arquivo;

# text
# c1: iq_track(design=, design_name=, reacquire=)
# c2: iq_loop_designs
seg-6815ec9b33c6 = Python <c1/>, <c2/>;

# text
# c1: iq_track
# c2: design
# c3: design_name
seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

# text
# c1: EpochOutput.cn0_m2m4_dbhz
# c2: cn0_m2m4_dbhz
# c3: cn0_beaulieu_dbhz
seg-70d3b295bea0 = <em>C/N0 M2M4</em> (<c1/>, a coluna <c2/> de track-epoch depois de <c3/>; dicts de época em Python). A estimativa dos momentos de segunda e quarta ordem sobre as mesmas janelas do NWPR, apenas a partir da potência prompt: o NWPR lê baixo sob o jitter de portadora da própria malha (cerca de { "8" } dB × Bn_PLL·T) e o M2M4 não. No GPS L2C CM ({ "20" } ms, nominal { "40" } dB-Hz, PLL de { "1" } a { "10" } Hz), ele lê { "39.93" } dB-Hz em todas as larguras de banda, enquanto o NWPR cai de { "39.55" } para { "38.22" }; no L1 C/A a { "45" } dB-Hz, ele lê { "45.34" }. O NWPR e todas as outras saídas permanecem inalterados (um pin bit a bit). O registro binário continua com { "184" } bytes (o valor usa o float reservado e o bit de flag { "6" }).

# text
seg-c02d07475717 = Taps extras de correlador (multicorrelador / SQM).

# text
# c1: [design.integration] extra_taps_chips = [..]
# c2: EpochOutput.extra
# c3: (offset, value)
# c4: kshana.track-epoch/1
# c5: 184 + 16 × taps
# c6: extra_taps_chips
# c7: --extra-taps
# c8: extra_taps
# c9: extra_taps_chips
# c10: iq_track
seg-70fcdc903413 = <c1/> (deslocamentos em chips a partir do prompt, positivos para adiantado; no máximo { "16" }, cada um dentro de ±{ "2" }) correlaciona réplicas extras junto com E/P/L e as devolve como <c2/> (<c3/> na ordem do projeto). As malhas nunca as usam. A chave é omitida do JSON canônico quando vazia, de modo que o hash do projeto padrão e toda saída sem taps permanecem inalterados (<c4/> continua; o CSV/JSONL/binário sem taps é idêntico bit a bit). Com taps: colunas de CSV/JSONL e um registro binário de <c5/> bytes cujo cabeçalho traz <c6/>, de modo que um leitor antigo recusa o arquivo em vez de interpretá-lo mal. <c7/> (CLI), <c8/> (Python) e <c9/> (MCP <c10/>). Os projetos de uma execução devem concordar quanto aos taps.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Canais paralelos</em> (<c1/> / <c2/>; Rust <c3/>). Os canais de cada bloco são executados em até N threads (<c4/>; <c5/> continua serial). A correlação e a máquina de estados de travamento de um canal tocam apenas esse canal; as suas épocas e eventos são armazenados em buffer e gravados nos destinos na ordem dos canais, de modo que a saída (CSV, JSONL, binário, eventos, resumo) é idêntica byte a byte à da execução serial para qualquer N. O padrão continua sendo { "1" } thread. Medido em uma gravação de 12 canais, { "4" } s, { "4.092" } MHz em { "4" } núcleos: { "19.5" } s em serial, { "11.5" } s com { "2" } threads, { "6.3" } s com { "4" } ({ "3.1" }×; a aquisição inicial é serial).

# text
# c1: kshana.acq-surface/1
# c2: iq::acq_surface
# c3: docs/design/ACQ-SURFACE.md
# c4: iq acquire --surface <path>
# c5: iq_acq_surface
# c6: iq_acquire
# c7: surface_out
# c8: acquire
# c9: acquire
seg-cf59911d458f = <em>Exportação da superfície de aquisição</em> (<c1/>; <c2/>, <c3/>). <c4/> (um PRN; CSV, JSON ou binário), <c5/> em Python e <c7/> do <c6/> do MCP gravam toda a superfície de potência de correlação Doppler × fase do código que a busca calcula (as suas células são as de <c8/>, bit a bit) com o pico e dois refinamentos finos do Doppler: uma estimativa parabólica e uma busca fina de 1/16 de bin (≈{ "5" } Hz com { "4" } ms coerentes, contra bins de { "167" } Hz). O próprio <c9/> e todos os padrões permanecem inalterados.

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Saída de épocas em fluxo</em> (<c1/>; <c2/>). Cada atualização da malha traz:

# text
seg-ff549f07ce78 = os correladores early/prompt/late;

# text
seg-00457c1bb059 = as três saídas dos discriminadores;

# text
seg-b17d335f6cac = os estados dos NCOs de PLL/FLL/DLL e a fase da portadora;

# text
seg-a3bf3f1034cd = o PLI e os indicadores de travamento;

# text
seg-7912a72da79b = ambas as estimativas de C/N0 e os bits;

# text
seg-8d105d656041 = o estado de travamento.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = Ela é gravada à medida que acontece, como CSV, JSON Lines ou uma forma binária versionada, com leitores em Rust (<c1/>) e Python (<c2/>).

# text
# c1: iq track
# c2: --epochs
# c3: --events
# c4: --summary
# c5: kshana.track-summary/1
# c6: iq sweep
# c7: --epochs
# c8: --events
# c9: iq_track
# c10: epochs_out
# c11: events_out
seg-aa081bfd9878 = <c1/> ganha <c2/>, <c3/> e <c4/> (<c5/>), e <c6/> ganha <c7/> e <c8/>. O <c9/> do MCP ganha <c10/>/<c11/> e monta a sua resposta a partir do resumo de memória limitada.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = O heap de uma execução não cresce mais com o comprimento da gravação: <c1/> o mede com um alocador contador ({ "6" }× o comprimento, o mesmo pico dentro de { "64" } KiB), com um controle mostrando que o caminho em memória cresce.

# text
seg-e3eff59db445 = A saída em fluxo é idêntica bit a bit ao replay em memória.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Máquina de estados de travamento</em> (<c1/>, <c2/>): captura inicial → travado → perdido → reaquisição → captura inicial, ou desativado quando uma perda dura mais que <c3/> (padrão { "30" } s). As buscas malsucedidas são repetidas a cada <c4/> ({ "0.1" } s), com espaçamento uniforme, de modo que o cronograma de novas tentativas acrescenta no máximo { "0.1" } s a um tempo de reaquisição medido. Um recuo progressivo opcional (<c5/> acima de <c6/>) vem desligado por padrão, e <c7/> é um limite opcional ({ "0" }, nenhum, por padrão). Uma interrupção de { "2" } s em três PRNs a { "4.092" } MS/s agora termina com todos os canais reaquiridos e travados. Sob um orçamento de 3 tentativas, todos os canais foram desativados em até { "0.2" } s após a perda.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Os limiares (<c1/>, <c2/>, a janela de Doppler da reaquisição) vêm do projeto. Cada transição é um evento com o seu motivo.

# text
seg-b1c551e48389 = A verificação de falso travamento procura o Doppler rastreado contra o seu alias de FLL/PLL de ±1/(2T). Ela detecta o falso travamento que o PR #38 mediu (−{ "2400" } Hz rastreado a { "500" } Hz de distância). Com a reaquisição ligada, o canal termina travado no Doppler injetado.

# text
seg-39409dd0b4bc = Uma lacuna de sinal de { "0.8" } s é declarada como perda e reaquirida em até { "0.3" } s após o retorno do sinal.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (e a coluna da tabela) é o estado após a última transição, de modo que um canal desativado depois da sua última atualização da malha aparece como <c2/>.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>Auxílio do FLL apenas durante a captura inicial</b> (<c1/>, o padrão; <c2/> mantém o comportamento anterior bit a bit). O FLL passa o controle ao PLL quando o PLI suavizado se mantém igual ou acima de <c3/> ({ "0.8" }) por <c4/> ({ "0.1" } s), e retorna ao ficar abaixo de <c5/> ({ "0.6" }). Mantido ligado, o caminho do FLL de { "10" } Hz perdia o travamento de fase abaixo de cerca de { "38" } dB-Hz em sinais limpos: a { "35" } dB-Hz a fração de travamento de fase era de { "10" }–{ "16" } %, com um erro de fase verdadeiro de { "38" }–{ "41" }°. Com o bloqueio, o padrão mantém { "100" } % a { "35" } dB-Hz com { "4.5" }°, igual a um PLL isolado. A captura inicial a partir de um erro de transferência de { "100" } Hz permanece inalterada. Evidências com limiares pré-registrados: <c6/>. <b>Por isso, as malhas padrão não são idênticas bit a bit às execuções anteriores do projeto padrão.</b> Use <c7/> para reproduzi-las. Limite conhecido: a { "35" } dB-Hz a transferência ocorre { "1.9" }–{ "2.6" } s após o início do rastreamento, e a { "33" } dB-Hz o FLL de { "10" } Hz mantém o PLI abaixo do limiar de transferência, de modo que a captura inicial nunca se completa.

# text
seg-1a911b958f8e = Novas chaves de projeto de malha e API, listadas:

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, com <c5/> alterado de um padrão de { "3" } para um limite opcional (padrão { "0" });

# text
# c1: LoopConfig.fll_assist
# c2: FllAssist
# c3: FllGate
# c4: LoopCore::set_fll_enabled
# c5: EpochOutput.fll_active
# c6: ChannelSummary.final_state
seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

# text
# c1: 33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80
seg-eecacf54975b = O hash do projeto é calculado sobre uma forma JSON canônica, e o hash do padrão embutido é <c1/> (fixado por um teste).

# text
seg-2405be1bc0c6 = Notas de compatibilidade de saída:

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = a tabela de <c1/> tem uma coluna <c2/> no final;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = o CSV de <c1/> tem uma coluna <c2/> no final, e o seu JSON tem <c3/> e <c4/>;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = o <c1/> do sweep agora é a média sobre todas as atualizações que têm uma estimativa NWPR (resumo de memória limitada), e não mais sobre a segunda metade da execução.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = A reaquisição fica <b>desligada no padrão embutido</b>, em que a máquina de estados apenas observa e as malhas funcionam bit a bit como funcionam sem ela. (As próprias malhas padrão mudaram, porém: veja o auxílio do FLL acima.) Ligue-a por projeto (<c1/>), com <c2/> ou com <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = Um <b>aviso de <c1/></b>: quando fs está a { "1e-6" } de um múltiplo da metade da taxa de chips (<c2/>), <c3/>/<c4/> (saída, <c5/>, JSON do sweep), a resposta <c6/> do MCP e o resultado <c7/> do Python avisam que o jitter e o viés da malha de código não são representativos. A causa raiz está documentada com limiares pré-registrados em <c8/>. Com exatamente { "2" } amostras por chip e espaçamento de 0.5 chip, a curva S do DLL é um único degrau e a malha oscila: ≈ { "0.09" } chip de erro de código RMS (≈ { "26" } m) a { "45" } dB-Hz, contra ≈ { "0.004" } chip a uma taxa incomensurável. O C/N0 NWPR cerca de { "2" } dB baixo a essa taxa tem a mesma causa. Com exatamente { "0" } Hz de Doppler de código e { "4" } amostras por chip, o código nunca cruza a zona morta de ±0.21 chip, de modo que um viés de fase de código de até cerca de { "0.2" } chip pode persistir sem aparecer no jitter (medido: o espaçamento de 0.5 chip dá { "2.0" }× o erro de código do controle, com uma média de +{ "0.011" } chip; o espaçamento de 0.25 chip dá +{ "0.125" } chip); o aviso cobre a taxa.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Limite conhecido: o projeto padrão não faz a transferência FLL→PLL abaixo de cerca de { "35" } dB-Hz</b> (um piso de captura inicial de ~{ "35" } dB-Hz; veja o auxílio do FLL acima e <c1/>).

# text
seg-43f02bc861be = Uma busca de falso travamento ou de reaquisição que não pode ser executada (uma taxa sem número inteiro de amostras por período de código) não interrompe mais o rastreamento.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Testes: <c1/>, <c2/>, <c3/>, <c4/> e a viagem de ida e volta do IQ no MCP.

# text
seg-60141bb08f64 = Perfis de C/N0 em cenas sintéticas ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> programa um C/N0 variável no tempo por satélite nas cenas do próprio Kshana, como deslocamentos em dB relativos ao C/N0 da cena. Formatos: degrau, rampa, linear por partes e desvanecimentos Rice com semente, semelhantes à cintilação, com um S4 e um tempo de decorrelação declarados. São aplicados por meio do gancho de canal da cena já existente (<c2/>, compondo-se com os efeitos de ionosfera, troposfera, cintilação e multipercurso), sem mudança no núcleo da cena. O <c3/> do arquivo auxiliar de verdade de referência acompanha o perfil.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Superfícies: <c1/> e <c2/>.

# text
seg-a242e4d9f071 = Para que serve: as malhas, os monitores e a pontuação de campanhas podem ser testados sob estresse contra uma verdade conhecida. Ele altera apenas a intensidade dos sinais legítimos.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Verificações (<c1/>). Limiares: intensidade média do desvanecimento dentro de { "5" } % de { "1" }, S4 dentro de { "8" } % do alvo (com S4 = { "0.3" }, { "0.7" } e { "1" }), correlação de intensidade acima de { "0.9" } a { "0.05" } τ e abaixo de { "0.05" } a { "5" } τ; verdade exatamente o C/N0 declarado mais o perfil; uma queda do C/N0 NWPR rastreado dentro de { "0.7" } dB de um degrau de { "6" } dB. Medido: S4 dentro de { "1.3" } % do alvo e uma queda rastreada de { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>Monitores de detecção no caminho IQ ({ "0.34.0" } "Replay de laboratório").</b> Novo módulo <c1/>, comando <c2/> e binding <c3/>. Eles observam uma gravação e informam séries temporais mais eventos sinalizados (horários de início, de alarme e de fim, pico, limiar). Apenas detectam e medem; nada aqui gera um sinal.

# text
seg-5b05b2a54fab = <b>Potência total / AGC</b>: potência por bloco e o ganho que um AGC ideal aplicaria; sinaliza subidas e quedas.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Espectro de pré-correlação</b>: PSD de Welch por bloco contra uma linha de base aprendida. O limiar de excesso vem de uma meta de falso alarme. Também curtose complexa e um detector de pulsos. O detector de pulsos conta as amostras acima de um limiar em cada bloco e levanta um evento quando a cauda superior binomial exata dessa contagem fica abaixo de <c1/> (padrão { "1e-4" } por bloco), e não quando um z-score passa de um limite: nas pequenas contagens esperadas de blocos curtos, uma única amostra já está vários sigmas acima.

# text
seg-7704ac807c38 = <b>C/N0 por canal</b>: dois detectores de mudança CUSUM unilaterais (queda e subida), alimentados com estimativas independentes (o passo é definido a partir da janela de C/N0 da malha).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM a partir dos correladores</b>: delta <c1/> e razão <c2/>, mais testes de assimetria a partir de correladores extras quando um canal os fornece.

# text
seg-a4006c2e8692 = <b>Série do indicador de travamento</b>: PLI e um indicador de travamento de frequência a partir de prompts sucessivos, como sinais brutos. As decisões de travamento e de perda de travamento ficam com a máquina de estados de travamento do motor de rastreamento.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Uma única passagem em fluxo (<c1/>) executa tudo, com um arquivo de configurações TOML/JSON (<c2/>); o executor de campanhas usa o mesmo ponto de entrada. Tudo MODELLED. Cada estatística é verificada contra a sua forma fechada por simulação com semente (<c3/>):

# text
seg-0ff96e4c5a20 = excedências de potência de bloco contra a cauda Gama;

# text
# c1: 2/√N
seg-97b559ea0897 = média da curtose { "2" } e dispersão <c1/>;

# text
# c1: e^{−t}
seg-2b941c702b7f = fração de pulsos <c1/>;

# text
seg-e8f068c41f0c = comprimentos de execução do CUSUM contra a aproximação de Siegmund (medidos { "330" } e { "8.46" } amostras contra { "338" } e { "8.34" });

# text
seg-e2cd6a55e49b = o indicador de travamento de fase contra a média da fase de Rice;

# text
seg-06291b1c6274 = em um sinal C/A rastreado, as dispersões do delta e da razão do SQM ficam cerca de { "6" } % das formas fechadas de primeira ordem (medido { "5.97" } %; limiar do teste { "12" } %).

# text
seg-12deb36a2e3a = A fórmula de falso alarme do excesso espectral é uma aproximação; a taxa medida foi { "1.3" }× a da fórmula. De ponta a ponta, os monitores sinalizam:

# text
seg-b002c66c7881 = um degrau de C/N0 de { "6" } dB (instante da mudança dentro de uma estimativa);

# text
seg-2e828d106393 = um caminho refletido que surge no meio da gravação (teste de razão);

# text
seg-68063f036e2c = uma interrupção do sinal (o PLI cai de { "0.999" } para −{ "0.3" } e o FLI de { "0.93" } para { "0.03" } durante ela);

# text
seg-0cd95f0197ec = um tom de banda estreita e amostras esparsas de alta amplitude (testes espectral, de pulso e de curtose). Essas são entradas genéricas de teste de DSP, não modelos de interferência.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> transmitem em fluxo pela nova sessão (veja Adicionado).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> mantém as suas colunas de { "0.32" }, mas agora é transmitido em fluxo, de modo que as linhas de vários canais se intercalam em ordem de tempo em vez de agrupadas por canal. <c2/> mantém o seu formato de { "0.32" } e ainda guarda todas as épocas em memória: use <c3/> para gravações longas.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> mede o jitter sobre as atualizações da segunda metade da duração da execução (antes, a segunda metade da contagem de atualizações), e o seu CSV/JSON ganha uma coluna <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = A tabela de rastreamento ganha uma coluna <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = O texto de uso não afirma mais que <c1/> aceita as opções de front-end; apenas <c2/> as aplica.

# text
# c1: iq_track
# c2: acq_noncoherent
# c3: doppler_max
# c4: None
# c5: carrier_phase_cycles
# c6: bit_edge
# c7: bit
# c8: state
# c9: design
# c10: events
seg-cf28fa21786a = Em <c1/> do Python, <c2/> e <c3/> agora têm <c4/> como padrão (os valores do projeto, { "1" } e { "5000" } Hz no projeto embutido). As suas épocas ganham os correladores early/late, <c5/>, <c6/>, <c7/> e <c8/>, e o resultado ganha <c9/> e <c10/>.

# text
# c1: 2 / (3 · N · T_code)
# c2: 1 / (3 · N · T_code)
# c3: 1 / (4 T_track)
# c4: N = 1
# c5: 0.2 / T_track
# c6: kshana::iq::acq::default_step_hz
# c7: N = 4
# c8: "auto"
# c9: doppler_step_hz
# c10: --doppler-step
# c11: iq acquire
# c12: --summary
# c13: resolved
seg-666b9e3faa5d = <b>O passo de aquisição padrão não entrega mais ao rastreamento do Galileo E1 um resíduo que o FLL não consegue capturar.</b> O passo <c1/> deixa até <c2/> de erro de Doppler na transferência, mas o FLL padrão de dois quadrantes só captura <c3/>. Para todo código de { "4" } ms ou mais (<c4/>), incluindo Galileo E1-B e E1-C, o resíduo ({ "83.3" } Hz a { "4" } ms) ficava fora da captura de { "62.5" } Hz e o rastreamento caía em falso travamento a +{ "125" } Hz, com um indicador de travamento de fase de { "0.97" } que o escondia. O passo padrão agora também é limitado a <c5/> (<c6/>), { "0.8" } da faixa de captura, de modo que a transferência permanece dentro dela mesmo quando o bin vizinho vence. ({ "0.4" } foi tentado primeiro: causou falso travamento em { "1" } execução de { "42" } no E1-B, e uma busca coerente de { "1" } ms do GPS L1 C/A escolheu um bin a { "350" } Hz de distância e travou a +{ "500" } Hz; { "0.25" } e { "0.2" } não tiveram nenhum nas mesmas execuções.) Custo: o Galileo E1-B/E1-C passa de bins de { "166.7" } Hz para { "50" } Hz, com { "201" } bins sobre ±{ "5" } kHz em vez de { "61" }; os códigos de { "1" } ms ({ "166.7" } Hz, <c7/>) permanecem inalterados. <c8/> em um projeto de malha significa isto; um <c9/> ou <c10/> explícito é usado como escrito, e <c11/> (sem transferência para rastreamento) mantém o passo de livro didático. O cabeçalho da época e <c12/> agora registram o passo e as larguras de banda das malhas resolvidos para cada canal (<c13/>). O hash do projeto padrão permanece inalterado. Mudança de saída: as detecções em códigos de { "4" } ms ou mais podem cair em bins de Doppler diferentes.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>O GPS L2C CM (atualização da malha de { "20" } ms) mantém o travamento com o projeto padrão.</b> O PLL padrão de { "15" } Hz e o FLL de { "10" } Hz têm <c1/> de { "0.3" } e { "0.2" } com T = { "20" } ms, e a malha perdia o travamento mesmo partindo de um início perfeito (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). A nova chave de projeto <c2/> (padrão { "0.1" }) limita as larguras de banda de ruído do PLL e do FLL a <c3/> quando o tempo de atualização da malha é maior que { "4" } ms (<c4/>): { "5" } Hz e { "5" } Hz com { "20" } ms, { "10" } Hz e { "10" } Hz com os { "10" } ms do B1C do BeiDou; os códigos de { "1" } ms e { "4" } ms mantêm { "15" } e { "10" } Hz. Aplica-se também a larguras de banda explícitas; <c5/> a desliga. A chave é omitida da forma canônica no seu valor padrão, de modo que o hash padrão permanece inalterado; um projeto que defina qualquer outro valor tem um hash diferente. A { "45" } dB-Hz, o L2C CM agora dá PLI { "0.996" }, erro de Doppler { "0.00" } Hz e M2M4 { "42.71" } dB-Hz. Item aberto conhecido: o C/N0 NWPR lê { "1.76" } dB abaixo ali (e { "2.45" } dB abaixo no B1C com { "10" } ms), de modo que o T5 da matriz para o L2C continua um achado ignorado.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> regenerado: a figura confirmada no repositório estava desatualizada em relação ao seu próprio cenário (uma mudança de dados, não um redesenho).</b> O gráfico foi desenhado em 2026-06-02 a partir de <c2/>; dois dias depois, o 67fed19e definiu os pisos de FM de flicker nesse cenário (quântico <c3/>, CSAC <c4/>) e a figura nunca foi redesenhada. Ela mostrava a execução anterior aos pisos: eixo y de { "0" } a { "47" } ns, p95 de interrupção por execução do CSAC de { "10.5" } a { "47.6" } ns (média { "25.2" } ns), holdover clássico de { "4050" } s em média. O cenário como distribuído (e como o tutorial e o resumo da CLI já informam) dá eixo y de { "0" } a { "407" } ns, p95 por execução do CSAC de { "40.8" } a { "374.0" } ns (média { "167.0" } ns), holdover clássico de { "844" } s [{ "220" } a { "2130" } s]; a linha de especificação de { "20" } ns fica nos mesmos { "20" } ns em um eixo cerca de nove vezes mais alto. O motor permanece inalterado: o motor de hoje sobre o arquivo de cenário de junho reproduz exatamente o eixo da figura antiga. A figura não é referenciada no README nem na documentação.

# text
seg-75636f9419b2 = Limitações conhecidas

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>O C/N0 NWPR lê baixo com C/N0·T por prompt alto, e o BOC({ "1,1" }) a { "5" } MS/s perde cerca de { "1" } dB.</b> O NWPR não tem viés em prompts ideais, mas o próprio jitter do PLL da malha custa cerca de { "8" } dB × Bn·T ajustados (uma cena, quatro pontos: −0.24/−0.44/−0.77/−{ "1.58" } dB com 1/2.5/5/10 Hz e { "20" } ms; cerca de −{ "1" } dB com o <c1/> padrão); o M2M4 é insensível. Os dados do B1C do BeiDou a { "5" } MS/s também perdem cerca de { "1" } dB de potência de prompt por limitação de banda (use { "10" } MS/s ou mais). Nenhum dos dois é um defeito do estimador; as linhas T5 da matriz de sinais para o GPS L2C e o B1C do BeiDou continuam achados ignorados com essas causas.

# text
seg-ff195e575023 = <b>Texto de gráficos e adoção de gráficos no Studio reforçados.</b> O texto que um cenário leva a um gráfico gerado agora passa por escape de forma consistente, por uma única rotina compartilhada, e o Studio adota apenas a marcação de desenho de um gráfico. Os parâmetros de endereço do Studio, as buscas indexadas por tipo de cenário e as obtenções de cenários ficam restritos a valores conhecidos. Gráficos incluídos, resultados gravados e números publicados permanecem inalterados. Recomenda-se atualizar para quem abre arquivos de cenário de fontes não confiáveis no Studio ou incorpora gráficos gerados em páginas web. Aviso consultivo: <a1>GHSA-h25h-cg9f-v2cg</a1>.

# text
# c1: iq::scene
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
# c5: sdr
# c6: iq::acq
# c7: iq::track
# c8: docs/POSITIONING.md
# c9: docs/SPECTRUM.md
seg-7f566858d036 = <b>O escopo de interferência e spoofing da camada IQ, declarado com exatidão.</b> As entradas de { "0.31.0" } e { "0.32.0" } abaixo dizem que a camada IQ acrescenta "nenhuma síntese de forma de onda de interferência ou de spoofing". Isso vale para a própria camada IQ (<c1/> gera apenas sinais GNSS legítimos), mas foi lido como uma afirmação sobre o motor inteiro, e não é: desde { "0.29.0" } a seção <c3/> do tipo de cenário <c2/> grava um snapshot SigMF do seu modelo analítico com os interferidores configurados nele (interferidores semelhantes a ruído bin a bin, tons e chirps como formas de onda), e <c4/> soma em memória um sinal autêntico e uma réplica de spoofer para testar a captura da malha (o composto nunca é gravado). O motor também traz um receptor GNSS por software desde { "0.20.0" } (<c5/>: aquisição e rastreamento; desde { "0.31.0" } também <c6/> e <c7/>). Nada no Kshana transmite ou aciona hardware de rádio. A linha de status do README, <c8/>, <c9/> e as notas de projeto do IQ agora dizem isso; as entradas já publicadas permanecem como foram publicadas. Nenhum comportamento muda.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Limitação conhecida: amostragem comensurável.</b> Com uma taxa de amostragem que é um múltiplo inteiro ou semi-inteiro da taxa de chips, as amostras caem nas mesmas fases de chip em todos os chips, e o discriminador de código vira uma escada. Em um sinal sintético GPS L1 C/A a { "45" } dB-Hz com espaçamento de 0.5 chip, { "2.046" } MHz ({ "2" } amostras/chip) dá ≈ { "0.09" } chip (≈ { "26" } m) de erro de código RMS e um viés de −{ "0.09" } chip, contra ≈ { "0.003" } chip a uma taxa incomensurável. O C/N0 NWPR lê ≈ { "2.4" } dB abaixo ali. A { "4.092" } MHz depende do espaçamento e do Doppler de código. Com { "0.5" } chip é inofensivo a { "1500" } Hz de Doppler, mas { "2" }× com um viés de { "0.011" } chip a { "0" } Hz, e com { "0.25" } ou { "0.1" } chip é { "8" }–{ "10" }× o erro de código. O rastreamento da portadora não é afetado. <c1/> traz as medições.

# text
seg-3a30bd47380a = Camada IQ de GNSS no servidor MCP (Fase B.1).

# text
# c1: kshana-mcp
# c2: kshana iq
# c3: iq_signals
# c4: iq_info
# c5: iq_scene
# c6: iq_acquire
# c7: iq_track
# c8: iq_frontend
# c9: KSHANA_MCP_IQ_DIR
# c10: overwrite
# c11: KSHANA_MCP_IQ_MAX_SAMPLES
# c12: kshana::iq::cli::execute
# c13: iq::cli::build_code
# c14: iq::cli::signal_names
# c15: server.json
# c16: mcp/kshana-mcp/tests/iq_round_trip.rs
seg-ef81eca03bca = <c1/> ganha seis ferramentas que acionam a camada <c2/> a partir de um agente: <c3/> (os nomes de sinais aceitos e a configuração do IQ), <c4/> (descrever uma gravação), <c5/> (gerar uma cena de perfil declarado ou de efemérides de broadcast, com o canal opcional em nível de sinal), <c6/> (aquisição por FFT, opcionalmente atrás de estágios de front-end), <c7/> (adquirir e depois o banco DLL/PLL/FLL) e <c8/> (passa-banda, notch, blanking, excisão, AGC, quantizador). As amostras IQ nunca cruzam o protocolo: cada ferramenta recebe caminhos de arquivo dentro de um único diretório de trabalho definido por <c9/> (não definido, deixa desligadas as ferramentas de arquivo IQ sem afetar nenhuma outra), recusa caminhos que resolvam para fora dele e saídas que já existem, a menos que <c10/> esteja definido, impõe um orçamento de amostras por chamada (<c11/>, padrão { "50 000 000" }) antes de qualquer trabalho, recusa argumentos desconhecidos e responde com um resumo JSON compacto (detecções, C/N0, estado de travamento e cada arquivo gravado com a sua contagem de bytes). A saída por época vai apenas para arquivos que o chamador nomeia. As ferramentas executam o mesmo caminho de código da CLI por meio de uma nova interface pública, <c12/>, que retorna a mensagem da CLI em vez de imprimi-la (stdout é o canal JSON-RPC do MCP); <c13/> e <c14/> agora também são públicos. Apenas software e aditivo: a camada IQ não acrescenta síntese de interferência nem de spoofer, nada é transmitido em momento algum e não há novas dependências. <c15/> declara as duas variáveis de ambiente. Os testes de ida e volta em <c16/> geram uma cena curta de dois satélites e verificam a aquisição contra o próprio arquivo auxiliar de verdade de referência da cena, o travamento do rastreamento e o C/N0, o front-end, a saída SigMF, o orçamento, o confinamento de caminhos e o estado desabilitado.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>A camada IQ de GNSS no registro de validação.</b> Uma verificação cruzada pré-registrada contra o gps-sdr-sim (um gerador independente de banda base GPS L1 C/A, MIT, commit 28ca29a6) agora faz parte do conjunto de testes sempre ativo (<c1/>). A sua saída de referência confirmada no repositório (<c2/>: { "20" } ms do próprio I/Q de 8 bits do gps-sdr-sim, a sua listagem de canais e o estado de canal por trás dela, obtido de um harness vinculado à mesma compilação) é regenerada por <c3/>. Nada em tempo de teste precisa de rede nem da ferramenta externa. Duas linhas são acrescentadas ao registro ({ "251" } linhas: { "124" } validadas, { "123" } modeladas, { "4" } de parceiro):

# text
seg-21d005e2ef0e = <em>Geometria de sinal da cena IQ de GNSS contra um gerador independente de banda base</em>: <b>Validada</b>. A verdade da cena (conjunto visível, pseudodistância, fase do código, Doppler, ângulos de visada) para uma cena de efemérides de broadcast coincide com o estado de canal do gps-sdr-sim em todos os { "11" } canais: pior caso { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } grau, contra limiares de { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz e { "1e-4" } grau fixados antes da execução.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>Aquisição IQ de GNSS em amostras I/Q geradas de forma independente</em>: <b>Modelada, com um achado</b>. <c1/> encontra todos os satélites simulados nas amostras do gps-sdr-sim dentro dos limiares registrados (fase do código dentro de { "0.195" } chip, Doppler dentro de { "72" } Hz). Porém, o limiar registrado "nenhum outro PRN detectado" falha: na saída sem ruído do gps-sdr-sim, o limiar de ruído gaussiano é cruzado pela correlação cruzada dos outros satélites para todos os { "21" } PRNs ausentes. O teste estrito é mantido, ignorado com o achado, e um teste fixado o registra. Nenhum código do motor nem API pública muda. O I/Q das amostras não é comparado amostra a amostra: a tabela de senos inteira, os ganhos, a fase inicial zero da portadora e os campos LNAV truncados do gps-sdr-sim não são grandezas sobre as quais um receptor precise concordar. A comparação é feita nos observáveis que um receptor mede.

# text
# c1: iq track
# c2: ceil(4 ms / T_code)
# c3: T_code
# c4: 2 / (3 · N · T_code)
# c5: docs/design/evidence/iq-track-acq-default/
# c6: kshana iq track
# c7: kshana iq sweep
# c8: --acq-coherent
# c9: kshana.iq_track
# c10: acq_coherent=None
# c11: iq_track
# c12: acq_coherent=1
# c13: --acq-coherent 1
# c14: kshana iq acquire
# c15: --coherent
# c16: iq::acq::auto_coherent_periods
# c17: iq::acq::AUTO_COHERENT_S
# c18: tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did
seg-a2be63287ce4 = <b><c1/> faz a transferência a partir de uma aquisição de ≈{ "4" } ms por padrão (mudança de comportamento).</b> A aquisição que inicializa cada canal de rastreamento agora integra <c2/> períodos de código de forma coerente em vez de um, em que <c3/> é o período completo do código (primário vezes o comprimento secundário para um código em camadas, a unidade sobre a qual a aquisição integra). Os códigos sem camadas de { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) agora buscam { "4" } períodos ({ "4" } ms), de modo que o passo de Doppler padrão <c4/> é de ~{ "167" } Hz em vez de ~{ "667" } Hz. Todo código cujo período completo já é de { "4" } ms ou mais mantém { "1" } período: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) e os códigos em camadas GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q e E1-C ({ "10" } a { "100" } ms com os seus códigos de sobreposição), e GPS L2C. Assim, todo sinal integra pelo menos ~{ "4" } ms. Uma busca de um único período podia transferir um canal com até ~{ "333" } Hz de erro, fora da faixa de captura do FLL, e ele então rastreava um falso travamento a ~{ "500" } Hz de distância enquanto informava um rastreamento limpo. Em uma varredura com semente de { "180" } canais GPS L1 C/A (Doppler em ±{ "5" } kHz, { "38" } a { "47" } dB-Hz, metade com dados de navegação; <c5/>, reexecutável), os falsos travamentos caem de { "27" } de { "180" } para { "1" } de { "180" } e as aquisições perdidas de { "102" } para { "11" }, com ~{ "40" } ms a mais de busca por PRN no GPS L1 ({ "11" } → { "52" } ms). O único falso travamento residual está a { "38" } dB-Hz, a { "36" } Hz de distância. Todas as superfícies concordam: <c6/> e <c7/> (<c8/>), <c9/> do Python (<c10/> agora é automático; stub atualizado) e a ferramenta <c11/> do MCP. Os usuários que dependiam do padrão antigo podem passar <c12/> (<c13/>). O próprio padrão <c15/> de <c14/> continua { "1" }. Novos <c16/> e <c17/> públicos; teste de regressão <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Todo gráfico gerado agora segue o tema Observatory do site: os bytes de todos os gráficos mudam.</b> Esta é uma revisão deliberada das figuras publicadas, apenas de cores e fontes; nenhum valor plotado, coordenada ou rótulo mudou. O <c1/> de cada cenário (e, portanto, as exportações de gráficos do Studio e os gráficos de demonstração do README), o HTML do relatório de execução (<c2/>), a animação da linha do tempo (<c3/>), as páginas HTML de resultado de cenário e de estudo, o resumo de validação e as figuras e os diagramas da documentação usavam a paleta escura quente de julho (fundo <c4/>, dourado <c5/>) e um tema de relatório em papel quente. Agora eles tiram todas as cores e fontes de um único módulo, <c6/>, que espelha <c7/>: os gráficos são desenhados em escuro de instrumento sobre o fundo do Observatory (<c8/>) na pilha tipográfica Geist; o relatório, o player de animação e as páginas de resultado seguem a preferência clara/escura do visualizador com os tokens claro e escuro do Observatory. Os seis domínios de falha mantêm uma cor cada (interferência coral, spoofing magenta, temporização azul, órbitas ciano, integridade verde-limão, navegação âmbar), e os níveis de evidência aparecem como validada verde-limão, modelada âmbar, de parceiro magenta. As rampas de waterfall mantêm a sua ordenação perceptiva (inferno), reancoradas no novo fundo.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> mantém o módulo alinhado a <c2/> nos dois temas, verifica se <c3/> e <c4/> (ambos gerados a partir do módulo, para as ferramentas de figuras em Python e o mermaid-cli) estão atualizados e falha se aparecer um literal de cor hexadecimal em <c5/> fora da paleta.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> ganha um terceiro diagnóstico, "apenas cores e fontes mudaram", de modo que uma revisão de paleta se distingue de um valor plotado alterado. Cada gráfico do README renderizado de novo foi verificado como igual ao seu antecessor sob esse normalizador.

# text
# c1: tools/gen_validation_figures.py
# c2: domain-coverage-map
# c3: scenario-fom
# c4: sgp4-regime-bars
# c5: web/capabilities.json
# c6: clock-holdover
# c7: tests/fixtures/sgp4_comparison.md
# c8: tools/gen_readme_assets.py
# c9: sgp4-regime-bars
# c10: kshana↔ref
# c11: tests/figures_doc_sync.rs
seg-3bc4056fd57e = <c1/> lê a paleta e agora também gera as três figuras de resultados do README que não tinham gerador confirmado no repositório (<c2/>, <c3/>, <c4/>), com elementos de texto reais, a partir de <c5/>, do resultado de <c6/> e de <c7/>. <c8/> lê a mesma paleta, o que corrige o seu desvio de tema claro em relação ao site. Os valores de <c9/> são a coluna de pior caso <c10/> dessa fixture ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } e { "4.12e-6" } km), inalterados em relação à figura do Matplotlib, e <c11/> agora falha se a figura confirmada no repositório e a fixture discordarem.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> atualizado com os dados atuais (uma mudança de dados, não um redesenho).</b> A figura declarava { "28" } capacidades em { "8" } domínios ({ "11" } validadas, { "17" } modeladas), desatualizada em relação à sua própria fonte declarada; desenhada agora pelo seu novo gerador a partir de <c2/>, ela mostra { "46" } capacidades em { "8" } domínios ({ "17" } validadas, { "29" } modeladas).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>O Q do interferidor CW/de banda estreita agora é { "1.0" }, não { "1.5" }.</b> O valor de livro didático para um tom sobre a portadora é { "1" } (um tom mantém o pico espectral do sinal, <c1/>, <c2/>); o antigo { "1.5" } tornava um tom menos danoso que o ruído de banda larga com o mesmo J/S. Mudança de saída: cerca de −{ "1.8" } dB de C/N0 efetivo sob interferidores CW/de banda estreita com J/S alto nos tipos de cenário <c3/>, <c4/> e de interoperabilidade (o tom do exemplo <c5/> incluído: { "17.98" } dB-Hz pela tabela, era { "19.74" }). O Q de banda larga permanece { "1.0" } (conservador, cerca de { "3" } dB abaixo do ~{ "2" } dos livros didáticos) até a revisão de { "0.34" }. Defina <c6/> para manter o antigo { "1.5" }.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b>A saída inteira de <c1/> usa a faixa de inteiros.</b> Com ruído de potência unitária e uma escala de gravação de { "1" }, as cenas <c2/>/<c3/> saíam com cerca de { "{" }-1, { "0" }, { "1" }{ "}" } e as cenas de 2 bits tinham os seus limiares em { "2.8" } sigmas. Os formatos inteiros agora são escalados de modo que o RMS esperado por componente seja um quarto do fundo de escala ({ "31.75" } LSB em ci8, { "8191.75" } em ci16) ou { "2" } LSB em 2 bits. A escala e a contagem de elementos cortados são impressas e gravadas no arquivo auxiliar. A saída em ponto flutuante permanece inalterada.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Oito pins de fixtures em sete arquivos de teste não falham mais no macOS por diferenças no último bit</b> (parte da issue #36). Os pins que verificam se o motor ainda reconstrói as entradas confirmadas no repositório de uma referência independente (jacobianos, uma tabela de estados, azimutes de lançamento) eram comparados bit a bit e falhavam no macOS arm64 por { "2" } a alguns milhares de unidades na última casa. Agora eles comparam dentro de { "1e-12" } de uma escala tirada da fixture; inteiros, chaves e comprimentos continuam sendo comparados exatamente, e um teste de mutação mostra que uma variação relativa de { "1e-6" } ainda falha. O pin do azimute de lançamento compara <c1/> e o ramo ascendente/descendente em vez do próprio azimute, porque <c2/> amplifica um ulp do seu argumento para cerca de { "3e-9" } rad onde uma inclinação é igual à colatitude de um local. Nenhuma tolerância de referência independente nem limiar pré-registrado mudou. Dois testes (OD conjunta lunar, observabilidade lunar) não são cobertos: no macOS as suas próprias comparações pré-registradas se alteram, e isso fica para um acompanhamento posterior.

# text
# c1: kshana iq track
# c2: kshana iq sweep
# c3: --bandpass
# c4: --notch
# c5: --blank
# c6: --excise
# c7: --agc
# c8: --bits
# c9: track
# c10: track
# c11: sweep
# c12: --notch
# c13: iq acquire
# c14: iq frontend
seg-b6c354fa0c28 = <b><c1/> e <c2/> aplicam as opções de front-end.</b> O texto de uso anunciava <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> em <c9/>, mas <c10/> e <c11/> nunca montavam a cadeia: as opções eram ignoradas em silêncio, e uma sem valor, como <c12/>, engolia a opção seguinte. Os dois comandos agora as analisam como <c13/> faz e colocam uma cadeia de front-end nova antes da passagem de aquisição e da passagem de rastreamento. A saída é igual à de executar o comando sobre o arquivo que <c14/> grava com as mesmas opções.

# text
seg-d7238dab610e = Os dados da cena IQ são colocados por sinal.

# text
# c1: kshana iq scene --data
# c2: NavData::Seeded
# c3: SpreadingCode::data_modulation()
# c4: DataModulation
# c5: iq::signals
# c6: NavData::Lnav
# c7: Scene
# c8: NavData::Lnav
# c9: NavData::Seeded
seg-46ace9a3e008 = <c1/> (e <c2/>) colocam bits de { "50" } bit/s em todos os sinais, inclusive nos pilotos, e na taxa do LNAV do GPS no Galileo e no BeiDou. Os dados agora seguem a temporização de símbolo de cada sinal, declarada pelo novo <c3/> (<c4/>, definido por todos os construtores em <c5/>). Isso dá { "10" } ms no L5-I5, { "4" } ms no E1-B, { "2" } ms no B1I GEO (D2) do BeiDou, e bits de { "20" } ms com um meandro de { "10" } ms no GLONASS L1OF. Os dados são recusados em pilotos, no GPS L2C como um único fluxo CM/CL, e <c6/> em qualquer coisa que não seja o L1 C/A. Os códigos personalizados mantêm por padrão a temporização anterior de { "20" } ms. Um <c7/> programático que pedia <c8/> em um código que não fosse L1 C/A, ou <c9/> em um piloto, gerava em silêncio e agora retorna um erro na primeira leitura.

# text
seg-9dd38fa39d14 = Os canais GLONASS L1OF são adquiridos e rastreados na sua própria portadora FDMA.

# text
# c1: iq::acq::acquire
# c2: if_hz
# c3: SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)
# c4: carrier − center
# c5: if_hz
# c6: k
# c7: u32
# c8: k = -7
# c9: sat_id
# c10: k + 2^32
# c11: k
# c12: i32
seg-a775751ed6f6 = <c1/> e os canais de rastreamento misturavam todo código para baixo apenas a partir de <c2/>. Em uma gravação GLONASS de vários canais, uma busca pelo canal +{ "3" } encontrava, portanto, o sinal do canal { "0" } (todos os canais compartilham um único código de medição de distância) e nunca olhava { "1.6875" } MHz acima. Ambos agora usam <c3/>. O termo de portadora é zero para qualquer gravação centrada na própria portadora do sinal e é omitido quando o centro é desconhecido, de modo que o processamento CDMA permanece inalterado. Se você contornou o comportamento antigo incorporando <c4/> ao <c5/> do arquivo auxiliar, remova esse termo: o deslocamento agora é aplicado a partir da portadora e do centro, e mantê-lo o aplicaria duas vezes. Limitação conhecida, inalterada aqui: uma cena GLONASS identifica cada satélite pelo seu canal de frequência <c6/>, e o id de satélite <c7/> dá a volta em um canal negativo. O arquivo auxiliar de verdade de referência grava <c8/> como <c9/> { "4294967289" } (<c10/>). Leia-o de volta como <c11/> com uma conversão <c12/>.

# text
# c1: iq
# c2: kshana iq
# c3: scene
# c4: acquire
# c5: track
# c6: sweep
# c7: labfit
# c8: kshana.iq_scene
# c9: iq_acquire
# c10: iq_track
# c11: iq_labfit
# c12: iq_signals
# c13: iq::cli
# c14: tests/iq_cli.rs
seg-1c88bffc605b = <b>Camada IQ de GNSS na CLI e no Python ({ "0.32.0" } Fase A).</b> O módulo <c1/> existente agora pode ser usado sem escrever Rust. Cinco novos comandos de <c2/> se juntam ao grupo de tratamento de dados: <c3/> gera uma longa cena IQ multissatélite em um arquivo, com um arquivo auxiliar de verdade de referência; <c4/> executa a aquisição por FFT de um ou mais PRNs sobre uma gravação e informa cada detecção (PRN, Doppler, fase do código, estatística, limiar); <c5/> adquire e depois executa o banco DLL/PLL/FLL sobre uma gravação e emite a saída de rastreamento por época (CSV/JSON) com larguras de banda de malha, tempo de integração e espaçamento de correladores configuráveis; <c6/> reproduz uma gravação por vários projetos de malha e informa o jitter resultante e as métricas de travamento por projeto; e <c7/> ajusta o modelo de perda de travamento da malha de rastreamento a uma linha do tempo de receiver-trust. O mesmo núcleo é exposto ao Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), retornando listas e dicts compatíveis com NumPy. Apenas software e aditivo: sem novas dependências, sem transmissão, sem síntese de forma de onda de interferência ou de spoofing; o motor, a aquisição, o rastreamento e os projetos de malha são os do próprio crate, de modo que quem chama pela CLI ou pelo Python obtém os mesmos bits dos testes em Rust. Novo módulo <c13/>; o próprio arquivo auxiliar de verdade de referência da cena é a referência independente em <c14/> (a aquisição recupera cada fase de código e Doppler injetados, o rastreamento converge para o Doppler injetado). Nenhuma contagem publicada de tipos de cenário nem linha da matriz de verificação muda.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Demais capacidades da biblioteca IQ de GNSS na CLI <c1/> e no Python ({ "0.32.0" } Fase A.2).</b> Parte da Fase A, expondo o restante da camada <c2/> sem escrever Rust:

# text
# c1: iq scene
# c2: iq_scene
# c3: --iono-stec
# c4: --iono-vtec
# c5: --iono-klobuchar
# c6: --tropo
# c7: --s4
# c8: --scint-tau0
# c9: --sigma-phi
# c10: --multipath-height
# c11: --multipath-ground
# c12: --land-mobile
# c13: --nlos
# c14: iq::channel::SceneChannelAdapter
seg-67c485097357 = <b>Canal de propagação em <c1/></b> (e no <c2/> do Python): uma ionosfera de primeira ordem (<c3/>/<c4/> ou <c5/>), a troposfera de Saastamoinen/Niell (<c6/>), o modelo de cintilação de Cornell (<c7/>, <c8/>, <c9/>), o multipercurso especular de solo (<c10/>/<c11/>), o canal móvel terrestre de três estados (<c12/>) e um bloco sem linha de visada (<c13/>) se aplicam a cada satélite por meio de uma nova ponte interna ao crate (<c14/>) que converte os caminhos absolutos dos modelos de canal na forma de excesso sobre a geometria da cena.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>Saída SigMF em <c1/></b> (<c2/>): grava as amostras como um par <c3/>/<c4/> com uma captura e anotações por satélite; <c5/>/<c6/> já leem SigMF, de modo que uma cena faz a viagem de ida e volta.

# text
# c1: iq frontend <in> <out>
# c2: acquire
# c3: track
# c4: --bandpass
# c5: --notch
# c6: --blank
# c7: --excise
# c8: --agc
# c9: --bits
# c10: iq::frontend
# c11: iq_frontend
seg-c59ae97779ae = <b>DSP de front-end</b>: um novo comando <c1/> e as mesmas opções em <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) executam os estágios de <c10/> (FIR passa-banda, notch adaptativo, blanking de pulsos, excisão no domínio da frequência, AGC, quantizador); espelhados no Python como <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Cenas de efemérides de broadcast</b>: <c1/> (com <c2/>/<c3/>/<c4/>) coloca cada satélite GPS saudável na sua geometria de broadcast verdadeira usando o leitor RINEX do motor, de modo que o arquivo auxiliar de verdade de referência traz a distância, o Doppler e a fase do código reais por satélite; espelhado no Python como <c5/>. Apenas software e aditivo: sem novas dependências, sem transmissão, sem síntese de forma de onda de interferência ou de spoofing (os efeitos de propagação do canal atuam apenas sobre o sinal legítimo). Cada afirmação numérica é testada contra uma referência independente (forma fechada ou verdade injetada) nos testes unitários de canal/front-end e em <c6/>.

# text
# c1: iq
# c2: kshana iq
# c3: iq::scene
# c4: iq::channel
# c5: iq::acq
# c6: iq::track
# c7: iq::frontend
# c8: iq::io
# c9: iq::signals
# c10: iq::labfit
# c11: docs/design/GNSS-IQ-PLAN.md
seg-1e71370d87d8 = <b>Camada IQ de GNSS: simulação em nível de sinal e processamento de receptor por software.</b> Um novo módulo <c1/> leva o Kshana de um front-end L1 C/A de um único satélite e de bloco curto a uma camada completa em nível de sinal, acessível pelo grupo de comandos <c2/>. Ele gera cenas IQ brutas longas e multissatélite com um arquivo auxiliar de verdade de referência por época (<c3/>); aplica propagação em nível de sinal — ionosfera com divergência código-portadora, troposfera, cintilação de amplitude e de fase (modelo de Cornell), multipercurso de Fresnel e um canal móvel terrestre de três estados, com ausência de linha de visada (<c4/>); adquire e rastreia com aquisição por FFT e um banco DLL/PLL/FLL multicanal, reproduzindo uma gravação por muitos projetos de malha (<c5/>, <c6/>); modela o front-end — filtragem FIR/IIR, quantização de 1 a 14 bits, AGC, notch, blanking de pulsos e excisão no domínio da frequência (<c7/>); transmite em fluxo grandes conjuntos de dados gravados em memória limitada — formatos int8/int16/float32/2 bits empacotados e FI real, SigMF de vários arquivos, reamostragem, um inventário de conjuntos de dados com SHA-256 por arquivo e um executor em lote (<c8/>); acrescenta códigos de espalhamento para GPS L5/L2C, Galileo E1 (CBOC, códigos de memória reais do ICD) e E5a, BeiDou B1C/B1I e GLONASS L1OF, cada um verificado contra o seu documento de controle de interface (<c9/>); e ajusta o modelo de perda de travamento da malha de rastreamento ao comportamento observado de um receptor real em execuções de laboratório, com erro de exclusão de uma execução por vez e extrapolação rotulada como predição (<c10/>). Cada afirmação numérica é testada contra uma referência independente (uma tabela do ICD, uma forma fechada ou um receptor independente que recupera a verdade injetada); os modelos físicos de canal e de malha continuam MODELLED. Esta é apenas uma camada de software: ela grava arquivos IQ para receptores por software e não sintetiza formas de onda de interferência ou de spoofing nem aciona hardware de rádio. Nenhuma contagem publicada de tipos de cenário nem linha da matriz de verificação muda. Projeto: <c11/>.

# text
seg-943e21ccb25f = Receiver trust: avaliar um registro real de receptor GNSS.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> lê um registro u-blox UBX, RINEX { "3" } (com um arquivo de navegação de broadcast opcional), Android GnssLogger ou NMEA { "0183" } em uma única linha do tempo com marcas de tempo e executa monitores de confiança sobre ela: queda da densidade de potência da portadora em relação ao ruído (C/N0), perda de travamento, controle automático de ganho (AGC), o indicador de jamming do u-blox, salto de posição e, com RINEX e navegação, a própria solução de ponto único do motor com monitoramento autônomo de integridade pelo receptor (RAIM) por paridade e o monitor auxiliado pelo relógio. Cada época é nominal, degradada ou não confiável, e o resultado diz quando e por quê. Os eventos e as quedas previstas de C/N0 declarados no cenário são avaliados contra tolerâncias declaradas no mesmo arquivo: detectado, tardio ou perdido, e concorda ou discorda. As saídas são o JSON de resultado, um CSV por época e um gráfico; o resultado traz o SHA-256 do registro e todos os limiares. Também acessível pelo Python (<c2/>), pelo pacote WebAssembly (<c3/>, registros inline) e pela nova ferramenta <c4/> do servidor Model Context Protocol (MCP). Guia: <c5/>; exemplo: <c6/>. Nos registros de spoofing do JammerTest { "2024" }, o caminho do motor reproduz o primeiro alarme do pipeline de referência independente pré-registrado em cada início publicado (<c7/>). Os monitores continuam MODELLED; nenhuma linha da matriz de verificação muda.

# text
seg-55669fe92932 = Uma versão menor. As rodadas de validação { "2" } e os pacotes da onda 1 levam a matriz de verificação de { "223" } linhas ({ "93" } VALIDATED) em { "0.29.3" } para { "249" } linhas ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); cada promoção foi verificada contra uma referência independente com uma tolerância fixada antes da execução, e cada discordância é publicada como um achado. Novidades: um leitor nativo de kernels NAIF e um caminho DE440, uma propagação SGP4-para-ITRS e um caminho de tempo validados, uma biblioteca de relógios medidos, um gerador de referência LunaNet AFS, solucionadores de precisão estendida e de informação em raiz quadrada, e processamento real de IQ lunar com dados do LuGRE. Os números publicados que mudaram estão listados abaixo como revisões.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Vinte e sete linhas da matriz de verificação passam a ser VALIDATED depois que uma referência independente concordou dentro de uma tolerância fixada antes da primeira comparação (a regra de promoção em <c1/>): dez em uma primeira rodada de validação e dezessete em uma segunda. Cinquenta e uma linhas MODELLED foram submetidas a uma referência independente externa na primeira rodada e as demais linhas encaminháveis na segunda; cada discordância é registrada abaixo como um achado, em vez de ser ajustada para sumir. Três linhas foram divididas para que uma parte validada não carregue um restante não validado, o que leva a matriz de { "223" } para { "226" } linhas; os pacotes de validação incorporados desde então a levam a { "249" }. As contagens são lidas de <c2/> gerado.

# text
seg-8d542741fa77 = após a rodada { "1" }

# text
seg-ae3743f976c5 = Linhas da matriz de verificação

# text
seg-6c4b1fd56a31 = das quais VALIDATED contra uma referência independente externa

# text
seg-90450fe87280 = das quais MODELLED

# text
seg-86972e4c7f12 = das quais PARTNER

# text
seg-61c5c5e308ed = Abreviações usadas nesta entrada

# text
seg-5907283b71da = Abreviação

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (do ARAIM); monitoramento autônomo avançado de integridade pelo receptor; a Matlab Algorithm Availability Simulation Tool da Universidade de Stanford

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = desvio de Allan; passeio aleatório de velocidade; passeio aleatório de ângulo

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = um toolkit de astrodinâmica de código aberto (Nyx Space); o toolkit Spacecraft, Planet, Instrument, C-matrix, Events da NASA, do seu Navigation and Ancillary Information Facility; kernel de constantes planetárias

# text
seg-0789b1b8dba2 = BCRS, TDB, TT

# text
seg-584e509c80a5 = Sistema de Referência Celeste Baricêntrico; Tempo Dinâmico Baricêntrico; Tempo Terrestre

# text
seg-f03148ef3497 = BIPM, UTC(k)

# text
seg-d6e01fbf4f10 = Bureau Internacional de Pesos e Medidas; a realização do Tempo Universal Coordenado por um laboratório

# text
seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

# text
seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; sistemas de tempo lunares escritos no campo TIME_SYSTEM da mensagem

# text
seg-bed3cea7e74f = CRLB

# text
seg-525ebb08f4bc = limite inferior de Cramér–Rao

# text
seg-a1fff77503b4 = CW

# text
seg-064470740a35 = movimento relativo de Clohessy–Wiltshire

# text
seg-d70a9b3e92a7 = Development Ephemeris { "440" } do Jet Propulsion Laboratory

# text
seg-6f6e14685742 = DOP, PDOP

# text
seg-08aad29b6845 = diluição da precisão; diluição da precisão de posição

# text
seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

# text
seg-e9ecdbb0f600 = filtro de Kalman estendido; filtro de Kalman unscented (UKF); sistema de navegação inercial; sistema global de navegação por satélite; unidade de medição inercial

# text
seg-86765c7a6bbf = EMT, VPL, HPL

# text
seg-23029e0ceed2 = limiar efetivo do monitor; nível de proteção vertical e horizontal

# text
seg-27786c406107 = EOP, IERS, PCC, MAE

# text
seg-9d0a1a9fdebc = parâmetros de orientação da Terra; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; erro absoluto médio

# text
seg-1508f3d3a180 = ERFA, SOFA

# text
seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

# text
seg-900c7c7e99cd = GMAT

# text
seg-0382d12eabc8 = General Mission Analysis Tool da NASA

# text
seg-025aec0f5e29 = NTN, SSB

# text
seg-183dca4a747b = rede não terrestre (3GPP); bloco de sinal de sincronização

# text
seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

# text
seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

# text
seg-eaca07ff8609 = ILS, LAMBDA

# text
seg-b3cb3e6ea499 = mínimos quadrados inteiros; Least-squares AMBiguity Decorrelation Adjustment

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = viés entre sistemas

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = órbita terrestre baixa

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = separação de soluções com múltiplas hipóteses; nível de proteção; nível de proteção de temporização

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = densidade espectral de potência; amostras em fase e em quadratura; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = ruído de projeção quântica

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = monitoramento autônomo de integridade pelo receptor

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = sistema de aumento baseado em satélites; o Wide Area Augmentation System dos EUA; dupla frequência e múltiplas constelações; um satélite SBAS geoestacionário

# text
seg-eabf9641678b = RMS, SISRE

# text
seg-50a677b8e972 = raiz do valor quadrático médio; erro de distância do sinal no espaço

# text
seg-430b3c681347 = RTKLIB

# text
seg-3e75054c0034 = uma biblioteca de posicionamento GNSS de código aberto

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-264e9e51b8f8 = interferometria de linha de base muito longa

# text
seg-c3bc7d828ecc = Cada linha abaixo nomeia o seu tipo de referência independente (Biblioteca: uma biblioteca independente de terceiros que calcula uma grandeza definida de forma única; Medido: dados reais medidos; P2: uma biblioteca numérica independente que recalcula uma grandeza de álgebra linear sobre entradas confirmadas no repositório), a referência independente, a tolerância fixada antes da execução e o resultado. Cada promoção foi reexecutada por um segundo revisor, que regenerou a fixture byte a byte e mostrou que uma mutação deliberada do motor faz o teste ficar vermelho.

# text
seg-be0a4e3ac81c = <b>Fusão de sensores GNSS/INS</b> (Biblioteca), restrita ao EKF de estado de erro de 15 estados com acoplamento fraco: NaveGo v1.4 (LGPL-3.0, executado no GNU Octave) no seu próprio percurso real com IMU/GNSS Ekinox. O RMS horizontal, vertical e de inovação de posição do Kshana é { "0.912" }, { "0.940" } e { "0.861" } do do NaveGo (limiar { "1.2" }) e a sua inovação normalizada média é { "0.395" } (limiar { "1.5" }). O GNSS está presente durante todo o percurso, de modo que nenhuma interrupção é testada. O UKF fortemente acoplado e o filtro de relógio acoplado ficam fora da afirmação.

# text
seg-0c82afd5ba30 = <b>Atitude em 3 graus de liberdade e orçamento de erro de apontamento</b> (Biblioteca), restrito ao pico do torque de gradiente de gravidade: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } casos, dentro de { "1e-12" } em termos relativos (pior caso { "2.1e-15" }). O orçamento de apontamento RSS é uma soma de números fornecidos pelo chamador e fica fora dele.

# text
seg-71cf58e91a09 = <b>Geometria conjunta de comunicações e navegação lunares</b> (Biblioteca), restrita à colocação de locais, azimute, elevação e distância: ANISE { "0.10.2" }, { "768" } amostras, dentro de { "1e-6" } grau e { "1" } mm (pior caso { "2.2e-12" } grau e { "5.6e-9" } m). O parâmetro de precisão de medição de distância é uma entrada de projeto fora da afirmação.

# text
seg-0687c757231b = <b>Dinâmica de atitude de corpo rígido sem torque</b> (Biblioteca): o hub de espaçonave do Basilisk { "2.9.1" }, { "1e4" } s em duas inércias gerais, quatérnion e taxas dentro de { "1e-9" } (pior caso { "3.3e-11" } e { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>Resolução da ambiguidade inteira da fase da portadora GNSS (LAMBDA)</b> (Biblioteca), restrita à solução ILS e às suas duas melhores normas: RTKLIB v2.4.2-p13 <c1/>, { "300" } covariâncias, { "0" } divergências de inteiros, normas dentro de { "1e-9" } em termos relativos (pior caso { "5.6e-13" }). A taxa de sucesso por bootstrap continua verificada apenas internamente.

# text
seg-c23196cbdc96 = <b>PL de temporização composto, MHSS escalar</b> (P2): numpy { "2.3.5" } e scipy { "1.18.1" } em { "300" } entradas confirmadas no repositório, PL dentro de { "1e-9" } em termos relativos (pior caso { "1.2e-10" }), subconjunto determinante idêntico.

# text
seg-8f524d815949 = <b>Branqueamento de modo comum por GLS e a identidade de Mahalanobis</b> (P2): numpy { "2.3.5" } LAPACK em { "201" } covariâncias confirmadas no repositório, dentro de { "1e-12" } em termos relativos (pior caso { "7.9e-16" }); números de condição de até { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>Provedor de orientação de eixos principais lunar DE440</b> (Biblioteca): SPICE <c1/> sobre o PCK binário em { "2 000" } épocas fora de nó, dentro de { "1.7e-5" } rad (pior caso { "1.7e-6" } rad, cerca de { "3" } m na superfície), depois da correção listada em "Corrigido".

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>Entrada e saída de gravações SigMF, e espectros de Welch</b> (Biblioteca), restrito à leitura e gravação de SigMF e a <c1/>: <c2/> do scipy { "1.18.1" } dentro de { "1e-12" } em termos relativos por bin (pior caso { "6.0e-14" }); gravações do sigmf-python { "1.13.0" } decodificadas de forma idêntica bit a bit; os metadados do crate válidos contra o esquema SigMF { "v1.2.6" }. A síntese de IQ e as suas comparações de modelo ficam fora dele.

# text
seg-a7756d2e124a = <b>Ajustador de efemérides de broadcast LEO e SISRE contra o intervalo de ajuste</b> (Medido), restrito ao ajuste kepleriano de 16 parâmetros e ao seu SISRE apenas de órbita: órbitas precisas ITSG da TU Graz de quatro satélites contra as estatísticas de Liu et al. { "2025" }, componentes dentro de 1.5x ({ "0.804" } a { "1.087" }) e SISRE dentro de 1.5x ({ "0.716" } a { "0.809" }).

# text
seg-99debd58724a = Achados

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = A referência independente discordou destas linhas, por isso elas continuam MODELLED. Cada achado também é escrito no texto de referência independente da linha (e, assim, em <c1/>), com um teste que o fixa.

# text
seg-e28fac875d8c = <b>Estimação do estado do relógio de bordo:</b> em relógios IGS reservados de { "11" } satélites GPS Block IIF, o filtro de três estados é consistente um passo à frente, mas excessivamente confiante com uma hora em { "9" } de { "11" } (os termos periódicos e de flicker não estão no modelo).

# text
seg-5900ce454dc7 = <b>Detecção de spoofing:</b> no JammerTest { "2024" }, nenhum monitor em nível de observável alarmou em até { "10" } s de qualquer um dos { "8" } inícios publicados, e três janelas anteriores ao início trouxeram falsos alarmes.

# text
seg-08b6e6aa7d08 = <b>Nível de proteção de temporização sob spoofing:</b> o erro de tempo não detectado medido excede o TPL em { "3" } de { "8" } inícios detectados (1.9x a 5.3x); uma calibração de relógio de { "60" } s não cobre a deriva do TCXO do receptor.

# text
seg-a2f4df11d9cc = <b>Janela de lançamento e geometria de ascensão:</b> contra o Orekit { "12.2" }, a geometria concorda até o arredondamento, mas a velocidade do local pela rotação da Terra não atinge { "1e-6" } em termos relativos a { "62.9" } graus de latitude ({ "1.12e-6" }, o movimento polar que o modelo esférico omite). Rodada { "2" }: a velocidade com polo verdadeiro e com época concorda; a velocidade padrão sem época ainda não atinge (veja abaixo).

# text
seg-f6b6c9251a17 = <b>Corredor de reentrada balística (Allen–Eggers):</b> a desaceleração de pico prevista para a reentrada do Stardust é { "61.8" } g contra os { "32.89" } g reconstruídos (+{ "88" } %, tolerância { "15" } %).

# text
seg-5d83648dd867 = <b>Erro conjunto de UT1 e movimento polar:</b> contra a fórmula de precisão impressa em { "178" } edições do IERS Bulletin A, o polo concorda dentro de 1.5x, mas o UT1 não ({ "0.48" } a { "10" } dias, { "1.59" } a { "40" } dias). Substituído na rodada { "2" }: a linha agora é VALIDATED (veja abaixo).

# text
seg-98a99bcba894 = <b>Entrada padrão offline de orientação da Terra:</b> o astropy confirma a contagem de linhas, mas as { "12" } linhas que o crate chama de predições do Bulletin A estão sinalizadas como medidas (I), não como previstas (P). Portanto, os números de concordância da linha do preditor operacional eram contra linhas medidas. Substituído na rodada { "2" }: o motor classifica as linhas pelo indicador e a linha é VALIDATED.

# text
seg-d96fbfa4be79 = <b>Erro de predição de orientação da Terra em estilo operacional:</b> o erro de UT1 do preditor é de 2.4x a 12.6x o do Bulletin A em { "1" } a { "10" } dias e de { "5.32" } ms em { "10" } dias, fora da faixa de { "0.36" } a { "3.13" } ms da 2nd EOP PCC.

# text
seg-1833bf6e3b6f = <b>VLBI geodésico lunar:</b> contra os tempos de luz do ANISE pelo DE440, nenhum atraso fica dentro de { "1" } ps; a maior diferença é de { "24" } µs, em grande parte devido ao centro analítico da Lua (cerca de { "200" } km em relação ao DE440). Rodada { "2" }: o caminho por kernel é VALIDATED em uma linha própria; este caminho analítico continua MODELLED.

# text
seg-0ec8a2a91702 = <b>Exportação de interoperabilidade lunar:</b> o Orekit { "12.2" } recusa os sistemas de tempo LTC e TCL, de modo que a troca dos arquivos OEM lunares com um segundo leitor não está estabelecida.

# text
seg-09cfd4e61b7b = <b>Movimento relativo de Clohessy–Wiltshire:</b> contra o movimento não linear do Orekit a { "100" } m, a diferença é de { "1.2" } a { "6.3" } mm, acima de { "1" } mm; ela escala como o termo de segunda ordem omitido, de modo que a tolerância pré-registrada ficava abaixo do erro de linearização. Substituído na rodada { "2" }: a correção de segunda ordem é VALIDATED contra o mesmo limiar.

# text
seg-af1bdd974ba5 = <b>Crescimento do erro de deriva do INS/TRN:</b> contra um Monte Carlo de inércia livre do NaveGo, as leis de crescimento se mantêm dentro de { "5" } % até { "600" } s e superestimam além disso (2.2x a 8x em uma hora), porque omitem a realimentação de Schuler. Substituído na rodada { "2" }: o modelo de erro de Schuler é VALIDATED.

# text
seg-8459bc50f8b4 = <b>Volume de serviço lunar a partir da geometria real da constelação:</b> { "4" } de { "12" } estatísticas de disponibilidade publicadas diferem em mais de { "2" } pontos percentuais (até { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Sobrelimite heterogêneo do viés de rastreabilidade de UTC(k):</b> em { "105 024" } linhas do BIPM, o sobrelimite é excedido em { "50.8" } % das linhas; a incerteza publicada limita a medição do deslocamento pelo BIPM, não o deslocamento.

# text
seg-814acf34cffd = <b>Classificação do espaço nulo do datum lunar:</b> na geometria publicada de cinco refletores, a correlação é -0.78 contra -0.97, e o CRLB da origem fica de { "96" } a { "98" } % abaixo do do artigo.

# text
seg-da01b5e08a87 = <b>Substrato de geometria do datum LLR lunar:</b> contra { "192" } pontos normais lunares do ILRS de { "2024" }, o RMS do resíduo de ida simples era { "96" } m com a interpolação de orientação anterior e é { "22.7" } m depois da correção abaixo, ainda acima do limiar de { "10" } m (coordenadas de estação arredondadas, sem movimento polar). A série de orientação satura em silêncio fora de 2024-2025. Rodada { "2" }: o modelo de distância medida é VALIDATED em uma linha própria ({ "2.81" } m); a série agora cobre 2014-2030 e gera erro fora desse intervalo.

# text
seg-fd9ad94680e9 = <b>Acoplamento da taxa do relógio relativístico ao referencial:</b> o termo de autopotencial é { "3.18e-4" } acima do valor publicado (tolerância { "1e-4" }); o artigo avalia um potencial diferente, de modo que não existe valor publicado desta forma fechada. Substituído na rodada { "2" }: o potencial equatorial de grau 2 é VALIDATED contra o mesmo artigo.

# text
seg-e002819c1e2d = <b>Constantes físicas de todos os corpos do sistema solar:</b> { "12" } de { "84" } constantes dos corpos adicionados diferem do NAIF pck00011 e do gm_de440 (elementos mais antigos dos satélites de Marte; outras soluções de GM para Urano, Netuno e Plutão). Rodada { "2" }: as constantes agora seguem o NAIF (uma transcrição, não contada), e a orientação calculada concorda com o SPICE; a linha continua MODELLED.

# text
seg-e722d242e78e = <b>Modelos de efemérides LEO selecionáveis:</b> o ajuste de 22 parâmetros deixa 1.71x e 1.86x o erro ao longo da trajetória publicado em arcos de { "20" } min, acima de 1.5x. Substituído na rodada { "2" }: o modelo de 22 parâmetros e o seu ajuste são VALIDATED em uma linha própria.

# text
seg-c136023752df = <b>Posicionamento conjunto GNSS e LEO:</b> o viés entre sistemas concorda com o RTKLIB, mas { "93.2" } % das épocas ficam a até { "3" } m do ITRF2020 contra { "95" } %; o próprio RTKLIB chega a { "88.2" } % nos dados ({ "93.6" } % depois da correção do atraso de grupo da rodada 2).

# text
seg-e5f0e3c21def = <b>Cegueira de integridade de modo comum</b> e <b>mapas de cobertura e DOP:</b> ambas as comparações passaram, mas foram recusadas na revisão porque um motor deliberadamente errado também passa por elas (a primeira verifica apenas uma identidade interna; os pisos publicados da segunda não enxergam um PDOP dobrado). Rodada { "2" }: a cegueira de integridade de modo comum é VALIDATED em entradas com paridade; os mapas de cobertura continuam um achado (veja abaixo).

# text
seg-688e1753cd53 = Rodada de validação { "2" }

# text
seg-b320fbdb72c3 = A segunda rodada tomou todas as linhas que a primeira deixou encaminháveis, com novos pré-registros confirmados no repositório antes de qualquer fixture ser obtida ou de qualquer referência independente ser executada, um segundo revisor adversarial que reexecutou cada comparação e uma mutação deliberada do motor que deve fazer cada teste ficar vermelho. O responsável aceitou a redação corrigida da linha do limite fora de Omega em 2026-10-02 antes de ela ser promovida (o texto antigo contradizia o código).

# text
seg-7b7c584caaaf = <b>Promovidas a VALIDATED ({ "17" }).</b> Tipo de referência independente entre colchetes; tolerância fixada antes da execução.

# text
seg-555e6ad454d2 = <b>Acoplamento da taxa do relógio relativístico ao referencial</b> (Referência): L_m de Ashby e Patla { "2024" } dentro de { "2.8e-6" } (limiar { "1e-4" }) a partir do potencial equatorial de grau 2 dos dois campos que o artigo cita; gravidade de grau 350 do pyshtools para o termo radial ({ "8.3e-5" }); velocidade lunar do DE441 ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Entrada padrão offline de orientação da Terra</b> (Biblioteca): o astropy { "8.0.1" } e o IERS Bulletin A n.º { "039" } confirmam as { "30" } linhas finais, { "54" } rápidas e { "90" } previstas do extrato refeito.

# text
seg-b77253dd26b5 = <b>Erro conjunto de UT1 e movimento polar</b> (Biblioteca): as rotações completas do astropy e do pyerfa reproduzem a tabela conjunta (UT1 e polo dentro de { "6e-16" }, a combinação dentro de { "1.9e-7" }); os erros realizados do IERS Annual Report { "2019" } dão razões de { "1.001" } a { "1.100" }.

# text
seg-378414f812c1 = <b>Pegada e cobertura de carga útil de observação da Terra</b> (Biblioteca): Orekit { "12.2" } e GeographicLib { "2.1" } em todos os limiares pré-registrados, com a regressão nodal J2 agora no espaçamento de nós.

# text
seg-792bf58a1c1e = <b>Movimento relativo de Clohessy–Wiltshire</b> (Biblioteca): com uma correção de segunda ordem em forma fechada, dentro de { "1.2e-7" } m do movimento não linear do Orekit contra { "1e-3" } m; a matriz linear sozinha continua apenas caracterizada ({ "1.2" } a { "6.3" } mm).

# text
seg-423437d90022 = <b>Direcionamento no plano B e assistência gravitacional por cônicas remendadas</b> (Biblioteca): plano B, assíntotas, C3 e elementos heliocêntricos do GMAT R2026a; sbpy { "0.6.0" } e Kasuga e Jewitt { "2019" } para o parâmetro de Tisserand.

# text
seg-b29b0dfcd3a4 = <b>Crescimento do erro de deriva do INS/TRN</b> (Biblioteca): um modelo de erro de Schuler de nove estados dentro de { "5" } % das execuções de deriva corrigidas do NaveGo em todos os { "48" } pontos (pior caso { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Cegueira de integridade de modo comum</b> (P2): numpy <c1/> em { "1464" } entradas com paridade, dentro de { "1e-12" } (pior caso { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>OD e relógio conjuntos lunares multitécnica</b> (P2): o numpy recalcula cada passo de Gauss-Newton, sigma e erro de estação em seis redes (dentro de { "2.4e-11" }) depois de uma correção na solução por QR.

# text
seg-7ed9b059f888 = <b>Covariância das coordenadas de estação do VLBI lunar</b> (Biblioteca): um jacobiano construído com o SPICE reproduz o cronograma, o espectro, os sigmas e o espaço nulo dentro de { "1" } % e { "0.1" } grau; numpy até { "2e-13" }.

# text
seg-0e4e1c3fc899 = <b>Limite de modo comum indetectável com resíduo fora de Omega</b> (P2, redação corrigida por decisão do responsável): numpy LAPACK em { "256" } casos dentro de { "1e-12" }, seis infinitos exatos.

# text
seg-0fc8ce9cde6c = <b>Classificação do espaço nulo invariante à base</b> (P2): interseção de subespaços do SciPy e do NumPy em { "72" } matrizes construídas, inteiros exatos, norma do projetor dentro de { "6.0e-15" }.

# text
seg-4e5e7a6072bc = <b>Serviços ionosférico de frequência única e UTC de uma mensagem de navegação LEO</b> (Biblioteca): GNSSTk { "15.3.1" } para Klobuchar, Az e a deriva de UTC; ERFA para os três casos de segundo intercalar.

# text
seg-a644bf49c816 = <b>Limite de posicionamento por rede não terrestre 5G</b> (P1): limites de SSB único de Bachl, Lei e Nabeel { "2026" } dentro de meio dígito impresso; numpy para as covariâncias da solução de posição.

# text
seg-b326f6fc55ad = <b>Modelo de distância medida do LLR</b> (Medido, nova linha separada do substrato do datum LLR): { "192" } pontos normais lunares do ILRS com { "2.81" } m RMS contra um limiar de { "10" } m, com o tempo de luz baricêntrico do IERS { "2010" }; os componentes abaixo do limiar não são resolvidos um a um, e a linha diz isso.

# text
seg-82e9fba684dc = <b>VLBI geodésico lunar, caminho por kernel</b> (Biblioteca, nova linha separada da linha do VLBI lunar): tempos de luz convergidos do SPICE dentro de { "1" } ps e derivadas parciais dentro de { "1e-6" } em épocas próximas de J2000; o caminho analítico padrão continua MODELLED.

# text
seg-03c47d262ff3 = <b>Modelo de efemérides LEO de 22 parâmetros de Liu et al. { "2025" } e o seu ajuste</b> (Medido, nova linha separada da linha de modelos selecionáveis): órbitas precisas reais dentro de 1.5x das estatísticas publicadas em dias do artigo e em dias reservados ({ "0.683" } a { "1.186" }); a convenção de escala de n_dot é transcrita e não é validada por esta comparação, e a regra de parada é a regra de convergência de parâmetros do Kshana, não a regra de variação do RMS do artigo. O polinômio ATOMIC e a tabela de cinco altitudes continuam MODELLED.

# text
seg-b49f96eb52ad = Linhas VALIDATED existentes com novo fundamento (sem mudança de contagem).

# text
seg-4e26bec3297c = <b>Posições planetárias a partir dos elementos Standish do JPL</b> e <b>tempo de luz entre corpos do sistema solar</b>: os limiares post hoc de duas vezes o nominal são substituídos por comparações pré-registradas com o JPL Horizons DE441 (RMS no máximo o valor da Tabela { "8.10.1" } do Explanatory Supplement, pior caso { "0.778" }, incluídos a separação da Terra e a rotação ICRF; tempos de luz dentro de { "1e-6" } s do Horizons sobre posições DE441, pior caso { "6.7e-9" } s). Os seus indicadores "limite definido depois da comparação" são removidos.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Integridade (RAIM/ARAIM/SBAS)</b>: a linha deixa de se apoiar em verificações de plausibilidade. Agora ela diz: a separação de soluções com múltiplas hipóteses do ARAIM, do ADD v4.2, concorda com o MAAST de Stanford para o ARAIM { "2" } em { "270" } casos reais (pior diferença de VPL { "2.2e-3" } m contra { "0.05" } m); a detecção e a exclusão por RAIM de instantâneo concordam com o <c1/> do RTKLIB em { "2016" } de { "2016" } decisões, com o nível de proteção de inclinação dentro de { "2.7e-12" } m; os níveis de proteção L1 do SBAS DO-229E concordam com o MAAST de Stanford em transmissões WAAS reais ({ "2868" } pares dentro de { "1.6e-5" } m). Ela declara com clareza que as funções de sigma uniforme <c2/> e <c3/> NÃO são aderentes à norma ADD (diferenças com entradas equivalentes de 0.75/4.04 m e 0.39/1.93 m de VPL/HPL, um achado), que a comparação do SBAS DFMC L5 é um achado ({ "308" } pares sem nenhum GEO à vista são protegidos pelo Kshana e não pelo MAAST) e que <c4/> não tem comparação externa. O seu autossinalizador é removido.

# text
seg-d059b9953c3f = <b>Ajustador de efemérides de broadcast LEO</b>: a órbita verdadeira integrada é acrescentada à parte validada (Orekit { "12.2" } dentro de { "4.55" } mm em { "6" } h, limiar de { "2" } cm); os polinômios de correção, o ajuste de relógio e o compromisso do período de atualização continuam modelados.

# text
seg-166d511bbba3 = <b>Achados e linhas bloqueadas (continuam MODELLED).</b> O texto de referência independente de cada linha traz o achado e o seu teste fixado.

# text
seg-7f233dbdf110 = Modulação de sinais de navegação (Betz { "2001" }, Hein { "2006" }): espectros e correlações concordam; os lóbulos laterais de { "24" } MHz e todos os vieses de multipercurso ({ "11" } a { "15" } % abaixo) não concordam, causa não resolvida.

# text
seg-4d5a6bb44d64 = Geolocalização TDOA/FDOA: os limites coincidem com Ho e Chan e Ho e Xu, e com o código dos autores até { "3e-12" }; os fatores de Ottawa impressos a partir de um Monte Carlo diferem em { "1.3" } % e { "4.4" } %.

# text
seg-5fa189f788ca = GNSS da Terra à distância lunar: as médias de zênite do GENESIS concordam com Montenbruck et al. { "2023" } em { "5" } de { "6" }; as médias de nadir são de { "1.0" } a { "2.4" } satélites mais altas.

# text
seg-d7e5b5a64f43 = Mapas de cobertura e DOP: os projetos para a Terra concordam com o Orekit, o gnss_lib_py e o numpy em todos os limiares; os projetos para a Lua e Marte excedem { "1e-9" } apenas em células quase singulares.

# text
seg-3c8fb07d83ec = Posicionamento GNSS conjunto: dupla frequência { "79.9" } % e produtos precisos { "94.2" } % a até { "3" } m contra { "95" } % (RTKLIB { "67.9" } % e { "94.1" } %); a diferença de ISB com produtos precisos se deve ao fato de o RTKLIB ignorar os deslocamentos de antena.

# text
seg-5d3d4d99fbc4 = Malhas de rastreamento (GNSS-SDR { "0.0.19" }): concordam de { "35" } a { "45" } dB-Hz; a { "30" } dB-Hz, PLL +{ "21" } %, DLL -32 %, limiares +{ "1.5" } dB; tempos de deslize de { "0.5" } a { "2" } décadas mais curtos.

# text
seg-0dd24947169c = Volume de serviço lunar (Orekit e Hipparchus): { "155" } de { "160" } valores concordam; o requisito de pior amostra falha na geometria quase singular do LNCSS B.

# text
seg-74002245287f = Sensor inercial quântico: o piso apenas de QPN fica de { "21" } a { "31" } % abaixo do ruído medido de Gauguet { "2009" } (limiar { "30" } %, não atingido por { "0.5" } ponto).

# text
seg-ab8b17cf325e = Predefinições de osciladores: unidades medidas excedem as predefinições de holdover do rubídio, de curto prazo do césio e de pior unidade do CSAC; a predefinição do OCXO não tem registro medido.

# text
seg-81ad9b839a28 = Densidade do clima espacial: o Jacchia { "1971" } fica dentro de um fator { "2" } das densidades de acelerômetro no máximo solar, mas cerca de 1.7x denso demais no mínimo de { "2008" }.

# text
seg-68e5d0942847 = TEC oblíquo sem geometria: { "33" } de { "36" } arcos dentro de { "3" } TECU do mapa CODE (pior caso { "6.84" }).

# text
seg-f410ce9cf195 = Detecção de spoofing e TPL contra o registro oficial do JammerTest { "2024" }: { "4" } de { "10" } inícios detectados a tempo; o TPL é excedido em { "4" } de { "10" }.

# text
seg-41eb2c318469 = Filtro de relógio em relógios IGS novos: dois de { "11" } satélites falham no critério da soma de inovação.

# text
seg-064b623e918b = Preditor de EOP por mínimos quadrados mais autorregressivo: UT1 de { "1.73" } a 2.11x o Bulletin A em { "2" } a { "10" } dias.

# text
seg-d98571cc21f4 = Sobrelimite do deslocamento realizado de UTC(k): excedência agregada de { "0.0333" } contra { "1e-2" }.

# text
seg-527aca91ec7c = Datum do referencial lunar a partir de uma campanha: o ramo do SPICE concorda; o ramo P2 com estações estimadas não atinge { "1e-9" } em um problema de condição 2.1e8.

# text
seg-9805c4c821f9 = Datum do referencial lunar a partir de LLR real: { "15" } de { "16" } números concordam com o SPICE; o sigma da translação em z é { "1.03" } % alto contra { "1" } %.

# text
seg-08e6c541b59e = Reentrada (Allen-Eggers): a solução de massa pontual concorda com reconstruções de agências (apenas uma verificação cruzada); a comparação com o acelerômetro está bloqueada à espera de uma fonte legível do Hayabusa2.

# text
seg-0bb78ffbd915 = Máscaras ITU-T: os valores trabalhados impressos concordam; os limites de classe da G.8273.2 não têm nenhum (bloqueado).

# text
seg-308c1bca3fd9 = Geometria da janela de lançamento: a velocidade do local com polo verdadeiro e com época concorda com o Orekit ({ "4.9e-8" }); a velocidade padrão sem época ainda não atinge ({ "1.12e-6" }). Não promovido; acompanhamento pendente.

# text
seg-f0b7c3d60df8 = Constantes físicas de todos os corpos: agora { "0" } de { "84" } diferem do NAIF (uma transcrição), e a orientação calculada concorda com o SPICE até { "1.4e-10" } rad. Não promovido; acompanhamento pendente.

# text
seg-a5a787c9a761 = Bloqueadas por uma decisão de escopo do responsável, cada uma com a sua comparação concordante confirmada no repositório: observabilidade absoluta de estação lunar, DOP de balizas de superfície, a exportação fora do eixo de visada, potência de detecção entre modalidades, a estatística de consistência de modo comum e cobertura LEO polar.

# text
seg-cf638ec9878b = Bloqueadas por dados: orçamento de erro de transferência de tempo (precisa de uma redução com dados reais), C/N0 do JammerTest (posição da antena e divisão de potência não documentadas).

# text
seg-e8709509eef3 = Revisões (números publicados que mudaram, antigo -> novo).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = Os níveis de proteção de <c1/> agora estão no nível local geodésico em vez do radial: até { "0.31" } m de HPL e { "0.14" } m de VPL em ABMF ({ "16" } graus N); nenhum golden mudou, mas o resumo gravado do tutorial de <c2/> passa de HPL médio { "22.1" } m / VPL { "40.0" } m para { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Padrões de acoplamento do referencial de taxa lunar: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } por metro.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = Execução de EOP padrão offline (<c1/>, células listadas em <c2/>): predicted_rows { "12" } -> { "90" }; piso do polo { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; as linhas da Tabela { "2" } de <c3/>; concordância do preditor operacional 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> SISRE liu22 órbita/com relógio: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Tabela de altitudes de Liu, Kshana (razão): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = Escala de <c1/> da mensagem de navegação LEO { "2" }^-60 -> { "2" }^-58 (não pré-registrada, divulgada; fora da comparação de ajuste); o CRC do quadro de amostra liu22 0x62373A -> 0xDED99C.

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = Tabela de verificação de <c1/>: a linha de Liu e ATOMIC é dividida em uma linha VALIDATED de 22 parâmetros e uma linha MODELLED de ATOMIC e cinco altitudes.

# text
seg-537f5d80b66c = Texto da linha de orientação de eixos principais lunar DE440: intervalo 2024-2025 / { "731" } linhas -> 2014-2030 / { "6 209" } linhas; "satura em silêncio" -> erros fora do seu intervalo.

# text
# c1: eo-coverage
seg-17a5dd090566 = Cenário <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; novos campos inclination_deg ({ "98.19" }) e nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (o relógio de referência de TDOP/GDOP agora é a constelação de menor número à vista): GDOP global máx. { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }, mediana { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, e o mapa de GDOP por célula; mean_visible_by_constellation somado como inteiros (cerca de { "1e-12" } em termos relativos, invisível com { "4" } casas decimais).

# text
seg-e48b212c4881 = Solução GNSS conjunta de frequência única depois da correção do atraso de grupo de broadcast: { "93.2" } % -> { "93.6" } % a até { "3" } m; mediana do ISB -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (SNR rho/4 da malha de Costas): no limiar de { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; a { "25" } dB-Hz { "9.55" } -> { "1.60" }; a { "22" } dB-Hz { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/>: toda saída muda com o modelo de erro de Schuler; o pico de TRN do cenário distribuído { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = Relatório de <c1/>: nova chave geometry_path ("analytic" na execução padrão, nenhum valor numérico mudou); novos campos opcionais planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path, com epoch_partials no caminho por kernel; a descrição do tipo de cenário é reescrita. A referência independente do caminho por kernel da linha de verificação é o SPICE ({ "0.06" } ps); o ANISE ({ "0.12" } ps) passa a ser uma verificação cruzada da avaliação de kernel.

# text
seg-3631a31e7b26 = Constantes de corpos: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }; Netuno { "6.83509997e15" } -> { "6.835103145462294e15" }; Plutão { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); raio equatorial de Fobos { "13.1" } -> { "13.0" } km; polo e meridiano de referência de Fobos e Deimos a partir do pck00011; o prime_meridian_deg do sistema solar agora inclui os termos quadrático e periódico.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> em Europa), a partir da orientação completa de Europa do pck00011 (7cfd66b4; a orientação concorda com o pxform do SPICE até { "1.4e-10" } rad), o que move o módulo de pouso no espaço inercial: disponibilidade apenas com relés / com o alcance da Terra { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } de { "171" } épocas apenas com relés), PDOP mediano { "5.266" } -> { "5.360" }, erro de posição RMS { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, sigma formal mediano { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. A tabela em <c3/> e o pin em <c4/> acompanham; <c5/> permanece inalterado.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), com o fator calibrado substituído por Jacchia { "1971" }: activity_density_kg_m3 a 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k acrescentado ({ "1186.7" } K); <c2/>: a oscilação do ciclo solar a { "800" } km agora é 10.4x (NRLMSISE-00 13.6x) e a asserção de altitude acompanha a subida do NRLMSISE até { "500" } km e a queda a { "800" } km.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (texto do resumo inalterado em { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (solução por QR): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> reemitido para os campos novos e removidos acima.

# text
seg-717c51e1cca0 = Pacotes de validação

# text
seg-4ec44f8a5f8e = D12, precisão estendida e um solucionador em raiz quadrada (duas novas linhas VALIDATED: { "226" } -> { "228" } linhas, { "110" } -> { "112" } validadas).

# text
seg-d28005966948 = Parte { "1" }, referência independente de precisão estendida:

# text
seg-9a5f94973450 = Datum do referencial lunar com as estações estimadas: uma referência independente de precisão estendida mpmath de 50 dígitos (pré-registrada 804662d5, limiares escalados pela condição a partir de uma fórmula de erro retroativo a priori) concorda em uma nova data de campanha (2026-03-18) e no cenário original de 2024-01-01; nova linha VALIDATED sob P2. Ela resolve a disputa anterior de dupla precisão: os sigmas do datum do motor erram em até { "9.7e-6" }, as rotas de inversa e de autovalores do NumPy em até { "6.2e-6" }, e as suas rotas de Cholesky e QR em cerca de { "1e-8" }. O motor está dentro do seu limite de erro, mas é cerca de mil vezes menos preciso que uma rota por fatoração.

# text
seg-b055435a2138 = Ambiente da referência independente: mpmath { "1.3.0" } adicionado.

# text
seg-d0c2b2a8e635 = Revisões: nenhuma. Nenhum arquivo golden nem figura publicada muda; a linha "Datum do referencial lunar a partir de uma campanha de observação" continua MODELLED (decisão do fundador de 2026-10-02, opção A: ela não toma emprestado o status da linha separada); o texto dos seus testes cita o novo teste e o seu achado.

# text
seg-50b53908fb7c = Parte { "2" }, solucionador de datum de informação em raiz quadrada:

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Novo solucionador opcional de informação em raiz quadrada (<c1/>; <c2/> no cenário lunar-frame-campaign): QR de Householder, marginalização pelo fator triangular, um SVD de Jacobi para o espectro e produtos compensados apenas a partir de operações corretamente arredondadas. Contra a referência independente de 50 dígitos (pré-registrada b41908c9), os seus sigmas de datum concordam até { "3e-13" } em uma nova data (2026-06-09); nas entradas de 2026-03-18 e 2024-01-01, o solucionador padrão erra em até { "1e-5" }. Nova linha VALIDATED sob P2. O solucionador padrão e a sua saída permanecem inalterados. Os limiares pré-registrados só atestam erros acima de cerca de { "2e-7" } em termos relativos: eles rejeitam o solucionador padrão, mas não um sinal de Householder invertido, um produto escalar sem compensação ou uma inversa final espectral, e a linha diz isso.

# text
# c1: fim::crlb_srif
# c2: batch_ls::gauss_newton_srif
# c3: orbit_determination::determine_orbit_batch_srif
# c4: lunar_combination::formal_covariance_srif
# c5: precise_od::fit_srif
# c6: cislunar_srif::srif_cross_validation_sqrt
# c7: linalg_sr::weighted_lstsq
# c8: covariance_from_sqrt_information
# c9: precise_od::fit
seg-de9aeb2adde0 = Caminhos opcionais em raiz quadrada ao lado dos padrões inalterados: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> e <c6/>, sobre os novos <c7/> e <c8/>. Cada um concorda com o seu padrão onde ambos são precisos (uma verificação interna, sem linha; nenhuma validação é alegada para eles). <c9/> agora delega a uma rotina compartilhada; a sua saída e a saída padrão de todos os cenários permanecem inalteradas.

# text
seg-87a632404f32 = Decisões de posto da campanha do referencial lunar: uma verificação pré-registrada de precisão estendida ao longo de { "40" } dias confirma cada decisão decidível de bloco de estações e de Helmert de posto completo. O limite a priori não consegue atestar os { "20" } dias de Helmert com deficiência de posto; em aritmética exata, o seu defeito é geométrico, com o limiar de { "1e-9" } dentro da faixa natural das razões de autovalores da campanha. Nenhuma linha.

# text
seg-3b24e7fa36bf = A afirmação da linha da campanha de precisão estendida é restringida a "dentro do limite de pior caso", e a sua verificação da direção mais fraca com estações fixas agora mede um ângulo real ({ "6.6e-16" } rad; o comparador mudou de acos para uma corda, o limiar não).

# text
seg-4fad02ab4b6d = Revisões: nenhuma. Nenhum arquivo golden nem figura publicada muda; a linha "Datum do referencial lunar a partir de uma campanha de observação" permanece inalterada e continua MODELLED (decisão do fundador de 2026-10-02, opção A).

# text
seg-627d3357d620 = D4, espinha dorsal de efemérides por kernel do JPL, fase { "1" } (quatro novas linhas VALIDATED: { "228" } -> { "232" } linhas, { "112" } -> { "116" } validadas).

# text
seg-30e8a645191f = O leitor de kernels NAIF tem uma linha própria.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (contêiner DAF, SPK tipo { "2" }, PCK binário tipo { "2" }) concorda com o SPICE Toolkit (CSPICE N0067 por meio do spiceypy { "8.2.0" }) e com o ANISE { "0.10.6" } em todos os { "600" } estados do DE440 e { "200" } rotações de orientação lunar de uma grade aleatória sorteada a partir do hash do próprio commit de pré-registro (abcd9133), dentro de limiares derivados de antemão da avaliação de Chebyshev em precisão dupla (pior caso { "0.6" } % do limiar, { "1.95e-3" } m). A linha afirma que o motor lê corretamente os kernels do JPL, não que o DE440 ou a série analítica sejam precisos (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b>: posições do DE440 (ou de qualquer SPK tipo 2) pelo leitor do próprio motor, com épocas TDB em duas partes e o SHA-256 do kernel mantido para os relatórios; ele nunca substitui um planeta pelo baricentro de um sistema. <c2/> permite que um caminho de geometria escolha a série analítica (o padrão) ou um kernel.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Lua por kernel opcional para <c1/> e <c2/></b>: uma chave <c3/> lê o centro geocêntrico da Lua a partir do kernel; nada mais muda, e o relatório ganha um bloco <c4/> que nomeia o kernel e o seu SHA-256. Sem a chave, ambos os relatórios são idênticos byte a byte aos de antes.

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Covariância de ponto da superfície lunar no caminho por kernel</b> (nova linha VALIDATED): com todas as estações fixas e a baliza na Lua do DE440, a covariância da baliza concorda com um jacobiano de tempo de luz do SPICE (pior caso { "1.7e-3" } contra um limiar de { "1" } %) e com uma inversa do NumPy ({ "4e-14" } contra { "1e-9" }), pré-registrado 4a51256 (<c1/>). A linha do caminho analítico continua MODELLED: com a Lua analítica, o seu menor sigma de baliza fica { "3.9" } % abaixo da referência independente.

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Datum do referencial lunar a partir de uma campanha real, centro da Lua por kernel</b> (nova linha VALIDATED): em { "447" } pontos normais inéditos de 2019-Q2, pré-registrado 830d945a antes de qualquer um ser obtido, a covariância do datum no caminho por kernel concorda com a referência independente SPICE e NumPy inalterada dentro de { "7.6e-5" } contra limiares de { "1" } % e { "2" } % (<c1/>). O fundador decidiu que esta linha só é promovida com pontos novos; o diagnóstico com dados já vistos (c51f8b2) é um achado, não uma evidência. O limiar não discrimina modelos da Lua: a Lua analítica também passa no mesmo trecho (pior caso { "3.8e-3" }), a mutação planejada (a Lua por kernel uma hora atrasada) não foi detectada, e, na dobra, um centro da Lua errado em cerca de { "4,650" } km (a Lua tomada em torno do baricentro Terra-Lua) também passou. A linha afirma a covariância nesse caminho, não o centro da Lua, e diz isso.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Posições do Sol, da Lua, de Mercúrio e de Vênus a partir do DE440 em épocas UTC</b> (nova linha VALIDATED): <c1/> concorda com o Skyfield { "1.54" } em { "600" } posições entre { "1973" } e { "2026" }, pior caso { "2.96" } m, dentro de um limiar pré-registrado (0bfafe6d) definido pela série de dois termos TDB − TT (<c2/>). As posições dos planetas ganham agora esta nova linha de kernel; a linha de Standish e a linha das luas planetárias permanecem inalteradas, e as luas aguardam um cenário que precise delas (decisão do fundador).

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Achados: a única falha da comparação do datum LLR (sigma da translação em z { "1.025" } % contra { "1" } %) cai para { "0.049" } % quando apenas o centro da Lua é lido do DE440, com dados já vistos (<c1/>); no trecho novo de { "2019" }, a Lua analítica também passa, de modo que a falha de { "2015" } era marginal para a geometria daquele trimestre. As linhas analíticas "Datum do referencial lunar a partir de uma campanha de observação REAL" e "Covariância das coordenadas de ponto da superfície lunar … mantida distinta da de estação terrestre" continuam MODELLED; os seus textos de referência independente agora apontam para as linhas do caminho por kernel.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> não diz mais que o motor não tem leitor de kernels binários; ele aponta para a linha do leitor e explica por que os kernels de espaçonaves (tipos { "13" } e { "21" }) ainda vêm do Horizons.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Revisões: nenhuma. Nenhum arquivo golden, figura publicada ou valor de teste existente muda; os relatórios analíticos <c1/>, <c2/> e <c3/> com todas as estações fixas são idênticos byte a byte aos de antes (prefixos SHA-256 do resultado 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, biblioteca de relógios medidos "Clock Atlas" (três novas linhas, uma VALIDATED: { "232" } -> { "235" } linhas, { "116" } -> { "117" } validadas).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Biblioteca de relógios medidos (<c1/>).</b> Cartões de dispositivo (ruído branco de fase, modulação de frequência branca, de flicker e de passeio aleatório, uma deriva linear de frequência e, opcionalmente, termos de fase de uma a quatro vezes por revolução) ajustados a um registro de relógio medido nomeado e avaliados em dados reservados; variâncias de Allan e de Hadamard cientes de lacunas; um detector de condicionamento que registra cada lacuna, valor atípico de fase, salto de fase, rajada e salto de frequência e nada sabe sobre limites de arquivo ou de dia; conversão de um cartão para o modelo de ruído de temporização de slot, o modelo de relógio do filtro de Kalman estendido e os níveis de ruído do monitor de spoofing. Leitores para arquivos de relógio RINEX e IGS, arquivos por laboratório do BIPM e a Seção { "1" } da Circular T (<c2/>); um limite de envelhecimento hierárquico agregado para UTC(k) (<c3/>, ainda não avaliado).

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Identificação de ruído por autocorrelação de lag 1</b> (<c1/>, Riley e Greenhall { "2004" }), nova linha VALIDATED (Biblioteca): concorda com o <c2/> do allantools { "2024.6" } em { "140" } casos, inteiros idênticos, pior diferença { "9.6e-13" } contra um limiar de { "1e-9" } (pré-registrado 2ec76864; <c3/>).

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Cartões de dispositivo medidos com predição reservada</b>, nova linha MODELLED (um achado): ajuste em um terço, predição do desvio de Allan dos outros dois terços dentro de um fator de { "1.5" } (pré-registrado 2ec76864). GPS Block IIF em uma janela IGS nova (2026-03-01 a { "14" }): { "10" } de { "11" }; o G27 é otimista na escala de duas horas (pior fator { "1.510" }). Césio (dentro, { "1.070" }), OCXO (fora, { "2.348" }) e estrôncio (dentro) são informados, não cegos. O cartão do receptor do JammerTest e os cartões do maser do Galileo e do Deep Space Atomic Clock estão bloqueados. Uma classe de modelo de TCXO de receptor ZED-F9P em { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }) falha: { "1" } de { "11" } estações cegas em uma reexecução corrigida divulgada (<c1/>, <c2/>).

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>Cartões do GPS Block IIF com termos por revolução</b>, nova linha MODELLED (um achado): em uma segunda janela nova (2026-04-01 a { "14" }), { "9" } de { "11" } dentro do limiar; G03 ({ "1.947" }) e G25 ({ "1.581" }) são otimistas porque os seus registros reservados são mais ruidosos que os seus terços de ajuste; descartar os termos periódicos falha em todos os { "11" } (pré-registrado fb475550; <c1/>).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, estimação do estado do relógio de bordo, rodada { "3" }</b> (um achado, continua MODELLED): depois do detector de condicionamento congelado, o filtro estendido da rodada 2, com ajuste e critérios inalterados, satisfaz (a) e (c) em todos os { "11" } satélites pela primeira vez; (b) falha no G09 ({ "0.894" }) e no G26 ({ "0.876" }) (pré-registrado fb475550; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, detecção de spoofing, rodadas { "3" } a 4b</b> (continua MODELLED): a rodada { "3" } foi bloqueada ({ "167" } épocas de treinamento de outras sessões da unidade do JammerTest contra { "3600" }); com um cartão de classe de modelo ZED-F9P (rodadas { "4" } e 4b), o monitor de relógio levanta zero falsos alarmes antes do início em todos os { "10" } inícios registrados (rodada { "2" }: { "86" }) e { "6" } de { "10" } inícios são detectados em até { "10" } s (rodada { "2" }: { "4" }); os mesmos quatro continuam tardios (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, sobrelimite de UTC(k), rodada { "3" }</b>: pré-registrado de forma prospectiva (fb475550) em edições da Circular T a partir de { "465" }, ainda não executado (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Ambiente da referência independente: o registro ZED-F9P de Wroclaw tem acesso condicionado em <c1/> (CC BY { "4.0" }, cerca de { "1.5" } GB); as fixtures de relógio do IGS estão incluídas no repositório (produtos IGS, com atribuição).

# text
seg-b05fa0811a3e = Revisões: nenhuma. Nenhum arquivo golden, figura publicada ou valor de teste existente muda; M001 (reancoragem de holdover) não é atendido porque nenhuma classe de relógio foi promovida.

# text
seg-986f4075210b = D8, um caminho único validado de propagação, referencial e tempo (três novas linhas VALIDATED e M131 promovida: { "235" } -> { "238" } linhas, validadas { "117" } -> { "121" }).

# text
seg-d7a612528765 = Os tipos de cenário de órbita terrestre que tinham os seus próprios modelos de dois corpos, de J2 secular ou apenas de tempo sideral agora compartilham um único caminho: conjuntos de elementos SGP4/SDP4 com datas julianas em duas partes, levados ao GCRS e ao ITRS (International Terrestrial Reference System) pela cadeia IAU (International Astronomical Union) 2006/2000A, com parâmetros de orientação da Terra opcionais.

# text
# c1: sgp4::MeanElementSet
# c2: sgp4::SgpOrbit
# c3: sgp4::Eop
# c4: sgp4::teme_to_itrs_matrix[_eop]
# c5: sgp4::gcrs_to_itrs_matrix[_eop]
# c6: Sgp4::new_at
# c7: Sgp4::propagate_at
# c8: jd2::Jd2::from_utc_calendar
# c9: dtf2d
# c10: jd2::utc_to_tai
# c11: tai_to_utc
# c12: utc_to_ut1
# c13: utcut1
# c14: tai_to_tt
# c15: jd2::earth_rotation_angle
seg-016507ccdb8f = Novos <c1/>, <c2/>, <c3/>, <c4/> e <c5/>; <c6/> e <c7/> aceitam épocas em duas partes. Novos <c8/> (convenção <c9/> do SOFA para dias de segundo intercalar), <c10/>, <c11/>, <c12/> (por TAI, como o <c13/> do SOFA), <c14/> e um <c15/> em duas partes.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = O modo polar de <c1/> propaga por SGP4 em 2026-01-01T00:{ "00" }:{ "00" } UTC na cadeia IAU (<c2/> aceita qualquer época); o gerador Walker SGP4 gira para o referencial fixo à Terra pela cadeia IAU.

# text
# c1: passes
# c2: passes::predict_passes_apparent
# c3: apparent_look_angles
# c4: refraction
# c5: light_time
# c6: ut1_minus_utc_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: passes::predict_passes
seg-86ecad91a601 = O tipo de cenário <c1/> executa um novo preditor de passagens aparentes (<c2/>, <c3/>): SGP4 na cadeia IAU, refração ITU-R P.834-9 e o tempo de luz do downlink (novas chaves <c4/> e <c5/>, ligadas por padrão), parâmetros de orientação da Terra (<c6/>, <c7/>, <c8/>, padrão { "0" }), cruzamentos resolvidos até { "1e-7" } s e a culminação por busca da seção áurea. O <c9/> geométrico permanece inalterado.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> impede que os kernels de geometria, tempo e propagação do pacote carreguem uma propagação kepleriana própria, taxas seculares de J2 ou uma rotação apenas por tempo sideral; níveis rápidos nomeados e a física que é o assunto de uma linha são concessões justificadas.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Nova linha VALIDATED "Datas julianas em duas partes e segundos intercalares no caminho de tempo da órbita terrestre": <c1/>/<c2/>/<c3/> do pyerfa { "2.0.1.5" } em { "224" } instantes ao redor de todos os { "27" } segundos intercalares, dentro de { "1e-6" } s (pré-registrado e947e69d); pior caso { "1.9e-11" } s.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Nova linha VALIDATED "Um único caminho de órbita terrestre": posições TEME de { "232" } conjuntos de elementos contra o python-sgp4 { "2.24" } (o SGP4 de referência de Vallado) dentro de { "6.1e-8" } m (limiar de { "1" } cm), e as rotações GCRS -> ITRS e TEME -> ITRS contra <c1/>, <c2/> e <c3/> do ERFA dentro de { "2.9e-6" } mas e { "0.41" } mas (limiares de { "0.1" } e { "2" } mas), com parâmetros de orientação da Terra (pré-registrado 72ea9eb0). Divulgado: a primeira execução falhou em 2016-12-31T23:{ "59" }:{ "59.5" } por um segundo de rotação; o UT1 era tomado da data juliana quase-UTC em um dia de segundo intercalar, o motor agora passa pelo TAI, e a segunda execução concorda com os mesmos limiares.

# text
seg-a72ccdc2516e = M131 "Cobertura LEO e diluição da precisão para usuários polares e do Ártico contra GNSS MEO" passa a ser VALIDATED: o Orekit { "13.1.8" } toma os estados GCRS do motor, os gira e calcula a visibilidade e o DOP (NumPy para grupos de múltiplos relógios); posições dentro de { "6.8e-5" } m (limiar de { "0.2" } m), contagens à vista idênticas em 4040/4040 amostras, DOP mediano dentro de { "2.3e-11" } em termos relativos.

# text
seg-db498ac8e135 = Nova linha VALIDATED "Predição de passagens aparentes em estação terrestre com refração e tempo de luz": o Orekit { "13.1.8" } propagando os mesmos conjuntos de elementos em um TEME que ele constrói segundo a definição declarada, com refração ITU-R P.834 e o seu modelo de medição de tempo de luz, em { "60" } casos em estações ao nível do mar: { "1210" } passagens, cruzamentos dentro de { "3.4e-6" } s (limiar de { "5" } ms), elevação máxima dentro de { "5.5e-7" } grau, direção aparente dentro de { "8.8e-7" } grau (limiar de { "1e-4" } grau).

# text
seg-ab87bb0ee63d = Achados, mantidos fixados: as primeiras comparações de afirmação completa contra o Orekit de ponta a ponta não atingiram os seus limiares de posição e direção, não por causa do motor, mas porque o SDP4 do Orekit { "13.1.8" } se afasta do SGP4 de referência para órbitas de espaço profundo circulares (e = { "0" }) (até { "67" } m) e o seu TEME padrão é construído sobre a nutação do IERS { "1996" } (IAU { "1980" }), a cerca de { "72" } milissegundos de arco da cadeia IAU 2006/2000A ({ "2.7" } m em LEO). O coeficiente de h*theta0^{ "2" } da ITU-R P.834 do Orekit é { "0.011380" } onde a Recomendação imprime { "0.01380" }; a comparação é feita ao nível do mar, onde o termo desaparece, e a diferença acima dele é fixada.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = "Predição de passagens em estação terrestre (segmento terrestre)" continua VALIDATED, com a sua afirmação restringida ao <c1/> geométrico; o tipo de cenário <c2/> pertence à nova linha.

# text
# c1: xval/d8-orekit13/setup.sh
seg-60d6ac0011f1 = Ambiente da referência independente: Orekit { "13.1.8" } com Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

# text
# c1: scenarios/passes.toml
# c2: passes
# c3: docs/examples/multi-tool-pipeline.md
# c4: passes
# c5: docs/CAPABILITY.md
# c6: polar-arctic-leo-coverage
seg-532e10ead5a2 = Revisões: o acesso total de <c1/> incluído { "1675" } s -> { "1659" } s (cinco passagens como antes; melhor elevação máxima { "73.25" } grau -> { "70.08" } grau), e toda saída de <c2/> muda com o novo caminho (a linha impressa em <c3/> e a entrada <c4/> de <c5/> agora dizem isso); VDOP GNSS de <c6/> incluído no equador { "1.19669" } -> { "1.19710" }, a { "89.9" } grau { "1.50645" } -> { "1.50590" }, VDOP fundido a { "89.9" } grau { "1.14388" } -> { "1.14250" } (os números publicados com duas casas decimais { "1.20" }, { "1.51" } e { "1.14" } permanecem inalterados). Nenhum arquivo golden muda.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Ainda não encaminhados: <c1/>, os modos de doppler, conjunto e temporização de <c2/> e a órbita verdadeira de <c3/> (os seus modelos ficam em <c4/> e <c5/>), e os projetos para a Terra em <c6/> (um nível rápido nomeado de dois corpos).

# text
seg-03f638f20376 = D6, gerador de referência LunaNet AFS, LSIS V1.0 (quatro novas linhas, duas VALIDATED: { "238" } -> { "242" } linhas, validadas { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>Gerador de referência do LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), fixado ao LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 de { "29" } de janeiro de { "2025" } e nomeando essa versão em toda saída: a portadora de { "2492.028" } MHz; o canal de dados AFS-I BPSK({ "1" }) a { "500" } símbolos por segundo com o seu código Gold de 2046 chips; o piloto AFS-Q BPSK({ "5" }) com o seu código primário Weil de 10230 chips e os códigos secundário de 4 chips e terciário de 1500 chips; o quadro de identificador { "0" } (padrão de sincronização, subquadro { "1" } BCH ({ "51" }, { "8" }), CRC-24, subquadros LDPC de taxa um meio { "2" } a { "4" }, intercalador de blocos de { "60" } por { "98" }) com um decodificador exaustivo do subquadro 1 e um decodificador LDPC min-sum escrito apenas a partir da matriz de verificação de paridade; e síntese de IQ em banda base com rótulos de verdade de referência gravada como uma gravação SigMF. Os códigos são gerados a partir dos registradores de deslocamento e das construções de Legendre/Weil do padrão. Nada copiado do padrão é redistribuído (ele não traz termos de reutilização): os índices primários do AFS-Q vêm da IS-GPS-800J, e o que apenas os anexos do padrão definem (atrasos G2 do AFS-I, códigos terciários, submatrizes LDPC) é lido em tempo de execução de um cache local que <c2/> preenche a partir do PDF hospedado pela NASA, com cada arquivo verificado contra um SHA-256 fixado (<c3/>). O modelo é uma referência de aderência à norma, não um modelo de canal, de propagação ou de orçamento de enlace.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> e <c2/>: uma gravação pode levar campos de extensão com espaço de nomes declarados em <c3/>.

# text
seg-a9465820a1fc = Nova linha VALIDATED "Renderização em banda base do LunaNet AFS contra um gerador independente, dado o seu estado de canal": contra o LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, compilação em banda S), zero divergências de chips nos códigos dos PRNs { "1" } a { "210" }, zero divergências de símbolos nos três quadros da execução e uma correlação complexa normalizada de { "0.999990" } ao longo de { "23.9" } s das suas próprias amostras (pior bloco de { "2" } ms { "0.999948" }), dentro de limiares fixados antes da comparação (pré-registrado 986ac280). Ela aciona o renderizador com o próprio estado de canal do simulador e não cobre a divisão de potência a partir da densidade de potência da portadora em relação ao ruído nem a gravação SigMF e de 8 bits.

# text
seg-07edced2764a = Nova linha VALIDATED "Codificação de canal do quadro LunaNet AFS, FID { "0" }": os quadros de 6000 símbolos são iguais aos do LANS-AFS-SIM símbolo a símbolo (pré-registrado 986ac280); o código do subquadro 1 reproduz o exemplo trabalhado da Figura { "8" } do LSIS e o CRC-24 o valor de verificação do catálogo CRC-24/LTE-A.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Ambas as linhas promovidas têm acesso condicionado ao cache do LSIS: o seu teste de referência independente é ignorado com um aviso até que <c1/> tenha sido executado.

# text
seg-89a4bc4a766e = Achado (nova linha MODELLED), "Geração dos códigos de espalhamento do LunaNet AFS": de { "2 937 232" } chips e bits gerados comparados com as tabelas do padrão e os arquivos do Anexo { "3" }, um difere, os "últimos { "24" } chips" que a Tabela E-5 imprime para o PRN terciário { "147" }, que duplica a célula do PRN { "151" } enquanto o próprio arquivo do Anexo { "3" } do padrão concorda com o gerador. O critério de zero divergências não é atingido.

# text
seg-d4e76301323f = Achado (nova linha MODELLED), "Decodificabilidade em malha fechada do LunaNet AFS": três execuções pré-registradas contra o PocketSDR-AFS; a terceira atingiu integralmente os seus limiares de rastreamento e decodificação, mas não a sua salvaguarda de que uma compilação do receptor apenas com impressão reproduz o registro da compilação fixada, porque duas execuções do receptor não modificado já diferem nos seus registros de aquisição.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Corrigido: a portadora padrão de <c1/> (<c2/>), <c3/> e <c4/> era um valor arredondado de { "2.4" } GHz; agora é a portadora AFS do LSIS-020, { "2492.028" } MHz. Com o padrão antigo, a perda em espaço livre era subestimada em { "0.327" } dB.

# text
seg-ed7c170ccc2c = Revisões: nenhuma. Todo cenário incluído nomeia a sua portadora, e os resultados de todos os { "138" } arquivos de cenário são idênticos byte a byte aos do main anterior.

# text
seg-3ec7f5b17122 = D7, IQ lunar real e GPS LNAV (sete novas linhas, nenhuma VALIDATED: { "242" } -> { "249" } linhas, validadas { "123" } inalterado).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/>: uma transformada rápida de Fourier (FFT) de raiz mista cuja saída tem os mesmos bits em todas as plataformas; um pin SHA-256 das transformadas de 8000 e 24000 pontos passa em x86_64 e em wasm32-wasip1 (executor em <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/>: busca paralela de fase de código em IQ amostrado (<c2/>, <c3/>) com dobramento coerente, acumulação não coerente, um limiar qui-quadrado para uma probabilidade de falso alarme em toda a busca e uma estatística de média por célula para ruído de banda limitada; <c4/>, <c5/> com Doppler de código, e os estimadores de densidade de potência da portadora em relação ao ruído (C/N0) por M2M4 e por pico da grade.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/>: um codificador da mensagem de navegação legada (LNAV) da IS-GPS-200 para os subquadros { "1" } a { "3" }, com a paridade da Tabela 20-XIV e um decodificador de campos.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/>: um leitor para o ION GNSS SDR Metadata Standard (<c2/>) e os seus arquivos de amostras, com <c3/> para níveis em complemento de dois.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/>: o cabeçalho de lote IQS do LuGRE (Lunar GNSS Receiver Experiment), a telemetria RAW, ACQ e NAV e os arquivos CLK, e uma verificação que lista onde os metadados <c2/> contradizem o cabeçalho binário.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> e, em <c2/>, o referencial do corpo com yaw-steering, os ângulos de azimute de transmissão e fora do nadir, e <c3/> para C/N0 relativo com diagramas medidos.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = Codificação da mensagem de navegação GPS LNAV (nova linha, continua MODELLED depois da pós-verificação do integrador): no arquivo de broadcast do IGS de { "2" } de março de { "2025" }, analisado e decodificado pelo RTKLIB v2.4.2-p13, todas as { "960" } palavras passam na paridade, todos os { "96" } subquadros decodificam e todos os { "608" } inteiros de broadcast são iguais aos do Kshana (<c1/>), mas o pré-registro (d4d9eb9d) chegou ao ramo público dois segundos depois do commit que contém o resultado, de modo que a ordem "registrado antes de o arquivo ser obtido" não pode ser demonstrada e a linha não é promovida.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> preenche as palavras a partir do bit mais significativo (I no nibble alto de um byte do LuGRE; a leitura anterior produzia o sinal conjugado), mantém a leitura antiga como <c2/> e lê amostras mais largas que uma palavra.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/>: refinamento Doppler coerente em fase ({ "0.2" } Hz RMS a { "30" } dB-Hz ao longo de { "200" } ms em simulação).

# text
seg-b0f6a61acce0 = GPS L1 C/A contra o gps-sdr-sim: chips e bit de paridade exatos bit a bit; { "230" } de { "1152" } campos LNAV diferem em uma unidade porque o gps-sdr-sim trunca onde o inteiro de broadcast exige arredondamento.

# text
seg-1c525ca495c0 = LNAV decodificado pelo RTKLIB: toda a paridade e todos os subquadros passam e todo parâmetro está dentro de meio quantum; { "41" } valores escalados diferem em algumas unidades na última casa pela constante decimal { "2" }^-43 do RTKLIB, acima do limiar registrado.

# text
seg-14e26e69777b = Aquisição do LuGRE contra o GNSS-SDR { "0.0.19" }: { "266" } de { "266" } decisões concordam, { "250" } localizadas na mesma célula; a maioria dos positivos são artefatos de uma média de −{ "0.5" } nos níveis brutos de 4 bits; o ramo do C/N0 não tinha dados de voo contemporâneos. Dois lotes (OP5, OP12) foram excluídos por engano: os seus metadados concordam com os seus cabeçalhos, mas o leitor então não conseguia ler uma amostra mais larga que uma palavra.

# text
seg-3a32ff9d66fc = Aquisição do LuGRE contra o Doppler previsto pela órbita: com a decisão por potência das amostras, toda busca cruza sobre ruído de banda limitada; com a decisão por média por célula, os pares mais fortes concordam em módulo com o sinal invertido, o que mostra que a ordem I/Q registrada é a conjugada da dos dados.

# text
seg-2bb618ba4059 = Aquisição cega nos lotes da superfície lunar: quatro lotes adquirem cada um um satélite (previsto como visível, sem falso alarme em { "1e-7" }), nenhum dois, de modo que o limiar da diferença de Doppler não tem nenhum par a avaliar.

# text
seg-f95606e17fd1 = C/N0 relativo à distância lunar (M039 reformulada): { "15" } registros Block IIR/IIR-M e um par, poucos demais para o limiar registrado.

# text
seg-9306cf44fc44 = Revisões: nenhuma; nenhum número publicado, arquivo golden ou figura da documentação mudou.

# text
seg-2a3cb68c94d6 = A linha M039 "GNSS da Terra à distância lunar" reformula a sua afirmação à distância lunar como o C/N0 relativo entre satélites em uma época mais a visibilidade (o C/N0 absoluto não é afirmado); ela continua MODELLED. O NOTICE de nível superior traz a atribuição CC BY { "4.0" } do LuGRE.

# text
seg-e1e4094a186a = A orientação de eixos principais lunar do DE440 agora é interpolada ao longo da geodésica entre nós diários. A interpolação anterior, elemento a elemento, errava em até { "2.0e-4" } rad ({ "340" } m na superfície lunar) perto dos pontos de quarto de cada dia, e não os "cerca de { "14" } m" que a linha declarava. Os seus usuários (geometria de telemetria laser lunar, datum lunar, observabilidade de falhas lunar) recebem a orientação corrigida.

# text
# c1: snapshot_raim
seg-a2071d345923 = Correções do motor da rodada { "2" }, cada uma reexecutada contra a sua tolerância pré-registrada inalterada: a versão do IERS de uma linha de EOP é lida dos seus indicadores I/P e não de um bloco em branco do Bulletin B; <c1/> usa o nível local geodésico; o acoplamento do referencial de taxa lunar usa o raio equatorial, o J2 e a rotação; o ajuste liu22 começa com correções zero e sem priors e usa a taxa de movimento médio do artigo; o espaçamento de nós EO leva a regressão nodal J2; o tempo de deslize de ciclo de Costas usa rho/4; a solução conjunta aplica o atraso de grupo de broadcast do par; a solução conjunta lunar usa um passo por QR; o limite de NTN é avaliado na posição verdadeira; o relógio de referência do projeto de constelação é a menor constelação à vista; a série de orientação do DE440 cobre 2014-2030 e gera erro fora disso em vez de saturar.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, uma órbita verdadeira construída a partir de estados tabulados fixos à Terra, usada pela comparação do ajustador de órbita real.

# text
# c1: NOTICE.md
seg-7293b717d978 = Os arquivos de teste e as fixtures das comparações acima, cada um com o seu gerador e um <c1/> que traz fonte, licença, data de obtenção e SHA-256.

# text
# c1: araim_reference::add_v42_protection_levels
# c2: _ecef
# c3: raim::snapshot_raim_fde
# c4: cw_dynamics::second_order_correction
# c5: propagate_second_order
# c6: inertial::coast::ErrorDynamics
# c7: lunar_vlbi::KernelGeometry
# c8: lunar-vlbi
# c9: naif_kernel
# c10: lunar_llr_geometry::llr_bcrs_one_way_m
# c11: solar_system::link_on
# c12: launch::site_rotation_speed_at
# c13: eo_payload::j2_nodal_period
# c14: ground_track_spacing_equator_j2
# c15: batch_ls::gauss_newton_qr
# c16: precise_products
seg-920fe965bda9 = Rodada { "2" }: <c1/> e <c2/> (detecção de falhas do ADD v4.2, seguindo o MAAST de Stanford para o ARAIM { "2" }, aviso BSD-3 no código-fonte); <c3/>; <c4/> e <c5/>; o modelo de erro de INS de nove estados <c6/>; derivadas parciais de <c7/> e as entradas de <c8/> no caminho por kernel; <c9/>, um leitor para kernels SPK tipo { "2" } e PCK binário; <c10/> com estações ITRF2020; densidade de Jacchia { "1971" }; <c11/> sobre qualquer provedor de efemérides; <c12/>; <c13/> e <c14/>; <c15/>; <c16/> (leitores de relógio RINEX, ANTEX e DCB).

# text
seg-e3336e670d51 = Uma versão de correção sobre a { "0.29.2" }. O Kshana Studio foi reconstruído em torno de duas visões: uma visão Simples, que responde primeiro e explica em palavras simples, e uma visão Avançada, com o painel completo. Duas pequenas correções em kshana.dev acompanham a versão. O motor não muda: todo cenário incluído dá um resultado idêntico byte a byte ao da { "0.29.2" }, exceto pela marca de versão.

# text
seg-c40ab967ace6 = <b>O Kshana Studio tem uma visão Simples.</b> É nela que o Studio abre.

# text
seg-6a5ae001d00e = A resposta vem primeiro: um cenário abre em seu resultado, enunciado em uma frase simples. Cada cenário incluído tem sua própria frase, escrita para aquilo que esse cenário mede.

# text
seg-375421534e4c = No máximo cinco ajustes ficam à mostra, os que mais mudam a resposta. Os demais ficam em "Ajustes avançados", recolhidos até que você os abra.

# text
seg-d8650ae64549 = "Como isto é calculado" explica o método em poucas linhas, e "Para pesquisadores" traz os números do próprio motor, o arquivo do cenário e as evidências por trás do resultado.

# text
seg-36af7640e6ad = <b>O painel completo é a visão Avançada.</b> Todo painel, gráfico, exportação e relatório do Studio anterior está lá.

# text
# c1: view=advanced
seg-0428d0a7921b = <b>Um seletor alterna entre as duas visões e mantém o seu lugar.</b> O cenário, a visão em que você estava e quaisquer ajustes editados são mantidos. O Studio lembra qual visão você usou por último. Os links do site e da documentação abrem a visão Simples; um link com <c1/> abre a visão Avançada, e todo link antigo do Studio continua abrindo o mesmo cenário e a mesma visão.

# text
seg-2c98ed084c10 = <b>Uma primeira visão mais rápida em conexões lentas.</b> A resposta registrada de um cenário é desenhada antes de o restante do Studio carregar; assim, em uma conexão móvel lenta, a resposta aparece em cerca de dois segundos, em vez de cerca de nove.

# text
seg-2214d2dcfab4 = <b>Busca melhor.</b> Agora a busca lista primeiro os cenários cuja área ou título corresponde às palavras, antes dos cenários que apenas as mencionam no nome do arquivo ou no texto.

# text
seg-aa8d43280c19 = <b>O globo da página inicial não fica mais em branco com movimento reduzido ativado.</b> Com a configuração do sistema de movimento reduzido ativada, redimensionar a janela podia deixar o globo principal vazio até a página rolar. Agora o globo é redesenhado no mesmo quadro do redimensionamento.

# text
seg-da4b78816df1 = <b>O console de banda L da página inicial explica sua banda vazia.</b> Em "Watch a jammer take the band", o painel GPS L5 / Galileo E5a permanecia escuro durante o minuto inteiro, o que parecia um defeito. Nenhum jammer transmite nessa banda neste cenário, e os sinais dos satélites ficam abaixo do piso de ruído, de modo que nada ali se eleva acima dele. Agora um rótulo discreto informa isso em qualquer trecho de painel sem nada acima do piso (o painel L5 / E5a e o painel L2C antes de seu jammer de ruído começar), com o C/N0 e o estado de travamento de cada banda a partir da mesma execução. Ele é colocado apenas onde nada está acima do piso, portanto nunca cobre a energia do jammer.

# text
seg-e353fdee7033 = Uma versão de correção sobre a { "0.29.1" }. Ela remove código duplicado nos módulos de mensagem de navegação, fusão e espectro de LEO, adiciona um tema claro a kshana.dev, move o Kshana Studio para um endereço próprio, torna o site legível por mecanismos de busca e assistentes de IA, corrige várias pequenezas no Studio e permite que as versões npm sejam publicadas sem um token armazenado. Nenhuma saída do motor muda: todo cenário incluído dá um resultado idêntico byte a byte ao da { "0.29.1" }, exceto pela marca de versão.

# text
seg-e8bf0a4fdc35 = <b>Um tema claro para kshana.dev.</b> Toda página pode ser lida em tema claro ou escuro. O site segue a configuração do sistema do leitor e tem um seletor para alterá-la.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: llms.txt
# c4: llms-full.txt
seg-8e7cabc14c40 = <b>Mecanismos de busca e assistentes de IA conseguem ler o site.</b> Cada página agora tem seu próprio título, descrição, endereço canônico, tags de cartão social e dados estruturados schema.org, além de texto simples para as seções que um script desenha. O site publica <c1/>, um <c2/> com a data da última alteração de cada página, <c3/> e <c4/> (um guia curto e um completo, em texto simples, para assistentes de IA) e uma chave IndexNow para que uma publicação possa informar aos mecanismos de busca o que mudou.

# text
# c1: NPM_TOKEN
# c2: docs/RELEASING.md
seg-804ba71be9ed = <b>As versões npm podem ser publicadas sem um token armazenado.</b> O job do npm agora executa Node { "24" } e npm { "11.5.1" } ou posterior, que oferecem suporte à publicação confiável do npm: o npm troca a identidade GitHub do job de versão por uma credencial de curta duração. O segredo <c1/> continua funcionando e é usado enquanto estiver definido, portanto nada muda até que a publicação confiável seja ativada para o pacote em npmjs.com. <c2/> lista os passos.

# text
seg-81405e5a5e06 = <b>O título da página inicial é legível sobre o globo.</b> Uma sombra suave agora fica atrás do título e de seu texto, esmaecendo as linhas de órbita e os pontos de satélite do globo animado onde eles o cruzam.

# text
# c1: /playground/
seg-24b8363acc14 = <b>O Kshana Studio tem um endereço próprio: <a1>https://kshana.dev/studio/</a1>.</b> Todo link no site e na documentação aponta para lá. O endereço antigo, <c1/>, continua funcionando e redireciona para o novo, mantendo no link o cenário, a visão e os demais ajustes.

# text
seg-12f223b986bd = <b>Correções no Studio.</b> O arquivo do motor é baixado uma vez em vez de duas. Enquanto ele é baixado, o Studio mostra de imediato o resultado registrado do cenário, rotulado como registrado, em vez de uma tela vazia. Em um telefone, o cabeçalho é uma única linha compacta. Os números principais são quebrados em dois por linha, de modo que nenhum fique escondido fora da tela. Os rótulos dos campos usam as palavras do próprio cenário, com o nome do campo ao lado, e a busca encontra campos por qualquer um dos dois.

# text
# c1: downsample_grid
# c2: navsignal::simpson
# c3: leo_link::geometry
# c4: leo_fusion::geom
# c5: scenarios/
seg-c130d8a4dc5e = <b>Menos código duplicado.</b> A tabela de unidades da mensagem de navegação LEO escrevia as mesmas dez linhas de estatísticas SISRE para quatro resumos de ajuste. Agora uma macro as escreve uma única vez. Os dois gráficos de cascata de espectro compartilham um mesmo eixo de tempo, barra de cores e painel da barra de C/N0. A subamostragem da grade principal reutiliza <c1/>, e a integral de Simpson reutiliza <c2/>. Os dois pontos de entrada do tipo de cenário de passagem LEO compartilham uma única etapa de preparação. <c3/> importa os auxiliares de vetor de <c4/> em vez de copiá-los. O relatório avançado importa o escape de HTML do relatório da API em vez de copiá-lo. Cada um dos { "139" } arquivos de cenário em <c5/> foi executado na { "0.29.1" } e neste código, e todo arquivo de saída é idêntico byte a byte.

# text
# c1: src/leo_navmsg/units.rs
# c2: src/leo_fusion/pvt_units.rs
# c3: PVT_UNITS
# c4: sonar-project.properties
# c5: tests/sonar_cpd_exclusions_are_justified.rs
seg-166b0435c96f = <b>As tabelas de unidades de leo-navmsg e leo-pvt têm arquivos próprios.</b> Elas saíram de módulos que também contêm lógica e foram para <c1/> e <c2/>. <c3/> mantém seu caminho público. Somente esses dois arquivos de tabela entram nas isenções da detecção de copiar e colar para catálogos declarativos em <c4/>, que <c5/> verifica.

# text
# c1: event=push
seg-f8b372e08ef9 = <b>O selo de CI do README mostra o resultado dos pushes para main.</b> O selo contava execuções de todo evento em main, de modo que podia indicar "failing" enquanto toda execução de push estava verde; agora ele pede somente as execuções de push (<c1/>).

# text
seg-7c41a482c7d8 = Uma versão de correção sobre a { "0.29.0" }: o número de cobertura medido, a linha de nome do projeto em kshana.dev, um job de cobertura mais rápido e um README renovado. Nenhuma saída do motor muda: todo cenário dá o mesmo resultado que na { "0.29.0" }.

# text
seg-997490bd1696 = Revisões de números publicados

# text
# c1: db796dd
# c2: 95.35 %
# c3: src/
# c4: b1d350d
# c5: tests/coverage_figure_doc_sync.rs
# c6: docs/COVERAGE.md
seg-ed4b071e4bd9 = <b>Cobertura de linhas: ~{ "96" } % → ~{ "95" } %.</b> O job de cobertura mediu novamente o código da { "0.29.0" } publicada (commit <c1/>, execução de CI { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } de { "58,697" } linhas de <c3/>. O número publicado era { "95.63" } % ({ "37,697" } de { "39,419" } linhas), medido em <c4/> antes da { "0.28.0" }; ele arredondava para ~{ "96" } %. O novo número arredonda para ~{ "95" } %, de modo que toda superfície que <c5/> fixa se move em conjunto: <c6/>, o selo do README, a linha de evidências e a tabela de CI, os selos do crates.io, PyPI e npm, o relatório técnico e a página de cobertura de kshana.dev. O piso de { "85" } % não muda.

# text
# c1: web/fonts/
# c2: web/fonts/FONTS.json
# c3: web/tools/fetch_third_party.py
# c4: text=
seg-577baa03af04 = <b>A linha de nome em kshana.dev.</b> "Kshana · क्षण · the precise instant" agora abre o destaque da página inicial e fica sob a marca no rodapé de toda página. kshana.dev continua sem fazer requisição a nenhum outro host: o devanágari é um subconjunto, hospedado no próprio site, da Noto Sans Devanagari com as três letras de क्षण ({ "1,692" } bytes, <c1/>, com o texto da SIL Open Font License e seu SHA-256 em <c2/>). <c3/> aprendeu a salvar um subconjunto <c4/> do Google Fonts sob um nome de arquivo endereçado por conteúdo.

# text
# c1: /evidence#research
# c2: /docs/changelog
# c3: /
# c4: .html
# c5: ROADMAP.md
seg-35b5bc4ee466 = <b>Os links do site chegam aonde apontam, em endereços limpos.</b> Um link para uma seção agora coloca essa seção logo abaixo do cabeçalho, em um telefone e em um computador: um link de setor de Missions abre esse setor com seu painel no topo; os links de Capabilities e Editions mantêm seu lugar enquanto os gráficos acima deles são desenhados; Editions não acrescenta mais um segundo deslocamento de cabeçalho; e um link para uma parte recolhida de uma página da documentação a abre. Toda página é ligada por seu endereço limpo (<c1/>, <c2/>, <c3/> para a página inicial), e os links canônicos, o sitemap e os redirecionamentos de endereços antigos indicam os mesmos; os endereços <c4/> continuam funcionando. Research tem seu próprio link no cabeçalho, entre Evidence e Developers, e no rodapé. A documentação não mostra mais o roadmap (<c5/> permanece no repositório): o grupo Project é Changelog, Licensing, Security, Contributing, Governance e Code of conduct, e o Glossary foi para Get started.

# text
seg-3da9f00f5ce6 = <b>O job de cobertura é mais rápido.</b> Na { "0.29.0" } ele levou { "143" } minutos, contra { "91" } saudáveis, até

# text
# c1: tests/property.rs
# c2: determinism
# c3: advanced_report
# c4: animation
# c5: tests/support/corpus.rs
# c6: determinism
# c7: KSHANA_CORPUS_THREADS=1
seg-85d502773367 = O fuzzer <c1/>, a causa da última vez, levou { "4" } deles. O corpus incluído cresceu de { "74" } para { "139" } cenários, e três binários de teste o percorriam inteiro, um arquivo por vez (<c2/> duas vezes, <c3/> e <c4/> uma vez cada): { "37" } minutos no total sob instrumentação de cobertura, contra { "3" } na { "0.27.2" }. Agora eles compartilham <c5/>, que executa o trabalho por cenário em todos os núcleos e devolve os resultados em ordem classificada; todo cenário e toda asserção permanecem. Em um laptop arm64, build de depuração: <c6/> leva { "143" } s em { "14" } núcleos, contra { "612" } s com <c7/> (o antigo percurso serial).

# text
# c1: tools/capture_site_shots.mjs
# c2: tools/readme_shots.py
# c3: docs/assets/readme/site/SHOTS.json
seg-bb69dbadbc81 = <b>O README, renovado.</b> Ele abre com a mesma linha de nome do site; as capturas de tela do Studio foram refeitas a partir do Studio da { "0.29.1" }, com uma nova do Studio em um telefone e sua barra de passos inferior; uma nova faixa "The site" mostra três páginas de kshana.dev a partir do build da { "0.29.1" } (<c1/>, composta por <c2/> e registrada em <c3/>); o número de cobertura indica ~{ "95" } %; e o texto alternativo da figura de pesquisa, que repetia o da figura de arquitetura, agora descreve os artigos. Os selos do cabeçalho são menores e mais curtos ({ "18" } px de altura; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), de modo que os onze cabem em duas linhas; todo link e todo texto alternativo mantém seu sentido completo.

# text
# c1: kshana-mcp
seg-f61ef3e16884 = <b>O job da imagem de contêiner recebe { "90" } minutos.</b> Na { "v0.29.0" }, o build linux/arm64 emulado da imagem <c1/> atingiu o antigo limite de 45 minutos ao compilar seu último crate, de modo que a imagem, a entrada no registro MCP e a verificação do canal não foram publicadas. O limite agora é de { "90" } minutos; a imagem não muda.

# text
# c1: src/ephem.rs
# c2: src/sgp4.rs
# c3: 0.323_273_64
# c4: 0.323_273_640
# c5: _64
# c6: _32
# c7: f64
# c8: f32
seg-1688bf9f0fec = <b>Oito literais de ponto flutuante reagrupados</b> em <c1/> e <c2/> (<c3/> → <c4/>): o SonarQube Cloud interpretava um último grupo <c5/> ou <c6/> como um sufixo <c7/> ou <c8/> ausente (regra S7454). Os valores são os mesmos números, portanto todo resultado permanece inalterado.

# text
seg-81fd160937db = Doze novos tipos de cenário e três novas maneiras de ler uma execução. O motor agora cobre o espectro de rádio, todo o sistema solar, constelações em torno de qualquer corpo, campanhas que encadeiam cenários em uma única missão e posicionamento, navegação e temporização (PNT) a partir da órbita baixa da Terra (LEO), do sinal até a solução de posição. Toda execução também pode ser escrita como uma animação, um relatório completo e um conjunto de arquivos de interoperabilidade para outras ferramentas.

# text
seg-118be64d7cb2 = Em torno do motor: um kshana.dev redesenhado (um site de várias páginas e um novo painel Kshana Studio que executa todas as capacidades no navegador), um README reescrito, catorze ferramentas no servidor do Model Context Protocol (MCP), um build para navegador que dá os mesmos números que o nativo e uma página pública para o Kshana Pro.

# text
seg-ea31356bc17d = Arquivos de cenário (mais um manifesto de suíte)

# text
# c1: kshana example
seg-26654cd81de1 = { "138" }, dos quais { "132" } estão incluídos para <c1/>

# text
seg-3d1a85e93e48 = dos quais MODELLED (modelo declarado, verificado quanto à consistência interna)

# text
seg-e77f9d273ee1 = dos quais PARTNER (exige hardware ou dados de um parceiro)

# text
seg-e94cd6b3561a = De onde vem o crescimento:

# text
seg-1759a8cce7d6 = Tipos de cenário

# text
seg-94de9433d99f = Arquivos de cenário

# text
seg-03d7aea335dc = Linhas da matriz (validadas + modeladas)

# text
seg-fdd674722717 = Espectro

# text
seg-59583fa40da3 = Sistema solar e posicionamento em torno de qualquer corpo

# text
seg-fafa167623df = Cenários marítimos, rodoviários e ferroviários

# text
seg-fc571c46e522 = Animação, relatórios, exportações de interoperabilidade

# text
seg-2746e0d9f787 = Projetos de sinal LEO e o espectro multibanda

# text
seg-d40ec114d1f9 = Posicionamento, temporização e fusão em LEO

# text
seg-0157f649e65b = Cadeia ponta a ponta em LEO

# text
seg-423283112128 = Resiliência em LEO, áreas de foco e cenários de usuário final

# text
seg-395beca13299 = Total acrescentado

# text
# c1: src/celeste_iod.rs
seg-ea9dc4093d8a = A capacidade LEO é agnóstica quanto ao sistema: ela roda com parâmetros genéricos declarados e não precisa de nenhum sistema nomeado. Os sistemas nomeados são predefinições opcionais, cada uma em seu próprio arquivo com sua fonte pública. Uma predefinição, Celeste IOD (demonstração em órbita), usa números apresentados no workshop LEO-PNT da ESA NAVISP, { "2026" } (ESA é a Agência Espacial Europeia; NAVISP é seu Programa de Apoio e Inovação em Navegação); ela fica em um único arquivo, <c1/>, com seus cinco cenários exclusivos do repositório, de modo que pode ser retida sem edição do código-fonte, e nenhum dos números de seu workshop é repetido neste registro de alterações.

# text
# c1: ephemeris
seg-c36a5015c03c = <b>Leia "Revisões de números publicados" antes de atualizar.</b> Uma saída do motor muda (as colunas de referencial inercial do tipo de cenário <c1/>, após a correção de um sinal na matriz de nutação), e a auditoria da documentação corrigiu números que documentos anteriores haviam impresso.

# text
seg-7fe505d3232b = Status: <b>VALIDATED</b> significa verificado em relação a uma referência externa independente (uma tabela publicada, o software de outro grupo ou dados medidos); <b>MODELLED</b> significa um modelo declarado verificado apenas quanto à consistência interna; <b>PARTNER</b> significa que a verificação exige hardware ou dados de um parceiro.

# text
seg-ec7abb62f217 = 3GPP, 5G, NTN

# text
seg-c5eb2d160429 = 3rd Generation Partnership Project; rede móvel de quinta geração; rede não terrestre

# text
seg-9bb1a987fedc = AD, BC

# text
seg-bbe2b5aa0557 = eras do calendário (anno Domini, antes de Cristo)

# text
seg-05bbe79b1991 = AIAA

# text
seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

# text
seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

# text
seg-81799e2a0c43 = portadora de deslocamento binário alternativa; portadora de deslocamento binário; modulação por chaveamento de fase binária; portadora de deslocamento binário multiplexada (modulações de sinal)

# text
seg-b2d165acb4e7 = ATOMIC

# text
seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (um modelo publicado de efemérides LEO)

# text
seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

# text
seg-7f71a4795674 = código de curso/aquisição e os nomes das portadoras e dos sinais civis do Sistema de Posicionamento Global

# text
seg-e464509f3abb = razão entre a potência da portadora e a densidade de ruído

# text
seg-d8ba917c09b8 = CIO

# text
seg-4321532214e3 = Origem Intermediária Celeste

# text
seg-de6c33774c9c = CLI

# text
seg-3096eb1d5a15 = interface de linha de comando

# text
seg-9aa3c2e54398 = verificação de redundância cíclica de 24 bits (polinômio da Qualcomm)

# text
seg-1e1009e225aa = CSAC

# text
seg-6ff440ff2c0c = CSS, HTML, SVG, XML

# text
seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

# text
seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

# text
seg-b4758ea40624 = valores separados por vírgula; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; localizador uniforme de recursos

# text
seg-3ad592244ea8 = onda contínua

# text
seg-287014fdc28d = CZML, KML, GeoJSON

# text
seg-469c9a50992d = Cesium Language; Keyhole Markup Language; JSON geográfico (formatos de mapa e de globo)

# text
seg-3415aa029e39 = Development Ephemeris { "441" } do Jet Propulsion Laboratory

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = identificador digital de objeto

# text
seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

# text
seg-a149d6e76bcb = diluição da precisão: geométrica, de posição, horizontal, vertical

# text
seg-bc679de1b3a8 = E1, E5, E5a, E5b

# text
seg-bb2b62a48d99 = nomes de sinais do Galileo

# text
seg-544f4fcbd68f = o nome de um slot na tabela da constelação do Sistema de Posicionamento Global

# text
seg-dd9cfd581e5d = ECEF

# text
seg-1a59ad88eca9 = centrado na Terra e fixo na Terra

# text
seg-7cf8bec6418e = EE

# text
seg-ceacb6924d4d = equação dos equinócios

# text
seg-5d59005d9757 = Earth Gravitational Model { "2008" }

# text
seg-de3b39993e2a = EIRP

# text
seg-7f1b85286c96 = potência isotrópica radiada equivalente

# text
seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (bibliotecas de astronomia de referência)

# text
seg-51f1fda55cc7 = ESA, NAVISP

# text
seg-399a11a6e7c7 = Agência Espacial Europeia; seu Programa de Apoio e Inovação em Navegação

# text
seg-01eb6fdcdb90 = FDMA

# text
seg-6723fd8624df = acesso múltiplo por divisão de frequência

# text
seg-6d5d27174fe9 = GCRF, GCRS

# text
seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

# text
seg-d41af8f18aed = GLONASS

# text
seg-81f742947af1 = Sistema Global de Navegação por Satélite da Rússia

# text
seg-d2a107373b59 = GNSS, GPS

# text
seg-d703f29c82eb = sistema global de navegação por satélite; Sistema de Posicionamento Global

# text
seg-1df73b95ae4d = IAU

# text
seg-0461e1933d23 = União Astronômica Internacional

# text
seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

# text
seg-a54e0f483ad5 = documento de controle de interface; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame

# text
seg-aa7091bb80e6 = IMO

# text
seg-6a7c8caf2a55 = Organização Marítima Internacional

# text
seg-dbcf65546abf = INS, MEMS

# text
seg-b767f348dab9 = sistema de navegação inercial; sistema microeletromecânico

# text
seg-1be5a43002db = IOD

# text
seg-7eb2ca980e20 = demonstração em órbita

# text
seg-92cd0058a058 = IQ

# text
seg-c7fa50165400 = em fase e em quadratura

# text
seg-41471e51e661 = a especificação de interface do Sistema de Posicionamento Global

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Estação Espacial Internacional

# text
seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

# text
seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo fixo na Terra; equador verdadeiro, equinócio médio (referenciais)

# text
seg-8f1cbbae84aa = ITU, ITU-R

# text
seg-d1b7680b4762 = União Internacional de Telecomunicações; seu Setor de Radiocomunicações

# text
seg-a524e4c4a670 = razão jammer-sinal

# text
seg-5d93361e20d4 = J2 to J6, J2000

# text
seg-50255586b303 = harmônicos zonais do campo gravitacional; a época 2000-01-01 { "12" }:{ "00" }

# text
seg-368f7969b33a = JPL

# text
seg-44db8a7ae8f7 = Jet Propulsion Laboratory

# text
seg-e0e589aaa8fe = LEO, MEO

# text
seg-f4b580b88664 = órbita baixa da Terra; órbita média da Terra

# text
seg-aad5b54bfffd = MBSE

# text
seg-800a5f6b96ad = engenharia de sistemas baseada em modelos

# text
seg-535ba4896ba4 = NEES

# text
seg-a230ecd2fe39 = erro de estimação normalizado ao quadrado

# text
seg-56d5135d987d = o modelo de ionosfera do Galileo

# text
seg-408af08fe37b = OEM, SP3, TLE

# text
seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (órbitas precisas); conjunto de elementos de duas linhas

# text
seg-ac4878697ee5 = PNT, PPP

# text
seg-c19b5f77acc5 = posicionamento, navegação e temporização; posicionamento por ponto preciso

# text
seg-dd94b086ed4b = PSD, SSC

# text
seg-6e937d7e984e = densidade espectral de potência; coeficiente de separação espectral

# text
seg-e0421c657cc1 = RAIM, SQM

# text
seg-d6fee8d2ce49 = monitoramento autônomo de integridade pelo receptor; monitoramento da qualidade do sinal

# text
seg-dc53bead2cf5 = RINEX, RTCM

# text
seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

# text
seg-dcd6afa24ea6 = RMS

# text
seg-0b4fc648e96c = raiz do valor quadrático médio

# text
seg-e1c3c49833fc = uma biblioteca de código aberto de posicionamento GNSS, usada aqui como referência independente

# text
seg-9ead536db4aa = Simplified General Perturbations { "4" } (o modelo de órbita dos conjuntos de elementos de duas linhas)

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8c718f7f9f5d = SigMF

# text
seg-7830c93a5803 = Signal Metadata Format

# text
seg-d282e836d47b = SISRE

# text
seg-3c48d3ad7b43 = erro de distância do sinal no espaço

# text
seg-f045a03a5598 = SPS PS

# text
seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

# text
seg-758b51d8d5b6 = SRTM

# text
seg-7e45c32b04e4 = Shuttle Radar Topography Mission

# text
seg-8104773e1484 = STK

# text
# c1: .e
seg-f4fca0494aae = Systems Tool Kit (seu formato de arquivo de efemérides <c1/>)

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-1043491566b5 = SVID

# text
seg-d67f9665f054 = identificador de veículo espacial

# text
seg-de4e841ce8a2 = o total de satélites, os planos e a fase de uma constelação Walker

# text
seg-4d6ebfefc096 = TEC

# text
seg-5149401781dd = conteúdo eletrônico total

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = frequência ultra-alta

# text
seg-3cd6018f5b78 = UTC

# text
seg-4d7d6ff2e8a5 = Tempo Universal Coordenado

# text
seg-41b9b462d434 = WGS { "84" }

# text
seg-ec04054b9f8e = World Geodetic System { "1984" }

# text
seg-613b7c13cd32 = X1, X5

# text
seg-349e041a5a90 = nomes de sinais do sistema Xona Pulsar

# text
seg-d6a3f210958a = Um número publicado que muda é uma revisão e é registrado, nunca corrigido em silêncio. Esta versão traz uma revisão de saída do motor e várias de números impressos na documentação.

# text
seg-1669eb4224f1 = Saída do motor

# text
seg-185961ebab61 = A redução TEME→GCRS girava por { "2" }·Δψ: a matriz de nutação tinha o sinal de Δψ invertido.

# text
# c1: nutation::numat
# c2: Rx(−(ε̄+Δε))·Rz(Δψ)·Rx(ε̄)
# c3: iauNumat
# c4: Rx(−(ε̄+Δε))·Rz(−Δψ)·Rx(ε̄)
# c5: nutation_matrix
# c6: nutation_matrix_2000a
# c7: teme_to_gcrs
# c8: gcrs_to_teme
# c9: numat
# c10: tests/frame_reference_vectors.rs::teme_to_gcrs_matches_vallado_gcrf
# c11: nutation::tests::nutation_matrix_matches_erfa_numat
# c12: src/cio.rs
# c13: ephemeris
# c14: gcrs_r_m
# c15: gcrs_v_m_s
# c16: Propagator::position_in_frame
# c17: state_gcrs
# c18: orbit-sgp4-gps
# c19: sgp4
seg-504b78f30c54 = <c1/> construía <c2/> onde o <c3/> do SOFA constrói <c4/>, de modo que <c5/>, <c6/>, <c7/> e <c8/> giravam pelo dobro da nutação em longitude, cerca de { "25" } segundos de arco. Toda verificação da cadeia era um teste de propriedade (rotação própria, ida e volta, uma contribuição de nutação diferente de zero) que um erro de sinal deixa passar; o teste ponta a ponta de Vallado cobria TEME→PEF, TEME→ITRF e GCRS→ITRS, mas não TEME→GCRS. No exemplo de Vallado (AIAA 2006-6753, 2004-04-06), a cadeia errava o GCRF publicado em { "1 145" } m; agora ela cai a { "0.11" } m dele, e a matriz é igual ao <c9/> da ERFA em { "1e-14" }. <c10/> e <c11/> falham ambos com o sinal antigo. O teste de consistência do CIO (Origem Intermediária Celeste) em <c12/> atribuíra a discordância resultante de ~{ "130" } m a "≈ { "2" }·EE"; o resíduo agora é de { "5" } cm e seu limite foi reduzido de { "250" } m para { "1" } m. <b>Isto altera números publicados, registrados aqui como uma revisão:</b> as colunas <c14/> e <c15/> do tipo de cenário <c13/> (cerca de { "0.8" }–{ "1.0" } km para o cenário incluído da ISS (Estação Espacial Internacional); suas colunas TEME, fixas na Terra, de traço no solo, de ângulo de visada e Doppler não mudam), e <c16/> / <c17/> para os referenciais GCRS e ITRS. A linha de resumo, o gráfico ou o hash de referência de nenhum cenário incluído lê essas colunas. As novas exportações de interoperabilidade usam a cadeia corrigida: a posição CZML do primeiro satélite <c18/> concorda com uma redução ERFA do mesmo TLE (propagado pelo pacote Python <c19/>) em { "2.3" } cm.

# text
# c1: leo-navmsg
# c2: leo-navmsg
# c3: navmsg
# c4: leo-pnt-chain
# c5: docs/LEO-NAVMSG.md
# c6: 0x110315
# c7: 0x19105F
# c8: leo-navmsg-fit-interval-trade
seg-a0a4026d22ed = <b>O tipo de cenário <c1/>, nativamente e no build para navegador.</b> O tipo de cenário agora calcula toda função transcendente por uma única biblioteca matemática portátil, de modo que seu quadro tem os mesmos bytes em toda plataforma e em todo build (sob Fixed). Todo número de <c2/> se move com isso, assim como a etapa <c3/> de <c4/>. O tipo de cenário é novo nesta versão, portanto nada de uma versão anterior se move, mas os números impressos antes da correção sim: o valor de verificação de <c5/> para o cenário de codificação e decodificação era <c6/> e agora é <c7/>, e o SISRE da mensagem decodificada é { "0.129" } cm. Em kshana.dev, o cartão de Missions para <c8/> mostrava um pior erro de distância de { "1.6" } mm com um ajuste de { "60" } s e { "40.3" } mm com um ajuste de { "900" } s; o site agora é construído a partir do motor desta versão e mostra { "1.8" } mm e { "46.6" } mm.

# text
# c1: maritime-strait-jamming
seg-77f441bfc3c3 = <b>O mapa da pegada de jamming em kshana.dev (Missions).</b> Cada uma de suas { "875" } células é uma execução de <c1/> com apenas a posição do receptor alterada. As células agora são calculadas a partir das mesmas coordenadas de três casas decimais que o link "open this run" da célula fornece ao Kshana Studio, de modo que uma célula mostra exatamente o que seu link reproduz. A razão jammer-sinal (J/S) média de { "30" } células muda em { "0.1" } dB, para mais ou para menos; a disponibilidade de rastreamento de nenhuma célula muda. O motor dá resultados idênticos para toda célula na { "0.28.0" } e na { "0.29.0" }.

# text
# c1: quantum-anomaly-detect
# c2: [0.9901265, 0.9938305]
# c3: [0.99035875, 0.993861]
seg-146588a39e7c = <b>Reamostragem com semente no pacote WebAssembly (WASM).</b> O build para navegador sorteava índices de bootstrap e de embaralhamento diferentes dos do build nativo a partir da mesma semente (sob Fixed). O intervalo <c1/> da área sob a curva no navegador era <c2/> e agora é o nativo <c3/>. Nenhum número nativo muda.

# text
seg-017810049453 = Números impressos na documentação

# text
seg-85ab2a364a37 = A documentação foi auditada palavra por palavra em relação a execuções do motor desta versão. Onde um número impresso não coincidia com a execução, o documento foi corrigido, e cada correção está listada aqui, antigo → novo. Em todos os casos abaixo a saída do motor não mudou; o documento a havia lido errado, arredondado errado ou deixado de acompanhá-la.

# text
# c1: docs/SOLAR-SYSTEM.md
# c2: docs/CONSTELLATION-DESIGN.md
# c3: leo-pnt-mega-shell
seg-1eacdefbfda2 = <b>Auditoria da documentação das páginas de espectro, constelação, campanha, animação, relatório e interoperabilidade, e um novo <c1/>.</b> Todo número foi executado novamente com este motor. Dois números publicados mudam: <c2/> apresentava o teste de cobertura de { "5" } 000 satélites como "cerca de { "0.13" } s em um build de depuração"; isso não se reproduziu ({ "1.24" } s em um laptop sob carga), de modo que a página agora traz a parcela do pré-filtro que o teste imprime ({ "9.9" } % de { "19 440 000" } testes de pares) e os { "0.14" } s do binário de release para o <c3/> incluído. A mesma página apresentava o cruzamento de E3F como "errado por { "0.050" } grau"; nenhum teste imprime esse número, de modo que a página agora declara apenas o limiar de { "0.06" } grau que o teste impõe e a derivação de { "7.30" } contra { "7.36" } graus por trás dele. Nenhuma saída do motor muda.

# text
seg-2ad182e2db15 = Documentos de LEO-PNT: números publicados revisados (executados novamente no motor desta versão).

# text
# c1: docs/LEO-SIGNAL.md
# c2: generic-s
# c3: generic-c-wide
# c4: docs/LEO-NAVMSG.md
# c5: docs/LEO-PASS.md
seg-6c2401365dd5 = Troca de bandas em <c1/>: o atraso ionosférico de primeira ordem de <c2/> é { "3.24" } m (estava impresso { "3.25" } m) e o de <c3/> é { "0.77" } m (estava { "0.78" } m). Codificação e decodificação em <c4/>: o SISRE da mensagem decodificada estava impresso como { "0.119" } cm quando a execução dava { "0.122" } cm; a página agora imprime { "0.129" } cm, o número após a correção de independência de plataforma em Fixed, abaixo. Passagem LEO contra GNSS em <c5/>: { "32" } dB a menos de perda no espaço livre no pico da passagem (estava "{ "26" } a { "32" } dB"). Para os números de sinal e de passagem, a saída do motor não mudou; os documentos a haviam lido errado ou arredondado errado.

# text
# c1: /kshana-run
# c2: <scenario>.table.csv
# c3: leo-navmsg
# c4: telecom-timing
# c5: docs/tutorials/README.md
# c6: commands/kshana-run.md
# c7: oem-interop
# c8: docs/examples/multi-tool-pipeline.md
seg-fc3c8ba1b789 = <b>Tutoriais, o exemplo de pipeline elaborado e o comando <c1/>, auditados em relação ao motor desta versão.</b> Revisões de números publicados, antigo → novo: os tipos de cenário que escrevem <c2/> são seis, não quatro (<c3/> e <c4/> estavam faltando; <c5/>, <c6/>); o cruzamento ½bT² de átomos frios no Tutorial { "3" } é { "18,443" } s, não { "18,440" } s; o erro de ida e volta de <c7/> em <c8/> é o { "4.88e-7" } km medido, não "~{ "1e-7" } km"; a faixa de holdover do CSAC no Tutorial { "2" } é a de { "2000" }–{ "3200" } s que o teste afirma, não "~{ "2600" }–{ "4400" } s"; o Tutorial { "1" } cita as linhas SP3 e o bloco de geometria com a precisão com que o motor os escreve. Nenhuma saída do motor mudou.

# text
seg-4c613cabb87b = Páginas de validação, quântica, SGP4, animação, afirmações e integridade.

# text
# c1: docs/VALIDATION.md
# c2: orbit-gnss-challenged
# c3: docs/QUANTUM.md
# c4: docs/SGP4-VALIDATION.md
# c5: docs/ANIMATION.md
# c6: docs/CLAIMS-VS-REALITY.md
# c7: docs/INTEGRITY.md
seg-c49d5cdb36e1 = <c1/>: o limiar imposto sobre o desvio de Allan simulado de um segundo de um relógio com ruído branco de frequência é { "20" } % (estava impresso { "25" } %; o limiar de { "25" } % é o da curva em { "1" }, { "10" } e { "100" } s); a linha do passeio aleatório de velocidade agora declara seu limiar imposto de { "20" } % ao lado dos cerca de { "12" } % observados; e a disponibilidade do relógio atômico em escala de chip em <c2/> é cerca de { "0.73" } (estava impresso cerca de { "0.83" }). <c3/>: o ruído por disparo limitado por vibração no exemplo elaborado de átomos frios da página é cerca de { "46" } vezes seu piso de ruído de disparo (estava "~{ "45" }×"; { "46.49" } recalculado), e a faixa "{ "1" }–{ "50" } µg/√Hz" para dispositivos em campo, que contradizia um dispositivo citado pela própria página, é substituída pelos números publicados dos dois dispositivos citados. <c4/>: a pior diferença de posição é { "4.12" } mm (estava "≈ { "4" } mm"), com o satélite nomeado. <c5/>: o exemplo do codificador de vídeo lia os quadros de { "24" } quadros por segundo a { "12" }; agora usa { "24" }, a taxa que o manifesto de quadros declara. <c6/>: o modelo de jamming tem { "10" } testes (eram { "8" }), e o "{ "2.97" } m contra { "48.8" } m" do filtro acoplado é substituído pelo que seu teste afirma (o erro de posição acoplado abaixo de { "0.6" } vez o desacoplado, vencendo em pelo menos { "90" } de { "100" } tentativas). <c7/>: o carimbo "Today" indicava { "v0.22.0" }; agora nomeia esta versão, e duas capacidades construídas desde então (o modo de falha de toda a constelação e a mensagem de suporte à integridade) saem de sua lista de lacunas.

# text
# c1: spectrum
# c2: src/spectrum.rs
# c3: src/sigmf.rs
# c4: docs/SPECTRUM.md
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: [recording]
# c9: scenarios/l-band-waterfall-jamming.toml
seg-4fde8788f95f = <b>Tipo de cenário <c1/>: um modelo de espectro da banda L e uma cascata</b> (<c2/>, <c3/>, <c4/>). Toda a banda L do GNSS como uma única densidade espectral de potência (PSD): GPS L1 de curso/aquisição (C/A) e L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (portadora de deslocamento binário multiplexada, MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), um piso de ruído kT com uma figura de ruído do receptor e jammers de onda contínua (CW), de banda estreita, de varredura (chirp) e de ruído casado em uma linha do tempo roteirizada. Cada jammer é pontuado por banda por seu coeficiente de separação espectral (SSC), dando a razão jammer-sinal (J/S) e a razão efetiva entre a potência da portadora e a densidade de ruído (C/N0) por banda por linha. O gráfico é uma cascata em SVG com barras de C/N0; result.json traz a grade com média de blocos em potência. O opcional <c5/> desenha o modelo como amostras IQ, escreve e lê uma gravação Signal Metadata Format (SigMF) (<c6/>, <c7/>) e compara uma estimativa de Welch com o modelo; o opcional <c8/> estima um arquivo SigMF real. Exemplo incluído <c9/>: um chirp derruba L1 C/A e E1 em { "10" } s, um tom CW na portadora L1 mantém o C/A em { "17.98" } dB-Hz depois que o chirp termina, enquanto o E1, cujo espectro tem um nulo ali, se recupera; L5 e E5a ficam intocadas.

# text
seg-fa9976349886 = Nova linha VALIDATED: as PSDs e os SSCs dos sinais, em relação ao lóbulo principal do BPSK(n) de 2n x { "1.023" } MHz, aos lóbulos do BOC({ "1,1" }) centrados em +/-1.023 MHz, às formas fechadas de Parseval por trás dos SSCs publicados de -61.8 / -64.8 / -67.8 dB/Hz e ao Q de livro-texto = { "1" } (CW) e { "1.5" } (casado). O máximo da PSD do BOC({ "1,1" }) está em +/-0.759 MHz, não no centro do lóbulo; o teste fixa ambos.

# text
# c1: jamming
seg-411431a9b26b = Duas novas linhas MODELLED: a cascata e a linha do tempo de C/N0, que se reduzem exatamente à cadeia do tipo de cenário <c1/> (verificadas em cruzamento em todo relatório), e o codec SigMF e o estimador de Welch. Nenhuma gravação de terceiros está no repositório.

# text
# c1: navsignal
# c2: spectral_separation_coeff_offset
seg-5c5c695e7c0a = <c1/>: uma variante MBOC e <c2/>.

# text
# c1: jamming
seg-bb346f4942a9 = O relatório imprime o C/N0 que a tabela Q representativa do tipo de cenário <c1/> daria, ao lado do derivado do espectro; para um tom CW na portadora C/A eles diferem em { "1.8" } dB. Três novas linhas da matriz: uma validada (espectros de sinais e coeficientes de separação espectral) e duas modeladas.

# text
seg-673dfe048dad = <b>Efemérides do sistema solar e posicionamento em torno de qualquer corpo.</b> Dois novos tipos de cenário.

# text
# c1: solar-system
# c2: scenarios/solar-system-tour.toml
seg-3e1b0e8e99e9 = <c1/>: o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã em uma época: posição e velocidade heliocêntricas no International Celestial Reference Frame (ICRF), parâmetro gravitacional, raios, J2 (o segundo harmônico zonal) onde publicado, rotação sideral, o polo e o meridiano de origem da União Astronômica Internacional (IAU), uma trilha orbital ao longo de uma revolução, e o tempo de luz, a distância de ida e de ida e volta, o atraso de Shapiro solar e a separação do Sol a partir de um corpo observador e para qualquer enlace extra. Os planetas vêm dos elementos keplerianos do Jet Propulsion Laboratory (JPL) de Standish e Williams (Tabela { "1" }, { "1800" } d.C. a { "2050" } d.C.; Tabelas 2a/2b, { "3000" } a.C. a { "3000" } d.C.); as luas, dos elementos médios do JPL com a taxa de rotação síncrona da IAU, e Titã, do modelo de rotação da IAU. Exemplo: <c2/>.

# text
# c1: body-pnt
# c2: scenarios/mars-orbit-pnt.toml
# c3: scenarios/europa-surface-pnt.toml
seg-6a094973208b = <c1/>: um orbitador ou um módulo de pouso na superfície em torno de qualquer um desses corpos, navegando com pseudodistâncias de uma constelação Walker em torno do corpo e uma distância de ida e volta sem relógio a partir da Terra; diluição da precisão, incerteza formal e soluções de mínimos quadrados com semente, com e sem o enlace com a Terra. Exemplos: <c2/>, <c3/>.

# text
# c1: Body
# c2: AnalyticSolarSystem
# c3: EphemerisProvider
seg-ed5063379a8b = <c1/> ganha Mercúrio, Vênus, Júpiter, Saturno, Urano, Netuno, Plutão e as sete luas, uma busca por nome e um registro físico; <c2/> dá qualquer corpo em relação a qualquer outro por meio da interface <c3/> já existente.

# text
# c1: tests/fixtures/solar_system/
# c2: body-pnt
seg-8b5c2fbe91f7 = VALIDATED em relação ao JPL Horizons (Development Ephemeris DE441; fixtures e consultas em <c1/>): de Mercúrio a Saturno e a Terra, da Tabela { "1" }, dentro de duas vezes o erro nominal declarado (pior caso { "1.87" } vez), todos os oito planetas das Tabelas 2a/2b (pior caso { "1.71" } vez) e o tempo de luz da Terra a Marte e a Júpiter. MODELLED: Urano e Netuno da Tabela { "1" }, que excedem o erro declarado em relação à DE441 ({ "2.0" } e { "5.2" } vezes), Plutão, as luas, as constantes dos corpos e os resultados de <c2/>.

# text
# c1: src/ephem.rs
seg-a3c83f6d2078 = Constatação: a série lunar de Montenbruck & Gill em <c1/> já está referida ao equinócio J2000 por seu próprio termo de precessão ({ "0.05" } grau em relação ao Horizons), portanto é usada sem uma rotação de precessão adicional. Seis novas linhas da matriz: duas validadas (posições de planetas, tempo de luz) e quatro modeladas.

# text
seg-564133d6a0c4 = Constelações em torno de qualquer corpo

# text
# c1: constellation-design
# c2: src/constellation.rs
# c3: solar-system
seg-d1ddb76d8bf3 = <b>Projeto de constelações em larga escala (tipo de cenário <c1/>, <c2/>).</b> Padrões Walker delta e Walker star (T/P/F), listas explícitas de elementos e projetos de várias camadas, várias constelações por execução, em torno da Terra, da Lua, de Marte ou de qualquer outro planeta, de Plutão ou de uma lua importante, a partir das constantes de corpos que o tipo de cenário <c3/> acrescentou. Predefinições a partir de elementos nominais publicados: a linha de base do Sistema de Posicionamento Global (GPS) e a constelação expansível de 24 slots (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, edição { "1.1" }), BeiDou em órbita média da Terra Walker 24/3/1 mais satélites geoestacionários e geossíncronos inclinados (Open Service Performance Standard { "3.0" }) e GLONASS 24/3/1 (Interface Control Document { "5.1" }). Cobertura e diluição da precisão (DOP) sobre uma grade de latitude/longitude: satélites à vista, GDOP, PDOP, HDOP e VDOP (geométrica, de posição, horizontal, vertical) e disponibilidade por célula, globalmente e no pior local, com um relógio de receptor por constelação. Um pré-filtro de visibilidade (semiângulo de cobertura mais uma faixa de latitude do subsatélite, exato em um corpo esférico) processa { "5 000" } satélites em uma grade de { "10" } graus em cerca de { "0.13" } s em um build de depuração.

# text
seg-8f4ebd177f3d = VALIDATED: o gerador Walker reproduz a Tabela { "23" } do Galileo OS SDD e a fórmula de slots do GLONASS ICD; a predefinição do GPS reproduz a coluna de cruzamento do equador do SPS PS ({ "35" } de { "36" } locais dentro de { "0.0108" } grau; E3F dentro de { "0.06" } grau, sendo a própria linha da tabela inconsistente); a distribuição global de HDOP da linha de base do GPS coincide com o Apêndice B do SPS PS (mediana { "0.940" } contra { "0.94" }, { "95" } % { "1.255" } contra { "1.25" }, média { "0.965" } contra { "0.96" }; limiar { "0.03" }).

# text
seg-65658a896a73 = MODELLED: projetos arbitrários, outros corpos, a fase do BeiDou e os nós geossíncronos inclinados, órbitas de dois corpos com J2 opcional, apenas geometria.

# text
# c1: constellation-multi-gnss-coverage
# c2: leo-pnt-mega-shell
# c3: lunar-relay-constellation
# c4: kshana example
# c5: docs/CONSTELLATION-DESIGN.md
seg-3dfe470e8a5c = Cenários: <c1/> ({ "102" } satélites, disponibilidade de { "100" } %, PDOP mediano { "0.95" }, { "31.0" } à vista acima de { "10" } graus), <c2/> ({ "5 000" } satélites, disponibilidade de { "99.22" } % com PDOP de { "3" } ou menos acima de { "20" } graus, { "0" } % nas calotas polares, o pré-filtro mantém { "11.5" } % dos testes de pares), <c3/> ({ "14" } satélites em torno da Lua, disponibilidade de { "21.33" } % no total e mais alta sobre a região polar sul). Os três estão incluídos para <c4/>. Notas: <c5/>. Três novas linhas da matriz: duas validadas (gerador Walker e predefinições GNSS, DOP global do GPS) e uma modelada.

# text
seg-79e2d2c42166 = Uma campanha conduzida pelo modelo de espectro e constelações em torno de qualquer corpo.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: tests/campaign_composition_reference.rs
# c4: constellation-design
# c5: Body::by_name
# c6: solar-system
seg-4ab5f6f6bbbb = <c1/> encadeia o tipo de cenário <c2/> com um holdover de relógio e um monitor de integridade (um chirp derruba L1 C/A e E1; um tom CW então mantém o C/A rebaixado enquanto o E1 se recupera e o receptor recorre a um céu somente Galileo), fixado em relação ao exemplo de cascata autônomo em <c3/>. <c4/> agora resolve seu corpo central por <c5/>, de modo que uma constelação pode ser disposta em torno de qualquer planeta, de Plutão ou de uma lua importante com as constantes que o tipo de cenário <c6/> usa.

# text
# c1: campaign
# c2: src/campaign.rs
# c3: docs/CAMPAIGNS.md
seg-dc904f639fed = <b>Campanhas: muitos cenários compostos em uma única execução.</b> Um novo tipo de cenário <c1/> (<c2/>, documentado em <c3/>) executa membros de tipos de cenário existentes pelo mesmo despacho da linha de comando e lê números de volta de seus resultados. Quatro seções, em qualquer combinação:

# text
# c1: [[phases]]
# c2: carry
# c3: handoff
# c4: end_at
seg-903ee141047a = <c1/>: uma missão encadeada em uma única linha do tempo. Predefinições por tipo de cenário leem o erro de tempo do relógio em relação ao seu limite, a razão efetiva média entre a potência da portadora e a densidade de ruído (C/N0) em relação ao piso de rastreamento, o nível de proteção vertical em relação ao limite de alerta, o erro de posição, os satélites em rastreamento e os indicadores de alarme, mantidos em uma grade comum com limites de fase e eventos. O estado é repassado por <c2/>, <c3/> e <c4/>.

# text
# c1: [sweep]
seg-4eeedde09a77 = <c1/>: de uma a três chaves pontilhadas de qualquer tipo de cenário, opcionalmente com um conjunto com semente em cada nó.

# text
# c1: [monte_carlo]
seg-4c113198cbb7 = <c1/>: realização k com semente base + k, com média, dispersão, percentis e um intervalo de confiança bootstrap de { "95" }% com semente fixa.

# text
# c1: [compose]
# c2: campaign-jam-spoof-holdover-integrity
# c3: campaign-sweep-jammer-power
# c4: campaign-shared-jammer-sea-road
# c5: campaign-monte-carlo-clock-holdover
# c6: tests/campaign_composition_reference.rs
seg-df107253752d = <c1/>: valores compartilhados ligados a vários membros, com um resumo combinado de melhor e pior caso. Todo resultado traz um hash de campanha e um digest sobre o resultado de cada membro. Quatro cenários incluídos: <c2/> (nominal, jamming, spoofing encerrado na detecção em { "370" } s do monitor de relógio, holdover carregando o desvio forjado de { "37.0" } ns com uma unidade inercial em navegação inercial, um alarme de integridade, recuperação), <c3/>, <c4/> e <c5/>. <c6/> fixa as identidades de composição: uma campanha de uma fase reproduz a execução autônoma bit a bit em três tipos de cenário, um conjunto com semente fixa é estável byte a byte e, em um relógio com ruído branco de frequência, a média do conjunto fica dentro do intervalo informado, com a dispersão dentro do intervalo qui-quadrado de sqrt(q_wf * tau) = { "16.459" } ns. Três novas linhas modeladas da matriz.

# text
seg-c611ee59301a = Animação

# text
# c1: --animate svg|html|frames|all
# c2: src/animation.rs
# c3: docs/ANIMATION.md
# c4: manifest.json
# c5: prefers-color-scheme
# c6: prefers-reduced-motion
# c7: --animate-fps
# c8: --animate-duration
# c9: kshana::api::animate_toml
# c10: kshana::animation::animate_result
# c11: result.json
# c12: animation
# c13: --animate
# c14: tests/animation.rs
seg-14b2d3cc9e7c = <b>Exportação de animação (<c1/>, <c2/>, <a1><c3/></a1>).</b> Toda execução cujo resultado traz uma série temporal agora pode ser escrita como um arquivo Scalable Vector Graphics (SVG) animado (keyframes de Cascading Style Sheets, sem script: os traços são desenhados atrás de um cursor de tempo em movimento), um único player HyperText Markup Language (HTML) autocontido (reproduzir e pausar, arrastar, velocidade, todos os painéis em um cursor sincronizado, marcadores de evento que saltam ao clicar; nenhum recurso externo) ou uma sequência numerada de quadros SVG com um <c4/> que declara quadros por segundo, duração e tempos dos quadros para um codificador de vídeo. Uma campanha é reproduzida como suas fases, com seus alarmes marcados; uma execução de espectro anima sua cascata linha por linha. O player segue <c5/>, e sob <c6/> tanto o SVG quanto o player mostram a imagem final em vez de se mover. <c7/> e <c8/> definem a reprodução; <c9/> e <c10/> são os pontos de entrada da biblioteca, e <c11/> ganha um bloco <c12/> somente quando <c13/> é executado. A saída é uma função pura do resultado e das opções, idêntica byte a byte em uma nova execução, sem carimbo de data e hora. Um tipo de cenário sem eixo de tempo amostrado é recusado com "no time series to animate" e nada é escrito. O exportador desenha as próprias amostras da execução e não acrescenta nenhum número; por isso é MODELLED (consistência interna) e não tem linha na matriz de verificação; nenhum número publicado muda. Testes: <c14/> (determinismo, contagem de quadros, nenhum endereço externo, XML bem formado, o caminho de movimento reduzido e todo cenário incluído com série temporal sendo animado).

# text
seg-c01b78b64065 = Relatórios

# text
# c1: src/advanced_report.rs
# c2: <scenario>.report.html
# c3: <scenario>.report.json
# c4: units
# c5: sweep
# c6: sweep-nd
# c7: orbit
# c8: slot-timing
# c9: KSHANA_GIT_COMMIT
# c10: --study-name
# c11: --report pdf
# c12: tests/advanced_report.rs
# c13: tests/advanced_report_cli.rs
# c14: result.json
seg-2662fdb991f3 = <b>Relatórios avançados de execução (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Toda execução pela interface de linha de comando (CLI) agora escreve <c2/>, um relatório imprimível em HyperText Markup Language (HTML), e <c3/>, o mesmo conteúdo como um documento JavaScript Object Notation (JSON) legível por máquina. Seções: um resumo executivo; toda entrada do cenário com sua unidade, lida do esquema de unidades dos campos (o bloco <c4/> do resultado), ou então do sufixo do nome do campo, ou então declarada como não declarada; os resultados com o gráfico da execução, todo escalar e um resumo de toda coluna numérica; para uma campanha, a tabela de nós da varredura, a média de Monte Carlo, o desvio padrão, os percentis 5, 50 e 95 e o intervalo de confiança bootstrap com um histograma por métrica, a tabela de fases da cadeia, ou os membros e o resumo combinado da composição (e a grade de uma execução <c5/> ou <c6/>); uma linha do tempo de eventos; o rótulo VALIDATED / MODELLED / PARTNER, a referência independente e a evidência de teste de toda linha da matriz de verificação que os tipos de cenário da execução exercitam, lidos da matriz por meio de uma correspondência entre tipo de cenário e linha (uma linha que avalia um único caminho de entrada, como o caminho Simplified General Perturbations { "4" } (SGP4) de <c7/> ou o caminho de registro medido de <c8/>, é listada somente quando a execução seguiu esse caminho, e a linha do leitor da Shuttle Radar Topography Mission (SRTM) não é listada para nenhum tipo de cenário, pois nenhum campo de cenário lê um bloco SRTM); as declarações do que não é modelado e as premissas, cada uma citada com sua fonte; e um registro de reprodutibilidade (versão do motor, o commit de origem quando o build define <c9/>, digests Secure Hash Algorithm 256-bit (SHA-256) do arquivo do cenário e do documento de resultado, semente, plataforma e o comando exato). O relatório não lê relógio: o mesmo cenário, semente e build do motor dão um relatório idêntico byte a byte, e o único carimbo de data e hora que ele pode mostrar é o que <c10/> já escreve. Uma folha de estilo de impressão se ajusta a A4 e US Letter, repete cabeçalhos de tabela e mantém linhas e figuras inteiras entre páginas; um arquivo Portable Document Format (PDF) é feito com "Salvar como PDF" do navegador. Não há opção <c11/>, porque renderizar os gráficos em um PDF exigiria uma dependência nova e pesada. Testes: <c12/> reporta todo cenário incluído (nenhuma seção vazia, nenhum texto de preenchimento, rótulos iguais aos da matriz, o digest do cenário igual ao do arquivo, idêntico byte a byte em uma nova execução) e <c13/> executa novamente o comando registrado em um diretório novo e exige um <c14/> idêntico byte a byte. Nenhum número publicado muda, e as contagens de tipos de cenário, de arquivos de cenário e de linhas da matriz permanecem inalteradas.

# text
# c1: report.json
# c2: companions
seg-ce45e75c6d67 = <b>O relatório, a animação e as exportações funcionam em conjunto.</b> O relatório avançado ganha uma seção "Animação e exportações": o desenho animado da execução embutido como imagem inerte (ou o motivo de não haver nenhum), links para os arquivos de animação e de exportação escritos ao lado dele, e todo formato de interoperabilidade com a indicação de se se aplica, por que não e sua especificação; <c1/> traz o mesmo bloco <c2/>. O player de animação em HTML lista os arquivos de exportação escritos ao lado dele. A interface de linha de comando (CLI) agora renderiza as exportações antes de escrever o relatório, de modo que ambos possam nomear os arquivos.

# text
seg-c60dc5b92a60 = Exportações de interoperabilidade

# text
# c1: --export
# c2: src/interop/
seg-5bfce52c5a13 = Exportações e importações de interoperabilidade (<c1/>, <c2/>, docs/INTEROP.md).

# text
# c1: kshana <scenario.toml> --export <format>
# c2: gx:Track
# c3: .e
# c4: EphemerisTimePosVel
# c5: spectrum
# c6: src/sigmf.rs
# c7: --export all
# c8: --export list
# c9: INERTIAL
# c10: ICRF
# c11: FIXED
# c12: jamming
# c13: --import-route <file.geojson>
# c14: LineString
# c15: terrain-nav
# c16: terrain-slam
# c17: gravity-map
# c18: combined-altpnt
# c19: tests/interop_formats.rs
# c20: spectrum
# c21: PassesScenario
# c22: propagator()
# c23: epoch_calendar()
# c24: epoch
# c25: t = 0
# c26: Sgp4::epoch_jd_utc
# c27: Sp3Interpolator::jd_ut1
# c28: Propagator::own_jd_utc
seg-44e7c902490a = <c1/> escreve a geometria do cenário como CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, um padrão do Open Geospatial Consortium, com trilhas <c2/> marcadas no tempo), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) e efemérides <c3/> do Ansys STK (Systems Tool Kit) (<c4/>, metros, um arquivo por objeto em movimento), e o instantâneo IQ (em fase e em quadratura) sintetizado do tipo de cenário <c5/> como um par SigMF (Signal Metadata Format) por meio do <c6/> já existente. <c7/> escreve todo formato que se aplica e imprime por que os outros não se aplicam; <c8/> informa sem executar. Os objetos em movimento são escritos no Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) e em longitude, latitude e altura WGS { "84" } (World Geodetic System { "1984" }) fixas na Terra (KML, GeoJSON); os locais fixos em CZML são <c11/>. O tipo de cenário <c12/> acrescenta duas pegadas de jammer a partir de suas próprias equações de enlace. <c13/> escreve um <c14/> GeoJSON nas entradas de trilha de <c15/>, <c16/>, <c17/> e <c18/>. As exportações são determinísticas byte a byte e não trazem carimbo de data e hora. <c19/> valida toda exportação em relação à sua especificação publicada, compara os estados de satélite exportados com os do próprio motor até { "1" } mm e executa todo cenário incluído por todo formato, cada um exportando ou declarando por que não (a tabela em docs/INTEROP.md). Nenhum número publicado muda: a síntese de IQ do tipo de cenário <c20/> passou para uma função compartilhada e seu documento de resultado é idêntico byte a byte, e <c21/> ganha <c22/> e <c23/>, usados por sua própria execução. As contagens de tipos de cenário, de arquivos de cenário e da matriz de verificação permanecem inalteradas. Um cenário de órbita ou de integridade sem <c24/> é datado pelos dados dos próprios satélites: <c25/> é a época mais antiga entre TLE (conjunto de elementos de duas linhas), efemérides de transmissão ou SP3 (Standard Product { "3" }), e cada satélite assim é rotacionado para os referenciais GCRS e fixo na Terra em seu próprio instante; 2000-01-01T00:{ "00" }:00Z é usado somente quando nenhum satélite traz uma época. As exportações SP3 e OEM (Orbit Ephemeris Message) mantêm seu rótulo 2000-01-01. Para dar suporte a isso, <c26/>, <c27/> e <c28/> foram acrescentados; nada do que já existia os lê.

# text
seg-12c151a800f9 = Navegação em órbita baixa da Terra: sinal

# text
# c1: leo-signal
# c2: spectrum
seg-9b665682695a = <b>Projetos de sinal LEO-PNT e um espectro multibanda.</b> Um novo tipo de cenário <c1/> e um tipo de cenário <c2/> que vai além da banda L: um tipo de cenário, quatro arquivos de cenário (três incluídos; o arquivo Celeste IOD é exclusivo do repositório) e quatro linhas da matriz (duas VALIDATED, duas MODELLED).

# text
# c1: leo-signal
# c2: data/leo-signals/
# c3: scenarios/leo-band-trade.toml
# c4: scenarios/xona-pulsar-signals.toml
# c5: scenarios/celeste-iod-classical-pilot-signals.toml
# c6: docs/LEO-SIGNAL.md
seg-b355b28bfd1b = <c1/>: projetos parametrizados de sinal de posicionamento, navegação e temporização (PNT) em órbita baixa da Terra (LEO) para qualquer sistema (banda, largura de banda de transmissão, alocação da ITU; componentes de aquisição, de dados e de piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, participações de potência, subportadoras FDMA, comprimentos de código e taxas de dados), a partir de arquivos de predefinições públicas compilados em <c2/> (Xona Pulsar X1/X5, Iridium STL, um sinal de oportunidade da Starlink, CentiSpace, um projeto representativo de banda C e projetos representativos de UHF/L/S/C/C larga, cada um citando sua URL de origem) ou escritos em linha. Por sinal: a PSD limitada em banda e as frações de potência em banda, a largura de banda de Gabor, o jitter de rastreamento de código early-late limitado em banda contra C/N0 e espaçamento (Betz & Kolodziejski { "2009" }) e a precisão de alcance, o espaço de busca de aquisição, a probabilidade de detecção e o tempo médio de aquisição serial e paralela de código, o SSC para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a perda de C/N0, a tolerância de J/S CW, de banda larga e casada a partir do código de SSC do tipo de cenário de espectro, uma troca de bandas (atraso ionosférico, perda no espaço livre, alcance com C/N0 igual e EIRP igual, tolerância a jammer) e verificações opcionais de formato em relação a uma medição descrita. Exemplos: <c3/>, <c4/>, <c5/> (as bandas e a configuração de sinal do Celeste IOD apresentadas no workshop LEO-PNT da ESA NAVISP, { "2026" }; retidas junto com a predefinição Celeste IOD, ver "LEO-PNT de ponta a ponta" abaixo). Notas em <c6/>.

# text
# c1: spectrum
# c2: [[panels]]
# c3: wideband
# c4: bands[].tracked_power_dbw
# c5: bands[].design
# c6: panels
# c7: not_modelled
# c8: scenarios/multi-band-jamming-waterfall.toml
seg-8f58debf721f = <c1/>: as bandas agora podem ser um projeto de sinal predefinido (todo componente desenhado, limitado em banda, com C/N0 e J/S referidos ao componente rastreado) ou uma portadora e modulação personalizadas; <c2/> acrescentam cascatas sobre outras faixas de frequência em uma única linha do tempo; um jammer <c3/> (barrage) se junta às quatro formas de onda. O relatório acrescenta <c4/>, <c5/> e <c6/>, e uma entrada <c7/>. As bandas simples dão os mesmos números de antes. Exemplo: <c8/>.

# text
# c1: navsignal
# c2: Modulation::label
seg-98f74d85c54b = <c1/> ganha a integral seno, as formas fechadas da potência em banda do BPSK e da largura de banda de Gabor limitada em banda, o jitter early-late limitado em banda para qualquer espectro e seu limite de Gabor, a forma fechada do SSC do BPSK deslocado, o espectro AltBOC({ "15,10" }) do Galileo E5 e um analisador de rótulos de modulação; <c2/> imprime BPSK(1/3) como fração.

# text
# c1: leo-signal
seg-78d9e5e2c615 = Quatro linhas da matriz: formas fechadas limitadas em banda VALIDATED ({ "90.3" } % da potência do BPSK no lóbulo principal, o jitter se reduzindo à forma coerente de Kaplan & Hegarty, { "0.0039564" } chips a { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, e ao seu limite de Gabor, e o auto-SSC do BPSK 2/({ "3" } R_c); a forma fechada de Gabor e o SSC deslocado em relação à sua forma de Parseval são declarados como verificações cruzadas internas); Doppler máximo em LEO VALIDATED (Xona X1 { "33.2" } kHz dentro dos { "32" } a { "34" } kHz publicados, Iridium dentro de { "0.5" } kHz de { "36" } kHz); <c1/> MODELLED; espectro multibanda MODELLED.

# text
seg-45d3d4a46d6b = Navegação em órbita baixa da Terra: enlace

# text
# c1: leo-pass
# c2: constellation-design
# c3: [iot]
seg-1d120db87aae = <b>Passagem LEO-PNT e orçamento de enlace por banda: o tipo de cenário <c1/>.</b> LEO-PNT é posicionamento, navegação e temporização a partir de satélites em órbita baixa da Terra (LEO). Um usuário (terrestre, marítimo, aéreo ou em ambiente interno, estático ou em movimento) e um ou mais satélites LEO a partir de uma passagem projetada, de elementos explícitos, de um conjunto de elementos de duas linhas (TLE) por SGP4 ou de uma constelação Walker do código de <c2/>. Por satélite, banda e época: ângulos de visada, distância, taxa de variação da distância e aceleração da distância em forma fechada (verificadas a cada execução por diferenças centrais), Doppler e taxa de Doppler, perda no espaço livre, EIRP (potência isotrópica radiada equivalente) com um diagrama de satélite isofluxo, de feixe gaussiano ou plano, uma antena de usuário do tipo patch, atenuação gasosa da ITU-R P.676, atenuação por chuva da ITU-R P.838/P.618, cintilação troposférica da P.618, perda de penetração em edificações da ITU-R P.2109 para um usuário em ambiente interno, descasamento de polarização, temperatura de ruído do sistema e C/N0 (razão entre a potência da portadora e a densidade de ruído); o atraso ionosférico de primeira ordem por banda a partir de um TEC oblíquo de Klobuchar ou de TEC vertical (conteúdo eletrônico total) abaixo do satélite, e pares de bandas livres de ionosfera com sua amplificação de ruído. Satélites Galileo ou GPS são avaliados com o mesmo receptor a partir das potências recebidas de seus documentos de interface, de modo que a passagem LEO em forma de sino e as portadoras planas de MEO (órbita média da Terra) compartilham um mesmo gráfico. Uma seção <c3/> dá o tempo até a primeira solução, a energia por solução e a vida útil da bateria em função do ciclo de trabalho (MODELLED).

# text
# c1: src/celeste_iod.rs
seg-17f3503e1be3 = Agnóstico quanto ao sistema: o motor não precisa de nenhuma predefinição. Predefinições opcionais, cada uma em seu próprio arquivo e marcada como PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP: multibanda genérica (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink como sinal de oportunidade somente com Doppler, CentiSpace e Celeste IOD (demonstração em órbita), cujos parâmetros de sinal foram apresentados no workshop LEO-PNT da ESA NAVISP, { "2026" }, e ficam em <c1/> para que possam ser retidos (ver "LEO-PNT de ponta a ponta" abaixo).

# text
# c1: src/leo_link/
seg-a338cc46a1e0 = Blocos de construção públicos em <c1/> (geometria, antena, itu, iono, energia, predefinições) para outros módulos chamarem.

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-pass-celeste-iod-multiband
seg-887ad03cb6f6 = Cenários: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
# c1: docs/LEO-PASS.md
seg-a20f1602c236 = Nove linhas da matriz. VALIDATED ({ "6" }): coeficientes da ITU-R P.838-3 em relação à sua Tabela { "5" }; atenuação por chuva e cintilação da P.618-14 em relação aos exemplos de validação do Study Group { "3" } da ITU-R; perda de penetração em edificações da P.2109 em relação à planilha do Study Group { "3" }; escalonamento ionosférico de primeira ordem em relação à razão de atraso de grupo da IS-GPS-200, com a perda no espaço livre; o Doppler máximo de um usuário estático em uma órbita circular em relação à Tabela { "1" } do arXiv { "2509.19551" }. MODELLED ({ "3" }): a passagem e o orçamento de enlace, as predefinições e o orçamento de solução de baixa energia. Um tipo de cenário e seis arquivos de cenário. Notas em <c1/>.

# text
seg-ef74b0f08aa1 = Navegação em órbita baixa da Terra: mensagem de navegação

# text
# c1: leo-navmsg
# c2: src/leo_navmsg/
# c3: docs/LEO-NAVMSG.md
seg-866ff4ee8b19 = <b>Mensagem de navegação LEO (tipo de cenário <c1/>, <c2/>).</b> A mensagem de efemérides e de relógio transmitida por um satélite de posicionamento, navegação e temporização (PNT) em órbita baixa da Terra (LEO), para qualquer órbita, portadora e modelo; as predefinições nomeadas são dados opcionais e toda capacidade funciona sem elas. Um tipo de cenário, cinco arquivos de cenário e nove linhas da matriz (três VALIDATED, seis MODELLED). Ver <c3/>.

# text
seg-c42821b6e855 = Conteúdo da mensagem: SVID, edição dos dados, banda e saúde do sinal; semana, tempo da semana e um polinômio de relógio de segunda ordem; as efemérides em um de quatro modelos (o conjunto kepleriano de 16 parâmetros do Galileo OS SIS ICD, esse conjunto mais polinômios de correção ao longo da trajetória, transversal e radial, o modelo de 22 parâmetros de Liu et al. { "2025" } (doi 10.3390/rs17162894) ou o polinômio ECEF de relógio zero do ATOMIC), e um conjunto de Klobuchar, coeficientes NeQuick-G com o nível efetivo de ionização e parâmetros de tempo do sistema para UTC com os casos de segundo intercalar do ICD.

# text
seg-e4565696f162 = Ajustador: uma órbita verdadeira integrada com gravidade zonal J2–J6 ou EGM2008 e arrasto, um relógio com semente, livre ou conduzido, um ajuste de Levenberg–Marquardt sobre elementos não singulares, depois polinômios de correção por mínimos quadrados lineares e um relógio ajustado líquido do termo relativístico do usuário.

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
seg-a7287b7b336c = Quatro análises e cenários: <c1/> (erro de distância do sinal no espaço (SISRE) em função do intervalo de ajuste e do período de atualização), <c2/> (quatro modelos, bits e o ajuste de 22 parâmetros do Kshana nas altitudes de Liu et al. ao lado dos números publicados, MODELLED), <c3/> (continuidade a cada troca de mensagem em uma passagem) e <c4/> (o próprio quadro binário documentado do Kshana com CRC-24Q e um orçamento de quantização, um bloco no estilo RINEX 4 rotulado como extensão do Kshana e uma tabela CSV).

# text
# c1: tests/leo_navmsg_reference.rs
seg-e272dce3d10f = VALIDATED: os pesos de SISRE médios globais em relação à tabela publicada de órbita média e geoestacionária de Montenbruck et al. { "2018" }; o algoritmo de usuário do Galileo em relação ao RTKLIB em quatro efemérides de transmissão reais do Galileo (<c1/>); o CRC-24Q em relação ao valor de verificação do catálogo e ao quadro de exemplo RTCM { "10403" } { "1005" }.

# text
# c1: src/celeste_iod.rs
seg-5c8592195b0d = Predefinições, um arquivo cada uma com fontes: Xona Pulsar e Pulsar-0, Iridium, Starlink, CentiSpace, um sistema representativo de banda C, ATOMIC e Celeste IOD (a única predefinição que usa material apresentado no workshop LEO-PNT da ESA NAVISP, { "2026" }, mantida em <c1/> com seus cenários para que possa ser retida).

# text
seg-9fb0cbf29cef = Navegação em órbita baixa da Terra: fusão

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
# c5: src/celeste_iod.rs
seg-071f4db017c5 = <b>Posicionamento, navegação e temporização fundidos MEO + LEO: <c1/>, <c2/> e <c3/>.</b> Três novos tipos de cenário em <c4/>, agnósticos quanto ao sistema: toda constelação é de camadas Walker, conjuntos de elementos ou uma predefinição GNSS, todo sinal é uma portadora, uma taxa de chips e um envelope de razão entre a potência da portadora e a densidade de ruído (C/N0), todo orçamento de erro é um desvio padrão explícito, e os sistemas nomeados em órbita baixa da Terra (LEO) são predefinições opcionais, um arquivo cada uma com suas fontes marcadas como públicas, de workshop ou derivadas (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), sinais de oportunidade da Starlink, CentiSpace, um sistema representativo de banda C, o modelo de efemérides de relógio zero ATOMIC e uma predefinição de demonstração em órbita Celeste da ESA, cujos parâmetros derivados do workshop ficam em <c5/> para que possam ser retidos).

# text
# c1: leo-pvt
seg-f28f7a441263 = <c1/> tem quatro modos: posicionamento por Doppler (mínimos quadrados em lote sobre a taxa de variação da distância com estados de deriva do relógio e de velocidade, um modo de sinais de oportunidade somente com Doppler, a precisão ao longo da trajetória e transversal em uma única passagem, e o envelope de Doppler, taxa de Doppler e jerk); mínimos quadrados ponderados conjuntos GNSS + LEO com um relógio por sistema (o viés entre sistemas) ou um desvio conhecido, sigmas por medição como entradas e o DOP em função do número de satélites LEO; cobertura polar e do Ártico em função da latitude; e transferência de tempo LEO para o Tempo Universal Coordenado (UTC) em função do C/N0 e do oscilador do receptor, com a expressão de tempo do sistema para UTC da IS-GPS-200.

# text
# c1: leo-ppp
seg-57afa384aabd = <c1/>: um filtro de Kalman estendido de posicionamento por ponto preciso (PPP) com ambiguidade flutuante sobre código e fase livres de ionosfera, somente GNSS e com aumento por LEO, com seu tempo de convergência e um teste de consistência NEES (erro de estimação normalizado ao quadrado) de Monte Carlo. O cenário incluído dá { "7.4" } min com quatro sistemas MEO e { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO, ao lado dos { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min de Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) como comparação MODELLED da tendência.

# text
# c1: ntn-positioning
seg-3fa0556b3737 = <c1/>: posicionamento 5G em rede não terrestre (NTN) na banda S de satélite móvel n256 do 3GPP, a partir do limite de Cramér-Rao sobre o tempo de chegada e o Doppler.

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: leo-ppp-convergence
# c5: ntn-5g-positioning
# c6: polar-arctic-leo-coverage
# c7: leo-timing-utc
# c8: celeste-iod-fused-pvt
seg-a0cc2699e276 = Cenários: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (incluídos) e <c8/> (exclusivo do repositório, retido junto com a predefinição Celeste IOD).

# text
# c1: tests/leo_doppler_reference.rs
# c2: docs/LEO-PNT-FUSION.md
seg-c0b6b98eeac3 = Oito linhas da matriz: o envelope de Doppler em LEO VALIDATED em relação aos números publicados do Iridium (±{ "36" } kHz: { "35.9" } kHz, dentro de { "5" }%) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz: { "33.6" } kHz a partir da camada de { "97" } graus, sem alargamento) (<c1/>); posicionamento por Doppler, posicionamento conjunto por pseudodistância, convergência do PPP, limites de NTN, temporização LEO, cobertura polar e predefinições MODELLED. Três tipos de cenário e oito arquivos de cenário. Documentação: <c2/>.

# text
# c1: leo-pnt-chain
# c2: docs/LEO-PNT.md
seg-173793480abc = <b>LEO-PNT de ponta a ponta: o tipo de cenário <c1/> e as etapas LEO ligadas entre si.</b> Um sistema de posicionamento, navegação e temporização (PNT) em órbita baixa da Terra (LEO) acompanhado desde o projeto do sinal até a posição do usuário, cada etapa sendo um tipo de cenário do próprio motor em sua própria tabela de cenário, com valores repassados em código (<a1><c2/></a1>):

# text
# c1: leo-pass
# c2: leo-signal
# c3: signal = "xona-x5"
# c4: iono_free
seg-41a4a2183ba3 = As bandas de <c1/> podem nomear um projeto de <c2/> (<c3/>): a banda adota o centro, a largura de banda de transmissão e a taxa de chips do componente rastreado do projeto, divide seu EIRP (potência isotrópica radiada equivalente) entre os componentes do projeto e informa, a cada época, o C/N0 (razão entre a potência da portadora e a densidade de ruído) do componente rastreado e o jitter de rastreamento de código limitado em banda (o erro de alcance; o ruído do par <c4/> também o usa). Uma banda sem projeto dá a mesma saída de antes.

# text
# c1: leo-pnt-chain
# c2: leo-pvt
# c3: leo-ppp
# c4: od_sisre_m
# c5: tests/leo_pnt_chain.rs
# c6: LeoNavmsgScenario::broadcast_sisre
seg-a076a43a9d44 = <c1/> executa sinal -> passagem -> mensagem de navegação -> solução conjunta fundida <c2/> -> <c3/> opcional. Todo sistema LEO da etapa de posicionamento que os deixa sem definição adota uma reta de C/N0 em sin(elevação) ajustada à passagem, o erro de distância do sinal no espaço da mensagem (SISRE: seu erro de representação na órbita do satélite da passagem, com um termo de determinação de órbita <c4/> declarado, em raiz da soma dos quadrados) e a portadora e a taxa de chips do projeto; os casos de posicionamento por ponto preciso (PPP) adotam o SISRE. Cada repasse é listado com seu valor e sua unidade, e <c5/> verifica que cada um é igual à saída a montante e que alterações a montante movem os números a jusante. <c6/> é o novo ponto de entrada da mensagem.

# text
# c1: leo-pnt-end-to-end
# c2: generic-l
# c3: xona-pulsar-end-to-end
# c4: celeste-iod-end-to-end
seg-8c256ed478e9 = Cenários: <c1/> (uma constelação genérica de { "1080" } km e o sinal representativo <c2/>), <c3/> (o sinal público X5), ambos incluídos, e o opcional <c4/>, exclusivo do repositório.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: kshana_celeste
# c4: scenarios/*celeste-iod*.toml
# c5: tests/workshop_preset_isolation.rs
seg-879259c7ff86 = As predefinições Celeste IOD (demonstração em órbita) das áreas de passagem, mensagem e posicionamento fundido agora ficam em um único arquivo, <c1/>, que <c2/> compila somente quando ele existe (o sinalizador de configuração <c3/>). Seus cinco cenários (<c4/>) são exclusivos do repositório, de modo que apagar esse arquivo e esses cenários retém todo número apresentado no workshop LEO-PNT da ESA NAVISP, { "2026" }, sem nenhuma edição de código-fonte; <c5/> verifica quais arquivos podem nomear a predefinição ou conter os números de seu plano de bandas.

# text
# c1: leo-pvt
# c2: t_s
# c3: leo-ppp
# c4: t_min
# c5: leo-pass
# c6: leo-pnt-chain
seg-110b1f7c7c63 = Todo tipo de cenário LEO na correspondência do relatório avançado, com suas linhas específicas de cada caminho listadas somente quando a execução seguiu esse caminho (uma taxa de chuva, uma edificação, uma análise ou um modo que foi executado). As janelas de Doppler de <c1/> ganham <c2/> e os casos de <c3/> ganham <c4/>, de modo que ambos são animados; <c5/> e <c6/> exportam efemérides CZML, KML, GeoJSON e STK, e os demais tipos de cenário LEO declaram por que um formato não se aplica.

# text
seg-1419edea5329 = Navegação em órbita baixa da Terra: resiliência, áreas de foco e cenários de usuário final

# text
# c1: docs/LEO-PNT.md
seg-d084d86044b4 = <b>Resiliência LEO-PNT, um cenário por área de foco de experimento e um por vertical de usuário final, e <c1/> como visão geral de todo tipo de cenário e cenário LEO.</b> Todo cenário executa sem nenhum dado Celeste e está incluído.

# text
# c1: leo-pass
# c2: [spoofer]
# c3: leo_link::spoof
seg-07e91f076ab2 = <c1/> ganha uma seção <c2/>: um spoofer falsifica, de modo autoconsistente em distância e taxa de variação da distância, os sinais de uma posição declarada que salta e/ou é empurrada para longe da verdadeira após um início (por banda LEO e o sinal GNSS de MEO), com ou sem a ionosfera. Dois monitores operam com uma probabilidade de falso alarme declarada: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas em relação às previstas a partir das órbitas e de uma posição e velocidade a priori independente; um qui-quadrado de mínimos quadrados generalizados sobre uma janela, nos canais GNSS, LEO e em todos os canais, com ruído do laço de travamento de frequência a partir do C/N0) e consistência entre bandas (o degrau da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO). O resultado dá as estatísticas por época (de modo que é animado), cada par e o momento em que cada monitor detecta. Blocos de construção em <c3/>. Sem a seção, a saída permanece inalterada.

# text
# c1: leo-pass
# c2: leo-pass
seg-6a7852f1f053 = Todo par de bandas de <c1/> também informa o conteúdo eletrônico total (TEC) oblíquo que sua combinação livre de geometria recupera no pico da passagem e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Isso acrescenta dois campos a todo resultado multibanda de <c2/>; nenhum número existente muda.

# text
# c1: leo-pvt
# c2: trace = true
seg-bdf333f4c978 = O modo de temporização de <c1/> aceita <c2/>: cada linha então informa seu erro de tempo e seu sigma previsto a cada época, com os mesmos sorteios, de modo que as estatísticas das linhas não mudam e a execução é animada e encadeada em uma campanha.

# text
# c1: docs/INTEROP.md
seg-eb4461740dc5 = Uma campanha agora exporta cada cenário membro que tem geometria (execuções de fase, os cenários base de varredura e de Monte Carlo, membros compostos com seus valores compartilhados ligados) como seu próprio conjunto de arquivos, com o rótulo do membro no nome do arquivo; antes, uma campanha não exportava nada. A tabela de interoperabilidade em <c1/> muda de acordo.

# text
# c1: system.2.sisre_m
seg-c0b1f4d9fed0 = Uma chave de varredura de campanha pode indexar um vetor de tabelas por posição (<c1/>).

# text
# c1: leo-resilience-multiband-diversity
# c2: leo-resilience-js-margin
# c3: leo-resilience-spoof-doppler
# c4: leo-resilience-spoof-monitors
# c5: leo-resilience-gnss-jammed-leo-carries
seg-4c995017dd9c = Cenários de resiliência: <c1/> (um barrage de { "50" } MHz na banda L5 com varredura de potência: todo sinal da banda L cai, e os sinais LEO em UHF, banda S e banda C mantêm seu C/N0), <c2/> (margem de J/S a partir da potência recebida: GPS L5, Galileo E5a e Xona X5 perdidos em -105, -100 e -95 dBW, um sinal LEO genérico de -135 dBW ainda rastreando em -90 dBW), <c3/> (um salto de { "30" } m não percebido pelo teste de Doppler somente GNSS e detectado pelo teste em todos os canais { "105" } s após o início), <c4/> (quatro spoofers contra os dois monitores) e <c5/> (GNSS sob jamming, a camada LEO em banda S e banda C rastreada, o monitoramento autônomo de integridade pelo receptor apenas na camada LEO alarmando em { "2" } de { "30" } épocas).

# text
# c1: leo-focus-ppp-altitude
# c2: leo-focus-ntn-bandwidth
# c3: leo-focus-iot-eirp
# c4: leo-focus-science-iono-sounding
# c5: leo-focus-data-services
# c6: leo-focus-indoor-uhf
# c7: leo-focus-fused-pnt-sisre
# c8: leo-resilience-multiband-diversity
seg-bae66dac04cc = Cenários de áreas de foco: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (a resiliência em L, S e C é <c8/>).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: leo-vertical-rail-maritime
# c3: leo-vertical-critical-infrastructure-timing
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-5g-network-timing
# c6: leo-vertical-asset-tracking-iot
# c7: docs/LEO-PNT.md
seg-c7947d9cc592 = Campanhas de verticais, cada uma animada e exportando suas passagens LEO: <c1/>, <c2/> (os cenários marítimos e ferroviários incluídos mais LEO), <c3/>, <c4/>, <c5/>, <c6/>. Resultados de uma linha em <c7/>.

# text
# c1: tests/leo_resilience_verticals.rs
seg-222ad0b777f8 = Três linhas MODELLED da matriz: o monitor de spoofing por Doppler e geometria da passagem, o monitor de spoofing entre bandas e a sondagem da ionosfera. <c1/> verifica os monitores (silenciosos antes do início, a estatística de Doppler quadrática em um salto, o degrau ionosférico de um spoofer em solo e nenhum em um que considera a ionosfera), a identidade da sondagem, o rastro de temporização em relação às estatísticas das linhas e que a exportação de uma campanha é igual à de cada membro.

# text
# c1: leo-pass
# c2: docs/LEO-PASS.md
# c3: docs/LEO-PNT.md
seg-f650b42bf210 = A página de <c1/> passa para <c2/>; <c3/> é a visão geral.

# text
seg-00a4ba834f37 = <b>Cenários marítimos, rodoviários e ferroviários.</b> Cinco exemplos incluídos em tipos de cenário existentes, de modo que navios, veículos rodoviários e trens tenham cada um um caso elaborado. Todos os números são MODELLED; nenhum é validado em relação a dados medidos.

# text
# c1: scenarios/maritime-strait-jamming.toml
# c2: jamming
seg-682414bbe0c6 = <c1/> (<c2/>): um jammer de banda larga de { "50" } W em um mastro de { "30" } m, a { "30" } km de distância sobre águas abertas, de um navio. Razão jammer-sinal (J/S) média de cerca de { "48" } dB, e a disponibilidade cai de { "1.00" } para { "0.00" }.

# text
# c1: scenarios/maritime-port-approach-coast.toml
# c2: ins-trn-coast
seg-4666dcd72c24 = <c1/> (<c2/>): um sistema de navegação inercial (INS) de classe de navegação a { "12" } nós, com o GNSS perdido e sem nenhum auxílio. Ele atinge { "10" } m após { "281" } s e { "100" } m após { "833" } s, os números de aproximação de porto e de águas oceânicas da Resolução A.1046({ "27" }) da Organização Marítima Internacional (IMO), usados aqui como orçamentos.

# text
# c1: scenarios/maritime-spoof-position-push.toml
# c2: spoof-detect
seg-7407bb97aedd = <c1/> (<c2/>): um spoofer de +{ "2" } dB, não alinhado à portadora, empurrando quatro satélites para arrastar um navio por { "500" } m. O monitor fundido o detecta (pontuação { "0.70" } contra um limiar de { "0.50" }) por monitoramento autônomo de integridade pelo receptor (RAIM) e monitoramento da qualidade do sinal (SQM); o monitoramento de potência sozinho não o percebe.

# text
# c1: scenarios/automotive-urban-canyon.toml
# c2: gnss-ins
seg-1edc0541930b = <c1/> (<c2/>): um carro por uma passagem inferior de { "15" } s e uma interrupção de { "60" } s por um jammer à beira da estrada, contra um orçamento de meia faixa de { "1.5" } m. O erro de raiz do valor quadrático médio (RMS) fundido durante a interrupção é { "1.9" } m para uma unidade microeletromecânica (MEMS) de classe automotiva e { "0.7" } m para um comparador de classe tática; em funcionamento livre, a unidade MEMS deriva até { "850.8" } m.

# text
# c1: scenarios/rail-tunnel-coast.toml
# c2: ins-trn-coast
# c3: kshana example
seg-f9830a49659f = <c1/> (<c2/>): um INS de classe tática em um trem a { "160" } km/h em um túnel. Ele atinge { "2" } m (discriminação de trilho) após { "35.8" } s, cerca de { "1.6" } km adiante, e { "20" } m após { "107.3" } s. Isto é somente INS: o motor não tem modelo de odômetro, de modo que é o limite pessimista. A contagem de arquivos de cenário do README passa de { "77" } para { "82" }. Todos os cinco estão incluídos para <c3/> e listados no playground do navegador.

# text
seg-77c8c53126fd = Servidor do Model Context Protocol

# text
seg-2deb4b35b41a = O servidor do Model Context Protocol (MCP) alcança todo tipo de cenário e toda visão de uma execução: sete novas ferramentas, catorze no total.

# text
# c1: run_scenario
seg-7f4035dfd9db = <c1/> já despachava todo tipo de cenário; o que faltava a um agente era um caminho até um cenário válido de um tipo de cenário e as três saídas que a linha de comando escreve ao lado de um resultado. Novas ferramentas:

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: kshana example
# c4: scenarios/
# c5: lunar-llr-datum
seg-d9df5ab8817a = <c1/> e <c2/> servem os cenários de referência incluídos (a tabela de <c3/>), cada um com seu tipo de cenário e a primeira frase de seu próprio cabeçalho, byte a byte o arquivo em <c4/>. Um cenário que está no repositório mas não incluído é recusado com o motivo. Todo tipo de cenário, exceto <c5/> (cujo recorte de dados acompanha apenas o repositório), tem pelo menos um exemplo.

# text
# c1: report_scenario
# c2: docs/REPORTS.md
seg-cb24ad7147ef = <c1/> devolve o relatório da execução como JSON (JavaScript Object Notation) ou como página HTML (HyperText Markup Language) imprimível (<c2/>).

# text
# c1: animate_scenario
# c2: docs/ANIMATION.md
seg-9264b2f20e15 = <c1/> devolve a série temporal da execução como um desenho SVG (Scalable Vector Graphics) animado, um player HTML ou quadros numerados, após um resumo em JSON do que foi desenhado (<c2/>). Uma resposta traz no máximo { "120" } quadros; a linha de comando escreve qualquer comprimento.

# text
# c1: list_export_formats
# c2: export_interop
# c3: import_route
# c4: docs/INTEROP.md
# c5: .e
seg-959f23871238 = <c1/>, <c2/> e <c3/> servem as exportações de interoperabilidade e a importação de rota GeoJSON (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, as efemérides STK (Systems Tool Kit) <c5/> e SigMF (Signal Metadata Format), com um índice JSON dos arquivos (sufixo, tamanho e SHA-256, o digest do Secure Hash Algorithm de 256 bits) e o arquivo binário de amostras SigMF em base64.

# text
# c1: bundled-scenarios
# c2: kshana::bundled_scenarios
# c3: --study
# c4: web/
seg-9ec3f9639b8c = A biblioteca ganha um recurso <c1/> desativado por padrão que expõe a tabela de cenários de referência como <c2/>; somente o servidor MCP o ativa, de modo que a wheel Python e o módulo WebAssembly continuam sem carregar o texto dos cenários. As suítes de estudo (<c3/>) permanecem somente na linha de comando, porque uma suíte nomeia arquivos em disco e o servidor não lê nenhum. Os testes de ida e volta executam cada nova ferramenta em cenários incluídos e verificam os números do motor: espectro, sistema solar, constelações em torno da Lua e de Europa, uma varredura de campanha e os tipos de cenário de sinal, passagem, mensagem de navegação, posicionamento fundido, posicionamento por ponto preciso, rede não terrestre e de ponta a ponta em órbita baixa da Terra (LEO). Toda superfície que declara a contagem de ferramentas MCP ou lista as ferramentas agora diz catorze, exceto a página do playground em <c4/>, que é substituída pelo site.

# text
seg-c11823028688 = kshana.dev, Kshana Studio e o README

# text
# c1: docs/
# c2: /#playground
# c3: /#ledger
# c4: /#s=<scenario>
# c5: /?embed=1&…
seg-fb584cf84218 = <b>Um kshana.dev redesenhado.</b> A página única do playground é substituída por um site de várias páginas: Home, Missions, Capabilities, Evidence, Developers, Editions e Docs, com o Kshana Studio a um clique. Todo gráfico, mapa e número nele é uma execução registrada do motor desta versão, com o cenário e um link que reabre a mesma execução no Studio; o build do site recusa uma gravação feita por outro commit do motor. As páginas da documentação são geradas a partir de <c1/> do repositório, e as opções de instalação a partir de seus canais. As fontes e as bibliotecas de script são servidas pelo próprio kshana.dev, de modo que nenhuma página requisita nada a um host de terceiros. Os endereços antigos (<c2/>, <c3/>, links de compartilhamento <c4/>, links de incorporação <c5/> e os demais) redirecionam para seu novo lugar, e um endereço desconhecido recebe uma página { "404" }.

# text
# c1: ?scenario=…&tab=…
seg-9fa1c542332b = <b>Kshana Studio, um painel para toda capacidade.</b> O Studio abre em uma tela inicial com blocos de domínio e boas primeiras execuções e depois conduz uma execução por cinco passos numerados: Escolher um cenário, Definir seus parâmetros, Executar o motor localmente no navegador, Ler os resultados (números principais primeiro, cada um com um chip PASS ou FAIL onde a execução declara um limiar, depois os painéis) e Compartilhar ou exportar. Uma única caixa de busca encontra cenários, domínios e os campos dentro deles e salta para o controle; as execuções podem ser fixadas e comparadas; uma trilha de navegação diz onde você está; em um telefone, os passos viram uma barra de passos. Todo tipo de cenário tem sua visão, incluindo a cascata de espectro, o sistema solar, a cobertura de constelações, as campanhas, a animação, o relatório da execução, as exportações de interoperabilidade e a cadeia em órbita baixa da Terra. Um link direto (<c1/>) abre a mesma execução no painel indicado.

# text
seg-dcf2788bb430 = <b>Pesquisa e citação.</b> A página Evidence lista os cinco artigos do Kshana no arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } e { "2607.06212" }), cada um com um resumo, um número calculado por este motor, o comando que o reproduz, um link do Studio e BibTeX, ao lado de como citar o software. O README ganha a mesma seção de Pesquisa.

# text
seg-fab395bab130 = Uma página pública para o Kshana Pro.

# text
# c1: docs/PRO.md
seg-167a59e94101 = <c1/> e a página Editions do site dizem o que a camada proprietária Pro acrescenta ao mesmo motor (otimizador de projeto, incerteza e sensibilidade, dossiê de missão, vigilância de campanha, coexistência de espectro, serviço de jobs local, rastreabilidade de requisitos), o que cada uma produz e o que não faz. Todo número do Pro que o site mostra está declarado nessa página pública. O Pro não acrescenta nenhum modelo físico, e o motor aberto permanece completo e gratuito.

# text
# c1: tools/gen_readme_assets.py
# c2: tools/capture_studio_shots.mjs
# c3: docs/
seg-f57f0a610943 = <b>Um README reescrito.</b> Seções curtas, uma imagem por seção, a marca do Kshana, duas fileiras de selos, imagens geradas de arquitetura, fluxo de cenários, cadeia em órbita baixa da Terra e verificação (<c1/>, que falha diante de uma imagem desatualizada) e capturas de tela do Studio tiradas do Studio em execução por <c2/>. Os READMEs do crates.io, do PyPI, do npm e do servidor MCP seguem o mesmo projeto. O material de referência longo foi recolhido ou movido para <c3/>.

# text
# c1: <scenario>.report.html
# c2: wrote …
# c3: <scenario>.report.json
# c4: RunOutput::html_report()
# c5: OracleKind::modelled_reason()
# c6: docs/MODELLED-RATIONALE.md
seg-e06522ca762e = <b><c1/> agora é o relatório avançado de execução</b> descrito em Added, e a linha <c2/> da CLI nomeia também <c3/>. O relatório de uma página com pontuação que ele substituiu permanece inalterado como <c4/>, que as ligações Python e WebAssembly ainda devolvem. <c5/> expõe a frase que <c6/> imprime para cada linha MODELLED; esse documento permanece inalterado.

# text
# c1: result.json
# c2: report.json
seg-77a6f35c5c9a = <b>O README diz em que o Kshana Pro se apoia.</b> A seção Editions e a linha do Kshana Pro em "Support & professional services" agora declaram o que as ferramentas de engenharia de sistemas baseada em modelos (MBSE) e de programa do Pro fazem e quais saídas publicadas do motor aberto elas leem (o <c1/> e o <c2/> de cada execução, o arquivo do cenário, o esquema de unidades dos campos e os rótulos da matriz de verificação), e no que os gêmeos digitais de relógio, os estudos de compromisso e os pacotes de evidências se apoiam no motor aberto. Apenas redação: nenhuma saída do motor e nenhum número publicado muda.

# text
# c1: navsignal::Modulation
# c2: Mboc
# c3: ephemeris
# c4: gcrs_r_m
# c5: gcrs_v_m_s
seg-1a19675ffa3b = <b>Compatibilidade.</b> O enum público <c1/> ganha uma variante <c2/>, o que é uma mudança incompatível para um chamador que o trata de forma exaustiva. As colunas <c4/> e <c5/> do tipo de cenário <c3/> mudam (ver "Revisões de números publicados"). Uma execução continua sendo reproduzida pela versão do motor que a fez.

# text
# c1: export_table_csv
# c2: telecom-timing
# c3: leo-navmsg
# c4: encode-decode
# c5: kepler16
# c6: kepler-rac
seg-e7c5f77a6602 = <b><c1/> no servidor MCP nomeava quatro tipos de cenário como os únicos com uma tabela CSV (valores separados por vírgula); seis a publicam.</b> A ferramenta sempre devolveu a tabela para <c2/> e para <c3/> (sua análise <c4/> em um modelo de mensagem <c5/> ou <c6/>), mas sua descrição, sua mensagem de recusa e os documentos que listam os tipos de cenário omitiam ambos, de modo que um agente era instruído a não pedir. Eles agora são nomeados, e um teste de ida e volta busca as duas tabelas.

# text
seg-4094f58a5f4b = O quadro da mensagem de navegação em órbita baixa da Terra (LEO) não tinha os mesmos bytes em toda plataforma, nem em todo build de uma mesma plataforma.

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
# c2: 0x110315
# c3: 0x898BD8
# c4: 0x6A82D9
# c5: leo-navmsg-celeste-iod.toml
# c6: 0x6EDB2D
# c7: 0xC6E4F0
seg-5191262de022 = <c1/> codificava um quadro com verificação de redundância cíclica <c2/> no build de release em aarch64 macOS, <c3/> em um build de depuração do mesmo código-fonte na mesma máquina e <c4/> no build WebAssembly (WASM); <c5/> dava <c6/> nativamente contra <c7/> no navegador. Três causas, cada uma rastreada até o primeiro valor divergente:

# text
# c1: truth::state_to_elements
# c2: acos
# c3: atan2
seg-f6501c3cd89d = <em>Entre plataformas.</em> A órbita verdadeira era idêntica bit a bit nas duas; o ponto de partida do ajuste não era. <c1/> toma a inclinação osculadora de um <c2/> e o argumento do perigeu de um <c3/>, e as duas bibliotecas matemáticas arredondam esses valores de modo diferente na última casa (em { "20 000" } argumentos, elas discordam em { "781" } senos, { "858" } cossenos, { "1 931" } exponenciais e { "1 899" } arco-tangentes de dois argumentos).

# text
# c1: sin
seg-cd6f05096b8b = <em>Entre perfis de build.</em> Um build otimizado no macOS funde um seno e um cosseno de um mesmo argumento em uma única chamada à rotina combinada do sistema, e seu seno não é o do <c1/> isolado em { "379" } de { "200 000" } argumentos; um build não otimizado faz as duas chamadas. O tipo de cenário toma um seno e um cosseno juntos em treze lugares.

# text
# c1: rand_distr
# c2: exp
# c3: ln
seg-91b0700dcb30 = <em>No relógio.</em> O amostrador normal de <c1/> chama o <c2/> e o <c3/> do host em seus dois ramos raros: de quatro milhões de sorteios com semente, três diferiram no último bit entre o build nativo e o WASM.

# text
# c1: src/portable_math.rs
# c2: libm
# c3: Cargo.toml
# c4: leo_navmsg::{truth, fit, elements, codec, sisre, services}
# c5: f64::powi
# c6: portable_math::standard_normal
# c7: _portable
# c8: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c9: the_kind_never_calls_the_host_mathematics_library
# c10: rand_distr
# c11: leo-navmsg
# c12: leo-navmsg
# c13: leo-navmsg
# c14: navmsg
# c15: leo-pnt-chain
# c16: docs/LEO-NAVMSG.md
# c17: 0x110315
# c18: 0x19105F
seg-0a4724333429 = O ajuste de Levenberg–Marquardt, que neste arco para em seu limite de 80 iterações e não em um mínimo, leva uma unidade na última casa a campos quantizados diferentes. O tipo de cenário agora calcula toda função transcendente pelo novo <c1/>, que chama o crate <c2/> em Rust puro (já na árvore de dependências, agora nomeado em <c3/>), compilado a partir de uma única fonte para todo alvo e não uma chamada de biblioteca que o otimizador reescreve: <c4/> e o código dos cenários. As potências inteiras nesse caminho são escritas por extenso como elevar ao quadrado e multiplicar, porque <c5/> tem precisão não especificada, e o relógio verdadeiro sorteia seus desvios normais de <c6/> (o método polar de Marsaglia sobre a saída bruta do gerador). As rotinas compartilhadas pelas quais a órbita verdadeira é integrada são escritas uma única vez, genéricas sobre a biblioteca matemática, com um ponto de entrada <c7/> interno ao crate ao lado do existente: a aceleração por harmônicos esféricos, as acelerações zonal e de arrasto, as taxas seculares de J2 e o atraso de Klobuchar. Os pontos de entrada existentes permanecem inalterados até o último bit, de modo que o número de nenhum outro tipo de cenário se move. <c8/> fixa o quadro inteiro de 171 bytes e um valor de verificação por modelo de efemérides, no perfil de teste comum (não otimizado), em toda plataforma e sem nenhuma condição de host de linha de base; <c9/> lê do disco o código-fonte do tipo de cenário e falha diante de uma chamada transcendente inerente, de um amostrador <c10/> ou de uma chamada a um módulo que não foi revisto. Após a mudança, um build de depuração, um build de release e o build WASM produzem documentos de resultado idênticos byte a byte para todos os cinco cenários <c11/>. <b>Isto altera números, registrados aqui como uma revisão.</b> O tipo de cenário <c12/> é novo nesta versão, portanto nada publicado em uma versão anterior se move, mas todo número de <c13/> se move, nativamente e no build WASM, e junto com ele a etapa <c14/> de <c15/>: os números de órbita porque o ajuste agora parte dos elementos portáteis, os números de relógio porque o relógio verdadeiro é uma realização diferente do mesmo processo. <c16/> é regenerado a partir dos novos resultados; seu valor de verificação publicado para o cenário de codificação e decodificação era <c17/> e agora é <c18/> (posição a { "1.126" } mm da mensagem exata, onde antes era { "0.665" } mm; relógio a { "0.185" } mm, onde antes era { "0.451" } mm). A magnitude das mudanças nos números submilimétricos é a sensibilidade do ajuste, não um erro em nenhum dos dois conjuntos: o ajuste não mudou e ainda para em seu limite de iterações.

# text
seg-c30f4cef4797 = A reamostragem com semente sorteava índices diferentes em um alvo de 32 bits.

# text
# c1: Rng::gen_range
# c2: usize
# c3: eval_stats
# c4: bootstrap_ci
# c5: bootstrap_auc_ci
# c6: impairment_ml
# c7: impairment_study
# c8: portable_math::uniform_index
# c9: u64
# c10: quantum-anomaly-detect
# c11: quantum_auc_ci
# c12: trade.foms[0].ci95
# c13: [0.9901265, 0.9938305]
# c14: [0.99035875, 0.993861]
seg-2bf668e23ec1 = <c1/> sobre <c2/> toma { "64" } bits do gerador em um host de 64 bits e { "32" } bits em um de 32 bits, de modo que a mesma semente dava outros índices e deixava o fluxo em outro ponto, no build WASM. Três lugares sorteavam assim: os bootstraps de percentis em <c3/> (<c4/>, <c5/>), o embaralhamento antes de cada passo de treinamento em <c6/> e o teste de permutação em <c7/>. Agora eles sorteiam por <c8/>, que sempre amostra como <c9/>: exatamente o que um host de 64 bits fazia, de modo que nenhum número nativo se move. <b>Isto altera números publicados do pacote WASM, registrados aqui como uma revisão:</b> o intervalo de bootstrap <c10/> da área sob a curva (<c11/>, <c12/>) era <c13/> no navegador e agora é o nativo <c14/>.

# text
# c1: /
# c2: Pulsar inclined/S1-0163
# c3: --export stk
# c4: -
# c5: _
seg-80f783da1d4f = <b>Nomes de arquivo de efemérides STK a partir de ids de objetos móveis.</b> Um id de objeto móvel contendo <c1/> ou um espaço (uma camada de constelação e um satélite, <c2/>) fazia a CLI entrar em pânico em <c3/>; cada id agora passa por uma parte de arquivo segura (letras, dígitos, <c4/>, <c5/>).

# text
seg-a0dc5729d5e9 = <b>O sinal da nutação TEME→GCRS</b>, descrito em "Revisões de números publicados" acima porque altera saída publicada.

# text
# c1: slot-timing
# c2: src/slot_timing.rs
# c3: slot-timing-ocxo-leo
# c4: docs/SLOT-TIMING.md
seg-5ecbf0787f39 = <b>Tipo de cenário <c1/></b> (<c2/>): segundos até que um relógio em funcionamento livre saia do limite de um slot de roteamento ou de tarefa indexado no tempo, todo termo contribuinte nesse momento com o dominante nomeado, o tempo restante desde a última solução e o maior intervalo entre soluções que mantém o relógio dentro, descontada a latência da solução. O relógio vem de um padrão de classe, de uma predefinição de folha de dados de telecom-timing, de uma folha de dados em linha (máximos do desvio de Allan, envelhecimento, coeficiente de temperatura) ou de um registro de fase medido. Uma violação além do maior tempo de média que a fonte sustenta é sinalizada como extrapolada. Exemplo incluído: <c3/>. Ver <c4/>.

# text
# c1: slot_timing::fit_weighted
seg-40dd4c16b760 = <b>Piso de ruído vermelho medido.</b> O desvio de Allan sobreposto de um registro de fase é ajustado por mínimos quadrados ponderados na base de ruído branco de fase e de modulação de frequência da IEEE Std { "1139" } (<c1/>), cada ponto ponderado por seus graus de liberdade equivalentes, de modo que uma resposta de holdover possa se apoiar no piso do próprio relógio em vez da suposição da classe. Um ajuste não ponderado colocou um piso espúrio de ruído flicker em um registro de teste de ruído branco e encurtou em { "30" } % uma violação de { "2 000" } s.

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: realdata-clock
seg-22c09748488b = <b>Validação com dados reservados da inversão do holdover em um relógio real</b> (<c1/>): ajustadas sobre o primeiro terço do registro de césio 5071A contra maser de hidrogênio, as violações previstas de um sigma em seis limiares de { "0.5" } a { "2.5" } ns ficam entre { "0.84" } e { "1.03" } das violações medidas nos outros dois terços, contra um limiar de { "1.5" } fixado antes de o teste ser executado pela primeira vez. Um controle (o desvio de Allan de um segundo lido como ruído branco) erra por um fator de cerca de { "1 000" } e não atinge o limiar. Nova linha VALIDATED no registro; o workflow <c2/> agora a executa.

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: scripts/fetch_ocxo.sh
# c3: fix_frequency_sigma
seg-cd73dc87a22f = <b>A mesma previsão em um oscilador de cristal real</b> (<c1/>, <c2/>): em um oscilador de cristal controlado por forno medido, a previsão com dados reservados é conservadora, entre { "0.59" } e { "0.70" } da violação medida e nunca mais tarde, e na maior parte fora do limiar de { "1.5" }, porque o piso de ruído desse oscilador caiu pela metade durante o registro de 5,5 horas; ajustada dentro da amostra, fica entre { "0.98" } e { "1.17" }. O caso do cristal não é validado e permanece MODELLED. A execução também expôs um termo ausente: a frequência de um cristal oscila, de modo que o modelo agora leva a incerteza da frequência conhecida na solução (<c3/>); sem ele, a previsão era otimista em até { "2.5" }×.

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-8519979d184c = <b>A mesma previsão em relógios atômicos em órbita</b> (<c1/>, <c2/>): { "14" } dias de relógios finais do International GNSS Service para os satélites GPS Block IIF, com o protocolo escrito antes de os dados serem baixados. Oito de dez satélites ficam dentro do limiar de { "1.5" }; G25 e G30 preveem violações até cerca de duas vezes mais tardias do que as medidas. O protocolo exige que todo satélite fique dentro do limiar, de modo que o caso orbital não é validado e permanece MODELLED; o resultado é fixado.

# text
# c1: ClockClass::Tcxo
# c2: Ocxo
# c3: Rafs
# c4: ClockClass::source
# c5: ClockClass::ALL
# c6: id
# c7: from_id
# c8: quantum-trade
# c9: baseline_clock_class
seg-0d666a725b77 = <b>Classes de relógio de cristal com compensação de temperatura (TCXO), de cristal controlado por forno (OCXO) e de padrão atômico de frequência de rubídio (RAFS)</b> (<c1/>, <c2/>, <c3/>), as peças que um barramento comercial de smallsat ou um gateway de solo emprega, cada uma citando uma folha de dados pública (<c4/>). <c5/>, <c6/> e <c7/> acrescentados. O <c9/> de <c8/> aceita os três novos ids. Acrescentar variantes a um enum público é uma mudança incompatível para um chamador que o trata de forma exaustiva.

# text
# c1: src/orbital_timing.rs
# c2: slot-timing
# c3: spoofing
# c4: tpl::timing_protection_level_ns
seg-24ae82b115f5 = <b>Nível de proteção de temporização para um receptor em órbita</b> (<c1/>, a seção opcional <c3/> do tipo de cenário <c2/>): por quanto tempo um spoofer em solo consegue alcançar um satélite em órbita baixa da Terra por passagem, o arrasto que um spoofer com uma taxa de rampa máxima declarada acumula antes de o satélite sair de seu alcance ou de uma verificação independente ser executada, e se cada verificação de contato com o solo ou de enlace cruzado é independente desse spoofer. Reduz-se exatamente a <c4/> para um relógio sem ruído flicker, de fase branca ou de passeio aleatório. MODELLED.

# text
# c1: docs/SLOT-TIMING.md
# c2: docs/DECEIVED-TIME.md
# c3: docs/DEPLOYMENT-TARGETS.md
# c4: no_std
seg-4032bc03fad5 = <b>Três notas</b>: <c1/> (incluindo contra qual métrica de deriva um slot deve ser aceito: erro de tempo absoluto máximo, e não erro máximo de intervalo de tempo nem desvio de tempo, e por quê), <c2/> (um comando assinado aplicado em um tempo enganado ainda é roteado errado) e <c3/> (onde o Kshana é executado; nenhum núcleo de voo <c4/> é oferecido).

# text
# c1: kshana
# c2: kshana-mcp
seg-712035e19515 = A versão { "v0.27.3" } chegou ao crates.io (<c1/> e <c2/>) e ao PyPI e depois parou no npm, de modo que o npm, a imagem MCP no ghcr.io, o registro MCP, o JetBrains Marketplace e kshana.dev nunca a receberam. A { "0.27.4" } leva o mesmo motor, com a correção de versão abaixo, a todo canal.

# text
# c1: npm-dist/kshana-0.27.3.tgz
# c2: owner/repo
# c3: github.com/npm-dist/kshana-0.27.3.tgz
# c4: ./npm-dist/*.tgz
seg-bab8d4d1bc54 = <b>A etapa de publicação no npm nomeia o tarball por um caminho explícito.</b> O npm lê um <c1/> sem caminho como a abreviação do GitHub <c2/>, de modo que o job do npm da { "v0.27.3" } tentou clonar <c3/> e falhou com "Permission denied (publickey)". O tarball em si havia sido construído e atestado. A etapa agora publica <c4/>. Tudo o que vem depois do npm na ordem da versão (a imagem MCP, o plugin do JetBrains, a verificação de paridade dos canais e o site) foi pulado, como projetado.

# text
# c1: gnss-ins
seg-f9a112755eb1 = <b>Os catálogos de unidades de telecom-timing e de <c1/> estão isentos da detecção de copiar e colar</b>, sob a mesma política e o mesmo teste de justificativa dos demais catálogos. O portão de qualidade do SonarCloud havia ficado vermelho por duplicação em código novo ({ "4.0" }% contra { "3" }%), e todo bloco duplicado era uma linha de unidades ou uma entrada de máscara da ITU-T.

# text
# c1: scenarios/small-uas-jammed-nav.toml
# c2: jamming-demo.toml
# c3: kshana example small-uas-jammed-nav
seg-3c3dacae06d6 = <b><c1/>: por quanto tempo a navegação de um pequeno drone se sustenta depois que o GNSS sofre jamming.</b> Ele executa uma unidade inercial microeletromecânica (MEMS) de classe de controlador de voo, uma Bosch BMI088, contra uma unidade de classe tática. O sinal GNSS (Global Navigation Satellite System) é nominal por { "100" } s e depois negado por { "60" } s (<c2/> mostra por que um jammer próximo faz isso). Os vieses do BMI088 são os resíduos que restam após a calibração de inicialização, tomados dos coeficientes de temperatura de sua folha de dados (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s por K para o giroscópio e < { "0.2" } mg por K para o acelerômetro. Duas premissas estão sinalizadas no arquivo: um aquecimento de { "10" } K após a calibração e um aquecimento contínuo de { "1" } K por minuto em voo. A deriva em voo é o erro que o filtro não consegue aprender antes de o jamming começar, e é ela que encerra a navegação inercial. Todos os números são modelados; validá-los exige registros de voo de um ambiente sob jamming. <c3/> o imprime.

# text
# c1: gnss-ins
# c2: [imu_quantum.filter_prior]
# c3: [imu_classical.filter_prior]
# c4: sigma_accel_bias
# c5: sigma_gyro_bias
seg-7154f69a2b8a = <b>Cada sensor de <c1/> pode definir seu próprio prior de filtro</b> (<c2/> ou <c3/>, com <c4/> e <c5/>). O padrão não muda, de modo que todo cenário existente dá o mesmo resultado. O viés residual do giroscópio de uma unidade de classe de consumo fica cerca de { "26" } sigmas fora do padrão de classe tática, onde o filtro nunca o aprenderia. Um prior que não seja finito e positivo é rejeitado, e o resultado repete o prior quando um é definido.

# text
# c1: kshana example [<name>]
# c2: cargo install kshana
# c3: scenarios/
# c4: scenarios/
# c5: src/bundled_scenarios.rs
# c6: kshana example
# c7: kshana example clock-holdover > clock-holdover.toml
# c8: lunar-llr-datum
# c9: quantum-pnt-demonstrator.suite
# c10: --study
# c11: tests/cli_first_run.rs
seg-2b54735b19aa = <b><c1/> entrega a um usuário do registro um cenário para executar.</b> Um usuário de <c2/> tem o executável e nenhum diretório <c3/>, de modo que o primeiro comando que todo guia de início rápido lhe dava falhava. A interface de linha de comando (CLI) agora traz os { "75" } cenários de referência que executam por conta própria, byte a byte, compilados a partir de <c4/> (<c5/>; a tabela fica no binário da CLI, de modo que a wheel Python e o módulo WebAssembly não crescem). <c6/> os lista; <c7/> escreve um. Os outros dois arquivos são exclusivos do repositório: <c8/> lê dados arquivados de telemetria a laser lunar que acompanham apenas o repositório, e <c9/> é um manifesto de estudo que executa três arquivos irmãos com <c10/>. Pedir qualquer um dos dois diz por quê e encerra com { "2" } em vez de imprimir algo que não pode ser executado por conta própria. <c11/> mantém a tabela alinhada ao diretório nos dois sentidos, de modo que um novo arquivo de cenário que não seja incluído nem nomeado como exclusivo do repositório falha.

# text
# c1: figure_tiers
# c2: quantum.fom.timing_p95_ns
# c3: src/verification.rs
# c4: src/fom_label.rs
# c5: hybrid
# c6: fusion
# c7: untiered
# c8: tests/registry_golden.rs
# c9: tests/cross_platform_golden.rs
seg-43249b6a1f3c = <b>Todo número de mérito em um resultado de relógio, órbita, híbrido ou fusão agora diz se é VALIDATED ou MODELLED, no próprio resultado.</b> O documento de resultado ganha um bloco <c1/>, sempre sua última chave. Ele lista cada número informado (por exemplo <c2/>) com seu nível (VALIDATED significa verificado em relação a uma referência externa independente, MODELLED significa um modelo de primeiros princípios testado internamente) e a linha da matriz de verificação de onde o nível é lido. O nível vem de <c3/> por meio de <c4/>, de modo que não há uma segunda tabela que possa divergir. Antes disso, as palavras "validado" e "modelado" apareciam zero vez em um resultado de clock-holdover, e um leitor do JSON (JavaScript Object Notation) bruto não tinha como distinguir os dois. Os números de posição de <c5/> e <c6/> não têm linha da matriz responsável, de modo que são listados sob <c7/> em vez de receber um nível. O bloco não traz números. Está provado ser aditivo, não presumido: removê-lo devolve o documento anterior à mudança byte a byte, para todos os cinco tipos de cenário (um teste do motor), e ambos os harnesses de referência (<c8/>, <c9/>) agora removem exatamente esta chave, e somente quando é a última, e então calculam o hash do restante em relação às suas constantes congeladas <b>inalteradas</b>. Uma lista em cada harness fixa quais cenários devem trazer o bloco, de modo que a exclusão não possa se ampliar em silêncio.

# text
# c1: telecom-timing
# c2: docs/TELECOM-TIMING.md
seg-8faf1981d797 = <b>Um tipo de cenário <c1/> responde nas unidades de um engenheiro de temporização: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV), cada um com um PASS ou FAIL e uma margem em relação às máscaras do Setor de Normalização das Telecomunicações da União Internacional de Telecomunicações (ITU-T).</b> As máscaras são transcritas das edições em vigor: G.8272 (07/2025) para as classes A e B do relógio de tempo de referência primário (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) para o PRTC aprimorado em modo travado e em holdover (incluindo seu envelope de erro de tempo, que sobe de { "30" } ns para { "100" } ns ao longo de um período de holdover definido por quanto tempo o relógio ficou travado), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) para relógios de fronteira e escravos de tempo de telecomunicações, classes A a D, e G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) para os limites de rede no ponto de referência C. Toda entrada que essas Recomendações deixam "para estudo futuro" está ausente, não estimada, e <c2/> lista cada número com sua tabela ou cláusula e cada item que foi deixado de fora. O relatório também dá o tempo para exceder cada orçamento de erro de tempo: por padrão, o padrão de holdover de { "100" } ns do ePRTC, uma alocação de holdover de rede de { "400" } ns, o limite do ponto C de { "1 100" } ns e o requisito ponta a ponta de classe { "4" } de { "1.5" } microssegundo.

# text
# c1: [time_s, time_error_ns]
seg-9e5325e1b0ca = A entrada é um holdover sintético ou uma série sua. O sintético usa uma de quatro predefinições de oscilador (um oscilador de cristal controlado por forno, um padrão de rubídio, um padrão de césio e um relógio atômico em escala de chip), cada uma com os números de estabilidade, envelhecimento e temperatura de uma folha de dados nomeada da Microchip. Como esses números se tornam ruído branco, flicker e de passeio aleatório de frequência, envelhecimento e um termo de temperatura é declarado em todo relatório e rotulado como MODELLED. Uma série sua é composta de pares <c1/>, em linha (que é como executa no navegador) ou, em builds nativos, a partir de um arquivo de valores separados por vírgula. A tabela MTIE/TDEV, com o limite de cada máscara selecionada ao lado, é escrita como o artefato CSV da execução.

# text
# c1: scenarios/telecom-prtc-holdover-24h.toml
# c2: scenarios/telecom-tie-ingest.toml
seg-a23a96819dee = <c1/> é um holdover de rubídio de 24 horas com envelhecimento, flicker e um ciclo diário de temperatura: seu maior erro de tempo é { "603.2" } ns, ele cruza { "100" } ns { "8 206" } s após a perda e permanece dentro de { "1.5" } microssegundo durante todo o dia, e não satisfaz o envelope de holdover do PRTC aprimorado, como se espera de um relógio que não é de classe césio. <c2/> mostra a entrada em linha. O MTIE e o TDEV que o tipo de cenário informa são verificados em relação ao pacote allantools sobre uma série de holdover de { "2" } 048 amostras registrada no repositório, exatamente para o MTIE e a { "1.1e-15" } para o TDEV, de modo que a matriz ganha uma linha VALIDATED e duas MODELLED (a transcrição das máscaras e as predefinições) e agora está em <b>{ "171" } linhas — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. A cobertura de unidades dos campos passa de { "60" } de { "61" } tipos de cenário para { "61" } de { "62" }, e de { "1,742" } para { "1,788" } campos descritos. O tipo de cenário é novo e aditivo: nenhum cenário, fixação ou número publicado existente se move.

# text
seg-5bb1ad9a34ec = O playground executa o motor em um Web Worker em segundo plano, de modo que um cenário lento não congela mais a página.

# text
# c1: web/engine-worker.mjs
# c2: web/engine.mjs
# c3: cislunar-arc-recovery
seg-b1ab3546f131 = <c1/> hospeda o motor WebAssembly e <c2/> encaminha para ele toda execução de cenário (execuções, varreduras de parâmetros e as exportações SP3 / OMM / OEM / CSV). Uma execução que ultrapassa { "150" } ms mostra um estado de ocupado (Executar desativado, "Executando… N s") e um botão Cancelar que encerra e recria o worker; um navegador que não consegue iniciar um worker de módulo recorre ao antigo caminho da thread principal. <c3/>, deixado de fora do catálogo porque congelava a página, voltou a ele, rotulado como lento: leva cerca de { "13" } s no Chrome (quatro chamadas ao motor de cerca de { "3" } s cada), durante os quais a página permanece responsiva.

# text
# c1: cislunar-observability
seg-146200dfac7e = <b>Toda grandeza informada de <c1/> agora traz uma unidade, uma classe de proveniência e uma definição, o penúltimo tipo de cenário na lista de isenção de todo o crate.</b> Todos os { "41" } campos numéricos do documento RELEASED estão descritos, de modo que a cobertura de unidades dos campos passa de { "59" } de { "61" } tipos de cenário para { "60" } de { "61" } e de { "1,698" } para { "1,742" } campos descritos, com o passivo sem definição inalterado em { "239" }.

# text
# c1: units
# c2: units
# c3: expect_summary
seg-61b1219ae0e3 = Isso estava bloqueado pela fixação que congela o documento liberado, que nomeava <c1/> como uma chave que o documento nunca devia ganhar. Acrescentar uma teria significado apagar essa asserção e refazer a linha de base de três hashes em três arquivos, uma forma indistinguível de encobrir uma regressão. Em vez disso, as duas fixações que medem este documento agora <em>provam</em> que o acréscimo é aditivo: cada uma remove de volta o bloco <c2/> e refaz o hash contra a constante congelada antes de o bloco existir, e <b>ambas as constantes permanecem inalteradas</b>. Uma mutação confirma que a garantia é real: mova um valor liberado e refaça a linha de base do hash do documento inteiro como faria uma correção descuidada, e a remoção seguida de novo hash ainda falha. A terceira fixação, no harness genérico de referência do registro, tem sua linha de base refeita em linha com os seis irmãos que foram refeitos exatamente por esse motivo, e seu literal <c3/> com valores não se move.

# text
# c1: realtime-frame-eop
seg-a73409e0b664 = <c1/> informa contra qual referência cada linha de orientação da Terra foi pontuada e com que frequência o recurso de contingência foi acionado.

# text
# c1: table3_joint_eop[].{ut1, polar_motion,combined}
# c2: truth_source
# c3: truth_fallback_rows
# c4: final
# c5: dN
# c6: truth_pm()
# c7: truth_ut1()
seg-6e0493a39f1a = <c1/> ganham <c2/> e <c3/>. O piso <c4/> é pontuado contra o Bulletin B final e só pode usar épocas que publicam um; toda linha <c5/> é pontuada contra <c6/>/<c7/>, que recorrem ao valor rápido do Bulletin A. No extrato incluído de { "2026" }, isso corresponde a { "12" } de { "31" } amostras em um dia, contra { "0" } no piso, de modo que a linha do piso e as linhas de previsão ao lado dela se apoiam em referências mensuravelmente diferentes, o que o relatório agora declara em vez de deixar para ser inferido de uma contagem de amostras que sobe onde horizontes aninhados dizem que não pode.

# text
# c1: moonlight-service-volume
seg-7ba5be07fa8c = <c1/> emite uma linha de base kepleriana de mesmo tamanho.

# text
# c1: ephemeris_comparison.keplerian_matched
# c2: 360k/n
seg-f9dc8fae6452 = <c1/> executa novamente a constelação ilustrativa com o número de satélites do próprio conjunto RETRIEVED, presente somente quando as contagens diferem. A contagem faz parte da geometria desse projeto (RAAN e anomalia média são ambas distribuídas como <c2/>), de modo que, sem ela, um conjunto obtido de cinco satélites era pontuado contra um conjunto ilustrativo de oito satélites e o projeto se confundia com o tamanho. Para o conjunto de referência LANS de cinco satélites, { "8.68" } dos 14.24 pontos de lacuna de cobertura resultam ser os três satélites ausentes e somente { "5.56" } pontos o projeto; para as quatro espaçonaves realmente em órbita lunar, um conjunto de quatro satélites construído para esse fim atinge { "4.86" } % onde elas atingem { "0" } %. Um teste fixa que a linha equiparada é uma constelação reconstruída e não a configurada com outro rótulo, que foi como foi escrita inicialmente e o que a execução então informou.

# text
seg-2e7e4dbbb7f6 = <b>Nove cartões de capacidade no site público, cobrindo { "22" } linhas da matriz de verificação que foram entregues sem nenhum cartão em nível de produto.</b> O motor havia crescido uma família de capacidades (a verificação ARAIM em relação a vetores de referência publicados do Working Group C, geometria real de constelações lunares obtidas, o contorno de negação lunar com uma faixa de C/N₀ medida, a etapa de agenda VLBI para covariância de estação, a transferência óptica e RF com injeção de falhas entre modalidades, a predição de orientação da Terra em tempo real contra o Bulletin A arquivado, o compartilhamento de abertura entre navegação e comunicações, a navegação inercial INS/TRN e a cobertura de unidades e proveniência), cada uma com uma linha da matriz e um cenário incluído, e nenhuma delas nomeada em kshana.dev. A cobertura de cartão para linha passa de { "72" } de { "168" } linhas para { "94" }.

# text
# c1: web/app.js
# c2: tests/scenario_examples_doc_sync.rs
# c3: run
# c4: scenarios/
seg-3dc189224fe8 = <b>Oito cenários acrescentados ao catálogo do playground.</b> O botão Executar de um cartão de capacidade só aparece quando <c1/> também traz o arquivo; seis cartões nomeavam um cenário que ele não trazia, de modo que eram exibidos sem nenhuma forma de executá-los, e um deles, o datum de telemetria a laser real, estava nesse estado desde que foi lançado. <c2/> agora impõe a invariante nas duas metades: o alvo <c3/> de um cartão deve estar incluído em <c4/> <em>e</em> oferecido pelo catálogo. Testado por mutação contra os dois modos de falha.

# text
# c1: moonlight-service-volume
# c2: <scenario>.table.csv
seg-2d69334516e9 = <b><c1/> emite sua geometria por satélite como <c2/></b> quando um local de exportação está configurado (G11). É o maior vetor que o crate publica ({ "2304" } linhas na tabela conjunta de comunicações e navegação liberada) e chegava aos consumidores apenas dentro de JSON, o formato que truncou a curva de 57 pontos de um cenário irmão em { "23" } pontos sob uma coluna que afirmava conter todos. Uma linha por enlace, a contagem de linhas na linha de cabeçalho, as colunas de antena presentes somente quando uma antena foi configurada. Uma execução sem local de exportação permanece inalterada byte a byte e não escreve nenhum arquivo.

# text
seg-7958d26072f7 = O SBOM agora descreve o que é entregue: { "60" } componentes passaram a { "66" }.

# text
# c1: scripts/gen-sbom.sh
# c2: sgp4
# c3: chrono
# c4: --features python
# c5: pyo3
# c6: pyo3-ffi
# c7: pyo3-macros
# c8: pyo3-macros-backend
# c9: pyo3-build-config
# c10: portable-atomic
# c11: target-lexicon
# c12: heck
# c13: python
# c14: wasm
# c15: expression
seg-219cd333b000 = <c1/> listava todo pacote da resolução de recursos padrão, incluindo as dev-dependencies. Isso colocava <c2/> e <c3/>, crates somente de teste compilados em nenhum artefato, na lista de materiais e deixava de fora a cadeia <c4/> que a wheel do PyPI vincula (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), que é a fronteira de interface com funções externas dessa wheel. O script agora percorre o grafo de resolução a partir do pacote kshana somente por arestas normais e de build, sobre a união dos conjuntos de recursos padrão, <c13/> e <c14/> (o pacote npm leva esse mesmo SBOM), para toda plataforma-alvo. O veredito fixado de aderência à norma do CycloneDX é refeito como nova linha de base por seu gerador registrado no repositório: de { "60" } → { "66" } componentes, de { "53" } → { "60" } expressões compostas de licença, e ainda zero erros de esquema depois que estas são colocadas na forma padrão <c15/>.

# text
# c1: export_table_csv
# c2: <scenario>.table.csv
# c3: realtime-frame-eop
# c4: lunar-time-budget
# c5: lunar-jamming
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: table_csv
# c10: undefined
# c11: tests/golden/realtime-frame-eop.csv
# c12: RunOutput.write_csv
seg-23c98d31f749 = <b>A tabela CSV de reprodutibilidade chega a toda porta de entrada, não apenas à CLI e à wheel Python.</b> O servidor MCP ganha uma sétima ferramenta, <c1/>, que executa um cenário e devolve a tabela estável byte a byte que a CLI escreve como <c2/>, ou um erro que nomeia os tipos de cenário que publicam uma (<c3/>, <c4/>, <c5/> e <c6/> somente quando <c7/> + <c8/> estão definidos). O módulo WebAssembly ganha <c9/>, que devolve o mesmo texto ou <c10/>. O teste de ida e volta do MCP e os testes da ligação Python agora fixam o CSV devolvido byte a byte em relação a <c11/> e fixam que <c12/> devolve os bytes escritos e { "0" } sem criar arquivo para um tipo de cenário sem tabela. Toda superfície que declara a contagem de ferramentas MCP ou lista as ferramentas agora diz sete.

# text
# c1: run_all
seg-86c3fed5e23a = <c1/> no módulo WebAssembly: uma única execução do motor para todas as saídas.

# text
# c1: run
# c2: chart_svg
# c3: summary
# c4: table_csv
# c5: cislunar-arc-recovery
# c6: run_all
# c7: {json, svg, summary, csv}
seg-3f2677cd280b = <c1/>, <c2/>, <c3/> e <c4/> executam cada uma o cenário do zero, de modo que o playground pagava quatro execuções completas por clique, cerca de { "12" } s em vez de { "3" } s para <c5/> em um navegador. <c6/> devolve <c7/> a partir de uma única execução, e o playground agora a usa. Ela coincide byte a byte com as quatro chamadas separadas.

# text
# c1: gnss-ins
# c2: +C_b^n b_a
# c3: −C_b^n b_g
# c4: +C_b^n b_g
# c5: scenarios/gnss-ins.toml
seg-fa05c9ee0c6a = <b>REVISION: o acoplamento do viés do giroscópio no filtro GNSS/INS tinha o sinal errado, e os números de interrupção de <c1/> mudam.</b> O filtro de Kalman estendido (EKF) de estado de erro mantém os dois vieses inerciais como resíduos (verdadeiro menos a estimativa corrente, realimentados por soma). A coluna do acelerômetro conduzia o erro de velocidade com <c2/>, mas a coluna do giroscópio conduzia o erro de atitude com <c3/>. Um viés residual do giroscópio na verdade gira a atitude calculada por <c4/>, de modo que toda estimativa de viés do giroscópio empurrava para o lado errado. O pacote só permanecia estável porque seu prior padrão de viés do giroscópio ({ "1e-4" } rad/s, 1 sigma) era apertado o bastante para manter esses estados parados. Com um prior mais largo, o filtro divergia mesmo quando o viés verdadeiro do giroscópio era zero: { "93" } m de erro fundido na interrupção tornaram-se { "4.3" } km. Os números publicados de <c5/> mudam como segue:

# text
seg-47e22e713df6 = antes (≤ { "0.27.2" })

# text
seg-5215a0a41b89 = depois

# text
seg-f58aecc6864c = IMU de átomos frios, RMS fundido na interrupção

# text
seg-c4fbd933ddb2 = { "96.1" } m

# text
seg-002d765fca02 = { "1.9" } m

# text
seg-d14616d4ea1b = IMU de átomos frios, navegação inercial dentro da especificação ({ "50" } m)

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-91645c14401b = { "60" } s (a interrupção inteira)

# text
seg-f297a2652cf8 = IMU tática, RMS fundido na interrupção

# text
seg-0ac27c6d4206 = { "62.5" } m

# text
seg-eda895cc3b86 = { "3.1" } m

# text
seg-e0ab83f1d8d7 = IMU tática, navegação inercial dentro da especificação ({ "50" } m)

# text
seg-5c526991a521 = { "37" } s

# text
# c1: tests/gnss_ins_sensor_fusion_reference.rs
# c2: closed_loop.rs
# c3: gnss-ins
seg-743060da5543 = Os números em funcionamento livre ({ "130.7" } m e { "314.3" } m) não mudam; eles nunca usaram o filtro. A leitura anterior do pacote, de que a navegação inercial fundida é limitada por um piso de atitude de transferência e, portanto, não melhora com um sensor melhor, era um artefato deste defeito e é retirada. Com vieses constantes e sem ruído, o filtro agora os aprende enquanto o GNSS está disponível, de modo que a navegação inercial fundida é um melhor caso. A referência externa do filterpy (<c1/>) verifica apenas as atualizações de medição, razão pela qual nunca viu a propagação. Dois testes agora verificam o sinal diretamente, e ambos falham com o antigo. O primeiro, em <c2/>, injeta um viés residual conhecido do giroscópio no strapdown e exige que o filtro preveja o erro de atitude resultante com { "2" } % de tolerância. O segundo exige que um prior largo aprenda um viés de giroscópio de { "1e-3" } rad/s e permaneça dentro de { "6" } m. O golden multiplataforma de <c3/> é fixado de novo por este motivo e nenhum outro.

# text
# c1: scenarios/clock-holdover.toml
# c2: TypeError: fetch failed
# c3: init()
# c4: fetch
seg-f764678e3376 = <b>Todo início rápido de registro agora executa como escrito em uma máquina limpa.</b> Medidos antes desta mudança, os exemplos do crates.io e do PyPI (Python Package Index) liam <c1/>, que uma instalação por registro não tem, e o exemplo do npm travava no Node.js com <c2/>, porque o <c3/> do pacote busca seu binário WebAssembly e o <c4/> do Node não consegue ler um arquivo local. Agora:

# text
# c1: README.crates.md
# c2: README.pypi.md
# c3: README.npm.md
# c4: main
# c5: # Ok::<…>
# c6: tests/readme_code_fences_doc_sync.rs
seg-e77a540d2f90 = <c1/> e <c2/> trazem esse cenário em linha, como <c3/> já fazia. O bloco de código Rust é um programa inteiro com seu próprio <c4/>, já que a linha <c5/> oculta pelo rustdoc com que ele terminava é exibida no crates.io e não compila quando colada. <c6/> ainda o compila byte a byte e agora também recusa uma linha oculta no bloco.

# text
# c1: README.npm.md
# c2: initSync
# c3: initSync
seg-ea5204ced0d2 = <c1/> separa o navegador do Node.js e dá uma receita para Node que lê o binário do disco e o passa a <c2/>. O teste de sincronia da documentação aceita <c3/> como o carregador que o wasm-bindgen gera.

# text
# c1: 5ba83a232b94
seg-ebb763695c59 = Os três incorporam o cenário com suas cadeias de proveniência sem abreviação, de modo que o hash do cenário é <c1/> em toda superfície. O exemplo do npm costumava abreviá-las, o que lhe dava um hash diferente do da CLI.

# text
# c1: cargo new
# c2: wasm-pack --target web
seg-dc52363432f8 = Reproduzido a partir de builds locais desta árvore: um projeto <c1/> novo com uma dependência por caminho no crate empacotado compilou e executou o exemplo Rust; uma wheel construída com maturin a partir das fontes empacotadas, instalada em um novo ambiente virtual, executou o exemplo Python; e o pacote <c2/>, empacotado e instalado com npm, executou a receita para Node. Os três imprimiram a mesma linha de resumo.

# text
# c1: cargo run -- <scenario.toml>
seg-07e465a602f1 = <c1/> funciona a partir de um clone.

# text
# c1: Cargo.toml
# c2: default-run = "kshana"
# c3: cargo run --
seg-77ce31300b69 = <c1/> define <c2/>. Sem isso, o cargo recusava com "could not determine which binary to run", e toda linha <c3/> na documentação esbarrava nisso.

# text
# c1: kshana example
# c2: --help
# c3: --version
# c4: --validate
# c5: ok:
# c6: tests/cli_first_run.rs
seg-2d516597b5f5 = <b>Os erros do primeiro minuto da CLI dizem o que fazer a seguir.</b> Um caminho de cenário que não existe agora acrescenta uma dica que aponta para <c1/>, e um segundo argumento posicional imprime o texto de uso além de nomear o argumento. <c2/>, <c3/>, o erro de opção desconhecida (saída { "2" }) e o <c5/> de uma linha de <c4/> em caso de sucesso já estavam em main. <c6/> agora cobre todos eles, já que nenhum teste executava o binário para nenhum deles antes.

# text
# c1: list_kinds()
# c2: scenario_kinds()
# c3: kshana.pyi
# c4: docs/PYTHON_API.md
# c5: README.pypi.md
# c6: scenario_kinds()
seg-fdd9a27ccfc4 = <b><c1/> em Python está documentado como devolvendo uma única cadeia JSON, não uma lista.</b> Ele devolve os mesmos metadados que <c2/>, serializados, de modo que iterá-lo percorre caracteres. Ele mantém seu retorno em cadeia para que os chamadores existentes não quebrem. <c3/>, o comentário de documentação da ligação, <c4/> e <c5/> agora dizem isso e apontam para <c6/>.

# text
seg-f0e0c8c12f8a = <b>Os três READMEs de registro escrevem por extenso toda abreviação no primeiro uso.</b> PNT agora é expandido no slogan, onde aparece pela primeira vez, e CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL e API são expandidos nos arquivos que os usam. O título da tabela de referências independentes não diz mais "CI-gated" antes de CI ser definido.

# text
seg-554c5b0c9c60 = Corrigido um número publicado: a disponibilidade do ARAIM de duas constelações nos TLEs de GPS + Galileo do Celestrak incluídos no repositório.

# text
# c1: docs/CAPABILITY.md
# c2: tests/araim_dual_real_data.rs
# c3: parse_propagators
# c4: parse_tle
# c5: araim_dual_constellation_availability
# c6: docs/CAPABILITY.md
# c7: docs/REAL_TLE_GUIDE.md
seg-1f023a822c91 = <c1/> afirmava que reunir o Galileo eleva a disponibilidade de { "0.21" } para { "0.67" } sob um VAL de { "12" } m e que o modo robusto a falhas de constelação é limitado com apenas duas constelações. Isso vinha de <c2/> propagar cada satélite a partir de sua própria época de TLE (<c3/> descarta a época), e as épocas nesses arquivos abrangem { "70.6" } h (GPS) e { "335.7" } h (Galileo), de modo que os satélites estavam em instantes mutuamente inconsistentes. O teste agora mantém cada época (<c4/>) e avalia todo satélite em um único instante UTC comum, a época de TLE mais recente do conjunto (2026-06-07T07:{ "21" }:{ "04" }). A disponibilidade medida sobre as mesmas { "24" } h, em uma grade de 289 amostras, passa a ser GPS somente { "0.993" } (era { "0.208" }), reunido { "1.000" } (era { "0.671" }) e duplo robusto a falhas de constelação { "0.990" } (era { "0.031" }); no limite APV-I, o modo duplo passa de { "0.180" } para { "1.000" }. A conclusão se inverte: em um céu consistente, duas constelações sustentam a hipótese de falha de constelação com um VAL de { "12" } m. Os mesmos números resultam com a época de TLE mais antiga como referência. Uma autoverificação no teste fixa seu laço de disponibilidade amostra por amostra a <c5/>, de modo que a única diferença é o alinhamento temporal. <c6/> e <c7/> §{ "3" } trazem os novos números; a entrada { "0.13.0" } abaixo é deixada como foi lançada.

# text
# c1: docs/CAPABILITY.md
# c2: docs/STANDARDS.md
# c3: ROADMAP.md
seg-3173a2e03521 = <b>As superfícies públicas não anunciam mais o RINEX { "4" } como validado.</b> O motor agora recusa por nome um arquivo de navegação RINEX { "4" } em vez de decodificá-lo errado, mas a grade de normas ainda mostrava um cartão "RINEX { "3" } / { "4" }" com uma etiqueta <em>validado</em>, vinculada à evidência RINEX 3 do analisador de navegação. O cartão agora é "RINEX { "3" }", e o README, <c1/>, <c2/>, <c3/> e o resumo de capacidades declaram o que é verdadeiro: arquivos de observação RINEX 3.0x são analisados, espera-se que o formato de observação { "4.00" } também seja, mas nenhum arquivo { "4.00" } foi lido pelo código, e arquivos de navegação RINEX { "4" } são recusados.

# text
# c1: --validate
seg-c9bb514acb7a = <b><c1/> diz quando "ok" significa que não havia nada a verificar.</b> Cerca de dois terços do catálogo não publicam nenhum campo obrigatório (esses pacotes executam sua configuração de referência a partir de um corpo vazio), de modo que a verificação só podia imprimir "ok" para eles, com as mesmas palavras que usava depois de verificar seis campos. A linha de sucesso agora declara o número de campos obrigatórios que encontrou presentes, ou que o tipo de cenário não exige nenhum.

# text
# c1: scripts/gate.sh
# c2: REPEAT
# c3: TEST_THREADS
# c4: REPEAT=no
seg-06b324d00285 = <b><c1/> recusa um <c2/> ou <c3/> não numérico.</b> Sob o bash { "3.2" }, <c4/> fazia a comparação numérica dar erro e resultar em falso, de modo que o portão anunciava "repeatability loop SKIPPED (REPEAT={ "0" })" para um valor que não era { "0" } e ainda escrevia um recibo. Os dois controles agora encerram com { "2" } a menos que sejam inteiros simples.

# text
seg-09d04ffdd9ac = O MSRV é declarado como { "1.85" } em todo lugar em que uma pessoa o lê.

# text
# c1: Cargo.toml
# c2: codemeta.json
seg-dafc23725315 = <c1/> passou para { "1.85" } na última versão; o selo do README, o texto de instalação e de solução de problemas, <c2/> e a própria justificativa do crate MCP ainda diziam { "1.75" }.

# text
# c1: RunOutput.__repr__
# c2: len()
seg-c2fa8a31058c = <b><c1/> na ligação Python informa bytes, não "caracteres".</b> Ele imprimia <c2/> de cadeias UTF-8, que é uma contagem de bytes: { "710" } "caracteres" para uma tabela de 708 caracteres.

# text
# c1: --study --study-name
seg-6b4452a4e340 = O README não documenta mais <c1/> em conjunto.

# text
# c1: --study-name
# c2: --study
seg-47d83e4d847b = <c1/> é um sinalizador de cenário único, ignorado com <c2/> (o binário avisa). Os dois exemplos para copiar e colar em README.md e README.crates.md agora mostram o comando de estudo sozinho.

# text
seg-5ed7f8330b2d = <b>A evidência de estabilidade de relógio do site declara as duas tolerâncias observadas.</b> A série de césio 5071A é reproduzida a ≤ { "3e-5" } e o PHASE.DAT a ≤ { "5e-5" }; o parágrafo dava { "3e-5" } para ambos.

# text
seg-8bba7f1171f3 = Dois arquivos de saída do motor não são mais rastreados.

# text
# c1: scenarios/quantum-pnt-demonstrator.study.{json,html}
# c2: *.study.json
# c3: *.study.html
seg-ea9bf1d14371 = <c1/> foram carimbados pelo motor { "0.20.0" } com todo número de mérito vazio, e o próprio comando de estudo do README os sobrescrevia, sujando a árvore e bloqueando o portão de push. <c2/> / <c3/> agora são ignorados como as outras quatro saídas do motor.

# text
# c1: seed
# c2: u64
seg-77ce9b90859d = <b>Uma varredura de semente no playground não falha mais em toda execução.</b> A varredura percorria linearmente o controle inteiro <c1/> ({ "1" }, { "10.9" }, { "20.8" }, …), e o motor, lendo-o como <c2/>, rejeitava cada valor fracionário. Os controles inteiros agora varrem números inteiros distintos.

# text
# c1: realtime-frame-eop
# c2: engine_version
# c3: scenario_hash
# c4: kshana-csv.csv
seg-e1b1e1360eb9 = <b>Todo download do playground diz qual motor e qual entrada o produziram.</b> Alguns tipos de cenário (por exemplo, <c1/>) não emitem <c2/> nem <c3/>, de modo que seus downloads eram nomeados simplesmente <c4/>. O nome agora recorre à versão do motor carregado e a uma impressão digital FNV-1a-64 de 12 dígitos hexadecimais do texto do cenário.

# text
# c1: cargo install kshana
# c2: docs/
# c3: src/bin/
# c4: crossover_study
# c5: gen_validation_artifacts
# c6: validation_report
# c7: kshana
# c8: cargo run --bin <name>
# c9: validation_report
# c10: cargo package
# c11: cargo install --path
# c12: kshana
seg-0181e86b576a = <b>O crate publicado tem menos da metade de seu tamanho anterior, e <c1/> constrói apenas a CLI.</b> O pacote costumava incluir os artigos, seus pacotes de submissão, os artefatos de figuras dos artigos, os notebooks, <c2/>, os scripts de manutenção e os programas de exemplo. Nenhum deles é compilado pela biblioteca ou pela CLI. Ele também incluía os três geradores internos em <c3/> (<c4/>, <c5/>, <c6/>), de modo que uma instalação por registro compilava e instalava quatro executáveis, três deles úteis apenas dentro de um checkout. Essas árvores e as três fontes dos geradores agora são excluídas. O Cargo lista os binários de um pacote a partir dos arquivos que ele contém, de modo que o manifesto publicado nomeia somente <c7/>. Em um clone, os geradores continuam sendo encontrados automaticamente, de modo que <c8/> e o job de versão que executa <c9/> permanecem inalterados. Medido com <c10/>: { "763" } arquivos, { "16.7" } MiB, { "6.8" } MiB compactados antes; { "591" } arquivos, { "10.5" } MiB, { "3.0" } MiB compactados depois. Seu build de verificação, que compila somente os arquivos empacotados, passa. <c11/> no crate empacotado instalou um executável, <c12/>.

# text
# c1: p95 0.0ns
# c2: security 0.000
seg-567c7059286f = <b>Uma saída que um engenheiro de temporização consegue ler: chega de <c1/>, chega de <c2/> sem nenhum ataque, e contagens do site que coincidem com os READMEs.</b> Esta é uma revisão de exibição. Nenhum número publicado muda; os valores JSON são idênticos, o que os hashes golden acima comprovam.

# text
# c1: 0.0ns
# c2: p95 1.20e-4ns
# c3: 0.0
# c4: 0.000
seg-849fa9a29f07 = O resumo de uma linha imprimia o erro de temporização do percentil 95 (p95) do relógio óptico como <c1/> enquanto a tabela ao lado mostrava { "1.20e-4" } ns. Um número de temporização diferente de zero pequeno demais para uma casa decimal agora é impresso com três algarismos significativos (<c2/>); um zero exato continua sendo impresso como <c3/>. O relatório HTML (HyperText Markup Language), a tabela de comparação do estudo e o relatório para download do playground usam a mesma regra, de modo que nenhum número diferente de zero é impresso como <c4/> também.

# text
# c1: security
# c2: clock
# c3: orbit
# c4: hybrid
# c5: fusion
# c6: security n/a (no attack)
# c7: 0.000
# c8: fom.security
# c9: applicable: false
# c10: figure_tiers
# c11: spoof
seg-c44323babd1e = <c1/> é um limite analítico de detectabilidade de spoofing que só significa algo diante de um ataque configurado. Os tipos de cenário <c2/>, <c3/>, <c4/> e <c5/> não configuram nenhum, de modo que seu resumo agora imprime <c6/> em vez de um número como <c7/>, que se lê como uma detecção falha. O valor permanece em <c8/>, marcado com <c9/> e o motivo em <c10/>, e as tabelas do relatório mostram "não aplicável". O tipo de cenário <c11/> continua pontuando a detecção.

# text
# c1: tests/registry_golden.rs
# c2: golden_clock
# c3: security
# c4: golden_orbit
# c5: security
# c6: tests/tutorials.rs
seg-f54d5ffb7dff = Duas fixações de resumo em <c1/> se moveram exatamente por esses dois motivos e nenhum outro: <c2/> (o p95 quântico e os dois valores de <c3/>) e <c4/> (os dois valores de <c5/>; seus valores de p95 são exatamente zero). Seus hashes do documento inteiro não se moveram. Os resumos esperados no README, nos três tutoriais e em seus cenários didáticos foram atualizados para coincidir, e <c6/> verifica as cópias didáticas em relação ao motor.

# text
seg-e8e012376fa3 = O tour guiado do playground não abre mais no primeiro carregamento. Seu modal capturava os primeiros cliques e seu destaque rolava a página para longe de onde o visitante havia chegado. Ele começa a partir do botão "Fazer o tour de 60 segundos" ou do botão flutuante Tour.

# text
seg-4d60d4ea4d7d = A página não rola mais para os lados em um telefone. A { "390" } px, a linha da marca e o botão do GitHub chegavam a cerca de { "410" } px de conteúdo, um estouro de { "4" } px; o cabeçalho agora cabe a partir de { "320" } px, e a tabela de números de mérito rola dentro de sua própria caixa em vez de alargar a página.

# text
# c1: web/data/verification-matrix.json
# c2: web/counts.test.mjs
# c3: tests/web_validation_counts_doc_sync.rs
seg-f6ec6a64071d = O explorador de capacidades abria com sua própria contagem de cartões ("{ "46" } capability cards … { "17" } backed by an external oracle") ao lado de READMEs que dizem { "64" } de { "168" }. Agora ele abre com a matriz de verificação, lida do <c1/> gerado (a mesma matriz à qual as contagens do README estão fixadas), e nomeia os cartões depois, como a camada de resumo que são. <c2/>, uma nova etapa no workflow de integração contínua (CI), verifica a aritmética e confere o README.md e as descrições da página; <c3/> fixa a ligação a partir do lado Rust.

# text
# c1: docs/POSITIONING.md
# c2: telecom-timing
# c3: docs/TELECOM-TIMING.md
# c4: ROADMAP.md
seg-606098743e57 = <b>A descrição pública agora abre com temporização e holdover, o domínio mais bem validado.</b> A abertura do README e <c1/> apresentam o Kshana como um motor de evidências de resiliência de PNT aberto, reproduzível e com proveniência rotulada: primeiro a temporização e o holdover de infraestrutura crítica (os estimadores de Allan, de Allan modificado, de desvio de tempo e de erro máximo de intervalo de tempo e a inversão da variância de deriva do holdover são as linhas VALIDATED por trás disso), a quântica como um método neutro de comparação quântico-clássico cujos resultados são rotulados MODELLED, e a navegação lunar / cislunar e de espaço profundo como capacidades mantidas, e não como destaque. As duas páginas agora dizem o que o Kshana não é (não é um simulador de sinais de radiofrequência nem uma bancada de hardware-in-the-loop, nem um substituto para MATLAB/Simulink, STK ou Orekit) e apontam para o novo tipo de cenário <c2/> e para <c3/>. A antiga frase "não existe uma boa ferramenta aberta" saiu: uma busca que não encontra nada não é evidência de que nada existe. <c4/> ganha uma ordem de prioridade sem datas (temporização primeiro, a comparação quântica em segundo, o lunar mantido) e remove três itens obsoletos (sistemáticos de Coriolis e de deslocamento de luz, as condições iniciais da NRHO e o cenário lunar, todos já entregues); a linha do README "Coriolis and light-shift remain roadmap" é corrigida da mesma forma.

# text
# c1: docs/CAPABILITY.md
# c2: src/verification.rs
# c3: oem
seg-7bc48692be0b = <b><c1/> parou de subestimar.</b> A linha dos referenciais fixos na Terra dizia "none" enquanto a matriz classifica GCRS→ITRS como VALIDATED; agora diz "full", e a linha dos referenciais principais registra a verificação cruzada com o ANISE como entregue. O modo guiado estava listado como roteiro; o playground já entrega controles deslizantes guiados e um tour guiado. Uma varredura em relação a <c2/> corrigiu mais cinco linhas que antecediam suas validações: o modelo de forças de Cowell e a determinação de órbita em lote/sequencial em relação ao Orekit { "12.2" }, as passagens de estações terrestres em relação ao detector de elevação do Orekit, o núcleo da diluição da precisão em relação ao gnss_lib_py e a importação OEM em relação ao analisador <c3/> independente; a linha de verificação e validação agora nomeia as proteções que verificam que todo teste citado existe.

# text
seg-9d144df304ca = O glossário explica o que diz um arquivo de resultado.

# text
# c1: docs/GLOSSARY.md
# c2: sigma_y
# c3: q_wf
seg-eed672b2f8fd = <c1/> ganha entradas em linguagem simples para os termos de saída (holdover, p95, integridade, a pontuação de segurança, PDOP, <c2/>, <c3/>), os termos de temporização de telecomunicações (erro de tempo, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) e os três níveis de evidência (VALIDATED, MODELLED, PARTNER).

# text
# c1: docs/
# c2: docs/VERIFICATION-MATRIX.md
# c3: docs/MODELLED-RATIONALE.md
# c4: docs/SCENARIOS.md
# c5: src/verification.rs
# c6: api::list_scenario_kinds()
seg-1a4f9d5eef96 = <b>As abreviações são escritas por extenso no primeiro uso em todo documento público escrito à mão.</b> O README e { "24" } arquivos em <c1/> tinham várias centenas de abreviações usadas antes de sua expansão, ou sem ela; cada uma agora é expandida onde aparece pela primeira vez nesse arquivo. Os três arquivos gerados (<c2/>, <c3/>, <c4/>) foram deixados como estão: eles são escritos a partir de <c5/> e <c6/>, de modo que sua redação tem de mudar na origem.

# text
seg-2889ce118381 = A cobertura de linhas tem uma medição de registro.

# text
# c1: docs/COVERAGE.md
# c2: coverage
# c3: b1d350d
# c4: tests/coverage_figure_doc_sync.rs
seg-9c4684c0a4ef = <c1/> registra { "95.63" } % ({ "37,697" } de { "39,419" } linhas) do job <c2/> de CI em <c3/>, e <c4/> fixa a ele as cinco superfícies públicas "~{ "96" }%": o único número de destaque que era mantido à mão e que já havia mudado uma vez sem ser notado.

# text
seg-ebd36b7291df = Novos portões de sincronia da documentação para superfícies que nada lia.

# text
# c1: tests/readme_code_fences_doc_sync.rs
# c2: import { … } from "kshana"
# c3: tests/security_md_doc_sync.rs
# c4: src/lib.rs
# c5: #![forbid(unsafe_code)]
# c6: tests/no_overclaims.rs
# c7: web/README.md
# c8: proof
seg-3dd44fc69a28 = <c1/> verifica cada <c2/> em um bloco de código JavaScript em relação às exportações do WebAssembly e fixa o exemplo Rust de README.crates.md byte a byte a uma cópia que o binário de teste compila. <c3/> falha se <c4/> perder <c5/> ou se SECURITY.md deixar de declará-lo. <c6/> agora também examina <c7/> e os três READMEs de registro, e toda norma no site deve declarar explicitamente seu <c8/>.

# text
seg-a506d14f3447 = As duas verificações de relógio com hardware real são executadas em um runner.

# text
# c1: realdata-clock.yml
# c2: KSHANA_REQUIRE_REALDATA=1
seg-c7f8b8627137 = <c1/> (mensalmente e sob demanda) busca as séries 5071A e PHASE.DAT e executa os dois testes com <c2/>, de modo que uma entrada ausente falha em vez de ser pulada. Os dois scripts de busca são fixados em um único commit do allantools e verificam SHA-256.

# text
# c1: mypy.stubtest
# c2: csv
# c3: write_csv
seg-3b4a7fee3cd0 = <b>O stub de tipos do Python é verificado em relação à wheel construída</b> (<c1/> no job das ligações), que é como <c2/>/<c3/> foram entregues sem stub.

# text
seg-24c2ccf3634a = <b>O glossário define URE, EOP, FoM, CTI e TIB</b>, que o README e o registro usavam sem explicação.

# text
# c1: required_fields
# c2: ephemeris
# c3: tle|orbit+epoch
# c4: kind = "ephemeris"
# c5: --validate
# c6: quantum-trade
# c7: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c8: |
# c9: +
# c10: --validate
# c11: lunar-joint-od-clock
# c12: pvt
# c13: earth-gnss-lunar
# c14: docs/SCENARIOS.md
# c15: kind
# c16: clock
# c17: tests/required_fields_are_true.rs
seg-ae044195cd47 = <b>O contrato de campos publicado de todo tipo de cenário agora é verdadeiro, e um teste o mantém assim.</b> Cinco dos { "61" } tipos de cenário mudaram. Os tipos de cenário com <c1/> não vazio passam de { "21" } para { "22" }: <c2/> agora exige <c3/> (um <c4/> sem mais nada costumava passar por <c5/> e depois falhar na execução), e <c6/> acrescenta <c7/>, que sua execução já exigia. Uma entrada obrigatória pode usar <c8/> (um destes) e <c9/> (todos estes juntos); <c10/> entende ambos. <c11/>, <c12/> e <c13/> publicam { "9" } campos opcionais reais que haviam deixado de fora. <c14/> agora diz que <c15/> é obrigatório para todo tipo de cenário, exceto <c16/>. <c17/> verifica cada tipo de cenário em relação ao seu cenário entregue: remover qualquer entrada obrigatória deve fazer a execução falhar, e um documento que contenha apenas os campos obrigatórios deve executar.

# text
seg-09ba716f3e97 = As notas do JetBrains Marketplace passam por um portão.

# text
# c1: scripts/check-version-sync.sh
# c2: <change-notes>
# c3: plugin.xml
seg-938ff48e7a2d = <c1/> agora falha, a menos que a entrada <c2/> mais recente em <c3/> nomeie a versão que está sendo entregue; sete versões publicadas haviam servido as notas da { "0.22.0" } sem alteração.

# text
seg-3d38550854e0 = O número de cobertura do relatório técnico é o medido.

# text
# c1: paper/kshana-technical-report.md
# c2: docs/COVERAGE.md
seg-bd312cd26746 = <c1/> dizia "perto de { "97" } %"; agora diz perto de { "96" } % ({ "95.63" } % medido, <c2/>) e é a sexta superfície que o teste de cobertura fixa.

# text
# c1: web/engine.test.mjs
seg-934680d402da = <b>O cliente do motor fora da thread principal é testado</b> (<c1/>, na CI): lista de permissões de despacho, cancelamento e recriação, as três rotas de recurso na thread principal e recuperação de falhas, contra um worker simulado.

# text
# c1: release.yml
# c2: docs/RELEASING.md
seg-fd5f9a8a4f43 = <b>Nada é publicado até que o commit marcado tenha passado em seus testes, e uma versão não está concluída até que todo registro a sirva.</b> A ordem agora é tag, verificação, publicação, paridade, site, em uma única execução de <c1/> (<a1><c2/></a1>).

# text
seg-745b11c8ed74 = A publicação espera pelo veredito.

# text
# c1: publish.yml
# c2: mcp-publish.yml
# c3: jetbrains-plugin.yml
# c4: release.yml
# c5: needs: verify
# c6: verify
# c7: scripts/check-release-verdict.sh
# c8: verify
seg-e66c890cf6c0 = <c1/>, <c2/> e <c3/> não começam mais no push da tag; <c4/> os chama a partir de jobs que têm <c5/>. Antes, eles disputavam corrida com ele: na { "v0.27.2" }, crates.io, npm e o Python Package Index (PyPI) haviam todos publicado em até { "4.5" } minutos após a tag, e <c6/> retornou { "84" } minutos depois dela; na { "v0.27.0" }, npm e PyPI publicaram enquanto o job do crates.io falhava. Uma nova tentativa manual sobre uma tag é retida pelo novo <c7/>, que exige um <c8/> verde para aquele commit exato a partir da interface do Actions e falha de forma fechada diante de qualquer outra coisa.

# text
seg-3800247c81f2 = <em>Tudo é construído antes de qualquer coisa ser enviada</em>, e o crates.io, cuja etapa de empacotamento foi a que falhou no meio da versão, publica primeiro.

# text
seg-6929a7608da7 = <em>A falta de um token de registro faz o job falhar</em>, em vez de pular o envio e informar sucesso.

# text
seg-460811602293 = Uma verificação de paridade após a publicação.

# text
# c1: scripts/check_channel_parity.py
# c2: kshana
# c3: kshana-mcp
seg-86eb0fab2f7c = <c1/> consulta o crates.io (<c2/> e <c3/>), o npm, o PyPI (a distribuição de código-fonte e as seis wheels de plataforma) e o ghcr.io até que cada um sirva a versão, ou faz a execução falhar; docs.rs e o registro do Model Context Protocol (MCP) são informados, não exigidos. Executado contra versões passadas, ele encontra a { "0.22.0" } ausente do npm e do PyPI, a { "0.23.0" } do PyPI e a { "0.27.0" } do crates.io.

# text
# c1: kshana-aarch64-apple-darwin
# c2: kshana
# c3: SHA256SUMS
# c4: verify-release
seg-79578a00fd78 = <em>Binários de linha de comando pré-compilados para macOS (Apple silicon e Intel) e Windows x86-64</em>, nomeados por alvo (<c1/> e assim por diante), ao lado do <c2/> para Linux, cujo nome não muda. Um arquivo <c3/> cobre todo ativo, e <c4/> o verifica e executa os binários de macOS e de Windows em seus próprios sistemas.

# text
# c1: main
# c2: main
# c3: pages.yml
seg-3e1f5afa9f2a = <em>kshana.dev mostra uma versão, não <c1/>.</em> Ele costumava ser reimplantado a cada push em <c2/> enquanto suas páginas nomeavam a última versão. <c3/> agora constrói apenas uma tag de versão: a versão o dispara uma única vez, quando todo canal serve a versão, e um disparo manual reimplanta a versão mais recente (ou uma nomeada).

# text
seg-43da8f3f171e = Uma única fonte de wheels.

# text
# c1: publish.yml
# c2: wheels.yml
seg-b911ac65e231 = A matriz de seis alvos copiada à mão de <c1/> acabou; ele chama <c2/>, de modo que o portão da tag do auditwheel e a verificação de reprodutibilidade byte a byte agora avaliam as wheels que o PyPI recebe, e uma falha em qualquer um dos dois interrompe a versão.

# text
# c1: publish.yml
# c2: pages.yml
# c3: @stable
# c4: rust-toolchain.toml
# c5: scripts/check-toolchain.sh
seg-194c4b019a4c = <em>Ferramentas de build fixadas.</em> Todo workflow solicita o Rust { "1.93.0" } (o job msrv, sua própria versão); <c1/> e <c2/> haviam solicitado <c3/>, e o log da { "v0.27.2" } mostra o rustup instalando a { "1.98.1" } e depois compilando com a { "1.93.0" } apenas porque <c4/> tem precedência sobre ela. O wasm-pack é fixado em { "0.13.1" } (a versão que construiu a { "v0.27.2" }, que o script instalador sem fixação escolheu) com verificação de checksum, e o mcp-publisher em { "1.8.1" } com seu SHA-256 publicado. <c5/> agora falha se um workflow pedir outro compilador ou enviar por pipe um script baixado para um shell. Nenhum job de verificação, fixação golden ou script local de portão foi removido ou afrouxado.

# text
# c1: dtolnay/rust-toolchain
seg-9e2a7376367e = <b>Toda GitHub Action de terceiros é fixada por SHA de commit</b> — { "93" } referências em { "15" } workflows, { "92" } delas novas — com a tag mantida como comentário ao final para o Dependabot atualizar. A exceção é <c1/>, cuja tag é o seletor da toolchain.

# text
# c1: mcp/kshana-mcp
seg-6afb4a8770b0 = <b>As camadas base da imagem do servidor MCP são fixadas por digest multiarquitetura</b>, e o Dependabot agora vigia o Dockerfile de <c1/>, de modo que as camadas do SO continuam recebendo atualizações de segurança, por meio de um PR revisto.

# text
seg-4ea8b158b408 = A verificação de tag contra manifesto é executada nos dois workflows de publicação que entregam a versão da tag.

# text
# c1: mcp-publish.yml
# c2: jetbrains-plugin.yml
# c3: publish.yml
# c4: scripts/check-version-sync.sh
seg-4b77764e955d = <c1/> (imagem ghcr, registro MCP) e <c2/> (Marketplace) disputam corrida com <c3/> em vez de esperar por ele, de modo que uma tag cortada errado só era barrada em um irmão. Os dois agora executam <c4/> antes de construir.

# text
# c1: rmcp
# c2: rmcp
# c3: rmcp
# c4: kshana-mcp
# c5: rust-version = "1.88"
# c6: kshana
# c7: Content
# c8: ContentBlock
seg-bf90c4063843 = <b>Quatro avisos de segurança que o Dependabot levantou no dia em que seus alertas foram ativados estão corrigidos.</b> O servidor MCP passa de <c1/> { "1.7" } para { "2.2" }: três avisos contra <c2/> < { "2.1" } (um vazamento da tabela de sessões Streamable-HTTP, a falta de validação OAuth de recurso protegido, cabeçalhos personalizados seguindo um redirecionamento entre origens), nenhum alcançável aqui, já que o servidor fala apenas stdio, mas um crate publicado não deve fixar um SDK vulnerável. As macros do <c3/> { "2" } exigem o Rust { "1.88" }, de modo que somente <c4/> agora declara <c5/>; a biblioteca <c6/> permanece em { "1.85" }. A única mudança de API (<c7/> → <c8/>) está aplicada, e os testes de ida e volta passam. A action de varredura do SonarQube passa da v5 para a v6, o que corrige um aviso de injeção de argumentos (≥ { "4.0" }, < { "6.0" }).

# text
# c1: navsignal::code_tests
# c2: integrity::tpl_scalar::tests
# c3: api::tests::tracking_loop_kind_round_trips_through_the_dispatch
# c4: .rs
seg-2652aaad177e = <b>Todo item Rust que uma linha da matriz de verificação cita agora é resolvido contra o crate.</b> A proteção existente verificava as citações com forma de caminho de arquivo; { "63" } das { "164" } linhas que não são de parceiro nomeiam sua evidência como um item interno ao crate, em vez disso (<c1/>, <c2/>, <c3/>), e um token sem sufixo <c4/> era invisível a um examinador de caminhos. Essas linhas podiam nomear um módulo renomeado, um módulo de testes esvaziado ou uma função que nunca existiu, e todo portão teria permanecido verde.

# text
# c1: tests/verification_rows_name_a_test_that_exists.rs
# c2: #[test]
# c3: mod tests
# c4: #[test]
seg-01eee5115e3f = <c1/> resolve todas as { "339" } citações desse tipo pela árvore de módulos, exige que toda linha que não seja de parceiro nomeie pelo menos um teste que de fato traga <c2/> e exige que as linhas de parceiro não nomeiem nenhum. Quatro mutações foram usadas para avaliá-lo: renomear um módulo citado, apontar a única citação de teste de uma linha para uma função que não é de teste, renomear o <c3/> real e remover dele os atributos <c4/>; cada uma fica vermelha na asserção que lhe cabe.

# text
# c1: tests/*
# c2: tests/alternative_complementary_pnt_reference.rs
seg-7731d549c739 = Uma linha já estava errada: <em>Alternative / complementary PNT</em> citava <c1/>, um glob, que não é uma citação. Agora ela nomeia <c2/> e os três módulos de teste internos ao crate por trás dele.

# text
# c1: tests/published_figures_still_reproduce.rs
# c2: chart.svg
# c3: scenario-fom.png
seg-cf6fd64368de = <b>Os números publicados são verificados de novo contra o motor a cada build</b> (<c1/>). Os três gráficos de demonstração do README são a própria saída <c2/> do motor e nada executava o cenário novamente; os dois estudos de cruzamento do artigo foram gerados uma única vez e registrados no repositório; e o README declara quatro números de mérito em prosa ao lado de <c3/>. Os três agora estão fixados à saída viva do motor.

# text
seg-276b65a8f76a = Conciliá-los trouxe o resultado útil: os gráficos de demonstração haviam sido desenhados com o motor { "0.22.0" } e o JSON de cruzamento do artigo com o { "0.20.0" }, e na { "0.27.1" } <b>todo valor plotado nos cinco artefatos é idêntico</b>: os três SVGs dos gráficos diferem de uma execução nova em exatamente dois caracteres cada, a marca de versão no rodapé. Os gráficos foram renderizados de novo para que o rodapé seja verdadeiro. O JSON do artigo é deliberadamente deixado com a marca { "0.20.0" }: é o registro da execução cujo número um artigo publicado incorpora, e remarcá-lo alegaria uma proveniência que o PDF não tem. A proteção afirma a propriedade mais forte: que o motor atual ainda reproduz todo valor publicado.

# text
# c1: VERSION=not provided
# c2: previous_version
# c3: FieldUnit
# c4: ensemble
# c5: hybrid
# c6: fusion
# c7: inertial
# c8: report
seg-c88647c5f2fc = As análises do SonarCloud eram registradas como <c1/>, de modo que o período de código novo <c2/> nunca avançava: continuava ancorado na análise de 2026-07-02, avaliando oitenta e dois dias de trabalho como um único delta e medindo { "7877" } linhas duplicadas "novas" contra um limite de { "3" } %. A varredura agora passa a versão do crate. A duplicação subjacente é real e não é ocultada por isto: ela se concentra nos registros declarativos de <c3/> repetidos em <c4/>, <c5/>, <c6/>, <c7/> e <c8/>, e na tabela de verificação de 168 linhas, e é nomeada aqui como trabalho a fazer, e não excluída da medição.

# text
# c1: scripts/gate.sh
# c2: integration_binaries
# c3: tests_passed
# c4: tests_ignored
# c5: target/gate-run.log
seg-f2a0960a6f11 = <b><c1/> não tinha trava de escritor único, e toda execução escrevia o mesmo log.</b> Isso não é questão de arrumação: <c2/>, <c3/> e <c4/> do recibo são lidos DE VOLTA desse log, e o hook de pre-push confia no recibo. Um portão que foi encerrado, mas cujo binário de teste ainda estava vivo, continuou escrevendo no arquivo que a execução seguinte acabara de truncar; assim, as contagens de uma execução podiam ter sido tomadas como as de outra, permitindo um push com base em uma suíte que nunca foi executada sobre a árvore enviada. Agora há um portão por checkout (recusando com saída { "75" } ao lado de um vivo e limpando uma trava obsoleta cujo pid desapareceu) e um log por execução, com <c5/> atualizado a partir da execução que termina, ao sair. Os dois sentidos são testados: um pid vivo recusa, um morto é limpo.

# text
# c1: src/verification.rs
# c2: verification::gen
# c3: artifacts
seg-687d6fe87221 = <c1/> afirmava que seus testes "<b>não</b> provam que as cadeias de teste/referência independente nomeadas se resolvem em código vivo". Duas proteções agora fazem exatamente isso, de modo que a documentação do módulo dizia o contrário da verdade; agora ela declara o que é verificado por máquina e o que fica para o julgamento humano. Uma referência obsoleta a <c2/> (o módulo é <c3/>) é corrigida na própria documentação da proteção irmã.

# text
# c1: main
# c2: main
seg-014070f0873c = <b><c1/> foi reescrito em 2026-09-22 e enviado com force-push.</b> Dez commits viraram quatro. A reescrita incorporou cada commit que deixou um portão vermelho ao commit que o deixou verde, de modo que todo commit em <c2/> agora tem uma árvore que passa, e removeu as execuções canceladas que um grupo de concorrência abrangendo o branch inteiro vinha deixando em todo commit substituído.

# text
# c1: git diff
seg-b48d6cfc3b42 = Nada foi descartado. Os commits anteriores à reescrita continuam alcançáveis pelas tags que apontam para eles, e a árvore final é idêntica byte a byte à árvore da qual a reescrita partiu: <c1/> entre a ponta antiga e a nova é vazio, exceto pelos três arquivos de workflow que esta versão altera.

# text
seg-0549cfdc6d69 = Os SHAs substituídos, para quem guarda uma referência a algum deles:

# text
seg-14812deb1b6b = antigo

# text
seg-c63f549e6a1d = assunto

# text
seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

# text
seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

# text
seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

# text
seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

# text
seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

# text
seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

# text
seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

# text
seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

# text
# c1: 7bba514
# c2: 7864142
# c3: .cargo_vcs_info.json
# c4: main
# c5: main
seg-9c220336c895 = <b>As tags { "v0.27.0" } e { "v0.27.1" } deliberadamente NÃO foram movidas.</b> Elas ainda apontam para <c1/> e <c2/>, os commits exatos cujas árvores produziram os artefatos agora publicados no crates.io, npm, PyPI, ghcr.io e no registro MCP. O <c3/> de um crate registra o sha1 a partir do qual ele foi empacotado, os registros são imutáveis, e a atestação de proveniência de build SLSA nos ativos da versão { "v0.27.1" } está vinculada a esse commit. Mover as tags teria deixado todos esses artefatos publicados apontando para um commit que não existe mais. Deixá-las mantém os commits antigos alcançáveis e toda cadeia de proveniência publicada resolvendo, ao custo de duas tags que não são mais ancestrais de <c4/>, razão pela qual esta versão existe: a { "v0.27.2" } dá a <c5/> uma tag própria, empacotada a partir de um commit que está nele.

# text
seg-3c644384256f = Esta é a segunda reescrita divulgada deste histórico; a primeira, em 2026-09-21, canonicalizou a autoria e está registrada nas notas da { "0.27.0" }, com seus próprios dois sha1 de crate pendentes. Uma reescrita é divulgada aqui todas as vezes, porque um repositório que vende proveniência verificável não pode mover silenciosamente o chão sob um artefato publicado.

# text
seg-d82d7a3c9054 = O crate publicado não compilava.

# text
# c1: src/lunar_orientation.rs
# c2: include_str!
# c3: tests/fixtures/llr_geometry/de440_moon_pa.csv
# c4: /tests/fixtures
seg-ebc99c9df1ef = <c1/> contém um <c2/> de nível superior de <c3/>, e o manifesto exclui <c4/> do pacote, de modo que o tarball que o crates.io recebe não tinha um arquivo que a própria biblioteca incorpora. A publicação da { "v0.27.0" } falhou em seu build de verificação por esse motivo, e nenhuma { "0.27.0" } chegou ao crates.io; o npm e o PyPI, cujos jobs não dependem dele, publicaram normalmente. A exclusão agora traz uma exceção para esse único catálogo.

# text
# c1: include_str!
# c2: src/
# c3: #[cfg(test)]
seg-6ff9cdb976e8 = Todo outro <c1/> de uma fixture em <c2/> fica dentro de um módulo <c3/> e, portanto, nunca chega à biblioteca empacotada. Somente um de nível superior chega.

# text
# c1: cargo package
# c2: package
seg-7f0975453b8f = <b>Nada na CI executava <c1/>,</b> razão pela qual um tarball que não consegue compilar foi descoberto primeiro pelo job de publicação, depois que dois outros registros já haviam entregue. Um job <c2/> agora constrói e compila o tarball exato a cada push.

# text
seg-1f2df48821fc = As fixações da emissão de realização do referencial lunar não se movem mais a cada mudança de versão. O rodapé do SVG traz a versão do motor, de modo que toda versão refazia a linha de base de três hashes, duas vezes em um dia, e uma fixação refeita por rotina deixa de ser lida. A cadeia da versão é normalizada para um marcador antes do hash, e a emissão é afirmada separadamente como declarando a versão em execução, de modo que esse fato é verificado com mais precisão do que o hash jamais o verificou.

# text
# c1: lunar-llr-datum
seg-56309487ea7e = <c1/>: o datum do referencial lunar a partir de uma campanha de observação real.

# text
# c1: lunar-frame-campaign
# c2: bin_rms / sqrt(n_raw)
# c3: realdata::llr_crd
# c4: lunar_llr
seg-966a2cc4e40d = <c1/> substituiu uma transformação de Helmert injetada por uma campanha <em>simulada</em> e disse isso: sua rede de estações, seu cronograma e seu sigma por observação são entradas ilustrativas. Este cenário retira a simulação dos dois lugares em que um cronograma e um modelo de erro entram na resposta. As épocas são os tempos de transmissão de { "337" } pontos normais arquivados de telemetria a laser lunar da ILRS (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } e Matera MLRO { "7941" }, todos os cinco arranjos de retrorrefletores), e todo peso de observação é a própria precisão arquivada desse ponto normal, <c2/>, uma mediana de { "5.13" } mm de distância de ida, tirada do arquivo e não escolhida aqui. As coordenadas das estações vêm do IERS ITRF2020 e as dos refletores da Tabela { "7" } do JPL DE430; cada fixture registra uma URL, uma data de obtenção e um SHA-256 e é regenerada a partir de sua fonte por um gerador registrado no repositório que verifica a fonte e aborta em vez de emitir um número. O relatório nomeia quais enlaces são medidos e quais continuam modelados, e os modelados são <em>medidos</em>: a distância de ida observada menos calculada sobre os dados reais é { "156 494" } m RMS, o que o mesmo conjunto de testes confirma contra o JPL Horizons no mesmo intervalo ({ "195 655" } m RMS vetorial, pior época { "0.054" }°, dentro dos ~{ "0.3" }° que a série lunar analítica embutida reivindica para si). Aditivo: um novo tipo de cenário, um novo leitor (<c3/>) e um novo módulo (<c4/>); os pacotes de referencial lunar existentes são fixados bit a bit.

# text
# c1: sigma_ure_m
# c2: lunar-integrity
# c3: moonlight-service-volume
# c4: LUNAR_SIGMA_URE_M
seg-7fcd2af0a688 = <b><c1/> como parâmetro de cenário</b> em <c2/> e <c3/>. A precisão de alcance do sinal no espaço era uma constante de tempo de compilação (<c4/>), de modo que uma varredura do volume de serviço só podia responder atinge/não atinge em um único valor fixo. Os níveis de proteção são exatamente lineares nela, de modo que expô-la transforma a varredura em um <b>requisito</b> de precisão de alcance sobre todo o volume. O padrão reproduz o comportamento anterior bit a bit.

# text
# c1: moonlight-service-volume
# c2: export_site_lat_deg
# c3: export_site_lon_deg
# c4: per_sat_geometry
seg-c3ccc1e89a2d = <b>Exportação de geometria por satélite</b> em <c1/>: <c2/> + <c3/> acrescentam um vetor <c4/> que dá azimute, elevação e distância oblíqua a todo satélite em toda época para um local selenográfico nomeado, mais o indicador de visibilidade. O resumo agregado de cobertura deliberadamente colapsa a geometria por satélite, mas a distância oblíqua é exatamente o que um orçamento de enlace consome, de modo que uma análise conjunta de comunicações e navegação não podia ser feita apenas a partir do resumo. Desativado, a menos que as duas coordenadas sejam dadas; puramente aditivo.

# text
# c1: lunar_service::topocentric
seg-ae7886fbca9d = <c1/>, o auxiliar público de ângulos de visada por trás da exportação.

# text
seg-b187bade5f04 = Uma linha da matriz de verificação para a nova capacidade de geometria.

# text
# c1: antenna::pattern_gain_dbi
# c2: [2·J₁(x)/x]²
# c3: antenna.rs
# c4: export_antenna
# c5: moonlight-service-volume
# c6: antenna_pattern
# c7: θ₃dB[deg] = √(31000/G_lin)
# c8: 70·λ/D
seg-14ef785b6c12 = <b>O diagrama de antena real na exportação de geometria.</b> O motor carrega um diagrama de abertura circular uniformemente iluminada desde o P1 (<c1/>, a forma de Airy <c2/>) e <b>nada fora de <c3/> o usava</b>: uma regra prática que associa um ganho no eixo a uma largura de feixe fazia o trabalho em seu lugar. Uma tabela opcional <c4/> em <c5/> (lida somente quando o local de exportação está definido) agora dá a cada linha exportada o <b>ângulo fora do eixo no satélite</b> e o <b>ganho de transmissão em direção ao local a partir desse diagrama</b>, e acrescenta um bloco <c6/> que informa a <b>contagem dentro do feixe sob o diagrama real ao lado da contagem dentro do feixe sob a aproximação simétrica</b> (<c7/>), com a diferença como uma correção nomeada. Os dois números são emitidos; nenhum substitui o outro. Medidos na abertura lunar representativa do próprio motor (prato de { "1" } m, { "2.4" } GHz, η = { "0.60" }) sobre um local do polo sul e a camada ilustrativa de classe LCNS, os dois <b>discordam por mais de um satélite</b>: o diagrama real põe { "0" } de { "76" } enlaces visíveis dentro do feixe de meia potência, a aproximação alega { "28" }, uma correção de −{ "2.33" } satélites por época, pior época individual { "3" }. A aproximação carrega uma eficiência de abertura própria ({ "0.641" } contra a regra de <c8/> graus com que normalmente é citada, { "0.920" } contra uma abertura circular uniforme), de modo que, em um prato com η = { "0.60" }, ela devolve um feixe { "1.238" }× largo demais; o bloco emite as duas eficiências implícitas em vez de deixá-las para serem inferidas. Puramente aditivo: medido no ponto de trabalho documentado, { "597" } folhas preexistentes, <b>{ "0" } alteradas, { "0" } removidas, { "494" } acrescentadas</b>.

# text
# c1: antenna::symmetric_beamwidth_rad
# c2: antenna::symmetric_relation_implied_efficiency
# c3: antenna::within_half_power_beam
# c4: antenna::HALF_POWER_DROP_DB
# c5: antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2
# c6: antenna::UNIFORM_APERTURE_HPBW_COEFF
# c7: lunar_service::nadir_off_boresight_rad
# c8: x = 1.61634
# c9: 1.02899·λ/D
# c10: 1.02
# c11: pattern_gain_dbi
seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> e <c7/>, as peças públicas por trás disso. O diagrama agora também é ancorado nas constantes de Airy publicadas, e não apenas em si mesmo: o cruzamento de meia potência é localizado por bisseção e comparado com <c8/>, o que torna a largura exata de meia potência <c9/> e registra com honestidade que o coeficiente convencional <c10/> coloca <c11/> em <b>−{ "2.955" } dB</b>, não em −{ "3.010" } dB.

# text
# c1: lunar-time-budget
# c2: x(τ)
# c3: <scenario>.table.csv
# c4: τ
# c5: x
seg-bac7217bb128 = <b>Uma tabela de reprodutibilidade em formato longo para <c1/>.</b> As saídas vetoriais do cenário (a grade de tempos de média, as sete curvas <c2/> por termo e seu total em raiz da soma dos quadrados) chegavam aos consumidores apenas como vetores JSON. Uma tabela liberada foi truncada em { "400" } caracteres e publicou { "23" } de seus { "57" } tempos de média sob uma coluna que afirmava conter todos, e o manuscrito reconstruiu as curvas por termo a partir de formas fechadas porque o motor nunca as emitiu. Uma execução simples agora também escreve <c3/> com uma linha por (índice da grade, tempo de média, termo), o que não pode ser truncado em algo que ainda pareça inteiro. O índice da grade é uma chave exata de junção; <c4/> é escrito com { "13" } algarismos significativos e cada <c5/> com { "7" }, de modo que os bytes não divergem entre builds do mesmo código-fonte. Puramente aditivo: o JSON do relatório é idêntico byte a byte.

# text
# c1: hybrid-optical-rf
# c2: link_configuration
# c3: units
# c4: variance
seg-ab9209297ec2 = <b>O relatório de <c1/> agora descreve a si mesmo.</b> Um bloco <c2/> repete as entradas resolvidas do enlace (comprimento de onda da portadora, abertura de transmissão e de recepção, distância, largura de pulso, tempo de integração, eficiências e perdas), com os padrões aplicados, de modo que um artigo declara a configuração com que foi executado em vez de citar um padrão lido do código-fonte. Um bloco <c3/> dá a unidade e a classe de proveniência de toda grandeza que um artigo provavelmente citará. Os traços de covariância de transferência são a razão de sua existência: eram emitidos como um simples <c4/> e um manuscrito inferiu metros quadrados a partir de uma verificação de consistência interna. A inferência estava certa, e é exatamente por isso que era um defeito: nada teria percebido se estivesse errada. Puramente aditivo: medido em quatro configurações, { "456" } campos preexistentes, <b>{ "0" } alterados, { "0" } removidos, { "196" } acrescentados</b>.

# text
# c1: InternalConsistency
seg-5c810155300c = Uma linha da matriz de verificação para a tabela de reprodutibilidade do orçamento de tempo, com honestidade <c1/> / <b>MODELLED</b>: o total é verificado contra a raiz da soma dos quadrados dos termos no mesmo arquivo, que compartilha as próprias definições de termos do motor e, portanto, não é uma referência independente. Juntas, elas acrescentam três linhas. O total corrente desta seção não lançada é <b>{ "168" } linhas — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

# text
# c1: ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>
# c2: ashfordeOU <contact@ashforde.org>
# c3: Chakshu Baweja <contact@ashforde.org>
# c4: dependabot[bot]
seg-ed290a85ab0e = <b>A autoria dos commits em todo o histórico agora é uma única identidade, e dois crates publicados apontam para um commit que não existe mais.</b> Em 2026-09-21, o histórico do git foi reescrito de modo que todo commit humano é de autoria e de commit de <c1/>. Antes, ele trazia três grafias de uma mesma pessoa: { "688" } commits como <c2/>, { "34" } como <c3/> e { "94" } já canônicos. O único commit de <c4/> foi deliberadamente deixado como de seu próprio autor: renomear a atualização de dependência de um bot alegaria a autoria de um trabalho que ninguém aqui fez.

# text
# c1: v0.26.0
# c2: 92284e9420605568f1bfabb78cd95d383b40f3e2
seg-ec4e75f94462 = <b>Nenhum conteúdo mudou.</b> A reescrita tocou apenas nos cabeçalhos de autor e de committer, e isso é verificável, não apenas afirmado: a árvore de toda tag e de todo branch é idêntica bit a bit ao que era antes. <c1/> continua resolvendo para a árvore <c2/>, exatamente como antes.

# text
# c1: v0.26.0
# c2: dce2dbf7700788cf6de46260c14673c0e5347360
# c3: d4921f3025569e00e425e1747d0acfc261e96e18
seg-bc0f4fa0a009 = <b>O que isso custou.</b> O nome de um commit é um hash sobre sua árvore, seus pais e seus cabeçalhos de autor, de modo que alterar um ancestral renomeia todo descendente. O commit da versão <c1/> era <c2/> e agora é <c3/>. Dois artefatos registraram o nome antigo no momento da publicação e não podem ser corrigidos, porque uma versão publicada em um registro é imutável por projeto:

# text
# c1: kshana
# c2: .cargo_vcs_info.json
# c3: dce2dbf…
seg-52e096332738 = <c1/> { "0.26.0" } no crates.io: <c2/> registra <c3/>

# text
# c1: kshana-mcp
# c2: path_in_vcs: mcp/kshana-mcp
seg-8ec39d2f136c = <c1/> { "0.26.0" } no crates.io: o mesmo sha1, <c2/>

# text
# c1: gitHead
seg-9a21b7c7b41c = Nada mais é afetado. O pacote npm não registra <c1/>, e a distribuição do PyPI não registra nenhum commit; ambos foram verificados, não presumidos.

# text
# c1: dce2dbf…
seg-9c51c5fb0d80 = Não há reparo que faça <c1/> nomear o commit reescrito: essa cadeia <em>é</em> a ascendência antiga, e a única maneira de ela se resolver é manter publicado o histórico anterior à reescrita, o que restauraria a autoria que a reescrita removeu. A proveniência da { "0.26.0" } passa, portanto, pela tag e não pelo sha1 registrado, e a tag entrega os mesmos bytes a partir dos quais o crate foi construído. A próxima versão registra um commit válido, sem necessidade de nenhuma ação.

# text
# c1: realtime-frame-eop
# c2: finals2000A
# c3: predicted_rows.n = 0
# c4: tools/finals2000A_2026.txt
# c5: predicted_rows.n = 12
# c6: predicted_rows.n
# c7: p4_frame_eop.csv
# c8: tests/golden/realtime-frame-eop.csv
# c9: docs/revisions/G12-default-eop-cell-changes.md
seg-30ecea86118a = <b><c1/> usava por padrão um arquivo EOP sem linhas de previsão (G12).</b> O cenário incorporava um trecho <c2/> de cinco linhas <em>somente finais</em> como padrão offline, de modo que uma execução simples informava <c3/> e a tabela por horizonte se apoiava em pares de { "5" }, { "4" }, { "3" } e { "2" }. O motor sempre pôde ler uma linha de previsão; a entrada simplesmente não tinha nenhuma. O padrão agora é o extrato literal do IERS de { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } finais do Bulletin B e <b>{ "12" } linhas do Bulletin A somente de previsão</b>, de modo que uma execução simples, sem argumento de arquivo e sem rede, informa <c5/> e uma tabela por horizonte com n = { "20" } / { "31" } / { "30" } / { "29" }, e a comparação com o preditor operacional e a concordância com as previsões publicadas do próprio produto também são preenchidas. O extrato longo de 45 linhas foi medido como alternativa e rejeitado: ele também é somente final, de modo que teria deixado <c6/> em { "0" }. <b>Isto altera números publicados</b>, sob a regra R4 e com a anuência do fundador: dez das { "22" } células do <c7/> liberado e { "24" } das { "42" } células preenchidas de <c8/>. O piso medido de polo rápido menos final passa a { "0.0678" } mas (de { "0.0769" } mas), que é o valor que a própria tabela de movimento polar do artigo P4 já publica com n = { "20" }; os dois agora concordam, em vez de diferir em { "13.5" } %. Todo outro número que o P4 imprime a partir desta tabela permanece inalterado na precisão impressa. A enumeração completa antigo → novo, incluindo os campos que <em>não</em> se moveram, está em <a1><c9/></a1>. O trecho somente final continua entregue, fixado byte a byte e exercitado: uma contagem zero de linhas de previsão nele é uma propriedade do arquivo, e um teste ainda o comprova.

# text
# c1: moonlight-service-volume
# c2: n_sats
# c3: n_sats > 12
seg-17fbc566dc5b = <b>Um limite obsoleto de satélites em <c1/>.</b> O cenário limitava <c2/> a { "12" } embora o seu próprio construtor de constelação suporte { "24" } e um teste afirme { "24" }; assim, toda contagem solicitada acima de { "12" } era reduzida silenciosamente, e uma varredura da quantidade de satélites devolvia valores idênticos acima de { "12" } — indistinguíveis de uma saturação geométrica genuína. Agora o limite é o do construtor. Trata-se de uma mudança de comportamento apenas para <c3/>.

# text
# c1: lunar-differential-pnt
seg-4df7d4d61b40 = O mesmo limite obsoleto em <c1/>.

# text
# c1: lunar_dpnt
# c2: n_sats
# c3: dpnt_nsats_sweep.csv
# c4: n = 16
# c5: n = 12
# c6: n = 16
# c7: n_sats > 12
seg-8adfbd27c4f8 = <c1/> limitava <c2/> a { "12" } com a mesma consequência, e esta chegou a uma tabela publicada: <c3/> traz uma linha <c4/> idêntica byte a byte à linha <c5/>, porque o motor devolvia uma resposta de doze satélites sob um rótulo de dezesseis satélites. Agora o limite é o do construtor, { "24" }, e um novo teste o fixa — cada constelação maior deve tanto informar a sua própria contagem quanto melhorar estritamente o nível de proteção, de modo que o limite não possa voltar sem ser notado. <b>Isto altera números publicados</b>: o nível de proteção para <c6/> passa de { "16.92" } m para { "14.57" } m. Varrida até { "24" }, a curva é estritamente monótona ({ "11.94" } m com { "24" } satélites, { "29.5" } % melhor do que com { "12" }), portanto não há saturação em { "12" } — o aparente patamar era o limite. Mudança de comportamento apenas para <c7/>.

# text
seg-ebee158b73c8 = Uma versão de documentação, transparência e playground. Nenhuma mudança de comportamento do motor: a matriz de verificação permanece em <b>{ "102" } linhas — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, inalterada em relação à { "0.25.0" }.

# text
# c1: //!
# c2: lib.rs
seg-7af422ed6d89 = <b>rustdoc no nível do crate</b> (<c1/> em <c2/>) cobrindo pontos de entrada, o modelo de honestidade/níveis e a reprodutibilidade, de modo que o docs.rs abra numa página inicial de verdade, e não numa parede de módulos sem texto.

# text
# c1: docs/SCENARIOS.md
# c2: 50
# c3: api::list_scenario_kinds()
# c4: gen_validation_artifacts
# c5: tests/scenarios_reference_doc_sync.rs
seg-dd44c25f3af5 = <b><c1/></b> — uma referência por tipo para todos os <c2/> tipos de cenário, gerada a partir de <c3/> (a única fonte de verdade) por <c4/> e protegida por <c5/>, de modo que não possa divergir do despachante.

# text
# c1: allan
# c2: estimator
# c3: fom
# c4: hybrid
# c5: inertial
# c6: models
# c7: report
# c8: run
# c9: scenario
# c10: timetransfer
# c11: types
seg-e2cc77d3b413 = <b>Documentação de módulos</b> para os { "11" } módulos públicos antes sem documentação (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

# text
# c1: batch_ls
# c2: cr3bp
# c3: detection
# c4: attitude_budget
# c5: reentry
seg-8d156713799d = <b>Fontes da literatura</b> para cinco módulos de fórmulas que enunciavam uma equação, mas não citavam nenhuma referência: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

# text
# c1: security.txt
seg-832b4bfbc48a = <b>Um <c1/> publicado</b> em kshana.dev para divulgação coordenada.

# text
# c1: fomTier()
# c2: src/fom_label.rs
seg-30603f59e27d = <b>Nível de validação por execução no playground.</b> A tabela de figuras de mérito de execução única agora traz uma etiqueta VALIDATED/MODELLED por figura, lida da mesma consulta <c1/> que o relatório para download usa (espelhando <c2/>, ela própria derivada da matriz de verificação), de modo que o nível mostrado ao lado de um número ao vivo nunca possa discordar do registro.

# text
# c1: lunar-attack-surface
seg-93b203f3a1c0 = <b><c1/></b> no menu do playground — todos os { "50" } tipos despacháveis agora estão a um clique de distância (eram 49/50).

# text
seg-1ec0830db404 = <b>Mais cinco cartões de capacidade executáveis</b> (clima espacial, avaliação de degradação de RF, resiliência, interoperabilidade CCSDS OEM, KIF), elevando os cartões executáveis de { "11" } para { "16" }. Os cartões só de API e só de biblioteca mantêm um link honesto para a documentação, em vez de um falso botão de execução.

# text
seg-977ea074dd9d = A cobertura de documentação agora é controlada por um limite que só desce (ratchet) no CI.

# text
# c1: check-doc-coverage.sh
# c2: missing_docs
# c3: #![warn(missing_docs)]
# c4: -D warnings
seg-beb308bcaafb = <c1/> compila a biblioteca com <c2/>, conta os avisos e só falha se a contagem subir acima de um teto fixado ({ "986" }). Um <c3/> rígido sob <c4/> teria transformado ~{ "1000" } itens públicos hoje sem documentação numa quebra de build da noite para o dia; assim, novos itens públicos sem documentação quebram o build, enquanto o passivo existente é amortizado de forma deliberada.

# text
# c1: list_scenario_kinds
# c2: api::list_scenario_kinds()
seg-27668072a608 = <b>A linha da ferramenta MCP <c1/> anunciava "~{ "17" } tipos de cenário integrados"</b> enquanto <c2/> expunha { "50" } havia algum tempo — uma documentação voltada a agentes que subestimava a capacidade real em três vezes. Fixada na contagem verdadeira.

# text
seg-1ffc9f9816e8 = Regenerada a referência independente de aderência à norma do SBOM CycloneDX para o grafo de dependências atualizado ({ "60" } componentes). O veredito de aderência à norma permanece inalterado: zero erros de esquema normalizados e todo identificador atômico de licença ainda consta da enumeração oficial do SPDX.

# text
seg-a6db590bbcbe = <b>Cinco capacidades promovidas a externamente VALIDATED</b>, cada uma agora conferida com uma implementação independente de terceiros da mesma grandeza definida de forma única (não circular, com fixtures regeneráveis offline):

# text
# c1: allantools
# c2: tests/powerlaw_oadev_reference.rs
seg-98588143b4bb = <b>conversão IEEE-1139 de lei de potência para desvio de Allan</b> em relação às formas fechadas de <c1/> para os cinco tipos de ruído (<c2/>);

# text
# c1: tests/crpa_reference.rs
seg-ce37d70fa8bc = <b>pesos de beamformer CRPA MVDR / de anulação de norma mínima</b> em relação ao LAPACK do numpy/scipy (<c1/>);

# text
# c1: Rotation.align_vectors
# c2: tests/wahba_reference.rs
seg-0f033d1027f8 = <b>determinação de atitude de Wahba / TRIAD / QUEST</b> em relação ao <c1/> por SVD do SciPy em observações sem ruído (<c2/>);

# text
# c1: oem
# c2: tests/ccsds_oem_covariance_reference.rs
seg-e1e2283cb524 = <b>intercâmbio de blocos de covariância CCSDS { "502.0" } OEM</b> com ida e volta pelo analisador da biblioteca independente <c1/> (<c2/>);

# text
# c1: ncx2
# c2: chi2
# c3: tests/acquisition_reference.rs
seg-579eefbb646f = o <b>núcleo de estatísticas de detecção de aquisição por lei quadrática</b> (Marcum-Q generalizada / P_d / P_fa / limiar) em relação a <c1/>/<c2/> do SciPy (<c3/>). A matriz de validação verificada por máquina passa a <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> em <b>{ "102" } linhas</b> (eram { "51" } · { "47" } · { "4" }). As ressalvas honestas de escopo são preservadas — por exemplo, a promoção da aquisição cobre apenas o núcleo de estatísticas de detecção; CFAR/perda por straddling continua MODELLED.

# text
# c1: fom::positioning_performance
# c2: 0.589·(σ₁+σ₂)
# c3: scipy.stats
# c4: tests/positioning_fom_reference.rs
# c5: ()
# c6: (cov_enu, hpl_m)
# c7: PositioningFom
seg-b6a140d55580 = <b>Figuras de mérito no domínio da posição</b> (<c1/>): CEP, SEP e 2DRMS exatos a partir da covariância de posição ENU 3-D de uma solução de navegação, mais um nível de proteção horizontal. CEP/SEP são os erros radiais medianos <em>exatos</em> (não a regra linear <c2/>), conferidos com quantis rayleigh/maxwell de <c3/> e com uma mediana Monte Carlo independente em NumPy (<c4/>). Substitui o antigo stub honesto de não implementado — <b>a assinatura da função mudou</b> de <c5/>, que devolvia um erro, para <c6/>, que devolve um <c7/>.

# text
# c1: assurance::uncertainty::edf
# c2: allantools
# c3: edf_greenhall
# c4: edf_totdev
# c5: tests/uncertainty_edf_reference.rs
seg-1551afa17154 = <b>Graus de liberdade equivalentes (EDF) de intervalos de confiança concluídos para todos os estimadores da família Allan</b> (<c1/>): o EDF da variância de Allan modificada, de Hadamard e total agora usa o algoritmo de EDF combinado de Greenhall & Riley e a forma TOTVAR da Tabela 7 da NIST SP { "1065" } (antes só o EDF da variância de Allan sobreposta estava implementado; os demais o reutilizavam silenciosamente), conferido com <c2/> <c3/>/<c4/> (<c5/>).

# text
# c1: tests/validate_p*.rs
# c2: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c3: scipy.special.j1
# c4: (HᵀH)⁻¹
# c5: finals2000A
# c6: src/verification.rs
seg-39753e7919cc = <b>Verificações cruzadas externas independentes para as capacidades de geometria, DOP, EOP, DRO e medição de distância por RF do PNT lunar</b> (<c1/>, com fixtures e geradores de referência independente em <c2/>). Cada verificação aciona uma capacidade <b>modelada</b> já entregue contra uma referência independente produzida por uma implementação <em>diferente</em>, de modo que a concordância é não circular: a pegada orbital de transmissão/captura contra <c3/> (Cephes — uma Bessel J1 genuinamente diferente); o DOP da geometria de balizas de superfície contra uma resolução independente de <c4/> em NumPy; o crescimento do erro de previsão por persistência de UT1/EOP contra uma nova leitura em NumPy, separada, das mesmas linhas IERS <c5/> literais; a família planar de órbitas retrógradas distantes contra o Banco de Dados de Órbitas Periódicas de Três Corpos da NASA/JPL; e o orçamento de precisão de medição de distância por RF contra uma referência de primeiros princípios. Elas são evidência adicional de regressão para módulos existentes; acrescentar esses testes de verificação cruzada não reclassifica por si só nenhuma capacidade (as cinco promoções acima são mudanças de status separadas, respaldadas por referência independente, em <c6/>).

# text
# c1: lunar-attack-surface
# c2: src/attack_surface.rs
# c3: kind = "lunar-attack-surface"
# c4: run_toml
seg-662c04f0552f = <b>Cenário <c1/></b> (<c2/>, <c3/>): uma execução composta, alcançável por binário (CLI / Python / MCP / wasm via <c4/>), de segurança de sinal lunar P1, que reúne o déficit de potência do orçamento de enlace e a sua faixa de sensibilidade de { "12" }–{ "18" } dB, a potência de transmissão necessária para interferir/falsificar em função da distância de afastamento, a pegada orbital de captura sob um diagrama de antena real, o resultado de captura por falsificação (pull-in) no laço de rastreamento, o alcance do horizonte de um corpo sem atmosfera e o orçamento de autenticação OSNMA/TESLA. Um corpo vazio reproduz a linha de base P1.

# text
# c1: linkbudget::deficit_sensitivity_band
# c2: deficit_power_factor
# c3: sweep::SweepAxis
# c4: received_signal_power_dbw
seg-a9b7ee942a23 = <b>Faixa de sensibilidade do déficit de potência</b> (<c1/>, <c2/>): uma varredura genuína de vários eixos (referência × EIRP × distância oblíqua) construída sobre <c3/> e avaliada por meio de <c4/>, reproduzindo a faixa P1 de { "12" }–{ "18" } dB e reconciliando os fatores lineares de { "32" }× (arredondado) / { "36" }× (não arredondado).

# text
# c1: spoof_capture::capture_cube
# c2: capture_map
seg-0734a4ca7535 = <b>Cubo tridimensional de captura por falsificação</b> (<c1/>): acrescenta o eixo de deslocamento de portadora/Doppler ao mapa de captura (J/S × deslocamento de código × deslocamento de portadora, tempo de travamento por célula); a fatia de portadora zero se reduz exatamente ao <c2/> 2-D.

# text
# c1: monitor_network
# c2: spoof_monitors
# c3: lunar_service
# c4: detection
# c5: SurfaceMonitor
# c6: SpoofEvent
seg-3b9bbc25b114 = <b>A detecção por rede esparsa de monitores</b> (<c1/>) agora compõe a estatística física de AGC de <c2/> e a grade de visibilidade selenográfica de <c3/> para derivar a estatística de detecção e a geometria de cada estação, em vez de parâmetros livres e de uma sobreposição ad hoc por círculo máximo; as probabilidades de detecção por monitor e da rede continuam sendo as formas fechadas de qui-quadrado/Marcum-Q de <c4/>. <b>Os campos <c5/> / <c6/> mudaram</b> para grandezas físicas (lat/lon/alt/potência).

# text
# c1: nma_budget
# c2: auth_latency
seg-54c36267382c = <b>Dimensionamento da sobrecarga de autenticação OSNMA/TESLA</b> (<c1/>): as parcelas dos campos OSNMA por página (HKROOT de 8 bits + MACK de 32 bits por página de { "2" } s) estavam rotuladas como totais por subquadro, subestimando a sobrecarga em { "15" }× ({ "1.33" } bit/s). Corrigido para os totais publicados no SIS-ICD por subquadro de 30 s (HKROOT { "120" } + MACK { "480" } bits ⇒ <b>{ "20" } bit/s</b>). A consequência agora é declarada com honestidade: a uma taxa de navegação AFS de { "50" } bit/s, a sobrecarga de autenticação é um custo de <b>primeira ordem de ≈{ "40" } %</b>, e não alguns poucos por cento desprezíveis; o campo <c2/> é documentado como o atraso de divulgação da chave (um limite inferior do tempo até a primeira posição autenticada, de ponta a ponta).

# text
seg-0cf179a34252 = Uma ampla versão de capacidades. Ela traz duas suítes de análise totalmente <b>validadas externamente</b> — uma família completa de <b>análise de decisão multicritério (MCDA)</b> e os estimadores de <b>deriva de Allan / estabilidade de relógio em τ longo</b> — e abre uma nova camada executável de cenários de <b>orçamento de tempo lunar, referencial/EOP em tempo real, híbrido óptico/RF, observabilidade cislunar e resiliência a conflitos de PNT em camadas</b> sobre o substrato, além de um substrato de capacidades de <b>baliza de superfície lunar</b> e de <b>segurança de sinal</b>. A matriz de validação verificada por máquina cresce para <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> em <b>{ "102" } linhas</b> (eram { "40" } · { "47" } · { "4" } em { "91" }): as onze novas linhas são todas validações, por referência independente externa, dos estimadores de análise de decisão e de temporização, conferidos com bibliotecas independentes (SciPy, pymcdm, pyDecision, allantools) com tolerância apertada, enquanto a nova superfície de capacidades de PNT é apresentada com honestidade como MODELLED. Como sempre, nenhuma afirmação de modelo numérico é elevada sem um conjunto de dados externo por trás.

# text
# c1: kind
# c2: tests/determinism.rs
# c3: scenarios/*.toml
seg-267e50f8dd56 = <b>Cenários executáveis</b> — cada um um <c1/> de cenário registrado, despachado pelo motor e comprovado de ponta a ponta no CI por <c2/> (que executa cada <c3/> incluído e falha de forma definitiva diante de qualquer fixture não executável):

# text
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Resiliência a conflitos de PNT em camadas</b> (<c1/>, <c2/>) — um motor de resiliência Monte Carlo com semente para uma arquitetura PNT de várias camadas, com um modelo de <b>sobrevivência por vetor com degradação gradual</b> do § { "4.2" } (quatro vetores de ameaça nomeados, a forma fechada de sobrevivência do PNT utilizável para a qual converge o Monte Carlo de cada camada, emitida no JSON de resultado) e uma proveniência documentada, protegida contra deriva, dos parâmetros de ameaça (<c3/>). Arquiteturas MODELLED; a convergência do Monte Carlo de sobrevivência para a forma fechada é o núcleo validado.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Observabilidade cislunar</b> (<c1/>, <c2/>) — um espectro de autovalores do Gramiano de observabilidade ao longo de um arco, um gerador de sementes de órbitas retrógradas distantes (DRO) por correção diferencial e uma verificação cruzada independente por filtro de informação em raiz quadrada (SRIF), cuja covariância a posteriori se torna finita exatamente no posto observável completo. Constelação MODELLED; os invariantes de posto/Gramiano/STM/SRIF são o núcleo validado.

# text
# c1: hybrid-optical-rf
# c2: src/hybrid_integrity.rs
# c3: src/optical_availability.rs
# c4: src/optical_linkbudget.rs
# c5: src/cross_raim.rs
seg-92fb333483e5 = <b>Continuidade e integridade de híbridos heterogêneos óptico/RF</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — disponibilidade e integridade entre domínios quando o PNT óptico e o de RF são combinados. MODELLED.

# text
# c1: lunar-time-budget
# c2: src/lunar_time_budget.rs
# c3: realtime-frame-eop
# c4: src/realtime_frame_eop.rs
# c5: src/frame_eop.rs
seg-08e2f640ae14 = <b>Orçamento de tempo lunar endógeno</b> (<c1/>, <c2/>) e <b>orçamento de referencial / EOP em tempo real</b> (<c3/>, <c4/>, <c5/>) — os orçamentos P3/P4 de tempo lunar e de orientação da Terra, derivados de forma endógena da cadeia de temporização, e não simplesmente afirmados. MODELLED.

# text
seg-52c2f9c2c9a7 = <b>Suítes de análise validadas externamente</b> — capacidades de biblioteca, cada uma entrando na matriz como novas linhas VALIDATED (conferidas com uma referência independente externa, e não com uma autoverificação):

# text
# c1: src/mcda/
# c2: tests/mcda_*_reference.rs
seg-709789e8fb04 = <b>Suíte completa de análise de decisão multicritério (MCDA)</b> (<c1/>) — as quatro famílias de métodos: agregação de valor (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), sistema de razões (<b>MOORA</b>) e proporcional (<b>COPRAS</b>), distância ao ideal (<b>TOPSIS</b>), programação de compromisso (<b>VIKOR</b>) e subclassificação (<b>PROMETHEE II</b> com seis formas de critério generalizado, <b>ELECTRE I</b> com concordância/discordância) — mais pesos de prioridade por autovetor de Perron do <b>AHP</b> com o limite da Razão de Consistência de Saaty (CR < { "0.10" }), utilidade <b>MAUT</b>, extração da fronteira de Pareto e análise de <b>sensibilidade</b> dos pesos. Os nove agregadores reproduzem <b>pymcdm</b> / <b>pyDecision</b> e o autovetor do AHP coincide com o SciPy/LAPACK, tudo a < { "1e-9" } (<c2/>). O tornado de sensibilidade também é apresentado dentro do cenário de resiliência a conflitos.

# text
# c1: src/allan.rs
seg-2ce49cbfd8bf = <b>Estimadores de deriva de Allan e de estabilidade de relógio em τ longo</b> (<c1/>) — <b>MTIE</b> (a estatística de deriva de erro de tempo pico a pico ITU-T G.810/G.823/G.8261 sobre a qual as máscaras de sincronização são escritas), a deriva no domínio do tempo <b>MDEV</b> e <b>TDEV</b>, e os estimadores de longo alcance <b>Theo1 / TOTVAR</b>. VALIDATED em relação ao <b>allantools</b> na série NIST SP { "1065" }; o híbrido <b>ThéoH</b> com remoção de viés, construído sobre o TOTVAR, continua, com honestidade, MODELLED.

# text
# c1: src/assurance/
seg-68bcdf8bd5de = <b>Arcabouço de garantia / referência independente externa</b> (<c1/>) — um arcabouço de referência independente ligado diretamente à barreira de honestidade do CI, um registro de proveniência <b>W3C-PROV</b> com raiz de Merkle determinística e graus de liberdade equivalentes de <b>Greenhall</b> + intervalos de confiança qui-quadrado nas estimativas de estabilidade.

# text
# c1: src/registry.rs
# c2: src/api.rs
# c3: ExternalPack::register_into
seg-dcb91813b24c = <b>Ponto de extensão PackRegistry / ExternalPack</b> (<c1/>, <c2/>) — um ponto de despacho para que os pacotes de capacidades passem por um único registro (o despacho embutido está no caminho crítico da CLI; pacotes externos à árvore se conectam atrás de um <c3/> com implementação padrão), protegido por uma suíte golden de aderência à norma com identidade byte a byte e por barreiras de CI standalone / wasm32.

# text
# c1: kind
seg-16b1f5d249ed = <b>Substrato de capacidades modeladas</b> — novos módulos de biblioteca que alimentam os cenários acima e os futuros (ainda não um <c1/> de cenário autônomo):

# text
# c1: src/lunar_beacon.rs
# c2: src/lunar_perturbed.rs
# c3: src/jamming.rs
# c4: src/linkbudget.rs
seg-f8c9ffbc56cf = <b>DOP de balizas de superfície lunar</b> (<c1/>) com orçamento de precisão realizada, varredura de N satélites e mapa de GDOP, além de uma efeméride lunar perturbada (<c2/>) e geometria de horizonte sem atmosfera / inverso da potência de falsificação / faixa de déficit AFS (<c3/>, <c4/>). Reutiliza o núcleo de DOP validado pelo gnss_lib_py.

# text
# c1: src/realdata/lola_dem.rs
seg-28209a2747d5 = <b>Ingestão de DEM no formato LOLA</b> + linha de visada sobre o terreno (<c1/>).

# text
# c1: src/spoof_capture.rs
# c2: src/cross_sensor_integrity.rs
# c3: src/monitor_network.rs
# c4: src/antenna.rs
# c5: src/nma_budget.rs
seg-6e98ac90a0e2 = <b>Defesa em três camadas da segurança de sinal</b> — captura por falsificação, integridade entre sensores e dimensionamento da rede de monitores (<c1/>, <c2/>, <c3/>) com uma pegada de antena de feixe orbital e um orçamento de autenticação OSNMA (<c4/>, <c5/>). MODELLED.

# text
# c1: src/verification.rs
seg-bd5b9511accb = A matriz de validação e todos os artefatos derivados foram regenerados a partir da única fonte de verdade (<c1/>): o registro do site, os diagramas do mapa de módulos e da proveniência de validação, e as cadeias de contagem do README e de cada superfície agora indicam <b>{ "51" } / { "47" } / { "4" } de { "102" }</b> (eram { "40" } / { "47" } / { "4" } de { "91" }); a barreira de honestidade das contagens agora examina todo o histórico do git, e as figuras do README foram unificadas na paleta escura da marca.

# text
# c1: integrate
# c2: integrate_dopri
# c3: src/integrator.rs
seg-c2ec7e2b6296 = Um único driver de integração adaptativa compartilhado agora sustenta tanto <c1/> quanto <c2/> (<c3/>), eliminando o integrador duplicado.

# text
seg-85cfb0f10268 = Análise estática do <b>SonarQube Cloud</b> adicionada ao CI (Rust + cobertura importada), com selos de classificação de segurança / manutenibilidade / confiabilidade no README.

# text
seg-deeef8318367 = Disciplina de versão / empacotamento: o CI registra um ambiente de implantação a cada publicação por pacote/registro, e o job público standalone focado deixa de incluir os lentos binários de validação.

# text
seg-30181148b098 = A barreira de higiene contra atribuição agora se restringe apenas a marcadores de autoria, de modo que citar o nome de um host de integração ou de um produto não quebra mais o build.

# text
seg-6eb3868fdce0 = Documentação: a seção <b>Citing</b> do README agora lista os quatro preprints publicados no arXiv, e a capacidade de DOP de balizas de superfície está documentada na linha lunar.

# text
seg-d12533cbf1f2 = Contadores de laço inteiros para laços conduzidos por ponto flutuante (Sonar S2193).

# text
seg-3c213354187f = Inversa precisa do qui-quadrado com poucos graus de liberdade, por refinamento de Newton, no caminho do intervalo de confiança de garantia.

# text
seg-386b7094d34d = kshana.dev: a seção de normas agora abre por padrão e o valor de contingência da contagem do registro foi corrigido; cadeias obsoletas do README / do site em torno da camada de observabilidade foram sincronizadas.

# text
seg-33448f46894f = Uma versão de capacidades que acrescenta uma <b>camada geral de observabilidade por informação de Fisher / Cramér–Rao e de projeto ótimo de experimentos</b>, e a versão em que se apoia o artigo sobre observabilidade do PNT lunar. A matriz de validação verificada por máquina cresce para <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> em <b>{ "91" } linhas</b> (eram { "39" } · { "46" } · { "4" } em { "89" }): o novo motor de estimação é conferido com uma referência independente externa e é VALIDATED; a sua aplicação lunar é, com honestidade, MODELLED. Como sempre, nenhuma afirmação de modelo numérico é elevada sem um conjunto de dados externo por trás.

# text
# c1: src/fim.rs
# c2: M = HᵀWH
# c3: best_design
# c4: eigh
# c5: inv
# c6: tests/fim_observability_reference.rs
seg-c377207026f4 = <b><c1/> — informação de Fisher, limites de Cramér–Rao e projeto ótimo de experimentos.</b> Um motor geral e reutilizável de teoria da estimação: a matriz de informação de Fisher <c2/> a partir de um jacobiano de medição e de pesos; um resolvedor de autovalores simétrico (Jacobi cíclico); o limite inferior de Cramér–Rao pela inversa, ou pela pseudoinversa de Moore–Penrose mais uma base do espaço nulo quando a informação tem deficiência de posto (o caso de rede livre / defeito de datum); e métricas de projeto de experimentos D-, A-, E- e T-ótimas, com um seletor <c3/> sobre geometrias candidatas. <b>VALIDATED</b> em relação ao NumPy (<c4/>/<c5/>) e aos limites de forma fechada publicados por Kay ({ "1993" }) a { "1e-9" } (<c6/>), de modo que entra na matriz como uma linha de referência independente externa, e não como uma autoverificação.

# text
# c1: lunar_observability
# c2: src/lunar_combination.rs
seg-91d09b4e737f = <b>Observabilidade da OD conjunta lunar</b> (<c1/> em <c2/>, apresentada no relatório de combinação lunar): aplica o motor FIM/CRLB à solução conjunta de órbita e relógio para expor o defeito de datum da estação absoluta, a restauração do seu posto à medida que se acrescentam estações de linha de base com a Terra, o CRLB atingido para a posição da estação e o condicionamento E-ótimo. Com honestidade, <b>MODELLED</b> — o motor de estimação é validado externamente, mas a rede lunar à qual é aplicado é uma simulação representativa, e nenhum conjunto de dados atual consegue transformar essa geometria em uma medição.

# text
# c1: orbit_ecc
# c2: orbit_inc_deg
# c3: orbit_argp_deg
# c4: orbit_planes
# c5: elfo_geometry_confirms_the_observability_structure
seg-6b1cd00aca8c = <b>Geometria representativa de órbita lunar elíptica congelada (ELFO)</b> para o cenário de combinação lunar (<c1/>, <c2/>, <c3/>, <c4/>; a disposição circular continua sendo o padrão) e um campo de observabilidade sem VLBI no relatório, de modo que o resultado do defeito de datum possa ser mostrado como válido para qualquer geometria. A mesma escada { "3" }→{ "1" }→{ "0" } e o limiar de três estações valem para uma ELFO da família Moonlight/LCNS e, com três linhas de base VLBI com a Terra, a posição absoluta da estação é observável com um limite submétrico — fixado por <c5/>. Continua MODELLED.

# text
# c1: src/verification.rs
# c2: web/data/verification-matrix.json
# c3: docs/VERIFICATION-MATRIX.md
# c4: docs/MODELLED-RATIONALE.md
seg-9e6627c0c417 = A matriz de validação e todos os artefatos de evidência gerados foram regenerados a partir da única fonte de verdade (<c1/>): o registro (<c2/>), <c3/>, <c4/>, as figuras do detalhamento da validação e dos tipos de referência independente, e as cadeias de contagem do README em todas as superfícies de distribuição agora indicam <b>{ "40" } / { "47" } / { "4" } de { "91" }</b>.

# text
seg-6f90233290a2 = Uma versão de correção só de empacotamento. Nenhuma mudança de motor, de cenário ou de resultado; a matriz de validação permanece inalterada em { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER em { "89" } linhas.

# text
# c1: repository.url
# c2: AshfordeOU
# c3: repository
# c4: ashfordeOU
# c5: package.json
seg-9d41e1412d1f = Publicação no npm: o pacote <c1/> derivado do manifesto do crate usava o proprietário do GitHub com a caixa errada (<c2/>), o que falhava na verificação de proveniência sigstore do npm (que compara o proprietário diferenciando maiúsculas de minúsculas). O <c3/> do manifesto agora é o <c4/> canônico em minúsculas, de modo que o <c5/> gerado coincide com o sujeito da proveniência e a versão do npm é publicada.

# text
# c1: codegen-units = 1
seg-fe1f8aae99f4 = A construção da wheel fixa <c1/> para que a wheel manylinux seja reproduzível byte a byte entre reconstruções (a verificação de reprodutibilidade por reconstrução e comparação).

# text
seg-b87075b47007 = Uma versão de consolidação voltada a <b>evidências, proveniência e disciplina de distribuição</b>. A matriz de validação verificada por máquina cresce para <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> em suas <b>{ "89" } linhas</b> (eram { "15" } · { "42" } · { "4" } em { "61" }), impulsionada pela validação cruzada de capacidades modeladas com referências independentes externas. Todo artefato distribuído agora traz uma atestação criptográfica de proveniência de build SLSA, inclui um SBOM CycloneDX e é publicado em sincronia em todas as superfícies. Nenhuma afirmação de modelo numérico é elevada sem um conjunto de dados externo por trás; a nova capacidade continua, com honestidade, MODELLED.

# text
# c1: src/attitude_dynamics.rs
seg-f6de783bfd29 = <b>Dinâmica de atitude</b> (<c1/>, MODELLED) — equações de Euler de corpo rígido sem torque + cinemática de quatérnios (RK4), com autotestes de leis de conservação (norma do quatérnio, energia cinética, |Iω|, precessão do pião simétrico).

# text
# c1: quantum_trade
# c2: tests/fixtures/optical_clock_adev/
# c3: src/sdr.rs
# c4: src/altpnt/terrain.rs
seg-339bc18b9fc4 = <b>Validação cruzada de capacidades modeladas</b> com referências independentes externas, levando a matriz de validação a { "39" } linhas VALIDATED, cada uma respaldada por um conjunto de dados externo (a barreira de honestidade do CI proíbe um status VALIDATED sem um). As validações mais recentes por referência independente externa: a <b>curva de estabilidade medida de relógio óptico</b> (o ajuste da curva ADEV de <c1/> reproduz o σ_y(τ) publicado do relógio de rede óptica de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, incluído em <c2/>); a <b>geração do código de espalhamento GPS L1 C/A</b> (o LFSR G1/G2 de <c3/> reproduz os octais de fase de código da Tabela 3-Ia da IS-GPS-200 para os PRN { "1" }–{ "9" }); e o <b>leitor de modelo digital de elevação SRTM em terreno real</b> (<c4/> lê um tile SRTM v3 da NASA/USGS, de domínio público, incluído no repositório, N36W117 / Vale da Morte, situando a Bacia de Badwater dentro da sua faixa de levantamento documentada).

# text
seg-665d0dde637b = <b>Novas capacidades MODELLED</b>, cada uma verificada internamente com uma forma fechada ou com um caminho de código irmão: dinâmica de movimento relativo de Clohessy–Wiltshire / Hill, geolocalização passiva de emissores por TDOA/FDOA, determinação de atitude de Wahba/TRIAD/QUEST, resolução de ambiguidade inteira da fase da portadora GNSS (LAMBDA), mira no plano B e assistência gravitacional por cônicas remendadas, formação de feixe de arranjo CRPA antijamming, estatísticas de aquisição GNSS por lei quadrática, ambiguidade de franjas / faixa dinâmica de sensor inercial quântico, ruído de relógio de lei de potência IEEE-1139 + piso de FM flicker, e intercâmbio de blocos de covariância CCSDS-OEM.

# text
seg-b3f53d5e3c3a = <b>Registro de evidências de fonte única</b> com documentos de verificação gerados e uma proteção contra deriva; um registro de validação navegável em kshana.dev, com links diretos para a evidência de cada cartão.

# text
# c1: codemeta.json
# c2: .zenodo.json
# c3: tests/citation_metadata_doc_sync.rs
seg-b3c0545157b3 = <b>Metadados de citação legíveis por máquina</b> — <c1/> (CodeMeta { "2.0" }) e <c2/>, fixados ao manifesto do Cargo por <c3/>.

# text
seg-2ca8875da9de = <b>Proveniência da cadeia de suprimentos</b> — atestação de proveniência de build SLSA para o tarball do crate, as wheels, o sdist e o tarball do npm; publicação confiável OIDC no PyPI; SBOM CycloneDX incluído na wheel e no pacote npm; comparação de build reproduzível e verificação pós-lançamento.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: validation-breakdown
seg-18fdecf7f2fa = <b>Descobribilidade</b> — <c1/>, <c2/> e metadados Open Graph / JSON-LD em kshana.dev; uma figura <c3/> gerada, derivada da matriz.

# text
seg-f80db0b0f545 = <b>READMEs por superfície</b> para crates.io / PyPI / npm, com uma proteção de honestidade das contagens.

# text
seg-bd33b21f8f91 = <b>Transferência de tempo de Sagnac</b>: a referência independente foi elevada a ExternalDataset — a correção de Sagnac para a circunavegação equatorial agora é conferida com os { "207.4" } ns publicados por Ashby (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, Eq. { "1.29" }; reproduzidos a < { "0.05" } ns). A capacidade composta de transferência de tempo continua, com honestidade, MODELLED.

# text
# c1: oracle-kind-stacked
seg-882133bf1fcc = <b>Documentação, diagramas e figuras atualizados</b> para a matriz em vigor (39/46/4/89): o diagrama de proveniência da validação, a figura <c1/> (agora gerada a partir da matriz com uma proteção contra deriva no CI), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, os documentos de arquitetura e de tutorial, e o total do registro em kshana.dev.

# text
seg-a9be3d71a52c = Reformatada a árvore de código-fonte com o rustfmt fixado (toolchain { "1.93.0" }) — puramente estilo, sem mudança de comportamento.

# text
# c1: scripts/check-version-sync.sh
seg-4542eb4fabfc = <b>Versionamento sincronizado.</b> Todas as superfícies de distribuição (crate, PyPI, npm, crate MCP + imagem OCI, plugin JetBrains) agora são versionadas em sincronia com o motor, o que é imposto por <c1/> no CI.

# text
seg-792df0cdc8a7 = <b>Plugin JetBrains</b> relicenciado para <b>AGPL-3.0-only</b> (a { "0.1.1" } publicada ainda anunciava Apache-2.0) e que agora deriva a sua versão no Marketplace da tag da versão.

# text
# c1: unwrap
# c2: clippy::unwrap_used
seg-171f5649c90f = <b>Reforço de robustez</b> — os <c1/> fora de testes foram removidos ou justificados; <c2/> é aplicado ao código fora de testes.

# text
seg-0e5abb2fad02 = Reformulação do <b>kshana.dev</b> com a prova em primeiro lugar: destaque dominante, diagramas de arquitetura e figuras de resultados, i18n, seções de registro e de Normas recolhíveis e responsivas.

# text
seg-05ef9b9f3653 = <b>Efemérides precisas SP3</b> — aplica a correção de nó de rotação da Terra do IGS durante a interpolação.

# text
# c1: tests/surface_readme_image_urls_doc_sync.rs
seg-bbd0dc3dd9cb = <b>Imagens dos registros</b> — os READMEs do PyPI/crates.io/npm usam URLs absolutas de imagens; os caminhos relativos de imagens do README principal eram exibidos como imagens quebradas na página do PyPI { "0.21.0" }. Uma proteção de CI (<c1/>) impede a regressão.

# text
# c1: fmt
# c2: clippy
seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> verdes; deixa de compilar contra dados reais ignorados pelo git.

# text
seg-c3c260b7063e = Testes

# text
# c1: tests/property.rs
seg-5dca3defcfe3 = A covariância do relógio de Kalman continua semidefinida positiva (PSD) e simétrica (teste de propriedade, <c1/>).

# text
seg-c861779f04ca = Proteções de sincronização da documentação: toda cadeia pública de contagem de validação, os metadados de citação, a figura gerada e as URLs de imagens dos READMEs por superfície estão todos fixados à sua fonte de verdade.

# text
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = Esta versão acrescenta duas suítes de aplicação MODELLED ao motor aberto — um <b>demonstrador de PNT habilitado por tecnologia quântica</b> (transferência quântica de tempo confiável, navegação quântica sem GNSS, detecção quântica de falhas/anomalias) e uma <b>suíte de PNT lunar / cislunar</b> (tempo coordenado lunar, VLBI lunar, OD + relógio conjuntos, realização de referencial, volume de serviço, PNT diferencial, exportação de interoperabilidade) — cada uma executável a partir de um único <c1/>, cada uma emitindo um registro honesto <c2/> mais um registro de representatividade / lacunas até o voo. Ela também traz <b>seis novas validações por referência independente externa</b>, levando a matriz de validação verificada por máquina a <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> em suas { "61" } linhas. Os novos números de aplicação são MODELLED a partir de parâmetros ilustrativos de fontes públicas — sem TRL, histórico de voo, certificação ou aval de agência — e os núcleos validados que eles reutilizam são rotulados como tal.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Suíte de demonstradores de PNT habilitado por tecnologia quântica</b> (<c1/>, <c2/>, <c3/>). Três áreas de aplicação executáveis MODELLED por trás do motor, cada uma emitindo <c4/> mais um registro de representatividade / lacunas até o voo:

# text
# c1: src/timetransfer_chain.rs
seg-07532f03a1f1 = <b>Transferência quântica de tempo confiável</b> (<c1/>) — um orçamento bidirecional com relógio de rede óptica + enlace fotônico contra CSAC + RF, reutilizando o nível de proteção de temporização, com uma FoM de segurança contra ataques de atraso/repetição ({ "1" } − P_md) e detecção de anomalias de relógio + latência do CUSUM.

# text
# c1: src/quantum_nav_od.rs
seg-4c9036cffe1b = <b>Navegação quântica sem GNSS</b> (<c1/>) — uma navegação inercial por interferômetro de átomos frios contra um INS de classe de navegação durante uma interrupção do GNSS, com a ressalva honesta de que, sem fixação externa, o viés do acelerômetro permanece inobservável e, portanto, o erro ainda cresce.

# text
# c1: src/quantum_faults.rs
seg-6188f1c6893a = <b>Detecção quântica de falhas / anomalias</b> (<c1/>) — um catálogo de falhas rotuladas com AUC da ROC e IC por bootstrap, e uma falha mínima detectável a uma taxa fixa de falsos alarmes.

# text
# c1: src/quantum_devices.rs
# c2: src/qtrade.rs
seg-9e22314b1337 = Uma biblioteca compartilhada de modelos de erro de dispositivos quânticos (<c1/>) e um arcabouço unificado de comparação quântico-versus-clássico (<c2/>) sustentam os três.

# text
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>Suíte de PNT lunar / cislunar.</b> Sete tipos de cenário (<c1/>) executáveis MODELLED sobre o núcleo CR3BP: <b>Tempo Coordenado Lunar</b> (taxa secular LTC/TCL − TT, <c2/>), observável de atraso <b>VLBI lunar</b> geodésico (<c3/>), estimador em lote de <b>OD + relógio conjuntos multitécnica</b> (<c4/>), <b>realização de referencial</b> (Helmert de 7 parâmetros + vínculo WGCCRE da IAU { "2015" }, <c5/>), análise de <b>volume de serviço de classe Moonlight / LCNS</b> (<c6/>), <b>PNT diferencial lunar</b> (<c7/>) e uma <b>exportação de interoperabilidade alinhada à LunaNet / IOAG</b> (CCSDS-OEM + escala de tempo lunar no envelope KIF, <c8/>). Todos MODELLED a partir de parâmetros ilustrativos de fontes públicas; não validados contra rastreamento real de VLBI / Gateway; sem afiliação nem aval de agência.

# text
seg-a892ce052e3c = <b>Seis novas validações por referência independente externa</b> (a matriz de validação agora está em { "15" } validadas):

# text
# c1: tests/cs5071a_reference.rs
seg-c30ae6767c6c = <b>ADEV / HDEV em um relógio real de césio 5071A</b> — validado em relação às referências de ponto de década do Stable32 (<c1/>).

# text
# c1: PHASE.DAT
# c2: tests/phasedat_reference.rs
seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV na referência <c1/> do Stable32</b> — validado em relação às tabelas publicadas do Stable32 (<c2/>).

# text
# c1: tests/opssat_ad_reference.rs
seg-e8728f57effa = <b>AUC da ROC de detecção de anomalias em telemetria real do ESA OPS-SAT</b> — validada em relação ao scikit-learn (<c1/>).

# text
# c1: tests/icgem_gravity_reference.rs
seg-5446957ac631 = <b>Síntese de funcionais de gravidade do ICGEM</b> — validada em relação ao padrão de gravidade normal do GRS80 (γ de Somigliana a { "3.5e-12" }; mapa de perturbação do EGM2008, <c1/>).

# text
# c1: tests/klobuchar_reference.rs
seg-751c5ac90229 = <b>Modelo ionosférico de radiodifusão de Klobuchar</b> — validado em relação ao RTKLIB (<c1/>).

# text
# c1: tests/raim_reference.rs
# c2: tests/sbas_reference.rs
seg-dcc6d4e04a5c = <b>Núcleo de detecção RAIM</b> ({ "171" } casos, <c1/>) e o <b>nível de proteção SBAS DO-229E</b> com dados reais do EGNOS (fork SBAS-PL do RTKLIB, <c2/>) — ambos validados em relação às suas referências independentes externas.

# text
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Registro de representatividade e de lacunas até o voo</b> (<c1/>). Um registro estruturado que todo demonstrador emite — o que é representativo, o que é simplificado e o que separa o modelo do voo — o complemento honesto de toda comparação MODELLED.

# text
# c1: --study-name
# c2: --validate
seg-6b4c78bdaf35 = <b>Agregação de estudos e ergonomia da CLI.</b> Um manifesto de suíte de cenários com agregação de estudo em um único comando, metadados de estudo estáveis por hash + <c1/>, verificação estática (lint) de cenários com <c2/> e exibição do nível de validação por FoM nos relatórios de estudo.

# text
seg-e24230b80a89 = <b>kshana.dev reformulado em torno de uma espinha de domínio compartilhada</b> — capacidades e validação reunidas num único explorador de domínios com vocabulário comum, as novas ilhas validadas em destaque, um instrumento Terra animado fiel ao relevo e uma chamada para solicitar um estudo, e a marca/os links da Ashforde OÜ.

# text
seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE auditados quanto à completude e à honestidade</b> — contagens desatualizadas de validados corrigidas (agora { "15" } referências independentes externas), os diagramas ampliados, e os preprints do Nível de Proteção Condicional de Temporização (arXiv:{ "2606.24210" }) e da lacuna de otimismo por degradação de RF (arXiv:{ "2606.22054" }) citados.

# text
# c1: paper/
seg-42a317c6ce06 = As fontes de <c1/> e o pipeline do rascunho do JOSS são mantidos no repositório público.

# text
seg-8ed5cf845b00 = Esta versão acrescenta quatro capacidades de estudo ao motor aberto — um Nível de Proteção Condicional de Temporização, uma pontuação de resiliência de PNT alinhada a um arcabouço, uma avaliação da lacuna de otimismo por degradação de RF e um front end de receptor definido por software / dados reais — cada uma reprodutível a partir de um único comando e gravando um artefato determinístico byte a byte. Todos os estudos são MODELLED (calibração sintética ou com conjuntos de dados públicos), trazem a sua proveniência honesta (versão do motor, sementes, hash da configuração) e rótulos de validação, e não são certificações.

# text
# c1: tpl
# c2: cargo run --release --example tpl_jammertest
seg-0c9f0c665491 = <b>Nível de Proteção Condicional de Temporização (<c1/>).</b> Um limite, restrito pelo holdover, para o erro de tempo não detectado sob falsificação (spoofing) de GNSS, com um piso de monitor de k sigmas, uma variância de deriva livre de van Loan sobre a latência de detecção e um tempo até o alarme do CUSUM. Calibrado em um ataque real gravado (JammerTest { "2024" }, cenário { "2.1.1" }) por meio de <c2/>, que reproduz a sua tabela de referência a partir de escalares recuperados da gravação pública (o conjunto de dados bruto não é redistribuído).

# text
# c1: resilience
# c2: cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json
# c3: docs/RESILIENCE-CROSSWALK.md
seg-d874d7f13f28 = <b>Pontuação de resiliência de PNT alinhada a um arcabouço + estudo de instabilidade de decisão (<c1/>).</b> Modelo de arquitetura, pontuação alinhada ao RPCF, simplex de ponderação de Dirichlet, instabilidade por tau de Kendall e por taxa de inversão do top-1, e colapso da diversidade de modo comum (Hill-N2), com <c2/>. Tabela de correspondência em <a1><c3/></a1>.

# text
# c1: impairment_study
# c2: impairment_ml
# c3: eval_stats
# c4: cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
seg-343f7af54503 = <b>Estudo da lacuna de otimismo por degradação de RF (<c1/>, <c2/>, <c3/>).</b> Um painel de 13 detectores sobre um corpus sintético fundamentado em parâmetros, uma lacuna de otimismo dentro versus fora da distribuição, tendências de leis de escala com hipótese nula por permutação e um preditor de degradação por exclusão de um (leave-one-out), por meio de <c4/>.

# text
# c1: sdr
# c2: realdata/
seg-6eed55859bbf = <b>Front end de receptor definido por software (<c1/>) e adaptadores de dados reais (<c2/>).</b> IQ/IF bruto até derivações do correlacionador e SQM, mais adaptadores de ingestão (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) e exemplos de sondagem. Eles leem gravações que o usuário fornece localmente; nenhuma gravação é incluída no repositório.

# text
# c1: optimism-study.json
# c2: resilience-study.json
# c3: paper-artifacts/
# c4: /realdata-cache/
seg-afe2282fa771 = <b>Artefatos de estudo versionados.</b> Os <c1/> e <c2/>, determinísticos byte a byte, agora são rastreados em <c3/> para que os números dos estudos possam ser conferidos sem recompilar; continuam regeneráveis a partir dos geradores acima. Os conjuntos de dados brutos ficam fora do repositório (<c4/>).

# text
# c1: Cargo.toml
# c2: CITATION.cff
# c3: README
seg-450d82cddc28 = Versão elevada para { "0.20.0" } em <c1/>, <c2/> e <c3/>; os artefatos do estudo de cruzamento são regenerados para que o seu carimbo coincida com a versão lançada.

# text
# c1: LICENSE
# c2: LICENSING.md
seg-a0a66af8fd14 = <b>Relicenciado de Apache-2.0 para a GNU AGPL-3.0-only, com uma licença comercial disponível junto à Ashforde OÜ (licenciamento duplo).</b> O motor aberto continua totalmente aberto e publicamente verificável; o copyleft de rede da AGPL (§{ "13" }) significa que um derivado fechado ou hospedado deve voltar ao código aberto — ou obter uma licença comercial. Isso protege o núcleo validado contra bifurcações que o fechem, mantendo a credibilidade de um motor público, executável e auditável. Veja <a1><c1/></a1> (AGPL) e o novo <a2><c2/></a2> (o que cada licença cobre e quando se aplica).

# text
# c1: LICENSE
# c2: AGPL-3.0-only
# c3: NOTICE
# c4: README
# c5: GOVERNANCE
# c6: GLOSSARY
# c7: Cargo.toml
# c8: pyproject.toml
# c9: CITATION.cff
seg-ffa799fdb814 = <c1/> agora contém o texto da AGPL-3.0; os cabeçalhos SPDX de todas as fontes foram atualizados para <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, o site e os metadados do crate/pacote (<c7/>, <c8/>, <c9/>, o crate MCP + imagem) foram atualizados de acordo.

# text
# c1: CONTRIBUTING.md
seg-8d67aba2af0b = <b>Termos de contribuição</b> (<a1><c1/></a1>) agora licenciam a entrada sob a AGPL <b>e</b> concedem à Ashforde OÜ o direito de incluir as contribuições na edição de licença comercial, de modo que o licenciamento duplo continue funcionando.

# text
# c1: deny.toml
# c2: GOVERNANCE
seg-93644d1c1420 = <b>Política de dependências inalterada, mas justificada de novo</b> (<a1><c1/></a1>, <c2/>): as dependências continuam permissivas (Apache/MIT/BSD/ISC). A AGPL só é permitida para o crate do próprio kshana — uma <em>dependência</em> com copyleft contaminaria a edição comercial e inviabilizaria o licenciamento duplo.

# text
# c1: v0.18.0
# c2: v0.19.0
seg-9b77c2d36241 = <b>Nota para quem consome o projeto:</b> esta é uma relicenciação com copyleft. Os usuários que dependiam dos termos permissivos da Apache-2.0 podem continuar usando a última versão sob Apache-2.0 (<c1/> e anteriores, como publicadas); de <c2/> em diante é AGPL-3.0 / comercial.

# text
# c1: pyo3
# c2: BoundList/TupleIterator::nth
# c3: nth_back
# c4: PyCFunction::new_closure
# c5: pyo3
# c6: python
# c7: src/python.rs
# c8: scenario_kinds
# c9: skip_from_py_object
# c10: RunOutput
seg-51e32f15b7ea = <b><c1/> elevado de { "0.24" } para { "0.29" }</b> para eliminar RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) das varreduras externas de OSV/dependências. Ambos são avisos <em>no nível de função</em>, cujas funções afetadas (<c2/>/<c3/>, <c4/>) o Kshana nunca chama, e <c5/> é uma dependência opcional (do recurso <c6/>) — portanto a exposição real era nula —, mas a elevação mantém uma varredura limpa para auditores a jusante. Migrado <c7/> para a API do pyo3 { "0.29" } (tipo de retorno Bound para <c8/>; <c9/> explícito na pyclass <c10/>). Todos os { "11" } testes de binding Python passam com a extensão reconstruída.

# text
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Onze novos tipos de cenário executáveis — demonstradores de duas licitações, uma ponte de interoperabilidade CCSDS e uma suíte de análise de missão / ambiente de primeira ordem (todos MODELLED, aditivos; as referências de reprodutibilidade existentes (goldens) permanecem inalteradas).</b> Cada um é despachável por CLI / Python / WASM / MCP, traz um <c1/> e leva um rótulo MODELLED explícito no seu JSON de resultado e no resumo de uma linha (um teste por tipo em <c2/> afirma que o rótulo está presente e que a saída nunca contém a cadeia <c3/>):

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-20b74caf58cc = <c1/> (<c2/>) — banco de avaliação de detecção de degradação de RF por aprendizado de máquina: um corpus <b>sintético</b> rotulado + um arcabouço <b>ROC/AUC</b> independente do detector + um relatório de <b>lacuna de otimismo</b> dentro/fora da distribuição (apenas características operacionais — nunca dados de campo/IQ).

# text
# c1: quantum-trade
# c2: src/quantum_trade.rs
seg-0253656a0ecf = <c1/> (<c2/>) — comparação de PNT quântico versus clássico com ingestão de ADEV medido e um envelope de resiliência sem GNSS.

# text
# c1: space-weather
# c2: src/space_weather.rs
seg-901bd713bd62 = <c1/> (<c2/>) — índices solares/geomagnéticos (tabela Kp↔ap da IAGA, Ap diário, F10.7a centrado de 81 dias), temperatura exosférica de <b>Jacchia-71</b> e um acoplamento de densidade termosférica conduzido pela atividade sobre uma atmosfera estática (NÃO é um modelo de densidade absoluta NRLMSISE).

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
seg-2323b43c0ffc = <c1/> (<c2/>) — ponte de importação + ida e volta de <b>CCSDS { "502.0" } OEM</b> para efemérides do GMAT / Orekit / STK (o leitor <c3/>, inverso exato do gravador).

# text
# c1: launch-window
# c2: src/launch.rs
# c3: sin Az = cos i/cos lat
seg-188aeb3e8219 = <c1/> (<c2/>) — <b>azimute de lançamento</b> de dois corpos (<c3/>), Δv de mudança de plano, bônus da rotação do local e geometria de oportunidades diárias.

# text
# c1: reentry
# c2: src/reentry.rs
seg-6200a47276e6 = <c1/> (<c2/>) — corredor de reentrada balística de <b>Allen-Eggers</b>: desaceleração máxima, velocidades de g máximo e de aquecimento máximo, altitude de g máximo.

# text
# c1: eo-coverage
# c2: src/eo_payload.rs
seg-0874c2241748 = <c1/> (<c2/>) — geometria de <b>faixa / GSD / acesso / revisita</b> de observação da Terra (EO) (triângulo espacial do SMAD).

# text
# c1: space-packet
# c2: src/space_packet.rs
seg-83c7588ff074 = <c1/> (<c2/>) — codificação/decodificação do cabeçalho primário do <b>Space Packet CCSDS 133.0-B</b> com ida e volta exata em bits.

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
seg-ae1bcad02880 = <c1/> (<c2/>) — <b>torque de gradiente de gravidade</b> de 3 DOF + <b>orçamento de erro de apontamento por RSS</b> (orçamento escalar pré-hardware, não um laço de controle).

# text
# c1: passes
# c2: src/passes.rs
seg-65f59cc12e02 = <c1/> (<c2/>) — <b>predição de passagens de nascer/pôr</b> de estação terrestre (AOS/TCA/LOS, elevação máxima, acesso).

# text
# c1: link-budget
# c2: src/linkbudget.rs
# c3: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-178776497627 = <c1/> (<c2/>) — equação de enlace unidirecional <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / margem / fechamento).

# text
# c1: hybrid-ukf
# c2: src/fusion/hybrid_ukf.rs
# c3: scenarios/hybrid-ukf.toml
# c4: src/fusion/tightly_coupled17.rs
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: clock_state::q_from_allan
# c8: q_wf
# c9: q_rw
# c10: q_factor
# c11: r_factor
# c12: Ukf::update_stats
# c13: TightlyCoupled17::{update_gnss_nis, nees, nees_subset}
seg-e7fee32a00f5 = <b>Filtro de Kalman unscented (UKF) híbrido quântico + clássico fortemente acoplado de 17 estados — apresentado como um cenário executável (MODELLED).</b> Um novo tipo de cenário <c1/> (<c2/>, <c3/>) que transforma o filtro unscented GNSS/INS fortemente acoplado de 17 estados, antes só disponível pela API (<c4/>), num cenário que as bindings de CLI/Python/WASM/MCP podem despachar. O vetor de erro de 17 estados é composto pelos <b>{ "15" } estados de erro do INS</b> (posição, velocidade, desalinhamento de atitude, vieses do acelerômetro e do giroscópio) aumentados com a <b>correção do viés do acelerômetro derivada do CAI</b> — o interferômetro de átomos frios (<c5/>) define o piso do passeio aleatório de velocidade <c6/>, de modo que a deriva de navegação inercial de longo prazo é a limitada pelo sensor quântico — e um <b>relógio de 2 estados, fase + frequência</b>, cujo ruído de processo vem do <b>motor de relógio de parâmetros q</b> (<c7/>, que mapeia o perfil de desvio de Allan de um relógio para as PSDs <c8/>/<c9/>, escaladas para unidades de distância). A plataforma é auxiliada por GNSS durante um trecho inicial (o filtro aprende os vieses, a velocidade e o relógio) e depois segue por inércia durante uma interrupção do GNSS apenas com a IMU CAI + o relógio, de modo que a execução demonstra a hibridização de <b>IMU clássica no curto prazo + quântica no longo prazo</b>. A figura de mérito é a <b>autoconsistência do filtro</b>: <b>NEES</b> agrupado (Erro de Estimação Normalizado ao Quadrado, sobre o subconjunto estimável de posição/velocidade/relógio) e <b>NIS de brancura da inovação</b> (Inovação Normalizada ao Quadrado) sobre um conjunto Monte Carlo, conferidos com as suas faixas de χ² a { "95" }% (Bar-Shalom §{ "5.4" }). O filtro ajustado cai dentro das faixas; um filtro deliberadamente desajustado (os controles <c10/> / <c11/>) é sinalizado — uma barreira objetivamente verificável e discriminante, não um carimbo automático. <b>A verificação de NEES/brancura da inovação é a REFERÊNCIA INDEPENDENTE ESTATÍSTICA: uma afirmação de autoconsistência (a covariância informada pelo filtro corresponde com honestidade à dispersão dos seus próprios erros sob o ruído modelado), NÃO uma garantia de precisão no mundo real.</b> Escopo honesto: tudo é <b>modelado / simulação</b> — as entradas do CAI e do relógio são valores delimitados, representativos da literatura, e não hardware medido; o hardware do CAI e a sua pessoa-chave (Key-Person) continuam sob a responsabilidade do parceiro; nada aqui implica TRL > { "3" }, histórico de voo ou validação externa (o JSON de resultado e o resumo de uma linha trazem esses rótulos de forma explícita). A única trajetória nivelada de velocidade constante deixa os estados de atitude e de viés da IMU apenas fracamente observáveis, de modo que o NEES é avaliado sobre os { "8" } estados estimáveis; uma trajetória com manobras para observabilidade dos 17 estados está no roteiro. Acrescenta também a instrumentação de consistência <c12/> (que devolve o NIS por atualização) e <c13/>. Todos os cenários existentes não são afetados (aditivo; referências de reprodutibilidade (goldens) inalteradas).

# text
# c1: terrain-slam
# c2: src/altpnt/sequential.rs
# c3: scenarios/terrain-slam.toml
# c4: particle_filter
# c5: terrain-nav
seg-9b55f4ac5053 = <b>Navegação sequencial (recursiva) referenciada ao terreno — SITAN como filtro em execução.</b> Um novo tipo de cenário <c1/> (<c2/>, <c3/>) que executa o modelo existente de medição altímetro-versus-DEM <b>época a época</b> pelo motor SIR de <c4/>, em vez da busca em lote de grosseiro a fino que <c5/> usa para recuperar um único deslocamento <em>constante</em> do INS. Em cada ponto de passagem, a nuvem é propagada pelo incremento informado pelo INS (ele próprio corrompido pelo crescimento da deriva a cada passo), reponderada pela correspondência com o terreno e reamostrada em caso de degeneração — de modo que uma deriva do INS <b>variável no tempo</b> é <em>acompanhada</em> ao longo da trajetória, o que um ajuste de deslocamento constante estruturalmente não consegue fazer. No DEM sintético, a estimativa recursiva permanece limitada e reconverge (final ≈ { "70" } m), enquanto a solução inercial sem auxílio diverge sem limite até ≈ { "5" } km; o erro por época acompanha a singularidade do terreno (segue pelo INS enviesado sobre selas planas e se retrava sobre relevo distintivo), e o monitor de tamanho efetivo da amostra confirma uma nuvem saudável. Escopo honesto: o mapa é <b>conhecido e fixo</b> — <em>localização</em> recursiva contra um DEM armazenado (a metade de localização do SLAM de terreno), e não estimação conjunta do mapa; não circular por construção (a rampa de deriva injetada é a verdade independente). Todos os cenários existentes não são afetados (aditivo; referências de reprodutibilidade (goldens) inalteradas).

# text
# c1: src/holdover.rs
# c2: src/impairment_eval.rs
# c3: src/quantum_trade.rs
# c4: src/navsignal.rs
# c5: src/inertial/quantum_imu.rs
# c6: src/verification.rs
seg-87ba3bc926fa = <b>Espinha de resiliência sem GNSS + fatias de demonstrador FutureNAV</b> (<c1/>, e fundamentos de envelope de resiliência em <c2/>, <c3/>, <c4/>, <c5/>, com fatias de verificação FutureNAV em <c6/>). Compõe os blocos de construção de PNT alternativo — holdover do relógio, rastreamento de sinal, navegação inercial, terreno — numa única narrativa de resiliência a interrupções do GNSS. MODELLED; aditivo.

# text
# c1: src/interchange.rs
seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — um envelope de artefato versionado e autodescritivo</b> (<c1/>). Um invólucro com marcação de esquema em torno dos resultados de cenário, para que um artefato armazenado leve consigo o seu tipo, a versão do esquema e os rótulos MODELLED/VALIDATED, e para que envelopes mais antigos continuem legíveis com compatibilidade futura. Aditivo; o JSON de resultado existente permanece inalterado.

# text
# c1: src/navsignal.rs
# c2: src/cr3bp.rs
seg-07147766ab22 = <b>Modulação / rastreamento de sinal de navegação + corretor diferencial de halo/NRHO do CR3BP</b> (<c1/>, <c2/>). Um modelo de primeira ordem de modulação e rastreamento de sinal de navegação, e um corretor diferencial de três corpos restrito circular para órbitas halo / halo quase retilíneas, apresentados no eixo existente de capacidades de espaço profundo. MODELLED.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-d0d2366e3351 = <b>Modo de avaliação de mudança de distribuição + controle de escala de severidade do corpus para <c1/></b> (<c2/>). Acrescenta uma divisão explícita dentro/fora da distribuição e uma escala ajustável de severidade do corpus ao arcabouço de lacuna de otimismo ROC/AUC (apenas características operacionais — nunca dados de campo/IQ).

# text
# c1: src/frugal.rs
# c2: src/integrity_impact.rs
seg-9bb8ee93e70b = <b>ROI de custo por cobertura + mapeamento do impacto de integridade por falha de detecção</b> (<c1/>, <c2/>). Uma lente de ROI de engenharia frugal (custo por unidade de cobertura) e um mapeamento da taxa de falhas de detecção para o impacto na integridade. MODELLED; aditivo.

# text
# c1: src/inertial/quantum_imu.rs
# c2: hybrid-ukf
seg-55f8ba5b52ee = <b>Folha de parâmetros citada do modelo de erro do interferômetro de átomos frios (CAI)</b> (<c1/>). Uma folha de parâmetros delimitados, com referência na literatura, para o modelo inercial do CAI — as entradas são <b>citadas, e não de hardware medido</b> (sem alegação de TRL / voo); ela alimenta o piso do passeio aleatório de velocidade de <c2/>.

# text
seg-cfbff4acc64c = Governança do projeto.

# text
# c1: GOVERNANCE.md
# c2: none → partial
seg-982f9ea3eee8 = <c1/> documentando o modelo de decisão e a fronteira entre o aberto e o fechado; a linha de comunidade/governança do mapa de capacidades passa de <c2/> para refletir isso.

# text
# c1: b_nom
# c2: b_k = Σ_i |s_i|·b_nom
# c3: #[serde(default)]
# c4: sigma_ura_m
# c5: b_nom_m
# c6: docs/ARAIM_REFERENCE.md
# c7: b_k
seg-c9ff6a7183eb = <b>Nível de proteção de integridade do ARAIM — viés nominal (<c1/>) e σ_URA agora aplicados.</b> O nível de proteção MHSS agora subtrai a projeção unilateral do viés nominal <c2/> por modo de falha, e usa o sigma de <b>integridade</b> σ_URA (distinto do sigma de <b>precisão</b> σ_URE) transportado na Integrity Support Message. Isso torna o nível de proteção mais conservador e correto segundo as normas e, portanto, <b>altera os valores de PL informados pelos cenários de integridade existentes</b>. A ISM/o cenário ganha os campos <c3/> <c4/> / <c5/>, de modo que as entradas que os deixam sem definir mantêm o comportamento anterior. Veja <c6/> para a fórmula <c7/> restaurada e a nota honesta de implementação.

# text
seg-c408f8944ac6 = Consistência χ² do monitor de falsificação (spoofing).

# text
# c1: parity_raim_test
# c2: raim::chi2_quantile
seg-92e2b5c5458c = <c1/> agora usa o caminho compartilhado do χ² inverso <c2/>, eliminando uma segunda implementação divergente do χ², de modo que o RAIM e o monitor de falsificação por paridade concordem quanto aos seus limiares.

# text
# c1: gravity-map-nav
# c2: kind=
seg-6d424034e500 = <b><c1/> ligado ao despachante da CLI.</b> O cenário antes só era alcançável pela API; agora é despachado como um <c2/>, como todos os outros cenários.

# text
# c1: api::list_scenario_kinds().len()
# c2: scenario_count_doc_sync
seg-62c3efb54991 = <b>Precisão da documentação e das contagens.</b> As contagens de tipos de cenário no README agora são fixadas a <c1/> por um teste <c2/>, de modo que a contagem documentada não possa mais divergir do despachante.

# text
# c1: Body{mu, re, zonals, gravity, rotation, IAU-pole}
# c2: EphemerisProvider
# c3: mars-pnt
# c4: xval/anise-mars-od
# c5: cargo deny
seg-5f0f497aa643 = <b>PNT de espaço profundo e de Marte — motor aberto de navegação radiométrica + simulação GSE.</b> Um novo eixo de capacidades, totalmente aditivo, sobre o núcleo validado na Terra (todo cenário terrestre existente é <b>idêntico byte a byte</b> — as referências de reprodutibilidade (goldens) passam sem alterações e sem regeneração). Acrescenta: um núcleo de dinâmica de múltiplos corpos (<c1/> com gravidade tesseral GMM-3 de Marte, um referencial de Marte fixo ao corpo da IAU, um ponto de conexão <c2/> plugável, datas julianas de duas partes com precisão submicrossegundo e TT↔TDB); observáveis radiométricos (tempo de luz iterativo + atraso de Shapiro, Doppler e distância de duas/uma/três vias pela solução de duas pernas de Moyer, retransmissão coerente do transponder, medição de distância regenerativa/PN segundo o CCSDS { "414" }, Δ-DOR segundo o CCSDS { "506" }, meios de plasma solar/tropo/iono); leitura + emissão de CCSDS-TDM ({ "503" }); um filtro de informação em raiz quadrada de dinâmica reduzida com acelerações empíricas RTN, um relógio de bordo de três estados e um modelo de arrasto de Marte; um estimador de fusão conjunta unidirecional + bidirecional; a superfície de cenários <c3/> (constelação de retransmissão + LMO/transferência/ superfície) em CLI, Python, WASM, MCP e no playground; e um simulador de desempenho GSE de ponta a ponta (geometria → orçamento de enlace → observáveis → SRIF → covariância). <b>Nível de validação — validado por simulação:</b> OD sintética em malha fechada (Mars-LMO ≈ { "0.2" } m) e autoconsistência analítica, com a dinâmica de Marte centrada no Sol conferida de forma independente com o JPL <b>DE440</b> (<c4/>, condicionado ao kernel: { "137" } m em arco de 1 dia, o resíduo honesto de n corpos não modelados). As precisões de espaço profundo informadas são <b>figuras de mérito de simulação / de covariância</b>, e não resultados de missões reais; a validação com dados reais de rastreamento da DSN/ESTRACK continua no roteiro. O ANISE (MPL-2.0, edition-2024) fica confinado a um crate de verificação cruzada excluído do workspace, de modo que a barreira de licenças de <c5/> e o job MSRV-1.75 não são afetados.

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: EopSeries
# c5: precise_od
# c6: dut1_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: kshana --eop <finals2000A>
# c10: precise_od
seg-2ab34100a2d7 = <b>Trajetórias no solo com precisão de agência a partir da orientação real da Terra do IERS.</b> O cenário <c1/> aceita um campo opcional <c2/> — o corpo embutido de um arquivo real <c3/> do IERS — e reduz a trajetória no solo por meio do UT1−UTC e do movimento polar por época, interpolados dele (a mesma <c4/> que <c5/> usa), substituindo os escalares nominais <c6/>/<c7/>/<c8/>. Os dados viajam dentro do cenário, de modo que a execução continua reprodutível e dispensa sistema de arquivos (funciona no playground WASM). Uma opção <c9/> incorpora um arquivo real ao cenário a partir da CLI. Elimina a assimetria em que só <c10/> consumia dados reais de orientação da Terra.

# text
# c1: frames::itrf_to_teme
seg-e778245e7d8f = <b>Consistência de referencial na taxa de variação da distância.</b> A estação terrestre agora é levada ao referencial inercial pelo inverso exato da redução do satélite (<c1/>, desfazendo o movimento polar <em>e</em> a rotação sideral), em vez de uma rotação GMST cega ao movimento polar, de modo que as duas extremidades compartilham um único referencial. O efeito sobre o Doppler informado fica abaixo do piso de validação, mas elimina uma discordância real de referencial e um excesso de afirmação de "exato" no código-fonte.

# text
# c1: carrier_hz
# c2: step_s
seg-3b912d8a819d = <b><c1/> é validado.</b> Uma frequência de portadora zero ou não finita agora devolve um erro em vez de produzir silenciosamente Doppler zero (isso tornava λ = c/portadora infinito), em linha com a proteção já existente de <c2/>.

# text
# c1: src/precise_od.rs
# c2: PreciseForceModel
# c3: finals2000A
seg-7d70317ca717 = <b>Validação do modelo de forças por ajuste de efemérides, conferida com produtos reais de agências.</b> Um novo estimador de mínimos quadrados em lote (<c1/>) com matriz de transição de estado variacional e edição de valores atípicos, conduzido por um modelo de forças completo (<c2/>: geopotencial EGM2008, terceiros corpos, marés sólidas + oceânicas + atmosféricas e acelerações empíricas CPR/2-por-revolução), alimentado por um analisador real de orientação da Terra IERS <c3/>. Validado em relação a órbitas de referência publicadas: <b>Galileo MEO a { "13" } cm pós-ajuste</b>, <b>Swarm-A LEO</b> da ESA e <b>LRO lunar</b> (selenocêntrico, gravidade GRAIL, referencial de corpo da IAU-2015 — dinâmica reduzida de { "6.6" } m, com honestidade acima da meta de { "5" } m no caminho aberto; o caminho ANISE/DE440 de nível DE que a atinge é um crate excluído do workspace).

# text
# c1: spoof-detect
seg-bf88a3eb4733 = <b>Cenário <c1/></b> — um detector integrado e multicamada de falsificação (spoofing) que combina paridade RAIM por época, monitores de AGC e de qualidade de sinal (SQM) e uma decisão fundida, validado em relação aos parâmetros publicados do cenário <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), incluindo o caso difícil de alinhamento de portadora.

# text
# c1: ephemeris
seg-976036ba124b = <b>Cenário <c1/> — estado, referenciais, trajetória no solo e Doppler.</b> Propaga um satélite (TLE→SGP4 ou uma órbita analítica) e emite, a cada passo, o estado inercial TEME e GCRS (<b>posição <em>e</em> velocidade</b>), a posição ITRF/ECEF fixa à Terra, a <b>trajetória no solo</b> do subponto do satélite em WGS-84 (latitude / longitude / altitude), e o azimute / elevação / distância topocêntricos com a taxa de variação da distância e o <b>Doppler</b> a partir de uma estação terrestre. Acessível pela CLI, por Python, por WASM e pelo servidor MCP, e entregue como a <b>predefinição "Ground track"</b> no playground web, onde a trajetória é desenhada <b>sobre um mapa-múndi real</b> (linhas de costa Natural Earth { "1" }:110m, embutidas — sem rede nem dependência externa).

# text
# c1: --export-oem
# c2: export_oem = true
seg-761c95f2ede5 = <b>Exportação CCSDS OEM</b> (<c1/> / <c2/>) — a Orbit Ephemeris Message com velocidade, consumida por GMAT / Orekit / STK, em paridade com os exportadores SP3 e OMM existentes.

# text
seg-111b0896fdd4 = <b>Marés terrestres sólidas, oceânicas (FES2004) e atmosféricas (Ray { "2001" } S2)</b> sobre o geopotencial (IERS Conventions, cap. { "6" }), ligadas ao modelo de forças.

# text
seg-7e392131261a = <b>Wheels ARM64</b> — a build do PyPI agora também produz wheels Linux aarch64 (manylinux_2_28), macOS arm64 e Windows arm64.

# text
seg-7cc04ea3362b = <b>Relatório técnico estendido (preprint)</b> com link no README, e o artigo do JOSS tornado submetível (ORCID do autor, compilado em PDF no CI a cada mudança).

# text
seg-3b1e95acc728 = <b>Referenciais validados ao milímetro em relação a vetores publicados de Vallado.</b> A redução TEME→PEF/ITRF, a cadeia completa CIO IAU 2006/2000A GCRS→ITRS e a conversão ECEF→geodésica WGS-84 agora estão fixadas ao exemplo resolvido de Vallado et al. (AIAA 2006-6753) com o seu EOP do IERS, e não apenas à autoconsistência interna.

# text
# c1: hifitime
seg-fd9818877a6c = <b>Verificações cruzadas independentes de escalas de tempo.</b> A ERA e as escalas UTC/TAI/TT concordam com <c1/> a < { "1" } µs, e as efemérides planetárias DE440 concordam com o JPL Horizons (posições geocêntricas da Lua/do Sol), ambos como barreiras de CI sempre ativas.

# text
seg-75aeec4cd6d0 = O playground web oculta a aba de figuras de mérito quando um resultado não traz linhas de figuras de mérito, de modo que pacotes só com gráficos (efemérides, RAIM, falsificação) abram no seu gráfico — para efemérides, a trajetória no solo — em vez de numa tabela vazia.

# text
seg-b8ab0cc3ce7f = Os controles deslizantes guiados do playground <b>e a varredura de parâmetros agora funcionam no cenário de efemérides / trajetória no solo</b>: os seus controles (latitude / longitude da estação, passo de tempo, duração, UT1−UTC) são ajustáveis, e uma varredura pode traçar a geometria da passagem (elevação máxima, Doppler de pico, altitude, velocidade) em função de qualquer um deles — por exemplo, elevação máxima versus latitude da estação. A aba Sweep agora só é mostrada quando um cenário é de fato varrível, de modo que nenhum pacote ofereça um controle que não traça nada.

# text
# c1: DUT1 ≈ 0
# c2: CAPABILITY.md
seg-9e7a37e51940 = Documentada a aproximação <c1/> do SGP4 no ponto de chamada do GMST (um erro de rotação de ≤ ~{ "13" }″, bem dentro do próprio erro de modelo do SGP4) e atualizado <c2/>.

# text
# c1: kshana.dev
seg-174a75e840b0 = O plugin JetBrains <b>Kshana — PNT simulator</b> agora está publicado e aceito no <a1>JetBrains Marketplace</a1>. O README, <c1/> e a documentação de distribuição apontam diretamente para ele.

# text
# c1: server.json
# c2: description
# c3: io.github.ashfordeOU/kshana-mcp
seg-4deaf7918fff = <b>A publicação no registro MCP</b> agora é bem-sucedida: o <c2/> de <c1/> excedia o limite de 100 caracteres do registro (HTTP { "422" }). Foi encurtado, e o nome do servidor (e o rótulo de propriedade da imagem) foi alinhado ao namespace canônico <c3/>.

# text
# c1: 0.1.1
seg-1408961042a1 = <b>A publicação no JetBrains Marketplace</b> agora é bem-sucedida: o CI reenviava a mesma versão do plugin que havia sido listada manualmente, o que o Marketplace rejeita. A versão do plugin foi elevada para <c1/>, e a proteção de idempotência agora também trata uma resposta "already contains version" como um sucesso sem efeito.

# text
# c1: kshana.dev
# c2: style.css
# c3: app.js
seg-74e8cab2f10e = <b>Invalidação de cache de <c1/></b>: as cadeias de consulta com carimbo de versão de <c2/>/<c3/> acompanham a versão, de modo que quem retorna sempre receba a build atual.

# text
# c1: kshana-mcp
# c2: mcp/kshana-mcp/
# c3: rmcp
# c4: run_scenario
# c5: list_scenario_kinds
# c6: validate_scenario
# c7: export_sp3
# c8: export_omm
# c9: kshana::api
seg-65949229eed7 = <b><c1/> — o Kshana como servidor do Model Context Protocol (MCP)</b> (<c2/>). Um crate autônomo, excluído do workspace (o SDK <c3/> é edition { "2024" }), que expõe o motor validado a agentes e assistentes de IA — Cursor, JetBrains AI Assistant / Junie e qualquer cliente MCP — via stdio. Ferramentas: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, cada uma um invólucro fino sobre <c9/>.

# text
# c1: ide/jetbrains/
# c2: .toml
seg-bd792f66363c = <b>Plugin para IDEs JetBrains</b> (<c1/>). Clique com o botão direito em um <c2/> de cenário → <b>Run Kshana Scenario</b>; as figuras de mérito e o JSON de resultado fluem para uma janela de ferramentas do Kshana. Plugin Kotlin de plataforma pura, compatível com toda IDE JetBrains { "2024.3" }+.

# text
seg-755358390517 = <b>Distribuição pública + publicação automática a cada versão</b> para ambos:

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
# c3: publish.yml
seg-14fc2fd73553 = <c1/> no <b>crates.io</b> (<c2/>) por meio de <c3/>.

# text
# c1: kshana-mcp
# c2: ghcr.io
# c3: docker run ghcr.io/ashfordeou/kshana-mcp
# c4: mcp-publish.yml
seg-2b39bbfc0581 = <c1/> como <b>imagem OCI</b> multiarquitetura em <c2/> (<c3/>) por meio de um novo <c4/>.

# text
# c1: kshana-mcp
# c2: server.json
seg-c824d1532eb6 = <c1/> no <b>registro MCP oficial</b> via GitHub OIDC (zero segredos); a entrada do registro (<c2/>) usa o tipo de pacote OCI com um proprietário verificado por rótulo.

# text
# c1: publishPlugin
seg-f90da0c61aac = o plugin para IDE no <b>JetBrains Marketplace</b> por meio de <c1/> (condicionado a token, com assinatura de desenvolvedor opcional) a cada tag de versão.

# text
# c1: xval/anise-frames/
# c2: kshana
# c3: kshana::cio::gcrs_to_itrs_matrix
# c4: earth_latest_high_prec.bpc
# c5: finals2000A
# c6: anise
# c7: hifitime
# c8: kshana
# c9: Cargo.lock
# c10: cargo deny
# c11: default-features = false
# c12: frame-xval
# c13: report.{json,md}
# c14: workflow_dispatch
# c15: main
# c16: docs/VALIDATION.md
# c17: ROADMAP.md
seg-21d7457dad23 = <b>Validação cruzada independente de referenciais ANISE/SPICE</b> (<c1/>). Um crate autônomo, excluído do workspace, confere a redução CIO IAU 2006/2000A de <c2/> (<c3/>, GCRS→ITRS) com o <b>ANISE</b> (a reimplementação em Rust puro do NAIF/SPICE) girando GCRF→ITRF93 a partir do <c4/> do JPL, com os <b>mesmos parâmetros de orientação da Terra IERS <c5/> fornecidos aos dois lados</b>, em oito épocas trimestrais de { "2020" }–{ "2023" }. As duas realizações independentes de referencial concordam com uma <b>rotação relativa máxima de { "0.028" }″ — ≤ { "0.86" } m no solo, ≤ { "0.93" } m em LEO, ≤ { "3.6" } m em órbita GNSS</b>, atingindo com ampla margem a antiga verificação cruzada de referencial do ROADMAP, "< { "10" } m" (ela complementa, e não substitui, as âncoras SOFA/ERFA bit a bit já existentes). O crate é isolado porque <c6/> + <c7/> são MPL-2.0 / edition-2024 e nunca devem entrar no grafo de dependências publicado de <c8/>, no seu <c9/>, na barreira de licenças <c10/> nem na build MSRV; o ANISE é fixado com <c11/>. Inclui um binário <c12/> (baixa o BPC de ~{ "5" } MB, imprime uma tabela e grava <c13/>), uma barreira de testes que se autoignora sem kernel/rede e um job de CI opcional, só com <c14/> (nunca bloqueia <c15/>). Documentado em <c16/> (linha CIO) e em <c17/>.

# text
# c1: .panel
# c2: min-width: auto
# c3: min-width: 0
seg-eb45b43dacc2 = <b>Playground adequado a dispositivos móveis.</b> Corrigido o transbordamento horizontal de <c1/> do playground em celulares (um item de CSS grid com <c2/> por padrão era renderizado ~{ "100" } px mais largo do que a janela de exibição) por meio de <c3/> e de controles com largura protegida; verificado sem problemas em { "360" } / { "390" } / { "414" } / { "768" } px. Alinhados os botões de ação "Pin to compare" / "Download report" (caixas de margem iguais na linha flex). Ampliados os botões de execução, os controles deslizantes, os seletores e os links de navegação até o mínimo de alvo de toque de ~{ "44" } px da WCAG { "2.5.5" } / Apple-HIG em celulares e dispositivos de toque, com o tamanho em desktop inalterado.

# text
# c1: sbas_protection_level
# c2: Some
# c3: propagate
# c4: propagate_dopri
# c5: lunar_look_angle
# c6: [0, 360)
# c7: SphericalHarmonicField::from_gfc
# c8: GM
seg-fe5095d5e61f = <b>Reforço de robustez a partir de uma rodada adversarial de testes de batalha.</b> ({ "1" }) <c1/> agora rejeita elevação/azimute/variância não finitos e diagonais de covariância negativas ou não finitas (uma geometria quase singular ampliada por um σ pequeno poderia antes escapar da barreira de pivô absoluto e devolver um VPL NaN / um HPL absurdo como um <c2/> <em>válido</em> — uma falha silenciosa de integridade). ({ "2" }) O propagador numérico (<c3/>/<c4/>) falha de forma segura diante de um estado inicial não finito, em vez de fazer o controlador adaptativo girar para sempre. ({ "3" }) O auxiliar de células do DEM não entra mais em pânico com uma grade de amostra única ({ "1" }×N). ({ "4" }) O azimute de <c5/> é mantido estritamente em <c6/>. ({ "5" }) <c7/> rejeita <c8/>/raio não físicos (NaN / não positivos).

# text
# c1: validation_report
# c2: kshana-validation-summary.html
seg-9ca339d8977a = <b>Binário <c1/> + artefato de versão</b>: um gerador sem dependências que emite um resumo de validação em HTML de uma página, pronto para impressão, indexando cada validação imposta pelo CI (SGP4 666/666, EGM2008, referenciais bit a bit, Allan do NIST, folhas de dados de IMU, ARAIM/SBAS, reprodutibilidade em 3 SOs, cobertura) ao seu teste e à sua referência independente externa. O fluxo de trabalho de versão gera <c2/> e o anexa (com proveniência SLSA) a cada versão com tag.

# text
# c1: tests/python/test_numpy_interop.py
# c2: auditwheel show
seg-bd231d07658f = <b>pytest de interoperabilidade com numpy + reforço da wheel</b>: <c1/> (executado no CI) mais um contêiner manylinux fixado e uma etapa de verificação <c2/> na build da wheel.

# text
# c1: docs/tutorials/
# c2: tests/tutorials.rs
seg-5427cae6fc39 = <b>Tutoriais e educação</b>: <c1/> (três tutoriais resolvidos, cenários anotados por domínio, exercícios dos níveis 1/2/3) com <c2/> fixando cada número citado à saída ao vivo do motor.

# text
# c1: paper/
# c2: notebooks/
# c3: submissions/
# c4: FUNDING.yml
seg-2fad9124c5a6 = <b>Artefatos de submissão externa</b> (<c1/>, <c2/>, <c3/>): um rascunho de artigo do JOSS, um notebook quântico-versus-clássico e kits prontos para envio para awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, mais <c4/> — preparando as etapas externas da submissão.

# text
# c1: altpnt
# c2: .hgt
# c3: terrain-nav
# c4: combined-altpnt
seg-0f88f8bccbc1 = <b>Navegação referenciada ao terreno e navegação alt-PNT combinada</b> (módulo <c1/>): um navegador de correspondência de terreno TERCOM/SITAN sobre um DEM (carregador de <c2/> + gerador de fixtures sintéticas) e um navegador combinado sem GPS de gravidade + magnético (IGRF) + terreno, exposto como os tipos de cenário <c3/> e <c4/>. Validado pela convergência da correspondência de terreno (um deslocamento injetado conhecido é recuperado) e por um erro limitado do filtro combinado ao longo de uma janela sem GPS.

# text
# c1: lunar
seg-bd01ec72fa2a = <b>Geometria LANS da LunaNet</b> (<c1/>): locais nomeados da superfície lunar (Apollo 11/15/16, borda de Shackleton) com coordenadas selenográficas oficiais, ângulos de visada na superfície (az/el/distância), visibilidade/cobertura e DOP do local, validados em relação ao raio da Lua, às coordenadas publicadas dos locais e à identidade de elevação de { "90" }° na vertical.

# text
# c1: eci_track
seg-2dad9cf59ea9 = <b>Playground guiado no navegador</b>: controles deslizantes do modo guiado, um painel de saída com abas, uma sobreposição de tour na primeira execução, modos de varredura de parâmetros e de sobreposição de várias execuções, uma vista 3D da órbita em canvas/SVG sem dependências (o pacote de órbita agora emite um <c1/> aditivo), um modo de incorporação/iframe e download como relatório HTML — cada um com testes unitários em node no CI.

# text
# c1: tests/imu_allan_spec.rs
seg-261604603d67 = <b>Modelo de erro de IMU validado por folha de dados</b> (<c1/>): ARW/VRW/instabilidade de viés do ADIS16465/16488/16460 recuperados do desvio de Allan sintetizado e conferidos com as especificações do fabricante (identificação NIST SP1065 / IEEE { "952" }).

# text
# c1: tests/allan_nist_sp1065_1000point.rs
seg-dc7b9bdb3076 = <b>Validação dos estimadores de Allan do NIST SP1065</b> (<c1/>): os quatro estimadores reproduzem os desvios de referência publicados de 1000 pontos e os limites de confiança da Tabela 32.

# text
# c1: sbas
# c2: sbas_protection_level
# c3: orbit::invert4
# c4: iono_free_l1l5
# c5: γ₁₅ = 1.79327
# c6: do316_compliance_map
# c7: inv(GᵀG)
# c8: docs/COMPLIANCE.md
seg-5d50be22aacd = <b>Níveis de proteção SBAS / DO-229E, livre de ionosfera L1/L5 e um mapa de compliance do DO-316</b> (módulo <c1/>). <c2/> forma a matriz de geometria ponderada a partir da elevação/azimute de cada satélite e do orçamento de erro UDRE/GIVE/aerotransportado/tropo, inverte a matriz normal (<c3/> compartilhada) e projeta as variâncias em HPL/VPL por meio dos fatores K do DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> acrescenta a pseudodistância GPS L1/L5 livre de ionosfera (IS-GPS-705, <c5/>), validada para cancelar o atraso ionosférico de primeira ordem independente do motor. <c6/> rastreia os requisitos do DO-316/DO-229E até as funções que os implementam. Validado em relação às definições de forma fechada dos fatores K, à geometria de referência <c7/> em numpy e à identidade de covariância por duas rotas; a verificação cruzada de aderência à norma do PL publicado com RTKLIB/gLAB está documentada como pendente de revisão em <c8/>.

# text
# c1: gravity_sh::SphericalHarmonicField
# c2: C̄_nm, S̄_nm
# c3: egm2008_data.rs
# c4: tools/gen_egm2008.py
# c5: tools/egm2008_to70.gfc
# c6: .gfc
# c7: from_gfc
# c8: C̄00
# c9: −μr/|r|³
# c10: forces::zonal_accel
seg-e9e60b40e42a = <b>Gravidade tesseral completa por harmônicos esféricos — o campo EGM2008 até grau/ordem { "70" }.</b> Um novo <c1/> avalia o geopotencial e a sua aceleração no referencial fixo à Terra a partir de coeficientes <c2/> totalmente normalizados, usando a estável recorrência de Legendre normalizada de Holmes–Featherstone (desnormalizar estouraria neste grau). Os coeficientes fornecidos são o produto EGM2008 da NGA (domínio público, via ICGEM), incluído em <c3/> e reproduzido bit a bit por <c4/> a partir de <c5/> versionado; qualquer modelo ICGEM <c6/> é carregado por <c7/>. Validado em relação a três referências independentes: o colapso para massa pontual (apenas <c8/> = <c9/>), um campo só zonal que reproduz o <c10/> existente a ~{ "1e-9" }, e a aceleração analítica coincidindo com o gradiente por diferenças finitas do potencial somado diretamente a <{ "1e-6" }.

# text
# c1: forces::lense_thirring_accel
# c2: ForceModel::lense_thirring()
seg-c33a2dbf851d = <b>Aceleração de Lense–Thirring (arrasto de referencial) da relatividade geral</b> (<c1/>, IERS { "2010" } Eq. { "10.12" }), o termo gravitomagnético além da correção de Schwarzschild existente, ligado ao propagador numérico por meio de um novo sinalizador <c2/>. Validada como linear no momento angular da Terra e { "1" }–{ "2" } ordens de grandeza abaixo do termo de Schwarzschild, o regime das medições do LAGEOS / Gravity Probe B.

# text
# c1: Propagator
# c2: NumericalPropagator
# c3: ForceModel
# c4: Tolerance
# c5: Integrator
# c6: Sgp4
# c7: propagator::Propagator
# c8: state_at(t_seconds) -> StateVector
# c9: Box<dyn Propagator>
# c10: PropagatorError
seg-909562023109 = <b>Uma trait <c1/> que unifica os propagadores de órbita analítico e numérico.</b> O propagador numérico de modelo de forças de Cowell agora é um par de primeira classe do SGP4: um novo tipo <c2/> (estado inicial + <c3/> + <c4/> + escolha de <c5/> por duplicação de passo ou de Dormand–Prince) e <c6/> implementam ambos <c7/>, cujo <c8/> devolve o estado TEME inercial em unidades do SI (m, m/s), de modo que os dois são intercambiáveis atrás de um <c9/>. A implementação do SGP4 é a conversão exata de km/min para o SI do método inerente (verificada por um teste de igualdade); a implementação numérica atinge, por meio da trait, o mesmo limite submétrico de Kepler exato, os dois condutores adaptativos concordam e um <c10/> expõe o código SGP4 subjacente.

# text
seg-d094880df57b = Esta versão fecha a maior lacuna de correção do motor: a orientação da Terra e a redução de referenciais agora são feitas em nível de implementação de referência (validadas <b>bit a bit em relação ao ERFA/SOFA</b>), a pilha de integridade ganha o <b>ARAIM de dupla constelação</b> com TLEs reais de GPS+Galileo, e as camadas de propagação, de sensores quânticos, lunar/cislunar e geomagnética se aprofundam — além de uma API Python tipada, um playground de navegador mais rico e uma matriz de reprodutibilidade em três SOs. Destaques:

# text
seg-bfe1d4a7cabd = <b>Referenciais, bit a bit.</b> Nutação IAU 2000A e 2000B completas, precessão IAU { "2006" }, a redução GCRS↔ITRS IAU 2006/2000A baseada em CIO (X, Y, s), movimento polar do IERS e referenciais de saída TEME→GCRS/ITRS — cada um validado bit a bit em relação às rotinas de referência do ERFA/SOFA.

# text
# c1: docs/ARAIM_REFERENCE.md
seg-bb5705347a24 = <b>ARAIM de dupla constelação</b> (GPS + Galileo) com TLEs reais, com HPL/VPL, saída em diagrama de Stanford e um <c1/> aberto.

# text
seg-2865dadcd4c8 = <b>PNT cislunar</b>: um propagador CR3BP Terra–Lua, referenciais MCI↔MCMF, coordenadas selenográficas e um cenário executável de integridade lunar da LunaNet.

# text
seg-3b636707a158 = <b>Sensoriamento quântico</b>: sistemáticos de Coriolis e de AC-Stark para o interferômetro de átomos frios, uma varredura de deriva e validação em relação ao orçamento de Freier ({ "2016" }).

# text
seg-10bc94801a6a = Modelo geomagnético de campo principal <b>IGRF-14</b>, autocontido e validado.

# text
# c1: RunOutput
# c2: ScenarioMeta
# c3: .data()
# c4: scenario_kinds
# c5: validate_toml
seg-6485f627d793 = <b>API Python tipada</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, stubs de tipos) com uma build de wheel no CI, além de saída de propagador GCRS/ITRS de primeira classe e exportação CCSDS OMM.

# text
# c1: sgp4
# c2: src/
# c3: ubuntu
# c4: macos
# c5: windows
seg-2b7693641333 = <b>Credibilidade e reprodutibilidade</b>: uma comparação direta de precisão do SGP4 com o crate independente <c1/>, uma barreira de cobertura no CI (~{ "97" }% de linhas em <c2/>) e uma matriz de reprodutibilidade em três SOs (<c3/>/<c4/>/<c5/>).

# text
# c1: src/report.rs
# c2: src/chart.rs
# c3: web/app.js
# c4: src/hybrid.rs
# c5: jamming.rs
# c6: timetransfer.rs
# c7: spoof.rs
# c8: raim.rs
# c9: lunar.rs
# c10: ensemble.rs
# c11: sweep.rs
# c12: gnss_sim.rs
# c13: fusion/pack.rs
# c14: inertial/mod.rs
# c15: #0e131b
# c16: --bg
# c17: --line
# c18: --fg
# c19: --accent-bright
# c20: --partial
# c21: --crit
seg-32e53ac66056 = <b>Todo gráfico do playground agora combina com o tema do site.</b> Todos os doze geradores de gráficos SVG — o gráfico de resultado/holdover (<c1/> + <c2/>), o gráfico de desvio de Allan (<c3/>) e todo gráfico de cenário (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + disponibilidade, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — usavam painéis em azul-marinho frio (<c15/>), eixos/textos em cinza frio e uma paleta de séries vermelho/azul/roxo que destoava. Agora usam por toda parte a paleta de grafite quente: painéis <c16/>, grade quente <c17/>, rótulos <c18/>, com uma atribuição consistente de séries — quântico = dourado-mel (<c19/>), clássico = âmbar quente (<c20/>), especificação/limite = <c21/>. As vistas com codificação de segurança mantêm o seu significado: o diagrama de Stanford do RAIM continua verde (disponível) / âmbar (enganoso) / vermelho (perigoso) / aço fosco (indisponível), e HPL/VPL aparecem em dourado/bronze.

# text
# c1: Kshana v<version> · <scenario-hash> · kshana.dev
seg-2bb31dfc7756 = <b>Os gráficos agora se autodescrevem quando salvos/baixados.</b> Ambos os gráficos gravam o seu título no SVG (o título do gráfico de Allan + o subtítulo "lower is better" antes ficavam só no HTML ao redor da imagem, de modo que uma imagem salva ficava sem legenda), e ambos trazem um rodapé de proveniência — <c1/> — de modo que um gráfico baixado se sustente sozinho e permaneça reprodutível.

# text
# c1: Kshana v<version> · scenario <hash> · kshana.dev
# c2: api::run_toml
# c3: .chart.svg
# c4: scenario
# c5: scenario_hash
# c6: docs/PROVENANCE.md
seg-9f528e334cd8 = <b>Todo gráfico agora traz o rodapé de proveniência.</b> O rodapé — <c1/> — é carimbado de forma central para todos os tipos de cenário em <c2/> (antes só estava nos gráficos de holdover e de Allan), de modo que qualquer imagem salva ou baixada — do playground, da exportação <c3/> da CLI ou do painel de resultados em HTML — identifique a sua versão, a impressão digital do cenário e a fonte. O hash é rotulado <c4/> para maior clareza e vem de <c5/> do resultado, quando presente, com um recurso de hash da fonte para os relatórios de integridade/lunares. O que é a impressão digital e por que ela está ali está documentado na seção "Output" do README e em <a1><c6/></a1>.

# text
# c1: raim::chi2_quantile
# c2: read_dir
# c3: chi2_quantile
# c4: p
# c5: k
# c6: normal_quantile
# c7: assert!
# c8: Normal
seg-635697ed3fb1 = <b><c1/> e o amostrador de ruído de Stanford do RAIM agora não entram mais em pânico com entradas fora da faixa / não finitas</b> (uma descoberta de fuzzing dependente da ordem de <c2/>, vinda dos novos cenários ARAIM). <c3/> agora protege <c4/>/<c5/> como <c6/> (devolvendo um valor de fronteira em vez de entrar em pânico com <c7/>), e o <c8/> de ruído de Stanford de disponibilidade limita-se a um σ estritamente positivo — de modo que a pilha de integridade/ARAIM nunca entre em pânico com cenários mutados ou mal configurados.

# text
# c1: reproducibility-matrix
# c2: tests/golden/
# c3: tests/cross_platform_golden.rs
# c4: golden.rs
# c5: sgp4_verification.rs
# c6: determinism.rs
# c7: docs/REPRODUCIBILITY.md
seg-b36a0c42845e = <b>Matriz de CI de reprodutibilidade entre plataformas.</b> Um novo job <c1/> executa os testes de reprodutibilidade em <b>ubuntu-latest, macos-latest e windows-latest</b> a cada push. Como o JSON de resultado completo não é idêntico byte a byte entre SOs (divergência de libm no último ULP), ele afirma exatamente a projeção invariante da plataforma — a impressão digital da entrada mais a forma da saída, fixada por cenário como goldens SHA-256 em <c2/> pelo novo <c3/> — junto com as fixações numéricas (<c4/>, a { "1e-6" }), os estados do SGP4 (<c5/>, a { "2e-5" } km) e o determinismo no mesmo processo (<c6/>). Juntos, eles comprovam a reprodutibilidade entre plataformas em três SOs sem a fragilidade de um hash de bytes exato da saída completa. <c7/> documenta a divisão.

# text
# c1: coverage
# c2: cargo-tarpaulin
# c3: src/
# c4: src/
seg-9b8c0a407387 = <b>Barreira de cobertura de código no CI.</b> Um novo job <c1/> executa <c2/> com o motor baseado em código-fonte do LLVM, publica um relatório lcov como artefato de build e impõe um piso de cobertura de linhas em <c3/> (tabelas de dados geradas, o ponto de entrada da CLI, os testes e os ativos web excluídos). A cobertura de linhas medida é de ~{ "97" }% em <c4/> (SGP4 e os módulos de relógio ≥{ "95" }%); a barreira está fixada em { "85" }% — acima da meta de ≥{ "80" }% e afastada do valor medido, de modo que detecta regressões sem oscilar. Um selo de cobertura é publicado no README.

# text
# c1: sgp4
# c2: tests/sgp4_crate_comparison.rs
# c3: tcppver.out
# c4: tests/fixtures/sgp4_comparison.md
# c5: KSHANA_REGEN_FIXTURES=1
# c6: from_elements
seg-1dfc4beb239a = <b>SGP4/SDP4 frente a frente com o crate independente <c1/>.</b> Um novo teste (<c2/>) valida de forma cruzada o propagador do Kshana contra a biblioteca SGP4 em Rust mais usada (neuromorphicsystems/sgp4, adicionada como dev-dependency apenas para testes) sobre os mesmos { "666" } vetores AIAA 2006-6753. Com ambos conduzidos no modelo de gravidade WGS72 que os vetores usam, as duas implementações independentes concordam em <b>nível submicrométrico</b> em órbitas próximas da Terra e ressonantes e em <b>{ "4.12" } mm no pior caso</b> em todos os regimes, ambas reproduzindo a tabela de referência <c3/>. A tabela de comparação versionada (<c4/>, regenerada via <c5/>) detalha o resultado por regime (LEO/MEO, espaço profundo, ressonância de ½ dia e de 1 dia) e registra os quatro casos deliberadamente patológicos que o crate rejeita na construção. As asserções ao vivo mantêm ambos a menos de { "2e-5" } km da referência e concordando entre si a menos de { "4e-5" } km — uma proteção contra regressões, e não algo pontual. Isto é pedigree competitivo: correção contra uma base de código independente, e não apenas uma tabela estática. (O <c6/> padrão do crate usa WGS84 e por isso difere da referência WGS72 em ~km — exposto com honestidade no texto da tabela.)

# text
# c1: src/omm.rs
# c2: orbit
# c3: kshana <orbit.toml> --export-omm out.omm
# c4: export_omm = true
# c5: <scenario>.omm
# c6: --export-sp3
# c7: YYYY-NNNP
# c8: tle::parse_tle_identity
# c9: OBJECT_NAME
# c10: OBJECT <id>
# c11: CREATION_DATE
# c12: api::export_omm
# c13: api::auto_export_omm
# c14: OmmFile::from_tle_block
# c15: OrbitClockScenario::to_omm_string
# c16: gps-ops
# c17: tests/sp3_export_roundtrip.rs
seg-dc75162ecd64 = <b>A exportação CCSDS OMM agora é alcançável de ponta a ponta.</b> O gravador de OMM (<c1/>) antes não tinha caminho por CLI/API; os elementos médios de um cenário <c2/> agora podem ser publicados como um catálogo OMM CCSDS 502.0-B-2 — uma mensagem OMM KVN por satélite definido por TLE — via <c3/>, ou <c4/> no cenário grava automaticamente <c5/> (espelhando o <c6/> existente). Cada mensagem traz o número de catálogo NORAD <b>real</b> do satélite, o designador internacional COSPAR (<c7/>) e a época (forma de dia do ano do CCSDS), lidos da linha { "1" } do TLE pelo novo <c8/>; a linha de nome vira <c9/> (ou então <c10/>). <c11/> é a época do cenário, e não o relógio de parede, de modo que a saída seja reprodutível. Nova API: <c12/> / <c13/>, <c14/>, <c15/>. Um cenário Walker sintético ou RINEX (sem elementos médios de TLE) gera um erro, em vez de emitir um arquivo vazio. Validado com o instantâneo <c16/> incluído, de 30 satélites (<c17/>).

# text
# c1: web/hover.mjs
# c2: web/app.js
# c3: <img>
# c4: web/hover.test.mjs
seg-036782a2b65e = <b>Leituras interativas ao passar o cursor nos gráficos do playground.</b> Mover o cursor sobre um gráfico prende uma mira à amostra mais próxima e mostra uma dica de valor (<c1/>, ligado em <c2/>). No gráfico de Allan, ela lê τ e o σ_y(τ) de cada relógio; nos gráficos de cenário em séries temporais (holdover do relógio, navegação inercial estimada, transferência de tempo, PNT híbrido, GNSS/INS), ela lê o tempo e o valor de cada suíte nas unidades do próprio gráfico (ns / m / ps / utilização), extraídos do resultado, de modo que a leitura corresponda à curva. Diagramas especializados (RAIM, falsificação, varredura) não recebem sobreposição. Os gráficos continuam sendo <c3/>s de blob autodescritivos — a sobreposição é uma mira transparente + dica por cima, de modo que download/comparação/exportação não sejam afetados. A matemática de coordenadas (amostra mais próxima, cursor→fração do gráfico, análise da polilinha) tem testes unitários (<c4/>, executados no CI).

# text
# c1: web/compare.mjs
# c2: web/app.js
# c3: web/compare.test.mjs
# c4: <img>
seg-1588ae024e5d = <b>Modo de comparação A/B no playground.</b> Fixe qualquer execução como linha de base A, execute um segundo cenário, e os dois são mostrados lado a lado com uma tabela de deltas de figuras de mérito (holdover, RMS/p95 de temporização, disponibilidade) que colore o vencedor por métrica (<c1/>, ligado em <c2/>; lógica de delta com testes unitários em <c3/>, executados no CI). Todos os valores são inseridos como texto e todos os gráficos via <c4/> de blob, de modo que nada de uma cadeia de cenário seja jamais injetado como marcação.

# text
# c1: web/chartdl.mjs
# c2: web/app.js
# c3: kshana-<chart>-v<version>-<scenario-hash>.<ext>
# c4: web/chartdl.test.mjs
seg-6e7a99f8f275 = <b>Botões de download de gráficos (SVG + PNG).</b> Cada gráfico do playground agora tem uma barra "Download SVG / PNG" no tema do site (<c1/>, ligada em <c2/>). O SVG devolve o original fiel e escalável; o PNG rasteriza essa mesma imagem autodescritiva em 2x para apresentações e documentos. Os arquivos são nomeados com a sua proveniência — <c3/> — e a lógica de nome/tamanho de arquivo tem testes unitários (<c4/>, executados no CI).

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: src/igrf_data.rs
seg-4cb87e7dc892 = <b>Modelo geomagnético de campo principal IGRF-14 (<c1/>).</b> O campo padrão da IAGA em harmônicos esféricos (grau/ordem { "13" }, época { "2025.0" } + variação secular de { "2025" }–{ "2030" }; coeficientes gerados por máquina a partir do <c2/> oficial por <c3/> em <c4/>, reproduzíveis bit a bit). Uma síntese normalizada de Schmidt devolve o vetor do campo (norte/leste/baixo) e os elementos derivados (declinação, inclinação, intensidade horizontal/total) em qualquer local/data geodésicos, além do polo geomagnético e da intensidade do dipolo — a contrapartida magnética do correspondente de mapa de gravidade para a navegação com PNT alternativo. Validado de forma autocontida: a síntese coincide com o dipolo inclinado exato de forma fechada, o campo analítico completo de grau 13 coincide com uma diferença finita do potencial escalar, o eixo do dipolo reproduz o polo geomagnético conhecido (~{ "80.7" }°N, −{ "72.7" }°E) e a intensidade de ~{ "29.7" } µT, e o campo global é físico.

# text
# c1: src/python.rs
# c2: run
# c3: run_full
# c4: RunOutput
# c5: .json
# c6: .svg
# c7: .summary
# c8: .data()
# c9: run_typed
# c10: scenario_kinds()
# c11: validate_toml()
# c12: kshana.pyi
# c13: py.typed
# c14: docs/PYTHON_API.md
seg-c69d50031da4 = <b>Bindings Python tipados (<c1/>).</b> Além de <c2/>/<c3/>, de cadeia de entrada e saída, o módulo agora expõe uma classe <c4/> tipada (<c5/>, <c6/>, <c7/> e um acessor <c8/> que devolve o resultado já interpretado como um dict nativo do Python — sem reanálise do JSON, pronto para envolver com NumPy), mais <c9/>, <c10/> (lista interpretada de dicts de metadados) e <c11/> (uma lista de mensagens de erro que não lança exceção). Inclui um stub de tipos PEP { "561" } (<c12/> + <c13/>) para mypy/pyright/editores e um guia rápido em <c14/>. As funções existentes permanecem inalteradas.

# text
# c1: src/orbit.rs
# c2: Frame
# c3: position_in_frame
# c4: state_gcrs
# c5: Propagator
# c6: gcrs_to_itrs
# c7: state_gcrs
seg-fb65ac14344c = <b>Referenciais de saída de primeira classe para propagadores (enum <c2/> de <c1/> + <c3/> + <c4/>).</b> Qualquer <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) agora pode emitir a sua posição em TEME, <b>GCRS</b> (≈ J2000) ou <b>ITRS</b> (fixo à Terra) — TEME nativo, GCRS por meio da redução TEME→GCRS validada, ITRS encadeando essa redução à rotação CIO IAU 2006/2000A <c6/> — e o seu estado GCRS completo (posição + velocidade) por meio de <c7/>. A saída inercial da data deixa de ser só TEME.

# text
# c1: src/cio.rs
# c2: X, Y
# c3: eraNut06a
# c4: s
# c5: eraS06
# c6: tools/gen_s06.py
# c7: src/cio_s06_data.rs
# c8: eraC2ixys
# c9: eraEra00
# c10: eraC2tcio
# c11: eraXys06a
# c12: eraC2ixys
# c13: eraEra00
seg-8f596733c439 = <b>Redução celeste-terrestre IAU 2006/2000A baseada em CIO (<c1/>).</b> A cadeia GCRS↔CIRS↔ITRS moderna, sem equinócio: as coordenadas do CIP <c2/> lidas da matriz de viés-precessão-nutação IAU 2006/2000A (reutilizando a precessão FW validada + a nutação 2000A com o ajuste P03 de <c3/>), a série de 66 termos do localizador do CIO <c4/> (<c5/>, gerada por máquina a partir da referência do ERFA por <c6/> em <c7/>, reproduzível bit a bit), a matriz GCRS→CIRS (<c8/>), o ângulo de rotação da Terra (<c9/>) e a rotação completa GCRS→ITRS (<c10/>, composta com o movimento polar do IERS existente). Validada <b>bit a bit</b> em relação ao <c11/> publicado (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 em JD_TT { "2453736.5" }) e aos vetores de teste de <c12/> e <c13/>. Mostra-se que a cadeia CIO e a redução TEME legada por equinócio/GMST-1982 concordam, a menos da diferença documentada de convenção de tempo sideral de ≈{ "2" }·(equação dos equinócios). Esta é a redução rigorosa que o caminho de equinócio/GMST aproximava.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_matrix_2000a
# c4: nut00a
# c5: tools/gen_nut00a.py
# c6: src/nutation_iau2000a_data.rs
# c7: eraNut00a
# c8: nutation_matrix_2000a
seg-32e6d8dfcebc = <b>Série completa de nutação IAU 2000A (<c1/> <c2/>, <c3/>).</b> O modelo MHB2000 completo — { "678" } termos luni-solares + { "687" } planetários — com exatidão < { "0.1" } mas, ao lado do truncamento 2000B de 77 termos já existente. As tabelas são geradas por máquina a partir da referência <c4/> da IAU SOFA / ERFA por <c5/> em <c6/> (o gerador reproduz o arquivo versionado bit a bit), e toda a série — tanto os conjuntos de argumentos fundamentais do IERS-2003 e do MHB2000 quanto as longitudes planetárias — é validada <b>bit a bit</b> em relação ao vetor de teste publicado de <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } em JD_TT { "2453736.5" }, a { "1e-13" } rad). A redução TEME→GCRS padrão mantém a série 2000B (~{ "1" } mas, abaixo da simplificação de rotação do referencial de velocidade da cadeia); <c8/> expõe a matriz da data de < { "0.1" } mas para quem a necessitar.

# text
# c1: kind = "lunar-integrity"
# c2: scenarios/lunanet-araim.toml
# c3: src/lunar.rs
# c4: LunarScenario
# c5: south_pole_hpl_pass
# c6: LunarReport
seg-35e9e419d2ae = <b>Cenário executável de integridade lunar (<c1/>, <c2/>).</b> Liga a passagem de nível de proteção do polo sul lunar (<c3/> <c4/> → <c5/>) ao executor de cenários, com um <c6/> em JSON e um gráfico SVG de HPL versus tempo, de modo que o caso de integridade cislunar seja alcançável diretamente pela CLI. Ele expõe a lacuna com honestidade: com o σ_URE de LANS de { "30" } m, o HPL do polo sul (≈ { "260" }–{ "450" } m) excede um limite de alerta de { "50" } m ({ "0" } % disponível) — a integridade do PNT lunar ainda não foi atingida.

# text
# c1: src/raim.rs
# c2: src/orbit.rs
# c3: scenarios/araim-gps-galileo.toml
# c4: araim_dual_constellation_availability
# c5: visible_positions_labeled
# c6: IntegrityScenario
# c7: araim_dual
# c8: tests/araim_dual_real_data.rs
seg-1910e8110b43 = <b>Disponibilidade do ARAIM de dupla constelação com TLEs reais de GPS+Galileo e ligação ao executor de cenários (<c1/>, <c2/>, <c3/>).</b> Acrescenta <c4/> (o motor ARAIM avançado — falhas de um único satélite <em>e</em> de toda a constelação — executado sobre uma grade de tempo) e <c5/>, e o liga ao executor <c6/> por meio de um sinalizador <c7/>, de modo que um estudo ARAIM multi-GNSS seja alcançável diretamente a partir do TOML. Um teste com dados reais (<c8/>) sobre instantâneos incluídos de GPS+Galileo do Celestrak de 2026-06-07 mostra que reunir o Galileo eleva a disponibilidade do ARAIM de { "0.21" } para { "0.67" } sob um VAL exigente de { "12" } m ({ "10.5" }→{ "21.8" } satélites à vista), enquanto o modo robusto a falhas de constelação é fundamentalmente limitado com apenas duas constelações — a razão quantitativa pela qual uma integridade robusta de dupla constelação aponta para uma terceira constelação ou para o SBAS. Resíduo honesto: a reprodução numericamente exata da Tabela A-3 da EU ARAIM TN contra uma única época com versão travada, e um registro de fixture no Zenodo.

# text
# c1: src/cr3bp.rs
# c2: cr3bp_accel
# c3: propagate_cr3bp
# c4: jacobi_constant
# c5: lagrange_points
# c6: src/lunar.rs
seg-78ab887a4543 = <b>Problema restrito circular de três corpos (CR3BP) para o sistema Terra–Lua (<c1/>).</b> Um novo núcleo de dinâmica cislunar que os propagadores de dois corpos/SGP4 não conseguem oferecer: equações de movimento no referencial rotativo (<c2/>), um propagador RK4 (<c3/>), a integral da constante de Jacobi (<c4/>) e os cinco pontos de Lagrange (<c5/>). Validado em relação a âncoras de forma fechada / publicadas: os pontos colineares Terra–Lua (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), o L4/L5 equilátero exato = (½−μ, ±√3/2, { "0" }), os cinco confirmados como equilíbrios do campo, Jacobi conservada até a precisão do integrador sob propagação, e a força restauradora fora do plano que torna possíveis as órbitas halo/NRHO. Esta é a base para representar uma NRHO real. Resíduo honesto: condições iniciais de NRHO periódica { "9" }:{ "2" } corrigidas diferencialmente, o modelo excêntrico/de efemérides (DE) e a transformação desnormalizada para os referenciais selenocêntricos de <c6/>.

# text
# c1: src/frames.rs
# c2: polar_motion_matrix
# c3: iauPom00
# c4: W = Rx(−y_p)·Ry(−x_p)·Rz(s′)
# c5: s′
# c6: pef_to_itrf
# c7: itrf_to_pef
# c8: teme_to_itrf
# c9: teme_to_ecef
# c10: x_p
# c11: y_p
seg-14f4572144f3 = <b>Movimento polar do IERS e a redução TEME→ITRF (<c1/>).</b> Acrescenta <c2/> (<c3/> do SOFA: <c4/> com o localizador do TIO <c5/>), <c6/> / <c7/> e <c8/> — a rotação TEME→PEF baseada em GMST seguida do movimento polar — completando uma posição fixa à Terra com precisão ITRF sobre o <c9/> apenas com GMST (o movimento polar é um efeito de dezenas de metros no raio orbital). <c10/>/<c11/> são grandezas observadas do IERS fornecidas por quem chama. Resíduo honesto: uma cadeia totalmente baseada em CIO (X, Y, s) e uma verificação cruzada numérica ANISE/SPICE de <{ "10" } m continuam como desdobramentos futuros.

# text
# c1: src/inertial/quantum_imu.rs
# c2: docs/QUANTUM.md
# c3: Φ_cor = 2·k_eff·v_⊥·Ω·T²
# c4: coriolis_phase
# c5: 2·Ω×v
# c6: coriolis_accel_bias
# c7: Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: docs/QUANTUM.md
seg-b5e84faf880c = <b>Sistemáticos do interferômetro de átomos frios, varredura de deriva e uma validação com um dispositivo publicado (<c1/>, <c2/>).</b> Estende o acelerômetro CAI de primeiros princípios com os dois principais sistemáticos determinísticos: a fase de <b>Coriolis/rotação</b> <c3/> (<c4/>, com o viés de aceleração equivalente <c5/> via <c6/>) e a fase de <b>deslocamento de luz AC-Stark</b> <c7/> (<c8/>, que se cancela pela simetria π/2–π–π/2 para um deslocamento constante). Acrescenta <c9/> (deriva de posição por navegação inercial estimada em função do tempo de ciclo — o núcleo de uma comparação quântico-versus-clássico) e um teste de validação em relação ao gravímetro móvel de Freier et al. { "2016" } (arXiv:{ "1512.05660" }): o piso modelado de ruído de projeção quântica fica abaixo, e a ~{ "2" } ordens de grandeza, do ruído de curto prazo publicado de { "96" } nm/s²/√Hz. <c10/> atualizado. Resíduo honesto: sistemáticos de frente de onda/apontamento do feixe, resolução da ambiguidade de franjas, a reprodução exata do teste em voo do CARIOQA-PMP / Boeing-AOSense (que exige PSDs de plataforma publicadas) e uma predefinição no playground em JS.

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: selenographic_to_mcmf
# c6: south_pole_hpl_pass
seg-f32829ed9cf1 = <b>Redução de referenciais cislunar e uma passagem de integridade do polo sul lunar (<c1/>).</b> Estende o motor ARAIM lunar com a rotação MCI↔MCMF (inercial centrado na Lua ↔ fixo à Lua) (<c2/> / <c3/>, um modelo simplificado de rotação média à taxa sideral lunar), latitude/longitude/altitude selenográficas (<c4/> / <c5/>) e <c6/> — um receptor pousado na região Artemis contra um conjunto representativo de retransmissores LunaNet ao longo de uma passagem de { "24" } h, que quantifica com honestidade a lacuna de integridade: com o σ_URE de LANS nominal de { "30" } m, o nível de proteção é finito, mas excede um limite de alerta de operações de superfície de { "50" } m. Resíduo honesto: as efemérides precisas da NRHO LANS (uma órbita cislunar de 3 corpos), a libração física / o polo lunar em precessão (DE421/SPICE) e um cenário TOML da LunaNet continuam como desdobramentos futuros.

# text
# c1: src/raim.rs
# c2: docs/ARAIM_REFERENCE.md
# c3: IntegritySupportMessage
# c4: .fault_priors()
# c5: .dual_fault_priors()
# c6: araim_raim
# c7: araim_dual_raim
# c8: stanford_svg
# c9: PL = error
# c10: docs/ARAIM_REFERENCE.md
# c11: araim_dual_raim
seg-5ef720855cc4 = <b>Mensagem de suporte de integridade do ARAIM, SVG do diagrama de Stanford e a referência aberta do ARAIM (<c1/>, <c2/>).</b> Acrescenta uma <c3/> explícita (σ_URA / σ_URE / b_nom / P_sat / P_const, com os valores de referência GPS+Galileo do WG-C e conversores <c4/> / <c5/> para os motores <c6/> de falha única e <c7/> de toda a constelação), um renderizador <c8/> autônomo do diagrama de integridade de Stanford (as quatro zonas, a fronteira <c9/>, as guias de limite de alerta, um marcador colorido por época), e <c10/> documentando o algoritmo, a ISM, as hipóteses de falha, o contrato de nível de proteção e o benefício da dupla constelação. Os testes demonstram o ganho de geometria/redundância (reunir uma segunda constelação aperta o HPL de falha única) e a tolerância a falhas de constelação (o usuário de dupla constelação sobrevive à perda de uma constelação inteira; um usuário de constelação única não). Resíduo honesto: reproduzir numericamente a Tabela A-3 da EU ARAIM TN / a figura de disponibilidade de { "15" }–{ "25" } % contra um instantâneo de TLE real com versão travada, um registro de fixture no Zenodo e a ligação de <c11/> ao executor de arquivos de cenário.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000b
# c3: iauNumat
# c4: teme_to_gcrs(r, v, jd_tt)
# c5: gcrs_to_teme
# c6: nut00b
# c7: eraNut00b
# c8: ROADMAP.md
seg-3607eb34acd9 = <b>Nutação IAU 2000B e a redução inercial completa TEME→GCRS/J2000 (<c1/>).</b> Acrescenta a segunda e a terceira peças de uma verdadeira redução de referencial inercial sobre a precessão IAU { "2006" } já entregue: a série de nutação MHB2000 luni-solar de 77 termos (<c2/>, o truncamento padrão IAU 2000B com exatidão de ~{ "1" } mas) com os argumentos fundamentais de Delaunay e a matriz de nutação <c3/> do SOFA, e a cadeia AIAA-2006-6980 de Vallado, TEME→TOD (equação dos equinócios) → TOD→MOD (nutação) → MOD→GCRS (viés-precessão), exposta como <c4/> / <c5/>. A série, os argumentos e as constantes de unidades são transcritos da referência <c6/> da IAU SOFA / ERFA e validados <b>bit a bit</b> em relação ao vetor de teste publicado de <c7/> (Δψ, Δε a { "1e-13" } rad). Resíduo honesto: a série completa IAU 2000A de 678 termos (<{ "0.1" } mas), uma verificação cruzada numérica ANISE/SPICE de <{ "10" } m e o movimento polar continuam como desdobramentos futuros (veja <c8/>).

# text
seg-d9b5e459f6eb = Esta versão traz o primeiro <b>propagador de órbita não analítico</b> do Kshana — um integrador de Cowell com um modelo de forças hierárquico de seis perturbações (dois corpos + zonal J2–J6 + terceiro corpo Sol/Lua conduzido pela época + pressão de radiação solar com sombra cônica de umbra/penumbra + arrasto atmosférico + a correção relativística pós-newtoniana de Schwarzschild) conduzido por uma escolha de dois integradores adaptativos (RK4 com duplicação de passo e o par embutido de Dormand–Prince RK5({ "4" })) — ao lado de uma camada de manobras / projeto de trajetórias (queimas impulsivas e finitas, um resolvedor de Lambert de Izzo e uma varredura porkchop), uma camada de PNT alternativo por correspondência de mapa de gravidade que recupera uma trajetória de 60 minutos sem GPS a menos de { "500" } m, um pipeline de determinação de órbita em lote + sequencial e um UKF GNSS/INS fortemente acoplado completo de 17 estados com navegação inercial estimada quântica CAI. Toda capacidade numérica é fixada contra a verdade analítica ou uma forma fechada deduzida à mão; as perturbações desativadas por padrão deixam as referências de reprodutibilidade (goldens) já lançadas intactas.

# text
# c1: forces::relativistic_accel
# c2: propagator::ForceModel::relativity
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: (r, v)
# c6: accel_rv
# c7: 3μ²/(c²r³)·r̂
# c8: ≈1.9·10⁻⁹
# c9: μ/(c²r)
# c10: μ(4μ + 3v²r)/(c²r³)
# c11: β
# c12: γ
seg-aa8d478f5c10 = <b>Correção relativística pós-newtoniana (de Schwarzschild) (<c1/> + <c2/>).</b> Acrescenta a perturbação dominante da relatividade geral em uma órbita próxima da Terra — o principal responsável pelo avanço relativístico do perigeu — na forma <c3/> do IERS / Montenbruck–Gill: <c4/>. Como o arrasto atmosférico, ela é <b>dependente da velocidade</b>, de modo que acompanha o lado direito do integrador <c5/> via [<c6/>], opcional e desativada por padrão. Validada de forma autocontida: em uma órbita circular ela colapsa para a forma fechada <c7/> (puramente radial e <b>para fora</b>, componentes fora do eixo exatamente zero); a sua <b>razão em relação a dois corpos é o <c8/> de livro-texto em LEO</b> (a assinatura de <c9/>); um caso de velocidade radial coincide com o <c10/> simplificado à mão; e no propagador ela <b>perturba a órbita sem dissipá-la</b> — o semieixo maior é conservado a bem menos de um metro/dia, o oposto estrutural do decaimento monótono do arrasto. Por estar desativada por padrão, as referências de reprodutibilidade (goldens) de dois corpos/J2/zonal permanecem intactas. O ajuste de parâmetros PPN (<c11/>,<c12/>) e o termo de arrasto de referencial de Lense–Thirring continuam como desdobramentos futuros.

# text
# c1: forces::conical_shadow
# c2: ν ∈ [0,1]
# c3: a = asin(R☉/d☉)
# c4: b = asin(Rₑ/|r|)
# c5: c
# c6: ν
# c7: c ≥ a+b
# c8: c ≤ b−a
# c9: c ≤ a−b
# c10: srp_accel
# c11: forces::SOLAR_RADIUS
# c12: ν = 1
# c13: ν = 0
# c14: ν
# c15: c = b
# c16: [b−a, b+a]
# c17: 0 < ν < 1
# c18: cylindrical_shadow
seg-043e831224ab = <b>Modelo de sombra cônica de umbra+penumbra (<c1/>), agora usado pela pressão de radiação solar.</b> Atualiza o eclipse binário de cilindro de umbra para um fator suave <c2/>: o Sol e a Terra são modelados como discos de raios angulares aparentes <c3/>, <c4/> com separação aparente dos centros <c5/>, e <c6/> é um menos a fração do disco do Sol ocultada pelo disco da Terra (a área de sobreposição em lente de dois círculos) — Sol pleno para <c7/>, umbra total para <c8/>, anular para <c9/> e uma penumbra contínua entre elas. <c10/> agora o usa, de modo que a força de SRP diminua suavemente ao longo do eclipse em vez de ligar/desligar. Acrescenta o <c11/> nominal da IAU. Validado de forma autocontida: <c12/> em Sol pleno e <c13/> no fundo da umbra (exato), uma <b>penumbra suave e monótona</b> (<c14/> sobe de { "0" } → ~½ em <c15/> → { "1" } ao longo da faixa <c16/>), e a penumbra cônica <b>se estende além do cilindro de umbra</b> (um ponto que o cilindro binário considera totalmente iluminado é <c17/> para o cone). O <c18/> mais simples continua disponível; o escurecimento de limbo solar e a sombra da Terra achatada continuam como desdobramentos futuros.

# text
# c1: integrator::dopri54_step
# c2: integrator::integrate_dopri
# c3: propagator::propagate_dopri
# c4: 0.9·(1/err)^(1/5)
# c5: propagator::propagate_dopri
# c6: y' = y
# c7: e
# c8: propagate_dopri
seg-8d1c16019f3c = <b>Integrador embutido Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Acrescenta o par embutido padrão de tableau de Butcher de Dormand–Prince ({ "1980" }) ao lado do condutor existente de RK4 com duplicação de passo: sete estágios FSAL fornecem uma solução de 5ª ordem e uma estimativa de erro de 4ª ordem a partir de um único conjunto de avaliações ({ "7" } contra { "11" } chamadas de função por passo), uma estimativa de erro local mais barata. O condutor adaptativo reutiliza a mesma norma de erro RMS e o controlador de passo <c4/>, de modo que é uma alternativa direta; <c5/> o expõe no modelo de forças orbital. Validado de forma autocontida: a estimativa de erro embutida é <b>O(h⁵)</b> (reduzir o passo à metade a diminui ~{ "32" }×); o DP5({ "4" }) integra <c6/> até <c7/> e o oscilador harmônico ao longo de { "50" } períodos conservando a energia a <{ "1e-6" }; ele alcança o mesmo ponto final com a mesma tolerância em <b>menos avaliações de função</b> do que a duplicação de passo (sem sacrificar a exatidão); e <c8/> satisfaz a mesma barreira de verdade analítica que o caminho RK4 — <b>submétrico em relação à solução exata de Kepler por variáveis universais ao longo de uma órbita LEO de { "24" } h</b> — enquanto os dois condutores concordam a <{ "1" } m em uma órbita J2..J6 (sem forma fechada). Pares embutidos de ordem superior (RKF7({ "8" }) / DOP853) continuam como desdobramento futuro.

# text
# c1: forces::atmospheric_density
# c2: forces::drag_accel
# c3: propagator::ForceModel::drag
# c4: ρ = ρ0·exp(−(h−h0)/H)
# c5: a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel
# c6: v_rel = v − ωₑ ẑ × r
# c7: forces::EARTH_ROTATION_RATE = 7.2921151467e-5
# c8: ForceModel
# c9: accel_rv(t, r, v)
# c10: f(t,[r;v]) = [v; a(t,r,v)]
# c11: accel_at
# c12: C_D·A/m = 0.02 m²/kg
seg-cca3c00757d6 = <b>Arrasto atmosférico ligado ao propagador como a sua primeira força dependente da velocidade (<c1/> + <c2/> + <c3/>).</b> Acrescenta a atmosfera <b>exponencial por partes da Tabela 8-4 de Vallado</b> <c4/> ({ "28" } faixas do nível do mar até além de { "1000" } km, limitada abaixo da superfície) e o <c5/> quadrático de arrasto contra a <b>atmosfera em corrotação</b> <c6/> (<c7/>). Como o arrasto depende da velocidade, <c8/> ganha um novo <c9/> e o lado direito do integrador agora passa a velocidade (<c10/>); o <c11/> apenas de posição permanece inalterado, de modo que os termos conservativos e as referências de reprodutibilidade (goldens) não são afetados. Validado de forma autocontida: a densidade <b>se ancora no valor de { "1.225" } kg/m³ ao nível do mar</b>, é limitada abaixo da superfície, <b>decresce monotonicamente</b> ao longo da LEO, fica na faixa de média solar de ~{ "1e-12" } kg/m³ a { "400" } km, e a sua <b>altura de escala local recuperada (≈ { "58" } km a { "400" } km)</b> é física; o arrasto <b>opõe-se à velocidade relativa em corrotação</b> na magnitude de LEO de ~{ "2e-6" } m/s² para <c12/>; e — a assinatura principal — o arrasto é <b>dissipativo</b>: uma órbita de { "300" } km perde energia específica <b>monotonicamente</b> e o seu semieixo maior <b>decai de forma limitada, ~km/dia</b>, enquanto a linha de base no vácuo conserva a energia a <{ "1e-9" }. A densidade termosférica NRLMSISE-00 (a cláusula de densidade de arrasto de < { "5" } %) continua como desdobramento futuro.

# text
# c1: forces::srp_accel
# c2: propagator::ForceModel::solar_radiation
# c3: a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂
# c4: forces::cylindrical_shadow
# c5: P☉ = Φ☉/c
# c6: (AU/d)²
# c7: ephem
# c8: epoch_jd_tt + t/86400
# c9: with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)
seg-0d20f02ef85f = <b>Pressão de radiação solar ligada, conduzida pela época, ao modelo de forças do propagador (<c1/> + <c2/>).</b> Acrescenta o <b>modelo SRP de bala de canhão</b> <c3/> com um <b>fator de eclipse de sombra cilíndrica</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): a pressão de radiação <c5/> a partir da irradiância solar total moderna de { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), a queda de fluxo com o inverso do quadrado <c6/> e o empurrão radial <b>para longe do Sol</b>. Ela acompanha o <b>mesmo lado direito conduzido pela época</b> do terceiro corpo, amostrando uma só vez o Sol de <c7/> na época avançada <c8/>, compartilhada entre o terceiro corpo Sol e a SRP. Composável: <c9/>. Validado de forma autocontida em relação a assinaturas deduzidas à mão: a <b>pressão de radiação a 1 UA se fixa no valor de livro-texto de ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; a SRP de um satélite LEO totalmente iluminado é <b>idêntica bit a bit</b> à fórmula da bala de canhão, aponta <b>para longe do Sol</b> e fica na <b>faixa de ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> para cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>dobrar a distância ao Sol divide a magnitude por quatro</b> (inverso do quadrado); a <b>sombra cilíndrica eclipsa apenas o cilindro de umbra</b> (no lado anti-solar <em>e</em> a menos de um raio terrestre da linha Terra–Sol) e resulta em SRP <b>exatamente zero</b> em eclipse; e no propagador a SRP <b>perturba uma órbita LEO em uma quantidade pequena e limitada, que escala ~linearmente com A/m</b> — enquanto um modelo sem perturbações permanece independente do tempo bit a bit, deixando as referências de reprodutibilidade (goldens) de dois corpos/J2/zonal intactas. A umbra/penumbra cônica (ν suave ∈ [{ "0,1" }]), o arrasto atmosférico e a validação cruzada externa com GMAT/Orekit continuam como desdobramentos futuros.

# text
# c1: propagator::ForceModel::third_body
# c2: accel_at
# c3: ephem
# c4: epoch_jd_tt + t/86400
# c5: precession::julian_centuries_tt
# c6: ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)
# c7: third_body_accel
# c8: t = 0
# c9: t = 1 day
seg-d3f819c21660 = <b>Terceiro corpo Sol/Lua conduzido pela época, ligado ao lado direito variável no tempo do propagador (<c1/> / <c2/>).</b> A perturbação de terceiro corpo deixa de ser um termo de força isolado — agora é integrada pelo propagador de Cowell como uma força genuinamente <em>variável no tempo</em>: cada avaliação do lado direito amostra as posições do Sol/da Lua de <c3/> na <b>época avançada <c4/></b> (reutilizando <c5/> para a conversão dia↔século), de modo que os perturbadores se movem ao longo das suas órbitas durante a integração, em vez de ficarem congelados no início. Composável com qualquer modelo de gravidade (<c6/>). Validado de forma autocontida: o termo do Sol no lado direito é <b>idêntico bit a bit</b> a <c7/> avaliado na posição das efemérides naquele instante, tanto em <c8/> quanto em <c9/> (provando exatamente a ligação { "86400" } s ↔ { "1" } dia ↔ 1/36525 de século), o perturbador <b>avança ~{ "2.6" }·10⁹ m/dia</b> entre amostras (não congelado), as <b>magnitudes de maré instantâneas em LEO</b> atingem as faixas de livro-texto de ~{ "5" }·{ "10" }⁻⁷ m/s² (Sol) e ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Lua, ≈ { "2" }× o Sol), cada corpo <b>perturba de forma mensurável a trajetória de um dia, permanecendo limitado</b>, e o mesmo estado inicial propagado em <b>épocas separadas por um quarto de ano resulta em uma trajetória diferente</b> (o eixo de maré gira { "90" }°) — enquanto um modelo sem nenhum dos corpos habilitado é independente do tempo bit a bit, deixando as referências de reprodutibilidade (goldens) de dois corpos/J2/zonal intactas. A exatidão de efemérides de nível DE e a validação cruzada externa com GMAT/Orekit continuam como desdobramentos futuros.

# text
# c1: ephem::moon_position
# c2: §3.3.2
# c3: forces::third_body_accel
seg-0a517f6c4b1b = <b>Efemérides lunares de baixa precisão (<c1/>), completando o par de terceiros corpos Sol/Lua.</b> Acrescenta a série lunar de baixa precisão de Montenbruck & Gill (<c2/>) ao lado do modelo do Sol, de modo que o <c3/>, agnóstico quanto ao corpo, agora possa ser conduzido por qualquer um dos dois astros <b>sem kernel externo DE/SPK</b>. Validado de forma autocontida em relação a assinaturas lunares deduzidas à mão: a distância geocêntrica permanece dentro do <b>envelope real de perigeu/apogeu (~{ "356 500" }–{ "406 700" } km)</b> ao longo de um mês e a sua <b>média mensal recupera o semieixo maior de ~{ "384 400" } km</b>; a <b>latitude eclíptica nunca excede a inclinação orbital lunar de ~{ "5.3" }°</b> (verificada projetando sobre o polo da eclíptica em coordenadas equatoriais, o que valida em conjunto a série de latitude e a rotação da obliquidade); a <b>direção da Lua retorna a menos de { "1" }° após um mês sideral ({ "27.3217" } d)</b> e o seu <b>movimento diário permanece na faixa física de { "12" }–{ "15" }°/dia</b>; e a perturbação de terceiro corpo lunar sobre um satélite LEO tem a <b>magnitude de livro-texto de ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ o dobro da do Sol). A exatidão de posição de nível DE, o arrasto atmosférico e a SRP continuam como desdobramentos futuros.

# text
# c1: forces::third_body_accel
# c2: ephem::sun_position
# c3: a = GM₃·((s−r)/|s−r|³ − s/|s|³)
# c4: ephem
# c5: third_body_potential
seg-8b7025e00dd1 = <b>Gravidade de terceiro corpo (Sol) com efemérides embutidas de baixa precisão (<c1/>, <c2/>).</b> Acrescenta ao modelo de forças a perturbação de terceiro corpo: <c3/> (atração direta menos o termo indireto que o referencial geocêntrico deve subtrair), com a posição do Sol fornecida pela série analítica de baixa precisão de Montenbruck & Gill do novo módulo <c4/> — <b>sem necessidade de kernel externo DE/SPK</b> para uma execução de baixa fidelidade. Validado de forma autocontida: a aceleração <b>coincide com o gradiente exato do seu próprio potencial perturbador</b> (<c5/>), a perturbação <b>se anula no geocentro</b> e tem a <b>magnitude de livro-texto de ~{ "5" }·{ "10" }⁻⁷ m/s² em um satélite LEO</b>, e as efemérides do Sol atingem âncoras J2000 deduzidas à mão — <b>distância do periélio ≈ { "1.471" }·10¹¹ m</b>, <b>declinação ≈ −{ "23" }° perto do solstício de dezembro</b>, um movimento aparente de <b>≈ { "1" }°/dia</b> (≈ { "90" }° por trimestre) e uma distância que permanece dentro do envelope da órbita terrestre de { "0.983" }–{ "1.017" } UA ao longo de um ano inteiro. Entrega a metade de terceiro corpo da etapa do modelo de forças do marco do propagador numérico (a Lua é entregue em um item complementar acima); a exatidão de posição de nível DE, o arrasto atmosférico e a SRP continuam como desdobramentos futuros.

# text
# c1: forces::zonal_accel
# c2: zonal_potential
# c3: J2..J6
# c4: ForceModel::with_zonals_j2_j6()
# c5: R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)
# c6: j2_accel
# c7: [J2]
# c8: J3
# c9: J2
# c10: J4..J6
# c11: z → −z
seg-99fd6ae1ea09 = <b>Modelo de forças de harmônicos zonais J2–J6 (<c1/> / <c2/>).</b> Estende o modelo de forças do propagador de Cowell além do J2, até o campo zonal completo da Terra no grau { "6" } (os <c3/> não normalizados padrão publicados do EGM-96), ligado ao propagador como <c4/>. A aceleração é o <b>gradiente analítico exato</b> do potencial perturbador zonal <c5/> (polinômios de Legendre por recorrência ascendente), validada de três maneiras independentes: ela <b>se reduz, à precisão de máquina, ao <c6/> validado com 666 vetores</b> quando restrita a <c7/>; ela <b>coincide com o gradiente numérico do seu próprio potencial</b> em todo o campo J2..J6 (a verificação de referência de ouro para campos conservativos); e os termos ímpares <c8/> versus pares <c9/>/<c10/> exibem a sua <b>(anti)simetria norte–sul característica</b> sob <c11/> — a assimetria em forma de pera. Uma órbita J2..J6 propagada conserva a energia total (cinética + central + potencial zonal) a ~{ "1e-8" } ao longo de um dia e perturba a órbita só com J2 em uma quantidade pequena, diferente de zero. Isto entrega o passo 2 ("harmônicos zonais J2–J6") do marco do propagador numérico; o campo tesseral EGM de alto grau, o arrasto, a SRP, o terceiro corpo e a validação cruzada externa com GMAT/Orekit continuam como desdobramentos futuros.

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: f(t,[r;v]) = [v; a(r)]
# c5: ForceModel
# c6: j2_secular_rates
# c7: solve_kepler_checked
# c8: Err
# c9: e = 0.999
seg-59f0ba5a6269 = <b>Propagador de órbita numérico (de Cowell) (<c1/>).</b> O primeiro propagador <b>não analítico</b> do Kshana (o restante da pilha orbital é o SGP4/SDP4 analítico): liga o modelo de forças de dois corpos + J2 (<c2/>) ao condutor RK4 adaptativo com duplicação de passo (<c3/>) como <c4/>, com uma chave <c5/>. Validado em relação a uma <b>verdade analítica mais forte do que seria uma ferramenta numérica cruzada</b>: a órbita não perturbada reproduz a <b>solução exata de Kepler por variáveis universais a nível submétrico ao longo de uma órbita LEO de 24 horas</b> (uma barreira mais estrita do que o "contra uma referência numérica < { "10" } m" que o marco enuncia), a energia específica e o momento angular se conservam a ~{ "1e-9" } relativo, e a regressão nodal por J2 reproduz o <c6/> de forma fechada, pela teoria de primeira ordem (dentro de { "2" } %, o resíduo O(J2²)). Também acrescenta <c7/>, um resolvedor de Newton para a equação de Kepler que <b>devolve <c8/> em vez de uma resposta silenciosamente errada</b> quando não converge dentro de um orçamento limitado de iterações (o caso próximo do perigeu, <c9/>). Escopo honesto: o modelo de forças é apenas de dois corpos + J2 — o campo tesseral EGM de alto grau ({ "200" }×{ "200" } + carregador), o arrasto (NRLMSISE-00), a SRP, as forças de terceiro corpo e uma validação cruzada externa com GMAT/Orekit continuam como desdobramentos futuros.

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
# c3: docs/CAPABILITY.md
seg-d4c7c29f09d1 = <b>Correspondência de mapa de gravidade sem GPS por 60 minutos a < { "500" } m (<c1/>).</b> Aprofunda a camada de PNT alternativo até a meta de validação <em>Quantum Wayfarer</em> do ESA NAVISP: um veículo percorre uma trajetória de ~{ "700" } km durante uma interrupção total de GNSS de uma hora — com a sua solução inercial derivando até <b>≈ { "70" } km</b> — e um gravímetro de átomos frios mais um correspondente de partículas/grade <b>hierárquico, de grosseiro a fino</b>, recupera a deriva constante do INS até <b>≈ { "145" } m</b> (< { "500" } m), um corte de > { "480" }×. O piso real de ruído branco do gravímetro é injetado como uma sequência <b>determinística com semente</b>, de modo que o correspondente nunca recebe uma verdade sem ruído e, ainda assim, a execução é exatamente reprodutível (verificada idêntica bit a bit e estável a alguns metros entre realizações de ruído). Um teste de nível de regressão mostra que o refinamento é <em>necessário</em> — uma única grade grosseira estagna em ~{ "2" } km, e apenas o refinamento em três estágios rompe a barreira de { "500" } m. Novo cenário versionado <c2/>. A linha <c3/> permanece, com honestidade, <b>parcial</b> (ainda sem mapa EGM2008 incluído), com a sua evidência atualizada para o resultado de 60 min a < { "500" } m. O escopo honesto permanece inalterado: campo de harmônicos esféricos de baixo grau + mascons sintéticos; um Monte Carlo sobre realizações de erro de representação do mapa é um desdobramento futuro.

# text
# c1: docs/CLAIMS-VS-REALITY.md
# c2: tests/no_overclaims.rs
# c3: OC-0
# c4: OC-13
# c5: OC-0
# c6: OC-2
# c7: OC-7
# c8: OC-8
# c9: README
# c10: CAPABILITY
# c11: GLOSSARY
# c12: web/
seg-4262a99328bb = <b>Registro de afirmações excessivas + proteção contra regressão (<c1/>, <c2/>).</b> Encerra a trilha de honestidade/retirada de afirmações: as quatorze afirmações excessivas que uma auditoria anterior catalogou (<c3/>…<c4/>) agora estão todas GREEN — as afirmações fortes (<c5/> Kalman acoplado de relógio+posição, <c6/> jamming J/S→C/N₀→perda de travamento, <c7/> física CAI de Mach–Zehnder, <c8/> HPL/VPL do ARAIM) foram <b>substituídas por capacidades entregues e testadas</b>, e não por uma redação suavizada, e as demais linhas tiveram a afirmação retirada para corresponder ao código. Um novo teste de CI examina as superfícies públicas em vigor (<c9/>, <c10/>, <c11/>, <c12/>) e falha se qualquer expressão simples de afirmação excessiva já retirada reaparecer sem ressalva, de modo que uma linha GREEN não possa regredir silenciosamente. A FoM de "integridade" por execução continua rotulada com honestidade como <em>autoconsistência do filtro</em> (não integridade de aviação); o HPL/VPL real do ARAIM é exibido separadamente, de modo que os dois nunca sejam confundidos.

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: P̄₁₁=√3·cosφ
# c4: P̄₂₀=(√5/2)(3sin²φ−1)
# c5: P̄₂₂=(√15/2)cos²φ
# c6: mapmatch
# c7: particle_filter
# c8: scenarios/gravity-map-nav.toml
# c9: kind=
# c10: docs/CAPABILITY.md
seg-27da62a7ff63 = <b>Navegação por correspondência de mapa de gravidade (PNT alternativo sem GPS).</b> O novo <c1/> acrescenta a camada de capacidade de PNT alternativo que os estudos de correspondência de mapa de gravidade <em>Quantum Wayfarer</em> / QT-CCI do ESA NAVISP exigem: um <b>modelo de medição de gravímetro</b> de átomos frios cujo piso de ruído branco é derivado da ASD do acelerômetro CAI (<c2/>); um <b>campo de anomalia de gravidade em harmônicos esféricos</b> de baixo grau, totalmente normalizado (validado em relação às funções de Legendre de forma fechada <c3/>, <c4/>, <c5/> e a uma anomalia de termo único deduzida à mão, de { "1.897" } mGal), mais <b>mascons</b> sintéticos para as feições locais de alto grau; e um <b>filtro de partículas de correspondência de mapa de gravidade</b> (compondo <c6/> + <c7/>) que recupera uma trajetória sem GPS a partir da sequência de anomalias que ela atravessa. Um benchmark NAVISP versionado (<c8/>) reduz uma deriva inercial livre de ~{ "73" } km a alguns km. Escopo honesto: o Kshana <b>não</b> inclui o conjunto completo de coeficientes EGM2008 de { "2190" }° — o campo é de baixo grau + mascons, e não um mapa real de alta resolução; o carregador EGM/EIGEN, o mapa magnético, o SLAM auxiliado por terreno e a ligação de <c9/> ao motor de cenários com um gráfico SVG de deriva continuam como desdobramentos futuros. <c10/> "Gravity-map / alt-PNT navigation" → <b>parcial</b>.

# text
# c1: src/maneuver.rs
# c2: r1
# c3: r2
# c4: v1
# c5: v2
# c6: r2
seg-d028a2db7837 = <b>Modelagem de manobras e cabeça de ponte de projeto de trajetórias.</b> O novo <c1/> acrescenta a primeira camada de projeto de trajetórias acima do SGP4: nós de ΔV impulsivos que aplicam uma descontinuidade de velocidade e propagam adiante uma covariância { "6" }×{ "6" } (queima determinística ⇒ transição de estado identidade; a covariância do erro de execução gira do referencial da queima — ECI ou LVLH — para o bloco de velocidade), uma integração de queima finita (empuxo constante ao longo de um arco de queima, com a massa como estado) cujo ΔV alcançado é conferido com a equação do foguete de <b>Tsiolkovsky</b> de forma fechada a melhor que { "0.01" } %, um resolvedor de <b>Lambert</b> de revolução única de <b>Izzo-2015</b> (<c2/>, <c3/>, tempo de voo ⇒ <c4/>, <c5/>), um <b>propagador de Kepler</b> exato por variáveis universais (verdade de dois corpos) e uma varredura <b>porkchop</b> que mapeia uma grade de época de lançamento × época de chegada para o C3 de partida e o V∞ de chegada, emitida como um array JSON 2-D para renderização de contornos no navegador. A validação é autocontida e mais forte do que uma leitura de tutorial: toda saída de Lambert é percorrida em ida e volta pelo propagador de Kepler (deve pousar de volta em <c6/>), e o mínimo do porkchop é conferido com o piso analítico de C3 da transferência de Hohmann para duas órbitas circulares coplanares. O Kshana posiciona isto como a camada de simulação de desempenho acima do GMAT/Orekit, e não como um substituto (ramos de múltiplas revoluções e uma efeméride planetária real continuam fora do escopo). Dez testes.

# text
# c1: src/fusion/tightly_coupled17.rs
# c2: [position, velocity, attitude-error, accelerometer bias, gyro bias, clock bias, clock drift]
# c3: C ≈ I + [ψ×]
# c4: q_va
# c5: crate::inertial::quantum_imu
seg-cbdd0e56d89f = <b>UKF GNSS/INS fortemente acoplado completo de 17 estados com navegação inercial estimada quântica CAI.</b> O novo <c1/> carrega o estado completo de navegação inercial que um filtro fortemente acoplado estima — <c2/> ({ "17" } estados) — propagado pela mecanização strapdown conduzida pela força específica e pela taxa angular medidas, com a rotação corpo→inercial de pequeno ângulo <c3/>, de modo que o erro de atitude se acople à aceleração horizontal (o acoplamento padrão de inclinação do INS). Durante uma interrupção de GNSS, ele segue por inércia só com a IMU; o ruído de processo do passeio aleatório de velocidade é o <c4/> derivado do acelerômetro de interferômetro de átomos frios (<c5/>), de modo que a deriva da navegação inercial estimada é a limitada pelo sensor quântico — uma interrupção de 120 segundos permanece limitada a algumas centenas de metros, contra os quilômetros que um INS livre de classe de navegação atingiria. A atualização de pseudodistância/taxa de variação da distância passa pelo filtro unscented compartilhado (com α = { "1" } para pesos bem condicionados neste tamanho de estado). Cinco testes: identidade do modelo de medição, integração de velocidade constante com IMU perfeita, auxílio do GNSS, estimação do viés do acelerômetro e o benchmark de interrupção de 120 s limitado pelo CAI.

# text
# c1: CITATION.cff
# c2: ROADMAP.md
seg-087521bb32b7 = <b>Enquadramento honesto do posicionamento quântico.</b> O descritor principal agora é um <b>"simulador de resiliência de PNT com modelos de desempenho de sensores quânticos"</b> de forma consistente no slogan do README, na linha de citação, em <c1/> (título + resumo) e na arte do banner — substituindo a formulação de marketing mais frouxa "simulador de PNT híbrido quântico/clássico". A seção <em>O que é / não é</em> do README ganha uma declaração explícita de escopo <b>"Não é (ainda)"</b> (não é um motor de física de atomointerferometria de primeiros princípios, não é um receptor GNSS/solucionador de PVT, não é uma ferramenta de projeto de missão), e um novo <c2/> de nível superior torna a <b>camada de física quântica um item P2</b> (fase CAI de Mach–Zehnder, ruído de projeção, tensor de vibração), para que os leitores saibam que a física de primeiros princípios está delimitada e a caminho, e não abandonada. Nenhuma mudança de comportamento nem de API.

# text
seg-f8fa36190ec7 = Estudo de compromissos de projeto de constelações: varredura de projetos Walker com frente de Pareto, JSON de tempo de revisita e uma validação submétrica da fórmula de Walker.

# text
# c1: src/walker.rs
# c2: walker_design_sweep
# c3: planes × sats_per_plane
# c4: pareto_front
# c5: WalkerDesignReport::to_json
# c6: i:T/P/F
# c7: R_z(2π/P)
# c8: 2π/S
# c9: gps-ops
# c10: scenarios/orbit-sgp4-gps.toml
seg-31518e92d8cf = <c1/> ganha <c2/>, que executa uma grade <c3/> (por exemplo, um compromisso { "3" }×{ "3" }) a uma inclinação fixa e tabula, por projeto, a fração de cobertura, o PDOP no pior caso e a lacuna de revisita máxima/média; <c4/> sinaliza os projetos não dominados (menos satélites, mais cobertura, PDOP menor, revisita mais curta), e <c5/> serializa as células e a frente de Pareto — campos de tempo de revisita incluídos — como JSON. Uma nova validação fixa o gerador à fórmula <c6/> de Walker: satélites do mesmo slot em planos adjacentes mostram-se mapeáveis um sobre o outro por uma rotação exata <c7/> a <b>menos de { "1" } km ao longo de { "24" } h completas</b> de propagação SGP4 (a respiração de curto período do J2 é de modo comum e se cancela), e os slots no plano confirmam-se espaçados de <c8/> na média. Apoia-se no instantâneo real versionado <c9/> do Celestrak de 2021-07-28 (<c10/>, exercitado pelos testes de cobertura de cenários e de ida e volta do SP3).

# text
# c1: src/timetransfer_adv.rs
# c2: twstft_sagnac
# c3: Δt = 2·A·ω_E/c²
# c4: twstft_sagnac_bipm
# c5: run_twstft
# c6: T_A − T_B
# c7: gnss_common_view_series
# c8: iono_free_combination
# c9: ppp_receiver_clock
# c10: rytov_variance
# c11: fried_parameter
# c12: lognormal_fading
# c13: fit_power_law_psd
# c14: h_α
# c15: ensemble_timescale
seg-71d257587c28 = <b>Transferência avançada de tempo e frequência: TWSTFT, visada comum GNSS, PPP, óptica, ajuste de lei de potência IEEE-1139 e um conjunto de relógios.</b> O novo <c1/> constrói os métodos operacionais de transferência sobre as formas fechadas de Sagnac/visada comum já entregues e as ferramentas de estabilidade de Allan. <c2/> fornece a correção de Sagnac da Transferência de Tempo e Frequência por Satélite em Dois Sentidos (TWSTFT) como a soma de laço de três saltos, igual exatamente à forma fechada do BIPM <c3/> (conferida pela <c4/> independente); <c5/> emite uma série <c6/> de um dia e o seu TDEV. <c7/> faz a diferença simples de duas estações terrestres sintéticas, de modo que o relógio do satélite se cancele. <c8/> + <c9/> são a combinação livre de ionosfera do PPP e a solução do relógio do receptor contra uma verdade de nível SP3 (sintética), cancelando exatamente a ionosfera de primeira ordem. <c10/>, <c11/> e o <c12/> de média unitária modelam a cintilação induzida por turbulência de um enlace óptico em espaço livre. <c13/> é um ajuste completo de mínimos quadrados, de cinco coeficientes <c14/> do IEEE-1139, da curva de variância de Allan (todos os cinco processos de ruído canônicos de uma vez), com o processo dominante informado por década de τ. <c15/> forma uma escala de tempo em papel, ponderada pelo inverso da variância, cujo desvio de Allan fica estritamente abaixo do melhor relógio contribuinte. { "31" } testes unitários; as metas de validação são formas fechadas e verdade sintética — falta ainda uma ingestão real do Circular-T do BIPM / SP3 do IGS.

# text
seg-c3ab93e7324f = Mapas de ionosfera IONEX: analisador de arquivo, interpolação no tempo e mapeamento de obliquidade para raio oblíquo.

# text
# c1: src/ionex.rs
# c2: parse_ionex
# c3: START/END OF TEC MAP
# c4: IonexMap
# c5: TecGrid
# c6: 10^EXPONENT
# c7: interpolate_tec_in_time
# c8: obliquity_factor
# c9: slant_tec
# c10: M(z) = 1/cos z′
# c11: sin z′ = (Rₑ/(Rₑ+H))·sin z
seg-7b94a515ce2b = <c1/> ganha <c2/>, que lê o formato de arquivo IONEX (definição da grade do cabeçalho + blocos <c3/>) para uma sequência de <c4/>s — normalizando a ordenação de latitudes de norte para sul do arquivo em uma <c5/> de passo positivo e escalando os valores por <c6/>. <c7/> mistura dois mapas sucessivos em uma época consultada, e <c8/> / <c9/> mapeiam o TEC vertical sobre um raio oblíquo pelo fator de casca fina de camada única <c10/> (<c11/>). Junto com o modelo de grade já entregue, isso transforma um mapa global de ionosfera do IGS medido em um atraso oblíquo utilizável.

# text
seg-2ed90763cf11 = Projeto de constelações: dimensionamento por ruas de cobertura + comparação de múltiplas constelações.

# text
# c1: src/walker.rs
# c2: min_satellites_streets_of_coverage
# c3: λ
# c4: c
# c5: p = ⌈π/(2c)⌉
# c6: None
# c7: compare_constellations
# c8: pdop_sweep
seg-326e8957bb10 = <c1/> ganha <c2/>, um resolvedor idealizado de número mínimo de satélites por ruas de cobertura — a partir do semiângulo de cobertura <c3/> já entregue e da meia-largura da rua <c4/>, ele dimensiona a constelação quase polar para cobertura global única contínua como <c5/> planos (por exemplo, um plano de 4 satélites em altitude GPS precisa de { "2" } planos, { "8" } satélites), e informa <c6/> quando os satélites são esparsos demais para formar uma rua contínua. <c7/> é a ferramenta de comparação de múltiplas constelações: ela pontua cada projeto Walker nomeado na mesma estação/janela por meio de <c8/> e devolve a sua cobertura / PDOP / tamanho lado a lado. Escopo honesto: a correção de Rider exata na costura, na fronteira de planos contrarrotativos, e um globo de cobertura 3-D são desdobramentos futuros.

# text
seg-90f5ec9ff4ae = Detecção de falsificação (spoofing) em várias camadas: detector de paridade por consistência RAIM + fusão de camadas.

# text
# c1: src/spoof_monitors.rs
# c2: parity_raim_test
# c3: (m−4)
# c4: fuse_spoof_layers
seg-a0e4878bea45 = <c1/> ganha a terceira e última camada de detecção e o estágio de fusão: <c2/> ajusta por mínimos quadrados a solução de posição/relógio a um conjunto redundante de pseudodistâncias e testa a soma dos quadrados dos resíduos ponderados restante contra o seu limiar χ² de <c3/> — sinalizando um <em>subconjunto</em> enviesado de satélites e deixando corretamente invisível ao RAIM um viés de <em>modo comum</em> (absorvido pelo relógio do receptor), sem disfarçá-lo. <c4/> combina as camadas de paridade, AGC e SQM em uma decisão ponderada única, que registra quais camadas dispararam. Um Monte Carlo caracteriza o detector: <b>P_fa ≈ { "0.068" }</b> empírico contra um ponto de projeto de { "0.05" }, com a <b>detecção perdida caindo de { "0.885" } com um viés de falsificação de 2σ para { "0.16" } com 8σ</b>. Escopo honesto: a validação cruzada com vetores de teste de falsificação publicados específicos (Spirent / ION GNSS+) exige esses conjuntos de dados externos e continua como desdobramento futuro.

# text
# c1: src/fusion/coupled.rs
# c2: CoupledPntFilter
seg-2413b3d10f5b = <b>Conjunto de validação de Kalman acoplado versus desacoplado.</b> Um Monte Carlo de 100 ensaios em <c1/> quantifica o valor de carregar a covariância cruzada posição↔relógio: uma linha de base desacoplada fiel, embutida (validada bit a bit em relação ao <c2/> entregue), processa os mesmos dados com os blocos cruzados zerados e, após pseudodistâncias quase degeneradas mais uma fixação só do relógio, o filtro acoplado recupera a posição a <b>{ "2.97" } m RMS contra { "48.8" } m do filtro desacoplado, vencendo em { "97" } de { "100" } ensaios</b> — a fixação do relógio refina a posição apenas por meio da correlação que o pacote desacoplado descarta. Isto completa a suíte de validação de correção do Kalman (forma de Joseph, segurança PSD, consistência NEES/NIS e agora o conjunto do filtro acoplado).

# text
# c1: src/orbit_determination.rs
# c2: [r, v]
# c3: src/forces.rs
# c4: src/integrator.rs
# c5: src/batch_ls.rs
# c6: determine_orbit_batch
# c7: determine_orbit_sequential
seg-804f35695553 = <b>Pipeline de determinação de órbita (em lote + sequencial).</b> Um novo <c1/> recupera o estado orbital <c2/> de um satélite a partir do rastreamento de distância por estações terrestres, compondo três peças já entregues: o modelo de forças de dois corpos + J2 (<c3/>) e o integrador RK4 (<c4/>) propagam um estado candidato ao longo do arco, um modelo de medição de distância prevê cada distância de estação, e o corretor em lote de Gauss–Newton (<c5/>) leva o candidato ao estado de melhor ajuste (<c6/>). A mesma dinâmica e o mesmo modelo de distância também conduzem uma determinação recursiva <b>sequencial</b> sobre o filtro unscented entregue (<c7/>). Quatro testes o validam: previsão de distância ao longo do arco; <b>recuperação em lote a nível submétrico / mm·s⁻¹ a partir de distâncias sem ruído</b>; recuperação em lote a <b>~{ "2" } m com um resíduo pós-ajuste no piso de ruído de { "5" } m</b> (a assinatura de um ajuste de mínimos quadrados consistente); e recuperação sequencial a dezenas de metros. Escopo honesto: medições de taxa de variação da distância/Doppler e de ângulos, uma matriz de transição de estado analítica de J2 e o mascaramento de visibilidade de estações são desdobramentos futuros.

# text
# c1: src/fusion/tightly_coupled.rs
# c2: src/fusion/ukf.rs
# c3: [px,py,pz,vx,vy,vz,b,d]
# c4: pseudorange
# c5: ρ = |p − sᵢ| + b
# c6: range_rate
# c7: ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d
# c8: TightlyCoupled
# c9: propagate
# c10: propagate_orbital
# c11: update_gnss
# c12: src/forces.rs
# c13: src/integrator.rs
# c14: propagate_orbital
seg-0a81039e510c = <b>Navegador UKF GNSS/INS fortemente acoplado.</b> Um novo <c1/> liga o núcleo de Kalman unscented entregue (<c2/>) a um navegador fortemente acoplado funcional sobre o <c3/> de oito estados (posição/velocidade ECEF mais viés e deriva do relógio do receptor em unidades de distância). Ele ingere as <b>medições brutas dos satélites</b> — <c4/> (<c5/>) e <c6/>/Doppler (<c7/>) — em vez de uma posição já formada, de modo que <c8/> (com <c9/>/<c10/>/ <c11/>) continue corrigindo <b>com menos de quatro satélites</b> e siga por inércia durante interrupções do GNSS com a sua dinâmica propagada. Cinco testes o validam de ponta a ponta, incluindo os cenários de aceitação do marco: a geometria de pseudodistância/Doppler contra valores calculados à mão; convergência sem ruído a <b>nível submétrico</b> com cinco satélites; um caso de <b>três satélites</b> convergindo de ~{ "212" } m para ~{ "13" } m, onde nem sequer se consegue formar um PVT instantâneo; uma <b>interrupção de 120 segundos</b> de velocidade constante a menos de { "50" } m; e — a aceitação principal — uma <b>passagem LEO curva de 30 minutos</b> (órbita real de dois corpos + J2) com uma <b>interrupção de GNSS de 120 segundos</b>, mantida a <b>{ "0.77" } m RMS na passagem</b> e <b>{ "2.9" } m no pior caso durante a interrupção</b>. Essa navegação orbital compõe o modelo de forças gravitacionais entregue (<c12/>) e o integrador RK4 (<c13/>) no modelo de processo do UKF (<c14/>), de modo que o filtro siga a curvatura da órbita — o que uma navegação inercial de velocidade constante não consegue (só a curvatura é de ~{ "58" } km em { "120" } s em LEO). Escopo honesto: a navegação inercial orbital usa o modelo de forças de dois corpos + J2, e não a força específica bruta da IMU (para uma plataforma orbital sem propulsão, elas coincidem); incorporar um estado de erro da IMU strapdown e correções iono/tropo dentro do laço são desdobramentos futuros.

# text
# c1: src/mapmatch.rs
# c2: src/particle_filter.rs
# c3: field_likelihood
# c4: map_match_likelihood
# c5: Fn(lat, lon) -> value
# c6: src/ionex.rs
# c7: e^(−½)
seg-792f25a4a1da = <b>Modelo de medição de correspondência de mapa (navegação referenciada ao terreno / à gravidade).</b> Um novo <c1/> fornece o modelo de medição que transforma o filtro de partículas de reamostragem por importância sequencial entregue (<c2/>) em um navegador funcional sem GPS: <c3/> (uma verossimilhança gaussiana de correspondência de campo) e <c4/>, que amostra qualquer campo de referência georreferenciado — elevação do terreno (TRN) ou uma anomalia de gravidade — na posição de uma partícula e a pondera pela concordância com o valor medido pelo veículo. O campo é qualquer amostrador <c5/>, de modo que se compõe com a grade bilinear de <c6/> ou com um closure. Dois testes o fundamentam — a verossimilhança tem pico (={ "1" }) em uma correspondência perfeita e cai para <c7/> a um sigma, e um filtro de partículas sobre um trecho distintivo de terreno sintético recupera a posição verdadeira a menos de { "0.1" }. Escopo honesto: os mapas de referência reais (elevação SRTM, anomalia de gravidade EGM/EIGEN) e os seus carregadores são desdobramentos futuros.

# text
# c1: src/lunar.rs
# c2: σ_URE ≈ 30 m
# c3: P_sat ≈ 1e-4
# c4: lunar_araim
# c5: σ_URE
seg-9240e95a5058 = <b>Integridade do PNT cislunar (ARAIM lunar).</b> Um novo <c1/> aplica o motor ARAIM MHSS do lado da Terra a um serviço de navegação lunar no estilo LunaNet com os parâmetros lunares (<c2/> contra { "0.6" } m do GPS, <c3/>): constantes lunares, uma base selenocêntrica Leste/Norte/Cima e um auxiliar de geometria do céu, e <c4/> (HPL/VPL). Três testes o fundamentam — a base selenocêntrica ortonormal, a geometria da distância oblíqua e a escala linear exata do nível de proteção com <c5/> (o valor lunar de { "30" } m dá um nível de proteção { "50" }× maior do que a mesma geometria com os { "0.6" } m do GPS — a razão quantitativa pela qual a integridade do PNT lunar é difícil). Escopo honesto: as efemérides precisas da NRHO LANS, o orçamento de erro do sinal no espaço e a redução de referencial MCI↔MCMF são desdobramentos futuros.

# text
# c1: src/jd2.rs
# c2: Jd2
# c3: day
# c4: frac
# c5: [0,1)
# c6: new
# c7: from_parts
# c8: add_seconds
# c9: diff_seconds
# c10: total
# c11: f64
# c12: f64
# c13: f64
seg-4a43e2ff83d7 = <b>Datas julianas de duas partes (de alta precisão).</b> Um novo <c1/> acrescenta <c2/>, uma data juliana dividida em um <c3/> inteiro e uma <c4/> fracionária em <c5/> (a convenção SOFA/hifitime), com <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. As diferenças entre épocas próximas permanecem exatas até o piso de <c11/>, enquanto uma JD de <c12/> único perde ~{ "50" } µs perto de J2000. Quatro testes o fundamentam: a ida e volta, a normalização da fração, a recuperação exata de microssegundos (com a falha do <c13/> único demonstrada ao lado) e a aritmética aditiva/reversível de segundos.

# text
# c1: src/omm.rs
# c2: oem
# c3: OmmFile::from_tle
# c4: BSTAR
# c5: to_omm_kvn
# c6: ndm/omm
seg-8eef92a85711 = <b>Gravador CCSDS OMM (Orbit Mean-Elements Message).</b> Um novo <c1/> complementa o gravador de efemérides <c2/> com a mensagem de elementos médios: <c3/> mapeia os elementos médios SGP4/TLE para as unidades do OMM (movimento médio em rev/dia, ângulos em graus, mais <c4/>), e <c5/> serializa a forma KVN CCSDS 502.0-B-2 da trilha de padrões — de modo que uma órbita do Kshana possa ser consumida por qualquer ferramenta que entenda OMM, em vez de como um TLE sob medida. Dois testes fundamentam a conversão de unidades TLE→OMM (≈ { "15.5" } rev/dia, inclinação de { "51.6" }°, etc.) e a presença das palavras-chave KVN exigidas. Escopo honesto: a forma KVN e o mapeamento de TLE são entregues aqui; a renderização em XML (<c6/>) e uma ida e volta com um analisador de referência são desdobramentos futuros.

# text
# c1: src/particle_filter.rs
# c2: predict
# c3: update
# c4: resample
# c5: effective_sample_size
# c6: ionex
seg-ca2b730b5cc3 = <b>Filtro de partículas de reamostragem por importância sequencial.</b> Um novo <c1/> acrescenta o estimador não linear e não gaussiano por trás da navegação auxiliada por mapa e sem GPS (referenciada ao terreno ou por correspondência de mapa de gravidade): <c2/> (propaga as partículas pela dinâmica + ruído de processo gaussiano), <c3/> (repondera por uma verossimilhança de medição por partícula), <c4/> sistemático, o monitor de degeneração <c5/> e a estimativa por média ponderada. Seis testes fundamentam exatamente o núcleo determinístico — ESS abrangendo { "1" }…N, a reamostragem sistemática escolhendo índices em proporção ao peso, a combinação convexa da média ponderada, uma verossimilhança gaussiana puxando a estimativa para a medição, o comportamento de reamostragem para uniforme e o determinismo de predict com semente. Escopo honesto: o motor é entregue aqui; os mapas de referência (elevação SRTM, anomalia de gravidade EGM) e o modelo de medição do mapa são desdobramentos futuros (o amostrador de grade+bilinear de <c6/> serviria igualmente a um mapa de gravidade/terreno).

# text
# c1: src/ionex.rs
# c2: TecGrid
# c3: vtec_at
# c4: Δ = 40.3·TEC/f²
# c5: vtec_to_delay_m
# c6: delay_at
# c7: 1 TECU ≈ 0.162 m
# c8: 1/f²
seg-564ad319685e = <b>Mapas de ionosfera TEC no estilo IONEX.</b> Um novo <c1/> acrescenta a alternativa de ionosfera medida ao modelo de Klobuchar transmitido: uma <c2/> (uma grade regular lat/lon de TEC vertical, um mapa global de ionosfera do IGS) com interpolação bilinear em um ponto de perfuração (<c3/>, limitada fora da grade) e o atraso de primeira ordem <c4/> (<c5/>, <c6/>). Quatro testes o fundamentam: <c7/> em L1 com a escala <c8/>, interpolação exata nos nós, pontos médios bilineares com a média dos cantos e consultas fora da grade limitadas à borda. Escopo honesto: a grade e a interpolação são entregues aqui; a leitura do formato de arquivo IONEX, a interpolação no tempo entre mapas e a função de mapeamento oblíquo são desdobramentos futuros.

# text
# c1: src/timegeo.rs
# c2: timetransfer
# c3: sagnac_correction
# c4: Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)
# c5: common_view_offset
seg-26c7b53cbc8c = <b>Correções geométricas de transferência de tempo (Sagnac + visada comum GNSS).</b> Um novo <c1/> acrescenta os dois efeitos determinísticos que uma comparação real de relógios deve considerar, complementando o modelo estocástico bidirecional em <c2/>: <c3/> (<c4/>, o atraso da Terra em rotação — dezenas de ns para linhas de base continentais) e <c5/>, a diferença simples de visada comum GNSS que cancela exatamente o erro do relógio do satélite e recupera o deslocamento entre estações. Três testes os fundamentam em referências exatas: o Sagnac de ≈ { "33" } ns de um quarto de volta equatorial, a antissimetria e os casos radial/polar nulos, e o cancelamento exato do relógio do satélite. Escopo honesto: um orçamento completo de atraso de transponder/hardware do TWSTFT e uma solução de transferência de tempo PPP livre de ionosfera são desdobramentos futuros.

# text
# c1: src/forces.rs
# c2: two_body_accel
# c3: −μ·r/|r|³
# c4: j2_accel
# c5: gravity_accel
# c6: src/integrator.rs
# c7: f(t,[r;v]) = [v; a(r)]
# c8: j2_secular_rates
# c9: Ω̇
# c10: ω̇
# c11: Ṁ
# c12: μ/r²
# c13: ω̇ = 0
# c14: Ω̇ ≈ −5°/day
seg-098e7ea0ee13 = <b>Modelo de forças orbitais (dois corpos + J2).</b> Um novo <c1/> acrescenta o modelo de aceleração que um propagador numérico integra: <c2/> (<c3/>), a perturbação de achatamento <c4/> (a forma fechada em ECI) e <c5/>, que as soma — combine-o com <c6/> como <c7/>. Ele também expõe as <b>taxas seculares</b> analíticas do J2 (<c8/>): a regressão nodal <c9/>, a rotação apsidal <c10/> e a deriva da anomalia média <c11/>. Seis testes fundamentam a física em referências exatas: <c12/> para o termo de dois corpos, a forma fechada do J2 no equador (~{ "10" }⁻³ da magnitude de dois corpos), a <b>inclinação crítica</b> ({ "63.4349" }°) que congela o perigeu (<c13/>), a regressão nodal da ISS (<c14/>) e a deriva para leste de uma órbita retrógrada heliossíncrona. Escopo honesto: apenas dois corpos + J2; J3–J6, arrasto, SRP e terceiro corpo são desdobramentos futuros.

# text
# c1: src/permalink.rs
# c2: +/
# c3: -_
# c4: encode_scenario
# c5: decode_scenario
# c6: ?s=
# c7: encode_permalink
# c8: decode_permalink
# c9: "foobar"
# c10: "Zm9vYmFy"
# c11: +
# c12: /
# c13: =
seg-d5c03ebc5707 = <b>Permalinks compartilháveis de cenários.</b> Um novo <c1/> acrescenta um codec Base64 RFC { "4648" } sem dependências (alfabeto padrão <c2/> com preenchimento e um alfabeto <c3/> seguro para URL, sem preenchimento) e invólucros <c4/> / <c5/>, de modo que um TOML do playground possa ser codificado em um parâmetro de consulta <c6/> e compartilhado como uma URL. Exposto ao navegador como bindings wasm <c7/> / <c8/>. Quatro testes o fundamentam nos vetores canônicos da RFC { "4648" } (<c9/> → <c10/>, etc.), em uma ida e volta de cenário seguro para URL (sem <c11/>/<c12/>/<c13/> para escapar), na rejeição de símbolos inválidos e em uma ida e volta com todos os 256 bytes. Escopo honesto: o codec e os bindings são entregues aqui; a interface do botão Share do playground, o gráfico de várias séries Plotly/D3 e o modo de comparação A/B são desdobramentos futuros.

# text
# c1: src/batch_ls.rs
# c2: gauss_newton
# c3: h(x)
# c4: (HᵀWH)·Δx = HᵀW·(z − h(x))
# c5: a·exp(b·t)
seg-b615fb16d547 = <b>Mínimos quadrados em lote de Gauss–Newton (o corretor diferencial em lote).</b> Um novo <c1/> acrescenta o núcleo de estimação em que se apoia uma <em>determinação de órbita</em> em lote (ou qualquer ajuste de parâmetros): <c2/> linearizam um modelo <c3/> fornecido pelo usuário com um jacobiano por diferenças finitas centrais, formam e resolvem as equações normais ponderadas <c4/> (reutilizando a inversa de matriz testada) e iteram até a convergência com pesos por medição. Quatro testes o fundamentam: um ajuste linear de reta que atinge a solução exata de mínimos quadrados ponderados, um ajuste não linear <c5/> que recupera os parâmetros verdadeiros, uma multilateração de distâncias 3-D que recupera uma posição conhecida a partir de distâncias sem ruído (o sabor da determinação de órbita) e a rejeição de entradas subdeterminadas/incompatíveis. Escopo honesto: este é o motor genérico do corretor; o modelo de medição de distância/taxa de variação da distância/azimute-elevação específico de órbitas, a matriz de transição de estado analítica de J2 e a validação com casos publicados são desdobramentos futuros.

# text
# c1: src/spoof_monitors.rs
# c2: spoof
# c3: combine_power_dbm
# c4: AgcMonitor
# c5: bpsk_autocorr
# c6: SqmMonitor
# c7: 10·log10(N)
# c8: R(τ)=1−|τ|
seg-0ada87934135 = <b>Monitores de falsificação (spoofing) na camada de RF (potência de AGC e SQM).</b> Um novo <c1/> acrescenta dois detectores independentes de falsificação no front end do receptor, que complementam o monitor de falsificação de tempo auxiliado por relógio em <c2/>: um <b>monitor de potência de AGC</b> (soma de potência incoerente <c3/> + <c4/>) que sinaliza o excesso de potência recebida que um transmissor de falsificação acrescenta além de uma margem em dB configurável, e um <b>monitor de qualidade de sinal</b> (autocorrelação triangular de código <c5/> + <c6/>) que sinaliza o desequilíbrio do correlador Early-menos-Late que multicaminho/meaconing/repetição introduz. Quatro testes fundamentam as formas fechadas exatas ({ "3.01" } dB para a duplicação da potência, o agregado <c7/>, a <c8/> triangular e o limiar de alerta Early/Late de { "10" } %). Escopo honesto: o detector completo de falsificação por paridade de consistência RAIM, a fusão em várias camadas das saídas dos monitores e a validação com vetores de falsificação publicados da Spirent/ION GNSS+ são desdobramentos futuros.

# text
# c1: src/integrator.rs
# c2: rk4_step
# c3: y' = f(t, y)
# c4: integrate
# c5: 0.9·(tol/err)^(1/5)
# c6: y' = y → e
# c7: < 1e-9
# c8: NumericalPropagator
seg-b1ff62d88cd2 = <b>Integrador numérico adaptativo de EDOs.</b> Um novo <c1/> acrescenta a primeira peça de um propagador <em>numérico</em> (a propagação orbital do Kshana é, de resto, o SGP4/SDP4 analítico): um passo genérico de Runge–Kutta de quarta ordem (<c2/>) sobre qualquer sistema de primeira ordem <c3/> e um condutor adaptativo (<c4/>) que controla o erro local por <b>duplicação de passo</b> (extrapolação de Richardson) com o controlador de passo padrão <c5/> e a lógica de aceitar/rejeitar. Seis testes o fundamentam em soluções exatas: a exponencial <c6/> a <c7/>, a redução de erro de ~{ "16" }× a cada passo reduzido à metade, que prova a convergência de quarta ordem, a conservação de energia/retorno do oscilador harmônico ao longo de um período completo e o condutor adaptativo atingindo uma tolerância apertada com passos variáveis. Escopo honesto: este é o núcleo do integrador e o seu controle de erro; os tableaux embutidos de Dormand–Prince RK5({ "4" })/RKF7({ "8" }) e o modelo hierárquico de forças orbitais (dois corpos + J2–J6 + arrasto + SRP + terceiro corpo) que o transformam em um <c8/> são desdobramentos futuros.

# text
# c1: src/fusion/ukf.rs
# c2: n
# c3: P⁺ = P⁻ − K S Kᵀ
seg-ca53c62839d8 = <b>Filtro de Kalman unscented (UKF) (de pontos sigma).</b> Um novo <c1/> acrescenta o filtro de Kalman unscented escalado (Julier & Uhlmann; Wan & van der Merwe) como estimador geral de <c2/> estados sobre funções de processo e de medição fornecidas pelo usuário — o estimador de pontos sigma que um navegador GNSS/INS fortemente acoplado usa quando o modelo de pseudodistância/Doppler é fortemente não linear e o jacobiano de um EKF se degrada. Inclui a álgebra linear densa de apoio (fator de Cholesky para a dispersão dos pontos sigma, inversa de Gauss–Jordan para a covariância da inovação) e uma atualização <c3/> livre da forma de Joseph. Seis testes o fixam, os principais explorando a propriedade exata de que, para um modelo <em>linear</em>, a transformação unscented reproduz o filtro de Kalman com precisão numérica (predição, atualização e um ciclo completo de predição+atualização, todos comparados com um KF linear executado à mão, além de uma verificação analítica 1-D da posteriori bayesiana e das identidades de Cholesky/inversa). Escopo honesto: este é o motor do estimador; o navegador GNSS/INS fortemente acoplado de 17 estados, o modelo de medição de pseudodistância/Doppler e o cenário de validação de interrupção continuam como desdobramentos futuros.

# text
# c1: araim_dual_raim
# c2: araim_raim
# c3: P_const
# c4: DualFaultPriors { p_sat, p_const }
# c5: P_HMI
# c6: N + C
# c7: P_const = 0
# c8: araim_raim
# c9: None
seg-da92d32b5715 = <b>Níveis de proteção do ARAIM de dupla constelação.</b> Um novo <c1/> estende o RAIM Avançado de falha única (<c2/>) com o <b>modo de falha em toda a constelação</b> do ARAIM da UE / DO-316: ao lado das hipóteses sem falha e por satélite, cada constelação (rotulada por satélite) contribui com uma hipótese que remove de uma só vez todos os seus satélites, com a priori <c3/> (um novo <c4/>). Cada hipótese acrescenta um termo à mesma soma de integridade MHSS, de modo que VPL/HPL são os menores limites cujo <c5/> total satisfaz o orçamento sobre as falhas sem falha + SV único + por constelação (a divisão de falsos alertas de Bonferroni é sobre todas as <c6/> hipóteses). Com <c7/> o resultado é idêntico bit a bit a <c8/>; um usuário de constelação única recebe <c9/> diante da falha da sua própria constelação (ela não pode ser excluída) — que é exatamente por que a cobertura de dupla constelação importa. Quatro testes cobrem a equivalência, o alargamento do nível de proteção, a indisponibilidade da constelação única e a validação de entradas, reutilizando o mecanismo existente de subsoluções de separação de soluções.

# text
# c1: src/precession.rs
# c2: (γ̄, φ̄, ψ̄, ε̄_A)
# c3: fw_angles
# c4: iauFw2m
# c5: precession_matrix
# c6: gcrs_to_mod
# c7: mod_to_gcrs
# c8: frames
# c9: ε̄ = 84381.406″ = 23.4392794°
# c10: ψ̄ ≈ 5039.998″
# c11: det = +1
# c12: ≈ 1.40°
# c13: ROADMAP.md
seg-d06c5f88282b = <b>Precessão IAU { "2006" } (ângulos de Fukushima–Williams e matriz de viés-precessão).</b> Um novo <c1/> implementa a precessão IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }): os quatro ângulos de Fukushima–Williams <c2/> como polinômios em séculos julianos TT (<c3/>) e a matriz de rotação de viés-precessão GCRS→média da data construída a partir deles pela construção <c4/> do SOFA (<c5/>, com auxiliares <c6/> / <c7/>). Esta é a primeira peça de referencial inercial sobre a redução <c8/> já existente, baseada em GMST. Oito testes validam em relação a âncoras de forma fechada — a obliquidade média J2000 <c9/>, os termos constantes de ângulos publicados, o acúmulo de precessão geral <c10/> ao longo de um século, a ortonormalidade da matriz e <c11/>, o valor quase identidade (apenas viés do referencial) em J2000 e o ângulo líquido de rotação de <c12/>/século. Escopo honesto (<c13/>): apenas precessão — a nutação IAU 2000A de 678 termos, a cadeia completa TEME→GCRS e uma verificação cruzada numérica SOFA/ANISE de µas/<{ "10" } m são desdobramentos futuros.

# text
seg-14c0a863eef1 = Física de primeiros princípios do acelerômetro de interferômetro de átomos frios (CAI).

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4π/λ
# c3: Φ = k_eff·a·T²
# c4: σ_Φ = 1/(C·√N)
# c5: C(t) = C₀·e^(−t/τ)
# c6: CaiAccelerometer::q_va()
# c7: AccelModel
# c8: |H(ω)| = (4/ω²)sin²(ωT/2)
# c9: accel_transfer_function
# c10: σ_Φ² = k_eff²·S_a·T³/3
# c11: vibration_phase_variance_white
# c12: vibration_phase_variance_band
# c13: beam_axis_projection
# c14: CaiAccelerometer::vibration_phase_noise
# c15: vibration_limited_accel
# c16: k_eff
# c17: √(S_a/(3T))
# c18: k_eff ≈ 1.61×10⁷
# c19: Φ(1 g) ≈ 1.58×10⁴ rad
# c20: σ_a ≈ 0.13 µg
# c21: 1/T²
# c22: 1/√N
# c23: T³
# c24: docs/QUANTUM.md
seg-408fc6feb284 = <c1/> modela um interferômetro atômico Mach–Zehnder de três pulsos a partir de primeiros princípios, em vez de uma folha de dados: vetor de onda efetivo <c2/>, fase do interferômetro <c3/>, ruído de projeção quântica (de disparo) <c4/>, sensibilidade de aceleração por disparo, decaimento do contraste <c5/> e — o ponto central — <c6/>, que <b>deriva</b> a PSD de aceleração branca que o <c7/> clássico já consome a partir do número de átomos, do tempo de interrogação e do contraste. O modelo agora também cobre o <b>acoplamento de vibração</b> — o termo dominante em dispositivos reais: a função de transferência aceleração→fase do interferômetro <c8/> (<c9/>), a variância de fase para PSD branca <c10/> (<c11/>, com uma verificação cruzada numérica por integral de banda <c12/>), a <c13/> de posto 1 ao longo do feixe, e <c14/> / <c15/> (esta última reduzindo-se ao piso <c17/> independente de <c16/>). Onze testes verificam a física à mão (Rb-87 <c18/>, <c19/>, o piso de ruído de disparo de <c20/>/disparo contra o piso de vibração de ≈ { "5.9" } µg, as leis de escala <c21/>, <c22/> e <c23/>). Escopo honesto em <c24/>: isto abrange o piso de ruído de projeção e o regime limitado por vibração acima dele; o ruído de fase do laser, os sistemáticos de Coriolis e de deslocamento de luz e os cenários de validação PHARAO/CARIOQA continuam como desdobramentos futuros.

# text
# c1: ImuKind
# c2: Classical
# c3: QuantumCai
# c4: [cai]
# c5: CaiCfg
# c6: vibration_psd
# c7: quantum_cai
# c8: q_va
# c9: cai
# c10: skip_serializing_if = "Option::is_none"
# c11: Classical
# c12: QuantumCai
seg-ed668459d019 = <b>Acelerômetro quântico CAI ligado ao cenário inercial.</b> Um acelerômetro em um cenário de navegação inercial estimada agora se resolve em um novo <c1/> — <c2/> (o sensor existente com coeficientes de folha de dados) ou <c3/>, quando traz um bloco opcional <c4/> (<c5/>: comprimento de onda, separação de pulsos, número de átomos, contraste, tempo de ciclo e uma <c6/> opcional da plataforma). A PSD do passeio aleatório de velocidade <c8/> de um sensor <c7/> é <b>derivada</b> da física do interferômetro — o piso de ruído de disparo mais, quando se fornece uma PSD de vibração, a contribuição limitada por vibração em quadratura — em vez de um coeficiente fornecido, e a proveniência da execução registra que o ruído é derivado da física. O campo <c9/> é <c10/>, de modo que os cenários existentes o omitem e são serializados de forma idêntica byte a byte (o hash do cenário permanece inalterado). Cinco testes cobrem a derivação, a soma de vibração em quadratura, a seleção <c11/>/<c12/>, a serialização estável por hash e uma execução de ponta a ponta conduzida pelo CAI.

# text
seg-c3978a122010 = Otimizador de projeto de constelações e geometria de ruas de cobertura.

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: MinSatellitesForCoverage
# c6: MaxCoverage
# c7: MinWorstPdop
# c8: coverage_half_angle_rad
# c9: λ = arccos(Re/r·cos ε) − ε
# c10: street_half_width_rad
# c11: cos c = cos λ / cos(π/s)
seg-aae519e71c00 = <c1/> ganha <c2/>, um otimizador de grade sem gradiente que busca no espaço de projeto <c3/> e devolve o melhor projeto Walker sob um <c4/> escolhido — <c5/>, <c6/> ou <c7/> — sobre a varredura de PDOP já validada (um teste confirma que ele devolve o vencedor por força bruta). Mais as formas fechadas analíticas de <b>ruas de cobertura</b> <c8/> (<c9/>) e <c10/> (<c11/>, Rider/Beste), verificadas à mão em relação à geometria de livro-texto e detectando a lacuna de subpopulação. O resolvedor completo de Rider de número mínimo de satélites para cobertura global, um globo 3-D no playground e uma verificação cruzada de DOP com ferramenta externa continuam como desdobramentos futuros.

# text
# c1: kshana <orbit.toml> --export-sp3 out.sp3
# c2: export_sp3 = true
# c3: <scenario>.sp3
# c4: api::export_sp3
# c5: auto_export_sp3
# c6: OrbitClockScenario::to_sp3_string
# c7: epoch
# c8: tests/sp3_export_roundtrip.rs
# c9: gps-ops
seg-7b8468636dea = <b>Exportação de efemérides precisas SP3 pela CLI.</b> Um cenário de órbita/constelação propagado agora pode ser gravado em um arquivo SP3-c: <c1/>, ou <c2/> no cenário grava automaticamente <c3/> (<c4/> / <c5/>, <c6/>, <c7/> opcional). Um teste de ida e volta (<c8/>) propaga o instantâneo real <c9/> do Celestrak, o exporta, o reanalisa e confirma que as posições ECEF recuperadas coincidem com a verdade do SGP4 ao longo de { "24" } h a <b>< { "0.5" } m</b> (bem dentro da tolerância de { "10" } m de nível TLE). O README documenta o papel de interoperabilidade (RINEX → RTKLIB/gLAB, SP3 → Ginan/produtos de órbita precisa).

# text
seg-56c729ba110f = Filtro de Kalman acoplado de relógio+posição (covariância entre blocos).

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-0a424875131d = <c1/> é um único filtro <c2/> empilhado (atualizações na forma de Joseph) cuja medição de <b>pseudodistância</b> <c3/> acopla de fato os blocos de posição e de relógio — ao contrário dos dois filtros independentes de dois estados do pacote de fusão legado, que mantêm a covariância entre blocos exatamente zero. Validado: uma pseudodistância compartilhada torna <c4/> diferente de zero; duas geometrias distintas resolvem em conjunto deslocamentos injetados de posição+relógio que uma única distância não consegue separar; uma <b>fixação só do relógio refina a posição</b> por meio da covariância cruzada (o ganho que filtros desacoplados não conseguem oferecer); e o NEES de Monte Carlo é <b>consistente com χ²({ "4" })</b>. Esta é a realização com 1 grau de liberdade (a dimensionalidade do pacote de fusão); a extensão 3-D de 8 estados e a ligação ao pacote executável são acompanhadas como desdobramentos futuros.

# text
seg-3983794a9584 = <b>Monitoramento de saúde da consistência do filtro de Kalman (NIS/NEES).</b> A atualização da covariância do filtro de relógio de dois estados agora está na <b>forma estabilizada de Joseph</b> `P⁺ = (I−KH)P(I−KH)ᵀ

# text
# c1: , which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked in CI at
# c2: ). A new
# c3: runs a Monte-Carlo consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation², target 1) and **NEES** (normalised estimation error², target 2) against 95% χ² bands, surfaced as a
# c4: block in the clock result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test proves the monitor flips to inconsistent when the process noise is mistuned by ×0.1–×10. Adds a general χ² quantile (
seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, verificado em tabela).

# text
# c1: docs/PROVENANCE.md
# c2: gps-ops
# c3: provenance
seg-f9689061a1d2 = <b><c1/> — uma tabela de proveniência citável.</b> Consolida cada parâmetro de sensor (relógios, inercial, transferência de tempo), modelo físico/algorítmico (órbita, sistemas de tempo, referenciais, iono/tropo, integridade, detecção, jamming, Allan) e conjunto de dados de validação (AIAA 2006-6753, Celestrak <c2/>) com a sua fonte publicada — folha de dados, artigo, ICD ou norma — e um rótulo honesto de maturidade (qualificado para voo / laboratório em solo / meta espacial em hardware de solo). Referenciada na introdução do README e na tabela de Documentação; complementa as cadeias <c3/> por execução que já viajam no JSON de resultado.

# text
# c1: ScenarioKind
# c2: kind
# c3: ScenarioKind::classify
# c4: run_toml
# c5: run_scenario(src) -> Result<RunOutput, KshanaError>
# c6: InvalidInput
# c7: NonConvergence
# c8: Unsupported
# c9: IoError
# c10: kind_tag()
# c11: Scenario
# c12: ExternalPack
# c13: jamming
# c14: list_scenario_kinds()
# c15: list_kinds()
# c16: error_kind()
# c17: docs/ARCHITECTURE.md
seg-55c7b52b5fdb = <b>API tipada de cenários.</b> O despacho agora é feito sobre um enum tipado <c1/>, em vez de um casamento de cadeias brutas de <c2/> (<c3/> + despacho exaustivo), de modo que acrescentar um pacote seja verificado na compilação. Novas superfícies tipadas ao lado do <c4/> inalterado, que devolve cadeia: <c5/> com uma taxonomia estruturada de erros (<c6/> / <c7/> / <c8/> / <c9/>, cada uma com um <c10/> estável); uma trait <c11/> e um ponto de extensão <c12/> (o pacote <c13/> é ligado por meio dele como exemplo resolvido); e introspecção de <c14/> (nome, descrição, campos obrigatórios/opcionais por tipo de cenário). Os bindings Python e WebAssembly ganham <c15/> e <c16/>. Documentado em <c17/>.

# text
seg-2b86391b753e = Constelação GPS real + cobertura do envelope de operação.

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: scripts/fetch_tles.sh
# c5: tests/scenario_coverage.rs
# c6: docs/VALIDATION.md
seg-288f2b1872c8 = <c1/> agora inclui um <b>instantâneo real <c2/> do Celestrak</b> (2021-07-28, { "30" } satélites) em vez de TLEs Walker sintéticos, com <c3/> para que só seja carregado quando todo checksum de TLE for válido; <c4/> documenta a atualização reprodutível e o README credita a fonte de dados abertos. O novo <c5/> exercita cada pacote em ≥{ "5" } variantes de envelope, afirmando saída finita/limitada, confirma que o <b>piso de FM flicker degrada de forma mensurável a navegação inercial de um relógio</b> quando habilitado (agora definido em três cenários entregues) e confirma que o <b>filtro de fusão converge com um viés de acelerômetro realista, diferente de zero</b> (a menos de { "3" }× o caso de viés zerado), fechando a lacuna de realismo de que "a fusão só funciona com vieses zerados". <c6/> ganha uma tabela de Envelope de Operação.

# text
# c1: gnss-sim
# c2: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c3: [iono]
# c4: [tropo]
# c5: gnss_measurements[]
# c6: src/gnss_sim.rs
# c7: scenarios/gnss-sim-raim.toml
seg-f78d7dce7bfa = <b>Simulação de GNSS no domínio das medições (tipo de cenário <c1/>).</b> Um modelo direto no nível da pseudodistância: para cada satélite visível ele sintetiza <c2/> e o Doppler L1, com a ionosfera monofrequência de <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) e a troposfera zenital de <b>Saastamoinen</b> projetada pela função de mapeamento de <b>Niell ({ "1996" })</b> — exposta como blocos TOML <c3/> e <c4/>. Os resíduos alimentam o RAIM instantâneo para HPL/VPL por época, e um array JSON <c5/> carrega a pseudodistância, o Doppler, o C/N₀ e as correções iono/tropo de cada SV. Uma execução sem ruído reproduz a geometria + as correções a nível submilimétrico (teste de CI). Novos <c6/> e <c7/>.

# text
# c1: spoof
# c2: linear_ramp
# c3: step_jump
# c4: meaconing
# c5: replay
# c6: target_pfa
# c7: P_md
# c8: mc_runs
# c9: 1 − P_md
# c10: src/detection.rs
# c11: scenarios/spoof-meaconing.toml
# c12: [attack] rate_ns_per_s
seg-833249802c56 = <b>Detector estocástico de falsificação de tempo (tipo de cenário <c1/>).</b> O pacote de falsificação agora executa um detector real, em vez de uma comparação determinística de rampa contra limite: quatro formas de injeção (<c2/>, <c3/>, <c4/>, <c5/>), um teste de energia / de Neyman–Pearson de χ²₁ bilateral sobre a estatística do monitor auxiliado por relógio, com o limiar definido a partir de um orçamento de falso alarme alvo <c6/>, e a probabilidade de detecção perdida <c7/> informada tanto em forma fechada quanto por Monte Carlo (<c8/> ensaios por hipótese — os dois concordam a alguns ×1/√N). A figura de mérito de Segurança agora é <c9/> na magnitude operacionalmente danosa (de especificação). Novo <c10/> (funções de cauda gaussiana, teste NP/de energia, P_fa/P_md por Monte Carlo) e <c11/>. Retrocompatível: um simples <c12/> ainda é aceito como uma rampa linear.

# text
# c1: spoof
# c2: 1 − min_detectable/threshold
# c3: 1 − P_md
# c4: security
seg-b3f3d2ca8a3d = <b>Definição da FoM de Segurança (tipo de cenário <c1/>):</b> do limite analítico de detectabilidade <c2/> para o <c3/> do detector estocástico. O campo <c4/> do pacote de relógio continua sendo o proxy analítico mais rápido.

# text
seg-ee1268975b2c = Adicionado (continuação)

# text
# c1: jamming
# c2: Q
# c3: availability_under_jamming
# c4: src/jamming.rs
# c5: scenarios/jamming-demo.toml
# c6: docs/CAPABILITY.md
# c7: docs/VALIDATION.md
seg-f71696b7fa20 = <b>Modelo de jamming de RF (tipo de cenário <c1/>).</b> Um modelo de interferência por orçamento de enlace que transforma a potência e a geometria de um jammer em perda de travamento por satélite: a razão jammer-sinal a partir da perda de percurso em espaço livre e do ganho da antena receptora por direção, o C/N₀ efetivo pela equação antijamming padrão (ganho de processamento de despalhamento × o fator de separação espectral <c2/>; Kaplan & Hegarty §{ "9.4" }) e um limiar de rastreamento configurável, pontuado sobre uma constelação Walker como uma figura de mérito <c3/>. Novos <c4/> e <c5/>. O escopo honesto (sem multicaminho, sombreamento de terreno, AGC nem anulação adaptativa) está documentado em <c6/> / <c7/>.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: [base]
# c4: scenarios/sweep-nd-inertial.toml
seg-d4dc36011ea1 = <b>Varredura genérica de parâmetros N-D sobre qualquer tipo de cenário (<c1/>).</b> A varredura N-D anterior era só do pacote de relógio. <c2/> varia chaves TOML pontilhadas de um cenário <c3/> sobre o produto cartesiano dos seus eixos, redespacha cada nó da grade pelo caminho de execução normal e lê uma ou mais métricas do resultado por caminho JSON pontilhado — de modo que funciona para todo pacote (inercial, gnss-ins, integridade, falsificação, …) sem se acoplar ao tipo Rust de cada pacote. Os nós da grade são avaliados em paralelo entre threads do SO em alvos nativos (sem dependência adicional); o wasm recorre ao modo sequencial. Determinística e em ordem de linhas, independentemente do número de threads. Novo exemplo <c4/>.

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
# c3: gnss-ins
seg-1c42e15d65a9 = <b>Modelo determinístico de erro de IMU configurável por TOML no pacote <c1/>.</b> A cadeia de erro strapdown de três eixos (fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) agora é acessível por sensor, a partir de um arquivo de cenário, por meio de um bloco opcional <c2/>, em camadas sobre os vieses constantes de ligação. Omitir o bloco deixa cada sensor como uma fonte pura de viés constante, de modo que as execuções existentes de <c3/> permanecem inalteradas. Isto liga o modelo de erro, antes só de biblioteca, a um pacote executável e a uma figura de mérito.

# text
# c1: tests/fixtures/igs/NOTICE
seg-e035371fbe58 = <b>Validação com dados reais.</b> O analisador de navegação RINEX multi-GNSS, o propagador RK4 do GLONASS e o leitor de SP3 agora são exercitados contra arquivos genuínos do IGS/DLR (um arquivo real de navegação transmitida mista RINEX { "3" } e um produto de órbita IGS SP3-c), e não apenas contra amostras de autoria própria — afirmando conjuntos não vazios de satélites e posições ECEF finitas e de tamanho fisicamente plausível. As fixtures servem apenas a testes (excluídas do crate publicado); veja <c1/>.

# text
# c1: P_HMI
seg-2a807ae8e194 = <b>RAIM na geometria de órbita de referência real.</b> Os núcleos de nível de proteção de instantâneo, de separação de soluções (MHSS) e do ARAIM agora são validados contra a geometria real de órbita precisa do IGS (SP3), e não apenas contra constelações sintéticas: a geometria de linha de visada é construída a partir da primeira época SP3 em uma estação terrestre real, e os testes afirmam níveis de proteção de nível métrico, disponíveis para APV-I, que um viés de pseudodistância de { "60" } m aciona o monitor χ², que a separação de soluções <b>identifica</b> o satélite com falha e que os níveis do ARAIM satisfazem o <c1/> alocado. Fecha a lacuna de validação apenas em geometria sintética (a paridade com o gLAB no domínio do receptor ao longo de um arco RINEX completo continua como item do roteiro — exige uma solução de pseudodistância).

# text
# c1: sweep::nd_sweep_ensemble
# c2: metric_stat
# c3: runs = 1
# c4: nd_sweep
seg-651cc4af4872 = <b>Intervalos de confiança por nó para a varredura de parâmetros N-D</b> (<c1/>). Cada nó da grade da varredura de produto cartesiano N-dimensional agora pode ser avaliado como um conjunto Monte Carlo de sementes, informando a média, os percentis e um IC de bootstrap por percentil de { "95" }% da métrica por nó (para ambos os relógios) — uma varredura estatisticamente honesta, em vez de uma única amostra por nó. Reutiliza a maquinaria de conjunto/bootstrap (<c2/>); determinística; <c3/> se reduz exatamente ao <c4/> de semente única. (Generalizar a varredura para todos os pacotes, entrelaçada com a refatoração de Scenario tipado, e a execução paralela permanecem.)

# text
# c1: tests/navego_imu_crossval.rs
# c2: navego_example_allan.m
# c3: ADEV(1 s) = σ·√dt
# c4: .mat
seg-815eda56aad9 = <b>Validação cruzada do pipeline de ruído de IMU com o NaveGo</b> (<c1/>). Uma verificação cruzada externa com o NaveGo (a toolbox de código aberto de INS/GNSS de R. Gonzalez): reproduz o ciclo completo sintético de <c2/> sobre o perfil de referência publicado do Microstrain 3DM-GX3-35, confirmando que o nosso estimador de ADEV sobreposto recupera os coeficientes de passeio aleatório de velocidade e de ângulo do NaveGo (<c3/>) com erro inferior a { "5" }%, com a inclinação esperada de −1/2 do ruído branco. (O registro STIM300 gravado, de { "40" } MB, em <c4/> não é ingerido: depende de um formato binário.)

# text
seg-b67b3ec240de = Atualização GNSS/INS fortemente acoplada (pseudodistância).

# text
# c1: GnssInsEkf::update_tightly_coupled
# c2: ClosedLoopInsGnss::fuse_tightly_coupled
# c3: tight_coupling
seg-c926dddc5256 = <c1/> (e o invólucro <c2/>) implementam a medição no domínio da distância, antes apenas esboçada: a inovação é a distância prevista da posição do INS a cada satélite em comparação com a pseudodistância medida, com um jacobiano de linha de visada sobre o erro de posição. Como cada satélite é uma medição escalar, o filtro continua corrigindo com <b>menos de quatro satélites</b>, situação em que não existe uma solução PVT fracamente acoplada. Cinco testes cobrem a anulação com quatro satélites, a correção com dois satélites (sem PVT possível), a observabilidade ao longo da linha de visada com um único satélite e a validação das entradas. Apenas pseudodistância; fase da portadora e um estado explícito de relógio do receptor continuam no roteiro. O recurso de cargo <c3/>, não utilizado (que protegia o antigo esboço de erro), foi removido.

# text
# c1: kind = "gnss-ins"
# c2: src/fusion/pack.rs
# c3: closed_loop
# c4: gnss_ins_ekf
# c5: scenarios/gnss-ins.toml
seg-94ebfac3bbc3 = <b>Pacote de cenário GNSS/INS fracamente acoplado (<c1/>, <c2/>).</b> Conecta o navegador strapdown de três eixos e o EKF de estado de erro de 15 estados (<c3/> / <c4/>) a um cenário executável com uma figura de mérito: o EKF disciplina a mecanização com fixos GNSS ruidosos enquanto há cobertura e depois segue por inércia durante a interrupção, substituindo o reset por ajuste à referência verdadeira (truth-snap) do antigo pacote escalar de 1-DOF por uma fusão genuína. O resultado informa a série do erro horizontal fundido, a FoM de posição pontuada (disponibilidade / RMS na interrupção / holdover) e o RMS do INS livre em malha aberta para comparação; um par de IMU quântica/clássica difere apenas no viés verdadeiro. Despachado a partir do ponto de entrada de CLI/Python/wasm, com um exemplo em <c5/>. Enquadramento honesto: apenas fracamente acoplado, uma única trajetória determinística, e o erro fundido durante a interrupção é limitado por um piso imposto pelo erro de atitude na transferência (portanto não se afirma que escale com o viés); as conclusões robustas são que a fusão supera a navegação por estima sem auxílio para um sensor com viés e que um sensor de menor viés tem a melhor navegação inercial sem auxílio.

# text
# c1: src/walker.rs
# c2: walker
# c3: i: T/P/F
# c4: pdop_sweep
# c5: {planes × sats × inclination}
# c6: coverage_revisit
# c7: gps-ops
seg-0a2df01f99d8 = <b>Projeto de constelação sobre o núcleo SGP4 validado (<c1/>).</b> Um novo módulo <c2/> emite um padrão Walker-delta projetado (<c3/>) como <b>elementos médios</b> SGP4, de modo que a constelação sintética se propaga pelo mesmo caminho SGP4 validado em { "4.12" } mm contra os vetores AIAA 2006-6753, e não pelo gerador kepleriano analítico. Sobre ele: <c4/> tabula a cobertura e o PDOP mediano/pior sobre uma grade de projeto <c5/>, e <c6/> informa a fração de cobertura e as lacunas de revisita (pior/média) em um ponto do solo. Validado pelas monotonicidades físicas que um estudo de compromisso deve obedecer (mais satélites ⇒ maior cobertura, menor PDOP, revisita mais curta). À parte, um <b>instantâneo TLE genuíno do Celestrak <c7/></b> (2021-07-28, { "30" } satélites GPS operacionais) é adicionado como fixture apenas de teste, e o caminho de geometria TLE real → SGP4 → ECEF é validado contra ele (toda a camada MEO dentro de { "1" }%, nove satélites todos à vista com PDOP { "1.64" }), junto com os caminhos de dados reais SP3 e RINEX já existentes.

# text
seg-9e051f3725df = Graus de liberdade efetivos específicos do tipo de ruído para os intervalos de confiança de Allan.

# text
# c1: allan::edf_overlapping_adev
# c2: PowerLawNoise
# c3: classify_power_law
# c4: overlapping_adev_curve
# c5: AdevPoint
# c6: noise
# c7: edf
# c8: ci_lo
# c9: ci_hi
seg-2392bec8f0b6 = <c1/> implementa as formas fechadas da Tabela { "5" } do NIST SP { "1065" } (o conjunto simples do Stable32) para os cinco tipos canônicos de ruído de lei de potência (PM branco/flicker, FM branco/flicker, FM de passeio aleatório), substituindo a contagem conservadora sem sobreposição como graus de liberdade do χ². Uma nova enumeração <c2/> e <c3/> identificam o tipo dominante a partir da inclinação do desvio de Allan <b>modificado</b> do registro (o MDEV separa o PM branco do flicker, o que o ADEV não consegue), e <c4/> agora anexa o tipo de ruído identificado, o seu edf e uma faixa de confiança de { "95" }% a cada ponto da curva de ADEV exportada (<c5/> ganha <c6/>/<c7/>/<c8/>/<c9/>, de forma aditiva com padrões do serde). Validado de duas formas: as cinco fórmulas coincidem com valores avaliados à mão até { "1e-12" }, e um conjunto Monte Carlo de { "4" } 000 registros de FM branco confirma que a fórmula prevê o edf qui-quadrado real do estimador com diferença de até { "20" }% (e que supera de forma material a contagem conservadora). Oito novos testes.

# text
seg-df59cc71120f = Modelo estocástico de transferência de tempo bidirecional.

# text
# c1: timetransfer::TwoWayLink
# c2: (m_AB - m_BA)/2
# c3: two_way_offset_estimate
# c4: 1/sqrt(2)
# c5: ClockModel
# c6: sigma_y^2(tau) = q_rw*tau/3
# c7: LinkCfg
# c8: q_wf_s
# c9: q_rw_s
# c10: adev_tau0
# c11: timetransfer
# c12: tau/3
# c13: step()
# c14: q=0
seg-d2add1ce01e1 = <c1/> substitui o amostrador apenas de ruído branco por um modelo fisicamente fundamentado: o atraso de caminho recíproco (modo comum) se cancela na estimativa <c2/> (<c3/>, de modo que duas medições unidirecionais independentes têm média <c4/>), e o resíduo é o atraso diferencial <b>não recíproco</b>, modelado como um processo colorido de FM branco + FM de passeio aleatório (o <c5/> validado), o que dá à série de erro de sincronização uma assinatura de Allan realista (<c6/>) em vez de ruído branco plano. <c7/> ganha <c8/>/<c9/> (padrão do serde { "0" } ⇒ o comportamento antigo apenas de ruído branco, bit a bit), a FoM do enlace informa <c10/> (o desvio de Allan do modelo no passo base), e o cenário/CLI <c11/> a expõe. FoM de referência (golden) refixada. Seis testes derivados à mão (cancelamento de modo comum, o ganho bidirecional de sqrt({ "2" }), a lei <c12/> do RWFM por meio do <c13/> do próprio enlace, equivalência com o comportamento antigo em <c14/>, determinismo e exposição da FoM de ponta a ponta).

# text
seg-6c7a1dd63be0 = Paridade numérica com o Stable32 para os estimadores da família Allan (NBS14).

# text
# c1: tests/allan_reference.rs
seg-adbb47ca87b4 = <c1/> valida os estimadores de ADEV sobreposto, ADEV modificado, desvio de tempo e Hadamard sobreposto contra os desvios de referência do Stable32 para o conjunto de dados canônico <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~p.107) em tau = { "1" }, { "2" } com tolerância relativa de { "1e-4" }; a concordância real é de ~{ "1e-6" }. Isso fixa a matemática dos estimadores contra a implementação de referência de fato, e não apenas contra a autoconsistência analítica dos próprios estimadores. Apenas os números de referência públicos são usados; nenhum código de terceiros.

# text
# c1: integrity
# c2: integrity
# c3: IntegrityScenario
# c4: seed
seg-35b0c0644fa2 = <b>Diagrama de Stanford vertical de integridade exportado pelo cenário <c1/>.</b> O tipo de cenário <c2/> executável agora exporta um diagrama de Stanford(-ESA) vertical junto com o mapa de disponibilidade de HPL/VPL: em cada época protegida, uma amostra de erro de distância sem falha, semeada e reproduzível, é mapeada pela geometria até um erro vertical de posição real e classificada em relação ao VPL e ao limite de alerta vertical (Available / System-Unavailable / Misleading / Hazardously-Misleading). O diagrama (pontos por época + contagens por região) é levado no JSON do resultado, e as contagens de eventos de integridade / HMI, no resumo da CLI, de modo que o classificador de Stanford, antes apenas de biblioteca, passa a ser acessível de ponta a ponta. <c3/> ganha um campo <c4/> (padrão { "0" }) que controla a realização do erro; o próprio mapa de disponibilidade continua dependendo apenas da geometria e independe da semente.

# text
seg-5d76a638ae77 = Orçamento de risco de integridade (P_HMI) do ARAIM para os níveis de proteção.

# text
# c1: raim::araim_raim
# c2: K_md
# c3: (prior, detection threshold, σ)
# c4: araim_protection_level
# c5: araim_integrity_risk
# c6: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c7: P_HMI
seg-449adb9ad6e6 = <c1/> deriva os níveis de proteção horizontal e vertical a partir de um orçamento explícito de risco de integridade, em vez de um multiplicador fixo <c2/>: para a solução com todos os satélites à vista e para cada subsolução com exclusão de um único satélite, constrói o <c3/> por modo em cada eixo, e então <c4/> resolve o menor PL cuja probabilidade somada de informação perigosamente enganosa (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) satisfaz o <c7/> alocado. O resultado informa o risco de integridade que os níveis realmente atingem, de modo que o usuário pode trocar integridade por limite de alerta de forma explícita. Seis testes derivados à mão (formas fechadas de modo único sem falha e com limiar, soma/monotonicidade multimodo, proteção sem falha de ponta a ponta com um orçamento 10⁵× mais restrito elevando o PL, detecção/identificação de falha e o piso de redundância de seis satélites). O MHSS de falha única é a linha de base do ARAIM; falhas simultâneas de subconjuntos de vários SV, o modo de falha de toda a constelação e a validação com o conjunto de dados de referência do gLAB são extensões documentadas.

# text
seg-3e33581644a5 = Compensação de coning/sculling em duas velocidades para a mecanização strapdown.

# text
# c1: inertial::mechanization::coning_sculling_compensate
# c2: NavState::step_increments
# c3: ScalarErrorBudget
# c4: AccelModel
# c5: NavState
seg-c900e193ac29 = <c1/> extrai os termos de coning (atitude) e de rotação+sculling (velocidade) de alta taxa dos incrementos de IMU, ordenados por subintervalo, de uma atualização grosseira, de modo que um <c2/> de taxa moderada reproduz o movimento retificado por vibração que um passo grosseiro sobre as somas brutas deixa escapar. Um teste de validação conduz um ambiente de coning+sculling de { "10" } Hz por { "60" } s e compara a verdade em taxa fina, a integração grosseira ingênua e a integração grosseira com a correção aplicada: a correção reduz o erro de posição em ~{ "18" }× (de metros de deriva ingênua para abaixo de um decímetro), confirmando que os termos de coning/sculling são determinantes. Um alias de tipo <c3/> dá ao antigo <c4/> de 1-DOF o nome do que ele é, distinto do navegador de três eixos <c5/>.

# text
# c1: rinex_obs
# c2: parse_obs
# c3: SYS / # / OBS TYPES
# c4: C1C
# c5: L1C
seg-ceb037e7a6ea = <b>Analisador de arquivos de observação RINEX.</b> O novo módulo <c1/> lê o arquivo de <em>observação</em> RINEX 3.0x / { "4.00" }, as medições reais do receptor, completando o par RINEX junto com o analisador de mensagem de navegação já existente. <c2/> decodifica o cabeçalho (versão/tipo, as listas <c3/> por sistema com linhas de continuação, posição aproximada, intervalo, instante da primeira observação) e os registros por satélite de cada época: pseudodistância, fase da portadora, Doppler e intensidade do sinal, indexados pelo código de observação RINEX { "3" } (<c4/>, <c5/>, …) com os indicadores de perda de travamento (LLI) e de intensidade do sinal (SSI), preservando um campo em branco como ausente e não como zero. Escopo honesto: trata-se da <em>ingestão</em> em formato padrão (entra um registro real de observação de RTKLIB/gLAB/estação IGS, saem medições tipadas), não de um motor de posicionamento: aqui não há solução de pseudodistância, PPP ou RTK.

# text
# c1: oem
# c2: OemFile::from_propagators
# c3: OemFile::to_oem_string
# c4: CCSDS_OEM_VERS
# c5: CREATION_DATE
# c6: ORIGINATOR
# c7: META_START … META_STOP
# c8: OBJECT_NAME
# c9: OBJECT_ID
# c10: CENTER_NAME
# c11: REF_FRAME = TEME
# c12: TIME_SYSTEM = GPS
# c13: START_TIME
# c14: STOP_TIME
# c15: epoch X Y Z X_DOT Y_DOT Z_DOT
# c16: CREATION_DATE
seg-60efb0c44522 = <b>Gravador de CCSDS OEM (Orbit Ephemeris Message).</b> O novo módulo <c1/> exporta uma constelação propagada como uma mensagem CCSDS 502.0-B OEM { "2.0" } válida, o formato de efemérides KVN que GMAT, Orekit, STK e a maioria das ferramentas de dinâmica de voo ingerem. <c2/> amostra o estado inercial (TEME) de cada satélite, posição <b>e</b> velocidade, tomado diretamente do propagador, sem rotação para o referencial fixo à Terra, ao contrário da exportação SP3, em uma grade de tempo, e <c3/> serializa o cabeçalho <c4/>/<c5/>/ <c6/> mais um segmento <c7/> por satélite (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) seguido de suas linhas <c15/> (km, km/s). O <c16/> é fornecido pelo chamador, nunca pelo relógio de parede, de modo que a saída é idêntica byte a byte entre execuções (o contrato de reprodutibilidade). É a contrapartida de efemérides de espaçonave da exportação SP3 de GNSS: uma órbita do Kshana agora pode ser entregue a uma ferramenta de dinâmica de voo em um formato padrão.

# text
seg-f8538db4a17c = Efemérides precisas SP3 como fonte de propagação.

# text
# c1: Sp3File::interpolator
# c2: Sp3Interpolator
# c3: Propagator::Sp3Precise
seg-2cf2e224deb9 = <c1/> constrói um <c2/> por satélite que preenche a posição entre as épocas tabuladas do SP3 com um polinômio de Lagrange de 9ª ordem (prática padrão do IGS) e a rotaciona para o referencial TEME compartilhado, exposto como <c3/>. Um arquivo de órbita precisa de um IGS/centro de análise agora pode alimentar o mesmo pipeline de geometria/visibilidade/integridade que os propagadores de transmissão e analíticos. Ciclo completo validado: uma órbita kepleriana gravada em SP3 e relida pelo interpolador coincide com a original abaixo de um metro nos nós e a < { "100" } m no meio do intervalo. A interpolação do relógio é o próximo passo.

# text
# c1: glonass
# c2: parse_glonass_nav
# c3: R
# c4: J2
# c5: Propagator::Glonass
# c6: rinex
seg-8d50fd42f53c = <b>Efemérides transmitidas do GLONASS (completam a navegação RINEX multi-GNSS).</b> Novo módulo <c1/>: o GLONASS não transmite elementos keplerianos, mas um <b>vetor de estado</b> PZ-90 fixo à Terra (posição, velocidade, aceleração luni-solar). <c2/> lê os registros <c3/> do RINEX { "3" }, e a posição do satélite em qualquer instante é obtida por <b>integração de Runge–Kutta de 4ª ordem</b> das equações de movimento do ICD do GLONASS (gravidade central + <c4/> + termos de Coriolis/centrífugo da rotação da Terra + a aceleração transmitida). Exposto como <c5/>, de modo que os satélites GLONASS fluem pelo pipeline de constelação/visibilidade/integridade junto com os sistemas keplerianos; um único bloco de constelação <c6/> agora pode misturar GPS, Galileo, QZSS, BeiDou e GLONASS.

# text
# c1: E
# c2: J
# c3: C
# c4: G
# c5: Propagator::Rinex
seg-8d88144e3726 = <b>Navegação RINEX multi-GNSS (GPS, Galileo, QZSS, BeiDou).</b> O analisador de navegação RINEX { "3" } agora decodifica registros de Galileo (<c1/>), QZSS (<c2/>) e BeiDou (<c3/>, MEO/IGSO) junto com os de GPS (<c4/>): eles compartilham o formato kepleriano e o algoritmo do usuário, cada um avaliado com a sua própria constante gravitacional e taxa de rotação da Terra (μ de Galileo/BeiDou, Ω̇ₑ de BeiDou). Um arquivo de constelação mista produz todos eles, fluindo pelo pipeline de constelação/visibilidade/integridade como <c5/>. Os satélites geoestacionários do BeiDou usam uma rotação de coordenadas diferente e são ignorados até haver uma fixture de referência contra a qual validar. O percorredor de registros usa contagens de linhas por sistema, corrigindo um erro latente em que registros GLONASS/SBAS de quatro linhas eram ignorados como se tivessem oito linhas. O GLONASS (um modelo de vetor de estado) é o próximo passo.

# text
# c1: sp3
# c2: parse_sp3
# c3: Sp3File
# c4: V
# c5: Sp3File::from_propagators
# c6: to_sp3_string
seg-91a6907acc8d = <b>Leitor e gravador de efemérides precisas SP3-c/d.</b> O novo módulo <c1/> analisa arquivos de órbita precisa SP3 do IGS/centros de análise (<c2/>), o produto de posição/relógio ECEF pós-processado que os motores PPP (Ginan, RTKLIB, gLAB) tratam como referência, em um <c3/> estruturado (cabeçalho, grade de épocas, posição por satélite km→m, relógio µs e velocidade dm/s→m/s para produtos <c4/>), preservando os valores sentinela de dado inválido do SP3. O sentido inverso também é coberto: <c5/> constrói um SP3 a partir de uma constelação propagada (TEME→ECEF por época) e <c6/> o serializa, de modo que órbitas do Kshana podem ser exportadas no formato que as ferramentas PPP externas ingerem, fechando o ciclo de leitura↔escrita. A interpolação de épocas e uma fonte propagadora SP3 são os próximos passos.

# text
# c1: rinex
# c2: tle
# c3: scenarios/orbit-rinex.toml
seg-7d51d1b6f39f = <b>Efemérides transmitidas RINEX como fonte de constelação executável.</b> Uma constelação agora aceita um bloco <c1/> em linha (texto de navegação GPS RINEX { "3" }) junto com a opção <c2/> já existente, de modo que um arquivo de transmissão real conduz um cenário de ponta a ponta pela CLI, por Python ou pelo playground no navegador: entra RINEX, sai geometria PNT. O novo <c3/> demonstra a disponibilidade GNSS e o DOP a partir de oito satélites GPS construídos diretamente dos registros transmitidos. (Apenas GPS LNAV; multi-GNSS e SP3 são os próximos passos.)

# text
# c1: RinexEphemeris
# c2: orbit::Propagator
# c3: Propagator::Rinex
# c4: sv_position_teme
seg-9730835bfc64 = <b>Efemérides transmitidas RINEX como fonte de propagação.</b> Um <c1/> analisado agora se converte em um <c2/> (<c3/>): a posição é a órbita transmitida do IS-GPS-200 rotacionada de ECEF para o referencial inercial TEME compartilhado (<c4/>, com tempo GPS→UT1 correto quanto aos segundos intercalares), a velocidade vem de diferença finita central e há o período orbital kepleriano. Dados reais de transmissão GPS agora podem conduzir o mesmo pipeline de geometria, visibilidade e integridade (RAIM) que os propagadores analíticos SGP4/keplerianos. (Ainda não exposto como tipo de cenário de arquivo RINEX: isso e o multi-GNSS/SP3 são os próximos passos.)

# text
seg-a355e3e52ec3 = <b>DOI de arquivamento.</b> As versões agora são depositadas no Zenodo e recebem um DOI citável.

# text
seg-c6e4556e1ce5 = <b>Documentação.</b> O README foi renovado para nível institucional: uma visão geral de Capacidades de toda a pilha { "v0.9.0" }, uma seção de Versionamento e versões, um cabeçalho limpo com a nova marca e uma linha de situação concisa. Sem alterações no motor.

# text
# c1: integrity
seg-1bfc4e965d2b = Esta versão acrescenta três áreas substanciais de capacidade sobre o substrato SGP4 da { "0.8.0" }: um INS strapdown genuíno de três eixos, um EKF de estado de erro GNSS/INS fracamente acoplado com realimentação em malha fechada, um RAIM real de instantâneo e de separação de soluções (estilo ARAIM) com HPL/VPL e um cenário <c1/> executável, e o primeiro passo da interoperabilidade de formatos GNSS (ingestão de efemérides GPS RINEX-3).

# text
# c1: src/rinex.rs
# c2: parse_nav
# c3: G
# c4: BROADCAST ORBIT
# c5: RinexEphemeris
# c6: D
# c7: parse_d
# c8: D
seg-7fa2f68d436a = <b>Analisador de mensagem de navegação GPS RINEX { "3" } (<c1/>).</b> Primeiro passo rumo à interoperabilidade de formatos GNSS: <c2/> lê um arquivo de navegação RINEX { "3" }.x e decodifica cada registro de efemérides transmitidas de GPS (<c3/>), o bloco de oito linhas SV/época + <c4/>, em um <c5/> de elementos keplerianos e correções de relógio, com nomes de campos e unidades segundo o IS-GPS-200. Trata o formato de ponto flutuante de expoente <c6/> do Fortran (<c7/>) e o layout de colunas de largura fixa; registros de sistemas que não são GPS são ignorados, não rejeitados, de modo que um arquivo misto ainda produz as suas efemérides GPS. Quatro testes: análise de expoente <c8/> (incluindo brancos e erros), um registro completo decodificado contra valores de campo conhecidos com uma verificação de sanidade do semieixo maior do GPS (√A² ≈ { "26 560" } km), omissão de sistemas que não são GPS e o caso de arquivo vazio.

# text
# c1: src/rinex.rs
seg-9c4a068f204c = Efemérides transmitidas do GPS → posição ECEF (<c1/>).

# text
# c1: RinexEphemeris::sv_position_ecef(t_tow)
# c2: μ
# c3: Ω̇ₑ
# c4: tk
seg-5deeec4b8cc9 = <c1/> avalia a posição do satélite fixa à Terra a partir das efemérides analisadas por meio do algoritmo do usuário do IS-GPS-200 §{ "20.3.3.4.3.1" }: solução de Newton da equação de Kepler para a anomalia excêntrica, as correções de segundo harmônico de argumento de latitude / raio / inclinação e a rotação para ECEF considerando a rotação da Terra desde a época de referência (com o <c2/> e o <c3/> do GPS exigidos pela especificação, e uma dobra <c4/> de virada de semana). Três testes: o raio geocêntrico permanece na faixa do GPS (≈ { "26 560" } km), a velocidade fixa à Terra é de ~{ "3.9" } km/s, e avaliar com uma semana completa de diferença reproduz a mesma posição.

# text
# c1: src/rinex.rs
seg-583433389a70 = Viés de relógio do SV GPS com a correção relativística (<c1/>).

# text
# c1: RinexEphemeris::sv_clock_bias_s(t_tow)
# c2: af0 + af1·Δt + af2·Δt²
# c3: Toc
# c4: F·e·√A·sin Ek
# c5: EpochUtc::gps_time_of_week
# c6: TGD
# c7: Propagator
# c8: docs/CAPABILITY.md
seg-957588ed5dff = <c1/> avalia o polinômio de relógio transmitido <c2/> em torno de <c3/> mais o termo relativístico de excentricidade <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Um novo <c5/> converte a época de calendário do registro em tempo-da-semana GPS por aritmética de dia juliano a partir da época GPS (1980-01-06), e a solução de Kepler é compartilhada com a avaliação da posição. Testes: tempo-da-semana GPS para um domingo/terça/sábado (limites de semana) e o viés de relógio dominado por af0, com um termo relativístico presente e limitado. O atraso de grupo L1 <c6/> é exposto, mas deliberadamente não incorporado. Escopo honesto: uma fonte <c7/>, Galileo/BeiDou/GLONASS e SP3 continuam como próximos passos. (<c8/> atualizado para corresponder.)

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: kind = "integrity"
# c4: IntegrityScenario
# c5: (sigma, P_fa, P_md, AL_H, AL_V)
# c6: constellation_raim_availability
# c7: kshana scenarios/integrity-raim.toml
seg-ef971feff16c = <b>Tipo de cenário <c1/> executável pelo usuário (<c2/>).</b> A capacidade de disponibilidade de RAIM agora é acessível pela CLI/TOML como todos os outros pacotes: <c3/> analisa um <c4/> (órbita do usuário, uma ou mais constelações GNSS, máscara de elevação e a configuração de integridade <c5/>), executa <c6/> e emite o mapa de disponibilidade de HPL/VPL por época como JSON, além de um SVG autocontido: níveis de proteção ao longo do tempo contra os limites de alerta, com uma faixa de disponibilidade verde/vermelha. <c7/> grava o JSON, o gráfico e um relatório HTML. O cenário incluído (Walker de 24 satélites, medição de distância de dupla frequência de { "1" } m, limites APV-I) informa disponibilidade de ~{ "95" } %; ele documenta que o RAIM de frequência única não atinge o limite vertical APV-I com uma só constelação, razão pela qual a orientação vertical usa SBAS/dupla frequência/ARAIM. Os testes cobrem o despacho, o JSON do mapa de disponibilidade e o SVG.

# text
# c1: src/raim.rs
# c2: constellation_raim_availability
# c3: Propagator
# c4: serde
# c5: RaimAvailabilityReport
# c6: n_visible
# c7: available
# c8: RaimConfig
# c9: (sigma, P_fa, P_md, AL_H, AL_V)
# c10: raim_availability_epoch
# c11: None
seg-bbe5721c1785 = <b>Disponibilidade de RAIM executável sobre uma constelação (<c1/>).</b> O módulo de integridade não tinha chamador; <c2/> o transforma em um genuíno ponto de entrada de ponta a ponta: em cada época de uma grade de tempo, propaga os satélites visíveis (os mesmos <c3/>s SGP4/keplerianos que o motor usa), calcula os níveis de proteção sem falha e julga a disponibilidade contra os limites de alerta horizontal/vertical, devolvendo um <c5/> serializável por <c4/> (por época <c6/>/HPL/VPL/<c7/> mais a fração de disponibilidade). Um <c8/> agrupa <c9/>, e o <c10/> por época é exposto para chamadores que resolvem a sua própria geometria. Três testes: uma época julgada disponível sob limites APV-I em uma geometria de dez satélites, tornada indisponível por um limite impossivelmente apertado, e níveis <c11/> com menos de cinco satélites; e uma execução de ponta a ponta sobre uma constelação Walker de 24 satélites que produz um mapa de disponibilidade finito e serializa. (Seis satélites, o piso de redundância do RAIM residual, honestamente <em>não</em> atingem o APV-I nem com medição de distância de { "1" } m; a disponibilidade APV-I exige a geometria mais densa que o teste usa.)

# text
# c1: src/raim.rs
# c2: y = x
# c3: Available
# c4: SystemUnavailable
# c5: MisleadingInformation
# c6: HazardouslyMisleadingInformation
# c7: classify_stanford
# c8: StanfordDiagram
# c9: (error, PL)
# c10: serde
# c11: error == PL
seg-91e32e587cb6 = <b>Acumulador do diagrama de integridade de Stanford(-ESA) (<c1/>).</b> A forma padrão de resumir um monitor de integridade ao longo de muitas épocas: representa o erro real de posição (x) contra o nível de proteção (y) e classifica cada época, pela diagonal <c2/> e pelo limite de alerta, em <c3/> (o PL limita o erro, dentro do AL), <c4/> (o PL limita o erro, mas excede o AL: seguro, inutilizável), <c5/> (PL < erro ≤ AL) ou <c6/> (PL < erro e erro > AL: a falha insegura). <c7/> é o classificador puro; <c8/> acumula pontos <c9/> contra um limite de alerta fixo, expondo contagens por região, disponibilidade, totais de eventos de integridade e pontos serializáveis por <c10/> para gráficos/exportação JSON. Quatro testes: todas as regiões (incluindo a fronteira limitada <c11/>), acumulação de contagens/disponibilidade e ciclo completo em JSON. Esta é a superfície de relatório dos níveis de proteção do RAIM; ligá-la ao cenário de constelação e validá-la contra um conjunto de dados público continuam itens do roteiro.

# text
# c1: src/raim.rs
# c2: snapshot_raim
# c3: Δ_k = x_k − x₀
# c4: Cov(x_k) − Cov(x₀)
# c5: PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])
# c6: K_fa = Φ⁻¹(1−P_fa/2)
# c7: K_md = Φ⁻¹(1−P_md)
# c8: normal_cdf
# c9: normal_quantile
# c10: erf(x) = P(½,x²)
# c11: excluded_sv == 2
seg-cdeb3a5a4acf = <b>RAIM de separação de soluções (estilo ARAIM) (<c1/>).</b> Um monitor de integridade de hipóteses múltiplas junto com o <c2/> qui-quadrado de resíduo/paridade já existente. Para a solução de mínimos quadrados com todos os satélites à vista e para cada subsolução com exclusão de um único satélite, forma a separação <c3/>, gaussiana de média zero sem falha, com covariância <c4/> (a identidade de estimadores aninhados, válida porque a solução com todos os satélites à vista é BLUE), e assim <b>detecta</b> uma falha e <b>identifica</b> o satélite defeituoso (aquele cuja exclusão dá a maior separação normalizada). Os níveis de proteção horizontal/vertical seguem a alocação MHSS padrão <c5/>, com <c6/>, <c7/>. Novos <c8/>/<c9/> sem dependências, construídos sobre a gama incompleta regularizada já existente no módulo (<c10/>). Quatro testes derivados à mão: CDF / quantil normal contra valores de manual (Φ({ "1.95996" })={ "0.975" }, a cauda de { "1e-7" } = { "5.1993" }, simetria); uma geometria sem falha que não dispara alarme e produz HPL/VPL finitos e positivos; um viés de 60 σ em um único satélite que é detectado <em>e</em> corretamente identificado (<c11/>); e o piso de redundância de seis satélites. Fecha, no lado do algoritmo, a lacuna P0 da auditoria "integridade tautológica: sem RAIM/HPL/VPL real"; a validação com o conjunto de dados do gLAB e o acumulador do diagrama de Stanford continuam itens do roteiro.

# text
# c1: src/fusion/closed_loop.rs
seg-67e771fc0a48 = Integração GNSS/INS em malha fechada (<c1/>).

# text
# c1: ClosedLoopInsGnss
# c2: mechanization::radii_of_curvature
# c3: NavState::omega_ie_n
# c4: omega_en_n
seg-5aa467783b99 = <c1/> conecta o núcleo do EKF de estado de erro à mecanização strapdown de três eixos: cada amostra de IMU é corrigida pelas estimativas de viés em curso, mecanizada para a frente, e a covariância do EKF é propagada no tempo com o contexto de navegação correspondente; cada fixo de posição/velocidade GNSS forma a inovação INS−GNSS e realimenta a solução com o <b>erro de posição, velocidade, atitude (ψ, como rotação de quatérnio) e os vieses do acelerômetro/giroscópio</b> estimados, zerando a média do estado de erro. Realimentar a atitude (e não apenas os vieses) é necessário para a estabilidade: a inclinação e o viés do acelerômetro formam um par acoplado, de modo que corrigir um sem o outro diverge. INS e GNSS são comparados em um referencial local de plano tangente NED usando os próprios raios de curvatura da mecanização (novo <c2/>; <c3/>/<c4/> expostos). Esta é a substituição honesta do <em>reset por ajuste à referência verdadeira (truth-snap)</em> do pacote híbrido. Três testes: uma malha fechada anulando um erro de posição injetado de { "8" } m / −{ "5" } m até <{ "0.1" } m; uma solução auxiliada que permanece limitada a metros (<{ "6" } m) em uma trajetória de condução enquanto um INS em funcionamento livre diverge além de { "100" } m; e o benchmark marco: o <b>RMS de posição Monte Carlo da solução fundida durante uma interrupção GNSS de { "60" } s supera um navegador por estima em malha aberta sem auxílio em >{ "2" }× (≈{ "4" }× entre sementes)</b>. Limitação honesta documentada no módulo: no modo fracamente acoplado, o viés do acelerômetro e a inclinação são apenas fracamente separáveis (ambos se acoplam pela gravidade), de modo que o valor entregue é o estado limitado e corrigido e uma entrada limpa na interrupção, não uma calibração inercial precisa; dinâmicas mais ricas e a extensão fortemente acoplada continuam itens do roteiro.

# text
# c1: src/fusion/gnss_ins_ekf.rs
# c2: δx = [δp, δv, ψ, b_a, b_g]
# c3: Φ = I + F·dt
# c4: H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]
# c5: tight_coupling
# c6: P/(P+R)
seg-aa9bf0ff6f84 = <b>Núcleo do EKF de estado de erro GNSS/INS fracamente acoplado (<c1/>).</b> Um filtro de Kalman estendido de estado de erro de 15 estados, <c2/>, com a dinâmica de erro strapdown de Groves { "2013" } §{ "14.2" } (acoplamento força específica/inclinação, Coriolis, projeção de viés do corpo para o referencial de navegação, modelos de viés de Gauss–Markov), uma transição discreta de primeira ordem <c3/> e uma atualização de medição fracamente acoplada de posição+velocidade (<c4/>) na forma de Joseph. Álgebra linear densa sem dependências (inversa de Gauss–Jordan, atualização de covariância de Joseph). Um recurso de cargo <c5/> protege uma atualização de pseudodistância/Doppler documentada, ainda não implementada. { "7" } testes com expectativas derivadas à mão: a identidade do produto vetorial/antissimétrica, uma inversa { "3" }×{ "3" } verificada, a covariância permanecendo simétrica/PSD na predição (e a incerteza de posição crescendo sem auxílio), um fixo de posição reduzindo a covariância de posição, recuperação exata de um erro de posição conhecido com o ganho de Kalman analítico <c6/> e correções menores sob maior ruído de medição. Este é o núcleo que substituirá o reset em malha aberta por ajuste à referência verdadeira (truth-snap) do pacote híbrido por realimentação em malha fechada (conexão do pacote + validação com o NaveGo a seguir).

# text
# c1: src/inertial/imu_errors.rs
seg-5be84079b8b6 = Modelo determinístico de erro de IMU para o navegador strapdown de 3 eixos (<c1/>).

# text
# c1: ImuErrorModel
# c2: (ω, f)
# c3: ImuErrorModel::ideal()
# c4: inertial
seg-492e670736b2 = <c1/> distorce um par <c2/> verdadeiro no referencial do corpo em um par medido por meio de cinco categorias sistemáticas (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabela { "4.1" }): <b>fator de escala</b> (erro de ganho por eixo em ppm), <b>desalinhamento / acoplamento cruzado</b> (não ortogonalidade fora da diagonal da tríade), <b>sensibilidade à gravidade (g-sensitivity)</b> (um viés de taxa do giroscópio proporcional à força específica), <b>quantização</b> (arredondamento para o LSB de saída) e <b>rampa de taxa</b> (uma deriva linear no tempo, a terceira região de Allan), além de um viés constante de ligação. Todos os termos têm zero como padrão, de modo que <c3/> é uma passagem transparente e os cenários existentes não são afetados. Cada fonte de erro tem um teste de isolamento (escala linear até <{ "0.01" }%, desalinhamento entre eixos acima do piso de VRW, viés de g-sensitivity, grade de LSB, rampa linear), e um teste de ponta a ponta conduz um erro de navegação pela mecanização a partir de uma IMU distorcida. Não modelado: erro de retificação por vibração, deriva por gradiente de temperatura. (O pacote de cenário <c4/> distribuído ainda executa o antigo orçamento escalar de 1-DOF; este modelo alimenta a biblioteca de 3 eixos.)

# text
# c1: coning_increment
# c2: ½ Δθ_prev × Δθ_cur
# c3: sculling_increment
# c4: ½ Δθ × Δv
# c5: NavState::step_increments
# c6: Δθ_rel = Δθ_b − C_n^b ζ
seg-f57bc89d4688 = <b>Compensação de coning e sculling para o integrador strapdown.</b> O caminho de atitude adiciona o <c1/> de duas amostras (<c2/>); verifica-se que uma integração em taxa grosseira ({ "30" } Hz, 5 amostras/ciclo) de um ambiente de coning de { "5" } Hz acompanha a verdade em taxa fina ≥ { "3" }× melhor com a correção do que com a soma ingênua de incrementos. O caminho de velocidade adiciona <c3/> (<c4/>, eq. { "5.82" } de Groves) e resolve o incremento de velocidade do corpo por meio de uma nova atualização baseada em incrementos <c5/> usando a rotação relativa ao corpo <c6/>, de modo que uma plataforma fixa à Terra não incorre em sculling espúrio, enquanto uma vibração genuína aciona o termo completo.

# text
# c1: src/inertial/mechanization.rs
seg-56c599250ed4 = Mecanização strapdown completa de três eixos no referencial NED (<c1/>).

# text
# c1: NavState { q, v_ned, p_llh }
# c2: step(gyro_b, accel_f_b, dt)
# c3: ω_in = ω_ie + ω_en
# c4: v̇ = f_n − (2 ω_ie + ω_en) × v + g_n
# c5: v_N ≈ a·t
# c6: ½ a t²
seg-d0897492e89b = <c1/> é avançado por <c2/> usando as equações NED padrão no referencial terrestre (Groves §{ "5.4" }): atitude corpo→NED corrigida pela taxa inercial-para-navegação <c3/> (rotação da Terra + taxa de transporte); força específica resolvida corpo→NED por meio da DCM; velocidade integrando <c4/> (Coriolis/transporte + gravidade); e posição geodésica por meio dos raios de curvatura meridiano/transversal. A gravidade é a <b>gravidade normal (de prumo)</b> em forma fechada de Somigliana do WGS-84, com uma correção de altitude de ar livre da NIMA, nunca uma constante fixa no código. Este é o genuíno navegador de três eixos que substitui o caminho escalar de orçamento de erro de 1-DOF. Verificado por invariantes físicos: uma plataforma presa à Terra em rotação a { "45" }°N (sentindo a taxa de rotação da Terra + { "1" } g) permanece dentro de { "1" } mm ao longo de { "60" } s; uma força específica horizontal para o norte dá <c5/> e deslocamento <c6/>; a gravidade normal coincide com os valores de superfície conhecidos no equador/polo/45° e com a taxa de variação de ar livre.

# text
# c1: src/inertial/attitude.rs
# c2: Quaternion
# c3: to_dcm
# c4: from_dcm
# c5: q̇ = ½ q ⊗ ω
# c6: coning_increment
# c7: ½ Δθ_prev × Δθ_cur
# c8: src/inertial.rs
# c9: src/inertial/
# c10: crate::inertial
seg-290b08199bfb = <b>Representação de atitude de três eixos para INS strapdown (<c1/>).</b> Um tipo <c2/> de quatérnio unitário (escalar primeiro, convenção de Hamilton) que carrega a rotação corpo→navegação, com uma visão em DCM (<c3/>/<c4/> pelo método de Shepperd), produto de Hamilton, construtores de eixo-ângulo e de vetor de rotação (mapa exponencial exato) e cinemática de quatérnios: tanto uma atualização de taxa RK de primeira ordem (<c5/>) quanto uma atualização de vetor de rotação com correção de coning. O <c6/> de duas amostras (Savage / Bryan–Lewantowski, <c7/>) fornece o termo de acoplamento cruzado da taxa de rotação que a navegação por estima escalar omite. Esta é a base de atitude para a mecanização completa de 3 eixos que substitui o antigo caminho de orçamento de erro de 1-DOF. Verificado contra rotações em forma fechada: a propagação a taxa constante coincide com o quatérnio de eixo-ângulo até { "1e-6" }, as DCMs são ortonormais com determinante unitário e o coning desaparece para movimento de um único eixo. (<c8/> agora é o diretório de módulo <c9/>; o caminho público <c10/> permanece inalterado.)

# text
# c1: src/frames.rs
seg-5e6e5bba25a5 = Visibilidade de estação terrestre geodesicamente correta (<c1/>).

# text
# c1: elevation
# c2: is_visible
# c3: visible_count
seg-69bdb1e5bfc8 = <c1/>, <c2/> e <c3/> calculam a elevação de um satélite acima do horizonte de uma estação terrestre em relação à <b>normal do elipsoide WGS-84</b> (a vertical local verdadeira), e não ao radial geocêntrico; os dois diferem até cerca de ~{ "0.19" }° de deflexão geodésica, o suficiente para fazer satélites próximos ao horizonte entrarem ou saírem de uma máscara de elevação. Verificado de ponta a ponta (uma constelação Walker propagada, rotacionada TEME→ECEF e contada a partir de um sítio geodésico) e contra a aproximação geocêntrica.

# text
# c1: test-python-bindings
# c2: PyO3/maturin-action
# c3: maturin build
# c4: rustfmt-preview
# c5: cargo-fmt
# c6: deny
# c7: cargo-deny
# c8: taiki-e/install-action
# c9: cargo-deny-action
seg-4de1d79d2e76 = <b>Confiabilidade da CI.</b> O job <c1/> agora constrói o wheel com <c2/> (contêiner manylinux) em vez de um <c3/> direto no host, eliminando um conflito intermitente de rustup entre <c4/>/<c5/> na imagem do runner. O job <c6/> instala <c7/> como binário pré-compilado por meio de <c8/> em vez do <c9/> baseado em Docker, removendo um tempo esgotado de download do registro do Docker Hub. Nenhuma das alterações afeta as verificações realizadas.

# text
seg-05055c993904 = A velocidade inercial é exposta a jusante.

# text
# c1: Propagator::velocity_eci
# c2: Propagator::state_eci
# c3: StateEci { r_m, v_m_s }
# c4: Orbit::velocity_eci
seg-1228235c99b6 = <c1/> e <c2/> (que devolve <c3/>) levam a velocidade TEME analítica que o SGP4 já calcula, antes descartada, até os chamadores em m/s; <c4/> dá ao caminho kepleriano uma velocidade consistente. O teste de verificação AIAA 2006-6753 agora também verifica a velocidade de cada linha de referência (pior erro de velocidade de { "1.85e-9" } km/s entre os { "666" } estados) e fixa em exatamente { "666" } a contagem de linhas comparadas.

# text
# c1: ParseOpts { strict_checksum }
# c2: parse_propagators_opts
# c3: strict_checksum
# c4: ConstellationCfg
seg-8ac2598291b8 = <b>Análise de TLE mais estrita e sem pânico.</b> As linhas devem ser ASCII e são fatiadas com segurança (sem mais pânicos de índice de byte com entrada multibyte); os elementos têm a faixa verificada (inclinação, excentricidade, movimento médio); a soma de verificação da coluna 69 pode ser imposta por <c1/> / <c2/> e pela nova opção <c3/> em <c4/> (tolerante por padrão).

# text
# c1: adev_curve
# c2: [{tau_s, adev, n_samples}]
seg-1cd2c6621a04 = <b>Curva de desvio de Allan na saída.</b> Cada execução de relógio agora informa um <c1/> (<c2/>) e o playground do navegador desenha um gráfico log-log "Estabilidade do relógio (ADEV)".

# text
seg-c76ff20811e7 = Validação de entrada da grade de tempo.

# text
# c1: TimeCfg::validate
# c2: MAX_TIME_STEPS
seg-75436d067802 = <c1/> rejeita uma grade de tempo não finita, nula, negativa ou grande demais (um passo maior que a duração, ou mais de <c2/> amostras) antes de qualquer alocação, de modo que um cenário malformado devolve um erro em vez de entrar em pânico ou esgotar a memória.

# text
seg-d0a8ce50cf6e = Conjuntos Monte Carlo para o pacote inercial.

# text
# c1: runs = N
# c2: ensemble
# c3: monte_carlo
seg-3225674ce4ea = <c1/> em um cenário inercial executa N sementes e informa, para cada métrica, a média, o desvio padrão, os percentis e um intervalo de confiança bootstrap de percentis de { "95" }% (<c2/>). Toda execução inercial agora carrega um indicador <c3/>, de modo que uma FoM de uma única realização não seja mais confundida com uma distribuição. (CEP/2DRMS intencionalmente não são informados: exigem o modelo de 3 eixos que está no roteiro.)

# text
# c1: web/share.test.mjs
seg-2967872bfca1 = <b>Modo de playground guiado.</b> O playground do navegador não o joga mais diante de uma parede de TOML bruto: uma faixa "Comece aqui" com cartões de cenário de um clique carrega e executa um exemplo trabalhado, controles deslizantes expõem os parâmetros universais (semente, limiar de temporização) sem tocar no TOML, uma nota "Como ler isto" explica o resultado, e o TOML completo fica a um clique, em uma seção recolhível. Toda execução é compartilhável: <b>Copiar link de compartilhamento</b> codifica o cenário inteiro no fragmento da URL (nada é enviado) para que um link reproduza a execução exata ao carregar. O codec tem testes unitários (<c1/>, executados na CI).

# text
# c1: src/sweep.rs
seg-2e47e8864718 = Varreduras de parâmetros N-dimensionais (<c1/>).

# text
# c1: nd_sweep
# c2: SweepAxis
seg-5076a9ad20d7 = <c1/> avalia uma métrica sobre o produto cartesiano completo de vários intervalos <c2/> (o estudo de compromisso multiparamétrico), em ordem por linhas e de forma determinística. Aditivo: a API existente de varredura 1-D permanece inalterada. Intervalos de confiança bootstrap por nó e a generalização além do pacote de relógio continuam no roteiro.

# text
# c1: src/raim.rs
seg-958718831037 = <b>RAIM de instantâneo real (<c1/>).</b> Monitoramento Autônomo de Integridade pelo Receptor genuíno no domínio da posição: constrói a geometria de linha de visada até os satélites visíveis, forma a solução de mínimos quadrados e os resíduos, executa um teste de detecção de falha por resíduo χ² (limiar exato a partir de um χ²/χ² não central por gama incompleta sem dependências) e calcula níveis de proteção horizontal e vertical baseados em inclinação (HPL/VPL) com o viés de detecção perdida derivado para os P_fa/P_md configurados. É distinto da cifra de Integridade de autoconsistência do filtro do pipeline de cenários, e <b>ainda não está ligado</b> a ela; exclusão de falha, orçamento de limite de alerta/P_HMI e ARAIM continuam no roteiro.

# text
# c1: src/allan.rs
# c2: TDEV = tau/sqrt(3) * MDEV
# c3: deviation_ci
seg-1675540acbd9 = <b>Suíte de estabilidade de frequência: MDEV, TDEV, HDEV + intervalos de confiança</b> (<c1/>). Junto com o ADEV sobreposto: o desvio de Allan modificado (separa o ruído de fase branco do flicker), o desvio de tempo (<c2/>) e o desvio de Hadamard (rejeita exatamente a deriva linear de frequência e converge para tipos de ruído vermelho divergentes). Os intervalos de confiança baseados em χ² (<c3/>) usam um par de quantis normal/χ² sem dependências (Acklam + Wilson-Hilferty) com um edf conservador sem sobreposição; o edf específico do tipo de ruído e a paridade numérica com o Stable32 continuam no roteiro.

# text
# c1: src/frames.rs
seg-446a9ed4467c = <b>Redução de referencial (<c1/>).</b> Rotação TEME↔ECEF baseada em GMST (usando o mesmo tempo sideral IAU-1982 do propagador), geodésica WGS-84 exata↔ECEF com uma inversa iterativa inicializada por Bowring (precisão de máquina em todas as altitudes, inclusive MEO/GEO) e um observador geodésico de estação terrestre que devolve azimute / elevação / distância no referencial local Leste-Norte-Cima. O movimento polar e a nutação de sub-segundo de arco não são aplicados (apenas GMST, abaixo de um quilômetro sobre o traço no solo); uma cadeia CIO precisa em ITRF está no roteiro.

# text
# c1: src/timescales.rs
# c2: f64
seg-9f6f53583cf5 = <b>Base de escalas de tempo (<c1/>).</b> Uma API de data juliana sem dependências (civil gregoriana ↔ JD, MJD), o histórico completo de segundos intercalares inteiros do IERS (UTC↔TAI, { "10" } s em { "1972" } até { "37" } s desde { "2017" }), o deslocamento TAI→TT definido, a correção UT1 por meio de um DUT1 fornecido e o Ângulo de Rotação da Terra IAU-2000. É o substrato de tempo sobre o qual se apoia a redução de referencial fixo à Terra (planejada). Os instantes são Datas Julianas de <c2/> único (resolução de ~{ "50" } µs perto da época atual; um JD de duas partes está no roteiro), e a era pré-1972 do segundo elástico não é modelada; ambos documentados no módulo.

# text
# c1: scripts/gen-sbom.sh
# c2: libm
# c3: docs/REPRODUCIBILITY.md
seg-6ecc053f101f = <b>Reprodutibilidade e proveniência.</b> Um gerador determinístico de SBOM CycloneDX (<c1/>) e uma atestação de proveniência de build SLSA sobre o binário da versão e o SBOM; a cadeia de ferramentas da versão é fixada para corresponder à CI. As garantias de determinismo, a ressalva de <c2/> entre plataformas e a abordagem de fixação dos valores de referência (golden) estão documentadas em <c3/>.

# text
# c1: tests/property.rs
# c2: TimeCfg::validate
seg-3e98dcdcb82b = <b>Testes baseados em propriedades e de fuzzing</b> (<c1/>). Testes aleatorizados determinísticos (sem nova dependência) verificam invariantes sobre milhares de entradas: os analisadores de TLE e de cenário nunca entram em pânico com entrada lixo, não ASCII, mutada ou truncada; <c2/> nunca entra em pânico com grades NaN/inf/negativas; a soma de verificação do TLE é consistente e restrita à coluna 69; os ciclos geodésico↔ECEF e a rotação TEME→ECEF preservam a norma em todo o globo e em uma ampla faixa de altitude.

# text
# c1: libm
seg-ea252b5d7427 = Os testes de referência (golden) agora <b>fixam as figuras de mérito campo a campo</b> para os quatro cenários de referência (com uma tolerância que absorve a variação de <c1/> entre plataformas), substituindo as verificações anteriores apenas de desigualdade, de modo que uma regressão numérica silenciosa seja detectada de imediato.

# text
# c1: schema_version
# c2: 0.1
# c3: 0.7
seg-4b2a0b78984b = <c1/> nos artefatos de resultado alterado de <c2/> para <c3/> (estava congelado enquanto o motor evoluía).

# text
# c1: cargo-deny
seg-ecafa9d44810 = <c1/> agora <b>nega</b> (e não apenas avisa sobre) dependências retiradas (yanked).

# text
# c1: CAPABILITY.md
# c2: SCHEMA.md
# c3: INTEGRITY.md
# c4: QUANTUM-MODELS.md
# c5: REAL_TLE_GUIDE.md
# c6: Cargo.toml
seg-c48af44de5b4 = Novos documentos: <c1/> (mapa de escopo honesto), <c2/> (referência dos campos de resultado), <c3/>, <c4/>, <c5/>. Uma proteção na CI falha se o selo de versão do README divergir de <c6/>.

# text
seg-8ef32ebec7f5 = <b>Propagação de órbita SGP4/SDP4.</b> Uma implementação completa e sem dependências do propagador padrão de perturbações simplificadas: SGP4 de órbita próxima da Terra junto com a extensão SDP4 de espaço profundo (perturbações seculares e periódicas lunissolares e ressonância geopotencial de { "12" } h / { "24" } h). É validada contra os vetores de verificação oficiais AIAA 2006-6753 ("Revisiting Spacetrack Report #3"): todos os { "666" } estados de referência dos casos de órbita próxima da Terra, de espaço profundo, ressonantes e de códigos de erro coincidem, com um erro de posição no pior caso de cerca de { "4" } mm. Este é o modelo em relação ao qual os conjuntos de elementos de duas linhas são definidos, de modo que representa constelações reais, notadamente as órbitas GNSS de ~{ "12" } h, que são de espaço profundo e ressonantes e que o modelo anterior de dois corpos + secular J2 não consegue capturar.

# text
# c1: orbit-sgp4-gps.toml
seg-06a77fb9233e = Uma constelação dada como <b>conjuntos completos de elementos de duas linhas</b> (linha { "1" } + linha { "2" }) agora é propagada com SGP4/SDP4; uma constelação dada como elementos apenas da linha 2 mantém a propagação analítica kepleriana de dois corpos, inalterada. As duas formas podem ser misturadas em um mesmo bloco. Novo cenário de referência <c1/> (uma constelação MEO semelhante ao GPS em formato real de duas linhas, propagada com SGP4); inclua um conjunto "gps-ops" atual do Celestrak para estudar a constelação em operação.

# text
# c1: spoof
# c2: spoof-attack.toml
seg-2dbb4054e9b8 = <b>Demonstrador de ataque ativo de spoofing.</b> Um novo tipo de cenário <c1/> injeta um spoof de falso tempo em rampa e executa o monitor de integridade auxiliado por relógio de cada relógio, informando se e quando o spoof é detectado e se ele atinge a especificação operacional sem ser detectado, transformando a figura de mérito de Segurança em uma demonstração concreta de ataque/defesa. Novo cenário de referência <c2/>.

# text
# c1: [[constellations]]
# c2: [constellation]
# c3: orbit-multignss.toml
seg-aa0cb8038baa = <b>Disponibilidade multiconstelação.</b> Um cenário de órbita pode combinar várias constelações (uma lista <c1/> junto com o <c2/> principal) para disponibilidade multi-GNSS e diluição de precisão, por exemplo GPS mais Galileo. Novo cenário de referência <c3/>.

# text
seg-9b9dcd5be0a7 = <b>Relatório de painel de avaliação em HTML.</b> Toda execução agora também produz um painel de avaliação HTML autocontido e com a marca: o resumo de uma linha, o gráfico (incorporado como imagem inerte em data-URI) e o JSON completo, gravados pela CLI junto com o JSON e o SVG. Um artefato compartilhável de arquivo único para uma entrega de estudo ou um anexo.

# text
# c1: fusion
# c2: [phase, frequency]
# c3: [position, velocity]
# c4: fusion-pnt.toml
seg-76c573048a91 = <b>Estimador conjunto de fusão de sensores.</b> Um novo tipo de cenário <c1/> executa um único filtro de Kalman recursivo como solução de navegação, fundindo o estado do relógio <c2/> e o estado de posição <c3/>, disciplinado pelo GNSS (aprendendo o deslocamento de frequência e a velocidade) e auxiliado por transferência óptica de tempo durante a interrupção, em vez de compor preditores independentes. Informa holdover fundido de temporização/posição e uma integridade de covariância conjunta. Novo cenário de referência <c4/>.

# text
# c1: bias_instability
# c2: q_aa
seg-10f0501c91ef = <b>Modelo de ruído de IMU mais completo.</b> O acelerômetro agora modela os demais termos da variância de Allan além do viés constante e do passeio aleatório de velocidade: <b>instabilidade de viés</b> (um piso flicker de 1/f no coeficiente padrão de instabilidade de viés de Allan, reutilizando a síntese flicker do relógio) e <b>passeio aleatório de aceleração</b>. Novos campos opcionais de cenário inercial <c1/> e <c2/>; um novo fixo GNSS recalibra a deriva residual do viés.

# text
# c1: tle
# c2: orbit-real-tle.toml
seg-251ffc7b7722 = <b>Geometria real de constelação a partir de TLEs.</b> Uma constelação pode ser dada como um bloco de conjuntos de elementos de duas linhas (o formato padrão NORAD/Celestrak) por meio de um campo <c1/>, de modo que a disponibilidade e a diluição de precisão usam a geometria publicada de uma constelação real em vez de um padrão Walker sintético. O motor lê os elementos keplerianos médios de cada TLE e os propaga como dois corpos, e não com SGP4, o que é razoável para um estudo de instantâneo a partir de uma época comum. Novo cenário de referência <c2/>.

# text
# c1: sweep
# c2: threshold_ns
# c3: duration_s
# c4: quantum_q_wf
# c5: classical_q_wf
# c6: sweep-clock-stability.toml
seg-7deb93b51cc7 = <b>Varreduras de parâmetros para estudos de compromisso.</b> Um novo tipo de cenário <c1/> varia um parâmetro (<c2/>, <c3/>, <c4/> ou <c5/>) ao longo de um intervalo linear ou logarítmico e registra uma figura de mérito escolhida em cada ponto para ambos os relógios, produzindo o gráfico de comparação "como o holdover escala com a estabilidade do relógio?" de que um estudo de compromisso de projeto precisa. Novo cenário de referência <c6/>.

# text
# c1: runs
# c2: clock-ensemble.toml
seg-ef6f3e77b476 = <b>Faixas de confiança Monte Carlo.</b> O cenário de holdover de relógio pode executar muitas realizações (novo campo opcional <c1/>): cada figura de mérito é então informada como uma média com uma dispersão entre o percentil 5 e o percentil 95, e o gráfico sombreia o envelope de erro de { "5" }–{ "95" }% em torno da mediana de cada relógio. Uma única execução continua sendo o padrão. Novo cenário de referência <c2/>.

# text
# c1: eccentricity
# c2: argp_deg
# c3: j2
# c4: orbit-molniya.toml
seg-e70cc0973fa3 = <b>Órbitas excêntricas e deriva J2.</b> O tipo de órbita agora é uma órbita kepleriana completa (semieixo maior, excentricidade, inclinação, RAAN, argumento do perigeu, anomalia média), propagada pela resolução da equação de Kepler, com regressão nodal secular J2 e precessão apsidal opcionais. Novos campos opcionais de cenário <c1/>, <c2/> e <c3/>, e um cenário de referência <c4/> (um usuário altamente excêntrico e de inclinação crítica, de { "12" } h). As órbitas circulares mantêm o caminho original de forma fechada, bit a bit.

# text
seg-cc041e16d418 = O pacote híbrido (PNT combinado) agora informa <b>Integridade</b> e <b>Segurança</b>, de modo que os quatro pacotes cobrem o conjunto completo de figuras de mérito operacionais. A Integridade é a contenção do limite de proteção do canal de temporização a partir de um estimador de Kalman disciplinado à verdade enquanto o GNSS está nominal e reancorado (de forma mais frouxa) a cada ressincronização óptica; o seu limite inclui o piso de ruído de medição do enlace, de modo que um relógio muito melhor que o enlace é pontuado contra o ruído real da solução entregue. A Segurança é a pontuação de detecção de spoofing auxiliada por relógio em relação à especificação de temporização.

# text
# c1: scripts/changelog-extract.sh
seg-e0b666457d6e = As notas de versão agora são geradas a partir da seção selecionada do CHANGELOG para a tag (<c1/>), de modo que cada versão do GitHub destaque o que mudou em vez de listar commits brutos.

# text
# c1: [0, 1]
seg-f785718e9454 = Figura de mérito de <b>Segurança</b> (antes não preenchida): uma pontuação de detecção de spoofing auxiliada por relógio para os pacotes de holdover de relógio e de órbita. Modela um monitor de integridade que confronta o tempo derivado do GNSS com a predição do próprio relógio em navegação inercial sobre uma janela coerente; o piso de detecção combina o ruído de medição médio com a incerteza do relógio em navegação inercial, de modo que um relógio mais silencioso detecta spoofs de tempo menores e mais lentos. A pontuação é informada em <c1/> relativa à especificação de temporização, completando as seis figuras de mérito operacionais.

# text
# c1: Q = (HᵀH)⁻¹
# c2: sigma_uere_m
seg-9164140872c8 = <b>Precisão de posição</b> derivada da geometria para o pacote de órbita: a partir da geometria de linha de visada até os satélites visíveis, forma a matriz de projeto e o seu fator de covariância <c1/>, produzindo os fatores de diluição de precisão (GDOP/PDOP/HDOP/VDOP/TDOP). A precisão de posição é o DOP de posição multiplicado por um erro equivalente de distância do usuário configurável (novo campo opcional de cenário <c2/>). Um resultado de órbita agora carrega um resumo da geometria (fração de amostras com fixo, melhor e mediana do PDOP e sigma de posição).

# text
# c1: web/
# c2: pages
# c3: summary
seg-3285502161c6 = Um <b>playground</b> no navegador (<c1/>) que executa o motor no lado do cliente como WebAssembly: escolha um cenário de referência ou edite o TOML, execute-o e veja o resumo, o gráfico e o JSON completo, sem enviar nada. Um fluxo de trabalho <c2/> o constrói e publica no GitHub Pages, e uma nova exportação WebAssembly <c3/> sustenta a leitura.

# text
# c1: chart
seg-0dca5318f7ce = Eixos y rotulados nos gráficos SVG: linhas de grade, rótulos numéricos de marcas e um título de eixo de unidades (por meio de um auxiliar <c1/> compartilhado), de modo que as magnitudes sejam legíveis.

# text
# c1: publish
seg-ce84a3d61f19 = Fluxo de trabalho de publicação de pacotes (<c1/>) para crates.io, PyPI e npm, cada um condicionado ao seu token de registro e acionado por uma versão publicada.

# text
# c1: flicker_floor
seg-0f01369fc29b = Piso de FM flicker (1/f) para o modelo de erro do relógio, sintetizado como uma soma de processos de Ornstein-Uhlenbeck espaçados logaritmicamente e calibrado de modo que o piso plano do desvio de Allan fique em um nível configurável. Desativado por padrão; ativado por relógio por meio do campo opcional de cenário <c1/>.

# text
# c1: gyro_bias
# c2: q_arw
seg-5b7fcd386fd3 = Canal de giroscópio para o modelo inercial: o viés residual do giroscópio e o passeio aleatório angular geram um erro de atitude (inclinação) que acopla a gravidade a um erro horizontal de força específica, o principal mecanismo de crescimento de erro do strapdown. Desativado por padrão; ativado por sensor por meio dos campos opcionais <c1/> e <c2/>.

# text
# c1: q_wf*T + q_rw*T^3/3
seg-efe9f10d2641 = Estimador de relógio de Kalman de dois estados (fase, frequência) com discretização exata do ruído de processo de van Loan. A navegação inercial a partir de um estado conhecido reproduz exatamente o crescimento analítico do erro de holdover (<c1/>), e o filtro fornece adicionalmente um limite de incerteza de 1 sigma em linha.

# text
seg-539e24f34ed1 = A execução de relógio agora informa a figura de mérito de <b>Integridade</b> (antes não preenchida): a fração das amostras de interrupção cujo erro permanece dentro do limite de proteção de 3 sigma do filtro, exibida no resultado em JSON e no resumo da CLI.

# text
# c1: orbit
# c2: orbit-gnss-challenged.toml
seg-80620c97e3f5 = Disponibilidade GNSS derivada da geometria: propagação de órbita circular, um gerador de constelação Walker-delta e visibilidade de linha de visada (oclusão pela Terra mais máscara de elevação) produzem a linha do tempo de disponibilidade a partir da geometria orbital real. Novo tipo de cenário <c1/> e o cenário de referência <c2/> (uma espaçonave dentro da camada GNSS com cobertura intermitente).

# text
# c1: run
# c2: run_full
# c3: version
# c4: pyproject.toml
# c5: wheels
seg-67549163ad7d = Extensão Python opcional (PyO3, abi3) que expõe <c1/>, <c2/> e <c3/>, empacotada com maturin (<c4/>) e construída para Linux, macOS e Windows por um fluxo de trabalho <c5/> acionado por tag de versão. A ligação é uma dependência opcional protegida por feature: a compilação padrão, os testes e o portão de auditoria de dependências não são afetados.

# text
# c1: run
# c2: chart_svg
# c3: version
# c4: wasm
# c5: getrandom
# c6: wasm32
seg-c76dc363f0b1 = Módulo WebAssembly opcional (wasm-bindgen) que expõe <c1/>, <c2/> e <c3/>, construído com wasm-pack sob a feature <c4/>; <c5/> é restrito ao alvo para usar a fonte de entropia do navegador em <c6/>.

# text
# c1: api::run_toml
seg-cf1b0eef2201 = Despacho <c1/> compartilhado, usado pela CLI e por ambas as ligações, de modo que a linha de comando e as ligações não possam divergir.

# text
seg-8d4f855d11bd = A pontuação de holdover agora considera segmentos: as linhas do tempo de interrupção são divididas em segmentos contíguos na reaquisição do GNSS, e o holdover informado é a navegação inercial do pior caso (a mais curta) entre eles. Cenários de interrupção única não mudam. Aplica-se aos pontuadores de relógio, inercial e híbrido.

# text
# c1: kind
# c2: inertial
# c3: accelerometer
seg-8b3556d125ed = O <c1/> informado pelo modelo inercial agora é <c2/> (era <c3/>), refletindo os canais combinados de acelerômetro e giroscópio.

# text
seg-d842f9cc0a9c = Versão inicial.

# text
# c1: scenario + seed + engine version
# c2: kind
seg-962b75c38735 = <b>Motor de simulação determinístico</b> para PNT híbrido quântico/clássico: uma interface comum de modelo de erro, cenários declarativos de disponibilidade GNSS, estimadores de holdover / navegação por estima e pontuação por figuras de mérito contra os critérios operacionais padrão de PNT. Os resultados são reprodutíveis a partir de <c1/> (JSON versionado e autodescritivo com um hash do cenário) e renderizados como gráficos SVG. A CLI despacha os cenários por <c2/>.

# text
seg-16e574edc3a8 = <b>Quatro pacotes de sensores</b>, cada um calibrado com dados publicados e validado contra a relação padrão:

# text
seg-b49bbb60c2cd = <b>Holdover de relógio</b>: FM branco, FM de passeio aleatório e envelhecimento linear; validado pelo desvio de Allan sobreposto (Riley, NIST SP { "1065" }). Relógio atômico em escala de chip contra relógio óptico de rede de estrôncio.

# text
seg-be2c5f28b256 = <b>Navegação inercial por estima</b>: viés residual + passeio aleatório de velocidade, integrados duas vezes até o erro de posição; validado contra as relações de crescimento de erro de Groves. Átomos frios contra acelerômetro de grau de navegação.

# text
seg-fcb0f72db736 = <b>Transferência de tempo</b>: jitter de temporização do enlace óptico contra o de RF → precisão de sincronização → medição de distância unidirecional.

# text
seg-93e5f2f70b58 = <b>Fusão híbrida (etapa final)</b>: um conjunto PNT combinado que deve manter tanto a temporização quanto a posição, com auxílio opcional ao relógio por transferência óptica de tempo entre satélites.

# text
# c1: scenarios/
# c2: provenance
seg-e0a8cbe0c105 = <b>Um cenário de referência citado por pacote</b> em <c1/>, com todo parâmetro numérico acompanhado de uma <c2/> revisada por pares.

# text
seg-8f1cc09b2513 = <b>Proteções de reprodutibilidade e de higiene do repositório</b>; CI (formatação, clippy, testes, proteções, MSRV) e um pipeline de versão condicionado a tag que executa novamente todas as verificações.

# text
seg-8b4e21f56334 = <b>Documentação</b>: README com diagramas de arquitetura, relatório de situação da validação, guia de contribuição, política de segurança e código de conduta; licença Apache-2.0; modelos de issue/PR e configuração do Dependabot.

# text
seg-e26d94f06ead = Neutro quanto a fornecedores em todo o material; citações científicas e de metrologia revisadas por pares mantidas.

# text
# c1: NOTICE
# c2: cargo-deny
seg-84cb67686edf = Higiene da licença Apache-2.0: cabeçalhos SPDX em todos os códigos-fonte, um <c1/> com aviso de marca registrada, assinatura do Developer Certificate of Origin (DCO) para contribuições e imposição de licenças/avisos de dependências por <c2/> na CI.

# text
seg-a0f14bea7532 = Posicionamento open-core (README): um motor gratuito Apache-2.0 mais suporte comercial, integração e extensões proprietárias disponíveis pela Ashforde OÜ, sustentado por serviços e não por taxas de licença.

# text
# c1: CITATION.cff
seg-899815063eb1 = <c1/> para que o software possa ser citado.

# text
seg-15f45d8ccb0f = <s1>Anterior</s1>Onde o Kshana se situa

# text
seg-cd8a14a9e8ec = <s1>Próximo</s1>Licenciamento

seg-1200856c90da = [{ $version }] - 2026-10-28

seg-05d0c798a196 = A { "0.40" } acrescenta a sequência de missão de classe Artemis e seu segmento lunar, um rótulo de evidência em cada figura e tabela que uma execução grava, ingestão e ajuste de relógios medidos, uma verificação de envio de parceiros de dados, uma região estimada de emissor a partir de relatos ADS-B ou AIS, a recampanha de benchmark da { "0.40" }, e a linha de comando, os relatórios e o Studio em dezessete idiomas além do inglês (os documentos de máquina permanecem em inglês). A matriz de verificação cresce de { "388" } para { "401" } linhas: { "176" } VALIDATED (inalterado), { "221" } MODELLED (eram { "208" }) e { "4" } PARTNER. Nenhuma linha foi promovida a VALIDATED. Os tipos de cenário crescem de { "87" } para { "92" }. Todo limiar que uma comparação com pré-registro não atingiu está declarado abaixo e permanece fixado; nenhum foi afrouxado. A declaração consultiva permanece inalterada: o Kshana é um software de caráter consultivo, não um equipamento de navegação homologado e não uma certificação; o operador continua responsável.

seg-738f33f0ae8a = Limites conhecidos

seg-d4062fab7ae1 = As execuções em outros idiomas levam cerca do dobro do tempo, porque o cenário é executado duas vezes (uma em inglês para os arquivos de máquina, outra no idioma escolhido para a pessoa).

seg-8db6dedc627a = Algumas frases do Studio são montadas a partir de fragmentos e podem não ter artigos em idiomas com gênero gramatical.

seg-86e6e35ac846 = As traduções são traduções automáticas que nenhum falante nativo revisou; o inglês é a referência.

seg-dd7ee240b467 = <b>Dezessete idiomas além do inglês</b> para o texto do motor voltado às pessoas e para o site e o Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, as variáveis de localidade; <c3/> nas chamadas da biblioteca, de Python, de WebAssembly e de MCP). Mensagens e erros da linha de comando, resumos de execução, textos de gráficos, <c4/>, descrições dos tipos de cenário e as declarações consultivas estão traduzidos; os documentos de máquina (JSON, CSV, códigos de erro, a matriz de verificação) permanecem em inglês, e uma execução em outro idioma executa o cenário uma vez em inglês para os arquivos de máquina e uma vez no idioma escolhido para a pessoa (<a1><c5/></a1>). <b>As traduções são traduções automáticas, não revisadas por falantes nativos; o inglês é a referência</b>; o <c6/> de cada idioma lista o que um revisor deve verificar primeiro, e as páginas do site trazem um aviso dizendo isso. As palavras de veredito, os níveis de evidência e o escopo consultivo ("não homologado", "não uma certificação", "o operador continua responsável") são mantidos em todos os idiomas.

seg-7a95c263ecec = <c1/>: uma <b>região estimada de emissor</b> a partir de relatos ADS-B ou AIS. Uma posterior sobre onde pode estar uma fonte de relatos de posição degradados (linha de visada de rádio em um raio terrestre de 4/3, altura da antena e potência do emissor marginalizadas, aeronaves afetadas puxando e aeronaves não afetadas com linha de visada empurrando em sentido contrário), escrita como regiões a { "50" }, { "90" } e { "95" }%, um centroide com sua elipse de incerteza (nunca um ponto isolado), sessões no tempo (início, fim, duração, área afetada, aeronaves distintas acima do mínimo de publicação), um perfil por hora do dia e horas por dia, com fusão opcional de uma solução TDOA de <c2/>. Saídas: GeoJSON, resumo em JSON, CSV de sessões e uma figura SVG, cada uma com a licença, a atribuição, o id do método, as hipóteses, os limites e seu rótulo de evidência. Biblioteca <c3/>, Python e WebAssembly <c4/>. MODELLED (linha <c5/> do registro; a matriz tem agora { "401" } linhas, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); calibrada apenas com dados sintéticos, com a comparação com os locais de transmissores do Jammertest { "2025" } fixada antecipadamente e executada uma vez: ADS-B e AIS ambos NOT ASSESSABLE (poucas sessões programadas nos dados abertos), portanto a linha permanece MODELLED (<c6/>). Redação neutra, apenas agregados; a publicação de regiões de emissores no observatório público permanece desativada. Há um exemplo sintético em <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Registros de relógio medidos.

seg-59b240848747 = <c1/> lê um registro de relógio medido em uma única série de fase: oito formatos (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> e <c4/>, rastreamento e estatísticas do chrony), cada um um subconjunto documentado; qualquer coisa fora dele é recusada com um erro que nomeia o que foi encontrado. É usado por <c5/> (<c6/>) e pelo tipo de cenário de relógio (<c7/>, que acrescenta um bloco <c8/> com o SHA-256 do registro e as ADEV, TDEV e MTIE sobrepostas), com o cenário incluído <c9/> (<a1><c10/></a1>). Comparado com o allantools em dados públicos reais em relação a limiares fixados antecipadamente: a primeira execução <b>não atingiu</b> B1 ({ "5" } de { "11" } casos, todos com carimbos de tempo TICC mantidos como <c11/>), B2, B3 ({ "7" } de { "24" } casos) e B4 (a versão do cabeçalho não era verificada); após as correções B1, B3 e B4 são atingidos e B2 é atingido, exceto por um par de MTIE, que está fixado e não é um defeito do motor (o allantools { "2024.6" } remove a frequência média antes de integrar; em relação ao seu MTIE em modo de fase, o motor concorda dentro de { "1e-10" }). A linha permanece MODELLED (<c12/>).

seg-400a39dbf3dd = <b>Um holdover conduzido por uma série medida ajustada</b>: o <c1/> do tipo de cenário de relógio ajusta o ruído de uma série medida e conduz o holdover a partir dele (<c2/>, cenário incluído <c3/>). Comparação com pré-registro: F1(b), F3 e F4 atingidos; F1(a) (recuperar o FM de passeio aleatório registrado) <b>NOT MET</b> nos registros C3 (não identificável por construção) e em dois de três registros C4 (FM de passeio aleatório absorvido pelo FM de cintilação e pela deriva); F2 (identificação do ruído em relação ao allantools) atingido em onze de doze registros e D3 e <b>NOT MET</b> em D2 como registrado (atingido em condições equivalentes). Todas as falhas estão fixadas (<c4/>); o bloco <c5/> e o holdover conduzido por ele permanecem MODELLED (<c6/>).

seg-f1f15e102774 = <b>A recampanha de benchmark da { "0.40" }</b>, com pré-registro e aprovação interna do responsável antes de qualquer execução: A3 (EXPLORATORY, a AUC de bootstrap agrupado por pasta de <c1/>, quantil de { "2.5" } % { "0.8502" } contra { "0.80" }), D3 (EXPLORATORY, três de cinco detectores excedem uma lacuna de otimismo de { "0.05" } na escala { "0.25" }), R3 (AUC { "1.0" }) e R4 (P_fa { "0.0" }, P_d { "1.0" }): todos MET, todos MODELLED. A2, D1 e R1 não foram tocados e permanecem <b>NOT MET</b>; nada aqui os encerra (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: verifica o formato e os metadados de um envio de parceiro de dados (<c2/>: dispositivo, arquivo de dados e SHA-256, como foi obtido, as linhas MODELLED às quais é oferecido, licença, declarações) e lê os dados com os leitores de registro de relógio ou de IMU do próprio motor. Não pontua nada e não valida nada. Há um exemplo sintético em <c3/>.

seg-823e1abc7f92 = <c1/>: quais linhas MODELLED do registro dados medidos poderiam promover, os formatos aceitos, como um envio é verificado, pontuado em relação a um limiar fixado antecipadamente e creditado, e o que PARTNER e VALIDATED significam cada um; uma nota de divulgação em rascunho para o responsável em <c2/> (nada é enviado).

seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

seg-ddd45d39e8a9 = <b>Segundas campanhas para os limiares não atingidos de <c1/> e <c2/></b>, executadas conforme o pré-registro (<s1><c3/></s1>, <s2><c4/></s2>; aprovadas antes de qualquer execução). Toda falha original permanece NOT MET e fixada. <c5/>: o controle reproduz a execução { "1" } célula por célula; cinco ablações de leitura única trazem { "2" } das { "78" } células não atingidas para dentro da tolerância (EXPLORATORY, sem limiar); o novo limiar S7b (um formato de transmissão com atenuação e piso ajustado em painéis Classic IIR) é NOT MET nos painéis IIR-M em { "3.83" } a { "3.95" } dB contra { "3" } dB; a campanha de recepção publicada reservada não foi executada (nenhuma fonte fixada) (<s3><c6/></s3>). <c7/>: os novos limiares C3a, C3b (um limite de detecção de cerca de { "3e-9" } m/s2), Q3a, Q3b (uma CDF normal precisa elimina a diferença de { "1.7e-6" }) e G3'' são atingidos como limiares próprios, e G3' com priores ilustrativos é atingido e rotulado como EXPLORATORY (<s4><c8/></s4>). Tudo permanece MODELLED. Novos itens públicos: <c9/>.

seg-bc89e70f4d36 = <b>Um rótulo de evidência em cada figura e tabela que uma execução grava.</b> O JSON de resultado tem uma chave <c1/>, o SVG do gráfico tem um elemento de metadados e uma linha sob o gráfico, e a tabela CSV tem linhas de comentário <c2/>: o nível (<c3/>, <c4/> ou <c5/>, o mais fraco das linhas) e os ids das linhas da matriz de verificação em que a execução se apoia. Linhas e estados são lidos da matriz, não digitados; os ids são estáveis (<c6/> e oito dígitos hexadecimais, uma nova coluna <c7/> em <c8/>, uma lista congelada em <c9/>). Também em receiver-trust, <c10/>, <c11/>, no relatório de exposição de rota e, dentro do <c12/> assinado, em todo pacote de evidências (<c13/> { "1.1" }; <c14/> informa o nível; pacotes feitos antes da { "0.40" } são verificados sem alteração). <c15/> falha se uma figura não tem rótulo, se um rótulo discorda da matriz ou se um novo gravador de arquivos não está rotulado nem listado com um motivo. As saídas que não trazem rótulo estão listadas em <c16/>. Os três gráficos de demonstração do README foram renderizados de novo com o rótulo (retirá-lo restaura os bytes antigos; <c17/>). Nenhuma afirmação mudou.

seg-8abd87414bc4 = O tipo de cenário <c1/> (<c2/>, <c3/>): o orçamento de erro de navegação e temporização de uma cadeia de fases do lançamento à reentrada, com todo número MODELLED e toda entrada declarada. Oito tipos de fase: <c4/>, <c5/> (covariância relativa de Clohessy-Wiltshire ao longo de trechos de sensor, janela de acoplagem), <c6/> (propagação de Cowell com uma matriz de transição de estado por diferenças finitas, erro de queima, atualizações <c7/> e de rastreamento em solo, a Lua a partir de um recorte opcional do kernel DE440), <c8/> (sigma do ângulo de trajetória, probabilidade do corredor, desaceleração máxima nas bordas do corredor, área de pouso) e os quatro tipos lunares. Regras de transferência (<c9/>, <c10/>, <c11/>), conversões de referencial e de escala de tempo como linhas próprias do orçamento, uma sobreposição opcional da rede terrestre que define o ciclo de rastreamento de cada fase, a margem em relação aos requisitos declarados e o elo mais fraco. O exemplo segue a sequência de uma apresentação pública de conceito de operações da NASA com números ILLUSTRATIVE: um exemplo de ponta a ponta de classe Artemis em { "11" } fases, segmentos terrestre e lunar. A propagação cislunar foi comparada com a trajetória pública da Artemis I ao longo de um arco de { "72" } h em relação a um limiar fixado em <c12/> antes da execução: <b>NOT MET</b> ({ "45.3" } km e { "0.25" } m/s contra { "5" } km e { "0.05" } m/s). O diagnóstico situa a falha em cinco pequenos eventos impulsivos na referência; entre eles o modelo de forças reproduz os estados horários com mediana de { "0.4" } m. A linha permanece MODELLED (<c13/>).

seg-67cad0a9c0c4 = O segmento lunar da sequência de missão de classe Artemis: quatro tipos de cenário, cada um também um tipo de fase da interface <c1/> (<c2/>), todos MODELLED.

seg-63066076a0a8 = <c1/>: navegação relativa até a acoplagem em uma órbita polar circular de { "100" } km ou em uma órbita polar elíptica de { "100" } km por { "3000" } km (<c2/>, <c3/>). Uma estimativa de Gauss-Newton em lote ao longo do arco funde uma solução absoluta por veículo a partir de um conjunto ilustrativo de relés de classe LCNS, um erro persistente do sinal no espaço (comum aos dois veículos e independente) e uma distância por enlace cruzado, sob o modelo de forças lunares da biblioteca. Informa a posição e a velocidade relativas nos eixos locais do alvo, a disponibilidade da solução, o erro de estimação normalizado quadrático médio em relação ao valor esperado, o custo de ignorar os harmônicos da gravidade, os modelos terminais de sensor relativo ao lado do valor só de sinais e a covariância 6x6 transferida.

seg-a2d67bb5cfb3 = <c1/>: o orçamento de dispersão de pouso em um local polar sul (<c2/>; <c3/> lê o DEM do LOLA a partir de um checkout): um modelo de erro inercial de cinco estados por eixo, uma solução AFS (isolada ou diferencial, usando o resíduo do enlace de correção de <c4/>), uma solução relativa ao terreno (o correlacionador <c5/> sobre seu relevo sintético, ou o limite de Cramer-Rao da correlação com o DEM do LOLA) e o tempo lunar por meio do relógio do veículo (<c6/>). Informa a elipse de pouso de 3 sigma, cada combinação de auxílios e uma calibração de Monte Carlo da elipse.

seg-1babf99e8d56 = <c1/>: disponibilidade de posicionamento e temporização por local e estação (<c2/>; <c3/> acrescenta o horizonte do LOLA por traçado de raios): o valor de posicionamento de local único é igual, bit a bit, ao de <c4/>; o que varia com a estação é a visibilidade da Terra e do Sol obtida das efemérides analíticas.

seg-bae659d0ff4d = <c1/>: a ascensão até a órbita de encontro e a covariância de posição e velocidade levada de volta à órbita (<c2/>), com a dispersão no corte do motor informada ao lado.

seg-106be12d960f = <c1/>; o pré-registro, suas emendas e todos os resultados, inclusive as falhas, em <c2/>.

seg-5e8880c28a67 = Fixado antecipadamente em <c1/> antes de qualquer execução, com seis emendas datadas (cada uma feita antes da obtenção dos dados, exceto a Emenda { "6" }, que corrige um erro aritmético em uma contagem de estados após a obtenção e antes de qualquer resultado de A2; toda emenda está divulgada no arquivo). Nenhum limiar foi afrouxado.

seg-90adc3a3c58b = A1 (o propagador em relação à trajetória reconstruída do LRO do JPL Horizons, { "24" } h): <b>MET</b>, uma diferença 3-D máxima de { "33" } m contra um limiar de { "500" } m e uma diferença radial RMS de { "2.4" } m contra { "60" } m.

seg-69f903a278eb = A2 (o mesmo propagador em relação à NRHO do CAPSTONE ao longo de uma revolução de 6,5 dias): <b>NOT MET</b>, uma diferença de posição final de { "136.8" } km contra um limiar de { "25" } km e uma diferença de raio de periapsia osculador de { "28.4" } km contra { "10" } km. A linha permanece MODELLED, e a falha está fixada por <c1/>.

seg-32fcafe8fa07 = B1 (a consistência da estimativa do encontro com seu próprio modelo) é MET no quarto projeto de estimador, NEES médio de { "5.85" } a { "5.93" } contra uma faixa de [{ "5.2" }, { "6.8" }]; os três projetos anteriores, um filtro de Kalman estendido em três variantes, não a atingiram. Uma quinta alteração, feita depois que o cenário de { "2" } h incluído levou { "4" } de { "50" } tentativas a um mínimo local (NEES médio { "1e9" }), executa o ajuste de Gauss-Newton sobre um arco crescente com redução de passo; B1 não muda com ela e os cenários incluídos dão { "6.51" } e { "6.33" }. O histórico está em <c1/>.

seg-a4b6bfcb9984 = Nada aqui é VALIDATED: as linhas de referência independente testam o propagador compartilhado, e não um filtro de navegação, um sinal ou um orçamento.

seg-29d014d29790 = Uma atualização de dependência na biblioteca distribuída (a primeira entrada), o restante nas ferramentas de validação cruzada (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> e <c3/> { "0.13" } para { "0.14" } (com <c4/> { "0.14.3" }, <c5/> { "0.17.0" } e <c6/> { "0.5.5" } para { "0.7.10" }; também a dependência direta <c7/>, agora { "0.7" }) resolvem RUSTSEC-2026-0387, uma variabilidade de tempo de execução em <c8/> { "0.5.5" }. O Kshana usa esses crates apenas para verificar assinaturas públicas (a chave raiz Galileo OSNMA e os tokens de carimbo de tempo RFC { "3161" }) e só assina em testes com chaves descartáveis, então a exposição prática era nula; a atualização remove o aviso sem uma entrada de exclusão. Os arquivos de lock da biblioteca e do MCP mudam os dois; nenhum resultado de verificação muda (os testes de vetores de OSNMA e de carimbo de tempo passam sem alteração).

seg-1a4cda9d1486 = A versão mínima compatível do Rust agora é { "1.88" } (exigida pela correção do RUSTSEC-2026-0387).
