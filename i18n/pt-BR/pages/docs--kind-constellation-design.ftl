# docs--kind-constellation-design: translations (pt-BR)

# text
seg-e27476e37522 = Terra

# text
seg-37d29d8303fe = km

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-670191cf797f = Página do tópico: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: docs/kinds/by-kind/constellation-design.md
seg-f305ed6dc164 = Fonte: <c1/>

# text
# c1: constellation-design
seg-f708c26a5139 = <c1/> (tipo de cenário)

# text
seg-de173c9f4034 = Projeto de constelações em escala: padrões Walker DELTA e Walker STAR na convenção i: T/P/F (nós distribuídos em { "360" } ou { "180" } graus, espaçamento no plano { "360" }<em>P/T, deslocamento de fase entre planos { "360" }</em>F/T), listas explícitas de elementos e projetos de várias camadas orbitais, várias constelações em uma única execução, em torno da Terra, da Lua, de Marte ou de qualquer outro planeta, de Plutão ou de uma lua importante, usando as constantes do módulo body (as mesmas que os tipos de cenário solar-system e body-pnt usam). PREDEFINIÇÕES a partir de elementos nominais publicados: gps-baseline e gps-expandable (as { "24" } posições e os seis pares expansíveis frente/trás do GPS Standard Positioning Service Performance Standard, 5ª edição { "2020" }, Tabelas 3.2-1 a 3.2-3), galileo (Walker 24/3/1 a { "29 599.801" } km e { "56" } graus, Galileo Open Service Service Definition Document edição { "1.1" } Tabelas { "1" } e { "23" }), beidou e beidou-meo (Walker 24/3/1 a { "21 528" } km e { "55" } graus mais três satélites geoestacionários a { "80" }, { "110.5" } e { "140" } graus L e três satélites geossíncronos inclinados a { "55" } graus, BeiDou Open Service Performance Standard { "3.0" } seção { "4.1" }; a fase MEO e o cruzamento geossíncrono inclinado em { "118" } graus L são modelados porque a norma não os especifica) e glonass (24/3/1 a { "19 100" } km e { "64.8" } graus a partir da fórmula de posições do GLONASS Interface Control Document edição { "5.1" } seção { "5.2" }). COBERTURA E DILUIÇÃO DE PRECISÃO: sobre uma grade de latitude/longitude e uma janela amostrada com máscara de elevação, o número de satélites à vista, GDOP, PDOP, HDOP e VDOP por célula, a disponibilidade (uma solução com PDOP igual ou inferior a um limiar, { "6" } por padrão) por célula, globalmente (ponderada por área) e no pior local, com um relógio de receptor por constelação, a menos que clock = "common". Escala para milhares de satélites: a visibilidade é um produto escalar contra o semiângulo de cobertura de cada satélite, e os satélites são agrupados em faixas pela latitude do ponto subsatélite a cada época, de modo que uma linha da grade testa apenas os que podem estar à vista; o relatório conta os testes de pares economizados. O JSON traz os mapas da grade e traços no solo por satélite com amostragem reduzida. VALIDATED: o gerador Walker contra a Tabela { "23" } do Galileo OS SDD e a fórmula de posições do GLONASS ICD, a predefinição do GPS contra a coluna publicada de cruzamento equatorial da Tabela 3.2-1 do SPS PS, e a distribuição global de HDOP da linha de base do GPS contra o Apêndice B do SPS PS (mediana { "0.94" }, { "95" }% { "1.25" }, média { "0.96" }, tolerância { "0.03" }). MODELLED: órbitas de dois corpos com J2 secular opcional, um corpo esférico, apenas visibilidade geométrica (sem potência de sinal, estado de saúde ou terreno), e a fase relativa entre sistemas diferentes, que não é um retrato de nenhuma data real.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-21fbd84bfba1 = Uma execução de <c1/> resume-se assim: constellation-design: { "5000" } satélites (LEO-PNT) em torno da Terra; disponibilidade { "99.22" }% (PDOP <= { "3" } com máscara de { "20" } graus), pior local { "0.00" }%, PDOP mediano { "1.11" }, média de { "39.4" } à vista; { "648" } pontos de grade x { "12" } épocas (MODELLED)

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-af572ce1fd89 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-fd393ddc7d5d = O exemplo <c1/> define, entre outros:

# text
seg-d72b4c5393e0 = earth

# text
seg-d9b3c54bd272 = common

# text
seg-6411970ba342 = delta

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-0a6f7f6c66c4 = km^3/s^{ "2" }

# text
seg-ab9b72b9ffce = Rótulo do resultado (o do motor): MODELLED - órbitas keplerianas de dois corpos (J2 secular opcional) em torno de um corpo esférico, visibilidade geométrica acima de uma máscara de elevação, diluição de precisão com todos à vista e um relógio de receptor por constelação, a menos que clock = "common"; sem potência de sinal, estado de saúde ou terreno. A geometria Walker e as publi

# attr:alt
seg-899e728ad9bd = O gráfico que o motor gera para scenarios/leo-pnt-mega-shell.toml, tipo de cenário constellation-design

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
# c1: constellation-design
seg-602493ac6987 = <b>VALIDATED</b> Os geradores do tipo de cenário <c1/>: padrões Walker delta e star na convenção T/P/F (espaçamento de nós 360/P ou 180/P, espaçamento no plano { "360" }·P/T, deslocamento de fase entre planos { "360" }·F/T), e as predefinições de 24 posições do GPS baseline e expandable, Gal

# text
# c1: constellation-design
seg-bdc81f37ad16 = <b>VALIDATED</b> O motor de cobertura de <c1/> na predefinição de 24 posições do GPS baseline sob as condições do Apêndice B do GPS Standard Positioning Service Performance Standard (SPS PS) (um dia sideral, { "287" } passos de cinco minutos, uma grade global de { "4" } x { "4" } graus com

# text
# c1: constellation-design
seg-1272200ad4f2 = <b>MODELLED</b> O tipo de cenário <c1/> além dos dois casos fixados: projetos explícitos e de várias camadas orbitais, várias constelações por execução com um relógio de receptor por constelação, a Terra, a Lua e Marte a partir das constantes de corpo, a predefinição do BeiDou Testes: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

# text
# c1: constellation-design
seg-0c64f22330d2 = <b>VALIDATED</b> Os geradores do tipo de cenário <c1/>: padrões Walker delta e star na convenção T/P/F (espaçamento de nós 360/P ou 180/P, espaçamento no plano { "360" }·P/T, des. Referência independente (ExternalDataset): Documentos de agências publicados: Galileo Open Service Service Definition Document edição { "1.1" } (European GNSS Service Centre) Tabelas { "1" } e { "23" }, a constelação de referência em 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edição { "5.1" } ({ "2008" }) seção { "5.2" }, a fórmula de posições para longitude do nó e argumento de latitude; GPS Standard Positioning Service Performance Standard 5ª edição (abril de { "2020" }) Tabelas 3.2-1, 3.2-2 e

# text
# c1: constellation-design
seg-87c4e19dc780 = <b>VALIDATED</b> O motor de cobertura de <c1/> na predefinição de 24 posições do GPS baseline sob o GPS Standard Positioning Service Performance Standard (SPS PS) Apêndice . Referência independente (ExternalDataset): GPS SPS PS 5ª edição (abril de { "2020" }) Apêndice B seções B.3.2.2 e B.3.2.3, a distribuição publicada de HDOP médio global da constelação baseline de 24 posições totalmente ocupada (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, média { "0.96" }), Tabela 3.8-1 (disponibilidade de PDOP) e Tabela B.3-1 (PDOP de conjunto de uma constelação degradada, usado apenas como limite superior), mais uma forma fechada derivada à mão para uma época. O VDOP e o PD

# text
# c1: constellation-design
seg-04289f7252cd = <b>MODELLED</b> O tipo de cenário <c1/> além dos dois casos fixados: projetos explícitos e de várias camadas orbitais, várias constelações por execução com um relógio de receptor por conste. Referência independente (InternalConsistency): Consistência interna: a varredura de elevação por força bruta, as reduções calculadas à mão e por orbit::dop, e a geometria Walker e geossíncrona de forma fechada. Órbitas de dois corpos com J2 secular opcional, um corpo esférico com a vertical local ao longo do raio, apenas visibilidade geométrica (sem potência de sinal, estado de saúde dos satélites, terreno ou perturbação de terceiro corpo), e a fase relativa entre sistemas tomada de diferentes re

# text
# c1: label
seg-00fa65d44cbd = MODELLED - órbitas keplerianas de dois corpos (J2 secular opcional) em torno de um corpo esférico, visibilidade geométrica acima de uma máscara de elevação, diluição de precisão com todos à vista e um relógio de receptor por constelação, a menos que clock = "common"; sem potência de sinal, estado de saúde ou terreno. A geometria Walker e as predefinições publicadas são conferidas contra o Galileo OS SDD, o GLONASS ICD e as tabelas de posições do GPS SPS Performance Standard, a (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-62f0fc16a247 = MODELLED: órbitas de dois corpos com J2 secular opcional, um corpo esférico, apenas visibilidade geométrica (sem potência de sinal, estado de saúde ou terreno), e a fase relativa entre sistemas diferentes, que não é um retrato de nenhuma data real. (catálogo de tipos de cenário (<c1/>))

# text
seg-3ef4276dd40b = O que a execução responde: satélites à vista, PDOP/HDOP/VDOP/GDOP por célula de { "10" } graus e a fração do tempo com PDOP igual ou inferior a { "3" } acima de uma máscara de { "20" } graus ao longo de duas horas. O ponto fraco que o mapa mostra são as calotas polares: nenhuma camada orbital alcança latitudes acima de cerca de { "82" } graus, de modo que um usuário perto de um polo vê todos os satélites em um lado do céu e a geometria vertical se degrada. MODELLED: um projeto ilustrativo, órbitas de dois corpos com J2, um corpo esf (comentário do arquivo de cenário, linhas { "17" } a { "21" })

# text
seg-c333d3fe22cd = Os mapas de cobertura e de diluição de precisão para projetos arbitrários de várias constelações em escala, em torno de qualquer corpo central, são MODELLED, não validados: conferidos contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-436504a8b26f = <s1>Anterior</s1>conflict-resilience

# text
seg-cba188459c80 = <s1>Próximo</s1>contact-schedule
