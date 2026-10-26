# docs--kind-lunar-differential-pnt: translations (pt-PT)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-549a6103e711 = bit

# text
# c1: docs/kinds/by-kind/lunar-differential-pnt.md
seg-d0c9bec248b4 = Fonte: <c1/>

# text
# c1: lunar-differential-pnt
seg-d226df2bb634 = <c1/> (tipo de cenário)

# text
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (um análogo lunar do DGNSS/SBAS): uma estação de referência da classe NovaMoon, numa localização selenográfica CONHECIDA, calcula correções diferenciais por satélite a partir de uma constelação ILLUSTRATIVE de classe Moonlight/LCNS, de fontes públicas (NovaMoon referida apenas como uma CLASSE de sistema, sem afiliação à ESA), e um utilizador afastado por baseline_km aplica-as, de modo que os erros de órbita e de relógio de MODO COMUM se cancelam. O termo do relógio cancela-se EXATAMENTE (uma identidade algébrica); do termo da órbita resta apenas a projeção da diferença de linha de vista, que → { "0" } quando a linha de base → { "0" } (o piso da decorrelação espacial) e cresce ≈ linearmente com a linha de base. Indica o erro de posição 3-D do utilizador COM versus SEM correções, o fator de redução, a curva do erro em função da linha de base e um nível de proteção do utilizador que REAPROVEITA a maquinaria SBAS da DO-229E (crate::sbas) com o resíduo diferencial σ. MODELLED — identidade de cancelamento exata + modelo de decorrelação de primeira ordem; não validado com dados reais; sem TRL, herança de voo nem aval de agências. Determinístico se tiver semente fixa.

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Uma execução de <c1/> resume-se assim: lunar-differential-pnt | { "8" } sats (classe LCNS ilustrativa, sem afiliação) | linha de base de { "50" } km | erro do utilizador { "24.46" } m → { "0.0077" } m (redução de { "3186" }×) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-1115464be513 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-3f32e0fea066 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-8e67df89448a = O gráfico que o motor escreve para scenarios/lunar-differential-pnt.toml, tipo de cenário lunar-differential-pnt

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Estação de referência diferencial da classe NovaMoon: cancelamento de modo comum + resíduo que cresce com a linha de base + níveis de proteção DGNSS. Referência independente (InternalConsistency): Identidade de cancelamento de erros diferencial + reutilização da maquinaria de PL SBAS da DO-229E; a solução de diferença simples + WLS é adicionalmente verificada de forma cruzada face a lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de resolução independente, mas com a mesma álgebra de primeira ordem da diferença de linha de vista, pelo que continua a ser InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é utilizada, cada um deles anteriormente deixado como margem não modelada:. Referência independente (InternalConsistency): Identidades de forma fechada e autoconsistência: a variância step²/12 do quantizador uniforme, a propagação exata da covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ a reduzir-se a σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fecho em quadratura ao desligar. A verificação cruzada do PDOP face a orbit::dop partilha a matriz normal [−û, { "1" }], pelo que é uma verificação de consistência e é etiquetada como tal, em vez de uma indep

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED — identidade de cancelamento exata + modelo de decorrelação de primeira ordem; não validado com dados reais; sem TRL, herança de voo nem aval de agências. (catálogo de tipos de cenário (<c1/>))

# text
seg-9d54d8c07ca3 = HONESTIDADE: MODELLED. O cancelamento de modo comum é uma identidade algébrica EXATA; o resíduo de decorrelação espacial é um modelo geométrico de PRIMEIRA ORDEM (a projeção da diferença de linha de vista de um erro de órbita injetado), não um modelo de decorrelação ajustado a partir de seguimento lunar real. O nível de proteção do utilizador REAPROVEITA a maquinaria de níveis de proteção SBAS da DO-229E (crate::sbas) com o sigma residual diferencial como o erro por satélite (comentário do ficheiro de cenário, linhas { "23" } a { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── A LIGAÇÃO DE CORREÇÃO ────────────────────────────────────────────────────────────── A identidade acima pressupõe uma correção PERFEITA: calculada por uma estação que sabe exatamente onde se encontra, entregue instantaneamente, com resolução infinita. Nenhuma das três condições se verifica, e as três entradas abaixo modelam o que cada uma custa. Alimentam APENAS o bloco <c1/> do documento de resultados -- com as três nos valores escritos h (comentário do ficheiro de cenário, linhas { "57" } a { "62" })

# text
seg-e7f016777e09 = ERRO DE LEVANTAMENTO. A estação forma a sua correção face à coordenada em que ACREDITA estar. Um erro nesta viaja em cada correção que difunde e chega ao utilizador como -delta . u_ref -- que não contém qualquer geometria do utilizador, pelo que, ao contrário do termo da órbita, nem se anula com linha de base nula nem cresce com a linha de base, e transfere-se aproximadamente um para um para a posição do utilizador. O valor predefinido de { "0.30" } m é a própria referência lunar da crate (comentário do ficheiro de cenário, linhas { "64" } a { "70" })

# text
seg-e0648d9b52b4 = ENVELHECIMENTO DA CORREÇÃO. Uma correção calculada em t e aplicada em t+tau fica desatualizada de duas maneiras. Órbita: o satélite SE MOVEU, pelo que o vetor de erro de órbita congelado se projeta agora numa linha de vista rodada; a rotação provém do propagador da própria crate, pelo que não se assume em lado nenhum uma taxa de erro de órbita. Relógio: o relógio do satélite derivou c*sigma_y(tau)*tau segundo a lei de potência do RAFS completo em crate::clock_specs, calibrada a (comentário do ficheiro de cenário, linhas { "73" } a { "79" })

# text
seg-7171b2e3f29d = O PNT diferencial lunar é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = PNT diferencial lunar — o orçamento de resíduos da ligação de correção é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Seguinte</s1>lunar-frame-campaign
