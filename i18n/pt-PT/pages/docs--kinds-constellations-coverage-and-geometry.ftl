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

# text
seg-3f749aef8d89 = PNT de espaço profundo em Marte: uma constelação simulada de retransmissores MARCONI (retransmissores areoestacionários + inclinados que difundem em sentido único + retransmitem em sentido duplo para uma estação de espaço profundo) navega um utilizador de referência (transfer | lmo | surface) através do estimador de fusão radiométrica conjunta de sentido único/duplo. Indica a geometria/visibilidade por época, o RMS alcançado face à verdade e a covariância formal (posição 1σ / 3σ) — uma figura de mérito simulada e honesta, NÃO um nível de proteção certificado.

# attr:alt
seg-c564dca90854 = O gráfico que o motor escreve para scenarios/mars-pnt-lmo.toml, tipo de cenário mars-pnt

# text
seg-cb4262b66b8f = Disponibilidade GNSS + DOP a partir de uma constelação orbital (Walker / TLE / RINEX).

# attr:alt
seg-3b652c0da6de = O gráfico que o motor escreve para scenarios/orbit-rinex.toml, tipo de cenário orbit

# text
seg-a4bdfc291fce = Previsão de passagens sobre estações em terra: as passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação aparente máxima, duração) de uma órbita circular, como elementos médios SGP4 no início da janela, sobre uma estação acima de uma máscara de elevação ao longo de uma janela, com o tempo total de acesso. Propagação SGP4/SDP4 no referencial fixo à Terra IAU 2006/2000A (UT1 - UTC e movimento polar opcionais), refração troposférica da ITU-R P.834-9 e o tempo de luz da ligação descendente (ambos ativos por predefinição), cruzamentos resolvidos até { "1e-7" } s e a culminação por pesquisa de secção áurea. A geometria da passagem é VALIDATED face ao Orekit { "13.1.8" } em estações ao nível do mar; a órbita e a estação do cenário são entradas ilustrativas.

# attr:alt
seg-a09be8c586e3 = O gráfico que o motor escreve para scenarios/passes.toml, tipo de cenário passes

# text
seg-0549bc926a9b = O sistema solar completo numa época, para PNT (posicionamento, navegação e temporização) em torno de qualquer corpo. Para o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã, indica a posição e a velocidade heliocêntricas no ICRF (Referencial Celeste Internacional, equatorial J2000), a distância heliocêntrica e a longitude e latitude eclípticas J2000, o parâmetro gravitacional, o raio equatorial e médio, J2 quando publicado e o seu raio de referência, o período de rotação sideral, o polo IAU e o meridiano de origem na época, uma trajetória orbital amostrada ao longo de uma revolução (heliocêntrica para os planetas, centrada no corpo principal para as luas), e o tempo de luz, a distância unidirecional e bidirecional, o atraso de Shapiro solar e a separação do Sol a partir de um corpo observador (predefinição: Terra); as ligações adicionais de origem/destino recebem o mesmo tratamento. Posições: os elementos keplerianos JPL de Standish e Williams (Tabela { "1" } para { "1800" } AD a { "2050" } AD, Tabelas 2a/2b para { "3000" } BC a { "3000" } AD) com o erro nominal de cada planeta, a série lunar de Montenbruck & Gill para a separação Terra-Lua, elementos médios JPL com a taxa de rotação síncrona IAU para as luas marcianas e galileanas, e o modelo de rotação IAU para Titã. Tempo de luz: resolução radiométrica de ponto fixo, com o emissor na sua posição retardada; newtoniano, com o atraso de Shapiro indicado em separado. VALIDATED face ao JPL Horizons (DE441) dentro do dobro do erro nominal: de Mercúrio a Saturno e a Terra a partir da Tabela { "1" } (pior caso { "1.87" } vezes o nominal) e os oito planetas a partir das Tabelas 2a/2b (pior caso { "1.71" } vezes), e o tempo de luz da Terra a Marte e a Júpiter. MODELLED, cada linha etiquetada: Úrano e Neptuno a partir da Tabela { "1" } ({ "2.0" } e { "5.2" } vezes o erro nominal face ao DE441), Plutão (a linha de { "1992" }; sem erro indicado), a Lua e as sete luas (medidas face ao Horizons, sem limite publicado).

# attr:alt
seg-537aa8010e50 = O gráfico que o motor escreve para scenarios/solar-system-tour.toml, tipo solar-system

# text
seg-4e31c8daf798 = Registo

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Fonte: <c1/>

# text
seg-34a6079984a7 = Constelações, cobertura e geometria (família de tipos de cenário)

# text
seg-6800289a282d = { "7" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Páginas de tema: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Executar uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Folha de contactos dos gráficos que o motor escreve para os tipos da família Constelações, cobertura e geometria

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Efemérides e rasto no solo: propaga um satélite (TLE→SGP4 ou órbita analítica) e emite o seu estado TEME/GCRS (posição + velocidade), a posição ITRF/ECEF, a lat/lon/alt WGS-84 do ponto subsatélite e, por passo, st

# text
seg-d021c1b23dbc = Projeto de constelações à escala: padrões Walker DELTA e Walker STAR na convenção i: T/P/F (nós distribuídos por { "360" } ou { "180" } deg, espaçamento no plano { "360" }<em>P/T, desfasamento entre planos { "360" }</em>F/T), explícito

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = O sistema solar completo numa época, para PNT (posicionamento, navegação e temporização) em torno de qualquer corpo.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Posicionamento em torno de qualquer corpo do sistema solar: um orbitador ou um módulo de aterragem à superfície em torno de um corpo central escolhido pelo nome (Marte, a Lua, Europa, Ganimedes, Titã e o resto do catálogo do sistema solar), navi

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = PNT de espaço profundo em Marte: uma constelação de relés MARCONI simulada (relés areoestacionários + inclinados que emitem em sentido único + retransmitem em sentido duplo para uma estação de espaço profundo) navega um utilizador de referência (transferência / l

# text
seg-cc85d9962c25 = Previsão de passagens de estações terrestres: as passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação aparente máxima, duração) de uma órbita circular, como elementos médios SGP4 no início da janela, sobre uma estação acim

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Opcionais: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Registo:</b> MODELLED { "4" } · VALIDATED { "4" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Campos obrigatórios: <c1/>. Opcionais: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Registo:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>ephemeris</a1>.

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
seg-47aaf1afd6ec = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Registo:</b> MODELLED { "2" } · VALIDATED { "3" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Registo:</b> MODELLED { "2" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Anterior</s1>Relógios, temporização e holdover

# text
seg-90ff7426b999 = <s1>Seguinte</s1>Medições GNSS, posicionamento e integridade
