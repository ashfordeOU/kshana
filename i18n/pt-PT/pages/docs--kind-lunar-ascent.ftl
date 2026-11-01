# docs--kind-lunar-ascent: translations (pt-PT)

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Toda etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como uma etiqueta é obtida: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-ascent.md
seg-f4b0bdb93d10 = Fonte: <c1/>

# text
# c1: lunar-ascent
seg-b8ef47331221 = <c1/> (tipo de cenário)

# text
seg-ae3053a1f6c8 = Ascensão propulsionada MODELLED de um local de superfície polar sul até à órbita de encontro, e a covariância de posição e velocidade que ela leva de volta à órbita (classe Artemis). O modelo de erro inercial de cinco estados por eixo de lunar-descent (posição, velocidade, enviesamento do acelerómetro, inclinação de atitude, enviesamento do giroscópio, conduzido pela força específica) é executado nos três eixos do local a partir do estado de superfície com que a fase começa; uma solução de posição AFS a partir dos relés visíveis de uma constelação ILLUSTRATIVE de classe LCNS (isolada, ou diferencial usando o resíduo do enlace de correção de lunar-differential-pnt, com o relógio auxiliado quando apenas três relés estão visíveis) é obtida num intervalo declarado, com o tempo lunar a entrar pelo relógio do veículo e um erro de marcação temporal ao longo da trajetória. Indica as fontes inerciais em forma fechada, a contribuição do auxílio, a ablação, os 1-sigmas de navegação ao longo da ascensão, a dispersão no corte do motor ao lado do conhecimento de navegação, e a covariância MCI 6x6 completa na inserção com a correlação posição-velocidade mantida. MODELLED: classe de IMU, força específica, conjunto de relés e dispersão no corte ilustrativos; erros mantidos nos eixos do local de lançamento; o estado nominal de saída é um substituto. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

# text
# c1: scenarios/lunar-ascent.toml
seg-fc4d2ba3f99e = Uma execução de <c1/> é resumida assim: lunar-ascent | -89.50 deg | apenas inercial { "785" } m / { "3.49" } m/s | com AFS { "11.4" } m / { "0.071" } m/s | dispersão na inserção { "1.73" } m/s (MODELLED)

# text
# c1: site_lat_deg
# c2: site_lon_deg
# c3: ascent_s
# c4: specific_force_m_s2
# c5: insertion_altitude_km
# c6: accel_bias_ug
# c7: align_arcmin
# c8: gyro_bias_deg_per_hr
# c9: surface_pos_sigma_m
# c10: surface_vel_sigma_m_s
# c11: cutoff_sigma_m_s
# c12: afs_mode
# c13: n_relays
# c14: mask_deg
# c15: afs_cn0_dbhz
# c16: sis_ure_m
# c17: afs_first_fix_s
# c18: afs_interval_s
# c19: baseline_km
# c20: lunar_time_mode
# c21: time_since_sync_days
seg-9fcdb15c21eb = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/lunar-ascent.toml
seg-a1c3e374f512 = O exemplo <c1/> define, entre outros:

# text
seg-ebc18c9bcbac = differential

# text
seg-3843825d0733 = us

# text
seg-2d84b341a41f = Etiqueta do resultado (a do motor): MODELLED

# attr:alt
seg-463a919e84d5 = O gráfico que o motor escreve para scenarios/lunar-ascent.toml, tipo lunar-ascent

# text
# c1: lunar-ascent
seg-52ee53bc1cd6 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: o modelo de erro inercial de cinco estados por eixo executado sobre uma ascensão propulsionada com força específica ao longo da trajetória, auxiliado por soluções AFS e pelo tempo lunar, indicando a covariância de posição e velocidade na inserção levada à órbi

# text
# c1: lunar-ascent
seg-4e0c4b02eac0 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: o modelo de erro inercial de cinco estados por eixo executado sobre uma ascensão propulsionada com força específica ao longo da trajetória, auxiliado por soluções AFS. Referência independente (InternalConsistency): A deriva inercial em forma fechada e verificações de monotonicidade nos testes. Nenhuma ascensão voada é comparada

# text
seg-8732ad9f7e07 = <b>MODELLED</b> O propagador que os tipos de cenário lunares partilham (GRAIL GL0660B de grau e ordem { "150" }, a Terra e o Sol como terceiros corpos, relatividade, orientação lunar DE440) comparado com as trajetórias púb. Referência independente (ExternalDataset): Efemérides de veículos espaciais do JPL Horizons para o LRO e o CAPSTONE, face a limiares fixados antecipadamente em xval/mission-thread-lunar/PREREGISTRATION.md (Alterações { "1" } a { "6" }). LRO: MET, { "33" } m de maior diferença 3-D e { "2.4" } m RMS radial contra { "500" } m e { "60" } m. CAPSTONE: NOT MET, uma diferença de posição final de { "136.8" } km contra { "25" } km e uma diferença de periapsia de { "28.4" } km contra { "10" } km, as causas não isoladas. A linha é modelada porque o limiar do CAPSTON

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-745dfc03a929 = Ascensão propulsionada MODELLED de um local de superfície polar sul até à órbita de encontro, e a covariância de posição e velocidade que ela leva de volta à órbita (classe Artemis). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-3fd0cca78937 = MODELLED: classe de IMU, força específica, conjunto de relés e dispersão no corte ilustrativos; erros mantidos nos eixos do local de lançamento; o estado nominal de saída é um substituto. (catálogo de tipos de cenário (<c1/>))

# text
seg-2cfb37d39847 = HONESTIDADE: MODELLED. A classe de IMU, o alinhamento, a força específica e a dispersão no corte são entradas ILLUSTRATIVE, não medições. Os erros são mantidos nos eixos leste-norte-cima do local de lançamento, sem a curvatura da trajetória ao longo do alcance, e o estado nominal de saída é um substituto na vertical local do local: apenas a covariância é o resultado. Nenhuma concordância com qualquer veículo real é afirmada. Software de caráter consultivo, não c (comentário do ficheiro de cenário, linhas { "11" } a { "15" })

# text
# c1: lunar-ascent
seg-6faf49cac41a = Ascensão propulsionada de um local polar lunar a uma órbita de inserção (<c1/>) é MODELLED, não validada: verificada face à sua própria identidade em forma fechada / analítica — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e482c9896140 = A propagação do modelo de forças lunares face a trajetórias públicas reconstruídas de orbitadores lunares e cislunares é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade inteira compõe partes modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

# text
seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

# text
seg-59d4cb995cb9 = <s1>Seguinte</s1>lunar-attack-surface
