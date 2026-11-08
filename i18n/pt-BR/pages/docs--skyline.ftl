# docs--skyline: translations (pt-BR)

# text
seg-f917e7fcac09 = O que é

# text
seg-6c6e7248496f = Geometria do céu

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Superfície

# text
seg-ad856ad710eb = Status

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-c14b8fe46517 = Máscara de horizonte dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara

# text
seg-bbb1828b3db1 = Reduções de cânion urbano, setor e terreno a uma tabela

# text
seg-2c53381d48ae = Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria

# text
seg-de6c33774c9c = CLI

# text
seg-d1e9715513b4 = Exemplo

# text
seg-587beeccaa11 = Predefinição

# text
seg-98f4f946a7ac = WASM

# text
seg-b03d56f501c3 = Tipo

# text
seg-4dbf41c0ec3b = Função

# text
seg-2b0d77219437 = Predefinições

# text
seg-7338b6210228 = Linha

# text
seg-6317db731879 = Descrição

# text
# c1: docs/SKYLINE.md
seg-be2f66de7d07 = Fonte: <c1/>

# text
seg-3cb660ef6b03 = Máscaras de horizonte e geometria do céu

# text
# c1: mask_deg
# c2: docs/design/2026-10-12-geometry-and-skyline-design.md
seg-724f72bdfa36 = Até a versão { "0.36" }, todo teste de visibilidade da Terra no motor era um único corte de elevação, <c1/>: um satélite contava quando estava no valor ou acima de um número, qualquer que fosse sua direção. Uma rua, um cais, um fiorde ou um guindaste bloqueia parte do céu e deixa o restante aberto. Um <b>skyline</b> (linha do horizonte) é um corte de elevação que depende do azimute; as <b>funções de geometria do céu</b> transformam um local, um instante, constelações e um skyline no conjunto visível, na diluição da precisão (DOP), na covariância da geometria, na elipse de erro horizontal, em uma nuvem de Monte Carlo e em um skyplot. O projeto é <c2/> (itens { "1" } e { "2" }).

# text
seg-4c1bc0b37f54 = Evidência: a decisão de visibilidade com máscara (ângulos de visada geodésicos, a máscara em tabela, o conjunto visível e seu DOP) é <b>VALIDATED</b> em relação ao Orekit { "12.2" } e ao gnss_lib_py { "1.0.4" } em uma comparação pré-registrada, e o mesmo vale para a elipse de erro e o cofator por sistema (numpy, pré-registrado); as reduções de canyon, de setor e de terreno, as predefinições e o restante das funções de geometria do céu são <b>MODELLED</b> (<a1>Evidência</a1>). Um skyline remove satélites em linha de visada e nada além disso. As predefinições são geometrias REPRESENTATIVE, não levantamentos.

# text
seg-6fa3291b70e3 = O skyline

# text
# c1: [0, 90)
seg-08585dd55bb5 = Um skyline é o máximo ponto a ponto de quatro descrições. O azimute é medido em graus, no sentido horário a partir do norte verdadeiro, no referencial local leste-norte-cima do local; as elevações estão em <c1/>.

# text
seg-9d0e2b0a469f = TOML

# text
seg-3dbc7ff9f5ab = Tabela

# text
# c1: [0, 360)
seg-a67486e7d10e = Elevações interpoladas linearmente em azimute, com retorno em { "360" }°. Azimutes estritamente crescentes em <c1/>; no máximo { "3600" } linhas.

# text
seg-bc12ba94381f = Canyon urbano

# text
seg-23066e2eb509 = Duas paredes retas e paralelas (abaixo).

# attr:aria-label, text
seg-821762272e2f = Setores

# text
# c1: az_from
# c2: az_to
seg-7387a718a7c3 = Intervalos de bordas nítidas, no sentido horário de <c1/> (incluído) até <c2/> (excluído), que podem passar pelo norte; no máximo { "360" }.

# text
seg-2768e3772b56 = Terreno

# text
# c1: atan((height_m − d²/(2 R_eff)) / d)
# c2: R_eff = 4/3 × 6371 km
# c3: height_m
seg-5a5c08a77b86 = Pontos reduzidos a uma tabela: elevação <c1/>, com a queda por curvatura para <c2/> (uma constante escolhida e declarada). <c3/> é a altura acima da antena.

# text
# c1: preset = "<name>"
# c2: table
# c3: sectors
# c4: terrain
seg-fb86c0db0c90 = <c1/> parte de uma geometria nomeada; os campos do canyon então substituem, campo a campo, o canyon da predefinição, e <c2/>, <c3/> e <c4/> se somam a ele.

# text
# c1: mask_deg
# c2: az
# c3: max(mask_deg, skyline(az))
# c4: >=
# c5: mask_deg
seg-0d76504a1d74 = O <c1/> do receptor mantém seu significado: é um skyline plano. O corte efetivo no azimute <c2/> é <c3/>, e um satélite é visível quando sua elevação está <b>no valor ou acima</b> dele: o mesmo <c4/> que a máscara plana sempre usou. Um satélite acima de <c5/>, mas abaixo do skyline, é <b>mascarado pelo skyline</b>.

# text
seg-f7fd13e569e3 = O canyon urbano

# text
# c1: s
# c2: w
# c3: a
# c4: az
# c5: θ = az − s
# c6: d(az) = (w/2) / |sin θ|
# c7: h
seg-290f563c1ff7 = Uma rua segue ao longo do azimute <c1/>, com <c2/> metros entre as paredes, e a antena a <c3/> metros de altura sobre o eixo central. Ao longo do azimute <c4/>, com <c5/>, o raio atinge uma parede após <c6/>; assim, uma parede de altura <c7/> corta em

# text
# c1: length_m = L
# c2: d(az) · |cos θ| > L/2
# c3: antenna_m
# c4: width_m
seg-8662708f4f32 = A faixa aberta fica ao longo da rua. Com <c1/> (a antena no meio), um raio sai por uma extremidade aberta, e a parede não corta nada, quando <c2/>. Uma parede que não seja mais alta que a antena não corta nada. <c3/> tem como padrão { "1.5" } m (o teto de um carro ou um receptor portátil, uma escolha declarada); um novo canyon precisa de <c4/>.

# text
# c1: kshana skyline --preset <name>
seg-1eeff52ea5a5 = Dimensões escolhidas e declaradas (as da nota de projeto), não levantamentos de nenhum lugar real. <c1/> imprime uma delas com sua proveniência e seu corte a cada grau.

# text
seg-13e8e5460280 = Geometria

# text
seg-6d71c5cbe104 = Canyon: rua a { "0" }°, largura de { "20" } m, paredes de { "30" } m e { "30" } m, antena a { "1.5" } m. { "70.7" }° na direção transversal à rua, aberto ao longo dela.

# text
seg-ab3415ff8811 = Relação altura/largura de { "1.5" }, dentro da faixa de { "0.5" }–{ "2" } de razões de aspecto de canyons urbanos em Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

# text
seg-e331f02251f8 = Setores: aberto para o mar ao longo de { "090" }–{ "270" } ({ "180" }°); edifícios do cais a { "8" }° ao longo de { "315" }–{ "045" } ({ "90" }°); o quebra-mar e seu farol a { "3" }° ao longo de { "045" }–{ "090" } e de { "270" }–{ "315" }.

# text
seg-6926e1bfc55d = Escolhas declaradas (por exemplo, armazéns de { "40" } m a cerca de { "285" } m).

# text
# c1: 1500/|sin az|
seg-f13d4df9a42c = Terreno: paredes { "600" } m acima da antena, a { "1500" } m de cada lado de um canal norte-sul, um ponto por grau (a <c1/> m), com a queda por curvatura aplicada. { "21.8" }° na direção transversal, abaixo de { "1" }° ao longo do eixo.

# text
seg-4d3dedbe4491 = A ordem de grandeza da largura e do relevo dos profundos fiordes do oeste da Noruega (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

# text
seg-51f5219cb050 = Setores: pilhas de contêineres a { "12" }° ao longo da metade voltada para terra { "000" }–{ "180" }; lanças de guindaste a { "35" }° ao longo de { "245" }–{ "255" } e a { "25" }° ao longo de { "285" }–{ "295" }; aberto para a água nos demais pontos.

# text
seg-a568ae949c3b = Cinco contêineres high-cube ISO { "668" } ({ "14.5" } m) a cerca de { "60" } m de uma antena a { "2" } m de altura; uma lança a cerca de { "50" } m acima do cais, a { "70" } m e { "100" } m, da ordem de um guindaste post-Panamax. Um setor de guindaste é opaco.

# text
seg-65b1b45c787f = Em um cenário

# text
# c1: [skyline]
seg-e489759bbd65 = Uma seção <c1/> opcional, sobre o corte próprio do tipo:

# text
seg-f98345079e70 = O que o skyline altera

# text
seg-cbe2f5ae721f = Por amostra

# text
# c1: orbit
# c2: user_site
seg-7368ea5c4b79 = <c1/> (com <c2/>)

# text
seg-fde216d940fb = A linha do tempo de visibilidade (disponibilidade de GNSS) e o resumo do DOP.

# text
# c1: integrity
# c2: user_site
seg-7f6b2fcda681 = <c1/> (com <c2/>)

# text
# c1: araim_dual
seg-8fafdb892253 = Os satélites que o RAIM e o ARAIM (<c1/>) usam.

# text
seg-c0156fd1c895 = Os satélites cujas pseudodistâncias são simuladas e usadas pelo RAIM.

# text
seg-d7fa5e5cf33d = Os satélites que o receptor consegue rastrear, antes do jammer.

# text
seg-86caf3ae19ad = O conjunto em visibilidade de cada modo sobre a máscara própria de cada sistema, inclusive a varredura polar (o mesmo skyline em todos os locais). O envelope do modo Doppler e a passagem única projetada são limites do que um receptor deve tratar e mantêm a máscara de cada sistema.

# text
seg-20d2e86d17bc = Quais épocas contam como acima da máscara, o tempo acima dela e os satélites da comparação de GNSS.

# text
# c1: nmea-scenario
seg-ed5bbd6b2c46 = <c1/> (NMEA de treinamento)

# text
seg-d0eb9fd84d24 = Os satélites em GSV e na solução de posição. Os azimutes são rumos verdadeiros fixos em relação ao solo, não o rumo da embarcação.

# text
# c1: orbit
# c2: integrity
# c3: user_site = { lat_deg, lon_deg, height_m }
# c4: user
# c5: epoch + t
# c6: t
# c7: epoch
# c8: epoch
# c9: integrity
# c10: user_site
# c11: user
seg-56cc8ae30218 = <b>O local em solo de <c1/> e <c2/>.</b> Ambos os tipos modelam um usuário em órbita com elevação geocêntrica e sem azimute fixo à Terra; por isso, só aceitam um skyline com o modo de local em solo da nota de projeto: <c3/> no lugar de <c4/> (exatamente um dos dois). Cada amostra é um instante absoluto, <c5/>: todo satélite é propagado até ele (um conjunto de elementos, uma efeméride de transmissão ou um arquivo SP3 avança a partir de sua própria época; um satélite Walker conta <c6/> a partir de <c7/>) e girado para o referencial fixo à Terra nesse instante, de modo que o local vê um céu consistente. <c8/> é a do próprio cenário de órbita; sem uma (e sempre para <c9/>, que não tem nenhuma), é a época mais recente entre os satélites que possuem uma, ou J2000 apenas para padrões Walker. A elevação e o azimute são geodésicos (WGS-84). A divisão horizontal e vertical dos níveis de proteção ARAIM do tipo de integridade e do erro vertical de Stanford usa o mesmo "cima" geodésico (a normal ao elipsoide WGS-84, cerca de { "0.19" }° em relação à radial geocêntrica a { "45" }° de latitude); o RAIM instantâneo já o usava. Um <c10/> sem skyline é um usuário comum em solo; o caminho do <c11/> em órbita permanece inalterado.

# text
# c1: [skyline]
# c2: tests/skyline_scenarios.rs
# c3: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c4: [skyline]
# c5: skyline
# c6: masked_by_skyline
seg-fae979b3b96f = <b>Compatibilidade retroativa.</b> Sem uma seção <c1/>, um cenário é idêntico byte a byte ao que o mesmo motor produzia antes de existir o código de skyline: <c2/> confere o JSON, o gráfico e o resumo de todo cenário distribuído que executa um destes tipos, e o texto NMEA de todo cenário de treinamento, em relação a resumos SHA-256 da linha de base "{ "0.36" } portable" (os resumos do commit da versão { "0.35.0" }, refeitos quando o motor passou para a matemática portátil e mantidos no teste como registro: <c3/>). Uma seção <c4/> vazia não corta nada; o resultado então é igual ao da execução sem ela, exceto pelo bloco <c5/> acrescentado e pelas contagens <c6/> iguais a zero.

# text
# c1: user
# c2: user
# c3: user_site
# c4: width_m
# c5: [0, 360)
# c6: [0, 90)
seg-fe88e0ad01e9 = <b>O que é recusado</b>, com o motivo na mensagem: um skyline em um <c1/> em órbita; <c2/> e <c3/> juntos; uma predefinição desconhecida; um canyon sem <c4/>; uma tabela que não é estritamente crescente em <c5/>; uma elevação fora de <c6/>; um setor vazio; uma distância de terreno não positiva; entrada acima dos limites; qualquer chave desconhecida.

# text
# c1: skyline: { source, open_fraction, provenance }
# c2: source
# c3: preset:<name>
# c4: preset:<name>+overrides
# c5: custom
# c6: open_fraction
# c7: max(mask_deg, skyline)
# c8: 1 − sin(cut)
# c9: provenance
# c10: units
seg-d1b10a0c833f = <b>O resultado</b> ganha <c1/> quando a seção está presente: <c2/> é <c3/>, <c4/> ou <c5/>; <c6/> é a fração do ângulo sólido do hemisfério superior acima de <c7/> (a média de <c8/> sobre o azimute: { "1" } para uma máscara zero, { "0.5" } para um corte plano de { "30" }°); <c9/> é a linha da predefinição ou a do próprio cenário. As unidades e as classes de proveniência estão no bloco <c10/>.

# text
# c1: kshana example <name>
seg-0842c1133eb5 = Exemplos incluídos (<c1/>):

# text
# c1: [skyline]
seg-5f77a52314c7 = O que ele mostra (remova a seção <c1/> para comparar)

# text
# c1: city-street
seg-523f8c1a7912 = GPS + Galileo no fundo de <c1/>: { "17" } de { "289" } amostras mantêm uma solução de posição, PDOP mediano de { "70.5" } ({ "1.14" } em céu aberto).

# text
seg-6c5618dce8ab = ARAIM de dupla constelação entrando em um porto: { "70" } satélites-época ocultos, disponibilidade inalterada ({ "145" } de { "145" }).

# text
seg-36254db521fd = Pseudodistâncias e RAIM em um cais: { "44" } satélites-época ocultos; disponibilidade de RAIM de { "0.59" } ({ "0.85" } em céu aberto).

# text
seg-6b0f8b4c700f = Um jammer de { "2" } W em um porto: { "83" } satélites-época ocultos, rastreamento inalterado (o jammer já os havia tomado).

# text
seg-22ceab915271 = GPS + Galileo + uma camada LEO em um fiorde: PDOP fundido mediano de { "1.14" } ({ "0.93" } em céu aberto).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: city-street
seg-f940e764e244 = O canyon de <c1/> como um corte plano de { "35" }° e como <c2/> girado ao longo do rumo do carro: { "8" } contra { "4" } a { "5" } satélites GPS e Galileo; erro médio fundido de { "2.1" } m em ambos; o alarme de { "1.5" } m em { "51" } % e { "59" } % das épocas.

# text
# c1: src/geometry.rs
seg-6aa4ec7e4058 = Cinco funções do motor (<c1/>), as mesmas em todas as superfícies:

# text
seg-4d6a793b2794 = Entrada → saída

# text
# c1: id
# c2: system
# c3: az_deg
# c4: el_deg
# c5: cut_deg
# c6: visible
# c7: masked
# c8: n_visible
# c9: n_masked
# c10: open_fraction
# c11: dop
# c12: tdop_by_clock
# c13: states
# c14: cofactor_enu
# c15: covariance_enu_m2
# c16: ellipse_1sigma
# c17: ellipse
# c18: label
# c19: statement
# c20: advisory
seg-c99f58f1ccd2 = por satélite <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (variância unitária), <c15/>; <c16/> e <c17/> na confiança solicitada; <c18/>, <c19/>, <c20/>

# text
# c1: n
# c2: σ_UERE
# c3: seed
# c4: samples_enu_m
# c5: σ_UERE × HDOP
# c6: σ_UERE × PDOP
seg-a5b914aac404 = <c1/> (no máximo { "5000" }, um limite de entrada) erros de mínimos quadrados sob erros de distância gaussianos independentes de <c2/> a partir de um fluxo ChaCha8 inicializado por <c3/>: <c4/>, a covariância empírica, o RMS horizontal e 3-D ao lado de <c5/> e <c6/>, a fração dentro da elipse de { "95" } %

# text
# c1: open_fraction
seg-f435ee3b8709 = as predefinições com rótulo, descrição, proveniência, o corte a cada grau e <c1/>

# text
# c1: source
# c2: provenance
# c3: open_fraction
seg-1937af5fa347 = uma seção de skyline reduzida à tabela de 360 entradas que o motor usa, com <c1/>, <c2/>, <c3/>

# text
seg-f16a1f2de329 = o skyplot como SVG estático (sem script, sem referência externa, com toda string de entrada escapada)

# text
seg-c802cf2a2e30 = Uma requisição:

# text
# c1: systems
# c2: constellation-design
# c3: gps-baseline
# c4: galileo
# c5: beidou-meo
# c6: glonass
# c7: xona-pulsar
# c8: iridium-stl
# c9: leo-pvt
# c10: [[system]]
# c11: time_s
# c12: leo-pvt
# c13: "satellites": [{"id": "G05", "system": "GPS", "az_deg": 120, "el_deg": 35}, ...]
# c14: "ecef_m": [x, y, z]
# c15: site
# c16: user_ecef_m
# c17: "common"
# c18: σ_UERE
seg-c3c44c1967ba = <c1/> são as predefinições de constelação do motor (<c3/>, <c4/>, <c5/>, <c6/> etc. de <c2/>; as predefinições LEO <c7/>, <c8/> etc.) ou uma tabela completa <c9/> <c10/>, propagadas até <c11/> (kepleriana com J2 secular, as órbitas do modo conjunto <c12/>). Suas fases relativas vêm de épocas de referência diferentes; portanto, o céu é <b>uma geometria representativa, não o céu daquela data naquele lugar</b>. Os satélites podem, em vez disso (ou além disso), ser dados diretamente: <c13/>, ou com <c14/> e um <c15/> ou <c16/>. Padrões: a máscara própria de cada sistema ({ "5" }° para GNSS, { "10" }° para LEO; { "5" }° para satélites dados diretamente), um relógio de receptor por sistema (<c17/> para um relógio compartilhado), <c18/> de { "1" } m (uma linha de orçamento representativa de dupla frequência), confiança de { "0.95" }. Limites de entrada: no máximo { "2000" } satélites acima do horizonte (uma tabela de sistema que peça mais é recusada antes de ser construída) e { "16" } relógios de receptor.

# text
seg-6408f9b02ccb = Um céu datado a partir de conjuntos de elementos.

# text
# c1: "tle"
# c2: orbit-real-tle
# c3: "epoch"
# c4: time_s
# c5: site
# c6: "epoch"
# c7: 2026-06-07T12:00:00Z
# c8: epoch
# c9: tle
# c10: "tle_system"
# c11: TLE
# c12: sky_source
# c13: sky_statement
seg-7724e4ecafee = <c1/> recebe texto de conjuntos de elementos de duas linhas (uma linha de nome antes de cada conjunto é opcional; no máximo { "4" } MiB, um limite de entrada), propagados pelo SGP4 do motor (WGS-72, o propagador que <c2/> usa) até <c3/> mais <c4/>, girados para o referencial fixo à Terra com UT1 tomado como UTC e sem movimento polar, e vistos de <c5/>. <c6/> é UTC ISO { "8601" } (<c7/>) e data apenas os conjuntos de elementos (as predefinições não têm data; portanto, um <c8/> sem <c9/> é recusado); <c10/> os rotula para o relógio por sistema (padrão <c11/>). Todo resultado informa qual céu é em <c12/> e <c13/>:

# text
seg-13a8b4ac40f9 = O céu

# text
seg-c0bde35f9442 = as predefinições de constelação do motor: uma geometria representativa

# text
seg-d368b50280cc = os conjuntos de elementos propagados até a época declarada: o céu que esses conjuntos de elementos dão naquela época, não uma medição dele (a precisão própria deles é a do SGP4 e a da idade dos conjuntos)

# text
# c1: epoch
# c2: time_s
seg-0bc07825a9b5 = sem <c1/>: os conjuntos de elementos propagados até a época própria do conjunto mais recente mais <c2/>, um céu representativo

# text
seg-1230388da233 = satélites dados diretamente, como declarados

# text
# c1: +
# c2: epoch_utc
# c3: tle_skipped
# c4: systems
seg-1a30004a7f9e = Uma mistura os une com <c1/>. <c2/> é o instante até o qual os conjuntos de elementos foram propagados, e <c3/> indica o que do texto não foi usado, com o motivo: linhas de conjuntos de elementos malformadas ou órfãs (com seus números de linha), conjuntos que o analisador recusou e conjuntos que o SGP4 não conseguiu propagar até aquele instante (decaídos ou além de seus limites); no máximo { "100" } entradas no total, e então uma última entrada contando o restante. Uma lista <c4/> vazia não adiciona predefinições. O skyplot declara a base em seu rodapé.

# text
# c1: orbit::cofactor_from_los
# c2: orbit::dop
# c3: orbit::dop_cov
# c4: orbit::dop
# c5: tests/dop_reference.rs
seg-8560c13c7ea3 = <b>Um único núcleo.</b> A matriz de cofatores é <c1/>, a montagem da matriz de projeto e a inversa de Gauss-Jordan por trás de <c2/>. <c3/> expõe a covariância e <c4/> é sua redução; assim, os escalares VALIDATED permanecem inalterados e continuam fixados por <c5/>. Não existe uma segunda implementação de DOP.

# text
# c1: k σ √λ
# c2: λ
# c3: k = √(−2 ln(1 − p))
# c4: √5.991 = 2.448
# c5: ½ atan2(2 Q_EN, Q_NN − Q_EE)
# c6: [0, 180)
seg-cb1be3e04419 = <b>A elipse.</b> Semieixos <c1/> para os autovalores <c2/> do bloco leste-norte, com <c3/> (<c4/> a { "95" } %, { "1" } a { "39.35" } %), e o azimute do eixo maior <c5/> em <c6/> a partir do norte.

# text
seg-96062e2cfed1 = Pontos de entrada

# text
# c1: kshana sky <request.json|toml>
# c2: kshana sky --site <lat,lon[,h]> (--systems <a,b> | --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]
# c3: --monte-carlo <n> --seed <s>
# c4: --svg
# c5: kshana skyline --preset <name> | --presets | --profile <file>
seg-f8dc86bd9da2 = <c1/> ou <c2/>, com <c3/> ou <c4/>; <c5/>

# text
seg-d5b5bdf6081c = Rust

# text
# c1: kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}
# c2: kshana::surface::*
seg-8d0f99ed4837 = <c1/>, <c2/> com os mesmos nomes

# text
seg-40a7552d2ba9 = MCP

# text
# c1: sky_geometry
# c2: request
# c3: skyline_preset
seg-42f0fe3b42ab = <c1/> (<c2/>, ou <c3/>); sem Monte Carlo via MCP (amostras em grande volume que um agente deve resumir, não transportar)

# text
# c1: label
# c2: statement
seg-9d04c658b37a = Todo resultado traz <c1/> (MODELLED), o <c2/> (geometria sob um modelo de erro declarado: erros de distância gaussianos, independentes, iguais e de média zero; não uma previsão do erro real de um receptor, que também tem vieses, multipercurso e erros sem linha de visada; não um limite de integridade) e o aviso consultivo: <em>Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.</em>

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-0e1285fdfe52 = Cinco linhas do registro (<c1/>), como a nota de projeto as delimita:

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/PREREGISTRATION.md
seg-1aa76286f152 = Orekit { "12.2" } (ângulos de visada de <c1/>, <c2/>) com gnss_lib_py { "1.0.4" } (<c3/> e a matriz de DOP), pré-registrados em <c4/> (commit e4b9d912) antes de qualquer um dos dois ser executado: { "1173" } ângulos de visada em seis locais e quatro épocas, seis tabelas, { "142" } conjuntos visíveis; pior elevação de { "1.3e-13" }°, azimute de { "2.3e-13" }°, máscara de { "1.1e-12" }° contra { "1e-9" }°; conjuntos visíveis idênticos, nenhum na faixa de fronteira; DOP de { "3.3e-13" } relativo e cofator de { "6.6e-13" } da escala da matriz contra { "1e-9" }. Escopo: máscaras em tabela, ângulos de visada geodésicos, o conjunto mascarado e seu DOP e cofator de relógio comum.

# text
seg-b33828edbe2f = valores calculados à mão; a comparação acima lê suas tabelas como entradas e não as verifica

# text
seg-ca950752be62 = Predefinições de skyline

# text
seg-83946f66ca78 = nenhuma: dimensões escolhidas e declaradas (verificadas apenas em relação a si mesmas)

# text
# c1: linalg.inv
# c2: linalg.eigh
# c3: xval/numpy-ellipse/PREREGISTRATION.md
seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> e <c2/> (P2 padrão) sobre os { "142" } conjuntos visíveis versionados, relógio comum e um relógio por sistema, pré-registrados em <c3/> (commit 0bbeeaee): { "270" } casos, eixos de { "5.1e-13" } relativo, orientação de { "5.3e-12" }°, cofator de { "1.0e-12" } da escala da matriz, contra { "1e-9" } e { "1e-6" }°

# text
seg-44e5f9ca28f7 = Funções de geometria do céu

# text
seg-8e3953481bbf = a composição: propagação das predefinições até um céu representativo, a nuvem de Monte Carlo (verificada em relação à geometria que ela amostra), as superfícies

# text
# c1: [skyline]
seg-e8eec007c6b9 = A ausência de uma seção <c1/> é verificada byte a byte em relação às saídas da versão { "0.35.0" }, o que mostra compatibilidade retroativa e não valida nada. O gnss_lib_py aplica apenas uma única máscara de elevação; por isso, é a referência independente de DOP aqui, não a referência independente de máscara.

# text
seg-d5894e54715b = O que um skyline não modela: difração na borda de uma parede, reflexos e sinais sem linha de visada que um receptor real ainda pode rastrear (eles são descartados, não degradados), transparência parcial (um guindaste de treliça é opaco em todo o seu setor), terreno além dos pontos dados e a curvatura da Terra dentro das formas de canyon e de setor.

# text
seg-745d19d6b35d = <s1>Anterior</s1>Integrações marítimas

# text
seg-bbe8dd07d33b = <s1>Próximo</s1>A confiança como telemetria de segurança
