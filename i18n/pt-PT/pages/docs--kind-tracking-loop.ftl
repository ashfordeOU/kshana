# docs--kind-tracking-loop: translations (pt-PT)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = sem valor

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por conceção

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espetro</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espetro</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> O relatório <c1/> já não apoia o seu contorno de negação num único escalar.

# text
seg-05e8854de548 = chip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Fonte: <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (tipo de cenário)

# text
seg-f6ff1c8c78db = Perda de bloqueio do laço de seguimento: C/N0 -> bloqueio/desbloqueio COM HISTERESE, o tempo que demora a perder o bloqueio e a captura por spoofing em função da TAXA de desvio de código e de portadora. Os critérios de negação e de captura já existentes no motor são razões de potência recebida (um jammer nega a J/S = { "30" } dB, um spoofer captura a { "3" } dB); a perda de bloqueio real não é uma razão de potência, é o ponto em que o jitter de um laço mais o esforço dinâmico saem do seu orçamento de limiar de seguimento. Indica ({ "1" }) o jitter térmico de 1 sigma da portadora (Costas) e do código (early/late não coerente) em função de C/N0, com a perda de quadratura incluída, face às regras indicadas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (a regra dos 15 graus em forma de três sigma) e { "3" }</em>sigma_DLL + atraso de rampa <= d/2 chips; ({ "2" }) os limiares de C/N0 de perda e de rebloqueio com o laço determinante identificado, o limiar de rebloqueio DERIVED da largura de banda mais larga com que um recetor volta a captar, em vez de afirmado, de modo que a largura da histerese tem de situar-se entre { "5" }<em>log10(razão) e { "10" }</em>log10(razão) dB; ({ "3" }) o tempo declarado até perder o bloqueio a partir de um detetor de bloqueio de dois limiares com tempos de permanência de confirmação, conduzido sobre uma rampa de C/N0, indicado em separado do tempo de escape de fase físico (o tempo médio de Viterbi entre deslizamentos de ciclo, em log10 s porque abrange centenas de décadas); ({ "4" }) os limites de captura por spoofing — a maior variação de código e a maior taxa de Doppler da portadora que os laços de uma vítima conseguem seguir, com um mapa sobre os dois eixos, porque um spoofer que varia mais depressa do que estes não captura o laço, ultrapassa-o; e ({ "5" }) o RAIO DE NEGAÇÃO que a dinâmica do laço implica, indicado EM PARALELO COM o raio de razão de potência existente, nunca em seu lugar, com a sua diferença com sinal como campo próprio com nome (denial_radius_delta_km) e uma definição ao lado. Cada campo numérico emitido inclui uma unidade e uma classe de proveniência. Formas fechadas VALIDATED: as expressões de jitter da portadora e do código, a redução do filtro de laço sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são verificados por comparação com o próprio correlador sdr do motor avançado sobre IF sintético com semente — um caminho diferente para os mesmos números — a { "0.6" } %, { "3.7" } % e { "0.17" } % respetivamente, e a Bessel I0 modificada subjacente ao tempo de deslizamento de ciclo face a valores tabelados padrão a { "1e-7" }. O limite inferior de validade é afirmado, não apenas indicado: abaixo de ~{ "32" } dB-Hz a { "1" } ms o discriminador atan real satura face ao seu intervalo +-pi/2 e mede menos jitter do que qualquer teoria linear. MODELLED: as larguras de banda dos laços, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de captura, os tempos de permanência de confirmação, a potência do jammer e os ganhos das antenas são valores representativos de banda, não uma ficha técnica. NÃO modelados: o jitter do oscilador (desvio de Allan) e da vibração, a limitação de largura de banda do front-end, o multipercurso, a dinâmica do AGC, a perda por transição de bits de dados, a assistência externa e qualquer correção de meio ciclo à fórmula de deslizamento de ciclo de Costas. Sob a dinâmica do laço, a captura por spoofing não tem qualquer raio — a restrição determinante é a taxa de desvio, não a potência — pelo que esse campo é nulo com uma razão, em vez de um número fabricado. Não é um produto certificado de desempenho de recetores.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Uma execução de <c1/> resume-se assim: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> perda { "25.4744" } dB-Hz (a portadora determina), rebloqueio { "27.4413" } dB-Hz, histerese { "1.9669" } dB | perda de bloqueio declarada { "39.101" } s após o início da rampa | raio de negação limiar(J/S { "30" } dB) { "127.413" } km vs dinâmica do laço { "53.1694" } km, delta -74.2438 km | captura por spoofing <= { "0.966" } chip/s de código e { "41.45" } Hz/s de portadora (laço MODELLED, formas fechadas VALIDATED)

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-7614718317f4 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = O exemplo <c1/> define, entre outros:

# text
seg-773fff0feaf7 = entre limites

# text
seg-23f3aa5c2064 = Etiqueta de resultado (a do motor): MIXED — formas fechadas de laço VALIDATED, configuração de laço MODELLED. As expressões de jitter térmico da portadora e do código, a redução do filtro de laço sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são verificados por comparação com o próprio correlador sdr do motor avançado sobre IF sintético com semente (um caminho diferente

# attr:alt
seg-72182c1aecd9 = O gráfico que o motor escreve para scenarios/tracking-loop.toml, tipo tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Perda de bloqueio calculada a partir da dinâmica do laço em vez de uma razão de potência: jitter térmico de 1σ da portadora (Costas) e do código (early/late não coerente) face a C/N₀ com a perda de quadratura, face às regras indicadas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + atraso de rampa

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Perda de bloqueio calculada a partir da dinâmica do laço em vez de uma razão de potência: jitter térmico de 1σ da portadora (Costas) e do código (early/late não coerente) face a C/N₀ com a. Referência independente (ReferenceImpl): o próprio correlador sdr do motor (sdr::correlate / synth_if / CaCode) avançado sobre IF sintético com semente a um C/N₀ calibrado — um caminho de código separado que chega aos mesmos números por correlação numérica de IQ amostrado em vez de por uma expressão algébrica de jitter, pelo que é um caminho diferente e não uma reformulação — mais valores tabelados padrão da Bessel modificada I₀ para o termo de deslizamento de ciclo. Teoria do laço segundo Kaplan & Hegar

# text
# c1: label
seg-de048f9cf1f6 = MIXED — formas fechadas de laço VALIDATED, configuração de laço MODELLED. As expressões de jitter térmico da portadora e do código, a redução do filtro de laço sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são verificados por comparação com o próprio correlador sdr do motor avançado sobre IF sintético com semente (um caminho diferente para os mesmos números), e a Bessel I0 modificada face a valores tabelados padrão. MODELLED: as larguras de banda dos laços, integ (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: as larguras de banda dos laços, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de captura, os tempos de permanência de confirmação, a potência do jammer e os ganhos das antenas são valores representativos de banda, não uma ficha técnica. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = NÃO modelados: o jitter do oscilador (desvio de Allan) e da vibração, a limitação de largura de banda do front-end, o multipercurso, a dinâmica do AGC, a perda por transição de bits de dados, a assistência externa e qualquer correção de meio ciclo à fórmula de deslizamento de ciclo de Costas. (catálogo de tipos (<c1/>))

# text
seg-f8d50cbc6f2c = Cada parâmetro de laço abaixo é um valor representativo de banda MODELLED, não uma ficha técnica. (comentário do ficheiro de cenário, linha { "22" })

# text
seg-9241a57823cd = --- geometria do laço ----------------------------------------------------------------- Um laço de portadora Costas de { "10" } Hz e um laço de código assistido pela portadora de { "1" } Hz, integração coerente de { "1" } ms (um período do código C/A, pelo que não se pressupõe sincronização de bits de dados), correlador estreito de { "0.5" } chip. (comentário do ficheiro de cenário, linhas { "25" } a { "28" })

# text
seg-3a677e343081 = A perda de bloqueio do laço de seguimento e a captura por spoofing sob interferência são MODELLED, não validadas: verificadas face a uma implementação separada nesta mesma base de código — independente da unidade em ensaio, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Anterior</s1>timetransfer
