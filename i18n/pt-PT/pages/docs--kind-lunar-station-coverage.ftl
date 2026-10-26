# docs--kind-lunar-station-coverage: translations (pt-PT)

# text
seg-9feefecdcf67 = rafs

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Estação de referência diferencial da classe NovaMoon: cancelamento de modo comum + resíduo que cresce com a linha de base + níveis de proteção DGNSS. Referência independente (InternalConsistency): Identidade de cancelamento de erros diferencial + reutilização da maquinaria de PL SBAS da DO-229E; a solução de diferença simples + WLS é adicionalmente verificada de forma cruzada face a lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de resolução independente, mas com a mesma álgebra de primeira ordem da diferença de linha de vista, pelo que continua a ser InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é utilizada, cada um deles anteriormente deixado como margem não modelada:. Referência independente (InternalConsistency): Identidades de forma fechada e autoconsistência: a variância step²/12 do quantizador uniforme, a propagação exata da covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ a reduzir-se a σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fecho em quadratura ao desligar. A verificação cruzada do PDOP face a orbit::dop partilha a matriz normal [−û, { "1" }], pelo que é uma verificação de consistência e é etiquetada como tal, em vez de uma indep

# text
seg-7171b2e3f29d = O PNT diferencial lunar é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = PNT diferencial lunar — o orçamento de resíduos da ligação de correção é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Fonte: <c1/>

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (tipo de cenário)

# text
seg-f7ea776e70c9 = Cobertura modelada de uma estação de referência lunar: uma varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores do polo sul e um dia de épocas. Uma estação de referência diferencial num local conhecido do polo sul corrige uma constelação indicada (kepleriana ilustrativa ou efemérides tabeladas) com um erro de sinal no espaço, um erro de levantamento, uma latência de correção e uma quantização da ligação indicados; por ponto e ao longo da região, indica o erro de posição percentil corrigido e não corrigido (3-D, horizontal, vertical), a disponibilidade, a cobertura face a um limiar indicado, os níveis de proteção da DO-229E, o raio de cobertura por azimute e o orçamento da ligação de correção na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; sem afiliação nem aval de nenhuma agência. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Uma execução de <c1/> resume-se assim: lunar-station-coverage | { "346" } pontos x { "144" } épocas x { "200" } ensaios | disponibilidade de { "92.2" } % | cobertura de { "76.5" } % (p95 <= { "20" } m) | p95 3-D corrigido de { "15.592" } m (não corrigido { "1056.892" } m) | HPL máx. de { "480.385" } m | MODELLED; não é uma afirmação sobre nenhum sistema real

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-cb73ac0d57de = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

# text
# c1: scenarios/lunar-station-coverage.toml
seg-0c3460704315 = O exemplo <c1/> define, entre outros:

# text
seg-2d84b341a41f = Etiqueta do resultado (a do motor): MODELLED

# attr:alt
seg-922b8656fcae = O gráfico que o motor escreve para scenarios/lunar-station-coverage.toml, tipo de cenário lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores do polo sul e um dia de épocas (o tipo de cenário <c1/>): para uma estação de referência diferencial num local conhecido do polo sul, por ponto e ao longo da região, o Ensaios: <a1>lunar_station_coverage_reference.rs</a1>.

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores do polo sul e um dia de épocas (o tipo de cenário <c1/>): para uma estação de referência diferencial num. Referência independente (InternalConsistency): Aritmética recalculada por um script numpy independente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; pré-registado em tests/fixtures/lunar_station/PREREGISTRATION.md, registado isoladamente em 9caedf97 antes da primeira execução): em { "20" } casos com todos os termos de erro ativos, os conjuntos visíveis e o estado são idênticos, os erros brutos de distância concordam até { "1.4e-14" } m, os vetores e as magnitudes do erro de posição até { "1.4e-9" } m face

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-6f09def22469 = HONESTIDADE: MODELLED. Sob os pressupostos indicados abaixo, o modelo dá estes valores. Não é uma afirmação sobre o desempenho de nenhum sistema real; sem afiliação nem aval de nenhuma agência; sem alegação de TRL nem de herança de voo. Omitidos: o mascaramento do terreno e do horizonte no polo (a primeira limitação), o multipercurso, o equipamento do recetor. (comentário do ficheiro de cenário, linhas { "15" } a { "18" })

# text
seg-db27cc015952 = O mapa de cobertura e exatidão de uma estação de referência lunar é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Seguinte</s1>lunar-time-budget
