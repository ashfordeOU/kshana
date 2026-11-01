# docs--kinds-jamming-spoofing-and-the-spectrum: translations (pt-BR)

# text
seg-b03d56f501c3 = Tipo

# text
seg-98e740d32860 = Bancada de avaliação de detecção de degradações de RF por aprendizado de máquina ({ "13494" }): gerar um corpus SINTÉTICO rotulado e fundamentado em parâmetros (nominal/jamming/spoof de tempo/spoof de posição/multipercurso), pontuar um detector (energy|agc|sqm|parity|fused) com a estrutura de teste agnóstica ao detector, e informar AUC/ROC/confusão + Pd por classe em um Pfa-alvo, além da lacuna de otimismo dentro versus fora da distribuição. Apenas características operacionais MODELLED — nunca dados de campo/IQ, sem veredito bom/ruim.

# attr:alt
seg-7e7b07bc5545 = O gráfico que o motor gera para scenarios/impairment-eval.toml, tipo de cenário impairment-eval

# text
seg-60bf3f0ff000 = Jamming por balanço de enlace: J/S → C/N₀ efetivo → perda de sincronismo.

# attr:alt
seg-42d46b928d09 = O gráfico que o motor gera para scenarios/jamming-demo.toml, tipo de cenário jamming

# text
seg-fef00c827c6a = Modelo de espectro da banda L e cascata (waterfall): toda a banda L do GNSS como uma única densidade espectral de potência (PSD), frequência na horizontal, tempo na vertical, ao longo de uma linha do tempo de jammers roteirizada. SINAIS: GPS L1 C/A e L2C (BPSK({ "1" })), serviço aberto Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), cada um em sua portadora com a potência recebida mínima da especificação de interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), salvo substituição; GLONASS, BeiDou e Galileo E6 não são modelados. JAMMERS: tom de onda contínua, ruído de banda estreita plano, chirp linear em dente de serra e ruído de banda larga casado com a própria modulação de uma banda, cada um com um centro, uma largura de banda, uma potência recebida (direta, ou EIRP e distância pela perda de percurso em espaço livre do tipo jamming) e instantes de ligar/desligar. Cada jammer é avaliado contra cada banda pelo seu coeficiente de separação espectral kappa sobre a largura de banda do receptor, e (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para um jammer isso é igual à equação anti-jam do tipo jamming com Q = 1/(R_c kappa), e o relatório traz essa verificação cruzada (e, ao lado, o valor de Q representativo do tipo jamming). O piso de ruído é k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }). A cascata faz a média de cada célula sobre o seu bin e a sua linha (chirps exatamente, varreduras inteiras mais a parcial; jammers que comutam no meio da linha pelo seu ciclo de trabalho), de modo que a linha do tempo de C/N0 e a imagem vêm dos mesmos números; result.json traz a grade com média de blocos em potência, C/N0 e J/S por banda em cada linha, e por jammer e por banda o SSC, Q, J/S, J/S em banda e C/N0 em regime. [iq] opcional: o modelo gerado como IQ complexo em um instante, gravado e relido de uma gravação SigMF (cf32_le ou ci16_le), e comparado com uma estimativa de Welch. [recording] opcional (compilações nativas): a PSD de Welch de uma gravação SigMF real ao lado do modelo. VALIDATED: as PSDs dos sinais contra as larguras de lóbulo principal dos livros-texto (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados em +/-1.023 MHz) e os coeficientes de separação espectral contra suas formas fechadas de Parseval e contra o Q = { "1" } (CW) e { "1.5" } (casado) de Kaplan & Hegarty. MODELLED: potências dos jammers, linha do tempo, larguras de banda do front-end, o tratamento de espectro contínuo (sem linhas de código) e a ausência de AGC, blanking e diagrama de antena.

# attr:alt
seg-ea1678eb9e84 = O gráfico que o mecanismo gera para scenarios/l-band-waterfall-jamming.toml, tipo spectrum

# text
seg-f43fe94d84e0 = Detector combinado de spoofing por RF/medições (consistência RAIM multi-SV + AGC + SQM, fundidos) contra um ataque parametrizado (vantagem de potência, alinhamento de fase da portadora, deslocamento de tempo/posição; estilo TEXBAT).

# attr:alt
seg-268ebf4cba99 = O gráfico que o mecanismo gera para scenarios/spoof-detect.toml, tipo spoof-detect

# text
seg-cbd77f6ffd63 = Detector estocástico de spoofing de tempo (Neyman–Pearson / χ²₁) com P_fa/P_md de Monte Carlo.

# attr:alt
seg-6f6a8c975111 = O gráfico que o mecanismo gera para scenarios/spoof-attack.toml, tipo spoof

# text
seg-f6ff1c8c78db = Perda de travamento do loop de rastreamento: C/N0 -> travado/destravado COM HISTERESE, o tempo para perder o travamento e o pull-in de spoofing em função da TAXA de deslocamento de código e de portadora. Os critérios existentes do mecanismo de negação e de captura são razões sobre a potência recebida (um jammer nega a J/S = { "30" } dB, um spoofer captura a { "3" } dB); a perda de travamento real não é uma razão de potência, é onde o jitter de um loop mais o estresse dinâmico excedem o seu orçamento de limiar de rastreamento. Informa ({ "1" }) o jitter térmico de 1 sigma de portadora (Costas) e de código (early/late não coerente) em função de C/N0, com a perda por elevação ao quadrado incluída, contra as regras declaradas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (a regra dos 15 graus na forma de três sigmas) e { "3" }</em>sigma_DLL + atraso de rampa <= d/2 chips; ({ "2" }) os limiares de C/N0 de queda e de retravamento com o loop determinante indicado, o limiar de retravamento DERIVED da largura de banda maior em que um receptor refaz o pull-in em vez de afirmado, de modo que a largura da histerese deve ficar entre { "5" }<em>log10(razão) e { "10" }</em>log10(razão) dB; ({ "3" }) o tempo declarado para perder o travamento a partir de um detector de travamento de dois limiares com permanências de confirmação, conduzido ao longo de uma rampa de C/N0, informado separadamente do tempo físico de escape de fase (o tempo médio de Viterbi entre saltos de ciclo, em log10 s porque abrange centenas de décadas); ({ "4" }) limites de pull-in de spoofing — a maior variação de código e a maior taxa de Doppler de portadora que os loops de uma vítima conseguem seguir, com um mapa sobre os dois eixos, porque um spoofer que varia mais rápido do que isso não captura o loop, ele o ultrapassa; e ({ "5" }) o RAIO DE NEGAÇÃO que a dinâmica do loop implica, informado JUNTO com o raio existente de razão de potência, nunca em seu lugar, com a diferença com sinal entre eles como um campo próprio nomeado (denial_radius_delta_km) e uma definição ao lado. Todo campo numérico emitido traz uma unidade e uma classe de proveniência. Formas fechadas VALIDATED: as expressões de jitter de portadora e de código, a redução do filtro de loop sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são conferidos com o próprio correlador sdr do mecanismo avançado sobre IF sintética com semente — um caminho diferente para os mesmos números — a { "0.6" } %, { "3.7" } % e { "0.17" } % respectivamente, e a Bessel modificada I0 por trás do tempo de salto de ciclo contra valores tabelados padrão a { "1e-7" }. O limite inferior de validade é afirmado, não apenas declarado: abaixo de ~{ "32" } dB-Hz a { "1" } ms o discriminador atan real satura contra o seu intervalo de +-pi/2 e mede menos jitter do que qualquer teoria linear. MODELLED: as larguras de banda dos loops, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de pull-in, as permanências de confirmação, a potência do jammer e os ganhos de antena são valores representativos da banda, não um datasheet. NÃO modelados: jitter do oscilador (desvio de Allan) e de vibração, limitação de largura de banda do front-end, multipercurso, dinâmica do AGC, perda por transição de bit de dados, auxílio externo e qualquer correção de meio ciclo na fórmula de salto de ciclo de Costas. Sob a dinâmica do loop, a captura por spoofing não tem raio algum — a restrição determinante é a taxa de deslocamento, não a potência — de modo que esse campo é nulo, com um motivo, em vez de um número fabricado. Não é um produto certificado de desempenho de receptor.

# attr:alt
seg-72182c1aecd9 = O gráfico que o mecanismo gera para scenarios/tracking-loop.toml, tipo tracking-loop

# text
seg-4e31c8daf798 = Registro

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Fonte: <c1/>

# text
seg-d4ae70a5d619 = Jamming, spoofing e o espectro (família de tipos de cenário)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Páginas de tópico: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Execute uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Jamming, spoofing e o espectro

# text
seg-bbbd87f888b9 = Perda de travamento do loop de rastreamento: C/N0 -> travado/destravado COM HISTERESE, o tempo para perder o travamento e o pull-in de spoofing em função da TAXA de deslocamento de código e de portadora.

# text
seg-e37f1e071b2c = Modelo de espectro da banda L e cascata (waterfall): toda a banda L do GNSS como uma única densidade espectral de potência (PSD), frequência na horizontal, tempo na vertical, ao longo de uma linha do tempo de jammers roteirizada.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Banco de testes de avaliação de detecção de degradações de RF por aprendizado de máquina ({ "13494" }): gera um corpus SINTÉTICO rotulado e fundamentado em parâmetros (nominal/jamming/spoof de tempo/spoof de posição/multipercurso), avalia um detector (energy/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionais: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Campos obrigatórios: <c1/>. Opcionais: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spoof-detect</a1>.

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-c65b9d45bdcc = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>tracking-loop</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-5024b537d000 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Anterior</s1>Fusão inercial e sensores quânticos

# text
seg-6b9b04e59491 = <s1>Seguinte</s1>Navegação em órbita baixa da Terra
