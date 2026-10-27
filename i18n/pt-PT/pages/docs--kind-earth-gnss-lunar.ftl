# docs--kind-earth-gnss-lunar: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = sem valor

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por conceção

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: docs/kinds/by-kind/earth-gnss-lunar.md
seg-9a399fed06c4 = Fonte: <c1/>

# text
# c1: earth-gnss-lunar
seg-886b3796afaa = <c1/> (tipo de cenário)

# text
seg-c8a8be4b8894 = Receção de GNSS da Terra à distância lunar, a camada de sinal fraco que o artigo sobre resiliência a conflitos nomeia e para a qual o motor não tinha modelo. Um satélite GNSS aponta a sua antena para a Terra; um recetor perto da Lua fica a cerca de quinze vezes o raio orbital de distância, de modo que três coisas pesam ao mesmo tempo. A Terra OCULTA O EIXO DE VISADA: a partir de { "26,560" } km ela subtende um semiângulo de { "13.9" } graus, de modo que qualquer raio dirigido à Lua deve deixar o transmissor com pelo menos esse afastamento do nadir, o que remove o pico do feixe antes de qualquer potência ser calculada. O que resta são A ORLA DO LÓBULO PRINCIPAL E OS LÓBULOS LATERAIS, o regime em que a carga útil LuGRE realmente operou em { "2025" }. E a perda no espaço livre é de cerca de { "208" } dB em L1, aproximadamente { "25" } dB a mais do que um utilizador terrestre paga. O relatório emite uma linha por satélite (ângulo fora do eixo, ocultação pela Terra, distância, perda de percurso, ganho de transmissão nesse ângulo, potência recebida, densidade de portadora sobre ruído) e agrega apenas os enlaces que superam o limiar de seguimento. TAMBÉM INDICA O CONDICIONAMENTO, porque é isso que define esta camada: cada satélite visível está dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas, a diluição de precisão é enorme, e uma solução de GNSS da Terra à distância lunar é uma observação de grau de TEMPORIZAÇÃO muito mais do que de grau de posição. MODELLED, e o diagrama de transmissão é o motivo: o ganho em função do ângulo é uma abertura circular uniforme (Airy), enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal moldado e lóbulos laterais que não são de Airy. Existem diagramas medidos e eles não estão incluídos aqui, de modo que ordenações e ordens de grandeza são significativas, mas o dB de um único satélite não é. DELIBERADAMENTE AUSENTES, cada uma tornando o balanço otimista: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda por polarização, apontamento ou implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA (distância mais direção inercial) em vez de uma consulta a efemérides, porque a grandeza sob teste é o enlace e a geometria do feixe. Elevar esta linha a validada exige um diagrama de transmissão medido e pontos normais do LuGRE; nenhum dos dois está no repositório e nenhum é inventado aqui.

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-75b6814c0091 = Uma execução de <c1/> resume-se assim: GNSS da Terra à distância lunar — { "24" } satélites, recetor a { "384400" } km Limbo da Terra visto da constelação: { "13.90" } graus fora do nadir — qualquer raio dirigido à Lua deve exceder isto { "22" } de { "24" } não ocultados; { "0" } superam o limiar de seguimento de { "25.0" } dB-Hz nenhum enlace atinge o limiar menos de dois enlaces passíveis de seguimento; sem dispersão angular a indicar menos de quatro enlaces passíveis de seguimento, ou uma geometria singular: sem DOP VARRIMENTO em { "64" } épocas / { "43082" } s: disponibilidade de sinal { "0.375" }, disponibilidade de SOLUÇÃO { "0.000" } enlaces passíveis de seguimento média { "0.75" }, máx. { "2" }; melhor C/N0 { "30.93" } dB-Hz; melhor PDOP nenhum Tome a disponibilidade de SOLUÇÃO como o prior desta camada, não a disponibilidade de sinal: um enlace é uma observação de relógio, quatro são uma posição. MODELLED: o ganho de transmissão é um substituto de abertura uniforme (Airy), não um feixe GPS medido, e nenhuma perda atmosférica, de polarização ou de implementação é aplicada — portanto o balanço aqui é otimista. Ordens de grandeza e ordenações são significativas; o dB de um satélite individual não é.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-6c0897da2efa = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-8c6bb203352d = O exemplo <c1/> define, entre outros:

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# attr:alt
seg-cf1dce5fc824 = O gráfico que o motor gera para scenarios/earth-gnss-lunar.toml, tipo de cenário earth-gnss-lunar

# text
seg-04f59a1e2ec2 = <b>MODELLED</b> Receção de GNSS da Terra à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo.

# text
seg-9531f6b14fc8 = <b>MODELLED</b> Receção de GNSS da Terra à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época ele calcula o off-. Referência independente (InternalConsistency): Identidades de forma fechada e consistência interna; NENHUMA referência independente externa é alegada. O semiângulo do limbo é conferido contra asin(R_earth/r_orbit) e a geometria contra ele; a perda no espaço livre, o núcleo de DOP e a propagação SGP4 que isto compõe são cada um validados externamente nas suas próprias linhas, e esta linha não herda o estado deles. POR QUE MODELLED, e é o diagrama de transmissão: o ganho em função do ângulo é um ilumina uniformemente

# text
# c1: kshana kinds --json
seg-6dfc5503f58f = MODELLED, e o diagrama de transmissão é o motivo: o ganho em função do ângulo é uma abertura circular uniforme (Airy), enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal moldado e lóbulos laterais que não são de Airy. (catálogo de tipos de cenário (<c1/>))

# text
seg-c40d3fd8c12e = O QUE É MODELLED, E PORQUE NÃO É VALIDATED O ganho de transmissão em função do ângulo é uma abertura circular iluminada uniformemente — um diagrama de Airy. Uma antena GPS L1 real é um arranjo helicoidal de doze elementos cujo diagrama medido tem um lóbulo principal moldado, deliberadamente com pico fora do eixo para uniformizar a potência sobre o disco da Terra, e lóbulos laterais que não são de Airy de modo algum. Existem diagramas medidos publicados; eles não estão incluídos neste (comentário do ficheiro de cenário, linhas { "29" } a { "35" })

# text
seg-01fa469abd95 = O GNSS da Terra à distância lunar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-2fd936b76f4a = <s1>Anterior</s1>contact-schedule

# text
seg-95a5aa0adeb3 = <s1>Seguinte</s1>entry-heating
