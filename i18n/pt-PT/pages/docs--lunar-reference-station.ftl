# docs--lunar-reference-station: translations (pt-PT)

# text
seg-f37311ad7ef0 = Saídas

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-9872e31ebd72 = Fontes

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
seg-38afa54b0306 = Fonte: <c1/>

# text
seg-e8ee3794bac6 = <b>MODELLED.</b> Sob os pressupostos indicados (a constelação, o seu erro de sinal no espaço, a exatidão do levantamento da estação, a latência da correção e a quantização da ligação, cada um deles uma entrada identificada com a sua fonte pública ou como ILLUSTRATIVE), o modelo produz os valores abaixo. Estes <b>não</b> constituem uma afirmação sobre o desempenho de qualquer sistema real. O Kshana <b>não</b> está afiliado nem é apoiado por nenhuma agência e não faz nenhuma alegação de TRL ou de herança de voo. Apenas consultivo.

# text
seg-22eb5bd00092 = Finalidade

# text
seg-25678ae41147 = O material público descreve uma estação de referência lunar no polo sul que monitoriza um serviço de navegação lunar, calcula correções diferenciais locais, mantém uma referência de tempo lunar num relógio atómico e transporta um retrorrefletor laser e um emissor VLBI para o referencial lunar (a classe descrita publicamente para o conceito NovaMoon da ESA; fontes abaixo). O Kshana já modela cada uma das partes em separado. Este estudo compõe-nas numa única análise aberta e reprodutível do que uma estação destas poderia fazer sob pressupostos públicos, e pré-regista-a para que possa ser avaliada face a resultados publicados e, eventualmente, a resultados de voo.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = ou <c1/> a partir de Python, de WebAssembly ou de <c2/> do servidor MCP com <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Mapa de cobertura e exatidão (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Para uma estação de referência diferencial num local polar sul conhecido: em cada ponto de utilizador de uma grelha em anel desde { "80" }° S até ao polo e em toda a região, ao longo de um dia de épocas e de ensaios de Monte Carlo, o erro de posição corrigido e não corrigido por percentil (3-D, horizontal, vertical), a disponibilidade com um motivo para cada época indisponível, a cobertura face a um limiar declarado antes da execução, os níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento da ligação de correção na estação e no pior ponto. Sem física nova: varre as funções testadas de <c1/> e reduz-se exatamente a esse tipo de cenário num só ponto, numa só época e num só ensaio.

# text
seg-94058315dfe4 = Entrada

# text
seg-7670cf4ceda3 = Predefinição

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Constelação (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) ou <c6/>

# text
seg-bfdd053b2611 = o conjunto da classe LCNS incluído na árvore

# text
seg-389db26524b4 = ILLUSTRATIVE na predefinição incluída; o exemplo de fontes públicas define quatro satélites e o período de { "24" } h a partir de S2 e S4, mantendo-se o conjunto de elementos ILLUSTRATIVE (nenhuma fonte o indica)

# text
seg-91231bdcc599 = ILLUSTRATIVE

# text
# c1: station_lat_deg
# c2: station_lon_deg
# c3: station_height_m
seg-6b9d48431e4b = Estação (<c1/>, <c2/>, <c3/>)

# text
seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

# text
seg-f32dcb376b51 = { "0.30" } m

# text
seg-93d78578585f = ILLUSTRATIVE (a alocação de realização do referencial incluída na árvore, ela própria MODELLED)

# text
# c1: orbit_err_m
# c2: clock_err_m
# c3: sise_sigma_m
# c4: sise_orbit_variance_fraction
seg-59286c0377ce = <c1/>, <c2/> ou <c3/> com <c4/>

# text
seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE na linha de visada { "65" } m)

# text
# c1: sise_sigma_m
seg-9a432ef35cac = ILLUSTRATIVE na predefinição incluída; o exemplo de fontes públicas define <c1/> = { "10" } / { "1.96" } m a partir de S4 p8

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bits

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Grelha (<c1/>, <c2/>) ou <c3/>

# text
seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } pontos)

# text
seg-e945f5407b12 = a região do estudo

# text
# c1: t_start_s
# c2: t_span_s
# c3: t_step_s
# c4: n_trials
seg-fed48a6c31be = Tempo (<c1/>, <c2/>, <c3/>), <c4/>

# text
seg-0fec404c8c7c = { "0" } s, um dia, { "600" } s, { "200" }

# text
seg-d35d88b0753b = { "20" } m em p95 na predefinição incluída ({ "1" } m no exemplo de fontes públicas)

# text
seg-fa7858b14f89 = declarado antes da execução; { "20" } m é ILLUSTRATIVE, dimensionado para os erros ilustrativos da predefinição

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-329ad585cd9b = ILLUSTRATIVE: não existe nenhum valor público

# text
seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

# text
# c1: units
# c2: tests/field_units_global.rs
# c3: availability
# c4: coverage_fraction
# c5: corrected_p_3d_m
# c6: corrected_p_h_m
# c7: corrected_p_v_m
# c8: uncorrected_p_3d_m
# c9: improvement_factor
# c10: hpl_max_m
# c11: vpl_max_m
# c12: hpl_below_alert_fraction
# c13: worst_point
# c14: coverage_radius_km
# c15: points[]
# c16: budget_at_station_and_at_edge
seg-c530b459b0ef = Todos os campos numéricos incluem uma unidade e uma classe de proveniência no bloco <c1/> do resultado (verificado por <c2/>). O bloco da região: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> por setor de azimute de { "30" }°; <c15/> por ponto; e <c16/>.

# text
seg-4aa380258574 = O que as verificações podem e não podem dizer

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/>: a redução a <c2/>, os limites de linha de base zero e de levantamento, a monotonia, os motivos de indisponibilidade, o determinismo e a salvaguarda de trabalho. Estes mostram que a varredura é o modelo que afirma varrer.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/>: um novo cálculo independente em numpy da aritmética sobre casos exportados, pré-registado antes de ser executado. As posições e os percentis atingiram os seus limiares; as correções da estação falharam os seus por arredondamento de dupla precisão (registado, com os seus valores, em <c2/>).

# text
seg-be6ecf79d22c = Nenhuma das duas verifica o modelo. O modelo de erro, a descorrelação de primeira ordem, os modelos de levantamento, de envelhecimento e de quantização e todos os limiares são do próprio projeto ou ILLUSTRATIVE.

# text
seg-d6f194e28401 = Máscaras de horizonte do terreno

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Uma secção opcional <c1/> (<c2/>) atribui à estação e a cada ponto de utilizador o seu próprio horizonte dependente do azimute, no formato de tabela de linha do horizonte de { "0.36" } (linhas <c3/>, lineares em azimute com continuidade em { "360" }°). Um satélite conta num local quando ultrapassa tanto <c4/> como o horizonte no seu azimute; uma época em que o horizonte deixa menos de quatro satélites num ponto, onde a máscara plana dá quatro, é registada como <c5/> (<c6/> mantém o seu significado de máscara plana). Duas fontes, combinadas pelo seu máximo ponto a ponto quando ambas são indicadas:

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = um perfil declarado, <c1/> ou <c2/> (aplicado em todos os pontos de utilizador), cada um com uma etiqueta <c3/> obrigatória;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = um horizonte obtido por marcha de raios sobre um DEM polar (<c1/>): círculos máximos da esfera lunar com curvatura exata, a partir de uma altura de mastro declarada (predefinição { "2" } m), a cada <c2/> (predefinição { "1" }°), até <c3/> (predefinição { "150" } km) ou ao limite da grelha. O repositório inclui um recorte do produto polar LOLA da LRO, de domínio público, <c4/>, reamostrado por média de blocos { "5" } × { "5" } para { "1200" } m e a cerca de ±{ "420" } km do polo (<c5/>: URL da fonte, SHA-256, licença, passos de recorte e de reamostragem);

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = ou, em vez de <c1/>, um mosaico DEM de latitude/longitude (<c2/>) no formato de texto <c3/> (um cabeçalho <c4/>, seguido das alturas em metros acima da esfera média, por linhas), com marcha de raios do mesmo modo, definindo o espaçamento em latitude o passo predefinido. O relatório reproduz o caminho, o SHA-256 e a extensão do mosaico (<c5/>). Um mosaico reamostrado a partir do recorte incluído dá à estação o horizonte do próprio recorte com uma diferença de { "0.22" }° (<c6/>). Não é incluído nenhum mosaico.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = As mesmas máscaras aplicam-se à grelha de <c1/> (<c2/>, <c3/> e <c4/>; um ponto da grelha fora do DEM mantém a máscara plana e é contado). Sem a secção, todos os documentos são idênticos byte a byte aos de uma execução sem ela.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Verificações: a marcha de raios reproduz horizontes em forma fechada (a depressão da esfera nua, uma cratera num planalto a partir do seu centro e fora dele, um cone rasterizado face ao cone analítico); o recorte incluído está orientado como a fonte (os fundos de Shackleton e Haworth baixos, o maciço de Malapert alto); um lançamento de raios independente em numpy sobre o recorte, pré-registado (<c1/>), concorda até { "5.5e-10" } deg em cinco locais, o que verifica a aritmética, não o terreno. Não foi reproduzido nenhum valor publicado de horizonte ou de iluminação polar, pelo que a linha continua MODELLED (linha do registo "Lunar terrain horizon masks from a stated profile or a polar DEM").

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> executa as entradas incluídas numa grelha de { "2" }° com { "100" } ensaios e o horizonte do DEM em todos os locais. O local da estação ({ "89" }° S, { "0" }° E) tem um horizonte máximo de cerca de { "4.0" }°, abaixo da máscara de { "5" }°, pelo que na estação o terreno não é limitante; nos pontos de utilizador, a média ponderada pela área do horizonte máximo de cada ponto é { "9.7" }° e o maior é { "26.3" }°. Face às mesmas entradas com a máscara plana, o erro 3-D p95 corrigido da região sobe de { "16.3" } m para { "18.6" } m e o maior HPL de { "480" } m para { "62" } km. A disponibilidade da região sobe de { "91.9" } % para { "93.0" } %: uma época é indisponível quando um ponto usa um satélite que a estação não vê, e um horizonte que esconda esse satélite ao ponto pode tornar a época disponível.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Terreno e máscara de horizonte: tratados em { "0.36" }, com limites.</b> As máscaras de horizonte por local, a partir de um perfil declarado ou do recorte do DEM LOLA incluído, são modeladas (acima). O que permanece: o recorte incluído tem { "1200" } m por píxel, pelo que o relevo abaixo de cerca de um quilómetro é suavizado e as médias de blocos rebaixam os picos agudos; um raio que sai do recorte (a cerca de { "420" } km do polo) termina aí; não há difração, multitrajeto do terreno nem obstrução parcial; as posições dos locais para a medição de distâncias permanecem na esfera média às alturas indicadas (o DEM define apenas o horizonte); o horizonte não é validado face a um valor externo. O local de exportação por satélite de <c1/> é mascarado como um ponto da grelha: com uma secção <c2/>, cada linha exportada inclui <c3/> e o relatório o horizonte do local (<c4/>); as contagens de antena em feixe continuam a contar todas as ligações que ultrapassam a máscara plana.

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Multitrajeto e hardware do recetor: tratados em { "0.36" } como opção facultativa, com limites.</b> Uma secção <c1/> (<c2/>) acrescenta multitrajeto <c3/> dependente da elevação no utilizador e na estação (a forma funcional da DO-229; na Lua todos os valores são ILLUSTRATIVE), com o multitrajeto da estação opcionalmente de Gauss-Markov de primeira ordem ao longo das épocas, ruído de código do DLL early-minus-late a partir de C/N0 e desvios entre canais por canal. O que permanece: a variação do centro de fase da antena e do atraso de grupo não é modelada; nenhuma medição lunar fixa os valores de multitrajeto; o bloco do orçamento da ligação de correção não inclui os termos do recetor.

# text
seg-677252c2d3e5 = Crescimento do erro de efemérides ao longo da latência: tratado em { "0.36" } como opção facultativa, com limites.

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> acrescenta um crescimento linear do erro de órbita difundido com a idade (1-sigma da distância <c2/>), além da reprojeção do erro congelado; o crescimento linear é o termo de primeira ordem de um erro de estado propagado (verificado a { "1" } % a { "600" } s face à propagação de dois corpos incluída na árvore). O que permanece: nenhuma fonte pública indica uma taxa de crescimento lunar (ILLUSTRATIVE); não há estrutura ao longo da trajetória nem radial; o bloco do orçamento da ligação de correção usa o modelo congelado. O adendo K5 (<c3/>, pré-registado em separado) executa K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s: falha em todos os casos ({ "369.8" } m, { "2315" } m, { "22797" } m face a um limiar de { "1.5" } m), como declarado antes da execução.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Estilo de solução (filtro, restrição de altura, três satélites): uma opção facultativa em { "0.36" }, com limites.</b> Uma secção <c1/> (<c2/>) acrescenta uma pseudomedição de altura, um mínimo de três satélites com ela e uma janela de mínimos quadrados ponderados de utilizador estático ao longo das épocas (uma posição partilhada, um relógio por época), que substitui um filtro. O que permanece: trata os erros das épocas como independentes, pelo que a média desce mais depressa do que desceria com erros correlacionados no tempo; é só para utilizador estático; não há filtro dinâmico, fase da portadora nem resolução de ambiguidades; o traço do caso (<c3/>) mostra a aritmética do instantâneo. O adendo de alegações publicadas com este modo é <c4/> (pré-registado em separado). Com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (definições ILLUSTRATIVE), o erro 3-D p95 corrigido de R300 desce de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não pontuado); K1 a K5 continuam a falhar e K6 passa, { "1" } de { "6" } como na execução registada. O pressuposto de independência da janela favorece-a.

# text
seg-4f8274f839a7 = Comparação com alegações publicadas

# text
seg-82391b00e1bc = MODELLED. Uma comparação deste modelo, executado sob os pressupostos públicos, com as alegações feitas pelas fontes. Não é uma afirmação sobre o desempenho de qualquer sistema real.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Fontes S1 a S5 (título, URL, data de obtenção, SHA-256, licença): <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Todas as alegações numéricas, citadas com a sua página e os pressupostos declarados e classificadas como comparáveis, parcialmente comparáveis ou não comparáveis: <c1/>. Nenhuma alegação é totalmente comparável, porque nenhuma fonte indica um percentil nem os elementos orbitais dos satélites.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Limiares, casos e entradas, submetidos em separado antes da execução (revisão { "2" }, 05bf9a19), e a execução registada: <c1/>. A conclusão está fixada em <c2/>.

# text
seg-069a652c402e = limiar

# text
seg-d6120708c062 = alegação (fontes)

# text
seg-5b480535b54b = este modelo

# text
seg-6231a005ccc9 = veredicto

# text
seg-45dc6ff5d546 = uma estação dá exatidão submétrica em todo o círculo de { "300" } km do polo sul (S1, S2, S3)

# text
seg-4da98cf6180b = cobertura { "0.00" }

# text
seg-70a79ec95bf4 = falha

# text
seg-cd0e9021aaa3 = o mesmo, círculo de { "600" } km (S2 p10, S3 p23)

# text
seg-ef9f2ee31c52 = submétrica com correções de código (S1, S2)

# text
seg-9f4e2b6991e8 = p95 3-D corrigido { "280.6" } m

# text
seg-ac3c99ec0d15 = <= { "1.5" } m

# text
seg-1b720f1677cc = "decimeter level" a partir de correções de pseudodistância (S3 p22, S5 p5)

# text
seg-ffa1c831a14f = { "280.6" } m

# text
seg-70368d910820 = <= { "0.15" } m

# text
seg-786f940b345e = falha (não poderia passar com o ruído de código de { "0.30" } m das fontes)

# text
seg-da761dde1cae = submétrica mantida com latência de { "600" } s (S2 p16)

# text
seg-2a9db96bd87f = { "293.0" } m

# text
seg-021336eb5623 = a mesma exatidão com linha de base de { "10" } km a { "500" } km (S2 p17)

# text
seg-62190343777c = razão { "1.39" }

# text
seg-7a33a168b020 = passa

# text
seg-e666f1eb7a59 = { "1" } de { "6" } limiares passa. A causa é a geometria. Nenhuma fonte publica os elementos orbitais da constelação. Nos elementos ILLUSTRATIVE incluídos na árvore, um utilizador e a estação partilham quatro satélites acima de { "5" } deg em apenas { "8" } % ({ "300" } km) e { "6" } % ({ "600" } km) das épocas, com geometria quase singular: o p95 não corrigido é { "3.8" } km, onde as fontes indicam < { "10" } m. As próprias simulações das fontes usaram um filtro, uma restrição de altura e três satélites em vista comum, o que este modelo de instantâneo não tem. A execução não reproduz, por isso, as alegações com esses elementos, e não constitui evidência de que as alegações estejam erradas. O resultado K6 que passa é uma razão entre duas grandezas dominadas pela geometria e nada diz sobre a descorrelação. Um conjunto publicado dos elementos da constelação seria pontuado sob os mesmos limiares, como uma segunda execução datada.

# text
seg-1da5fcf7bbf5 = Previsão pré-registada

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Uma previsão pré-registada, congelada no commit <c1/> com as entradas de fontes públicas, com o seu protocolo de pontuação: <a1><c2/></a1>. É uma previsão, não uma validação, e todos os valores nela são dominados pelo conjunto de elementos não publicado da constelação de quatro satélites (os elementos usados são ILLUSTRATIVE): na região a { "80" } deg S, disponibilidade de { "8.2" } %, p95 3-D corrigido de { "280" } m, não corrigido de { "3.8" } km. MODELLED; <c3/> falha se algum byte congelado se alterar.

# text
seg-e6aef34d5023 = Laboratório de tempo da estação

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Se o miniRAFS da estação, orientado para o LTC e depois em funcionamento livre ou reorientado, se mantém dentro de { "1" }, { "10" } e { "100" } ns: o bloco opcional <c1/> de <c2/> (<c3/>). O miniRAFS atinge { "1" } ns após { "2.8" } s, { "10" } ns após { "377" } s e { "100" } ns após { "10.5" } h; o objetivo ao nível do nanossegundo da fonte é citado, não adotado. MODELLED. Modelo, saídas, a tabela do tempo até ao limiar para quatro classes de relógio e a comparação com as fontes: <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Geodesia da estação

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = Quanto um retrorrefletor e uma baliza VLBI no local da estação apertam o datum do referencial lunar, para além das cinco matrizes de retrorrefletores arquivadas: as entradas opcionais <c1/> e <c2/> de <c3/> (<c4/> e <c5/>). Limites de Cramer-Rao para um conjunto reduzido de parâmetros num calendário e num local ILLUSTRATIVE: o 1-sigma da norma da translação desce de { "0.0185" } m para { "0.0102" } m (razão { "0.551" }), a escala de { "0.00178" } para { "0.00063" } ppm. MODELLED. Método, ressalvas (um local no polo sul vê a Terra baixa ou nem sequer a vê) e a tabela de Helmert completa: <a1><c6/></a1>.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Cada fonte por título, identificador e editor, com a sua data de obtenção e licença. Os URL, os resumos SHA-256 e as notas sobre onde as fontes divergem constam do registo, <a1><c1/></a1>. Nenhum ficheiro de fonte é redistribuído. Os nomes pessoais são omitidos de propósito.

# text
seg-b1f1e1efa042 = id

# text
seg-02071a726f21 = título

# text
seg-0634af374469 = identificador

# text
seg-fd875b5fb817 = editor

# text
seg-a6f8ef268fcc = obtida

# text
seg-d04709ddc97d = licença

# text
seg-1d4174e911c1 = livro branco sobre uma estação de referência lunar para posicionamento, temporização e ciência, versão { "3" }

# text
seg-e09e1cc11921 = arXiv (livro branco dos autores)

# text
seg-c91720d34bd3 = licença não exclusiva do arXiv para distribuir { "1.0" } (concede apenas ao arXiv)

# text
seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } diapositivos)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, secção { "6" }, ponto { "07" }

# text
seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, fevereiro de { "2025" }; diapositivos da Agência Espacial Europeia

# text
seg-58579c3faf2f = nenhuma indicada; marcados como divulgáveis ao público a partir do diapositivo { "3" }

# text
seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } diapositivos)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, junho de { "2024" }; diapositivos da Agência Espacial Europeia

# text
seg-f4e53e44f0b5 = nenhuma indicada; marcados como divulgáveis ao público

# text
seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } diapositivos)

# text
seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, fevereiro de { "2026" }; diapositivos da Agência Espacial Europeia e da Telespazio

# text
seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } diapositivos)

# text
seg-6229db9cb23d = Workshop on Cislunar PNT, fevereiro de { "2026" }; diapositivos da Agência Espacial Europeia

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, e o <c1/> incluído na árvore

# text
# c1: lunar_afs
seg-4e07c500e353 = tal como registado com <c1/>

# text
seg-28f8d886c4e5 = já na árvore

# text
seg-2006c194fef6 = tal como registado aí

# text
seg-68db6a17b4e7 = <s1>Anterior</s1>Sistema solar e outros corpos

# text
seg-79d53edd2374 = <s1>Seguinte</s1>Navegação de utilizadores espaciais (gnss-ssv)

# text
seg-9c59637f0666 = Mapa de cobertura e exatidão (lunar-station-coverage)
