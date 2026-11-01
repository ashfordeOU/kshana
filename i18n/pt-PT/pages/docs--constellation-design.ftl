# docs--constellation-design: translations (pt-PT)

# text
seg-f63dd3d7aad4 = Fonte

# text
# c1: docs/CONSTELLATION-DESIGN.md
seg-8f0e4021404d = Fonte: <c1/>

# text
# c1: constellation-design
# c2: src/body.rs
# c3: solar-system
# c4: body-pnt
# c5: src/constellation.rs
seg-44196ab9678c = O tipo de cenário <c1/> constrói uma ou mais constelações de satélites em torno da Terra, da Lua, de Marte ou de qualquer outro corpo do catálogo do sistema solar (<c2/>: os oito planetas, Plutão, a Lua, Fobos, Deimos, as quatro luas galileanas e Titã, com as mesmas constantes que os tipos de cenário <c3/> e <c4/> usam; ver <a1>SOLAR-SYSTEM.md</a1>) e mapeia a sua cobertura e a diluição da precisão (DOP) sobre uma grelha de latitude/longitude. Fonte: <c5/>.

# text
# c1: body
# c2: earth
# c3: duration_s
# c4: step_s
# c5: mask_deg
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: j2 = true
seg-61385c509a3d = O corpo é escolhido com <c1/> (predefinição <c2/>). A execução abrange <c3/> (predefinição um dia sideral, { "86 164" } s) em passos de <c4/> (predefinição { "600" } s), acima de <c5/> (predefinição { "5" } deg), sobre uma grelha de <c6/> (predefinição { "10" } deg) que <c7/>, <c8/>, <c9/> e <c10/> podem restringir; <c11/> acrescenta a deriva secular devida a J2, o segundo harmónico zonal do campo gravítico do corpo.

# text
seg-d02f6d747522 = O que entra

# text
# c1: T/P/F
# c2: T
# c3: P
# c4: F
# c5: k
# c6: raan0 + k·ΔΩ
# c7: j
# c8: m0 + j·360·P/T + k·360·F/T
seg-743e68478333 = <b>Camadas Walker</b> na convenção <c1/>: <c2/> satélites em <c3/> planos igualmente espaçados com faseamento <c4/>. Um padrão <em>delta</em> distribui os nós ascendentes por { "360" } deg, um padrão <em>estrela</em> por { "180" } deg. O plano <c5/> situa-se no nó <c6/> e o satélite <c7/> desse plano na anomalia média <c8/>.

# text
seg-d86b01d633a0 = <b>Conjuntos explícitos de elementos</b>: semieixo maior ou altitude, excentricidade, inclinação, ascensão reta do nó ascendente (RAAN), argumento do periapsis e anomalia média.

# text
seg-0737ef1ddb72 = <b>Predefinições</b> a partir de elementos nominais publicados (apenas a Terra; uma predefinição em torno de outro corpo é um erro):

# text
seg-587beeccaa11 = Predefinição

# text
seg-1ff32b87e030 = Satélites

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5.ª edição, abril de { "2020" }, Tabelas 3.2-1 e 3.2-3

# text
seg-fb6956d09acc = { "24" } a { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS Tabela 3.2-2: cada uma das seis posições expansíveis (B1, D2, F2, A2, C4, E3) indicadas em <c1/> é substituída pelo respetivo par dianteiro e traseiro; todas as seis por predefinição

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), edição { "1.1" }: Walker 24/3/1, semieixo maior { "29 599.801" } km, { "56" } deg (Tabela { "1" }), posições da Tabela { "23" }

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), secção { "4.1" }: órbita terrestre média (MEO) Walker 24/3/1 a { "21 528" } km e { "55" } deg, mais três satélites geoestacionários (GEO) a { "80" }, { "110.5" } e { "140" } deg E e três satélites geossíncronos inclinados (IGSO) a { "55" } deg

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), edição { "5.1" } ({ "2008" }), secção { "5.2" }: fórmula das posições, { "19 100" } km, { "64.8" } deg

# text
seg-654d7aceff94 = A RAAN da tabela do GPS é inercial na sua época; a predefinição converte-a numa longitude de nó fixa à Terra com o ângulo horário de Greenwich que a tabela indica ({ "100.765" } deg). O GLONASS indica diretamente longitudes de nó absolutas (de Greenwich). O documento do Galileo não indica ângulo horário, pelo que a sua RAAN é usada como longitude do nó. A norma do BeiDou não indica a fase MEO nem os nós IGSO; a predefinição inicia o padrão MEO no nó { "0" } e na anomalia média { "0" } e coloca os três IGSO numa mesma projeção no solo que cruza o equador a { "118" } deg E. Essas duas escolhas são modeladas.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Várias constelações podem partilhar uma execução. Com <c1/> (a predefinição), o recetor estima um relógio por sistema à vista, como faz um recetor multi-GNSS (Global Navigation Satellite System); <c2/> partilha um só relógio.

# text
seg-27db52482bdd = O que sai

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Por célula da grelha: número médio, mínimo e máximo de satélites acima da máscara; a proporção de épocas com uma solução de posição e com DOP de posição (PDOP) igual ou inferior a <c1/>; DOP geométrico, de posição, horizontal e vertical médios (GDOP, PDOP, HDOP, VDOP); maior PDOP. A nível global, ponderados pelo cosseno da latitude para que cada célula conte pela sua área: disponibilidade, disponibilidade no pior local e a média, a mediana, os percentis 90, 95 e 99 e o máximo de cada DOP. Por satélite: uma projeção no solo subamostrada (<c2/> amostras, predefinição { "24" }, para um máximo de <c3/> satélites, predefinição { "120" }). O gráfico são dois mapas, disponibilidade e PDOP médio.

# text
seg-6cb532d0bca9 = Como escala

# text
# c1: r
# c2: ε
# c3: λ = arccos((R/r)·cos ε) − ε
# c4: cos λ
# c5: φ
# c6: λ_max
# c7: φ
# c8: work
# c9: leo-pnt-mega-shell
seg-988ae3272c1f = Um satélite ao raio <c1/> está acima de uma máscara de elevação <c2/> exatamente quando o seu ângulo central em relação ao utilizador é, no máximo, <c3/>, pelo que o teste de visibilidade é um único produto escalar contra <c4/>. Em cada época, os satélites são também ordenados por latitude subsatélite, e uma linha da grelha à latitude <c5/> só testa os satélites a menos de <c6/> de <c7/>. Ambos são exatos num corpo esférico, e um teste unitário compara cada mapa com uma pesquisa exaustiva com o teste de elevação direto. O bloco <c8/> indica os testes de pares que uma pesquisa exaustiva faria e os que foram feitos. O projeto de { "5" } 000 satélites do teste unitário numa grelha de { "10" } deg ({ "648" } pontos, { "6" } épocas) mantém { "9.9" } % dos { "19 440 000" } testes de pares da pesquisa exaustiva; o cenário incluído <c9/> ({ "5 000" } satélites, { "648" } pontos, { "12" } épocas) executa-se em cerca de { "0.14" } s com o binário de linha de comandos de lançamento num portátil com Apple silicon. Os tempos reais variam com a máquina e a sua carga. O motor não usa threads, relógio nem sistema de ficheiros, pelo que executa-se sem alterações como WebAssembly.

# text
seg-abba032ee1c7 = O que é verificado e face a quê

# text
seg-2342ed239300 = VALIDATED, face a documentos publicados:

# text
seg-dc7fe92fcf05 = o gerador Walker reproduz todas as { "24" } linhas da Tabela { "23" } do Galileo OS SDD, e a fórmula das posições do ICD do GLONASS é o mesmo conjunto de { "24" } posições que um Walker 24/3/1;

# text
seg-686f9543c7c9 = a predefinição do GPS reproduz a coluna de cruzamento equatorial da projeção no solo das Tabelas 3.2-1 e 3.2-2 do SPS PS: { "35" } de { "36" } localizações a menos de { "0.0108" } deg face a um limiar de arredondamento de { "0.015" } deg. O E3F é sujeito a um limiar mais folgado, de { "0.06" } deg, porque a própria linha E3F da tabela é inconsistente com a sua RAAN e o seu argumento de latitude: o seu argumento de latitude está { "14.60" } deg à frente do de E3, o que desloca o cruzamento em { "7.30" } deg, enquanto a tabela o desloca em { "7.36" } deg;

# text
seg-dc2756c75401 = a linha de base do GPS nas condições do Apêndice B do SPS PS (um dia sideral, { "287" } passos de cinco minutos, uma grelha de { "4" } deg, todos à vista, máscara de { "5" } deg) dá uma mediana global do HDOP de { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } e média { "0.965" }, face aos valores publicados { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } e { "0.96" } (limiar { "0.03" }, fixado antes da primeira execução). A mediana do PDOP, { "1.795" }, é inferior à de { "1.815" } da Tabela B.3-1, que descreve uma combinação degradada de 20-24 satélites. Um PDOP de { "6" } ou menos verifica-se em { "100" } % do tempo, face a { "98" } % globais e { "88" } % no pior local na Tabela 3.8-1.

# text
seg-9aac9d8aa228 = Verificado face a uma dedução manual, não a um documento externo: o DOP de uma única época coincide com a forma fechada para um satélite no zénite e três a { "30" } deg de elevação (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED: órbitas de dois corpos com uma deriva secular J2 opcional; um corpo esférico; apenas visibilidade geométrica (sem potência do sinal, estado de saúde do satélite nem terreno); sem perturbação de terceiro corpo, de que depende uma órbita lunar congelada real. O pior ponto único no espaço-tempo depende da grelha: HDOP { "2.40" } e VDOP { "5.22" } aqui, face a { "2.49" } e { "5.43" } publicados; estes valores são comunicados, não fixados. As predefinições dos quatro sistemas provêm de épocas de referência diferentes, pelo que a sua fase relativa numa mesma execução não é um instantâneo de nenhuma data.

# text
seg-a6c63abeb7e6 = Cenários incluídos

# text
seg-3e6a942c84d4 = Cada linha indica o que a execução imprime com o kshana { $version }.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou e GLONASS ({ "102" } satélites) ao longo de um dia acima de uma máscara de { "10" } deg, um relógio por sistema. Disponibilidade (PDOP de { "6" } ou menos) { "100" } % a nível global e no pior local, PDOP mediano { "0.95" }, { "31.0" } satélites à vista em média.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/>: { "5 000" } satélites em quatro camadas de órbita terrestre baixa (LEO) para posicionamento, navegação e temporização (PNT), com J2, acima de uma máscara de { "20" } deg. Disponibilidade (PDOP de { "3" } ou menos) { "99.22" } % a nível global e { "0" } % no pior local, PDOP mediano { "1.11" }, { "39.4" } satélites à vista em média.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/>: { "8" } satélites em órbitas lunares congeladas elípticas e uma camada circular de 6 satélites em torno da Lua. Disponibilidade (PDOP de { "6" } ou menos) { "21.33" } % a nível global e { "0" } % no pior local, PDOP mediano { "5.22" }, { "3.2" } satélites à vista em média.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = A cobertura LEO-PNT para utilizadores polares e do Ártico, face ao GNSS de órbita terrestre média, é o modo polar do tipo de cenário <c1/> (<c2/>; ver <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Anterior</s1>Posicionamento fundido MEO e LEO

# text
seg-9f717b9015e1 = <s1>Seguinte</s1>Modelos de sensores quânticos
