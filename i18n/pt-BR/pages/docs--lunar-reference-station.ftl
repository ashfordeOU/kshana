# docs--lunar-reference-station: translations (pt-BR)

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
seg-e8ee3794bac6 = <b>MODELLED.</b> Sob as hipóteses declaradas (a constelação, seu erro de sinal no espaço, a precisão de levantamento da estação, a latência das correções e a quantização do enlace, cada uma uma entrada rotulada com sua fonte pública ou como ILLUSTRATIVE), o modelo fornece os valores abaixo. Eles <b>não</b> são uma declaração sobre o desempenho de qualquer sistema real. O Kshana <b>não</b> é afiliado a nenhuma agência nem endossado por ela, e não faz nenhuma afirmação de TRL nem de histórico de voo. Apenas consultivo.

# text
seg-22eb5bd00092 = Finalidade

# text
seg-25678ae41147 = Material público descreve uma estação de referência lunar no polo sul que monitora um serviço de navegação lunar, calcula correções diferenciais locais, mantém uma referência de tempo lunar em um relógio atômico e leva um retrorrefletor laser e um transmissor VLBI para o referencial lunar (a classe descrita publicamente para o conceito NovaMoon da ESA; fontes abaixo). O Kshana já modela cada peça separadamente. Este estudo as compõe em uma única análise aberta e reproduzível do que tal estação poderia fazer sob hipóteses públicas, e a pré-registra para que possa ser pontuada contra resultados publicados e, eventualmente, contra resultados de voo.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = ou <c1/> a partir de Python, WebAssembly ou o <c2/> do servidor MCP com <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Mapa de cobertura e precisão (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Para uma estação de referência diferencial em um local conhecido do polo sul: em cada ponto de usuário de uma grade em anéis de { "80" }° S até o polo e ao longo da região, ao longo de um dia de épocas e de ensaios de Monte Carlo, o erro de posição corrigido e não corrigido em percentis (3-D, horizontal, vertical), a disponibilidade com um motivo para cada época indisponível, a cobertura contra um limiar declarado antes da execução, níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento do enlace de correção na estação e no pior ponto. Nenhuma física nova: ele varre as funções testadas de <c1/> e se reduz exatamente a esse tipo em um ponto, uma época e um ensaio.

# text
seg-94058315dfe4 = Entrada

# text
seg-7670cf4ceda3 = Padrão

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Constelação (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) ou <c6/>

# text
seg-bfdd053b2611 = o conjunto da classe LCNS na árvore

# text
seg-389db26524b4 = ILLUSTRATIVE no padrão incluído; o exemplo de fontes públicas define quatro satélites e o período de { "24" } h a partir de S2 e S4, com o conjunto de elementos permanecendo ILLUSTRATIVE (nenhuma fonte o declara)

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
seg-93d78578585f = ILLUSTRATIVE (a alocação de realização do referencial na árvore, ela própria MODELLED)

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
seg-9a432ef35cac = ILLUSTRATIVE no padrão incluído; o exemplo de fontes públicas define <c1/> = { "10" } / { "1.96" } m a partir de S4 p8

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bits

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Grade (<c1/>, <c2/>) ou <c3/>

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
seg-d35d88b0753b = { "20" } m em p95 no padrão incluído ({ "1" } m no exemplo de fontes públicas)

# text
seg-fa7858b14f89 = declarado antes da execução; { "20" } m é ILLUSTRATIVE, dimensionado para os erros ilustrativos do padrão

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-329ad585cd9b = ILLUSTRATIVE: não existe valor público

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
seg-c530b459b0ef = Todo campo numérico traz uma unidade e uma classe de proveniência no bloco <c1/> do resultado (conferido por <c2/>). O bloco da região: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> por setor de azimute de { "30" }°; <c15/> por ponto; e <c16/>.

# text
seg-4aa380258574 = O que as verificações podem e não podem dizer

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/>: a redução a <c2/>, os pisos de linha de base zero e de levantamento, a monotonicidade, os motivos de indisponibilidade, o determinismo, a proteção de trabalho. Elas mostram que a varredura é o modelo que afirma varrer.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/>: um recálculo independente em numpy da aritmética sobre casos exportados, pré-registrado antes de ser executado. As posições e os percentis atingiram seus limiares; as correções da estação não atingiram os seus por arredondamento de dupla precisão (registrado, com seus números, em <c2/>).

# text
seg-be6ecf79d22c = Nenhuma das duas verifica o modelo. O modelo de erro, a decorrelação de primeira ordem, os modelos de levantamento, de envelhecimento e de quantização e todo limiar são do próprio projeto ou ILLUSTRATIVE.

# text
seg-d6f194e28401 = Máscaras de horizonte de terreno

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Uma seção opcional <c1/> (<c2/>) dá à estação e a cada ponto de usuário um horizonte próprio dependente do azimute, no formato de tabela de horizonte da { "0.36" } (linhas <c3/>, linear em azimute com retorno em { "360" }°). Um satélite conta em um local quando supera tanto <c4/> quanto o horizonte em seu azimute; uma época que o horizonte deixa com menos de quatro satélites em um ponto, onde a máscara plana dá quatro, é relatada como <c5/> (<c6/> mantém seu significado plano). Duas fontes, combinadas como seu máximo ponto a ponto quando ambas são dadas:

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = um perfil declarado, <c1/> ou <c2/> (aplicado a todo ponto de usuário), cada um com um rótulo <c3/> obrigatório;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = um horizonte traçado por raios sobre um DEM polar (<c1/>): círculos máximos da esfera lunar com curvatura exata, a partir de uma altura de mastro declarada (padrão { "2" } m), a cada <c2/> (padrão { "1" }°), até <c3/> (padrão { "150" } km) ou a borda da grade. O repositório incorpora um recorte do produto polar LRO LOLA de domínio público <c4/>, reamostrado por média de blocos { "5" } × { "5" } para { "1200" } m e a cerca de ±{ "420" } km do polo (<c5/>: URL de origem, SHA-256, licença, etapas de recorte e de reamostragem);

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = ou, no lugar de <c1/>, um bloco de DEM de latitude/longitude (<c2/>) no formato de texto <c3/> (um cabeçalho <c4/>, depois as alturas em metros acima da esfera média, em ordem de linhas), traçado por raios do mesmo modo, com o espaçamento de latitude definindo o passo padrão. O relatório repete o caminho, o SHA-256 e a extensão do bloco (<c5/>). Um bloco reamostrado do recorte incorporado dá à estação o próprio horizonte do recorte com { "0.22" }° (<c6/>). Nenhum bloco é incorporado.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = As mesmas máscaras se aplicam à grade <c1/> (<c2/>, <c3/> e <c4/>; um ponto da grade fora do DEM mantém a máscara plana e é contado). Sem a seção, todo documento é idêntico byte a byte a uma execução sem ela.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Verificações: o traçado de raios reproduz horizontes em forma fechada (a depressão da esfera nua, uma cratera em um platô a partir de seu centro e fora dele, um cone rasterizado contra o cone analítico); o recorte incorporado está orientado como a fonte (os fundos de Shackleton e Haworth baixos, o maciço Malapert alto); um lançamento de raios independente em numpy sobre o recorte, pré-registrado (<c1/>), concorda a { "5.5e-10" } deg em cinco locais, o que verifica a aritmética, não o terreno. Nenhuma cifra publicada de horizonte ou de iluminação polar foi reproduzida, de modo que a linha permanece MODELLED (linha do registro "Lunar terrain horizon masks from a stated profile or a polar DEM").

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> executa as entradas incluídas em uma grade de { "2" }° com { "100" } ensaios e o horizonte do DEM em todo local. O local da estação ({ "89" }° S, { "0" }° E) tem um horizonte máximo de cerca de { "4.0" }°, abaixo da máscara de { "5" }°, de modo que na estação o terreno não é restritivo; nos pontos de usuário, a média ponderada por área do horizonte máximo de cada ponto é { "9.7" }° e o maior, { "26.3" }°. Contra as mesmas entradas com a máscara plana, o erro 3-D p95 corrigido da região sobe de { "16.3" } m para { "18.6" } m e o maior HPL de { "480" } m para { "62" } km. A disponibilidade da região sobe de { "91.9" } % para { "93.0" } %: uma época é indisponível quando um ponto usa um satélite que a estação não vê, e um horizonte que oculta esse satélite do ponto pode tornar a época disponível.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Terreno e mascaramento de horizonte: tratado na { "0.36" }, com limites.</b> Máscaras de horizonte por local, a partir de um perfil declarado ou do recorte de DEM LOLA incorporado, são modeladas (acima). O que resta: o recorte incorporado tem { "1200" } m por pixel, de modo que o relevo abaixo de cerca de um quilômetro é suavizado e as médias de bloco rebaixam picos agudos; um raio que sai do recorte (a cerca de { "420" } km do polo) termina ali; não há difração, multipercurso de terreno nem obstrução parcial; as posições dos locais para medição de distância permanecem na esfera média nas alturas declaradas (o DEM define apenas o horizonte); o horizonte não é validado contra um valor externo. O local de exportação por satélite de <c1/> é mascarado como um ponto de grade: com uma seção <c2/>, cada linha exportada traz <c3/> e o relatório o horizonte do local (<c4/>); as contagens de antena em feixe ainda contam todo enlace que supera a máscara plana.

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Multipercurso e hardware do receptor: tratado na { "0.36" } como opção, com limites.</b> Uma seção <c1/> (<c2/>) acrescenta multipercurso dependente da elevação <c3/> no usuário e na estação (a forma funcional do DO-229; na Lua todo valor é ILLUSTRATIVE), o multipercurso da estação opcionalmente Gauss-Markov de primeira ordem ao longo das épocas, ruído de código do DLL adiantado-menos-atrasado a partir do C/N0 e vieses entre canais por canal. O que resta: a variação do centro de fase da antena e do atraso de grupo não é modelada; nenhuma medição lunar fixa os valores de multipercurso; o bloco do orçamento do enlace de correção não inclui os termos do receptor.

# text
seg-677252c2d3e5 = Crescimento do erro de efemérides ao longo da latência: tratado na { "0.36" } como opção, com limites.

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> acrescenta um crescimento linear do erro de órbita transmitido com a idade (distância 1-sigma <c2/>), sobre a reprojeção de erro congelado; o crescimento linear é o termo de primeira ordem de um erro de estado propagado (conferido a { "1" } % a { "600" } s contra a propagação de dois corpos na árvore). O que resta: nenhuma fonte pública dá uma taxa de crescimento lunar (ILLUSTRATIVE); sem estrutura ao longo da trajetória/radial; o bloco do orçamento do enlace de correção usa o modelo congelado. O adendo K5 (<c3/>, pré-registrado isoladamente) executa o K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s: ele falha em todos os casos ({ "369.8" } m, { "2315" } m, { "22797" } m contra um limiar de { "1.5" } m), como declarado antes da execução.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Estilo de solução (filtro, restrição de altura, três satélites): uma opção na { "0.36" }, com limites.</b> Uma seção <c1/> (<c2/>) acrescenta uma pseudomedição de altura, um mínimo de três satélites com ela e uma janela de mínimos quadrados ponderados para usuário estático ao longo das épocas (uma posição compartilhada, um relógio por época), que faz as vezes de um filtro. O que resta: ela trata os erros das épocas como independentes, de modo que a média diminui mais depressa do que erros correlacionados no tempo; é só para usuário estático; não há filtro dinâmico, fase da portadora nem resolução de ambiguidade; o rastro do caso (<c3/>) mostra a aritmética do instantâneo. O adendo de afirmações publicadas com este modo é <c4/> (pré-registrado isoladamente). Com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (ajustes ILLUSTRATIVE), o erro 3-D p95 corrigido do R300 cai de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não pontuado); K1 a K5 ainda falham e K6 passa, { "1" } de { "6" } como na execução registrada. A hipótese de independência da janela a favorece.

# text
seg-4f8274f839a7 = Comparação com afirmações publicadas

# text
seg-82391b00e1bc = MODELLED. Uma comparação deste modelo, executado sob as hipóteses públicas, com as afirmações que as fontes fazem. Não é uma declaração sobre o desempenho de qualquer sistema real.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Fontes S1 a S5 (título, URL, data de obtenção, SHA-256, licença): <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Toda afirmação numérica, citada com sua página e hipóteses declaradas e classificada como comparável, parcialmente comparável ou não comparável: <c1/>. Nenhuma afirmação é plenamente comparável, porque nenhuma fonte declara um percentil nem os elementos orbitais dos satélites.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Limiares, casos e entradas, versionados isoladamente antes da execução (revisão { "2" }, 05bf9a19), e a execução registrada: <c1/>. O achado está fixado em <c2/>.

# text
seg-069a652c402e = limiar

# text
seg-d6120708c062 = afirmação (fontes)

# text
seg-5b480535b54b = este modelo

# text
seg-6231a005ccc9 = veredito

# text
seg-45dc6ff5d546 = uma estação dá precisão submétrica em todo o polo sul, círculo de { "300" } km (S1, S2, S3)

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
seg-1b720f1677cc = "nível decimétrico" a partir de correções de pseudodistância (S3 p22, S5 p5)

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
seg-021336eb5623 = a mesma precisão de { "10" } km a { "500" } km de linha de base (S2 p17)

# text
seg-62190343777c = razão { "1.39" }

# text
seg-7a33a168b020 = passa

# text
seg-e666f1eb7a59 = { "1" } de { "6" } limiares passa. A causa é a geometria. Nenhuma fonte publica os elementos orbitais da constelação. Nos elementos ILLUSTRATIVE da árvore, um usuário e a estação compartilham quatro satélites acima de { "5" } deg em apenas { "8" } % ({ "300" } km) e { "6" } % ({ "600" } km) das épocas, em geometria quase singular: o p95 não corrigido é { "3.8" } km, onde as fontes citam < { "10" } m. As próprias simulações das fontes usaram um filtro, uma restrição de altura e três satélites em visada comum, o que este modelo de instantâneo não tem. Portanto a execução não reproduz as afirmações nesses elementos, e isso não é evidência de que as afirmações estejam erradas. A passagem do K6 é uma razão de duas grandezas dominadas pela geometria e nada diz sobre decorrelação. Um conjunto publicado dos elementos da constelação seria pontuado sob os mesmos limiares como uma segunda execução, datada.

# text
seg-1da5fcf7bbf5 = Previsão pré-registrada

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Uma previsão pré-registrada, congelada no commit <c1/> com as entradas de fontes públicas, com seu protocolo de pontuação: <a1><c2/></a1>. É uma previsão, não uma validação, e todo valor nela é dominado pelo conjunto de elementos não publicado da constelação de quatro satélites (os elementos usados são ILLUSTRATIVE): na região de { "80" } deg S, disponibilidade { "8.2" } %, p95 3-D corrigido { "280" } m, não corrigido { "3.8" } km. MODELLED; <c3/> falha se qualquer byte congelado se mover.

# text
seg-e6aef34d5023 = Laboratório de tempo da estação

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Se o miniRAFS da estação, sincronizado ao LTC e depois em funcionamento livre ou ressincronizado, se mantém dentro de { "1" }, { "10" } e { "100" } ns: o bloco opcional <c1/> de <c2/> (<c3/>). O miniRAFS atinge { "1" } ns após { "2.8" } s, { "10" } ns após { "377" } s e { "100" } ns após { "10.5" } h; a meta em nível de nanossegundo da fonte é citada, não adotada. MODELLED. Modelo, saídas, a tabela de tempo até o limiar para quatro classes de relógio e a comparação com as fontes: <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Geodesia da estação

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = Quanto um retrorrefletor e um farol VLBI no local da estação apertam o datum do referencial lunar além dos cinco conjuntos de retrorrefletores arquivados: as entradas opcionais <c1/> e <c2/> de <c3/> (<c4/> e <c5/>). Limites de Cramer-Rao para um conjunto reduzido de parâmetros em um cronograma e um local ILLUSTRATIVE: o 1-sigma da norma de translação cai de { "0.0185" } m para { "0.0102" } m (razão { "0.551" }), a escala de { "0.00178" } para { "0.00063" } ppm. MODELLED. Método, ressalvas (um local no polo sul vê a Terra baixa ou não a vê) e a tabela de Helmert completa: <a1><c6/></a1>.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Cada fonte por título, identificador e editor, com sua data de obtenção e sua licença. As URLs, os hashes SHA-256 e as notas sobre onde as fontes divergem estão no registro, <a1><c1/></a1>. Nenhum arquivo de fonte é redistribuído. Nomes de pessoas são deixados de fora de propósito.

# text
seg-b1f1e1efa042 = id

# text
seg-02071a726f21 = título

# text
seg-0634af374469 = identificador

# text
seg-fd875b5fb817 = editor

# text
seg-a6f8ef268fcc = obtido em

# text
seg-d04709ddc97d = licença

# text
seg-1d4174e911c1 = livro branco sobre uma estação de referência lunar para posicionamento, temporização e ciência, versão { "3" }

# text
seg-e09e1cc11921 = arXiv (livro branco dos autores)

# text
seg-c91720d34bd3 = licença não exclusiva do arXiv para distribuir { "1.0" } (concede apenas ao arXiv)

# text
seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } slides)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, seção { "6" }, item { "07" }

# text
seg-406990fe43a8 = Workshop ICG-IOAG sobre PNT cislunar, fevereiro de { "2025" }; slides da Agência Espacial Europeia

# text
seg-58579c3faf2f = nenhuma declarada; marcado como liberado ao público a partir do slide { "3" }

# text
seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } slides)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, Sessão do Grupo de Trabalho Conjunto do ICG sobre PNT Lunar, junho de { "2024" }; slides da Agência Espacial Europeia

# text
seg-f4e53e44f0b5 = nenhuma declarada; marcado como liberado ao público

# text
seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } slides)

# text
seg-3fd0ab93507d = 2º Workshop ICG-IOAG sobre PNT Cislunar, fevereiro de { "2026" }; slides da Agência Espacial Europeia e da Telespazio

# text
seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } slides)

# text
seg-6229db9cb23d = Workshop sobre PNT Cislunar, fevereiro de { "2026" }; slides da Agência Espacial Europeia

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, e o <c1/> da árvore

# text
# c1: lunar_afs
seg-4e07c500e353 = como registrado com <c1/>

# text
seg-28f8d886c4e5 = já na árvore

# text
seg-2006c194fef6 = como registrado ali

# text
seg-68db6a17b4e7 = <s1>Anterior</s1>Sistema solar e outros corpos

# text
seg-79d53edd2374 = <s1>Próxima</s1>Navegação de usuários no espaço (gnss-ssv)

# text
seg-9c59637f0666 = Mapa de cobertura e precisão (lunar-station-coverage)
