# docs--kind-lunar-attack-surface: translations (pt-BR)

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Orçamento de enlace de J/S geométrico, C/N₀ antijamming, perda de sincronismo por satélite. Referência independente (InternalConsistency): Equação do orçamento de enlace de C/N₀ antijamming conferida contra uma nova derivação independente em numpy (compartilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } rodada { "2" }, bloqueado (permanece MODELLED): a queda de C/N0 medida no JammerTest { "2024" } contra uma previsão do orçamento de enlace (pré-registrada 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e o apontamento da antena F8.1 em

# text
seg-143f3f1cc521 = A resiliência a jamming em ambientes sem GNSS é MODELLED, não validada: verificada contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
# c1: docs/kinds/by-kind/lunar-attack-surface.md
seg-c14d2343d802 = Fonte: <c1/>

# text
# c1: lunar-attack-surface
seg-9c0b5e933472 = <c1/> (tipo de cenário)

# text
seg-004c56ded47f = Superfície de ataque à segurança de sinais da navegação na superfície lunar (P1): compõe as análises abertas de segurança de sinais em uma única execução alcançável pelo binário. Informa ({ "1" }) a potência recebida do AFS e o seu EXCEDENTE de potência em relação a uma referência GPS terrestre, além da faixa de sensibilidade de 12-18 dB como uma varredura genuína em vários eixos sobre as entradas do enlace (nível de referência x EIRP x distância oblíqua), com a reconciliação do fator linear de 25x arredondado / 28x não arredondado. REVISADO (regra R4): isto informava um DÉFICIT de potência de { "15.6" } dB e um fator de 32x/36x até que a referência GPS fosse corrigida de -125 / -128.5 (que são os valores em dBm) para -155 / -158.5 dBW, os valores do ICD-GPS-200 que o módulo de interferência sempre carregou. O sinal se inverte: o sinal lunar AFS modelado é { "14.4" } dB MAIS FORTE do que o GPS L1 C/A terrestre, não mais fraco. A própria potência recebida não mudou nem um bit, e o fator linear é o antigo dividido por exatamente { "1000" }, que é exatamente o deslocamento de { "30" } dB entre dBm e dBW; ({ "2" }) a potência de transmissão exigida do atacante para falsificar (J/S = { "3" } dB) e para negar (J/S = { "30" } dB) em cada distância de afastamento, o inverso do enlace J/S; ({ "3" }) a área de captura orbital sob um diagrama real de antena de abertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), uma calota sub-hemisférica limitada pela altitude cujo limbo NÃO é capturado; ({ "4" }) um resultado calculado de entrada em captura de falsificação na malha de rastreamento (um falsificador de código casado, com dada vantagem de potência e dado deslocamento de código, realmente arrasta a DLL/PLL) em vez do limiar afirmado de { "3" } dB; ({ "5" }) o alcance do horizonte geométrico de um transmissor elevado na superfície de um corpo sem atmosfera; e ({ "6" }) o orçamento de autenticação OSNMA/TESLA ({ "20" } bit/s de sobrecarga = ~{ "40" } % de uma mensagem de navegação AFS de { "50" } bit/s, latência de divulgação de chave, falsificação de { "2" }^-40). Um corpo vazio reproduz a linha de base P1; toda entrada tem valor padrão e pode ser substituída. Os subresultados VALIDATED carregam a referência independente do seu módulo de origem (radiometria em dB de forma fechada; ida e volta do J/S inverso; diagrama de Airy contra Bessel de A&S e geometria de calota esférica; entrada em captura de DLL/PLL contra Kaplan & Hegarty; identidade de horizonte tangente esférico contra eo_payload; dimensionamento dos campos do SIS-ICD do OSNMA). MODELLED: as magnitudes representativas de geometria e potência e os valores específicos das células do mapa de captura. Não é um produto de segurança certificado.

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Uma execução de <c1/> resume-se assim: lunar-attack-surface | AFS -140.6 dBW, surplus { "14.4" } dB (band -17.9–-12.0, { "25" }×/28× surplus) | spoof@{ "1000" } m { "0.000" } W | footprint { "3" }% cap, limb false | spoof-capture true (lock { "0.00" } s) | mast reach { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% of { "50" } bit/s), { "30" } s latency | footprint sweep 7x5 (alt 20-500 km x HPBW 1.83-29.20 deg), capture 0.6-42.9% | limb NOT reached on this grid (best -0.8 dB, { "3.8" } dB short; needs { "19.8" } dBW vs { "16.0" } dBW)

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-781a7094b955 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

# text
# c1: scenarios/lunar-attack-surface.toml
seg-87e0c97de011 = O exemplo <c1/> define, entre outros:

# text
seg-6ea8f1132b57 = linear

# text
seg-8b701f465117 = log

# attr:alt
seg-de295af20c55 = O gráfico que o motor escreve para scenarios/lunar-attack-surface.toml, tipo de cenário lunar-attack-surface

# text
seg-c853e3e832c0 = <b>MODELLED</b> Varredura em dois eixos da área de captura na superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de operação po. Referência independente (InternalConsistency): inclusão de conjuntos: a razão interferidor-sinal entra como um deslocamento uniforme em decibéis, de modo que o conjunto capturado com maior potência de transmissão contém o conjunto com menor potência e a fração só pode aumentar -- uma propriedade que o diagrama de Airy NÃO fornece em largura de feixe ou altitude, onde a região capturada se rompe em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada fornece a fração de disco capturada de um transmissor orbital lunar

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED: as magnitudes representativas de geometria e potência e os valores específicos das células do mapa de captura. (catálogo de tipos de cenário (<c1/>))

# text
seg-95be70748647 = A área de captura em função da altitude e da largura de feixe é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Próximo</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Anterior</s1>lunar-ascent
