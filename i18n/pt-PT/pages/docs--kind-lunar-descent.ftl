# docs--kind-lunar-descent: translations (pt-PT)

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Toda etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como uma etiqueta é obtida: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

# text
seg-ebc18c9bcbac = differential

# text
seg-2d84b341a41f = Etiqueta do resultado (a do motor): MODELLED

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-descent.md
seg-1eda001180f9 = Fonte: <c1/>

# text
# c1: lunar-descent
seg-d4df5aa9b7b0 = <c1/> (tipo de cenário)

# text
seg-2cd0d5385530 = Orçamento de dispersão de aterragem MODELLED para uma descida propulsionada a um local polar sul (classe Artemis). Por eixo horizontal, um modelo de erro inercial de cinco estados (posição, velocidade, enviesamento do acelerómetro, inclinação de atitude, enviesamento do giroscópio) é conduzido pela força específica da descida; um filtro sequencial recebe soluções de posição dos auxílios ativados: uma solução AFS a partir dos relés visíveis de uma constelação ILLUSTRATIVE de classe LCNS (isolada, ou diferencial usando o resíduo do enlace de correção de lunar-differential-pnt, com o relógio auxiliado quando apenas três relés estão visíveis) e uma solução relativa ao terreno (o correlacionador TERCOM/SITAN da biblioteca sobre um relevo sintético, ou o limite de Cramer-Rao da correlação de uma janela de elevação do DEM polar sul real do LOLA). O tempo lunar entra pelo relógio do veículo nas soluções (o desvio LTC-TT de lunar-time-offset, ou a incerteza do seu intervalo publicado) e como um erro de marcação de tempo ao longo da trajetória. Indica a elipse de aterragem de 3 sigma, R95, as fontes inerciais em forma fechada, a contribuição de cada auxílio, a ablação de cada combinação de auxílios, uma calibração de Monte Carlo da elipse e a covariância transferida. MODELLED: classe de IMU, conjunto de relés, perfil de descida e termo de orientação ilustrativos; terrain-nav usa um relevo sintético em escala métrica terrestre; a disponibilidade de AFS é de uma época com uma máscara plana. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

# text
# c1: scenarios/lunar-descent.toml
seg-c6c1a8f184ed = Uma execução de <c1/> é resumida assim: lunar-descent | -89.50 deg | apenas inercial 517/517 m (L/N) | com auxílios 7.6/4.8 m | dispersão R95 { "51" } m | elipse de 3 sigma { "64" } x { "62" } m | { "99.1" }% dentro (esperado { "98.9" }%) (MODELLED)

# text
# c1: site_lat_deg
# c2: site_lon_deg
# c3: more_site_lats_deg
# c4: descent_s
# c5: specific_force_m_s2
# c6: horizontal_speed_m_s
# c7: accel_bias_ug
# c8: align_arcmin
# c9: gyro_bias_deg_per_hr
# c10: carried_pos_sigma_m
# c11: carried_vel_sigma_m_s
# c12: guidance_sigma_m
# c13: afs_mode
# c14: n_relays
# c15: mask_deg
# c16: afs_cn0_dbhz
# c17: sis_ure_m
# c18: afs_first_fix_s
# c19: afs_interval_s
# c20: baseline_km
# c21: trn_source
# c22: trn_fix_time_s
# c23: trn_altimeter_sigma_m
# c24: trn_map_sigma_m
# c25: dem_descriptor
# c26: trn_window_m
# c27: trn_height_sigma_m
# c28: trn_registration_sigma_m
# c29: lunar_time_mode
# c30: time_since_sync_days
# c31: n_trials
# c32: seed
seg-dfdb7de68515 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

# text
# c1: scenarios/lunar-descent.toml
seg-bff1ab352267 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-8073ece4c900 = O gráfico que o motor escreve para scenarios/lunar-descent.toml, tipo lunar-descent

# text
# c1: lunar-descent
seg-d5da9ee3c152 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: um modelo de erro inercial de cinco estados por eixo (posição, velocidade, enviesamento do acelerómetro, inclinação, enviesamento do giroscópio) ao longo de uma descida propulsionada, auxiliado por soluções AFS (isoladas ou diferenciais, com o caso de três rel

# text
# c1: lunar-descent
seg-bfe4c0a04288 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: um modelo de erro inercial de cinco estados por eixo (posição, velocidade, enviesamento do acelerómetro, inclinação, enviesamento do giroscópio) ao longo de uma descida propulsionada,. Referência independente (InternalConsistency): A deriva inercial em forma fechada, os resultados próprios dos tipos reutilizados e a calibração da elipse de 3 sigma (a fração interna concorda com a esperada) nos testes. Nenhuma aterragem voada ou testada é comparada

# text
# c1: kshana kinds --json
seg-ed286f215c96 = Orçamento de dispersão de aterragem MODELLED para uma descida propulsionada a um local polar sul (classe Artemis). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-c1bd92ba429b = MODELLED: classe de IMU, conjunto de relés, perfil de descida e termo de orientação ilustrativos; terrain-nav usa um relevo sintético em escala métrica terrestre; a disponibilidade de AFS é de uma época com uma máscara plana. (catálogo de tipos de cenário (<c1/>))

# text
seg-85714bc3cf2a = HONESTIDADE: MODELLED. A classe de IMU, o perfil de descida, o conjunto de relés, o erro do sinal no espaço e o termo de orientação são entradas ILLUSTRATIVE, não medições. O modo terrain-nav usa o relevo sintético autónomo e uma escala métrica terrestre, de modo que o termo de terreno aqui é o comportamento do correlacionador sobre um substituto, e não uma afirmação sobre o relevo polar sul: a variante lola-crlb (lunar-descent-lola.toml) usa o real (comentário do ficheiro de cenário, linhas { "14" } a { "20" })

# text
# c1: lunar-descent
seg-3eb1b3b03600 = O orçamento de dispersão de aterragem num local polar lunar (<c1/>) é MODELLED, não validado: verificado face à sua própria identidade em forma fechada / analítica — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

# text
seg-ca9b68783354 = <s1>Seguinte</s1>lunar-differential-pnt
