# docs--kinds-constellations-coverage-and-geometry: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-e7dad1a1ecba = Posicionamento em torno de qualquer corpo do sistema solar: um orbitador ou um módulo de aterragem na superfície em torno de um corpo central escolhido pelo nome (Marte, a Lua, Europa, Ganimedes, Titã e o restante do catálogo do sistema solar), a navegar com pseudodistâncias unidirecionais de uma pequena constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do próprio corpo, um relógio de utilizador desconhecido) e, opcionalmente, uma medida de distância bidirecional de espaço profundo, sem relógio, a partir da Terra, cuja direção e distância vêm das efemérides analíticas do sistema solar em cada época. As linhas de visada são bloqueadas pela esfera média do corpo, e um utilizador na superfície também precisa da máscara de elevação. Por época: relés em vista, se a Terra está acima do limbo, o GDOP e o PDOP apenas da constelação (diluição de precisão geométrica e de posição), a incerteza formal de posição de um sigma com e sem a linha da Terra, e o erro de uma solução de posição por mínimos quadrados de Gauss-Newton com semente, em cada caso; ao longo da execução: disponibilidade, visibilidade da Terra, PDOP mediano, erro RMS e sigma formal mediano, além do tempo de luz Terra-corpo, da ida e volta, do atraso de Shapiro e da separação do Sol na época. MODELLED: as órbitas dos relés, os níveis de ruído e o modelo de medida instantâneo são escolhas de modelação, não validadas contra dados de navegação de uma missão; as constantes do corpo são os valores publicados citados em body.rs, e a geometria da Terra herda os rótulos das efemérides do sistema solar.

# attr:alt
seg-6f341acbe994 = O gráfico que o motor escreve para scenarios/mars-orbit-pnt.toml, tipo de cenário body-pnt

# text
seg-de173c9f4034 = Projeto de constelações em escala: padrões Walker DELTA e Walker STAR na convenção i: T/P/F (nós distribuídos em { "360" } ou { "180" } graus, espaçamento no plano { "360" }<em>P/T, deslocamento de fase entre planos { "360" }</em>F/T), listas explícitas de elementos e projetos de várias camadas orbitais, várias constelações numa única execução, em torno da Terra, da Lua, de Marte ou de qualquer outro planeta, de Plutão ou de uma lua importante, com as constantes do módulo body (as mesmas que os tipos de cenário solar-system e body-pnt usam). PREDEFINIÇÕES a partir de elementos nominais publicados: gps-baseline e gps-expandable (as { "24" } posições e os seis pares expansíveis frente/trás do GPS Standard Positioning Service Performance Standard, 5.ª edição { "2020" }, Tabelas 3.2-1 a 3.2-3), galileo (Walker 24/3/1 a { "29 599.801" } km e { "56" } graus, Galileo Open Service Service Definition Document edição { "1.1" } Tabelas { "1" } e { "23" }), beidou e beidou-meo (Walker 24/3/1 a { "21 528" } km e { "55" } graus mais três satélites geoestacionários a { "80" }, { "110.5" } e { "140" } graus L e três satélites geossíncronos inclinados a { "55" } graus, BeiDou Open Service Performance Standard { "3.0" } secção { "4.1" }; a fase MEO e o cruzamento geossíncrono inclinado em { "118" } graus L são modelados porque a norma não os especifica) e glonass (24/3/1 a { "19 100" } km e { "64.8" } graus a partir da fórmula de posições do GLONASS Interface Control Document edição { "5.1" } secção { "5.2" }). COBERTURA E DILUIÇÃO DE PRECISÃO: sobre uma grelha de latitude/longitude e uma janela amostrada com máscara de elevação, o número de satélites à vista, GDOP, PDOP, HDOP e VDOP por célula, a disponibilidade (uma solução com PDOP igual ou inferior a um limiar, { "6" } por predefinição) por célula, globalmente (ponderada por área) e no pior local, com um relógio de recetor por constelação, salvo se clock = "common". Escala para milhares de satélites: a visibilidade é um produto escalar contra o semiângulo de cobertura de cada satélite, e os satélites são agrupados em bandas pela latitude do ponto subsatélite a cada época, de modo que uma linha da grelha testa apenas os que podem estar à vista; o relatório conta os testes de pares poupados. O JSON traz os mapas da grelha e traços no solo por satélite com amostragem reduzida. VALIDATED: o gerador Walker contra a Tabela { "23" } do Galileo OS SDD e a fórmula de posições do GLONASS ICD, a predefinição do GPS contra a coluna publicada de cruzamento equatorial da Tabela 3.2-1 do SPS PS, e a distribuição global de HDOP da linha de base do GPS contra o Apêndice B do SPS PS (mediana { "0.94" }, { "95" }% { "1.25" }, média { "0.96" }, tolerância { "0.03" }). MODELLED: órbitas de dois corpos com J2 secular opcional, um corpo esférico, apenas visibilidade geométrica (sem potência de sinal, estado de saúde ou terreno), e a fase relativa entre sistemas diferentes, que não é um retrato de nenhuma data real.

# attr:alt
seg-899e728ad9bd = O gráfico que o motor gera para scenarios/leo-pnt-mega-shell.toml, tipo de cenário constellation-design

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemérides e traço no solo: propaga um satélite (TLE→SGP4 ou órbita analítica) e emite o seu estado TEME/GCRS (posição + velocidade), a posição ITRF/ECEF, latitude/longitude/altitude subsatélite WGS-84 e, a cada passo, azimute/elevação/distância da estação + taxa de variação da distância (Doppler). O satélite vem de um <c1/> ou de uma <c2/> analítica com a sua <c3/> (um <c4/> prevalece quando ambos são dados); com um <c5/>, um <c6/> substitui a própria época do TLE como t = { "0" }.

# attr:alt
seg-0fd3c58fde09 = O gráfico que o motor gera para scenarios/ephemeris.toml, tipo de cenário ephemeris
