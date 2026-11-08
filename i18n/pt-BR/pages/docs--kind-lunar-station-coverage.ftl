# docs--kind-lunar-station-coverage: translations (pt-BR)

# text
seg-9feefecdcf67 = rafs

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Estação de referência diferencial da classe NovaMoon: cancelamento de modo comum + resíduo que cresce com a linha de base + níveis de proteção DGNSS. Referência independente (InternalConsistency): identidade de cancelamento do erro diferencial + reaproveitamento do mecanismo de PL SBAS da DO-229E; a solução de diferença simples + WLS é verificada de forma cruzada, além disso, contra lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) -- código de resolução independente, mas com a mesma álgebra de primeira ordem da diferença de linha de visada, portanto ainda InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado antes como folga não modelada:. Referência independente (InternalConsistency): identidades de forma fechada e autoconsistência: a variância do quantizador uniforme step²/12, a propagação exata da covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que se reduz a σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fechamento da quadratura de desligamento. A verificação cruzada do PDOP contra orbit::dop compartilha a matriz normal [−û, { "1" }], de modo que é uma verificação de consistência e é rotulada como tal, em vez de uma in

# text
seg-7171b2e3f29d = O PNT diferencial lunar é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = O PNT diferencial lunar — orçamento de resíduo do enlace de correção é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Fonte: <c1/>

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (tipo de cenário)

# text
seg-f7ea776e70c9 = Cobertura modelada da estação de referência lunar: uma varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas. Uma estação de referência diferencial em um local conhecido do polo sul corrige uma constelação declarada (kepleriana ilustrativa ou efemérides tabeladas) com um erro de sinal no espaço, um erro de levantamento, uma latência de correção e uma quantização de enlace declarados; por ponto e sobre a região, informa o erro de posição corrigido e não corrigido por percentil (3-D, horizontal, vertical), a disponibilidade, a cobertura contra um limiar declarado, os níveis de proteção da DO-229E, o raio de cobertura por azimute e o orçamento do enlace de correção na estação e no pior ponto. Não é uma declaração sobre o desempenho de nenhum sistema real; sem afiliação nem endosso de nenhuma agência. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Uma execução de <c1/> resume-se assim: lunar-station-coverage | { "346" } points x { "144" } epochs x { "200" } trials | availability { "92.2" } % | coverage { "76.5" } % (p95 <= { "20" } m) | corrected p95 3-D { "15.592" } m (uncorrected { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; not a statement about any real system

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
seg-2d84b341a41f = Rótulo do resultado (o do motor): MODELLED

# attr:alt
seg-922b8656fcae = O gráfico que o motor escreve para scenarios/lunar-station-coverage.toml, tipo de cenário lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas (o tipo de cenário <c1/>): para uma estação de referência diferencial em um local conhecido do polo sul, por ponto e sobre a região, o Testes: <a1>lunar_station_coverage_reference.rs</a1>.

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas (o tipo de cenário <c1/>): para uma estação de referência diferencial. Referência independente (InternalConsistency): aritmética recalculada por um script numpy independente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; com pré-registro em tests/fixtures/lunar_station/PREREGISTRATION.md, registrado isoladamente em 9caedf97 antes da primeira execução): em { "20" } casos com todos os termos de erro ligados, os conjuntos visíveis e o estado são idênticos, os erros brutos de distância concordam a { "1.4e-14" } m, os vetores e as magnitudes do erro de posição a { "1.4e-9" } m contra

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-6f09def22469 = HONESTIDADE: MODELLED. Sob as hipóteses declaradas abaixo, o modelo fornece estes valores. Não é uma declaração sobre o desempenho de nenhum sistema real; sem afiliação nem endosso de nenhuma agência; sem alegação de TRL nem de herança. Omitidos: mascaramento de terreno e de horizonte no polo (a primeira limitação), multipercurso, hardware do receptor. (comentário do arquivo de cenário, linhas { "15" } a { "18" })

# text
seg-db27cc015952 = O mapa de cobertura e precisão da estação de referência lunar é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Próximo</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>Anterior</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Próximo</s1>lunar-surface
