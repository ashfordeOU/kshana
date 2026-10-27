# docs--kind-ins-trn-coast: translations (pt-PT)

# text
seg-bf51947657c0 = navegação

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-c4ed27a559df = Página do tópico: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
# c1: docs/kinds/by-kind/ins-trn-coast.md
seg-f7305f3a0b5a = Fonte: <c1/>

# text
# c1: ins-trn-coast
seg-92b90cb4a839 = <c1/> (tipo de cenário)

# text
seg-5b9a6efe6337 = Modelo de erro de INS/TRN em inércia: erro de posição em função da duração da inércia, construído a partir de coeficientes da IMU em vez de varrido como uma taxa de deriva presumida. Cinco contribuições de crescimento — viés do acelerómetro, inclinação por viés do giroscópio através da gravidade, passeio aleatório de velocidade, passeio aleatório de ângulo e fator de escala em função da distância percorrida — cada uma propagada por um modelo de erro inercial de nove estados em nível local com realimentação de Schuler a uma latitude e altura declaradas (as leis de ordem dominante para inércia curta t², t³, t^{ "1.5" }, t^{ "2.5" } e t¹/t² são indicadas ao lado) e combinadas sob uma regra DECLARADA (raiz da soma dos quadrados por predefinição, ou soma linear, ou soma determinística com rss estocástico; as três são calculadas em cada execução, de modo que a escolha fica visível em vez de enterrada). As durações de inércia que atingem limiares de posição fornecidos pelo chamador ({ "10" } m e { "50" } m por predefinição) são localizadas pela bisseção já existente no motor, cada uma com uma decomposição por contribuição que nomeia a fonte dominante, e o cruzamento de cada contribuição isolada é, além disso, invertido algebricamente para que os dois coincidam. Um modo de navegação relativa ao terreno limita a inércia com correções de posição periódicas e indica o maior intervalo entre correções que mantém cada limiar; uma correção apenas de posição deixa o erro de velocidade e a inclinação vivos através da correção, de modo que nem sempre limita a inércia, seja qual for a taxa de correções, e o relatório diz isso em vez de devolver um zero. MODELLED: os coeficientes de classe da IMU são valores representativos de intervalo, não de uma ficha técnica, e o resíduo da correção de terreno é uma entrada. Um limiar não alcançado é indicado como nulo com um status, nunca como zero. Não é um produto de desempenho de navegação inercial certificado.

# text
# c1: scenarios/ins-trn-coast.toml
seg-bbd497aa3ba6 = Uma execução de <c1/> resume-se assim: ins-trn-coast | IMU de navegação, { "250" } m/s, combinação rss | { "10" } m em { "251.0" } s (accel_bias) | { "50" } m em { "608.8" } s (accel_bias) | pico apenas de posição do TRN { "44.7" } m em { "1200" } s

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
seg-e0555ca683b1 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/ins-trn-coast.toml
seg-95887c4551c7 = O exemplo <c1/> define, entre outros:

# text
seg-4db5a594afc1 = rss

# text
seg-5868f641c089 = ug

# text
seg-1918189ac2bf = ppm

# text
seg-7eba4c5ee1e4 = Rótulo do resultado (o do motor): orçamento de erro de inércia INS/TRN MODELLED. Cada contribuição é propagada por um modelo de erro inercial de nove estados em nível local com realimentação de Schuler (plataforma nivelada com proa ao norte num local declarado, inercial livre incluindo o canal vertical instável); as suas leis de ordem dominante para inércia curta (viés t^{ "2" }, gy

# attr:alt
seg-134a4c91da3a = O gráfico que o motor gera para scenarios/ins-trn-coast.toml, tipo de cenário ins-trn-coast

# text
seg-7bb77ec86a0a = <b>VALIDATED</b> Orçamento de erro de posição em função da duração da inércia construído a partir de coeficientes da IMU, cada fonte de erro (viés do acelerómetro, viés do giroscópio, passeio aleatório de velocidade, passeio aleatório de ângulo, fator de escala em cruzeiro e sob força específica sustentada) propagada por um n

# text
seg-d69247df315f = <b>VALIDATED</b> Orçamento de erro de posição em função da duração da inércia construído a partir de coeficientes da IMU, cada fonte de erro (viés do acelerómetro, viés do giroscópio, passeio aleatório de velocidade, passeio aleatório de ângulo,. Referência independente (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), executado como programa separado no GNU Octave { "8.4.0" }: execuções de inércia livre com o mesmo perfil de erro da IMU, com uma banda morta numérica corrigida na sua atualização de quatérnions (qua_update.m: a guarda sobre uma taxa abaixo de { "1e-8" } rad/s substituída por wnorm == { "0" }, aplicada a uma cópia em tempo de execução e verificada uma vez; com a guarda no lugar, uma atitude de plataforma com deriva lenta congelava e cortava o

# text
# c1: label
seg-498cb2f96fa7 = Orçamento de erro de inércia INS/TRN MODELLED. Cada contribuição é propagada por um modelo de erro inercial de nove estados em nível local com realimentação de Schuler (plataforma nivelada com proa ao norte num local declarado, inercial livre incluindo o canal vertical instável); as suas leis de ordem dominante para inércia curta (viés t^{ "2" }, inclinação por viés do giroscópio t^{ "3" }, passeio aleatório de velocidade t^{ "1.5" }, passeio aleatório de ângulo t^{ "2.5" }, fator de escala x distância percorrida) são conferidas por verificação cruzada (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-63c221a546f7 = Modelo de erro de INS/TRN em inércia: erro de posição em função da duração da inércia, construído a partir de coeficientes da IMU em vez de varrido como uma taxa de deriva presumida. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-164504645f4a = MODELLED: os coeficientes de classe da IMU são valores representativos de intervalo, não de uma ficha técnica, e o resíduo da correção de terreno é uma entrada. (catálogo de tipos de cenário (<c1/>))

# text
seg-ee0281a1f401 = A pergunta que isto responde: quando um estudo de GNSS (ou com ciclo de trabalho da abertura) diz "presuma uma deriva de navegação inercial por estima de { "0.001" }–{ "0.050" } m/s", de onde vem esse número? Ele vem da IMU, e este cenário calcula-o em vez de o varrer. Cinco termos de crescimento — viés do acelerómetro (t^{ "2" }), inclinação por viés do giroscópio através da gravidade (t^{ "3" }), passeio aleatório de velocidade (t^{ "1.5" }), passeio aleatório de ângulo (t^{ "2.5" }) e fator de escala vezes a distância percorrida (comentário do ficheiro de cenário, linhas { "4" } a { "11" })

# text
seg-32d4adcfe249 = <s1>Anterior</s1>inertial

# text
seg-47366ab55be3 = <s1>Seguinte</s1>integrity
