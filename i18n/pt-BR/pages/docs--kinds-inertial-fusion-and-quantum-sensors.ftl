# docs--kinds-inertial-fusion-and-quantum-sensors: translations (pt-BR)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT por fusão de sensores com filtro de Kalman conjunto sobre as mesmas entradas híbridas.

# attr:alt
seg-c8a1c797f4b1 = O gráfico que o motor gera para scenarios/fusion-pnt.toml, tipo de cenário fusion

# text
seg-38df285a3f25 = EKF de estado de erro GNSS/INS com acoplamento fraco e forte.

# attr:alt
seg-7d993b676006 = O gráfico que o motor gera para scenarios/gnss-ins.toml, tipo de cenário gnss-ins

# text
seg-c6edf89eb8d4 = UKF GNSS/INS híbrido quântico+clássico com acoplamento forte e 17 estados (MODELLED): { "15" } estados de erro do INS + correção de viés do acelerômetro derivada de CAI + um relógio de 2 estados (fase+frequência) do motor de relógio de parâmetros q, conduzido pelo modelo de erro de CAI em faixa. A figura de mérito é a autoconsistência do filtro (NEES + brancura da inovação contra limites de χ²) — uma declaração de autoconsistência, NÃO uma garantia de exatidão no mundo real. Apenas simulação; sem TRL>{ "3" }, sem herança de voo, sem validação externa.

# attr:alt
seg-2968660fa880 = O gráfico que o motor gera para scenarios/hybrid-ukf.toml, tipo de cenário hybrid-ukf

# text
seg-22cd963c7042 = Capstone de PNT híbrido: relógio + IMU + auxílio por transferência de tempo.

# attr:alt
seg-52378a7b074c = O gráfico que o motor gera para scenarios/hybrid-pnt.toml, tipo de cenário hybrid

# text
seg-bdedf28adc48 = Navegação inercial por estima em 1-DOF durante uma interrupção do GNSS.

# attr:alt
seg-873c402bb724 = O gráfico que o motor gera para scenarios/imu-deadreckoning.toml, tipo de cenário inertial

# text
seg-5b9a6efe6337 = Modelo de erro de INS/TRN em inércia: erro de posição em função da duração da inércia, construído a partir de coeficientes da IMU em vez de varrido como uma taxa de deriva presumida. Cinco contribuições de crescimento — viés do acelerômetro, inclinação por viés do giroscópio através da gravidade, passeio aleatório de velocidade, passeio aleatório de ângulo e fator de escala em função da distância percorrida — cada uma propagada por um modelo de erro inercial de nove estados em nível local com realimentação de Schuler a uma latitude e altura declaradas (as leis de ordem dominante para inércia curta t², t³, t^{ "1.5" }, t^{ "2.5" } e t¹/t² são informadas ao lado) e combinadas sob uma regra DECLARADA (raiz da soma dos quadrados por padrão, ou soma linear, ou soma determinística com rss estocástico; as três são calculadas em toda execução, de modo que a escolha fica visível em vez de enterrada). As durações de inércia que atingem limiares de posição fornecidos pelo chamador ({ "10" } m e { "50" } m por padrão) são localizadas pela bisseção já existente no motor, cada uma com um detalhamento por contribuição que nomeia a fonte dominante, e o cruzamento de cada contribuição isolada é, além disso, invertido algebricamente para que os dois coincidam. Um modo de navegação relativa ao terreno limita a inércia com correções de posição periódicas e informa o maior intervalo entre correções que mantém cada limiar; uma correção apenas de posição deixa o erro de velocidade e a inclinação vivos através da correção, de modo que nem sempre limita a inércia, seja qual for a taxa de correções, e o relatório diz isso em vez de devolver um zero. MODELLED: os coeficientes de classe da IMU são valores representativos de faixa, não de uma folha de dados, e o resíduo da correção de terreno é uma entrada. Um limiar não alcançado é informado como nulo com um status, nunca como zero. Não é um produto de desempenho de navegação inercial certificado.

# attr:alt
seg-134a4c91da3a = O gráfico que o motor gera para scenarios/ins-trn-coast.toml, tipo de cenário ins-trn-coast

# text
seg-04310cd6cbec = Detecção de falhas/anomalias MODELLED para sistemas PNT quânticos: um catálogo rotulado de falhas (salto de frequência/deriva/perda de sincronismo do relógio; salto de viés/perda de dados do sensor), uma AUC ROC da estatística de detecção (com um IC bootstrap a partir do eval_stats validado externamente) e uma falha mínima detectável a uma taxa fixa de falso alarme, com o monitor auxiliado por relógio quântico (menor ruído) detectando falhas menores — como TradeEvidence honesto + representatividade. Modelo gaussiano da estatística de detecção (AUC = Phi(mu/(sigma*sqrt2))); modela a classe, com parâmetros ilustrativos de fonte pública, sem TRL, voo nem certificação.

# attr:alt
seg-2f1d14239d1a = O gráfico que o motor escreve para scenarios/quantum-anomaly-detect.toml, tipo de cenário quantum-anomaly-detect

# text
seg-790fbfdd80f0 = Navegação quântica sem GNSS, MODELLED: durante uma interrupção do GNSS, um orçamento inercial quântico (interferômetro de átomos frios) contra um INS clássico de grau de navegação — crescimento do erro de posição ao longo da deriva, holdover até um limiar de posição e a comparação quântico-versus-clássico como TradeEvidence honesto, com representatividade. Nota honesta de observabilidade: sem solução externa, o viés do acelerômetro é não observável, de modo que o erro cresce; o sensor quântico desacelera essa diferença, mas não a fecha. Parâmetros ilustrativos de dispositivo de fonte pública; modela a classe, sem TRL, voo nem certificação.

# attr:alt
seg-1bdbf1a737b2 = O gráfico que o motor escreve para scenarios/quantum-gnss-free-nav.toml, tipo de cenário quantum-gnss-free-nav

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Comparação PNT quântico-versus-clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o ponto central da defensabilidade — ou uma classe de relógio quântico) contra uma classe clássica de linha de base, com a ressalva da hipótese de piso de tau longo carregada no artefato, mais um envelope de resiliência contra o tempo sem GNSS. MODELLED; quantifica (nunca valida) um dispositivo do parceiro. O relógio candidato é uma curva medida (<c1/> + <c2/>, de igual comprimento, com pelo menos { "2" } pontos; ela prevalece quando as duas formas são dadas) ou uma <c3/>.

# attr:alt
seg-c74c63ffd859 = O gráfico que o motor escreve para scenarios/quantum-trade.toml, tipo de cenário quantum-trade

# text
seg-4e31c8daf798 = Registro

# text
seg-9095869ec445 = { "9" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
seg-efd15cff3d32 = MODELLED (rótulo do resultado)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Fonte: <c1/>

# text
seg-23762f3a250b = Sensores inerciais, de fusão e quânticos (família de tipos de cenário)

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Páginas de tópico: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Execute uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-0e73a37b716b = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Sensores inerciais, de fusão e quânticos

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = UKF GNSS/INS fortemente acoplado híbrido quântico+clássico de 17 estados (MODELLED): { "15" } estados de erro do INS + correção de viés de acelerômetro derivada de CAI + um relógio de 2 estados (fase+frequência) do mecanismo de relógio de parâmetros q

# text
seg-a7d3c32b29b3 = Modelo de erro de deslocamento inercial INS/TRN: erro de posição em função da duração do deslocamento, construído a partir de coeficientes da IMU em vez de varrido como uma taxa de deriva assumida.

# text
seg-beb568dec44f = Navegação quântica sem GNSS MODELLED: durante uma interrupção do GNSS, um orçamento inercial quântico (interferômetro de átomos frios) versus um INS clássico de grau de navegação — crescimento do erro de posição ao longo do deslocamento, holdover t

# text
seg-d948ea4d1f33 = Detecção de falhas/anomalias MODELLED para sistemas de PNT quântico: um catálogo rotulado de falhas (salto/deriva de frequência do relógio/perda de travamento; degrau de viés/perda de sinal do sensor), uma AUC da ROC da estatística de detecção (com um IC bootstrap

# text
seg-48e72d451a50 = Comparação de PNT quântico versus clássico ({ "13503" }): benefício de holdover de temporização + holdover inercial de um relógio candidato (uma curva de ADEV medida — o ponto de defensabilidade — ou uma classe de relógio quântico) contra uma linha de base clássica

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionais: <c7/>.

# text
seg-75867e8b4b4f = <b>Registro:</b> MODELLED { "6" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>inertial</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-fdf140d4ce68 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>hybrid</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
# c11: coupled
seg-3246c9e1e0cb = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcionais: <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Registro:</b> MODELLED { "4" } · VALIDATED { "4" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>fusion</a1>.

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
# c6: residual_accel_bias_m_s2
# c7: speed_m_s
# c8: sigma_pr_m
# c9: sigma_rr_mps
# c10: consistency_seeds
# c11: q_factor
# c12: r_factor
seg-d0790a2643ae = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcionais: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-85ab600e3050 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>hybrid-ukf</a1>.

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
# c7: fix_interval_s
# c8: sigma_pos_m
# c9: sigma_vel_mps
# c10: lat_deg
# c11: lon_deg
# c12: alt_m
# c13: trajectory
# c14: tight
seg-3bbd5ce09bee = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionais: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-08ad3969f65b = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>gnss-ins</a1>.

# text
# c1: imu_grade
# c2: accel_bias_ug
# c3: accel_vrw_m_s_per_sqrt_hr
# c4: accel_scale_factor_ppm
# c5: gyro_bias_deg_per_hr
# c6: gyro_arw_deg_per_sqrt_hr
# c7: speed_m_s
# c8: ref_accel_m_s2
# c9: latitude_deg
# c10: height_m
# c11: combination
# c12: crossing_thresholds_m
# c13: grades
# c14: drift_band_lo_m_per_s
# c15: drift_band_hi_m_per_s
# c16: trn_fix_mode
# c17: trn_fix_interval_s
# c18: trn_fix_residual_m
# c19: mission_duration_s
seg-1703619ca20e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Registro:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-b05e96ce392d = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>quantum-gnss-free-nav</a1>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-cbefb1538dec = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>quantum-anomaly-detect</a1>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionais: <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Anterior</s1>PNT alternativo sem GPS

# text
seg-0585e4ae329e = <s1>Seguinte</s1>Jamming, spoofing e o espectro
