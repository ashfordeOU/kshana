# docs--architecture: translations (pt-PT)

# text
# c1: docs/ARCHITECTURE.md
seg-e366c6dd500e = Fonte: <c1/>

# text
seg-1f25b7fa1187 = Kshana — Arquitetura

# text
seg-b0136a82669c = O Kshana é <b>um só motor</b> organizado em camadas sobre um núcleo partilhado: os <b>pacotes de sensores</b> (relógio, inercial, transferência de tempo, híbrido); uma camada de <b>astrodinâmica / numérica</b> (SGP4/SDP4 analítico (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), um propagador numérico de Cowell com o seu modelo de forças de sete perturbações, projeto de manobras, determinação de órbita a partir de distâncias de estações terrestres, e o ajuste do modelo de forças a efemérides precisas de agências); uma camada de <b>tempo e referenciais</b> (escalas de tempo IERS (International Earth Rotation and Reference Systems Service), precessão–nutação IAU (International Astronomical Union) 2006/2000A e a redução CIO (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); uma camada de <b>fusão</b> (os estimadores GNSS/INS (GNSS: sistema global de navegação por satélite; INS: sistema de navegação inercial)); e as camadas de <b>integridade, resiliência, alt-PNT (PNT: posicionamento, navegação e temporização) e lunar</b> (RAIM/ARAIM/SBAS (RAIM: monitorização autónoma de integridade pelo recetor; ARAIM: monitorização autónoma de integridade pelo recetor avançada; SBAS: sistema de aumentação baseado em satélites), deteção de jamming e de spoofing em várias camadas, correspondência de mapas de gravidade/terreno/magnéticos e PNT cislunar); e as camadas mais recentes de <b>LEO-PNT</b> (PNT em órbita terrestre baixa), <b>espetro</b>, <b>sistema solar e projeto de constelações</b>, <b>temporização de rede</b> e <b>campanhas</b>, com os escritores de relatórios, animações e interoperabilidade que todas as execuções podem usar (§1d). Em todas elas, o motor nada sabe sobre "quântico" vs "clássico": conduz <em>modelos de erro</em> de sensores através de um cenário de falha de GNSS, executa um estimador e pontua o resultado. Um dispositivo quântico e um clássico são, portanto, comparados no mesmo cenário, diferindo apenas nos seus parâmetros de erro (publicados, citados) e nas suas sementes de ruído independentes.

# text
seg-02110864419e = Este documento reúne os diagramas estruturais e comportamentais. A §{ "1" } é o núcleo dos pacotes de sensores; a §1a mapeia as camadas de astrodinâmica, fusão e alt-PNT acrescentadas desde então; as §1b–§1d as camadas de estudo, de domínio e de saída. Para a utilização, consulte o <a1>README</a1>; para o que é e não é validado, consulte <a2>VALIDATION</a2>; para a tabela de maturidade por capacidade, consulte <a3>CAPABILITY</a3>.

# text
seg-7bcc7b5cd049 = Abreviaturas usadas nos diagramas e não explicadas onde aparecem: ADEV, desvio de Allan; BW, largura de banda; CAI, interferómetro de átomos frios; CZML, a Cesium Language; Δ-DOR, medição de distância unidirecional diferencial delta; DO-229E, a norma de recetores SBAS da RTCA (Radio Technical Commission for Aeronautics); EKF, filtro de Kalman estendido; FM, modulação de frequência; GSE, equipamento de apoio em terra; HPL/VPL, nível de proteção horizontal/vertical; IMU, unidade de medição inercial; IOAG, Interagency Operations Advisory Group; IQ, amostras em fase/quadratura; ISL, ligação entre satélites; ITU-T, o Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações; J2–J6, os harmónicos zonais do campo gravítico da Terra de grau { "2" } a { "6" }; KIF, o Kshana Interchange Format; KML, Keyhole Markup Language; KPI, indicador-chave de desempenho; L1/L5, bandas de portadora GNSS (o L2 das órbitas halo do CR3BP é, em vez disso, o ponto de Lagrange Terra–Lua { "2" }); LEO, órbita terrestre baixa; LOO, validação deixando um de fora; LTC, Tempo Lunar Coordenado; MEO, órbita terrestre média; MTIE, erro máximo de intervalo de tempo; N2, o número de diversidade de Hill de ordem 2; NED, norte-este-baixo; NTN, rede não terrestre; OD, determinação de órbita; OPS-SAT, o satélite-laboratório de software em órbita da Agência Espacial Europeia; PPP, posicionamento preciso de ponto; PSD, densidade espectral de potência; PVT, posição, velocidade e tempo; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), integradores de Runge–Kutta de quarta ordem e de quinta(quarta) ordem embutido; SH, harmónico esférico; SigMF, Signal Metadata Format; SIR, reamostragem por importância; SRIF, filtro de informação em raiz quadrada; SRP, pressão da radiação solar; SSC, coeficiente de separação espetral; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, desvio de tempo; TDM, a Tracking Data Message do CCSDS (Consultative Committee for Space Data Systems); TLE, conjunto de elementos de duas linhas; TPL, Timing Protection Level; UBX, o protocolo binário da u-blox; UHF, frequência ultra-alta; VLBI, interferometria de linha de base muito longa; VRW / ARW, passeio aleatório de velocidade / de ângulo; WASM, WebAssembly.

# text
seg-a87f668a8f97 = { "1" }. Estrutura de módulos

# text
# c1: api::run_toml
# c2: types
# c3: scenario
# c4: allan
# c5: hybrid
# c6: orbit
# c7: navsignal
# c8: κ
# c9: jamming
# c10: Q = 1/(R_c·κ)
seg-0388999448a6 = A CLI (interface de linha de comandos) e ambas as ligações convergem num único ponto de entrada <c1/>, pelo que nunca divergem. Os pacotes reutilizam o núcleo partilhado (<c2/>, <c3/>, <c4/>); o Pacote { "4" } (<c5/>) compõe os modelos e estimadores dos Pacotes { "1" }–{ "3" } em vez de os reimplementar; <c6/> deriva uma cronologia GNSS a partir da geometria, que depois alimenta a execução do Pacote { "1" }. O módulo <c7/> situa-se ao nível do sinal entre o balanço de ligação e o domínio das medições: deriva o coeficiente de separação espetral <c8/> a partir dos espetros de potência reais do sinal e do jammer, a partir do qual <c9/> passa agora a calcular o seu <c10/> anti-jam em vez de tomar uma constante representativa (verificado por comparação em CI (integração contínua)); transporta também o compromisso de projeto do código de medição de distância (sequência-m/Gold).

# text
# c1: holdover
# c2: clock_state
# c3: inertial::quantum_imu
# c4: QuantumNavBudget
# c5: AccelModel
# c6: verification
seg-cee4eb61a8e9 = Três outros módulos formam a espinha dorsal da <b>resiliência sem GNSS</b>. <c1/> responde diretamente à pergunta operacional — <em>durante quanto tempo pode este relógio funcionar livremente antes de o seu erro de temporização exceder o orçamento?</em> — expondo a forma fechada do erro de deriva de van Loan como uma inversão do holdover até ao limiar, verificada por comparação com a recursão de covariância de vários passos de <c2/>. O seu gémeo inercial vive em <c3/> (<c4/>), que compõe a deriva de ruído branco do interferómetro de átomos frios com o erro de enviesamento e de fator de escala num orçamento de deriva de posição durante o holdover (o termo de enviesamento verificado por comparação com o integrador independente <c5/>). <c6/> desenha toda a matriz do motor de exigência, módulo, teste, referência independente e estado, com invariantes testados por unidades que proíbem um rótulo <em>validado</em> sem uma referência independente externa — pelo que a alegação de garantia não pode divergir do código.

# text
seg-c7bee352c04d = 1a. Camadas de astrodinâmica, fusão e alt-PNT

# text
# c1: orbit
# c2: kind
seg-99c44e3a86d5 = Para além do núcleo dos pacotes de sensores, três subsistemas partilham o mesmo núcleo e alimentam (ou são alimentados por) <c1/>. A camada de <b>astrodinâmica / numérica</b> acrescenta um propagador de Cowell não analítico ao lado do caminho analítico SGP4/SDP4; a camada de <b>fusão</b> transporta os estimadores GNSS/INS; e a camada de <b>alt-PNT</b> é a correspondência de mapas de gravidade sem GPS (GPS: Global Positioning System). São capacidades de biblioteca/cenário (ver <a1>CAPABILITY</a1> para saber quais estão ligadas a um tipo de cenário (<c2/>) e quais são acessíveis como uma API (interface de programação de aplicações) Rust).

# text
# c1: forces
# c2: integrator
seg-69f93294d2c8 = Os termos de força do propagador numérico estão desligados por predefinição, pelo que ativá-los nunca perturba os goldens publicados. O filtro de Kalman unscented (UKF) fortemente acoplado de 17 estados faz a deriva de uma falha de GNSS com a velocidade derivada do passeio aleatório do acelerómetro quântico CAI; a determinação de órbita reutiliza os mesmos <c1/>/<c2/> para propagar um estado candidato ao longo do arco de seguimento.

# text
# c1: timescales
# c2: jd2
# c3: precession
# c4: nutation
# c5: cio
# c6: frames
# c7: eop
# c8: ephemeris
# c9: raim
# c10: sbas
# c11: jamming
# c12: spoof
# c13: spoof_detect
# c14: spoof_monitors
# c15: detection
# c16: navsignal
# c17: κ
# c18: jamming
# c19: Q
# c20: lunar
# c21: lunar_frame
# c22: lunar_od
# c23: cr3bp
# c24: cr3bp_jacobian
# c25: propagate_state_stm
# c26: differential_correct_halo
# c27: precise_od
# c28: lunar_od
# c29: tides
# c30: gravity_sh
# c31: igrf
# c32: altpnt/terrain
# c33: gravimeter
seg-bd87e20c284b = O mesmo núcleo partilhado transporta ainda quatro outros subsistemas não desenhados acima (os seus pacotes aparecem no despacho da §{ "4" }): uma camada de <b>tempo e referenciais</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) que reduz TEME↔GCRS↔ITRS (TEME: equador verdadeiro, equinócio médio) e alimenta o pacote de <c8/>/traço no solo; uma camada de <b>integridade</b> (<c9/>, <c10/>) para RAIM/ARAIM/SBAS; uma camada de <b>resiliência</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) para deteção de jamming e de spoofing em várias camadas, com uma camada de <b>sinal de navegação</b> (<c16/>) ao nível do sinal — densidades espectrais de potência BPSK-R (BPSK: modulação por desvio de fase binária) / sine-BOC (BOC: portadora de desvio binário), o coeficiente de separação espetral <c17/> que agora deriva o <c19/> anti-jam de <c18/>, a largura de banda de medição de distância RMS (Gabor), o jitter de seguimento de código DLL (malha de bloqueio de atraso) coerente early–late e a envolvente do erro de multipercurso (análise de desempenho de sinal, <b>não</b> projeto de hardware de carga útil de RF (RF: radiofrequência) / antena — o papel de um parceiro de carga útil); e uma camada <b>lunar / cislunar</b> (<c20/>, <c21/>, <c22/>, <c23/>) para a dinâmica CR3BP (problema circular restrito de três corpos) — incluindo a matriz de transição de estado de { "6" }×{ "6" } e um corretor diferencial de tiro único (<c24/>, <c25/>, <c26/>) que produz órbitas halo/NRHO (NRHO: órbita halo quase retilínea) genuinamente periódicas, reproduzindo a NRHO sul { "9" }:{ "2" } publicada de L2 (a órbita do Gateway) com período ≈ { "6.57" } d / perilúnio ≈ { "3,250" } km (publicado ≈ { "6.56" } d / ≈ { "3,370" } km); a transformação MCI/MCMF selenocêntrica (MCI: inercial centrado na Lua; MCMF: centrado e fixo à Lua) de uma órbita corrigida e a continuação de famílias continuam por fazer, e a NRHO é uma solução CR3BP (circular, sem Sol), não validada face a uma efeméride real LANS/Gateway (LANS: Lunar Augmented Navigation Service) — e a integridade LunaNet. O ajuste do modelo de forças às efemérides de agências (<c27/>, <c28/>, <c29/>, <c30/>) e o conjunto completo de campos alt-PNT (<c31/>, <c32/>, <c33/>) completam a lista de módulos; ver <a1>CAPABILITY</a1> para a maturidade por módulo.

# text
seg-05f8c8c84d15 = 1b. Estudos de resiliência, avaliação de aprendizagem automática e artefactos reproduzíveis

# text
# c1: kind
# c2: cargo run --example
# c3: --bin
seg-7350971daf4e = Cinco outros grupos de módulos formam a camada de <b>estudo aberto e reproduzível</b> por trás dos artigos de investigação do projeto. Ao contrário dos tipos de cenário (<c1/>), estes são alcançados como geradores <c2/> / <c3/> que escrevem artefactos <b>deterministas ao byte</b> (sementes fixas, versão do motor registada + hash da configuração). Todos são <b>MODELLED</b> (calibração sintética ou de conjuntos de dados públicos) e levam rótulos de validação honestos — nenhum é uma certificação.

# text
# c1: tpl
seg-86b177166f0e = <b><c1/></b> — o Timing Protection Level condicional: um limite, limitado pelo holdover, do erro de tempo <em>não detetado</em> sob spoofing, que compõe um piso de monitor de k-σ, a variância de deriva de van Loan ao longo da latência de deteção e um tempo até ao alarme de CUSUM (soma cumulativa); calibrado com um spoof real gravado (JammerTest { "2024" }). Não há nenhum limite <em>incondicional</em> finito — o TPL é condicional a uma verificação cruzada independente que detete o ataque.

# text
# c1: resilience/
seg-8c9d1d90dc8e = <b><c1/></b> — um motor de pontuação de resiliência PNT alinhado com referenciais (categorias RPCF (Resilient PNT Conformance Framework) do DHS (Department of Homeland Security)) mais um estudo de instabilidade de decisão: um simplex de ponderação de Dirichlet, instabilidade de ordenação de Kendall-τ, taxa de troca do vencedor top-1 e <b>colapso de diversidade</b> de modo comum (Hill-N2), com um relatório de garantia com hash de integridade e { "35" } testes de referência independente derivados à mão. Ver <a1>RESILIENCE-CROSSWALK</a1>. Arquiteturas sintéticas alinhadas com o RPCF v2.0 — uma autoavaliação, não uma certificação.

# text
# c1: impairment_eval
# c2: impairment_study
# c3: impairment_ml
# c4: eval_stats
seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — o estudo da lacuna de otimismo para degradações de RF: um corpus sintético rotulado e um arnês ROC/AUC (ROC: característica de operação do recetor; AUC: área sob a curva) agnóstico quanto ao detetor, um painel de 13 detetores (energia/AGC/SQM/paridade (AGC: controlo automático de ganho; SQM: monitorização da qualidade do sinal) mais detetores de regressão logística e de MLP (MLP: perceptrão multicamada) de uma camada oculta com sementes), leis de escala dentro e fora da distribuição com um nulo de permutação e um preditor leave-one-out da degradação fora da distribuição. As métricas de avaliação são validadas bit a bit face ao scikit-learn.

# text
# c1: sdr
# c2: realdata
seg-36206681024f = <b><c1/> / <c2/></b> — um front end de recetor definido por software (IQ/IF (IQ: em fase/quadratura; IF: frequência intermédia) brutos → derivações early/prompt/late do correlador → SQM) e adaptadores de ingestão (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) que deixam os mesmos detetores correr sobre gravações fornecidas localmente; nenhum conjunto de dados é submetido ao repositório.

# text
# c1: crossover
# c2: quantum_trade
seg-fefd78868fc2 = <b><c1/> / <c2/></b> — o mapa de cruzamento de resiliência quântico-vs-clássico sob incerteza de parâmetros, e o compromisso de benefício de holdover com ADEV medido; os núcleos numéricos do compromisso são validados face ao scipy.

# text
seg-5749f1300772 = 1c. Camadas de integridade, GNSS, espaço profundo, lunar e de missão

# text
# c1: api
# c2: verification
seg-f44755d6d921 = Os restantes domínios ligam-se ao mesmo despacho <c1/> e reutilizam o núcleo partilhado, os referenciais e a geometria. Tudo aqui é <b>MODELLED</b>, salvo se uma linha da matriz <c2/> citar uma referência independente externa (núcleo RAIM face ao SciPy, SBAS face ao fork do RTKLIB (uma biblioteca aberta de posicionamento cinemático em tempo real), o núcleo DOP (diluição da precisão) verificado com o gnss_lib_py, a avaliação OPS-SAT, o núcleo de nível de proteção ARAIM lunar, a coerência entre fornecedores das efemérides lunares) — o resto do conjunto lunar e o demonstrador quântico são modelados, ilustrativos, de fonte pública e não levam nenhuma alegação de TRL (nível de maturidade tecnológica) / herança / aval de agências.

# text
seg-044940c8d052 = 1d. LEO PNT, espetro, sistema solar, temporização de rede, campanhas e saídas

# text
# c1: kind
# c2: api
seg-253a26d9cc5d = As camadas mais recentes seguem o mesmo padrão: cada uma é um ou mais tipos de cenário (<c1/>) despachados a partir de <c2/>, construídos sobre o núcleo partilhado e MODELLED, salvo se uma linha da matriz citar uma referência independente externa.

# text
seg-e47cccd54da3 = O detalhe por tipo de cenário está em <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> e <a13>INTEROP</a13>.

# text
seg-d04b21c7cb6c = 1e. Camadas de confiança do recetor, evidências, telemetria, formação e compliance ({ "0.35" })

# text
# c1: api
# c2: receiver-trust
seg-84ee122959b4 = Estas camadas leem o registo do próprio recetor ou escrevem ficheiros para outras ferramentas; nenhuma sintetiza ou transmite um sinal de radiofrequência. Situam-se ao lado de <c1/> e não sob os tipos de cenário, exceto o próprio <c2/>, que é um tipo de cenário. Todas são MODELLED, salvo se uma linha da matriz citar uma referência independente externa, e as saídas marítimas são consultivas, não um equipamento de navegação homologado.

# text
seg-aab745a65e76 = Módulo

# text
seg-9d17ad3e87c8 = Documentado em

# text
seg-920b6b14c0e2 = pontua um registo de recetor época a época com os monitores de confiança; uma plataforma de embarcação acrescenta os monitores marítimos e a pontuação de 0-100 com motivos

# text
seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

# text
# c1: $PKSHT
# c2: LiveEngine
seg-c311dfc2a161 = a mesma pontuação sobre um fluxo à medida que chega (stdin, um ficheiro a ser acrescentado, TCP ou UDP), a sentença <c1/> e o gate opcional; <c2/> é a totalidade disso, sem entrada nem saída

# text
seg-07b2d6edf7b9 = um pacote assinado, encadeado por hashes, de uma janela de registo, da sua configuração e do resultado do motor, verificável offline; token de marca temporal RFC { "3161" } opcional

# text
# c1: otlp
seg-32d08730b9c0 = o fluxo de confiança como métricas Prometheus, eventos syslog (CEF ou LEEF) e, opcionalmente, OpenTelemetry (funcionalidade <c1/>, desativada por predefinição)

# text
seg-53311b8c3b93 = NMEA { "0183" } sintético de ponte, com eventos programados de jamming, drag-off, time spoof e replay e um registo de instrutor, para a formação de tripulações (apenas texto)

# text
seg-f7cc3cfbdfc6 = mapas agregados de navegação degradada a partir de relatórios de aeronaves e navios de licença aberta, e a exposição de uma rota a esses mapas; apenas ficheiros locais

# text
# c1: osnma::cli::verify_report
seg-83fe3c87e2d5 = um verificador do lado do recetor para o OSNMA do Galileo: lê páginas I/NAV (páginas simples, CSV de vetores, um fluxo UBX), verifica a chave assinada, a cadeia TESLA e os MAC, e indica, por satélite, se os dados de navegação estão autenticados; <c1/> é o único caminho que a linha de comandos, o Python e o WebAssembly partilham; apenas estado de autenticação, não é um serviço de integridade

# text
seg-bf8cd5a45deb = OSNMA

# text
# c1: run_from_text
# c2: assess_texts
seg-843a83b82283 = associa os resultados do Kshana a referenciais públicos de resiliência e preenche a associação a partir de documentos de resultados; <c1/> e <c2/> recebem textos, não caminhos

# text
seg-e16c483479ce = o movimento do veículo e os eventos de um cenário como CSV de movimento, NMEA, texto de pontos de passagem e ficheiros de eventos para um simulador GNSS de laboratório; não é escrito nenhum sinal

# text
seg-044c58c98397 = As integrações para embarcações (o plugin Signal K, o modo de barreira do OpenCPN e a compilação de referência) chamam a ferramenta de linha de comandos; ver <a1>MARINE-INTEGRATIONS</a1>.

# text
seg-cb8d8ff847eb = { "2" }. Pipeline do motor (por execução)

# text
seg-53e9e596ca44 = Cada execução avança um único modelo de sensor ao longo da grelha temporal, disciplinando-o sempre que o GNSS está nominal e deixando-o em funcionamento livre (holdover / dead-reckoning) durante a indisponibilidade.

# text
# c1: classical_seed = seed + 0x9e3779b97f4a7c15
seg-257407f3c375 = Um cenário executa este pipeline duas vezes — uma para o sensor quântico, outra para o sensor clássico — com <b>sementes independentes</b> (<c1/>), de modo que as duas realizações de ruído não estejam correlacionadas.

# text
seg-4659e89ba5f5 = { "3" }. A interface do modelo de erro (o ponto de extensão)

# text
# c1: step()
seg-7b70e8b1b98a = Todos os sensores implementam a mesma ideia: um objeto com estado cujo <c1/> faz avançar o seu erro estocástico interno e cujo estado acumulado é lido a cada instante. Os relógios expõem a fase acumulada; os acelerómetros expõem a posição duplamente integrada; as ligações expõem a instabilidade (jitter) por medição.

# text
# c1: ModelSpec { id, kind, provenance, params }
# c2: provenance
seg-79ab76c6dbc0 = <c1/> acompanha o resultado, de modo que cada valor da saída é rastreável até à fonte publicada indicada em <c2/>.

# text
# c1: HoldoverEstimator
# c2: KalmanClock
# c3: q_wf·T + q_rw·T³/3
seg-514c49659947 = Além do <c1/> analítico, o pacote de relógio executa um filtro de Kalman de dois estados (fase, frequência) (<c2/>) cujo ruído de processo coincide com o do modelo de referência. Ao deslizar durante uma indisponibilidade, a variância do seu erro de fase cresce exatamente até <c3/> — a relação analítica de holdover — e o seu limite em linha de 1-σ é usado para preencher a figura de mérito de <b>integridade</b> (fração das amostras da indisponibilidade cujo erro se mantém dentro do limite de k-σ).

# text
seg-7404589deb40 = { "4" }. Despacho (CLI e ligações)

# text
# c1: api::run_toml(src)
# c2: kind
# c3: { json, svg, summary, csv }
# c4: csv
# c5: report.html
# c6: report.json
# c7: --export
# c8: --animate
seg-6138513a43f7 = <c1/> é o ponto de entrada único: lê de relance o <c2/> de nível superior, desserializa o cenário correspondente, executa o pacote e devolve <c3/> (<c4/> só está presente nos tipos de cenário que publicam uma tabela de reprodutibilidade). A CLI escreve-os em ficheiros, juntamente com o relatório (<c5/>, <c6/>) e qualquer saída <c7/> / <c8/>; as ligações Python e WebAssembly devolvem-nos ao anfitrião. Um só despacho, sem divergências.

# text
# c1: ScenarioKind
# c2: kind
# c3: clock
# c4: serde
# c5: kind
# c6: kind
# c7: KshanaError::InvalidInput
seg-524f749be364 = O despacho faz-se sobre uma enumeração tipada <c1/>, com correspondência exaustiva (ver a subsecção seguinte), pelo que acrescentar um pacote é uma alteração verificada em tempo de compilação. Um <c2/> ausente recorre ao pacote <c3/>, de modo que os cenários existentes de um só tipo se desserializam sem alterações (o <c4/> ignora o campo <c5/> em cada estrutura de cenário). Um <c6/> não reconhecido é recusado com <c7/>, que indica o tipo incorporado mais próximo quando o nome parece um erro de escrita.

# text
seg-eedaeae2a7e7 = Despacho tipado e a API estruturada

# text
# c1: ScenarioKind
# c2: ScenarioKind::classify(src)
# c3: kind
# c4: run_toml
seg-ca47f566eaee = O despacho faz-se sobre uma enumeração tipada <c1/>, não sobre uma correspondência de cadeias em bruto: <c2/> resolve o campo <c3/> numa variante e o despachante faz a correspondência exaustiva sobre ela — acrescentar um pacote é uma alteração verificada em tempo de compilação, não um erro de escrita numa cadeia. Duas superfícies tipadas coexistem com o <c4/> que devolve cadeias (mantido para a CLI e para as ligações existentes):

# text
# c1: run_scenario(src) -> Result<RunOutput, KshanaError>
# c2: InvalidInput
# c3: NonConvergence
# c4: Unsupported
# c5: IoError
# c6: kind_tag()
# c7: error_kind(toml)
seg-167c47049329 = <b><c1/></b> — a entrada tipada, com uma taxonomia de erros estruturada (<c2/>, <c3/>, <c4/>, <c5/>). Cada erro transporta um <c6/> estável, para que quem chama possa ramificar consoante a categoria da falha em vez de analisar a mensagem. As ligações expõem-no como <c7/>.

# text
# c1: list_scenario_kinds() -> Vec<ScenarioMeta>
# c2: list_scenario_kinds_json()
# c3: list_kinds()
seg-1943051b3b20 = <b><c1/></b> (e <c2/>, exposto nas ligações como <c3/>) — introspeção programática: o nome, a descrição e os campos obrigatórios/opcionais de cada tipo de cenário, para o preenchimento automático da UI (interface de utilizador) e de notebooks.

# text
seg-630243592256 = Estender o Kshana com um pacote externo

# text
# c1: api
seg-d1adedd2c08b = Um pacote de terceiros implementa dois pequenos traits, estáveis segundo semver, de <c1/>:

# text
# c1: ExternalPack
# c2: register_into(&mut PackRegistry)
# c3: src/registry.rs
# c4: jamming
# c5: Scenario
# c6: ErrorModel
seg-d01471b13324 = <c1/> tem também um método <c2/> predefinido, sem efeito a menos que um pacote opte pelo ponto de despacho do registo em <c3/>. O pacote <c4/> incorporado está ligado através de <c5/> como exemplo trabalhado; os pacotes externos à árvore seguem o mesmo contrato sem bifurcar o núcleo (espelhando o ponto de extensão <c6/> da §{ "3" }, que a camada privada de resiliência utiliza).

# text
# c1: ErrorModel
# c2: Scenario
# c3: ExternalPack
seg-5b0449d96bc3 = O Kshana tem, assim, <b>dois pontos de extensão estáveis</b> — acrescentar um <em>sensor</em> implementando <c1/> (§{ "3" }), ou acrescentar um <em>tipo de cenário</em> completo implementando <c2/> + <c3/> — ambos estáveis segundo semver, nenhum exigindo uma bifurcação do núcleo:

# text
seg-3928a007756b = { "5" }. O elemento de síntese híbrido

# text
# c1: pnt_holdover
seg-7f38e825519a = O pacote híbrido executa uma <em>suite</em> (um relógio e um sensor inercial) e exige que <b>tanto</b> a temporização como a posição se mantenham dentro da especificação; <c1/> é o tempo até um dos dois ser violado. Opcionalmente, uma ligação ótica entre satélites volta a sincronizar o <b>relógio</b> durante a indisponibilidade — apenas auxílio de tempo; a posição não é novamente sincronizada, porque a transferência de tempo dá tempo, não posição. É isto que isola o sensor inercial como fator limitante.

# text
seg-17a8683f0982 = { "6" }. Disponibilidade GNSS derivada da geometria

# text
# c1: orbit.rs
# c2: Propagator
# c3: Orbit
# c4: Sgp4
# c5: build_timeline
seg-afdb141ac367 = <c1/> é uma camada de geometria determinista e sem dependências. Um <c2/> é o <c3/> kepleriano analítico (dois corpos, opcionalmente J2 secular) ou um propagador <c4/> completo construído a partir de um conjunto completo de elementos de duas linhas; um gerador Walker-delta produz constelações sintéticas, e a visibilidade em linha de vista = ocultação pela Terra + máscara de elevação. O número de satélites visíveis corresponde a um estado GNSS (≥{ "4" } = nominal, { "1" }–{ "3" } = degradado, { "0" } = negado), e <c5/> transforma-o na cronologia de disponibilidade que conduz a execução normal de holdover do relógio. A disponibilidade é, assim, <em>derivada da geometria</em> e não definida à mão, enquanto a execução, o estimador e a pontuação permanecem inalterados.

# text
# c1: sgp4.rs
seg-da82c97ac5c8 = Uma constelação fornecida como TLE completos é propagada com o modelo SGP4/SDP4 em <c1/> (validado face aos vetores AIAA (American Institute of Aeronautics and Astronautics) 2006-6753); os elementos apenas da linha 2 mantêm o caminho analítico de dois corpos. Os dois podem ser combinados num mesmo bloco de constelação.

# text
seg-a47031620b54 = { "7" }. Ligações

# text
# c1: python.rs
# c2: wasm.rs
# c3: --features python
# c4: --features wasm
# c5: cargo deny --all-features
# c6: api::run_toml
# c7: web/
# c8: run
# c9: run_all
# c10: chart_svg
# c11: summary
# c12: table_csv
# c13: list_kinds
# c14: error_kind
# c15: version
# c16: encode_permalink
# c17: decode_permalink
# c18: export_sp3
# c19: export_omm
# c20: export_oem
# c21: api
# c22: mcp/kshana-mcp
# c23: rmcp
# c24: run_scenario
# c25: list_scenario_kinds
# c26: validate_scenario
# c27: list_example_scenarios
# c28: get_example_scenario
# c29: report_scenario
# c30: animate_scenario
# c31: list_export_formats
# c32: export_interop
# c33: import_route
# c34: export_sp3
# c35: export_omm
# c36: export_oem
# c37: export_table_csv
# c38: assess_receiver_log
# c39: bundled-scenarios
# c40: ide/jetbrains
# c41: kshana
seg-57fb29fdd9d9 = O núcleo compila-se sem alterações para nativo, para uma extensão Python e para WebAssembly. Os módulos Python (<c1/>, PyO3 abi3) e WebAssembly (<c2/>, wasm-bindgen) são dependências opcionais, condicionadas por funcionalidades (<c3/> / <c4/>): a compilação predefinida e o conjunto de testes nunca os compilam, ao passo que a barreira de auditoria de dependências (<c5/>) inspeciona as suas árvores de dependências, porque essas crates seguem dentro do wheel e do pacote npm. Ambos chamam <c6/>, pelo que todas as superfícies devolvem resultados idênticos. O módulo WebAssembly suporta o playground do navegador em <c7/> e exporta treze funções: <c8/>, <c9/> (uma execução do motor que devolve em conjunto o resultado, o gráfico, o resumo e a tabela), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, o codec de URL (URL: endereço web) partilhável <c16/> / <c17/> e os três exportadores <c18/> / <c19/> / <c20/> que suportam o menu de exportação do playground. Duas outras portas de entrada chegam à mesma <c21/>: o <b>servidor MCP (Model Context Protocol)</b> (<c22/>, uma crate <c23/> excluída do workspace que expõe quinze ferramentas — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; as duas ferramentas de exemplos leem os cenários incluídos através da funcionalidade <c39/> da biblioteca, desativada por predefinição, que só este servidor ativa) e o <b>plugin para o IDE (ambiente de desenvolvimento integrado) JetBrains</b> (<c40/>, um projeto Kotlin que invoca a CLI <c41/> em vez de ligar a biblioteca).

# text
# c1: --features python
# c2: --features wasm
# c3: --features bundled-scenarios
# c4: xval/*
seg-a6620e0d6eef = Condicionamento por funcionalidades: o Python e o WASM são <c1/> / <c2/>; a tabela de cenários incluídos é <c3/> (a única utilização que o servidor MCP faz dela); o servidor MCP e as verificações cruzadas <c4/> são crates EXCLUÍDAS do workspace; o plugin do IDE não liga nada — executa a CLI.

# text
seg-7bc5df56e4e5 = { "8" }. Determinismo e reprodutibilidade

# text
# c1: ChaCha8Rng
# c2: (scenario, seed, engine version) → identical bits
seg-fb95c37c7bb9 = Toda a aleatoriedade passa por um único <c1/> com semente por execução; a ordem dos passos é fixa, pelo que <c2/>.

# text
# c1: scenario_hash
# c2: scripts/check-reproducible.sh
seg-e026c87beb26 = O resultado inclui um <c1/> SHA-256 (SHA: Secure Hash Algorithm); <c2/> executa um cenário de referência duas vezes e confirma que a saída é idêntica byte a byte.

# text
# c1: wasm32-unknown-unknown
seg-42a3bdcbd99f = O mesmo motor compila-se para nativo, para uma extensão Python e para <c1/> para execuções no navegador que produzem os mesmos números.

# text
seg-12e00717c2d4 = { "9" }. Estrutura diferida / futura

# text
seg-8a8e1b93b704 = As camadas de astrodinâmica, fusão e alt-PNT da §1a — o propagador completo SGP4/SDP4, o propagador numérico de Cowell com o seu modelo de forças de sete perturbações e dois integradores adaptativos, a conceção de manobras/trajetórias, a determinação de órbita, os estimadores GNSS/INS de 15/8/17 estados, o filtro acoplado de relógio e posição e a correspondência de mapas gravíticos — foram todas entregues, a par da FoM de segurança com um demonstrador ativo de spoofing, da geometria real de TLE/multiconstelação, das bandas de Monte Carlo, das varreduras de estudos de compromisso, do relatório HTML (HyperText Markup Language) imprimível com o seu gémeo legível por máquina e dos fluxos de trabalho de lançamento/publicação/wheels/páginas.

# text
# c1: hybrid-ukf
seg-318ad50d3826 = Várias capacidades outrora listadas aqui como trabalho futuro foram entretanto <b>entregues</b> e estão descritas acima ou em <a1>VALIDATION</a1>: a nutação IAU 2000A completa e a redução GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) CIO, sem equinócio (validada bit a bit face ao SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), o geopotencial EGM2008 (Earth Gravitational Model { "2008" }) até ao grau/ordem { "70" }, o termo de arrastamento de referencial de <b>Lense–Thirring</b>, as marés sólidas/oceânicas/atmosféricas, uma validação cruzada de efemérides de nível DE (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um conjunto de ferramentas de geometria planetária em Rust puro)), a validação cruzada externa com o Orekit { "12.2" } do propagador numérico de Cowell ({ "0.08" } m ao longo de { "24" } h) e da determinação de órbita em lote e sequencial, e o navegador de 17 estados fortemente acoplado disponibilizado como o tipo de cenário <c1/>.

# text
# c1: [Unreleased]
# c2: .gfc
# c3: xval/high-degree-gravity/
# c4: space-weather
seg-068119b15b27 = Os restantes desenvolvimentos seguintes estão registados em <a1>CHANGELOG</a1> <c1/> e o roteiro por capacidade em <a2>CAPABILITY</a2>: um valor de referência independente externo para o avaliador de alto grau do EGM (Earth Gravitational Model) exatamente sobre o eixo polar e uma comparação limpa com o pyshtools perto do polo (o avaliador até ao grau { "2190" } e o seu carregador <c2/> em tempo de execução são entregues, MODELLED; ver <c3/>), um fator de meteorologia espacial variável no tempo para o nível opcional de densidade de arrastamento NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (a densidade de arrastamento predefinida é o modelo exponencial estático, e a densidade Jacchia-71 do tipo de cenário <c4/> é caracterizada face ao NRLMSISE-00, mas não substituída por ele), uma verificação externa da sombra opcional com escurecimento de bordo solar, o acoplamento forte GNSS/INS com fase da portadora e um mapa gravítico real EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) para o correlacionador de alt-PNT.

# text
# c1: ErrorModel
# c2: ExternalPack
seg-b48f69ea54b3 = Um repositório de camada privada contém a profundidade de resiliência sujeita a controlo de exportação; liga-se através da mesma interface <c1/> (e do contrato <c2/> da §{ "4" }) sem alterar o motor público.

# text
seg-2f88ab8f67e8 = <s1>Anterior</s1>Onde o Kshana é executado

# text
seg-02b0e0fdcdbe = <s1>Seguinte</s1>Onde o Kshana se insere
