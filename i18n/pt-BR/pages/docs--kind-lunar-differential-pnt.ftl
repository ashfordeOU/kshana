# docs--kind-lunar-differential-pnt: translations (pt-BR)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

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
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (um análogo lunar de DGNSS/SBAS): uma estação de referência da classe NovaMoon em um local selenográfico CONHECIDO calcula correções diferenciais por satélite a partir de uma constelação da classe Moonlight/LCNS, ILLUSTRATIVE e de fonte pública (NovaMoon citada apenas como uma CLASSE de sistema, sem afiliação com a ESA), e um usuário deslocado por baseline_km as aplica, de modo que os erros de órbita + relógio de MODO COMUM se cancelem. O termo de relógio se cancela EXATAMENTE (uma identidade algébrica); o termo de órbita deixa apenas a projeção da diferença de linha de visada, que → { "0" } quando a linha de base → { "0" } (o piso de descorrelação espacial) e cresce ≈ linearmente com a linha de base. Informa o erro de posição 3-D do usuário COM e SEM correções, o fator de redução, a curva de erro contra a linha de base e um nível de proteção do usuário que REAPROVEITA o mecanismo SBAS da DO-229E (crate::sbas) com o resíduo diferencial σ. MODELLED — identidade de cancelamento exato + modelo de descorrelação de primeira ordem; não validado com dados reais; sem TRL, herança nem endosso de agência. Determinístico se houver semente.

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Uma execução de <c1/> resume-se assim: lunar-differential-pnt | { "8" } sats (illustrative LCNS-class, not affiliated) | baseline { "50" } km | user error { "24.46" } m → { "0.0077" } m ({ "3186" }× reduction) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

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
seg-6f4246bd8f6f = <b>MODELLED</b> Estação de referência diferencial da classe NovaMoon: cancelamento de modo comum + resíduo que cresce com a linha de base + níveis de proteção DGNSS. Referência independente (InternalConsistency): identidade de cancelamento do erro diferencial + reaproveitamento do mecanismo de PL SBAS da DO-229E; a solução de diferença simples + WLS é verificada de forma cruzada, além disso, contra lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) -- código de resolução independente, mas com a mesma álgebra de primeira ordem da diferença de linha de visada, portanto ainda InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado antes como folga não modelada:. Referência independente (InternalConsistency): identidades de forma fechada e autoconsistência: a variância do quantizador uniforme step²/12, a propagação exata da covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que se reduz a σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fechamento da quadratura de desligamento. A verificação cruzada do PDOP contra orbit::dop compartilha a matriz normal [−û, { "1" }], de modo que é uma verificação de consistência e é rotulada como tal, em vez de uma in

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED — identidade de cancelamento exato + modelo de descorrelação de primeira ordem; não validado com dados reais; sem TRL, herança nem endosso de agência. (catálogo de tipos de cenário (<c1/>))

# text
seg-9d54d8c07ca3 = HONESTIDADE: MODELLED. O cancelamento de modo comum é uma identidade algébrica EXATA; o resíduo de descorrelação espacial é um modelo geométrico de PRIMEIRA ORDEM (a projeção da diferença de linha de visada de um erro de órbita injetado), não um modelo de descorrelação ajustado a partir de rastreamento lunar real. O nível de proteção do usuário REAPROVEITA o mecanismo de nível de proteção SBAS da DO-229E (crate::sbas) com o sigma do resíduo diferencial como o erro por satélit (comentário do arquivo de cenário, linhas { "23" } a { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── O ENLACE DE CORREÇÃO ────────────────────────────────────────────────────────────── A identidade acima pressupõe uma correção PERFEITA: calculada por uma estação que sabe exatamente onde está, entregue instantaneamente, com resolução infinita. Nenhuma das três condições se verifica, e as três entradas abaixo modelam o que cada uma custa. Elas alimentam SOMENTE o bloco <c1/> do documento de resultado -- com as três nos valores escritos a (comentário do arquivo de cenário, linhas { "57" } a { "62" })

# text
seg-e7f016777e09 = ERRO DE LEVANTAMENTO. A estação forma a sua correção contra a coordenada em que ACREDITA estar. Um erro ali acompanha toda correção que ela transmite e chega ao usuário como -delta . u_ref -- que não contém nenhuma geometria do usuário, de modo que, ao contrário do termo de órbita, nem se anula com linha de base zero nem cresce com a linha de base, e se transfere cerca de um para um para a posição do usuário. O valor padrão de { "0.30" } m é a referência lunar do próprio crate (comentário do arquivo de cenário, linhas { "64" } a { "70" })

# text
seg-e0648d9b52b4 = ENVELHECIMENTO DA CORREÇÃO. Uma correção calculada em t e aplicada em t+tau fica obsoleta de duas maneiras. Órbita: o satélite SE MOVEU, de modo que o vetor congelado do erro de órbita agora se projeta sobre uma linha de visada girada; a rotação vem do propagador do próprio crate, de modo que nenhuma taxa de erro de órbita é presumida em lugar algum. Relógio: o relógio do satélite derivou c*sigma_y(tau)*tau pela lei de potência completa do RAFS em crate::clock_specs, calibrada a (comentário do arquivo de cenário, linhas { "73" } a { "79" })

# text
seg-7171b2e3f29d = O PNT diferencial lunar é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = O PNT diferencial lunar — orçamento de resíduo do enlace de correção é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Próximo</s1>lunar-frame-campaign

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-f9d918743ec6 = <s1>Anterior</s1>lunar-descent
