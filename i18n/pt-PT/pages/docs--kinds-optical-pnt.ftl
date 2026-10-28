# docs--kinds-optical-pnt: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-e6839b50b560 = Figura de mérito conjunta de PNT ótico + RF heterogéneo MODELLED (P5): compõe o balanço de enlace ótico bidirecional de { "1550" } nm (CRLB de medição de distância bidirecional limitada por fótons σ_τ/√N e pegada de difração λ/D·distância), um nível de proteção RAIM de separação de soluções entre modalidades (posição E temporização) que funde as soluções de RF frouxa e ótica estreita com covariâncias díspares, a disponibilidade de céu claro ótica de N estações (união independente { "1" }−Π({ "1" }−a_i) e uma variante espacialmente correlacionada), uma transferência de estado/covariância ótico↔RF com uma média COMPROVADAMENTE contínua bit a bit (sem salto) e uma barreira de consistência NEES χ², e uma pontuação conjunta de P(disponível E de grau de precisão E com integridade assegurada) com tratamento de correlação. Forma fechada VALIDATED: o CRLB de medição de distância, a pegada de difração, o quantil de nível de proteção χ², a combinatória da união, a continuidade da média da transferência + a barreira NEES e o produto independente conjunto. MODELLED: as alocações de perda ótica, as magnitudes de σ de RF/ótico, as entradas de climatologia de nuvens, as correlações e o orçamento de P_HMI. Não é um produto de disponibilidade/integridade certificado.

# attr:alt
seg-5cea5229815e = O gráfico que o motor gera para scenarios/hybrid-optical-rf.toml, tipo de cenário hybrid-optical-rf

# text
seg-a878d9be65b7 = PNT ótico MODELLED através da atmosfera: para uma ligação ótica e um conjunto de locais em terra com climas de nuvens indicados, indica a perda em céu limpo dependente do comprimento de onda e da elevação (lei de visibilidade de Kim mais Rayleigh), o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, parâmetros gama-gama, média de abertura), a disponibilidade determinada pelo tempo meteorológico face à margem da ligação (profundidade ótica das nuvens a partir de um clima de água líquida log-normal, extinção de ótica geométrica, desvanecimento por turbulência independente), a margem de ligação necessária para disponibilidades-alvo, a distribuição da duração das interrupções, o crescimento do erro de temporização e de medição de distâncias por interrupção através do modelo de holdover do relógio, a disponibilidade de diversidade de locais correlacionada pela distância e os ganhos hipotéticos de técnicas de melhoramento (comprimento de onda, abertura de receção, redução da cintilação por ótica adaptativa, margem adicional). VALIDATED como implementação das fórmulas indicadas face a uma referência independente mpmath: variância de Rytov, índice de cintilação, probabilidade de desvanecimento gama-gama, fator de média de abertura, profundidade ótica das nuvens e do céu limpo. MODELLED: toda a entrada meteorológica, de técnica e de relógio e os pressupostos de independência e de cópula; não foi comparado nenhum registo de disponibilidade medida. Análise de caráter consultivo, não um produto certificado de disponibilidade nem de navegação.

# attr:alt
seg-4e2b759aff17 = O gráfico que o motor escreve para scenarios/optical-atmosphere-network.toml, tipo de cenário optical-atmosphere

# text
seg-4e31c8daf798 = Registo

# text
# c1: docs/kinds/optical-pnt.md
seg-963749981a7c = Fonte: <c1/>

# text
seg-079c8b284c44 = PNT ótica (família de tipos de cenário)

# text
seg-6dea687b727b = { "2" } tipos de cenário do motor v{ $version }. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção de evidências do README).

# text
# c1: kshana scenarios/optical-atmosphere-network.toml
seg-d019c8511f48 = Páginas temáticas: <a1>OPTICAL-ATMOSPHERE</a1>. Executar um: <c1/>. Todas as famílias: <a2>KINDS.md</a2>.

# attr:alt
seg-b8f937411028 = Folha de contacto dos gráficos que o motor escreve para os tipos de cenário da família PNT ótica

# text
seg-76131e6805e5 = PNT ótica MODELLED através da atmosfera: para uma ligação ótica e um conjunto de estações em terra com climas de nebulosidade indicados, indica a perda em céu limpo dependente do comprimento de onda e da elevação (visibilidade de Kim

# text
seg-55725043f48e = Figura de mérito conjunta MODELLED de PNT ótico + RF heterogéneo (P5): compõe o orçamento de ligação ótica bidirecional de { "1550" } nm (CRLB da medição de distância bidirecional limitada por fotões σ_τ/√N e pegada de difração λ/D·distância), um

# text
seg-5e658f01d9f4 = HETEROGENEOUS (rótulo de resultado)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-750466e3188c = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-9e3ce423c0b9 = <b>Registo:</b> MODELLED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>optical-atmosphere</a1>.

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
seg-93f5d0527850 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

# text
seg-6a6f8eea5767 = <b>Registo:</b> nenhuma linha da matriz refere este tipo; o motor etiqueta o seu próprio resultado. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>hybrid-optical-rf</a1>.

# text
seg-a4baaf1fbb8c = <s1>Anterior</s1>Ligações de análise de missão e operações espaciais

# text
seg-48792381ba0b = <s1>Seguinte</s1>Navegação de utilizadores espaciais

# text
seg-22449071fb11 = <s1>Anterior</s1>Cadeias da missão
