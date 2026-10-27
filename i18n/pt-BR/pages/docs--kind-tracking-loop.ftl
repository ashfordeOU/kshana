# docs--kind-tracking-loop: translations (pt-BR)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = sem valor

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espectro</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espectro</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> O relatório <c1/> não apoia mais o seu contorno de negação em um único escalar.

# text
seg-05e8854de548 = chip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Fonte: <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (tipo de cenário)

# text
seg-f6ff1c8c78db = Perda de travamento do loop de rastreamento: C/N0 -> travado/destravado COM HISTERESE, o tempo para perder o travamento e o pull-in de spoofing em função da TAXA de deslocamento de código e de portadora. Os critérios existentes do mecanismo de negação e de captura são razões sobre a potência recebida (um jammer nega a J/S = { "30" } dB, um spoofer captura a { "3" } dB); a perda de travamento real não é uma razão de potência, é onde o jitter de um loop mais o estresse dinâmico excedem o seu orçamento de limiar de rastreamento. Informa ({ "1" }) o jitter térmico de 1 sigma de portadora (Costas) e de código (early/late não coerente) em função de C/N0, com a perda por elevação ao quadrado incluída, contra as regras declaradas { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (a regra dos 15 graus na forma de três sigmas) e { "3" }</em>sigma_DLL + atraso de rampa <= d/2 chips; ({ "2" }) os limiares de C/N0 de queda e de retravamento com o loop determinante indicado, o limiar de retravamento DERIVED da largura de banda maior em que um receptor refaz o pull-in em vez de afirmado, de modo que a largura da histerese deve ficar entre { "5" }<em>log10(razão) e { "10" }</em>log10(razão) dB; ({ "3" }) o tempo declarado para perder o travamento a partir de um detector de travamento de dois limiares com permanências de confirmação, conduzido ao longo de uma rampa de C/N0, informado separadamente do tempo físico de escape de fase (o tempo médio de Viterbi entre saltos de ciclo, em log10 s porque abrange centenas de décadas); ({ "4" }) limites de pull-in de spoofing — a maior variação de código e a maior taxa de Doppler de portadora que os loops de uma vítima conseguem seguir, com um mapa sobre os dois eixos, porque um spoofer que varia mais rápido do que isso não captura o loop, ele o ultrapassa; e ({ "5" }) o RAIO DE NEGAÇÃO que a dinâmica do loop implica, informado JUNTO com o raio existente de razão de potência, nunca em seu lugar, com a diferença com sinal entre eles como um campo próprio nomeado (denial_radius_delta_km) e uma definição ao lado. Todo campo numérico emitido traz uma unidade e uma classe de proveniência. Formas fechadas VALIDATED: as expressões de jitter de portadora e de código, a redução do filtro de loop sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são conferidos com o próprio correlador sdr do mecanismo avançado sobre IF sintética com semente — um caminho diferente para os mesmos números — a { "0.6" } %, { "3.7" } % e { "0.17" } % respectivamente, e a Bessel modificada I0 por trás do tempo de salto de ciclo contra valores tabelados padrão a { "1e-7" }. O limite inferior de validade é afirmado, não apenas declarado: abaixo de ~{ "32" } dB-Hz a { "1" } ms o discriminador atan real satura contra o seu intervalo de +-pi/2 e mede menos jitter do que qualquer teoria linear. MODELLED: as larguras de banda dos loops, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de pull-in, as permanências de confirmação, a potência do jammer e os ganhos de antena são valores representativos da banda, não um datasheet. NÃO modelados: jitter do oscilador (desvio de Allan) e de vibração, limitação de largura de banda do front-end, multipercurso, dinâmica do AGC, perda por transição de bit de dados, auxílio externo e qualquer correção de meio ciclo na fórmula de salto de ciclo de Costas. Sob a dinâmica do loop, a captura por spoofing não tem raio algum — a restrição determinante é a taxa de deslocamento, não a potência — de modo que esse campo é nulo, com um motivo, em vez de um número fabricado. Não é um produto certificado de desempenho de receptor.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Uma execução de <c1/> resume-se assim: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> queda { "25.4744" } dB-Hz (a portadora determina), retravamento { "27.4413" } dB-Hz, histerese { "1.9669" } dB | perda de travamento declarada { "39.101" } s após o início da rampa | raio de negação limiar(J/S { "30" } dB) { "127.413" } km contra dinâmica do loop { "53.1694" } km, delta -74.2438 km | pull-in de spoofing <= { "0.966" } chip/s de código e { "41.45" } Hz/s de portadora (loop MODELLED, formas fechadas VALIDATED)

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
seg-773fff0feaf7 = entre colchetes

# text
seg-23f3aa5c2064 = Rótulo do resultado (do mecanismo): MIXED — formas fechadas do loop VALIDATED, configuração do loop MODELLED. As expressões de jitter térmico de portadora e de código, a redução do filtro de loop sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são conferidos com o próprio correlador sdr do mecanismo avançado sobre IF sintética com semente (um caminho diferente

# attr:alt
seg-72182c1aecd9 = O gráfico que o mecanismo gera para scenarios/tracking-loop.toml, tipo tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Perda de travamento calculada a partir da dinâmica do loop em vez de uma razão de potência: jitter térmico de 1σ de portadora (Costas) e de código (early/late não coerente) contra C/N₀ com a perda por elevação ao quadrado, contra as regras declaradas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + atraso de rampa

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Perda de travamento calculada a partir da dinâmica do loop em vez de uma razão de potência: jitter térmico de 1σ de portadora (Costas) e de código (early/late não coerente) contra C/N₀ com a s. Referência independente (ReferenceImpl): o próprio correlador sdr do mecanismo (sdr::correlate / synth_if / CaCode) avançado sobre IF sintética com semente em um C/N₀ calibrado — um caminho de código separado que chega aos mesmos números por correlação numérica de IQ amostrado em vez de por uma expressão algébrica de jitter, de modo que é um caminho diferente e não uma reafirmação — mais valores tabelados padrão de I₀ de Bessel modificada para o termo de salto de ciclo. Teoria do loop segundo Kaplan & Hegar

# text
# c1: label
seg-de048f9cf1f6 = MIXED — formas fechadas do loop VALIDATED, configuração do loop MODELLED. As expressões de jitter térmico de portadora e de código, a redução do filtro de loop sqrt({ "2" }<em>B_n</em>T) e o atraso de rampa de primeira ordem são conferidos com o próprio correlador sdr do mecanismo avançado sobre IF sintética com semente (um caminho diferente para os mesmos números), e a Bessel modificada I0 contra valores tabelados padrão. MODELLED: as larguras de banda dos loops, integ (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: as larguras de banda dos loops, o tempo de integração, o espaçamento dos correladores, a razão de largura de banda de pull-in, as permanências de confirmação, a potência do jammer e os ganhos de antena são valores representativos da banda, não um datasheet. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = NÃO modelados: jitter do oscilador (desvio de Allan) e de vibração, limitação de largura de banda do front-end, multipercurso, dinâmica do AGC, perda por transição de bit de dados, auxílio externo e qualquer correção de meio ciclo na fórmula de salto de ciclo de Costas. (catálogo de tipos (<c1/>))

# text
seg-f8d50cbc6f2c = Todo parâmetro de loop abaixo é um valor representativo da banda MODELLED, não um datasheet. (comentário do arquivo de cenário, linha { "22" })

# text
seg-9241a57823cd = --- geometria do loop ----------------------------------------------------------------- Um loop de portadora Costas de { "10" } Hz e um loop de código auxiliado pela portadora de { "1" } Hz, integração coerente de { "1" } ms (um período do código C/A, de modo que nenhuma sincronização de bit de dados é presumida), correlador estreito de { "0.5" } chip. (comentário do arquivo de cenário, linhas { "25" } a { "28" })

# text
seg-3a677e343081 = A perda de travamento do loop de rastreamento e o pull-in de spoofing sob interferência é MODELLED, não validado: conferido com outra implementação na mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Anterior</s1>timetransfer
