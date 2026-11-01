# docs--solar-system: translations (pt-BR)

# attr:aria-label, text
seg-31a05429b836 = Corpos

# text
seg-1c78d5337e16 = Plutão

# text
seg-6cb7a787ac67 = Referências

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-60cd077d82a7 = Modelo

# text
seg-c5ce76c91ff7 = Rótulo

# text
seg-430edd66bda0 = Não modelado

# text
seg-7670cf4ceda3 = Padrão

# text
seg-e0eb14018b2c = como acima

# text
seg-3dbc7ff9f5ab = Tabela

# text
# c1: docs/SOLAR-SYSTEM.md
seg-9fe60d39f2db = Fonte: <c1/>

# text
seg-c44439432020 = Sistema solar e posicionamento em torno de outros corpos

# text
seg-4d4ee55b5fb4 = Dois tipos de cenário funcionam além do sistema Terra-Lua:

# text
# c1: solar-system
seg-fa202376da31 = <c1/> relata todos os corpos do catálogo em uma época: posição e velocidade, constantes físicas, tempo de luz e distância a partir de um corpo observador, e uma trilha de órbita.

# text
# c1: body-pnt
seg-9859aabbb4f4 = <c1/> coloca um usuário de navegação (um orbitador ou uma sonda pousada na superfície) em torno de qualquer corpo do catálogo que não seja o Sol e a Terra, com uma constelação de navegação local e uma distância opcional de espaço profundo a partir da Terra.

# text
# c1: constellation-design
seg-ec582fa8f67f = O tipo <c1/> usa o mesmo catálogo para construir constelações em torno de qualquer um desses corpos (<a1>CONSTELLATION-DESIGN.md</a1>).

# text
# c1: src/body.rs
# c2: src/ephem.rs
# c3: src/ephem_provider.rs
# c4: AnalyticSolarSystem
# c5: src/solar_system.rs
# c6: src/body_pnt.rs
# c7: src/radiometric.rs
# c8: tests/solar_system_horizons_reference.rs
seg-31f150c83173 = Código: <c1/> (o catálogo e suas constantes), <c2/> (as efemérides analíticas), <c3/> (<c4/>, o provedor que ambos os tipos leem), <c5/> e <c6/> (os tipos) e <c7/> (tempo de luz, distância de ida e volta e o atraso de Shapiro). Testes: <c8/> e os testes unitários de cada módulo.

# text
seg-3ce9aab4916e = O catálogo

# text
# c1: src/body.rs
# c2: J2
seg-35cd9ebaf04e = Dezoito corpos: o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, as quatro luas galileanas (Io, Europa, Ganimedes, Calisto) e Titã. Os nomes são comparados sem distinção entre maiúsculas e minúsculas. Para cada um, <c1/> traz o parâmetro gravitacional GM, os raios médios equatorial e volumétrico, o segundo harmônico zonal <c2/> e seu raio de referência, quando um é publicado, e o modelo de polo e meridiano primário da União Astronômica Internacional (IAU) (período de rotação sideral, negativo para um rotador retrógrado). Cada valor cita sua fonte no código.

# text
seg-525b8b29345d = De onde vêm as posições

# text
seg-0fd4c3af55ba = De Mercúrio a Saturno e a Terra, a partir da Tabela { "1" } ({ "1800" } d.C. a { "2050" } d.C.)

# text
seg-9d820791a27b = Elementos keplerianos do Jet Propulsion Laboratory (JPL) de Standish e Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

# text
seg-d8549658ae99 = Todos os oito planetas a partir das Tabelas 2a/2b ({ "3000" } a.C. a { "3000" } d.C.)

# text
seg-1f0b417c3809 = os elementos de longo intervalo da mesma página

# text
seg-bfe1c209044a = Urano e Netuno a partir da Tabela { "1" }

# text
seg-ba5dfdd2de52 = a linha da Tabela { "1" } de { "1992" } ({ "1800" } d.C. a { "2050" } d.C. apenas; a página atual a removeu e não declara erro)

# text
seg-001ca2ad22e1 = A Lua

# text
seg-6ff6068aeacf = as séries lunares de Montenbruck e Gill, separando o baricentro Terra-Lua

# text
seg-f906cffa45a2 = Fobos, Deimos, as luas galileanas, Titã

# text
seg-6ba84144ad88 = elementos médios do JPL com o modelo de rotação da IAU

# text
# c1: table = "auto"
# c2: table1
# c3: table2
# c4: epoch_jd_tdb
seg-d5640ad2cd08 = <c1/> (o padrão) usa a Tabela { "1" } entre { "1800" } d.C. e { "2050" } d.C. e as Tabelas 2a/2b fora desse intervalo; <c2/> e <c3/> forçam uma delas. Plutão fora da sua tabela é um erro, não uma extrapolação. A época é uma data e hora ISO { "8601" } em Tempo Universal Coordenado (UTC), convertida por meio do Tempo Terrestre (TT) com os segundos intercalares para o Tempo Dinâmico Baricêntrico (TDB), ou uma data juliana TDB dada diretamente com <c4/>.

# text
# c1: tests/fixtures/solar_system/
# c2: cargo test --test solar_system_horizons_reference -- --nocapture
seg-912a2223e495 = A referência independente é o JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), com os vetores consultados versionados em <c1/>. Uma linha de planeta é VALIDATED quando permanece dentro de duas vezes o erro nominal da própria página de Standish. Medido por <c2/>:

# text
seg-d8bbd5e4f483 = Tabela { "1" }, de Mercúrio a Saturno e o baricentro Terra-Lua, { "12" } épocas de { "1800" } a { "2049" }: pior caso de { "1.87" } vez o erro nominal (a distância de Saturno).

# text
seg-18568cec6c91 = Tabelas 2a/2b, todos os oito planetas, { "15" } épocas de cerca de { "1000" } a.C. a { "2500" } d.C.: pior caso de { "1.71" } vez (a distância de Marte).

# text
seg-7f3aa4a24e8f = Urano e Netuno da Tabela { "1" } excedem os valores da página contra o DE441: { "2.04" } e { "5.16" } vezes o erro nominal de longitude. Eles são fixados abaixo de seis vezes e permanecem MODELLED.

# text
seg-41d2f404224b = Plutão: dentro de { "39.2" } segundos de arco em longitude e { "1.14e9" } m em distância.

# text
seg-11c31908ba69 = Luas, pior ângulo visto do planeta entre { "2000" } e { "2040" }: Fobos { "5.65" } graus, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titã { "3.31" }. A Lua geocêntrica: { "0.046" } graus.

# text
seg-24d36a3ce8d4 = Velocidades dos planetas: pior erro relativo de { "3.72e-3" } da velocidade (MODELLED).

# text
seg-0bae9b8d09ea = A Lua e as sete luas são medidas com limiares fixados, mas não existe limite publicado em relação ao qual validá-las; por isso, são MODELLED.

# text
# c1: xval/
# c2: EphemerisProvider
seg-2cf791a940ea = As efemérides analíticas não precisam de arquivo de kernel. Um kernel de Development Ephemeris do JPL (posições de classe DE) é lido apenas pelos crates separados de validação cruzada em <c1/>, por meio do mesmo trait <c2/>; o crate principal não depende deles.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: [[links]]
seg-5bff2c54125b = Entradas: <c1/> (padrão 2026-01-01T00:{ "00" }:{ "00" }) ou <c2/>; <c3/> (padrão todos os dezoito); <c4/> (padrão a Terra); <c5/> por órbita ({ "8" } a { "2000" }, padrão { "120" }); <c6/>; e qualquer número de <c7/>, cada um recebido na época.

# text
seg-5787ece2c791 = Para cada corpo, o resultado traz sua classe e seu corpo pai, o identificador do NASA Navigation and Ancillary Information Facility (NAIF), a posição e a velocidade heliocêntricas no International Celestial Reference Frame (ICRF, equatorial J2000) em metros e metros por segundo, a longitude, a latitude e a distância eclípticas, a posição relativa ao seu corpo pai, o período orbital, as constantes acima, o polo e o meridiano primário na época, o erro nominal de Standish quando existe, seu rótulo e sua cadeia de método, e uma trilha de órbita ao longo de uma revolução (heliocêntrica para um planeta, centrada no corpo pai para uma lua; um único ponto para o Sol). O enlace a partir do observador, e cada enlace extra, fornece:

# text
seg-36bad4b7b4ba = o tempo de luz newtoniano de ida, resolvido pelo solucionador de ponto fixo de tempo de luz radiométrico, com o transmissor em sua posição retardada, e a distância de ida correspondente;

# text
seg-c5602eb76a05 = o tempo de luz e a distância de ida e volta;

# text
seg-dab8e2db61d3 = o atraso de Shapiro do Sol, informado separadamente e não somado;

# text
seg-90d00587a59f = o ângulo de separação do Sol.

# text
seg-4c172f9f7cf6 = O tempo de luz é VALIDATED em relação ao tempo de luz de ida que o Horizons informa: Marte e Júpiter até o centro da Terra em quatro épocas de { "2000" } a { "2040" }, com pior erro de { "0.070" } s para Marte contra um limiar de { "0.207" } s e { "1.31" } s para Júpiter contra { "4.04" } s. O limiar é o dobro da soma dos erros de distância de Standish do alvo e do baricentro Terra-Lua, dividido pela velocidade da luz: o tempo de luz não pode ser melhor que as posições. É o tempo de luz geométrico newtoniano, não uma observável relativística ou corrigida por plasma.

# text
# c1: scenarios/solar-system-tour.toml
seg-4f8cd6aef754 = O <c1/> incluído relata todos os dezoito corpos em 2026-09-28T00:{ "00" }:{ "00" } com trilhas de 180 pontos e acrescenta os enlaces de Marte a Júpiter (ida { "2193.539" } s), de Saturno à Terra ({ "4212.176" } s) e de Europa a Júpiter ({ "2.218" } s).

# text
seg-d22cc535f04b = Um usuário navega em torno de um corpo escolhido pelo nome (qualquer corpo do catálogo exceto o Sol e a Terra, que o tipo de cenário recusa) com dois tipos de medição:

# text
# c1: planes
# c2: sats_per_plane
# c3: phasing_f
# c4: J2
seg-9eeb7f77aec7 = pseudodistâncias de ida de uma constelação de navegação Walker delta em torno do corpo (<c1/> por <c2/>, defasagem entre planos <c3/>), em órbitas de dois corpos com a deriva secular de <c4/> do próprio corpo; o relógio do usuário é desconhecido, de modo que essas linhas trazem uma coluna de viés de relógio;

# text
# c1: [earth_link]
seg-56ac318f6f27 = opcionalmente, uma distância de ida e volta a partir do centro da Terra (<c1/>), que não precisa de relógio do usuário e é informada como uma distância de ida com ruído próprio. A direção e a distância da Terra vêm da efeméride analítica em cada época.

# text
# c1: mars-pnt
seg-551d44492aae = Uma linha de visada é bloqueada quando passa por dentro do raio médio do corpo (o teste de corda do tipo <c1/>), e um usuário em superfície também precisa da máscara de elevação. Em cada época, a execução forma a diluição da precisão geométrica e de posição (GDOP, PDOP) da constelação sozinha, a incerteza formal de posição de um sigma com e sem a linha da Terra, e uma solução de mínimos quadrados de Gauss-Newton com semente fixa para cada caso, de modo que o relatório mostra o que o enlace de espaço profundo acrescenta.

# text
seg-6f1161567330 = nível superior

# text
seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, uma oposição de Marte

# text
seg-0b688042ed44 = { "86 400" } s, { "600" } s

# text
# c1: orbiter
# c2: surface
seg-c7b3aaecd6e2 = <c1/> (ou <c2/>)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: u0_deg
# c5: eccentricity
seg-c452a6f7a9d4 = orbitador: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
seg-67f7b23bf604 = { "400" } km, { "75" } graus, { "0" }, { "0" }, { "0" }

# text
# c1: lat_deg
# c2: lon_deg
# c3: height_m
seg-b412b65733d8 = superfície: <c1/>, <c2/>, <c3/>

# text
seg-7639d2583131 = três raios médios

# text
seg-fe4a8d9da406 = { "60" } graus

# text
seg-7ac449fb9569 = { "1" } m

# text
# c1: mask_deg
seg-128c4a5edd9b = <c1/> (usuário em superfície)

# text
seg-3d4b760f6ed6 = { "10" } graus

# text
seg-498493929023 = verdadeiro, { "1" } m

# text
# c1: raan_deg
# c2: u0_deg
seg-18e477dc7f02 = <c1/> é a ascensão reta do nó ascendente no referencial equatorial do corpo e <c2/> é o argumento de latitude na época.

# text
seg-a743b0b5e668 = Os dois cenários incluídos, como são executados com o kshana { "0.36" } (matemática portátil, a mesma em todas as plataformas):

# text
seg-b24010bdb302 = Usuário

# text
seg-cb9cd741ba85 = orbitador, { "300" } km, { "93" } graus

# text
seg-fa11e61f0d1d = superfície, { "20" } graus N, { "60" } graus E

# text
seg-e17a9ae6905c = Relés

# text
seg-359db3c9ad19 = { "12" } a { "10 000" } km, { "60" } graus

# text
seg-1bb041045be4 = { "12" } a { "4500" } km, { "55" } graus, máscara de { "10" } graus

# text
seg-604aefd62668 = Duração

# text
seg-825603e2fbed = um sol, { "296" } épocas

# text
seg-372159825c11 = { "306 822" } s, { "171" } épocas

# text
seg-132e3bbcc94c = Tempo de luz até a Terra, ida / ida e volta

# text
seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

# text
seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

# text
seg-d0f05f440103 = Terra em visada

# text
seg-d7ad84776ec6 = { "0.811" } das épocas

# text
seg-44bf83b16660 = Disponibilidade, somente relés / com a distância da Terra

# text
seg-07e0a8499670 = PDOP mediano

# text
seg-e802f5920237 = Erro RMS da solução, somente relés / com a distância da Terra

# text
seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

# text
seg-873187e2b016 = { "112.742" } m / { "86.499" } m

# text
seg-bcba58871d0b = Sigma formal mediano, somente relés / com a distância da Terra

# text
seg-536757d9f141 = { "1.375" } m / { "1.304" } m

# text
seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

# text
# c1: docs/revisions/STUDIO15-portable-math-rebaseline.md
seg-67d3d30060ad = (RMS: raiz do valor quadrático médio.) Uma época de Europa (t = { "16 200" } s) fica no limite da disponibilidade, onde o último bit de um raio calculado decide se a sua solução com a distância da Terra é obtida. Antes da { "0.36" }, a biblioteca matemática do hospedeiro decidia isso; assim, o mesmo cenário imprimia { "0.719" } e { "86.147" } m no Linux x86-64 e { "0.725" } e { "85.800" } m no macOS arm64 para os dois valores "com a distância da Terra". Desde a { "0.36" }, toda função transcendente é calculada pela biblioteca matemática portátil, a época se resolve de uma única maneira em todas as plataformas (nativa e WebAssembly dão os mesmos bytes), e os valores são { "0.713" } e { "86.499" } m (<a1><c1/></a1>). Em torno de Europa, a distância da Terra eleva a disponibilidade de { "0.480" } para { "0.713" } das épocas. Onde a Terra nunca se afasta do limbo, o enlace não acrescenta nada: um módulo de pouso a { "89.5" } graus S na Lua, sob uma casca de relés de 12 satélites a { "5000" } km, tem a Terra em visada em { "0" } de { "145" } épocas, e seus erros são os mesmos com e sem o enlace.

# text
seg-41507568efb8 = <b>MODELLED.</b> As órbitas dos relés ignoram terceiros corpos (a atração de Júpiter sobre relés em torno de Europa não é modelada), o ruído é gaussiano nos níveis declarados e o modelo de medição é instantâneo, não retardado pelo tempo de luz. O que é verificado: o período do relé em relação à terceira lei de Kepler para o corpo, um orbitador que mantém o seu raio e um módulo de pouso na superfície, a distância da Terra nunca piorando a incerteza formal, os erros da solução com semente fixa concordando com o sigma formal (raiz do valor quadrático médio do erro sobre o sigma em [{ "0.6" }, { "1.5" }]) e uma execução determinística. Nada disso são dados de navegação de uma missão.

# text
# c1: ephemeris
seg-b78c9e331a43 = O tipo <c1/>

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: src/ephemeris.rs
seg-b9f40c641a49 = Apesar do nome, <c1/> é um tipo de satélite da Terra: um satélite, a partir de um conjunto de elementos de duas linhas (TLE) pelo propagador Simplified General Perturbations { "4" } (SGP4) ou a partir de uma órbita analítica, sobre uma grade de tempo. A cada passo, ele emite o estado inercial (posição e velocidade) no referencial true equator, mean equinox (TEME) e no Geocentric Celestial Reference System (GCRS), a posição fixa à Terra, o ponto subsatélite do World Geodetic System { "1984" } (WGS { "84" }) e, para uma estação em solo opcional, azimute, elevação, distância e taxa de variação da distância. <c2/> recebe o texto de um arquivo <c3/> do International Earth Rotation and Reference Systems Service (IERS) para UT1−UTC e movimento polar por época. Código: <c4/>.

# text
seg-1babcba7b4ba = Termos relativísticos de tempo de luz além do atraso de Shapiro informado separadamente, e o atraso por plasma solar.

# text
seg-0c49dfc777ca = Posições melhores que a exatidão de Standish e de elementos médios declarada acima; não há leitor de kernel no crate principal.

# text
# c1: body-pnt
# c2: constellation-design
seg-18d925e53ce0 = Perturbações de terceiros corpos nos relés de <c1/> e nas órbitas de <c2/>.

# text
seg-3968ed54e3fe = Terreno em qualquer corpo: um corpo é a sua esfera média.

# text
# c1: solar-system
# c2: body-pnt
seg-4650526c532e = Exportações de interoperabilidade: CZML, KML e GeoJSON descrevem posições em torno da Terra; portanto, os cenários <c1/> e <c2/> não exportam nenhum (<a1>INTEROP.md</a1>).

# text
seg-cb7e3d4bf5aa = E. M. Standish e J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets," JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

# text
seg-aaf6a1f91c1a = O. Montenbruck e E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

# text
seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }," <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

# text
seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

# text
seg-e95a41f0ded7 = <s1>Anterior</s1>Validação do modelo de forças

# text
seg-a801b99f7040 = <s1>Próximo</s1>Estação de referência lunar

# text
seg-e0aba02258f4 = O tipo ephemeris
