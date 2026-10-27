# docs--kind-gnss-ssv: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/gnss-ssv.md
seg-1b94e5a24a2d = Fonte: <c1/>

# text
# c1: gnss-ssv
seg-ee3ecc6e0330 = <c1/> (tipo de cenário)

# text
seg-d07af7221334 = Tipo de cenário do motor v{ $version }, família <a1>Navegação de utilizadores no espaço</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-d6d7bca305dc = Disponibilidade e intensidade de enlace de GNSS MODELLED no Space Service Volume e além: para um utilizador numa esfera (a camada global do folheto do ICG) ou numa trajetória kepleriana (de LEO a transferência lunar), conta, por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e para todas em conjunto, os sinais utilizáveis acima de um limiar de C/N0 - disponibilidade de pelo menos um e de quatro sinais, duração máxima de interrupção, C/N0 recebido, diluição de precisão, enlaces de lóbulo principal contra lóbulo lateral - com um diagrama de transmissão do folheto, paramétrico ou fornecido pelo utilizador, efeitos opcionais de ionosfera, plasmasfera e atmosfera em raios rasantes ao limbo e um projeto opcional de recetor de sinal fraco; também um filtro de Kalman estendido de GNSS a bordo para naves em HEO e em transferência lunar (dinâmica orbital, pressão de radiação solar, terceiros corpos, relógio) e a navegação relativa de uma formação de várias naves por pseudodistâncias de diferença simples. Conferido contra as tabelas do folheto SSV do ICG sob um pré-registo (xval/gnss-ssv)

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-d739ae994bf0 = Uma execução de <c1/> resume-se assim: trajetória gnss-ssv de { "497" } a { "58622" } km de altitude: l1 combinado { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (interrupção máx. { "0" } min); l5 combinado { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (interrupção máx. { "0" } min)

# text
# c1: shell|trajectory|navigation
seg-79d2e350ed73 = Campos obrigatórios: <c1/>

# text
# c1: name
# c2: constellations
# c3: transmit
# c4: receiver
# c5: atmosphere
# c6: formation
seg-7fc75803140d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-cebc76420d69 = O exemplo <c1/> define, entre outros:

# text
seg-ce3b64e8c1f4 = [l1, l5]

# text
seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

# text
seg-b02a3ef32d54 = HEO, antenas de alto ganho no nadir e do tipo patch no zênite, paramétrico s

# text
seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

# text
seg-3421a66993bd = heo

# text
seg-8974ff39f695 = parametric

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-8ac8f00f6c77 = 1/m^{ "3" }

# text
seg-15ca016a7a4f = Rótulo do resultado (o do motor): MODELLED: um varrimento geométrico e de balanço de enlace. O diagrama do folheto é um lóbulo principal de potência constante, o diagrama paramétrico um substituto representativo, e o meio dos raios rasantes ao limbo um modelo simples declarado; nada aqui é uma medição de um sinal no espaço. Os valores de disponibilidade e de interrupção seguem o método do

# attr:alt
seg-7dae5e291c8b = O gráfico que o motor gera para scenarios/gnss-ssv-heo.toml, tipo de cenário gnss-ssv

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Os varrimentos de disponibilidade do tipo de cenário <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (utilizador, época) com pelo menos um e pelo menos quatro sinais e a interrupção mais longa, para um utilizador numa esfera

# text
# c1: gnss-ssv
# c2: [navigation]
seg-07c94d5ad15c = <b>MODELLED</b> O modo <c2/> do tipo de cenário <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, viés e deriva do relógio do recetor, uma escala de pressão de radiação solar) sobre pseudodistâncias cuja disponibilidade, ruído e C/N0 vêm do mesmo enlace

# text
# c1: gnss-ssv
# c2: [formation]
seg-41bfe74c6f6f = <b>MODELLED</b> O modo <c2/> do tipo de cenário <c1/>: um líder e subordinados executam cada um o filtro absoluto; a posição do subordinado relativamente ao líder é estimada por subtração das estimativas absolutas e por um filtro relativo sobre pseudodistâncias de diferença simples

# text
# c1: gnss-ssv
seg-de9a2a5b5f04 = <b>MODELLED</b> Os varrimentos de disponibilidade do tipo de cenário <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (utilizador, época) com pelo menos. Referência independente (ExternalDataset): O folheto do ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), ele próprio uma simulação, comparado sob um pré-registo firmado antes da execução (xval/gnss-ssv/PREREGISTRATION.md; resultados em xval/gnss-ssv/RESULTS.md, fixados por tests/ssv_booklet_results.rs, inclusive as falhas). Execução { "1" } na leitura pré-registada: as constantes de potência mínima irradiada e o limiar lunar coincidem (S0, S6 atingidos); o SSV superior e inferior, limiar de RF

# text
seg-f0b778c4922a = <b>MODELLED</b> Uma ionosfera de Chapman, uma plasmasfera do tipo Gallagher e uma atmosfera neutra (curvatura por refratividade, absorção por oxigénio, desfocalização) integradas ao longo da reta. Referência independente (InternalConsistency): Formas fechadas e magnitudes publicadas nos testes (o pico de uma camada de Chapman e a curvatura do limbo da superfície, alguns TECU de plasmasfera num raio GPS-GEO); o projeto do recetor reutiliza os modelos de aquisição e de malha de seguimento e os seus testes. Nenhum dado medido de sondagem de limbo ou de receção de sinal fraco é comparado com ele

# text
# c1: gnss-ssv
# c2: [navigation]
seg-77cef183420e = <b>MODELLED</b> O modo <c2/> do tipo de cenário <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, viés e deriva do relógio do recetor, uma escala de pressão de radiação solar. Referência independente (InternalConsistency): Verdade simulada contra a própria estimativa do filtro (o erro de estimação normalizado ao quadrado médio de um filtro consistente é cerca de { "3" } para a posição) e determinismo para uma semente fixa. Nenhum dado de voo ou registado de GNSS em órbita alta é comparado; o Sol e a Lua são substitutos circulares de baixa precisão

# text
# c1: gnss-ssv
# c2: [formation]
seg-429e154cd691 = <b>MODELLED</b> O modo <c2/> do tipo de cenário <c1/>: um líder e subordinados executam cada um o filtro absoluto; a posição do subordinado relativamente ao líder é estimada subtra. Referência independente (InternalConsistency): A mesma verdade simulada do filtro absoluto: o erro do filtro relativo contra o estado relativo verdadeiro, e a verificação de que tem um desempenho pelo menos tão bom como o de subtrair duas soluções absolutas independentes. Nenhum dado de formação em voo é comparado

# text
# c1: label
seg-1dd1beb01075 = MODELLED: um varrimento geométrico e de balanço de enlace. O diagrama do folheto é um lóbulo principal de potência constante, o diagrama paramétrico um substituto representativo, e o meio dos raios rasantes ao limbo um modelo simples declarado; nada aqui é uma medição de um sinal no espaço. Os valores de disponibilidade e de interrupção seguem o método do folheto do ICG Space Service Volume (UN ST/SPACE/75) e são conferidos contra as suas tabelas em xval/gnss-ssv/. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e9c2dedbc971 = Disponibilidade e intensidade de enlace de GNSS MODELLED no Space Service Volume e além: para um utilizador numa esfera (a camada global do folheto do ICG) ou numa trajetória kepleriana (de LEO a transferência lunar), conta, por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e para todas em conjunto, os sinais utilizáveis acima de um limiar de C/N0 - disponibilidade de pelo menos um e de quatro sinais, duração máxima de interrupção, C/N0 recebido, (catálogo de tipos de cenário (<c1/>))

# text
seg-3add0e744c54 = MODELLED: o diagrama é representativo, não medido; o meio é um modelo simples declarado (docs/SSV.md). (comentário do ficheiro de cenário, linha { "14" })

# text
seg-6b4655dd5270 = A disponibilidade de sinais GNSS no Space Service Volume e além, comparada com o folheto SSV do ICG, é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: gnss-ssv
seg-a9e1798308df = Os efeitos de ionosfera, plasmasfera e atmosfera em raios rasantes ao limbo sobre sinais GNSS e o projeto de recetor de sinal fraco no tipo de cenário <c1/> são MODELLED, não validados: conferidos contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-132be2813c10 = O filtro de navegação GNSS a bordo para espaçonaves em órbita alta e em transferência lunar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f9405de9adb8 = A navegação relativa de uma formação de várias espaçonaves em órbita altamente elíptica a partir de GNSS é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-4881f925ea7f = Página da família: <a1>Navegação de utilizadores no espaço</a1>

# text
seg-4b72df59b3f9 = Página do tópico: <a1>SSV.md</a1>

# text
seg-c9ac9a99bcbb = <s1>Anterior</s1>gnss-sim

# text
seg-9df48482a140 = <s1>Seguinte</s1>gravity-map
