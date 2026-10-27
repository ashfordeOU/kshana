# docs--kind-hybrid-optical-rf: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
# c1: docs/kinds/by-kind/hybrid-optical-rf.md
seg-0482fec5b0f6 = Fonte: <c1/>

# text
# c1: hybrid-optical-rf
seg-830c574e871b = <c1/> (tipo de cenário)

# text
seg-72ad48275ebe = Tipo de cenário do motor v{ $version }, família <a1>PNT ótico</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-e6839b50b560 = Figura de mérito conjunta de PNT ótico + RF heterogéneo MODELLED (P5): compõe o balanço de enlace ótico bidirecional de { "1550" } nm (CRLB de medição de distância bidirecional limitada por fótons σ_τ/√N e pegada de difração λ/D·distância), um nível de proteção RAIM de separação de soluções entre modalidades (posição E temporização) que funde as soluções de RF frouxa e ótica estreita com covariâncias díspares, a disponibilidade de céu claro ótica de N estações (união independente { "1" }−Π({ "1" }−a_i) e uma variante espacialmente correlacionada), uma transferência de estado/covariância ótico↔RF com uma média COMPROVADAMENTE contínua bit a bit (sem salto) e uma barreira de consistência NEES χ², e uma pontuação conjunta de P(disponível E de grau de precisão E com integridade assegurada) com tratamento de correlação. Forma fechada VALIDATED: o CRLB de medição de distância, a pegada de difração, o quantil de nível de proteção χ², a combinatória da união, a continuidade da média da transferência + a barreira NEES e o produto independente conjunto. MODELLED: as alocações de perda ótica, as magnitudes de σ de RF/ótico, as entradas de climatologia de nuvens, as correlações e o orçamento de P_HMI. Não é um produto de disponibilidade/integridade certificado.

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-30904e2367fc = Uma execução de <c1/> resume-se assim: hybrid-optical-rf | pegada ótica { "700" } m, { "1489" } fótons -> σ de medição de distância { "0.194" } mm, σ de temporização { "1.30" } ps | HPL do cross-RAIM { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protegido) | disponibilidade { "99.5" }% ({ "5" } locais) | transferência sem salto OK NEES { "3.34" }∈[0.48,{ "11.14" }] dentro da barreira | FoM conjunta { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | CRLB/χ²-PL/união/transferência validados, σ/climatologia modelados

# text
# c1: wavelength_nm
# c2: tx_power_w
# c3: tx_aperture_m
# c4: rx_aperture_m
# c5: range_km
# c6: pulse_rms_ps
# c7: integration_s
# c8: atmospheric_loss_db
# c9: pointing_loss_db
# c10: optics_efficiency
# c11: detector_efficiency
# c12: two_way
# c13: rf_pos_sigma_m
# c14: rf_vertical_sigma_m
# c15: rf_clock_sigma_s
# c16: p_fa
# c17: p_md
# c18: alert_limit_h_m
# c19: alert_limit_v_m
# c20: alert_limit_t_s
# c21: grade_pos_m
# c22: grade_time_s
# c23: n_optical_sites
# c24: site_correlation
# c25: fom_correlation
# c26: handoff_inflation
# c27: p_hmi
# c28: fault_ramp_rate_pos_m_s
# c29: fault_ramp_rate_clock_s_s
# c30: process_noise_pos_psd_m2_s
# c31: process_noise_clock_psd_s2_s
# c32: coast_coverage_k
# c33: rf_band
# c34: rf_eirp_dbw
# c35: rf_g_over_t_db
# c36: rf_other_losses_db
# c37: rf_data_rate_bps
# c38: rf_required_eb_n0_db
# c39: rf_chip_rate_hz
# c40: rf_correlator_spacing_chips
# c41: rf_dll_bandwidth_hz
# c42: rf_tracking_threshold_dbhz
# c43: rf_degraded_margin_db
seg-73e5cf56c92c = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-27338c8b2e5f = O exemplo <c1/> define, entre outros:

# text
seg-7b9ce4689508 = Rótulo do resultado (o do motor): figura de mérito conjunta de disponibilidade / precisão / integridade de PNT ótico + RF heterogéneo (P5). Forma fechada VALIDATED: o CRLB de medição de distância limitada por fótons (σ_τ/√N) e a pegada de difração (λ/D·distância), o quantil de nível de proteção χ² entre modalidades, a disponibilidade de união independente de N estações ({ "1" } − Π(

# attr:alt
seg-5cea5229815e = O gráfico que o motor gera para scenarios/hybrid-optical-rf.toml, tipo de cenário hybrid-optical-rf

# text
# c1: variance
seg-a8923a682728 = <b>MODELLED</b> O relatório hybrid-optical-rf declara a configuração de enlace com a qual de facto foi executado (comprimento de onda da portadora, abertura de transmissão e de receção, distância, largura de pulso, integração. Referência independente (InternalConsistency): Nenhuma referência independente externa, e nenhuma é possível: isto é autodescrição, não uma medição. É registada porque a sua ausência era um defeito -- o P5 tinha de citar o comprimento de onda da portadora e a abertura de transmissão a partir de valores predefinidos do código-fonte, e de inferir que um <c1/> sem unidade estava em metros quadrados a partir de uma verificação de consistência interna. A inferência estava correta, e é justamente por isso que importava: nada teria detetado que estivesse err

# text
seg-28abb5a84eaa = <b>MODELLED</b> O relatório hybrid-optical-rf declara uma disponibilidade de enlace de RF, composta a partir de grandezas que o motor já calcula em vez de uma climatologia importada, e . Referência independente (InternalConsistency): Nenhuma referência independente externa, e ExternalDataset é recusado. As duas entradas são uma margem de Eb/N0 e um cruzamento de limiar de C/N0, ambos funções de uma EIRP, de uma figura de mérito e de uma alocação de perdas agregadas MODELLED; não existe um registo medido de disponibilidade de um serviço híbrido ótico/RF Terra-Lua com o qual conferir a figura composta. As verificações que existem são internas e são declaradas como tais: a composição é recalculada a partir da r

# text
seg-888004543d37 = <b>MODELLED</b> O relatório hybrid-optical-rf emite a razão de precisão de medição de distância ótico-versus-RF com a ÚNICA configuração na qual os dois ramos foram avaliados contida no mesmo objeto: o mesmo. Referência independente (InternalConsistency): Nenhuma referência independente externa para a RAZÃO, e ExternalDataset é recusado deliberadamente. A cadeia de RF subjacente tem uma -- tests/validate_p5_rf_ranging_precision.rs confere linkbudget::link_budget e navsignal::dll_code_jitter_chips contra um fixture independente em Python/NumPy e contra o valor trabalhado de Kaplan & Hegarty fixado no código ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz) -- e o CRLB ótico tem a sua própria linha de forma fechada

# text
seg-db5ff373b50f = <b>MODELLED</b> O relatório hybrid-optical-rf declara o que o monitor de qui-quadrado entre modalidades de facto consegue DETETAR, e não apenas que ele passa num caso sem falhas: o mínimo detetável. Referência independente (InternalConsistency): Duas referências independentes internas, nenhum conjunto de dados externo. ({ "1" }) Ida e volta em forma fechada: o viés mínimo detetável é produzido por inversão da cauda do qui-quadrado não central sobre a não centralidade (raim::pbias) e é verificado ao devolver a não centralidade resultante por raim::noncentral_chi2_cdf ao limiar do próprio monitor, o que deve devolver P_md. ({ "2" }) Injeção contra análise: um viés é escrito na estimativa de RF de um eixo

# text
# c1: label
seg-24f31f6b353f = Figura de mérito conjunta de disponibilidade / precisão / integridade de PNT ótico + RF heterogéneo (P5). Forma fechada VALIDATED: o CRLB de medição de distância limitada por fótons (σ_τ/√N) e a pegada de difração (λ/D·distância), o quantil de nível de proteção χ² entre modalidades, a disponibilidade de união independente de N estações ({ "1" } − Π({ "1" }−a_i)), o invariante de continuidade da média da transferência ótico↔RF (sem salto, bit a bit) e a barreira NEES χ², e o FoM conjunto inde (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-bec90783ad8b = Figura de mérito conjunta de PNT ótico + RF heterogéneo MODELLED (P5): compõe o balanço de enlace ótico bidirecional de { "1550" } nm (CRLB de medição de distância bidirecional limitada por fótons σ_τ/√N e pegada de difração λ/D·distância), um nível de proteção RAIM de separação de soluções entre modalidades (posição E temporização) que funde as soluções de RF frouxa e ótica estreita com covariâncias díspares, a disponibilidade de céu claro ótica de N estações (união independente (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-15abc895e477 = MODELLED: as alocações de perda ótica, as magnitudes de σ de RF/ótico, as entradas de climatologia de nuvens, as correlações e o orçamento de P_HMI. (catálogo de tipos de cenário (<c1/>))

# text
seg-9fafa5ffb521 = MODELLED. Formas fechadas validadas: CRLB de medição de distância (sigma_tau/sqrt(N)), pegada de difração (lambda/D * distância), quantil de nível de proteção qui-quadrado, combinatória da união, continuidade da média da transferência + barreira NEES, e o produto independente conjunto. As alocações de perda, as magnitudes de sigma, as entradas de climatologia de nuvens, as correlações e o orçamento de P_HMI são entradas representativas modeladas. Cada campo abaixo é opcional e mostrado no seu (comentário do ficheiro de cenário, linhas { "10" } a { "14" })

# text
seg-e5f964e5d422 = --- G15 injeção de falha de viés / rampa contra o monitor entre modalidades --- O viés mínimo detetável e a curva de poder de deteção são ANALÍTICOS (inversão do qui-quadrado não central), de modo que não precisam de entradas próprias. Estes dois apenas definem a taxa de rampa da qual o tempo até à deteção indicado é uma conversão. Ambos MODELLED. (comentário do ficheiro de cenário, linhas { "56" } a { "59" })

# text
seg-70f50a62aa12 = --- G17 inércia pós-transferência: ruído de processo e cruzamento do limite de alerta --- Passeio aleatório sobre o filtro de transferência existente de 4 estados (leste, norte, cima, relógio). Os limites de alerta são os já declarados acima; apenas o ruído de processo e o fator de cobertura são novos. Ambas as PSDs são entradas representativas MODELLED e os tempos de cruzamento escalam diretamente com elas. (comentário do ficheiro de cenário, linhas { "63" } a { "67" })

# text
seg-9fb4240fb0ef = A autodescrição do relatório híbrido ótico/RF é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a97755cb13eb = Página da família: <a1>PNT ótico</a1>

# text
seg-1586d90cdf1b = <s1>Anterior</s1>holdover-test

# text
seg-211275a00df0 = <s1>Seguinte</s1>hybrid-ukf
