# docs--kind-lunar-attack-surface: translations (pt-PT)

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Orçamento de enlace de J/S geométrico, C/N₀ antijamming, perda de sincronismo por satélite. Referência independente (InternalConsistency): Equação do orçamento de enlace de C/N₀ antijamming conferida contra uma nova derivação independente em numpy (partilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } ronda { "2" }, bloqueado (permanece MODELLED): a queda de C/N0 medida no JammerTest { "2024" } contra uma previsão do orçamento de enlace (pré-registada 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e o apontamento da antena F8.1 em

# text
seg-143f3f1cc521 = A resiliência a jamming em ambientes sem GNSS é MODELLED, não validada: verificada contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-004c56ded47f = Superfície de ataque à segurança dos sinais de navegação à superfície lunar (P1): compõe as análises abertas de segurança de sinais numa única execução acessível por binário. Indica ({ "1" }) a potência recebida do AFS e o seu EXCEDENTE de potência face a uma referência GPS terrestre, bem como a banda de sensibilidade de 12-18 dB, como uma verdadeira varredura multieixo sobre as entradas da ligação (nível de referência x EIRP x distância oblíqua), com a reconciliação dos fatores lineares de 25x arredondado / 28x não arredondado. REVISTO (regra R4): isto indicava um DÉFICE de potência de { "15.6" } dB e um fator de 32x/36x até a referência GPS ser corrigida de -125 / -128.5 (que são os valores em dBm) para -155 / -158.5 dBW, os valores da ICD-GPS-200 que o módulo de jamming sempre usou. O sinal inverte-se: o sinal AFS lunar modelado é { "14.4" } dB MAIS FORTE do que o GPS L1 C/A terrestre, não mais fraco. A própria potência recebida não se alterou um único bit, e o fator linear é o antigo dividido por exatamente { "1000" }, que é exatamente o desvio de { "30" } dB entre dBm e dBW; ({ "2" }) a potência de transmissão exigida ao atacante para falsificar (J/S = { "3" } dB) e para negar (J/S = { "30" } dB) a cada distância de afastamento, o inverso da ligação J/S; ({ "3" }) a pegada orbital de captura sob um diagrama de antena real de abertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), uma calota sub-hemisférica limitada pela altitude cujo limbo NÃO é capturado; ({ "4" }) um resultado calculado de atracão por captura de spoofing no laço de seguimento (um spoofer de código adaptado, com uma dada vantagem de potência e desvio de código, arrasta efetivamente o DLL/PLL?) em vez do limiar afirmado de { "3" } dB; ({ "5" }) o alcance do horizonte geométrico de um corpo sem atmosfera para um transmissor de superfície elevado; e ({ "6" }) o orçamento de autenticação OSNMA/TESLA ({ "20" } bit/s de sobrecarga = ~{ "40" } % de uma mensagem de navegação AFS de { "50" } bit/s, latência de divulgação de chaves, falsificação de { "2" }^-40). Um corpo vazio reproduz a linha de base P1; todas as entradas têm valor predefinido e podem ser substituídas. Os subresultados VALIDATED trazem a referência independente do respetivo módulo de origem (radiometria em dB de forma fechada; ida e volta do J/S inverso; diagrama de Airy face a Bessel de A&S e à geometria da calota esférica; atracão DLL/PLL face a Kaplan & Hegarty; identidade do horizonte tangente esférico face a eo_payload; dimensionamento de campos do ICD de SIS do OSNMA). MODELLED: as magnitudes representativas de geometria/potência e os valores específicos das células do mapa de captura. Não é um produto de segurança certificado.

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Uma execução de <c1/> resume-se assim: lunar-attack-surface | AFS -140.6 dBW, excedente de { "14.4" } dB (banda -17.9–-12.0, excedente de { "25" }×/28×) | spoof@{ "1000" } m { "0.000" } W | pegada de { "3" }% de calota, limbo falso | captura por spoofing verdadeira (bloqueio { "0.00" } s) | alcance do mastro { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% de { "50" } bit/s), latência de { "30" } s | varredura da pegada 7x5 (alt 20-500 km x HPBW 1.83-29.20 graus), captura 0.6-42.9% | limbo NÃO alcançado nesta grelha (melhor -0.8 dB, { "3.8" } dB aquém; precisa de { "19.8" } dBW vs { "16.0" } dBW)

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
seg-c853e3e832c0 = <b>MODELLED</b> Varredura de dois eixos da pegada de captura à superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de funcionamento. Referência independente (InternalConsistency): Inclusão de conjuntos: a razão sinal-interferência entra como um desvio uniforme em decibéis, pelo que o conjunto capturado a uma potência de transmissão mais alta contém o conjunto a uma mais baixa e a fração só pode aumentar -- uma propriedade que o diagrama de Airy NÃO dá em largura de feixe nem em altitude, onde a região capturada se parte em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada dá a fração de disco capturada de um transmissor orbital lunar

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED: as magnitudes representativas de geometria/potência e os valores específicos das células do mapa de captura. (catálogo de tipos de cenário (<c1/>))

# text
seg-95be70748647 = A pegada de captura em função da altitude e da largura de feixe é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Seguinte</s1>lunar-beacon
