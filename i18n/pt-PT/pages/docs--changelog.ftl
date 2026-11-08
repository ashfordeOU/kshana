# docs--changelog: translations (pt-PT)

# text
seg-9a2a5f0a8a02 = Sistema solar

# text
seg-20db2c79b998 = Validado

# text
seg-a20b4a6e8f53 = relógio atómico à escala de chip

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
seg-7333b85d448f = Todas as alterações relevantes ao Kshana estão documentadas aqui.

# text
seg-bbc8f38627f1 = O formato baseia-se em <a1>Keep a Changelog</a1> e este projeto segue o <a2>Semantic Versioning</a2>. Enquanto o projeto estiver antes da 1.0, o esquema público de cenários/resultados ainda pode mudar; as alterações incompatíveis são assinaladas explicitamente.

# text
seg-985f7b4c001a = Por lançar

# text
seg-a2f583aadd0b = Sem novas funcionalidades: uma correção de linha de comandos, atualizações de dependências nas ferramentas de validação cruzada e documentação. Os resultados do motor são inalterados face à { "0.38.0" }.

# text
seg-c9a8a5898ced = Corrigido

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = A linha de comandos termina silenciosamente com o estado { "141" } quando a sua saída padrão é fechada (<c1/>), em vez de entrar em pânico com "failed printing to stdout: Broken pipe". { "141" } é { "128" } mais SIGPIPE, o estado que uma shell comunica para <c2/>. Só é tratado um pipe fechado: um disco cheio ou qualquer outro erro de escrita continua a comunicar-se, e um fluxo em direto que escreva num socket fechado continua a receber o seu erro de escrita. <c3/> fecha o leitor antes de o programa arrancar, pelo que a primeira escrita falha em todas as execuções.

# text
# c1: xval/
seg-2a47e785cc1d = Atualizações de dependências nas ferramentas de validação cruzada (<c1/>); nenhuma alteração em biblioteca, wheel ou pacote distribuído.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } para { "0.9.11" } (RUSTSEC-2026-0186) nos ficheiros de bloqueio da verificação cruzada ANISE (<c2/>, <c3/>); os ficheiros de bloqueio voltam também a sincronizar a dependência de caminho <c4/> do repositório.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } para { "13.0.0" } e <c2/> { "2026.7.22" } para { "2026.10.19" } nas fixações do ambiente de referências independentes (<c3/>, <c4/>): as versões corrigidas para oito avisos do pillow e um aviso do certifi.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, o README e este ficheiro listam todos os limiares do kshana-bench que são NOT MET, tal como registados em <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } contra pelo menos { "0.80" } na partição de teste), <b>D1</b> (maior diferença { "0.0301" }) e <b>tarefa (b) R1</b> (transportado, não executado de novo). Nenhum limiar foi afrouxado.

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
seg-44d9c9622c24 = Revisão de completude do README: uma lista de conteúdos; os tipos de cenário arquivados por famílias, cada um com uma página em <c1/> (a descrição e os campos do motor, as entradas e os resultados de uma execução de exemplo, as linhas do registo e as referências independentes, as limitações que o relatório da execução indica e o gráfico que o motor escreve), uma folha de contactos por família, todos indexados por <c2/>; todos os comandos em <c3/>; todas as superfícies, comandos de plugin, skills e páginas do Studio em <c4/>; todos os domínios de capacidade em <c5/>; diagramas Mermaid incorporados (visão geral do sistema, superfícies, laço interno, confiança do recetor, ida e volta de laboratório, Studio, fluxo de testes e lançamento, mapa de módulos, distribuição). Escrito por <c6/>, <c7/> e <c8/>; auditado por <c9/>; protegido por <c10/>, que também fixa a descrição e os campos de cada entrada ao motor.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/>: renderiza um diagrama Mermaid para SVG e PNG em Linux e atualiza o registo de renderização.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README: as figuras de utilizadores espaciais e lunares usavam caminhos relativos a <c1/>, pelo que não carregavam a partir do README; uma ligação apontava para <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Removidos dois ficheiros de gráficos desatualizados, copiados à mão (<c1/>, <c2/>), que nenhuma página usava e que já não correspondiam ao motor; <c3/> contém os gráficos atuais.

# text
seg-033d52126d8a = Adicionado

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>GNSS para além da constelação (<c1/>).</b> Um novo tipo de cenário para veículos espaciais acima, em redor e para além das órbitas GNSS (<a1><c2/></a1>): disponibilidade de um e de quatro sinais, durações de interrupção, C/N0, DOP e ligações de lóbulo principal face a lóbulos laterais para GPS, GLONASS, Galileo, BDS, QZSS e NavIC numa casca ou ao longo de trajetórias LEO, MEO, GEO, HEO e de transferência lunar; diagramas de emissão do folheto, paramétricos ou fornecidos pelo utilizador; um modelo de ionosfera, plasmasfera e atmosfera por raio rasante; um projeto de recetor de sinal fraco; um filtro de Kalman estendido GNSS a bordo para HEO e transferência lunar; e navegação relativa de formação. Comparado com o folheto do Space Service Volume do ICG sob um pré-registo versionado antes da execução: as constantes de potência mínima radiada e o limiar lunar concordam, os outros limiares não são atingidos sob a leitura pré-registada (quase todos por causa do ângulo de feixe GLONASS inconsistente do folheto), e o substituto paramétrico de lóbulos laterais não reproduz os diagramas de painel GPS medidos. Tudo continua MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Órbita e superfície lunares como infraestrutura de navegação e geodésica (<c1/>).</b> Um novo tipo de cenário com cinco estudos selecionados por <c2/> (<a1><c3/></a1>): consistência de uma determinação de órbita GNSS terrestre a bordo numa órbita de halo quase retilínea face a uma determinação independente de distância e taxa de distância a partir do solo; fase da portadora com dupla diferença conjunta de estação à superfície e orbitador, com fixação de inteiros LAMBDA; informação de Fisher do datum lunar de sete parâmetros com e sem medições de distância entre orbitador e superfície; desvios inter-técnicas de GNSS, VLBI e medição laser face à ligação local; e sensibilidade a h2, k2, l2 e à libração física. MODELLED, com entradas ILLUSTRATIVE: a numérica é verificada face a programas independentes em numpy e scipy, e nada é comparado com uma medição de uma grandeza lunar. Os limiares foram fixados em <c4/> e em duas alterações divulgadas. Três são NOT MET e cada uma está fixada por um teste que afirma a falha: C3 (um erro de força injetado não é detetado à taxa pré-registada), Q3 (a taxa de sucesso por bootstrap difere da referência independente numpy em { "1.7e-6" } contra um limiar de { "1e-9" }, devido à aproximação da CDF normal do LAMBDA) e a metade do traço de G3 (acrescentar uma família de medições de distância nem sempre reduz o traço da pseudo-inversa). Os restantes são atingidos (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Um sexto artigo na tabela de Investigação.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) mostra que a diluição de precisão é indefinida para seguimento cislunar só por distância e usa em vez disso o Gramiano de observabilidade em quatro órbitas retrógradas distantes planas: só por distância tem característica { "2" } de { "4" } num instante e precisa de um arco de cerca de { "2.09" } h, a taxa de distância (Doppler) dá característica { "4" } instantaneamente, e coestimar uma estação com estados de satélites e relógios continua com défice de característica de um sem uma observável interferométrica externa. Os seus números são regenerados pelo tipo de cenário <c1/> (<c2/>); <c3/> testa o limiar com um estimador independente. O cartão de investigação do README, os READMEs de crates, npm e PyPI e o gerador incluem-no.

# text
seg-d74a1b2dcb38 = O árbitro neutro, tornado mensurável.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> lê o catálogo de ensaios e o plano de transmissão do Jammertest da NPRA publicados como verdade programada (identificadores do catálogo mantidos) e <c2/> pontua um registo de recetor face a ele por ensaio (latência de deteção, alarmes em falta, falsos alarmes, tempo de recuperação), opcionalmente como pacote de evidências assinado (<a1><c3/></a1>). Os limiares de pontuação foram pré-registados antes de qualquer execução pontuada (<c4/>). No conjunto de dados JammerTest { "2024" } (obtido, nunca incorporado) a regra de dados mínimos pré-registada falhou tanto na primeira execução como na revisão do tratamento de dados, pelo que nenhum limiar é avaliável e nada é reclamado; ambas as execuções estão registadas e fixadas. MODELLED: o calendário são as janelas registadas do conjunto de dados, não horas de emissão registadas. O conjunto NMEA da SimulaMet de { "2025" } não é adaptado (nenhuma licença indicada na sua página).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Os indicadores do próprio recetor, ao lado dos do Kshana.</b> UBX-NAV-STATUS <c1/> e UBX-SEC-SIG são lidos para <c2/> em cada época, e a comparação <c3/> no resultado coloca-os face aos monitores do Kshana (ambos, só o recetor, só o Kshana, nenhum); não emite nenhum alarme e não altera nenhuma pontuação. Juntam-se-lhes um leitor Septentrio SBF (PVTGeodetic, MeasEpoch, RFStatus, só de leitura, sobre a biblioteca <c4/> de licença MIT) e <c5/> (um fluxo NMEA série ou USB, só de leitura; nunca escreve num recetor).

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
seg-90d9927fe3e2 = <b>Temporização e segurança de hardware</b> (<a1><c1/></a1>, <a2><c2/></a2>). O tipo de cenário <c3/> pontua um ensaio de holdover de um sistema de temporização (GNSS retirado pelo operador, holdover, recuperação) a partir de um registo de erro de tempo medido, face às máscaras ITU-T de tabelas públicas. <c4/> lê registos do linuxptp (<c5/>, <c6/>, <c7/>) e do chrony (<c8/>, <c9/>). <c10/> escreve metadados ION GNSS SDR e <c11/> monitoriza uma gravação SigMF enquanto cresce (só receção). <c12/> passa a incluir o Foundational PNT Profile da NIST IR 8323r1 ({ "15" } linhas parafraseadas, fornece elementos de prova em apoio de). Um pacote de evidências pode registar a <c13/> do operador no seu manifesto assinado, nunca verificada; as etapas de hardware { "0" } a { "4" } e as notas legais estão em <c14/> (a aguardar revisão jurídica). Não existe nenhum caminho de transmissão de qualquer tipo.

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
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): tarefas, partições e métricas fixas para deteção de interferência GNSS em registos de recetor (JammerTest { "2024" }) e IQ, previsão de holdover de temporização (relógios IGS) e a diferença de otimismo fora da distribuição; manifestos de partição com somas de controlo fixadas e scripts de obtenção (sem dados incorporados), um conjunto reservado por compromisso e revelação, um esquema de ficheiro de resultados e uma página estática de classificação. Linhas de base sob limiares pré-registados em <c4/>: limiares do pontuador atingidos, C1 a C3 atingidos, D2 atingido; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } contra pelo menos { "0.80" } na partição de teste), <b>D1 NOT MET</b> (maior diferença { "0.0301" }) e <b>tarefa (b) R1 NOT MET</b> (transportado, não executado de novo), cada um fixado (<c6/>). Todas as pontuações são MODELLED. Python <c7/>, <c8/>; WebAssembly o mesmo; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Observatório de interferência</b> (<c1/>, <c2/>, <a1><c3/></a1>): um GeoJSON diário reproduzível, PNG e JSON de relatório de incidentes com três estados (degradado, não degradado, não observado), um atraso mínimo de { "24" } h, células de { "0.5" } graus ou mais grosseiras, nenhuma causa atribuída e dados do OpenSky recusados; um estudo de sensibilidade dos parâmetros pré-registados; um catálogo retrospetivo de 30 dias do Báltico a partir de adsb.lol.

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
seg-497ae18bfb03 = <b>Entradas de máquina e de sensores para <c1/></b> (<a1><c2/></a1>). Novos valores de <c3/>, todos só de leitura, MODELLED, com conjuntos de dados de ensaio escritos internamente e sem dados incorporados: <c4/> (ficheiros de solução <c5/> do RTKLIB), <c6/> (<c7/> OEM7 ASCII e binário, C/No de <c8/> e <c9/>; o indicador de jammer do recetor passa a ser o <c10/> da época, confrontado com os alarmes do Kshana pela comparação <c11/>), <c12/> (C/N0 MSM4 e MSM7 para GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou e NavIC; disposições das tabelas pyrtcm de licença BSD, cujo aviso está em <c13/>, não da norma RTCM) e <c14/> (mensagens do Monitor e do monitor PVT do GNSS-SDR como linhas JSON, retransmitidas por <c15/>).

# text
seg-22e8b434782f = Registos IMU como segundo sensor.

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
seg-5491196d6421 = <c1/> (<c2/> ou <c3/>) integra a taxa de guinada do giroscópio no rumo que o monitor <c4/> lê; inline em todas as superfícies e transportado através dos pacotes de evidências. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plugin <c9/>, uma ação JetBrains) ajusta os parâmetros do acelerómetro e do giroscópio dos cenários <c10/> e <c11/> a partir de um registo estacionário por desvio de Allan e imprime uma tabela <c12/> com o SHA-256 do registo na sua proveniência.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Integrações:</b> um pacote ROS { "2" } (<c1/>: NavSatFix e <c2/> à entrada, tópicos de confiança à saída; a sua ponte sem ROS é testada contra o motor real, o próprio nó não foi executado num grafo ROS em funcionamento), uma ponte <c3/> (<c4/>, dependência MIT, opcional) e um retransmissor GNSS-SDR.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Exportador MQTT do Home Assistant</b> para telemetria de confiança: <c1/> e <c2/> (mensagens de descoberta e um documento de estado JSON; só publicação, sem credenciais nem TLS), e <c3/> como texto em Python, WebAssembly e MCP.

# text
seg-f1cb2c2881c9 = Sete linhas MODELLED do registo para o que antecede. Nada aqui é VALIDATED: não foi lida nenhuma captura de um recetor real, estação de base, IMU, execução do GNSS-SDR, grafo ROS ou broker MQTT.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Margem da ligação ótica ao longo do tempo.</b> O tipo de cenário <c1/> aceita uma tabela opcional <c2/> (<c3/>, <c4/>, <c5/>) e passa então a escrever também, por local, uma realização com semente do modelo de local indicado ao longo do tempo: episódios de nuvens, uma coluna de água líquida por episódio, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem da ligação, os desvanecimentos por nuvens e por cintilação e o indicador de ligação ativa, com a disponibilidade realizada, a fração de nuvens, o número de interrupções e a interrupção mais longa. MODELLED (uma extração do modelo, não do clima; sem referência independente externa). Sem a tabela o resultado é o documento da { "0.37" }. Os dois cenários óticos incluídos trazem a tabela ({ "336" } h, { "600" } s, semente { "37" }). Limiares pré-registados em <c6/> antes da primeira execução.

# text
seg-78524dbb3bd2 = Especificação das condições de ensaio e a ida e volta de laboratório.

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
seg-fbf034925641 = <c1/> é publicado como <a1><c2/></a1> com um esquema JSON e passa a incluir <c3/>. <c4/> também escreve <c5/>. <c6/> constrói um pacote assinado que liga a soma de controlo do cenário, a das condições indicadas, a do registo do recetor e a pontuação face aos eventos indicados, e recusa condições que discordem dos eventos de pontuação. Exemplo trabalhado com gps-sdr-sim a escrever apenas um ficheiro; a reprodução é da responsabilidade do operador e nunca é automatizada. Python <c7/>, MCP <c8/>, plugin <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Pacotes de normas</b> (<c1/>, <c2/>): os perfis de ensaio do referencial DHS Resilient PNT para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e monitorizar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }, cada um um conjunto de cenários pontuados face a limiares indicados antes da execução, com as linhas de compliance-report para as quais fornecem elementos de prova em apoio. As falhas estão registadas e fixadas: DHS L4-T1 e os quatro ensaios de exatidão da IMO. O próprio Doc { "9849" } não foi lido (pago); o pacote ICAO segue a apresentação do próprio Plano de Mitigação de RFI do ICAO. <c3/> passa a ter uma secção de standards-pack. Tudo MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): códigos Gold AFS-I e Weil AFS-Q para PRN { "1" } a { "210" }, sinais <c2/> e <c3/> em <c4/>, o código SB1 BCH, CRC-24Q e entrelaçador, e <c5/> (<c6/>, <c7/>, <c8/>), fixado ao LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } de janeiro de { "2025" }). Códigos VALIDATED face às tabelas impressas do documento (que este assinala como TBC); uma coluna terciária impressa (PRN { "147" }) é provavelmente uma gralha e a falha está fixada. A codificação LDPC das subtramas { "2" } a { "4" } não está implementada.

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Cadernos do curso</b> (<c1/>): jamming, spoofing, holdover, integridade, OSNMA e mapa de interferência, cada um com exercícios.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>Estudo de URA máximo da Etapa { "3" } do ARAIM do WG-C UE-EUA</b> (<c1/>, <c2/>), que substitui o plano retirado da "Table A-3"; MODELLED com desvios indicados.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Rascunhos para decisão do responsável</b> em <c1/>: artigo JOSS, alteração da carta do TSC, processo de registo de referências independentes e uma proposta de divisão de <c2/>. Nada ali está adotado.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Vistas do Studio para as funcionalidades da { "0.38" }</b> (kshana.dev/studio/). Repetição da ponte (duas execuções sintéticas num só relógio: trajetória, pontuação de confiança, os satélites que o registo ouve e o veredicto, com os indicadores do próprio recetor ao lado dos alarmes do Kshana); PNT ótico (os dois cenários <c1/>, com uma realização com semente opcional de <c2/>, MODELLED); Ensaio de holdover (o resultado de <c3/> medido face às máscaras ITU-T, desenhado a partir do próprio <c4/> do resultado); um visualizador do observatório de interferência que abre os ficheiros que o utilizador produziu e não inclui nenhum; na página Ferramentas, um pontuador do Jammertest, um ajuste IMU e o MQTT como formato de telemetria; e em Confiança um seletor de formato de registo (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) com um ficheiro IMU opcional. Cada vista lê ficheiros no navegador e não envia nada; cada valor mantém a etiqueta que o registo lhe atribui e cada uma traz a declaração consultiva. A página <c6/> do sítio mostra o fragmento <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Questão #36: camadas de fixação exata ao byte.</b> As camadas de fixação exata ao byte só são executadas num anfitrião declarado como linha de base (<c1/>, definido por <c2/>), não em todos os Mac com chip Apple, porque a biblioteca matemática da Apple difere entre versões do macOS; a camada portátil é executada em todo o lado, e <c3/> impede que uma camada exata ao byte volte a ser condicionada apenas pela plataforma. As próprias comparações com as referências independentes passam no macOS. Nenhum literal foi retomado e nenhuma tolerância foi alterada. <c4/> e <a1><c5/></a1> explicam como triar uma diferença; <c6/> é um diagnóstico manual e semanal, não uma barreira.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL: um padrão não ancorado no auxiliar trust-open do Studio</b> passa agora a corresponder ao cabeçalho inteiro (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI: disco do executor.</b> A tarefa <c1/> compila os perfis de desenvolvimento e de teste sem informação de depuração, pelo que a ligação já não enche o disco.

# text
seg-38c59868835e = <b>Guardas de código-fonte.</b> Todo o ficheiro de código-fonte que contém conjuntos de dados de teste com fixações declara o âmbito das suas fixações, e os testes que escrevem ficheiros temporários usam um caminho único por chamada, pelo que as execuções paralelas não podem colidir.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> é regenerado para o campo opcional <c2/> de optical-atmosphere.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>Plugin JetBrains: sem uso de API da plataforma obsoleta ou programada para remoção.</b> O IntelliJ Plugin Verifier (<c1/>) face à compilação { "263" } do IntelliJ IDEA ({ "2026.3" }: { "263.6800.24" } e { "263.7031.23" }) encontrou uma chamada obsoleta, <c2/>, em Insert Example; passa agora a abrir o novo ficheiro com <c3/>. O plugin é compatível com { "2024.3" } (a versão since-build, inalterada) e com ambas as compilações { "263" }, sem avisos. A CI executa agora <c4/> e falha perante problemas de compatibilidade e perante qualquer uso de API programada para remoção.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>PNT ótico através da atmosfera</b> (tipo de cenário <c1/>, <a1><c2/></a1>, nota de projeto <c3/>). Para uma ligação ótica e um conjunto de locais em terra, reporta a perda em céu limpo dependente do comprimento de onda e da elevação, o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, desvanecimentos gama-gama, média de abertura), a disponibilidade face à margem da ligação a partir de um clima de nuvens indicado, a margem necessária para disponibilidades-alvo e o teto que nenhuma margem ultrapassa, a distribuição das durações de interrupção, o erro de temporização e de alcance por interrupção através do modelo de holdover do relógio, a diversidade de locais correlacionada com a distância e os ganhos hipotéticos de uma mudança de comprimento de onda, de uma abertura maior, da redução de cintilação por ótica adaptativa e de margem adicional. <c4/> passa a ter um orçamento sensível à atmosfera; sem ele, a sua saída é idêntica bit a bit à da { "0.36" } (limiar A5). Dois cenários incluídos trazem climas de nuvens ILLUSTRATIVE. MODELLED: três linhas do registo. A numérica satisfaz os limiares A1 a A6 pré-registados em <c5/> face a um programa independente em mpmath; isso verifica a implementação das fórmulas indicadas, não a atmosfera, e nenhum registo de disponibilidade medida foi comparado, pelo que nenhuma linha é VALIDATED. O limiar A4 foi falhado inicialmente por { "3e-9" } porque a CDF normal em uso era uma aproximação de { "1.5e-7" }; a CDF foi substituída e o limiar mantido como registado. As compilações nativa e WebAssembly devolvem documentos idênticos byte a byte para ambos os cenários incluídos (A7, executado no commit de integração da { "0.37.0" }).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>ROC de deteção dos monitores IQ</b> (PRO-32, <a1><c1/></a1>). Uma campanha com monitores guarda o máximo de cada estatística de teste sobre janelas de eventos indicados (positivas) e sobre janelas em mosaico fora dos eventos (negativas, <c2/>). O relatório agrega-as por tipo de alarme numa ROC com a sua AUC e o ponto de funcionamento no limiar configurado, como <c3/> e uma secção do relatório. Em campanhas sintéticas, a verificação do nível de acaso é satisfeita. O limiar de AUC do C/N0 ({ "0.95" }) não é atingido ({ "0.79" }), porque as janelas negativas imediatamente a seguir a um evento herdam o decaimento do CUSUM a partir da deteção; isto fica registado. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>Monitores IQ na campanha de repetição em laboratório</b> (PRO-31, <a1><c1/></a1>). Uma tabela opcional <c2/> num ficheiro de campanha executa os monitores IQ na passagem única do executor: potência e espetral após cada cadeia de front-end, e C/N0, SQM e bloqueio por canal seguido. Os seus alarmes são pontuados face aos eventos indicados: detetado ou em falta, tempo até à deteção e falsos alarmes por hora de exposição. Indica-se o valor de falso alarme em forma fechada de cada teste, incluindo um novo valor gaussiano bilateral para os testes SQM (<c3/>). Sem a tabela nada muda. Em campanhas sintéticas, os limiares de falso alarme de potência e SQM e o de falso alarme de C/N0 são atingidos; { "18" } de { "18" } atenuações são detetadas, mas o limite do tempo até à deteção, abaixo de uma amostra do detetor por construção, não é atingido e fica registado. MODELLED; linha do registo "IQ monitors scored in lab-replay campaigns".

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Ajuste de laboratório a partir de campanhas IQ, seguimento</b> (<c1/>, tarefa de CI <c2/>). Testa as duas hipóteses que a §{ "13.6" } de <c3/> deixou em aberto, face a limiares pré-registados em 1e532f84. Acrescenta duas campanhas sintéticas: S, com um J/S em degraus (semente 2026_1014), e R, uma rampa nova (semente 2026_1015). Os resultados estão em <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 atingido: com cada nível de J/S mantido, <c1/> é recuperado dentro de +{ "0.185" } dB. O erro de −{ "1.1" } dB das campanhas em rampa é atraso do estimador.

# text
seg-ea9f206c2999 = S2 não atingido, fixado por um teste que afirma a falha: (d) tal como escrito na campanha em degraus verifica-se para o modelo do laço de seguimento ({ "0.45" } dB) mas não para o empírico ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 atingido: na campanha em rampa nova, (d) com o produto do tempo de permanência de queda ajustado pela taxa de rampa de cada evento acrescentado fica dentro de { "1" } dB para ambos os modelos.

# text
seg-24c6725c2c7d = As falhas de (a′) e (d) replicam-se em R.

# text
# c1: step
seg-7cbbce356973 = Uma campanha pode agora indicar o seu J/S como um perfil <c1/> no ambiente de teste.

# text
seg-34007ba58a9f = Nenhum veredicto da §{ "13" } muda, e a linha do registo continua MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Captura inicial do FLL limitada, opcional</b> (DS-LOOP-05): uma nova chave de projeto de laço <c1/> (s), em Rust <c2/>. Com <c3/> força a passagem de FLL para PLL passado esse tempo, seja qual for o PLI. Não definida por omissão e, nesse caso, fora da soma de controlo do projeto; o projeto predefinido e a sua soma de controlo não mudam.

# text
seg-ae2794b2d3d5 = Verificado face a limiares pré-registados em 58789af0, em verdade injetada. O controlo é atingido: o valor predefinido nunca passa o controlo em { "9" } de { "10" } sementes a { "33" } dB-Hz.

# text
seg-6d9483874b35 = Não atingido: com um limite de { "1.0" } s, { "16" } de { "20" } execuções mantêm o bloqueio a { "33" } dB-Hz e { "8" } de { "20" } a { "31" } dB-Hz; as restantes alternam entre passagens forçadas e o regresso do FLL. O jitter de fase é { "1.8" }× o do PLL isolado a { "33" } dB-Hz.

# text
seg-deeefaf50e3e = O patamar de captura inicial de ~{ "35" } dB-Hz continua a ser o limite documentado do valor predefinido.

# text
seg-780de73c01e1 = MODELLED; linha do registo "Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)".

# text
# c1: jamming
seg-ace6b53749bd = <b>Histerese de aquisição e quantizador do front-end no tipo de cenário jamming</b> (CAP-06c): duas secções opcionais para um cenário <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, igual ou superior ao limiar de seguimento) e <c3/> (s, por omissão { "0" }). Um satélite é adquirido no limiar de aquisição ou acima dele, depois de ter estado não adquirido durante o atraso. É mantido enquanto estiver no limiar de seguimento ou acima dele. Saídas: <c4/> (verdadeiro/falso), <c5/> (contagem) e <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/>: <c2/> ({ "1" } a { "16" }) e <c3/> (MHz, por omissão o dobro da taxa de chip). Produz um bloco <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, retirada ao C/N0 efetivo de cada ligação) e <c8/>. A perda é a de entrada gaussiana, assinalada como não válida para jammers CW, de banda estreita e de varrimento.

# text
seg-0dad81736863 = Sem as secções, todas as saídas são idênticas byte a byte.

# text
seg-92007bfb6680 = Verificado face a limiares pré-registados em 70c72fcc. A perda do quantizador fica dentro de { "0.0007" } dB de um Monte Carlo independente, e a leitura do AGC dentro de { "0.012" } dB do laço de AGC da camada IQ.

# text
seg-973e451df99d = As execuções de histerese registadas foram pouco informativas (todas as ligações perdidas), pelo que esse limiar é NOT MET. Um conjunto suplementar de execuções registado em { "37793290" } satisfaz-o: cada indicador é igual a um recálculo independente, e { "732" } de { "1824" } ligações mostram a histerese.

# text
seg-912e9f1a4d5b = Resultado: com um jammer CW, um ADC de 1 bit perde cerca de { "5" } dB mais do que o valor gaussiano.

# text
seg-a19aee81b581 = MODELLED; linha do registo "Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations".

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Sombra de terreno sobre o jammer no tipo de cenário jamming</b> (CAP-06b): uma secção opcional <c1/> num cenário <c2/> com um jammer. Campos:

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/>: uma tesela SRTM <c2/>, relativa ao diretório de trabalho;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> e <c3/> (graus): o tamanho e o canto da tesela;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, por omissão { "0" }), <c2/> (por omissão 4/3) e <c3/> (m, por omissão { "30" }).

# text
seg-ad58fe7ff627 = O motor amostra o perfil de terreno em círculo máximo entre o jammer e o recetor e encontra o gume de faca dominante. A potência recebida do jammer, e portanto cada J/S, é reduzida pela perda de gume de faca único da ITU-R P.526-15 §{ "4.1" }.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = O resultado passa a ter um bloco <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) e <c7/> (contagem).

# text
seg-b9696f5eda4b = Sem a secção, todas as saídas são idênticas byte a byte.

# text
# c1: ν
seg-593b6a5b4480 = Verificado face a limiares e a dez posições pré-registados em 92cd2bfd, na tesela SRTM real versionada do Vale da Morte, face a um recálculo independente em numpy. Todos atingidos: pior diferença { "1.6e-10" } em <c1/> e na perda (limiar { "1e-9" }), a perda monótona na altura do jammer, e a perda a reduzir o J/S exatamente do seu valor.

# text
seg-62e07defd715 = MODELLED; linha do registo "Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile".

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>Ganhos de antena CRPA no tipo de cenário jamming</b> (CAP-06a): uma secção opcional <c1/> num cenário <c2/>. Campos: <c3/> (posições dos elementos em este-norte-cima local, m), <c4/> (<c5/> ou <c6/>) e <c7/> (largura de banda de ruído do MVDR, MHz, por omissão o dobro da taxa de chip).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Cada canal forma um feixe sem distorção na direção do seu satélite. O ruído da ligação é escalado por <c1/> e o jammer por <c2/> antes da equação de C/N0 anti-jam existente.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Cada ligação passa a ter um bloco <c1/>: <c2/> (dB) e <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Uma secção inválida (uma lista de elementos vazia, uma ponderação desconhecida, uma largura de banda não positiva) é um erro, através de <c1/> e <c2/> tal como de <c3/>.

# text
seg-2464d9dde85f = Verificado face a limiares pré-registados em 08d83b4d. Atingidos: aditividade (após uma correção: a primeira compilação acrescentou as novas unidades à tabela de unidades de cada execução de jamming); um elemento não é um agrupamento; ganho de ruído e C/N0 efetivo face a um recálculo independente em numpy dentro de { "1e-9" } dB; o MVDR tende para o nulo com JNR elevado.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = Não atingido: o ganho do jammer do MVDR em { "194" } de { "456" } ligações com a matemática portátil da { "0.36" } ({ "202" } com matemática do anfitrião; <c1/>) (pior { "1.7e-6" } dB). Os resíduos de −{ "100" } a −{ "188" } dB estão abaixo da resolução do float64 nesse limiar, e o numpy discorda de si próprio na mesma ordem de grandeza.

# text
seg-c10e1c72eb15 = MODELLED; linha do registo "CRPA antenna gains in the jamming kind against an independent numpy recomputation".

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>Motor de seguimento IQ face ao GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> e o GNSS-SDR seguem as mesmas gravações independentes em numpy de GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Limiares pré-registados em 48edd4a5. A calibração registada falhou numa passagem errada do GNSS-SDR (F3), pelo que a Emenda { "1" } (1e4288c4) acrescenta aos dois recetores um FLL apenas de captura inicial, versionado antes de qualquer gravação de teste.

# text
seg-1d651ff134f9 = Atingidos: o jitter de portadora e de código e o Doppler concordam dentro de { "5" } % em todos os C/N0.

# text
seg-bc9c9a0247d1 = Não atingidos: o C/N0 NWPR do motor lê { "2.3" }–{ "7.1" } dB abaixo do SNV do GNSS-SDR (F4, um limite conhecido do estimador; o M2M4 está a { "0.06" } dB da verdade); os indicadores de bloqueio diferem por definição (F5); um desacordo de deslize a { "30" } dB-Hz (F6).

# text
seg-7c32867b5c27 = MODELLED; linha do registo "IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings".

# text
seg-6ba057fab559 = <b>Duas linhas VALIDATED para códigos da camada IQ</b> (DS-GIQ-06b, PRO-39).

# text
seg-55524624777b = <b>BeiDou B1I.</b> Todos os { "63" } códigos primários B1I coincidem, chip a chip, com o gerador independente do GNSS-SDR { "v0.0.19" } (limiar pré-registado em 911106d1). Apenas a saída desse programa está versionada: os códigos PRN B1I que o ICD público define, como prefixo e soma de controlo.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Todos os { "126" } códigos L1CP/L1CD e { "63" } sobreposições L1CO coincidem com as colunas de verificação que a IS-GPS-800J imprime, e a sequência de Legendre calculada coincide com a sua Tabela 6.2-1 (limiares pré-registados em fe372e26).

# text
seg-f445784a7f2d = Linhas: "BeiDou B1I primary ranging codes against an independent generator" e "GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns".

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>Bandas GLONASS, BeiDou e Galileo E6 no modelo de espetro</b> (CAP-12, sinais): novos nomes de banda <c1/> e <c2/> (qualquer canal FDMA como <c3/>, K = −{ "7" } a { "6" }), <c4/>, <c5/>, <c6/>, <c7/> e <c8/>. Cada uma traz a portadora, a modulação e a potência mínima recebida do seu ICD. São opcionais por nome: o conjunto de bandas predefinido e todas as saídas existentes não mudam.

# text
seg-158a6ec19d6b = Verificado face a limiares pré-registados em 5806f28b: os valores do ICD, os nulos, o composto B1C e o caminho C/N0 são atingidos.

# text
seg-805092ae8ca2 = Dois limiares não foram atingidos. O limiar de área unitária era inatingível tal como escrito (F1). As formas de onda B1I e B1C da camada IQ só coincidem com o modelo em média de banda, devido aos espetros de riscas irregulares dos seus códigos (F2).

# text
seg-db88f07d97bb = MODELLED; linha do registo "Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)".

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Opção CFAR de média de células na aquisição IQ</b> (PRO-37): <c1/> e <c2/> decidem numa grelha de aquisição comparando cada célula com a média de células de referência na sua linha de Doppler. O limiar vem da probabilidade de falso alarme CA-CFAR em forma fechada para <c3/> blocos não coerentes (<c4/>, <c5/>), pelo que a decisão não depende da normalização da potência das amostras. É opcional; o detetor predefinido e todas as saídas existentes não mudam.

# text
seg-a56e74b1e091 = Verificado face a limiares pré-registados em 3724aefa: a forma fechada face a Monte Carlo ({ "18" } de { "18" } casos), e uma taxa de projeto de { "1" } % medida em { "0.97" }–{ "1.01" } % em ruído gaussiano e em ruído quantizado a 2 bits.

# text
seg-f88fe97e0ee6 = Um limiar não foi atingido: num sinal de 2 bits sem ruído, { "1.28" } % das células fora do pico excedem o limiar, nos lóbulos laterais de correlação do código (resultado F1).

# text
seg-8d88b626c31e = MODELLED; linha do registo "Cell-averaging CFAR option in IQ acquisition".

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Modelo de cintilação face a dados medidos</b> (PRO-34): o modelo de cintilação de Cornell do canal IQ foi comparado com intensidade e fase GPS L1 medidas a { "50" } Hz numa noite de cintilação equatorial (registo Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), sob limiares pré-registados em b6ccb499. Atingidos: a distribuição da intensidade e a cintilação de fase ligada ao S4. Não atingido: o modelo desvanece { "2.4" } vezes mais frequentemente abaixo de −{ "10" } dB e { "3.5" } vezes mais tempo (resultado F1). O processamento registado lê a fase enrolada do modelo (resultado F2); o resultado de fase mantém-se com ela desenrolada. <c1/> obtém os dados. A linha continua MODELLED: "IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation".

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Leitor de amostras LuGRE corrigido</b> (MR-09): <c1/> lê um lote IQ LuGRE com I no nibble alto e os níveis mid-rise <c2/> (<c3/>), que retiram a média de −½ que os inteiros em complemento para dois simples trazem em I e Q. <c4/> dá ao GNSS-SDR a mesma leitura. O leitor ION genérico e todas as saídas existentes não mudam: { "149" } resultados de cenário e um estudo são idênticos byte a byte antes e depois, e os resultados LuGRE fixados leem-se como registados (<c5/>). Nenhuma linha do registo muda.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Seguimento BOC({ "1,1" }) opcional</b> (CAP-07 (a)): <c1/> reescala os discriminadores do DLL para o pico principal do BOC({ "1,1" }) em seno e acrescenta um monitor bump-jump (correladores muito adiantado e muito atrasado a ±{ "0.5" } chip, contadores ascendentes/descendentes, <c2/>) que afasta o NCO de código de um pico lateral; <c3/> lista os saltos. Desligado por omissão, e todas as saídas existentes não mudam. Verificado face a limiares pré-registados em 6b68f6cc num sinal BeiDou B1C sintético: um arranque em pico lateral que fica a { "0.55" } chip sem a opção é puxado para o pico principal por um salto aos { "0.08" } s com ela, e não se viu nenhum salto falso a partir do pico principal. Um limiar não foi atingido: a grelha de testes unitários da escala chega a fora do intervalo linear dos discriminadores (resultado F1 em <c4/>). MODELLED; linha do registo "BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)".

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Ajuste de laboratório a partir de campanhas IQ</b> (B7.1, <a1><c1/></a1>). O <c2/> de um cenário labfit ajusta uma pasta de saída de <c3/> na CLI (<c4/>), em Python (<c5/>) e na ferramenta labfit do MCP (apenas pastas dentro do seu diretório de trabalho). Ajusta uma unidade por sinal, projeto de laço, cadeia de front-end e tipo de jammer:

# text
seg-1726361b81c4 = o modelo de C/N0 face a J/S indicado, com censura;

# text
seg-e1b8a27b06fd = o limiar de seguimento, diretamente e em forma fechada;

# text
seg-8dce89923619 = os modelos de bloqueio do laço de seguimento e empírico, acoplados através do modelo de C/N0, com os seus tempos de permanência;

# text
seg-108646713c97 = um bootstrap de agrupamentos com semente sobre as gravações, intervalos de previsão de { "90" } % e conjuntos reservados deixando uma gravação de fora;

# text
# c1: [validation]
seg-ee5deb4d5d4b = uma tabela <c1/> pré-registada, com soma de controlo, com PASS/FAIL por limiar.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = O relatório é <c1/> em JSON, CSV e Markdown, com um bloco de unidades. <b><c2/> não é identificável a partir de dados de C/N0</b> sem uma medição de potência independente. É indicado, nunca ajustado, e o parâmetro ajustado é <c3/> (alteração de projeto de 2026-10-12). Um tipo de jammer desconhecido assume o <c4/> indicado mais prejudicial (cw, { "1" }). Em campanhas sintéticas a partir das cenas do próprio Kshana, o limiar de cobertura do conjunto reservado (c) passa. Os limiares (a') e (b') de <c5/> ({ "0" } de { "50" } campanhas cobertas) e o limiar de seguimento em forma fechada (d) não são atingidos: ficam registados com os seus valores. MODELLED; linha do registo "Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error". O caminho labfit de registo de recetor e as suas saídas não mudam.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> num kernel da JPL</b> (CAP-31): <c2/> toma cada corpo que o SPK contém (com de440s: Mercúrio, Vénus, a Terra, a Lua) do kernel, etiqueta <c3/>, e acrescenta um bloco <c4/> apenas quando definido. Nova linha, VALIDATED face ao SPICE (pré-registada f8e946ea; pior { "3.3e-5" } m, { "1.0e-11" } m/s). O relatório predefinido não muda.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop na efeméride DE440</b> (CAP-20b): <c1/> varre C3 e V∞ de chegada em estados heliocêntricos de um SPK DE440. Nova linha, VALIDATED face a estados do SPICE

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (pré-registada 2d857fb1; Terra a Marte 2026-2028, { "304" } células, pior { "2.6e-14" }, a mesma célula de C3 mínimo).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>Macromodelo não gravitacional do LRO: NOT MET</b> (DS-LRO-10, pré-registado e82047e2). <c1/> (opcional através de <c2/>): radiação solar direta em placa plana com a sombra da Lua, um painel que segue o Sol, e albedo lunar e infravermelho térmico; <c3/> é uma aproximação genérica de LRO etiquetada, a partir de factos publicados (sem placas do corpo: a tabela de placas não pôde ser obtida). No arco de { "4" } h do LRO, deixa o RMS reduzido-dinâmico em { "6.668" } m e o dinâmico em { "11.94" } m, com um fator de radiação inverosímil (cerca de +{ "21" } / −{ "22" }), pelo que os três limiares são falhados. O resultado está fixado por um teste, e nenhuma saída predefinida muda (<c4/>). O SRP lunar de bala de canhão opcional usa agora a sombra cónica da Lua em vez da da Terra (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>OD lunar: maré sólida k2 opcional e relatividade selenocêntrica</b> (DS-LRO-11), desligadas por omissão (<c1/>, <c2/>); um seletor <c3/> para a validação cruzada com o ANISE (DS-LRO-04); um conjunto de dados de ensaio de arco de { "24" } h do LRO e um ajuste de arco longo apenas informativo (DS-LRO-09). As execuções informativas estão registadas em <c4/>; nenhum número publicado muda.

# text
seg-b065138adba8 = <b>NRHO CR3BP { "9" }:{ "2" } face ao CAPSTONE</b> (CAP-29d): nova linha MODELLED que mede a NRHO circular restrita do motor face à órbita voada do CAPSTONE (JPL Horizons, março de { "2023" }; pré-registada { "4e868170" }): período { "1.07" } %, apolune { "0.05" } %, perilune { "4.1" } % a partir das médias do CAPSTONE, dentro dos limiares registados de { "3" } / { "5" } / { "20" } %. Uma medição, não uma validação.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>Estados rotativos CR3BP para ICRF centrado na Lua</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> mapeiam um estado rotativo adimensional Terra-Lua para a linha Terra-Lua instantânea da DE440, incluindo a taxa fora do plano do referencial. Nova linha, VALIDATED face a um referencial de dois vetores do SPICE (pré-registada 2313eb1b, alterada antes de qualquer execução d5ef79b3; { "72" } casos, pior { "1.8e-7" } m e { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>Membros de famílias CR3BP face à API de Órbitas Periódicas de Três Corpos do JPL: NOT MET</b> (RM-35, pré-registado a9074f65). <c1/> (correção de halo, NRHO e DRO, índice de estabilidade da monodromia, continuação por pseudo-comprimento de arco) coincide com { "54" } de { "58" } membros da API em todos os limiares (estado, período e Jacobi dentro de { "1e-10" } em todos os casos). Um índice de estabilidade de halo L1 ({ "9.5e-2" }) e três fechos de DRO pequenas ({ "1.5e-8" } a { "3.3e-8" } contra { "1e-8" }) falham, pelo que o módulo é <c2/> e nenhuma linha o reclama. Resultados: <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Orientação e ambiente lunares DE440 opcionais</b> (FUT-05, DS-LRO-08; predefinições inalteradas): <c1/>, <c2/> / <c3/> (ancoradas à época, eixos principais DE440) e <c4/> (orientação de eixos principais DE440 incorporada mais o Sol e a Lua geocêntricos de um SPK DE440 fornecido pelo utilizador). Face ao ANISE (pré-registado ea537710): orientação dentro de { "3.5e-7" } rad e ajustes do LRO dentro de { "1" } mm, mas o ramo da efeméride falhou o seu limiar (Sol { "30.7" } m, Lua { "1.1" } m, um desvio de tempo de ~{ "1" } ms do lado do ANISE), pelo que não é uma linha validada. Resultados: <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Datum da campanha do referencial lunar, limiar NumPy escalado pela condição: NOT MET</b> (pré-registado b887eb05; continua MODELLED). O passo { "0" } exclui o recurso à pseudo-inversa como causa da diferença de { "0.30" } com as estações estimadas; o NumPy concorda dentro do limiar em seis de oito cenários, mas stations_estimated falha-o ({ "6.8e-6" } contra { "5.9e-7" }), e na data nova 2026-12-01 uma baliza do polo sul não observada torna a informação da baliza deficiente em característica, o que a referência independente inalterada não consegue avaliar. Resultados: <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Datum do referencial lunar a partir de uma campanha de observação real (Lua analítica) VALIDATED</b> em pontos normais EDC novos de { "2025" } (pré-registado 31f5283 antes de qualquer um ser obtido): a referência independente SPICE e NumPy inalterada concorda na contabilidade, nas características e no acoplamento nulo, e dentro de { "1.11e-3" } nos sigmas (limiar { "1e-2" }), { "8.95e-4" } na condição e { "1.79e-3" } nas razões transversal/longitudinal (limiar { "2e-2" }). Apenas uma verificação de biblioteca do cálculo da covariância; os limiares não discriminam modelos da Lua. Resultados: <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>Orientação IAU dos corpos e GM dos catorze corpos do sistema solar acrescentados</b>, separados da linha "Physical constants of every solar-system body" para uma linha VALIDATED (pré-registada 154bc54): <c1/> concorda com o <c2/> do SPICE em pck00011 dentro de { "1e-9" } rad em { "574" } matrizes nas épocas originais e em { "574" } em { "41" } épocas novas nunca comparadas antes (pior Fobos { "1.38e-10" } rad), e <c3/> é igual a gm_de440 para os catorze corpos. O resto da linha original (J2, raio médio, o relatório) continua MODELLED. Resultados: <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Lambert de várias revoluções</b> (<c1/>): todas as soluções com até três revoluções, ambos os ramos. Nova linha do registo, VALIDATED face ao pykep { "3.0.1" } (pré-registada a75de851; { "382" } casos, { "1058" } soluções, pior diferença de velocidade { "1.6e-13" } contra { "1e-8" }). A guarda interna de aterragem de Kepler encontrou uma limitação de <c2/> num arco com e = { "0.994" }; está registada em <c3/>.

# text
seg-b62dc38b09e9 = Pressão de radiação solar de caixa-asas e ECOM2 (DS-PA-14), opcional.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/>: um modelo de caixa-asas de placas planas com as tabelas Galileo FOC/IOV dos metadados de satélites do GSC, em guinada GNSS nominal, com derivadas parciais do fator de radiação e por painel, e o modelo empírico ECOM2 com as suas derivadas parciais. Selecionado com <c2/> / <c3/> (campos <c4/>, por omissão <c5/>: o caminho de bala de canhão e todos os valores de referência não mudam); com um conjunto de caixa-asas, <c6/> é o seu fator de radiação. Comparado com o Orekit { "12.2" } sob um pré-registo (<c7/>): todos os limiares atingidos, cerca de { "1e-15" } relativo; VALIDATED como avaliação de modelo, a previsão de SRP do Galileo continua MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>Sombra de SRP com Terra achatada e escurecimento de limbo solar (FUT-09, RM-11).</b> Novo módulo <c1/>: <c2/> (elipsoide ocultante WGS-84), <c3/> (lei de Eddington) e <c4/>, selecionado com <c5/> (por omissão: a sombra cónica esférica existente, inalterada); <c6/>. A sombra achatada concorda com a razão de iluminação do Orekit { "12.2" } dentro de { "7.4e-9" } em { "2400" } geometrias (VALIDATED, <c7/>); o escurecimento de limbo não tem referência independente externa (MODELLED).

# text
seg-f09d4b831dfe = Termosfera NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/>: uma adaptação de <c2/> e <c3/> (comutadores, modos de Ap diário e de matriz ap de 3 horas) da versão em C de domínio público do Fortran do NRL. É idêntica bit a bit a essa adaptação em C e fica dentro de { "1.9e-6" } relativo do pymsis { "0.13.0" } (Fortran do NRL, precisão simples) numa grelha de 720 pontos, e reproduz os { "17" } casos de teste publicados (VALIDATED; <c4/>). Isto valida a adaptação, não a exatidão do modelo face à densidade medida.

# text
seg-9e8e9018dbaf = Nível opcional de densidade de arrasto NRLMSISE-00.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> e <c4/>. O modelo exponencial estático continua a ser o predefinido, bit a bit. A meteorologia espacial é constante por modelo. VALIDATED ao nível da órbita face ao arrasto NRLMSISE-00 do próprio Orekit { "12.2" } ao longo de { "24" } h (pior { "0.03" } m contra até { "142" } km de deslocamento por arrasto; <c5/>).

# text
seg-b1b2ac9ac91e = Sol e Lua DE440 opcionais no propagador de Cowell (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> aceita qualquer <c2/> (por exemplo, um <c3/> DE440) para os termos de terceiro corpo e de SRP; recusa um fornecedor que não consiga servir a época, conta os recursos à série analítica e está desligado por omissão. <c4/> mantém precisão em duas partes. Face ao Orekit { "12.2" } no seu próprio leitor DE440, as órbitas de { "24" } h concordam até { "0.017" } m; o limiar pré-registado de posição do Sol/Lua foi falhado ({ "6.4" } m / { "0.24" } m; o SPICE mostra a mesma diferença), pelo que MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Maré atmosférica S1 opcional (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> e <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabela { "1" } modelo N1, graus { "2" }–{ "6" }), ativadas com <c3/> em <c4/> e <c5/>; desligadas por omissão. MODELLED (coeficientes reverificados face à tabela publicada; sem referência independente externa para o efeito da força).

# text
seg-c62d816a93cf = Determinação de órbita em lote com taxa de distância e azimute/elevação e máscara de elevação (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (STM variacional com derivadas parciais analíticas de dois corpos + J2), <c5/>, <c6/>; <c7/>. O caminho só por distância não muda. Comparado com os mínimos quadrados em lote do Orekit { "12.2" } em { "8" } cenários pré-registados: todos os limiares atingidos exceto a concordância de estado sem ruído (≤ { "1" } cm), falhada em { "2" } de { "4" } cenários a { "1.46" } e { "1.74" } cm com o kshana a { "1e-8" } m da verdade; registado, MODELLED.

# text
seg-223f1e39669f = Ponderação de exatidão SP3 (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> e <c2/> mapeiam os códigos de exatidão do cabeçalho e de cada registo para sigmas de observação; uma variante do ajuste Galileo ponderada por SP3 (RMS 3D de Nível 2 de { "0.035" } m contra { "0.070" } m sem ponderação) é acrescentada ao lado das execuções registadas inalteradas. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Tarefa de despacho de arco completo do Swarm-A (DS-PA-08)</b> em <c1/>.

# text
seg-cc5e8af7cb0d = Gravidade planetária a partir de tabelas SHADR do PDS (CAP-30, parte de CAP-31).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) lê o Mars GMM-3 (g/o { "120" }) e o GRAIL GL0660B (g/o { "660" }); <c3/> associa qualquer campo carregado (predefinições inalteradas). Estão incluídos recortes de grau 20 (NASA PDS, domínio público; <c4/>); os ficheiros completos são obtidos por <c5/>. VALIDATED face ao pyshtools { "4.14.1" } (dentro de { "4e-15" } da gravidade total a g/o { "120" } em toda a esfera, { "5e-14" } a g/o { "660" } para |lat| ≤ { "60" }°); a ligação ao referencial do corpo continua MODELLED (o referencial nativo de cada campo não é o referencial IAU usado).

# text
seg-afb5fbf86ffc = Gravidade de grau elevado até ao grau { "2190" } (RM-14, FUT-07).

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
seg-28bc597b06b2 = <c1/> / <c2/> (coluna progressiva modificada de Holmes–Featherstone, sem subexcedência, sem singularidade polar), <c3/>, um carregador ICGEM em fluxo <c4/> / <c5/> (verificações de norma e de grau máximo, sistema de marés registado, termos variáveis no tempo rejeitados) e <c6/> (EGM2008 completo, SHA-256 fixado, não incluído; testes condicionados por <c7/>). <c8/> seleciona-o no opcional <c9/>. Concorda com o Orekit { "12.2" } até { "7.3e-17" } m/s² até ao grau { "2190" }, e uma órbita de { "24" } h { "200" }×{ "200" } concorda até { "0.13" } m. MODELLED: o pyshtools falhou o limiar pré-registado junto ao polo (atribuído ao pyshtools) e o controlo de sensibilidade de grau 70 da órbita falhou ({ "0.73" } m < { "1" } m); ambos estão registados em <c10/>.

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
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (saída densa de 7.ª ordem), <c4/>, <c5/>, com uma guarda de passo que falha de forma segura; <c6/>, <c7/>, <c8/>. O controlador predefinido não muda. VALIDATED face ao SciPy { "1.18.1" } <c9/>: passos isolados dentro de { "5.6e-15" }, sequências de passos coincidentes, estados finais dentro de { "1.6e-12" } (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Resolvedor robusto de Kepler (FUT-12).</b> Novo módulo <c1/>: <c2/> (arranque de Markley { "1995" }, resíduo sem cancelamento) para todos os { "0" } ≤ e < { "1" }, envolvido por <c3/>. VALIDATED face a raízes mpmath de 50 dígitos até { "0.9" } ε·|E| até e = { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Gravidade terrestre tesseral opcional no propagador de Cowell (RM-09).

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
seg-e1a7ad42211e = <c1/> passa a ter <c2/> (<c3/>, <c4/>). Avalia um <c5/> (EGM2008 incluído até grau/ordem { "70" }, ou qualquer <c6/> ICGEM) num referencial fixo à Terra alcançado pelo ângulo de rotação da Terra (<c7/>) ou pela cadeia GCRS-ITRS CIO (<c8/>). Por omissão <c9/>: nenhuma saída existente muda. VALIDATED face ao Holmes–Featherstone do Orekit { "12.2" } ao longo de { "24" } h ({ "6" } casos, pior { "0.036" } m), com os limiares pré-registados em <c10/>.

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
seg-957686bb351e = <b>Datas julianas em duas partes através da rotação da Terra no caminho da órbita</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> e <c6/>, conversões <c7/> entre <c8/> e <c9/>, e um <c10/> opcional para o cenário <c11/> (ECEF, traço no solo e vista de estação; desligado e inalterado por omissão, e a chave fica fora da soma de controlo do cenário quando desligada). Nova linha do registo, VALIDATED face ao pyerfa <c12/>/<c13/> (pré-registada b10475ee; { "40" } datas: GMST idêntico bit a bit, matriz dentro de { "2.7e-14" }, rotação em passos de { "1" } µs dentro de { "1.1e-14" } rad, onde o caminho de <c14/> único as falha). A época do modelo de forças de Cowell continua em <c15/> único; a razão está na sua documentação.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>Previsão de EOP para além da tabela</b> (<c1/>, <c2/>): uma extensão opcional de uma série de orientação da Terra do IERS pelo preditor LS+AR emitido na sua última linha, de modo que os argumentos de referencial de uma época posterior seguem a previsão em vez de ficarem fixos na última linha. As respostas dentro da tabela são idênticas bit a bit (testado); a série continua a fixar-se, a menos que isto seja chamado. A exatidão da previsão continua a ser o resultado LS+AR existente face ao Bulletin A (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Desvios do polo celeste dX, dY na cadeia CIO</b> (<c1/>), e verificações diretas de vetores ERFA de <c2/>, <c3/> e da nova função. Nova linha do registo, VALIDATED face ao pyerfa (pré-registada 979c1e39; { "40" } épocas { "1950" }–{ "2100" }: precessão e CIO idênticas bit a bit, TEME→GCRS dentro de { "1.1e-10" } rad, o efeito previsto da série de dois termos da equação dos equinócios). As funções existentes não mudam.

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
seg-20d19a2d65ec = <b>UTC anterior a 1972 no caminho de tempo em duas partes</b> (<c1/>, e <c2/>, <c3/> e <c4/> a partir de 1960-01-01): a era da taxa em deriva ("segundo de borracha"), com a tabela de deriva do SOFA, degraus fracionários de fim de dia e a conversão da fração do dia de UTC para SI. Nova linha do registo, VALIDATED face ao pyerfa <c5/>/<c6/>/<c7/> (pré-registada 23c40661; { "117" } instantes { "1960" }–{ "1971" }, pior { "2.9e-11" } s contra um limiar de { "1" } µs). Todos os resultados de { "1972" } em diante são idênticos bit a bit (soma de controlo fixada antes da alteração). Antes de { "1960" }, TAI − UTC é { "0" }, como no SOFA. O <c9/> de <c8/> único não muda.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>Relógio de satélite GLONASS difundido</b> (<c1/>): <c2/> a partir do registo RINEX, num tempo lido no relógio do satélite (duas iterações de ponto fixo, a convenção do RTKLIB). Os <c3/> e <c4/> lidos não eram usados anteriormente. Nova linha do registo "GLONASS broadcast satellite clock and broadcast-orbit propagation", VALIDATED face ao RTKLIB 2.4.2-p13 <c5/>/<c6/> (pré-registada e099c42a; { "292" } casos num ficheiro de difusão real de { "2013" }: diferença de relógio { "0" } s, pior posição { "1.1" } mm contra um limiar de { "1" } cm). Função de biblioteca; nenhuma saída de cenário muda. Não é aplicada nenhuma transformação PZ-90.11 → ITRF, e o módulo di-lo.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>Solução de tempo PPP face ao relógio de estação do IGS</b> ({ "0.36" }, FUT-19): o relógio do recetor do filtro PPP float em WTZR concorda com o relógio combinado final do IGS para a estação até { "0.075" } ns (desvio-padrão) com um desvio constante de −{ "0.66" } ns nas duas horas convergidas. Os limiares foram pré-registados em <c1/>. VALIDATED (nova linha do registo). Novo conjunto de dados de ensaio <c2/>, os registos de relógio de estação do ficheiro de relógios finais do IGS já usado para os relógios dos satélites.

# text
seg-463ac67600b1 = <b>Paridade do PPP com o gLAB</b> ({ "0.36" }, WP-07, RM-31): o gLAB { "6.0.0" } foi executado sobre as mesmas entradas WTZR como ferramenta separada (núcleo Apache-2.0; soma de controlo da descarga verificada face à lista publicada), com a linha de comandos de uma alteração processual versionada antes da execução. Na sua primeira execução registada, o PPP float do Kshana e o do gLAB concordam dentro de { "0.05" } m em { "240" } de { "240" } épocas e até { "5.0" } mm na última. O limiar de SPP foi falhado (mediana { "1.187" } m contra { "0.50" } m) e fica registado como resultado: as próprias soluções SPP do gLAB e do RTKLIB diferem entre si em { "0.852" } m. A regra registada deixa por isso os ramos das duas ferramentas como não atingidos no seu conjunto, embora a paridade do PPP se verifique.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>Leitura de navegação RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> lê ficheiros de navegação RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV e F/NAV, BeiDou D1/D2, QZSS LNAV; outros registos saltados até ao cabeçalho de registo seguinte), e <c3/> aceita opções. VALIDATED face ao ficheiro RINEX { "3" } fundido do IGS do mesmo dia: todos os campos descodificados idênticos e { "0" } m em posição. A leitura de RINEX 2/3 não muda.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>Posições difundidas BeiDou GEO</b> (opcional): <c1/> e <c2/> (BDS ICD, inclinação de −{ "5" } graus). <c3/> continua a saltar os GEO. MODELLED: a comparação pré-registada com uma órbita precisa está condicionada pelos dados e ainda não foi executada.

# text
seg-416f58111d1f = <b>Ficheiros de observação RINEX { "4" }</b>: um ficheiro de observação MGEX RINEX { "4.00" } real é lido nos testes (MODELLED, aderência à norma do formato).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK com LAMBDA em RINEX real</b> ({ "0.36" }, WP-07 ★): <c1/>, duplas diferenças de linha de base curta de código e fase GPS de dupla frequência com um filtro de Kalman float e fixação de inteiros LAMBDA (teste de razão). VALIDATED nas estações IGS WTZR e WTZZ (a { "1.4" } m uma da outra) face à sua linha de base ITRF2020 sob limiares pré-registados: fixado em todas as épocas após os primeiros dez minutos, erro de linha de base com mediana de { "4.5" } mm e percentil 95 de { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>Paridade do PPP de dados reais com o RTKLIB</b> (RM-31): <c1/> e <c2/> com limiares pré-registados. O PPP do RTKLIB v2.4.2-p13 sobre as mesmas entradas WTZR concorda com o Kshana dentro de { "5" } cm em todas as épocas das duas últimas horas ({ "9.7" } mm no fim) no terceiro registo; as duas primeiras execuções, registadas como resultados, tinham a maré sólida desligada e a antena do recetor no espaço de base do RTKLIB. O limiar de paridade de ponto único foi falhado (mediana de { "1.09" } m contra { "0.5" } m). O ramo do gLAB não foi executado (condicionado pelos dados).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Codificadores de mensagens de navegação para além do LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> codifica GPS CNAV (tipos de mensagem { "10" }, { "11" }, { "30" }; CRC-24Q; codificação contínua de taxa 1/2 K={ "7" }), Galileo I/NAV (tipos de palavra 1-5 em páginas nominais par/ímpar; entrelaçador 30x8; sincronização <c2/>) e Galileo F/NAV (tipos de página 1-4; entrelaçador 61x8; sincronização <c3/>), com descodificadores de teste. MODELLED: idas e voltas e respostas conhecidas do ICD; uma verificação pré-registada de que as efemérides Galileo difundidas ficam na grelha de LSB do codificador manteve-se (pior { "3.6e-3" } LSB) mas falhou o seu limiar de número de satélites ({ "15" } de { "20" }), registado. Os codificadores são funções de biblioteca; a ligação às cenas não faz parte desta alteração.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>Leitor de ficheiros IONEX</b> ({ "0.36" }, WP-07): <c1/> com <c2/>, <c3/>, <c4/>, <c5/> e <c6/>: um leitor IONEX { "1.0" } estrito de colunas fixas, com épocas contadas a partir do dia do primeiro mapa, <c7/> lido como em falta, mapas de RMS e as interpolações temporais do formato por vizinho mais próximo, consecutiva e de mapa rodado; TEC oblíquo à altura da camada do cabeçalho. Verificado num mapa sintético versionado e, condicionado pelos dados (obtido no momento do teste com um SHA-256 fixado, não incorporado), num recorte de um GIM real do CODE: todos os nós exatos; a interpolação coincide com uma referência de fórmula até { "4e-13" } TECU. O <c8/> do RTKLIB concorda até { "3.6e-13" } TECU em { "6885" } pontos (B6 pré-registado). VALIDATED com evidência condicionada pelos dados (decisão do responsável, 2026-10-13): o teste falha com qualquer mapa que não seja o fixado por SHA.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Suavização de portadora de Hatch</b> ({ "0.36" }, WP-07): <c1/> e <c2/>, a forma sem divergência (livre de ionosfera) na montagem precisa de ponto único. MODELLED com um resultado registado: na estação IGS WTZR reduz o erro mediano de ponto único de { "1.55" } m para { "1.12" } m e o percentil 95 de { "3.47" } m para { "3.21" } m, aquém da redução de { "40" } % pré-registada (o erro restante é do tipo desvio, não ruído).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>PPP float em RINEX real</b> ({ "0.36" }, WP-07): <c1/>, um filtro de posicionamento preciso de ponto estático float em código e fase GPS de dupla frequência reais com produtos finais do IGS (desvios e variações de antena, maré da Terra sólida, wind-up de fase, atraso de Shapiro, atraso húmido estimado, deteção de saltos de ciclo), com <c2/>. VALIDATED na estação IGS WTZR reservada face à sua coordenada ITRF2020 sob limiares pré-registados: após { "6" } h o erro é de { "1.5" } mm na horizontal e { "2.9" } cm na vertical, e todas as épocas das últimas duas horas ficam dentro de { "10" } cm.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>Interpolação de relógio preciso SP3</b> ({ "0.36" }, WP-07): <c1/> e <c2/> interpolam linearmente os relógios de satélite SP3 tabelados entre os dois nós válidos que os delimitam (marcador de relógio inválido saltado), e <c3/> alimenta com eles <c4/>, pelo que a cadeia precisa funciona só com um SP3. VALIDATED face aos relógios finais de { "30" } s do IGS de 2025-02-24 sob limiares pré-registados: { "32" } satélites GPS, RMS no ponto médio { "0.121" } ns (limiar { "0.15" } ns), percentil 95 { "0.265" } ns (limiar { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM ao lado das figuras de mérito de holdover do relógio</b> (CAP-05b): uma secção opcional <c1/> no tipo de cenário clock reporta um bloco <c2/> separado (RAIM instantâneo num céu predefinido a partir de um local indicado: veredicto por época e níveis de proteção, disponibilidade; indisponível enquanto o GNSS é negado, nunca extrapolado). As figuras de holdover não mudam; sem a secção a saída é idêntica byte a byte. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>Limiares de receiver-trust calibrados no JammerTest { "2024" }</b> (CAP-13): uma calibração pré-registada dos monitores de queda de C/N0, de AGC e de indicador de jamming no conjunto de dados público JammerTest { "2024" } (obtido em tempo de execução, nunca incorporado; <c1/>), distribuída apenas como o <c2/> opcional ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Conjunto reservado: os limiares de AGC, de indicador de jamming e de união passam; o limiar de falsos alarmes de C/N0 falha ({ "0.023" } contra { "0.02" }), pelo que a linha é MODELLED (<c3/>). As predefinições e as saídas sem o perfil não mudam.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>Hipóteses de falha ARAIM com vários satélites</b> (CAP-05a): a regra de subconjuntos do ADD v4.2 generalizada para além de pares (<c1/>, <c2/>; a ordem { "2" } é exatamente o caminho existente verificado pelo MAAST) e um RAIM avançado opcional sobre essas hipóteses (<c3/>), que reporta o subconjunto de maior separação quando é detetada uma falha. As distribuições a priori que exigem subconjuntos mais profundos são recusadas, nunca truncadas. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Linha de horizonte em receiver trust</b> (FUT-01): uma sessão receiver-trust pode indicar uma <c1/>; os satélites atrás dela perdem-se para o céu (<c2/>, <c3/>, <c4/>) e as suas perdas são classificadas como <c5/>, nunca <c6/>; sem uma, o recurso à lacuna de azimute e todas as saídas ficam como antes. O gerador de formação de equipas ganha um evento <c7/> (um céu bloqueado, não interferência) e o cenário <c8/>. O Monte Carlo de UERE x DOP ganha as duas geometrias de linha de horizonte mascarada da nota de projeto, pré-registadas isoladamente: todas as { "26" } verificações passam.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>Verificação de marca temporal RFC { "3161" }</b> (CAP-14): <c1/> verifica, offline, a assinatura de um token de marca temporal (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 e P-384), a sua ligação ao certificado de assinatura ESS, a utilização timeStamping do signatário e a sua cadeia até uma âncora fiável no genTime do token; <c2/> aplica-a ao <c3/> de um pacote (opcional; sem ela o relatório não muda). VALIDATED, de forma estreita: todos os { "27" } casos autogerados concordam com o OpenSSL { "3.0.13" } quanto ao veredicto e ao genTime, numa comparação pré-registada antes de o verificador ser escrito. A revogação não é verificada.

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
seg-1b7777e600a8 = <b>Níveis de verificação por valor para todos os tipos</b> (RM-04): o resultado de cada tipo de cenário termina agora com um bloco <c1/> que nomeia os seus valores principais, a linha da matriz de verificação que é responsável por cada um e o nível lido dessa linha (os valores a que nenhuma linha corresponde são listados como sem nível). O bloco é acrescentado após a execução e, retirado, repõe o documento anterior byte a byte (<c2/>). <c3/> não tem <c4/> até uma nova previsão datada substituir a congelada; <c5/>, <c6/>, <c7/> e <c8/> não têm valor principal escalar, e <c9/> escreve JSON compacto. Os membros de campanhas mantêm os seus documentos sem nível.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Predefinição quântica <c1/></b> (CAP-08c): um cenário inercial incluído em que um acelerómetro de interferómetro de átomos frios, especificado pela física do seu interferómetro (<c2/> com um nível de vibração da plataforma indicado), segue por inércia face a um acelerómetro de quartzo de grau de navegação durante uma interrupção de GNSS de 110 minutos. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Graus de liberdade equivalentes exatos de Greenhall</b> (CAP-03): <c1/>, o algoritmo completo de Greenhall e Riley ({ "2003" }) (ordens de diferença { "1" } a { "3" }, expoentes de ruído +{ "2" } a -4, com e sem sobreposição, modificado e não modificado, com as tabelas de J grande), com envoltórios ADEV, MDEV e HDEV. VALIDATED numa comparação pré-registada com o allantools { "2024.6" }: { "4 876" } pontos de grelha dentro de { "6.0e-13" } relativo; o allantools falha em mais { "32" } pontos, que ficam registados sem valor de referência independente. Os intervalos de confiança de <c2/> não mudam bit a bit.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Termos de erro do interferómetro de átomos frios</b> (RM-26/27/28): ruído de fase do laser Raman (com o termo de atraso de retrorreflexão), o desvio por curvatura da frente de onda de uma nuvem térmica (desfocagem pura, com um raio de deteção) e a resolução da ambiguidade de franjas (assistida por sensor clássico e com dois tempos de interrogação), como funções de biblioteca em <c1/>, cada forma fechada verificada por quadratura ou Monte Carlo. MODELLED; ainda não acessíveis a partir de um tipo de cenário (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Formatos de registo de relógio</b> (RM-03): <c1/> lê ficheiros de relógio RINEX, registos ASCII de fase ou frequência ao estilo TimeLab e registos de contador TAPR TICC para uma única série de fase normalizada (tau0 indicado ou encontrado, lacunas contadas, uma política de lacunas). Opcional: uma série de temporização de telecomunicações pode nomear um registo (<c2/>), e a tabela <c3/> de um cenário de relógio acrescenta um bloco <c4/> (ADEV, TDEV, MTIE). Sem a tabela, ambos os tipos de cenário são idênticos byte a byte (<a1><c5/></a1>). Uma comparação pré-registada em três registos sintéticos satisfez os seus limiares de fase e de ligação; os estimadores concordam com o allantools dentro de { "2.5e-14" } sempre que este avalia, e este não avalia o ponto de MTIE do registo inteiro (registado). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Máscaras de deriva da sincronização de frequência</b> (RM-01): o tipo de cenário <c1/> passa a ter sete máscaras de geração de deriva MTIE e TDEV a temperatura constante, ITU-T G.811 PRC, G.812 Tipos I a III, G.8262 EEC Opções { "1" } e { "2" } e G.8262.1 eEEC, com as partes em lei de potência que as tabelas escrevem, e o cenário de referência <c2/> (um OCXO em funcionamento livre face às máscaras EEC: falha aos { "1 000" } s, onde um laço tem de fazer o trabalho). Cada linha foi relida face ao texto do itu.int; a G.812 (06/2004) foi substituída por uma edição 08/2026 pré-publicada que não pôde ser lida. MODELLED (uma transcrição); as máscaras e saídas existentes não mudam.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Orientação sobre a distribuição a priori do filtro para o tipo de cenário <c1/></b> ({ "0.36" }, WP-09, resultado de RM-21): a distribuição a priori predefinida do filtro do pacote adequa-se a uma IMU de grau tático. Com uma IMU de grau de navegação, a predefinição pode tornar a deriva fundida pior do que um INS livre: { "52" } m contra { "11" } m num perfil de aeronave de { "70" } m/s. Defina <c2/> para corresponder ao grau do sensor, como fazem os novos pacotes marítimo, ferroviário e de aviação. Nenhum cenário incluído combina uma IMU de grau de navegação com a distribuição a priori predefinida: todos os que usam a predefinição têm desvios residuais de acelerómetro de pelo menos { "0.015" } m/s². Apenas documentação; nenhuma saída muda.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Exportação para test bench verificada com os leitores do próprio simulador</b> ({ "0.36" }, WP-09, CAP-16): os ficheiros de movimento de <c1/> de { "8" } cenários incluídos foram relidos pelos leitores de NMEA, de latitude/longitude/altura e de movimento fixo à Terra do gps-sdr-sim (MIT, commit 28ca29a6, usado como ferramenta separada através de <c2/>; nenhuma função de sinal é chamada). Devolvem a trajetória exportada até { "1.2" } mm, { "0.15" } mm e exatamente. RESULTADO: o leitor de movimento fixo à Terra desse simulador não consegue aceitar o CSV de largura total, porque o seu buffer de linha de 100 caracteres divide cada linha. <c3/> indica agora os cortes de coluna a usar e o limite de { "300" } s do simulador. VALIDATED (nova linha do registo); os bytes da exportação não mudam.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS no conjunto de dados KF-GINS</b> ({ "0.36" }, WP-09, FUT-17): carregadores e executor de <c1/> e o modelo de medição com braço de alavanca no EKF em laço fechado. No conjunto de dados de demonstração KF-GINS (obtido no momento do teste, não incorporado), o RMS horizontal do Kshana face à trajetória de referência é { "1.09" } cm contra os { "1.11" } cm do próprio KF-GINS, e todos os limiares pré-registados se verificaram. VALIDATED com evidência condicionada pelos dados (decisão do responsável, 2026-10-13): o conjunto de dados é obtido com SHA-256 fixados e o caminho de reprodução está em <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Filtro PNT acoplado no pacote de fusão</b> ({ "0.36" }, WP-09, FUT-16): o tipo de cenário <c1/> aceita uma tabela opcional <c2/> que executa um filtro empilhado sobre pseudodistâncias com um estado de desvio de acelerómetro (<c3/>), e <c4/> é a versão 3-D de 8 estados. Novo cenário incluído <c5/>: com acelerómetros com desvio, o modo acoplado mantém a posição do conjunto quântico a { "18.7" } m (percentil 95) com integridade total, onde os filtros desacoplados chegam a { "430" } m. Sem a tabela, <c6/> e <c7/> não mudam (fixado); <c8/> recusa a tabela. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>Pacotes GNSS/INS marítimo, ferroviário e de aviação</b> ({ "0.36" }, WP-09, RM-21): cenários incluídos <c1/>, <c2/> e <c3/> sobre a biblioteca de trajetórias, e uma tabela opcional <c4/> para o tipo de cenário <c5/> que funde pseudodistâncias de uma constelação SGP4 Walker (todos os satélites quando nominal, os poucos mais altos quando degradada). No pacote ferroviário, o acoplamento forte mantém a solução de grau de navegação a { "5.3" } m através de um desmonte e de um túnel, contra { "12.9" } m com acoplamento fraco. Sem <c6/>, o pacote não muda (fixado). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Acoplamento forte de fase da portadora</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, um EKF de estado de erro com um relógio de recetor de dois estados explícito e ambiguidades de portadora float, conduzido por uma constelação SGP4 Walker com correções Klobuchar e Saastamoinen no laço de medição, deteção de saltos por portadora diferenciada no tempo e reinicialização de ambiguidades, e uma execução só com código sobre as mesmas medições para comparação. MODELLED: num percurso em figure-8, a solução de portadora é de { "2.5" } cm contra { "47" } cm só com código, e NIS/NEES são consistentes entre sementes.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>Biblioteca de trajetórias GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): o tipo de cenário <c1/> aceita uma tabela opcional <c2/> com <c3/>. Os perfis comandam taxas de Euler e aceleração ao longo da trajetória a partir do estado verdadeiro e derivam a IMU verdadeira da cinemática de corpo rígido (curvas coordenadas, subidas, Coriolis); <c4/> importa uma trajetória verdadeira (<c5/>) e resolve a IMU que a reproduz. Sem a tabela, o pacote voa o seu percurso histórico, bit a bit (fixado). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>Teselas DEM em latitude/longitude para o horizonte lunar</b>: <c1/> lê uma tesela de texto <c2/> (alturas acima da esfera média numa grelha de latitude/longitude) em vez da <c3/> estereográfica polar, tanto para <c4/> como para <c5/>; o relatório repete a tesela (<c6/>, com o seu SHA-256). <c7/> está agora ligado à marcha de raios do horizonte. Uma tesela reamostrada a partir do recorte incluído dá à estação o horizonte do recorte até { "0.22" } graus. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Terreno no local de exportação do volume de serviço</b>: com uma secção <c1/>, cada linha da exportação de geometria por satélite de <c2/> traz <c3/> (o satélite está acima da máscara plana e do horizonte do local de exportação no seu azimute), o relatório traz o horizonte do local (<c4/>) e o CSV de execução ganha a coluna. Sem terreno, a exportação não muda. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Campos principais fornecidos pelo motor</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> e o <c3/> do WebAssembly indicam, para doze tipos de cenário, quais os campos de um cenário que respondem à sua pergunta, os melhores primeiro, como caminhos com pontos (<c4/>). O Studio lê-os antes da sua própria ordenação. Apenas metadados de apresentação: o motor nunca os lê, nenhum ficheiro de cenário precisa deles, nenhum resultado depende deles. <c5/> falha se um tipo de cenário não for despachável ou se um caminho não se encontrar em nenhum dos cenários incluídos desse tipo (apanhou dois caminhos que os identificadores achatados do Studio tinham escrito sem os parênteses retos da matriz).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Tabela de tipo de cenário para módulo fornecida pelo motor</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> e o <c3/> do WebAssembly indicam, para cada tipo de cenário cujas linhas da matriz de verificação nomeiam outro módulo que não o seu, os nomes dos módulos. O mapa de capacidades do Studio usava a sua própria cópia escrita à mão; <c4/> falha se um tipo de cenário da tabela não for despachável ou se um módulo não aparecer em nenhuma linha da matriz. Nenhuma saída mudou.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Execução IQ curta na compilação para navegador</b> ({ "0.36" }): <c1/> e <c2/> no módulo WebAssembly constroem uma cena sintética, adquirem cada satélite e seguem os adquiridos, tudo em memória, limitado a { "0.25" } s, { "1 000 000" } amostras e { "8" } satélites. O construtor de cenas e a pesquisa de sinais por nome saíram de <c3/>, só nativo (para <c4/> e <c5/>), de modo que ambas as compilações os partilham; a saída da linha de comandos não muda. O teste nativo e <c6/> comparam o mesmo pedido com um único valor de referência (<c7/>), byte a byte: desde a alteração de matemática portátil (STUDIO-15, abaixo), a compilação para navegador e a compilação nativa dão os mesmos bits.

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
seg-c0eab9b97b7d = <b>APIs tipadas em Python e TypeScript</b> (CAP-34): <c1/> tipa os vocabulários fechados (<c2/>, todos os nomes de tipo de cenário; <c3/>; <c4/>) e os dicionários <c5/> e <c6/>; <c7/> e <c8/> devolvem-nos. O pacote WebAssembly acrescenta <c9/> (uma execução como objeto <c10/> tipado com o documento analisado como <c11/>) e <c12/> (o <c13/> analisado), e o seu <c14/> traz o mesmo vocabulário; <c15/> é tipado como <c16/>. <c17/> mantém ambas as listas iguais às do motor.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Unidades para cada coluna de <c1/></b> (FUT-28): um resultado <c2/> traz agora <c3/> e <c4/>, a unidade de cada chave varrida e de cada métrica registada, lida da tabela de unidades do próprio pacote varrido. Um eixo pode declarar <c5/> para uma chave que o pacote não repete; uma unidade declarada que contradiga a do pacote é recusada, e uma unidade que nenhum dos dois indique é <c6/>, nunca adivinhada. <c7/> e <c8/> estão descritos, pelo que todos os { "76" } tipos de cenário estão agora totalmente cobertos pela barreira de unidades de campo (teto de tipos de cenário por cobrir { "1" } -> { "0" }).

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
seg-3a83af8daa43 = <b>Matrizes NumPy a partir de <c1/></b> (FUT-26): o <c2/> do Python passa a ter <c3/>, <c4/> e <c5/>, que devolvem <c6/> para uma lista numérica, as colunas numéricas de uma lista de registos, ou todas as séries de registos do documento. Cada matriz é igual a <c7/> dos mesmos valores de <c8/> (dtype e bits). O NumPy só é importado quando uma delas é chamada e fica fora dos requisitos de execução. Tipado em <c9/> e verificado pelo stubtest.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Otimizador de campanhas</b> (CAP-32): a nova secção opcional <c2/> do tipo de cenário <c1/> pesquisa de uma a três chaves de cenário dentro de limites indicados o melhor valor de uma métrica: minimizar, maximizar ou atingir um alvo. Pesquisa de forma exaustiva numa grelha, ou com um simplex de Nelder–Mead determinístico e limitado. Cada avaliação é uma execução real do tipo de cenário nomeado e está listada no <c3/> do resultado. Exemplo: <c4/>. Os limiares foram pré-registados (<c5/>):

# text
seg-f4e79236b6bf = a função de Rosenbrock é satisfeita (f* = { "1.7e-20" });

# text
seg-3dbe3fdfebcf = uma resolução de alvo 1-D em forma fechada é satisfeita ({ "6e-15" } relativo);

# text
seg-5ab478e03354 = a grelha é igual bit a bit a uma força bruta independente;

# text
seg-ea0a04c6e713 = o simplex faz pelo menos tão bem como uma grelha de { "41" } × { "41" } em { "177" } execuções.

# text
seg-161d8c5b55e8 = O limiar 1-D da ronda { "1" } fica registado como NOT MET, porque a caixa pré-registada excluía a solução. MODELLED; linha do registo "Bounded optimisation of one metric over campaign parameters". Aditivo: as campanhas sem a secção não mudam.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Conjuntos de calibração</b> (CAP-10): três verificações de semente única repetidas em { "200" } sementes independentes face a limiares pré-registados, em <a1><c1/></a1> (gerado por <c2/>; valores por semente em <c3/>).

# text
seg-b163e53e06e9 = O intervalo bootstrap de { "95" } % do Monte Carlo da campanha cobre a média verdadeira em { "192" } de { "200" } conjuntos, e a sua verificação do qui-quadrado passa em { "196" }.

# text
seg-022a7fbee13a = A tolerância de percentil de semente única passa em apenas { "183" } de { "200" }: NOT MET, como previsto. É um limiar de cerca de 2 sigmas, registado e não afrouxado.

# text
seg-096f36d21b02 = As calibrações de ADEV de FM branca passam em todas as sementes, com o seu pior erro muito dentro da tolerância.

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
seg-369c7f2a115c = <b>Tipos de cenário incorporados através do trait <c1/></b> (FUT-27, em curso): o trait <c2/> (<c3/>, com um gancho de nível por valor e <c4/>), e os primeiros tipos de cenário passados para ele (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). A saída não muda: um manifesto de todo o catálogo com o SHA-256 de cada saída é idêntico antes e depois (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>Verificação sem obtenção no Playground</b> (RM-07): <c1/> verifica três coisas:

# text
seg-3e424188f6e1 = todos os cenários da biblioteca do Studio estão no pacote do navegador;

# text
# c1: scenarios/
seg-2803ccf8b9ae = o pacote é idêntico byte a byte a <c1/>;

# text
seg-b98016a4a844 = todos os cenários do navegador são executados a partir de um diretório de trabalho vazio.

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
seg-efc143b4f2a9 = <b>Mapas Alt-PNT: campo gravítico real, Monte Carlo de erro de mapa, SRTM em resolução total</b> ({ "0.36" }, WP-10). O tipo de cenário <c1/> aceita um <c2/> opcional: uma anomalia gravítica sintetizada a partir dos coeficientes EGM2008 incluídos (ou de um ficheiro ICGEM <c3/> através de <c4/>, apenas em compilações nativas). Essa síntese coincide com o Serviço de Cálculo do ICGEM até cerca de { "1e-8" } mGal em { "794" } nós em duas regiões, face a limiares pré-registados de { "0.005" } mGal RMS e { "0.02" } mGal máx. (VALIDATED; linha do registo "Gravity-anomaly synthesis from a spherical-harmonic model"). O novo cenário incluído <c5/> executa o teste de referência de 60 minutos nesse campo real de grau 70. Resultado pré-registado: erro de correspondência { "3106" } m, pelo que o limiar de < { "500" } m é NOT MET, como previsto (o grau { "70" } é demasiado suave), e a redução de dez vezes na deriva é MET (MODELLED). Uma tabela opcional <c6/> repete o teste de referência sobre erros de mapa com semente e correlação gaussiana e reporta a distribuição do erro de correspondência (cenário incluído <c7/>). Exploratório e não pré-registado: com um erro de mapa de { "2" } mGal correlacionado ao longo de { "0.2" } graus (a dimensão que o próprio sigma do correlacionador orça), { "1" } de { "20" } realizações fica dentro de { "500" } m (mediana { "2.9" } km, p95 { "14.7" } km), contra { "144" } m com um mapa perfeito. A posição inferior a 500 m do teste de referência sintético pressupõe que o mapa é exato. Sem nenhuma das opções, o documento é idêntico byte a byte ao de versões anteriores. <c8/> aceita um <c9/> opcional (<c10/>, <c11/>) que lê o canal magnético de um CSV no formato EMAG2v3. O EMAG2 não é incorporado porque os seus termos não são explícitos: <c12/> obtém-no com um SHA-256 fixado e recorta uma caixa. Não se reclama nenhum resultado de navegação na grelha EMAG2 real. Estimação conjunta de mapa (SLAM de terreno, RM-18): <c13/> faz voar o navegador sequencial de terreno sobre um mapa guardado que difere da verdade, quer confiando nele, quer estimando uma correção de mapa por célula com um filtro Rao-Blackwellizado ao estilo FastSLAM. Pré-registado face ao SITAN de mapa conhecido com um erro de mapa correlacionado de { "15" } m em { "20" } sementes: um ganho médio de { "1.5" } %, melhor em { "10" } de { "20" }, pelo que ambos os limiares de melhoria são NOT MET ({ "10" } % e { "12" } de { "20" }), sem prejuízo num mapa perfeito (MET). Uma única passagem sem revisitas não permite aprender o mapa (<c14/>, MODELLED). Os documentos de <c15/> são idênticos byte a byte. Os testes de SRTM real passam agora a ser executados na CI em dois recortes de resolução total versionados; todos os limiares pré-registados são atingidos, com o nó mais próximo igual ao do GDAL { "3.8.4" } em { "8" } de { "8" } pontos (<c16/>).

# text
seg-aa7ac7a47111 = <b>Interoperabilidade, WP-08</b> ({ "0.36" }; cada item pré-registado e versionado isoladamente antes da execução da sua referência independente, cada um uma nova linha VALIDATED do registo, exceto o item de telemetria, que alarga uma linha existente):

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>Mensagens de Dados de Órbita CCSDS</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 e OCM { "3.0" } (blocos TRAJ, PHYS, COV, MAN, USER) escritas e lidas em KVN e NDM/XML, e uma OMM de precisão total a partir de um conjunto de elementos SGP4 (<c2/>); a saída de <c3/> não muda. Face ao Orekit { "13.1.8" } nos dois sentidos: { "27" } de { "30" } mensagens do Kshana são analisadas no Orekit e o Kshana lê todas as escritas pelo Orekit, valores dentro de { "1e-14" } relativo e épocas dentro de { "1e-9" } s; quatro resultados fixados (o Orekit exige <c4/>, recusa <c5/> em parâmetros definidos pelo utilizador em XML, não escreve <c6/> sem <c7/> e lê épocas relativas de OCM em TDB em segundos SI). O <c8/> do escritor OMM antigo é recusado pelo Orekit (registado). Linha "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>Mensagens de Dados de Atitude CCSDS</b> (<c1/>, <c2/>): AEM 2.0/1.0 e APM { "2.0" } em KVN e XML face ao Orekit { "13.1.8" }, todos os limiares atingidos; o escritor APM do Orekit recusa uma manobra sem <c3/> (fixado). Linha "CCSDS Attitude Data Messages (AEM, APM)".

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>Exportação SPK do SPICE</b> (<c1/>): escritor e leitor de SPK dos tipos { "9" } e { "13" } e exportação de OEM para SPK; face ao CSPICE N0067, os kernels são idênticos byte a byte aos do SPICE e avaliam-se de forma idêntica bit a bit. Linha "SPICE SPK export (types { "9" } and { "13" })".

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>SPK do SPICE dos tipos { "3" } e { "21" }</b> (<c1/>): segmentos do tipo { "3" } (Chebyshev) e do tipo { "21" } (linhas de diferenças estendidas) escritos a partir de registos dados e avaliados como o SPICE o faz; face ao CSPICE N0067, os kernels são idênticos byte a byte aos do SPICE e todas as avaliações concordam bit a bit nos dois sentidos. Linha "SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)".

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Extensões de Space Packet</b> (<c1/>): cabeçalho secundário com códigos de tempo CUC/CDS, controlo de erros de pacote, segmentação e verificações de fluxo, face ao ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } e ao <c2/> do CPython, zero divergências. Linha "CCSDS Space Packet secondary header, packet error control and segmentation".

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Esquema de telemetria { "1.3" } através de consumidores reais</b>: a exposição Prometheus e o JSON OTLP/HTTP de um fluxo sintético de esquema 1.3, incluindo a série de geometria e a etiqueta <c1/>, lidos exatamente pelo prometheus_client e pelo proto OTLP, aceites pelo promtool { "3.5.0" } <c2/> sem nenhum problema de lint e passados sem alteração pelo OpenTelemetry Collector contrib { "0.135.0" } (condicionado pelos dados: ferramentas obtidas com SHA-256 fixados, saídas versionadas).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Determinação de órbita de Marte, execução { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> escala a matriz normal pela sua diagonal e amortece o passo (Levenberg-Marquardt), depois de o ajuste de Gauss-Newton registado ter falhado numa matriz cuja diagonal bruta abrange oito ordens de grandeza. Registada em separado (<c2/>, mesmo arco, limiares e edição). Nas passagens do MRO pontuadas, a órbita fica a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução de navegação do MRO, limiares atingidos. O Doppler pós-ajuste é de { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido (resultado fixado). Uma alteração apenas de pontuação, R2-A1, está divulgada em <c3/>. A linha continua MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Modelo de Doppler de 2 vias com rampa de Marte e determinação de órbita</b> ({ "0.36" }, WP-14, parte de CAP-30, fase { "2" }): <c1/> prevê o Doppler de 2 vias em banda X com rampa da DSN a partir de tabelas de rampa ODF (tempo de luz, Shapiro, troposfera, tempo de estação, estações da DSN através da cadeia CIO e EOP do IERS) e ajusta um orbitador de Marte (GMM-3, terceiros corpos, SRP, arrasto). <c2/> lê SPK do tipo { "1" } (verificado face ao CSPICE) e <c3/> lê campos SHADR do PDS. Pré-registado face à reconstrução de navegação do MRO em passagens reais do MRO (condicionado pelos dados, <c4/>, CI mensal): o Doppler previsto coincide com as observações até { "12.5" } mHz (limiar { "30" } mHz, atingido); o ajuste de órbita registado falhou no arco pontuado e não produziu nenhuma órbita (resultado fixado). A linha continua MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>Leitor de Orbit Data File da DSN</b> ({ "0.36" }, WP-14, parte de CAP-30): <c1/> lê ODF TRK-2-18. Num ODF real do Mars Reconnaissance Orbiter (NASA PDS, incorporado), o leitor coincide com o número de registos, as posições de grupo, as estações e os tempos da etiqueta do PDS, e todos os seus tipos de dados são conhecidos. A tabela de fim de ficheiro da etiqueta tem uma linha a menos do que o ficheiro, uma inconsistência da etiqueta registada como resultado. MODELLED. A determinação de órbita com estes dados ainda não está feita.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>Orçamento TWSTFT e estabilidade da transferência de tempo: o tipo de cenário <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Equação de duas vias:

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> resolve-a para T_A − T_B com atrasos de equipamento das estações, a assimetria ionosférica ascendente/descendente em banda Ku, a diferença de atraso do transponder e os termos de Sagnac, e recupera o modelo direto até { "1e-15" } s.

# text
seg-a5468765380d = <b>Orçamento de incerteza:</b> combinado em quadratura, com o TDEV da ligação como termo de tipo A.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Ruído da ligação:</b> a série de duas vias passa a ter um patamar de ruído de fase flicker, uma não reciprocidade diurna e um resíduo constante de reciprocidade. O pacote <c1/> de jitter branco não muda.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Série real:</b> a estabilidade de séries fornecidas do BIPM Circular T, CSV <c1/> ou de relógios de estação do IGS.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Novo cenário incluído <c1/>. A solução de tempo PPP é VALIDATED em separado face ao relógio de estação do IGS no ramo de dados reais de GNSS.

# text
seg-ae33b92da4a6 = <b>Aquecimento de reentrada, radiometria EO e perdas de ascensão</b> ({ "0.36" }, WP-14, CAP-28): três novos tipos de cenário.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/>: uma reentrada de massa pontual com 3-DoF sobre uma Terra ou um Marte em rotação, com aquecimento no ponto de estagnação de Sutton-Graves.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/>: SNR do gerador de imagens, MTF em Nyquist, resposta relativa de arestas e NIIRS GIQE { "4" }.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/>: uma ascensão por viragem gravitacional em vários estágios com perdas de gravidade, de arrasto, de direção e de contrapressão, verificada pela identidade exata de dv ideal menos perdas.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = A desaceleração máxima da reentrada foi verificada face ao valor nominal publicado da Stardust sob um limiar pré-registado: { "35.44" } g contra { "33.4" } g (+{ "6.1" } %, limiar { "10" } %). Essa linha é VALIDATED. O aquecimento, a radiometria e a ascensão são MODELLED. Também novos: <c1/>, os cenários incluídos <c2/>, <c3/> e <c4/>, e <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Controlo de atitude com rodas de reação: o tipo de cenário <c1/></b> ({ "0.36" }, WP-14, CAP-21). Uma manobra de apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas sob realimentação MRP, com binários de roda de norma mínima limitados ao limite de cada motor (<c2/>). Também pode fechar o laço sobre um EKF multiplicativo a partir de um giroscópio e de um seguidor de estrelas simulados (<c3/>). O laço de estado verdadeiro foi comparado com o Basilisk { "2.9.1" } em três casos pré-registados antes de o código existir (três rodas ortogonais, uma pirâmide de quatro rodas, um caso de saturação). Todas as componentes MRP, taxas do corpo, velocidades de roda e binários de motor concordaram em todas as amostras, no pior caso { "2.4e-14" } em sigma e { "2.9e-11" } rad/s na velocidade da roda. Esta linha é VALIDATED; o MEKF é MODELLED (consistência NEES). Novos cenários incluídos <c4/> e <c5/>, e <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Planeamento de contactos com a estação terrestre e ACM DVB-S2</b> ({ "0.36" }, WP-14, CAP-22/23): dois novos tipos de cenário. <c1/> indica, para um satélite sobre uma estação, o Es/N0 de cada passagem e o MODCOD DVB-S2 escolhido ao longo dela (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem). Indica também o volume de dados que o ACM transporta face à linha de base de codificação constante. <c2/> faz o mesmo para vários satélites sobre várias estações e constrói um plano de contactos sem conflitos (viragem da antena, uma estação por satélite, entrega ponderada por prioridade limitada ao atraso acumulado de cada um). Apresenta um plano guloso de valor marginal, uma linha de base por ordem de chegada e o ótimo exato em conjuntos pequenos, com a diferença de otimalidade do plano guloso. As janelas de acesso provêm do previsor de passagens aparentes VALIDATED. Novos cenários incluídos <c3/> e <c4/> (dados de entrada ilustrativos) e <c5/>. MODELLED (duas novas linhas do registo).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Posicionamento Doppler com Starlink face a uma experiência publicada</b> ({ "0.36" }, WP-14, parte de CAP-11, MODELLED). Trata-se de uma comparação por aproximação, fixada antecipadamente, entre o modo Doppler de <c1/> com a predefinição <c2/> e os percentis do conjunto de dados 3 de "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). O modelo usou { "3" } satélites (uma máscara de { "47" } graus escolhida por uma regra fixa), sem auxílio de altura e com um sigma Doppler de { "30" } Hz, ao longo de { "200" } sementes. O seu erro 3-D no percentil 90 é de { "92.2" } m a { "20" } s e de { "870" } m a { "8" } s, face aos { "2" } m e { "10" } m publicados, pelo que os dois limiares de fator dois são NOT MET. O modelo é pessimista, e não otimista como previsto: três satélites fixos dão muito menos diversidade geométrica do que os { "63" } satélites da experiência ao longo de { "10" } minutos com mudança de canal a cada { "15" } s. Ambas as falhas são afirmadas em teste (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Otimizador de transferências impulsivas sobre DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> determina as datas de partida e de chegada de uma transferência balística de dois impulsos e de uma só revolução que minimizam o C3 de partida ou o V-infinito de chegada dentro do Tipo I ou do Tipo II. Pesquisa uma grelha de 2 dias e refina depois com Nelder-Mead 2-D, sobre estados heliocêntricos do kernel DE440; assenta em <c2/>. A comparação foi fixada antecipadamente (bf0439e8) face a um otimizador independente com SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } na oportunidade Terra-Marte de { "2026" }: as quatro otimizações concordam até { "8.7e-13" } em termos relativos, com datas a menos de { "1e-5" } dia (VALIDATED, nova linha do registo). Como referência publicada secundária, o NASA/TM-2010-216764 (o manual Terra-Marte 2026-2045) é reproduzido para o C3 mínimo do Tipo II ({ "9.182" } vs { "9.144" }) e para o V-infinito de chegada mínimo do Tipo II ({ "2.564" } vs { "2.565" }). O C3 mínimo do Tipo I não é reproduzido: { "10.535" } vs { "11.11" } (-5.18 %), sendo que a referência independente da biblioteca concorda com o Kshana. Essa falha está registada e é afirmada em teste.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Estudo da estação de referência lunar</b> ({ "0.36" }, motivado por material publicado sobre uma estação de referência planeada para o polo sul lunar; fontes em <a1><c1/></a1>): o tipo <c2/>, uma varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores polar sul e um dia de épocas, que dá, por ponto e para a região, o percentil do erro corrigido e não corrigido, a disponibilidade com os motivos, a cobertura face a um limiar declarado, os níveis de proteção, o raio de cobertura por azimute e o orçamento da ligação de correções. Reduz-se exatamente a <c3/> num só ponto, época e ensaio; a sua aritmética foi recalculada com numpy sob um limiar fixado antecipadamente (posições e percentis atingidos; as correções da estação falharam o seu por arredondamento de dupla precisão, registado). MODELLED; linha do registo "Lunar reference-station coverage and accuracy map". Sem afiliação nem aval de qualquer agência; nenhuma afirmação sobre o desempenho de qualquer sistema real.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Previsão fixada antecipadamente: cobertura da estação de referência lunar</b> (não é uma validação; MODELLED). <a1><c1/></a1> congela, no commit c05dac1d, os resultados de <c2/> sob os pressupostos declarados publicamente, com hashes SHA-256 dos dados de entrada e dos resultados e um protocolo de pontuação fixado desde já (fator { "2" } para exatidões e níveis de proteção, { "10" } pontos percentuais para disponibilidade e cobertura; um pressuposto alterado dá origem a uma nova previsão datada, nunca a uma edição; uma falha é publicada com tanto destaque como um acerto). Todos os valores são dominados pelo conjunto de elementos, não publicado, da constelação de quatro satélites, que é ILLUSTRATIVE, e di-lo. <c3/> protege-a; <c4/> ganha uma secção "Pre-registered predictions". Sem linha no registo.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Extensões da estação de referência lunar</b> ({ "0.36" }; as limitações { "2" } e { "3" } do estudo da estação e o estilo de solução das fontes), todas opcionais em <c1/> e ausentes por predefinição, pelo que todos os documentos existentes, incluindo a previsão congelada, permanecem inalterados: <c2/> (multipercurso <c3/> no utilizador e na estação, o da estação opcionalmente de Gauss-Markov ao longo das épocas, ruído de código DLL a partir do C/N0, enviesamentos entre canais; valores ILLUSTRATIVE na Lua); <c4/> (crescimento linear do erro de órbita difundido ao longo da latência de correção, ILLUSTRATIVE); <c5/> (restrição de altura, um mínimo de três satélites com ela, uma janela de utilizador estático ao longo das épocas). Dois adendas à comparação com as afirmações publicadas, cada um fixado antecipadamente isoladamente antes da sua execução, ficam ao lado da execução registada sem edição: K5 com crescimento falha a todas as taxas; com o estilo de solução das fontes, K1 a K5 falham e K6 passa ({ "1" } de { "6" }), com o erro 3-D corrigido no p95 de R300 a descer de { "280.6" } m para { "2.11" } m. MODELLED; três linhas do registo.

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
seg-1d0a0dcd42de = <b>Máscaras de horizonte do terreno lunar</b> ({ "0.36" }; a primeira limitação do estudo da estação de referência lunar): uma secção opcional <c1/> em <c2/> (a estação e cada ponto de utilizador) e em <c3/> (cada ponto da grelha) dá a cada local um horizonte dependente do azimute no formato de tabela de linha do horizonte de { "0.36" }, a partir de um perfil declarado e identificado com a sua fonte (<c4/>, <c5/>) e/ou de um traçado de raios sobre um DEM polar (<c6/>) ao longo de círculos máximos da esfera lunar com curvatura exata. Inclui um recorte de { "0.98" } MB do DEM polar sul LRO LOLA <c7/>, de domínio público, reamostrado por média de blocos { "5" } x { "5" } para { "1200" } m (<c8/>, com o respetivo NOTICE, SHA-256 e <c9/>), e o cenário <c10/>, apenas do repositório. Verificado face a horizontes em forma fechada (esfera nua, cratera num planalto, cone rasterizado); MODELLED, linha do registo "Lunar terrain horizon masks from a stated profile or a polar DEM". Sem a secção, todos os documentos, incluindo o bloco de unidades, são idênticos byte a byte.

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
seg-ca0c6ca7396a = <b>Confiança com consciência da geometria</b> (nota de projeto de geometria de { "0.36" }, secção { "4" }). Cada época de <c1/>, estática ou de embarcação, em lote ou em tempo real, traz a sua geometria de satélites: <c2/>, <c3/> (motivos <c4/>, <c5/>, <c6/> e, a título informativo, <c7/>) ou <c8/> quando o registo não dá geometria de satélites, com HDOP, PDOP, VDOP e os satélites usados. É derivada das elevações e dos azimutes que o recetor comunica (NMEA GSV, UBX NAV-SAT) através do kernel <c9/> existente, ou obtida de NMEA GSA. Cada época traz também uma etiqueta, <c10/>, <c11/> ou <c12/>, sempre comunicada e nunca pontuada, e uma nota com o HDOP, o PDOP, o VDOP, o número de satélites e a perda de sinal por extenso. A pontuação de uma embarcação ganha um monitor <c13/> que não deduz nada, a menos que a geometria seja fraca (HDOP acima de { "4" }, PDOP acima de { "6" } ou menos de { "5" } satélites usados), subindo depois em rampa até um limite de { "15" } pontos; a geometria sozinha atinge no máximo a banda degradada, nunca a de não confiável (sem alarme). Cada dedução recebe uma classe, <c14/>, <c15/> ou <c16/>, para que um céu fraco não seja lido como um ataque. <c17/> é <c18/> quando os satélites perdidos estavam todos abaixo de { "15" } graus no seu último relato; uma dedução por geometria fraca é <c19/> quando o HDOP declarado pelo recetor discorda do céu que ele próprio declara em mais de max({ "1.0" }, { "25" } % do HDOP derivado), pelo que um céu fraco forjado não consegue comprar a etiqueta. Uma nova tabela <c20/> indica cada limiar com a sua proveniência (HDOP { "4" }, PDOP { "6" }, pelo menos { "5" } usados, sigma_UERE { "1.5" } m, uma tolerância de HDOP de max({ "1.0" }, { "25" } % do HDOP derivado), sendo os { "25" } % uma escolha representativa para recetores com relógios por constelação ou soluções por subconjunto, { "15" } graus; os valores da IEC 61108-1 e do GPS SPS tal como citados, a verificar face ao texto das normas). A perda total de sinal não é rotulada como céu: quando há satélites à vista que não são seguidos e o DOP dos satélites à vista é bom (e os não seguidos não estão confinados a uma metade do horizonte), a época traz <c21/> e a dedução de geometria é <c22/>. Um HDOP ou PDOP declarado de { "99" } ou mais, a qualidade GGA { "0" } e o modo GSA { "1" } são lidos como ausência de posição, e não como DOP. O limite (<c23/> { "15" }), o fim da rampa (<c24/> { "1.5" }) e o piso (<c25/>, por predefinição o <c26/> da pontuação) estão em <c27/>, tal como os bons níveis da etiqueta (HDOP { "2" }, PDOP { "3" }, { "6" } satélites, representativos); o limite em vigor é <c28/>, pelo que uma tabela <c29/> que aumente <c30/> (incluindo uma de { "0.35" }) reduz o limite em vez de ser recusada, e um piso abaixo de <c31/> é recusado. MODELLED; software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

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
seg-d976d3495695 = A geometria chega a todas as superfícies: o JSON de resultados (<c1/>, <c2/> em cada dedução, <c3/>, <c4/>), as linhas JSON em tempo real (esquema { "1.3" }), os <c5/> em Python e WebAssembly, <c6/> e <c7/>, as ferramentas MCP <c8/>, os pacotes de evidências (<c9/>, <c10/>, uma faixa de geometria na página de resumo) e <c11/> (Prometheus <c12/> e uma etiqueta <c13/> em <c14/>, OTLP <c15/>, campos personalizados CEF <c16/> (estado e classes da geometria), <c17/> (HDOP) e <c18/> (PDOP), verificados com os dois analisadores CEF de referência independente, e LEEF <c19/>, <c20/>, <c21/>). A etiqueta de geometria também é exportada, acrescentada depois de todas as séries e campos anteriores e apenas para entradas que a tragam: Prometheus <c22/> e <c23/>, OTLP <c24/> e <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, e CEF um terceiro campo <c30/> (a etiqueta) e <c31/> (satélites usados); o VDOP não está no CEF (os campos personalizados de vírgula flutuante estão ocupados). Os dois analisadores CEF de referência independente leem de volta os casos de etiqueta tal como escritos (emenda { "5" }: { "176" } linhas, { "172" } analisadas por pycef, { "176" } por Logstash). Um HDOP declarado que o céu declarado não explica é assinalado em cada época e contado (<c32/>, uma linha na página de resumo das evidências), e só é pontuado quando a geometria é fraca. A perda de sinal é exportada por si, uma vez que o estado da geometria permanece <c33/> enquanto ela se mantém: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; em CEF surge como a classe <c37/> em <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/>: o fator de covariância <c2/> por detrás de <c3/>, extraído deste com a mesma aritmética.

# text
seg-c6cc061a3ed6 = Linha do registo "Position error from geometry: RMS error = sigma_UERE x DOP" (<b>MODELLED</b>, consistência interna): um Monte Carlo com sementes da solução de mínimos quadrados do motor nas { "8" } geometrias DOP coincidentes com gnss_lib_py, face ao fator de covariância do kernel DOP validado, com tolerâncias fixadas antecipadamente antes da primeira execução e dois controlos negativos que falham como exigido; a par, uma verificação anterior sobre quatro céus escolhidos à mão, com intervalos de confiança de qui-quadrado, comunicada tal como foi executada, antes do pré-registo.

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
seg-b87b6eafd465 = <b>Máscaras de linha do horizonte dependentes do azimute</b> (<c1/>, <a1><c2/></a1>, ponto { "1" } da nota de projeto): um corte de elevação que depende do azimute, o máximo ponto a ponto de tabelas (cada uma interpolada por si, com fecho em { "360" }°), um desfiladeiro urbano em forma fechada (com extremidades abertas opcionais), setores de arestas vivas e um perfil de terreno com a curvatura da Terra; o corte efetivo é <c3/>. Quatro predefinições REPRESENTATIVE com proveniência declarada (<c4/>, <c5/>, <c6/>, <c7/>), substituíveis campo a campo. Uma secção opcional <c8/> em <c9/>, <c10/>, <c11/> (todos os modos, incluindo a varredura polar), <c12/> e nos ficheiros de treino <c13/>, e em <c14/> e <c15/> através de um novo utilizador em local terrestre, <c16/> (ângulos de observação geodésicos sobre a Terra em rotação, com a vertical geodésica para a separação horizontal e vertical do ARAIM; cada amostra é um instante absoluto, <c17/>, para o qual os conjuntos de elementos, as efemérides difundidas e os ficheiros SP3 são avançados a partir das suas próprias épocas, datadas a partir da época de satélite mais recente quando não é declarada nenhuma <c18/>; um <c19/> em órbita recusa uma linha do horizonte). Os resultados ganham <c20/> e, por amostra, <c21/>. Sem a secção, todos os cenários são idênticos byte a byte a { "0.35.0" }, verificado face a resumos criptográficos do commit da versão. Seis exemplos incluídos: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> e a campanha <c27/> (o desfiladeiro do veículo autónomo como corte plano e como rua; a campanha existente permanece inalterada). MODELLED.

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
seg-95cdecf341d6 = <b>Funções de geometria do céu</b> (<c1/>, ponto { "2" } da nota de projeto): <c2/> (satélites visíveis e mascarados a partir de um local, de um instante e de predefinições de constelação, conjuntos de elementos de duas linhas (<c3/>, no máximo { "4" } MiB, propagados pelo SGP4 do motor até uma <c4/> UTC) ou satélites indicados; <c5/> e <c6/> dizem se o céu é representativo ou o céu que os conjuntos de elementos dão nessa época, e não uma medição; <c7/> lista cada linha não usada com o seu motivo; limites de entrada de { "2000" } satélites acima do horizonte, verificados antes de construir uma tabela de sistema, e de { "16" } relógios de recetor; os cinco DOP; o cofator e a covariância ENU com um relógio por sistema ou um em comum; a elipse de erro horizontal a um sigma e com uma confiança declarada), <c8/> (erros de mínimos quadrados com sementes, no máximo { "5000" }), <c9/>, <c10/> e <c11/>. <c12/> expõe a covariância por detrás de <c13/>, que passa a ser a sua redução (os escalares validados não se alteram). Superfícies: <c14/> e <c15/>, funções Python e WASM com os mesmos nomes, e a ferramenta MCP <c16/> ({ "40" } ferramentas), e o notebook <c17/> (com o seu espelho <c18/>; executado por <c19/>). Cada resultado traz a etiqueta MODELLED, a declaração do modelo de erro e o aviso consultivo.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Registo: cinco linhas de linha do horizonte e de geometria do céu. <b>VALIDATED</b>, cada uma numa comparação fixada antecipadamente antes de a sua referência independente ser executada: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> face ao Orekit { "12.2" } (<c1/>, <c2/>) e ao gnss_lib_py { "1.0.4" } (<c3/>), com a pior diferença de ângulo de observação e de máscara de { "1.1e-12" }° contra { "1e-9" }°, conjuntos visíveis idênticos, DOP { "3.3e-13" } em termos relativos (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> face a numpy <c5/> e <c6/> (P2 padrão), { "270" } casos, eixos { "5.1e-13" } em termos relativos (<c7/>). <b>MODELLED</b>: as reduções de desfiladeiro, setor e terreno; as predefinições; a composição da geometria do céu (céu predefinido, nuvem de Monte Carlo).

# text
seg-8f5ebce999fe = Com as linhas de confiança por geometria, de linha do horizonte e da estação de referência lunar, o registo tem { "274" } linhas: { "134" } validadas, { "136" } modeladas, { "4" } de parceiro.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Estação de referência lunar: laboratório de tempo da estação</b> (<b>MODELLED</b>). Um bloco opcional <c1/> em <c2/> (<c3/>). Modela um relógio de estação (por predefinição da classe miniRAFS, qualquer classe nomeada, ou um cartão de dispositivo ajustado a pontos de estabilidade declarados) governado para LTC, depois em funcionamento livre ou reajustado a cada N segundos. Emite a curva de erro de tempo x(t), o tempo até { "1" }, { "10" } e { "100" } ns (bissecção a par da forma fechada) e o termo dominante por horizonte, tudo com unidades. O resíduo de governação é ILLUSTRATIVE. A taxa de LTC não é rederivada e mantém a sua própria linha VALIDATED. O objetivo ao nível do nanossegundo do material público de Lunar PNT do ICG WG-B (junho de { "2024" }) é citado como declaração da fonte, e não como afirmação. A ordenação dos relógios ótico < PHM < RAFS < miniRAFS mantém-se de { "1" } s a { "7e5" } s, e o teste fixa o cruzamento das curvas de PHM e RAFS perto de { "7.5e5" } s. Esse cruzamento é uma propriedade dos modelos de relógio de um só tipo de ruído (FM de cintilação pura contra FM de ruído branco puro), e não um resultado físico. Sem o bloco, o relatório, a sua tabela e o seu resumo permanecem inalterados. Exemplo: <c4/>. Acrescenta uma linha ao registo, etiquetada MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Estação de referência lunar: geodesia da estação</b> (<b>MODELLED</b>). Dados de entrada opcionais <c1/> e <c2/> em <c3/> acrescentam um bloco <c4/>. A informação de datum das cinco matrizes, proveniente do recorte arquivado de medição de distância por laser, é combinada com o que um retrorrefletor acrescentado e uma baliza VLBI acrescentada, em locais declarados, contribuiriam. O refletor é medido nas épocas arquivadas em que o consegue ver, com os respetivos pesos arquivados. A baliza usa a rede e o calendário de <c5/>, com as estações fixas. O bloco dá cada 1-sigma de Helmert antes e depois, e a sua razão. São limites de Cramer-Rao para um conjunto reduzido de parâmetros, sobre um calendário e um local ILLUSTRATIVE. Dados de entrada ausentes ou vazios deixam o relatório idêntico byte a byte. Exemplos: <c6/> e <c7/>. Acrescenta uma linha ao registo, etiquetada MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Estação de referência lunar: comparação com afirmações publicadas</b> (<b>MODELLED</b>). Cada afirmação numérica em cinco fontes públicas é listada com a sua formulação exata, página e pressupostos declarados, e classificada como comparável, parcialmente comparável ou não comparável (<c1/>; fontes com URL, data de obtenção, SHA-256 e licença em <c2/>). As afirmações parcialmente comparáveis foram pontuadas segundo seis limiares unilaterais fixados antecipadamente antes da execução (<c3/>, revisão { "2" }, 05bf9a19): { "1" } de { "6" } afirmações dentro do limiar fixado antecipadamente (pré-registado 05bf9a19). A cobertura é de { "0.00" } contra >= { "0.95" } nos dois círculos polares sul, e o p95 corrigido é de { "280.6" } m contra <= { "1.5" } m. A causa são os elementos orbitais dos satélites, que nenhuma fonte publica: nos elementos ILLUSTRATIVE incluídos no código, quatro satélites estão em vista comum em { "8" } % das épocas, com geometria quase singular. A execução não reproduz as afirmações com esses elementos e não é prova de que as afirmações estejam erradas. Fixado em <c4/>. Uma linha do registo, etiquetada MODELLED com a conclusão.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Estação de referência lunar: preparação de dados de ficheiros de relógio</b>. <c1/> indica agora o sistema de tempo das suas épocas. É o valor de <c2/> ou, quando este não está declarado, o valor por predefinição do sistema de satélites do cabeçalho. O resultado diz também se o sistema foi declarado. A função recusa um sistema de tempo desconhecido (uma escala de tempo lunar, por exemplo), um ficheiro de sistemas mistos sem declaração e ficheiros que discordam entre si, em vez de os ler como tempo GPS. Inclui um ficheiro de teste sintético de relógio de estação. Não é definido nenhum formato de ficheiro de correções, porque não existe nenhum público.

# text
seg-0fb89eb36003 = Alterado

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = A documentação dos módulos <c1/>, <c2/> e <c3/> já não designa como trabalho futuro o navegador com filtro de Kalman unscented (UKF) de 17 estados, o acoplamento forte com INS completo e o estado de relógio explícito; remetem para <c4/>, <c5/> e <c6/>.

# text
seg-aedd06cf6127 = <b>O RINEX { "4" } já não é recusado</b> ({ "0.36" }, WP-07): um ficheiro de navegação RINEX { "4" } era rejeitado de propósito; agora é lido (ver Acrescentado). Nos ficheiros de observação da versão { "4" } e posteriores, as etiquetas do cabeçalho são reconhecidas apenas nas colunas 61-80, para que os novos registos de texto livre não possam passar por etiquetas.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> lê ficheiros IONEX reais</b> ({ "0.36" }, WP-07): um registo completo de 16 valores preenche as colunas 61-80, que o leitor tomava por uma etiqueta, pelo que devolvia <c2/> em todos os ficheiros IONEX reais. Agora lê como valores um registo cujo campo de etiqueta é numérico. Nenhuma saída fornecida o usava.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Potências recebidas de Galileo E1 e E5a segundo o OS SIS ICD Issue { "2.1" }</b> (revisão, 2026-10-14). As bandas de espetro <c1/> e <c2/>, e as vítimas GNSS de sinais LEO que delas retiram a sua potência, passam a usar as potências recebidas mínimas da Tabela { "12" } do Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (era −{ "157.0" }) e −{ "155.25" } dBW (era −{ "155.0" }).

# text
seg-b0386f62923f = Mudam nove resultados de cenários: os exemplos de espetro, a campanha de espetro, três verticais de resiliência LEO e três projetos de sinal LEO. O C/N0 efetivo muda −{ "0.25" } dB e o J/S +{ "0.25" } dB nestas bandas.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Cada valor alterado ({ "1766" }, antigo → novo) está listado em <c1/> e no respetivo CSV, com as tabelas da documentação que mudaram. Nenhuma linha do registo muda de estado.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Segunda parte, no mesmo dia: as vítimas de sinais LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, E5b da Tabela { "12" }) e <c2/> (−{ "152.0" } → −{ "152.24" } dBW). O ICD não tem uma linha de E5 de banda completa, pelo que o valor AltBOC é a soma de potências dos totais E5a e E5b da Tabela { "12" }, construída como o valor antigo. Mudam três resultados de projeto de sinal LEO ({ "64" } valores: estas potências recebidas e a degradação do C/N0 de LEO para GNSS nas duas vítimas), listados na mesma revisão (§{ "5" }) e no mesmo CSV. Nada mais muda.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>Correção da maré atmosférica S2</b> (<c1/>). Os harmónicos de pressão do ar S2 de Ray ({ "2001" }) são coeficientes de <c2/> não normalizado com atrasos de fase em cosseno; eram usados como totalmente normalizados e com o atraso como avanço em seno do IERS. Entram agora divididos por <c3/> com <c4/>; o novo <c5/> reproduz o modelo A2 da Tabela { "5" } do GFZ STR06/01 para todas as { "21" } ondas (pior { "0.0005" } cm, { "0.05" }°; VALIDATED). Só mudam as saídas com marés ativadas: o ajuste CI de Galileo { "0.132" } → { "0.133" } m, as componentes de Swarm-A em { "1" }–{ "2" } mm (fixado antecipadamente em <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Apenas documentação: <c1/>, <c2/> e <c3/> ficam documentados como solucionadores legados, numericamente inalterados, com remissão para <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>Estado da ronda { "3" } de D9 (<c1/>).</b> A Circular T { "465" } do BIPM saiu em 2026-10-12. A pontuação prospetiva fixada antecipadamente continua por executar: a edição { "465" } contém cerca de { "285" } valores de teste e a regra de paragem exige { "1000" }, ou seja, cerca das edições { "465" }–{ "468" }. A execução precisa também dos ficheiros por laboratório de 2026-09-30 arquivados, porque o BIPM entretanto reescreveu { "87" } dos { "113" }. A linha do registo e o cabeçalho do teste di-lo; o teste, os seus limiares e a sua divisão não mudam.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Revisão da verdade da documentação ({ "0.36" }).</b> Roteiro, linhas de capacidades, linhas de estado de documentos de projeto e comentários de módulos alinhados com o código; sem alterações de saída. Os itens já construídos mas ainda listados como em aberto ficam agora marcados como concluídos: as verificações de máscara ITU-T, o cenário de holdover de { "24" } h e a ingestão de registos de relógio (temporização de telecomunicações), os guias de arranque do primeiro minuto, Lense–Thirring e a verificação cruzada do propagador com o Orekit, a cadeia GCRS com ITRF preciso, os hashes de referência e entre plataformas, a proveniência, o ARAIM de falhas múltiplas (ADD v4.2), o FDE de satélite único, a biblioteca CRPA, o limite de ambiguidade de franja do CAI, o dimensionamento de ruas de cobertura e a vista de órbita 3-D, a dinâmica de atitude de corpo rígido, o escritor de OMM e o leitor de kernels NAIF, a libração lunar DE440, a frase de significado da execução no recreio, <c1/>, o navegador fortemente acoplado de 17 estados e o tipo de mapa de gravidade. As linhas indicam também com precisão o que continua em aberto (por exemplo o JD de duas partes em <c2/>, o leitor <c3/> face a um produto real e a exclusão de vários satélites em <c4/>). O <c5/> em falta é escrito a partir de uma execução nova dos seus testes (M1–M4 passam), e o rascunho de validação IQ voltado para parceiros tem as contagens atuais do registo.

# text
seg-e2290a640df7 = Os códigos de memória do Galileo E1 deixam de ser incluídos.

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
seg-80f8ca869682 = <c1/> e <c2/> (Anexo C.7/C.8 do ICD) são removidos do repositório e dos pacotes. Os termos do ICD (citados em <c3/>) permitem que um utilizador guarde os códigos com a fonte reconhecida e os use num produto, mas só permitem a redistribuição para fins não comerciais, e o Kshana é também oferecido ao abrigo de uma licença comercial. <c4/> / <c5/> passam a devolver um <c6/> e a ler a cópia do próprio utilizador a partir de <c7/> / <c8/> ou, numa cópia de trabalho do código-fonte, a partir de <c9/>, onde o novo <c10/> os extrai do PDF do ICD (com verificação de hash). <c11/> / <c12/> são removidos. Sem as tabelas, os sinais Galileo E1 (<c13/>, <c14/>) devolvem um erro que indica como as fornecer, e os testes de E1 são ignorados com uma mensagem. Com as tabelas presentes, todas as saídas de E1 permanecem inalteradas. Nenhum cenário, resultado de referência ou saída de espetro usa as tabelas de códigos. Os ficheiros de teste de E5a dos Anexos C.3/C.4 (a referência independente de LFSR em <c15/>) são tratados da mesma forma: obtidos pelo mesmo script, ignorados pelo git, e o teste é ignorado sem eles.

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
seg-654d0358137b = <b>Matemática portátil em todo o lado</b> ({ "0.36" }, STUDIO-15): todas as funções transcendentes <c1/> da biblioteca, e os amostradores normal, gama e exponencial de <c2/>, passam a calcular através da <c3/> em Rust puro (<c4/>, <c5/>), pelo que uma compilação nativa e a compilação WebAssembly devolvem JSON de resultados idêntico byte a byte para todos os { "141" } cenários incluídos e para a execução curta de IQ. O custo é que os últimos bits dos resultados calculados com a biblioteca matemática do anfitrião se alteraram: { "98" } dos { "141" } cenários incluídos mudaram, { "43" } não; { "5" } mudaram em mais de { "1e-3" } no seu maior campo, e os restantes em menos. Cada valor alterado está listado, antigo -> novo, em <a1><c6/></a1> (com um CSV de todos os { "136,127" } números alterados); nenhum limiar, tolerância ou valor-limite mudou. Números publicados que mudaram: disponibilidade de <c7/> com a distância à Terra { "0.719" } -> { "0.713" } e erro RMS { "86.147" } -> { "86.499" } m (uma época no limite da disponibilidade passa a resolver-se da mesma forma em toda a parte; imprimia { "0.725" } / { "85.800" } m em macOS arm64); erro de estação de <c8/> { "3.541350" } -> { "3.536885" } m com VLBI e { "2183.558" } -> { "2184.021" } m sem ele; <c9/>, oito valores de <c10/> em { "3" } unidades na última casa (erratum no relatório técnico); o documento <c11/> publicado em grandezas ao nível do piso de arredondamento (oito valores para além de seis algarismos significativos, até { "6.8e-5" } em termos relativos; nenhuma ordenação nem limiar mudou). Os hashes fixados das proteções de identidade byte a byte (<c12/>, <c13/>, <c14/>) são rebaseados para uma linha de base designada "{ "0.36" } portable", mantendo-se os valores de { "0.35.0" } como registo histórico; a previsão congelada da estação de referência lunar não foi tocada e a sua reexecução portátil fica guardada a seu lado (<c15/>). <c16/> (a linha validada de OD conjunta lunar): ficheiros de teste reexportados e comparação com numpy repetida com numpy { "2.4.6" }, a versão registada, com script e limiar inalterados; as seis redes passam (<a2><c17/></a2>). O trabalho dos lotes 2-3 integrado depois de STUDIO-15 também usa matemática portátil ({ "457" } pontos de chamada em { "62" } ficheiros); o que isso alterou está em <a3><c18/></a3>: { "12" } cenários incluídos (maior alteração relativa { "5.2e-8" }, nenhum valor impresso muda), { "28" } linhas de proteção de linha do horizonte revalidadas, o resumo criptográfico M2M4 de <c19/>, os hashes de referência legados de <c20/>, o sigma de datum da baliza não observada ({ "632.3769" } -> { "632.3772" } m), e duas conclusões registadas (fechos de DRO no CR3BP; CRPA A3, { "194" } de { "456" } ligações). O edf exato de Greenhall mantém o seu limiar validado com um logaritmo de precisão dupla-dupla no seu kernel (<a4><c21/></a4>), e a referência independente do test bench gps-sdr-sim foi reexecutada nas exportações NMEA alteradas, com todos os limiares a manter-se (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README: a linha do conjunto lunar indica o nível de evidência de cada parte (dizia que todas eram MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> devolve <c2/> (série, registo de grelha, sistema de tempo, se foi declarado, tipo de registo) em vez de um par <c3/>. Passa a recorrer a registos de recetor/estação (<c5/>) com o nome pedido quando não há registos de satélite (<c4/>).

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
seg-6777ca96624a = Nenhuma pontuação muda, a menos que a geometria seja fraca; a etiqueta é sempre comunicada. Com geometria boa ou razoável (incluindo um céu aberto só com GPS de { "8" } satélites) ou com geometria desconhecida (o monitor não é executado), todas as pontuações são como em { "0.35" }: <c1/> fixa as saídas das duas sessões de exemplo e <c2/> cada corpus NMEA de embarcação submetido (também como céu aberto só com GPS) e os cenários de formação de tripulações aos bytes de { "0.35.0" }, depois de removidas as chaves acrescentadas; nos dois cenários de formação em que a interferência torna a geometria fraca, as épocas fracas diferem apenas pela dedução de geometria. Um registo com geometria fraca perde até { "15" } pontos que não perdia em { "0.35" }. As restantes alterações previstas são todas acréscimos: as chaves acima no JSON de resultados e nos pacotes de evidências (<c3/> não muda); o esquema de linhas JSON em tempo real passa de { "1.2" } para { "1.3" } (<c4/> acrescentado, <c5/> em cada dedução); o resumo do excerto ganha <c6/>; a telemetria ganha séries de geometria, campos e a etiqueta <c7/> apenas para entradas que os tragam, pelo que um fluxo ou resultado de { "0.35" } é apresentado byte a byte como antes. <c8/> é o 17.º nome de monitor; é listado em último lugar em <c9/> quando decidiu (uma embarcação cujo registo dá a geometria; uma lista de { "0.35" } mantém a sua ordem e a contagem de monitores do resumo sobe uma unidade) e não tem entrada em <c10/> (definir uma é recusado: a sua dedução é definida em <c11/>).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> indicava a licença do gnss_lib_py como Apache-2.0; a versão { "1.0.4" } é MIT.

# text
seg-a1a670a9c63e = O leitor NMEA passa a ler GSA (um GSA curto é ignorado, não contado como saltado) e mantém as elevações e os azimutes de GSV, incluindo para satélites listados sem sinal; o leitor UBX mantém a elevação e o azimute de NAV-SAT. O C/N0 é lido exatamente como antes.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Alteração de resultado: os interferidores de banda larga e de varrimento passam a usar Q = { "2" }.</b> A equação antiinterferência usa o ajuste de espetro alargado Q de manual para estes interferidores, onde usava { "1" }. Q = { "2" } é ruído branco sobre o lóbulo principal com a potência do sinal na banda normalizada; está fixado nos testes à forma fechada de <c1/>.

# text
# c1: q_override
seg-21f31ec302de = <b>Inalterado:</b> os interferidores CW e de banda estreita (Q = { "1" }), um tipo de interferidor não reconhecido (Q = { "1" }, o valor mais danoso) e <c1/>.

# text
seg-f362499d2ed0 = <b>Efeito:</b> onde atua um interferidor de banda larga ou de varrimento, o C/N0 efetivo sobe até { "3.0103" } dB, os limiares de J/S derivados sobem { "3.0103" } dB e os raios de negação em espaço livre encolhem por um fator de { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Cenários incluídos alterados:</b> mudam { "12" } de { "144" }, todos como fixado antecipadamente (<c1/>, resultados em <c2/>):

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/>: satélites perdidos { "26" } → { "0" }, distância mediana de perda de bloqueio { "27.4" } → { "19.4" } km;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/>: raio de negação por dinâmica do laço { "75.2" } → { "53.2" } km;

# text
seg-096a24491872 = e as campanhas e verificações cruzadas de espetro que os contêm.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Consumidores afetados:</b> os tipos <c1/>, <c2/>, <c3/> e <c4/>, o <c5/> dos tipos de espetro, a curva de referência MODELLED da campanha de IQ e o Q predefinido de labfit, e a exportação de cenas de interoperabilidade.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = Extensão JetBrains: nenhuma API de plataforma obsoleta ou marcada para remoção. Os cinco diálogos de escolha usam um pequeno <c1/> com uma lista pendente em vez do obsoleto <c2/>; os seletores de um só ficheiro usam o construtor de <c3/> em vez do obsoleto <c4/>; a animação abre com <c5/> em vez de <c6/>, que a plataforma { "2026.3" } marca para remoção. O Since-build mantém-se em { "243" }. O IntelliJ Plugin Verifier reporta Compatible, sem utilização obsoleta ou marcada para remoção, face a { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) e { "2026.3" } EAP (IU-263.6259.32); <c7/> verifica { "2024.3" } por predefinição e qualquer lista indicada em <c8/>.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> e <c2/> devolvem <c3/>: uma secção <c4/> inválida é um erro quando chamada diretamente, como já era através de <c5/>, em vez de um regresso silencioso à máscara plana. <b>Quebra de compatibilidade</b> para quem chama estas duas funções em Rust.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Pontuador da campanha: um falso bloqueio real do seguidor nunca era contado</b> (<c1/>). A verificação de falso bloqueio do seguidor move um canal de LOCKED para LOST quando dispara. O pontuador marcava, em vez disso, a atualização seguinte do canal, que já estava desbloqueada e por isso nunca era contada. Um evento <c2/> comunicado a partir de LOCKED é agora um episódio no seu instante, na execução e em cada evento declarado que o contenha. Um encontrado durante a captura, ou repetido por um canal já em LOST, não é um novo episódio. Um novo teste provoca um falso bloqueio real: uma portadora GPS L1 C/A legítima com um salto de 1/(2T) enquanto bloqueada (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = Na campanha de referência de <c1/>, só muda o PRN { "11" } de ramp/agc-3bit (episódios de falso bloqueio { "0" } → { "1" }, { "426" } e { "437" } por hora bloqueada).

# text
seg-cfc47d9d9237 = Os DIGESTs das suas células são fixados de novo.

# text
seg-fcfa0de18b05 = A fixação dos resultados pontuados, fixada antecipadamente, mantém-se ativa e continua a reproduzir-se exatamente: no seu hash, apenas esses seis campos, alterados por esta correção feita após o registo, são remapeados para os seus valores anteriores à correção. Os valores corrigidos são fixados à parte.

# text
seg-b96d34bb1d36 = Nenhum limiar foi alterado e nenhuma linha, valor ou número web VALIDATED mudou.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign: uma baliza sem observação passa a ser comunicada</b> (encontrado por MR-05). O relatório ganha <c1/> e <c2/> apenas quando alguma baliza não tem observação, e então os sigmas das balizas observadas provêm da sua própria informação em vez de serem todos nulos. O datum não muda, e nenhuma saída por predefinição, incluída ou publicada se altera (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Referencial lunar de eixos principais</b> (<c1/>, usado por <c2/> e pelo ajuste do LRO): o desvio entre o referencial de Terra média e o de eixos principais da DE421, de <c3/>, era aplicado no sentido errado e com a ordem de Euler errada, pelo que o referencial PA analítico ficava a cerca de { "208" }″ do PA em vez de coincidir com ele. Passa a ser transcrito como o Frames Required Reading do SPICE o define e concorda com <c4/> do SPICE até { "2.6e-16" } rad; o referencial PA analítico fica a { "6" }″ a { "8" }″ do PA da DE440 (fixado antecipadamente e1ead19b, refixado be33382e depois de a primeira alteração proposta falhar o limiar de { "1e-12" }; <c5/>). Números publicados que mudam: o ajuste do LRO (<c6/>) com sobreposição bruta { "53.8" } → { "39.9" } m, dinâmico { "12.6" } → { "12.05" } m, dinâmico reduzido { "6.65" } → { "6.67" } m (limiares inalterados). A pilha analítica concorda agora com a validação cruzada ANISE de nível DE ({ "12.0" } / { "6.67" } m) nos dois níveis; a diferença anterior no nível dinâmico era este erro.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>O servidor MCP recusa <c1/></b> (seguimento de CAP-06b). O caminho do mosaico de terreno do tipo de interferência está agora em <c2/>. Uma superfície em linha recusa um cenário que o indique, com uma mensagem que não contém o caminho nem um erro do sistema operativo. O teste de proteção de fontes de ficheiro assinala agora também os campos que terminam em <c3/>.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> com uma parte fracionária do dia perdia a fração nas conversões de UTC, TAI, UT1 e rotação da Terra (uma hora de parte do dia deixava a Terra { "15" }° errada); a parte do dia é agora normalizada para um inteiro. Nenhum chamador do motor foi afetado: todos passam um dia inteiro, e todas as saídas fornecidas são idênticas bit a bit.

# text
seg-144d90307ec6 = Planeado

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = A geometria a partir de uma linha do horizonte declarada (ponto { "1" } de { "0.36" }, já no motor como <c1/>): <c2/> e <c3/> a partir da linha do horizonte quando a entrada a fornece (a lacuna de azimute como alternativa), um evento de degradação natural (fiorde ou terminal) em <c4/>, e as duas geometrias mascaradas da nota de projeto na linha sigma_UERE x DOP, fixadas antecipadamente como adenda.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = Geometria para registos RINEX com navegação (a partir da posição do próprio motor) e registos Android (a partir das linhas <c1/>); ambos leem hoje <c2/>. Geometria em <c3/> (versão { "1" } inalterada em { "0.36" }) e nas integrações com Signal K e OpenCPN.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Uma lacuna preexistente, não introduzida em { "0.36" }: quando o campo SNR de todos os satélites está vazio, não dispara nenhuma dedução de <c1/> nem de C/N0; a perda total de sinal só é visível através de <c2/> do monitor de geometria (classe <c3/>). Está prevista uma dedução para este caso.

# text
seg-a5a7a10ee11c = Um fluxo de esquema { "1.3" } nas referências independentes externas de telemetria (o analisador de formato de texto do Prometheus e o recolhedor OTLP), que hoje cobrem apenas fluxos { "1.2" }.

# text
seg-caa1977b5b5e = Uma obstrução bilateral (um desfiladeiro ou um fiorde estreito) é lida como perda de sinal e não como céu bloqueado até a linha do horizonte ser integrada.

# text
seg-4bd0f178ca4e = Uma passagem que nomeia clientes de IA de terceiros é omitida aqui; consta de <a1>CHANGELOG.md</a1> no GitHub.

# text
seg-b2689beaba9e = Verificador de Galileo OSNMA

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Novo módulo <c1/> e <c2/>: um verificador aberto, em Rust puro, do lado do recetor para o Galileo OSNMA.</b> Lê páginas I/NAV e comunica, por satélite e época, se os dados de navegação estão autenticados, com um motivo para cada falha ou atraso: leitura de HKROOT e MACK, remontagem de DSM-KROOT e DSM-PKR, verificação de Merkle da chave pública, verificação da cadeia de chaves TESLA, verificação de MACSEQ e de etiquetas para ADKD { "0" }, { "4" } e { "12" } incluindo autenticação cruzada, e um resultado com a forma de <c3/> para o monitor de confiança do recetor. A saída traz um aviso consultivo de que o estado não é um serviço de integridade de navegação. <c4/> indica o que é e o que não é verificado, o requisito de tempo, e que o Kshana não concede quaisquer direitos ao abrigo dos direitos de propriedade intelectual do ICD OSNMA da UE (os utilizadores baseiam-se na autorização do Anexo E do ICD). Implementado face ao SIS ICD Issue { "1.1" } e às Receiver Guidelines Issue { "1.3" }. As páginas têm verificação CRC e um fluxo de bytes UBX-RXM-SFRBX da u-blox pode ser lido diretamente (<c5/>). Os testes por predefinição usam dados sintéticos e testes de resposta conhecida de primitivas publicadas; um teste opcional lê uma cópia descarregada localmente dos vetores oficiais. Após revisão independente, o verificador obtém o seu tempo apenas de chaves TESLA verificadas (uma subtrama de futuro distante falsificada já não pode apagar uma falha), deixa uma autenticação expirar e acompanhar o IODnav em uso, respeita as mensagens de alerta verificadas (cuja folha de Merkle passa a incluir o campo aleatório NPK) e o estado NMA "don't use", mantém as etiquetas fictícias fora do estado do satélite, mantém as cadeias por CID com revogação e renovação, verifica o hash de preenchimento de KROOT, e limita os comprimentos de trama UBX e o trabalho de verificação TESLA. Um satélite só é lido como autenticado enquanto os dados mais recentes de efemérides e de relógio que envia forem, bit a bit, os dados que foram autenticados (e não apenas sob o mesmo IODnav), um estado ou revogação do cabeçalho NMA não autenticado só conta quando dois satélites concordam ou um KROOT verificado o transporta, um KROOT mais antigo reproduzido não pode substituir uma cadeia, e um fluxo de chaves parado é comunicado.

# text
seg-3e7df5c888ca = Acrescentado (canais do servidor MCP)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, HTTP em streaming, alojado pelo próprio utilizador.</b> Loopback por predefinição; um endereço que não seja loopback exige <c2/> e um token de portador em <c3/>; nenhuma ferramenta lê ou escreve um caminho (as ferramentas de ficheiros IQ estão desativadas); limites de tamanho de pedido, tempo e concorrência; sem cabeçalho CORS; verificações de Host e Origin. O Kshana não aloja nenhum ponto de acesso (<c4/>, com modelos para Docker, Fly.io e Cloud Run).

# text
seg-c392cde151c9 = Acrescentado (superfícies)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> em Python e WebAssembly.</b> O verificador por detrás de <c2/> sobre bytes em memória, devolvendo o JSON que <c3/> imprime (aviso consultivo no seu campo <c4/>; apenas estado de autenticação, não um serviço de integridade de navegação). As mesmas recusas que na linha de comandos. Não está no MCP: a entrada é um fluxo bruto longo do recetor, mais bem servido pela CLI e pelo Python. <c5/> e <c6/> di-lo.

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
seg-6128929994b4 = <b><c1/> em WebAssembly, Python e MCP, com um comando de extensão e uma ação JetBrains.</b> Apresenta um fluxo de confiança ou um resultado de <c2/> como texto Prometheus, linhas syslog CEF ou LEEF ou uma carga JSON OTLP, com os codificadores que <c3/> usa (<c4/>); sem socket e sem relógio. Extensão: <c5/> e a competência <c6/>. JetBrains: Render Trust Telemetry. As funcionalidades <c7/> e <c8/> e o servidor MCP passam também a ativar <c9/>, que não acrescenta nenhum crate.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Varrimento de paridade.</b> Ações JetBrains Validate Scenario, List Scenario Kinds e Assess Receiver Stream; <c1/> passa a listar <c2/>, <c3/>, <c4/> e <c5/>; o notebook <c6/> (mapeamento de compliance e exportação de test bench); e cada célula "CLI only" do JetBrains que restava em <c7/> é agora um N/A explícito com o seu motivo.

# text
seg-062ef0cf7ee7 = Acrescentado (pacotes de evidências)

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
seg-9889575c2df1 = <b><c1/> e <c2/>: pacotes de evidências assinados e verificáveis para um evento de confiança GNSS.</b> Um pacote reúne o excerto bruto do registo e o SHA-256 do registo completo, a configuração com todos os limiares, os resultados e motivos por época, a versão do motor, um manifesto encadeado por hashes e um resumo HTML autónomo, assinados com Ed25519 (uma chave de <c3/> ou um ficheiro próprio; as chaves nunca são guardadas num pacote e <c4/> é ignorado pelo git). <c5/> verifica todos os hashes, a cadeia e a assinatura e indica exatamente o que falha; com <c6/> fixa o signatário. Pode ser anexado um token RFC { "3161" }, que é lido e associado ao manifesto (a assinatura da própria autoridade não é verificada por esta compilação; <c7/> trata disso). O excerto do registo são os bytes exatos da janela quando o leitor comunica intervalos de origem (NMEA, UBX, RINEX { "3" }, Android) e, caso contrário, o registo completo, e o manifesto diz qual dos casos. A criação e a verificação são funções públicas puras (<c8/>) que compilam para <c9/>. Os pacotes declaram que são um registo técnico, e não um parecer jurídico. As novas dependências são a árvore de <c10/> (BSD-3-Clause e Apache-2.0/MIT, funcionalidades mínimas) e um <c11/> direto (já nessa árvore) para apagar o material de chaves. Ver <c12/>.

# text
seg-280fd37126c1 = Acrescentado (telemetria de confiança)

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
seg-ebd269c618b0 = <b><c1/>: a confiança GNSS como fonte de telemetria de segurança.</b> Lê o fluxo de confiança por época (linhas JSON: pontuação 0-100, banda, motivos) ou um resultado em lote de <c2/> e alimenta um ponto de acesso Prometheus <c3/> (localhost por predefinição), eventos syslog em CEF ou LEEF dentro de um envelope RFC { "5424" } (UDP ou TCP) e, atrás da funcionalidade <c4/> desativada por predefinição, exportação JSON OTLP/HTTP. A entrega corre em threads de trabalho com limites de tempo de ligação e de escrita, recuo de religação limitado e um contador <c5/>, pelo que um recolhedor morto ou bloqueado não consegue bloquear a avaliação em tempo real nem congelar <c6/>; as etiquetas de motivo são limitadas a { "64" } séries. Sem novas dependências. Há um painel Grafana de exemplo em <c7/>. Os nomes das métricas, as etiquetas e o mapeamento de campos CEF/LEEF estão em <c8/>. O formato do fluxo está isolado em <c9/>.

# text
seg-fa5e803edb44 = Confiança marítima: uma pontuação de confiança em tempo real de 0-100 para a posição de uma embarcação em movimento, a partir do NMEA { "0183" } que o recetor já emite, com uma barreira opcional.

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
seg-c5b3fcb9bba8 = <c1/> aceita uma tabela <c2/> (<c3/> ou <c4/>, a velocidade máxima, a aceleração e a taxa de viragem da embarcação, a altura da antena acima da linha de água e um sensor de rumo opcional; cada valor por predefinição está documentado com o seu motivo). Para uma embarcação, o monitor estático de salto de posição, que mede a distância à média de calibração e está errado num navio em movimento, é substituído por monitores causais de plataforma móvel: consistência cinemática da posição face à velocidade e ao rumo comunicados e face aos limites da embarcação, rumo do giroscópio face ao rumo sobre o fundo, odómetro de velocidade face à velocidade sobre o fundo, altitude da antena face à altura declarada acima da linha de água, colapso e subida conjunta da dispersão de C/N0 face à linha de base de calibração, e consistência temporal (também face ao relógio deste computador, em modo em tempo real). Lê também um estado de autenticação comunicado, global ou por satélite (apenas um estado comunicado: sem criptografia OSNMA). Cada limiar é declarado numa tabela <c5/> antes da execução. Cada época recebe depois uma pontuação de { "0" } a { "100" } por um mapeamento determinista e fixado antecipadamente (sem aprendizagem, nada ajustado a eventos; os pesos, os limites das bandas e as evidências constam numa tabela <c6/>), mapeada nos estados de confiança existentes, com os monitores que deduziram e os seus pontos. Os cenários estáticos não mudam e têm o mesmo hash que antes. <c7/> lê stdin, um ficheiro em acréscimo, TCP ou UDP e escreve uma linha JSON por época e uma frase proprietária <c8/>; com <c9/> deixa o fluxo passar inalterado enquanto a posição é de confiança e marca a posição como inválida (qualidade GGA { "0" }, estado RMC e GLL <c10/>, modo GNS e VTG <c11/>) enquanto não é. A barreira está desativada a menos que seja pedida; <c12/> serve o fluxo filtrado a qualquer número de clientes TCP (loopback por predefinição, um cliente lento é largado em vez de bloquear os outros). Este é um software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }); o operador continua a ser responsável. <c13/> é um registo sintético de Tallinn a Helsínquia, escrito apenas como texto, com um desvio de posição a meio do trajeto durante o qual o recetor continua a comunicar uma posição válida; a sua saída esperada está fixada por um teste. Guia: <c14/>. As verificações não conseguem ver um falsificador cuja posição seja consistente com tudo o que está no barramento; o guia di-lo.

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
seg-8539a42718cb = <b><c1/> e <c2/>: um retrato público de onde aeronaves e navios comunicaram dados de navegação degradados, e de quanto de uma rota é afetado.</b> Os dados de entrada são ficheiros CSV locais feitos a partir de dados ADS-B (adsb.lol, ODbL { "1.0" }) e AIS (NOAA MarineCadastre, Kystverket sob NLOD { "2.0" }) com licença aberta; cada ficheiro de saída é uma fonte e um dia UTC de GeoJSON, com o método, os seus limiares, a licença dos dados, a atribuição e o enviesamento de cobertura da fonte. O método ADS-B agrega NIC e NACp numa grelha fixa e considera uma célula degradada com base na proporção de aeronaves distintas, com salvaguardas para equipamento que nunca comunica exatidão, baixa altitude e causas de área alargada. O método AIS executa cinco detetores: posições em terra (face a uma linha de costa fornecida pelo utilizador), trajetos circulares, saltos implausíveis, velocidades implausíveis e muitas embarcações numa só posição. Os limiares são constantes fixadas antecipadamente de uma versão de método designada. Apenas agregados: os identificadores são tratados por hash em memória e nunca escritos, e as células com menos de { "5" } aeronaves ou embarcações distintas não são publicadas. Uma célula degradada não é uma constatação de interferência. Os comandos por predefinição não usam rede; um auxiliar opcional <c3/> descarrega polígonos de terra do Natural Earth de um endereço fixado por commit e só guarda o ficheiro se o seu SHA-256 coincidir. A entrada ADS-B é um CSV ou diretamente os ficheiros de histórico readsb do adsb.lol (nova dependência: <c4/> com o seu motor em Rust puro, para gzip). Ambos os métodos estão na versão { "2" }: uma chamada de degradado ou anómalo exige pelo menos { "5" } aeronaves ou embarcações (o mínimo de publicação), toda a contagem por célula abaixo de { "5" } é retida como <c5/>, e um dia cujo fundo não pode ser estimado retém as suas chamadas. Os ficheiros de saída têm o nome <c6/> e nunca são sobrescritos; a entrada é lida em fluxo linha a linha; a exposição de rota trata o antimeridiano. Os testes usam apenas dados sintéticos. Ver <c7/> e a revisão de licenças em <c8/>.

# text
seg-7a54dfab93dc = Acrescentado (fluxos de formação)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/>: NMEA { "0183" } de ponte sintético para formação de tripulações no reconhecimento de interferência e de spoofing GNSS.</b> A partir de um TOML de cenário, escreve um ficheiro ou transmite por TCP ou UDP (unicast ou broadcast; em tempo real, acelerado ou o mais depressa possível) o conjunto completo de ponte GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT e VBW para o trajeto de uma embarcação com limites de taxa de viragem, aceleração e corrente, com geometria de satélites a partir das constelações nominais do próprio motor. Eventos programados numa linha temporal: interferência, desvio de posição (uma posição válida que se afasta), spoofing de tempo e um atraso de repetição, cada um com rampas de início e de recuperação. Um registo do instrutor (JSON e texto) regista o que foi injetado e quando, com o trajeto verdadeiro face ao comunicado. Uma biblioteca em <c2/> (interferência em mar aberto, desvio costeiro, spoofing de tempo na aproximação ao porto, combinado) traz notas para o formador. A saída tem somas de verificação válidas e é determinista por semente; os testes fixam um excerto de referência por cenário e leem cada frase com o leitor NMEA de <c3/>. Apenas texto: sem saída de RF, IQ ou forma de onda; os fluxos destinam-se a formação e ensaio e nunca devem ser ligados aos sistemas de navegação em funcionamento de uma embarcação. Ver <c4/>.

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
seg-538cdf145ac1 = <b>Extensão Signal K</b> (<c1/>, não publicada no npm): executa ou liga-se a <c2/> (a entrada NMEA do próprio servidor, argumentos de entrada personalizados, uma fonte TCP de linhas JSON, ou as frases <c3/> de um fluxo com barreira), publica a pontuação de confiança, a banda, os motivos, os alarmes e o estado da barreira em <c4/> (incluindo a posição comunicada pelo recetor como contexto, nunca <c5/>), e emite uma notificação Signal K (<c6/> em degradado, <c7/> em não confiável, com limiares de retenção, de limpeza e de obsolescência, todos no esquema de configuração). Sem dependências npm. Testado sobre saída sintética gravada.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b>: o NMEA em modo de barreira é servido diretamente por <c1/> (recomendado); um retransmissor TCP sem dependências (<c2/>) é a alternativa opcional. Em qualquer dos casos, o OpenCPN vê uma posição inválida quando a confiança colapsa e <c3/> na sua janela de depuração NMEA; os testes reproduzem o fluxo sintético com barreira através de um socket TCP real e verificam o que um consumidor recebe. Uma extensão nativa de painel de pontuação (<c4/>, API de extensões { "1.18" }, CMake) lê <c5/> do próprio fluxo NMEA do OpenCPN e alerta na banda de não confiável; compila, a sua lógica tem testes unitários e foi executada dentro do OpenCPN { "5.8.4" } sob um ecrã virtual (evidências e um script de reprodução em <c6/>); não está empacotada para o gestor de extensões.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Construção de referência</b> (<c1/>): lista genérica de peças, configuração do sistema operativo, unidades systemd para o monitor consultivo e para a barreira opcional (verificadas com <c2/> por <c3/>), uma opção de contentor, ligação ao Signal K.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = A extensão Signal K aceita o esquema JSON em tempo real { "1.2" } (uma chave <c1/> e depois uma chave <c2/> acrescentadas; as chaves acrescentadas desconhecidas são ignoradas), verificado sobre saída real de { "1.2" } e face a um signalk-server real.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Correções da revisão: as unidades systemd reiniciam sempre e correm em ambiente isolado (sem shell, sem rede onde não é necessária), um excerto de logrotate, <c1/> falha perante qualquer constatação; o contentor executa a barreira a partir de variáveis de ambiente, com verificação de saúde e imagens de base fixadas por resumo; metadados de pontuação do Signal K, a notificação obsoleta é substituída quando os dados retomam, os erros de processos filhos são mantidos e os encerramentos escalam, <c2/> inseguros são recusados, e a notificação está em <c3/>; o retransmissor limita uma linha parcial retida; os analisadores de <c4/> rejeitam pontuações fora de { "0" } a { "100" }; uma verificação de ligações da documentação; um fluxo de trabalho de CI (<c5/>) que executa tudo isto, incluindo o binário real de ponta a ponta.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Software de caráter consultivo, não um equipamento homologado; o operador continua a ser responsável. Apenas software: nada transmite, e não é afirmado nenhum valor de deteção ou de falso alarme.

# text
seg-72cb9f45ce99 = Acrescentado: mapeamento de compliance e exportação para test bench

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> e <c2/>.</b> Um mapeamento das saídas do Kshana para cinco referenciais e normas de resiliência (o US DHS Resilient PNT Conformance Framework v2.0, as orientações da IMO para navios, as orientações da EASA para a aviação, o artigo { "21" } da NIS2, a EN { "16803" }, uma norma paga citada por parte e pelos poucos números de cláusula visíveis no texto do catálogo), uma tabela por referencial: a referência, o que pede na nossa paráfrase, as saídas que fornecem elementos de prova em apoio dele, e a lacuna. Ficam registadas as versões das fontes, os URL e o que foi e não foi lido. <c3/> preenche o mapeamento a partir das execuções indicadas e marca cada linha como <c4/>, <c5/>, <c6/> ou <c7/>, em Markdown e JSON, com a lacuna mantida em todas as linhas. A formulação é "fornece elementos de prova em apoio de"; nada é classificado nem aprovado. Os testes usam execuções sintéticas e falham quando uma tabela submetida se afasta do código.

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
seg-ee9a0a43e4b0 = <b><c1/>.</b> Escreve o movimento do veículo e os eventos de um cenário <c2/>, <c3/> ou <c4/> para um simulador GNSS de laboratório: um CSV de movimento do utilizador com referenciais documentados e um ficheiro auxiliar de metadados, <c5/>/<c6/> NMEA { "0183" }, texto de pontos de passagem, e os eventos como CSV e como blocos <c7/> <c8/> (<c9/>). Apenas movimento e eventos: nenhum sinal é escrito. Cada ficheiro é lido de volta em <c10/> e comparado dentro da sua tolerância declarada. <a1><c11/></a1> dá o método para reproduzir a exportação através de um simulador e pontuar o registo do recetor com <c12/>.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>O que conta como evidência.</b> Um resultado só conta para uma capacidade quando traz os campos que o seu tipo escreve; uma etiqueta de tipo, por si só, não conta para nada. Tipos desconhecidos, um resultado que discorda do seu cenário irmão, hashes não hexadecimais e contagens de confiança do recetor malformadas são listados como não usados, com o motivo. O relatório escapa as células de Markdown e não pode entrar em pânico com um hash não ASCII. <c1/> e <c2/> recebem textos, não caminhos.

# text
seg-6b46de1164d8 = Exportação para test bench.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> tem verificação de intervalo (<c2/>); o ficheiro de pontos de passagem verifica cada intervalo e o comando diz porquê quando um é deixado de fora; a documentação indica que o rumo de <c3/> é a guinada do corpo e não o rumo sobre o fundo, os campos de substituição de <c4/>, e a própria variação de altura do cenário. <c5/> e <c6/> constam do texto de utilização.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> expõe o histórico de estados verdadeiros do perfil de condução de <c2/> (o mesmo passo que a verdade do próprio tipo usa), e <c3/> ganha campos de data e hora NMEA.

# text
seg-fbfc1a59e99b = Validação do mapa de interferência

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>A semântica de descodificação e a geometria do mapa de interferência são verificadas face a implementações independentes sobre dados de entrada sintéticos.</b> Os significados dos códigos NIC e NACp face à descodificação com pyModeS de tramas ADS-B sintéticas, os valores de não disponível do AIS face à descodificação com pyais de frases AIVDM sintéticas, a atribuição de células da grelha face a shapely, o comprimento de rota por estado de célula face a shapely e GeographicLib, e a mascaragem de interior face a shapely e pyproj, cada um com uma tolerância fixada antes da primeira comparação (<c1/>). Isto valida a forma como os códigos e os valores dos campos são lidos e a geometria, não que uma célula assinalada seja interferência. O leitor de polígonos de terra fecha agora um anel que não repete o primeiro vértice, que antes lia sem a sua última aresta. A documentação indica os limiares de baixa exatidão de NACp e NIC como o limite que cada código representa (NACp { "6" } é um limite de EPU de { "556" } m, NIC { "5" } um limite de contenção de { "1" } NM).

# text
seg-cf4ffdbba1a6 = Acrescentado (validação dos formatos de telemetria e dos pacotes de evidências)

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
seg-ad6730e0e891 = <b>Verificações externas da criptografia dos pacotes de evidências, do verificador de pacotes e dos formatos de transmissão da telemetria.</b> Os vetores de teste Ed25519 da secção { "7.1" } da RFC { "8032" } ({ "1" }, { "2" }, { "3" } e { "1024" }) e os exemplos SHA-256 da FIPS 180-4 passam pelas próprias funções de assinatura, verificação e hash do pacote, com igualdade exata. Um verificador escrito em Python apenas a partir da secção normativa de <c1/> (hashlib e <c2/>) concorda com o verificador em Rust em { "71" } pacotes íntegros e adulterados: veredicto, conjunto de falhas, veredicto da assinatura e ambas as cabeças da cadeia. A nossa exposição Prometheus é lida pelo analisador do cliente oficial em Python e o nosso JSON OTLP pela mensagem oficial <c3/>, de forma estrita, e ambos concordam com o estado a partir do qual foram feitos. CEF e LEEF não têm validador aberto independente e continuam modelados. <c4/> ganhou o formato normativo do pacote e o procedimento de verificação a partir dos quais o verificador clean-room foi escrito; <c5/> ganhou <c6/>. Referências independentes e ficheiros de teste: <c7/>, <c8/> com <c9/>, <c10/>; testes <c11/>, <c12/> e <c13/>. A CI não precisa de Python.

# text
seg-20d1b02bfda4 = Acrescentado (validação dos eventos CEF)

# text
seg-8c464e43e43d = Os eventos CEF da telemetria são lidos de volta corretamente por dois analisadores independentes de código aberto.

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
seg-a6321d13b0ab = <c1/> { "1.11" } e o codec CEF do Logstash (<c2/> { "6.2.7" } no Logstash { "8.15.3" }) analisam { "157" } linhas CEF (cada mudança de banda e cada época do fluxo de telemetria submetido, mais texto adversarial com <c3/>, barras invertidas, barras verticais, quebras de linha, tabulações e texto multibyte) e recuperam cada campo do cabeçalho, a gravidade, o conjunto exato de chaves da extensão e cada valor exatamente. O codec do Logstash lê também quatro linhas cujo texto de cabeçalho exige escape, o que <c4/> não consegue. O limiar foi registado antes de qualquer dos analisadores ser executado (<c5/>); ficheiros de teste em <c6/>, scripts de referência independente <c7/> e <c8/>; a CI não precisa de Python nem de Logstash. O LEEF não tem analisador aberto mantido e continua modelado. Os eventos CEF passam a trazer a pontuação de confiança e o desvio de época nos campos personalizados de vírgula flutuante do dicionário CEF (<c9/>, <c10/>) em vez dos campos inteiros <c11/> e <c12/>, que não serviam para nenhum dos valores; o CEF é novo nesta versão, pelo que nada do que foi distribuído muda.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP: <c1/> aceita o registo como <c2/> ou <c3/>; a entrada da ferramenta é limitada a { "4" } MiB.

# text
seg-8999974aa1fa = O gráfico de interferência também retira as suas cores da paleta.

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
seg-8c8ff384dbf6 = <c1/> era o único módulo que a revisão da paleta Observatory deixou com as suas próprias cores enquanto o trabalho do Q de interferidores era integrado; o seu <c2/> (os cenários <c3/>, <c4/> e outros do tipo <c5/>) lê agora <c6/>, e a lista de exceções em <c7/> está vazia. Apenas cores e tipo de letra: os gráficos <c8/> e <c9/> são iguais às suas representações gravadas anteriormente depois de normalizadas a cor, <c10/> e o rodapé de versão. Nenhum valor representado mudou. As cópias gravadas do Studio em <c11/> foram regravadas nas retransposições de { "0.33.0" } e { "0.34.0" } (apenas o carimbo de versão): ainda trazem a cor antiga do gráfico de interferência, e adotam a cor da paleta na próxima retransposição.

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
seg-a059d10c5330 = <b>O limite de 3 sigma do conjunto de relógios cobre agora o piso de cintilação, e a verificação de saúde do filtro vê-o.</b> Com um <c1/>, o relógio verdadeiro trazia FM de cintilação mas o filtro de dois estados que fornece o limite de integridade não, pelo que a cobertura de 3 sigma do cenário <c2/> fornecido era { "0.41" } (clássico) e { "0.33" } (quântico), e a verificação NIS/NEES, que tirava a sua verdade do modelo do próprio filtro, comunicava valores idênticos com e sem o piso. O limite é agora a variância de dois estados mais a variância exata da fase de cintilação acumulada desde a última sincronização, calculada a partir do mesmo banco que o relógio verdadeiro usa; a verificação NIS/NEES tira a sua verdade do modelo alargado com esse banco e executa o filtro alargado correspondente (e o filtro de dois estados face à verdade de cintilação comunica <c3/>). Alteração de saída, apenas para relógios com um <c4/> não nulo: <c5/> em <c6/> passa de { "0.40866" } / { "0.33026" } para { "0.99970" } / { "1.0" } (clássico / quântico) e o NIS/NEES de <c7/> passa a incluir a cintilação; o erro de temporização, <c8/> e <c9/> não mudam, e os cenários sem piso são idênticos byte a byte. <c10/> (tipo orbit, semente { "7" }, pisos { "1e-16" } / { "2e-11" }) também muda: <c11/> clássico de { "0.7734" } para { "1.0" } e quântico de { "0.9796" } para { "1.0" }, e o NIS/NEES de <c12/> e as suas bandas mudam. O seu <c13/> quântico passa de <c14/> para <c15/>: um evento de amostragem do conjunto de cintilação de 16 sementes por 60 passos (NIS { "0.8815" } face a uma banda de [{ "0.9125" }, { "1.0914" }]), e não um defeito. A banda é de { "95" } %, pelo que cerca de { "5" } % das sementes assinalam um filtro correspondente por construção ({ "40" } sementes novas deste cenário: quântico { "1" } e clássico { "2" } assinalados); a { "64" } por { "200" }, a mesma semente fica dentro da banda para ambos os relógios (NIS { "0.990" } e { "1.001" }). Seguimento conhecido: o tipo fusion tem a mesma lacuna (integridade clássica { "0.80" } com um piso); o tipo hybrid mantém-se acima de { "0.99" }.

# text
seg-c7308350b6d4 = <b>Entrada do servidor MCP reforçada.</b> As ferramentas de cenário do servidor MCP aceitam agora apenas conteúdo em linha e recusam campos de fonte de ficheiro; o tamanho da entrada é limitado. Aviso consultivo: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-065c4431197e = Reprodução em laboratório: um motor de seguimento, monitores de deteção e um executor de campanhas para gravações IQ de GNSS, com os desenhos de laço, estimadores de C/N0 e pontuações que os acompanham. Classe de evidência: tudo o que se segue é <b>MODELLED</b> ou verificado quanto à consistência interna face a formas fechadas e a simulação com sementes; nada disto acrescenta uma linha VALIDATED, e o registo de verificação não muda ({ "251" } linhas: { "124" } validadas, { "123" } modeladas, { "4" } de parceiro). É uma camada de análise de software: nada aqui sintetiza uma forma de onda de interferidor ou de spoofer, e nada transmite.

# text
seg-912ecb44cee4 = Reprodução em laboratório: condições de teste, executor de campanhas e pontuação ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> reproduz gravações × cadeias de front end × desenhos de laço (<c2/>) e pontua cada célula face a um ficheiro de condições de teste por gravação (<c3/>, TOML ou JSON). Esse ficheiro declara o que um laboratório sabe sobre a gravação: os satélites esperados e, para cada evento, a sua etiqueta de tipo, início e fim, satélites afetados e o perfil declarado de J/S ou de potência do interferidor. São apenas metadados. As pontuações por satélite, para a execução completa e por evento, são:

# text
seg-180447aaf31e = disponibilidade, tempo até à perda de bloqueio e o J/S declarado na perda;

# text
seg-1ababddb0d87 = tempo de reaquisição, a partir do fim do evento e a partir da perda;

# text
seg-a6468323c971 = degradação medida do C/N0 por intervalo de J/S declarado;

# text
seg-4cb6f510e159 = episódios de falso bloqueio por hora bloqueada (o indicador do seguidor, ou o Doppler face a um ficheiro auxiliar de verdade);

# text
seg-97c6243bac2e = jitter do discriminador PLL e DLL.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = Junto a cada curva de degradação medida, é desenhada uma referência analítica de separação espetral (<c1/> com o <c2/> do tipo) e rotulada MODELLED onde quer que apareça.

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
seg-eb5c38197dab = As células correm em paralelo através da máquina de estados de bloqueio da sessão de seguimento, e cada uma é escrita atomicamente sob uma chave de hash de conteúdo. A chave abrange o SHA-256 da gravação, os hashes da condição, do front end, do desenho, da execução e da pontuação, o <c1/> exigido (<c2/> | <c3/>) e a versão do motor. Com <c4/> definido, o fluxo <c5/> e os eventos de bloqueio de cada célula são também mantidos, com o nome da chave da célula e incluídos por hash na célula. <c6/> e <c7/> são públicos, para que um consumidor possa voltar a derivar cada chave e o resumo. Uma nova execução salta, por isso, as células concluídas, e as saídas nunca dependem do número de trabalhadores. A execução escreve <c8/>/<c9/>, um <c10/> autónomo e um <c11/>. Os limiares de sucesso/falha (<c12/>, substituíveis por gravação) são aplicados quando o relatório é construído.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (por predefinição <c2/>, parte do hash de pontuação) escolhe o C/N0 por detrás do C/N0 comunicado e da curva de degradação. Ambas as estimativas são sempre pontuadas e comunicadas (medianas da execução completa e da linha de base, e por intervalo de J/S), e a célula e a folha de pontuação registam o estimador. O NWPR lê baixo cerca de { "8" } dB × Bn·T sob o próprio jitter do laço; o M2M4 não.

# text
seg-baf1a2422a66 = Também novo:

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> reconstrói as folhas de pontuação, o relatório e o resumo a partir das células;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> verifica um ficheiro de condições de teste face ao seu esquema;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> importa como eventos as anotações <c2/> de uma gravação SigMF;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = O Python ganha <c1/>, <c2/> e <c3/>;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> ganha <c2/>, que é incremental e retomável dentro do orçamento de amostras por chamada, com todos os ficheiros confinados ao diretório de trabalho, e <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Testes: <c1/> executa uma campanha sintética de { "3" } gravações × { "2" } front ends × { "2" } desenhos. As suas cenas trazem perfis de C/N0 declarados, e cobre:

# text
seg-3f2fbdecb101 = cada métrica verificada face à verdade injetada;

# text
seg-e103a30260db = retoma após uma execução parcial com um só trabalhador e uma célula corrompida, idêntica byte a byte a uma execução ininterrupta com quatro trabalhadores;

# text
seg-79164d8b0b22 = ficheiros de épocas por célula;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = uma regressão de reaquisição de três satélites durante { "20" } s: com <c1/> ligado, todos os canais voltam em { "2" } s após uma lacuna de { "2" } s; o resultado com <c2/> desligado está fixado;

# text
seg-1deb4ab83054 = limiares reavaliados sem voltar a executar;

# text
seg-351f9cdcbcd6 = a CLI;

# text
seg-2c35af369a36 = verificações de débito e de memória em modo de lançamento, ignoradas por predefinição, incluindo uma gravação de { "4" } GB ({ "5.45" }× o tempo real, memória de pico { "2" } MB acima do RSS inicial; medições numa só máquina, não limiares).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Apenas software: nada transmite, e nenhuma forma de onda de interferência ou de spoofing é sintetizada. Notas de projeto e de construção: <c1/>.

# text
seg-c9871226c82f = Motor de seguimento para reprodução em laboratório ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Ficheiros de desenho de laço</em>: TOML <c1/> (<c2/>; analisador <c3/>). Um ou mais desenhos nomeados definem cada campo do laço:

# text
seg-0437148324ca = tipo de portadora (PLL, FLL ou PLL assistido por FLL), ordens e larguras de banda;

# text
seg-4e722960f8c6 = discriminadores PLL/FLL/DLL e auxílio da portadora;

# text
seg-44976e3ad4e7 = espaçamento e integração;

# text
seg-5c06173036d6 = limiares de bloqueio e janelas de C/N0, e sincronização de bits;

# text
seg-405e693dd757 = a máquina de estados de bloqueio;

# text
# c1: "auto"
seg-e6908584e2f4 = a aquisição de passagem (<c1/> ou explícita).

# text
# c1: extends
seg-8844cc963705 = Os desenhos podem usar <c1/> entre si. As chaves desconhecidas são recusadas. Cada desenho resolvido tem um hash SHA-256 sobre uma forma JSON canónica (chaves ordenadas a todos os níveis, formatação numérica fixa), pelo que o hash não depende da ordem dos campos; todas as saídas o registam. Superfícies:

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, em que as opções explícitas substituem o desenho e ficam registadas;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, que executa todos os desenhos do ficheiro;

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
seg-70d3b295bea0 = <em>C/N0 M2M4</em> (<c1/>, a coluna <c2/> da época de seguimento depois de <c3/>; dicionários de época em Python). A estimativa de segundo e quarto momentos sobre as mesmas janelas que o NWPR, apenas a partir da potência imediata: o NWPR lê baixo sob o próprio jitter da portadora do laço (cerca de { "8" } dB × Bn_PLL·T) e o M2M4 não. Em GPS L2C CM ({ "20" } ms, nominal { "40" } dB-Hz, PLL de { "1" } a { "10" } Hz) lê { "39.93" } dB-Hz em todas as larguras de banda, enquanto o NWPR desce de { "39.55" } para { "38.22" }; em L1 C/A a { "45" } dB-Hz lê { "45.34" }. O NWPR e todas as outras saídas não mudam (uma fixação bit a bit). O registo binário continua com { "184" } bytes (o valor ocupa o float reservado e o bit de indicador { "6" }).

# text
seg-c02d07475717 = Derivações extra de correlador (multicorrelador / SQM).

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
seg-70fcdc903413 = <c1/> (desvios em chips a partir do imediato, positivos adiantados; no máximo { "16" }, cada um dentro de ±{ "2" }) correlaciona réplicas extra a par de E/P/L e devolve-as como <c2/> (<c3/> pela ordem do desenho). Os laços nunca as usam. A chave é omitida do JSON canónico quando vazia, pelo que o hash do desenho por predefinição e todas as saídas sem derivações não mudam (<c4/> mantém-se; o CSV/JSONL/binário sem derivações é idêntico bit a bit). Com derivações: colunas CSV/JSONL e um registo binário de <c5/> bytes cujo cabeçalho transporta <c6/>, para que um leitor antigo recuse o ficheiro em vez de o interpretar mal. <c7/> (CLI), <c8/> (Python) e <c9/> (MCP <c10/>). Os desenhos de uma execução têm de concordar quanto às derivações.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Canais paralelos</em> (<c1/> / <c2/>; Rust <c3/>). Os canais de cada bloco correm em até N threads (<c4/>; <c5/> continua em série). A correlação e a máquina de estados de bloqueio de um canal só tocam nesse canal; as suas épocas e eventos são colocados em memória intermédia e escritos nos destinos pela ordem dos canais, pelo que a saída (CSV, JSONL, binário, eventos, resumo) é idêntica byte a byte à execução em série para qualquer N. O valor por predefinição continua a ser { "1" } thread. Medido numa gravação de 12 canais, { "4" } s, { "4.092" } MHz em { "4" } núcleos: { "19.5" } s em série, { "11.5" } s com { "2" } threads, { "6.3" } s com { "4" } ({ "3.1" }×; a aquisição inicial é em série).

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
seg-cf59911d458f = <em>Exportação da superfície de aquisição</em> (<c1/>; <c2/>, <c3/>). <c4/> (um PRN; CSV, JSON ou binário), <c5/> em Python e <c6/> <c7/> em MCP escrevem toda a superfície de potência de correlação Doppler × fase do código que a pesquisa calcula (as suas células são as de <c8/>, bit a bit) com o pico e dois refinamentos de Doppler fino: uma estimativa parabólica e uma pesquisa fina de 1/16 de intervalo (≈{ "5" } Hz a { "4" } ms coerentes, face a intervalos de { "167" } Hz). O próprio <c9/> e todos os valores por predefinição não mudam.

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Saída de épocas em fluxo</em> (<c1/>; <c2/>). Cada atualização do laço traz:

# text
seg-ff549f07ce78 = os correladores adiantado/imediato/atrasado;

# text
seg-00457c1bb059 = as três saídas dos discriminadores;

# text
seg-b17d335f6cac = os estados dos NCO de PLL/FLL/DLL e a fase da portadora;

# text
seg-a3bf3f1034cd = o PLI e os indicadores de bloqueio;

# text
seg-7912a72da79b = ambas as estimativas de C/N0 e os bits;

# text
seg-8d105d656041 = o estado de bloqueio.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = É escrita à medida que acontece, como CSV, JSON Lines ou uma forma binária com versão, com leitores em Rust (<c1/>) e em Python (<c2/>).

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
seg-aa081bfd9878 = <c1/> ganha <c2/>, <c3/> e <c4/> (<c5/>), e <c6/> ganha <c7/> e <c8/>. O MCP <c9/> ganha <c10/>/<c11/> e constrói a sua resposta a partir do resumo de memória limitada.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = A memória dinâmica de uma execução já não cresce com o comprimento da gravação: <c1/> mede-a com um alocador contador ({ "6" }× o comprimento, o mesmo pico com uma diferença de { "64" } KiB), com um controlo que mostra que o caminho em memória cresce.

# text
seg-e3eff59db445 = A saída em fluxo é idêntica bit a bit à reprodução em memória.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Máquina de estados de bloqueio</em> (<c1/>, <c2/>): captura → bloqueado → perdido → reaquisição → captura, ou retirado quando uma perda ultrapassa <c3/> (por predefinição { "30" } s). As pesquisas falhadas são repetidas a cada <c4/> ({ "0.1" } s), a intervalos regulares, pelo que o calendário de repetições acrescenta no máximo { "0.1" } s a um tempo de reaquisição medido. Um recuo opcional (<c5/> acima de <c6/>) está desativado por predefinição, e <c7/> é um limite opcional ({ "0" }, nenhum, por predefinição). Uma interrupção de { "2" } s em três PRN a { "4.092" } MS/s termina agora com todos os canais reaquiridos e bloqueados. Com um orçamento de 3 tentativas, todos os canais foram retirados a menos de { "0.2" } s da perda.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Os limiares (<c1/>, <c2/>, a janela Doppler de reaquisição) provêm do desenho. Cada transição é um evento com o seu motivo.

# text
seg-b1c551e48389 = A verificação de falso bloqueio compara o Doppler seguido com o seu alias de ±1/(2T) do FLL/PLL. Apanha o falso bloqueio que o PR #38 mediu (−{ "2400" } Hz seguido a { "500" } Hz de distância). Com a reaquisição ativada, o canal termina bloqueado no Doppler injetado.

# text
seg-39409dd0b4bc = Uma lacuna de sinal de { "0.8" } s é declarada como perdida e reaquirida a menos de { "0.3" } s do regresso do sinal.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (e a coluna da tabela) é o estado depois da última transição, pelo que um canal retirado depois da sua última atualização do laço indica <c2/>.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>Assistência do FLL apenas durante a captura</b> (<c1/>, a predefinição; <c2/> mantém o comportamento anterior bit a bit). O FLL passa o controlo ao PLL quando o PLI suavizado se mantém igual ou acima de <c3/> ({ "0.8" }) durante <c4/> ({ "0.1" } s), e regressa quando desce abaixo de <c5/> ({ "0.6" }). Se ficasse ligado, o caminho do FLL de { "10" } Hz quebrava o bloqueio de fase abaixo de cerca de { "38" } dB-Hz em sinais limpos: a { "35" } dB-Hz a fração de bloqueio de fase era de { "10" }–{ "16" } %, com um erro de fase verdadeiro de { "38" }–{ "41" }°. Com a barreira, a predefinição mantém { "100" } % a { "35" } dB-Hz com { "4.5" }°, o mesmo que um PLL sozinho. A captura a partir de um erro de passagem de { "100" } Hz não muda. Evidência com limiares fixados antecipadamente: <c6/>. <b>Os laços por predefinição deixam, por isso, de ser idênticos bit a bit às execuções anteriores do desenho por predefinição.</b> Use <c7/> para as reproduzir. Limite conhecido: a { "35" } dB-Hz a passagem de controlo ocorre { "1.9" }–{ "2.6" } s depois do início do seguimento, e a { "33" } dB-Hz o FLL de { "10" } Hz mantém o PLI abaixo do limiar de passagem de controlo, pelo que a captura nunca termina.

# text
seg-1a911b958f8e = Novas chaves de desenho de laço e API, listadas:

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, com <c5/> alterado de um valor por predefinição de { "3" } para um limite opcional (por predefinição { "0" });

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
seg-eecacf54975b = O hash do desenho incide sobre uma forma JSON canónica, e o hash do desenho incorporado por predefinição é <c1/> (fixado por um teste).

# text
seg-2405be1bc0c6 = Notas de compatibilidade das saídas:

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = a tabela de <c1/> tem uma coluna <c2/> no fim;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = o CSV de <c1/> tem uma coluna <c2/> no fim, e o seu JSON tem <c3/> e <c4/>;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = o <c1/> da varredura é agora a média de todas as atualizações que têm uma estimativa NWPR (resumo de memória limitada), e já não da segunda metade da execução.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = A reaquisição está <b>desativada no desenho incorporado por predefinição</b>, onde a máquina de estados apenas observa e os laços correm bit a bit como correm sem ela. (Os próprios laços por predefinição mudaram, no entanto: ver a assistência do FLL acima.) Ative-a por desenho (<c1/>), com <c2/> ou com <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = Um <b>aviso <c1/></b>: quando fs está a menos de { "1e-6" } de um múltiplo de metade da taxa de chip (<c2/>), <c3/>/<c4/> (saída, <c5/>, JSON de varredura), a resposta de <c6/> do MCP e o resultado de <c7/> em Python avisam que o jitter e o enviesamento do laço de código não são representativos. A causa de fundo está documentada com limiares fixados antecipadamente em <c8/>. Com exatamente { "2" } amostras por chip e espaçamento de 0.5 chip, a curva S do DLL é um único degrau e o laço oscila: ≈ { "0.09" } chip de erro de código RMS (≈ { "26" } m) a { "45" } dB-Hz, face a ≈ { "0.004" } chip a uma taxa incomensurável. O C/N0 NWPR cerca de { "2" } dB baixo a essa taxa tem a mesma causa. Com exatamente { "0" } Hz de Doppler de código e { "4" } amostras por chip, o código nunca atravessa a zona morta de ±0.21 chip, pelo que um enviesamento de fase de código de até cerca de { "0.2" } chip pode persistir sem aparecer no jitter (medido: um espaçamento de 0.5 chip dá { "2.0" }× o erro de código do controlo, com uma média de +{ "0.011" } chip; um espaçamento de 0.25 chip dá +{ "0.125" } chip); o aviso cobre a taxa.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Limite conhecido: o desenho por predefinição não passa o controlo de FLL para PLL abaixo de cerca de { "35" } dB-Hz</b> (um piso de captura de ~{ "35" } dB-Hz; ver a assistência do FLL acima e <c1/>).

# text
seg-43f02bc861be = Uma pesquisa de falso bloqueio ou de reaquisição que não pode correr (uma taxa sem um número inteiro de amostras por período de código) já não interrompe o seguimento.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Testes: <c1/>, <c2/>, <c3/>, <c4/> e o ciclo completo de IQ do MCP.

# text
seg-60141bb08f64 = Perfis de C/N0 em cenas sintéticas ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> programa um C/N0 variável no tempo por satélite nas próprias cenas do Kshana, como desvios em dB relativos ao C/N0 da cena. Formas: degrau, rampa, linear por troços e desvanecimentos de Rice tipo cintilação, com sementes, com um S4 declarado e um tempo de decorrelação. São aplicadas através do gancho de canal da cena já existente (<c2/>, compondo com os efeitos de ionosfera, troposfera, cintilação e multipercurso), sem alteração ao núcleo da cena. O <c3/> do ficheiro auxiliar de verdade acompanha o perfil.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Superfícies: <c1/> e <c2/>.

# text
seg-a242e4d9f071 = Para que serve: os laços, os monitores e a pontuação de campanhas podem ser testados sob esforço face a uma verdade conhecida. Altera apenas a intensidade dos sinais legítimos.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Verificações (<c1/>). Limiares: intensidade média do desvanecimento a menos de { "5" } % de { "1" }, S4 a menos de { "8" } % do alvo (com S4 = { "0.3" }, { "0.7" } e { "1" }), correlação de intensidade acima de { "0.9" } a { "0.05" } τ e abaixo de { "0.05" } a { "5" } τ; verdade exatamente o C/N0 declarado mais o perfil; uma queda do C/N0 NWPR seguido a menos de { "0.7" } dB de um degrau de { "6" } dB. Medido: S4 a menos de { "1.3" } % do alvo, e uma queda seguida de { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>Monitores de deteção no caminho IQ ({ "0.34.0" } "Reprodução em laboratório").</b> Novo módulo <c1/>, comando <c2/> e ligação <c3/>. Observam uma gravação e comunicam séries temporais e eventos assinalados (instantes de início, de alarme e de fim, pico, limiar). Apenas detetam e medem; nada aqui gera um sinal.

# text
seg-5b05b2a54fab = <b>Potência total / AGC</b>: potência por bloco e o ganho que um AGC ideal aplicaria; assinala subidas e quedas.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Espetro pré-correlação</b>: PSD de Welch por bloco face a uma linha de base aprendida. O limiar de excesso provém de um alvo de falso alarme. Também curtose complexa e um detetor de impulsos. O detetor de impulsos conta as amostras acima de um limiar em cada bloco e levanta um evento quando a cauda superior binomial exata dessa contagem é inferior a <c1/> (por predefinição { "1e-4" } por bloco), e não quando uma pontuação z ultrapassa um limite: com as pequenas contagens esperadas de blocos curtos, uma única amostra já são vários sigmas.

# text
seg-7704ac807c38 = <b>C/N0 por canal</b>: dois detetores de mudança CUSUM unilaterais (queda e subida), alimentados com estimativas independentes (o passo é definido a partir da janela de C/N0 do laço).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM a partir dos correladores</b>: delta <c1/> e razão <c2/>, mais testes de assimetria a partir de correladores extra quando um canal os fornece.

# text
seg-a4006c2e8692 = <b>Série de indicadores de bloqueio</b>: PLI e um indicador de bloqueio de frequência a partir de imediatos sucessivos, como sinais em bruto. As decisões de bloqueio e de perda de bloqueio ficam com a máquina de estados de bloqueio do motor de seguimento.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Uma única passagem em fluxo (<c1/>) executa tudo, com um ficheiro de definições TOML/JSON (<c2/>); o executor de campanhas usa o mesmo ponto de entrada. Tudo MODELLED. Cada estatística é verificada face à sua forma fechada por simulação com sementes (<c3/>):

# text
seg-0ff96e4c5a20 = excedências da potência de bloco face à cauda Gama;

# text
# c1: 2/√N
seg-97b559ea0897 = média da curtose { "2" } e dispersão <c1/>;

# text
# c1: e^{−t}
seg-2b941c702b7f = fração de impulsos <c1/>;

# text
seg-e8f068c41f0c = comprimentos de corrida do CUSUM face à aproximação de Siegmund (medidos { "330" } e { "8.46" } amostras face a { "338" } e { "8.34" });

# text
seg-e2cd6a55e49b = o indicador de bloqueio de fase face à média de fase de Rice;

# text
seg-06291b1c6274 = num sinal C/A seguido, as dispersões do delta e da razão do SQM ficam a cerca de { "6" } % das formas fechadas de primeira ordem (medido { "5.97" } %; limiar do teste { "12" } %).

# text
seg-12deb36a2e3a = A fórmula de falso alarme do excesso espetral é uma aproximação; a taxa medida foi { "1.3" }× a fórmula. De ponta a ponta, os monitores assinalam:

# text
seg-b002c66c7881 = um degrau de C/N0 de { "6" } dB (instante da mudança dentro de uma estimativa);

# text
seg-2e828d106393 = um caminho refletido que surge a meio da gravação (teste da razão);

# text
seg-68063f036e2c = uma interrupção de sinal (o PLI cai de { "0.999" } para −{ "0.3" } e o FLI de { "0.93" } para { "0.03" } durante ela);

# text
seg-0cd95f0197ec = um tom de banda estreita e amostras esparsas de grande amplitude (testes espetral, de impulsos e de curtose). São dados de entrada genéricos de teste de DSP, não modelos de interferência.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> fazem o fluxo através da nova sessão (ver Acrescentado).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> mantém as suas colunas de { "0.32" } mas passa a ser feito em fluxo, pelo que as linhas de vários canais se intercalam por ordem temporal em vez de agrupadas por canal. <c2/> mantém a sua forma de { "0.32" } e continua a guardar todas as épocas em memória: use <c3/> para gravações longas.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> mede o jitter sobre as atualizações da segunda metade da duração da execução (antes, a segunda metade do número de atualizações), e o seu CSV/JSON ganha uma coluna <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = A tabela de seguimento ganha uma coluna <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = O texto de utilização já não afirma que <c1/> aceita as opções do front end; só <c2/> as aplica.

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
seg-cf28fa21786a = Em Python, <c2/> e <c3/> de <c1/> passam a ter por predefinição <c4/> (os valores do desenho, { "1" } e { "5000" } Hz no desenho incorporado). As suas épocas ganham os correladores adiantado/atrasado, <c5/>, <c6/>, <c7/> e <c8/>, e o resultado ganha <c9/> e <c10/>.

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
seg-666b9e3faa5d = <b>O passo de aquisição por predefinição já não entrega ao seguimento do Galileo E1 um resíduo que o FLL não consegue captar.</b> O passo <c1/> deixa até <c2/> de erro Doppler na passagem de controlo, mas o FLL de dois quadrantes por predefinição só capta <c3/>. Para todos os códigos de { "4" } ms ou mais (<c4/>), incluindo o Galileo E1-B e E1-C, o resíduo ({ "83.3" } Hz a { "4" } ms) ficava fora da captura de { "62.5" } Hz e o seguimento tinha falso bloqueio a +{ "125" } Hz, com um indicador de bloqueio de fase de { "0.97" } que o escondia. O passo por predefinição fica agora também limitado a <c5/> (<c6/>), { "0.8" } da captura, pelo que a passagem de controlo se mantém dentro dela mesmo quando o intervalo vizinho vence. ({ "0.4" } foi tentado primeiro: teve falso bloqueio em { "1" } execução em { "42" } no E1-B, e uma pesquisa coerente de { "1" } ms de GPS L1 C/A escolheu um intervalo a { "350" } Hz e bloqueou a +{ "500" } Hz; { "0.25" } e { "0.2" } não tiveram nenhum nas mesmas execuções.) Custo: o Galileo E1-B/E1-C passa de intervalos de { "166.7" } Hz para { "50" } Hz, { "201" } intervalos em ±{ "5" } kHz em vez de { "61" }; os códigos de { "1" } ms ({ "166.7" } Hz, <c7/>) não mudam. <c8/> num desenho de laço significa isto; um <c9/> ou <c10/> explícito é usado como escrito, e <c11/> (sem passagem de controlo para o seguimento) mantém o passo de manual. O cabeçalho da época e <c12/> registam agora o passo resolvido e as larguras de banda do laço de cada canal (<c13/>). O hash do desenho por predefinição não muda. Alteração de saída: as deteções em códigos de { "4" } ms e mais longos podem cair noutros intervalos de Doppler.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>O GPS L2C CM (atualização do laço de { "20" } ms) mantém o bloqueio com o desenho por predefinição.</b> O PLL de { "15" } Hz e o FLL de { "10" } Hz por predefinição têm <c1/> de { "0.3" } e { "0.2" } com T = { "20" } ms, e o laço perdia o bloqueio mesmo a partir de um arranque perfeito (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). A nova chave de desenho <c2/> (por predefinição { "0.1" }) limita as larguras de banda de ruído do PLL e do FLL a <c3/> quando o tempo de atualização do laço é superior a { "4" } ms (<c4/>): { "5" } Hz e { "5" } Hz a { "20" } ms, { "10" } Hz e { "10" } Hz aos { "10" } ms do BeiDou B1C; os códigos de { "1" } ms e { "4" } ms mantêm { "15" } e { "10" } Hz. Aplica-se também a larguras de banda explícitas; <c5/> desativa-a. A chave é omitida da forma canónica no seu valor por predefinição, pelo que o hash por predefinição não muda; um desenho que defina qualquer outro valor tem um hash diferente. A { "45" } dB-Hz, o L2C CM dá agora PLI { "0.996" }, erro Doppler de { "0.00" } Hz e M2M4 { "42.71" } dB-Hz. Ponto em aberto conhecido: o C/N0 NWPR lê { "1.76" } dB abaixo aí (e { "2.45" } dB abaixo no B1C a { "10" } ms), pelo que o T5 da matriz para o L2C continua a ser uma constatação ignorada.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> regenerado: a figura submetida estava desatualizada face ao seu próprio cenário (uma alteração de dados, não um redesenho).</b> O gráfico foi desenhado em 2026-06-02 a partir de <c2/>; dois dias depois, 67fed19e definiu os pisos de FM de cintilação nesse cenário (quântico <c3/>, CSAC <c4/>) e a figura nunca foi redesenhada. Mostrava a execução anterior aos pisos: eixo y de { "0" } a { "47" } ns, p95 de interrupção por execução do CSAC de { "10.5" } a { "47.6" } ns (média { "25.2" } ns), holdover clássico de { "4050" } s em média. O cenário tal como é fornecido (e como o tutorial e o resumo da CLI já indicam) dá um eixo y de { "0" } a { "407" } ns, p95 por execução do CSAC de { "40.8" } a { "374.0" } ns (média { "167.0" } ns), holdover clássico de { "844" } s [{ "220" } a { "2130" } s]; a linha de especificação de { "20" } ns fica nos mesmos { "20" } ns num eixo cerca de nove vezes mais alto. O motor não mudou: o motor atual sobre o ficheiro de cenário de junho reproduz exatamente o eixo da figura antiga. A figura não é referenciada a partir do README nem da documentação.

# text
seg-75636f9419b2 = Limitações conhecidas

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>O C/N0 NWPR lê baixo com C/N0·T por imediato elevado, e o BOC({ "1,1" }) a { "5" } MS/s perde cerca de { "1" } dB.</b> O NWPR não tem enviesamento em imediatos ideais, mas o próprio jitter do PLL do laço custa cerca de { "8" } dB × Bn·T ajustados (uma cena, quatro pontos: −0.24/−0.44/−0.77/−{ "1.58" } dB a 1/2.5/5/10 Hz e { "20" } ms; cerca de −{ "1" } dB com o <c1/> por predefinição); o M2M4 é insensível. Os dados do BeiDou B1C a { "5" } MS/s perdem também cerca de { "1" } dB de potência do imediato por limitação de banda (use { "10" } MS/s ou mais). Nenhum dos casos é um defeito do estimador; as linhas T5 da matriz de sinais para o GPS L2C e o BeiDou B1C continuam a ser constatações ignoradas, com estas causas.

# text
seg-ff195e575023 = <b>Texto de gráficos e adoção de gráficos pelo Studio reforçados.</b> O texto que um cenário leva para um gráfico gerado é agora escapado de forma consistente por uma rotina partilhada, e o Studio adota apenas marcação de desenho de um gráfico. Os parâmetros de endereço do Studio, as pesquisas indexadas por tipo e as obtenções de cenários ficam restritos a valores conhecidos. Os gráficos incluídos, os resultados gravados e os números publicados não mudam. Recomenda-se a atualização a quem abre ficheiros de cenário de origens não fiáveis no Studio ou incorpora gráficos gerados em páginas web. Aviso consultivo: <a1>GHSA-h25h-cg9f-v2cg</a1>.

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
seg-7f566858d036 = <b>O âmbito de interferência e de spoofing da camada IQ, indicado com rigor.</b> As entradas de { "0.31.0" } e { "0.32.0" } abaixo dizem que a camada IQ acrescenta "sem síntese de formas de onda de interferência ou de spoofing". Isso é verdade para a própria camada IQ (<c1/> gera apenas sinais GNSS legítimos), mas lia-se como uma afirmação sobre todo o motor, e não é uma: desde { "0.29.0" } a secção <c3/> do tipo <c2/> escreve um instantâneo SigMF do seu modelo analítico com os interferidores configurados (interferidores de tipo ruído intervalo a intervalo, tons e chirps como formas de onda), e <c4/> soma em memória uma réplica de sinal autêntico e uma de spoofer para testar a captura do laço (o compósito nunca é escrito). O motor também tem um recetor GNSS por software desde { "0.20.0" } (<c5/>: aquisição e seguimento; desde { "0.31.0" } também <c6/> e <c7/>). Nada no Kshana transmite nem comanda hardware de rádio. A linha de estado do README, <c8/>, <c9/> e as notas de projeto do IQ di-lo agora; as entradas já publicadas ficam como foram publicadas. Nenhum comportamento muda.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Limitação conhecida: amostragem comensurável.</b> A uma taxa de amostragem que é um múltiplo inteiro ou semi-inteiro da taxa de chip, as amostras ficam nas mesmas fases de chip em todos os chips, e o discriminador de código passa a ser uma escada. Num sinal sintético GPS L1 C/A a { "45" } dB-Hz com espaçamento de 0.5 chip, { "2.046" } MHz ({ "2" } amostras/chip) dá ≈ { "0.09" } chip (≈ { "26" } m) de erro de código RMS e um enviesamento de −{ "0.09" } chip, face a ≈ { "0.003" } chip a uma taxa incomensurável. O C/N0 NWPR lê ≈ { "2.4" } dB abaixo aí. A { "4.092" } MHz depende do espaçamento e do Doppler de código. Com { "0.5" } chip é inofensivo a { "1500" } Hz de Doppler mas { "2" }× com um enviesamento de { "0.011" } chip a { "0" } Hz, e com { "0.25" } ou { "0.1" } chip é { "8" }–{ "10" }× o erro de código. O seguimento da portadora não é afetado. <c1/> tem as medições.

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
seg-ef81eca03bca = <c1/> ganha seis ferramentas que comandam a camada <c2/> a partir de um agente: <c3/> (os nomes de sinais aceites e a configuração IQ), <c4/> (descrever uma gravação), <c5/> (gerar uma cena de perfil declarado ou de efemérides difundidas, com o canal opcional ao nível do sinal), <c6/> (aquisição por FFT, opcionalmente atrás de estágios de front end), <c7/> (adquirir e depois o banco DLL/PLL/FLL) e <c8/> (passa-banda, rejeita-banda, supressão, excisão, AGC, quantificador). As amostras IQ nunca atravessam o protocolo: cada ferramenta recebe caminhos de ficheiros dentro de um diretório de trabalho definido por <c9/> (se não estiver definido, as ferramentas de ficheiros IQ ficam desativadas e todas as outras ferramentas não são afetadas), recusa caminhos que resolvam para fora dele e saídas que já existam, a menos que <c10/> esteja definido, impõe um orçamento de amostras por chamada (<c11/>, por predefinição { "50 000 000" }) antes de qualquer trabalho, recusa argumentos desconhecidos e responde com um resumo JSON compacto (deteções, C/N0, estado de bloqueio e cada ficheiro escrito com o seu número de bytes). A saída por época vai apenas para ficheiros que o chamador nomeia. As ferramentas executam o mesmo caminho de código que a CLI através de uma nova interface pública, <c12/>, que devolve a mensagem da CLI em vez de a imprimir (o stdout é o canal JSON-RPC do MCP); <c13/> e <c14/> passam também a ser públicos. Apenas software e aditivo: a camada IQ não acrescenta síntese de interferência nem de spoofer, nada é alguma vez transmitido, e não há novas dependências. <c15/> declara as duas variáveis de ambiente. Os testes de ciclo completo em <c16/> geram uma cena curta de dois satélites e verificam a aquisição face ao próprio ficheiro auxiliar de verdade da cena, o bloqueio do seguimento e o C/N0, o front end, a saída SigMF, o orçamento, o confinamento de caminhos e o estado desativado.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>A camada IQ de GNSS no registo de validação.</b> Uma verificação cruzada fixada antecipadamente com o gps-sdr-sim (um gerador independente de banda de base GPS L1 C/A, MIT, commit 28ca29a6) passa a fazer parte do conjunto de testes sempre ativo (<c1/>). A sua saída de referência submetida (<c2/>: { "20" } ms de I/Q de 8 bits do próprio gps-sdr-sim, a sua listagem de canais e o estado do canal por detrás dela, a partir de um arnês ligado à mesma compilação) é regenerada por <c3/>. Nada, no momento do teste, precisa de rede nem da ferramenta externa. São acrescentadas duas linhas ao registo ({ "251" } linhas: { "124" } validadas, { "123" } modeladas, { "4" } de parceiro):

# text
seg-21d005e2ef0e = <em>Geometria do sinal de cenas IQ de GNSS face a um gerador independente de banda de base</em>: <b>Validado</b>. A verdade da cena (conjunto visível, pseudodistância, fase do código, Doppler, ângulos de observação) para uma cena de efemérides difundidas coincide com o estado de canal do gps-sdr-sim nos { "11" } canais: pior caso { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } graus, face a limiares de { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz e { "1e-4" } graus fixados antes da execução.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>Aquisição IQ de GNSS sobre amostras I/Q geradas de forma independente</em>: <b>Modelado, com uma constatação</b>. <c1/> encontra todos os satélites simulados nas amostras do gps-sdr-sim dentro dos limiares registados (fase do código a menos de { "0.195" } chip, Doppler a menos de { "72" } Hz). O limiar registado "nenhum outro PRN detetado" falha, porém: na saída sem ruído do gps-sdr-sim, o limiar de ruído gaussiano é ultrapassado pela correlação cruzada dos outros satélites para todos os { "21" } PRN ausentes. O teste estrito é mantido, ignorado com a constatação, e um teste fixado regista-a. Nenhum código do motor nem API pública muda. As amostras I/Q não são comparadas amostra a amostra: a tabela de senos inteiros, os ganhos, a fase inicial nula da portadora e os campos LNAV truncados do gps-sdr-sim não são grandezas em que um recetor precise de concordar. A comparação é feita nas observáveis que um recetor mede.

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
seg-a2be63287ce4 = <b><c1/> passa o controlo a partir de uma aquisição de ≈{ "4" } ms por predefinição (alteração de comportamento).</b> A aquisição que inicializa cada canal de seguimento integra agora <c2/> períodos de código de forma coerente em vez de um, em que <c3/> é o período completo do código (primário vezes o comprimento secundário num código em camadas, a unidade sobre a qual a aquisição integra). Os códigos de { "1" } ms sem camadas (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) pesquisam agora { "4" } períodos ({ "4" } ms), pelo que o passo Doppler por predefinição <c4/> é de ~{ "167" } Hz em vez de ~{ "667" } Hz. Todos os códigos cujo período completo já é de { "4" } ms ou mais mantêm { "1" } período: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), e os códigos em camadas GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q e E1-C ({ "10" } a { "100" } ms com os seus códigos de sobreposição), e o GPS L2C. Todos os sinais integram, por isso, pelo menos ~{ "4" } ms. Uma pesquisa de um só período podia passar um canal a até ~{ "333" } Hz de distância, fora da captura do FLL, e este seguia então um falso bloqueio a ~{ "500" } Hz de distância enquanto comunicava um seguimento limpo. Numa varredura com sementes de { "180" } canais GPS L1 C/A (Doppler em ±{ "5" } kHz, { "38" } a { "47" } dB-Hz, metade com dados de navegação; <c5/>, reexecutável) os falsos bloqueios descem de { "27" } em { "180" } para { "1" } em { "180" } e as aquisições falhadas de { "102" } para { "11" }, por ~{ "40" } ms mais de pesquisa por PRN em GPS L1 ({ "11" } → { "52" } ms). O único falso bloqueio residual está a { "38" } dB-Hz, a { "36" } Hz de distância. Todas as superfícies concordam: <c6/> e <c7/> (<c8/>), <c9/> em Python (<c10/> é agora automático; ficheiro de stub atualizado) e a ferramenta <c11/> do MCP. Os utilizadores que dependiam do comportamento antigo por predefinição podem passar <c12/> (<c13/>). O próprio valor por predefinição de <c15/> de <c14/> continua a ser { "1" }. Novos <c16/> e <c17/> públicos; teste de regressão <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Todos os gráficos gerados seguem agora o tema Observatory do sítio: os bytes de todos os gráficos mudam.</b> Esta é uma revisão deliberada das figuras publicadas, apenas de cores e tipos de letra; nenhum valor representado, coordenada ou etiqueta mudou. O <c1/> de cada cenário (e, por isso, as exportações de gráficos do Studio e os gráficos de demonstração do README), o HTML do relatório de execução (<c2/>), a animação da linha temporal (<c3/>), as páginas HTML de resultados de cenários e de estudos, o resumo de validação e as figuras e diagramas da documentação usavam a paleta escura quente de julho (fundo <c4/>, dourado <c5/>) e um tema de relatório em papel quente. Passam agora a retirar todas as cores e tipos de letra de um único módulo, <c6/>, que espelha <c7/>: os gráficos são desenhados em escuro de instrumento sobre o fundo Observatory (<c8/>) na pilha tipográfica Geist; o relatório, o leitor de animação e as páginas de resultados seguem a preferência de claro/escuro do espectador com os tokens claros e escuros do Observatory. Os seis domínios de falha mantêm uma cor cada (interferência coral, spoofing magenta, temporização azul, órbitas ciano, integridade lima, navegação âmbar), e os níveis de evidência leem-se validado lima, modelado âmbar, parceiro magenta. As rampas de cascata mantêm a sua ordenação percetual (inferno), reancoradas no novo fundo.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> prende o módulo a <c2/> nos dois temas, verifica que <c3/> e <c4/> (ambos gerados a partir do módulo, para as ferramentas de figuras em Python e para o mermaid-cli) estão atualizados, e falha se um literal de cor hexadecimal aparecer em <c5/> fora da paleta.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> ganha um terceiro diagnóstico, "só se moveram cores e tipos de letra", para que uma revisão da paleta se distinga de um valor representado que se moveu. Cada gráfico do README reconstruído foi verificado como igual ao seu antecessor sob esse normalizador.

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
seg-3bc4056fd57e = <c1/> lê a paleta e passa também a gerar as três figuras de resultados do README que não tinham gerador submetido (<c2/>, <c3/>, <c4/>), com elementos de texto reais, a partir de <c5/>, do resultado de <c6/> e de <c7/>. <c8/> lê a mesma paleta, o que corrige o seu desvio do tema claro face ao sítio. Os valores de <c9/> são a coluna de pior caso <c10/> desse ficheiro de teste ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } e { "4.12e-6" } km), inalterados face à figura do Matplotlib, e <c11/> falha agora se a figura submetida e o ficheiro de teste discordarem.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> atualizado para os dados atuais (uma alteração de dados, não um redesenho).</b> A figura indicava { "28" } capacidades em { "8" } domínios ({ "11" } validadas, { "17" } modeladas), desatualizada face à sua própria fonte declarada; desenhada agora pelo seu novo gerador a partir de <c2/>, indica { "46" } capacidades em { "8" } domínios ({ "17" } validadas, { "29" } modeladas).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>O Q do interferidor CW/de banda estreita é agora { "1.0" }, e não { "1.5" }.</b> O valor de manual para um tom sobre a portadora é { "1" } (um tom mantém o pico espetral do sinal, <c1/>, <c2/>); o antigo { "1.5" } fazia um tom menos danoso do que ruído de banda larga com o mesmo J/S. Alteração de saída: cerca de −{ "1.8" } dB de C/N0 efetivo sob interferidores CW/de banda estreita com J/S elevado nos tipos <c3/>, <c4/> e de interoperabilidade (o tom do exemplo <c5/> incluído: { "17.98" } dB-Hz da tabela, era { "19.74" }). O Q de banda larga mantém-se em { "1.0" } (conservador, cerca de { "3" } dB abaixo do ~{ "2" } de manual) até à revisão de { "0.34" }. Defina <c6/> para manter o antigo { "1.5" }.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b>A saída inteira de <c1/> usa o intervalo inteiro.</b> Com ruído de potência unitária e uma escala de escrita de { "1" }, as cenas <c2/>/<c3/> saíam como cerca de { "{" }-1, { "0" }, { "1" }{ "}" } e as cenas de 2 bits tinham os seus limiares a { "2.8" } sigma. Os formatos inteiros são agora escalados de modo a que o RMS esperado por componente seja um quarto da escala completa ({ "31.75" } LSB em ci8, { "8191.75" } em ci16) ou { "2" } LSB em 2 bits. A escala e o número de elementos cortados são impressos e escritos no ficheiro auxiliar. A saída em vírgula flutuante não muda.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Oito fixações de ficheiros de teste em sete ficheiros de teste já não falham no macOS por diferenças no último bit</b> (parte da questão #36). As fixações que verificam que o motor ainda constrói os dados de entrada submetidos de uma referência independente (jacobianos, uma tabela de estados, azimutes de lançamento) comparavam bit a bit e falhavam no macOS arm64 em { "2" } a alguns milhares de unidades na última casa. Passam a comparar a menos de { "1e-12" } de uma escala retirada do ficheiro de teste; inteiros, chaves e comprimentos continuam a comparar-se exatamente, e um teste de mutação mostra que uma alteração relativa de { "1e-6" } continua a falhar. A fixação do azimute de lançamento compara <c1/> e o ramo ascendente/descendente em vez do próprio azimute, porque <c2/> amplifica um ulp do seu argumento para cerca de { "3e-9" } rad quando uma inclinação é igual à colatitude de um local. Nenhuma tolerância de referência independente nem limiar fixado antecipadamente mudou. Dois testes (OD conjunta lunar, observabilidade lunar) não estão cobertos: no macOS as suas próprias comparações fixadas antecipadamente movem-se, e isso fica para um seguimento.

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
seg-b6c354fa0c28 = <b><c1/> e <c2/> aplicam as opções do front end.</b> O texto de utilização anunciava <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> em <c9/>, mas <c10/> e <c11/> nunca construíam a cadeia: as opções eram ignoradas em silêncio, e uma sem valor, como <c12/>, engolia a opção seguinte. Ambos os comandos passam a interpretá-las como <c13/> faz e a colocar uma cadeia de front end nova à frente da passagem de aquisição e da passagem de seguimento. A saída é igual à de executar o comando sobre o ficheiro que <c14/> escreve com as mesmas opções.

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
seg-46ace9a3e008 = <c1/> (e <c2/>) colocavam bits de { "50" } bit/s em todos os sinais, incluindo os pilotos, e à taxa LNAV do GPS no Galileo e no BeiDou. Os dados seguem agora a temporização de símbolo própria de cada sinal, indicada pelo novo <c3/> (<c4/>, definido por cada construtor em <c5/>). Isso são { "10" } ms em L5-I5, { "4" } ms em E1-B, { "2" } ms em BeiDou B1I GEO (D2), e bits de { "20" } ms com um meandro de { "10" } ms em GLONASS L1OF. Os dados são recusados em pilotos, em GPS L2C como um único fluxo CM/CL, e <c6/> em qualquer coisa que não seja L1 C/A. Os códigos personalizados mantêm por predefinição a temporização de { "20" } ms anterior. Uma <c7/> programática que pedisse <c8/> num código que não fosse L1 C/A, ou <c9/> num piloto, gerava em silêncio e agora devolve um erro na primeira leitura.

# text
seg-9dd38fa39d14 = Os canais GLONASS L1OF são adquiridos e seguidos na sua própria portadora FDMA.

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
seg-a775751ed6f6 = <c1/> e os canais de seguimento misturavam cada código para baixo apenas a partir de <c2/>. Numa gravação GLONASS de vários canais, uma pesquisa pelo canal +{ "3" } encontrava, por isso, o sinal do canal { "0" } (todos os canais partilham um código de medição de distância) e nunca procurava { "1.6875" } MHz mais acima. Ambos usam agora <c3/>. O termo da portadora é zero em qualquer gravação centrada na portadora do próprio sinal e é omitido quando o centro é desconhecido, pelo que o processamento CDMA não muda. Se contornou o comportamento antigo incorporando <c4/> no <c5/> do ficheiro auxiliar, retire esse termo: o desvio é agora aplicado a partir da portadora e do centro, pelo que mantê-lo aplica-o duas vezes. Limitação conhecida, inalterada aqui: uma cena GLONASS identifica cada satélite pelo seu canal de frequência <c6/>, e o identificador de satélite <c7/> faz o envolvimento de um canal negativo. O ficheiro auxiliar de verdade escreve <c8/> como <c9/> { "4294967289" } (<c10/>). Leia-o de volta como <c11/> com uma conversão <c12/>.

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
seg-1c88bffc605b = <b>Camada IQ de GNSS na CLI e em Python ({ "0.32.0" } Fase A).</b> O módulo <c1/> existente pode agora ser usado sem escrever Rust. Cinco novos comandos <c2/> juntam-se ao grupo de tratamento de dados: <c3/> gera uma longa cena IQ de vários satélites para um ficheiro com um ficheiro auxiliar de verdade; <c4/> executa a aquisição por FFT de um ou mais PRN sobre uma gravação e comunica cada deteção (PRN, Doppler, fase do código, estatística, limiar); <c5/> adquire e depois executa o banco DLL/PLL/FLL sobre uma gravação e emite saída de seguimento por época (CSV/JSON) com larguras de banda de laço, tempo de integração e espaçamento de correladores configuráveis; <c6/> reproduz uma gravação através de vários desenhos de laço e comunica o jitter e as métricas de bloqueio resultantes por desenho; e <c7/> ajusta o modelo de perda de bloqueio do laço de seguimento a uma linha temporal de confiança do recetor. O mesmo núcleo é exposto em Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), devolvendo listas e dicionários compatíveis com NumPy. Apenas software e aditivo: sem novas dependências, sem transmissão, sem síntese de formas de onda de interferência ou de spoofing; o motor, a aquisição, o seguimento e os desenhos de laço são os do próprio crate, pelo que quem chama a CLI ou o Python obtém os mesmos bits que os testes em Rust. Novo módulo <c13/>; o próprio ficheiro auxiliar de verdade da cena é a referência independente em <c14/> (a aquisição recupera cada fase de código e Doppler injetados, o seguimento converge para o Doppler injetado). Nenhuma contagem publicada de tipos de cenário nem linha da matriz de verificação muda.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Capacidades restantes da biblioteca IQ de GNSS na CLI <c1/> e em Python ({ "0.32.0" } Fase A.2).</b> Assenta na Fase A, expondo o resto da camada <c2/> sem escrever Rust:

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
seg-67c485097357 = <b>Canal de propagação em <c1/></b> (e em <c2/> de Python): uma ionosfera de primeira ordem (<c3/>/<c4/> ou <c5/>), a troposfera de Saastamoinen/Niell (<c6/>), o modelo de cintilação de Cornell (<c7/>, <c8/>, <c9/>), multipercurso especular no solo (<c10/>/<c11/>), o canal móvel terrestre de três estados (<c12/>) e um bloco sem linha de vista (<c13/>) aplicam-se a todos os satélites através de uma nova ponte interna ao crate (<c14/>) que converte os caminhos absolutos dos modelos de canal na forma de excesso sobre a geometria da cena.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>Saída SigMF em <c1/></b> (<c2/>): escreve as amostras como um par <c3/>/<c4/> com uma captura e anotações por satélite; <c5/>/<c6/> já leem SigMF, pelo que uma cena faz o ciclo completo.

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
seg-c59ae97779ae = <b>DSP do front end</b>: um novo comando <c1/> e as mesmas opções em <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) executam os estágios de <c10/> (FIR passa-banda, rejeita-banda adaptativo, supressão de impulsos, excisão no domínio da frequência, AGC, quantificador); espelhado em Python como <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Cenas de efemérides difundidas</b>: <c1/> (com <c2/>/<c3/>/<c4/>) coloca cada satélite GPS saudável na sua geometria difundida verdadeira usando o leitor RINEX do motor, pelo que o ficheiro auxiliar de verdade traz a distância, o Doppler e a fase do código reais por satélite; espelhado em Python como <c5/>. Apenas software e aditivo: sem novas dependências, sem transmissão, sem síntese de formas de onda de interferência ou de spoofing (os efeitos de propagação do canal atuam apenas sobre o sinal legítimo). Cada afirmação numérica é testada face a uma referência independente (forma fechada ou verdade injetada) nos testes unitários de canal/front end e em <c6/>.

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
seg-1e71370d87d8 = <b>Camada IQ de GNSS: simulação ao nível do sinal e processamento de recetor por software.</b> Um novo módulo <c1/> leva o Kshana de um front end L1 C/A de um só satélite e blocos curtos a uma camada completa ao nível do sinal, acessível a partir do grupo de comandos <c2/>. Gera cenas IQ em bruto longas e de vários satélites com um ficheiro auxiliar de verdade por época (<c3/>); aplica a propagação ao nível do sinal — ionosfera com divergência código-portadora, troposfera, cintilação de amplitude e de fase (modelo de Cornell), multipercurso de Fresnel e um canal móvel terrestre de três estados, com ausência de linha de vista (<c4/>); adquire e segue com aquisição por FFT e um banco DLL/PLL/FLL multicanal, reproduzindo uma gravação através de muitos desenhos de laço (<c5/>, <c6/>); modela o front end — filtragem FIR/IIR, quantificação de 1 a 14 bits, AGC, rejeita-banda, supressão de impulsos e excisão no domínio da frequência (<c7/>); processa em fluxo grandes conjuntos de dados gravados com memória limitada — formatos int8/int16/float32/2 bits empacotados e FI real, SigMF de vários ficheiros, reamostragem, um inventário de conjuntos de dados com SHA-256 por ficheiro e um executor em lote (<c8/>); acrescenta códigos de espalhamento para GPS L5/L2C, Galileo E1 (CBOC, códigos de memória reais do ICD) e E5a, BeiDou B1C/B1I e GLONASS L1OF, cada um verificado face ao seu documento de controlo de interface (<c9/>); e ajusta o modelo de perda de bloqueio do laço de seguimento ao comportamento observado de um recetor real em execuções de laboratório, com erro de conjunto reservado deixando uma execução de fora e extrapolação rotulada como previsão (<c10/>). Cada afirmação numérica é testada face a uma referência independente (uma tabela do ICD, uma forma fechada, ou um recetor independente a recuperar a verdade injetada); os modelos físicos de canal e de laço continuam MODELLED. Trata-se apenas de uma camada de software: escreve ficheiros IQ para recetores por software e não sintetiza formas de onda de interferência ou de spoofing nem comanda hardware de rádio. Nenhuma contagem publicada de tipos de cenário nem linha da matriz de verificação muda. Projeto: <c11/>.

# text
seg-943e21ccb25f = Confiança no recetor: avaliar um registo real de recetor GNSS.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> lê um registo u-blox UBX, RINEX { "3" } (com um ficheiro de navegação difundido opcional), Android GnssLogger ou NMEA { "0183" } para uma única linha temporal com marcas de tempo e executa sobre ela monitores de confiança: queda da densidade de potência da portadora em relação ao ruído (C/N0), perda de bloqueio, controlo automático de ganho (AGC), o indicador de interferência da u-blox, salto de posição e, com RINEX e navegação, a solução de posição de ponto único do próprio motor com monitorização autónoma da integridade pelo recetor (RAIM) por paridade e o monitor auxiliado pelo relógio. Cada época é nominal, degradada ou não confiável, e o resultado diz quando e porquê. Os eventos e as quedas de C/N0 previstas declarados no cenário são pontuados face a tolerâncias declaradas no mesmo ficheiro: detetado, tardio ou falhado, e concordam ou discordam. As saídas são o JSON de resultados, um CSV por época e um gráfico; o resultado traz o SHA-256 do registo e todos os limiares. Também acessível a partir de Python (<c2/>), do pacote WebAssembly (<c3/>, registos em linha) e da nova ferramenta <c4/> do servidor Model Context Protocol (MCP). Guia: <c5/>; exemplo: <c6/>. Nos registos de spoofing do JammerTest { "2024" }, o caminho do motor reproduz o primeiro alarme da cadeia de referência independente fixada antecipadamente em cada início publicado (<c7/>). Os monitores continuam MODELLED; nenhuma linha da matriz de verificação muda.

# text
seg-55669fe92932 = Uma versão menor. As rondas de validação { "2" } e os pacotes da vaga 1 levam a matriz de verificação de { "223" } linhas ({ "93" } VALIDATED) em { "0.29.3" } para { "249" } linhas ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); cada promoção foi verificada face a uma referência independente com uma tolerância fixada antes da execução, e cada discordância é publicada como constatação. Novidades: um leitor nativo de kernels NAIF e um caminho DE440, um caminho único e validado de propagação e tempo de SGP4 para ITRS, uma biblioteca de relógios medidos, um gerador de referência LunaNet AFS, solucionadores de precisão alargada e de informação em raiz quadrada, e processamento IQ lunar real sobre dados LuGRE. Os números publicados que mudaram estão listados como revisões abaixo.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Vinte e sete linhas da matriz de verificação passam a VALIDATED depois de uma referência independente ter concordado dentro de uma tolerância fixada antes da primeira comparação (a regra de promoção em <c1/>): dez numa primeira ronda de validação e dezassete numa segunda. Cinquenta e uma linhas MODELLED foram submetidas a uma referência independente externa na primeira ronda e as restantes linhas encaminháveis na segunda; cada discordância é registada abaixo como constatação, em vez de ser ajustada até desaparecer. Três linhas foram divididas para que uma parte validada não carregue um resto não validado, o que leva a matriz de { "223" } para { "226" } linhas; os pacotes de validação incorporados desde então levam-na para { "249" }. As contagens são lidas de <c2/> gerado.

# text
seg-8d542741fa77 = após a ronda { "1" }

# text
seg-ae3743f976c5 = Linhas da matriz de verificação

# text
seg-6c4b1fd56a31 = das quais VALIDATED face a uma referência independente externa

# text
seg-90450fe87280 = das quais MODELLED

# text
seg-86972e4c7f12 = das quais PARTNER

# text
seg-61c5c5e308ed = Abreviaturas usadas nesta entrada

# text
seg-5907283b71da = Abreviatura

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (do ARAIM); monitorização autónoma avançada da integridade pelo recetor; a Matlab Algorithm Availability Simulation Tool da Universidade de Stanford

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = desvio de Allan; passeio aleatório de velocidade; passeio aleatório de ângulo

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = um conjunto de ferramentas de astrodinâmica de código aberto (Nyx Space); o conjunto de ferramentas Spacecraft, Planet, Instrument, C-matrix, Events da NASA, do seu Navigation and Ancillary Information Facility; kernel de constantes planetárias

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
seg-0382d12eabc8 = a General Mission Analysis Tool da NASA

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
seg-ef9ba270513c = enviesamento entre sistemas

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = órbita terrestre baixa

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = separação de soluções por múltiplas hipóteses; nível de proteção; nível de proteção de temporização

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = densidade espetral de potência; amostras em fase e em quadratura; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = ruído de projeção quântica

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = monitorização autónoma da integridade pelo recetor

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = sistema de aumento baseado em satélites; o Wide Area Augmentation System dos EUA; dupla frequência e multiconstelação; um satélite SBAS geoestacionário

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
seg-c3bc7d828ecc = Cada linha abaixo nomeia o seu tipo de referência independente (Biblioteca: uma biblioteca independente de terceiros que calcula uma grandeza definida de forma única; Medido: dados reais medidos; P2: uma biblioteca numérica independente que recalcula uma grandeza de álgebra linear sobre entradas submetidas), a referência independente, a tolerância fixada antes da execução e o resultado. Cada promoção foi repetida por um segundo revisor, que regenerou o ficheiro de teste byte a byte e mostrou que uma mutação deliberada do motor faz o teste ficar vermelho.

# text
seg-be0a4e3ac81c = <b>Fusão de sensores GNSS/INS</b> (Biblioteca), limitada ao EKF de estado de erro de 15 estados com acoplamento fraco: NaveGo v1.4 (LGPL-3.0, executado sob GNU Octave) na sua própria condução real com IMU/GNSS Ekinox. O RMS horizontal, vertical e de inovação de posição do Kshana são { "0.912" }, { "0.940" } e { "0.861" } dos do NaveGo (limiar { "1.2" }) e a sua inovação normalizada média é { "0.395" } (limiar { "1.5" }). O GNSS está presente durante toda a condução, pelo que nenhuma interrupção é testada. O filtro de Kalman unscented (UKF) fortemente acoplado e o filtro de relógio acoplado ficam fora da afirmação.

# text
seg-0c82afd5ba30 = <b>Atitude de 3 graus de liberdade e orçamento de erro de apontamento</b> (Biblioteca), limitado ao pico do binário de gradiente gravítico: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } casos, a menos de { "1e-12" } em termos relativos (pior { "2.1e-15" }). O orçamento de apontamento RSS é uma soma de números fornecidos pelo chamador e fica fora dele.

# text
seg-71cf58e91a09 = <b>Geometria conjunta lunar de comunicações e navegação</b> (Biblioteca), limitada à colocação do local, azimute, elevação e distância: ANISE { "0.10.2" }, { "768" } amostras, a menos de { "1e-6" } graus e { "1" } mm (pior { "2.2e-12" } graus e { "5.6e-9" } m). O parâmetro de exatidão de medição de distância é um dado de projeto fora da afirmação.

# text
seg-0687c757231b = <b>Dinâmica de atitude de corpo rígido sem binário</b> (Biblioteca): o cubo de nave Basilisk { "2.9.1" }, { "1e4" } s em duas inércias gerais, quaternião e taxas a menos de { "1e-9" } (pior { "3.3e-11" } e { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>Resolução de ambiguidades inteiras da fase da portadora GNSS (LAMBDA)</b> (Biblioteca), limitada à solução ILS e às suas duas melhores normas: RTKLIB v2.4.2-p13 <c1/>, { "300" } covariâncias, { "0" } discordâncias inteiras, normas a menos de { "1e-9" } em termos relativos (pior { "5.6e-13" }). A taxa de sucesso por bootstrap continua apenas verificada internamente.

# text
seg-c23196cbdc96 = <b>PL de temporização composto, MHSS escalar</b> (P2): numpy { "2.3.5" } e scipy { "1.18.1" } sobre { "300" } entradas submetidas, PL a menos de { "1e-9" } em termos relativos (pior { "1.2e-10" }), subconjunto condutor idêntico.

# text
seg-8f524d815949 = <b>Branqueamento de modo comum por GLS e a identidade de Mahalanobis</b> (P2): LAPACK do numpy { "2.3.5" } sobre { "201" } covariâncias submetidas, a menos de { "1e-12" } em termos relativos (pior { "7.9e-16" }); números de condição até { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>Fornecedor de orientação lunar de eixos principais DE440</b> (Biblioteca): <c1/> do SPICE sobre o PCK binário em { "2 000" } épocas fora dos nós, a menos de { "1.7e-5" } rad (pior { "1.7e-6" } rad, cerca de { "3" } m à superfície), depois da correção listada em "Corrigido".

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>Entrada e saída de gravações SigMF, e espetros de Welch</b> (Biblioteca), limitado à leitura e escrita de SigMF e a <c1/>: <c2/> do scipy { "1.18.1" } a menos de { "1e-12" } em termos relativos por intervalo (pior { "6.0e-14" }); gravações do sigmf-python { "1.13.0" } descodificadas de forma idêntica bit a bit; os metadados do crate válidos face ao esquema SigMF { "v1.2.6" }. A síntese IQ e as suas comparações de modelo ficam fora dele.

# text
seg-a7756d2e124a = <b>Ajustador de efemérides difundidas LEO e SISRE face ao intervalo de ajuste</b> (Medido), limitado ao ajuste kepleriano de 16 parâmetros e ao seu SISRE só de órbita: órbitas precisas ITSG do TU Graz de quatro satélites face às estatísticas de Liu et al. { "2025" }, componentes a menos de 1.5x ({ "0.804" } a { "1.087" }) e SISRE a menos de 1.5x ({ "0.716" } a { "0.809" }).

# text
seg-99debd58724a = Constatações

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = A referência independente discordou destas linhas, pelo que continuam MODELLED. Cada constatação é também escrita no texto da referência independente da linha (e, por isso, em <c1/>), com um teste que a fixa.

# text
seg-e28fac875d8c = <b>Estimação do estado do relógio de bordo:</b> em relógios IGS retidos de { "11" } satélites GPS Block IIF, o filtro de três estados é consistente um passo à frente mas demasiado confiante a uma hora em { "9" } de { "11" } (os termos periódicos e de cintilação não estão no modelo).

# text
seg-5900ce454dc7 = <b>Deteção de spoofing:</b> no JammerTest { "2024" } nenhum monitor ao nível das observáveis deu alarme a menos de { "10" } s de qualquer dos { "8" } inícios publicados, e três janelas anteriores ao início tiveram falsos alarmes.

# text
seg-08b6e6aa7d08 = <b>Nível de proteção de temporização sob spoofing:</b> o erro de tempo não detetado medido excede o TPL em { "3" } de { "8" } inícios detetados (1.9x a 5.3x); uma calibração de relógio de { "60" } s não cobre a deriva do TCXO do recetor.

# text
seg-a2f4df11d9cc = <b>Janela de lançamento e geometria de ascensão:</b> face ao Orekit { "12.2" } a geometria concorda até ao arredondamento, mas a velocidade do local por rotação da Terra falha { "1e-6" } em termos relativos a { "62.9" } graus de latitude ({ "1.12e-6" }, o movimento polar que o modelo esférico omite). Ronda { "2" }: a velocidade com polo verdadeiro e com época concorda, a velocidade por predefinição sem época continua a falhar (ver abaixo).

# text
seg-f6b6c9251a17 = <b>Corredor de reentrada balística (Allen–Eggers):</b> a desaceleração de pico prevista para a reentrada da Stardust é de { "61.8" } g face aos { "32.89" } g reconstruídos (+{ "88" } %, tolerância { "15" } %).

# text
seg-5d83648dd867 = <b>Erro conjunto de UT1 e de movimento polar:</b> face à fórmula de exatidão impressa em { "178" } edições do IERS Bulletin A, o polo concorda a menos de 1.5x mas o UT1 não ({ "0.48" } a { "10" } dias, { "1.59" } a { "40" } dias). Superado na ronda { "2" }: a linha é agora VALIDATED (ver abaixo).

# text
seg-98a99bcba894 = <b>Dados de entrada de orientação da Terra por predefinição, offline:</b> o astropy confirma a contagem das linhas, mas as { "12" } linhas que o crate designa como previsões do Bulletin A estão assinaladas como medidas (I), e não como previstas (P). Os valores de concordância da linha do previsor operacional eram, por isso, face a linhas medidas. Superado na ronda { "2" }: o motor classifica as linhas pelo indicador e a linha é VALIDATED.

# text
seg-d96fbfa4be79 = <b>Erro de previsão de orientação da Terra de estilo operacional:</b> o erro de UT1 do previsor é de 2.4x a 12.6x o do Bulletin A a { "1" } a { "10" } dias e de { "5.32" } ms a { "10" } dias, fora do intervalo de { "0.36" } a { "3.13" } ms da 2.ª EOP PCC.

# text
seg-1833bf6e3b6f = <b>VLBI geodésico lunar:</b> face aos tempos de luz do ANISE através da DE440, nenhum atraso fica a menos de { "1" } ps; a maior diferença é de { "24" } µs, sobretudo devido ao centro analítico da Lua (cerca de { "200" } km da DE440). Ronda { "2" }: o caminho por kernel é VALIDATED numa linha própria; este caminho analítico continua MODELLED.

# text
seg-0ec8a2a91702 = <b>Exportação de interoperabilidade lunar:</b> o Orekit { "12.2" } recusa os sistemas de tempo LTC e TCL, pelo que a troca dos ficheiros OEM lunares com um segundo leitor não está estabelecida.

# text
seg-09cfd4e61b7b = <b>Movimento relativo de Clohessy–Wiltshire:</b> face ao movimento não linear do Orekit a { "100" } m, a diferença é de { "1.2" } a { "6.3" } mm, acima de { "1" } mm; escala como o termo de segunda ordem omitido, pelo que a tolerância fixada antecipadamente ficava abaixo do erro de linearização. Superado na ronda { "2" }: a correção de segunda ordem é VALIDATED face ao mesmo limiar.

# text
seg-af1bdd974ba5 = <b>Crescimento do erro de deriva INS/TRN:</b> face a um Monte Carlo inercial livre do NaveGo, as leis de crescimento mantêm-se a menos de { "5" } % até { "600" } s e sobrestimam para além disso (2.2x a 8x a uma hora), porque omitem a realimentação de Schuler. Superado na ronda { "2" }: o modelo de erro de Schuler é VALIDATED.

# text
seg-8459bc50f8b4 = <b>Volume de serviço lunar a partir da geometria real da constelação:</b> { "4" } de { "12" } estatísticas de disponibilidade publicadas diferem em mais de { "2" } pontos percentuais (até { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Sobrelimite do enviesamento de rastreabilidade heterogénea de UTC(k):</b> em { "105 024" } linhas do BIPM, o sobrelimite é excedido em { "50.8" } % das linhas; a incerteza publicada limita a medição do desvio pelo BIPM, e não o próprio desvio.

# text
seg-814acf34cffd = <b>Classificação do espaço nulo do datum lunar:</b> na geometria publicada de cinco refletores, a correlação é de -0.78 contra -0.97, e o CRLB da origem é { "96" } a { "98" } % inferior ao do artigo.

# text
seg-da01b5e08a87 = <b>Substrato de geometria do datum de LLR lunar:</b> face a { "192" } pontos normais lunares do ILRS de { "2024" }, o RMS do resíduo unidirecional era de { "96" } m com a interpolação de orientação anterior e é de { "22.7" } m após a correção abaixo, ainda acima do limiar de { "10" } m (coordenadas de estação arredondadas, sem movimento polar). A série de orientação satura em silêncio fora de 2024-2025. Ronda { "2" }: o modelo de distância medida é VALIDATED numa linha própria ({ "2.81" } m); a série cobre agora 2014-2030 e dá erro fora desse intervalo.

# text
seg-fd9ad94680e9 = <b>Acoplamento da taxa do relógio relativista ao referencial:</b> o termo de autopotencial está { "3.18e-4" } acima do valor publicado (tolerância { "1e-4" }); o artigo avalia um potencial diferente, pelo que não existe valor publicado desta forma fechada. Superado na ronda { "2" }: o potencial equatorial de grau 2 é VALIDATED face ao mesmo artigo.

# text
seg-e002819c1e2d = <b>Constantes físicas de todos os corpos do sistema solar:</b> { "12" } de { "84" } constantes dos corpos acrescentados diferem de NAIF pck00011 e gm_de440 (elementos mais antigos dos satélites de Marte; outras soluções de GM para Urano, Neptuno e Plutão). Ronda { "2" }: as constantes seguem agora o NAIF (uma transcrição, não contada), e a orientação calculada concorda com o SPICE; a linha continua MODELLED.

# text
seg-e722d242e78e = <b>Modelos de efemérides LEO selecionáveis:</b> o ajuste de 22 parâmetros deixa 1.71x e 1.86x o erro ao longo da trajetória publicado em arcos de { "20" } min, acima de 1.5x. Superado na ronda { "2" }: o modelo e o ajuste de 22 parâmetros são VALIDATED numa linha própria.

# text
seg-c136023752df = <b>Posicionamento conjunto GNSS e LEO:</b> o enviesamento entre sistemas concorda com o RTKLIB, mas { "93.2" } % das épocas ficam a menos de { "3" } m do ITRF2020, contra { "95" } %; o próprio RTKLIB atinge { "88.2" } % nos dados ({ "93.6" } % após a correção do atraso de grupo da ronda 2).

# text
seg-e5f0e3c21def = <b>Cegueira de integridade em modo comum</b> e <b>mapas de cobertura e DOP:</b> ambas as comparações passaram mas foram recusadas na revisão porque um motor deliberadamente errado também passa nelas (a primeira só verifica uma identidade interna; os pisos publicados da segunda não conseguem ver um PDOP duplicado). Ronda { "2" }: a cegueira de integridade em modo comum é VALIDATED em entradas com paridade; os mapas de cobertura continuam uma constatação (ver abaixo).

# text
seg-688e1753cd53 = Ronda de validação { "2" }

# text
seg-b320fbdb72c3 = A segunda ronda tomou todas as linhas que a primeira deixou encaminháveis, com novos pré-registos submetidos antes de qualquer ficheiro de teste ser obtido ou de qualquer referência independente ser executada, um segundo revisor adversarial que repetiu cada comparação e uma mutação deliberada do motor que tem de fazer cada teste ficar vermelho. O responsável aceitou a formulação corrigida da linha do limite fora de Omega em 2026-10-02 antes de esta ser promovida (o seu texto antigo contradizia o código).

# text
seg-7b7c584caaaf = <b>Promovidas a VALIDATED ({ "17" }).</b> Tipo de referência independente entre parênteses; tolerância fixada antes da execução.

# text
seg-555e6ad454d2 = <b>Acoplamento da taxa do relógio relativista ao referencial</b> (Referência): L_m de Ashby e Patla { "2024" } a menos de { "2.8e-6" } (limiar { "1e-4" }) a partir do potencial equatorial de grau 2 dos dois campos que o artigo cita; gravidade de grau 350 do pyshtools para a entrada radial ({ "8.3e-5" }); velocidade lunar DE441 ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Dados de entrada de orientação da Terra por predefinição, offline</b> (Biblioteca): o astropy { "8.0.1" } e o IERS Bulletin A n.º { "039" } confirmam as { "30" } linhas finais, { "54" } rápidas e { "90" } previstas do extrato recortado de novo.

# text
seg-b77253dd26b5 = <b>Erro conjunto de UT1 e de movimento polar</b> (Biblioteca): as rotações completas do astropy e do pyerfa reproduzem a tabela conjunta (UT1 e polo a menos de { "6e-16" }, a combinação a menos de { "1.9e-7" }); os erros realizados do IERS Annual Report { "2019" } dão razões de { "1.001" } a { "1.100" }.

# text
seg-378414f812c1 = <b>Pegada e cobertura de carga útil de observação da Terra</b> (Biblioteca): Orekit { "12.2" } e GeographicLib { "2.1" } em todos os limiares fixados antecipadamente, com a regressão nodal de J2 agora no espaçamento dos nós.

# text
seg-792bf58a1c1e = <b>Movimento relativo de Clohessy–Wiltshire</b> (Biblioteca): com uma correção de segunda ordem em forma fechada, a menos de { "1.2e-7" } m do movimento não linear do Orekit contra { "1e-3" } m; a matriz linear sozinha continua caracterizada ({ "1.2" } a { "6.3" } mm).

# text
seg-423437d90022 = <b>Pontaria no plano B e assistência gravitacional por cónicas ajustadas</b> (Biblioteca): plano B, assíntotas, C3 e elementos heliocêntricos do GMAT R2026a; sbpy { "0.6.0" } e Kasuga e Jewitt { "2019" } para o parâmetro de Tisserand.

# text
seg-b29b0dfcd3a4 = <b>Crescimento do erro de deriva INS/TRN</b> (Biblioteca): um modelo de erro de Schuler de nove estados a menos de { "5" } % das execuções de deriva corrigidas do NaveGo em todos os { "48" } pontos (pior { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Cegueira de integridade em modo comum</b> (P2): <c1/> do numpy em { "1464" } entradas com paridade a menos de { "1e-12" } (pior { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>OD e relógio lunares conjuntos multitécnica</b> (P2): o numpy recalcula cada passo de Gauss-Newton, sigma e erro de estação em seis redes (a menos de { "2.4e-11" }) após uma correção da resolução por QR.

# text
seg-7ed9b059f888 = <b>Covariância das coordenadas de estação do VLBI lunar</b> (Biblioteca): um jacobiano construído com o SPICE reproduz o calendário, o espetro, os sigmas e o espaço nulo a menos de { "1" } % e { "0.1" } graus; numpy até { "2e-13" }.

# text
seg-0e4e1c3fc899 = <b>Limite do modo comum indetetável com resíduo fora de Omega</b> (P2, formulação corrigida por decisão do responsável): LAPACK do numpy em { "256" } casos a menos de { "1e-12" }, seis infinitos exatos.

# text
seg-0fc8ce9cde6c = <b>Classificação do espaço nulo invariante à base</b> (P2): interseção de subespaços com SciPy e NumPy em { "72" } matrizes construídas, inteiros exatos, norma do projetor a menos de { "6.0e-15" }.

# text
seg-4e5e7a6072bc = <b>Serviços ionosféricos de frequência única e de UTC de uma mensagem de navegação LEO</b> (Biblioteca): GNSSTk { "15.3.1" } para Klobuchar, Az e a deriva de UTC; ERFA para os três casos de segundo intercalar.

# text
seg-a644bf49c816 = <b>Limite de posicionamento por rede não terrestre 5G</b> (P1): limites de SSB único de Bachl, Lei e Nabeel { "2026" } a menos de meio algarismo impresso; numpy para as covariâncias da solução de posição.

# text
seg-b326f6fc55ad = <b>Modelo de distância medida de LLR</b> (Medido, nova linha separada do substrato do datum de LLR): { "192" } pontos normais lunares do ILRS com { "2.81" } m de RMS contra um limiar de { "10" } m, com o tempo de luz baricêntrico do IERS { "2010" }; as componentes abaixo do limiar não são resolvidas uma a uma, e a linha di-lo.

# text
seg-82e9fba684dc = <b>VLBI geodésico lunar, caminho por kernel</b> (Biblioteca, nova linha separada da linha do VLBI lunar): tempos de luz do SPICE convergidos a menos de { "1" } ps e derivadas parciais a menos de { "1e-6" } em épocas próximas de J2000; o caminho analítico por predefinição continua MODELLED.

# text
seg-03c47d262ff3 = <b>Modelo de efemérides LEO de 22 parâmetros de Liu et al. { "2025" } e o seu ajuste</b> (Medido, nova linha separada da linha dos modelos selecionáveis): órbitas precisas reais a menos de 1.5x das estatísticas publicadas nos dias do artigo e em dias retidos ({ "0.683" } a { "1.186" }); a convenção de escala de n_dot é transcrita e não é validada por esta comparação, e a regra de paragem é a regra de convergência de parâmetros do Kshana, e não a regra de variação do RMS do artigo. O polinómio ATOMIC e a tabela de cinco altitudes continuam MODELLED.

# text
seg-b49f96eb52ad = Linhas VALIDATED existentes com novo suporte (sem alteração da contagem).

# text
seg-4e26bec3297c = <b>Posições dos planetas a partir dos elementos de Standish do JPL</b> e <b>tempo de luz entre corpos do sistema solar</b>: os limiares a posteriori de duas vezes o nominal são substituídos por comparações fixadas antecipadamente com o JPL Horizons DE441 (RMS no máximo o valor da Tabela { "8.10.1" } do Explanatory Supplement, pior { "0.778" }, incluídas a divisão da Terra e a rotação ICRF; tempos de luz a menos de { "1e-6" } s do Horizons em posições DE441, pior { "6.7e-9" } s). As suas marcas "limite fixado após a comparação" são removidas.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Integridade (RAIM/ARAIM/SBAS)</b>: a linha já não assenta em verificações de plausibilidade. Passa a dizer: a separação de soluções por múltiplas hipóteses do ARAIM do ADD v4.2 concorda com o Stanford MAAST para o ARAIM { "2" } em { "270" } casos reais (pior diferença de VPL { "2.2e-3" } m contra { "0.05" } m); a deteção e exclusão RAIM instantânea concordam com <c1/> do RTKLIB em { "2016" } de { "2016" } decisões, com o nível de proteção de declive a menos de { "2.7e-12" } m; os níveis de proteção L1 do SBAS DO-229E concordam com o Stanford MAAST em difusões WAAS reais ({ "2868" } pares a menos de { "1.6e-5" } m). Indica com clareza que as funções de sigma uniforme <c2/> e <c3/> NÃO são aderentes à norma do ADD (diferenças de VPL/HPL com entradas coincidentes de 0.75/4.04 m e 0.39/1.93 m, uma constatação), que a comparação SBAS DFMC L5 é uma constatação ({ "308" } pares sem GEO à vista são protegidos pelo Kshana e não pelo MAAST) e que <c4/> não tem comparação externa. A sua marca própria é removida.

# text
seg-d059b9953c3f = <b>Ajustador de efemérides difundidas LEO</b>: a órbita verdadeira integrada é acrescentada à parte validada (Orekit { "12.2" } a menos de { "4.55" } mm em { "6" } h, limiar { "2" } cm); os polinómios de correção, o ajuste de relógio e o compromisso do período de atualização continuam modelados.

# text
seg-166d511bbba3 = <b>Constatações e linhas bloqueadas (continuam MODELLED).</b> O texto da referência independente de cada linha traz a constatação e o seu teste fixado.

# text
seg-7f233dbdf110 = Modulação de sinais de navegação (Betz { "2001" }, Hein { "2006" }): os espetros e as correlações concordam; os lóbulos laterais de { "24" } MHz e todos os enviesamentos de multipercurso ({ "11" } a { "15" } % baixos) não, causa por esclarecer.

# text
seg-4d5a6bb44d64 = Geolocalização TDOA/FDOA: os limites coincidem com os de Ho e Chan e de Ho e Xu, e com o código dos autores a menos de { "3e-12" }; os fatores de Ottawa impressos a partir de um Monte Carlo diferem em { "1.3" } % e { "4.4" } %.

# text
seg-5fa189f788ca = GNSS da Terra à distância lunar: as médias no zénite do GENESIS concordam com Montenbruck et al. { "2023" } em { "5" } de { "6" }; as médias no nadir são { "1.0" } a { "2.4" } satélites mais altas.

# text
seg-d7e5b5a64f43 = Mapas de cobertura e DOP: os projetos para a Terra concordam com o Orekit, o gnss_lib_py e o numpy em todos os limiares; os projetos para a Lua e Marte excedem { "1e-9" } apenas em células quase singulares.

# text
seg-3c8fb07d83ec = Posicionamento GNSS conjunto: frequência dupla { "79.9" } % e produtos precisos { "94.2" } % a menos de { "3" } m contra { "95" } % (RTKLIB { "67.9" } % e { "94.1" } %); a diferença de ISB com produtos precisos deve-se ao RTKLIB ignorar os desvios das antenas.

# text
seg-5d3d4d99fbc4 = Laços de seguimento (GNSS-SDR { "0.0.19" }): concordam de { "35" } a { "45" } dB-Hz; a { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, limiares +{ "1.5" } dB; tempos de deslize de { "0.5" } a { "2" } décadas mais curtos.

# text
seg-0dd24947169c = Volume de serviço lunar (Orekit e Hipparchus): { "155" } de { "160" } valores concordam; o requisito da pior amostra falha na geometria quase singular do LNCSS B.

# text
seg-74002245287f = Sensor inercial quântico: o piso só de QPN fica { "21" } a { "31" } % abaixo do ruído medido de Gauguet { "2009" } (limiar { "30" } %, falhado por { "0.5" } pontos).

# text
seg-ab8b17cf325e = Predefinições de osciladores: as unidades medidas excedem as predefinições de holdover do rubídio, de curto prazo do césio e de pior unidade do CSAC; a predefinição de OCXO não tem registo medido.

# text
seg-81ad9b839a28 = Densidade da meteorologia espacial: o Jacchia { "1971" } fica a menos de um fator { "2" } das densidades de acelerómetros no máximo solar, mas cerca de 1.7x demasiado denso no mínimo de { "2008" }.

# text
seg-68e5d0942847 = TEC oblíquo sem geometria: { "33" } de { "36" } arcos a menos de { "3" } TECU do mapa CODE (pior { "6.84" }).

# text
seg-f410ce9cf195 = Deteção de spoofing e TPL face ao registo oficial do JammerTest { "2024" }: { "4" } de { "10" } inícios detetados a tempo; o TPL é excedido em { "4" } de { "10" }.

# text
seg-41eb2c318469 = Filtro de relógio em relógios IGS novos: dois de { "11" } satélites falham o critério da soma das inovações.

# text
seg-064b623e918b = Previsor de EOP por mínimos quadrados mais autorregressivo: UT1 { "1.73" } a 2.11x o Bulletin A a { "2" } a { "10" } dias.

# text
seg-d98571cc21f4 = Sobrelimite do desvio realizado de UTC(k): excedência agregada { "0.0333" } contra { "1e-2" }.

# text
seg-527aca91ec7c = Datum do referencial lunar a partir de uma campanha: o ramo SPICE concorda; o ramo P2 com estações estimadas falha { "1e-9" } num problema de condição 2.1e8.

# text
seg-9805c4c821f9 = Datum do referencial lunar a partir de LLR real: { "15" } de { "16" } valores concordam com o SPICE; o sigma da translação em z é { "1.03" } % alto contra { "1" } %.

# text
seg-08e6c541b59e = Reentrada (Allen-Eggers): a solução de massa pontual concorda com reconstruções de agências (apenas uma verificação cruzada); a comparação com o acelerómetro está bloqueada à espera de uma fonte legível do Hayabusa2.

# text
seg-0bb78ffbd915 = Máscaras ITU-T: os valores de exemplo impressos concordam; os limites de classe da G.8273.2 não têm nenhum (bloqueado).

# text
seg-308c1bca3fd9 = Geometria da janela de lançamento: a velocidade do local com polo verdadeiro e com época concorda com o Orekit ({ "4.9e-8" }); a velocidade por predefinição sem época continua a falhar ({ "1.12e-6" }). Não promovida; seguimento pendente.

# text
seg-f0b7c3d60df8 = Constantes físicas de todos os corpos: agora { "0" } de { "84" } diferem do NAIF (uma transcrição), e a orientação calculada concorda com o SPICE até { "1.4e-10" } rad. Não promovida; seguimento pendente.

# text
seg-a5a787c9a761 = Bloqueadas por uma decisão de âmbito do responsável, cada uma com a respetiva comparação concordante submetida: observabilidade absoluta de estações lunares, DOP de balizas à superfície, a exportação fora do eixo, potência de deteção entre modalidades, a estatística de consistência em modo comum e cobertura LEO polar.

# text
seg-cf638ec9878b = Bloqueadas por dados: orçamento de erro de transferência de tempo (precisa de uma redução com dados reais), C/N0 do JammerTest (posição da antena e divisão de potência não documentadas).

# text
seg-e8709509eef3 = Revisões (números publicados que mudaram, antigo -> novo).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = Os níveis de proteção de <c1/> estão agora no nível local geodésico em vez do radial: até { "0.31" } m de HPL e { "0.14" } m de VPL em ABMF ({ "16" } graus N); nenhum resultado de referência mudou, mas o resumo registado do tutorial de <c2/> passa de HPL médio { "22.1" } m / VPL { "40.0" } m para { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Valores por predefinição do acoplamento de taxa do referencial lunar: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } por metro.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = Execução de EOP por predefinição offline (<c1/>, células listadas em <c2/>): predicted_rows { "12" } -> { "90" }; piso do polo { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; as linhas da Tabela { "2" } de <c3/>; concordância do previsor operacional 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> liu22 SISRE órbita/com relógio: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Tabela de altitudes de Liu, Kshana (razão): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = Escala de <c1/> da mensagem de navegação LEO { "2" }^-60 -> { "2" }^-58 (não fixada antecipadamente, divulgada; fora da comparação de ajuste); o CRC da trama de amostra liu22 0x62373A -> 0xDED99C.

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = Tabela de verificação de <c1/>: a linha de Liu e ATOMIC dividida numa linha VALIDATED de 22 parâmetros e numa linha MODELLED de ATOMIC e de cinco altitudes.

# text
seg-537f5d80b66c = Texto da linha de orientação lunar de eixos principais DE440: intervalo 2024-2025 / { "731" } linhas -> 2014-2030 / { "6 209" } linhas; "satura em silêncio" -> erro fora do seu intervalo.

# text
# c1: eo-coverage
seg-17a5dd090566 = Cenário <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; novos campos inclination_deg ({ "98.19" }) e nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (o relógio de referência de TDOP/GDOP é agora a constelação de numeração mais baixa à vista): GDOP global máx. { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }, mediana { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, e o mapa de GDOP por célula; mean_visible_by_constellation somado como inteiros (cerca de { "1e-12" } em termos relativos, invisível a { "4" } casas decimais).

# text
seg-e48b212c4881 = Posição GNSS conjunta de frequência única após a correção do atraso de grupo difundido: { "93.2" } % -> { "93.6" } % a menos de { "3" } m; mediana de ISB -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (laço de Costas SNR rho/4): no limiar de { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; a { "25" } dB-Hz { "9.55" } -> { "1.60" }; a { "22" } dB-Hz { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/>: todas as saídas mudam com o modelo de erro de Schuler; o pico de TRN do cenário fornecido { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = Relatório de <c1/>: nova chave geometry_path ("analytic" na execução por predefinição, nenhum valor numérico mudou); novos campos opcionais planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path, com epoch_partials no caminho por kernel; a descrição do tipo é reescrita. A referência independente do caminho por kernel da linha de verificação é o SPICE ({ "0.06" } ps); o ANISE ({ "0.12" } ps) passa a ser uma verificação cruzada da avaliação do kernel.

# text
seg-3631a31e7b26 = Constantes de corpos: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }; Plutão { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); raio equatorial de Fobos { "13.1" } -> { "13.0" } km; polo e meridiano de referência de Fobos e Deimos a partir de pck00011; o prime_meridian_deg do sistema solar inclui agora os termos quadrático e periódicos.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> em Europa), a partir da orientação completa de Europa de pck00011 (7cfd66b4; a orientação concorda com o pxform do SPICE até { "1.4e-10" } rad), que move o módulo de aterragem no espaço inercial: disponibilidade só com retransmissores / com a distância à Terra { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } de { "171" } épocas só com retransmissores), PDOP mediano { "5.266" } -> { "5.360" }, erro RMS da solução de posição { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, sigma formal mediano { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. A tabela em <c3/> e a fixação em <c4/> acompanham; <c5/> não muda.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), com o fator calibrado substituído pelo de Jacchia { "1971" }: activity_density_kg_m3 a 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k acrescentado ({ "1186.7" } K); <c2/>: a oscilação do ciclo solar a { "800" } km é agora 10.4x (NRLMSISE-00 13.6x) e a asserção de altitude acompanha a subida do NRLMSISE até { "500" } km e a descida a { "800" } km.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (texto do resumo inalterado em { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (resolução por QR): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> reemitido para os campos novos e removidos acima.

# text
seg-717c51e1cca0 = Pacotes de validação

# text
seg-4ec44f8a5f8e = D12, precisão alargada e um solucionador de raiz quadrada (duas novas linhas VALIDATED: { "226" } -> { "228" } linhas, { "110" } -> { "112" } validadas).

# text
seg-d28005966948 = Parte { "1" }, referência independente de precisão alargada:

# text
seg-9a5f94973450 = Datum do referencial lunar com as estações estimadas: uma referência independente mpmath de precisão alargada de 50 dígitos (fixada antecipadamente 804662d5, limiares escalados pela condição a partir de uma fórmula de erro retrógrado a priori) concorda numa nova data de campanha (2026-03-18) e no cenário original de 2024-01-01; nova linha VALIDATED sob P2. Resolve a anterior disputa de precisão dupla: os sigmas de datum do motor estão desviados até { "9.7e-6" }, as vias de inversa e de valores próprios do NumPy até { "6.2e-6" }, e as suas vias de Cholesky e QR cerca de { "1e-8" }. O motor está dentro do seu limite de erro mas cerca de mil vezes menos exato do que uma via de fatorização.

# text
seg-b055435a2138 = Ambiente da referência independente: mpmath { "1.3.0" } acrescentado.

# text
seg-d0c2b2a8e635 = Revisões: nenhuma. Nenhum ficheiro de referência nem figura publicada muda; a linha "Lunar frame datum from an observing campaign" continua MODELLED (decisão do fundador de 2026-10-02, opção A: não toma emprestado o estado da linha separada); o seu texto de testes cita o novo teste e a sua constatação.

# text
seg-50b53908fb7c = Parte { "2" }, solucionador de datum de informação em raiz quadrada:

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Novo solucionador opcional de informação em raiz quadrada (<c1/>; <c2/> no cenário lunar-frame-campaign): QR de Householder, marginalização através do fator triangular, um SVD de Jacobi para o espetro, e produtos compensados apenas a partir de operações corretamente arredondadas. Face à referência independente de 50 dígitos (fixada antecipadamente b41908c9), os seus sigmas de datum concordam até { "3e-13" } numa nova data (2026-06-09); nas entradas de 2026-03-18 e 2024-01-01 o solucionador por predefinição está desviado até { "1e-5" }. Nova linha VALIDATED sob P2. O solucionador por predefinição e a sua saída não mudam. Os limiares fixados antecipadamente só atestam erros acima de cerca de { "2e-7" } em termos relativos: rejeitam o solucionador por predefinição mas não um sinal de Householder invertido, um produto escalar não compensado ou uma inversa final espetral, e a linha di-lo.

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
seg-de9aeb2adde0 = Caminhos opcionais de raiz quadrada a par dos valores por predefinição inalterados: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> e <c6/>, sobre os novos <c7/> e <c8/>. Cada um concorda com o seu valor por predefinição onde ambos são exatos (uma verificação interna, sem linha; não é afirmada nenhuma validação para eles). <c9/> delega agora numa rotina partilhada; a sua saída e a saída por predefinição de todos os cenários não mudam.

# text
seg-87a632404f32 = Decisões de característica nas campanhas de referencial lunar: uma verificação de precisão alargada fixada antecipadamente ao longo de { "40" } dias confirma todas as decisões decidíveis de bloco de estação e de Helmert de característica completa. O limite a priori não consegue garantir os { "20" } dias de Helmert com deficiência de característica; em aritmética exata, o seu defeito é geométrico, com o limiar de { "1e-9" } dentro do intervalo natural das razões de valores próprios da campanha. Sem linha.

# text
seg-3b24e7fa36bf = A afirmação da linha da campanha de precisão alargada é restringida a "dentro do limite de pior caso", e a sua verificação da direção mais fraca com estações fixas mede agora um ângulo real ({ "6.6e-16" } rad; o comparador mudou de acos para uma corda, o limiar não).

# text
seg-4fad02ab4b6d = Revisões: nenhuma. Nenhum ficheiro de referência nem figura publicada muda; a linha "Lunar frame datum from an observing campaign" não muda e continua MODELLED (decisão do fundador de 2026-10-02, opção A).

# text
seg-627d3357d620 = D4, espinha dorsal de efemérides de kernel JPL, fase { "1" } (quatro novas linhas VALIDATED: { "228" } -> { "232" } linhas, { "112" } -> { "116" } validadas).

# text
seg-30e8a645191f = O leitor de kernels NAIF tem uma linha própria.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (contentor DAF, SPK tipo { "2" }, PCK binário tipo { "2" }) concorda com o SPICE Toolkit (CSPICE N0067 até spiceypy { "8.2.0" }) e com o ANISE { "0.10.6" } em todos os { "600" } estados DE440 e { "200" } rotações de orientação lunar de uma grelha aleatória extraída a partir do hash do próprio commit de pré-registo (abcd9133), dentro de limiares derivados previamente da avaliação de Chebyshev em dupla precisão (pior caso { "0.6" } % do limiar, { "1.95e-3" } m). A linha afirma que o motor lê corretamente os kernels JPL, não que a DE440 ou a série analítica sejam exatas (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b>: posições DE440 (ou de qualquer SPK de tipo 2) através do leitor do próprio motor, com épocas TDB em duas partes e o SHA-256 do kernel guardado para os relatórios; nunca substitui o baricentro de um sistema por um planeta. <c2/> permite que um percurso de geometria escolha a série analítica (a predefinição) ou um kernel.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Lua por kernel opcional para <c1/> e <c2/></b>: uma chave <c3/> lê o centro geocêntrico da Lua a partir do kernel; nada mais muda, e o relatório ganha um bloco <c4/> que nomeia o kernel e o respetivo SHA-256. Sem a chave, ambos os relatórios são idênticos byte a byte aos anteriores.

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Covariância de um ponto da superfície lunar no percurso por kernel</b> (nova linha VALIDATED): com todas as estações fixas e o farol na Lua DE440, a covariância do farol concorda com um jacobiano de tempo de luz do SPICE (pior caso { "1.7e-3" } face a um limiar de { "1" } %) e com uma inversa do NumPy ({ "4e-14" } face a { "1e-9" }), pré-registado em 4a51256 (<c1/>). A linha do percurso analítico continua MODELLED: na Lua analítica, o seu menor sigma do farol fica { "3.9" } % abaixo da referência independente.

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Datum do referencial lunar a partir de uma campanha real, centro da Lua por kernel</b> (nova linha VALIDATED): em { "447" } pontos normais de 2019-Q2 nunca vistos, pré-registado em 830d945a antes de qualquer um ter sido obtido, a covariância do datum no percurso por kernel concorda com a referência independente inalterada do SPICE e do NumPy dentro de { "7.6e-5" } face a limiares de { "1" } % e { "2" } % (<c1/>). O fundador decidiu que esta linha só é promovida com pontos novos; o diagnóstico com dados já vistos (c51f8b2) é uma constatação, não uma evidência. O limiar não discrimina modelos da Lua: a Lua analítica também passa na mesma fatia (pior caso { "3.8e-3" }), a mutação planeada (a Lua por kernel uma hora atrasada) não foi detetada e, na dobra, um centro da Lua errado em cerca de { "4,650" } km (a Lua tomada em torno do baricentro Terra-Lua) também passou. A linha afirma a covariância nesse percurso, não o centro da Lua, e di-lo.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Posições do Sol, da Lua, de Mercúrio e de Vénus a partir da DE440 em épocas UTC</b> (nova linha VALIDATED): <c1/> concorda com o Skyfield { "1.54" } em { "600" } posições entre { "1973" } e { "2026" }, pior caso { "2.96" } m, dentro de um limiar pré-registado (0bfafe6d) definido pela série TDB − TT de dois termos (<c2/>). As posições dos planetas passam a ter agora esta nova linha de kernel; a linha Standish e a linha das luas planetárias ficam inalteradas, e as luas aguardam um cenário que precise delas (decisão do fundador).

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Constatações: a única falha da comparação do datum LLR (sigma da translação em z de { "1.025" } % face a { "1" } %) desce para { "0.049" } % quando apenas o centro da Lua é lido da DE440, com dados já vistos (<c1/>); na fatia nova de { "2019" } a Lua analítica também passa, pelo que a falha de { "2015" } era marginal para a geometria desse trimestre. As linhas analíticas "Lunar frame datum from a REAL observing campaign" e "Lunar-surface-point coordinate covariance … kept distinct from the Earth-station one" continuam MODELLED; os textos das suas referências independentes passam a apontar para as linhas do percurso por kernel.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> deixa de dizer que o motor não tem leitor de kernels binários; aponta para a linha do leitor e explica por que razão os kernels de veículos espaciais (tipos { "13" } e { "21" }) continuam a vir do Horizons.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Revisões: nenhuma. Nenhum ficheiro de referência, valor publicado ou valor de teste existente muda; os relatórios analíticos <c1/>, <c2/> e <c3/> com todas as estações fixas são idênticos byte a byte aos anteriores (prefixos SHA-256 do resultado 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, biblioteca de relógios medidos "Clock Atlas" (três novas linhas, uma VALIDATED: { "232" } -> { "235" } linhas, { "116" } -> { "117" } validadas).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Biblioteca de relógios medidos (<c1/>).</b> Cartões de dispositivo (modulação de fase branca, de frequência branca, flicker e de passeio aleatório, uma deriva linear de frequência e, opcionalmente, termos de fase de uma a quatro por revolução) ajustados a um registo de relógio medido com nome e avaliados em dados reservados; variâncias de Allan e de Hadamard com tratamento de lacunas; um detetor de condicionamento que regista todas as lacunas, valores atípicos de fase, saltos de fase, rajadas e saltos de frequência e nada sabe de limites de ficheiro ou de dia; conversão de um cartão para o modelo de ruído de temporização de slot, o modelo de relógio de Kalman estendido e os níveis de ruído do monitor de spoofing. Leitores para ficheiros de relógio RINEX e IGS, ficheiros por laboratório do BIPM e a Secção { "1" } da Circular T (<c2/>); um limite de envelhecimento hierárquico agregado para UTC(k) (<c3/>, ainda não avaliado).

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Identificação de ruído por autocorrelação de atraso 1</b> (<c1/>, Riley e Greenhall { "2004" }), nova linha VALIDATED (Biblioteca): concorda com o allantools { "2024.6" } <c2/> em { "140" } casos, inteiros idênticos, pior diferença { "9.6e-13" } face a um limiar de { "1e-9" } (pré-registado 2ec76864; <c3/>).

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Cartões de dispositivo medidos com previsão em dados reservados</b>, nova linha MODELLED (uma constatação): ajuste num terço, previsão do desvio de Allan dos outros dois terços dentro de um fator de { "1.5" } (pré-registado 2ec76864). GPS Block IIF numa janela IGS nova (2026-03-01 a { "14" }): { "10" } de { "11" }; o G27 é otimista à escala de duas horas (pior fator { "1.510" }). Césio (dentro, { "1.070" }), OCXO (fora, { "2.348" }) e estrôncio (dentro) são comunicados, não cegos. O cartão do recetor JammerTest e os cartões do maser Galileo e do Deep Space Atomic Clock estão bloqueados. Uma classe de modelo de TCXO de recetor ZED-F9P em { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }) falha: { "1" } de { "11" } estações cegas numa nova execução corrigida e divulgada (<c1/>, <c2/>).

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>Cartões GPS Block IIF com termos por revolução</b>, nova linha MODELLED (uma constatação): numa segunda janela nova (2026-04-01 a { "14" }), { "9" } de { "11" } dentro do limiar; o G03 ({ "1.947" }) e o G25 ({ "1.581" }) são otimistas porque os seus registos reservados são mais ruidosos do que os terços de ajuste; retirar os termos periódicos falha nos { "11" } (pré-registado fb475550; <c1/>).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, estimação do estado do relógio de bordo, ronda { "3" }</b> (uma constatação, continua MODELLED): depois do detetor de condicionamento congelado, o filtro estendido da ronda 2, com afinação e critérios inalterados, satisfaz (a) e (c) em todos os { "11" } satélites pela primeira vez; (b) falha no G09 ({ "0.894" }) e no G26 ({ "0.876" }) (pré-registado fb475550; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, deteção de spoofing, rondas { "3" } a 4b</b> (continua MODELLED): ronda { "3" } bloqueada ({ "167" } épocas de treino das outras sessões da unidade JammerTest face a { "3600" }); com um cartão de classe de modelo ZED-F9P (rondas { "4" } e 4b) o monitor de relógio gera zero falsos alarmes antes do início em todos os { "10" } inícios registados (ronda { "2" }: { "86" }) e { "6" } de { "10" } inícios são detetados em { "10" } s (ronda { "2" }: { "4" }); os mesmos quatro continuam atrasados (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, sobrelimite de UTC(k), ronda { "3" }</b>: pré-registado de forma prospetiva (fb475550) em emissões da Circular T a partir de { "465" }, ainda não executado (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Ambiente da referência independente: o registo ZED-F9P de Wroclaw fica sujeito a transferência de dados em <c1/> (CC BY { "4.0" }, cerca de { "1.5" } GB); os ficheiros de teste de relógio IGS estão incluídos no repositório (produtos IGS, com atribuição).

# text
seg-b05fa0811a3e = Revisões: nenhuma. Nenhum ficheiro de referência, valor publicado ou valor de teste existente muda; a M001 (reancoragem de holdover) não é aplicada porque nenhuma classe de relógio foi promovida.

# text
seg-986f4075210b = D8, um percurso validado de propagação, referencial e tempo (três novas linhas VALIDATED e M131 promovida: { "235" } -> { "238" } linhas, validadas { "117" } -> { "121" }).

# text
seg-d7a612528765 = Os tipos de cenário de órbita terrestre que tinham os seus próprios modelos de dois corpos, de J2 secular ou apenas de tempo sideral partilham agora um único percurso: conjuntos de elementos SGP4/SDP4 com datas julianas em duas partes, levados para o GCRS e o ITRS (International Terrestrial Reference System) através da cadeia IAU (International Astronomical Union) 2006/2000A, com parâmetros de orientação da Terra opcionais.

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
seg-016507ccdb8f = Novos <c1/>, <c2/>, <c3/>, <c4/> e <c5/>; <c6/> e <c7/> aceitam épocas em duas partes. Novos <c8/> (convenção SOFA <c9/> para dias com segundo intercalar), <c10/>, <c11/>, <c12/> (através do TAI, como o SOFA <c13/>), <c14/> e um <c15/> em duas partes.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = O modo polar de <c1/> propaga por SGP4 em 2026-01-01T00:{ "00" }:{ "00" } UTC na cadeia IAU (<c2/> aceita qualquer época); o gerador Walker SGP4 roda para o referencial fixo à Terra através da cadeia IAU.

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
seg-86ecad91a601 = O tipo de cenário <c1/> executa um novo preditor de passagens aparentes (<c2/>, <c3/>): SGP4 na cadeia IAU, refração ITU-R P.834-9 e o tempo de luz da ligação descendente (novos interruptores <c4/> e <c5/>, ativos por predefinição), parâmetros de orientação da Terra (<c6/>, <c7/>, <c8/>, predefinição { "0" }), cruzamentos resolvidos até { "1e-7" } s e a culminação por pesquisa de secção áurea. O <c9/> geométrico fica inalterado.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> impede que os núcleos de geometria, tempo e propagação do pacote tenham uma propagação kepleriana própria, taxas de J2 seculares ou uma rotação apenas por tempo sideral; os escalões rápidos com nome e a física que é o objeto de uma linha são exceções fundamentadas.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Nova linha VALIDATED "Two-part Julian dates and leap seconds on the Earth-orbit time path": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> em { "224" } instantes em torno de todos os { "27" } segundos intercalares, dentro de { "1e-6" } s (pré-registado e947e69d); pior caso { "1.9e-11" } s.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Nova linha VALIDATED "One Earth-orbit path": posições TEME de { "232" } conjuntos de elementos face ao python-sgp4 { "2.24" } (o SGP4 de referência de Vallado) dentro de { "6.1e-8" } m (limiar de { "1" } cm), e as rotações GCRS -> ITRS e TEME -> ITRS face ao ERFA <c1/>, <c2/> e <c3/> dentro de { "2.9e-6" } mas e { "0.41" } mas (limiares de { "0.1" } e { "2" } mas), com parâmetros de orientação da Terra (pré-registado 72ea9eb0). Divulgado: a primeira execução falhou em 2016-12-31T23:{ "59" }:{ "59.5" } por um segundo de rotação; o UT1 foi obtido a partir da data juliana quase-UTC num dia com segundo intercalar, o motor passa agora pelo TAI, e a segunda execução concorda com os limiares inalterados.

# text
seg-a72ccdc2516e = M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS" passa a VALIDATED: o Orekit { "13.1.8" } recebe os estados GCRS do motor, roda-os e calcula a visibilidade e o DOP (NumPy para grupos de vários relógios); posições dentro de { "6.8e-5" } m (limiar de { "0.2" } m), contagens de satélites à vista idênticas em 4040/4040 amostras, DOP mediano dentro de { "2.3e-11" } em termos relativos.

# text
seg-db498ac8e135 = Nova linha VALIDATED "Apparent ground-station pass prediction with refraction and light time": o Orekit { "13.1.8" } a propagar os mesmos conjuntos de elementos num TEME construído por si segundo a definição indicada, com refração ITU-R P.834 e o seu modelo de medição de tempo de luz, em { "60" } casos em estações ao nível do mar: { "1210" } passagens, cruzamentos dentro de { "3.4e-6" } s (limiar de { "5" } ms), elevação máxima dentro de { "5.5e-7" } deg, direção aparente dentro de { "8.8e-7" } deg (limiar de { "1e-4" } deg).

# text
seg-ab87bb0ee63d = Constatações, mantidas fixas: as primeiras comparações de alegação completa de ponta a ponta com o Orekit falharam os limiares de posição e de direção, não por causa do motor mas porque o SDP4 do Orekit { "13.1.8" } afasta-se do SGP4 de referência em órbitas de espaço profundo circulares (e = { "0" }) (até { "67" } m) e o seu TEME predefinido é construído sobre a nutação IERS { "1996" } (IAU { "1980" }), a cerca de { "72" } milissegundos de arco da cadeia IAU 2006/2000A ({ "2.7" } m em LEO). O coeficiente ITU-R P.834 de h*theta0^{ "2" } no Orekit é { "0.011380" } onde a Recomendação imprime { "0.01380" }; a comparação é ao nível do mar, onde o termo se anula, e a diferença acima dele fica fixada.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = "Ground-station pass prediction (ground segment)" continua VALIDATED com a sua alegação restringida ao <c1/> geométrico; o tipo de cenário <c2/> pertence à nova linha.

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
seg-532e10ead5a2 = Revisões: <c1/> incluído, acesso total { "1675" } s -> { "1659" } s (cinco passagens como antes; melhor elevação máxima { "73.25" } deg -> { "70.08" } deg), e todas as saídas de <c2/> mudam com o novo percurso (a linha impressa em <c3/> e a entrada <c4/> de <c5/> passam a dizê-lo); <c6/> incluído, VDOP GNSS no equador { "1.19669" } -> { "1.19710" }, a { "89.9" } deg { "1.50645" } -> { "1.50590" }, VDOP fundido a { "89.9" } deg { "1.14388" } -> { "1.14250" } (os valores publicados com duas casas decimais { "1.20" }, { "1.51" } e { "1.14" } ficam inalterados). Nenhum ficheiro de referência muda.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Ainda não encaminhados: <c1/>, os modos doppler, conjunto e de temporização de <c2/> e a órbita de referência de <c3/> (os seus modelos estão em <c4/> e <c5/>), e os projetos terrestres em <c6/> (um escalão rápido de dois corpos com nome).

# text
seg-03f638f20376 = D6, gerador de referência LunaNet AFS, LSIS V1.0 (quatro novas linhas, duas VALIDATED: { "238" } -> { "242" } linhas, validadas { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>Gerador de referência LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), fixado ao LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 de { "29" } de janeiro de { "2025" } e a nomear essa versão em todas as saídas: a portadora de { "2492.028" } MHz; o canal de dados AFS-I BPSK({ "1" }) a { "500" } símbolos por segundo com o seu código Gold de 2046 chips; o piloto AFS-Q BPSK({ "5" }) com os seus códigos primário Weil de 10230 chips, secundário de 4 chips e terciário de 1500 chips; a trama de identificador { "0" } (padrão de sincronização, subtrama { "1" } BCH ({ "51" }, { "8" }), CRC-24, subtramas { "2" } a { "4" } LDPC de taxa um meio, entrelaçador de blocos de { "60" } por { "98" }) com um descodificador exaustivo da subtrama 1 e um descodificador LDPC min-sum escrito apenas a partir da matriz de verificação de paridade; e síntese de IQ em banda de base com etiquetas de referência escritas como gravação SigMF. Os códigos são gerados a partir dos registos de deslocamento e das construções de Legendre/Weil da norma. Nada copiado da norma é redistribuído (ela não tem termos de reutilização): os índices primários do AFS-Q provêm da IS-GPS-800J, e o que apenas os anexos da norma definem (atrasos G2 do AFS-I, códigos terciários, submatrizes LDPC) é lido em tempo de execução a partir de uma cache local que <c2/> preenche a partir do PDF alojado pela NASA, com cada ficheiro verificado face a um SHA-256 fixado (<c3/>). O modelo é uma referência de aderência à norma, não um modelo de canal, de propagação ou de balanço de ligação.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> e <c2/>: uma gravação pode transportar campos de extensão com espaço de nomes declarados em <c3/>.

# text
seg-a9465820a1fc = Nova linha VALIDATED "LunaNet AFS baseband rendering against an independent generator, given its channel state": face ao LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, compilação de banda S), zero discrepâncias de chips nos códigos dos PRN { "1" } a { "210" }, zero discrepâncias de símbolos nas três tramas da execução, e uma correlação complexa normalizada de { "0.999990" } em { "23.9" } s das suas próprias amostras (pior bloco de { "2" } ms { "0.999948" }), dentro de limiares fixados antes da comparação (pré-registado 986ac280). Aciona o renderizador com o estado de canal do próprio simulador e não abrange a repartição de potência a partir da densidade portadora-ruído nem a escrita em SigMF e em 8 bits.

# text
seg-07edced2764a = Nova linha VALIDATED "LunaNet AFS frame channel coding, FID { "0" }": as tramas de 6000 símbolos são iguais às do LANS-AFS-SIM símbolo a símbolo (pré-registado 986ac280); o código da subtrama 1 reproduz o exemplo trabalhado da Figura { "8" } do LSIS e o CRC-24 o valor de verificação do catálogo CRC-24/LTE-A.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Ambas as linhas promovidas dependem de dados da cache LSIS: o seu teste de referência independente é ignorado com um aviso até que <c1/> tenha sido executado.

# text
seg-89a4bc4a766e = Constatação (nova linha MODELLED), "LunaNet AFS spreading-code generation": de { "2 937 232" } chips e bits gerados e comparados com as tabelas da norma e os ficheiros do Anexo { "3" }, um difere, os "últimos { "24" } chips" que a Tabela E-5 imprime para o PRN terciário { "147" }, que duplica a célula do PRN { "151" }, enquanto o próprio ficheiro do Anexo { "3" } da norma concorda com o gerador. O critério de zero discrepâncias não é satisfeito.

# text
seg-d4e76301323f = Constatação (nova linha MODELLED), "LunaNet AFS closed-loop decodability": três execuções pré-registadas face ao PocketSDR-AFS; a terceira satisfez integralmente os limiares de seguimento e de descodificação, mas não a sua salvaguarda de que uma compilação do recetor apenas com impressão reproduz o registo da compilação fixada, porque duas execuções do recetor não modificado já diferem nos seus registos de aquisição.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Corrigido: a portadora predefinida de <c1/> (<c2/>), <c3/> e <c4/> era um valor arredondado de { "2.4" } GHz; é agora a portadora AFS LSIS-020, { "2492.028" } MHz. Com a predefinição antiga, a perda em espaço livre estava subestimada em { "0.327" } dB.

# text
seg-ed7c170ccc2c = Revisões: nenhuma. Todos os cenários incluídos indicam a sua portadora, e os resultados de todos os { "138" } ficheiros de cenário são idênticos byte a byte aos do main anterior.

# text
seg-3ec7f5b17122 = D7, IQ lunar real e GPS LNAV (sete novas linhas, nenhuma VALIDATED: { "242" } -> { "249" } linhas, validadas { "123" } sem alteração).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/>: uma transformada rápida de Fourier (FFT) de base mista cuja saída tem os mesmos bits em todas as plataformas; um SHA-256 fixado das transformadas de 8000 e 24000 pontos passa em x86_64 e em wasm32-wasip1 (executor em <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/>: pesquisa paralela de fase de código em IQ amostrado (<c2/>, <c3/>) com dobragem coerente, acumulação não coerente, um limiar de qui-quadrado para uma probabilidade de falso alarme em toda a pesquisa e uma estatística de média por célula para ruído de banda limitada; <c4/>, <c5/> com Doppler de código, e os estimadores de densidade portadora-ruído (C/N0) M2M4 e de pico da grelha.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/>: um codificador da mensagem de navegação legada (LNAV) da IS-GPS-200 para as subtramas { "1" } a { "3" }, com a paridade da Tabela 20-XIV e um descodificador de campos.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/>: um leitor do ION GNSS SDR Metadata Standard (<c2/>) e dos seus ficheiros de amostras, com <c3/> para níveis em complemento para dois.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/>: o cabeçalho de lote IQS do LuGRE (Lunar GNSS Receiver Experiment), a telemetria RAW, ACQ e NAV e os ficheiros CLK, e uma verificação que lista onde os metadados de <c2/> contradizem o cabeçalho binário.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> e, em <c2/>, o referencial do corpo com orientação por guinada, os ângulos de azimute de transmissão e fora do nadir, e <c3/> para C/N0 relativo com diagramas medidos.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = Codificação da mensagem de navegação GPS LNAV (nova linha, continua MODELLED após a pós-verificação do integrador): no ficheiro de difusão IGS de { "2" } de março de { "2025" }, analisado e descodificado pelo RTKLIB v2.4.2-p13, todas as { "960" } palavras passam a paridade, todas as { "96" } subtramas são descodificadas e todos os { "608" } inteiros difundidos são iguais aos do Kshana (<c1/>), mas o pré-registo (d4d9eb9d) chegou ao ramo público dois segundos depois do commit que contém o resultado, pelo que a ordem "registado antes de o ficheiro ser obtido" não pode ser demonstrada e a linha não é promovida.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> preenche as palavras a partir do bit mais significativo (I no nibble alto de um byte LuGRE; a leitura anterior produzia o sinal conjugado), mantém a leitura antiga como <c2/> e lê amostras mais largas do que uma palavra.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/>: refinamento Doppler coerente em fase ({ "0.2" } Hz RMS a { "30" } dB-Hz em { "200" } ms em simulação).

# text
seg-b0f6a61acce0 = GPS L1 C/A face ao gps-sdr-sim: chips e bit de paridade exatos ao bit; { "230" } de { "1152" } campos LNAV diferem em uma unidade porque o gps-sdr-sim trunca onde o inteiro difundido exige arredondamento.

# text
seg-1c525ca495c0 = LNAV descodificado pelo RTKLIB: toda a paridade e todas as subtramas passam e todos os parâmetros estão a menos de meio quantum; { "41" } valores escalados diferem em algumas unidades da última casa através da constante decimal { "2" }^-43 do RTKLIB, acima do limiar registado.

# text
seg-14e26e69777b = Aquisição LuGRE face ao GNSS-SDR { "0.0.19" }: { "266" } de { "266" } decisões concordam, { "250" } localizadas na mesma célula; a maioria dos positivos são artefactos de uma média de −{ "0.5" } nos níveis de 4 bits em bruto; a vertente de C/N0 não teve dados de voo contemporâneos. Dois lotes (OP5, OP12) foram excluídos por erro: os seus metadados concordam com os cabeçalhos, mas o leitor então não conseguia ler uma amostra mais larga do que uma palavra.

# text
seg-3a32ff9d66fc = Aquisição LuGRE face ao Doppler previsto pela órbita: com a decisão pela potência da amostra, todas as pesquisas cruzam em ruído de banda limitada; com a decisão por média por célula, os pares mais fortes concordam em módulo com o sinal invertido, o que mostra que a ordem I/Q registada é o conjugado dos dados.

# text
seg-2bb618ba4059 = Aquisição cega nos lotes da superfície lunar: quatro lotes adquirem cada um um satélite (previsto visível, sem falso alarme a { "1e-7" }), nenhum adquire dois, pelo que o limiar da diferença de Doppler não tem nenhum par para avaliar.

# text
seg-f95606e17fd1 = C/N0 relativo à distância lunar (M039 reformulada): { "15" } registos Block IIR/IIR-M e um par, poucos demais para o limiar registado.

# text
seg-9306cf44fc44 = Revisões: nenhuma; nenhum número publicado, ficheiro de referência ou valor da documentação mudou.

# text
seg-2a3cb68c94d6 = A linha M039 "Earth-GNSS at lunar distance" reformula a sua alegação à distância lunar como o C/N0 relativo entre satélites numa época mais a visibilidade (não se alega o C/N0 absoluto); continua MODELLED. O NOTICE de nível superior contém a atribuição CC BY { "4.0" } do LuGRE.

# text
seg-e1e4094a186a = A orientação dos eixos principais lunares da DE440 é agora interpolada ao longo da geodésica entre nós diários. A interpolação anterior, elemento a elemento, tinha um erro de até { "2.0e-4" } rad ({ "340" } m na superfície lunar) perto dos pontos de quarto de cada dia, e não os "cerca de { "14" } m" que a linha indicava. Os seus utilizadores (geometria de telemetria laser lunar, datum lunar, observabilidade de falhas lunares) recebem a orientação corrigida.

# text
# c1: snapshot_raim
seg-a2071d345923 = Correções do motor da ronda { "2" }, cada uma executada de novo face à sua tolerância pré-registada inalterada: a versão IERS de uma linha EOP é lida a partir das suas flags I/P e não de um bloco Bulletin B em branco; <c1/> usa o nível local geodésico; o acoplamento do referencial de taxa lunar usa o raio equatorial, o J2 e a rotação; o ajuste liu22 parte de correções nulas sem priors e usa a taxa de movimento médio do artigo; o espaçamento dos nós EO inclui a regressão nodal de J2; o tempo de salto de ciclo de Costas usa rho/4; a solução conjunta aplica o atraso de grupo difundido do par; a resolução conjunta lunar usa um passo QR; o limite NTN é avaliado na posição verdadeira; a referência de relógio do projeto de constelação é a constelação mais baixa à vista; a série de orientação DE440 abrange 2014-2030 e dá erro fora desse intervalo em vez de truncar.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, uma órbita de referência construída a partir de estados tabelados fixos à Terra, usada pela comparação do ajustador de órbita real.

# text
# c1: NOTICE.md
seg-7293b717d978 = Os ficheiros de teste e os ficheiros de dados das comparações acima, cada um com o seu gerador e um <c1/> que indica a fonte, a licença, a data de obtenção e o SHA-256.

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
seg-920fe965bda9 = Ronda { "2" }: <c1/> e <c2/> (deteção de falhas ADD v4.2, a seguir o Stanford MAAST para o ARAIM { "2" }, aviso BSD-3 no código-fonte); <c3/>; <c4/> e <c5/>; o modelo de erro INS de nove estados <c6/>; derivadas parciais de <c7/> e as entradas de <c8/> do percurso por kernel; <c9/>, um leitor de kernels SPK de tipo { "2" } e PCK binários; <c10/> com estações ITRF2020; densidade de Jacchia { "1971" }; <c11/> sobre qualquer fornecedor de efemérides; <c12/>; <c13/> e <c14/>; <c15/>; <c16/> (leitores de relógio RINEX, ANTEX e DCB).

# text
seg-e3336e670d51 = Uma versão de correção sobre a { "0.29.2" }. O Kshana Studio é reconstruído em torno de duas vistas: uma vista Simples, que responde primeiro e explica em palavras simples, e uma vista Avançada com o painel completo. Acompanham-na duas pequenas correções em kshana.dev. O motor não muda: todos os cenários incluídos dão um resultado idêntico byte a byte ao da { "0.29.2" }, exceto a marca de versão.

# text
seg-c40ab967ace6 = <b>O Kshana Studio tem uma vista Simples.</b> É a vista em que o Studio abre.

# text
seg-6a5ae001d00e = A resposta vem primeiro: um cenário abre no seu resultado, indicado numa frase simples. Cada cenário incluído tem a sua própria frase, escrita para aquilo que esse cenário mede.

# text
seg-375421534e4c = São mostradas no máximo cinco definições, as que mais alteram a resposta. As restantes ficam em "Definições avançadas", recolhidas até serem abertas.

# text
seg-d8650ae64549 = "Como isto é calculado" explica o método em poucas linhas, e "Para investigadores" apresenta os valores do próprio motor, o ficheiro do cenário e as evidências por trás do resultado.

# text
seg-36af7640e6ad = <b>O painel completo é a vista Avançada.</b> Todos os painéis, gráficos, exportações e relatórios do Studio anterior estão lá.

# text
# c1: view=advanced
seg-0428d0a7921b = <b>Um interruptor alterna entre as duas vistas e mantém o ponto em que se estava.</b> O cenário, a vista em que se estava e quaisquer definições editadas transitam consigo. O Studio lembra-se da última vista utilizada. As ligações do site e da documentação abrem a vista Simples; uma ligação com <c1/> abre a vista Avançada, e todas as ligações anteriores do Studio continuam a abrir o mesmo cenário e a mesma vista.

# text
seg-2c98ed084c10 = <b>Uma primeira vista mais rápida em ligações lentas.</b> A resposta registada de um cenário é desenhada antes de o resto do Studio carregar, pelo que, numa ligação móvel lenta, a resposta aparece em cerca de dois segundos em vez de cerca de nove.

# text
seg-2214d2dcfab4 = <b>Melhor pesquisa.</b> Uma pesquisa lista agora primeiro os cenários cuja área ou título corresponde às palavras, antes dos cenários que apenas as mencionam no nome do ficheiro ou no texto.

# text
seg-aa8d43280c19 = <b>O globo da página inicial deixa de ficar em branco com o movimento reduzido ativo.</b> Com a definição do sistema para movimento reduzido ativa, redimensionar a janela podia deixar o globo principal vazio até a página ser deslocada. O globo é agora redesenhado no mesmo fotograma do redimensionamento.

# text
seg-da4b78816df1 = <b>A consola de banda L da página inicial explica a sua banda vazia.</b> Em "Watch a jammer take the band", o painel GPS L5 / Galileo E5a ficava escuro durante todo o minuto, o que parecia uma avaria. Nenhum jammer transmite nessa banda neste cenário, e os sinais dos satélites ficam abaixo do piso de ruído, pelo que nada ali se eleva acima dele. Uma etiqueta discreta di-lo agora em qualquer troço de painel sem nada acima do piso (o painel L5 / E5a e o painel L2C antes de o seu jammer de ruído começar), com o C/N0 e o estado de bloqueio de cada banda da mesma execução. Só é colocada onde nada está acima do piso, pelo que nunca cobre energia de jammer.

# text
seg-e353fdee7033 = Uma versão de correção sobre a { "0.29.1" }. Remove código duplicado nos módulos de mensagem de navegação LEO, de fusão e de espetro, acrescenta um tema claro a kshana.dev, move o Kshana Studio para o seu próprio endereço, torna o site legível por motores de pesquisa e por assistentes de IA, corrige várias pequenas coisas no Studio e permite que as versões npm sejam publicadas sem um token guardado. Nenhuma saída do motor muda: todos os cenários incluídos dão um resultado idêntico byte a byte ao da { "0.29.1" }, exceto a marca de versão.

# text
seg-e8bf0a4fdc35 = <b>Um tema claro para kshana.dev.</b> Todas as páginas podem ser lidas em modo claro ou escuro. O site segue a definição do sistema do leitor e tem um interruptor para a alterar.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: llms.txt
# c4: llms-full.txt
seg-8e7cabc14c40 = <b>Os motores de pesquisa e os assistentes de IA conseguem ler o site.</b> Cada página tem agora o seu próprio título, descrição, endereço canónico, etiquetas de cartão social e dados estruturados schema.org, e texto simples para as secções que um script desenha. O site publica <c1/>, um <c2/> com a data da última alteração de cada página, <c3/> e <c4/> (um guia curto e um guia completo em texto simples para assistentes de IA), e uma chave IndexNow para que uma publicação possa indicar aos motores de pesquisa o que mudou.

# text
# c1: NPM_TOKEN
# c2: docs/RELEASING.md
seg-804ba71be9ed = <b>As versões npm podem ser publicadas sem um token guardado.</b> A tarefa npm executa agora Node { "24" } e npm { "11.5.1" } ou posterior, que suportam a publicação fidedigna do npm: o npm troca a identidade GitHub da tarefa de versão por uma credencial de curta duração. O segredo <c1/> continua a funcionar e é usado enquanto estiver definido, pelo que nada muda até a publicação fidedigna ser ativada para o pacote em npmjs.com. <c2/> enumera os passos.

# text
seg-81405e5a5e06 = <b>O título da página inicial é legível sobre o globo.</b> Uma sombra suave fica agora por trás do título e do seu texto, esbatendo as linhas de órbita e os pontos de satélite do globo animado onde o cruzam.

# text
# c1: /playground/
seg-24b8363acc14 = <b>O Kshana Studio tem o seu próprio endereço: <a1>https://kshana.dev/studio/</a1>.</b> Todas as ligações do site e da documentação apontam para lá. O endereço antigo, <c1/>, continua a funcionar e reencaminha para o novo, mantendo na ligação o cenário, a vista e as restantes definições.

# text
seg-12f223b986bd = <b>Correções do Studio.</b> O ficheiro do motor é descarregado uma vez em vez de duas. Enquanto é descarregado, o Studio mostra de imediato o resultado registado do cenário, identificado como registado, em vez de um ecrã vazio. Num telemóvel, o cabeçalho é uma única linha compacta. Os valores principais são dispostos dois por linha, pelo que nenhum fica escondido fora do lado do ecrã. As etiquetas dos campos usam as palavras do próprio cenário, com o nome do campo a seu lado, e a pesquisa encontra campos por qualquer um deles.

# text
# c1: downsample_grid
# c2: navsignal::simpson
# c3: leo_link::geometry
# c4: leo_fusion::geom
# c5: scenarios/
seg-c130d8a4dc5e = <b>Menos código duplicado.</b> A tabela de unidades da mensagem de navegação LEO escrevia as mesmas dez linhas de estatísticas SISRE para quatro resumos de ajuste. Uma macro escreve-as agora uma só vez. Os dois gráficos em cascata de espetro partilham um eixo de tempo, uma barra de cor e um painel de barra de C/N0. A subamostragem da grelha principal reutiliza <c1/>, e o integral de Simpson reutiliza <c2/>. Os dois pontos de entrada do tipo de cenário de passagem LEO partilham um passo de configuração. <c3/> importa os auxiliares vetoriais de <c4/> em vez de os copiar. O relatório avançado importa o escape de HTML do relatório da API em vez de o copiar. Cada um dos { "139" } ficheiros de cenário em <c5/> foi executado na { "0.29.1" } e com este código, e todos os ficheiros de saída são idênticos byte a byte.

# text
# c1: src/leo_navmsg/units.rs
# c2: src/leo_fusion/pvt_units.rs
# c3: PVT_UNITS
# c4: sonar-project.properties
# c5: tests/sonar_cpd_exclusions_are_justified.rs
seg-166b0435c96f = <b>As tabelas de unidades de leo-navmsg e leo-pvt têm os seus próprios ficheiros.</b> Saíram de módulos que também contêm lógica, para <c1/> e <c2/>. <c3/> mantém o seu caminho público. Apenas estes dois ficheiros de tabelas se juntam às isenções de deteção de copiar e colar para catálogos declarativos em <c4/>, que <c5/> verifica.

# text
# c1: event=push
seg-f8b372e08ef9 = <b>O emblema de CI do README mostra o resultado dos pushes para main.</b> O emblema contava execuções de todos os eventos em main, pelo que podia indicar "failing" enquanto todas as execuções de push estavam verdes; agora pede apenas execuções de push (<c1/>).

# text
seg-7c41a482c7d8 = Uma versão de correção sobre a { "0.29.0" }: o valor de cobertura medido, a linha com o nome do projeto em kshana.dev, uma tarefa de cobertura mais rápida e um README renovado. Nenhuma saída do motor muda: todos os cenários dão o mesmo resultado que na { "0.29.0" }.

# text
seg-997490bd1696 = Revisões de números publicados

# text
# c1: db796dd
# c2: 95.35 %
# c3: src/
# c4: b1d350d
# c5: tests/coverage_figure_doc_sync.rs
# c6: docs/COVERAGE.md
seg-ed4b071e4bd9 = <b>Cobertura de linhas: ~{ "96" } % → ~{ "95" } %.</b> A tarefa de cobertura voltou a medir o código da { "0.29.0" } publicada (commit <c1/>, execução de CI { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } de { "58,697" } linhas de <c3/>. O valor publicado era { "95.63" } % ({ "37,697" } de { "39,419" } linhas), medido em <c4/> antes da { "0.28.0" }; arredondava para ~{ "96" } %. O novo valor arredonda para ~{ "95" } %, pelo que todas as superfícies que <c5/> fixa mudam em conjunto: <c6/>, o emblema do README, a linha de evidências e a tabela de CI, os emblemas do crates.io, do PyPI e do npm, o relatório técnico e a página de cobertura de kshana.dev. O mínimo de { "85" } % mantém-se.

# text
# c1: web/fonts/
# c2: web/fonts/FONTS.json
# c3: web/tools/fetch_third_party.py
# c4: text=
seg-577baa03af04 = <b>A linha com o nome em kshana.dev.</b> "Kshana · क्षण · the precise instant" abre agora o cabeçalho principal da página inicial e fica sob a marca no rodapé de todas as páginas. O kshana.dev continua a não fazer qualquer pedido a outro anfitrião: o devanágari é um subconjunto Noto Sans Devanagari alojado no próprio site, com as três letras de क्षण ({ "1,692" } bytes, <c1/>, com o texto da sua SIL Open Font License e o seu SHA-256 em <c2/>). <c3/> aprendeu a guardar um subconjunto <c4/> do Google Fonts com um nome de ficheiro endereçado por conteúdo.

# text
# c1: /evidence#research
# c2: /docs/changelog
# c3: /
# c4: .html
# c5: ROADMAP.md
seg-35b5bc4ee466 = <b>As ligações do site aterram onde apontam, em endereços limpos.</b> Uma ligação para uma secção coloca agora essa secção logo abaixo do cabeçalho, num telemóvel e num computador de secretária: uma ligação para um setor de Missions abre esse setor com o seu painel no topo; as ligações de Capabilities e de Editions mantêm o seu lugar enquanto os gráficos acima delas são desenhados; Editions deixa de acrescentar um segundo desvio de cabeçalho; e uma ligação para uma parte recolhida de uma página da documentação abre-a. Todas as páginas são ligadas pelo seu endereço limpo (<c1/>, <c2/>, <c3/> para a página inicial), e as ligações canónicas, o mapa do site e os redirecionamentos dos endereços antigos indicam os mesmos; os endereços <c4/> continuam a funcionar. A secção Research tem a sua própria ligação no cabeçalho, entre Evidence e Developers, e no rodapé. A documentação deixa de mostrar o roteiro (<c5/> continua no repositório): o grupo Project é Changelog, Licensing, Security, Contributing, Governance e Code of conduct, e o Glossary passou para Get started.

# text
seg-3da9f00f5ce6 = <b>A tarefa de cobertura é mais rápida.</b> Na { "0.29.0" } demorou { "143" } minutos, face a uns saudáveis { "91" } a

# text
# c1: tests/property.rs
# c2: determinism
# c3: advanced_report
# c4: animation
# c5: tests/support/corpus.rs
# c6: determinism
# c7: KSHANA_CORPUS_THREADS=1
seg-85d502773367 = O fuzzer <c1/>, a causa da última vez, ocupou { "4" } deles. O corpus incluído passou de { "74" } para { "139" } cenários, e três binários de teste percorriam-no todo, um ficheiro de cada vez (<c2/> duas vezes, <c3/> e <c4/> uma vez): { "37" } minutos no total sob instrumentação de cobertura, face a { "3" } na { "0.27.2" }. Agora partilham <c5/>, que executa o trabalho por cenário em todos os núcleos e devolve os resultados por ordem; todos os cenários e todas as asserções se mantêm. Num portátil arm64, compilação de depuração: <c6/> demora { "143" } s em { "14" } núcleos face a { "612" } s com <c7/> (o antigo percurso em série).

# text
# c1: tools/capture_site_shots.mjs
# c2: tools/readme_shots.py
# c3: docs/assets/readme/site/SHOTS.json
seg-bb69dbadbc81 = <b>O README, renovado.</b> Abre com a mesma linha de nome do site; as capturas de ecrã do Studio foram refeitas a partir do Studio da { "0.29.1" }, com uma nova do Studio num telemóvel e da sua barra de passos inferior; uma nova faixa "The site" mostra três páginas de kshana.dev da compilação da { "0.29.1" } (<c1/>, compostas por <c2/> e registadas em <c3/>); o valor de cobertura indica ~{ "95" } %; e o texto alternativo da figura de investigação, que repetia o da figura de arquitetura, descreve agora os artigos. Os emblemas do cabeçalho são mais pequenos e mais curtos ({ "18" } px de altura; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), pelo que os onze cabem em duas linhas; todas as ligações e todos os textos alternativos mantêm o seu significado completo.

# text
# c1: kshana-mcp
seg-f61ef3e16884 = <b>A tarefa da imagem de contentor passa a ter { "90" } minutos.</b> Em { "v0.29.0" }, a compilação linux/arm64 emulada da imagem <c1/> atingiu o antigo limite de 45 minutos ao compilar o seu último crate, pelo que a imagem, a entrada no registo MCP e a verificação do canal não foram publicadas. O limite é agora de { "90" } minutos; a imagem não muda.

# text
# c1: src/ephem.rs
# c2: src/sgp4.rs
# c3: 0.323_273_64
# c4: 0.323_273_640
# c5: _64
# c6: _32
# c7: f64
# c8: f32
seg-1688bf9f0fec = <b>Oito literais de vírgula flutuante reagrupados</b> em <c1/> e <c2/> (<c3/> → <c4/>): o SonarQube Cloud lia um último grupo de <c5/> ou <c6/> como um sufixo <c7/> ou <c8/> em falta (regra S7454). Os valores são os mesmos números, pelo que todos os resultados ficam inalterados.

# text
seg-81fd160937db = Doze novos tipos de cenário e três novas formas de ler uma execução. O motor passa a abranger o espetro de radiofrequência, todo o sistema solar, constelações em torno de qualquer corpo, campanhas que encadeiam cenários numa só missão e posicionamento, navegação e temporização (PNT) a partir da órbita terrestre baixa (LEO), do sinal à solução de posição. Cada execução pode também ser escrita como uma animação, um relatório completo e um conjunto de ficheiros de interoperabilidade para outras ferramentas.

# text
seg-118be64d7cb2 = Em torno do motor: um kshana.dev redesenhado (um site de várias páginas e um novo painel Kshana Studio que executa todas as capacidades no navegador), um README reescrito, catorze ferramentas no servidor do Model Context Protocol (MCP), uma compilação para navegador que dá os mesmos números que a nativa e uma página pública para o Kshana Pro.

# text
seg-ea31356bc17d = Ficheiros de cenário (mais um manifesto de conjunto)

# text
# c1: kshana example
seg-26654cd81de1 = { "138" }, dos quais { "132" } estão incluídos para <c1/>

# text
seg-3d1a85e93e48 = dos quais MODELLED (modelo declarado, verificado quanto à consistência interna)

# text
seg-e77f9d273ee1 = dos quais PARTNER (requer equipamento ou dados de um parceiro)

# text
seg-e94cd6b3561a = De onde vem o crescimento:

# text
seg-1759a8cce7d6 = Tipos de cenário

# text
seg-94de9433d99f = Ficheiros de cenário

# text
seg-03d7aea335dc = Linhas da matriz (validadas + modeladas)

# text
seg-fdd674722717 = Espetro

# text
seg-59583fa40da3 = Sistema solar e posicionamento em torno de qualquer corpo

# text
seg-fafa167623df = Cenários marítimos, rodoviários e ferroviários

# text
seg-fc571c46e522 = Animação, relatórios, exportações de interoperabilidade

# text
seg-2746e0d9f787 = Projetos de sinal LEO e o espetro multibanda

# text
seg-d40ec114d1f9 = Posicionamento, temporização e fusão em LEO

# text
seg-0157f649e65b = Cadeia LEO de ponta a ponta

# text
seg-423283112128 = Cenários LEO de resiliência, de área de foco e de utilizador final

# text
seg-395beca13299 = Total acrescentado

# text
# c1: src/celeste_iod.rs
seg-ea9dc4093d8a = A capacidade LEO é independente de qualquer sistema: funciona com parâmetros genéricos e declarados e não precisa de nenhum sistema com nome. Os sistemas com nome são predefinições opcionais, cada uma no seu próprio ficheiro com a sua fonte pública. Uma predefinição, o Celeste IOD (demonstração em órbita), usa valores apresentados no workshop LEO-PNT do ESA NAVISP, { "2026" } (ESA é a Agência Espacial Europeia; NAVISP é o seu Programa de Apoio e Inovação em Navegação); vive num só ficheiro, <c1/>, com os seus cinco cenários só de repositório, pelo que pode ser retida sem uma alteração ao código-fonte, e nenhum dos seus valores do workshop é repetido neste registo de alterações.

# text
# c1: ephemeris
seg-c36a5015c03c = <b>Leia "Revisões de números publicados" antes de atualizar.</b> Uma saída do motor muda (as colunas de referencial inercial do tipo de cenário <c1/>, após a correção de um sinal na matriz de nutação), e a auditoria da documentação corrigiu valores que documentos anteriores tinham impresso.

# text
seg-7fe505d3232b = Estados: <b>VALIDATED</b> significa verificado face a uma referência externa independente (uma tabela publicada, o software de outro grupo ou dados medidos); <b>MODELLED</b> significa um modelo declarado verificado apenas quanto à consistência interna; <b>PARTNER</b> significa que a verificação requer equipamento ou dados de um parceiro.

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
seg-81799e2a0c43 = portadora de desvio binário alternativa; portadora de desvio binário; modulação por deslocamento de fase binária; portadora de desvio binário multiplexada (modulações de sinal)

# text
seg-b2d165acb4e7 = ATOMIC

# text
seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (um modelo de efemérides LEO publicado)

# text
seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

# text
seg-7f71a4795674 = código de aquisição grosseira e os nomes das portadoras e dos sinais civis do Global Positioning System

# text
seg-e464509f3abb = relação portadora-densidade de ruído

# text
seg-d8ba917c09b8 = CIO

# text
seg-4321532214e3 = Celestial Intermediate Origin

# text
seg-de6c33774c9c = CLI

# text
seg-3096eb1d5a15 = interface de linha de comandos

# text
seg-9aa3c2e54398 = verificação de redundância cíclica de 24 bits (polinómio da Qualcomm)

# text
seg-1e1009e225aa = CSAC

# text
seg-6ff440ff2c0c = CSS, HTML, SVG, XML

# text
seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

# text
seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

# text
seg-b4758ea40624 = valores separados por vírgulas; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; localizador uniforme de recursos

# text
seg-3ad592244ea8 = onda contínua

# text
seg-287014fdc28d = CZML, KML, GeoJSON

# text
seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (formatos de mapa e de globo)

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
seg-544f4fcbd68f = o nome de uma posição na tabela da constelação do Global Positioning System

# text
seg-dd9cfd581e5d = ECEF

# text
seg-1a59ad88eca9 = centrado na Terra e fixo à Terra

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
seg-399a11a6e7c7 = Agência Espacial Europeia; o seu Programa de Apoio e Inovação em Navegação

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
seg-81f742947af1 = o sistema global de navegação por satélite da Rússia

# text
seg-d2a107373b59 = GNSS, GPS

# text
seg-d703f29c82eb = sistema global de navegação por satélite; Global Positioning System

# text
seg-1df73b95ae4d = IAU

# text
seg-0461e1933d23 = União Astronómica Internacional

# text
seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

# text
seg-a54e0f483ad5 = documento de controlo de interface; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

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
seg-41471e51e661 = a especificação de interface do Global Positioning System

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Estação Espacial Internacional

# text
seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

# text
seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo fixo à Terra; equador verdadeiro, equinócio médio (referenciais)

# text
seg-8f1cbbae84aa = ITU, ITU-R

# text
seg-d1b7680b4762 = União Internacional das Telecomunicações; o seu Setor das Radiocomunicações

# text
seg-a524e4c4a670 = relação jammer-sinal

# text
seg-5d93361e20d4 = J2 to J6, J2000

# text
seg-50255586b303 = harmónicas zonais do campo gravítico; a época 2000-01-01 { "12" }:{ "00" }

# text
seg-368f7969b33a = JPL

# text
seg-44db8a7ae8f7 = Jet Propulsion Laboratory

# text
seg-e0e589aaa8fe = LEO, MEO

# text
seg-f4b580b88664 = órbita terrestre baixa; órbita terrestre média

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
seg-c19b5f77acc5 = posicionamento, navegação e temporização; posicionamento preciso de pontos

# text
seg-dd94b086ed4b = PSD, SSC

# text
seg-6e937d7e984e = densidade espetral de potência; coeficiente de separação espetral

# text
seg-e0421c657cc1 = RAIM, SQM

# text
seg-d6fee8d2ce49 = monitorização autónoma da integridade pelo recetor; monitorização da qualidade do sinal

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
seg-9ead536db4aa = Simplified General Perturbations { "4" } (o modelo orbital dos conjuntos de elementos de duas linhas)

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8c718f7f9f5d = SigMF

# text
seg-7830c93a5803 = Signal Metadata Format

# text
seg-d282e836d47b = SISRE

# text
seg-3c48d3ad7b43 = erro de alcance do sinal no espaço

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
seg-f4fca0494aae = Systems Tool Kit (o seu formato de ficheiro de efemérides <c1/>)

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-1043491566b5 = SVID

# text
seg-d67f9665f054 = identificador de veículo espacial

# text
seg-de4e841ce8a2 = o total de satélites, planos e faseamento de uma constelação Walker

# text
seg-4d6ebfefc096 = TEC

# text
seg-5149401781dd = conteúdo eletrónico total

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = ultra-alta frequência

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
seg-d6a3f210958a = Um número publicado que mude é uma revisão e fica registado, nunca corrigido em silêncio. Esta versão traz uma revisão a uma saída do motor e várias a valores impressos na documentação.

# text
seg-1669eb4224f1 = Saída do motor

# text
seg-185961ebab61 = A redução TEME→GCRS rodava em { "2" }·Δψ: a matriz de nutação tinha o sinal de Δψ invertido.

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
seg-504b78f30c54 = <c1/> construía <c2/> onde o <c3/> do SOFA constrói <c4/>, pelo que <c5/>, <c6/>, <c7/> e <c8/> rodavam o dobro da nutação em longitude, cerca de { "25" } segundos de arco. Todas as verificações da cadeia eram testes de propriedades (rotação própria, ida e volta, uma contribuição de nutação não nula) que um erro de sinal satisfaz; o teste de Vallado de ponta a ponta cobria TEME→PEF, TEME→ITRF e GCRS→ITRS, mas não TEME→GCRS. No exemplo de Vallado (AIAA 2006-6753, 2004-04-06), a cadeia falhava o GCRF publicado em { "1 145" } m; agora fica a { "0.11" } m dele, e a matriz é igual ao <c9/> do ERFA a { "1e-14" }. <c10/> e <c11/> falham ambos com o sinal antigo. O teste de consistência do CIO (Celestial Intermediate Origin) em <c12/> tinha atribuído a discordância resultante de ~{ "130" } m a "≈ { "2" }·EE"; o resíduo é agora de { "5" } cm e o seu limite foi apertado de { "250" } m para { "1" } m. <b>Isto altera números publicados, registados aqui como uma revisão:</b> as colunas <c14/> e <c15/> do tipo de cenário <c13/> (cerca de { "0.8" }–{ "1.0" } km para o cenário ISS (International Space Station) incluído; as suas colunas TEME, fixas à Terra, de traço no solo, de ângulos de visada e de Doppler não mudam), e <c16/> / <c17/> para os referenciais GCRS e ITRS. Nenhuma linha de resumo, gráfico ou hash de referência de nenhum cenário incluído lê estas colunas. As novas exportações de interoperabilidade usam a cadeia corrigida: a posição CZML do primeiro satélite <c18/> concorda com uma redução ERFA do mesmo TLE (propagado pelo pacote Python <c19/>) a { "2.3" } cm.

# text
# c1: leo-navmsg
# c2: leo-navmsg
# c3: navmsg
# c4: leo-pnt-chain
# c5: docs/LEO-NAVMSG.md
# c6: 0x110315
# c7: 0x19105F
# c8: leo-navmsg-fit-interval-trade
seg-a0a4026d22ed = <b>O tipo de cenário <c1/>, nativamente e na compilação para navegador.</b> O tipo de cenário calcula agora todas as funções transcendentes através de uma única biblioteca matemática portável, pelo que a sua trama tem os mesmos bytes em todas as plataformas e em todas as compilações (em Fixed). Todos os valores de <c2/> mudam com isso, assim como a fase <c3/> de <c4/>. O tipo de cenário é novo nesta versão, pelo que nada de uma versão anterior muda, mas mudam valores impressos antes da correção: o valor de verificação de <c5/> para o cenário de codificação e descodificação era <c6/> e é <c7/>, e o seu SISRE da mensagem descodificada é { "0.129" } cm. Em kshana.dev, o cartão de Missions para <c8/> mostrava um pior erro de alcance de { "1.6" } mm com um ajuste de { "60" } s e { "40.3" } mm com um ajuste de { "900" } s; o site é agora construído a partir do motor desta versão e mostra { "1.8" } mm e { "46.6" } mm.

# text
# c1: maritime-strait-jamming
seg-77f441bfc3c3 = <b>O mapa da pegada de jamming em kshana.dev (Missions).</b> Cada uma das suas { "875" } células é uma execução de <c1/> em que apenas muda a posição do recetor. As células são agora calculadas a partir das mesmas coordenadas com três casas decimais que a ligação "abrir esta execução" da célula entrega ao Kshana Studio, pelo que uma célula mostra exatamente o que a sua ligação reproduz. A relação média jammer-sinal (J/S) de { "30" } células muda em { "0.1" } dB, para cima ou para baixo; a disponibilidade de seguimento de nenhuma célula muda. O motor dá resultados idênticos para todas as células na { "0.28.0" } e na { "0.29.0" }.

# text
# c1: quantum-anomaly-detect
# c2: [0.9901265, 0.9938305]
# c3: [0.99035875, 0.993861]
seg-146588a39e7c = <b>Reamostragem com semente no pacote WebAssembly (WASM).</b> A compilação para navegador extraía índices de bootstrap e de permutação diferentes dos da compilação nativa a partir da mesma semente (em Fixed). O intervalo <c1/> da área sob a curva no navegador era <c2/> e é agora o nativo <c3/>. Nenhum número nativo muda.

# text
seg-017810049453 = Valores impressos na documentação

# text
seg-85ab2a364a37 = A documentação foi auditada palavra a palavra face a execuções do motor desta versão. Quando um valor impresso não coincidia com a execução, o documento foi corrigido, e cada correção está aqui listada, antigo → novo. Em todos os casos abaixo a saída do motor não mudou; o documento tinha-a lido mal, arredondado mal ou ficado desatualizado.

# text
# c1: docs/SOLAR-SYSTEM.md
# c2: docs/CONSTELLATION-DESIGN.md
# c3: leo-pnt-mega-shell
seg-1eacdefbfda2 = <b>Auditoria da documentação das páginas de espetro, constelação, campanha, animação, relatório e interoperabilidade, e um novo <c1/>.</b> Todos os valores foram executados de novo com este motor. Dois números publicados mudam: <c2/> indicava o teste de cobertura de { "5" } 000 satélites como "cerca de { "0.13" } s numa compilação de depuração"; isso não se reproduziu ({ "1.24" } s num portátil sobrecarregado), pelo que a página indica agora a parcela do pré-filtro que o teste imprime ({ "9.9" } % de { "19 440 000" } testes de pares) e os { "0.14" } s do binário de lançamento para o <c3/> incluído. A mesma página indicava o cruzamento do E3F como "desviado { "0.050" } deg"; nenhum teste imprime esse valor, pelo que a página indica agora apenas o limiar de { "0.06" } deg que o teste impõe e a derivação de { "7.30" } face a { "7.36" } deg que está por trás dele. Nenhuma saída do motor muda.

# text
seg-2ad182e2db15 = Documentos LEO-PNT: valores publicados revistos (executados de novo no motor desta versão).

# text
# c1: docs/LEO-SIGNAL.md
# c2: generic-s
# c3: generic-c-wide
# c4: docs/LEO-NAVMSG.md
# c5: docs/LEO-PASS.md
seg-6c2401365dd5 = Compromisso de bandas em <c1/>: o atraso ionosférico de primeira ordem de <c2/> é { "3.24" } m (estava impresso { "3.25" } m) e o de <c3/> é { "0.77" } m (era { "0.78" } m). Codificação e descodificação em <c4/>: o SISRE da mensagem descodificada estava impresso como { "0.119" } cm quando a execução dava { "0.122" } cm; a página imprime agora { "0.129" } cm, o valor após a correção de independência de plataforma em Fixed, abaixo. Passagem LEO face a GNSS em <c5/>: menos { "32" } dB de perda em espaço livre no pico da passagem (era "{ "26" } a { "32" } dB"). Quanto aos valores de sinal e de passagem, a saída do motor não mudou; os documentos tinham-na lido mal ou arredondado mal.

# text
# c1: /kshana-run
# c2: <scenario>.table.csv
# c3: leo-navmsg
# c4: telecom-timing
# c5: docs/tutorials/README.md
# c6: commands/kshana-run.md
# c7: oem-interop
# c8: docs/examples/multi-tool-pipeline.md
seg-fc3c8ba1b789 = <b>Tutoriais, o exemplo de pipeline trabalhado e o comando <c1/>, auditados face ao motor desta versão.</b> Revisões de valores publicados, antigo → novo: os tipos de cenário que escrevem <c2/> são seis, não quatro (faltavam <c3/> e <c4/>; <c5/>, <c6/>); o cruzamento ½bT² de átomos frios no Tutorial { "3" } é { "18,443" } s, não { "18,440" } s; o erro de ida e volta de <c7/> em <c8/> é o valor medido de { "4.88e-7" } km, não "~{ "1e-7" } km"; a banda de holdover do CSAC no Tutorial { "2" } é a de { "2000" }–{ "3200" } s que o teste afirma, não "~{ "2600" }–{ "4400" } s"; o Tutorial { "1" } cita as linhas SP3 e o bloco de geometria com a precisão com que o motor os escreve. Nenhuma saída do motor mudou.

# text
seg-4c613cabb87b = Páginas de validação, quântica, SGP4, animação, alegações e integridade.

# text
# c1: docs/VALIDATION.md
# c2: orbit-gnss-challenged
# c3: docs/QUANTUM.md
# c4: docs/SGP4-VALIDATION.md
# c5: docs/ANIMATION.md
# c6: docs/CLAIMS-VS-REALITY.md
# c7: docs/INTEGRITY.md
seg-c49d5cdb36e1 = <c1/>: o limiar imposto sobre o desvio de Allan simulado a um segundo de um relógio de ruído de frequência branco é { "20" } % (estava impresso { "25" } %; o limiar de { "25" } % é o da curva a { "1" }, { "10" } e { "100" } s); a linha do passeio aleatório de velocidade indica agora o seu limiar imposto de { "20" } % ao lado dos cerca de { "12" } % observados; e a disponibilidade do relógio atómico à escala de chip em <c2/> é cerca de { "0.73" } (estava impresso cerca de { "0.83" }). <c3/>: o ruído por disparo limitado por vibração no exemplo trabalhado de átomos frios da página é cerca de { "46" } vezes o seu piso de ruído de disparo (estava "~{ "45" }×"; recalculado { "46.49" }), e o intervalo "{ "1" }–{ "50" } µg/√Hz" para dispositivos em campo, que contradizia um dispositivo que a própria página cita, é substituído pelos valores publicados dos dois dispositivos citados. <c4/>: a pior diferença de posição é { "4.12" } mm (estava "≈ { "4" } mm"), com o satélite identificado. <c5/>: o exemplo do codificador de vídeo lia os fotogramas de { "24" } fotogramas por segundo a { "12" }; agora usa { "24" }, a taxa que o manifesto de fotogramas indica. <c6/>: o modelo de jamming tem { "10" } testes (eram { "8" }), e o "{ "2.97" } m face a { "48.8" } m" do filtro acoplado é substituído pelo que o seu teste afirma (o erro de posição acoplado abaixo de { "0.6" } vezes o desacoplado, ganhando em pelo menos { "90" } de { "100" } ensaios). <c7/>: a marca "Today" indicava { "v0.22.0" }; agora indica esta versão, e duas capacidades construídas entretanto (o modo de falha à escala da constelação e a mensagem de suporte de integridade) saem da sua lista de lacunas.

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
seg-4fde8788f95f = <b>Tipo de cenário <c1/>: um modelo de espetro de banda L e cascata</b> (<c2/>, <c3/>, <c4/>). Toda a banda L do GNSS como uma única densidade espetral de potência (PSD): GPS L1 de aquisição grosseira (C/A) e L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (portadora de desvio binário multiplexada, MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), um piso de ruído kT com um fator de ruído do recetor, e jammers de onda contínua (CW), de banda estreita, de varrimento (chirp) e de ruído adaptado numa cronologia programada. Cada jammer é avaliado por banda pelo seu coeficiente de separação espetral (SSC), dando a relação jammer-sinal (J/S) e a densidade portadora-ruído (C/N0) efetiva por banda e por linha. O gráfico é uma cascata SVG com barras de C/N0; o result.json contém a grelha com média de blocos em potência. <c5/> opcional desenha o modelo como amostras IQ, escreve e lê uma gravação Signal Metadata Format (SigMF) (<c6/>, <c7/>) e compara uma estimativa de Welch com o modelo; <c8/> opcional estima um ficheiro SigMF real. Exemplo incluído <c9/>: um chirp apanha o L1 C/A e o E1 aos { "10" } s, um tom CW na portadora L1 mantém o C/A em { "17.98" } dB-Hz depois de o chirp parar enquanto o E1, cujo espetro tem um nulo aí, recupera; o L5 e o E5a ficam intocados.

# text
seg-fa9976349886 = Nova linha VALIDATED: as PSD e os SSC dos sinais, face ao lóbulo principal de BPSK(n) de 2n x { "1.023" } MHz, aos lóbulos de BOC({ "1,1" }) centrados em +/-1.023 MHz, às formas fechadas de Parseval por trás dos SSC publicados de -61.8 / -64.8 / -67.8 dB/Hz, e ao Q = { "1" } (CW) e { "1.5" } (adaptado) dos manuais. O máximo da PSD de BOC({ "1,1" }) está em +/-0.759 MHz, não no centro do lóbulo; o teste fixa ambos.

# text
# c1: jamming
seg-411431a9b26b = Duas novas linhas MODELLED: a cascata e a cronologia de C/N0, que se reduzem exatamente à cadeia do tipo de cenário <c1/> (verificadas em cruzamento em todos os relatórios), e o codec SigMF e o estimador de Welch. Nenhuma gravação de terceiros está no repositório.

# text
# c1: navsignal
# c2: spectral_separation_coeff_offset
seg-5c5c695e7c0a = <c1/>: uma variante MBOC e <c2/>.

# text
# c1: jamming
seg-bb346f4942a9 = O relatório imprime o C/N0 que a tabela Q representativa do tipo de cenário <c1/> daria, ao lado do derivado do espetro; para um tom CW na portadora C/A diferem em { "1.8" } dB. Três novas linhas da matriz: uma validada (espetros de sinal e coeficientes de separação espetral) e duas modeladas.

# text
seg-673dfe048dad = <b>Efemérides do sistema solar e posicionamento em torno de qualquer corpo.</b> Dois novos tipos de cenário.

# text
# c1: solar-system
# c2: scenarios/solar-system-tour.toml
seg-3e1b0e8e99e9 = <c1/>: o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã numa época: posição e velocidade heliocêntricas no International Celestial Reference Frame (ICRF), parâmetro gravitacional, raios, J2 (a segunda harmónica zonal) quando publicado, rotação sideral, o polo e o meridiano de origem da União Astronómica Internacional (IAU), uma trajetória orbital ao longo de uma revolução, e o tempo de luz, o alcance de ida e de ida e volta, o atraso de Shapiro solar e a separação do Sol a partir de um corpo observador e para qualquer ligação adicional. Os planetas provêm dos elementos keplerianos do Jet Propulsion Laboratory (JPL) de Standish e Williams (Tabela { "1" }, { "1800" } AD a { "2050" } AD; Tabelas 2a/2b, { "3000" } BC a { "3000" } AD); as luas, dos elementos médios do JPL com a taxa de rotação síncrona da IAU, e Titã, do modelo de rotação da IAU. Exemplo: <c2/>.

# text
# c1: body-pnt
# c2: scenarios/mars-orbit-pnt.toml
# c3: scenarios/europa-surface-pnt.toml
seg-6a094973208b = <c1/>: um orbitador ou um módulo de aterragem à superfície em torno de qualquer um desses corpos, a navegar com pseudo-distâncias de uma constelação Walker em torno do corpo e com um alcance de ida e volta sem relógio a partir da Terra; diluição da precisão, incerteza formal e soluções de posição por mínimos quadrados com semente, com e sem a ligação à Terra. Exemplos: <c2/>, <c3/>.

# text
# c1: Body
# c2: AnalyticSolarSystem
# c3: EphemerisProvider
seg-ed5063379a8b = <c1/> passa a incluir Mercúrio, Vénus, Júpiter, Saturno, Úrano, Neptuno, Plutão e as sete luas, uma pesquisa por nome e um registo físico; <c2/> dá qualquer corpo relativamente a qualquer outro através da interface <c3/> já existente.

# text
# c1: tests/fixtures/solar_system/
# c2: body-pnt
seg-8b5c2fbe91f7 = VALIDATED face ao JPL Horizons (Development Ephemeris DE441; ficheiros de teste e consultas em <c1/>): Mercúrio a Saturno e a Terra a partir da Tabela { "1" } dentro do dobro do erro nominal indicado (pior caso { "1.87" } vezes), todos os oito planetas a partir das Tabelas 2a/2b (pior caso { "1.71" } vezes), e o tempo de luz da Terra a Marte e a Júpiter. MODELLED: Úrano e Neptuno a partir da Tabela { "1" }, que excedem o erro indicado face à DE441 ({ "2.0" } e { "5.2" } vezes), Plutão, as luas, as constantes dos corpos e os resultados de <c2/>.

# text
# c1: src/ephem.rs
seg-a3c83f6d2078 = Constatação: a série lunar de Montenbruck & Gill em <c1/> já está referida ao equinócio J2000 pelo seu próprio termo de precessão ({ "0.05" } graus face ao Horizons), pelo que é usada sem uma rotação de precessão adicional. Seis novas linhas da matriz: duas validadas (posições dos planetas, tempo de luz) e quatro modeladas.

# text
seg-564133d6a0c4 = Constelações em torno de qualquer corpo

# text
# c1: constellation-design
# c2: src/constellation.rs
# c3: solar-system
seg-d1ddb76d8bf3 = <b>Projeto de constelações em escala (tipo de cenário <c1/>, <c2/>).</b> Padrões Walker delta e Walker estrela (T/P/F), listas explícitas de elementos e projetos de várias camadas, várias constelações por execução, em torno da Terra, da Lua, de Marte ou de qualquer outro planeta, de Plutão ou de uma lua importante, a partir das constantes dos corpos acrescentadas pelo tipo de cenário <c3/>. Predefinições a partir de elementos nominais publicados: a linha de base do Global Positioning System (GPS) e a constelação expansível de 24 posições (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), o Galileo Walker 24/3/1 (Open Service Service Definition Document, edição { "1.1" }), a órbita terrestre média do BeiDou Walker 24/3/1 mais satélites geoestacionários e geossíncronos inclinados (Open Service Performance Standard { "3.0" }) e o GLONASS 24/3/1 (Interface Control Document { "5.1" }). Cobertura e diluição da precisão (DOP) numa grelha de latitude/longitude: satélites à vista, GDOP, PDOP, HDOP e VDOP (geométrica, de posição, horizontal, vertical) e disponibilidade por célula, a nível global e no pior local, com um relógio de recetor por constelação. Um pré-filtro de visibilidade (semiângulo de cobertura mais uma banda de latitude subsatélite, exato num corpo esférico) executa { "5 000" } satélites numa grelha de { "10" } deg em cerca de { "0.13" } s numa compilação de depuração.

# text
seg-8f4ebd177f3d = VALIDATED: o gerador Walker reproduz a Tabela { "23" } do SDD do Galileo OS e a fórmula de posições do ICD do GLONASS; a predefinição GPS reproduz a coluna de cruzamento do equador do SPS PS ({ "35" } de { "36" } locais dentro de { "0.0108" } deg; E3F dentro de { "0.06" } deg, sendo a própria linha da tabela inconsistente); a distribuição global de HDOP da linha de base GPS concorda com o Apêndice B do SPS PS (mediana { "0.940" } face a { "0.94" }, { "95" } % { "1.255" } face a { "1.25" }, média { "0.965" } face a { "0.96" }; limiar { "0.03" }).

# text
seg-65658a896a73 = MODELLED: projetos arbitrários, outros corpos, os nós de fase e geossíncronos inclinados do BeiDou, órbitas de dois corpos com J2 opcional, apenas geometria.

# text
# c1: constellation-multi-gnss-coverage
# c2: leo-pnt-mega-shell
# c3: lunar-relay-constellation
# c4: kshana example
# c5: docs/CONSTELLATION-DESIGN.md
seg-3dfe470e8a5c = Cenários: <c1/> ({ "102" } satélites, disponibilidade { "100" } %, PDOP mediano { "0.95" }, { "31.0" } à vista acima de { "10" } deg), <c2/> ({ "5 000" } satélites, disponibilidade { "99.22" } % com PDOP de { "3" } ou menos acima de { "20" } deg, { "0" } % nas calotas polares, o pré-filtro mantém { "11.5" } % dos testes de pares), <c3/> ({ "14" } satélites em torno da Lua, disponibilidade { "21.33" } % no total e máxima sobre a região polar sul). Os três estão incluídos para <c4/>. Notas: <c5/>. Três novas linhas da matriz: duas validadas (gerador Walker e predefinições GNSS, DOP global do GPS) e uma modelada.

# text
seg-79e2d2c42166 = Uma campanha conduzida pelo modelo de espetro, e constelações em torno de qualquer corpo.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: tests/campaign_composition_reference.rs
# c4: constellation-design
# c5: Body::by_name
# c6: solar-system
seg-4ab5f6f6bbbb = <c1/> encadeia o tipo de cenário <c2/> com um holdover de relógio e um monitor de integridade (um chirp apanha o L1 C/A e o E1; um tom CW mantém então o C/A em baixo enquanto o E1 recupera e o recetor recua para um céu apenas Galileo), fixado face ao exemplo de cascata autónomo em <c3/>. <c4/> resolve agora o seu corpo central através de <c5/>, pelo que uma constelação pode ser colocada em torno de qualquer planeta, de Plutão ou de uma lua importante com as constantes que o tipo de cenário <c6/> usa.

# text
# c1: campaign
# c2: src/campaign.rs
# c3: docs/CAMPAIGNS.md
seg-dc904f639fed = <b>Campanhas: muitos cenários compostos numa só execução.</b> Um novo tipo de cenário <c1/> (<c2/>, documentado em <c3/>) executa membros de tipos de cenário existentes através do mesmo despacho da linha de comandos e lê números dos seus resultados. Quatro secções, em qualquer combinação:

# text
# c1: [[phases]]
# c2: carry
# c3: handoff
# c4: end_at
seg-903ee141047a = <c1/>: uma missão encadeada numa só cronologia. As predefinições por tipo de cenário leem o erro de tempo do relógio face ao seu limite de guarda, a relação média efetiva portadora-densidade de ruído (C/N0) face ao piso de seguimento, o nível de proteção vertical face ao limite de alerta, o erro de posição, os satélites em seguimento e as sinalizações de alarme, mantidos numa grelha comum com fronteiras de fase e eventos. O estado é transmitido por <c2/>, <c3/> e <c4/>.

# text
# c1: [sweep]
seg-4eeedde09a77 = <c1/>: de uma a três chaves com pontos de qualquer tipo de cenário, opcionalmente com um conjunto com semente em cada nó.

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
seg-df107253752d = <c1/>: valores partilhados ligados a vários membros, com um resumo combinado do melhor e do pior caso. Cada resultado contém um hash de campanha e um resumo criptográfico de todos os resultados dos membros. Quatro cenários incluídos: <c2/> (nominal, jamming, spoofing terminado na deteção do monitor de relógio aos { "370" } s, holdover a transportar o desvio de { "37.0" } ns do spoofing com uma unidade inercial em navegação por estima, um alarme de integridade, recuperação), <c3/>, <c4/> e <c5/>. <c6/> fixa as identidades da composição: uma campanha de uma só fase reproduz a execução autónoma bit a bit em três tipos de cenário, um conjunto com semente fixa é estável byte a byte e, num relógio de ruído de frequência branco, a média do conjunto fica dentro do intervalo comunicado, com a dispersão dentro do intervalo qui-quadrado de sqrt(q_wf * tau) = { "16.459" } ns. Três novas linhas modeladas da matriz.

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
seg-14b2d3cc9e7c = <b>Exportação de animação (<c1/>, <c2/>, <a1><c3/></a1>).</b> Qualquer execução cujo resultado contenha uma série temporal pode agora ser escrita como um ficheiro Scalable Vector Graphics (SVG) animado (keyframes de Cascading Style Sheets, sem script: os traços desenham-se atrás de um cursor de tempo em movimento), um único leitor HyperText Markup Language (HTML) autónomo (reproduzir e pausar, deslocar, velocidade, todos os painéis num cursor sincronizado, marcadores de eventos que saltam ao clicar; sem recursos externos) ou uma sequência numerada de fotogramas SVG com um <c4/> que indica os fotogramas por segundo, a duração e os tempos dos fotogramas para um codificador de vídeo. Uma campanha é reproduzida como as suas fases com os seus alarmes marcados; uma execução de espetro anima a sua cascata linha a linha. O leitor respeita <c5/>, e com <c6/> tanto o SVG como o leitor mostram a imagem final em vez de se moverem. <c7/> e <c8/> definem a reprodução; <c9/> e <c10/> são os pontos de entrada da biblioteca, e <c11/> ganha um bloco <c12/> apenas quando <c13/> é executado. A saída é uma função pura do resultado e das opções, idêntica byte a byte numa nova execução, sem marca temporal. Um tipo de cenário sem eixo temporal amostrado é recusado com "no time series to animate" e nada é escrito. O exportador desenha as amostras da própria execução e não acrescenta nenhum número, pelo que é MODELLED (consistência interna) e não tem linha na matriz de verificação; nenhum número publicado muda. Testes: <c14/> (determinismo, contagem de fotogramas, nenhum endereço externo, XML bem formado, o caminho de movimento reduzido e todos os cenários incluídos com uma série temporal a animar-se).

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
seg-2662fdb991f3 = <b>Relatórios avançados de execução (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Cada execução da interface de linha de comandos (CLI) escreve agora <c2/>, um relatório HyperText Markup Language (HTML) imprimível, e <c3/>, o mesmo conteúdo como documento JavaScript Object Notation (JSON) legível por máquina. Secções: um resumo executivo; todas as entradas do cenário com a sua unidade, lida do esquema de unidades dos campos (o bloco <c4/> do resultado), ou então do sufixo do nome do campo, ou então indicada como não indicada; os resultados com o gráfico da execução, todos os escalares e um resumo de cada coluna numérica; para uma campanha, a tabela de nós do varrimento, a média de Monte Carlo, o desvio-padrão, os percentis 5.º / 50.º / 95.º e o intervalo de confiança bootstrap com um histograma por métrica, a tabela de fases da cadeia, ou os membros e o resumo combinado da composição (e a grelha de uma execução <c5/> ou <c6/>); uma cronologia de eventos; a etiqueta VALIDATED / MODELLED / PARTNER, a referência independente e as evidências de teste de cada linha da matriz de verificação que os tipos de cenário da execução exercitam, lidas da matriz através de uma correspondência entre tipo de cenário e linha (uma linha que avalia um caminho de entrada, como o caminho Simplified General Perturbations { "4" } (SGP4) de <c7/> ou o caminho de registo medido de <c8/>, só é listada quando a execução seguiu esse caminho, e a linha do leitor da Shuttle Radar Topography Mission (SRTM) não é listada para nenhum tipo de cenário, dado que nenhum campo de cenário lê um mosaico SRTM); as declarações de não modelado e os pressupostos, cada um citado com a sua fonte; e um registo de reprodutibilidade (versão do motor, o commit de origem quando a compilação define <c9/>, resumos Secure Hash Algorithm de 256 bits (SHA-256) do ficheiro do cenário e do documento de resultado, semente, plataforma e o comando exato). O relatório não lê nenhum relógio: o mesmo cenário, a mesma semente e a mesma compilação do motor dão um relatório idêntico byte a byte, e a única marca temporal que pode mostrar é a que <c10/> já escreve. Uma folha de estilo de impressão ajusta-se a A4 e US Letter, repete os cabeçalhos das tabelas e mantém linhas e figuras inteiras entre páginas; um ficheiro Portable Document Format (PDF) é feito com o "Guardar como PDF" do navegador. Não existe a opção <c11/>, porque desenhar os gráficos num PDF exigiria uma dependência nova e pesada. Testes: <c12/> comunica todos os cenários incluídos (nenhuma secção vazia, nenhum texto provisório, etiquetas iguais às da matriz, o resumo do cenário igual ao do ficheiro, idêntico byte a byte numa nova execução) e <c13/> executa de novo o comando registado num diretório novo e exige um <c14/> idêntico byte a byte. Nenhum número publicado muda, e as contagens de tipos de cenário, de ficheiros de cenário e de linhas da matriz ficam inalteradas.

# text
# c1: report.json
# c2: companions
seg-ce45e75c6d67 = <b>O relatório, a animação e as exportações funcionam em conjunto.</b> O relatório avançado ganha uma secção "Animação e exportações": o desenho animado da execução incorporado como imagem inerte (ou o motivo de não existir), ligações para os ficheiros de animação e de exportação escritos a seu lado, e cada formato de interoperabilidade com a indicação de se se aplica, porque não, e a sua especificação; <c1/> contém o mesmo bloco <c2/>. O leitor de animação HTML lista os ficheiros de exportação escritos a seu lado. A interface de linha de comandos (CLI) passa a gerar as exportações antes de escrever o relatório, para que ambos possam nomear os ficheiros.

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
seg-44e7c902490a = <c1/> escreve a geometria do cenário como CZML (a Cesium Language), KML (Keyhole Markup Language { "2.2" }, uma norma do Open Geospatial Consortium, com trajetórias <c2/> com marcas temporais), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) e efemérides Ansys STK (Systems Tool Kit) <c3/> (<c4/>, metros, um ficheiro por objeto em movimento), e o instantâneo IQ (em fase e em quadratura) sintetizado do tipo de cenário <c5/> como um par SigMF (Signal Metadata Format) através do <c6/> existente. <c7/> escreve todos os formatos aplicáveis e imprime porque os restantes não se aplicam; <c8/> comunica sem executar. Os objetos em movimento são escritos no Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) e em longitude, latitude e altura WGS { "84" } (World Geodetic System { "1984" }) fixas à Terra (KML, GeoJSON); os locais fixos em CZML são <c11/>. O tipo de cenário <c12/> acrescenta duas pegadas de jammer a partir das suas próprias equações de ligação. <c13/> escreve um <c14/> GeoJSON nas entradas de trajetória de <c15/>, <c16/>, <c17/> e <c18/>. As exportações são deterministas ao byte e não contêm marca temporal. <c19/> valida todas as exportações face à sua especificação publicada, compara os estados de satélite exportados com os do próprio motor a { "1" } mm e executa todos os cenários incluídos por todos os formatos, cada um a exportar ou a indicar porque não (a tabela em docs/INTEROP.md). Nenhum número publicado muda: a síntese IQ do tipo de cenário <c20/> passou para uma função partilhada e o seu documento de resultado é idêntico byte a byte, e <c21/> ganha <c22/> e <c23/> usados pela sua própria execução. As contagens de tipos de cenário, de ficheiros de cenário e de linhas da matriz de verificação ficam inalteradas. Um cenário de órbita ou de integridade sem <c24/> é datado pelos dados dos próprios satélites: <c25/> é a época mais antiga entre as de TLE (conjunto de elementos de duas linhas), de efemérides de difusão ou de SP3 (Standard Product { "3" }), e cada um desses satélites é rodado para o GCRS e para os referenciais fixos à Terra no seu próprio instante; 2000-01-01T00:{ "00" }:00Z só é usado quando nenhum satélite tem época. As exportações SP3 e OEM (Orbit Ephemeris Message) mantêm a sua etiqueta de 2000-01-01. Para o suportar, são acrescentados <c26/>, <c27/> e <c28/>; nada do que existia os lê.

# text
seg-12c151a800f9 = Navegação em órbita terrestre baixa: sinal

# text
# c1: leo-signal
# c2: spectrum
seg-9b665682695a = <b>Projetos de sinal LEO-PNT e um espetro multibanda.</b> Um novo tipo de cenário <c1/> e um tipo de cenário <c2/> que vai além da banda L: um tipo de cenário, quatro ficheiros de cenário (três incluídos; o ficheiro Celeste IOD é só de repositório) e quatro linhas da matriz (duas VALIDATED, duas MODELLED).

# text
# c1: leo-signal
# c2: data/leo-signals/
# c3: scenarios/leo-band-trade.toml
# c4: scenarios/xona-pulsar-signals.toml
# c5: scenarios/celeste-iod-classical-pilot-signals.toml
# c6: docs/LEO-SIGNAL.md
seg-b355b28bfd1b = <c1/>: projetos de sinal parametrizados de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO) para qualquer sistema (banda, largura de banda de transmissão, atribuição da ITU; componentes de aquisição, de dados e de piloto com espetros BPSK(n), BOC(m,n), MBOC ou planos, partilhas de potência, subportadoras FDMA, comprimentos de código e débitos de dados), a partir de ficheiros de predefinições públicos compilados em <c2/> (Xona Pulsar X1/X5, Iridium STL, um sinal de oportunidade Starlink, CentiSpace, um projeto representativo de banda C e projetos representativos UHF/L/S/C/C larga, cada um a citar o seu URL de origem) ou escritos em linha. Por sinal: a PSD de banda limitada e as frações de potência na banda, a largura de banda de Gabor, o jitter de seguimento de código early-late de banda limitada face ao C/N0 e ao espaçamento (Betz & Kolodziejski { "2009" }) e a exatidão de medição de distância, o espaço de pesquisa de aquisição, a probabilidade de deteção e o tempo médio de aquisição em série e em paralelo de código, o SSC para e a partir do GPS L1 C/A, do Galileo E1, do GPS L5, do Galileo E5a, E5b e do AltBOC com a perda de C/N0, a tolerância de J/S CW, de banda larga e adaptada a partir do código SSC do tipo de cenário de espetro, um compromisso de bandas (atraso ionosférico, perda em espaço livre, medição de distância com o mesmo C/N0 e a mesma EIRP, tolerância a jammers) e verificações opcionais de forma face a uma medição descrita. Exemplos: <c3/>, <c4/>, <c5/> (as bandas e a configuração de sinal do Celeste IOD apresentadas no workshop LEO-PNT do ESA NAVISP, { "2026" }; retidas com a predefinição Celeste IOD, ver "LEO-PNT end to end" abaixo). Notas em <c6/>.

# text
# c1: spectrum
# c2: [[panels]]
# c3: wideband
# c4: bands[].tracked_power_dbw
# c5: bands[].design
# c6: panels
# c7: not_modelled
# c8: scenarios/multi-band-jamming-waterfall.toml
seg-8f58debf721f = <c1/>: as bandas podem agora ser um projeto de sinal predefinido (cada componente desenhado, de banda limitada, com C/N0 e J/S referidos ao componente seguido) ou uma portadora e uma modulação personalizadas; <c2/> acrescentam cascatas sobre outras gamas de frequência numa só cronologia; um jammer <c3/> (barragem) junta-se às quatro formas de onda. O relatório acrescenta <c4/>, <c5/> e <c6/>, e uma entrada <c7/>. As bandas simples dão os mesmos números que antes. Exemplo: <c8/>.

# text
# c1: navsignal
# c2: Modulation::label
seg-98f74d85c54b = <c1/> passa a incluir o seno integral, as formas fechadas da potência de BPSK na banda e da largura de banda de Gabor de banda limitada, o jitter early-late de banda limitada para qualquer espetro e o seu limite de Gabor, a forma fechada do SSC de BPSK com desvio, o espetro AltBOC({ "15,10" }) do Galileo E5 e um analisador de etiquetas de modulação; <c2/> imprime BPSK(1/3) como fração.

# text
# c1: leo-signal
seg-78d9e5e2c615 = Quatro linhas da matriz: formas fechadas de banda limitada VALIDATED ({ "90.3" } % da potência BPSK no lóbulo principal, o jitter a reduzir-se à forma coerente de Kaplan & Hegarty, { "0.0039564" } chips a { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, e ao seu limite de Gabor, e o auto-SSC de BPSK 2/({ "3" } R_c); a forma fechada de Gabor e o SSC com desvio face à sua forma de Parseval são indicados como verificações cruzadas internas); Doppler LEO máximo VALIDATED (Xona X1 { "33.2" } kHz dentro dos { "32" } a { "34" } kHz publicados, Iridium a { "0.5" } kHz de { "36" } kHz); MODELLED <c1/>; espetro multibanda MODELLED.

# text
seg-45d3d4a46d6b = Navegação em órbita terrestre baixa: ligação

# text
# c1: leo-pass
# c2: constellation-design
# c3: [iot]
seg-1d120db87aae = <b>Passagem LEO-PNT e balanço de ligação por banda: o tipo de cenário <c1/>.</b> LEO-PNT é posicionamento, navegação e temporização a partir de satélites em órbita terrestre baixa (LEO). Um utilizador (terrestre, marítimo, aéreo ou em interior, estático ou em movimento) e um ou mais satélites LEO a partir de uma passagem projetada, de elementos explícitos, de um conjunto de elementos de duas linhas (TLE) através do SGP4, ou de uma constelação Walker do código <c2/>. Por satélite, banda e época: ângulos de visada, distância, taxa de variação da distância e aceleração da distância em forma fechada (verificadas em cada execução por diferenças centrais), Doppler e taxa de Doppler, perda em espaço livre, EIRP (potência isotrópica radiada equivalente) com um diagrama de satélite isofluxo, de feixe gaussiano ou plano, uma antena de utilizador de tipo patch, atenuação gasosa ITU-R P.676, atenuação por chuva ITU-R P.838/P.618, cintilação troposférica P.618, perda de penetração em edifícios ITU-R P.2109 para um utilizador em interior, desadaptação de polarização, temperatura de ruído do sistema e C/N0 (densidade portadora-ruído); o atraso ionosférico de primeira ordem por banda a partir de um TEC oblíquo de Klobuchar ou de TEC vertical (conteúdo eletrónico total) abaixo do satélite, e pares de bandas livres de ionosfera com a sua amplificação de ruído. Os satélites Galileo ou GPS são avaliados com o mesmo recetor a partir das potências recebidas dos documentos de interface, pelo que a passagem LEO em forma de sino e as portadoras MEO (órbita terrestre média) planas partilham um gráfico. Uma secção <c3/> dá o tempo até à primeira solução de posição, a energia por solução e a duração da bateria face ao ciclo de trabalho (MODELLED).

# text
# c1: src/celeste_iod.rs
seg-17f3503e1be3 = Independente de qualquer sistema: o motor não precisa de nenhuma predefinição. Predefinições opcionais, cada uma no seu próprio ficheiro e marcada PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP: multibanda genérica (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink como sinal de oportunidade apenas Doppler, CentiSpace e Celeste IOD (demonstração em órbita), cujos parâmetros de sinal foram apresentados no workshop LEO-PNT do ESA NAVISP, { "2026" }, e que vivem em <c1/> para poderem ser retidos (ver "LEO-PNT end to end" abaixo).

# text
# c1: src/leo_link/
seg-a338cc46a1e0 = Blocos de construção públicos em <c1/> (geometry, antenna, itu, iono, energy, presets) para outros módulos chamarem.

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
seg-a20f1602c236 = Nove linhas da matriz. VALIDATED ({ "6" }): coeficientes ITU-R P.838-3 face à sua Tabela { "5" }; atenuação por chuva e cintilação P.618-14 face aos exemplos de validação do Grupo de Estudo { "3" } do ITU-R; perda de penetração em edifícios P.2109 face à folha de cálculo do Grupo de Estudo { "3" }; escalamento ionosférico de primeira ordem face à razão de atrasos de grupo da IS-GPS-200, com a perda em espaço livre; o Doppler máximo de um utilizador estático numa órbita circular face à Tabela { "1" } do arXiv { "2509.19551" }. MODELLED ({ "3" }): a passagem e o balanço de ligação, as predefinições e o orçamento de solução de posição de baixa energia. Um tipo de cenário e seis ficheiros de cenário. Notas em <c1/>.

# text
seg-ef74b0f08aa1 = Navegação em órbita terrestre baixa: mensagem de navegação

# text
# c1: leo-navmsg
# c2: src/leo_navmsg/
# c3: docs/LEO-NAVMSG.md
seg-866ff4ee8b19 = <b>Mensagem de navegação LEO (tipo de cenário <c1/>, <c2/>).</b> A mensagem difundida de efemérides e de relógio de um satélite de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO), para qualquer órbita, portadora e modelo; as predefinições com nome são dados opcionais e todas as capacidades funcionam sem elas. Um tipo de cenário, cinco ficheiros de cenário e nove linhas da matriz (três VALIDATED, seis MODELLED). Ver <c3/>.

# text
seg-c42821b6e855 = Conteúdo da mensagem: SVID, número de emissão dos dados, banda e saúde do sinal; semana, tempo da semana e um polinómio de relógio de segunda ordem; as efemérides num de quatro modelos — o conjunto kepleriano de 16 parâmetros do Galileo OS SIS ICD, esse conjunto mais polinómios de correção ao longo da trajetória, transversais e radiais, o modelo de 22 parâmetros de Liu et al. { "2025" } (doi 10.3390/rs17162894) ou o polinómio ECEF de relógio nulo do ATOMIC — e um conjunto de Klobuchar, coeficientes NeQuick-G com o nível de ionização efetivo, e parâmetros de tempo do sistema para UTC com os casos de segundo intercalar do ICD.

# text
seg-e4565696f162 = Ajustador: uma órbita de referência integrada com gravidade zonal J2–J6 ou EGM2008 e arrasto, um relógio com semente livre ou disciplinado, um ajuste de Levenberg–Marquardt em elementos não singulares, depois polinómios de correção por mínimos quadrados lineares e um relógio ajustado líquido do termo relativista do utilizador.

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
seg-a7287b7b336c = Quatro análises e cenários: <c1/> (erro de alcance do sinal no espaço (SISRE) face ao intervalo de ajuste e ao período de atualização), <c2/> (quatro modelos, bits, e o ajuste de 22 parâmetros do Kshana nas altitudes de Liu et al. ao lado dos valores publicados, MODELLED), <c3/> (continuidade em cada mudança de mensagem numa passagem) e <c4/> (a trama binária documentada do próprio Kshana com CRC-24Q e um orçamento de quantização, um bloco ao estilo RINEX-4 identificado como extensão do Kshana, e uma tabela CSV).

# text
# c1: tests/leo_navmsg_reference.rs
seg-e272dce3d10f = VALIDATED: os pesos de SISRE médio global face à tabela publicada de órbita média e geoestacionária de Montenbruck et al. { "2018" }; o algoritmo de utilizador do Galileo face ao RTKLIB em quatro efemérides de difusão reais do Galileo (<c1/>); o CRC-24Q face ao valor de verificação do catálogo e à trama de exemplo RTCM { "10403" } { "1005" }.

# text
# c1: src/celeste_iod.rs
seg-5c8592195b0d = Predefinições, um ficheiro cada uma com as suas fontes: Xona Pulsar e Pulsar-0, Iridium, Starlink, CentiSpace, um sistema representativo de banda C, ATOMIC e Celeste IOD (a única predefinição que usa material apresentado no workshop LEO-PNT do ESA NAVISP, { "2026" }, mantida em <c1/> com os seus cenários para poder ser retida).

# text
seg-9fb0cbf29cef = Navegação em órbita terrestre baixa: fusão

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
# c5: src/celeste_iod.rs
seg-071f4db017c5 = <b>Posicionamento, navegação e temporização fundidos MEO + LEO: <c1/>, <c2/> e <c3/>.</b> Três novos tipos de cenário em <c4/>, independentes de qualquer sistema: cada constelação é feita de camadas Walker, conjuntos de elementos ou uma predefinição GNSS, cada sinal é uma portadora, uma taxa de chips e uma envolvente de densidade portadora-ruído (C/N0), cada orçamento de erro é um sigma explícito, e os sistemas de órbita terrestre baixa (LEO) com nome são predefinições opcionais, um ficheiro cada uma com as suas fontes marcadas como públicas, de workshop ou derivadas (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), sinais de oportunidade Starlink, CentiSpace, um sistema representativo de banda C, o modelo de efemérides de relógio nulo ATOMIC e uma predefinição de demonstração em órbita ESA Celeste cujos parâmetros derivados do workshop vivem em <c5/> para poderem ser retidos).

# text
# c1: leo-pvt
seg-f28f7a441263 = <c1/> tem quatro modos: posicionamento Doppler (mínimos quadrados em lote sobre a taxa de variação da distância com estados de deriva de relógio e de velocidade, um modo de sinais de oportunidade apenas Doppler, a exatidão ao longo e transversal à trajetória numa única passagem, e a envolvente de Doppler, de taxa de Doppler e de jerk); mínimos quadrados ponderados conjuntos GNSS + LEO com um relógio por sistema (o viés intersistemas) ou um desvio conhecido, sigmas por medição como entradas, e o DOP face ao número de satélites LEO; cobertura polar e do Ártico face à latitude; e transferência de tempo LEO para o Tempo Universal Coordenado (UTC) face ao C/N0 e ao oscilador do recetor com a expressão de tempo do sistema para UTC da IS-GPS-200.

# text
# c1: leo-ppp
seg-57afa384aabd = <c1/>: um filtro de Kalman estendido de posicionamento preciso de pontos (PPP) com ambiguidades reais sobre código e fase livres de ionosfera, apenas GNSS e com aumento por LEO, com o seu tempo de convergência e um teste de consistência NEES (erro de estimação normalizado ao quadrado) de Monte Carlo. O cenário incluído dá { "7.4" } min com quatro sistemas MEO e { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO, ao lado dos { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min de Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) como comparação MODELLED da tendência.

# text
# c1: ntn-positioning
seg-3fa0556b3737 = <c1/>: posicionamento em redes não terrestres (NTN) 5G na banda S de satélite móvel n256 do 3GPP a partir do limite de Cramér-Rao sobre o tempo de chegada e o Doppler.

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: leo-ppp-convergence
# c5: ntn-5g-positioning
# c6: polar-arctic-leo-coverage
# c7: leo-timing-utc
# c8: celeste-iod-fused-pvt
seg-a0cc2699e276 = Cenários: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (incluídos) e <c8/> (só de repositório, retido com a predefinição Celeste IOD).

# text
# c1: tests/leo_doppler_reference.rs
# c2: docs/LEO-PNT-FUSION.md
seg-c0b6b98eeac3 = Oito linhas da matriz: a envolvente de Doppler LEO VALIDATED face aos valores publicados do Iridium (±{ "36" } kHz: { "35.9" } kHz, dentro de { "5" }%) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz: { "33.6" } kHz a partir da camada de { "97" } deg, sem alargamento) (<c1/>); posicionamento Doppler, posicionamento conjunto por pseudo-distâncias, convergência PPP, limites NTN, temporização LEO, cobertura polar e predefinições MODELLED. Três tipos de cenário e oito ficheiros de cenário. Documentação: <c2/>.

# text
# c1: leo-pnt-chain
# c2: docs/LEO-PNT.md
seg-173793480abc = <b>LEO-PNT de ponta a ponta: o tipo de cenário <c1/>, e as fases LEO ligadas entre si.</b> Um sistema de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO) acompanhado desde o projeto do seu sinal até à posição do utilizador, cada fase sendo um tipo de cenário do próprio motor na sua própria tabela de cenário, com valores transmitidos em código (<a1><c2/></a1>):

# text
# c1: leo-pass
# c2: leo-signal
# c3: signal = "xona-x5"
# c4: iono_free
seg-41a4a2183ba3 = As bandas de <c1/> podem indicar um projeto <c2/> (<c3/>): a banda adota o centro, a largura de banda de transmissão e a taxa de chips do componente seguido do projeto, reparte a sua EIRP (potência isotrópica radiada equivalente) pelos componentes do projeto, e comunica em cada época o C/N0 (densidade portadora-ruído) do componente seguido e o jitter de seguimento de código de banda limitada (o erro de medição de distância; o ruído do par <c4/> também o usa). Uma banda sem projeto dá a mesma saída que antes.

# text
# c1: leo-pnt-chain
# c2: leo-pvt
# c3: leo-ppp
# c4: od_sisre_m
# c5: tests/leo_pnt_chain.rs
# c6: LeoNavmsgScenario::broadcast_sisre
seg-a076a43a9d44 = <c1/> executa sinal -> passagem -> mensagem de navegação -> solução conjunta fundida <c2/> -> <c3/> opcional. Todos os sistemas LEO da fase de posicionamento que os deixem por definir adotam uma linha de C/N0 em sin(elevação) ajustada à passagem, o erro de alcance do sinal no espaço (SISRE) da mensagem (o seu erro de representação na órbita do satélite da passagem, com um termo de determinação de órbita <c4/> indicado, em raiz da soma dos quadrados), e a portadora e a taxa de chips do projeto; os casos de posicionamento preciso de pontos (PPP) adotam o SISRE. Cada transferência é listada com o seu valor e a sua unidade, e <c5/> verifica que cada uma é igual à saída a montante e que as alterações a montante deslocam os valores a jusante. <c6/> é o novo ponto de entrada da mensagem.

# text
# c1: leo-pnt-end-to-end
# c2: generic-l
# c3: xona-pulsar-end-to-end
# c4: celeste-iod-end-to-end
seg-8c256ed478e9 = Cenários: <c1/> (uma constelação genérica de { "1080" } km e o sinal <c2/> representativo), <c3/> (o sinal X5 público), ambos incluídos, e o opcional <c4/>, só de repositório.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: kshana_celeste
# c4: scenarios/*celeste-iod*.toml
# c5: tests/workshop_preset_isolation.rs
seg-879259c7ff86 = As predefinições Celeste IOD (demonstração em órbita) das áreas de passagem, mensagem e posicionamento fundido vivem agora num só ficheiro, <c1/>, que <c2/> compila apenas quando existe (a flag de configuração <c3/>). Os seus cinco cenários (<c4/>) são só de repositório, pelo que apagar esse ficheiro e esses cenários retém todos os números apresentados no workshop LEO-PNT do ESA NAVISP, { "2026" }, sem qualquer alteração ao código-fonte; <c5/> verifica que ficheiros podem nomear a predefinição ou conter os números do seu plano de bandas.

# text
# c1: leo-pvt
# c2: t_s
# c3: leo-ppp
# c4: t_min
# c5: leo-pass
# c6: leo-pnt-chain
seg-110b1f7c7c63 = Todos os tipos de cenário LEO na correspondência do relatório avançado, com as suas linhas específicas de cada caminho listadas apenas quando a execução seguiu esse caminho (uma taxa de chuva, um edifício, uma análise ou um modo que foi executado). As janelas de Doppler de <c1/> ganham <c2/> e os casos de <c3/> ganham <c4/>, pelo que ambos se animam; <c5/> e <c6/> exportam efemérides CZML, KML, GeoJSON e STK, e os restantes tipos de cenário LEO indicam porque um formato não se aplica.

# text
seg-1419edea5329 = Navegação em órbita terrestre baixa: resiliência, áreas de foco e cenários de utilizador final

# text
# c1: docs/LEO-PNT.md
seg-d084d86044b4 = <b>Resiliência LEO-PNT, um cenário por área de foco da experiência e um por vertical de utilizador final, e <c1/> como visão geral de todos os tipos de cenário e cenários LEO.</b> Todos os cenários funcionam sem quaisquer dados do Celeste e estão incluídos.

# text
# c1: leo-pass
# c2: [spoofer]
# c3: leo_link::spoof
seg-07e91f076ab2 = <c1/> passa a ter uma secção <c2/>: um spoofer falsifica, de forma autoconsistente em distância e em taxa de variação da distância, os sinais de uma posição declarada que salta e/ou é afastada da verdadeira após um início (por banda LEO, e para o sinal GNSS MEO), com ou sem a ionosfera. Dois monitores funcionam a uma probabilidade de falso alarme indicada: consistência de Doppler e da geometria da passagem (taxas de variação da distância medidas face às previstas a partir das órbitas e de uma posição e velocidade a priori independentes; um qui-quadrado de mínimos quadrados generalizados numa janela, nos canais GNSS, LEO e em todos, com ruído do laço de bloqueio de frequência derivado do C/N0) e consistência entre bandas (o salto da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO). O resultado dá as estatísticas por época (pelo que se anima), cada par, e quando cada monitor deteta. Blocos de construção em <c3/>. Secção ausente, saída inalterada.

# text
# c1: leo-pass
# c2: leo-pass
seg-6a7852f1f053 = Cada par de bandas de <c1/> comunica também o conteúdo eletrónico total (TEC) oblíquo que a sua combinação livre de geometria recupera no pico da passagem e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Isto acrescenta dois campos a cada resultado <c2/> multibanda; nenhum número existente muda.

# text
# c1: leo-pvt
# c2: trace = true
seg-bdf333f4c978 = O modo de temporização de <c1/> aceita <c2/>: cada linha comunica então o seu erro de tempo e o sigma previsto em cada época, com as mesmas extrações, pelo que as estatísticas das linhas ficam inalteradas e a execução anima-se e encadeia-se numa campanha.

# text
# c1: docs/INTEROP.md
seg-eb4461740dc5 = Uma campanha passa a exportar cada cenário membro que tenha geometria (execuções de fase, os cenários base de varrimento e de Monte Carlo, membros compostos com os seus valores partilhados ligados) como o seu próprio conjunto de ficheiros, com a etiqueta do membro no nome do ficheiro; antes, uma campanha não exportava nada. A tabela de interoperabilidade em <c1/> muda em consequência.

# text
# c1: system.2.sisre_m
seg-c0b1f4d9fed0 = Uma chave de varrimento de campanha pode indexar uma lista de tabelas por posição (<c1/>).

# text
# c1: leo-resilience-multiband-diversity
# c2: leo-resilience-js-margin
# c3: leo-resilience-spoof-doppler
# c4: leo-resilience-spoof-monitors
# c5: leo-resilience-gnss-jammed-leo-carries
seg-4c995017dd9c = Cenários de resiliência: <c1/> (uma barragem de { "50" } MHz na banda L5 variada em potência: todos os sinais da banda L caem, os sinais LEO em UHF, banda S e banda C mantêm o seu C/N0), <c2/> (margem de J/S a partir da potência recebida: GPS L5, Galileo E5a e Xona X5 perdidos a -105, -100 e -95 dBW, um sinal LEO genérico de -135 dBW ainda em seguimento a -90 dBW), <c3/> (um salto de { "30" } m não detetado pelo teste de Doppler apenas GNSS e detetado pelo teste em todos os canais { "105" } s após o início), <c4/> (quatro spoofers contra ambos os monitores) e <c5/> (GNSS sob jamming, a camada LEO de banda S e C em seguimento, a monitorização autónoma da integridade pelo recetor apenas na camada LEO a dar alarme em { "2" } de { "30" } épocas).

# text
# c1: leo-focus-ppp-altitude
# c2: leo-focus-ntn-bandwidth
# c3: leo-focus-iot-eirp
# c4: leo-focus-science-iono-sounding
# c5: leo-focus-data-services
# c6: leo-focus-indoor-uhf
# c7: leo-focus-fused-pnt-sisre
# c8: leo-resilience-multiband-diversity
seg-bae66dac04cc = Cenários de área de foco: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (a resiliência em L, S e C é <c8/>).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: leo-vertical-rail-maritime
# c3: leo-vertical-critical-infrastructure-timing
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-5g-network-timing
# c6: leo-vertical-asset-tracking-iot
# c7: docs/LEO-PNT.md
seg-c7947d9cc592 = Campanhas de vertical, cada uma animada e a exportar as suas passagens LEO: <c1/>, <c2/> (os cenários marítimos e ferroviários incluídos mais LEO), <c3/>, <c4/>, <c5/>, <c6/>. Resultados numa linha em <c7/>.

# text
# c1: tests/leo_resilience_verticals.rs
seg-222ad0b777f8 = Três linhas MODELLED da matriz: o monitor de spoofing por Doppler e geometria da passagem, o monitor de spoofing entre bandas e a sondagem da ionosfera. <c1/> verifica os monitores (silenciosos antes do início, a estatística de Doppler quadrática num salto, o salto ionosférico de um spoofer terrestre e nenhum num spoofer com conhecimento da ionosfera), a identidade da sondagem, o traço de temporização face às estatísticas das linhas, e que a exportação de uma campanha é igual à de cada membro.

# text
# c1: leo-pass
# c2: docs/LEO-PASS.md
# c3: docs/LEO-PNT.md
seg-f650b42bf210 = A página <c1/> passa para <c2/>; <c3/> é a visão geral.

# text
seg-00a4ba834f37 = <b>Cenários marítimos, rodoviários e ferroviários.</b> Cinco exemplos incluídos sobre tipos de cenário existentes, para que navios, veículos rodoviários e comboios tenham cada um um caso trabalhado. Todos os valores são MODELLED; nenhum é validado face a dados medidos.

# text
# c1: scenarios/maritime-strait-jamming.toml
# c2: jamming
seg-682414bbe0c6 = <c1/> (<c2/>): um jammer de banda larga de { "50" } W num mastro de { "30" } m, a { "30" } km de distância sobre águas abertas, face a um navio. A relação média jammer-sinal (J/S) é de cerca de { "48" } dB, e a disponibilidade desce de { "1.00" } para { "0.00" }.

# text
# c1: scenarios/maritime-port-approach-coast.toml
# c2: ins-trn-coast
seg-4666dcd72c24 = <c1/> (<c2/>): um sistema de navegação inercial (INS) de classe de navegação a { "12" } nós, com o GNSS perdido e sem auxílio. Atinge { "10" } m após { "281" } s e { "100" } m após { "833" } s, os valores de aproximação a porto e de águas oceânicas da Resolução A.1046({ "27" }) da Organização Marítima Internacional (IMO), aqui usados como orçamentos.

# text
# c1: scenarios/maritime-spoof-position-push.toml
# c2: spoof-detect
seg-7407bb97aedd = <c1/> (<c2/>): um spoofer de +{ "2" } dB, não alinhado com a portadora, que empurra quatro satélites para arrastar um navio { "500" } m. O monitor fundido deteta-o (pontuação { "0.70" } face a um limiar de { "0.50" }) por monitorização autónoma da integridade pelo recetor (RAIM) e monitorização da qualidade do sinal (SQM); a monitorização de potência isolada não o deteta.

# text
# c1: scenarios/automotive-urban-canyon.toml
# c2: gnss-ins
seg-1edc0541930b = <c1/> (<c2/>): um automóvel através de uma passagem inferior de { "15" } s e de uma interrupção de { "60" } s causada por um jammer à beira da estrada, face a um orçamento de meia faixa de { "1.5" } m. O erro quadrático médio (RMS) fundido durante a interrupção é { "1.9" } m para uma unidade de sistema microeletromecânico (MEMS) de classe automóvel e { "0.7" } m para um comparador de grau tático; em funcionamento livre, a unidade MEMS desvia-se { "850.8" } m.

# text
# c1: scenarios/rail-tunnel-coast.toml
# c2: ins-trn-coast
# c3: kshana example
seg-f9830a49659f = <c1/> (<c2/>): um INS de grau tático num comboio a { "160" } km/h num túnel. Atinge { "2" } m (discriminação de via) após { "35.8" } s, a cerca de { "1.6" } km da entrada, e { "20" } m após { "107.3" } s. Isto é apenas INS: o motor não tem modelo de odómetro, pelo que é o limite pessimista. A contagem de ficheiros de cenário do README passa de { "77" } para { "82" }. Os cinco estão incluídos para <c3/> e listados no playground do navegador.

# text
seg-77c8c53126fd = Servidor do Model Context Protocol

# text
seg-2deb4b35b41a = O servidor do Model Context Protocol (MCP) chega a todos os tipos de cenário e a todas as vistas de uma execução: sete novas ferramentas, catorze no total.

# text
# c1: run_scenario
seg-7f4035dfd9db = <c1/> já despachava todos os tipos de cenário; o que faltava a um agente era um caminho para um cenário válido de um tipo de cenário e para as três saídas que a linha de comandos escreve ao lado de um resultado. Novas ferramentas:

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: kshana example
# c4: scenarios/
# c5: lunar-llr-datum
seg-d9df5ab8817a = <c1/> e <c2/> servem os cenários de referência incluídos (a tabela <c3/>), cada um com o seu tipo de cenário e a primeira frase do seu próprio cabeçalho, byte a byte o ficheiro em <c4/>. Um cenário que está no repositório mas não incluído é recusado com o motivo. Todos os tipos de cenário, exceto <c5/> (cuja fatia de dados só vem com o repositório), têm pelo menos um exemplo.

# text
# c1: report_scenario
# c2: docs/REPORTS.md
seg-cb24ad7147ef = <c1/> devolve o relatório da execução como JSON (JavaScript Object Notation) ou como página HTML (HyperText Markup Language) imprimível (<c2/>).

# text
# c1: animate_scenario
# c2: docs/ANIMATION.md
seg-9264b2f20e15 = <c1/> devolve a série temporal da execução como um desenho SVG (Scalable Vector Graphics) animado, um leitor HTML ou fotogramas numerados, depois de um resumo JSON do que foi desenhado (<c2/>). Uma resposta contém no máximo { "120" } fotogramas; a linha de comandos escreve qualquer comprimento.

# text
# c1: list_export_formats
# c2: export_interop
# c3: import_route
# c4: docs/INTEROP.md
# c5: .e
seg-959f23871238 = <c1/>, <c2/> e <c3/> servem as exportações de interoperabilidade e a importação de rotas GeoJSON (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, as efemérides STK (Systems Tool Kit) <c5/> e SigMF (Signal Metadata Format), com um índice JSON dos ficheiros (sufixo, tamanho e SHA-256, o resumo do Secure Hash Algorithm de 256 bits) e o ficheiro binário de amostras SigMF em base64.

# text
# c1: bundled-scenarios
# c2: kshana::bundled_scenarios
# c3: --study
# c4: web/
seg-9ec3f9639b8c = A biblioteca ganha uma funcionalidade <c1/> desativada por predefinição que expõe a tabela de cenários de referência como <c2/>; só o servidor MCP a ativa, pelo que a wheel Python e o módulo WebAssembly continuam a não conter o texto dos cenários. Os conjuntos de estudo (<c3/>) continuam a ser apenas de linha de comandos, porque um conjunto nomeia ficheiros em disco e o servidor não lê nenhum. Os testes de ida e volta executam cada nova ferramenta sobre cenários incluídos e verificam os números do motor: espetro, o sistema solar, constelações em torno da Lua e de Europa, um varrimento de campanha, e os tipos de cenário de sinal, passagem, mensagem de navegação, posicionamento fundido, posicionamento preciso de pontos, rede não terrestre e de ponta a ponta de órbita terrestre baixa (LEO). Todas as superfícies que indicam a contagem de ferramentas MCP ou as listam dizem agora catorze, exceto a página do playground em <c4/>, que é substituída pelo site.

# text
seg-c11823028688 = kshana.dev, Kshana Studio e o README

# text
# c1: docs/
# c2: /#playground
# c3: /#ledger
# c4: /#s=<scenario>
# c5: /?embed=1&…
seg-fb584cf84218 = <b>Um kshana.dev redesenhado.</b> A página única de playground é substituída por um site de várias páginas: Home, Missions, Capabilities, Evidence, Developers, Editions e Docs, com o Kshana Studio a um clique. Todos os gráficos, mapas e números nele são uma execução registada do motor desta versão, com o cenário e uma ligação que reabre a mesma execução no Studio; a compilação do site recusa um registo feito por outro commit do motor. As páginas da documentação são geradas a partir de <c1/> do repositório, e as opções de instalação a partir dos seus canais. Os tipos de letra e as bibliotecas de scripts são servidos pelo próprio kshana.dev, pelo que nenhuma página pede nada a um anfitrião de terceiros. Os endereços antigos (<c2/>, ligações de partilha <c3/>, <c4/>, ligações de incorporação <c5/> e as restantes) redirecionam para o seu novo lugar, e um endereço desconhecido recebe uma página { "404" }.

# text
# c1: ?scenario=…&tab=…
seg-9fa1c542332b = <b>Kshana Studio, um painel para cada capacidade.</b> O Studio abre num ecrã inicial com mosaicos de domínio e boas primeiras execuções, e depois conduz uma execução por cinco passos numerados: Escolher um cenário, Definir os seus parâmetros, Executar o motor localmente no navegador, Ler os resultados (primeiro os valores principais, cada um com um chip PASS ou FAIL quando a execução indica um limiar, e depois os painéis) e Partilhar ou exportar. Uma caixa de pesquisa encontra cenários, domínios e os campos dentro deles e salta para o controlo; as execuções podem ser fixadas e comparadas; uma trilha de navegação indica onde se está; num telemóvel os passos tornam-se uma barra de passos. Cada tipo de cenário tem a sua vista, incluindo a cascata de espetro, o sistema solar, a cobertura de constelações, as campanhas, a animação, o relatório da execução, as exportações de interoperabilidade e a cadeia de órbita terrestre baixa. Uma ligação profunda (<c1/>) abre a mesma execução no painel indicado.

# text
seg-dcf2788bb430 = <b>Investigação e citação.</b> A página Evidence lista os cinco artigos do Kshana no arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } e { "2607.06212" }), cada um com um resumo, um valor calculado por este motor, o comando que o reproduz, uma ligação para o Studio e BibTeX, ao lado de como citar o software. O README ganha a mesma secção Research.

# text
seg-fab395bab130 = Uma página pública para o Kshana Pro.

# text
# c1: docs/PRO.md
seg-167a59e94101 = <c1/> e a página Editions do site dizem o que a camada proprietária Pro acrescenta sobre o mesmo motor (otimizador de projeto, incerteza e sensibilidade, dossiê de missão, vigilância de campanha, coexistência de espetro, serviço de tarefas nas instalações, rastreabilidade de requisitos), o que cada uma produz e o que não faz. Todos os valores do Pro que o site mostra estão indicados nessa página pública. O Pro não acrescenta nenhum modelo físico, e o motor aberto continua inteiro e gratuito.

# text
# c1: tools/gen_readme_assets.py
# c2: tools/capture_studio_shots.mjs
# c3: docs/
seg-f57f0a610943 = <b>Um README reescrito.</b> Secções curtas, uma imagem por secção, a marca do Kshana, duas filas de emblemas, imagens geradas de arquitetura, de fluxo de cenário, da cadeia de órbita terrestre baixa e de verificação (<c1/>, que falha perante uma imagem desatualizada), e capturas de ecrã do Studio tiradas do Studio em funcionamento por <c2/>. Os READMEs do crates.io, do PyPI, do npm e do servidor MCP seguem o mesmo desenho. O material de referência longo é recolhido ou movido para <c3/>.

# text
# c1: <scenario>.report.html
# c2: wrote …
# c3: <scenario>.report.json
# c4: RunOutput::html_report()
# c5: OracleKind::modelled_reason()
# c6: docs/MODELLED-RATIONALE.md
seg-e06522ca762e = <b><c1/> é agora o relatório avançado de execução</b> descrito em Adicionado, e a linha <c2/> da CLI nomeia também <c3/>. O relatório de uma página com pontuação que ele substituiu mantém-se inalterado como <c4/>, que as ligações Python e WebAssembly continuam a devolver. <c5/> expõe a frase que <c6/> imprime para cada linha MODELLED; esse documento está inalterado.

# text
# c1: result.json
# c2: report.json
seg-77a6f35c5c9a = <b>O README diz em que se baseia o Kshana Pro.</b> A secção Editions e a linha do Kshana Pro em "Support & professional services" indicam agora o que as ferramentas de engenharia de sistemas baseada em modelos (MBSE) e de programa do Pro fazem e quais das saídas publicadas do motor aberto leem (o <c1/> e o <c2/> de cada execução, o ficheiro do cenário, o esquema de unidades dos campos e as etiquetas da matriz de verificação), e em que assentam no motor aberto os gémeos digitais de relógios, os estudos de compromisso e os pacotes de evidências. Apenas redação: nenhuma saída do motor nem número publicado muda.

# text
# c1: navsignal::Modulation
# c2: Mboc
# c3: ephemeris
# c4: gcrs_r_m
# c5: gcrs_v_m_s
seg-1a19675ffa3b = <b>Compatibilidade.</b> O enum público <c1/> ganha uma variante <c2/>, o que é uma alteração incompatível para um chamador que o trate de forma exaustiva. As colunas <c4/> e <c5/> do tipo de cenário <c3/> mudam (ver "Revisões de números publicados"). Uma execução continua a ser reproduzida pela versão do motor que a produziu.

# text
# c1: export_table_csv
# c2: telecom-timing
# c3: leo-navmsg
# c4: encode-decode
# c5: kepler16
# c6: kepler-rac
seg-e7c5f77a6602 = <b><c1/> no servidor MCP nomeava quatro tipos de cenário como os únicos com uma tabela CSV (valores separados por vírgulas); seis publicam uma.</b> A ferramenta devolvia sempre a tabela para <c2/> e para <c3/> (a sua análise <c4/> sobre um modelo de mensagem <c5/> ou <c6/>), mas a sua descrição, a sua mensagem de recusa e os documentos que listam os tipos de cenário omitiam ambos, pelo que se dizia a um agente para não os pedir. Passam agora a ser nomeados, e um teste de ida e volta obtém ambas as tabelas.

# text
seg-4094f58a5f4b = A trama da mensagem de navegação de órbita terrestre baixa (LEO) não tinha os mesmos bytes em todas as plataformas, nem em todas as compilações de uma mesma plataforma.

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
# c2: 0x110315
# c3: 0x898BD8
# c4: 0x6A82D9
# c5: leo-navmsg-celeste-iod.toml
# c6: 0x6EDB2D
# c7: 0xC6E4F0
seg-5191262de022 = <c1/> codificava uma trama com verificação de redundância cíclica <c2/> na compilação de lançamento em aarch64 macOS, <c3/> numa compilação de depuração do mesmo código-fonte na mesma máquina, e <c4/> na compilação WebAssembly (WASM); <c5/> dava <c6/> nativamente face a <c7/> no navegador. Três causas, cada uma rastreada até ao primeiro valor divergente:

# text
# c1: truth::state_to_elements
# c2: acos
# c3: atan2
seg-f6501c3cd89d = <em>Entre plataformas.</em> A órbita de referência era idêntica ao bit em ambas; o ponto de partida do ajuste não era. <c1/> obtém a inclinação osculadora a partir de um <c2/> e o argumento do perigeu a partir de um <c3/>, e as duas bibliotecas matemáticas arredondam-nos de forma diferente na última casa (em { "20 000" } argumentos discordam em { "781" } senos, { "858" } cossenos, { "1 931" } exponenciais e { "1 899" } arco-tangentes de dois argumentos).

# text
# c1: sin
seg-cd6f05096b8b = <em>Entre perfis de compilação.</em> Uma compilação otimizada em macOS funde um seno e um cosseno do mesmo argumento numa única chamada à rotina combinada do sistema, e o seu seno não é o do <c1/> isolado em { "379" } de { "200 000" } argumentos; uma compilação não otimizada faz as duas chamadas. O tipo de cenário calcula um seno e um cosseno em conjunto em treze locais.

# text
# c1: rand_distr
# c2: exp
# c3: ln
seg-91b0700dcb30 = <em>No relógio.</em> O amostrador normal de <c1/> chama <c2/> e <c3/> do anfitrião nos seus dois ramos raros: de quatro milhões de extrações com semente, três diferiam no último bit entre a compilação nativa e a WASM.

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
seg-0a4724333429 = O ajuste de Levenberg–Marquardt, que neste arco pára no seu limite de 80 iterações e não num mínimo, transporta uma unidade na última casa para campos quantizados diferentes. O tipo de cenário calcula agora todas as funções transcendentes através do novo <c1/>, que chama o crate <c2/> em Rust puro (já na árvore de dependências, agora nomeado em <c3/>), compilado a partir de um só código-fonte para todos os alvos e não uma chamada de biblioteca que o otimizador reescreve: <c4/> e o código do cenário. As potências inteiras nesse caminho são escritas por extenso como elevar ao quadrado e multiplicar, porque <c5/> tem precisão não especificada, e o relógio de referência extrai os seus desvios normais de <c6/> (o método polar de Marsaglia sobre a saída bruta do gerador). As rotinas partilhadas por que a órbita de referência integra são escritas uma só vez, genéricas sobre a biblioteca matemática, com um ponto de entrada <c7/> interno ao crate ao lado do existente: a aceleração por harmónicas esféricas, as acelerações zonal e de arrasto, as taxas seculares de J2 e o atraso de Klobuchar. Os pontos de entrada existentes ficam inalterados até ao último bit, pelo que nenhum número de outro tipo de cenário muda. <c8/> fixa toda a trama de 171 bytes e um valor de verificação por modelo de efemérides, no perfil de teste normal (não otimizado), em todas as plataformas e sem condição de anfitrião de referência; <c9/> lê do disco o código-fonte do tipo de cenário e falha perante uma chamada transcendente inerente, um amostrador <c10/> ou uma chamada a um módulo que não foi revisto. Depois da alteração, uma compilação de depuração, uma de lançamento e a compilação WASM produzem documentos de resultado idênticos byte a byte para os cinco cenários <c11/>. <b>Isto altera números, registados aqui como uma revisão.</b> O tipo de cenário <c12/> é novo nesta versão, pelo que nada publicado numa versão anterior muda, mas todos os valores de <c13/> mudam, nativamente e na compilação WASM, e com eles a fase <c14/> de <c15/>: os valores de órbita porque o ajuste parte agora dos elementos portáteis, os valores de relógio porque o relógio de referência é uma realização diferente do mesmo processo. <c16/> é regenerado a partir dos novos resultados; o seu valor de verificação publicado para o cenário de codificação e descodificação era <c17/> e é <c18/> (posição a { "1.126" } mm da mensagem exata onde estava a { "0.665" } mm, relógio a { "0.185" } mm onde estava a { "0.451" } mm). A dimensão das alterações nos valores submilimétricos é a sensibilidade do ajuste, não um erro em nenhum dos conjuntos: o ajuste não muda e continua a parar no seu limite de iterações.

# text
seg-c30f4cef4797 = A reamostragem com semente extraía índices diferentes num alvo de 32 bits.

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
seg-2bf668e23ec1 = <c1/> sobre <c2/> retira { "64" } bits do gerador num anfitrião de 64 bits e { "32" } bits num de 32 bits, pelo que a mesma semente dava outros índices e deixava o fluxo noutro ponto, na compilação WASM. Três locais extraíam assim: os bootstraps de percentis em <c3/> (<c4/>, <c5/>), a permutação antes de cada passagem de treino em <c6/> e o teste de permutação em <c7/>. Passam agora a extrair através de <c8/>, que amostra sempre como <c9/>: exatamente o que fazia um anfitrião de 64 bits, pelo que nenhum número nativo muda. <b>Isto altera números publicados do pacote WASM, registados aqui como uma revisão:</b> o intervalo de bootstrap <c10/> da área sob a curva (<c11/>, <c12/>) era <c13/> no navegador e é agora o nativo <c14/>.

# text
# c1: /
# c2: Pulsar inclined/S1-0163
# c3: --export stk
# c4: -
# c5: _
seg-80f783da1d4f = <b>Nomes de ficheiros de efemérides STK a partir de identificadores de móveis.</b> Um identificador de móvel que contivesse um <c1/> ou um espaço (uma camada de constelação e um satélite, <c2/>) fazia a CLI entrar em pânico com <c3/>; cada identificador passa agora por uma parte de ficheiro segura (letras, dígitos, <c4/>, <c5/>).

# text
seg-a0dc5729d5e9 = <b>O sinal da nutação TEME→GCRS</b>, descrito acima em "Revisões de números publicados" porque altera saídas publicadas.

# text
# c1: slot-timing
# c2: src/slot_timing.rs
# c3: slot-timing-ocxo-leo
# c4: docs/SLOT-TIMING.md
seg-5ecbf0787f39 = <b>Tipo de cenário <c1/></b> (<c2/>): segundos até um relógio em funcionamento livre sair da guarda de um slot de encaminhamento ou de atribuição de tarefas indexado no tempo, cada termo contribuinte nesse momento com o dominante nomeado, o tempo que resta desde a última solução de posição e o maior intervalo entre soluções que mantém o relógio dentro, líquido da latência da solução. O relógio vem de uma predefinição de classe, de uma predefinição de ficha técnica de telecom-timing, de uma ficha técnica em linha (máximos do desvio de Allan, envelhecimento, coeficiente de temperatura) ou de um registo de fase medido. Uma violação para além do maior tempo de média que a fonte suporta é assinalada como extrapolada. Exemplo incluído: <c3/>. Ver <c4/>.

# text
# c1: slot_timing::fit_weighted
seg-40dd4c16b760 = <b>Piso de ruído vermelho medido.</b> O desvio de Allan sobreposto de um registo de fase é ajustado por mínimos quadrados ponderados na base de modulação de frequência de fase branca e IEEE Std { "1139" } (<c1/>), cada ponto ponderado pelos seus graus de liberdade equivalentes, pelo que uma resposta de holdover pode assentar no piso do próprio relógio em vez do pressuposto da classe. Um ajuste sem ponderação pôs um piso de flicker espúrio num registo de teste de ruído branco e encurtou em { "30" } % uma violação de { "2 000" } s.

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: realdata-clock
seg-22c09748488b = <b>Validação em dados reservados da inversão de holdover num relógio real</b> (<c1/>): ajustadas no primeiro terço do registo césio 5071A contra maser de hidrogénio, as violações previstas a um sigma em seis limiares de { "0.5" } a { "2.5" } ns ficam entre { "0.84" } e { "1.03" } das violações medidas nos outros dois terços, face a um limiar de { "1.5" } fixado antes de o teste correr pela primeira vez. Um controlo (o desvio de Allan a um segundo lido como ruído branco) falha por um fator de cerca de { "1 000" } e não atinge o limiar. Nova linha VALIDATED do registo; o fluxo de trabalho <c2/> executa-o agora.

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: scripts/fetch_ocxo.sh
# c3: fix_frequency_sigma
seg-cd73dc87a22f = <b>A mesma previsão num oscilador de cristal real</b> (<c1/>, <c2/>): num oscilador de cristal de forno medido, a previsão em dados reservados é conservadora, a { "0.59" } a { "0.70" } da violação medida e nunca mais tarde, e na maior parte fora do limiar de { "1.5" }, porque o piso de ruído desse oscilador caiu para metade durante o registo de 5,5 horas; ajustada na amostra, fica entre { "0.98" } e { "1.17" }. O caso do cristal não é validado e continua MODELLED. A execução expôs também um termo em falta: a frequência de um cristal deriva, pelo que o modelo passa a incluir a incerteza da frequência conhecida na solução de posição (<c3/>); sem ela, a previsão era otimista até { "2.5" }×.

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-8519979d184c = <b>A mesma previsão em relógios atómicos em órbita</b> (<c1/>, <c2/>): { "14" } dias de relógios finais do International GNSS Service para os satélites GPS Block IIF, com o protocolo escrito antes de os dados serem descarregados. Oito de dez satélites ficam dentro do limiar de { "1.5" }; o G25 e o G30 preveem violações até cerca de duas vezes mais tardias do que as medidas. O protocolo exige que todos os satélites passem, pelo que o caso orbital não é validado e continua MODELLED; o resultado fica fixado.

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
seg-0d666a725b77 = <b>Classes de relógio de cristal compensado em temperatura (TCXO), de cristal de forno (OCXO) e de padrão atómico de frequência de rubídio (RAFS)</b> (<c1/>, <c2/>, <c3/>), as peças que um barramento comercial de pequeno satélite ou um gateway terrestre transporta, cada uma a citar uma ficha técnica pública (<c4/>). Acrescentados <c5/>, <c6/> e <c7/>. <c9/> de <c8/> aceita os três novos identificadores. Acrescentar variantes a um enum público é uma alteração incompatível para um chamador que o trate de forma exaustiva.

# text
# c1: src/orbital_timing.rs
# c2: slot-timing
# c3: spoofing
# c4: tpl::timing_protection_level_ns
seg-24ae82b115f5 = <b>Nível de proteção de temporização para um recetor em órbita</b> (<c1/>, a secção <c3/> opcional do tipo de cenário <c2/>): durante quanto tempo um spoofer terrestre pode alcançar um satélite de órbita terrestre baixa por passagem, o desvio que um spoofer a uma taxa de rampa máxima indicada acumula antes de o satélite sair do seu alcance ou de ser executada uma verificação independente, e se cada verificação de contacto com o solo ou de ligação cruzada é independente desse spoofer. Reduz-se exatamente a <c4/> para um relógio sem ruído de flicker, de fase branca ou de passeio aleatório. MODELLED.

# text
# c1: docs/SLOT-TIMING.md
# c2: docs/DECEIVED-TIME.md
# c3: docs/DEPLOYMENT-TARGETS.md
# c4: no_std
seg-4032bc03fad5 = <b>Três notas</b>: <c1/> (incluindo a métrica de deriva face à qual um slot deve ser aceite: erro de tempo absoluto máximo, e não erro de intervalo de tempo máximo nem desvio de tempo, e porquê), <c2/> (um comando assinado aplicado num tempo enganado continua a encaminhar mal) e <c3/> (onde o Kshana funciona; não é oferecido nenhum núcleo de voo <c4/>).

# text
# c1: kshana
# c2: kshana-mcp
seg-712035e19515 = A versão { "v0.27.3" } chegou ao crates.io (<c1/> e <c2/>) e ao PyPI, e depois parou no npm, pelo que o npm, a imagem MCP do ghcr.io, o registo MCP, o JetBrains Marketplace e o kshana.dev nunca a receberam. A { "0.27.4" } leva o mesmo motor, com a correção de versão abaixo, a todos os canais.

# text
# c1: npm-dist/kshana-0.27.3.tgz
# c2: owner/repo
# c3: github.com/npm-dist/kshana-0.27.3.tgz
# c4: ./npm-dist/*.tgz
seg-bab8d4d1bc54 = <b>O passo de publicação npm nomeia o tarball por um caminho explícito.</b> O npm lê um simples <c1/> como a abreviatura do GitHub <c2/>, pelo que a tarefa npm da { "v0.27.3" } tentou clonar <c3/> e falhou com "Permission denied (publickey)". O próprio tarball tinha sido construído e atestado. O passo publica agora <c4/>. Tudo o que vem depois do npm na ordem da versão (a imagem MCP, o plugin JetBrains, a verificação de paridade de canais e o site) foi ignorado, como previsto.

# text
# c1: gnss-ins
seg-f9a112755eb1 = <b>Os catálogos de unidades de telecom-timing e <c1/> estão isentos da deteção de copiar e colar</b>, sob a mesma política e o mesmo teste de justificação dos outros catálogos. O critério de qualidade do SonarCloud tinha ficado vermelho por duplicação em código novo ({ "4.0" }% face a { "3" }%), e cada bloco duplicado era uma linha de unidades ou uma entrada de máscara ITU-T.

# text
# c1: scenarios/small-uas-jammed-nav.toml
# c2: jamming-demo.toml
# c3: kshana example small-uas-jammed-nav
seg-3c3dacae06d6 = <b><c1/>: durante quanto tempo a navegação de um pequeno drone se mantém depois de o GNSS sofrer jamming.</b> Executa uma unidade inercial microeletromecânica (MEMS) de classe de controlador de voo, uma Bosch BMI088, face a uma unidade de grau tático. O sinal GNSS (Global Navigation Satellite System) é nominal durante { "100" } s, e depois negado durante { "60" } s (<c2/> mostra porque é que um jammer próximo faz isso). Os vieses da BMI088 são os resíduos que ficam após a calibração de arranque, tirados dos coeficientes de temperatura da sua ficha técnica (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s por K para o giroscópio e < { "0.2" } mg por K para o acelerómetro. Duas hipóteses estão assinaladas no ficheiro: um aquecimento de { "10" } K após a calibração, e um aquecimento contínuo de { "1" } K por minuto em voo. A deriva em voo é o erro que o filtro não consegue aprender antes de o jamming começar, e é o que termina a navegação por estima. Todos os valores são modelados; validá-lo exige registos de voo de um ambiente sob jamming. <c3/> imprime-o.

# text
# c1: gnss-ins
# c2: [imu_quantum.filter_prior]
# c3: [imu_classical.filter_prior]
# c4: sigma_accel_bias
# c5: sigma_gyro_bias
seg-7154f69a2b8a = <b>Cada sensor de <c1/> pode definir o seu próprio prior do filtro</b> (<c2/> ou <c3/>, com <c4/> e <c5/>). A predefinição não muda, pelo que todos os cenários existentes dão o mesmo resultado. O viés residual do giroscópio de uma unidade de grau de consumo fica a cerca de { "26" } sigma fora da predefinição de grau tático, onde o filtro nunca o aprenderia. Um prior que não seja finito e positivo é rejeitado, e o resultado ecoa o prior quando um é definido.

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
seg-2b54735b19aa = <b><c1/> entrega a um utilizador do registo um cenário para executar.</b> Um utilizador de <c2/> tem o executável e nenhum diretório <c3/>, pelo que o primeiro comando que todos os inícios rápidos lhe davam falhava. A interface de linha de comandos (CLI) passa a levar os { "75" } cenários de referência que funcionam sozinhos, byte a byte, compilados a partir de <c4/> (<c5/>; a tabela vive no binário da CLI, pelo que a wheel Python e o módulo WebAssembly não crescem). <c6/> lista-os; <c7/> escreve um. Os outros dois ficheiros são só de repositório: <c8/> lê dados arquivados de telemetria laser lunar que só vêm com o repositório, e <c9/> é um manifesto de estudo que executa três ficheiros irmãos com <c10/>. Pedir qualquer um deles diz porquê e termina com { "2" } em vez de imprimir algo que não pode funcionar sozinho. <c11/> mantém a tabela alinhada com o diretório nos dois sentidos, pelo que um novo ficheiro de cenário que não esteja incluído nem seja nomeado como só de repositório falha.

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
seg-43249b6a1f3c = <b>Cada figura de mérito num resultado de relógio, órbita, híbrido ou fusão indica agora se é VALIDATED ou MODELLED, no próprio resultado.</b> O documento de resultado ganha um bloco <c1/>, sempre a sua última chave. Lista cada valor comunicado (por exemplo <c2/>) com o seu nível — VALIDATED significa verificado face a uma referência externa independente, MODELLED significa um modelo de princípios básicos que é testado internamente — e a linha da matriz de verificação de onde o nível é lido. O nível vem de <c3/> através de <c4/>, pelo que não há uma segunda tabela que possa divergir. Antes disto, as palavras "validated" e "modelled" apareciam zero vezes num resultado de holdover de relógio, e quem lesse o JSON (JavaScript Object Notation) em bruto não tinha como distinguir os dois. Os valores de posição de <c5/> e <c6/> não têm linha da matriz que os possua, pelo que são listados em <c7/> em vez de lhes ser atribuído um nível. O bloco não contém números. Está demonstrado que é aditivo, não assumido: removê-lo devolve o documento anterior à alteração byte a byte, para os cinco tipos de cenário (um teste do motor), e ambos os conjuntos de referência (<c8/>, <c9/>) retiram agora exatamente esta chave, e só quando é a última, e depois calculam o hash do resto face às suas constantes congeladas <b>inalteradas</b>. Uma lista em cada conjunto fixa que cenários têm de conter o bloco, pelo que a exclusão não pode alargar-se em silêncio.

# text
# c1: telecom-timing
# c2: docs/TELECOM-TIMING.md
seg-8faf1981d797 = <b>Um tipo de cenário <c1/> responde nas unidades de um engenheiro de temporização: erro de tempo, erro máximo de intervalo de tempo (MTIE) e desvio de tempo (TDEV), cada um com um PASS ou FAIL e uma margem face às máscaras do Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações (ITU-T).</b> As máscaras são transcritas das edições em vigor: G.8272 (07/2025) para as classes A e B do relógio de tempo de referência primário (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) para o PRTC melhorado em modo bloqueado e em holdover (incluindo a sua envolvente de erro de tempo, que sobe de { "30" } ns para { "100" } ns durante um período de holdover definido pelo tempo em que o relógio esteve bloqueado), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) para os relógios de fronteira e de escravo de tempo de telecomunicações, classes A a D, e G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) para os limites de rede no ponto de referência C. Toda a entrada que essas Recomendações deixam "para estudo posterior" está ausente, não estimada, e <c2/> lista cada número com a sua tabela ou cláusula e cada item que ficou de fora. O relatório dá também o tempo até exceder cada orçamento de erro de tempo: por predefinição, a predefinição de holdover do ePRTC de { "100" } ns, uma atribuição de holdover de rede de { "400" } ns, o limite do ponto C de { "1 100" } ns e o requisito de ponta a ponta da classe { "4" } de { "1.5" } microssegundos.

# text
# c1: [time_s, time_error_ns]
seg-9e5325e1b0ca = A entrada é um holdover sintético ou uma série própria. O sintético usa uma de quatro predefinições de oscilador (um oscilador de cristal de forno, um padrão de rubídio, um padrão de césio e um relógio atómico à escala de chip), cada uma com os valores de estabilidade, envelhecimento e temperatura de uma ficha técnica da Microchip identificada. A forma como esses valores se tornam ruído de frequência branco, de flicker e de passeio aleatório, envelhecimento e um termo de temperatura é indicada em cada relatório e identificada como MODELLED. Uma série própria são pares <c1/>, em linha (que é como funciona no navegador) ou, em compilações nativas, a partir de um ficheiro de valores separados por vírgulas. A tabela MTIE/TDEV, com o limite de cada máscara selecionada ao lado, é escrita como o artefacto CSV da execução.

# text
# c1: scenarios/telecom-prtc-holdover-24h.toml
# c2: scenarios/telecom-tie-ingest.toml
seg-a23a96819dee = <c1/> é um holdover de rubídio de 24 horas com envelhecimento, flicker e um ciclo diário de temperatura: o seu maior erro de tempo é { "603.2" } ns, cruza { "100" } ns { "8 206" } s após a perda e permanece dentro de { "1.5" } microssegundos durante todo o dia, e não satisfaz a envolvente de holdover do PRTC melhorado, como um relógio que não é de classe césio deve fazer. <c2/> mostra a entrada em linha. O MTIE e o TDEV que o tipo de cenário comunica são verificados face ao pacote allantools numa série de holdover registada de { "2" } 048 amostras, exatamente para o MTIE e a { "1.1e-15" } para o TDEV, pelo que a matriz ganha uma linha VALIDATED e duas MODELLED (a transcrição das máscaras e as predefinições) e fica agora em <b>{ "171" } linhas — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. A cobertura de unidades dos campos passa de { "60" } de { "61" } tipos de cenário para { "61" } de { "62" }, e de { "1,742" } para { "1,788" } campos descritos. O tipo de cenário é novo e aditivo: nenhum cenário existente, valor fixado ou valor publicado muda.

# text
seg-5bb1ad9a34ec = O playground executa o motor num Web Worker em segundo plano, pelo que um cenário lento já não congela a página.

# text
# c1: web/engine-worker.mjs
# c2: web/engine.mjs
# c3: cislunar-arc-recovery
seg-b1ab3546f131 = <c1/> aloja o motor WebAssembly e <c2/> encaminha para ele todas as execuções de cenários — execuções, varrimentos de parâmetros e as exportações SP3 / OMM / OEM / CSV. Uma execução que dure mais de { "150" } ms mostra um estado de ocupado (Run desativado, "Running… N s") e um botão Cancel que termina e volta a criar o worker; um navegador que não consiga iniciar um worker de módulo recorre ao antigo caminho da thread principal. <c3/>, deixado de fora do catálogo porque congelava a página, volta a estar nele, identificado como lento: demora cerca de { "13" } s no Chrome (quatro chamadas ao motor de cerca de { "3" } s cada), durante as quais a página continua a responder.

# text
# c1: cislunar-observability
seg-146200dfac7e = <b>Todas as grandezas comunicadas de <c1/> têm agora uma unidade, uma classe de proveniência e uma definição — o penúltimo tipo de cenário na lista de isenções de todo o crate.</b> Todos os { "41" } campos numéricos do documento RELEASED estão descritos, pelo que a cobertura de unidades dos campos passa de { "59" } de { "61" } tipos de cenário para { "60" } de { "61" } e de { "1,698" } para { "1,742" } campos descritos, com o atraso de campos sem definição inalterado em { "239" }.

# text
# c1: units
# c2: units
# c3: expect_summary
seg-61b1219ae0e3 = Isto estava bloqueado pelo valor fixado que congela o documento publicado, que nomeava <c1/> como uma chave que o documento nunca podia ganhar. Acrescentá-la teria significado apagar essa asserção e reajustar a linha de base de três hashes em três ficheiros — uma forma indistinguível de encobrir uma regressão. Em vez disso, os dois valores fixados que medem este documento <em>demonstram</em> agora que o acréscimo é aditivo: cada um retira de novo o bloco <c2/> e recalcula o hash face à constante congelada antes de o bloco existir, e <b>ambas as constantes estão inalteradas</b>. Uma mutação confirma que a garantia é real — mover um valor publicado e reajustar a linha de base do hash do documento inteiro como faria uma correção descuidada, e a remoção seguida de novo hash continua a falhar. O terceiro valor fixado, no conjunto de referência genérico do registo, é reajustado em linha com os seis irmãos que foram reajustados exatamente por esta razão, e o seu literal <c3/> portador de valores não muda.

# text
# c1: realtime-frame-eop
seg-a73409e0b664 = <c1/> comunica face a que referência foi avaliada cada linha de orientação da Terra, e com que frequência o recurso foi acionado.

# text
# c1: table3_joint_eop[].{ut1, polar_motion,combined}
# c2: truth_source
# c3: truth_fallback_rows
# c4: final
# c5: dN
# c6: truth_pm()
# c7: truth_ut1()
seg-6e0493a39f1a = <c1/> ganham <c2/> e <c3/>. O piso <c4/> é avaliado face ao Bulletin B final e só pode usar épocas que publiquem um; cada linha <c5/> é avaliada face a <c6/>/<c7/>, que recorrem ao valor rápido do Bulletin A. No extrato incluído de { "2026" }, isso são { "12" } de { "31" } amostras a um dia, face a { "0" } no piso — pelo que a linha do piso e as linhas de previsão ao lado assentam em referências mensuravelmente diferentes, o que o relatório passa a indicar em vez de o deixar para ser inferido de uma contagem de amostras que sobe onde os horizontes encaixados dizem que não pode.

# text
# c1: moonlight-service-volume
seg-7ba5be07fa8c = <c1/> emite uma linha de base kepleriana de dimensão igual.

# text
# c1: ephemeris_comparison.keplerian_matched
# c2: 360k/n
seg-f9dc8fae6452 = <c1/> volta a executar a constelação ilustrativa com o número de satélites do próprio conjunto RECUPERADO, presente apenas quando as contagens diferem. A contagem faz parte da geometria desse projeto — a RAAN e a anomalia média são ambas distribuídas como <c2/> — pelo que, sem ela, um conjunto recuperado de cinco satélites era avaliado face a um ilustrativo de oito e o projeto era confundido com a dimensão. Para o conjunto de referência LANS de cinco satélites, { "8.68" } dos 14.24 pontos da lacuna de cobertura resultam ser os três satélites em falta e apenas { "5.56" } pontos o projeto; para as quatro naves realmente em órbita lunar, um conjunto de quatro satélites feito de propósito atinge { "4.86" } % onde elas atingem { "0" } %. Um teste fixa que a linha ajustada é uma constelação reconstruída e não a configurada com outra etiqueta, que foi como foi escrita pela primeira vez e o que a execução então comunicava.

# text
seg-2e7e4dbbb7f6 = <b>Nove cartões de capacidades no site público, cobrindo { "22" } linhas da matriz de verificação que tinham sido publicadas sem cartão ao nível do produto.</b> O motor tinha crescido numa família de capacidades — a verificação ARAIM face a vetores de referência publicados do Working Group C, geometria real de constelações lunares obtidas, o contorno de negação lunar com uma banda de C/N₀ medida, o passo do calendário VLBI para a covariância das estações, a transferência ótica e RF com injeção de falhas entre modalidades, a previsão de orientação da Terra em tempo real face ao Bulletin A arquivado, a partilha de abertura entre navegação e comunicações, a navegação por estima INS/TRN e a cobertura de unidades e proveniência — cada uma com uma linha da matriz e um cenário incluído, e nenhuma delas nomeada em kshana.dev. A cobertura de cartão para linha passa de { "72" } de { "168" } linhas para { "94" }.

# text
# c1: web/app.js
# c2: tests/scenario_examples_doc_sync.rs
# c3: run
# c4: scenarios/
seg-3dc189224fe8 = <b>Oito cenários acrescentados ao catálogo do playground.</b> O botão Run de um cartão de capacidade só aparece quando <c1/> também contém o ficheiro; seis cartões nomeavam um cenário que não continha, pelo que eram apresentados sem forma de os executar — um deles, o datum de telemetria laser real, estava nesse estado desde que foi publicado. <c2/> impõe agora o invariante nas duas metades: o alvo <c3/> de um cartão tem de estar incluído em <c4/> <em>e</em> ser oferecido pelo catálogo. Testado por mutação nos dois modos de falha.

# text
# c1: moonlight-service-volume
# c2: <scenario>.table.csv
seg-2d69334516e9 = <b><c1/> emite a sua geometria por satélite como <c2/></b> quando um local de exportação está configurado (G11). É a maior lista que o crate publica — { "2304" } linhas na tabela conjunta de comunicações e navegação publicada — e chegava aos consumidores apenas dentro de JSON, o formato que truncou a curva de 57 pontos de um cenário irmão para { "23" } pontos sob uma coluna que alegava conter todos. Uma linha por ligação, a contagem de linhas na linha de cabeçalho, as colunas de antena presentes apenas quando uma antena foi configurada. Uma execução sem local de exportação fica inalterada byte a byte e não escreve nenhum ficheiro.

# text
seg-7958d26072f7 = O SBOM descreve agora o que é distribuído: { "60" } componentes passaram a { "66" }.

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
seg-219cd333b000 = <c1/> listava todos os pacotes da resolução com as funcionalidades predefinidas, incluindo as dev-dependencies. Isso punha <c2/> e <c3/> — crates só de teste, compilados em nenhum artefacto — na lista de materiais, e deixava de fora a cadeia <c4/> a que a wheel do PyPI se liga (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), que é a fronteira de interface com código externo dessa wheel. O script percorre agora o grafo de resolução a partir do pacote kshana apenas por arestas normais e de compilação, sobre a união dos conjuntos de funcionalidades predefinido, <c13/> e <c14/> (o pacote npm leva este mesmo SBOM), para todas as plataformas alvo. O veredicto fixado de aderência à norma do CycloneDX é reajustado através do seu gerador registado: { "60" } → { "66" } componentes, { "53" } → { "60" } expressões de licença compostas e continua a haver zero erros de esquema depois de estas serem colocadas na forma <c15/> normalizada.

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
seg-23c98d31f749 = <b>A tabela CSV de reprodutibilidade chega a todas as portas de entrada, não apenas à CLI e à wheel Python.</b> O servidor MCP ganha uma sétima ferramenta, <c1/>, que executa um cenário e devolve a tabela estável ao byte que a CLI escreve como <c2/> — ou um erro que nomeia os tipos de cenário que publicam uma (<c3/>, <c4/>, <c5/> e <c6/> apenas quando <c7/> + <c8/> estão definidos). O módulo WebAssembly ganha <c9/>, que devolve o mesmo texto ou <c10/>. O teste de ida e volta do MCP e os testes da ligação Python fixam agora o CSV devolvido byte a byte face a <c11/>, e fixam que <c12/> devolve os bytes escritos e { "0" } sem criar nenhum ficheiro para um tipo de cenário sem tabela. Todas as superfícies que indicam a contagem de ferramentas MCP ou as listam dizem agora sete.

# text
# c1: run_all
seg-86c3fed5e23a = <c1/> no módulo WebAssembly: uma execução do motor para todas as saídas.

# text
# c1: run
# c2: chart_svg
# c3: summary
# c4: table_csv
# c5: cislunar-arc-recovery
# c6: run_all
# c7: {json, svg, summary, csv}
seg-3f2677cd280b = <c1/>, <c2/>, <c3/> e <c4/> executam cada uma o cenário de raiz, pelo que o playground pagava quatro execuções completas por clique — cerca de { "12" } s em vez de { "3" } s para <c5/> num navegador. <c6/> devolve <c7/> a partir de uma só execução, e o playground usa-a agora. Coincide byte a byte com as quatro chamadas separadas.

# text
# c1: gnss-ins
# c2: +C_b^n b_a
# c3: −C_b^n b_g
# c4: +C_b^n b_g
# c5: scenarios/gnss-ins.toml
seg-fa05c9ee0c6a = <b>REVISÃO: o acoplamento do viés do giroscópio no filtro GNSS/INS tinha o sinal errado, e os valores de interrupção de <c1/> mudam.</b> O filtro de Kalman estendido (EKF) de estado de erro mantém ambos os vieses inerciais como resíduos (verdadeiro menos a estimativa corrente, realimentado por adição). A coluna do acelerómetro conduzia o erro de velocidade com <c2/>, mas a coluna do giroscópio conduzia o erro de atitude com <c3/>. Um viés residual do giroscópio roda na realidade a atitude calculada em <c4/>, pelo que cada estimativa do viés do giroscópio empurrava no sentido errado. O pacote só se manteve estável porque o seu prior predefinido do viés do giroscópio ({ "1e-4" } rad/s, 1 sigma) era suficientemente estreito para manter esses estados quietos. Com um prior mais largo, o filtro divergia mesmo quando o viés verdadeiro do giroscópio era zero: { "93" } m de erro fundido durante a interrupção tornaram-se { "4.3" } km. Os valores publicados de <c5/> mudam do seguinte modo:

# text
seg-47e22e713df6 = antes (≤ { "0.27.2" })

# text
seg-5215a0a41b89 = depois

# text
seg-f58aecc6864c = IMU de átomos frios, RMS fundido durante a interrupção

# text
seg-c4fbd933ddb2 = { "96.1" } m

# text
seg-002d765fca02 = { "1.9" } m

# text
seg-d14616d4ea1b = IMU de átomos frios, navegação por estima dentro da especificação ({ "50" } m)

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-91645c14401b = { "60" } s (a interrupção inteira)

# text
seg-f297a2652cf8 = IMU tática, RMS fundido durante a interrupção

# text
seg-0ac27c6d4206 = { "62.5" } m

# text
seg-eda895cc3b86 = { "3.1" } m

# text
seg-e0ab83f1d8d7 = IMU tática, navegação por estima dentro da especificação ({ "50" } m)

# text
seg-5c526991a521 = { "37" } s

# text
# c1: tests/gnss_ins_sensor_fusion_reference.rs
# c2: closed_loop.rs
# c3: gnss-ins
seg-743060da5543 = Os valores em funcionamento livre ({ "130.7" } m e { "314.3" } m) não mudam; nunca usaram o filtro. A leitura anterior do pacote, de que a navegação por estima fundida é limitada por um piso de atitude na transferência e por isso não melhora com um sensor melhor, era um artefacto deste erro e é retirada. Com vieses constantes e sem ruído, o filtro aprende-os agora enquanto o GNSS está disponível, pelo que a navegação por estima fundida é um melhor caso. A referência externa filterpy (<c1/>) verifica apenas as atualizações de medição, razão pela qual nunca viu a propagação. Dois testes verificam agora o sinal diretamente e ambos falham com o antigo. O primeiro, em <c2/>, introduz um viés residual conhecido do giroscópio no strapdown e exige que o filtro preveja o erro de atitude resultante com um erro até { "2" } %. O segundo exige que um prior largo aprenda um viés de giroscópio de { "1e-3" } rad/s e se mantenha dentro de { "6" } m. A referência multiplataforma de <c3/> é fixada de novo por este motivo e por nenhum outro.

# text
# c1: scenarios/clock-holdover.toml
# c2: TypeError: fetch failed
# c3: init()
# c4: fetch
seg-f764678e3376 = <b>Todos os inícios rápidos do registo funcionam agora como escritos numa máquina limpa.</b> Medido antes desta alteração, os exemplos do crates.io e do PyPI (Python Package Index) liam <c1/>, que uma instalação a partir do registo não tem, e o exemplo npm falhava no Node.js com <c2/>, porque o <c3/> do pacote obtém o seu binário WebAssembly e o <c4/> do Node não consegue ler um ficheiro local. Agora:

# text
# c1: README.crates.md
# c2: README.pypi.md
# c3: README.npm.md
# c4: main
# c5: # Ok::<…>
# c6: tests/readme_code_fences_doc_sync.rs
seg-e77a540d2f90 = <c1/> e <c2/> contêm esse cenário em linha, como <c3/> já fazia. O bloco de código Rust é um programa completo com o seu próprio <c4/>, porque a linha <c5/> oculta pelo rustdoc com que terminava é mostrada no crates.io e não compila quando colada. <c6/> continua a compilá-lo byte a byte, e agora recusa também uma linha oculta no bloco.

# text
# c1: README.npm.md
# c2: initSync
# c3: initSync
seg-ea5204ced0d2 = <c1/> separa o navegador do Node.js e dá uma receita para Node que lê o binário do disco e o passa a <c2/>. O teste de sincronização da documentação aceita <c3/> como o carregador que o wasm-bindgen gera.

# text
# c1: 5ba83a232b94
seg-ebb763695c59 = Todos os três incorporam o cenário com as suas cadeias de proveniência por abreviar, pelo que o hash do cenário é <c1/> em todas as superfícies. O exemplo npm costumava abreviá-las, o que lhe dava um hash diferente do da CLI.

# text
# c1: cargo new
# c2: wasm-pack --target web
seg-dc52363432f8 = Reproduzido a partir de compilações locais desta árvore: um projeto <c1/> novo com uma dependência por caminho do crate empacotado compilou e executou o exemplo Rust; uma wheel construída com maturin a partir das fontes empacotadas, instalada num novo ambiente virtual, executou o exemplo Python; e o pacote <c2/>, empacotado e instalado com npm, executou a receita para Node. Os três imprimiram a mesma linha de resumo.

# text
# c1: cargo run -- <scenario.toml>
seg-07e465a602f1 = <c1/> funciona a partir de um clone.

# text
# c1: Cargo.toml
# c2: default-run = "kshana"
# c3: cargo run --
seg-77ce31300b69 = <c1/> define <c2/>. Sem isso, o cargo recusava com "could not determine which binary to run", que todas as linhas <c3/> da documentação atingiam.

# text
# c1: kshana example
# c2: --help
# c3: --version
# c4: --validate
# c5: ok:
# c6: tests/cli_first_run.rs
seg-2d516597b5f5 = <b>Os erros do primeiro minuto da CLI dizem o que fazer a seguir.</b> Um caminho de cenário que não existe acrescenta agora uma sugestão a apontar para <c1/>, e um segundo argumento posicional imprime o texto de utilização além de nomear o argumento. <c2/>, <c3/>, o erro de opção desconhecida (saída { "2" }) e o <c5/> de uma linha de <c4/> em caso de sucesso já estavam em main. <c6/> cobre agora todos eles, uma vez que nenhum teste executava o binário para nenhum deles antes.

# text
# c1: list_kinds()
# c2: scenario_kinds()
# c3: kshana.pyi
# c4: docs/PYTHON_API.md
# c5: README.pypi.md
# c6: scenario_kinds()
seg-fdd9a27ccfc4 = <b><c1/> em Python está documentada como devolvendo uma única cadeia JSON, não uma lista.</b> Devolve os mesmos metadados que <c2/>, serializados, pelo que iterá-la percorre caracteres. Mantém o seu retorno de cadeia para não quebrar os chamadores existentes. <c3/>, o comentário de documentação da ligação, <c4/> e <c5/> dizem-no agora e apontam para <c6/>.

# text
seg-f0e0c8c12f8a = <b>Os três READMEs do registo explicam todas as abreviaturas na primeira utilização.</b> PNT está agora expandido no slogan, onde aparece pela primeira vez, e CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL e API estão expandidos nos ficheiros que os usam. O título da tabela de referências independentes deixa de dizer "CI-gated" antes de a CI ser definida.

# text
seg-554c5b0c9c60 = Corrigido um valor publicado: a disponibilidade de ARAIM de dupla constelação nos TLE de GPS + Galileo do Celestrak incluídos no repositório.

# text
# c1: docs/CAPABILITY.md
# c2: tests/araim_dual_real_data.rs
# c3: parse_propagators
# c4: parse_tle
# c5: araim_dual_constellation_availability
# c6: docs/CAPABILITY.md
# c7: docs/REAL_TLE_GUIDE.md
seg-1f023a822c91 = <c1/> afirmava que juntar o Galileo eleva a disponibilidade de { "0.21" } para { "0.67" } com um VAL de { "12" } m e que o modo robusto a falhas de constelação é limitado com apenas duas constelações. Isso vinha de <c2/> propagar cada satélite a partir da sua própria época TLE (<c3/> descarta a época), e as épocas nesses ficheiros abrangem { "70.6" } h (GPS) e { "335.7" } h (Galileo), pelo que os satélites estavam em instantes mutuamente inconsistentes. O teste mantém agora cada época (<c4/>) e avalia todos os satélites num único instante UTC comum, a época TLE mais recente do conjunto (2026-06-07T07:{ "21" }:{ "04" }). A disponibilidade medida nas mesmas { "24" } h, numa grelha de 289 amostras, passa a ser GPS isolado { "0.993" } (era { "0.208" }), conjunto { "1.000" } (era { "0.671" }) e dupla robusta a falhas de constelação { "0.990" } (era { "0.031" }); no limite APV-I o modo duplo passa de { "0.180" } para { "1.000" }. A conclusão inverte-se: num céu consistente, duas constelações sustentam a hipótese de falha de constelação com um VAL de { "12" } m. Os mesmos valores resultam com a época TLE mais antiga como referência. Uma autoverificação no teste fixa o seu ciclo de disponibilidade amostra a amostra a <c5/>, pelo que a única diferença é o alinhamento temporal. <c6/> e <c7/> §{ "3" } contêm os novos números; a entrada { "0.13.0" } abaixo fica como foi publicada.

# text
# c1: docs/CAPABILITY.md
# c2: docs/STANDARDS.md
# c3: ROADMAP.md
seg-3173a2e03521 = <b>As superfícies públicas deixam de anunciar o RINEX { "4" } como validado.</b> O motor recusa agora um ficheiro de navegação RINEX { "4" } pelo nome em vez de o descodificar mal, mas a grelha de normas ainda mostrava um cartão "RINEX { "3" } / { "4" }" com uma etiqueta <em>validado</em>, ligada às evidências RINEX-3 do analisador de navegação. O cartão é agora "RINEX { "3" }", e o README, <c1/>, <c2/>, <c3/> e o resumo de capacidades dizem o que é verdade: os ficheiros de observação RINEX 3.0x são analisados, espera-se que o formato de observação { "4.00" } também o seja mas nenhum ficheiro { "4.00" } foi lido pelo código, e os ficheiros de navegação RINEX { "4" } são recusados.

# text
# c1: --validate
seg-c9bb514acb7a = <b><c1/> diz quando "ok" significa que não havia nada para verificar.</b> Cerca de dois terços do catálogo não publicam nenhum campo obrigatório — esses pacotes executam a sua configuração de referência a partir de um corpo vazio — pelo que a verificação só podia imprimir "ok" para eles, com as mesmas palavras que usava depois de verificar seis campos. A linha de sucesso indica agora o número de campos obrigatórios que encontrou presentes, ou que o tipo de cenário não exige nenhum.

# text
# c1: scripts/gate.sh
# c2: REPEAT
# c3: TEST_THREADS
# c4: REPEAT=no
seg-06b324d00285 = <b><c1/> recusa um <c2/> ou <c3/> não numérico.</b> Com o bash { "3.2" }, <c4/> fazia a comparação numérica dar erro e ser avaliada como falsa, pelo que o gate anunciava "repeatability loop SKIPPED (REPEAT={ "0" })" para um valor que não era { "0" } e ainda assim escrevia um recibo. Ambos os parâmetros terminam agora com { "2" }, a menos que sejam inteiros simples.

# text
seg-09d04ffdd9ac = A MSRV é indicada como { "1.85" } em todo o lado onde uma pessoa a lê.

# text
# c1: Cargo.toml
# c2: codemeta.json
seg-dafc23725315 = <c1/> passou para { "1.85" } na última versão; o emblema do README, o texto de instalação e de resolução de problemas, <c2/> e a própria justificação do crate MCP ainda diziam { "1.75" }.

# text
# c1: RunOutput.__repr__
# c2: len()
seg-c2fa8a31058c = <b><c1/> na ligação Python comunica bytes, não "chars".</b> Imprimia <c2/> de cadeias UTF-8, que é uma contagem de bytes: { "710" } "chars" para uma tabela de 708 caracteres.

# text
# c1: --study --study-name
seg-6b4452a4e340 = O README deixa de documentar <c1/> em conjunto.

# text
# c1: --study-name
# c2: --study
seg-47d83e4d847b = <c1/> é uma flag de cenário único, ignorada com <c2/> (o binário avisa). Os dois exemplos de copiar e colar em README.md e README.crates.md mostram agora o comando de estudo sozinho.

# text
seg-5ed7f8330b2d = <b>As evidências de estabilidade de relógio do site indicam ambas as tolerâncias observadas.</b> A série de césio 5071A é reproduzida a ≤ { "3e-5" } e o PHASE.DAT a ≤ { "5e-5" }; o parágrafo indicava { "3e-5" } para ambos.

# text
seg-8bba7f1171f3 = Dois ficheiros de saída do motor deixam de ser seguidos.

# text
# c1: scenarios/quantum-pnt-demonstrator.study.{json,html}
# c2: *.study.json
# c3: *.study.html
seg-ea9bf1d14371 = <c1/> tinham sido carimbados pelo motor { "0.20.0" } com todas as figuras de mérito vazias, e o próprio comando de estudo do README sobrescrevia-os, sujando a árvore e bloqueando o gate de push. <c2/> / <c3/> são agora ignorados como as outras quatro saídas do motor.

# text
# c1: seed
# c2: u64
seg-77ce9b90859d = <b>Um varrimento de sementes no playground deixa de falhar em todas as execuções.</b> O varrimento percorria o parâmetro inteiro <c1/> de forma linear ({ "1" }, { "10.9" }, { "20.8" }, …), e o motor, ao lê-lo como <c2/>, rejeitava cada valor fracionário. Os parâmetros inteiros varrem agora números inteiros distintos.

# text
# c1: realtime-frame-eop
# c2: engine_version
# c3: scenario_hash
# c4: kshana-csv.csv
seg-e1b1e1360eb9 = <b>Todas as transferências do playground dizem que motor e que entrada as produziu.</b> Alguns tipos de cenário (por exemplo <c1/>) não emitem <c2/> nem <c3/>, pelo que as suas transferências se chamavam simplesmente <c4/>. O nome recorre agora à versão do motor carregado e a uma impressão digital FNV-1a-64 de 12 dígitos hexadecimais do texto do cenário.

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
seg-0181e86b576a = <b>O crate publicado tem menos de metade do seu tamanho anterior, e <c1/> compila apenas a CLI.</b> O pacote costumava incluir os artigos, os seus pacotes de submissão, os artefactos das figuras dos artigos, os notebooks, <c2/>, os scripts de manutenção e os programas de exemplo. Nenhum deles é compilado pela biblioteca ou pela CLI. Incluía também os três geradores internos em <c3/> (<c4/>, <c5/>, <c6/>), pelo que uma instalação a partir do registo compilava e instalava quatro executáveis, três deles úteis apenas dentro de um checkout. Essas árvores e as três fontes dos geradores estão agora excluídas. O Cargo lista os binários de um pacote a partir dos ficheiros que ele contém, pelo que o manifesto publicado nomeia apenas <c7/>. Num clone, os geradores continuam a ser encontrados automaticamente, pelo que <c8/> e a tarefa de versão que executa <c9/> ficam inalterados. Medido com <c10/>: { "763" } ficheiros, { "16.7" } MiB, { "6.8" } MiB comprimidos antes; { "591" } ficheiros, { "10.5" } MiB, { "3.0" } MiB comprimidos depois. A sua compilação de verificação, que compila apenas os ficheiros empacotados, passa. <c11/> sobre o crate empacotado instalou um executável, <c12/>.

# text
# c1: p95 0.0ns
# c2: security 0.000
seg-567c7059286f = <b>Uma saída que um engenheiro de temporização consegue ler: acabou <c1/>, acabou <c2/> sem ataque, e as contagens do site coincidem com as dos READMEs.</b> Esta é uma revisão de apresentação. Nenhum número publicado muda; os valores JSON são idênticos, o que os hashes de referência acima demonstram.

# text
# c1: 0.0ns
# c2: p95 1.20e-4ns
# c3: 0.0
# c4: 0.000
seg-849fa9a29f07 = A linha de resumo imprimia o erro de temporização do percentil 95 (p95) do relógio ótico como <c1/> enquanto a tabela ao lado mostrava { "1.20e-4" } ns. Um valor de temporização não nulo demasiado pequeno para uma casa decimal é agora impresso com três algarismos significativos (<c2/>); um zero exato continua a ser impresso como <c3/>. O relatório HTML (HyperText Markup Language), a tabela de comparação do estudo e o relatório transferível do playground usam a mesma regra, pelo que nenhum valor não nulo é impresso como <c4/> também.

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
seg-c44323babd1e = <c1/> é um limite analítico de detetabilidade de spoofing que só tem significado face a um ataque configurado. Os tipos de cenário <c2/>, <c3/>, <c4/> e <c5/> não configuram nenhum, pelo que o seu resumo imprime agora <c6/> em vez de um número como <c7/> que se lê como uma deteção falhada. O valor mantém-se em <c8/>, marcado <c9/> com o motivo em <c10/>, e as tabelas dos relatórios mostram "not applicable". O tipo de cenário <c11/> continua a avaliar a deteção.

# text
# c1: tests/registry_golden.rs
# c2: golden_clock
# c3: security
# c4: golden_orbit
# c5: security
# c6: tests/tutorials.rs
seg-f54d5ffb7dff = Dois valores fixados de resumo em <c1/> mudaram exatamente por estas duas razões e nenhuma outra: <c2/> (o p95 quântico e ambos os valores de <c3/>) e <c4/> (ambos os valores de <c5/>; os seus valores p95 são exatamente zero). Os hashes dos documentos inteiros não mudaram. Os resumos esperados no README, nos três tutoriais e nos seus cenários didáticos foram atualizados em consonância, e <c6/> verifica as cópias didáticas face ao motor.

# text
seg-e8e012376fa3 = A visita guiada do playground deixa de abrir no primeiro carregamento. O seu modal apanhava os primeiros cliques e o seu foco deslocava a página para longe de onde o visitante tinha chegado. Começa a partir do botão "Take the 60-second tour" ou do botão flutuante Tour.

# text
seg-4d60d4ea4d7d = A página deixa de se deslocar na horizontal num telemóvel. A { "390" } px, a linha da marca e o botão do GitHub chegavam a cerca de { "410" } px de conteúdo, um excesso de { "4" } px; o cabeçalho cabe agora a partir de { "320" } px, e a tabela de figuras de mérito desloca-se dentro da sua própria caixa em vez de alargar a página.

# text
# c1: web/data/verification-matrix.json
# c2: web/counts.test.mjs
# c3: tests/web_validation_counts_doc_sync.rs
seg-f6ec6a64071d = O explorador de capacidades começava pela sua própria contagem de cartões ("{ "46" } capability cards … { "17" } backed by an external oracle") ao lado de READMEs que dizem { "64" } de { "168" }. Agora começa pela matriz de verificação, lida a partir do <c1/> gerado (a mesma matriz a que as contagens do README estão fixadas), e nomeia os cartões depois, como a camada de resumo que são. <c2/>, um novo passo no fluxo de trabalho de integração contínua (CI), verifica a aritmética e cruza o README.md com as descrições da página; <c3/> fixa a ligação do lado do Rust.

# text
# c1: docs/POSITIONING.md
# c2: telecom-timing
# c3: docs/TELECOM-TIMING.md
# c4: ROADMAP.md
seg-606098743e57 = <b>A descrição pública começa agora pela temporização e pelo holdover, o domínio mais bem validado.</b> A abertura do README e <c1/> apresentam o Kshana como um motor aberto e reprodutível de evidências de resiliência PNT com proveniência identificada: primeiro a temporização e o holdover de infraestruturas críticas (os estimadores de Allan, Allan modificado, desvio de tempo e erro máximo de intervalo de tempo e a inversão da variância da navegação por estima em holdover são as linhas VALIDATED que a sustentam), a quântica como um método neutro de compromisso quântico-versus-clássico cujos resultados são identificados como MODELLED, e a navegação lunar / cislunar e de espaço profundo como capacidades mantidas e não como o destaque. Ambas as páginas dizem agora o que o Kshana não é — não é um simulador de sinais de radiofrequência nem uma bancada hardware-in-the-loop, nem um substituto do MATLAB/Simulink, do STK ou do Orekit — e apontam para o novo tipo de cenário <c2/> e para <c3/>. A antiga frase "there is no good open tool" desapareceu: uma pesquisa que nada encontra não é evidência de que nada exista. <c4/> ganha uma ordem de prioridades sem datas (primeiro a temporização, em segundo o compromisso quântico, o lunar mantido) e retira três itens desatualizados (as sistemáticas de Coriolis e de desvio de luz, as condições iniciais da NRHO e o cenário lunar, todos já publicados); a linha do README "Coriolis and light-shift remain roadmap" é corrigida da mesma forma.

# text
# c1: docs/CAPABILITY.md
# c2: src/verification.rs
# c3: oem
seg-7bc48692be0b = <b><c1/> deixou de subestimar-se.</b> A linha dos referenciais fixos à Terra dizia "none" enquanto a matriz classifica GCRS→ITRS como VALIDATED; agora diz "full", e a linha dos referenciais de base regista a verificação cruzada com o ANISE como entregue. O modo guiado estava listado como roteiro; o playground já publicou controlos deslizantes guiados e uma visita guiada. Um varrimento face a <c2/> corrigiu mais cinco linhas que eram anteriores às suas validações: o modelo de forças de Cowell e a determinação de órbita em lote/sequencial face ao Orekit { "12.2" }, as passagens de estações terrestres face ao detetor de elevação do Orekit, o núcleo de diluição da precisão face ao gnss_lib_py e a importação OEM face ao analisador independente <c3/>; a linha de verificação e validação nomeia agora as salvaguardas que verificam que todos os testes citados existem.

# text
seg-9d144df304ca = O glossário explica o que diz um ficheiro de resultado.

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
seg-1a4f9d5eef96 = <b>As abreviaturas são explicadas na primeira utilização em todos os documentos públicos escritos à mão.</b> O README e { "24" } ficheiros em <c1/> tinham várias centenas de abreviaturas usadas antes da sua expansão, ou sem ela; cada uma está agora expandida onde aparece pela primeira vez nesse ficheiro. Os três ficheiros gerados (<c2/>, <c3/>, <c4/>) ficam intocados: são escritos a partir de <c5/> e <c6/>, pelo que a sua redação tem de mudar na origem.

# text
seg-2889ce118381 = A cobertura de linhas tem uma medição de referência.

# text
# c1: docs/COVERAGE.md
# c2: coverage
# c3: b1d350d
# c4: tests/coverage_figure_doc_sync.rs
seg-9c4684c0a4ef = <c1/> regista { "95.63" } % ({ "37,697" } de { "39,419" } linhas) da tarefa <c2/> da CI em <c3/>, e <c4/> fixa a ela as cinco superfícies públicas "~{ "96" }%" — o único número de destaque que era mantido à mão, e que já se tinha movido uma vez sem ser notado.

# text
seg-ebd36b7291df = Novos gates de sincronização da documentação para superfícies que nada lia.

# text
# c1: tests/readme_code_fences_doc_sync.rs
# c2: import { … } from "kshana"
# c3: tests/security_md_doc_sync.rs
# c4: src/lib.rs
# c5: #![forbid(unsafe_code)]
# c6: tests/no_overclaims.rs
# c7: web/README.md
# c8: proof
seg-3dd44fc69a28 = <c1/> verifica cada <c2/> num bloco de código JavaScript face às exportações WebAssembly, e fixa o exemplo Rust de README.crates.md byte a byte a uma cópia que o binário de teste compila. <c3/> falha se <c4/> perder <c5/> ou se SECURITY.md deixar de o indicar. <c6/> examina agora também <c7/> e os três READMEs do registo, e toda a norma no site tem de indicar explicitamente a sua <c8/>.

# text
seg-a506d14f3447 = As duas verificações de relógio em hardware real executam-se num runner.

# text
# c1: realdata-clock.yml
# c2: KSHANA_REQUIRE_REALDATA=1
seg-c7f8b8627137 = <c1/> (mensalmente e a pedido) obtém as séries 5071A e PHASE.DAT e executa ambos os testes com <c2/>, pelo que uma entrada em falta falha em vez de ser ignorada. Ambos os scripts de obtenção estão fixados a um único commit do allantools e verificam o SHA-256.

# text
# c1: mypy.stubtest
# c2: csv
# c3: write_csv
seg-3b4a7fee3cd0 = <b>O stub de tipos Python é verificado face à wheel compilada</b> (<c1/> na tarefa de ligações), que é como <c2/>/<c3/> foram publicados sem stub.

# text
seg-24c2ccf3634a = <b>O glossário define URE, EOP, FoM, CTI e TIB</b>, que o README e o registo usavam sem explicação.

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
seg-ae044195cd47 = <b>O contrato publicado de campos de cada tipo de cenário é agora verdadeiro, e um teste mantém-no assim.</b> Cinco dos { "61" } tipos de cenário mudaram. Os tipos de cenário com um <c1/> não vazio passam de { "21" } para { "22" }: <c2/> exige agora <c3/> (um simples <c4/> costumava passar <c5/> e depois falhar a execução), e <c6/> acrescenta <c7/>, que a sua execução já exigia. Uma entrada obrigatória pode usar <c8/> (uma destas) e <c9/> (todas estas em conjunto); <c10/> compreende ambos. <c11/>, <c12/> e <c13/> publicam { "9" } campos opcionais reais que tinham deixado de fora. <c14/> diz agora que <c15/> é obrigatório para todos os tipos de cenário exceto <c16/>. <c17/> verifica cada tipo de cenário face ao seu cenário distribuído: remover qualquer entrada obrigatória tem de fazer a execução falhar, e um documento que contenha apenas os campos obrigatórios tem de executar.

# text
seg-09ba716f3e97 = As notas do JetBrains Marketplace passam por um gate.

# text
# c1: scripts/check-version-sync.sh
# c2: <change-notes>
# c3: plugin.xml
seg-938ff48e7a2d = <c1/> passa a falhar se a entrada mais recente de <c2/> em <c3/> não indicar a versão que está a ser lançada; sete versões publicadas tinham servido as notas da { "0.22.0" } sem alterações.

# text
seg-3d38550854e0 = O valor de cobertura do relatório técnico é o valor medido.

# text
# c1: paper/kshana-technical-report.md
# c2: docs/COVERAGE.md
seg-bd312cd26746 = <c1/> dizia "cerca de { "97" } %"; passa a dizer cerca de { "96" } % ({ "95.63" } % medido, <c2/>) e é a sexta superfície que o teste de cobertura fixa.

# text
# c1: web/engine.test.mjs
seg-934680d402da = <b>O cliente do motor fora da thread principal é testado</b> (<c1/>, na CI): lista de permissões de despacho, cancelamento e novo arranque, as três vias de recurso na thread principal e recuperação após falha, tudo contra um worker simulado.

# text
# c1: release.yml
# c2: docs/RELEASING.md
seg-fd5f9a8a4f43 = <b>Nada é publicado até o commit marcado ter passado nos seus testes, e uma versão só está concluída quando todos os registos a servem.</b> A ordem passa a ser etiqueta, verificação, publicação, paridade, sítio, numa única execução de <c1/> (<a1><c2/></a1>).

# text
seg-745b11c8ed74 = A publicação aguarda o veredicto.

# text
# c1: publish.yml
# c2: mcp-publish.yml
# c3: jetbrains-plugin.yml
# c4: release.yml
# c5: needs: verify
# c6: verify
# c7: scripts/check-release-verdict.sh
# c8: verify
seg-e66c890cf6c0 = <c1/>, <c2/> e <c3/> deixam de arrancar com o push da etiqueta; <c4/> chama-os a partir de tarefas que declaram <c5/>. Antes, corriam em corrida com ela: na { "v0.27.2" }, o crates.io, o npm e o Python Package Index (PyPI) tinham todos publicado em { "4.5" } minutos após a etiqueta, e <c6/> devolveu o resultado { "84" } minutos depois; na { "v0.27.0" }, o npm e o PyPI publicaram enquanto a tarefa do crates.io falhava. Uma repetição manual numa etiqueta é retida pelo novo <c7/>, que exige um <c8/> verde para esse commit exato, obtido a partir da interface de Actions, e falha em modo seguro perante qualquer outra coisa.

# text
seg-3800247c81f2 = <em>Tudo é construído antes de qualquer envio</em>, e o crates.io, cujo passo de empacotamento foi o que falhou a meio de uma versão, publica primeiro.

# text
seg-6929a7608da7 = <em>A falta de um token de registo faz a tarefa falhar</em> em vez de saltar o envio e comunicar êxito.

# text
seg-460811602293 = Uma verificação de paridade após a publicação.

# text
# c1: scripts/check_channel_parity.py
# c2: kshana
# c3: kshana-mcp
seg-86eb0fab2f7c = <c1/> consulta periodicamente o crates.io (<c2/> e <c3/>), o npm, o PyPI (a distribuição de código-fonte e as seis wheels de plataforma) e o ghcr.io até cada um servir a versão, ou falha a execução; o docs.rs e o registo do Model Context Protocol (MCP) são comunicados, mas não exigidos. Executada sobre versões anteriores, deteta a { "0.22.0" } em falta no npm e no PyPI, a { "0.23.0" } no PyPI e a { "0.27.0" } no crates.io.

# text
# c1: kshana-aarch64-apple-darwin
# c2: kshana
# c3: SHA256SUMS
# c4: verify-release
seg-79578a00fd78 = <em>Binários de linha de comandos pré-compilados para macOS (Apple silicon e Intel) e Windows x86-64</em>, com o nome do alvo (<c1/> e semelhantes), ao lado do <c2/> para Linux, cujo nome não muda. Um ficheiro <c3/> abrange todos os ativos, e <c4/> verifica-o e executa os binários de macOS e de Windows nos respetivos sistemas.

# text
# c1: main
# c2: main
# c3: pages.yml
seg-3e1f5afa9f2a = <em>O kshana.dev mostra uma versão publicada, não <c1/>.</em> Costumava ser reimplantado a cada push para <c2/>, enquanto as suas páginas indicavam a última versão. <c3/> passa a construir apenas uma etiqueta de versão: a versão aciona-o quando todos os canais servem a versão, e um acionamento manual reimplanta a última versão (ou uma indicada).

# text
seg-43da8f3f171e = Uma única origem de wheels.

# text
# c1: publish.yml
# c2: wheels.yml
seg-b911ac65e231 = A matriz de seis alvos copiada à mão em <c1/> desapareceu; passa a chamar <c2/>, pelo que a barreira de etiquetas do auditwheel e a verificação de reprodutibilidade ao byte avaliam agora as wheels que o PyPI recebe, e uma falha em qualquer delas interrompe a versão.

# text
# c1: publish.yml
# c2: pages.yml
# c3: @stable
# c4: rust-toolchain.toml
# c5: scripts/check-toolchain.sh
seg-194c4b019a4c = <em>Ferramentas de compilação fixadas.</em> Todos os fluxos de trabalho pedem o Rust { "1.93.0" } (a tarefa msrv, a sua própria versão); <c1/> e <c2/> tinham pedido <c3/>, e o registo da { "v0.27.2" } mostra o rustup a instalar a { "1.98.1" } e a compilar depois com a { "1.93.0" } apenas porque <c4/> tem precedência sobre ela. O wasm-pack está fixado na { "0.13.1" } (a versão que compilou a { "v0.27.2" }, escolhida pelo script instalador sem versão fixada) com uma verificação de soma de controlo, e o mcp-publisher na { "1.8.1" } com o respetivo SHA-256 publicado. <c5/> passa a falhar se um fluxo de trabalho pedir outro compilador ou encaminhar um script descarregado para uma shell. Nenhuma tarefa de verificação, nenhum valor de referência fixado e nenhum script de barreira local foi removido ou afrouxado.

# text
# c1: dtolnay/rust-toolchain
seg-9e2a7376367e = <b>Todas as GitHub Actions de terceiros estão fixadas por SHA de commit</b> — { "93" } referências em { "15" } fluxos de trabalho, { "92" } delas de novo — com a etiqueta mantida como comentário final para o Dependabot a atualizar. A exceção é <c1/>, cuja etiqueta é o seletor da cadeia de ferramentas.

# text
# c1: mcp/kshana-mcp
seg-6afb4a8770b0 = <b>As camadas de base da imagem do servidor MCP estão fixadas por digest multiarquitetura</b>, e o Dependabot passa a vigiar o Dockerfile de <c1/>, pelo que as camadas do SO continuam a receber atualizações de segurança — através de um PR revisto.

# text
seg-4ea8b158b408 = A verificação etiqueta-versus-manifesto é executada nos dois fluxos de publicação que lançam a versão da etiqueta.

# text
# c1: mcp-publish.yml
# c2: jetbrains-plugin.yml
# c3: publish.yml
# c4: scripts/check-version-sync.sh
seg-4b77764e955d = <c1/> (imagem ghcr, registo MCP) e <c2/> (Marketplace) correm em corrida com <c3/> em vez de o aguardar, pelo que uma etiqueta mal criada só era barrada num fluxo irmão. Ambos passam a executar <c4/> antes de compilar.

# text
# c1: rmcp
# c2: rmcp
# c3: rmcp
# c4: kshana-mcp
# c5: rust-version = "1.88"
# c6: kshana
# c7: Content
# c8: ContentBlock
seg-bf90c4063843 = <b>Foram corrigidos quatro avisos de segurança que o Dependabot levantou no dia em que os seus alertas foram ativados.</b> O servidor MCP passa de <c1/> { "1.7" } para { "2.2" }: três avisos contra <c2/> < { "2.1" } (uma fuga na tabela de sessões Streamable-HTTP, a falta de validação de recurso protegido OAuth, cabeçalhos personalizados a seguirem um redirecionamento entre origens) — nenhum alcançável aqui, uma vez que o servidor fala apenas stdio, mas um crate publicado não deve fixar um SDK vulnerável. As macros de <c3/> { "2" } exigem o Rust { "1.88" }, pelo que só <c4/> declara agora <c5/>; a biblioteca <c6/> permanece em { "1.85" }. A única alteração de API (<c7/> → <c8/>) está aplicada, e os testes de ida e volta passam. A ação de análise do SonarQube passa da v5 para a v6, o que corrige um aviso de injeção de argumentos (≥ { "4.0" }, < { "6.0" }).

# text
# c1: navsignal::code_tests
# c2: integrity::tpl_scalar::tests
# c3: api::tests::tracking_loop_kind_round_trips_through_the_dispatch
# c4: .rs
seg-2652aaad177e = <b>Todos os itens Rust citados por uma linha da matriz de verificação são agora resolvidos face ao crate.</b> A proteção existente verificava as citações com forma de caminhos de ficheiro; { "63" } das { "164" } linhas que não são de parceiro indicam a sua evidência como um item interno ao crate — <c1/>, <c2/>, <c3/> — e um token sem sufixo <c4/> era invisível para um analisador de caminhos. Essas linhas podiam ter indicado um módulo renomeado, um módulo de testes esvaziado ou uma função que nunca existiu, e todas as barreiras teriam permanecido verdes.

# text
# c1: tests/verification_rows_name_a_test_that_exists.rs
# c2: #[test]
# c3: mod tests
# c4: #[test]
seg-01eee5115e3f = <c1/> resolve todas as { "339" } citações deste tipo através da árvore de módulos, exige que cada linha que não é de parceiro indique pelo menos um teste que de facto tenha <c2/>, e exige que as linhas de parceiro não indiquem nenhum. Foram usadas quatro mutações para o avaliar: renomear um módulo citado, apontar a única citação de teste de uma linha para uma função que não é um teste, renomear o verdadeiro <c3/> e retirar-lhe os atributos <c4/> — cada uma fica vermelha na asserção que lhe corresponde.

# text
# c1: tests/*
# c2: tests/alternative_complementary_pnt_reference.rs
seg-7731d549c739 = Uma linha já estava errada: <em>Alternative / complementary PNT</em> citava <c1/>, um glob, que não é uma citação. Passa a indicar <c2/> e os três módulos de teste internos ao crate que lhe servem de base.

# text
# c1: tests/published_figures_still_reproduce.rs
# c2: chart.svg
# c3: scenario-fom.png
seg-cf6fd64368de = <b>As figuras publicadas são reverificadas face ao motor em cada compilação</b> (<c1/>). Os três gráficos de demonstração do README são a saída <c2/> do próprio motor e nada voltou a executar o cenário; os dois estudos de cruzamento do artigo foram gerados uma só vez e submetidos; e o README indica quatro figuras de mérito em prosa ao lado de <c3/>. Todas as três estão agora fixadas à saída do motor em execução.

# text
seg-276b65a8f76a = A sua reconciliação revelou o resultado útil: os gráficos de demonstração tinham sido desenhados com o motor { "0.22.0" } e o JSON de cruzamento do artigo com o { "0.20.0" }, e na { "0.27.1" } <b>todos os valores representados nos cinco artefactos são idênticos</b> — os três SVG de gráficos diferem de uma execução nova exatamente em dois carateres cada um, o carimbo de versão no rodapé. Os gráficos foram novamente renderizados para que o rodapé seja verdadeiro. O JSON do artigo é deliberadamente deixado com o carimbo { "0.20.0" }: é o registo da execução cuja figura um artigo publicado incorpora, e recarimbá-lo reivindicaria uma proveniência que o PDF não tem. A proteção afirma, em vez disso, a propriedade mais forte — que o motor atual continua a reproduzir todos os valores publicados.

# text
# c1: VERSION=not provided
# c2: previous_version
# c3: FieldUnit
# c4: ensemble
# c5: hybrid
# c6: fusion
# c7: inertial
# c8: report
seg-c88647c5f2fc = As análises do SonarCloud eram registadas como <c1/>, pelo que o período de código novo de <c2/> nunca avançava: continuava ancorado na análise de 2026-07-02, avaliando oitenta e dois dias de trabalho como um único delta e medindo { "7877" } linhas duplicadas "novas" face a um limiar de { "3" } %. A análise passa agora a indicar a versão do crate. A duplicação subjacente é real e não é escondida por isto: concentra-se nos registos declarativos <c3/> repetidos em <c4/>, <c5/>, <c6/>, <c7/> e <c8/>, e na tabela de verificação de 168 linhas, e é aqui nomeada como trabalho a fazer em vez de excluída da medição.

# text
# c1: scripts/gate.sh
# c2: integration_binaries
# c3: tests_passed
# c4: tests_ignored
# c5: target/gate-run.log
seg-f2a0960a6f11 = <b><c1/> não tinha um bloqueio de escritor único, e todas as execuções escreviam o mesmo registo.</b> Isto não é uma questão de arrumação: <c2/>, <c3/> e <c4/> do recibo são lidos de volta A PARTIR desse registo, e o hook de pre-push confia no recibo. Uma barreira que tivesse sido terminada mas cujo binário de testes ainda estivesse vivo continuava a escrever no ficheiro que a execução seguinte acabara de truncar — pelo que as contagens de uma execução podiam ter sido dadas como as de outra, permitindo um push com base numa suite que nunca correu na árvore que estava a ser enviada. Passa agora a haver uma barreira por cópia de trabalho (recusando com o código de saída { "75" } se houver uma ativa, e limpando um bloqueio obsoleto cujo pid já não existe) e um registo por execução, com <c5/> atualizado a partir da execução que termina, à saída. Ambos os sentidos são testados: um pid ativo recusa, um pid inexistente é limpo.

# text
# c1: src/verification.rs
# c2: verification::gen
# c3: artifacts
seg-687d6fe87221 = <c1/> afirmava que os seus testes "<b>não</b> provam que as cadeias de teste/referência independente nomeadas resolvem para código ativo". Duas proteções fazem agora exatamente isso, pelo que a documentação do módulo dizia o oposto da verdade; passa agora a indicar o que é verificado por máquina e o que fica ao critério humano. Uma referência desatualizada a <c2/> — o módulo é <c3/> — é corrigida na documentação da própria proteção irmã.

# text
# c1: main
# c2: main
seg-014070f0873c = <b><c1/> foi reescrito em 2026-09-22 e enviado com force-push.</b> Dez commits passaram a quatro. A reescrita fundiu cada commit que deixou uma barreira vermelha no commit que a resolveu, de modo que todos os commits em <c2/> têm agora uma árvore que passa, e removeu as execuções canceladas que um grupo de concorrência abrangente a todo o ramo deixava em cada commit substituído.

# text
# c1: git diff
seg-b48d6cfc3b42 = Nada foi descartado. Os commits anteriores à reescrita continuam acessíveis através das etiquetas que apontam para eles, e a árvore final é idêntica ao byte à árvore de que a reescrita partiu — <c1/> entre o antigo topo e o novo é vazio, exceto pelos três ficheiros de fluxo de trabalho que esta versão altera.

# text
seg-0549cfdc6d69 = Os SHA substituídos, para quem tenha uma referência a algum deles:

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
seg-9c220336c895 = <b>As etiquetas { "v0.27.0" } e { "v0.27.1" } deliberadamente NÃO foram movidas.</b> Continuam a apontar para <c1/> e <c2/>, os commits exatos cujas árvores produziram os artefactos agora ativos no crates.io, no npm, no PyPI, no ghcr.io e no registo MCP. O <c3/> de um crate regista o sha1 a partir do qual foi empacotado, os registos são imutáveis, e a atestação de proveniência de compilação SLSA nos ativos da versão { "v0.27.1" } está ligada a esse commit. Mover as etiquetas teria deixado todos esses artefactos publicados a apontar para um commit que já não existe. Deixá-las mantém os commits antigos acessíveis e todas as cadeias de proveniência publicadas a resolver, ao custo de duas etiquetas que deixam de ser antecessoras de <c4/> — que é a razão de esta versão existir: a { "v0.27.2" } dá a <c5/> uma etiqueta própria, empacotada a partir de um commit que lhe pertence.

# text
seg-3c644384256f = Esta é a segunda reescrita divulgada deste histórico; a primeira, em 2026-09-21, canonicalizou a autoria e está registada nas notas da { "0.27.0" } com os seus dois sha1 de crate órfãos. Uma reescrita é aqui divulgada de cada vez, porque um repositório que vende proveniência verificável não pode mover discretamente o chão sob um artefacto publicado.

# text
seg-d82d7a3c9054 = O crate publicado não compilava.

# text
# c1: src/lunar_orientation.rs
# c2: include_str!
# c3: tests/fixtures/llr_geometry/de440_moon_pa.csv
# c4: /tests/fixtures
seg-ebc99c9df1ef = <c1/> contém um <c2/> de nível superior de <c3/>, e o manifesto exclui <c4/> do pacote, pelo que o tarball que o crates.io recebe não tinha um ficheiro que a própria biblioteca incorpora. A publicação da { "v0.27.0" } falhou a sua compilação de verificação por esse motivo e nenhuma { "0.27.0" } chegou ao crates.io; o npm e o PyPI, cujas tarefas não dependem dele, publicaram normalmente. A exclusão passa a incluir uma exceção para esse único catálogo.

# text
# c1: include_str!
# c2: src/
# c3: #[cfg(test)]
seg-6ff9cdb976e8 = Todos os outros <c1/> de um ficheiro de teste em <c2/> estão dentro de um módulo <c3/> e, por isso, nunca chegam à biblioteca empacotada. Só um de nível superior chega.

# text
# c1: cargo package
# c2: package
seg-7f0975453b8f = <b>Nada na CI executava <c1/>,</b> razão pela qual um tarball que não compila foi descoberto pela primeira vez pela tarefa de publicação, depois de dois outros registos já o terem lançado. Uma tarefa <c2/> passa agora a construir e compilar o tarball exato a cada push.

# text
seg-1f2df48821fc = As fixações de emissão da realização do referencial lunar deixam de mudar a cada incremento de versão. O rodapé do SVG contém a versão do motor, pelo que cada versão voltava a fixar três hashes — duas vezes no mesmo dia — e uma fixação refeita por rotina deixa de ser lida. A cadeia de versão é normalizada para um marcador antes do cálculo do hash, e afirma-se separadamente que a emissão indica a versão em execução, de modo que esse facto é verificado com mais precisão do que o hash alguma vez o verificou.

# text
# c1: lunar-llr-datum
seg-56309487ea7e = <c1/> — o datum do referencial lunar a partir de uma campanha de observação real.

# text
# c1: lunar-frame-campaign
# c2: bin_rms / sqrt(n_raw)
# c3: realdata::llr_crd
# c4: lunar_llr
seg-966a2cc4e40d = <c1/> substituiu uma transformação de Helmert injetada por uma campanha <em>simulada</em> e disse-o: a sua rede de estações, o seu calendário e o seu sigma por observação são entradas ilustrativas. Este cenário retira a simulação dos dois sítios onde um calendário e um modelo de erro entram na resposta. As épocas são os instantes de emissão de { "337" } pontos normais arquivados de telemetria laser lunar do ILRS (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } e Matera MLRO { "7941" }, todas as cinco matrizes de retrorrefletores), e cada peso de observação é a precisão arquivada desse próprio ponto normal, <c2/> — uma mediana de { "5.13" } mm de distância de ida, retirada do ficheiro e não escolhida aqui. As coordenadas das estações provêm do IERS ITRF2020 e as coordenadas dos refletores do JPL DE430 Tabela { "7" }; cada ficheiro de teste regista um URL, uma data de obtenção e um SHA-256 e regenera-se a partir da sua fonte por um gerador submetido que verifica a fonte e aborta em vez de emitir um número. O relatório indica quais as ligações medidas e quais continuam modeladas, e as modeladas são <em>medidas</em>: a distância de ida observada menos calculada sobre os dados reais é de { "156 494" } m RMS, o que o mesmo conjunto de testes confirma face ao JPL Horizons no mesmo intervalo ({ "195 655" } m RMS vetorial, pior época { "0.054" }° — dentro dos ~{ "0.3" }° que a série lunar analítica incorporada reivindica para si própria). Aditivo: um novo tipo de cenário, um novo leitor (<c3/>) e um novo módulo (<c4/>); os pacotes de referencial lunar existentes ficam fixados bit a bit.

# text
# c1: sigma_ure_m
# c2: lunar-integrity
# c3: moonlight-service-volume
# c4: LUNAR_SIGMA_URE_M
seg-7fcd2af0a688 = <b><c1/> como parâmetro de cenário</b> em <c2/> e <c3/>. A exatidão de medição de distância do sinal no espaço era uma constante em tempo de compilação (<c4/>), pelo que uma varredura do volume de serviço só podia responder passa/falha a um único valor fixo. Os níveis de proteção são exatamente lineares nela, pelo que expô-la transforma a varredura num <b>requisito</b> de exatidão de medição de distância sobre todo o volume. A predefinição reproduz o comportamento anterior bit a bit.

# text
# c1: moonlight-service-volume
# c2: export_site_lat_deg
# c3: export_site_lon_deg
# c4: per_sat_geometry
seg-c3ccc1e89a2d = <b>Exportação de geometria por satélite</b> em <c1/>: <c2/> + <c3/> acrescentam uma matriz <c4/> com o azimute, a elevação e a distância oblíqua a cada satélite em cada época para um local selenográfico nomeado, mais o indicador de visibilidade. O resumo agregado de cobertura colapsa deliberadamente a geometria por satélite, mas a distância oblíqua é exatamente o que um balanço de ligação consome, pelo que uma análise conjunta de comunicações e navegação não podia ser feita apenas a partir do resumo. Desativada, a menos que ambas as coordenadas sejam indicadas; puramente aditiva.

# text
# c1: lunar_service::topocentric
seg-ae7886fbca9d = <c1/>, o auxiliar público de ângulos de visão por trás da exportação.

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
seg-14ef785b6c12 = <b>O diagrama de antena real na exportação de geometria.</b> O motor transporta desde a P1 um diagrama de abertura circular uniformemente iluminada (<c1/>, a forma de Airy <c2/>) e <b>nada fora de <c3/> o usava</b> — em vez disso, quem fazia o trabalho era um ganho no eixo emparelhado com uma regra empírica de ganho para largura de feixe. Uma tabela <c4/> opcional em <c5/> (lida apenas quando o local de exportação está definido) fornece agora a cada linha exportada o <b>ângulo fora do eixo no satélite</b> e o <b>ganho de emissão em direção ao local a partir desse diagrama</b>, e acrescenta um bloco <c6/> que comunica a <b>contagem dentro do feixe segundo o diagrama real ao lado da contagem dentro do feixe segundo a aproximação simétrica</b> (<c7/>), com a diferença como correção nomeada. Ambos os números são emitidos; nenhum substitui o outro. Medido na abertura lunar representativa do próprio motor (antena parabólica de { "1" } m, { "2.4" } GHz, η = { "0.60" }) sobre um local polar sul e a malha ilustrativa de classe LCNS, os dois <b>divergem em mais de um satélite</b>: o diagrama real coloca { "0" } de { "76" } ligações visíveis dentro do feixe de meia potência, a aproximação afirma { "28" } — uma correção de −{ "2.33" } satélites por época, pior época individual { "3" }. A aproximação traz uma eficiência de abertura própria ({ "0.641" } face à regra de <c8/> graus com que é normalmente citada, { "0.920" } face a uma abertura circular uniforme), pelo que numa antena com η = { "0.60" } devolve um feixe { "1.238" }× demasiado largo; o bloco emite ambas as eficiências implícitas em vez de as deixar para inferência. Puramente aditiva: medidas no ponto de funcionamento documentado, { "597" } folhas pré-existentes, <b>{ "0" } alteradas, { "0" } removidas, { "494" } acrescentadas</b>.

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
seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> e <c7/>, as peças públicas que lhe servem de base. O diagrama está também agora ancorado nas constantes de Airy publicadas, e não apenas em si próprio: o cruzamento de meia potência é localizado por bissecção e comparado com <c8/>, o que torna a largura de meia potência exata <c9/> e regista com honestidade que o coeficiente convencional <c10/> coloca <c11/> em <b>−{ "2.955" } dB</b>, não em −{ "3.010" } dB.

# text
# c1: lunar-time-budget
# c2: x(τ)
# c3: <scenario>.table.csv
# c4: τ
# c5: x
seg-bac7217bb128 = <b>Uma tabela de reprodutibilidade em formato longo para <c1/>.</b> As saídas em matriz do cenário — a grelha de tempos de média, as sete curvas <c2/> por termo e o seu total em raiz da soma dos quadrados — chegavam aos consumidores apenas como matrizes JSON. Uma tabela publicada foi truncada em { "400" } carateres e publicou { "23" } dos seus { "57" } tempos de média sob uma coluna que afirmava conter todos, e o manuscrito reconstruiu as curvas por termo a partir de formas fechadas porque o motor nunca as emitiu. Uma execução simples passa também a escrever <c3/> com uma linha por (índice da grelha, tempo de média, termo), que não pode ser truncada em algo que ainda pareça completo. O índice da grelha é uma chave de junção exata; <c4/> é escrito com { "13" } algarismos significativos e cada <c5/> com { "7" }, para que os bytes não divirjam entre compilações da mesma fonte. Puramente aditiva: o JSON do relatório é idêntico ao byte.

# text
# c1: hybrid-optical-rf
# c2: link_configuration
# c3: units
# c4: variance
seg-ab9209297ec2 = <b>O relatório de <c1/> passa a descrever-se a si próprio.</b> Um bloco <c2/> reproduz as entradas da ligação já resolvidas — comprimento de onda da portadora, abertura de emissão e de receção, distância, largura de impulso, tempo de integração, eficiências e perdas — com as predefinições aplicadas, para que um artigo indique a configuração com que correu em vez de citar uma predefinição lida do código-fonte. Um bloco <c3/> indica a unidade e a classe de proveniência de cada grandeza que um artigo provavelmente citará. Os traços das covariâncias de transferência são a razão da sua existência: eram emitidos como um simples <c4/> e um manuscrito inferiu metros quadrados a partir de uma verificação de consistência interna. A inferência estava certa, e é exatamente por isso que era um defeito — nada teria detetado que estivesse errada. Puramente aditivo: medidos em quatro configurações, { "456" } campos pré-existentes, <b>{ "0" } alterados, { "0" } removidos, { "196" } acrescentados</b>.

# text
# c1: InternalConsistency
seg-5c810155300c = Uma linha da matriz de verificação para a tabela de reprodutibilidade do orçamento de tempo, com honestidade <c1/> / <b>MODELLED</b> — o total é verificado face à raiz da soma dos quadrados dos termos no mesmo ficheiro, que partilha as definições de termos do próprio motor e por isso não é uma referência independente. Em conjunto, estas acrescentam três linhas. O total acumulado desta secção por publicar é de <b>{ "168" } linhas — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

# text
# c1: ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>
# c2: ashfordeOU <contact@ashforde.org>
# c3: Chakshu Baweja <contact@ashforde.org>
# c4: dependabot[bot]
seg-ed290a85ab0e = <b>A autoria dos commits em todo o histórico é agora uma única identidade, e dois crates publicados apontam para um commit que já não existe.</b> Em 2026-09-21, o histórico git foi reescrito de modo que todos os commits humanos são autorados e submetidos por <c1/>. Anteriormente apresentava três grafias de uma mesma pessoa — { "688" } commits como <c2/>, { "34" } como <c3/> e { "94" } já canónicos. O único commit de <c4/> foi deliberadamente deixado com o seu próprio autor: renomear o incremento de dependência de um bot reivindicaria a autoria de trabalho que ninguém aqui fez.

# text
# c1: v0.26.0
# c2: 92284e9420605568f1bfabb78cd95d383b40f3e2
seg-ec4e75f94462 = <b>Nenhum conteúdo mudou.</b> A reescrita tocou apenas nos cabeçalhos de autor e de committer, e isso é verificável em vez de afirmado: a árvore de cada etiqueta e de cada ramo é idêntica bit a bit ao que era antes. <c1/> continua a resolver para a árvore <c2/>, exatamente como antes.

# text
# c1: v0.26.0
# c2: dce2dbf7700788cf6de46260c14673c0e5347360
# c3: d4921f3025569e00e425e1747d0acfc261e96e18
seg-bc0f4fa0a009 = <b>O que custou.</b> O nome de um commit é um hash sobre a sua árvore, os seus pais e os seus cabeçalhos de autor, pelo que alterar um antecessor muda o nome de todos os descendentes. O commit da versão <c1/> era <c2/> e passou a ser <c3/>. Dois artefactos registaram o nome antigo no momento da publicação e não podem ser corrigidos, porque uma versão publicada num registo é imutável por conceção:

# text
# c1: kshana
# c2: .cargo_vcs_info.json
# c3: dce2dbf…
seg-52e096332738 = <c1/> { "0.26.0" } no crates.io — <c2/> regista <c3/>

# text
# c1: kshana-mcp
# c2: path_in_vcs: mcp/kshana-mcp
seg-8ec39d2f136c = <c1/> { "0.26.0" } no crates.io — o mesmo sha1, <c2/>

# text
# c1: gitHead
seg-9a21b7c7b41c = Mais nada é afetado. O pacote npm não regista <c1/>, e a distribuição PyPI não regista nenhum commit; ambos foram verificados em vez de presumidos.

# text
# c1: dce2dbf…
seg-9c51c5fb0d80 = Não existe nenhuma reparação que faça <c1/> nomear o commit reescrito: essa cadeia <em>é</em> a ascendência antiga, e a única forma de a resolver é manter publicado o histórico anterior à reescrita, o que restauraria a autoria que a reescrita removeu. A proveniência da { "0.26.0" } passa, portanto, pela etiqueta e não pelo sha1 registado — e a etiqueta entrega os mesmos bytes a partir dos quais o crate foi construído. A versão seguinte regista um commit válido, sem necessidade de qualquer ação.

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
seg-30ecea86118a = <b><c1/> tinha como predefinição um ficheiro EOP sem linhas de previsão (G12).</b> O cenário incorporava como predefinição offline um extrato <c2/> de cinco linhas <em>apenas finais</em>, pelo que uma execução simples comunicava <c3/> e a tabela por horizonte assentava em pares de { "5" }, { "4" }, { "3" } e { "2" }. O motor sempre pôde ler uma linha de previsão — o ficheiro de entrada é que não tinha nenhuma. A predefinição é agora o extrato IERS { "2026" } textual (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } finais do Boletim B e <b>{ "12" } linhas do Boletim A só de previsão</b>, pelo que uma execução simples sem argumento de ficheiro e sem rede comunica <c5/> e uma tabela por horizonte com n = { "20" } / { "31" } / { "30" } / { "29" }, e a comparação com o previsor operacional e a concordância com as previsões publicadas do próprio produto também ficam preenchidas. O extrato longo de 45 linhas foi medido como alternativa e rejeitado: também é apenas final, pelo que teria deixado <c6/> em { "0" }. <b>Isto altera números publicados</b>, ao abrigo da regra R4 e com autorização do fundador: dez das { "22" } células do <c7/> publicado e { "24" } das { "42" } células preenchidas de <c8/>. O piso medido do polo rápido-menos-final passa a { "0.0678" } mas (dos { "0.0769" } mas), que é o valor que a própria tabela de movimento polar do artigo P4 já publica com n = { "20" } — os dois passam a concordar em vez de diferirem em { "13.5" } %. Todas as outras figuras que o P4 imprime a partir desta tabela ficam inalteradas na precisão impressa. A enumeração completa antigo → novo, incluindo os campos que <em>não</em> mudaram, está em <a1><c9/></a1>. O extrato apenas final continua a ser distribuído, fixado ao byte e exercitado: uma contagem de zero linhas de previsão nele é uma propriedade do ficheiro, e um teste continua a prová-la.

# text
# c1: moonlight-service-volume
# c2: n_sats
# c3: n_sats > 12
seg-17fbc566dc5b = <b>Um limite desatualizado do número de satélites em <c1/>.</b> O cenário limitava <c2/> a { "12" } embora o seu próprio construtor de constelações suporte { "24" } e um teste afirme { "24" }, pelo que toda a contagem pedida acima de { "12" } era reduzida em silêncio e uma varredura do número de satélites devolvia valores idênticos acima de { "12" } — indistinguíveis de uma saturação geométrica genuína. Passa agora a ser limitado ao limite do construtor. Esta é uma alteração de comportamento apenas para <c3/>.

# text
# c1: lunar-differential-pnt
seg-4df7d4d61b40 = O mesmo limite desatualizado em <c1/>.

# text
# c1: lunar_dpnt
# c2: n_sats
# c3: dpnt_nsats_sweep.csv
# c4: n = 16
# c5: n = 12
# c6: n = 16
# c7: n_sats > 12
seg-8adfbd27c4f8 = <c1/> limitava <c2/> a { "12" } com a mesma consequência, e esta chegou a uma tabela publicada: <c3/> contém uma linha <c4/> idêntica ao byte à sua linha <c5/>, porque o motor devolveu uma resposta de doze satélites sob uma etiqueta de dezasseis satélites. Passa agora a ser limitado ao limite do construtor de { "24" }, e um novo teste fixa-o — cada constelação maior tem de comunicar a sua própria contagem e de melhorar estritamente o nível de proteção, para que o limite não possa regressar sem ser notado. <b>Isto altera números publicados</b>: o nível de proteção com <c6/> passa de { "16.92" } m → { "14.57" } m. Varrida até { "24" }, a curva é estritamente monótona ({ "11.94" } m com { "24" } satélites, { "29.5" } % melhor do que com { "12" }), pelo que não há saturação em { "12" } — o aparente patamar era o limite. Alteração de comportamento apenas para <c7/>.

# text
seg-ebee158b73c8 = Uma versão de documentação, transparência e playground. Nenhum comportamento do motor muda: a matriz de verificação mantém-se em <b>{ "102" } linhas — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, sem alteração desde a { "0.25.0" }.

# text
# c1: //!
# c2: lib.rs
seg-7af422ed6d89 = <b>rustdoc ao nível do crate</b> (<c1/> em <c2/>) que abrange os pontos de entrada, o modelo de honestidade/níveis e a reprodutibilidade, para que o docs.rs abra numa verdadeira página de entrada em vez de uma simples parede de módulos.

# text
# c1: docs/SCENARIOS.md
# c2: 50
# c3: api::list_scenario_kinds()
# c4: gen_validation_artifacts
# c5: tests/scenarios_reference_doc_sync.rs
seg-dd44c25f3af5 = <b><c1/></b> — uma referência por tipo de cenário para todos os <c2/> tipos de cenário, gerada a partir de <c3/> (a única fonte de verdade) por <c4/> e protegida por <c5/>, pelo que não pode divergir do despachante.

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
seg-e2cc77d3b413 = <b>Documentação de módulos</b> para os { "11" } módulos públicos anteriormente sem documentação (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

# text
# c1: batch_ls
# c2: cr3bp
# c3: detection
# c4: attitude_budget
# c5: reentry
seg-8d156713799d = <b>Fontes bibliográficas</b> para cinco módulos de fórmulas que enunciavam uma equação mas não indicavam nenhuma referência: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

# text
# c1: security.txt
seg-832b4bfbc48a = <b>Um <c1/> publicado</b> em kshana.dev para divulgação coordenada.

# text
# c1: fomTier()
# c2: src/fom_label.rs
seg-30603f59e27d = <b>Nível de validação por execução no playground.</b> A tabela de figuras de mérito de execução única passa a incluir, por figura, uma etiqueta VALIDATED/MODELLED lida da mesma consulta <c1/> que o relatório descarregável usa (espelhando <c2/>, ele próprio derivado da matriz de verificação), pelo que o nível mostrado ao lado de um número em direto nunca pode divergir do registo.

# text
# c1: lunar-attack-surface
seg-93b203f3a1c0 = <b><c1/></b> no menu do playground — todos os { "50" } tipos de cenário despacháveis estão agora a um clique de distância (eram 49/50).

# text
seg-1ec0830db404 = <b>Mais cinco cartões de capacidade executáveis</b> (meteorologia espacial, avaliação de degradação por RF, resiliência, interoperabilidade CCSDS OEM, KIF), elevando os cartões executáveis de { "11" } para { "16" }. Os cartões só de API e de biblioteca mantêm uma ligação honesta para a documentação em vez de um falso botão de execução.

# text
seg-977ea074dd9d = A cobertura de documentação passa a ser controlada por catraca na CI.

# text
# c1: check-doc-coverage.sh
# c2: missing_docs
# c3: #![warn(missing_docs)]
# c4: -D warnings
seg-beb308bcaafb = <c1/> compila a biblioteca com <c2/>, conta os avisos e só falha se a contagem subir acima de um teto fixado ({ "986" }). Um <c3/> rígido sob <c4/> teria transformado cerca de { "1000" } itens públicos atualmente sem documentação numa rutura de compilação da noite para o dia; assim, os novos itens públicos sem documentação fazem falhar a compilação enquanto o atraso existente é saldado deliberadamente.

# text
# c1: list_scenario_kinds
# c2: api::list_scenario_kinds()
seg-27668072a608 = <b>A linha da ferramenta MCP <c1/> anunciava "~{ "17" } tipos de cenário incorporados"</b> enquanto <c2/> expunha { "50" } havia algum tempo — uma documentação dirigida a agentes que subestimava a capacidade real em três vezes. Fixada à contagem verdadeira.

# text
seg-1ffc9f9816e8 = Regenerada a referência independente de aderência à norma do SBOM CycloneDX para o grafo de dependências atualizado ({ "60" } componentes). O veredicto de aderência à norma mantém-se: zero erros de esquema normalizados e todos os identificadores atómicos de licença continuam na enumeração oficial SPDX.

# text
seg-a6db590bbcbe = <b>Cinco capacidades promovidas a externamente VALIDATED</b>, cada uma agora verificada de forma cruzada com uma implementação independente de terceiros da mesma grandeza definida de forma única (não circular, com ficheiros de teste regeneráveis offline):

# text
# c1: allantools
# c2: tests/powerlaw_oadev_reference.rs
seg-98588143b4bb = <b>Conversão de lei de potência IEEE-1139 → desvio de Allan</b> face às formas fechadas de <c1/> para os cinco tipos de ruído (<c2/>);

# text
# c1: tests/crpa_reference.rs
seg-ce37d70fa8bc = <b>Pesos do formador de feixe CRPA MVDR / de anulação de norma mínima</b> face ao LAPACK de numpy/scipy (<c1/>);

# text
# c1: Rotation.align_vectors
# c2: tests/wahba_reference.rs
seg-0f033d1027f8 = <b>Determinação de atitude de Wahba / TRIAD / QUEST</b> face ao <c1/> por SVD do SciPy em observações sem ruído (<c2/>);

# text
# c1: oem
# c2: tests/ccsds_oem_covariance_reference.rs
seg-e1e2283cb524 = <b>Intercâmbio de blocos de covariância CCSDS { "502.0" } OEM</b> com ida e volta através do analisador da biblioteca independente <c1/> (<c2/>);

# text
# c1: ncx2
# c2: chi2
# c3: tests/acquisition_reference.rs
seg-579eefbb646f = o <b>núcleo de estatísticas de deteção de aquisição de lei quadrática</b> (Marcum-Q generalizado / P_d / P_fa / limiar) face ao SciPy <c1/>/<c2/> (<c3/>). A matriz de validação verificada por máquina passa para <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> em <b>{ "102" } linhas</b> (eram { "51" } · { "47" } · { "4" }). Mantêm-se as ressalvas honestas de âmbito — por exemplo, a promoção da aquisição abrange apenas o núcleo de estatísticas de deteção; CFAR/perda por desalinhamento continua MODELLED.

# text
# c1: fom::positioning_performance
# c2: 0.589·(σ₁+σ₂)
# c3: scipy.stats
# c4: tests/positioning_fom_reference.rs
# c5: ()
# c6: (cov_enu, hpl_m)
# c7: PositioningFom
seg-b6a140d55580 = <b>Figuras de mérito no domínio da posição</b> (<c1/>): CEP, SEP e 2DRMS exatos a partir da covariância de posição ENU 3-D de uma solução de navegação mais um nível de proteção horizontal. CEP/SEP são os erros radiais medianos <em>exatos</em> (não a regra linear <c2/>), verificados de forma cruzada com quantis rayleigh/maxwell de <c3/> e uma mediana Monte-Carlo independente em NumPy (<c4/>). Substitui o anterior esboço honesto de não implementado — <b>a assinatura da função mudou</b> de <c5/> a devolver um erro para <c6/> a devolver um <c7/>.

# text
# c1: assurance::uncertainty::edf
# c2: allantools
# c3: edf_greenhall
# c4: edf_totdev
# c5: tests/uncertainty_edf_reference.rs
seg-1551afa17154 = <b>Graus de liberdade equivalentes (EDF) do intervalo de confiança completados para todos os estimadores da família de Allan</b> (<c1/>): o EDF do Allan modificado, de Hadamard e da variância total usa agora o algoritmo de EDF combinado de Greenhall & Riley e a forma TOTVAR da Tabela 7 do NIST SP { "1065" } (anteriormente só estava implementado o EDF do Allan sobreposto; os outros reutilizavam-no em silêncio), verificado de forma cruzada com <c2/> <c3/>/<c4/> (<c5/>).

# text
# c1: tests/validate_p*.rs
# c2: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c3: scipy.special.j1
# c4: (HᵀH)⁻¹
# c5: finals2000A
# c6: src/verification.rs
seg-39753e7919cc = <b>Verificações cruzadas externas independentes para as capacidades de geometria, DOP, EOP, DRO e medição de distância por RF do PNT lunar</b> (<c1/>, com ficheiros de teste e geradores de referência independente em <c2/>). Cada verificação põe uma capacidade <b>modelada</b> já distribuída contra uma referência independente produzida por uma implementação <em>diferente</em>, pelo que a concordância é não circular: a pegada orbital de emissão/captura face a <c3/> (Cephes — um Bessel J1 genuinamente diferente); o DOP da geometria de balizas de superfície face a uma resolução independente <c4/> em NumPy; o crescimento do erro de previsão por persistência UT1/EOP face a uma nova análise separada em NumPy das mesmas linhas IERS <c5/> textuais; a família planar de órbitas retrógradas distantes face à Three-Body Periodic Orbit Database da NASA/JPL; e o orçamento de precisão de medição de distância por RF face a uma referência de primeiros princípios. Estas são evidências de regressão adicionais para módulos existentes; acrescentar estes testes de verificação cruzada não reclassifica por si só nenhuma capacidade (as cinco promoções acima são alterações de estado distintas, apoiadas em referência independente, em <c6/>).

# text
# c1: lunar-attack-surface
# c2: src/attack_surface.rs
# c3: kind = "lunar-attack-surface"
# c4: run_toml
seg-662c04f0552f = <b>Cenário <c1/></b> (<c2/>, <c3/>): uma execução composta de segurança de sinal lunar P1, alcançável por binário (CLI / Python / MCP / wasm através de <c4/>), que reúne o défice de potência do balanço de ligação e a sua banda de sensibilidade de { "12" }–{ "18" } dB, a potência de emissão de jamming/spoofing necessária em função da distância de afastamento, a pegada orbital de captura sob um diagrama de antena real, o resultado de aquisição por arrastamento na captura de spoofing do circuito de seguimento, o alcance do horizonte em corpo sem atmosfera e o orçamento de autenticação OSNMA/TESLA. Um corpo vazio reproduz a linha de base P1.

# text
# c1: linkbudget::deficit_sensitivity_band
# c2: deficit_power_factor
# c3: sweep::SweepAxis
# c4: received_signal_power_dbw
seg-a9b7ee942a23 = <b>Banda de sensibilidade do défice de potência</b> (<c1/>, <c2/>): uma varredura genuína de vários eixos (referência × EIRP × distância oblíqua) construída sobre <c3/> e avaliada através de <c4/>, que reproduz a banda P1 de { "12" }–{ "18" } dB e reconcilia as figuras de fator linear de { "32" }× (arredondada) / { "36" }× (não arredondada).

# text
# c1: spoof_capture::capture_cube
# c2: capture_map
seg-0734a4ca7535 = <b>Cubo tridimensional de captura de spoofing</b> (<c1/>): acrescenta ao mapa de captura o eixo de desvio de portadora/Doppler (J/S × desvio de código × desvio de portadora, tempo de bloqueio por célula); a fatia de portadora zero reduz-se exatamente ao <c2/> 2-D.

# text
# c1: monitor_network
# c2: spoof_monitors
# c3: lunar_service
# c4: detection
# c5: SurfaceMonitor
# c6: SpoofEvent
seg-3b9bbc25b114 = <b>A deteção por rede dispersa de monitores</b> (<c1/>) passa a compor a estatística física de AGC de <c2/> e a grelha de visibilidade selenográfica de <c3/> para derivar a estatística de deteção e a geometria de cada estação, em vez de parâmetros livres e de uma sobreposição de círculo máximo ad hoc; as probabilidades de deteção por monitor e da rede continuam a ser as formas fechadas de qui-quadrado/Marcum-Q de <c4/>. <b>Os campos de <c5/> / <c6/> mudaram</b> para grandezas físicas (lat/lon/alt/potência).

# text
# c1: nma_budget
# c2: auth_latency
seg-54c36267382c = <b>Dimensionamento da sobrecarga de autenticação OSNMA/TESLA</b> (<c1/>): as porções de campo OSNMA por página (HKROOT de 8 bits + MACK de 32 bits por página de { "2" } s) estavam mal etiquetadas como totais por subtrama, subestimando a sobrecarga em { "15" }× ({ "1.33" } bit/s). Corrigido para os totais publicados do SIS-ICD por subtrama de 30 s (HKROOT { "120" } + MACK { "480" } bits ⇒ <b>{ "20" } bit/s</b>). A consequência é agora declarada com honestidade: a uma taxa de mensagem de navegação AFS de { "50" } bit/s, a sobrecarga de autenticação é um custo <b>de primeira ordem de ≈{ "40" } %</b>, e não uns poucos por cento desprezáveis; o campo <c2/> é documentado como o atraso de divulgação da chave (um limite inferior do tempo até à primeira posição autenticada de ponta a ponta).

# text
seg-0cf179a34252 = Uma versão de capacidades alargada. Traz duas suites de análise totalmente <b>validadas externamente</b> — uma família completa de <b>análise de decisão multicritério (MCDA)</b> e os estimadores de <b>deriva de Allan / estabilidade de relógio em τ longo</b> — e abre uma nova camada de cenários executáveis de <b>orçamento de tempo lunar, referencial/EOP em tempo real, híbrido ótico/RF, observabilidade cislunar e resiliência a conflitos de PNT em camadas</b> sobre o substrato, além de um substrato de capacidades de <b>baliza de superfície lunar</b> e de <b>segurança de sinal</b>. A matriz de validação verificada por máquina cresce para <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> em <b>{ "102" } linhas</b> (eram { "40" } · { "47" } · { "4" } em { "91" }): todas as onze novas linhas são validações com referência independente externa dos estimadores de análise de decisão e de temporização, verificadas face a bibliotecas independentes (SciPy, pymcdm, pyDecision, allantools) com tolerância apertada, enquanto a nova superfície de capacidades de PNT é apresentada com honestidade como MODELLED. Como sempre, nenhuma afirmação de modelo numérico é promovida sem um conjunto de dados externo por trás.

# text
# c1: kind
# c2: tests/determinism.rs
# c3: scenarios/*.toml
seg-267e50f8dd56 = <b>Cenários executáveis</b> — cada um um <c1/> de cenário registado, despachado através do motor e comprovado de ponta a ponta na CI por <c2/> (que executa todos os <c3/> incluídos e falha de forma estrita perante qualquer ficheiro de teste não executável):

# text
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Resiliência a conflitos de PNT em camadas</b> (<c1/>, <c2/>) — um motor de resiliência Monte-Carlo com semente para uma arquitetura PNT de várias camadas, com um modelo de <b>sobrevivência de degradação gradual por vetor</b> do §{ "4.2" } (quatro vetores de ameaça nomeados, a forma fechada de sobrevivência de PNT utilizável para a qual converge o Monte-Carlo de cada camada, emitida no JSON de resultados) e uma proveniência documentada, protegida contra deriva, dos parâmetros de ameaça (<c3/>). Arquiteturas MODELLED; a convergência do Monte-Carlo de sobrevivência → forma fechada é o núcleo validado.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Observabilidade cislunar</b> (<c1/>, <c2/>) — um espetro de valores próprios da gramiana de observabilidade ao longo de um arco, um gerador de sementes de órbita retrógrada distante (DRO) corrigido diferencialmente e uma verificação cruzada independente por filtro de informação de raiz quadrada cuja covariância a posteriori se torna finita exatamente com a característica observável completa. Constelação MODELLED; os invariantes de característica/gramiana/STM/SRIF são o núcleo validado.

# text
# c1: hybrid-optical-rf
# c2: src/hybrid_integrity.rs
# c3: src/optical_availability.rs
# c4: src/optical_linkbudget.rs
# c5: src/cross_raim.rs
seg-92fb333483e5 = <b>Continuidade e integridade híbridas heterogéneas ótico/RF</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — disponibilidade e integridade entre domínios quando o PNT ótico e o de RF são combinados. MODELLED.

# text
# c1: lunar-time-budget
# c2: src/lunar_time_budget.rs
# c3: realtime-frame-eop
# c4: src/realtime_frame_eop.rs
# c5: src/frame_eop.rs
seg-08e2f640ae14 = <b>Orçamento de tempo lunar endógeno</b> (<c1/>, <c2/>) e <b>orçamento de referencial / EOP em tempo real</b> (<c3/>, <c4/>, <c5/>) — os orçamentos de tempo lunar e de orientação da Terra P3/P4 derivados endogenamente da cadeia de temporização em vez de afirmados. MODELLED.

# text
seg-52c2f9c2c9a7 = <b>Suites de análise validadas externamente</b> — capacidades de biblioteca, cada uma a entrar na matriz como novas linhas VALIDATED (verificadas face a uma referência independente externa, não a uma autoverificação):

# text
# c1: src/mcda/
# c2: tests/mcda_*_reference.rs
seg-709789e8fb04 = <b>Suite completa de análise de decisão multicritério (MCDA)</b> (<c1/>) — as quatro famílias de métodos: agregação de valor (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), sistema de razões (<b>MOORA</b>) e proporcional (<b>COPRAS</b>), distância ao ideal (<b>TOPSIS</b>), programação de compromisso (<b>VIKOR</b>) e sobreclassificação (<b>PROMETHEE II</b> com seis formas de critério generalizado, <b>ELECTRE I</b> concordância/discordância) — mais pesos de prioridade por vetor próprio de Perron do <b>AHP</b> com a barreira da Razão de Consistência de Saaty (CR < { "0.10" }), utilidade <b>MAUT</b>, extração da frente de Pareto e análise de <b>sensibilidade</b> dos pesos. Os nove agregadores reproduzem o <b>pymcdm</b> / <b>pyDecision</b> e o vetor próprio do AHP coincide com o SciPy/LAPACK, tudo com < { "1e-9" } (<c2/>). O tornado de sensibilidade é também apresentado dentro do cenário de resiliência a conflitos.

# text
# c1: src/allan.rs
seg-2ce49cbfd8bf = <b>Estimadores de deriva de Allan e de estabilidade de relógio em τ longo</b> (<c1/>) — <b>MTIE</b> (a estatística de deriva de erro de tempo pico a pico ITU-T G.810/G.823/G.8261 em que se baseiam as máscaras de sincronização), deriva no domínio do tempo <b>MDEV</b> e <b>TDEV</b>, e estimadores de alcance alargado <b>Theo1 / TOTVAR</b>. VALIDATED face ao <b>allantools</b> na série NIST SP { "1065" }; o <b>ThéoH</b> híbrido sem enviesamento construído sobre o TOTVAR continua, com honestidade, MODELLED.

# text
# c1: src/assurance/
seg-68bcdf8bd5de = <b>Estrutura de garantia / referência independente externa</b> (<c1/>) — uma estrutura de referência independente ligada diretamente à barreira de honestidade da CI, um registo de proveniência <b>W3C-PROV</b> com uma raiz de Merkle determinística, e graus de liberdade equivalentes de <b>Greenhall</b> + intervalos de confiança de qui-quadrado nas estimativas de estabilidade.

# text
# c1: src/registry.rs
# c2: src/api.rs
# c3: ExternalPack::register_into
seg-dcb91813b24c = <b>Ponto de extensão PackRegistry / ExternalPack</b> (<c1/>, <c2/>) — um ponto de despacho para que os pacotes de capacidades passem por um único registo (o despacho incorporado está no caminho crítico da CLI; os pacotes externos à árvore ligam-se por trás de um <c3/> com predefinição), protegido por uma suite de aderência à norma de identidade byte a byte de referência e por barreiras de CI autónoma / wasm32.

# text
# c1: kind
seg-16b1f5d249ed = <b>Substrato de capacidades modeladas</b> — novos módulos de biblioteca que alimentam os cenários acima e futuros (ainda não são um <c1/> de cenário autónomo):

# text
# c1: src/lunar_beacon.rs
# c2: src/lunar_perturbed.rs
# c3: src/jamming.rs
# c4: src/linkbudget.rs
seg-f8c9ffbc56cf = <b>DOP de balizas de superfície lunar</b> (<c1/>) com orçamento de exatidão realizada, varredura de N satélites e mapa de GDOP, mais uma efemérides lunar perturbada (<c2/>) e geometria de horizonte sem atmosfera / inversa da potência de spoofing / banda de défice AFS (<c3/>, <c4/>). Reutiliza o núcleo de DOP validado pelo gnss_lib_py.

# text
# c1: src/realdata/lola_dem.rs
seg-28209a2747d5 = <b>Ingestão de DEM em formato LOLA</b> + linha de vista sobre o terreno (<c1/>).

# text
# c1: src/spoof_capture.rs
# c2: src/cross_sensor_integrity.rs
# c3: src/monitor_network.rs
# c4: src/antenna.rs
# c5: src/nma_budget.rs
seg-6e98ac90a0e2 = <b>Defesa de segurança de sinal em três camadas</b> — captura de spoofing, integridade entre sensores e dimensionamento da rede de monitores (<c1/>, <c2/>, <c3/>) com uma pegada de feixe de antena orbital e um orçamento de autenticação OSNMA (<c4/>, <c5/>). MODELLED.

# text
# c1: src/verification.rs
seg-bd5b9511accb = A matriz de validação e todos os artefactos derivados foram regenerados a partir da única fonte de verdade (<c1/>): o registo no sítio, os diagramas do mapa de módulos e da proveniência da validação, e as cadeias de contagem do README / por superfície indicam agora <b>{ "51" } / { "47" } / { "4" } de { "102" }</b> (eram { "40" } / { "47" } / { "4" } de { "91" }); a proteção de honestidade das contagens passa a analisar todo o histórico git, e as figuras do README estão unificadas na paleta escura da marca.

# text
# c1: integrate
# c2: integrate_dopri
# c3: src/integrator.rs
seg-c2ec7e2b6296 = Um único controlador de integração adaptativa partilhado suporta agora <c1/> e <c2/> (<c3/>), removendo o integrador de passos duplicado.

# text
seg-85cfb0f10268 = Análise estática do <b>SonarQube Cloud</b> acrescentada à CI (Rust + cobertura importada), com selos de classificação de segurança / manutenibilidade / fiabilidade no README.

# text
seg-deeef8318367 = Disciplina de versão / empacotamento: a CI regista um ambiente de implantação por cada publicação de pacote/registo, e a tarefa pública autónoma focada deixou de abranger os binários de validação lentos.

# text
seg-30181148b098 = A proteção de higiene de não atribuição limita-se a marcadores de autoria, pelo que nomear um anfitrião de integração ou um produto deixa de fazer falhar a compilação.

# text
seg-6eb3868fdce0 = Documentação: a secção <b>Citing</b> do README lista agora os quatro preprints arXiv publicados, e a capacidade de DOP de balizas de superfície está documentada na linha lunar.

# text
seg-d12533cbf1f2 = Contadores de ciclo inteiros para ciclos conduzidos por vírgula flutuante (Sonar S2193).

# text
seg-3c213354187f = Inversa do qui-quadrado exata com poucos graus de liberdade, por refinamento de Newton, no caminho do intervalo de confiança de garantia.

# text
seg-386b7094d34d = kshana.dev: a secção de normas passa a abrir por predefinição e a contagem de recurso do registo foi corrigida; cadeias desatualizadas do README / do sítio em torno da camada de observabilidade foram sincronizadas.

# text
seg-33448f46894f = Uma versão de capacidades que acrescenta uma <b>camada geral de informação de Fisher / observabilidade de Cramér–Rao e conceção ótima de experiências</b>, e a versão em que assenta o artigo de observabilidade do PNT lunar. A matriz de validação verificada por máquina cresce para <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> em <b>{ "91" } linhas</b> (eram { "39" } · { "46" } · { "4" } em { "89" }): o novo motor de estimação é verificado face a uma referência independente externa e é VALIDATED; a sua aplicação lunar é, com honestidade, MODELLED. Como sempre, nenhuma afirmação de modelo numérico é promovida sem um conjunto de dados externo por trás.

# text
# c1: src/fim.rs
# c2: M = HᵀWH
# c3: best_design
# c4: eigh
# c5: inv
# c6: tests/fim_observability_reference.rs
seg-c377207026f4 = <b><c1/> — informação de Fisher, limites de Cramér–Rao e conceção ótima de experiências.</b> Um motor geral e reutilizável de teoria da estimação: a matriz de informação de Fisher <c2/> a partir de um jacobiano de medição e de pesos; um resolvedor de valores próprios simétrico (Jacobi cíclico); o limite inferior de Cramér–Rao através da inversa, ou da pseudoinversa de Moore–Penrose mais uma base do espaço nulo quando a informação tem défice de característica (o caso de rede livre / defeito de datum); e métricas de conceção de experiências ótimas D, A, E e T com um seletor <c3/> sobre geometrias candidatas. <b>VALIDATED</b> face ao NumPy (<c4/>/<c5/>) e aos limites de forma fechada publicados de Kay ({ "1993" }) até { "1e-9" } (<c6/>), pelo que entra na matriz como uma linha com referência independente externa e não como uma autoverificação.

# text
# c1: lunar_observability
# c2: src/lunar_combination.rs
seg-91d09b4e737f = <b>Observabilidade de OD conjunta lunar</b> (<c1/> em <c2/>, apresentada no relatório de combinação lunar): aplica o motor FIM/CRLB à resolução conjunta de órbita e relógio para expor o defeito de datum absoluto das estações, a sua restauração de característica à medida que se acrescentam estações com linha de base na Terra, o CRLB atingido da posição das estações e o condicionamento ótimo E. Com honestidade <b>MODELLED</b> — o motor de estimação é validado externamente, mas a rede lunar a que é aplicado é uma simulação representativa, e nenhum conjunto de dados atual pode transformar essa geometria numa medição.

# text
# c1: orbit_ecc
# c2: orbit_inc_deg
# c3: orbit_argp_deg
# c4: orbit_planes
# c5: elfo_geometry_confirms_the_observability_structure
seg-6b1cd00aca8c = <b>Geometria representativa de órbita lunar elíptica congelada (ELFO)</b> para o cenário de combinação lunar (<c1/>, <c2/>, <c3/>, <c4/>; a colocação circular continua a ser a predefinição) e um campo de observabilidade sem VLBI no relatório, para que se possa mostrar que o resultado do defeito de datum é geral quanto à geometria. A mesma escada { "3" }→{ "1" }→{ "0" } e o mesmo limiar de três estações valem numa ELFO da família Moonlight/LCNS, e com três linhas de base VLBI com a Terra a posição absoluta da estação é observável com um limite submétrico — fixado por <c5/>. Continua MODELLED.

# text
# c1: src/verification.rs
# c2: web/data/verification-matrix.json
# c3: docs/VERIFICATION-MATRIX.md
# c4: docs/MODELLED-RATIONALE.md
seg-9e6627c0c417 = A matriz de validação e todos os artefactos de evidência gerados foram regenerados a partir da única fonte de verdade (<c1/>): o registo (<c2/>), <c3/>, <c4/>, as figuras de repartição da validação e do tipo de referência independente, e as cadeias de contagem do README em todas as superfícies de distribuição indicam agora <b>{ "40" } / { "47" } / { "4" } de { "91" }</b>.

# text
seg-6f90233290a2 = Uma versão de correção apenas de empacotamento. Sem alterações ao motor, aos cenários ou aos resultados; a matriz de validação mantém-se em { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER em { "89" } linhas.

# text
# c1: repository.url
# c2: AshfordeOU
# c3: repository
# c4: ashfordeOU
# c5: package.json
seg-9d41e1412d1f = Publicação no npm: o pacote <c1/> derivado do manifesto do crate usava o proprietário do GitHub com maiúsculas erradas (<c2/>), o que falhou a verificação de proveniência sigstore do npm (que compara o proprietário distinguindo maiúsculas de minúsculas). O <c3/> do manifesto é agora o <c4/> canónico em minúsculas, pelo que o <c5/> gerado coincide com o sujeito da proveniência e a versão npm é publicada.

# text
# c1: codegen-units = 1
seg-fe1f8aae99f4 = A compilação das wheels fixa <c1/> para que a wheel manylinux seja reproduzível ao byte entre recompilações (a verificação de reprodutibilidade por recompilação e diferença).

# text
seg-b87075b47007 = Uma versão de consolidação centrada na <b>disciplina de evidências, proveniência e distribuição</b>. A matriz de validação verificada por máquina cresce para <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> nas suas <b>{ "89" } linhas</b> (eram { "15" } · { "42" } · { "4" } em { "61" }), impulsionada pela verificação cruzada de capacidades modeladas face a referências independentes externas. Todos os artefactos distribuídos passam a incluir uma atestação criptográfica de proveniência de compilação SLSA, distribuem um SBOM CycloneDX e são publicados em simultâneo em todas as superfícies. Nenhuma afirmação de modelo numérico é promovida sem um conjunto de dados externo por trás; a nova capacidade continua, com honestidade, MODELLED.

# text
# c1: src/attitude_dynamics.rs
seg-f6de783bfd29 = <b>Dinâmica de atitude</b> (<c1/>, MODELLED) — equações de Euler de corpo rígido sem binário + cinemática de quaterniões (RK4), com autotestes de leis de conservação (norma do quaternião, energia cinética, |Iω|, precessão de pião simétrico).

# text
# c1: quantum_trade
# c2: tests/fixtures/optical_clock_adev/
# c3: src/sdr.rs
# c4: src/altpnt/terrain.rs
seg-339bc18b9fc4 = <b>Verificação cruzada de capacidades modeladas</b> face a referências independentes externas, levando a matriz de validação a { "39" } linhas VALIDATED, cada uma apoiada num conjunto de dados externo (a barreira de honestidade da CI proíbe um estado VALIDATED sem um). As validações com referência independente externa mais recentes: a <b>curva de estabilidade medida de relógio ótico</b> (o ajuste da curva de ADEV de <c1/> reproduz a σ_y(τ) publicada do relógio de rede ótica de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, incorporada em <c2/>); a <b>geração do código de espalhamento GPS L1 C/A</b> (o LFSR G1/G2 de <c3/> reproduz os octais de fase de código da Tabela 3-Ia do IS-GPS-200 para os PRN { "1" }–{ "9" }); e o <b>leitor de elevação digital SRTM em terreno real</b> (<c4/> lê um mosaico SRTM v3 da NASA/USGS de domínio público incorporado, N36W117 / Vale da Morte, colocando Badwater Basin dentro da sua banda de levantamento documentada).

# text
seg-665d0dde637b = <b>Novas capacidades MODELLED</b>, cada uma verificada internamente de forma cruzada com uma forma fechada ou um caminho de código irmão: dinâmica de movimento relativo de Clohessy–Wiltshire / Hill, geolocalização passiva de emissores por TDOA/FDOA, determinação de atitude de Wahba/TRIAD/QUEST, resolução de ambiguidade inteira da fase da portadora GNSS (LAMBDA), apontamento no plano B e assistência gravitacional por cónicas ajustadas, formação de feixe de agrupamento antijamming CRPA, estatísticas de aquisição GNSS de lei quadrática, ambiguidade de franjas / gama dinâmica de sensores inerciais quânticos, ruído de relógio de lei de potência IEEE-1139 + patamar de flicker-FM, e intercâmbio de blocos de covariância CCSDS-OEM.

# text
seg-b3f53d5e3c3a = <b>Registo de evidências de fonte única</b> com documentos de verificação gerados e uma proteção contra deriva; um registo de validação navegável em kshana.dev com ligações diretas para as evidências de cada cartão.

# text
# c1: codemeta.json
# c2: .zenodo.json
# c3: tests/citation_metadata_doc_sync.rs
seg-b3c0545157b3 = <b>Metadados de citação legíveis por máquina</b> — <c1/> (CodeMeta { "2.0" }) e <c2/>, fixados ao manifesto do Cargo por <c3/>.

# text
seg-2ca8875da9de = <b>Proveniência da cadeia de fornecimento</b> — atestação de proveniência de compilação SLSA para o tarball do crate, as wheels, o sdist e o tarball do npm; Trusted Publishing OIDC do PyPI; SBOM CycloneDX distribuído dentro da wheel e do pacote npm; diferença de compilação reproduzível e verificação pós-versão.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: validation-breakdown
seg-18fdecf7f2fa = <b>Descobribilidade</b> — <c1/>, <c2/> e metadados Open Graph / JSON-LD em kshana.dev; uma figura <c3/> gerada, derivada da matriz.

# text
seg-f80db0b0f545 = <b>READMEs por superfície</b> para crates.io / PyPI / npm com uma proteção de honestidade das contagens.

# text
seg-bd33b21f8f91 = <b>A referência independente de transferência de tempo de Sagnac</b> foi promovida a ExternalDataset — a correção de Sagnac para a circum-navegação equatorial é agora verificada face aos { "207.4" } ns publicados por Ashby (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, Eq. { "1.29" }; reproduzida com < { "0.05" } ns). A capacidade composta de transferência de tempo continua, com honestidade, MODELLED.

# text
# c1: oracle-kind-stacked
seg-882133bf1fcc = <b>Documentação, diagramas e figuras atualizados</b> para a matriz em vigor (39/46/4/89): o diagrama de proveniência da validação, a figura <c1/> (agora gerada a partir da matriz com uma proteção de deriva na CI), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, os documentos de arquitetura e de tutorial, e o total do registo em kshana.dev.

# text
seg-a9be3d71a52c = A árvore de código-fonte foi reformatada com o rustfmt fixado (cadeia de ferramentas { "1.93.0" }) — puro estilo, sem alteração de comportamento.

# text
# c1: scripts/check-version-sync.sh
seg-4542eb4fabfc = <b>Versionamento em sincronia.</b> Todas as superfícies de distribuição (crate, PyPI, npm, crate MCP + imagem OCI, plugin JetBrains) passam a ter versões em sincronia com o motor, imposto por <c1/> na CI.

# text
seg-792df0cdc8a7 = O <b>plugin JetBrains</b> foi relicenciado para <b>AGPL-3.0-only</b> (a { "0.1.1" } publicada ainda anunciava Apache-2.0) e passa a derivar a sua versão do Marketplace da etiqueta da versão.

# text
# c1: unwrap
# c2: clippy::unwrap_used
seg-171f5649c90f = <b>Reforço de robustez</b> — os <c1/> fora dos testes foram removidos ou justificados; <c2/> aplicado como barreira ao código fora dos testes.

# text
seg-0e5abb2fad02 = Remodelação de <b>kshana.dev</b> com a prova em primeiro lugar: destaque dominante, diagramas de arquitetura e figuras de resultados, i18n, secções de registo e de Normas recolhíveis e adaptáveis.

# text
seg-05ef9b9f3653 = <b>Efemérides precisas SP3</b> — aplicar a correção do nó de rotação da Terra do IGS durante a interpolação.

# text
# c1: tests/surface_readme_image_urls_doc_sync.rs
seg-bbd0dc3dd9cb = <b>Imagens nos registos</b> — os READMEs do PyPI/crates.io/npm usam URLs de imagem absolutos; os caminhos de imagem relativos do README principal eram apresentados como imagens quebradas na página da { "0.21.0" } no PyPI. Uma proteção na CI (<c1/>) impede a regressão.

# text
# c1: fmt
# c2: clippy
seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> verdes; deixar de compilar contra dados reais ignorados pelo git.

# text
seg-c3c260b7063e = Testes

# text
# c1: tests/property.rs
seg-5dca3defcfe3 = A covariância do relógio de Kalman mantém-se semidefinida positiva e simétrica (teste de propriedade, <c1/>).

# text
seg-c861779f04ca = Proteções de sincronização de documentação: todas as cadeias públicas de contagem de validação, os metadados de citação, a figura gerada e os URLs de imagem dos READMEs por superfície estão fixados à respetiva fonte de verdade.

# text
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = Esta versão acrescenta dois conjuntos de aplicações MODELLED ao motor aberto — um <b>demonstrador de PNT com Tecnologia Quântica</b> (transferência de tempo quântica fiável, navegação quântica sem GNSS, deteção quântica de falhas/anomalias) e um <b>conjunto de PNT lunar / cislunar</b> (tempo coordenado lunar, VLBI lunar, OD+relógio conjunto, realização de referencial, volume de serviço, PNT diferencial, exportação de interoperabilidade) — cada um executável a partir de um único <c1/>, cada um a emitir um registo <c2/> honesto mais um registo de representatividade / lacunas até ao voo. Traz também <b>seis novas validações com referência independente externa</b>, levando a matriz de validação verificada por máquina a <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> nas suas { "61" } linhas. Os novos números de aplicação são MODELLED a partir de parâmetros ilustrativos de fonte pública — sem TRL, herança de voo, certificação ou aval de agências — e os núcleos validados que reutilizam são etiquetados como tal.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Conjunto de demonstradores de PNT com Tecnologia Quântica</b> (<c1/>, <c2/>, <c3/>). Três áreas de aplicação MODELLED executáveis por trás do motor, cada uma a emitir <c4/> mais um registo de representatividade / lacunas até ao voo:

# text
# c1: src/timetransfer_chain.rs
seg-07532f03a1f1 = <b>Transferência de tempo quântica fiável</b> (<c1/>) — um orçamento bidirecional de relógio de rede ótica + ligação fotónica face a CSAC + RF, reutilizando o nível de proteção de temporização, com uma figura de mérito de segurança contra ataques de atraso/repetição ({ "1" } − P_md) e deteção de anomalias do relógio + latência CUSUM.

# text
# c1: src/quantum_nav_od.rs
seg-4c9036cffe1b = <b>Navegação quântica sem GNSS</b> (<c1/>) — uma deriva inercial com interferómetro de átomos frios face a um INS de qualidade de navegação durante uma falha de GNSS, com a ressalva honesta de que, sem posição externa, o enviesamento do acelerómetro continua inobservável e o erro continua, por isso, a crescer.

# text
# c1: src/quantum_faults.rs
seg-6188f1c6893a = <b>Deteção quântica de falhas / anomalias</b> (<c1/>) — um catálogo de falhas etiquetadas com uma AUC da ROC com IC por bootstrap e uma falha mínima detetável a uma taxa fixa de falsos alarmes.

# text
# c1: src/quantum_devices.rs
# c2: src/qtrade.rs
seg-9e22314b1337 = Uma biblioteca partilhada de modelos de erro de dispositivos quânticos (<c1/>) e uma estrutura unificada de comparação quântico-versus-clássico (<c2/>) sustentam os três.

# text
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>Conjunto de PNT lunar / cislunar.</b> Sete <c1/>s de cenário MODELLED executáveis em camadas sobre o núcleo CR3BP: <b>Tempo Coordenado Lunar</b> (taxa secular LTC/TCL − TT, <c2/>), observável de atraso geodésico de <b>VLBI lunar</b> (<c3/>), estimador em lote de <b>OD + relógio conjuntos multitécnica</b> (<c4/>), <b>realização de referencial</b> (Helmert de 7 parâmetros + ligação WGCCRE IAU { "2015" }, <c5/>), análise de <b>volume de serviço de classe Moonlight / LCNS</b> (<c6/>), <b>PNT diferencial lunar</b> (<c7/>) e uma <b>exportação de interoperabilidade alinhada com LunaNet / IOAG</b> (CCSDS-OEM + escala de tempo lunar no envelope KIF, <c8/>). Tudo MODELLED a partir de parâmetros ilustrativos de fonte pública; não validado face a seguimento real de VLBI / Gateway; sem afiliação nem aval de qualquer agência.

# text
seg-a892ce052e3c = <b>Seis novas validações com referência independente externa</b> (a matriz de validação está agora em { "15" } validadas):

# text
# c1: tests/cs5071a_reference.rs
seg-c30ae6767c6c = <b>ADEV / HDEV num relógio de césio 5071A real</b> — validado face a referências de ponto de década do Stable32 (<c1/>).

# text
# c1: PHASE.DAT
# c2: tests/phasedat_reference.rs
seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV na referência <c1/> do Stable32</b> — validado face às tabelas publicadas do Stable32 (<c2/>).

# text
# c1: tests/opssat_ad_reference.rs
seg-e8728f57effa = <b>AUC da ROC de deteção de anomalias em telemetria real do ESA OPS-SAT</b> — validada face ao scikit-learn (<c1/>).

# text
# c1: tests/icgem_gravity_reference.rs
seg-5446957ac631 = <b>Síntese de funcionais gravíticos ICGEM</b> — validada face à norma de gravidade normal GRS80 (γ de Somigliana até { "3.5e-12" }; mapa de perturbação EGM2008, <c1/>).

# text
# c1: tests/klobuchar_reference.rs
seg-751c5ac90229 = <b>Modelo de ionosfera difundido Klobuchar</b> — validado face ao RTKLIB (<c1/>).

# text
# c1: tests/raim_reference.rs
# c2: tests/sbas_reference.rs
seg-dcc6d4e04a5c = <b>Núcleo de deteção RAIM</b> ({ "171" } casos, <c1/>) e o <b>nível de proteção SBAS DO-229E</b> em dados reais do EGNOS (bifurcação SBAS-PL do RTKLIB, <c2/>) — ambos validados face às suas referências independentes externas.

# text
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Registo de representatividade e lacunas até ao voo</b> (<c1/>). Um registo estruturado que todos os demonstradores emitem — o que é representativo, o que é simplificado e o que separa o modelo do voo — o complemento honesto de cada comparação MODELLED.

# text
# c1: --study-name
# c2: --validate
seg-6b4c78bdaf35 = <b>Agregação de estudos e ergonomia da CLI.</b> Um manifesto de conjunto de cenários com agregação de estudos num só comando, metadados de estudo estáveis por hash + <c1/>, verificação de formato de cenários com <c2/> e apresentação do nível de validação por figura de mérito nos relatórios de estudo.

# text
seg-e24230b80a89 = <b>kshana.dev redesenhado em torno de uma espinha de domínio partilhada</b> — capacidades e validação reunidas num único explorador de domínios com um vocabulário comum, as novas ilhas validadas em destaque, um instrumento animado da Terra com contornos de terra fiéis, um apelo à ação para pedir um estudo e a marca/ligações da Ashforde OÜ.

# text
seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE auditados quanto à completude e à honestidade</b> — contagens de validadas desatualizadas corrigidas (agora { "15" } referências independentes externas), diagramas alargados, e citados os preprints do Nível de Proteção de Temporização Condicional (arXiv:{ "2606.24210" }) e da lacuna de otimismo por degradação de RF (arXiv:{ "2606.22054" }).

# text
# c1: paper/
seg-42a317c6ce06 = As fontes de <c1/> e o pipeline do rascunho para o JOSS são mantidos no repositório público.

# text
seg-8ed5cf845b00 = Esta versão acrescenta quatro capacidades de estudo ao motor aberto — um Nível de Proteção de Temporização condicional, uma pontuação de resiliência de PNT alinhada com um referencial normativo, uma avaliação da lacuna de otimismo por degradação de RF e um front end de recetor definido por software / dados reais — cada uma reproduzível a partir de um só comando e a escrever um artefacto determinístico ao byte. Todos os estudos são MODELLED (calibração sintética ou com conjuntos de dados públicos), apresentam a sua proveniência honesta (versão do motor, sementes, hash da configuração) e etiquetas de validação, e não são certificações.

# text
# c1: tpl
# c2: cargo run --release --example tpl_jammertest
seg-0c9f0c665491 = <b>Nível de Proteção de Temporização condicional (<c1/>).</b> Um limite, limitado pelo holdover, do erro de tempo não detetado sob spoofing de GNSS, com um piso de monitor de k sigma, uma variância de deriva de van Loan sobre a latência de deteção e um tempo até ao alarme CUSUM. Calibrado num ataque real registado (JammerTest { "2024" }, cenário { "2.1.1" }) através de <c2/>, que reproduz a sua tabela de referência a partir de escalares recuperados da gravação pública (o conjunto de dados bruto não é redistribuído).

# text
# c1: resilience
# c2: cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json
# c3: docs/RESILIENCE-CROSSWALK.md
seg-d874d7f13f28 = <b>Pontuação de resiliência de PNT alinhada com um referencial normativo + estudo de instabilidade de decisão (<c1/>).</b> Modelo de arquitetura, pontuação alinhada com o RPCF, simplex de ponderação de Dirichlet, instabilidade por Kendall-tau e taxa de inversão top-1, e colapso da diversidade de modo comum (Hill-N2), com <c2/>. Correspondência em <a1><c3/></a1>.

# text
# c1: impairment_study
# c2: impairment_ml
# c3: eval_stats
# c4: cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
seg-343f7af54503 = <b>Estudo da lacuna de otimismo por degradação de RF (<c1/>, <c2/>, <c3/>).</b> Um painel de 13 detetores sobre um corpus sintético com parâmetros fundamentados, uma lacuna de otimismo dentro versus fora da distribuição, tendências de leis de escala com uma hipótese nula por permutação e um previsor de degradação leave-one-out, através de <c4/>.

# text
# c1: sdr
# c2: realdata/
seg-6eed55859bbf = <b>Front end de recetor definido por software (<c1/>) e adaptadores de dados reais (<c2/>).</b> De IQ/IF em bruto até às derivações do correlador e SQM, mais adaptadores de ingestão (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) e exemplos de sondagem. Estes leem gravações que o utilizador fornece localmente; nenhuma gravação é submetida.

# text
# c1: optimism-study.json
# c2: resilience-study.json
# c3: paper-artifacts/
# c4: /realdata-cache/
seg-afe2282fa771 = <b>Artefactos de estudo submetidos.</b> Os ficheiros <c1/> e <c2/>, determinísticos ao byte, passam a ser seguidos em <c3/>, para que os números dos estudos possam ser verificados sem recompilar; continuam regeneráveis a partir dos geradores acima. Os conjuntos de dados brutos ficam fora do repositório (<c4/>).

# text
# c1: Cargo.toml
# c2: CITATION.cff
# c3: README
seg-450d82cddc28 = Versão incrementada para { "0.20.0" } em <c1/>, <c2/> e <c3/>; os artefactos do estudo de cruzamento são regenerados para que o seu carimbo coincida com a versão lançada.

# text
# c1: LICENSE
# c2: LICENSING.md
seg-a0a66af8fd14 = <b>Relicenciado de Apache-2.0 para a GNU AGPL-3.0-only, com uma licença comercial disponível junto da Ashforde OÜ (licenciamento duplo).</b> O motor aberto continua totalmente aberto e publicamente verificável; o copyleft de rede da AGPL (§{ "13" }) significa que um derivado fechado ou alojado tem de regressar ao código aberto — ou adquirir uma licença comercial. Isto defende o núcleo validado contra a bifurcação seguida de fecho, mantendo a credibilidade de um motor público, executável e auditável. Ver <a1><c1/></a1> (AGPL) e o novo <a2><c2/></a2> (o que cada licença abrange e quando se aplica).

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
seg-ffa799fdb814 = <c1/> contém agora o texto da AGPL-3.0; os cabeçalhos SPDX em todas as fontes foram atualizados para <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, o sítio web e os metadados de crate/pacote (<c7/>, <c8/>, <c9/>, o crate MCP + imagem) foram atualizados em consonância.

# text
# c1: CONTRIBUTING.md
seg-8d67aba2af0b = Os <b>termos para contribuidores</b> (<a1><c1/></a1>) passam a licenciar a contribuição recebida ao abrigo da AGPL <b>e</b> concedem à Ashforde OÜ o direito de incluir contribuições na edição com licença comercial, para que o licenciamento duplo continue a funcionar.

# text
# c1: deny.toml
# c2: GOVERNANCE
seg-93644d1c1420 = <b>Política de dependências inalterada mas com nova justificação</b> (<a1><c1/></a1>, <c2/>): as dependências continuam permissivas (Apache/MIT/BSD/ISC). A AGPL só é permitida para o próprio crate do kshana — uma <em>dependência</em> com copyleft contaminaria a edição comercial e comprometeria o licenciamento duplo.

# text
# c1: v0.18.0
# c2: v0.19.0
seg-9b77c2d36241 = <b>Nota para quem está a jusante:</b> esta é uma relicenciação para copyleft. Os utilizadores que dependiam dos termos permissivos da Apache-2.0 podem continuar a usar a última versão Apache-2.0 (<c1/> e anteriores, tal como publicadas); de <c2/> em diante é AGPL-3.0 / comercial.

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
seg-51e32f15b7ea = <b><c1/> atualizado de { "0.24" } → { "0.29" }</b> para eliminar RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) das análises externas de OSV/dependências. Ambos são avisos <em>ao nível de função</em> cujas funções afetadas (<c2/>/<c3/>, <c4/>) o Kshana nunca chama, e <c5/> é uma dependência opcional (da funcionalidade <c6/>) — pelo que a exposição real era nula —, mas a atualização mantém uma análise limpa para os auditores a jusante. Migrado <c7/> para a API do pyo3 { "0.29" } (tipo de retorno Bound para <c8/>; <c9/> explícito na pyclass <c10/>). Todos os { "11" } testes das ligações Python passam contra a extensão recompilada.

# text
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Onze novos tipos de cenário executáveis — demonstradores de dois concursos, uma ponte de interoperabilidade CCSDS e um conjunto de análise de missão / ambiente de primeira ordem (todos MODELLED, aditivos; os valores de referência de reprodutibilidade existentes mantêm-se inalterados).</b> Cada um é despachável por CLI / Python / WASM / MCP, inclui um <c1/> e traz uma etiqueta MODELLED explícita no seu JSON de resultados e no resumo de uma linha (um teste por tipo de cenário em <c2/> afirma que a etiqueta está presente e que a saída nunca contém a cadeia <c3/>):

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-20b74caf58cc = <c1/> (<c2/>) — banco de ensaio de avaliação de deteção de degradação de RF por aprendizagem automática: um corpus <b>sintético</b> etiquetado + uma estrutura de <b>ROC/AUC</b> independente do detetor + um relatório de <b>lacuna de otimismo</b> dentro/fora da distribuição (apenas características operacionais — nunca dados de campo/IQ).

# text
# c1: quantum-trade
# c2: src/quantum_trade.rs
seg-0253656a0ecf = <c1/> (<c2/>) — comparação PNT quântico-versus-clássico com ingestão de ADEV medido e um envelope de resiliência sem GNSS.

# text
# c1: space-weather
# c2: src/space_weather.rs
seg-901bd713bd62 = <c1/> (<c2/>) — índices solares/geomagnéticos (tabela IAGA Kp↔ap, Ap diário, F10.7a centrado em 81 dias), temperatura exosférica de <b>Jacchia-71</b> e um acoplamento de densidade termosférica conduzido pela atividade sobre uma atmosfera estática (NÃO um modelo de densidade absoluta NRLMSISE).

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
seg-2323b43c0ffc = <c1/> (<c2/>) — ponte de importação + ida e volta de <b>CCSDS { "502.0" } OEM</b> para efemérides GMAT / Orekit / STK (o leitor <c3/>, inverso exato do escritor).

# text
# c1: launch-window
# c2: src/launch.rs
# c3: sin Az = cos i/cos lat
seg-188aeb3e8219 = <c1/> (<c2/>) — <b>azimute de lançamento</b> de dois corpos (<c3/>), Δv de mudança de plano, bónus de rotação do local e geometria de oportunidades diárias.

# text
# c1: reentry
# c2: src/reentry.rs
seg-6200a47276e6 = <c1/> (<c2/>) — corredor de reentrada balística de <b>Allen-Eggers</b>: desaceleração máxima, velocidades de g máximo e de aquecimento máximo, altitude de g máximo.

# text
# c1: eo-coverage
# c2: src/eo_payload.rs
seg-0874c2241748 = <c1/> (<c2/>) — geometria de <b>faixa / GSD / acesso / revisita</b> de EO (triângulo espacial SMAD).

# text
# c1: space-packet
# c2: src/space_packet.rs
seg-83c7588ff074 = <c1/> (<c2/>) — codificação/descodificação do cabeçalho primário do <b>Space Packet CCSDS 133.0-B</b> com ida e volta exata ao bit.

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
seg-ae1bcad02880 = <c1/> (<c2/>) — <b>binário de gradiente gravítico</b> de 3 graus de liberdade + <b>orçamento RSS de erro de apontamento</b> (orçamento escalar pré-hardware, não um ciclo de controlo).

# text
# c1: passes
# c2: src/passes.rs
seg-65f59cc12e02 = <c1/> (<c2/>) — <b>previsão de passagens de nascer/pôr</b> de estação terrestre (AOS/TCA/LOS, elevação máxima, acesso).

# text
# c1: link-budget
# c2: src/linkbudget.rs
# c3: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-178776497627 = <c1/> (<c2/>) — equação de ligação unidirecional <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / margem / fecho).

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
seg-e7fee32a00f5 = <b>Filtro de Kalman unscented (UKF) híbrido quântico + clássico fortemente acoplado de 17 estados — apresentado como cenário executável (MODELLED).</b> Um novo tipo de cenário <c1/> (<c2/>, <c3/>) que transforma o filtro unscented GNSS/INS fortemente acoplado de 17 estados, antes só disponível por API (<c4/>), num cenário que as ligações CLI/Python/WASM/MCP podem despachar. O vetor de erro de 17 estados é composto pelos <b>{ "15" } estados de erro do INS</b> (posição, velocidade, desalinhamento de atitude, enviesamento de acelerómetro + giroscópio) aumentados com a <b>correção do enviesamento do acelerómetro derivada de CAI</b> — o interferómetro de átomos frios (<c5/>) fixa o piso de passeio aleatório da velocidade <c6/>, pelo que a deriva de longo prazo em navegação inercial é a limitada pelo sensor quântico — e um <b>relógio de 2 estados de fase + frequência</b> cujo ruído de processo provém do <b>motor de relógio por parâmetros q</b> (<c7/>, que mapeia o perfil de desvio de Allan de um relógio para as PSD de <c8/>/<c9/>, escaladas para unidades de distância). A plataforma é auxiliada por GNSS durante uma fase inicial (o filtro aprende os enviesamentos, a velocidade e o relógio) e depois segue em deriva durante uma falha de GNSS apenas com a IMU CAI + relógio, pelo que a execução demonstra uma hibridização de <b>IMU clássica a curto prazo + quântica a longo prazo</b>. A figura de mérito é a <b>autoconsistência do filtro</b>: <b>NEES</b> agregado (Normalised Estimation Error Squared, sobre o subconjunto estimável de posição/velocidade/relógio) e <b>NIS de brancura da inovação</b> (Normalised Innovation Squared) sobre um conjunto Monte-Carlo, verificados face às suas bandas de χ² a { "95" } % (Bar-Shalom §{ "5.4" }). O filtro ajustado fica dentro das bandas; um filtro deliberadamente mal ajustado (os parâmetros <c10/> / <c11/>) é assinalado — uma barreira objetivamente verificável e discriminante, não um carimbo automático. <b>A verificação de NEES/brancura da inovação é a REFERÊNCIA INDEPENDENTE ESTATÍSTICA: uma afirmação de autoconsistência (a covariância comunicada pelo filtro corresponde honestamente à dispersão dos seus próprios erros sob o ruído modelado), NÃO uma garantia de exatidão no mundo real.</b> Âmbito honesto: tudo é <b>modelado / simulação</b> — as entradas de CAI e de relógio são valores delimitados e representativos da literatura, não hardware medido; o hardware CAI e a sua pessoa-chave continuam a pertencer ao parceiro; nada aqui implica TRL > { "3" }, herança de voo ou validação externa (o JSON de resultados e o resumo de uma linha trazem estas etiquetas de forma explícita). A trajetória única, de velocidade constante e nivelada, deixa os estados de atitude e de enviesamento da IMU apenas fracamente observáveis, pelo que o NEES é avaliado sobre os { "8" } estados estimáveis; uma trajetória com manobras para observabilidade total dos 17 estados está no roteiro. Acrescenta também a instrumentação de consistência <c12/> (devolve o NIS por atualização) e <c13/>. Todos os cenários existentes não são afetados (aditivo; valores de referência de reprodutibilidade inalterados).

# text
# c1: terrain-slam
# c2: src/altpnt/sequential.rs
# c3: scenarios/terrain-slam.toml
# c4: particle_filter
# c5: terrain-nav
seg-9b55f4ac5053 = <b>Navegação sequencial (recursiva) referenciada ao terreno — SITAN como filtro em execução.</b> Um novo tipo de cenário <c1/> (<c2/>, <c3/>) que executa o modelo de medição altímetro-versus-DEM já existente <b>época a época</b> através do motor SIR de <c4/>, em vez da pesquisa em lote do grosseiro ao fino que <c5/> usa para recuperar um único desvio <em>constante</em> do INS. Em cada ponto de passagem, a nuvem é propagada pelo incremento comunicado pelo INS (ele próprio corrompido pelo crescimento da deriva por passo), repesada pela correspondência de terreno e reamostrada em caso de degenerescência — pelo que uma deriva do INS <b>variável no tempo</b> é <em>seguida</em> ao longo do trajeto, o que um ajuste de desvio constante estruturalmente não consegue. No DEM sintético, a estimativa recursiva mantém-se limitada e reconverge (final ≈ { "70" } m) enquanto a solução inercial sem auxílio diverge sem limite até ≈ { "5" } km; o erro por época acompanha a singularidade do terreno (segue em deriva sobre o INS enviesado em selas planas e volta a fixar-se sobre relevo distintivo), e o monitor do tamanho efetivo da amostra confirma uma nuvem saudável. Âmbito honesto: o mapa é <b>conhecido e fixo</b> — <em>localização</em> recursiva face a um DEM armazenado (a metade de localização do SLAM de terreno), não estimação conjunta do mapa; não circular por construção (a rampa de deriva injetada é a verdade independente). Todos os cenários existentes não são afetados (aditivo; valores de referência de reprodutibilidade inalterados).

# text
# c1: src/holdover.rs
# c2: src/impairment_eval.rs
# c3: src/quantum_trade.rs
# c4: src/navsignal.rs
# c5: src/inertial/quantum_imu.rs
# c6: src/verification.rs
seg-87ba3bc926fa = <b>Espinha de resiliência sem GNSS + fatias de demonstrador FutureNAV</b> (<c1/>, e fundamentos de envelope de resiliência em <c2/>, <c3/>, <c4/>, <c5/>, com fatias de verificação FutureNAV em <c6/>). Compõe os blocos de construção de PNT alternativo — holdover de relógio, seguimento de sinal, deriva inercial, terreno — numa única narrativa de resiliência a falhas de GNSS. MODELLED; aditivo.

# text
# c1: src/interchange.rs
seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — um envelope de artefactos versionado e autodescritivo</b> (<c1/>). Um invólucro etiquetado por esquema em torno dos resultados de cenários, para que um artefacto armazenado leve consigo o seu tipo de cenário, a versão do esquema e as etiquetas MODELLED/VALIDATED, e os envelopes mais antigos continuem legíveis com compatibilidade futura. Aditivo; o JSON de resultados existente não muda.

# text
# c1: src/navsignal.rs
# c2: src/cr3bp.rs
seg-07147766ab22 = <b>Modulação / seguimento de sinais de navegação + corretor diferencial de halo/NRHO em CR3BP</b> (<c1/>, <c2/>). Um modelo de primeira ordem de modulação e seguimento de sinais de navegação, e um corretor diferencial de três corpos restrito circular para órbitas de halo / de halo quase retilíneas, apresentados no eixo de capacidade de espaço profundo já existente. MODELLED.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-d0d2366e3351 = <b>Modo de avaliação de mudança de distribuição + parâmetro de escala de severidade do corpus para <c1/></b> (<c2/>). Acrescenta uma divisão explícita dentro/fora da distribuição e uma escala de severidade do corpus ajustável à estrutura de lacuna de otimismo ROC/AUC (apenas características operacionais — nunca dados de campo/IQ).

# text
# c1: src/frugal.rs
# c2: src/integrity_impact.rs
seg-9bb8ee93e70b = <b>ROI de custo por cobertura + mapeamento do impacto na integridade das deteções falhadas</b> (<c1/>, <c2/>). Uma perspetiva de ROI de engenharia frugal (custo por unidade de cobertura) e um mapeamento da taxa de deteções falhadas para o impacto na integridade. MODELLED; aditivo.

# text
# c1: src/inertial/quantum_imu.rs
# c2: hybrid-ukf
seg-55f8ba5b52ee = <b>Folha de parâmetros citada do modelo de erro do interferómetro de átomos frios (CAI)</b> (<c1/>). Uma folha de parâmetros delimitados, com referências bibliográficas, para o modelo inercial CAI — as entradas são <b>citadas, não hardware medido</b> (sem alegação de TRL / voo); alimenta o piso de passeio aleatório da velocidade de <c2/>.

# text
seg-cfbff4acc64c = Governação do projeto.

# text
# c1: GOVERNANCE.md
# c2: none → partial
seg-982f9ea3eee8 = <c1/> a documentar o modelo de decisão e a fronteira aberto/fechado; a linha de comunidade/governação do mapa de capacidades passa de <c2/> para o refletir.

# text
# c1: b_nom
# c2: b_k = Σ_i |s_i|·b_nom
# c3: #[serde(default)]
# c4: sigma_ura_m
# c5: b_nom_m
# c6: docs/ARAIM_REFERENCE.md
# c7: b_k
seg-c9ff6a7183eb = <b>Nível de proteção de integridade ARAIM — enviesamento nominal (<c1/>) e σ_URA agora aplicados.</b> O nível de proteção MHSS subtrai agora a projeção unilateral do enviesamento nominal <c2/> por modo de falha, e usa o sigma de <b>integridade</b> σ_URA (distinto do sigma de <b>exatidão</b> σ_URE) transportado na Integrity Support Message. Isto torna o nível de proteção mais conservador e correto segundo as normas e, por isso, <b>altera os valores de PL comunicados pelos cenários de integridade existentes</b>. O ISM/cenário ganha os campos <c3/> <c4/> / <c5/>, pelo que as entradas que os deixam por definir mantêm o comportamento anterior. Ver <c6/> para a fórmula <c7/> restaurada e a nota de implementação honesta.

# text
seg-c408f8944ac6 = Consistência χ² do monitor de spoofing.

# text
# c1: parity_raim_test
# c2: raim::chi2_quantile
seg-92e2b5c5458c = <c1/> passa a usar o caminho partilhado de χ² inverso de <c2/>, removendo uma segunda implementação divergente de χ², de modo que o RAIM e o monitor de spoofing por paridade concordem nos seus limiares.

# text
# c1: gravity-map-nav
# c2: kind=
seg-6d424034e500 = <b><c1/> ligado ao despachante da CLI.</b> Anteriormente, o cenário só era alcançável através da API; passa agora a ser despachado como <c2/> tal como todos os outros cenários.

# text
# c1: api::list_scenario_kinds().len()
# c2: scenario_count_doc_sync
seg-62c3efb54991 = <b>Exatidão da documentação/contagens.</b> As contagens de tipos de cenário no README passam a estar fixadas a <c1/> por um teste <c2/>, pelo que a contagem documentada já não pode divergir do despachante.

# text
# c1: Body{mu, re, zonals, gravity, rotation, IAU-pole}
# c2: EphemerisProvider
# c3: mars-pnt
# c4: xval/anise-mars-od
# c5: cargo deny
seg-5f0f497aa643 = <b>PNT de espaço profundo e de Marte — motor aberto de navegação radiométrica + simulação GSE.</b> Um novo eixo de capacidades, totalmente aditivo, sobre o núcleo validado na Terra (todos os cenários terrestres existentes ficam <b>idênticos ao byte</b> — os valores de referência de reprodutibilidade passam sem alterações e sem regeneração). Acrescenta: um núcleo de dinâmica multicorpo (<c1/> com gravidade tesseral GMM-3 de Marte, um referencial de Marte fixo ao corpo da IAU, um ponto de ligação <c2/> substituível, datas julianas de duas partes com precisão submicrossegundo e TT↔TDB); observáveis radiométricos (tempo de luz iterativo + atraso de Shapiro, Doppler e distância a dois/um/três sentidos através da resolução de duas pernas de Moyer, retorno coerente do transponder, medição de distância regenerativa/PN segundo o CCSDS { "414" }, Δ-DOR segundo o CCSDS { "506" }, meios de plasma solar/tropo/iono); análise + emissão de CCSDS-TDM ({ "503" }); um Filtro de Informação de Raiz Quadrada de dinâmica reduzida com acelerações empíricas RTN, um relógio de bordo de três estados e um modelo de arrasto de Marte; um estimador de fusão conjunto de um sentido + dois sentidos; a superfície de cenários <c3/> (constelação de retransmissão + LMO/transferência/superfície) em CLI, Python, WASM, MCP e no playground; e um simulador de desempenho GSE de ponta a ponta (geometria → balanço de ligação → observáveis → SRIF → covariância). <b>Nível de validação — validado por simulação:</b> OD sintética em ciclo fechado (LMO de Marte ≈ { "0.2" } m) e autoconsistência analítica, com a dinâmica de Marte centrada no Sol verificada de forma cruzada e independente face ao <b>DE440</b> do JPL (<c4/>, condicionado ao kernel: { "137" } m num arco de 1 dia, o resíduo honesto de n corpos não modelados). As exatidões de espaço profundo comunicadas são <b>figuras de mérito de simulação / covariância</b>, não resultados de missões reais; a validação com dados reais de seguimento DSN/ESTRACK continua no roteiro. O ANISE (MPL-2.0, edition-2024) fica confinado a um crate de verificação cruzada excluído do workspace, pelo que a barreira de licenças <c5/> e a tarefa de MSRV-1.75 ficam intactas.

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
seg-2ab34100a2d7 = <b>Traços no solo com a exatidão de agências a partir da orientação real da Terra do IERS.</b> O cenário <c1/> aceita um campo opcional <c2/> — o corpo incorporado de um ficheiro <c3/> real do IERS — e reduz o traço no solo através do UT1−UTC e do movimento polar por época, interpolados a partir dele (o mesmo <c4/> que <c5/> usa), substituindo os escalares nominais <c6/>/<c7/>/<c8/>. Os dados viajam no cenário, pelo que a execução continua reproduzível e não precisa de sistema de ficheiros (funciona no playground WASM). Uma opção <c9/> incorpora um ficheiro real no cenário a partir da CLI. Fecha a assimetria em que só <c10/> consumia dados reais de orientação da Terra.

# text
# c1: frames::itrf_to_teme
seg-e778245e7d8f = <b>Consistência de referencial da taxa de variação da distância.</b> A estação terrestre é agora mapeada para o referencial inercial através do inverso exato da redução do satélite (<c1/>, desfazendo o movimento polar <em>e</em> a rotação sideral) em vez de uma rotação GMST cega ao movimento polar, pelo que ambas as extremidades partilham um único referencial. O efeito sobre o Doppler comunicado está abaixo do piso de validação, mas elimina uma incompatibilidade de referencial real e uma alegação excessiva de "exato" no código-fonte.

# text
# c1: carrier_hz
# c2: step_s
seg-3b912d8a819d = <b><c1/> é validado.</b> Uma frequência de portadora nula ou não finita passa a devolver um erro em vez de produzir silenciosamente um Doppler nulo (tinha tornado λ = c/portadora infinito), em linha com a proteção existente de <c2/>.

# text
# c1: src/precise_od.rs
# c2: PreciseForceModel
# c3: finals2000A
seg-7d70317ca717 = <b>Validação do modelo de forças por ajuste de efemérides, verificada de forma cruzada face a produtos reais de agências.</b> Um novo estimador de mínimos quadrados em lote (<c1/>) com matriz de transição de estado variacional e edição de valores aberrantes, conduzido por um modelo de forças completo (<c2/>: geopotencial EGM2008, terceiros corpos, marés sólidas + oceânicas + atmosféricas e acelerações empíricas CPR/2-por-revolução), alimentado por um analisador real de orientação da Terra IERS <c3/>. Validado face a órbitas de referência publicadas: <b>MEO Galileo até { "13" } cm pós-ajuste</b>, <b>LEO Swarm-A</b> da ESA e <b>LRO lunar</b> (selenocêntrico, gravidade GRAIL, referencial fixo ao corpo IAU-2015 — dinâmica reduzida { "6.6" } m, com honestidade acima do objetivo de { "5" } m no caminho aberto; o caminho ANISE/DE440 de nível DE que o atinge é um crate excluído do workspace).

# text
# c1: spoof-detect
seg-bf88a3eb4733 = <b>Cenário <c1/></b> — um detetor de spoofing integrado de várias camadas que combina paridade RAIM por época, monitores de AGC e de qualidade de sinal (SQM) e uma decisão fundida, validado face aos parâmetros de cenário publicados do <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), incluindo o caso difícil alinhado com a portadora.

# text
# c1: ephemeris
seg-976036ba124b = <b>Cenário <c1/> — estado, referenciais, traço no solo e Doppler.</b> Propaga um satélite (TLE→SGP4 ou uma órbita analítica) e emite, por passo, o estado inercial TEME e GCRS (<b>posição <em>e</em> velocidade</b>), a posição ITRF/ECEF fixa à Terra, o <b>traço no solo</b> do ponto subsatélite em WGS-84 (latitude / longitude / altitude) e o azimute / elevação / distância topocêntricos, com taxa de variação da distância e <b>Doppler</b> a partir de uma estação terrestre. Alcançável a partir da CLI, de Python, de WASM e do servidor MCP, e distribuído como a <b>predefinição "Ground track"</b> no playground web, onde o traço é desenhado <b>sobre um mapa-mundo real</b> (linhas de costa Natural Earth { "1" }:110m, incorporadas — sem rede nem dependência externa).

# text
# c1: --export-oem
# c2: export_oem = true
seg-761c95f2ede5 = <b>Exportação CCSDS OEM</b> (<c1/> / <c2/>) — a Orbit Ephemeris Message com velocidade consumida por GMAT / Orekit / STK, em paridade com os exportadores SP3 e OMM existentes.

# text
seg-111b0896fdd4 = <b>Marés terrestres sólidas, oceânicas (FES2004) e atmosféricas (Ray { "2001" } S2)</b> no geopotencial (IERS Conventions cap. { "6" }), ligadas ao modelo de forças.

# text
seg-7e392131261a = <b>Wheels ARM64</b> — a compilação do PyPI passa também a produzir wheels Linux aarch64 (manylinux_2_28), macOS arm64 e Windows arm64.

# text
seg-7cc04ea3362b = <b>Relatório técnico alargado (preprint)</b> ligado a partir do README, e o artigo JOSS tornado submetível (ORCID do autor, compilado para PDF na CI a cada alteração).

# text
seg-3b1e95acc728 = <b>Referenciais validados ao milímetro face a vetores publicados de Vallado.</b> A redução TEME→PEF/ITRF, a cadeia completa CIO IAU 2006/2000A GCRS→ITRS e a conversão ECEF→geodésica WGS-84 estão agora fixadas ao exemplo trabalhado em Vallado et al. (AIAA 2006-6753) com o seu EOP do IERS, e não apenas à autoconsistência interna.

# text
# c1: hifitime
seg-fd9818877a6c = <b>Verificações cruzadas independentes de escalas de tempo.</b> A ERA e as escalas UTC/TAI/TT concordam com <c1/> a < { "1" } µs, e as efemérides planetárias DE440 concordam com o JPL Horizons (posições geocêntricas da Lua/Sol), ambas como barreiras de CI sempre ativas.

# text
seg-75aeec4cd6d0 = O playground web esconde o separador de figuras de mérito quando um resultado não traz linhas de figuras de mérito, para que os pacotes só de gráfico (efemérides, RAIM, spoofing) abram no seu gráfico — nas efemérides, o traço no solo — em vez de numa tabela vazia.

# text
seg-b8ab0cc3ce7f = Os cursores guiados do playground <b>e a varredura de parâmetros funcionam agora para o cenário de efemérides / traço no solo</b>: os seus controlos (latitude / longitude da estação, passo de tempo, duração, UT1−UTC) são ajustáveis, e uma varredura pode representar a geometria da passagem (elevação máxima, Doppler máximo, altitude, velocidade) em função de qualquer um deles — por exemplo, elevação máxima versus latitude da estação. O separador de varredura só é agora mostrado quando um cenário é realmente varrível, pelo que nenhum pacote oferece um controlo que não representa nada.

# text
# c1: DUT1 ≈ 0
# c2: CAPABILITY.md
seg-9e7a37e51940 = Documentada a aproximação <c1/> do SGP4 no ponto de chamada do GMST (um erro de rotação ≤ ~{ "13" }″, bem dentro do erro do próprio modelo do SGP4) e atualizado <c2/>.

# text
# c1: kshana.dev
seg-174a75e840b0 = O plugin JetBrains <b>Kshana — PNT simulator</b> está agora publicado e aceite no <a1>JetBrains Marketplace</a1>. O README, <c1/> e os documentos de distribuição ligam diretamente para ele.

# text
# c1: server.json
# c2: description
# c3: io.github.ashfordeOU/kshana-mcp
seg-4deaf7918fff = <b>A publicação no registo MCP</b> passa agora a ter êxito: o <c2/> de <c1/> excedia o limite de 100 carateres do registo (HTTP { "422" }). Foi encurtado, e o nome do servidor (e a etiqueta de propriedade da imagem) foram alinhados com o espaço de nomes canónico <c3/>.

# text
# c1: 0.1.1
seg-1408961042a1 = <b>A publicação no JetBrains Marketplace</b> passa agora a ter êxito: a CI voltava a enviar a mesma versão do plugin que tinha sido listada manualmente, o que o Marketplace rejeita. A versão do plugin é incrementada para <c1/>, e a proteção de idempotência passa também a tratar uma resposta "already contains version" como um êxito sem efeito.

# text
# c1: kshana.dev
# c2: style.css
# c3: app.js
seg-74e8cab2f10e = <b>Invalidação de cache de <c1/></b>: as cadeias de consulta com carimbo de versão de <c2/>/<c3/> acompanham a versão, pelo que os visitantes que regressam obtêm sempre a compilação atual.

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
seg-65949229eed7 = <b><c1/> — o Kshana como servidor Model Context Protocol (MCP)</b> (<c2/>). Um crate autónomo, excluído do workspace (o SDK <c3/> é edition { "2024" }) que expõe o motor validado a agentes e assistentes de IA — Cursor, JetBrains AI Assistant / Junie e qualquer cliente MCP — por stdio. Ferramentas: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, cada uma um invólucro fino sobre <c9/>.

# text
# c1: ide/jetbrains/
# c2: .toml
seg-bd792f66363c = <b>Plugin para IDE JetBrains</b> (<c1/>). Clique com o botão direito num cenário <c2/> → <b>Run Kshana Scenario</b>; as figuras de mérito e o JSON de resultados chegam em fluxo a uma janela de ferramenta do Kshana. Plugin Kotlin de plataforma pura, compatível com todos os IDE JetBrains { "2024.3" }+.

# text
seg-755358390517 = <b>Distribuição pública + publicação automática por versão</b> para ambos:

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
# c3: publish.yml
seg-14fc2fd73553 = <c1/> no <b>crates.io</b> (<c2/>) através de <c3/>.

# text
# c1: kshana-mcp
# c2: ghcr.io
# c3: docker run ghcr.io/ashfordeou/kshana-mcp
# c4: mcp-publish.yml
seg-2b39bbfc0581 = <c1/> como <b>imagem OCI</b> multiarquitetura em <c2/> (<c3/>) através de um novo <c4/>.

# text
# c1: kshana-mcp
# c2: server.json
seg-c824d1532eb6 = <c1/> no <b>registo MCP oficial</b> através de GitHub OIDC (zero segredos); a entrada de registo (<c2/>) usa o tipo de pacote OCI com um proprietário verificado por etiqueta.

# text
# c1: publishPlugin
seg-f90da0c61aac = o plugin para IDE no <b>JetBrains Marketplace</b> através de <c1/> (condicionado por token, com assinatura opcional de programador) em cada etiqueta de versão.

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
seg-21d7457dad23 = <b>Validação cruzada independente de referenciais ANISE/SPICE</b> (<c1/>). Um crate autónomo, excluído do workspace, verifica de forma cruzada a redução CIO IAU 2006/2000A de <c2/> (<c3/>, GCRS→ITRS) face ao <b>ANISE</b> (a reimplementação NAIF/SPICE em Rust puro) a rodar GCRF→ITRF93 a partir de <c4/> do JPL, com os <b>mesmos parâmetros de orientação da Terra IERS <c5/> fornecidos a ambos os lados</b>, ao longo de oito épocas trimestrais { "2020" }–{ "2023" }. As duas realizações independentes de referencial concordam com uma <b>rotação relativa máxima de { "0.028" }″ — ≤ { "0.86" } m no solo, ≤ { "0.93" } m em LEO, ≤ { "3.6" } m em órbita GNSS</b>, satisfazendo com ampla margem a antiga verificação cruzada de referencial do ROADMAP "< { "10" } m" (complementa, e não substitui, as âncoras SOFA/ERFA bit a bit existentes). O crate é isolado porque <c6/> + <c7/> são MPL-2.0 / edition-2024 e nunca devem entrar no grafo de dependências publicado de <c8/>, no seu <c9/>, na barreira de licenças <c10/> nem na compilação MSRV; o ANISE está fixado com <c11/>. Inclui um binário <c12/> (obtém o BPC de ~{ "5" } MB, imprime uma tabela, escreve <c13/>), uma barreira de testes que se salta a si própria sem kernel/rede e uma tarefa de CI opcional apenas de <c14/> (nunca bloqueia <c15/>). Documentado em <c16/> (linha CIO) e <c17/>.

# text
# c1: .panel
# c2: min-width: auto
# c3: min-width: 0
seg-eb45b43dacc2 = <b>Playground adaptado a dispositivos móveis.</b> Corrigido o excesso horizontal de <c1/> do playground em telemóveis (um item de grelha CSS com <c2/> por omissão era apresentado com ~{ "100" } px a mais do que a janela de visualização) através de <c3/> e de controlos com proteção de largura; verificado sem problemas a { "360" } / { "390" } / { "414" } / { "768" } px. Alinhados os botões de ação "Pin to compare" / "Download report" (caixas de margem iguais na linha flex). Aumentados os botões de execução, os cursores, os seletores e as ligações de navegação para o mínimo de alvo tátil de ~{ "44" } px da WCAG { "2.5.5" } / Apple-HIG em telemóveis e dispositivos táteis, com o tamanho em ecrãs de secretária inalterado.

# text
# c1: sbas_protection_level
# c2: Some
# c3: propagate
# c4: propagate_dopri
# c5: lunar_look_angle
# c6: [0, 360)
# c7: SphericalHarmonicField::from_gfc
# c8: GM
seg-fe5095d5e61f = <b>Reforço de robustez a partir de uma ronda de testes de combate adversariais.</b> ({ "1" }) <c1/> passa a rejeitar elevação/azimute/variância não finitos e diagonais de covariância negativas ou não finitas (uma geometria quase singular ampliada por um σ pequeno podia anteriormente escapar à barreira do pivô absoluto e devolver um VPL NaN / um HPL absurdo como um <c2/> <em>válido</em> — uma falha de integridade silenciosa). ({ "2" }) O propagador numérico (<c3/>/<c4/>) falha em modo seguro perante um estado inicial não finito, em vez de fazer o controlador adaptativo girar para sempre. ({ "3" }) O auxiliar de células do DEM deixa de entrar em pânico numa grelha de uma só amostra ({ "1" }×N). ({ "4" }) O azimute de <c5/> é mantido estritamente em <c6/>. ({ "5" }) <c7/> rejeita <c8/>/raio não físicos (NaN / não positivos).

# text
# c1: validation_report
# c2: kshana-validation-summary.html
seg-9ca339d8977a = <b>Binário <c1/> + artefacto de versão</b>: um gerador sem dependências que emite um resumo de validação em HTML de uma página, pronto a imprimir, que indexa cada validação imposta pela CI (SGP4 666/666, EGM2008, referenciais bit a bit, Allan NIST, fichas técnicas de IMU, ARAIM/SBAS, reprodutibilidade em 3 SO, cobertura) ao seu teste e à sua referência independente externa. O fluxo de trabalho de versão gera <c2/> e anexa-o (com proveniência SLSA) a cada versão etiquetada.

# text
# c1: tests/python/test_numpy_interop.py
# c2: auditwheel show
seg-bd231d07658f = <b>pytest de interoperabilidade com numpy + reforço das wheels</b>: <c1/> (executado na CI) mais um contentor manylinux fixado e um passo de verificação <c2/> na compilação das wheels.

# text
# c1: docs/tutorials/
# c2: tests/tutorials.rs
seg-5427cae6fc39 = <b>Tutoriais e educação</b>: <c1/> (três tutoriais resolvidos, cenários anotados por domínio, exercícios de nível 1/2/3) com <c2/> a fixar cada número citado à saída do motor em execução.

# text
# c1: paper/
# c2: notebooks/
# c3: submissions/
# c4: FUNDING.yml
seg-2fad9124c5a6 = <b>Artefactos de submissão externa</b> (<c1/>, <c2/>, <c3/>): um rascunho de artigo JOSS, um notebook quântico-versus-clássico e kits prontos a submeter para awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, mais <c4/> — a preparar os passos externos de submissão.

# text
# c1: altpnt
# c2: .hgt
# c3: terrain-nav
# c4: combined-altpnt
seg-0f88f8bccbc1 = <b>Navegação PNT alternativa referenciada ao terreno e combinada</b> (módulo <c1/>): um navegador de correspondência de terreno TERCOM/SITAN sobre um DEM (carregador <c2/> + gerador de dados sintéticos) e um navegador combinado de gravidade + magnético (IGRF) + terreno sem GPS, expostos como tipos de cenário <c3/> e <c4/>. Validado pela convergência da correspondência de terreno (um desvio injetado conhecido é recuperado) e por um erro limitado do filtro combinado numa janela sem GPS.

# text
# c1: lunar
seg-bd01ec72fa2a = <b>Geometria LunaNet LANS</b> (<c1/>): locais nomeados da superfície lunar (Apollo 11/15/16, rebordo de Shackleton) com coordenadas selenográficas de referência, ângulos de visão à superfície (az/el/distância), visibilidade/cobertura e DOP do local, validados face ao raio da Lua, às coordenadas de locais publicadas e à identidade de elevação de { "90" }° na vertical radial.

# text
# c1: eci_track
seg-2dad9cf59ea9 = <b>Playground guiado no navegador</b>: cursores em modo guiado, um painel de saída com separadores, uma sobreposição de visita guiada na primeira execução, modos de varredura de parâmetros e de sobreposição de várias execuções, uma vista 3D de órbita em canvas/SVG sem dependências (o pacote de órbita passa a emitir um <c1/> aditivo), um modo embutido/iframe e descarga como relatório HTML — cada um com testes unitários node na CI.

# text
# c1: tests/imu_allan_spec.rs
seg-261604603d67 = <b>Modelo de erro de IMU validado por ficha técnica</b> (<c1/>): ARW/VRW/instabilidade de enviesamento do ADIS16465/16488/16460 recuperados a partir do desvio de Allan sintetizado e verificados face às especificações do fabricante (identificação NIST SP1065 / IEEE { "952" }).

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
seg-5d50be22aacd = <b>Níveis de proteção SBAS / DO-229E, L1/L5 sem ionosfera e um mapa de compliance DO-316</b> (módulo <c1/>). <c2/> forma a matriz de geometria ponderada a partir da elevação/azimute de cada satélite e do orçamento de erros UDRE/GIVE/aerotransportado/tropo, inverte a matriz normal (<c3/> partilhada) e projeta as variâncias em HPL/VPL através dos fatores K do DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> acrescenta a pseudodistância L1/L5 sem ionosfera do GPS (IS-GPS-705, <c5/>), validada por cancelar o atraso ionosférico de primeira ordem independente do motor. <c6/> faz corresponder os requisitos DO-316/DO-229E às funções que os implementam. Validado face às definições de fator K em forma fechada, à geometria de referência <c7/> do numpy e à identidade de covariância por duas vias; a verificação cruzada de aderência à norma RTKLIB/gLAB com PL publicado está documentada como pendente de revisão em <c8/>.

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
seg-e9e60b40e42a = <b>Gravidade tesseral completa em harmónicas esféricas — o campo EGM2008 até ao grau/ordem { "70" }.</b> Um novo <c1/> avalia o geopotencial e a sua aceleração no referencial fixo à Terra a partir de coeficientes <c2/> totalmente normalizados, usando a estável recorrência de Legendre normalizada de Holmes–Featherstone (a desnormalização daria excesso de capacidade neste grau). Os coeficientes distribuídos são o produto EGM2008 da NGA (domínio público, via ICGEM), incluído em <c3/> e reproduzido bit a bit por <c4/> a partir de <c5/> submetido; qualquer modelo ICGEM <c6/> carrega-se através de <c7/>. Validado face a três referências independentes: colapso para massa pontual (só <c8/> = <c9/>), um campo apenas zonal que reproduz o <c10/> existente até ~{ "1e-9" }, e a aceleração analítica a coincidir com o gradiente por diferenças finitas do potencial somado diretamente até <{ "1e-6" }.

# text
# c1: forces::lense_thirring_accel
# c2: ForceModel::lense_thirring()
seg-c33a2dbf851d = <b>Aceleração de Lense–Thirring (arrastamento de referencial) da relatividade geral</b> (<c1/>, IERS { "2010" } Eq. { "10.12" }), o termo gravitomagnético para além da correção de Schwarzschild existente, ligado ao propagador numérico através de uma nova opção <c2/>. Validada como linear no momento angular da Terra e { "1" }–{ "2" } ordens de grandeza abaixo do termo de Schwarzschild, o regime das medições do LAGEOS / Gravity Probe B.

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
seg-909562023109 = <b>Um trait <c1/> que unifica os propagadores de órbita analítico e numérico.</b> O propagador numérico de modelo de forças de Cowell é agora um par de primeira classe do SGP4: um novo tipo <c2/> (estado inicial + <c3/> + <c4/> + escolha de <c5/> por duplicação de passo ou de Dormand–Prince) e <c6/> implementam ambos <c7/>, cujo <c8/> devolve o estado TEME inercial em unidades SI (m, m/s), pelo que os dois são intermutáveis por trás de um <c9/>. A implementação do SGP4 é a conversão exata km/min→SI do método inerente (verificada por um teste de igualdade); a implementação numérica satisfaz, através do trait, a mesma barreira submétrica de Kepler exata, os dois controladores adaptativos concordam e um <c10/> expõe o código SGP4 subjacente.

# text
seg-d094880df57b = Esta versão fecha a maior lacuna de correção do motor: a orientação da Terra e a redução de referenciais são agora feitas com qualidade de implementação de referência (validadas <b>bit a bit face ao ERFA/SOFA</b>), a pilha de integridade ganha <b>ARAIM de dupla constelação</b> sobre TLE reais de GPS+Galileo, e as camadas de propagação, de sensores quânticos, lunar/cislunar e geomagnética aprofundam-se todas — a par de uma API Python tipada, de um playground de navegador mais rico e de uma matriz de reprodutibilidade em três SO. Destaques:

# text
seg-bfe1d4a7cabd = <b>Referenciais, bit a bit.</b> Nutação IAU 2000A e 2000B completas, precessão IAU { "2006" }, a redução GCRS↔ITRS IAU 2006/2000A baseada em CIO (X, Y, s), movimento polar do IERS e referenciais de saída TEME→GCRS/ITRS — cada um validado bit a bit face às rotinas de referência ERFA/SOFA.

# text
# c1: docs/ARAIM_REFERENCE.md
seg-bb5705347a24 = <b>ARAIM de dupla constelação</b> (GPS + Galileo) sobre TLE reais, com HPL/VPL, saída em diagrama de Stanford e um <c1/> aberto.

# text
seg-2865dadcd4c8 = <b>PNT cislunar</b>: um propagador CR3BP Terra–Lua, referenciais MCI↔MCMF, coordenadas selenográficas e um cenário executável de integridade lunar LunaNet.

# text
seg-3b636707a158 = <b>Deteção quântica</b>: sistemáticos de Coriolis e de AC-Stark para o interferómetro de átomos frios, uma varredura de deriva e validação face ao orçamento de Freier ({ "2016" }).

# text
seg-10bc94801a6a = Modelo geomagnético de campo principal <b>IGRF-14</b>, autónomo e validado.

# text
# c1: RunOutput
# c2: ScenarioMeta
# c3: .data()
# c4: scenario_kinds
# c5: validate_toml
seg-6485f627d793 = <b>API Python tipada</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, stubs de tipos) com compilação de wheels na CI, mais saída de propagador GCRS/ITRS de primeira classe e exportação CCSDS OMM.

# text
# c1: sgp4
# c2: src/
# c3: ubuntu
# c4: macos
# c5: windows
seg-2b7693641333 = <b>Credibilidade e reprodutibilidade</b>: uma comparação direta de exatidão do SGP4 com o crate independente <c1/>, uma barreira de cobertura na CI (~{ "97" } % de linhas em <c2/>) e uma matriz de reprodutibilidade em três SO (<c3/>/<c4/>/<c5/>).

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
seg-32e53ac66056 = <b>Todos os gráficos do playground correspondem agora ao tema do sítio.</b> Todos os doze geradores de gráficos SVG — o gráfico de resultado/holdover (<c1/> + <c2/>), o gráfico de desvio de Allan (<c3/>) e todos os gráficos de cenários (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + disponibilidade, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — usavam painéis azul-marinho frios (<c15/>), eixos/texto cinzento frio e uma paleta de séries vermelho/azul/roxo em conflito. Passam agora a usar em todo o lado a paleta quente de grafite: painéis <c16/>, grelha quente <c17/>, rótulos <c18/>, com uma atribuição de séries consistente — quântico = dourado-mel (<c19/>), clássico = âmbar quente (<c20/>), especificação/limite = <c21/>. As vistas com código de segurança mantêm o seu significado: o diagrama de Stanford do RAIM continua verde (disponível) / âmbar (enganoso) / vermelho (perigoso) / aço esbatido (indisponível), e HPL/VPL aparecem a dourado/bronze.

# text
# c1: Kshana v<version> · <scenario-hash> · kshana.dev
seg-2bb31dfc7756 = <b>Os gráficos são agora autodescritivos quando guardados/descarregados.</b> Ambos os gráficos incorporam o seu título no SVG (o título do gráfico de Allan + o subtítulo "lower is better" estavam anteriormente apenas em HTML à volta da imagem, pelo que uma imagem guardada não tinha legenda), e ambos trazem um rodapé de proveniência — <c1/> — para que um gráfico descarregado se sustente por si e continue reproduzível.

# text
# c1: Kshana v<version> · scenario <hash> · kshana.dev
# c2: api::run_toml
# c3: .chart.svg
# c4: scenario
# c5: scenario_hash
# c6: docs/PROVENANCE.md
seg-9f528e334cd8 = <b>Todos os gráficos trazem agora o rodapé de proveniência.</b> O rodapé — <c1/> — é carimbado centralmente para todos os tipos de cenário em <c2/> (anteriormente só existia nos gráficos de holdover e de Allan), pelo que qualquer imagem guardada ou descarregada — a partir do playground, da exportação <c3/> da CLI ou do cartão de pontuação em HTML — identifica a sua versão, a impressão digital do cenário e a fonte. O hash é etiquetado <c4/> para maior clareza e vem de <c5/> do resultado, quando existe, com um recurso a um hash da fonte nos relatórios de integridade/lunares. O que é a impressão digital e porque existe está documentado na secção "Output" do README e em <a1><c6/></a1>.

# text
# c1: raim::chi2_quantile
# c2: read_dir
# c3: chi2_quantile
# c4: p
# c5: k
# c6: normal_quantile
# c7: assert!
# c8: Normal
seg-635697ed3fb1 = <b><c1/> e o amostrador de ruído de Stanford do RAIM deixam de entrar em pânico com entradas fora do intervalo / não finitas</b> (uma descoberta de fuzzing dependente da ordem de <c2/>, a partir dos novos cenários ARAIM). <c3/> passa a proteger <c4/>/<c5/> como <c6/> (devolvendo um valor-limite em vez de entrar em pânico com <c7/>), e o <c8/> do ruído de Stanford da disponibilidade limita-se a um σ estritamente positivo — pelo que a pilha de integridade/ARAIM nunca entra em pânico com cenários mutados ou mal configurados.

# text
# c1: reproducibility-matrix
# c2: tests/golden/
# c3: tests/cross_platform_golden.rs
# c4: golden.rs
# c5: sgp4_verification.rs
# c6: determinism.rs
# c7: docs/REPRODUCIBILITY.md
seg-b36a0c42845e = <b>Matriz de CI de reprodutibilidade multiplataforma.</b> Uma nova tarefa <c1/> executa os testes de reprodutibilidade em <b>ubuntu-latest, macos-latest e windows-latest</b> a cada push. Como o JSON de resultados completo não é idêntico ao byte entre SO (divergência de libm no último ULP), afirma exatamente a projeção invariante da plataforma — a impressão digital da entrada mais a forma da saída, fixadas por cenário como valores de referência SHA-256 em <c2/> pelo novo <c3/> — a par dos valores numéricos fixados (<c4/>, até { "1e-6" }), dos estados SGP4 (<c5/>, até { "2e-5" } km) e do determinismo no mesmo processo (<c6/>). Em conjunto, estes provam a reprodutibilidade multiplataforma em três SO sem a fragilidade de um hash ao byte exato da saída completa. <c7/> documenta a divisão.

# text
# c1: coverage
# c2: cargo-tarpaulin
# c3: src/
# c4: src/
seg-9b8c0a407387 = <b>Barreira de cobertura de código na CI.</b> Uma nova tarefa <c1/> executa <c2/> com o motor LLVM baseado em fonte, publica um relatório lcov como artefacto de compilação e impõe um piso de cobertura de linhas em <c3/> (tabelas de dados geradas, ponto de entrada da CLI, testes e ativos web excluídos). A cobertura de linhas medida é de ~{ "97" } % em <c4/> (SGP4 e os módulos de relógio ≥{ "95" } %); a barreira está fixada em { "85" } % — acima do objetivo de ≥{ "80" } % e afastada do valor medido, pelo que apanha regressões sem falhas espúrias. Um selo de cobertura é publicado no README.

# text
# c1: sgp4
# c2: tests/sgp4_crate_comparison.rs
# c3: tcppver.out
# c4: tests/fixtures/sgp4_comparison.md
# c5: KSHANA_REGEN_FIXTURES=1
# c6: from_elements
seg-1dfc4beb239a = <b>SGP4/SDP4 em comparação direta com o crate independente <c1/>.</b> Um novo teste (<c2/>) verifica de forma cruzada o propagador do Kshana face à biblioteca SGP4 em Rust mais usada (neuromorphicsystems/sgp4, acrescentada como dev-dependency apenas para testes) sobre os mesmos { "666" } vetores AIAA 2006-6753. Com ambos conduzidos pelo modelo gravítico WGS72 que os vetores usam, as duas implementações independentes concordam a <b>nível submicrométrico</b> em órbitas próximas da Terra e ressonantes e a <b>{ "4.12" } mm no pior caso</b> em todos os regimes, ambas reproduzindo a tabela de referência <c3/>. A tabela de comparação submetida (<c4/>, regenerada através de <c5/>) decompõe o resultado por regime (LEO/MEO, espaço profundo, ressonância de ½ dia e de 1 dia) e regista os quatro casos deliberadamente patológicos que o crate rejeita na construção. As asserções em execução mantêm ambos a menos de { "2e-5" } km da referência e a concordar entre si a menos de { "4e-5" } km — uma proteção contra regressões, não um resultado pontual. Estas são credenciais competitivas: correção face a uma base de código independente, e não apenas uma tabela estática. (O <c6/> por omissão do crate usa WGS84 e por isso difere da referência WGS72 em ~km — apresentado com honestidade no texto da tabela.)

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
seg-dc75162ecd64 = <b>A exportação CCSDS OMM é agora alcançável de ponta a ponta.</b> O escritor OMM (<c1/>) não tinha anteriormente nenhum caminho de CLI/API; os elementos médios de um cenário <c2/> podem agora ser publicados como um catálogo CCSDS 502.0-B-2 OMM — uma mensagem OMM KVN por satélite definido por TLE — através de <c3/>, ou <c4/> no cenário escreve automaticamente <c5/> (a espelhar o <c6/> existente). Cada mensagem traz o número de catálogo NORAD <b>real</b> do satélite, o designador internacional COSPAR (<c7/>) e a época (forma de dia do ano do CCSDS), extraídos da linha { "1" } do TLE pelo novo <c8/>; a linha de nome passa a <c9/> (caso contrário, <c10/>). <c11/> é a época do cenário, não a hora do relógio, pelo que a saída é reproduzível. Nova API: <c12/> / <c13/>, <c14/>, <c15/>. Um cenário sintético Walker ou RINEX (sem elementos médios de TLE) falha com erro em vez de emitir um ficheiro vazio. Validado face ao instantâneo incluído de 30 satélites <c16/> (<c17/>).

# text
# c1: web/hover.mjs
# c2: web/app.js
# c3: <img>
# c4: web/hover.test.mjs
seg-036782a2b65e = <b>Leituras interativas ao passar o cursor nos gráficos do playground.</b> Ao mover o cursor sobre um gráfico, uma mira ajusta-se à amostra mais próxima e mostra uma dica com o valor (<c1/>, ligado em <c2/>). No gráfico de Allan, lê τ e o σ_y(τ) de cada relógio; nos gráficos de cenários de séries temporais (holdover de relógio, navegação por estima, transferência de tempo, PNT híbrido, GNSS/INS), lê o tempo e o valor de cada conjunto nas unidades do próprio gráfico (ns / m / ps / utilização), extraídos do resultado para que a leitura coincida com a curva. Os diagramas especializados (RAIM, spoofing, varredura) não recebem sobreposição. Os gráficos continuam a ser <c3/>s blob autodescritivos — a sobreposição é uma mira transparente + dica por cima, pelo que descarregar/comparar/exportar ficam intactos. A matemática de coordenadas (amostra mais próxima, cursor→fração do gráfico, análise da polilinha) é testada por unidades (<c4/>, executados na CI).

# text
# c1: web/compare.mjs
# c2: web/app.js
# c3: web/compare.test.mjs
# c4: <img>
seg-1588ae024e5d = <b>Modo de comparação A/B no playground.</b> Fixe qualquer execução como linha de base A, execute um segundo cenário, e os dois são mostrados lado a lado com uma tabela de diferenças de figuras de mérito (holdover, RMS/p95 de temporização, disponibilidade) que colore o vencedor por métrica (<c1/>, ligado em <c2/>; lógica de diferenças testada por unidades em <c3/>, executada na CI). Todos os valores são inseridos como texto e todos os gráficos através de <c4/> blob, pelo que nada proveniente de uma cadeia de cenário é alguma vez injetado como marcação.

# text
# c1: web/chartdl.mjs
# c2: web/app.js
# c3: kshana-<chart>-v<version>-<scenario-hash>.<ext>
# c4: web/chartdl.test.mjs
seg-6e7a99f8f275 = <b>Botões de descarga de gráficos (SVG + PNG).</b> Cada gráfico do playground tem agora uma barra de ferramentas "Download SVG / PNG" com o tema correspondente (<c1/>, ligada em <c2/>). O SVG devolve o original fiel e escalável; o PNG rasteriza essa mesma imagem autodescritiva a 2x para diapositivos e documentos. Os ficheiros são nomeados com a sua proveniência — <c3/> — e a lógica de nome/tamanho de ficheiro é testada por unidades (<c4/>, executados na CI).

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: src/igrf_data.rs
seg-4cb87e7dc892 = <b>Modelo geomagnético de campo principal IGRF-14 (<c1/>).</b> O campo de harmónicas esféricas padrão da IAGA (grau/ordem { "13" }, época { "2025.0" } + variação secular { "2025" }–{ "2030" }; coeficientes gerados por máquina a partir do <c2/> oficial por <c3/> para <c4/>, reproduzíveis bit a bit). Uma síntese normalizada de Schmidt devolve o vetor do campo (norte/este/baixo) e os elementos derivados (declinação, inclinação, intensidade horizontal/total) em qualquer local/data geodésicos, mais o polo geomagnético e a intensidade do dipolo — a contraparte magnética do correlacionador de mapa gravítico para navegação PNT alternativa. Validado de forma autónoma: a síntese coincide com o dipolo inclinado exato em forma fechada, o campo analítico completo de grau 13 coincide com uma diferença finita do potencial escalar, o eixo do dipolo reproduz o polo geomagnético conhecido (~{ "80.7" }°N, −{ "72.7" }°E) e a intensidade de ~{ "29.7" } µT, e o campo global é físico.

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
seg-c69d50031da4 = <b>Ligações Python tipadas (<c1/>).</b> Para além de <c2/>/<c3/>, de cadeia à entrada/cadeia à saída, o módulo expõe agora uma classe <c4/> tipada (<c5/>, <c6/>, <c7/> e um acessor <c8/> que devolve o resultado já analisado num dict Python nativo — sem nova análise de JSON, embrulhável em NumPy), mais <c9/>, <c10/> (lista analisada de dicts de metadados) e <c11/> (uma lista de mensagens de erro que não lança exceções). Distribui um stub de tipos PEP { "561" } (<c12/> + <c13/>) para mypy/pyright/editores e um guia de início rápido <c14/>. As funções existentes não mudam.

# text
# c1: src/orbit.rs
# c2: Frame
# c3: position_in_frame
# c4: state_gcrs
# c5: Propagator
# c6: gcrs_to_itrs
# c7: state_gcrs
seg-fb65ac14344c = <b>Referenciais de saída de primeira classe para propagadores (enum <c1/> <c2/> + <c3/> + <c4/>).</b> Qualquer <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) pode agora emitir a sua posição em TEME, <b>GCRS</b> (≈ J2000) ou <b>ITRS</b> (fixo à Terra) — TEME nativo, GCRS através da redução TEME→GCRS validada, ITRS encadeando essa redução na rotação <c6/> CIO IAU 2006/2000A — e o seu estado GCRS completo (posição + velocidade) através de <c7/>. A saída inercial da data deixa de ser apenas TEME.

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
seg-8f596733c439 = <b>Redução celeste-para-terrestre IAU 2006/2000A baseada em CIO (<c1/>).</b> A cadeia GCRS↔CIRS↔ITRS moderna, sem equinócio: coordenadas do CIP <c2/> lidas da matriz de viés-precessão-nutação IAU 2006/2000A (reutilizando a precessão FW validada + a nutação 2000A com o ajuste P03 de <c3/>), a série de 66 termos do localizador de CIO <c4/> (<c5/>, gerada por máquina a partir da referência ERFA por <c6/> para <c7/>, reproduzível bit a bit), a matriz GCRS→CIRS (<c8/>), o ângulo de rotação da Terra (<c9/>) e a rotação GCRS→ITRS completa (<c10/>, composta com o movimento polar do IERS existente). Validada <b>bit a bit</b> face ao <c11/> publicado (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 em JD_TT { "2453736.5" }) e aos vetores de teste <c12/> e <c13/>. Mostra-se que a cadeia CIO e a redução TEME legada de equinócio/GMST-1982 concordam, a menos da sua diferença documentada de convenção de tempo sidéreo de ≈{ "2" }·(equação dos equinócios). Esta é a redução rigorosa que o caminho equinócio/GMST aproximava.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_matrix_2000a
# c4: nut00a
# c5: tools/gen_nut00a.py
# c6: src/nutation_iau2000a_data.rs
# c7: eraNut00a
# c8: nutation_matrix_2000a
seg-32e6d8dfcebc = <b>Série completa de nutação IAU 2000A (<c1/> <c2/>, <c3/>).</b> O modelo MHB2000 completo — { "678" } termos luni-solares + { "687" } planetários — com exatidão < { "0.1" } mas, a par do truncamento 2000B de 77 termos existente. As tabelas são geradas por máquina a partir da referência <c4/> do IAU SOFA / ERFA por <c5/> para <c6/> (o gerador reproduz o ficheiro submetido bit a bit), e toda a série — tanto os conjuntos de argumentos fundamentais IERS-2003 e MHB2000 como as longitudes planetárias — é validada <b>bit a bit</b> face ao vetor de teste <c7/> publicado (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } em JD_TT { "2453736.5" }, até { "1e-13" } rad). A redução TEME→GCRS por omissão mantém a série 2000B (~{ "1" } mas, abaixo da simplificação de rotação do referencial de velocidade da cadeia); <c8/> expõe a matriz da data de < { "0.1" } mas para quem a precisar.

# text
# c1: kind = "lunar-integrity"
# c2: scenarios/lunanet-araim.toml
# c3: src/lunar.rs
# c4: LunarScenario
# c5: south_pole_hpl_pass
# c6: LunarReport
seg-35e9e419d2ae = <b>Cenário executável de integridade lunar (<c1/>, <c2/>).</b> Liga a passagem de nível de proteção do polo sul lunar (<c3/> <c4/> → <c5/>) ao executor de cenários com um <c6/> JSON e um gráfico SVG de HPL versus tempo, para que o caso de integridade cislunar seja alcançável diretamente a partir da CLI. Expõe com honestidade a lacuna: com o σ_URE de { "30" } m do LANS, o HPL do polo sul (≈ { "260" }–{ "450" } m) excede um limite de alerta de { "50" } m ({ "0" } % disponível) — a integridade do PNT lunar ainda não é atingida.

# text
# c1: src/raim.rs
# c2: src/orbit.rs
# c3: scenarios/araim-gps-galileo.toml
# c4: araim_dual_constellation_availability
# c5: visible_positions_labeled
# c6: IntegrityScenario
# c7: araim_dual
# c8: tests/araim_dual_real_data.rs
seg-1910e8110b43 = <b>Disponibilidade de ARAIM de dupla constelação em TLE reais de GPS+Galileo, e ligação ao executor de cenários (<c1/>, <c2/>, <c3/>).</b> Acrescenta <c4/> (o motor ARAIM avançado — falhas de um só satélite <em>e</em> de toda a constelação — executado numa grelha temporal) e <c5/>, e liga-o ao executor de <c6/> através de uma opção <c7/>, para que um estudo ARAIM multi-GNSS seja alcançável diretamente a partir de TOML. Um teste com dados reais (<c8/>) em instantâneos incluídos do Celestrak GPS+Galileo de 2026-06-07 mostra que reunir o Galileo eleva a disponibilidade ARAIM de { "0.21" } para { "0.67" } sob um VAL exigente de { "12" } m ({ "10.5" }→{ "21.8" } satélites à vista), enquanto o modo robusto a falhas de constelação é fundamentalmente limitado com apenas duas constelações — a razão quantitativa pela qual a integridade robusta de dupla constelação tende para uma terceira constelação ou para o SBAS. Resíduo honesto: a reprodução numericamente exata da Tabela A-3 do EU ARAIM TN face a uma única época com versão bloqueada, e um registo de ficheiro de teste no Zenodo.

# text
# c1: src/cr3bp.rs
# c2: cr3bp_accel
# c3: propagate_cr3bp
# c4: jacobi_constant
# c5: lagrange_points
# c6: src/lunar.rs
seg-78ab887a4543 = <b>Problema circular restrito de três corpos (CR3BP) para o sistema Terra–Lua (<c1/>).</b> Um novo núcleo de dinâmica cislunar que os propagadores de dois corpos/SGP4 não podem fornecer: equações de movimento em referencial rotativo (<c2/>), um propagador RK4 (<c3/>), o integral da constante de Jacobi (<c4/>) e os cinco pontos de Lagrange (<c5/>). Validado face a âncoras em forma fechada / publicadas: os pontos colineares Terra–Lua (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), os L4/L5 equiláteros exatos = (½−μ, ±√3/2, { "0" }), os cinco confirmados como equilíbrios do campo, Jacobi conservada com a precisão do integrador durante a propagação, e a força restauradora fora do plano que torna possíveis as órbitas de halo/NRHO. Esta é a base para representar uma NRHO real. Resíduo honesto: condições iniciais NRHO { "9" }:{ "2" } periódicas corrigidas diferencialmente, o modelo excêntrico/de efemérides (DE) e a transformação desnormalizada para os referenciais seleno-cêntricos de <c6/>.

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
seg-14f4572144f3 = <b>Movimento polar do IERS e a redução TEME→ITRF (<c1/>).</b> Acrescenta <c2/> (<c3/> do SOFA: <c4/> com o localizador TIO <c5/>), <c6/> / <c7/> e <c8/> — a rotação TEME→PEF baseada em GMST seguida do movimento polar — completando uma posição fixa à Terra com precisão ITRF sobre o <c9/> apenas com GMST (o movimento polar é um efeito de dezenas de metros ao raio orbital). <c10/>/<c11/> são grandezas IERS observadas que o chamador fornece. Resíduo honesto: uma cadeia totalmente baseada em CIO (X, Y, s) e uma verificação numérica cruzada ANISE/SPICE de <{ "10" } m continuam a ser trabalhos posteriores.

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
seg-b5e84faf880c = <b>Sistemáticos do interferómetro de átomos frios, varredura de deriva e uma validação com um dispositivo publicado (<c1/>, <c2/>).</b> Alarga o acelerómetro CAI de primeiros princípios com os dois principais sistemáticos determinísticos: a fase de <b>Coriolis/rotação</b> <c3/> (<c4/>, com o enviesamento de aceleração equivalente <c5/> através de <c6/>) e a fase de <b>desvio de luz AC-Stark</b> <c7/> (<c8/>, que se cancela por simetria π/2–π–π/2 para um desvio constante). Acrescenta <c9/> (deriva de posição por navegação por estima em função do tempo de ciclo — o cerne de uma comparação quântico-versus-clássico) e um teste de validação face ao gravímetro móvel de Freier et al. { "2016" } (arXiv:{ "1512.05660" }): o piso modelado de ruído de projeção quântica situa-se abaixo do ruído de curto prazo publicado de { "96" } nm/s²/√Hz, e a ~{ "2" } ordens de grandeza dele. <c10/> atualizado. Resíduo honesto: sistemáticos de frente de onda/apontamento do feixe, resolução de ambiguidade de franjas, a reprodução exata dos ensaios em voo CARIOQA-PMP / Boeing-AOSense (requer PSD de plataforma publicadas) e uma predefinição de playground em JS.

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: selenographic_to_mcmf
# c6: south_pole_hpl_pass
seg-f32829ed9cf1 = <b>Redução de referenciais cislunares e uma passagem de integridade no polo sul lunar (<c1/>).</b> Alarga o motor ARAIM lunar com a rotação MCI↔MCMF (inercial centrado na Lua ↔ fixo à Lua) (<c2/> / <c3/>, um modelo simplificado de rotação média à taxa sideral lunar), latitude/longitude/altitude selenográficas (<c4/> / <c5/>) e <c6/> — um recetor pousado na região Artemis face a um conjunto representativo de retransmissores LunaNet ao longo de uma passagem de { "24" } h, que quantifica com honestidade a lacuna de integridade: com o σ_URE nominal de { "30" } m do LANS, o nível de proteção é finito mas excede um limite de alerta de operações à superfície de { "50" } m. Resíduo honesto: as efemérides LANS NRHO precisas (uma órbita cislunar de 3 corpos), a libração física / o polo lunar em precessão (DE421/SPICE) e um cenário TOML LunaNet continuam a ser trabalhos posteriores.

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
seg-5ef720855cc4 = <b>Mensagem de suporte de integridade ARAIM, SVG do diagrama de Stanford e a referência ARAIM aberta (<c1/>, <c2/>).</b> Acrescenta uma <c3/> explícita (σ_URA / σ_URE / b_nom / P_sat / P_const, com os valores de referência GPS+Galileo do WG-C e conversores <c4/> / <c5/> para os motores de falha única <c6/> e de toda a constelação <c7/>), um renderizador autónomo <c8/> do diagrama de integridade de Stanford (as quatro zonas, a fronteira <c9/>, as guias de limite de alerta, um marcador com código de cores por época) e <c10/> a documentar o algoritmo, o ISM, as hipóteses de falha, o contrato do nível de proteção e o benefício da dupla constelação. Os testes demonstram o ganho de geometria/redundância (reunir uma segunda constelação aperta o HPL de falha única) e a tolerância a falhas de constelação (o utilizador de dupla constelação sobrevive à perda de uma constelação inteira; um utilizador de constelação única não). Resíduo honesto: reproduzir numericamente a Tabela A-3 do EU ARAIM TN / a figura de disponibilidade de { "15" }–{ "25" } % face a um instantâneo real de TLE com versão bloqueada, um registo de ficheiro de teste no Zenodo e a ligação de <c11/> ao executor de ficheiros de cenário.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000b
# c3: iauNumat
# c4: teme_to_gcrs(r, v, jd_tt)
# c5: gcrs_to_teme
# c6: nut00b
# c7: eraNut00b
# c8: ROADMAP.md
seg-3607eb34acd9 = <b>Nutação IAU 2000B e a redução inercial completa TEME→GCRS/J2000 (<c1/>).</b> Acrescenta a segunda e a terceira peças de uma verdadeira redução de referencial inercial sobre a precessão IAU { "2006" } já distribuída: a série de nutação luni-solar MHB2000 de 77 termos (<c2/>, o truncamento IAU 2000B padrão com exatidão de ~{ "1" } mas) com os argumentos fundamentais de Delaunay e a matriz de nutação <c3/> do SOFA, e a cadeia Vallado AIAA-2006-6980 TEME→TOD (equação dos equinócios) → TOD→MOD (nutação) → MOD→GCRS (viés-precessão) exposta como <c4/> / <c5/>. A série, os argumentos e as constantes de unidades são transcritos da referência <c6/> do IAU SOFA / ERFA e validados <b>bit a bit</b> face ao vetor de teste <c7/> publicado (Δψ, Δε até { "1e-13" } rad). Resíduo honesto: a série completa IAU 2000A de 678 termos (<{ "0.1" } mas), uma verificação numérica cruzada ANISE/SPICE de <{ "10" } m e o movimento polar continuam a ser trabalhos posteriores (ver <c8/>).

# text
seg-d9b5e459f6eb = Esta versão traz o primeiro <b>propagador de órbita não analítico</b> do Kshana — um integrador de Cowell com um modelo de forças hierárquico de seis perturbações (dois corpos + zonal J2–J6 + terceiro corpo Sol/Lua conduzido por época + pressão de radiação solar com sombra cónica de umbra/penumbra + arrasto atmosférico + a correção relativista pós-newtoniana de Schwarzschild) conduzido por uma escolha de dois integradores adaptativos (RK4 por duplicação de passo e o par embutido Dormand–Prince RK5({ "4" })) — a par de uma camada de manobras / conceção de trajetórias (queimas impulsivas e finitas, um resolvedor de Lambert de Izzo e uma varredura porkchop), uma camada de PNT alternativo de correspondência de mapa gravítico que recupera um traço de 60 minutos sem GPS a menos de { "500" } m, uma cadeia de determinação de órbita em lote + sequencial e um UKF GNSS/INS de 17 estados fortemente acoplado completo com navegação por estima quântica CAI. Toda a capacidade numérica está fixada face à verdade analítica ou a uma forma fechada deduzida à mão; as perturbações desativadas por omissão deixam intactos os valores de referência já publicados.

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
seg-aa8d478f5c10 = <b>Correção relativista pós-newtoniana (Schwarzschild) (<c1/> + <c2/>).</b> Acrescenta a perturbação dominante da relatividade geral numa órbita próxima da Terra — o principal responsável pelo avanço relativista do perigeu — na forma <c3/> de IERS / Montenbruck–Gill <c4/>. Tal como o arrasto atmosférico, é <b>dependente da velocidade</b>, pelo que acompanha o membro direito do integrador <c5/> através de [<c6/>], opcional e desativada por omissão. Validada de forma autónoma: numa órbita circular colapsa para a forma fechada <c7/> (puramente radial e <b>para fora</b>, componentes fora do eixo exatamente nulas); a sua <b>razão face a dois corpos é o valor de manual <c8/> em LEO</b> (a assinatura de <c9/>); um caso de velocidade radial coincide com o <c10/> simplificado à mão; e no propagador <b>perturba a órbita sem a dissipar</b> — o semieixo maior é conservado a bem menos de um metro/dia, o oposto estrutural da decadência monótona do arrasto. Por estar desativada por omissão, os valores de referência de dois corpos/J2/zonais ficam intactos. O ajuste de parâmetros PPN (<c11/>,<c12/>) e o termo de arrastamento de referencial de Lense–Thirring continuam a ser trabalhos posteriores.

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
seg-043e831224ab = <b>Modelo de sombra cónica de umbra+penumbra (<c1/>), agora usado pela pressão de radiação solar.</b> Atualiza o eclipse binário de cilindro umbral para um fator <c2/> suave: o Sol e a Terra são modelados como discos de raios angulares aparentes <c3/>, <c4/> com separação aparente dos centros <c5/>, e <c6/> é um menos a fração do disco do Sol ocultada pelo disco da Terra (a área de sobreposição lenticular círculo–círculo) — sol pleno para <c7/>, umbra total para <c8/>, anular para <c9/> e uma penumbra contínua entre eles. <c10/> passa a usá-lo, pelo que a força de SRP diminui suavemente ao longo do eclipse em vez de ligar/desligar. Acrescenta o <c11/> nominal da IAU. Validado de forma autónoma: <c12/> em sol pleno e <c13/> no fundo da umbra (exato), uma <b>penumbra monótona e suave</b> (<c14/> sobe de { "0" } → ~½ em <c15/> → { "1" } ao longo da banda <c16/>), e a penumbra cónica <b>estende-se para além do cilindro umbral</b> (um ponto que o cilindro binário considera totalmente iluminado é <c17/> para o cone). O mais simples <c18/> continua disponível; o escurecimento do limbo solar e a sombra de uma Terra achatada continuam a ser trabalhos posteriores.

# text
# c1: integrator::dopri54_step
# c2: integrator::integrate_dopri
# c3: propagator::propagate_dopri
# c4: 0.9·(1/err)^(1/5)
# c5: propagator::propagate_dopri
# c6: y' = y
# c7: e
# c8: propagate_dopri
seg-8d1c16019f3c = <b>Integrador embutido Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Acrescenta o par embutido padrão de tabela de Butcher de Dormand–Prince ({ "1980" }) a par do controlador existente de duplicação de passo RK4: sete estágios FSAL dão uma solução de 5.ª ordem e uma estimativa de erro de 4.ª ordem a partir de um só conjunto de avaliações ({ "7" } contra { "11" } chamadas de função por passo), uma estimativa de erro local mais barata. O controlador adaptativo reutiliza a mesma norma de erro RMS e o controlador de passo <c4/>, pelo que é uma alternativa de substituição direta; <c5/> expõe-no no modelo de forças da órbita. Validado de forma autónoma: a estimativa de erro embutida é <b>O(h⁵)</b> (reduzir o passo a metade corta-a ~{ "32" }×); o DP5({ "4" }) integra <c6/> até <c7/> e o oscilador harmónico ao longo de { "50" } períodos conservando a energia a <{ "1e-6" }; atinge o mesmo ponto final com a mesma tolerância em <b>menos avaliações de função</b> do que a duplicação de passo (sem sacrificar a exatidão); e <c8/> satisfaz a mesma barreira de verdade analítica que o caminho RK4 — <b>submétrica face à solução de Kepler exata por variáveis universais ao longo de uma órbita LEO de { "24" } h</b> — enquanto os dois controladores concordam a <{ "1" } m numa órbita J2..J6 (sem forma fechada). Pares embutidos de ordem superior (RKF7({ "8" }) / DOP853) continuam a ser trabalho posterior.

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
seg-cca3c00757d6 = <b>Arrasto atmosférico ligado ao propagador como a sua primeira força dependente da velocidade (<c1/> + <c2/> + <c3/>).</b> Acrescenta a atmosfera <b>exponencial por troços da Tabela 8-4 de Vallado</b> <c4/> ({ "28" } bandas desde o nível do mar até além de { "1000" } km, limitada abaixo da superfície) e o arrasto quadrático <c5/> face à <b>atmosfera em co-rotação</b> <c6/> (<c7/>). Como o arrasto depende da velocidade, <c8/> ganha um novo <c9/> e o membro direito do integrador passa agora a velocidade (<c10/>); o <c11/> apenas de posição não muda, pelo que os termos conservativos e os valores de referência ficam intactos. Validado de forma autónoma: a densidade <b>ancora no valor ao nível do mar de { "1.225" } kg/m³</b>, é limitada abaixo da superfície, <b>decresce monotonicamente</b> ao longo da LEO, situa-se na banda de média solar de ~{ "1e-12" } kg/m³ a { "400" } km, e a sua <b>altura de escala local recuperada (≈ { "58" } km a { "400" } km)</b> é física; o arrasto <b>opõe-se à velocidade relativa em co-rotação</b> com a magnitude LEO de ~{ "2e-6" } m/s² para <c12/>; e — a assinatura essencial — o arrasto é <b>dissipativo</b>: uma órbita de { "300" } km perde energia específica <b>monotonicamente</b> e o seu semieixo maior <b>decai uns ~km/dia limitados</b>, enquanto a linha de base no vácuo conserva a energia a <{ "1e-9" }. A densidade termosférica NRLMSISE-00 (a cláusula de densidade de arrasto < { "5" } %) continua a ser trabalho posterior.

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
seg-0d20f02ef85f = <b>Pressão de radiação solar ligada ao modelo de forças do propagador, conduzida por época (<c1/> + <c2/>).</b> Acrescenta o <b>modelo SRP de bala de canhão</b> <c3/> com um <b>fator de eclipse de sombra cilíndrica</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): a pressão de radiação <c5/> a partir da irradiância solar total moderna de { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), a queda de fluxo do inverso do quadrado <c6/> e o empurrão radial <b>para longe do Sol</b>. Acompanha o <b>mesmo membro direito conduzido por época</b> que o terceiro corpo, amostrando o Sol de <c7/> uma única vez na época avançada <c8/> partilhada entre o terceiro corpo Sol e a SRP. Combinável: <c9/>. Validado de forma autónoma face a assinaturas deduzidas à mão: a <b>pressão de radiação a 1 UA fixa-se no valor de manual de ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; a SRP de um satélite LEO totalmente iluminado é <b>idêntica bit a bit</b> à fórmula de bala de canhão, aponta <b>para longe do Sol</b> e situa-se na <b>banda de ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> para cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>duplicar a distância ao Sol divide a magnitude por quatro</b> (inverso do quadrado); a <b>sombra cilíndrica só eclipsa o cilindro umbral</b> (no lado oposto ao Sol <em>e</em> a menos de um raio terrestre da linha Terra–Sol) e dá SRP <b>exatamente nula</b> em eclipse; e no propagador a SRP <b>perturba uma órbita LEO por uma quantidade pequena e limitada que escala ~linearmente com A/m</b> — enquanto um modelo sem perturbações permanece bit a bit independente do tempo, deixando intactos os valores de referência de dois corpos/J2/zonais. A umbra/penumbra cónica (ν suave ∈ [{ "0,1" }]), o arrasto atmosférico e a validação cruzada externa com GMAT/Orekit continuam a ser trabalhos posteriores.

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
seg-d3f819c21660 = <b>Terceiro corpo Sol/Lua conduzido por época ligado ao membro direito variável no tempo do propagador (<c1/> / <c2/>).</b> A perturbação de terceiro corpo já não é um termo de força autónomo — é agora integrada pelo propagador de Cowell como uma força genuinamente <em>variável no tempo</em>: cada avaliação do membro direito amostra as posições do Sol/Lua de <c3/> na <b>época avançada <c4/></b> (reutilizando <c5/> para a conversão dia↔século), de modo que os perturbadores se movem ao longo das suas órbitas durante a integração em vez de ficarem congelados no início. Combinável com qualquer modelo gravítico (<c6/>). Validado de forma autónoma: o termo Sol do membro direito é <b>idêntico bit a bit</b> a <c7/> avaliado na posição das efemérides nesse instante, tanto em <c8/> como em <c9/> (provando exatamente a ligação { "86400" } s ↔ { "1" } dia ↔ 1/36525 século), o perturbador <b>avança ~{ "2.6" }·10⁹ m/dia</b> entre amostras (não congelado), as <b>magnitudes de maré instantâneas em LEO</b> atingem as bandas de manual de ~{ "5" }·{ "10" }⁻⁷ m/s² (Sol) e ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Lua, ≈ { "2" }× o Sol), cada corpo <b>perturba de forma mensurável a trajetória de um dia mantendo-se limitado</b>, e o mesmo estado inicial propagado em <b>épocas afastadas um quarto de ano dá uma trajetória diferente</b> (o eixo de maré roda { "90" }°) — enquanto um modelo sem nenhum dos corpos ativado é bit a bit independente do tempo, deixando intactos os valores de referência de dois corpos/J2/zonais. A exatidão de efemérides de nível DE e a validação cruzada externa com GMAT/Orekit continuam a ser trabalhos posteriores.

# text
# c1: ephem::moon_position
# c2: §3.3.2
# c3: forces::third_body_accel
seg-0a517f6c4b1b = <b>Efemérides lunares de baixa precisão (<c1/>), a completar o par de terceiro corpo Sol/Lua.</b> Acrescenta a série lunar de baixa precisão de Montenbruck & Gill (<c2/>) a par do modelo do Sol, para que o <c3/>, agnóstico quanto ao corpo, possa agora ser conduzido por qualquer um dos astros <b>sem nenhum kernel DE/SPK externo</b>. Validadas de forma autónoma face a assinaturas lunares deduzidas à mão: a distância geocêntrica mantém-se dentro do <b>envelope real de perigeu/apogeu (~{ "356 500" }–{ "406 700" } km)</b> ao longo de um mês e a sua <b>média mensal recupera o semieixo maior de ~{ "384 400" } km</b>; a <b>latitude eclítica nunca excede a inclinação orbital lunar de ~{ "5.3" }°</b> (verificado projetando sobre o polo da eclítica em coordenadas equatoriais, validando em conjunto a série de latitude e a rotação da obliquidade); a <b>direção da Lua regressa a menos de { "1" }° após um mês sideral ({ "27.3217" } d)</b> e o seu <b>movimento diário mantém-se na banda física de { "12" }–{ "15" }°/dia</b>; e a perturbação de terceiro corpo lunar num satélite LEO tem a <b>magnitude de manual de ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ o dobro da do Sol). A exatidão de posição de nível DE, o arrasto atmosférico e a SRP continuam a ser trabalhos posteriores.

# text
# c1: forces::third_body_accel
# c2: ephem::sun_position
# c3: a = GM₃·((s−r)/|s−r|³ − s/|s|³)
# c4: ephem
# c5: third_body_potential
seg-8b7025e00dd1 = <b>Gravidade de terceiro corpo (Sol) com efemérides de baixa precisão incorporadas (<c1/>, <c2/>).</b> Acrescenta ao modelo de forças a perturbação de terceiro corpo: <c3/> (atração direta menos o termo indireto que o referencial geocêntrico tem de subtrair), com a posição do Sol fornecida pela série analítica de baixa precisão de Montenbruck & Gill do novo módulo <c4/> — <b>sem necessidade de nenhum kernel DE/SPK externo</b> para uma execução de baixa fidelidade. Validada de forma autónoma: a aceleração <b>coincide com o gradiente exato do seu próprio potencial perturbador</b> (<c5/>), a perturbação <b>anula-se no geocentro</b> e tem a <b>magnitude de manual de ~{ "5" }·{ "10" }⁻⁷ m/s² num satélite LEO</b>, e as efemérides do Sol atingem âncoras J2000 deduzidas à mão — <b>distância ao periélio ≈ { "1.471" }·10¹¹ m</b>, <b>declinação ≈ −{ "23" }° perto do solstício de dezembro</b>, um movimento aparente de <b>≈ { "1" }°/dia</b> (≈ { "90" }° por trimestre) e uma distância que se mantém dentro do envelope orbital terrestre de { "0.983" }–{ "1.017" } UA ao longo de um ano inteiro. Entrega a metade de terceiro corpo do passo do modelo de forças do marco do propagador numérico (a Lua é entregue numa entrada associada acima); a exatidão de posição de nível DE, o arrasto atmosférico e a SRP continuam a ser trabalhos posteriores.

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
seg-99fd6ae1ea09 = <b>Modelo de forças de harmónicas zonais J2–J6 (<c1/> / <c2/>).</b> Alarga o modelo de forças do propagador de Cowell para além de J2 até ao campo zonal completo da Terra até ao grau { "6" } (os <c3/> não normalizados do EGM-96 publicados como padrão), ligado ao propagador como <c4/>. A aceleração é o <b>gradiente analítico exato</b> do potencial perturbador zonal <c5/> (polinómios de Legendre por recorrência ascendente), validado de três formas independentes: <b>reduz-se ao <c6/> validado com 666 vetores, até à precisão da máquina</b>, quando restrita a <c7/>; <b>coincide com o gradiente numérico do seu próprio potencial</b> em todo o campo J2..J6 (a verificação de referência de ouro do campo conservativo); e os termos ímpares <c8/> face aos pares <c9/>/<c10/> exibem a sua <b>(anti)simetria norte–sul característica</b> sob <c11/> — a assimetria em forma de pera. Uma órbita J2..J6 propagada conserva a energia total (cinética + central + potencial zonal) até ~{ "1e-8" } ao longo de um dia e perturba a órbita apenas com J2 por uma quantidade pequena e não nula. Isto entrega o passo 2 ("harmónicas zonais J2–J6") do marco do propagador numérico; o campo tesseral EGM de grau elevado, o arrasto, a SRP, o terceiro corpo e a validação cruzada externa com GMAT/Orekit continuam a ser trabalhos posteriores.

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
seg-59f0ba5a6269 = <b>Propagador de órbita numérico (Cowell) (<c1/>).</b> O primeiro propagador <b>não analítico</b> do Kshana (o resto da pilha de órbitas é SGP4/SDP4 analítico): liga o modelo de forças de dois corpos + J2 (<c2/>) ao controlador adaptativo RK4 de duplicação de passo (<c3/>) como <c4/>, com um comutador <c5/>. Validado face a uma <b>verdade analítica mais forte do que seria uma ferramenta numérica cruzada</b>: a órbita não perturbada reproduz a <b>solução exata de Kepler por variáveis universais a nível submétrico ao longo de uma órbita LEO de 24 horas</b> (uma barreira mais apertada do que o "face a uma referência numérica < { "10" } m" que o marco enuncia), a energia específica e o momento angular conservam-se até ~{ "1e-9" } em termos relativos, e a regressão nodal de J2 reproduz o <c6/> em forma fechada segundo a teoria de primeira ordem (a menos de { "2" } %, o resíduo O(J2²)). Acrescenta também <c7/>, um resolvedor de Newton para a equação de Kepler que <b>devolve <c8/> em vez de uma resposta silenciosamente errada</b> quando não converge dentro de um orçamento limitado de iterações (o caso <c9/> perto do perigeu). Âmbito honesto: o modelo de forças é apenas dois corpos + J2 — o campo tesseral EGM de grau elevado ({ "200" }×{ "200" } + carregador), o arrasto (NRLMSISE-00), a SRP, as forças de terceiro corpo e uma validação cruzada externa com GMAT/Orekit continuam a ser trabalhos posteriores.

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
# c3: docs/CAPABILITY.md
seg-d4c7c29f09d1 = <b>Correspondência de mapa gravítico sem GPS durante 60 minutos até < { "500" } m (<c1/>).</b> Aprofunda a camada de PNT alternativo até ao objetivo de validação <em>Quantum Wayfarer</em> do ESA NAVISP: um veículo percorre um trajeto de ~{ "700" } km durante uma falha completa de GNSS de uma hora — a sua solução inercial deriva até <b>≈ { "70" } km</b> — e um gravímetro de átomos frios mais um correlacionador de partículas/grelha <b>hierárquico do grosseiro ao fino</b> recupera a deriva constante do INS até <b>≈ { "145" } m</b> (< { "500" } m), uma redução de > { "480" }×. O piso real de ruído branco do gravímetro é injetado como uma sequência <b>determinística com semente</b>, pelo que o correlacionador nunca recebe a verdade sem ruído e, ainda assim, a execução é exatamente reproduzível (verificada idêntica bit a bit e estável a alguns metros entre realizações de ruído). Um teste de nível de regressão mostra que o refinamento é <em>necessário</em> — uma única grelha grosseira estagna a ~{ "2" } km, e só o refinamento em três fases rompe a barreira de { "500" } m. Novo cenário submetido <c2/>. A linha <c3/> continua, com honestidade, <b>parcial</b> (ainda sem mapa EGM2008 incluído), com a sua evidência atualizada para o resultado de 60 min < { "500" } m. Âmbito honesto inalterado: campo de harmónicas esféricas de grau baixo + mascons sintéticos; um Monte-Carlo sobre realizações de erro de representação do mapa é um trabalho posterior.

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
seg-4262a99328bb = <b>Registo de alegações excessivas + proteção contra regressões (<c1/>, <c2/>).</b> Fecha a linha de trabalho de honestidade/retirada de alegações: as catorze alegações excessivas que uma auditoria anterior catalogou (<c3/>…<c4/>) estão agora todas GREEN — as alegações fortes (<c5/> filtro de Kalman acoplado de relógio+posição, <c6/> jamming J/S→C/N₀→perda de bloqueio, <c7/> física CAI Mach–Zehnder, <c8/> ARAIM HPL/VPL) são <b>substituídas por capacidades distribuídas e testadas</b> em vez de uma redação suavizada, e as restantes linhas têm as alegações retiradas para corresponder ao código. Um novo teste de CI analisa as superfícies públicas em vigor (<c9/>, <c10/>, <c11/>, <c12/>) e falha se alguma expressão de alegação excessiva simples já retirada reaparecer sem ressalva, pelo que uma linha GREEN não pode regredir em silêncio. A FoM de "integridade" por execução continua, com honestidade, etiquetada como <em>autoconsistência do filtro</em> (e não integridade de aviação); o HPL/VPL real do ARAIM é apresentado em separado, para que os dois nunca sejam confundidos.

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
seg-27da62a7ff63 = <b>Navegação por correspondência de mapa gravítico (PNT alternativo sem GPS).</b> O novo <c1/> acrescenta a camada de capacidades de PNT alternativo que os estudos de correspondência de mapa gravítico <em>Quantum Wayfarer</em> / QT-CCI do ESA NAVISP exigem: um <b>modelo de medição de gravímetro</b> de átomos frios cujo piso de ruído branco deriva da ASD do acelerómetro CAI (<c2/>); um <b>campo de anomalia gravítica em harmónicas esféricas</b> de grau baixo, totalmente normalizado (validado face às funções de Legendre em forma fechada <c3/>, <c4/>, <c5/> e a uma anomalia de um só termo, deduzida à mão, de { "1.897" } mGal) mais <b>mascons</b> sintéticos para as características locais de grau elevado; e um <b>filtro de partículas de correspondência de mapa gravítico</b> (compondo <c6/> + <c7/>) que recupera um trajeto sem GPS a partir da sequência de anomalias que atravessa. Um benchmark NAVISP submetido (<c8/>) reduz uma deriva inercial livre de ~{ "73" } km para uns poucos km. Âmbito honesto: o Kshana <b>não</b> inclui o conjunto completo de coeficientes EGM2008 de { "2190" }° — o campo é de grau baixo + mascons, não um mapa real de alta resolução; o carregador EGM/EIGEN, o mapa magnético, o SLAM auxiliado por terreno e a ligação <c9/> ao motor de cenários com um gráfico SVG de deriva continuam a ser trabalhos posteriores. <c10/> "Gravity-map / alt-PNT navigation" → <b>parcial</b>.

# text
# c1: src/maneuver.rs
# c2: r1
# c3: r2
# c4: v1
# c5: v2
# c6: r2
seg-d028a2db7837 = <b>Modelação de manobras e cabeça de ponte de conceção de trajetórias.</b> O novo <c1/> acrescenta a primeira camada de conceção de trajetórias acima do SGP4: nós de ΔV impulsivos que aplicam uma descontinuidade de velocidade e propagam uma covariância { "6" }×{ "6" } (queima determinística ⇒ transição de estado identidade; a covariância do erro de execução roda do referencial da queima — ECI ou LVLH — para o bloco de velocidade), uma integração de queima finita (empuxo constante ao longo de um arco de queima com a massa como estado) cujo ΔV alcançado é verificado face à equação de foguetão de <b>Tsiolkovsky</b> em forma fechada com melhor de { "0.01" } %, um resolvedor de <b>Lambert</b> de revolução única de <b>Izzo-2015</b> (<c2/>, <c3/>, tempo de voo ⇒ <c4/>, <c5/>), um <b>propagador de Kepler</b> exato por variáveis universais (verdade de dois corpos) e uma varredura <b>porkchop</b> que mapeia uma grelha de época de lançamento × época de chegada para o C3 de partida e o V∞ de chegada, emitida como uma matriz JSON 2-D para renderização de contornos no navegador. A validação é autónoma e mais forte do que uma leitura de tutorial: cada saída de Lambert faz a ida e volta pelo propagador de Kepler (tem de aterrar de volta em <c6/>), e o mínimo do porkchop é verificado face ao piso analítico de C3 da transferência de Hohmann para duas órbitas circulares coplanares. O Kshana posiciona isto como a camada de simulação de desempenho acima do GMAT/Orekit, não como um substituto (os ramos de várias revoluções e uma efemérides planetária real continuam fora do âmbito). Dez testes.

# text
# c1: src/fusion/tightly_coupled17.rs
# c2: [position, velocity, attitude-error, accelerometer bias, gyro bias, clock bias, clock drift]
# c3: C ≈ I + [ψ×]
# c4: q_va
# c5: crate::inertial::quantum_imu
seg-cbdd0e56d89f = <b>UKF GNSS/INS fortemente acoplado completo de 17 estados com navegação por estima quântica CAI.</b> O novo <c1/> transporta o estado completo de navegação inercial que um filtro fortemente acoplado estima — <c2/> ({ "17" } estados) — propagado através da mecanização strapdown conduzida pela força específica e pela taxa angular medidas, com a rotação corpo→inercial de ângulo pequeno <c3/>, de modo que o erro de atitude se acopla à aceleração horizontal (o acoplamento de inclinação padrão do INS). Durante uma falha de GNSS segue em deriva apenas com a IMU; o ruído de processo de passeio aleatório da velocidade é o <c4/> derivado do acelerómetro de interferómetro de átomos frios (<c5/>), pelo que a deriva da navegação por estima é a limitada pelo sensor quântico — uma falha de 120 segundos mantém-se limitada a umas centenas de metros, contra os quilómetros que um INS livre de qualidade de navegação atingiria. A atualização de pseudodistância/taxa de variação da distância corre pelo filtro unscented partilhado (com α = { "1" } para pesos bem condicionados a este tamanho de estado). Cinco testes: identidade do modelo de medição, integração de velocidade constante com IMU perfeita, auxílio por GNSS, estimação do enviesamento do acelerómetro e o teste de referência de falha de 120 s limitada por CAI.

# text
# c1: CITATION.cff
# c2: ROADMAP.md
seg-087521bb32b7 = <b>Enquadramento honesto do posicionamento quântico.</b> O descritor principal é agora um <b>"simulador de resiliência de PNT com modelos de desempenho de sensores quânticos"</b> de forma consistente no slogan do README, na linha de citação, em <c1/> (título + resumo) e na arte do cabeçalho — substituindo a formulação de marketing mais solta "simulador PNT híbrido quântico/clássico". A secção <em>What it is / is not</em> do README ganha uma declaração explícita de âmbito <b>"It is not (yet)"</b> (não é um motor de física de interferometria atómica de primeiros princípios, não é um recetor GNSS/resolvedor PVT, não é uma ferramenta de conceção de missões), e um novo <c2/> de nível superior torna a <b>camada de física quântica um item P2</b> (fase CAI Mach–Zehnder, ruído de projeção, tensor de vibração), para que os leitores saibam que a física de primeiros princípios está delimitada e a caminho, e não abandonada. Nenhuma alteração de comportamento ou de API.

# text
seg-f8fa36190ec7 = Estudo de compromissos de conceção de constelações: varredura de conceção Walker com uma frente de Pareto, JSON de tempo de revisita e uma validação submétrica da fórmula de Walker.

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
seg-31518e92d8cf = <c1/> ganha <c2/>, que executa uma grelha <c3/> (por exemplo, um compromisso { "3" }×{ "3" }) a uma inclinação fixa e tabula, por conceção, a fração de cobertura, o PDOP no pior caso e a lacuna de revisita máxima/média; <c4/> assinala as conceções não dominadas (menos satélites, mais cobertura, PDOP mais baixo, revisita mais curta), e <c5/> serializa as células e a frente de Pareto — incluindo os campos de tempo de revisita — como JSON. Uma nova validação fixa o gerador à fórmula de Walker <c6/>: mostra-se que satélites do mesmo slot em planos adjacentes se mapeiam uns nos outros por uma rotação <c7/> exata a <b>menos de { "1" } km ao longo de { "24" } h completas</b> de propagação SGP4 (a respiração de curto período de J2 é de modo comum e cancela-se), e confirma-se que os slots no plano estão espaçados de <c8/> em média. Assenta no instantâneo real submetido do Celestrak <c9/> de 2021-07-28 (<c10/>, exercitado pelos testes de cobertura de cenários e de ida e volta de SP3).

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
seg-71d257587c28 = <b>Transferência avançada de tempo e frequência: TWSTFT, vista comum GNSS, PPP, ótica, ajuste de lei de potência IEEE-1139 e um conjunto de relógios.</b> O novo <c1/> constrói os métodos operacionais de transferência sobre as formas fechadas de Sagnac/vista comum já distribuídas e sobre as ferramentas de estabilidade de Allan. <c2/> dá a correção de Sagnac da Transferência de Tempo e Frequência por Satélite Bidirecional como a soma do circuito de três saltos, igual à forma fechada do BIPM <c3/> exatamente (verificada de forma cruzada pelo <c4/> independente); <c5/> emite uma série <c6/> de um dia e o seu TDEV. <c7/> faz a diferença simples de duas estações terrestres sintéticas, de modo que o relógio do satélite se cancela. <c8/> + <c9/> são a combinação sem ionosfera PPP e a resolução do relógio do recetor face a uma verdade sintética de qualidade SP3, cancelando exatamente a ionosfera de primeira ordem. <c10/>, <c11/> e o <c12/> de média unitária modelam a cintilação induzida por turbulência de uma ligação ótica em espaço livre. <c13/> é um ajuste completo por mínimos quadrados de cinco coeficientes <c14/> IEEE-1139 da curva da variância de Allan (os cinco processos de ruído canónicos em simultâneo), com o processo dominante comunicado por década de τ. <c15/> forma uma escala de tempo de papel ponderada pelo inverso da variância cujo desvio de Allan fica estritamente abaixo do melhor relógio contribuinte. { "31" } testes unitários; os alvos de validação são formas fechadas e verdade sintética — falta ainda uma ingestão real de Circular-T do BIPM / SP3 do IGS.

# text
seg-c3ab93e7324f = Mapas de ionosfera IONEX: analisador de ficheiros, interpolação temporal e mapeamento de obliquidade oblíqua.

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
seg-7b94a515ce2b = <c1/> ganha <c2/>, que lê o formato de ficheiro IONEX (definição da grelha no cabeçalho + blocos <c3/>) para uma sequência de <c4/>s — normalizando a ordenação de latitude de norte para sul do ficheiro numa <c5/> de passo positivo e escalando os valores por <c6/>. <c7/> mistura dois mapas sucessivos numa época de consulta, e <c8/> / <c9/> mapeiam o TEC vertical para um raio oblíquo através do fator de casca fina de camada única <c10/> (<c11/>). Em conjunto com o modelo de grelha já distribuído, estes transformam um mapa global de ionosfera do IGS medido num atraso oblíquo utilizável.

# text
seg-2ed90763cf11 = Conceção de constelações: dimensionamento por ruas de cobertura + comparação de várias constelações.

# text
# c1: src/walker.rs
# c2: min_satellites_streets_of_coverage
# c3: λ
# c4: c
# c5: p = ⌈π/(2c)⌉
# c6: None
# c7: compare_constellations
# c8: pdop_sweep
seg-326e8957bb10 = <c1/> ganha <c2/>, um resolvedor idealizado de número mínimo de satélites por ruas de cobertura — a partir do semiângulo de cobertura <c3/> já distribuído e da meia-largura da rua <c4/>, dimensiona a constelação quase polar para cobertura global única contínua como <c5/> planos (por exemplo, um plano de 4 satélites à altitude do GPS precisa de { "2" } planos, { "8" } satélites), e comunica <c6/> quando os satélites são demasiado esparsos para formar uma rua contínua. <c7/> é a ferramenta de comparação de várias constelações: pontua cada conceção Walker nomeada na mesma estação/janela através de <c8/> e devolve lado a lado a sua cobertura / PDOP / dimensão. Âmbito honesto: a correção de Rider exata na junta da fronteira de planos em contrarrotação e um globo de cobertura 3-D são trabalhos posteriores.

# text
seg-90f5ec9ff4ae = Deteção de spoofing em várias camadas: detetor de paridade de consistência RAIM + fusão de camadas.

# text
# c1: src/spoof_monitors.rs
# c2: parity_raim_test
# c3: (m−4)
# c4: fuse_spoof_layers
seg-a0e4878bea45 = <c1/> ganha a terceira e última camada de deteção e a fase de fusão: <c2/> ajusta por mínimos quadrados a solução de posição/relógio a um conjunto redundante de pseudodistâncias e testa a soma dos quadrados residual ponderada restante face ao seu limiar χ²<c3/> — assinalando um <em>subconjunto</em> enviesado de satélites e deixando corretamente um enviesamento de <em>modo comum</em> (absorvido pelo relógio do recetor) invisível ao RAIM, sem o disfarçar. <c4/> combina as camadas de paridade, AGC e SQM numa única decisão ponderada que regista quais as camadas que dispararam. Um Monte-Carlo caracteriza o detetor: <b>P_fa ≈ { "0.068" }</b> empírico face a um ponto de conceção de { "0.05" }, com a <b>deteção falhada a descer de { "0.885" } com um enviesamento de spoofing de 2σ para { "0.16" } com 8σ</b>. Âmbito honesto: a validação cruzada face a vetores de teste de spoofing publicados específicos (Spirent / ION GNSS+) exige esses conjuntos de dados externos e continua a ser um trabalho posterior.

# text
# c1: src/fusion/coupled.rs
# c2: CoupledPntFilter
seg-2413b3d10f5b = <b>Conjunto de validação de Kalman acoplado versus desacoplado.</b> Um Monte-Carlo de 100 ensaios em <c1/> quantifica o valor de transportar a covariância cruzada posição↔relógio: uma linha de base desacoplada fiel e em linha (validada bit a bit face ao <c2/> distribuído) processa os mesmos dados com os blocos cruzados anulados, e, após pseudodistâncias quase degeneradas mais uma posição só de relógio, o filtro acoplado recupera a posição a <b>{ "2.97" } m RMS contra { "48.8" } m do filtro desacoplado, ganhando em { "97" } de { "100" } ensaios</b> — a posição de relógio só melhora a posição através da correlação que o pacote desacoplado descarta. Isto completa o conjunto de validação da correção de Kalman (forma de Joseph, segurança semidefinida positiva, consistência NEES/NIS e, agora, o conjunto de filtro acoplado).

# text
# c1: src/orbit_determination.rs
# c2: [r, v]
# c3: src/forces.rs
# c4: src/integrator.rs
# c5: src/batch_ls.rs
# c6: determine_orbit_batch
# c7: determine_orbit_sequential
seg-804f35695553 = <b>Cadeia de determinação de órbita (em lote + sequencial).</b> Um novo <c1/> recupera o estado orbital <c2/> de um satélite a partir de seguimento de distância por estação terrestre, compondo três peças já distribuídas: o modelo de forças de dois corpos + J2 (<c3/>) e o integrador RK4 (<c4/>) propagam um estado candidato ao longo do arco, um modelo de medição de distância prevê cada distância de estação, e o corretor em lote de Gauss–Newton (<c5/>) leva o candidato para o estado de melhor ajuste (<c6/>). A mesma dinâmica e o mesmo modelo de distância conduzem também uma determinação recursiva <b>sequencial</b> sobre o filtro unscented já distribuído (<c7/>). Quatro testes validam-no: previsão de distância ao longo do arco; <b>recuperação em lote a nível submétrico / mm·s⁻¹ a partir de distâncias sem ruído</b>; recuperação em lote a <b>~{ "2" } m com um resíduo pós-ajuste no piso de ruído de { "5" } m</b> (a assinatura de um ajuste de mínimos quadrados consistente); e recuperação sequencial a algumas dezenas de metros. Âmbito honesto: medições de taxa de variação da distância/Doppler e de ângulos, uma matriz de transição de estado analítica de J2 e o mascaramento de visibilidade de estações são trabalhos posteriores.

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
seg-0a81039e510c = <b>Navegador UKF GNSS/INS fortemente acoplado.</b> Um novo <c1/> liga o núcleo de Kalman unscented já distribuído (<c2/>) a um navegador fortemente acoplado funcional sobre o <c3/> de oito estados (posição/velocidade ECEF mais enviesamento e deriva do relógio do recetor em unidades de distância). Ingere as <b>medições brutas dos satélites</b> — <c4/> (<c5/>) e <c6/>/Doppler (<c7/>) — em vez de uma posição já formada, pelo que <c8/> (com <c9/>/<c10/>/ <c11/>) continua a corrigir <b>com menos de quatro satélites</b> e segue em deriva através de falhas de GNSS sobre a sua dinâmica propagada. Cinco testes validam-no de ponta a ponta, incluindo os cenários de aceitação do marco: a geometria de pseudodistância/Doppler face a valores deduzidos à mão; convergência sem ruído a <b>nível submétrico</b> com cinco satélites; um caso de <b>três satélites</b> a convergir de ~{ "212" } m para ~{ "13" } m onde nem sequer se consegue formar um PVT instantâneo; uma <b>falha de 120 segundos</b> a velocidade constante a menos de { "50" } m; e — a aceitação principal — uma <b>passagem LEO curva de 30 minutos</b> (órbita real de dois corpos + J2) com uma <b>falha de GNSS de 120 segundos</b>, mantida a <b>{ "0.77" } m RMS na passagem</b> e <b>{ "2.9" } m no pior caso durante a falha</b>. Essa deriva orbital compõe o modelo de forças gravíticas já distribuído (<c12/>) e o integrador RK4 (<c13/>) no modelo de processo do UKF (<c14/>), pelo que o filtro segue a curvatura da órbita — o que uma deriva de velocidade constante não consegue (só a curvatura são ~{ "58" } km em { "120" } s em LEO). Âmbito honesto: a deriva orbital usa o modelo de forças de dois corpos + J2 em vez da força específica bruta da IMU (para uma plataforma orbital sem propulsão coincidem); integrar um estado de erro de IMU strapdown e correções de iono/tropo em ciclo são trabalhos posteriores.

# text
# c1: src/mapmatch.rs
# c2: src/particle_filter.rs
# c3: field_likelihood
# c4: map_match_likelihood
# c5: Fn(lat, lon) -> value
# c6: src/ionex.rs
# c7: e^(−½)
seg-792f25a4a1da = <b>Modelo de medição de correspondência de mapa (navegação referenciada ao terreno/gravidade).</b> Um novo <c1/> fornece o modelo de medição que transforma o filtro de partículas de reamostragem por importância sequencial já distribuído (<c2/>) num navegador funcional sem GPS: <c3/> (uma verosimilhança gaussiana de correspondência de campo) e <c4/>, que amostra qualquer campo de referência georreferenciado — elevação do terreno (TRN) ou uma anomalia gravítica — na posição de uma partícula e pondera-a pela concordância com o valor medido do veículo. O campo é qualquer amostrador <c5/>, pelo que se combina com a grelha bilinear em <c6/> ou com um closure. Dois testes ancoram-no — a verosimilhança tem o pico (={ "1" }) numa correspondência perfeita e desce para <c7/> a um sigma, e um filtro de partículas sobre uma zona de terreno sintético distintivo recupera a posição verdadeira a menos de { "0.1" }. Âmbito honesto: os mapas de referência reais (elevação SRTM, anomalia gravítica EGM/EIGEN) e os respetivos carregadores são trabalhos posteriores.

# text
# c1: src/lunar.rs
# c2: σ_URE ≈ 30 m
# c3: P_sat ≈ 1e-4
# c4: lunar_araim
# c5: σ_URE
seg-9240e95a5058 = <b>Integridade de PNT cislunar (ARAIM lunar).</b> Um novo <c1/> aplica o motor ARAIM MHSS do lado da Terra a um serviço de navegação lunar do tipo LunaNet com os parâmetros lunares (<c2/> contra { "0.6" } m do GPS, <c3/>): constantes lunares, uma base selenocêntrica Este/Norte/Cima e um auxiliar de geometria do céu, e <c4/> (HPL/VPL). Três testes ancoram-no — a base selenocêntrica ortonormal, a geometria da distância oblíqua e a escala linear exata do nível de proteção com <c5/> (o valor lunar de { "30" } m dá um nível de proteção { "50" }× maior do que a mesma geometria com os { "0.6" } m do GPS — a razão quantitativa pela qual a integridade do PNT lunar é difícil). Âmbito honesto: as efemérides LANS NRHO precisas, o orçamento de erro do sinal no espaço e a redução de referencial MCI↔MCMF são trabalhos posteriores.

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
seg-4a43e2ff83d7 = <b>Datas julianas de duas partes (alta precisão).</b> Um novo <c1/> acrescenta <c2/>, uma data juliana dividida num <c3/> inteiro e num <c4/> fracionário em <c5/> (a convenção SOFA/hifitime), com <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. As diferenças de épocas próximas mantêm-se exatas até ao piso de <c11/>, onde uma JD de <c12/> único perde ~{ "50" } µs perto de J2000. Quatro testes ancoram-no: a ida e volta, a normalização da fração, a recuperação exata de microssegundos (com a falha do <c13/> único demonstrada a par) e a aritmética de segundos aditiva/reversível.

# text
# c1: src/omm.rs
# c2: oem
# c3: OmmFile::from_tle
# c4: BSTAR
# c5: to_omm_kvn
# c6: ndm/omm
seg-8eef92a85711 = <b>Escritor CCSDS OMM (Orbit Mean-Elements Message).</b> Um novo <c1/> complementa o escritor de efemérides <c2/> com a mensagem de elementos médios: <c3/> mapeia os elementos médios SGP4/TLE para as unidades OMM (movimento médio em rev/dia, ângulos em graus, mais <c4/>), e <c5/> serializa a forma KVN CCSDS 502.0-B-2 de norma em via de adoção — para que uma órbita do Kshana possa ser consumida por qualquer ferramenta que conheça OMM, em vez de como um TLE à medida. Dois testes ancoram a conversão de unidades TLE→OMM (≈ { "15.5" } rev/dia, inclinação de { "51.6" }°, etc.) e a presença das palavras-chave KVN exigidas. Âmbito honesto: a forma KVN e o mapeamento de TLE são distribuídos aqui; a renderização XML (<c6/>) e uma ida e volta com um analisador de referência são trabalhos posteriores.

# text
# c1: src/particle_filter.rs
# c2: predict
# c3: update
# c4: resample
# c5: effective_sample_size
# c6: ionex
seg-ca2b730b5cc3 = <b>Filtro de partículas de reamostragem por importância sequencial.</b> Um novo <c1/> acrescenta o estimador não linear e não gaussiano por trás da navegação auxiliada por mapa e sem GPS (referenciada ao terreno ou por correspondência de mapa gravítico): <c2/> (propagar as partículas pela dinâmica + ruído de processo gaussiano), <c3/> (repesar por uma verosimilhança de medição por partícula), <c4/> sistemática, o monitor de degenerescência <c5/> e a estimativa de média ponderada. Seis testes ancoram exatamente o núcleo determinístico — ESS a abranger { "1" }…N, a reamostragem sistemática a escolher índices em proporção ao peso, a combinação convexa da média ponderada, uma verosimilhança gaussiana a puxar a estimativa para a medição, o comportamento de reamostragem para uniforme e o determinismo de predict com semente. Âmbito honesto: o motor é distribuído aqui; os mapas de referência (elevação SRTM, anomalia gravítica EGM) e o modelo de medição de mapa são trabalhos posteriores (o amostrador de grelha + bilinear de <c6/> serviria igualmente para um mapa de gravidade/terreno).

# text
# c1: src/ionex.rs
# c2: TecGrid
# c3: vtec_at
# c4: Δ = 40.3·TEC/f²
# c5: vtec_to_delay_m
# c6: delay_at
# c7: 1 TECU ≈ 0.162 m
# c8: 1/f²
seg-564ad319685e = <b>Mapas de ionosfera TEC no estilo IONEX.</b> Um novo <c1/> acrescenta a alternativa de ionosfera medida ao modelo de Klobuchar difundido: uma <c2/> (uma grelha regular de latitude/longitude de TEC vertical, um mapa global de ionosfera do IGS) com interpolação bilinear num ponto de perfuração (<c3/>, limitada fora da grelha) e o atraso de primeira ordem <c4/> (<c5/>, <c6/>). Quatro testes ancoram-no: <c7/> em L1 com a escala <c8/>, interpolação exata nos nós, pontos médios bilineares a calcular a média dos cantos e consultas fora da grelha limitadas ao bordo. Âmbito honesto: a grelha e a interpolação são distribuídas aqui; a leitura do formato de ficheiro IONEX, a interpolação temporal entre mapas e a função de mapeamento oblíquo são trabalhos posteriores.

# text
# c1: src/timegeo.rs
# c2: timetransfer
# c3: sagnac_correction
# c4: Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)
# c5: common_view_offset
seg-26c7b53cbc8c = <b>Correções geométricas de transferência de tempo (Sagnac + vista comum GNSS).</b> Um novo <c1/> acrescenta os dois efeitos determinísticos que uma comparação real de relógios tem de ter em conta, complementando o modelo estocástico bidirecional em <c2/>: <c3/> (<c4/>, o atraso da Terra em rotação — dezenas de ns para linhas de base continentais) e <c5/>, a diferença simples de vista comum GNSS que cancela exatamente o erro do relógio do satélite e recupera o desvio entre estações. Três testes ancoram-nas em referências exatas: o efeito de Sagnac de ≈ { "33" } ns de um quarto de volta equatorial, a antissimetria e os casos radial/polar nulos, e o cancelamento exato do relógio do satélite. Âmbito honesto: um orçamento completo de atrasos de transponder/hardware TWSTFT e uma solução PPP de transferência de tempo sem ionosfera são trabalhos posteriores.

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
seg-098e7ea0ee13 = <b>Modelo de forças orbitais (dois corpos + J2).</b> Um novo <c1/> acrescenta o modelo de aceleração que um propagador numérico integra: <c2/> (<c3/>), a perturbação de achatamento <c4/> (a forma fechada em ECI) e <c5/> a somá-las — emparelhe-o com <c6/> como <c7/>. Expõe também as <b>taxas seculares</b> analíticas de J2 (<c8/>): a regressão nodal <c9/>, a rotação apsidal <c10/> e a deriva da anomalia média <c11/>. Seis testes ancoram a física em referências exatas: <c12/> para o termo de dois corpos, a forma fechada de J2 no equador (~{ "10" }⁻³ da magnitude de dois corpos), a <b>inclinação crítica</b> ({ "63.4349" }°) que congela o perigeu (<c13/>), a regressão nodal da ISS (<c14/>) e a deriva para leste de uma órbita retrógrada heliossíncrona. Âmbito honesto: apenas dois corpos + J2; J3–J6, arrasto, SRP e terceiro corpo são trabalhos posteriores.

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
seg-d5c03ebc5707 = <b>Ligações permanentes partilháveis de cenários.</b> Um novo <c1/> acrescenta um codec Base64 RFC { "4648" } sem dependências (alfabeto padrão <c2/> com preenchimento e um alfabeto <c3/> seguro para URL, sem preenchimento) e invólucros <c4/> / <c5/>, de modo que um TOML do playground possa ser codificado num parâmetro de consulta <c6/> e partilhado como URL. Exposto ao navegador como ligações wasm <c7/> / <c8/>. Quatro testes ancoram-no nos vetores canónicos da RFC { "4648" } (<c9/> → <c10/>, etc.), numa ida e volta de um cenário seguro para URL (sem <c11/>/<c12/>/<c13/> a escapar), na rejeição de símbolos inválidos e numa ida e volta de todos os 256 bytes. Âmbito honesto: o codec e as ligações são distribuídos aqui; a interface do botão Partilhar do playground, o gráfico multissérie Plotly/D3 e o modo de comparação A/B são trabalhos posteriores.

# text
# c1: src/batch_ls.rs
# c2: gauss_newton
# c3: h(x)
# c4: (HᵀWH)·Δx = HᵀW·(z − h(x))
# c5: a·exp(b·t)
seg-b615fb16d547 = <b>Mínimos quadrados em lote de Gauss–Newton (o corretor diferencial em lote).</b> Um novo <c1/> acrescenta o núcleo de estimação em que assenta uma <em>determinação de órbita</em> em lote (ou qualquer ajuste de parâmetros): <c2/> linearia um modelo <c3/> fornecido pelo utilizador com um jacobiano de diferenças finitas centrais, forma e resolve as equações normais ponderadas <c4/> (reutilizando a inversa de matrizes testada) e itera até à convergência com ponderações por medição. Quatro testes ancoram-no: um ajuste de reta linear que atinge a solução exata de mínimos quadrados ponderados, um ajuste não linear <c5/> que recupera os parâmetros verdadeiros, uma multilateração de distâncias 3-D que recupera uma posição conhecida a partir de distâncias sem ruído (a variante da determinação de órbita) e a rejeição de entradas subdeterminadas/incompatíveis. Âmbito honesto: este é o motor genérico do corretor; o modelo de medição de distância/taxa de distância/azimute-elevação específico de órbitas, a matriz analítica de transição de estado de J2 e a validação com casos publicados são trabalhos posteriores.

# text
# c1: src/spoof_monitors.rs
# c2: spoof
# c3: combine_power_dbm
# c4: AgcMonitor
# c5: bpsk_autocorr
# c6: SqmMonitor
# c7: 10·log10(N)
# c8: R(τ)=1−|τ|
seg-0ada87934135 = <b>Monitores de spoofing na camada RF (potência AGC e SQM).</b> Um novo <c1/> acrescenta dois detetores independentes de spoofing no front-end do recetor que complementam o monitor de spoofing temporal assistido por relógio em <c2/>: um <b>monitor de potência AGC</b> (<c3/> soma incoerente de potências + <c4/>) que assinala o excesso de potência recebida que um transmissor de spoofing acrescenta para além de uma margem configurável em dB, e um <b>monitor de qualidade do sinal</b> (<c5/> autocorrelação triangular do código + <c6/>) que assinala o desequilíbrio do correlador Early-menos-Late que o multipercurso/meaconing/replay introduz. Quatro testes ancoram as formas fechadas exatas ({ "3.01" } dB para uma duplicação da potência, o agregado <c7/>, o <c8/> triangular e o limiar de alerta Early/Late de { "10" } %). Âmbito honesto: o detetor completo de spoofing por paridade de consistência RAIM, a fusão multicamada das saídas dos monitores e a validação face a vetores de spoofing publicados da Spirent/ION GNSS+ são trabalhos posteriores.

# text
# c1: src/integrator.rs
# c2: rk4_step
# c3: y' = f(t, y)
# c4: integrate
# c5: 0.9·(tol/err)^(1/5)
# c6: y' = y → e
# c7: < 1e-9
# c8: NumericalPropagator
seg-b1ff62d88cd2 = <b>Integrador numérico adaptativo de EDO.</b> Um novo <c1/> acrescenta a primeira peça de um propagador <em>numérico</em> (a propagação de órbitas do Kshana é, de resto, analítica SGP4/SDP4): um passo genérico de Runge–Kutta de quarta ordem (<c2/>) sobre qualquer sistema de primeira ordem <c3/> e um controlador adaptativo (<c4/>) que controla o erro local por <b>duplicação do passo</b> (extrapolação de Richardson) com o controlador de passo padrão <c5/> e a lógica de aceitação/rejeição. Seis testes ancoram-no em soluções exatas: a exponencial <c6/> até <c7/>, a redução do erro de ~{ "16" }× por passo reduzido a metade que prova a convergência de quarta ordem, a conservação de energia/retorno do oscilador harmónico ao longo de um período completo e o controlador adaptativo a atingir uma tolerância apertada com passos variáveis. Âmbito honesto: este é o núcleo do integrador e o seu controlo de erro; as tabelas embebidas Dormand–Prince RK5({ "4" })/RKF7({ "8" }) e o modelo hierárquico de forças orbitais (dois corpos + J2–J6 + arrasto + SRP + terceiro corpo) que fazem dele um <c8/> são trabalhos posteriores.

# text
# c1: src/fusion/ukf.rs
# c2: n
# c3: P⁺ = P⁻ − K S Kᵀ
seg-ca53c62839d8 = <b>Filtro de Kalman unscented (UKF, de pontos sigma).</b> Um novo <c1/> acrescenta o filtro de Kalman unscented (UKF) escalado (Julier & Uhlmann; Wan & van der Merwe) como estimador geral de <c2/> estados sobre funções de processo e de medição fornecidas pelo utilizador — o estimador de pontos sigma que um navegador GNSS/INS fortemente acoplado utiliza quando o modelo de pseudodistância/Doppler é fortemente não linear e o jacobiano de um EKF se degrada. Inclui a álgebra linear densa de suporte (fator de Cholesky para a dispersão dos pontos sigma, inversa de Gauss–Jordan para a covariância da inovação) e uma atualização <c3/> sem forma de Joseph. Seis testes fixam-no, os principais a explorar a propriedade exata de que, para um modelo <em>linear</em>, a transformada unscented reproduz o filtro de Kalman com precisão numérica (predição, atualização e um ciclo completo de predição+atualização, todos comparados com um KF linear calculado à mão, além de uma verificação bayesiana analítica a 1-D da posteriori e das identidades de Cholesky/inversa). Âmbito honesto: este é o motor do estimador; o navegador GNSS/INS fortemente acoplado de 17 estados, o modelo de medição de pseudodistância/Doppler e o cenário de validação de interrupções continuam a ser trabalhos posteriores.

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
seg-da92d32b5715 = <b>Níveis de proteção ARAIM de dupla constelação.</b> Um novo <c1/> alarga o RAIM Avançado de falha única (<c2/>) com o <b>modo de falha de constelação inteira</b> do ARAIM da UE / DO-316: a par das hipóteses sem falha e por satélite, cada constelação (identificada por satélite) contribui com uma hipótese que remove todos os seus satélites de uma só vez, com probabilidade a priori <c3/> (um novo <c4/>). Cada hipótese acrescenta um termo à mesma soma de integridade MHSS, pelo que VPL/HPL são os menores limites cujo <c5/> total satisfaz o orçamento sobre falhas: sem falha + SV único + por constelação (a repartição de falsos alertas de Bonferroni faz-se por todas as <c6/> hipóteses). Com <c7/> o resultado é idêntico bit a bit a <c8/>; um utilizador de uma só constelação devolve <c9/> face à falha da sua própria constelação (não pode ser excluída) — que é exatamente a razão pela qual a cobertura de dupla constelação importa. Quatro testes cobrem a equivalência, o alargamento do nível de proteção, a indisponibilidade de constelação única e a validação das entradas, reutilizando a maquinaria existente de subsoluções de separação de soluções.

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
seg-d06c5f88282b = <b>Precessão IAU { "2006" } (ângulos de Fukushima–Williams e matriz de desvio-precessão).</b> Um novo <c1/> implementa a precessão IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }): os quatro ângulos de Fukushima–Williams <c2/> como polinómios em séculos julianos TT (<c3/>) e a matriz de rotação de desvio-precessão de GCRS para média da data construída a partir deles através da construção SOFA <c4/> (<c5/>, com auxiliares <c6/> / <c7/>). Esta é a primeira peça de referencial inercial sobre a redução <c8/> já existente, baseada em GMST. Oito testes validam-na face a âncoras de forma fechada — a obliquidade média de J2000 <c9/>, as constantes publicadas dos termos dos ângulos, a acumulação da precessão geral <c10/> ao longo de um século, a ortonormalidade da matriz e <c11/>, o valor quase-identidade (apenas desvio do referencial) em J2000 e o ângulo de rotação líquida de <c12/>/século. Âmbito honesto (<c13/>): apenas precessão — a nutação IAU 2000A de 678 termos, a cadeia completa TEME→GCRS e uma verificação cruzada numérica SOFA/ANISE de µas/<{ "10" } m são trabalhos posteriores.

# text
seg-14c0a863eef1 = Física de primeiros princípios de um acelerómetro de interferómetro de átomos frios (CAI).

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
seg-408fc6feb284 = <c1/> modela um interferómetro atómico Mach–Zehnder de três impulsos a partir de primeiros princípios, em vez de uma folha de especificações: vetor de onda efetivo <c2/>, fase do interferómetro <c3/>, ruído de projeção quântica (shot) <c4/>, sensibilidade à aceleração por disparo, decaimento do contraste <c5/> e — o ponto essencial — <c6/>, que <b>deriva</b> a PSD de aceleração branca que o <c7/> clássico já consome a partir do número de átomos, do tempo de interrogação e do contraste. O modelo cobre agora também o <b>acoplamento de vibração</b> — o termo dominante em dispositivos reais: a função de transferência aceleração→fase do interferómetro <c8/> (<c9/>), a variância de fase da PSD branca <c10/> (<c11/>, com uma verificação cruzada numérica por integral de banda <c12/>), a projeção de característica 1 ao longo do feixe <c13/> e <c14/> / <c15/> (esta última a reduzir-se ao patamar <c17/> independente de <c16/>). Onze testes verificam a física à mão (Rb-87 <c18/>, <c19/>, patamar de ruído de disparo de <c20/>/disparo vs patamar de vibração de ≈ { "5.9" } µg, as leis de escala <c21/>, <c22/> e <c23/>). Âmbito honesto em <c24/>: abrange o patamar do ruído de projeção e o regime limitado por vibração acima dele; o ruído de fase do laser, os sistemáticos de Coriolis e de desvio de luz e os cenários de validação PHARAO/CARIOQA continuam a ser trabalhos posteriores.

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
seg-ed668459d019 = <b>Acelerómetro quântico CAI integrado no cenário inercial.</b> Um acelerómetro num cenário inercial de navegação estimada resolve-se agora para um novo <c1/> — <c2/> (o sensor existente de coeficientes de folha de especificações) ou <c3/> quando transporta um bloco opcional <c4/> (<c5/>: comprimento de onda, separação dos impulsos, número de átomos, contraste, tempo de ciclo e uma <c6/> opcional da plataforma). A PSD de passeio aleatório de velocidade <c8/> de um sensor <c7/> é <b>derivada</b> da física do interferómetro — o patamar de ruído de disparo mais, quando é dada uma PSD de vibração, a contribuição limitada por vibração em quadratura — em vez de um coeficiente fornecido, e a proveniência da execução regista que o ruído é derivado da física. O campo <c9/> é <c10/>, pelo que os cenários existentes o omitem e são serializados de forma idêntica byte a byte (o hash do cenário não se altera). Cinco testes cobrem a derivação, a soma de vibração em quadratura, a seleção <c11/>/<c12/>, a serialização estável do hash e uma execução completa conduzida por CAI.

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
seg-aae519e71c00 = <c1/> ganha <c2/>, um otimizador de grelha sem gradiente que pesquisa o espaço de projeto <c3/> e devolve o melhor projeto Walker sob um <c4/> escolhido — <c5/>, <c6/> ou <c7/> — sobre a varredura de PDOP já validada (um teste confirma que devolve o vencedor por força bruta). Acrescem as formas fechadas analíticas das <b>ruas de cobertura</b> <c8/> (<c9/>) e <c10/> (<c11/>, Rider/Beste), verificadas à mão face à geometria de manual e a detetar a lacuna de sub-população. O solucionador completo de Rider de cobertura global com o mínimo de satélites, um globo 3-D no playground e uma verificação cruzada de DOP com uma ferramenta externa continuam a ser trabalhos posteriores.

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
seg-7b8468636dea = <b>Exportação de efemérides precisas SP3 a partir da CLI.</b> Um cenário de órbita/constelação propagado pode agora ser escrito num ficheiro SP3-c: <c1/>, ou <c2/> no cenário escreve automaticamente <c3/> (<c4/> / <c5/>, <c6/>, <c7/> opcional). Um teste de ida e volta (<c8/>) propaga o instantâneo real <c9/> do Celestrak, exporta-o, volta a lê-lo e confirma que as posições ECEF recuperadas coincidem com a referência SGP4 ao longo de { "24" } h até <b>< { "0.5" } m</b> (bem dentro da tolerância de { "10" } m de nível TLE). O README documenta o papel de interoperabilidade (RINEX → RTKLIB/gLAB, SP3 → produtos Ginan/de órbita precisa).

# text
seg-56c729ba110f = Filtro de Kalman acoplado de relógio+posição (covariância entre blocos).

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-0a424875131d = <c1/> é um único filtro <c2/> empilhado (atualizações na forma de Joseph) cuja medição de <b>pseudodistância</b> <c3/> acopla genuinamente os blocos de posição e de relógio — ao contrário dos dois filtros independentes de dois estados do pacote de fusão legado, que mantêm a covariância entre blocos exatamente nula. Validado: uma pseudodistância partilhada torna <c4/> não nulo; duas geometrias distintas resolvem conjuntamente desvios injetados de posição+relógio que uma só distância não consegue separar; uma <b>solução só de relógio afina a posição</b> através da covariância cruzada (o ganho que filtros desacoplados não conseguem proporcionar); e o NEES de Monte-Carlo é <b>consistente com χ²({ "4" })</b>. Esta é a realização de 1 grau de liberdade (a dimensionalidade do pacote de fusão); a extensão 3-D de 8 estados e a ligação ao pacote executável ficam registadas como trabalhos posteriores.

# text
seg-3983794a9584 = <b>Monitorização da saúde da consistência do filtro de Kalman (NIS/NEES).</b> A atualização da covariância do filtro de relógio de dois estados está agora na <b>forma estabilizada de Joseph</b> `P⁺ = (I−KH)P(I−KH)ᵀ

# text
# c1: , which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked in CI at
# c2: ). A new
# c3: runs a Monte-Carlo consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation², target 1) and **NEES** (normalised estimation error², target 2) against 95% χ² bands, surfaced as a
# c4: block in the clock result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test proves the monitor flips to inconsistent when the process noise is mistuned by ×0.1–×10. Adds a general χ² quantile (
seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, table-checked).

# text
# c1: docs/PROVENANCE.md
# c2: gps-ops
# c3: provenance
seg-f9689061a1d2 = <b><c1/> — uma tabela de proveniência citável.</b> Consolida todos os parâmetros de sensores (relógios, inercial, transferência de tempo), modelos físicos/algorítmicos (órbita, sistemas de tempo, referenciais, iono/tropo, integridade, deteção, jamming, Allan) e conjuntos de dados de validação (AIAA 2006-6753, <c2/> do Celestrak) com a sua fonte publicada — folha de especificações, artigo, ICD ou norma — e uma etiqueta de maturidade honesta (qualificado para voo / laboratório em terra / objetivo espacial em hardware de terra). Ligado a partir da introdução do README e da tabela de Documentação; complementa as cadeias <c3/> por execução que já viajam no JSON de resultados.

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
seg-55c7b52b5fdb = <b>API tipada de cenários.</b> O despacho faz-se agora sobre uma enumeração tipada <c1/> em vez de uma correspondência de cadeias <c2/> em bruto (<c3/> + despacho exaustivo), pelo que acrescentar um pacote é verificado em compilação. Novas superfícies tipadas a par do <c4/> inalterado que devolve cadeias: <c5/> com uma taxonomia estruturada de erros (<c6/> / <c7/> / <c8/> / <c9/>, cada um com um <c10/> estável); um trait <c11/> e um ponto de extensão <c12/> (o pacote <c13/> está ligado através dele como exemplo trabalhado); e introspeção <c14/> (nome, descrição, campos obrigatórios/opcionais por tipo de cenário). As ligações Python e WebAssembly ganham <c15/> e <c16/>. Documentado em <c17/>.

# text
seg-2b86391b753e = Constelação GPS real + cobertura do envelope operacional.

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: scripts/fetch_tles.sh
# c5: tests/scenario_coverage.rs
# c6: docs/VALIDATION.md
seg-288f2b1872c8 = <c1/> distribui agora um <b>instantâneo real <c2/> do Celestrak</b> (2021-07-28, { "30" } satélites) em vez de TLE Walker sintéticos, com <c3/> para que só carregue quando todas as somas de verificação dos TLE são válidas; <c4/> documenta a atualização reprodutível e o README credita a fonte de dados abertos. O novo <c5/> exercita cada pacote em ≥{ "5" } variantes de envelope, a afirmar saída finita/limitada, confirma que o <b>patamar de flicker-FM degrada de forma mensurável a marcha livre de um relógio</b> quando ativado (agora definido em três cenários distribuídos) e confirma que o <b>filtro de fusão converge com um desvio realista não nulo do acelerómetro</b> (dentro de { "3" }× o caso de desvio zerado), fechando a lacuna de realismo «a fusão só funciona com desvios zerados». <c6/> ganha uma tabela de Envelope Operacional.

# text
# c1: gnss-sim
# c2: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c3: [iono]
# c4: [tropo]
# c5: gnss_measurements[]
# c6: src/gnss_sim.rs
# c7: scenarios/gnss-sim-raim.toml
seg-f78d7dce7bfa = <b>Simulação GNSS no domínio das medições (tipo de cenário <c1/>).</b> Um modelo direto ao nível da pseudodistância: por satélite visível sintetiza <c2/> e o Doppler em L1, com a ionosfera monofrequência de <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) e a troposfera zenital de <b>Saastamoinen</b> projetada pela função de mapeamento de <b>Niell ({ "1996" })</b> — expostas como blocos TOML <c3/> e <c4/>. Os resíduos alimentam o RAIM instantâneo para HPL/VPL por época, e uma matriz JSON <c5/> transporta a pseudodistância, o Doppler, o C/N₀ e as correções iono/tropo de cada SV. Uma execução sem ruído reproduz a geometria + correções com precisão sub-milimétrica (teste de CI). Novos <c6/> e <c7/>.

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
seg-833249802c56 = <b>Detetor estocástico de spoofing temporal (tipo de cenário <c1/>).</b> O pacote de spoofing passa a executar um detetor real em vez de uma comparação determinística rampa-contra-limite: quatro formas de injeção (<c2/>, <c3/>, <c4/>, <c5/>), um teste de energia / Neyman–Pearson bilateral χ²₁ sobre a estatística do monitor assistido por relógio com o limiar definido a partir de um orçamento-alvo de falsos alarmes <c6/> e a probabilidade de deteção falhada <c7/> reportada tanto em forma fechada como por Monte-Carlo (<c8/> ensaios por hipótese — os dois concordam até alguns ×1/√N). A figura de mérito de Segurança é agora <c9/> na magnitude operacionalmente prejudicial (de especificação). Novos <c10/> (funções de cauda gaussiana, teste NP/de energia, P_fa/P_md por Monte-Carlo) e <c11/>. Retrocompatível: um simples <c12/> continua a ser aceite como rampa linear.

# text
# c1: spoof
# c2: 1 − min_detectable/threshold
# c3: 1 − P_md
# c4: security
seg-b3f3d2ca8a3d = <b>Definição da FoM de Segurança (tipo de cenário <c1/>):</b> do limite analítico de detetabilidade <c2/> para o <c3/> do detetor estocástico. O campo <c4/> do pacote de relógios continua a ser o indicador analítico mais rápido.

# text
seg-ee1268975b2c = Acrescentado (continuação)

# text
# c1: jamming
# c2: Q
# c3: availability_under_jamming
# c4: src/jamming.rs
# c5: scenarios/jamming-demo.toml
# c6: docs/CAPABILITY.md
# c7: docs/VALIDATION.md
seg-f71696b7fa20 = <b>Modelo de jamming RF (tipo de cenário <c1/>).</b> Um modelo de interferência por orçamento de ligação que converte a potência e a geometria de um jammer em perda de seguimento por satélite: a razão jammer-sinal a partir da perda em espaço livre e do ganho da antena de receção por direção, o C/N₀ efetivo pela equação anti-jam padrão (ganho de processamento de despreading × o fator de separação espetral <c2/>; Kaplan & Hegarty §{ "9.4" }) e um limiar de seguimento configurável, avaliado sobre uma constelação Walker como figura de mérito <c3/>. Novos <c4/> e <c5/>. O âmbito honesto (sem multipercurso, sombra do terreno, AGC nem anulação adaptativa) está documentado em <c6/> / <c7/>.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: [base]
# c4: scenarios/sweep-nd-inertial.toml
seg-d4dc36011ea1 = <b>Varrimento genérico N-D de parâmetros sobre qualquer tipo de cenário (<c1/>).</b> O varrimento N-D anterior era apenas do pacote de relógios. <c2/> faz variar chaves TOML pontuadas de um cenário <c3/> sobre o produto cartesiano dos seus eixos, volta a despachar cada nó da grelha pelo caminho de execução normal e lê uma ou mais métricas do resultado por caminho JSON pontuado — pelo que funciona para todos os pacotes (inercial, gnss-ins, integridade, spoof, …) sem se acoplar ao tipo Rust de cada pacote. Os nós da grelha são avaliados em paralelo por fios do SO em alvos nativos (sem dependências acrescentadas); o wasm recorre ao modo sequencial. Determinístico e por linhas, independentemente do número de fios. Novo exemplo <c4/>.

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
# c3: gnss-ins
seg-1c42e15d65a9 = <b>Modelo determinístico de erros de IMU configurável em TOML no pacote <c1/>.</b> A cadeia de erros strapdown de três eixos (fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) é agora acessível por sensor a partir de um ficheiro de cenário através de um bloco opcional <c2/>, por cima dos desvios constantes de arranque. Omitir o bloco deixa cada sensor como uma fonte pura de desvio constante, pelo que as execuções <c3/> existentes não se alteram. Isto liga o modelo de erros, antes só de biblioteca, a um pacote executável e a uma figura de mérito.

# text
# c1: tests/fixtures/igs/NOTICE
seg-e035371fbe58 = <b>Validação com dados reais.</b> O analisador multi-GNSS de navegação RINEX, o propagador RK4 do GLONASS e o leitor SP3 são agora exercitados com ficheiros IGS/DLR genuínos (um ficheiro real de navegação difundida mista RINEX { "3" } e um produto de órbita IGS SP3-c), e não apenas com amostras de autoria própria — a afirmar conjuntos de satélites não vazios e posições ECEF finitas e fisicamente dimensionadas. Os ficheiros de apoio servem apenas para testes (excluídos da crate publicada); ver <c1/>.

# text
# c1: P_HMI
seg-2a807ae8e194 = <b>RAIM sobre geometria real de órbitas de referência.</b> Os núcleos de nível de proteção instantâneo, de separação de soluções (MHSS) e ARAIM estão agora validados face à geometria real de órbitas precisas IGS (SP3), e não apenas a constelações sintéticas: a geometria da linha de visada é construída a partir da primeira época SP3 numa estação terrestre real, e os testes afirmam níveis de proteção de nível métrico e disponíveis para APV-I, que um desvio de pseudodistância de { "60" } m dispara o monitor χ², que a separação de soluções <b>identifica</b> o satélite com falha e que os níveis do ARAIM satisfazem o <c1/> atribuído. Fecha a lacuna de validação só em geometria sintética (a paridade com o gLAB no domínio do recetor ao longo de um arco RINEX completo continua a ser um item do roteiro — precisa de uma solução de pseudodistância).

# text
# c1: sweep::nd_sweep_ensemble
# c2: metric_stat
# c3: runs = 1
# c4: nd_sweep
seg-651cc4af4872 = <b>Intervalos de confiança por nó para o varrimento N-D de parâmetros</b> (<c1/>). Cada nó da grelha do varrimento cartesiano N-dimensional pode agora ser avaliado como um ensemble de Monte-Carlo de sementes, reportando a média da métrica, percentis e um IC de { "95" } % por bootstrap de percentis por nó (para ambos os relógios) — um varrimento estatisticamente honesto em vez de uma só extração por nó. Reutiliza a maquinaria de ensemble/bootstrap (<c2/>); determinístico; <c3/> reduz-se exatamente ao <c4/> de semente única. (A generalização do varrimento a todos os pacotes, entrelaçada com a refatoração do Scenario tipado, e a execução paralela continuam por fazer.)

# text
# c1: tests/navego_imu_crossval.rs
# c2: navego_example_allan.m
# c3: ADEV(1 s) = σ·√dt
# c4: .mat
seg-815eda56aad9 = <b>Validação cruzada NaveGo do pipeline de ruído de IMU</b> (<c1/>). Uma verificação cruzada externa com o NaveGo (a toolbox INS/GNSS de código aberto de R. Gonzalez): reproduz a ida e volta sintética de <c2/> no seu perfil de referência publicado do Microstrain 3DM-GX3-35, confirmando que o nosso estimador ADEV sobreposto recupera os coeficientes de passeio aleatório de velocidade e de ângulo do NaveGo (<c3/>) com menos de { "5" } % de diferença, com o declive esperado de −1/2 do ruído branco. (O registo STIM300 <c4/> de { "40" } MB não é ingerido — está condicionado por um formato binário.)

# text
seg-b67b3ec240de = Atualização GNSS/INS fortemente acoplada (pseudodistância).

# text
# c1: GnssInsEkf::update_tightly_coupled
# c2: ClosedLoopInsGnss::fuse_tightly_coupled
# c3: tight_coupling
seg-c926dddc5256 = <c1/> (e o invólucro <c2/>) implementam a medição no domínio da distância que antes era um esboço: a inovação é a distância prevista da posição INS a cada satélite face à pseudodistância medida, com um jacobiano de linha de visada sobre o erro de posição. Como cada satélite é uma medição escalar, o filtro continua a corrigir com <b>menos de quatro satélites</b> — onde não existe uma solução PVT fracamente acoplada. Cinco testes cobrem a anulação com quatro satélites, a correção com dois satélites (sem PVT possível), a observabilidade ao longo da linha de visada com um único satélite e a validação das entradas. Apenas pseudodistância; a fase da portadora e um estado explícito de relógio do recetor continuam no roteiro. A funcionalidade cargo não utilizada <c3/> (que condicionava o antigo esboço de erro) foi removida.

# text
# c1: kind = "gnss-ins"
# c2: src/fusion/pack.rs
# c3: closed_loop
# c4: gnss_ins_ekf
# c5: scenarios/gnss-ins.toml
seg-94ebfac3bbc3 = <b>Pacote de cenários GNSS/INS fracamente acoplado (<c1/>, <c2/>).</b> Liga o navegador strapdown de três eixos e o EKF de estados de erro de 15 estados (<c3/> / <c4/>) a um cenário executável com uma figura de mérito — o EKF disciplina a mecanização face a soluções GNSS ruidosas enquanto há cobertura e depois segue em marcha livre durante a interrupção, substituindo o reinício por ajuste à referência do antigo pacote escalar de 1 grau de liberdade por fusão genuína. O resultado reporta a série de erro horizontal fundida, a FoM de posição pontuada (disponibilidade / RMS na interrupção / holdover) e o RMS do INS livre em malha aberta para comparação; um par de IMU quântica/clássica difere apenas no desvio verdadeiro. Despachado a partir do ponto de entrada CLI/Python/wasm com um exemplo <c5/>. Enquadramento honesto: apenas fracamente acoplado, uma trajetória determinística, e o erro fundido na interrupção é limitado por um patamar imposto pelo erro de atitude na transferência (pelo que não se afirma que escale com o desvio) — as conclusões robustas são que a fusão supera a navegação estimada sem assistência para um sensor com desvio e que um sensor de menor desvio tem a melhor marcha livre sem assistência.

# text
# c1: src/walker.rs
# c2: walker
# c3: i: T/P/F
# c4: pdop_sweep
# c5: {planes × sats × inclination}
# c6: coverage_revisit
# c7: gps-ops
seg-0a2df01f99d8 = <b>Projeto de constelações sobre o núcleo SGP4 validado (<c1/>).</b> Um novo módulo <c2/> emite um padrão Walker-delta projetado (<c3/>) como <b>elementos médios</b> SGP4, de modo que a constelação sintética se propaga pelo mesmo caminho SGP4 validado a { "4.12" } mm face aos vetores AIAA 2006-6753 — e não pelo gerador kepleriano analítico. Por cima: <c4/> tabela a cobertura e o PDOP mediano/pior sobre uma grelha de projeto <c5/>, e <c6/> reporta a fração de cobertura e as lacunas de revisita (pior/média) num ponto do solo. Validado pelas monotonias físicas a que um compromisso tem de obedecer (mais satélites ⇒ maior cobertura, menor PDOP, revisita mais curta). Em separado, um <b>instantâneo TLE <c7/> real do Celestrak</b> (2021-07-28, { "30" } satélites GPS operacionais) é acrescentado como ficheiro de apoio apenas de testes e o caminho de geometria TLE real → SGP4 → ECEF é validado face a ele (toda a camada MEO a menos de { "1" } %, nove satélites todos à vista com PDOP { "1.64" }), a par dos caminhos de dados reais SP3 e RINEX existentes.

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
seg-2392bec8f0b6 = <c1/> implementa as formas fechadas da Tabela { "5" } do NIST SP { "1065" } (o conjunto simples do Stable32) para os cinco tipos canónicos de ruído em lei de potência — PM branco/flicker, FM branco/flicker, FM de passeio aleatório — substituindo a contagem conservadora sem sobreposição como graus de liberdade do χ². Uma nova enumeração <c2/> e <c3/> identificam o tipo dominante a partir do declive do desvio de Allan <b>modificado</b> do registo (o MDEV separa o PM branco do PM flicker onde o ADEV não consegue), e <c4/> anexa agora o tipo de ruído identificado, o seu edf e uma banda de confiança de { "95" } % a cada ponto da curva ADEV exportada (<c5/> ganha <c6/>/<c7/>/<c8/>/<c9/>, aditivos com valores predefinidos serde). Validado de duas formas: as cinco fórmulas coincidem com valores avaliados à mão até { "1e-12" }, e um ensemble de Monte-Carlo de { "4" } 000 registos de FM branco confirma que a fórmula prevê o edf de qui-quadrado real do estimador a menos de { "20" } % (e que supera substancialmente a contagem conservadora). Oito novos testes.

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
seg-d2add1ce01e1 = <c1/> substitui o amostrador apenas de ruído branco por um modelo com fundamento físico: o atraso de percurso recíproco (de modo comum) cancela-se na estimativa <c2/> (<c3/>, pelo que duas medições unidirecionais independentes fazem a média até <c4/>), e o resíduo é o atraso diferencial <b>não recíproco</b> — modelado como um processo colorido de FM branco + FM de passeio aleatório (o <c5/> validado), dando à série de erro de sincronização uma assinatura de Allan realista (<c6/>) em vez de ruído branco plano. <c7/> ganha <c8/>/<c9/> (valor predefinido serde { "0" } ⇒ o comportamento antigo apenas de ruído branco, bit a bit), a FoM da ligação reporta <c10/> (o desvio de Allan do modelo no passo de base) e o cenário/CLI <c11/> expõem-no. FoM de referência fixada de novo. Seis testes deduzidos à mão (cancelamento de modo comum, o ganho bidirecional sqrt({ "2" }), a lei RWFM <c12/> através do próprio <c13/> da ligação, equivalência com o comportamento antigo em <c14/>, determinismo e exposição da FoM de ponta a ponta).

# text
seg-6c7a1dd63be0 = Paridade numérica com o Stable32 para os estimadores da família de Allan (NBS14).

# text
# c1: tests/allan_reference.rs
seg-adbb47ca87b4 = <c1/> valida os estimadores ADEV sobreposto, ADEV modificado, desvio de tempo e Hadamard sobreposto face aos desvios de referência do Stable32 para o conjunto de dados canónico <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~p.107) em tau = { "1" }, { "2" } com uma tolerância relativa de { "1e-4" } — concordância real de ~{ "1e-6" }. Isto fixa a matemática dos estimadores face à implementação de referência de facto, e não apenas face à própria autoconsistência analítica dos estimadores. Só são usados os números públicos de referência; nenhum código de terceiros.

# text
# c1: integrity
# c2: integrity
# c3: IntegrityScenario
# c4: seed
seg-35b0c0644fa2 = <b>Diagrama vertical de integridade de Stanford exportado pelo cenário <c1/>.</b> O tipo de cenário executável <c2/> exporta agora um diagrama vertical Stanford(-ESA) a par do mapa de disponibilidade HPL/VPL: em cada época protegida, uma extração reproduzível e com semente de erro de distância sem falha é mapeada através da geometria para um erro de posição vertical real e classificada face ao VPL e ao limite de alerta vertical (Available / System-Unavailable / Misleading / Hazardously-Misleading). O diagrama (pontos por época + contagens por região) é transportado no JSON de resultados e as contagens de eventos de integridade / HMI no resumo da CLI, pelo que o classificador de Stanford — antes só de biblioteca — fica acessível de ponta a ponta. <c3/> ganha um campo <c4/> (predefinição { "0" }) que controla a realização do erro; o próprio mapa de disponibilidade continua a depender apenas da geometria e é independente da semente.

# text
seg-5d76a638ae77 = Orçamento de risco de integridade ARAIM (P_HMI) para os níveis de proteção.

# text
# c1: raim::araim_raim
# c2: K_md
# c3: (prior, detection threshold, σ)
# c4: araim_protection_level
# c5: araim_integrity_risk
# c6: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c7: P_HMI
seg-449adb9ad6e6 = <c1/> deriva os níveis de proteção horizontal e vertical a partir de um orçamento explícito de risco de integridade, em vez de um multiplicador fixo <c2/>: para a solução com todos à vista e para cada subsolução de exclusão de um só satélite constrói o <c3/> por modo em cada eixo, e depois <c4/> resolve o menor PL cuja probabilidade somada de informação perigosamente enganosa (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) satisfaz o <c7/> atribuído. O resultado reporta o risco de integridade que os níveis realmente atingem, de modo que um utilizador possa trocar integridade por limite de alerta de forma explícita. Seis testes deduzidos à mão (formas fechadas de modo único sem falha e com limiar, somatório/monotonia multimodo, proteção sem falha de ponta a ponta com um orçamento 10⁵× mais apertado a subir o PL, deteção/identificação de falhas e o patamar de redundância de seis satélites). O MHSS de falha única é a linha de base do ARAIM; falhas simultâneas em subconjuntos de vários SV, o modo de falha de constelação inteira e a validação com o conjunto de dados de referência do gLAB são extensões documentadas.

# text
seg-3e33581644a5 = Compensação de coning/sculling a duas velocidades para a mecanização strapdown.

# text
# c1: inertial::mechanization::coning_sculling_compensate
# c2: NavState::step_increments
# c3: ScalarErrorBudget
# c4: AccelModel
# c5: NavState
seg-c900e193ac29 = <c1/> retira os termos de coning (atitude) e de rotação+sculling (velocidade) de alta taxa dos incrementos de IMU ordenados em subintervalos de uma atualização grosseira, de modo que um <c2/> de taxa moderada reproduza o movimento retificado por vibração que um passo grosseiro sobre as somas em bruto não capta. Um teste de validação aplica um ambiente de coning+sculling de { "10" } Hz durante { "60" } s e compara a referência de taxa fina, a integração grosseira ingénua e a integração grosseira com compensação: a compensação reduz o erro de posição em ~{ "18" }× (metros de deriva ingénua → sub-decímetro), confirmando que os termos de coning/sculling são determinantes. Um alias de tipo <c3/> dá ao antigo <c4/> de 1 grau de liberdade o nome que lhe corresponde, distinto do navegador de três eixos <c5/>.

# text
# c1: rinex_obs
# c2: parse_obs
# c3: SYS / # / OBS TYPES
# c4: C1C
# c5: L1C
seg-ceb037e7a6ea = <b>Analisador de ficheiros de observação RINEX.</b> O novo módulo <c1/> lê o ficheiro de <em>observação</em> RINEX 3.0x / { "4.00" } — as medições reais do recetor — completando o par RINEX a par do analisador existente de mensagens de navegação. <c2/> descodifica o cabeçalho (versão/tipo, as listas <c3/> por sistema com linhas de continuação, posição aproximada, intervalo, instante da primeira observação) e os registos por satélite de cada época: pseudodistância, fase da portadora, Doppler e intensidade do sinal, indexados pelo respetivo código de observação RINEX { "3" } (<c4/>, <c5/>, …) com os indicadores de perda de bloqueio (LLI) e de intensidade do sinal (SSI), mantendo um campo em branco como ausente e não como zero. Âmbito honesto: esta é a <em>ingestão</em> de um formato normalizado (entra um registo real de observações RTKLIB/gLAB/estação IGS, saem medições tipadas), não um motor de posicionamento — aqui não há solução de pseudodistância, PPP nem RTK.

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
seg-60efb0c44522 = <b>Escritor CCSDS OEM (Orbit Ephemeris Message).</b> O novo módulo <c1/> exporta uma constelação propagada como mensagem CCSDS 502.0-B OEM { "2.0" } válida — o formato KVN de efemérides que o GMAT, o Orekit, o STK e a maioria das ferramentas de dinâmica de voo ingerem. <c2/> amostra o estado inercial (TEME) de cada satélite — posição <b>e</b> velocidade, retiradas diretamente do propagador sem rotação para referencial fixo à Terra, ao contrário da exportação SP3 — numa grelha temporal, e <c3/> serializa o cabeçalho <c4/>/<c5/>/ <c6/> mais um segmento <c7/> por satélite (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) seguido das suas linhas <c15/> (km, km/s). O <c16/> é fornecido por quem chama, nunca a hora do relógio de parede, pelo que a saída é idêntica byte a byte entre execuções (o contrato de reprodutibilidade). Este é o equivalente para efemérides de veículos espaciais da exportação GNSS SP3: uma órbita do Kshana pode agora ser entregue a uma ferramenta de dinâmica de voo num formato normalizado.

# text
seg-f8538db4a17c = Efemérides precisas SP3 como fonte de propagação.

# text
# c1: Sp3File::interpolator
# c2: Sp3Interpolator
# c3: Propagator::Sp3Precise
seg-2cf2e224deb9 = <c1/> constrói um <c2/> por satélite que preenche a posição entre as épocas SP3 tabeladas com um polinómio de Lagrange de 9.ª ordem (prática padrão do IGS) e a roda para o referencial TEME partilhado, exposto como <c3/>. Um ficheiro de órbitas precisas de um centro de análise IGS pode agora alimentar o mesmo pipeline de geometria/visibilidade/integridade que os propagadores difundidos e analíticos. Ida e volta validada: uma órbita kepleriana escrita em SP3 e relida através do interpolador coincide com a original a menos de um metro nos nós e < { "100" } m a meio do intervalo. A interpolação do relógio é o passo seguinte.

# text
# c1: glonass
# c2: parse_glonass_nav
# c3: R
# c4: J2
# c5: Propagator::Glonass
# c6: rinex
seg-8d50fd42f53c = <b>Efemérides difundidas do GLONASS (completa a navegação RINEX multi-GNSS).</b> Novo módulo <c1/>: o GLONASS não difunde elementos keplerianos mas um <b>vetor de estado</b> fixo à Terra PZ-90 (posição, velocidade, aceleração luni-solar). <c2/> lê os registos RINEX { "3" } <c3/>, e a posição do satélite em qualquer instante obtém-se por <b>integração de Runge–Kutta de 4.ª ordem</b> das equações de movimento do ICD do GLONASS (gravidade central + <c4/> + termos de Coriolis/centrífugo da rotação da Terra + a aceleração difundida). Exposto como <c5/>, pelo que os satélites GLONASS fluem pelo pipeline de constelação/visibilidade/integridade a par dos sistemas keplerianos; um único bloco de constelação <c6/> pode agora misturar GPS, Galileo, QZSS, BeiDou e GLONASS.

# text
# c1: E
# c2: J
# c3: C
# c4: G
# c5: Propagator::Rinex
seg-8d88144e3726 = <b>Navegação RINEX multi-GNSS (GPS, Galileo, QZSS, BeiDou).</b> O analisador de navegação RINEX { "3" } descodifica agora registos Galileo (<c1/>), QZSS (<c2/>) e BeiDou (<c3/>, MEO/IGSO) a par do GPS (<c4/>) — partilham a disposição kepleriana e o algoritmo do utilizador — cada um avaliado com a sua própria constante gravitacional e taxa de rotação da Terra (μ de Galileo/BeiDou, Ω̇ₑ de BeiDou). Um ficheiro de constelações mistas produz todos eles, a fluir pelo pipeline de constelação/visibilidade/integridade como <c5/>. Os satélites geoestacionários BeiDou usam uma rotação de coordenadas diferente e são ignorados até haver um ficheiro de referência face ao qual validar. O percorredor de registos usa contagens de linhas por sistema, corrigindo um erro latente em que os registos GLONASS/SBAS de quatro linhas eram ignorados como se tivessem oito linhas. O GLONASS (um modelo de vetor de estado) é o passo seguinte.

# text
# c1: sp3
# c2: parse_sp3
# c3: Sp3File
# c4: V
# c5: Sp3File::from_propagators
# c6: to_sp3_string
seg-91a6907acc8d = <b>Leitor e escritor de efemérides precisas SP3-c/d.</b> O novo módulo <c1/> analisa ficheiros de órbitas precisas SP3 de centros de análise IGS (<c2/>) — o produto pós-processado de posição/relógio ECEF que os motores PPP (Ginan, RTKLIB, gLAB) tratam como referência — para um <c3/> estruturado (cabeçalho, grelha de épocas, posição por satélite km→m, relógio µs e velocidade dm/s→m/s para produtos <c4/>), preservando os valores sentinela SP3 de valor inválido. O sentido inverso também está coberto: <c5/> constrói um SP3 a partir de uma constelação propagada (TEME→ECEF por época) e <c6/> serializa-o, pelo que as órbitas do Kshana podem ser exportadas no formato que as ferramentas PPP externas ingerem — a ida e volta leitura↔escrita. A interpolação de épocas e uma fonte de propagador SP3 são o passo seguinte.

# text
# c1: rinex
# c2: tle
# c3: scenarios/orbit-rinex.toml
seg-7d51d1b6f39f = <b>Efemérides difundidas RINEX como fonte de constelação executável.</b> Uma constelação aceita agora um bloco <c1/> inline (texto de navegação GPS RINEX { "3" }) a par da opção <c2/> existente, de modo que um ficheiro real de difusão conduza um cenário de ponta a ponta a partir da CLI, do Python ou do playground no navegador — entra RINEX, sai geometria PNT. O novo <c3/> demonstra a disponibilidade GNSS e o DOP a partir de oito satélites GPS construídos diretamente a partir de registos difundidos. (Apenas GPS LNAV; multi-GNSS e SP3 são o passo seguinte.)

# text
# c1: RinexEphemeris
# c2: orbit::Propagator
# c3: Propagator::Rinex
# c4: sv_position_teme
seg-9730835bfc64 = <b>Efemérides difundidas RINEX como fonte de propagação.</b> Um <c1/> analisado converte-se agora num <c2/> (<c3/>): a posição é a órbita difundida IS-GPS-200 rodada de ECEF para o referencial inercial TEME partilhado (<c4/>, com tempo GPS→UT1 correto quanto aos segundos intercalares), a velocidade por diferença finita central e o período orbital kepleriano. Dados difundidos GPS reais podem agora conduzir o mesmo pipeline de geometria, visibilidade e integridade (RAIM) que os propagadores analíticos SGP4/keplerianos. (Ainda não exposto como tipo de cenário de ficheiro RINEX — isso e multi-GNSS/SP3 são o passo seguinte.)

# text
seg-a355e3e52ec3 = <b>DOI de arquivo.</b> As versões são agora depositadas no Zenodo e recebem um DOI citável.

# text
seg-c6e4556e1ce5 = <b>Documentação.</b> O README foi renovado para um nível institucional: uma visão geral de Capacidades de toda a pilha { "v0.9.0" }, uma secção de Versões e lançamentos, um cabeçalho limpo com a nova marca e uma linha de estado concisa. Sem alterações ao motor.

# text
# c1: integrity
seg-1bfc4e965d2b = Esta versão acrescenta três áreas substanciais de capacidade sobre o substrato SGP4 { "0.8.0" }: um genuíno INS strapdown de três eixos, um EKF de estados de erro GNSS/INS fracamente acoplado com realimentação em malha fechada, RAIM genuíno instantâneo e de separação de soluções (ao estilo ARAIM) com HPL/VPL e um cenário <c1/> executável, e o primeiro passo da interoperabilidade de formatos GNSS (ingestão de efemérides GPS RINEX-3).

# text
# c1: src/rinex.rs
# c2: parse_nav
# c3: G
# c4: BROADCAST ORBIT
# c5: RinexEphemeris
# c6: D
# c7: parse_d
# c8: D
seg-7fa2f68d436a = <b>Analisador de mensagens de navegação GPS RINEX { "3" } (<c1/>).</b> Primeiro passo rumo à interoperabilidade de formatos GNSS: <c2/> lê um ficheiro de navegação RINEX { "3" }.x e descodifica cada registo de efemérides difundidas GPS (<c3/>) — o bloco de oito linhas SV/época + <c4/> — para um <c5/> de elementos keplerianos e correções de relógio, com nomes de campos e unidades segundo o IS-GPS-200. Trata o formato de vírgula flutuante com expoente <c6/> do Fortran (<c7/>) e a disposição de colunas de largura fixa; os registos de sistemas que não o GPS são ignorados, não rejeitados, pelo que um ficheiro misto continua a produzir as suas efemérides GPS. Quatro testes: análise de expoentes <c8/> (incluindo brancos e erros), um registo completo descodificado face a valores de campo conhecidos com uma verificação de sanidade do semieixo maior GPS (√A² ≈ { "26 560" } km), omissão de sistemas que não o GPS e o caso de ficheiro vazio.

# text
# c1: src/rinex.rs
seg-9c4a068f204c = Efemérides difundidas GPS → posição ECEF (<c1/>).

# text
# c1: RinexEphemeris::sv_position_ecef(t_tow)
# c2: μ
# c3: Ω̇ₑ
# c4: tk
seg-5deeec4b8cc9 = <c1/> avalia a posição do satélite fixa à Terra a partir das efemérides analisadas através do algoritmo do utilizador IS-GPS-200 §{ "20.3.3.4.3.1" }: solução de Newton da equação de Kepler para a anomalia excêntrica, as correções de segundo harmónico do argumento de latitude / raio / inclinação e a rotação para ECEF tendo em conta a rotação da Terra desde a época de referência (com o <c2/> e o <c3/> do GPS impostos pela especificação, e uma dobragem <c4/> da mudança de semana). Três testes: o raio geocêntrico mantém-se na banda GPS (≈ { "26 560" } km), a velocidade fixa à Terra é de ~{ "3.9" } km/s, e avaliar com uma semana completa de distância reproduz a mesma posição.

# text
# c1: src/rinex.rs
seg-583433389a70 = Desvio do relógio do SV GPS com a correção relativista (<c1/>).

# text
# c1: RinexEphemeris::sv_clock_bias_s(t_tow)
# c2: af0 + af1·Δt + af2·Δt²
# c3: Toc
# c4: F·e·√A·sin Ek
# c5: EpochUtc::gps_time_of_week
# c6: TGD
# c7: Propagator
# c8: docs/CAPABILITY.md
seg-957588ed5dff = <c1/> avalia o polinómio de relógio difundido <c2/> em torno de <c3/> mais o termo relativista de excentricidade <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Um novo <c5/> converte a época de calendário do registo em tempo-da-semana GPS por aritmética de dias julianos a partir da época GPS (1980-01-06), e a resolução de Kepler é partilhada com a avaliação da posição. Testes: o tempo-da-semana GPS para um domingo/terça-feira/sábado (fronteiras de semana) e o desvio de relógio ser dominado por af0 com um termo relativista presente e limitado. O atraso de grupo L1 <c6/> é exposto mas deliberadamente não incorporado. Âmbito honesto: uma fonte <c7/>, Galileo/BeiDou/GLONASS e SP3 continuam a ser passos seguintes. (<c8/> atualizado de acordo.)

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: kind = "integrity"
# c4: IntegrityScenario
# c5: (sigma, P_fa, P_md, AL_H, AL_V)
# c6: constellation_raim_availability
# c7: kshana scenarios/integrity-raim.toml
seg-ef971feff16c = <b>Tipo de cenário <c1/> executável pelo utilizador (<c2/>).</b> A capacidade de disponibilidade RAIM é agora acessível a partir da CLI/TOML como todos os outros pacotes: <c3/> analisa um <c4/> (órbita do utilizador, uma ou mais constelações GNSS, máscara de elevação e a configuração de integridade <c5/>), executa <c6/> e emite o mapa de disponibilidade HPL/VPL por época em JSON, mais um SVG autónomo — níveis de proteção ao longo do tempo face aos limites de alerta, com uma faixa de disponibilidade verde/vermelha. <c7/> escreve o JSON, o gráfico e um relatório HTML. O cenário incluído (Walker de 24 satélites, medição de distâncias bifrequência de { "1" } m, limites APV-I) reporta ~{ "95" } % de disponibilidade; documenta que o RAIM monofrequência não satisfaz o limite vertical APV-I com uma só constelação, razão pela qual a orientação vertical usa SBAS/bifrequência/ARAIM. Os testes cobrem o despacho, o JSON do mapa de disponibilidade e o SVG.

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
seg-bbe5721c1785 = <b>Disponibilidade RAIM executável sobre uma constelação (<c1/>).</b> O módulo de integridade não tinha quem o chamasse — <c2/> torna-o um ponto de entrada genuíno de ponta a ponta: em cada época numa grelha temporal propaga os satélites visíveis (os mesmos <c3/> SGP4/keplerianos que o motor usa), calcula os níveis de proteção sem falha e avalia a disponibilidade face aos limites de alerta horizontal/vertical, devolvendo um <c5/> serializável por <c4/> (<c6/>/HPL/VPL/<c7/> por época mais a fração de disponibilidade). Um <c8/> agrupa <c9/> e o <c10/> por época é exposto para quem resolve a sua própria geometria. Três testes: uma época avaliada como disponível sob limites APV-I numa geometria de dez satélites, tornada indisponível por um limite impossivelmente apertado, e níveis <c11/> abaixo de cinco satélites; e uma execução de ponta a ponta sobre uma constelação Walker de 24 satélites que produz um mapa de disponibilidade finito e se serializa. (Seis satélites — o patamar de redundância do RAIM residual — honestamente <em>não</em> satisfazem o APV-I mesmo com medição de distâncias de { "1" } m; a disponibilidade APV-I precisa da geometria mais densa que o teste usa.)

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
seg-91e32e587cb6 = <b>Acumulador do diagrama de integridade de Stanford(-ESA) (<c1/>).</b> A forma padrão de resumir um monitor de integridade ao longo de muitas épocas: representa o erro de posição real (x) face ao nível de proteção (y) e classifica cada época, pela diagonal <c2/> e pelo limite de alerta, em <c3/> (o PL limita o erro, dentro do AL), <c4/> (o PL limita o erro mas excede o AL — seguro, inutilizável), <c5/> (PL < erro ≤ AL) ou <c6/> (PL < erro e erro > AL — a falha insegura). <c7/> é o classificador puro; <c8/> acumula pontos <c9/> face a um limite de alerta fixo, expondo contagens por região, disponibilidade, totais de eventos de integridade e pontos serializáveis por <c10/> para gráficos/exportação JSON. Quatro testes: todas as regiões (incluindo a fronteira limitada <c11/>), acumulação de contagens/disponibilidade e ida e volta em JSON. Esta é a superfície de reporte dos níveis de proteção RAIM; ligá-la ao cenário de constelação e validá-la face a um conjunto de dados público continuam a ser itens do roteiro.

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
seg-cdeb3a5a4acf = <b>RAIM de separação de soluções (ao estilo ARAIM) (<c1/>).</b> Um monitor de integridade de múltiplas hipóteses a par do <c2/> qui-quadrado de resíduos/paridade existente. Para a solução de mínimos quadrados com todos à vista e para cada subsolução de exclusão de um só satélite, forma a separação <c3/> — gaussiana de média nula sem falha, com covariância <c4/> (a identidade dos estimadores aninhados, válida porque a solução com todos à vista é BLUE) — e assim <b>deteta</b> uma falha e <b>identifica</b> o satélite com falha (aquele cuja exclusão dá a maior separação normalizada). Os níveis de proteção horizontal/vertical seguem a alocação MHSS padrão <c5/>, com <c6/>, <c7/>. Novos <c8/>/<c9/> sem dependências, construídos sobre a função gama incompleta regularizada já existente no módulo (<c10/>). Quatro testes deduzidos à mão: a CDF normal / quantil face a valores de manual (Φ({ "1.95996" })={ "0.975" }, a cauda de { "1e-7" } = { "5.1993" }, simetria); uma geometria sem falha que não dá alarme e produz HPL/VPL finitos e positivos; um desvio de 60 σ num só satélite que é detetado <em>e</em> corretamente identificado (<c11/>); e o patamar de redundância de seis satélites. Fecha a lacuna P0 da auditoria «integridade tautológica — sem RAIM/HPL/VPL reais» do lado do algoritmo; a validação com conjuntos de dados do gLAB e o acumulador do diagrama de Stanford continuam a ser itens do roteiro.

# text
# c1: src/fusion/closed_loop.rs
seg-67e771fc0a48 = Integração GNSS/INS em malha fechada (<c1/>).

# text
# c1: ClosedLoopInsGnss
# c2: mechanization::radii_of_curvature
# c3: NavState::omega_ie_n
# c4: omega_en_n
seg-5aa467783b99 = <c1/> liga o núcleo EKF de estados de erro à mecanização strapdown de três eixos: cada amostra de IMU é corrigida pelas estimativas de desvio em curso, mecanizada para a frente, e a covariância do EKF é propagada no tempo com o contexto de navegação correspondente; cada solução de posição/velocidade GNSS forma a inovação INS−GNSS e realimenta a solução com o <b>erro de posição, velocidade, atitude (ψ, como rotação em quaterniões) e os desvios do acelerómetro/giroscópio</b> estimados, repondo a média do estado de erro. Realimentar a atitude (e não apenas os desvios) é necessário para a estabilidade — a inclinação e o desvio do acelerómetro formam um par acoplado, pelo que corrigir um sem o outro diverge. O INS e o GNSS são comparados num referencial local de plano tangente NED usando os próprios raios de curvatura da mecanização (novo <c2/>; <c3/>/<c4/> expostos). Esta é a substituição honesta do <em>reinício por ajuste à referência</em> do pacote híbrido. Três testes: uma malha fechada a anular um erro de posição injetado de { "8" } m / −{ "5" } m até <{ "0.1" } m; uma solução assistida que se mantém limitada a metros (<{ "6" } m) numa trajetória de condução enquanto um INS em marcha livre diverge para além de { "100" } m; e o teste de referência do marco — o <b>RMS de posição de Monte-Carlo da solução fundida durante uma interrupção GNSS de { "60" } s supera um estimador de navegação estimada em malha aberta sem assistência por >{ "2" }× (≈{ "4" }× entre sementes)</b>. Limitação honesta documentada no módulo: em modo fracamente acoplado, o desvio do acelerómetro e a inclinação só são fracamente separáveis (ambos se acoplam através da gravidade), pelo que o valor entregue é o estado limitado e corrigido e uma entrada limpa na interrupção — não uma calibração inercial precisa; dinâmicas mais ricas e a extensão fortemente acoplada continuam a ser itens do roteiro.

# text
# c1: src/fusion/gnss_ins_ekf.rs
# c2: δx = [δp, δv, ψ, b_a, b_g]
# c3: Φ = I + F·dt
# c4: H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]
# c5: tight_coupling
# c6: P/(P+R)
seg-aa9bf0ff6f84 = <b>Núcleo EKF de estados de erro GNSS/INS fracamente acoplado (<c1/>).</b> Um filtro de Kalman estendido de estados de erro de 15 estados — <c2/> — com a dinâmica de erros strapdown de Groves { "2013" } §{ "14.2" } (acoplamento força específica/inclinação, Coriolis, projeção do desvio do corpo para a navegação, modelos de desvio de Gauss–Markov), uma transição discreta de primeira ordem <c3/> e uma atualização de medição fracamente acoplada de posição+velocidade (<c4/>) na forma de Joseph. Álgebra linear densa sem dependências (inversa de Gauss–Jordan, atualização da covariância de Joseph). Uma funcionalidade cargo <c5/> condiciona uma atualização de pseudodistância/Doppler documentada e ainda não implementada. { "7" } testes com resultados esperados deduzidos à mão: a identidade de assimetria/produto vetorial, uma inversa { "3" }×{ "3" } verificada, a covariância a manter-se simétrica/PSD na predição (e a incerteza de posição a crescer sem assistência), uma solução de posição a reduzir a covariância da posição, a recuperação exata de um erro de posição conhecido com o ganho de Kalman analítico <c6/> e correções menores com maior ruído de medição. Este é o núcleo que substituirá o reinício por ajuste à referência em malha aberta do pacote híbrido por realimentação em malha fechada (ligação ao pacote + validação NaveGo a seguir).

# text
# c1: src/inertial/imu_errors.rs
seg-5be84079b8b6 = Modelo determinístico de erros de IMU para o navegador strapdown de 3 eixos (<c1/>).

# text
# c1: ImuErrorModel
# c2: (ω, f)
# c3: ImuErrorModel::ideal()
# c4: inertial
seg-492e670736b2 = <c1/> distorce um par <c2/> verdadeiro no referencial do corpo num par medido através de cinco categorias sistemáticas (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabela { "4.1" }): <b>fator de escala</b> (erro de ganho em ppm por eixo), <b>desalinhamento / acoplamento cruzado</b> (não ortogonalidade fora da diagonal da tríade), <b>sensibilidade a g</b> (um desvio da taxa do giroscópio proporcional à força específica), <b>quantização</b> (arredondamento ao LSB de saída) e <b>rampa de taxa</b> (uma deriva linear no tempo — a terceira região de Allan), mais um desvio constante de arranque. Todos os termos têm zero como predefinição, pelo que <c3/> é uma passagem transparente e os cenários existentes não são afetados. Cada fonte de erro tem um teste de isolamento (escala linear a <{ "0.01" } %, eixo cruzado do desalinhamento acima do patamar VRW, desvio de sensibilidade a g, grelha LSB, rampa linear), e um teste de ponta a ponta conduz um erro de navegação através da mecanização a partir de uma IMU distorcida. Não modelados: erro de retificação por vibração, deriva por gradiente de temperatura. (O pacote de cenários <c4/> distribuído continua a executar o antigo orçamento escalar de 1 grau de liberdade; este modelo alimenta a biblioteca de 3 eixos.)

# text
# c1: coning_increment
# c2: ½ Δθ_prev × Δθ_cur
# c3: sculling_increment
# c4: ½ Δθ × Δv
# c5: NavState::step_increments
# c6: Δθ_rel = Δθ_b − C_n^b ζ
seg-f57bc89d4688 = <b>Compensação de coning e sculling para o integrador strapdown.</b> O caminho de atitude acrescenta o <c1/> de duas amostras (<c2/>); verifica-se que uma integração a taxa grosseira ({ "30" } Hz, 5 amostras/ciclo) de um ambiente de coning de { "5" } Hz acompanha a referência de taxa fina ≥ { "3" }× melhor com a correção do que com a soma ingénua de incrementos. O caminho de velocidade acrescenta <c3/> (<c4/>, eq. { "5.82" } de Groves) e resolve o incremento de velocidade do corpo através de uma nova atualização <c5/> baseada em incrementos, usando a rotação relativa ao corpo <c6/>, de modo que uma plataforma fixa à Terra não incorre em sculling espúrio enquanto uma vibração genuína aciona o termo completo.

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
seg-d0897492e89b = <c1/> é avançado por <c2/> usando as equações NED padrão em referencial terrestre (Groves §{ "5.4" }): atitude corpo→NED corrigida pela taxa inercial-para-navegação <c3/> (rotação da Terra + taxa de transporte); força específica resolvida corpo→NED através da DCM; velocidade a integrar <c4/> (Coriolis/transporte + gravidade); e posição geodésica através dos raios de curvatura meridiano/transversal. A gravidade é a <b>gravidade normal (fio de prumo)</b> WGS-84 de forma fechada de Somigliana com uma correção de altitude em ar livre NIMA — nunca uma constante codificada. Este é o navegador genuíno de três eixos que substitui o caminho escalar de orçamento de erros de 1 grau de liberdade. Verificado por invariantes físicos: uma plataforma presa à Terra em rotação a { "45" }°N (a sentir a taxa de rotação da Terra + { "1" } g) mantém-se a menos de { "1" } mm durante { "60" } s; uma força específica horizontal para norte dá <c5/> e um deslocamento <c6/>; a gravidade normal coincide com os valores de superfície conhecidos no equador/polo/45° e com a taxa de variação em ar livre.

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
seg-290b08199bfb = <b>Representação de atitude de três eixos para INS strapdown (<c1/>).</b> Um tipo de quaternião unitário <c2/> (escalar primeiro, convenção de Hamilton) que transporta a rotação corpo→navegação, com uma vista DCM (<c3/>/<c4/> pelo método de Shepperd), produto de Hamilton, construtores de eixo-ângulo e de vetor de rotação (mapa exponencial exato) e cinemática de quaterniões — tanto uma atualização RK de taxa de primeira ordem (<c5/>) como uma atualização do vetor de rotação com correção de coning. O <c6/> de duas amostras (Savage / Bryan–Lewantowski, <c7/>) fornece o termo de acoplamento cruzado da taxa de rotação que a navegação estimada escalar omite. Esta é a base de atitude para a mecanização completa de 3 eixos que substitui o antigo caminho de orçamento de erros de 1 grau de liberdade. Verificado face a rotações de forma fechada: a propagação a taxa constante coincide com o quaternião eixo-ângulo até { "1e-6" }, as DCM são ortonormais com determinante unitário e o coning anula-se para movimento de eixo único. (<c8/> é agora o diretório de módulo <c9/>; o caminho público <c10/> não se altera.)

# text
# c1: src/frames.rs
seg-5e6e5bba25a5 = Visibilidade de estações terrestres geodesicamente correta (<c1/>).

# text
# c1: elevation
# c2: is_visible
# c3: visible_count
seg-69bdb1e5bfc8 = <c1/>, <c2/> e <c3/> calculam a elevação de um satélite acima do horizonte de uma estação terrestre face à <b>normal ao elipsoide WGS-84</b> (a vertical local verdadeira), e não ao radial geocêntrico — os dois diferem até cerca de ~{ "0.19" }° de deflexão geodésica, o suficiente para fazer entrar ou sair satélites próximos do horizonte de uma máscara de elevação. Verificado de ponta a ponta (uma constelação Walker propagada, rodada TEME→ECEF e contada a partir de um local geodésico) e face à aproximação geocêntrica.

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
seg-4de1d79d2e76 = <b>Fiabilidade da CI.</b> A tarefa <c1/> constrói agora a wheel com <c2/> (contentor manylinux) em vez de um <c3/> direto no anfitrião, eliminando um conflito intermitente de rustup <c4/>/<c5/> na imagem do runner. A tarefa <c6/> instala <c7/> como binário pré-construído através de <c8/> em vez do <c9/> baseado em Docker, eliminando um tempo limite de obtenção do registo Docker Hub. Nenhuma das alterações afeta as verificações realizadas.

# text
seg-05055c993904 = A velocidade inercial é exposta a jusante.

# text
# c1: Propagator::velocity_eci
# c2: Propagator::state_eci
# c3: StateEci { r_m, v_m_s }
# c4: Orbit::velocity_eci
seg-1228235c99b6 = <c1/> e <c2/> (a devolver <c3/>) encaminham a velocidade TEME analítica que o SGP4 já calcula — antes descartada — até aos chamadores em m/s; <c4/> dá ao caminho kepleriano uma velocidade coerente. O teste de verificação AIAA 2006-6753 verifica agora também a velocidade em todas as linhas de referência (pior erro de velocidade { "1.85e-9" } km/s em todos os { "666" } estados) e fixa o número de linhas comparadas em exatamente { "666" }.

# text
# c1: ParseOpts { strict_checksum }
# c2: parse_propagators_opts
# c3: strict_checksum
# c4: ConstellationCfg
seg-8ac2598291b8 = <b>Análise de TLE mais estrita e sem pânicos.</b> Exige-se que as linhas sejam ASCII e são fatiadas em segurança (já não há pânicos de índice de bytes com entrada multibyte); os elementos têm os intervalos verificados (inclinação, excentricidade, movimento médio); a soma de verificação da coluna 69 pode ser imposta através de <c1/> / <c2/> e do novo indicador <c3/> em <c4/> (tolerante por predefinição).

# text
# c1: adev_curve
# c2: [{tau_s, adev, n_samples}]
seg-1cd2c6621a04 = <b>Curva do desvio de Allan na saída.</b> Cada execução de relógio reporta agora um <c1/> (<c2/>) e o playground no navegador desenha um gráfico log-log «Estabilidade do relógio (ADEV)».

# text
seg-c76ff20811e7 = Validação da entrada da grelha temporal.

# text
# c1: TimeCfg::validate
# c2: MAX_TIME_STEPS
seg-75436d067802 = <c1/> rejeita uma grelha temporal não finita, nula, negativa ou de tamanho excessivo (um passo maior do que a duração, ou mais de <c2/> amostras) antes de qualquer alocação, pelo que um cenário malformado devolve um erro em vez de entrar em pânico ou esgotar a memória.

# text
seg-d0a8ce50cf6e = Ensembles de Monte Carlo para o pacote inercial.

# text
# c1: runs = N
# c2: ensemble
# c3: monte_carlo
seg-3225674ce4ea = <c1/> num cenário inercial executa N sementes e reporta a média de cada métrica, o desvio-padrão, os percentis e um intervalo de confiança de { "95" } % por bootstrap de percentis (<c2/>). Cada execução inercial transporta agora um indicador <c3/>, de modo que uma FoM de realização única deixa de ser confundida com uma distribuição. (CEP/2DRMS não são intencionalmente reportados — exigem o modelo de 3 eixos que está no roteiro.)

# text
# c1: web/share.test.mjs
seg-2967872bfca1 = <b>Modo guiado do playground.</b> O playground no navegador já não o deixa diante de um muro de TOML em bruto: uma faixa «Comece aqui» com cartões de cenário de um clique carrega e executa um exemplo trabalhado, controlos deslizantes expõem os parâmetros universais (semente, limiar de temporização) sem tocar no TOML, uma nota «Como ler isto» explica o resultado e o TOML completo está a um recolhimento de distância. Cada execução é partilhável — <b>Copiar ligação de partilha</b> codifica todo o cenário no fragmento do URL (nada é carregado) para que uma ligação reproduza a execução exata ao abrir. O codec tem testes unitários (<c1/>, executados na CI).

# text
# c1: src/sweep.rs
seg-2e47e8864718 = Varrimentos N-dimensionais de parâmetros (<c1/>).

# text
# c1: nd_sweep
# c2: SweepAxis
seg-5076a9ad20d7 = <c1/> avalia uma métrica sobre todo o produto cartesiano de vários intervalos <c2/> (o estudo de compromisso multiparamétrico), por ordem de linhas, de forma determinística. Aditivo — a API de varrimento 1-D existente não se altera. Os intervalos de confiança por bootstrap por nó e a generalização para além do pacote de relógios continuam no roteiro.

# text
# c1: src/raim.rs
seg-958718831037 = <b>RAIM instantâneo real (<c1/>).</b> Monitorização Autónoma de Integridade do Recetor genuína no domínio da posição: constrói a geometria de linha de visada para os satélites visíveis, forma a solução de mínimos quadrados e os resíduos, executa um teste de deteção de falhas por resíduos χ² (limiar exato a partir de um χ²/χ² não central de gama incompleta sem dependências) e calcula níveis de proteção horizontal e vertical por declive (HPL/VPL) com o desvio de deteção falhada derivado para os P_fa/P_md configurados. Isto é distinto da figura de Integridade de autoconsistência do filtro do pipeline de cenários — e <b>ainda não está ligado</b> a ela; a exclusão de falhas, o orçamento de limite de alerta/P_HMI e o ARAIM continuam no roteiro.

# text
# c1: src/allan.rs
# c2: TDEV = tau/sqrt(3) * MDEV
# c3: deviation_ci
seg-1675540acbd9 = <b>Conjunto de estabilidade de frequência: MDEV, TDEV, HDEV + intervalos de confiança</b> (<c1/>). A par do ADEV sobreposto: o desvio de Allan modificado (separa o ruído de fase branco do flicker), o desvio de tempo (<c2/>) e o desvio de Hadamard (rejeita exatamente a deriva linear de frequência e converge para tipos de ruído vermelho divergentes). Os intervalos de confiança baseados em χ² (<c3/>) usam um par de quantis normal/χ² sem dependências (Acklam + Wilson-Hilferty) com um edf conservador sem sobreposição; o edf específico do tipo de ruído e a paridade numérica com o Stable32 continuam no roteiro.

# text
# c1: src/frames.rs
seg-446a9ed4467c = <b>Redução de referenciais (<c1/>).</b> Rotação TEME↔ECEF baseada em GMST (usando o mesmo tempo sideral IAU-1982 que o propagador), geodésica WGS-84↔ECEF exata com um inverso iterativo iniciado por Bowring (precisão de máquina a todas as altitudes, incluindo MEO/GEO) e um observador geodésico de estação terrestre que devolve azimute / elevação / distância no referencial local Este-Norte-Cima. O movimento polar e a nutação de sub-segundo de arco não são aplicados (apenas GMST, sub-quilométrico no rasto no solo); uma cadeia CIO de precisão ITRF está no roteiro.

# text
# c1: src/timescales.rs
# c2: f64
seg-9f6f53583cf5 = <b>Base das escalas de tempo (<c1/>).</b> Uma API de data juliana sem dependências (civil gregoriano ↔ JD, MJD), o historial completo IERS de segundos intercalares inteiros (UTC↔TAI, { "10" } s em { "1972" } até { "37" } s desde { "2017" }), o desvio definido TAI→TT, a correção UT1 através de um DUT1 fornecido e o Ângulo de Rotação da Terra IAU-2000. Este é o substrato de tempo sobre o qual assenta a redução de referenciais fixos à Terra (planeada). Os instantes são Datas Julianas de um único <c2/> (resolução de ~{ "50" } µs perto da época atual; uma JD de duas partes está no roteiro), e a era do segundo elástico anterior a 1972 não é modelada — ambos documentados no módulo.

# text
# c1: scripts/gen-sbom.sh
# c2: libm
# c3: docs/REPRODUCIBILITY.md
seg-6ecc053f101f = <b>Reprodutibilidade e proveniência.</b> Um gerador determinístico de SBOM CycloneDX (<c1/>) e uma atestação de proveniência de compilação SLSA no binário de lançamento e no SBOM; a cadeia de ferramentas de lançamento está fixada para coincidir com a CI. As garantias de determinismo, a ressalva multiplataforma de <c2/> e a abordagem de fixação de valores de referência estão documentadas em <c3/>.

# text
# c1: tests/property.rs
# c2: TimeCfg::validate
seg-3e98dcdcb82b = <b>Testes baseados em propriedades e de fuzzing</b> (<c1/>). Testes aleatorizados determinísticos (sem nova dependência) afirmam invariantes sobre milhares de entradas: os analisadores de TLE e de cenários nunca entram em pânico com lixo, não ASCII, entrada mutada ou truncada; <c2/> nunca entra em pânico com grelhas NaN/inf/negativas; a soma de verificação do TLE é consistente e apenas da coluna 69; as idas e voltas geodésica↔ECEF e a rotação TEME→ECEF preservam a norma em todo o globo e numa ampla banda de altitudes.

# text
# c1: libm
seg-ea252b5d7427 = Os testes de referência fixam agora as <b>figuras de mérito campo a campo</b> para os quatro cenários de referência (com uma tolerância que absorve a variação multiplataforma de <c1/>), substituindo as verificações anteriores apenas de desigualdade, de modo que uma regressão numérica silenciosa seja detetada de imediato.

# text
# c1: schema_version
# c2: 0.1
# c3: 0.7
seg-4b2a0b78984b = <c1/> nos artefactos de resultados passou de <c2/> para <c3/> (estava congelado enquanto o motor evoluía).

# text
# c1: cargo-deny
seg-ecafa9d44810 = <c1/> passa agora a <b>negar</b> (e não apenas a avisar sobre) dependências retiradas (yanked).

# text
# c1: CAPABILITY.md
# c2: SCHEMA.md
# c3: INTEGRITY.md
# c4: QUANTUM-MODELS.md
# c5: REAL_TLE_GUIDE.md
# c6: Cargo.toml
seg-c48af44de5b4 = Nova documentação: <c1/> (mapa honesto do âmbito), <c2/> (referência dos campos de resultados), <c3/>, <c4/>, <c5/>. Uma proteção da CI falha se o emblema de versão do README divergir de <c6/>.

# text
seg-8ef32ebec7f5 = <b>Propagação de órbitas SGP4/SDP4.</b> Uma implementação completa e sem dependências do propagador padrão de perturbações simplificadas — SGP4 para órbitas próximas da Terra juntamente com a extensão SDP4 para o espaço profundo (perturbações luni-solares seculares e periódicas e ressonância geopotencial de { "12" } h / { "24" } h). É validada face aos vetores de verificação oficiais AIAA 2006-6753 («Revisiting Spacetrack Report #3»): todos os { "666" } estados de referência nos casos de órbita próxima da Terra, espaço profundo, ressonante e de códigos de erro coincidem com um erro de posição no pior caso de cerca de { "4" } mm. Este é o modelo face ao qual os conjuntos de elementos de duas linhas são definidos, pelo que representa constelações reais — nomeadamente as órbitas GNSS de ~{ "12" } h, que são de espaço profundo e ressonantes e que o anterior modelo de dois corpos + J2 secular não consegue captar.

# text
# c1: orbit-sgp4-gps.toml
seg-06a77fb9233e = Uma constelação dada como <b>conjuntos completos de elementos de duas linhas</b> (linha { "1" } + linha { "2" }) é agora propagada com SGP4/SDP4; uma constelação dada com elementos apenas da linha 2 mantém a propagação kepleriana analítica de dois corpos, sem alterações. As duas formas podem ser misturadas num só bloco. Novo cenário de referência <c1/> (uma constelação MEO semelhante ao GPS em formato real de duas linhas, propagada com SGP4) — pode-se acrescentar um conjunto «gps-ops» atual do Celestrak para estudar a constelação em funcionamento.

# text
# c1: spoof
# c2: spoof-attack.toml
seg-2dbb4054e9b8 = <b>Demonstrador de ataque ativo de spoofing.</b> Um novo tipo de cenário <c1/> injeta um spoof de falso tempo em rampa e executa o monitor de integridade assistido por relógio de cada relógio, reportando se e quando o spoof é detetado e se atinge a especificação operacional sem ser detetado — transformando a figura de mérito de Segurança numa demonstração concreta de ataque/defesa. Novo cenário de referência <c2/>.

# text
# c1: [[constellations]]
# c2: [constellation]
# c3: orbit-multignss.toml
seg-aa0cb8038baa = <b>Disponibilidade multiconstelação.</b> Um cenário de órbita pode combinar várias constelações (uma lista <c1/> a par da <c2/> primária) para disponibilidade multi-GNSS e diluição de precisão — por exemplo GPS mais Galileo. Novo cenário de referência <c3/>.

# text
seg-9b9dcd5be0a7 = <b>Relatório de painel de resultados em HTML.</b> Cada execução produz agora também um painel de resultados HTML autónomo e com a marca — o resumo de uma linha, o gráfico (incorporado como imagem data-URI inerte) e o JSON completo — escrito pela CLI a par do JSON e do SVG. Um artefacto partilhável de ficheiro único para um produto de estudo ou anexo.

# text
# c1: fusion
# c2: [phase, frequency]
# c3: [position, velocity]
# c4: fusion-pnt.toml
seg-76c573048a91 = <b>Estimador conjunto de fusão de sensores.</b> Um novo tipo de cenário <c1/> executa um único filtro de Kalman recursivo como solução de navegação — a fundir o estado do relógio <c2/> e o estado de posição <c3/>, disciplinado pelo GNSS (a aprender o desvio de frequência e a velocidade) e assistido por transferência de tempo ótica durante a interrupção — em vez de compor preditores independentes. Reporta o holdover fundido de temporização/posição e uma integridade de covariância conjunta. Novo cenário de referência <c4/>.

# text
# c1: bias_instability
# c2: q_aa
seg-10f0501c91ef = <b>Modelo de ruído de IMU mais completo.</b> O acelerómetro modela agora os restantes termos da variância de Allan para além do desvio constante e do passeio aleatório de velocidade: <b>instabilidade do desvio</b> (um patamar de flicker 1/f ao coeficiente padrão de instabilidade do desvio de Allan, reutilizando a síntese de flicker do relógio) e <b>passeio aleatório de aceleração</b>. Novos campos opcionais de cenário inercial <c1/> e <c2/>; uma nova solução GNSS recalibra a deriva residual do desvio.

# text
# c1: tle
# c2: orbit-real-tle.toml
seg-251ffc7b7722 = <b>Geometria real de constelações a partir de TLE.</b> Uma constelação pode ser dada como um bloco de conjuntos de elementos de duas linhas (o formato padrão NORAD/Celestrak) através de um campo <c1/>, de modo que a disponibilidade e a diluição de precisão usem a geometria publicada de uma constelação real em vez de um padrão Walker sintético. O motor lê os elementos keplerianos médios de cada TLE e propaga-os com dois corpos — não SGP4 — o que é adequado para um estudo instantâneo a partir de uma época comum. Novo cenário de referência <c2/>.

# text
# c1: sweep
# c2: threshold_ns
# c3: duration_s
# c4: quantum_q_wf
# c5: classical_q_wf
# c6: sweep-clock-stability.toml
seg-7deb93b51cc7 = <b>Varrimentos de parâmetros para estudos de compromisso.</b> Um novo tipo de cenário <c1/> faz variar um parâmetro (<c2/>, <c3/>, <c4/> ou <c5/>) ao longo de um intervalo linear ou logarítmico e regista uma figura de mérito escolhida em cada ponto para ambos os relógios, produzindo o gráfico de comparação «como escala o holdover com a estabilidade do relógio?» de que um compromisso de projeto necessita. Novo cenário de referência <c6/>.

# text
# c1: runs
# c2: clock-ensemble.toml
seg-ef6f3e77b476 = <b>Bandas de confiança de Monte Carlo.</b> O cenário de holdover de relógio pode executar muitas realizações (novo campo opcional <c1/>): cada figura de mérito é então reportada como uma média com uma dispersão entre o 5.º e o 95.º percentil, e o gráfico sombreia o envelope de erro de { "5" }–{ "95" } % em torno da mediana para cada relógio. Uma única execução continua a ser a predefinição. Novo cenário de referência <c2/>.

# text
# c1: eccentricity
# c2: argp_deg
# c3: j2
# c4: orbit-molniya.toml
seg-e70cc0973fa3 = <b>Órbitas excêntricas e deriva J2.</b> O tipo de órbita é agora uma órbita kepleriana completa (semieixo maior, excentricidade, inclinação, RAAN, argumento do perigeu, anomalia média), propagada pela resolução da equação de Kepler, com regressão nodal e precessão apsidal seculares J2 opcionais. Novos campos opcionais de cenário <c1/>, <c2/> e <c3/>, e um cenário de referência <c4/> (um utilizador de { "12" } h, muito excêntrico e de inclinação crítica). As órbitas circulares mantêm o caminho original de forma fechada bit a bit.

# text
seg-cc041e16d418 = O pacote híbrido (PNT combinado) reporta agora <b>Integridade</b> e <b>Segurança</b>, pelo que os quatro pacotes cobrem o conjunto completo de figuras de mérito operacionais. A Integridade é a contenção do limite de proteção do canal de temporização a partir de um estimador de Kalman disciplinado pela referência enquanto o GNSS é nominal e reancorado (de forma mais folgada) em cada ressincronização ótica; o seu limite inclui o patamar de ruído de medição da ligação, de modo que um relógio muito melhor do que a ligação é pontuado face ao ruído real da solução entregue. A Segurança é a pontuação de deteção de spoofing assistida por relógio face à especificação de temporização.

# text
# c1: scripts/changelog-extract.sh
seg-e0b666457d6e = As notas de versão são agora geradas a partir da secção selecionada do CHANGELOG para a etiqueta (<c1/>), de modo que cada versão no GitHub destaque o que mudou em vez de listar commits em bruto.

# text
# c1: [0, 1]
seg-f785718e9454 = Figura de mérito de <b>Segurança</b> (antes não preenchida): uma pontuação de deteção de spoofing assistida por relógio para os pacotes de holdover de relógio e de órbita. Modela um monitor de integridade que compara o tempo derivado do GNSS com a própria predição em marcha livre do relógio ao longo de uma janela coerente; o limiar de deteção combina o ruído de medição médio com a incerteza da marcha livre do relógio, de modo que um relógio mais silencioso deteta spoofs de tempo menores e mais lentos. A pontuação é reportada em <c1/> relativamente à especificação de temporização, completando as seis figuras de mérito operacionais.

# text
# c1: Q = (HᵀH)⁻¹
# c2: sigma_uere_m
seg-9164140872c8 = <b>Exatidão de posição</b> derivada da geometria para o pacote de órbita: a partir da geometria de linha de visada para os satélites visíveis forma a matriz de projeto e o seu fator de covariância <c1/>, produzindo os fatores de diluição de precisão (GDOP/PDOP/HDOP/VDOP/TDOP). A exatidão de posição é o DOP de posição multiplicado por um erro equivalente de distância do utilizador configurável (novo campo opcional de cenário <c2/>). Um resultado de órbita transporta agora um resumo da geometria (fração de amostras com solução de posição, melhor e mediana de PDOP e sigma de posição).

# text
# c1: web/
# c2: pages
# c3: summary
seg-3285502161c6 = Um <b>playground</b> no navegador (<c1/>) que executa o motor do lado do cliente como WebAssembly: escolha um cenário de referência ou edite o TOML, execute-o e veja o resumo, o gráfico e o JSON completo, sem que nada seja carregado. Um fluxo de trabalho <c2/> compila-o e publica-o no GitHub Pages, e uma nova exportação WebAssembly <c3/> suporta a leitura.

# text
# c1: chart
seg-0dca5318f7ce = Eixos y etiquetados nos gráficos SVG: linhas de grelha, etiquetas numéricas de graduação e um título de eixo com unidades (através de um auxiliar <c1/> partilhado), de modo que as magnitudes sejam legíveis.

# text
# c1: publish
seg-ce84a3d61f19 = Fluxo de trabalho de publicação de pacotes (<c1/>) para crates.io, PyPI e npm, cada um condicionado ao seu token de registo e acionado por uma versão publicada.

# text
# c1: flicker_floor
seg-0f01369fc29b = Patamar de FM flicker (1/f) para o modelo de erros do relógio, sintetizado como soma de processos de Ornstein-Uhlenbeck espaçados logaritmicamente e calibrado de modo que o patamar plano do desvio de Allan fique num nível configurável. Desativado por predefinição; ativado por relógio através do campo opcional de cenário <c1/>.

# text
# c1: gyro_bias
# c2: q_arw
seg-5b7fcd386fd3 = Canal de giroscópio para o modelo inercial: o desvio residual do giroscópio e o passeio aleatório angular geram um erro de atitude (inclinação) que acopla a gravidade num erro horizontal de força específica, o principal mecanismo de crescimento de erro strapdown. Desativado por predefinição; ativado por sensor através dos campos opcionais <c1/> e <c2/>.

# text
# c1: q_wf*T + q_rw*T^3/3
seg-efe9f10d2641 = Estimador de relógio de Kalman de dois estados (fase, frequência) com discretização exata do ruído de processo de van Loan. A marcha livre a partir de um estado conhecido reproduz exatamente o crescimento analítico do erro de holdover (<c1/>), e o filtro produz adicionalmente um limite de incerteza de 1 sigma em linha.

# text
seg-539e24f34ed1 = A execução do relógio reporta agora a figura de mérito de <b>Integridade</b> (antes não preenchida): a fração das amostras de interrupção cujo erro se mantém dentro do limite de proteção de 3 sigma do filtro, exposta no resultado JSON e no resumo da CLI.

# text
# c1: orbit
# c2: orbit-gnss-challenged.toml
seg-80620c97e3f5 = Disponibilidade GNSS derivada da geometria: a propagação de órbitas circulares, um gerador de constelações Walker-delta e a visibilidade de linha de visada (ocultação pela Terra mais máscara de elevação) produzem a cronologia de disponibilidade a partir da geometria orbital real. Novo tipo de cenário <c1/> e cenário de referência <c2/> (uma nave espacial no interior da camada GNSS com cobertura intermitente).

# text
# c1: run
# c2: run_full
# c3: version
# c4: pyproject.toml
# c5: wheels
seg-67549163ad7d = Extensão Python opcional (PyO3, abi3) que expõe <c1/>, <c2/> e <c3/>, empacotada com maturin (<c4/>) e compilada para Linux, macOS e Windows por um fluxo de trabalho <c5/> de etiqueta de versão. A ligação é uma dependência opcional condicionada por funcionalidade: a compilação predefinida, os testes e a verificação de auditoria de dependências não são afetados.

# text
# c1: run
# c2: chart_svg
# c3: version
# c4: wasm
# c5: getrandom
# c6: wasm32
seg-c76dc363f0b1 = Módulo WebAssembly opcional (wasm-bindgen) que expõe <c1/>, <c2/> e <c3/>, compilado com wasm-pack sob a funcionalidade <c4/>; <c5/> está condicionado ao alvo para usar a fonte de entropia do navegador em <c6/>.

# text
# c1: api::run_toml
seg-cf1b0eef2201 = Despacho <c1/> partilhado usado pela CLI e por ambas as ligações, de modo que a linha de comandos e as ligações não possam divergir.

# text
seg-8d4f855d11bd = A pontuação de holdover é agora sensível a segmentos: as cronologias de interrupção são divididas em segmentos contíguos na reaquisição do GNSS, e o holdover reportado é a marcha livre no pior caso (a mais curta) entre eles. Os cenários de interrupção única não se alteram. Aplica-se aos pontuadores de relógio, inercial e híbrido.

# text
# c1: kind
# c2: inertial
# c3: accelerometer
seg-8b3556d125ed = O <c1/> reportado pelo modelo inercial é agora <c2/> (era <c3/>), refletindo os canais combinados de acelerómetro e giroscópio.

# text
seg-d842f9cc0a9c = Versão inicial.

# text
# c1: scenario + seed + engine version
# c2: kind
seg-962b75c38735 = <b>Motor de simulação determinístico</b> para PNT híbrido quântico/clássico: uma interface comum de modelos de erro, cenários declarativos de disponibilidade GNSS, estimadores de holdover / navegação estimada e pontuação de figuras de mérito face aos critérios operacionais PNT padrão. Os resultados são reprodutíveis a partir de <c1/> (JSON versionado e autodescritivo com um hash do cenário) e desenhados como gráficos SVG. A CLI despacha os cenários por <c2/>.

# text
seg-16e574edc3a8 = <b>Quatro pacotes de sensores</b>, cada um calibrado com dados publicados e validado face à relação padrão:

# text
seg-b49bbb60c2cd = <b>Holdover de relógio</b> — FM branco, FM de passeio aleatório e envelhecimento linear; validado pelo desvio de Allan sobreposto (Riley, NIST SP { "1065" }). Relógio atómico à escala de chip vs relógio ótico de rede de estrôncio.

# text
seg-be2c5f28b256 = <b>Navegação estimada inercial</b> — desvio residual + passeio aleatório de velocidade, integrados duas vezes até ao erro de posição; validada face às relações de crescimento de erro de Groves. Acelerómetro de átomos frios vs acelerómetro de classe de navegação.

# text
seg-fcb0f72db736 = <b>Transferência de tempo</b> — jitter de temporização de uma ligação ótica vs RF → precisão de sincronização → medição unidirecional de distâncias.

# text
seg-93e5f2f70b58 = <b>Fusão híbrida (peça final)</b> — um conjunto PNT combinado que tem de manter tanto a temporização como a posição, com assistência opcional dos relógios por transferência ótica de tempo entre satélites.

# text
# c1: scenarios/
# c2: provenance
seg-e0a8cbe0c105 = <b>Um cenário de referência citado por pacote</b> em <c1/>, com cada parâmetro numérico a transportar uma <c2/> revista por pares.

# text
seg-8f1cc09b2513 = <b>Proteções de reprodutibilidade e de higiene do repositório</b>; CI (formato, clippy, testes, proteções, MSRV) e um pipeline de lançamento condicionado por etiqueta que volta a executar todas as verificações.

# text
seg-8b4e21f56334 = <b>Documentação</b>: README com diagramas de arquitetura, relatório do estado de validação, guia de contribuição, política de segurança e código de conduta; licença Apache-2.0; modelos de issues/PR e configuração do Dependabot.

# text
seg-e26d94f06ead = Neutro quanto a fornecedores em todo o lado; citações científicas e de metrologia revistas por pares mantidas.

# text
# c1: NOTICE
# c2: cargo-deny
seg-84cb67686edf = Higiene da licença Apache-2.0: cabeçalhos SPDX em todo o código-fonte, um <c1/> com aviso de marca registada, sign-off do Developer Certificate of Origin (DCO) nas contribuições e imposição por <c2/> das licenças/avisos das dependências na CI.

# text
seg-a0f14bea7532 = Posicionamento open-core (README): um motor Apache-2.0 gratuito mais apoio comercial, integração e extensões proprietárias disponíveis da Ashforde OÜ — sustentado por serviços, não por taxas de licença.

# text
# c1: CITATION.cff
seg-899815063eb1 = <c1/> para que o software possa ser citado.

# text
seg-15f45d8ccb0f = <s1>Anterior</s1>Onde se situa o Kshana

# text
seg-cd8a14a9e8ec = <s1>Seguinte</s1>Licenciamento

# text
seg-05d0c798a196 = A { "0.40" } acrescenta a cadeia da missão de classe Artemis e o seu segmento lunar, uma etiqueta de evidência em cada figura e tabela que uma execução escreve, ingestão e ajuste de relógios medidos, uma verificação de envio de parceiros de dados, uma região estimada de emissor a partir de relatos ADS-B ou AIS, a nova campanha de benchmark da { "0.40" }, e a linha de comandos, os relatórios e o Studio em dezassete idiomas além do inglês (os documentos de máquina permanecem em inglês). A matriz de verificação cresce de { "388" } para { "401" } linhas: { "176" } VALIDATED (inalterado), { "221" } MODELLED (eram { "208" }) e { "4" } PARTNER. Nenhuma linha foi promovida a VALIDATED. Os tipos de cenário crescem de { "87" } para { "92" }. Todo limiar que uma comparação com pré-registo não atingiu está declarado abaixo e permanece fixado; nenhum foi relaxado. A declaração consultiva permanece inalterada: o Kshana é um software de caráter consultivo, não um equipamento de navegação homologado e não uma certificação; o operador continua a ser responsável.

# text
seg-738f33f0ae8a = Limites conhecidos

# text
seg-d4062fab7ae1 = As execuções em outros idiomas levam cerca do dobro do tempo, porque o cenário é executado duas vezes (uma em inglês para os ficheiros de máquina, outra no idioma escolhido para a pessoa).

# text
seg-8db6dedc627a = Algumas frases do Studio são montadas a partir de fragmentos e podem não ter artigos em idiomas com género gramatical.

# text
seg-86e6e35ac846 = As traduções são traduções automáticas que nenhum falante nativo revisou; o inglês é a referência.

# text
# c1: --lang
# c2: KSHANA_LANG
# c3: lang
# c4: report.html
# c5: docs/i18n.md
# c6: REVIEW.md
seg-dd7ee240b467 = <b>Dezassete idiomas além do inglês</b> para o texto do motor destinado às pessoas e para o site e o Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, as variáveis de configuração regional; <c3/> nas chamadas da biblioteca, de Python, de WebAssembly e de MCP). Mensagens e erros da linha de comandos, resumos de execução, textos de gráficos, <c4/>, descrições dos tipos de cenário e as declarações consultivas estão traduzidos; os documentos de máquina (JSON, CSV, códigos de erro, a matriz de verificação) permanecem em inglês, e uma execução em outro idioma executa o cenário uma vez em inglês para os ficheiros de máquina e uma vez no idioma escolhido para a pessoa (<a1><c5/></a1>). <b>As traduções são traduções automáticas, não revistas por falantes nativos; o inglês é a referência</b>; o <c6/> de cada idioma lista o que um revisor deve verificar primeiro, e as páginas do site trazem um aviso a indicá-lo. As palavras de veredito, os níveis de evidência e o âmbito consultivo ("não homologado", "não uma certificação", "o operador continua a ser responsável") são mantidos em todos os idiomas.

# text
# c1: kshana interference-map locate
# c2: geolocation
# c3: interference_map::api::emitter_regions_from_*
# c4: interference_emitter_regions
# c5: VM-bc70cb57
# c6: docs/emitter-region/RESULTS.md
# c7: examples/emitter-region/
# c8: docs/INTERFERENCE-MAP.md
seg-7a95c263ecec = <c1/>: uma <b>região estimada de emissor</b> a partir de relatos ADS-B ou AIS. Uma posterior sobre onde pode estar uma fonte de relatos de posição degradados (linha de vista de rádio num raio terrestre de 4/3, altura da antena e potência do emissor marginalizadas, aeronaves afetadas a puxar e aeronaves não afetadas com linha de vista a empurrar em sentido contrário), escrita como regiões a { "50" }, { "90" } e { "95" }%, um centroide com a respetiva elipse de incerteza (nunca um ponto isolado), sessões no tempo (início, fim, duração, área afetada, aeronaves distintas acima do mínimo de publicação), um perfil por hora do dia e horas por dia, com fusão opcional de uma solução TDOA de <c2/>. Saídas: GeoJSON, resumo em JSON, CSV de sessões e uma figura SVG, cada uma com a licença, a atribuição, o id do método, as hipóteses, os limites e a sua etiqueta de evidência. Biblioteca <c3/>, Python e WebAssembly <c4/>. MODELLED (linha <c5/> do registo; a matriz tem agora { "401" } linhas, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); calibrada apenas com dados sintéticos, com a comparação com os locais de emissores do Jammertest { "2025" } fixada antecipadamente e executada uma vez: ADS-B e AIS ambos NOT ASSESSABLE (poucas sessões programadas nos dados abertos), portanto a linha permanece MODELLED (<c6/>). Formulação neutra, apenas agregados; a publicação de regiões de emissores no observatório público permanece desativada. Há um exemplo sintético em <c7/> (<a1><c8/></a1>).

# text
seg-b8f971ebf318 = Registos de relógio medidos.

# text
# c1: src/clock_log.rs
# c2: ptp4l
# c3: phc2sys
# c4: ts2phc
# c5: telecom-timing
# c6: [series.clock_log]
# c7: [clock_log]
# c8: measured
# c9: clock-measured-log
# c10: docs/CLOCK-LOG-FORMATS.md
# c11: f64
# c12: tests/fixtures/clock_log_real/RESULTS.md
seg-59b240848747 = <c1/> lê um registo de relógio medido numa única série de fase: oito formatos (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> e <c4/>, seguimento e estatísticas do chrony), cada um um subconjunto documentado; qualquer coisa fora dele é recusada com um erro que nomeia o que foi encontrado. É usado por <c5/> (<c6/>) e pelo tipo de cenário de relógio (<c7/>, que acrescenta um bloco <c8/> com o SHA-256 do registo e as ADEV, TDEV e MTIE sobrepostas), com o cenário incluído <c9/> (<a1><c10/></a1>). Comparado com o allantools em dados públicos reais face a limiares fixados antecipadamente: a primeira execução <b>não atingiu</b> B1 ({ "5" } de { "11" } casos, todos com carimbos de tempo TICC mantidos como <c11/>), B2, B3 ({ "7" } de { "24" } casos) e B4 (a versão do cabeçalho não era verificada); após as correções B1, B3 e B4 são atingidos e B2 é atingido, exceto por um par de MTIE, que está fixado e não é um defeito do motor (o allantools { "2024.6" } remove a frequência média antes de integrar; face ao seu MTIE em modo de fase, o motor concorda dentro de { "1e-10" }). A linha permanece MODELLED (<c12/>).

# text
# c1: [clock_fit]
# c2: src/clock_fit.rs
# c3: clock-fitted-log
# c4: tests/clock_fit_known_noise.rs
# c5: fitted
# c6: tests/fixtures/clock_fit/RESULTS.md
seg-400a39dbf3dd = <b>Um holdover conduzido por uma série medida ajustada</b>: o <c1/> do tipo de cenário de relógio ajusta o ruído de uma série medida e conduz o holdover a partir dele (<c2/>, cenário incluído <c3/>). Comparação com pré-registo: F1(b), F3 e F4 atingidos; F1(a) (recuperar o FM de passeio aleatório registado) <b>NOT MET</b> nos registos C3 (não identificável por construção) e em dois de três registos C4 (FM de passeio aleatório absorvido pelo FM de cintilação e pela deriva); F2 (identificação do ruído face ao allantools) atingido em onze de doze registos e D3 e <b>NOT MET</b> em D2 como registado (atingido em condições equivalentes). Todas as falhas estão fixadas (<c4/>); o bloco <c5/> e o holdover conduzido por ele permanecem MODELLED (<c6/>).

# text
# c1: agc_k_sigma
# c2: xval/bench/RESULTS-0.40.md
seg-f1f15e102774 = <b>A nova campanha de benchmark da { "0.40" }</b>, com pré-registo e assinatura do responsável antes de qualquer execução: A3 (EXPLORATORY, a AUC de bootstrap agrupado por pasta de <c1/>, quantil de { "2.5" } % { "0.8502" } contra { "0.80" }), D3 (EXPLORATORY, três de cinco detetores excedem uma lacuna de otimismo de { "0.05" } na escala { "0.25" }), R3 (AUC { "1.0" }) e R4 (P_fa { "0.0" }, P_d { "1.0" }): todos MET, todos MODELLED. A2, D1 e R1 não foram tocados e permanecem <b>NOT MET</b>; nada aqui os encerra (<c2/>, <a1>Bench</a1>).

# text
# c1: kshana partner check <submission.toml>
# c2: kshana.partner-submission/1
# c3: examples/partner-submission/
seg-b13f2dae66ea = <c1/>: verifica o formato e os metadados de um envio de parceiro de dados (<c2/>: dispositivo, ficheiro de dados e SHA-256, como foi obtido, as linhas MODELLED às quais é oferecido, licença, declarações) e lê os dados com os leitores de registo de relógio ou de IMU do próprio motor. Não pontua nada e não valida nada. Há um exemplo sintético em <c3/>.

# text
# c1: docs/PARTNER-DATA.md
# c2: docs/drafts/PARTNER-OUTREACH.md
seg-823e1abc7f92 = <c1/>: que linhas MODELLED do registo poderiam ser promovidas por dados medidos, os formatos aceites, como um envio é verificado, pontuado face a um limiar fixado antecipadamente e creditado, e o que PARTNER e VALIDATED significam cada um; uma nota de divulgação em rascunho para o responsável em <c2/> (nada é enviado).

# attr:title
seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

# text
# c1: gnss-ssv
# c2: lunar-infrastructure
# c3: xval/gnss-ssv/PREREGISTRATION-v2.md
# c4: xval/lunar-infra/PREREGISTRATION-v2.md
# c5: gnss-ssv
# c6: xval/gnss-ssv/RESULTS-v2.md
# c7: lunar-infrastructure
# c8: xval/lunar-infra/RESULTS-v2.md
# c9: kshana::lambda::{erfc_accurate, normal_cdf_accurate, bootstrap_success_rate_accurate}
seg-ddd45d39e8a9 = <b>Segundas campanhas para os limiares não atingidos de <c1/> e <c2/></b>, executadas conforme o pré-registo (<s1><c3/></s1>, <s2><c4/></s2>; assinadas antes de qualquer execução). Toda falha original permanece NOT MET e fixada. <c5/>: o controlo reproduz a execução { "1" } célula por célula; cinco ablações de leitura única trazem { "2" } das { "78" } células não atingidas para dentro da tolerância (EXPLORATORY, sem limiar); o novo limiar S7b (um formato de transmissão com atenuação e piso ajustado em painéis Classic IIR) é NOT MET nos painéis IIR-M em { "3.83" } a { "3.95" } dB contra { "3" } dB; a campanha de receção publicada reservada não foi executada (nenhuma fonte fixada) (<s3><c6/></s3>). <c7/>: os novos limiares C3a, C3b (um limite de deteção de cerca de { "3e-9" } m/s2), Q3a, Q3b (uma CDF normal precisa elimina a diferença de { "1.7e-6" }) e G3'' são atingidos como limiares próprios, e G3' com priores ilustrativos é atingido e etiquetado como EXPLORATORY (<s4><c8/></s4>). Tudo permanece MODELLED. Novos itens públicos: <c9/>.

# text
# c1: evidence
# c2: # evidence:
# c3: VALIDATED
# c4: MODELLED
# c5: PARTNER
# c6: VM-
# c7: ID
# c8: docs/VERIFICATION-MATRIX.md
# c9: tests/fixtures/evidence_ids.txt
# c10: jammertest score
# c11: iq acquire/sweep/track/monitor
# c12: config.json
# c13: config_version
# c14: kshana evidence verify
# c15: tests/evidence_labels_doc_sync.rs
# c16: docs/SURFACES.md
# c17: docs/revisions/STUDIO15-evidence-label-0.40.md
seg-bc89e70f4d36 = <b>Uma etiqueta de evidência em cada figura e tabela que uma execução escreve.</b> O JSON de resultado tem uma chave <c1/>, o SVG do gráfico tem um elemento de metadados e uma linha sob o gráfico, e a tabela CSV tem linhas de comentário <c2/>: o nível (<c3/>, <c4/> ou <c5/>, o mais fraco das linhas) e os ids das linhas da matriz de verificação em que a execução assenta. Linhas e estados são lidos da matriz, não escritos à mão; os ids são estáveis (<c6/> e oito dígitos hexadecimais, uma nova coluna <c7/> em <c8/>, uma lista congelada em <c9/>). Também em receiver-trust, <c10/>, <c11/>, no relatório de exposição de rota e, dentro do <c12/> assinado, em todo pacote de evidências (<c13/> { "1.1" }; <c14/> indica o nível; pacotes feitos antes da { "0.40" } são verificados sem alteração). <c15/> falha se uma figura não tem etiqueta, se uma etiqueta discorda da matriz ou se um novo escritor de ficheiros não está etiquetado nem listado com um motivo. As saídas que não trazem etiqueta estão listadas em <c16/>. Os três gráficos de demonstração do README foram renderizados de novo com a etiqueta (retirá-lo restaura os bytes antigos; <c17/>). Nenhuma afirmação mudou.

# text
# c1: mission-thread
# c2: scenarios/mission-thread-artemis-class.toml
# c3: docs/MISSION-THREAD.md
# c4: launch-ascent
# c5: leo-rendezvous
# c6: tli-and-cruise
# c7: gnss-ssv
# c8: entry
# c9: carry
# c10: inflate
# c11: reacquire
# c12: xval/mission-thread/PREREGISTRATION.md
# c13: xval/mission-thread/RESULTS.md
seg-8abd87414bc4 = O tipo de cenário <c1/> (<c2/>, <c3/>): o orçamento de erro de navegação e temporização de uma cadeia de fases do lançamento à reentrada, com todo número MODELLED e toda entrada declarada. Oito tipos de fase: <c4/>, <c5/> (covariância relativa de Clohessy-Wiltshire ao longo de excertos de sensor, janela de acoplagem), <c6/> (propagação de Cowell com uma matriz de transição de estado por diferenças finitas, erro de queima, atualizações <c7/> e de seguimento em solo, a Lua a partir de um recorte opcional do kernel DE440), <c8/> (sigma do ângulo de trajetória, probabilidade do corredor, desaceleração máxima nas extremos do corredor, área de aterragem) e os quatro tipos lunares. Regras de transferência (<c9/>, <c10/>, <c11/>), conversões de referencial e de escala de tempo como linhas próprias do orçamento, uma sobreposição opcional da rede terrestre que define o ciclo de seguimento de cada fase, a margem face aos requisitos declarados e o elo mais fraco. O exemplo segue a sequência de uma apresentação pública de conceito de operações da NASA com números ILLUSTRATIVE: um exemplo de ponta a ponta de classe Artemis em { "11" } fases, segmentos terrestre e lunar. A propagação cislunar foi comparada com a trajetória pública da Artemis I ao longo de um arco de { "72" } h face a um limiar fixado em <c12/> antes da execução: <b>NOT MET</b> ({ "45.3" } km e { "0.25" } m/s contra { "5" } km e { "0.05" } m/s). O diagnóstico situa a falha em cinco pequenos eventos impulsivos na referência; entre eles o modelo de forças reproduz os estados horários com mediana de { "0.4" } m. A linha permanece MODELLED (<c13/>).

# text
# c1: mission-thread
# c2: src/mission_thread/lunar/
seg-67cad0a9c0c4 = O segmento lunar da cadeia da missão de classe Artemis: quatro tipos de cenário, cada um também um tipo de fase da interface <c1/> (<c2/>), todos MODELLED.

# text
# c1: lunar-orbit-rendezvous
# c2: scenarios/lunar-orbit-rendezvous.toml
# c3: ...-elfo.toml
seg-63066076a0a8 = <c1/>: navegação relativa até à acoplagem numa órbita polar circular de { "100" } km ou numa órbita polar elíptica de { "100" } km por { "3000" } km (<c2/>, <c3/>). Uma estimativa de Gauss-Newton em lote ao longo do arco funde uma solução absoluta por veículo a partir de um conjunto ilustrativo de relés de classe LCNS, um erro persistente do sinal no espaço (comum aos dois veículos e independente) e uma distância por enlace cruzado, sob o modelo de forças lunares da biblioteca. Indica a posição e a velocidade relativas nos eixos locais do alvo, a disponibilidade da solução, o erro de estimação normalizado quadrático médio face ao valor esperado, o custo de ignorar os harmónicos da gravidade, os modelos terminais de sensor relativo ao lado do valor só de sinais e a covariância 6x6 transferida.

# text
# c1: lunar-descent
# c2: scenarios/lunar-descent.toml
# c3: lunar-descent-lola.toml
# c4: lunar-differential-pnt
# c5: terrain-nav
# c6: lunar-time-offset
seg-a2d67bb5cfb3 = <c1/>: o orçamento de dispersão de aterragem num local polar sul (<c2/>; <c3/> lê o DEM do LOLA a partir de um checkout): um modelo de erro inercial de cinco estados por eixo, uma solução AFS (isolada ou diferencial, usando o resíduo do enlace de correção de <c4/>), uma solução relativa ao terreno (o correlacionador <c5/> sobre o seu relevo sintético, ou o limite de Cramer-Rao da correlação com o DEM do LOLA) e o tempo lunar por meio do relógio do veículo (<c6/>). Informa a elipse de aterragem de 3 sigma, cada combinação de auxílios e uma calibração de Monte Carlo da elipse.

# text
# c1: lunar-surface
# c2: scenarios/lunar-surface.toml
# c3: lunar-surface-terrain.toml
# c4: moonlight-service-volume
seg-1babf99e8d56 = <c1/>: disponibilidade de posicionamento e temporização por local e estação (<c2/>; <c3/> acrescenta o horizonte do LOLA por traçado de raios): o valor de posicionamento de local único é igual, bit a bit, ao de <c4/>; o que varia com a estação é a visibilidade da Terra e do Sol obtida das efemérides analíticas.

# text
# c1: lunar-ascent
# c2: scenarios/lunar-ascent.toml
seg-bae659d0ff4d = <c1/>: a ascensão até à órbita de encontro e a covariância de posição e velocidade levada de volta à órbita (<c2/>), com a dispersão no corte do motor indicada ao lado.

# text
# c1: docs/MISSION-THREAD-LUNAR.md
# c2: xval/mission-thread-lunar/
seg-106be12d960f = <c1/>; o pré-registo, as suas alterações e todos os resultados, inclusive as falhas, em <c2/>.

# text
# c1: xval/mission-thread-lunar/PREREGISTRATION.md
seg-5e8880c28a67 = Fixado antecipadamente em <c1/> antes de qualquer execução, com seis alterações datadas (cada uma feita antes da obtenção dos dados, exceto a Alteração { "6" }, que corrige um erro aritmético numa contagem de estados após a obtenção e antes de qualquer resultado de A2; toda emenda está divulgada no ficheiro). Nenhum limiar foi relaxado.

# text
seg-90adc3a3c58b = A1 (o propagador face à trajetória reconstruída do LRO do JPL Horizons, { "24" } h): <b>MET</b>, uma diferença 3-D máxima de { "33" } m contra um limiar de { "500" } m e uma diferença radial RMS de { "2.4" } m contra { "60" } m.

# text
# c1: tests/mission_thread_lunar_oracles.rs
seg-69f903a278eb = A2 (o mesmo propagador face à NRHO do CAPSTONE ao longo de uma revolução de 6,5 dias): <b>NOT MET</b>, uma diferença de posição final de { "136.8" } km contra um limiar de { "25" } km e uma diferença de raio de periapsia osculador de { "28.4" } km contra { "10" } km. A linha permanece MODELLED, e a falha está fixada por <c1/>.

# text
# c1: xval/mission-thread-lunar/RESULTS.md
seg-32fcafe8fa07 = B1 (a consistência da estimativa do encontro com o seu próprio modelo) é MET no quarto projeto de estimador, NEES médio de { "5.85" } a { "5.93" } contra um intervalo de [{ "5.2" }, { "6.8" }]; os três projetos anteriores, um filtro de Kalman estendido em três variantes, não a atingiram. Uma quinta alteração, feita depois de o cenário de { "2" } h incluído ter levado { "4" } de { "50" } tentativas a um mínimo local (NEES médio { "1e9" }), executa o ajuste de Gauss-Newton sobre um arco crescente com redução de passo; B1 não muda com ela e os cenários incluídos dão { "6.51" } e { "6.33" }. O histórico está em <c1/>.

# text
seg-a4b6bfcb9984 = Nada aqui é VALIDATED: as linhas de referência independente testam o propagador partilhado, e não um filtro de navegação, um sinal ou um orçamento.

seg-29d014d29790 = Uma atualização de dependência na biblioteca distribuída (a primeira entrada), o restante nas ferramentas de validação cruzada (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> e <c3/> { "0.13" } para { "0.14" } (com <c4/> { "0.14.3" }, <c5/> { "0.17.0" } e <c6/> { "0.5.5" } para { "0.7.10" }; também a dependência direta <c7/>, agora { "0.7" }) resolvem RUSTSEC-2026-0387, uma variabilidade de tempo de execução em <c8/> { "0.5.5" }. O Kshana usa estes crates apenas para verificar assinaturas públicas (a chave raiz Galileo OSNMA e os tokens de carimbo temporal RFC { "3161" }) e só assina em testes com chaves descartáveis, pelo que a exposição prática era nula; a atualização remove o aviso sem uma entrada de exclusão. Os ficheiros de bloqueio da biblioteca e do MCP mudam ambos; nenhum resultado de verificação muda (os testes de vetores de OSNMA e de carimbo temporal passam sem alteração).

seg-1a4cda9d1486 = A versão mínima suportada do Rust é agora { "1.88" } (exigida pela correção do RUSTSEC-2026-0387).

seg-0d4a740afedf = [{ $version }] - 2026-10-29
