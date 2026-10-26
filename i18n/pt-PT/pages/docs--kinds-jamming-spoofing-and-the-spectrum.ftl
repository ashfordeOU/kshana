# docs--kinds-jamming-spoofing-and-the-spectrum: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-98e740d32860 = Bancada de avaliação de deteção de degradações de RF por aprendizagem automática ({ "13494" }): gerar um corpus SINTÉTICO rotulado e fundamentado em parâmetros (nominal/jamming/spoof de tempo/spoof de posição/multipercurso), pontuar um detector (energy|agc|sqm|parity|fused) com a estrutura de teste agnóstica ao detector, e indicar AUC/ROC/confusão + Pd por classe num Pfa-alvo, além da lacuna de otimismo dentro versus fora da distribuição. Apenas características operacionais MODELLED — nunca dados de campo/IQ, sem veredito bom/mau.

# attr:alt
seg-7e7b07bc5545 = O gráfico que o motor gera para scenarios/impairment-eval.toml, tipo de cenário impairment-eval

# text
seg-60bf3f0ff000 = Jamming por balanço de enlace: J/S → C/N₀ efetivo → perda de sincronismo.

# attr:alt
seg-42d46b928d09 = O gráfico que o motor gera para scenarios/jamming-demo.toml, tipo de cenário jamming

# text
seg-fef00c827c6a = Modelo de espetro da banda L e cascata: toda a banda L do GNSS como uma única densidade espetral de potência (PSD), com a frequência na horizontal e o tempo na vertical, sobre uma cronologia de jammers com guião. SINAIS: GPS L1 C/A e L2C (BPSK({ "1" })), serviço aberto Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), cada um na sua portadora com a potência recebida mínima da especificação de interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), salvo indicação em contrário; GLONASS, BeiDou e Galileo E6 não são modelados. JAMMERS: tom de onda contínua, ruído plano de banda estreita, chirp linear em dente de serra e ruído de banda larga adaptado à modulação da própria banda, cada um com um centro, uma largura de banda, uma potência recebida (direta, ou EIRP e distância através da perda de percurso em espaço livre do tipo jamming) e instantes de ligação/desligamento. Cada jammer é avaliado em cada banda pelo seu coeficiente de separação espetral kappa sobre a largura de banda do recetor, e (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para um jammer, isto é igual à equação anti-jam do tipo jamming com Q = 1/(R_c kappa), e o relatório inclui essa verificação cruzada (e, a seu lado, o valor de Q representativo do tipo jamming). O patamar de ruído é k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }). A cascata faz a média de cada célula sobre o seu intervalo e a sua linha (chirps exatamente, varrimentos completos mais o parcial; jammers que comutam a meio da linha pelo seu ciclo de trabalho), de modo que a cronologia de C/N0 e a imagem vêm dos mesmos números; result.json inclui a grelha com média em blocos em potência, o C/N0 e o J/S por banda e por linha, e, por jammer e por banda, o SSC, Q, J/S, J/S em banda e C/N0 estável. [iq] opcional: o modelo desenhado como IQ complexo num instante, escrito e relido de uma gravação SigMF (cf32_le ou ci16_le), e comparado com uma estimativa de Welch. [recording] opcional (compilações nativas): a PSD de Welch de uma gravação SigMF real ao lado do modelo. VALIDATED: as PSD dos sinais face às larguras de lóbulo principal de manual (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos BOC({ "1,1" }) centrados em +/-1.023 MHz) e os coeficientes de separação espetral face às suas formas fechadas de Parseval e ao Q = { "1" } (CW) e { "1.5" } (adaptado) de Kaplan & Hegarty. MODELLED: as potências dos jammers, a cronologia, as larguras de banda do front-end, o tratamento de espetro contínuo (sem linhas de código) e a ausência de AGC, de blanking e de diagrama de antena.

# attr:alt
seg-ea1678eb9e84 = O gráfico que o motor escreve para scenarios/l-band-waterfall-jamming.toml, tipo spectrum

# text
seg-f43fe94d84e0 = Detetor combinado de spoofing por RF/medições (consistência RAIM multi-SV + AGC + SQM, fundidos) vs um ataque parametrizado (vantagem de potência, alinhamento de fase da portadora, empurrão de tempo/posição; ao estilo TEXBAT).

# attr:alt
seg-268ebf4cba99 = O gráfico que o motor escreve para scenarios/spoof-detect.toml, tipo spoof-detect

# text
seg-cbd77f6ffd63 = Detetor estocástico de spoofing de tempo (Neyman–Pearson / χ²₁) com P_fa/P_md de Monte Carlo.

# attr:alt
seg-6f6a8c975111 = O gráfico que o motor escreve para scenarios/spoof-attack.toml, tipo spoof

# text
seg-f6ff1c8c78db = Perda de bloqueio do laço de seguimento: C/N0 -> bloqueio/desbloqueio COM HISTERESE, o tempo que demora a perder o bloqueio e a captura por spoofing em função da TAXA de desvio de código e de portadora. Os critérios de negação e de captura já existentes no motor são razões de potência recebida (um jammer nega a J/S = { "30" } dB, um spoofer captura a { "3" } dB); a perda de bloqueio real não é uma razão de potência, é o ponto em que o jitter de um laço mais o esforço dinâmico saem do seu orçamento de limiar de seguimento. Indica ({ "1" }) o jitter térmico de 1 sigma da portadora (Costas) e do código (early/late não coerente) em função de C/N0, com a perda de quadratura incluída, face às regras indicadas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (a regra dos 15 graus em forma de três sigma) e { "3" }</em>sigma_DLL + atraso de rampa <= d/2 chips; ({ "2" }) os limiares de C/N0 de perda e de rebloqueio com o laço determinante identificado, o limiar de rebloqueio DERIVED da largura de banda mais larga com que um recetor volta a captar, em vez de afirmado, de modo que a largura da histerese tem de situar-se entre { "5" }<em>log10(razão) e { "10" }</em>log10(razão) dB; ({ "3" }) o tempo declarado até perder o bloqueio a partir de um detetor de bloqueio de dois limiares com tempos de permanência de confirmação, conduzido sobre uma rampa de C/N0, indicado em separado do tempo de escape de fase físico (o tempo médio de Viterbi entre deslizamentos de ciclo, em log10 s porque abrange centenas de décadas); ({ "4" }) os limites de captura por spoofing — a maior variação de código e a maior taxa de Doppler da portadora que os laços de uma vítima conseguem seguir, com um mapa sobre os dois eixos, porque um spoofer que varia mais depressa do que estes não captura o laço, ultrapassa-o; e ({ "5" }) o RAIO DE NEGAÇÃO que a dinâmica do laço implica, indicado EM PARALELO COM o raio de razão de potência existente, nunca em seu lugar, com a sua diferença com sinal como campo próprio com nome (denial_radius_delta_km) e uma definição ao lado. Cada campo numérico emitido inclui uma unidade e uma classe de proveniência. Formas fechadas VALIDATED: as expressões de jitter da portadora e do código, a redução do filtro de laço sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são verificados por comparação com o próprio correlador sdr do motor avançado sobre IF sintético com semente — um caminho diferente para os mesmos números — a { "0.6" } %, { "3.7" } % e { "0.17" } % respetivamente, e a Bessel I0 modificada subjacente ao tempo de deslizamento de ciclo face a valores tabelados padrão a { "1e-7" }. O limite inferior de validade é afirmado, não apenas indicado: abaixo de ~{ "32" } dB-Hz a { "1" } ms o discriminador atan real satura face ao seu intervalo +-pi/2 e mede menos jitter do que qualquer teoria linear. MODELLED: as larguras de banda dos laços, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de captura, os tempos de permanência de confirmação, a potência do jammer e os ganhos das antenas são valores representativos de banda, não uma ficha técnica. NÃO modelados: o jitter do oscilador (desvio de Allan) e da vibração, a limitação de largura de banda do front-end, o multipercurso, a dinâmica do AGC, a perda por transição de bits de dados, a assistência externa e qualquer correção de meio ciclo à fórmula de deslizamento de ciclo de Costas. Sob a dinâmica do laço, a captura por spoofing não tem qualquer raio — a restrição determinante é a taxa de desvio, não a potência — pelo que esse campo é nulo com uma razão, em vez de um número fabricado. Não é um produto certificado de desempenho de recetores.

# attr:alt
seg-72182c1aecd9 = O gráfico que o motor escreve para scenarios/tracking-loop.toml, tipo tracking-loop

# text
seg-4e31c8daf798 = Registo

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Fonte: <c1/>

# text
seg-d4ae70a5d619 = Jamming, spoofing e o espetro (família de tipos de cenário)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Páginas de tema: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Executar uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Folha de contactos dos gráficos que o motor escreve para os tipos da família Jamming, spoofing e o espetro

# text
seg-bbbd87f888b9 = Perda de bloqueio do laço de seguimento: C/N0 -> bloqueio/desbloqueio COM HISTERESE, o tempo que demora a perder o bloqueio e a captura por spoofing em função da TAXA de desvio de código e de portadora.

# text
seg-e37f1e071b2c = Modelo de espetro da banda L e cascata: toda a banda L do GNSS como uma única densidade espetral de potência (PSD), com a frequência na horizontal e o tempo na vertical, sobre uma cronologia de jammers com guião.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Plataforma de avaliação de deteção de degradações de RF por aprendizagem automática ({ "13494" }): gerar um corpus SINTÉTICO etiquetado e fundamentado em parâmetros (nominal/jamming/spoofing de tempo/spoofing de posição/multipercurso), pontuar um detetor (energia/agc/s

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
seg-7bb2f42902f0 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Campos obrigatórios: <c1/>. Opcionais: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spoof-detect</a1>.

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
seg-bd1b04ccfe22 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>tracking-loop</a1>.

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
seg-a73f44c04565 = <b>Registo:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>spectrum</a1>.

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
seg-d14fa8348a2a = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Anterior</s1>Fusão inercial e sensores quânticos

# text
seg-6b9b04e59491 = <s1>Seguinte</s1>Navegação em órbita terrestre baixa
