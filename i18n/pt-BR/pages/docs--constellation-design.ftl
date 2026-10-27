# docs--constellation-design: translations (pt-BR)

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
seg-44196ab9678c = O tipo de cenário <c1/> constrói uma ou mais constelações de satélites ao redor da Terra, da Lua, de Marte ou de qualquer outro corpo do catálogo do sistema solar (<c2/>: os oito planetas, Plutão, a Lua, Fobos, Deimos, as quatro luas galileanas e Titã, com as mesmas constantes que os tipos de cenário <c3/> e <c4/> usam; veja <a1>SOLAR-SYSTEM.md</a1>) e mapeia a sua cobertura e a diluição de precisão (DOP) sobre uma grade de latitude/longitude. Fonte: <c5/>.

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
seg-61385c509a3d = O corpo é escolhido com <c1/> (padrão <c2/>). A execução abrange <c3/> (padrão um dia sideral, { "86 164" } s) em passos de <c4/> (padrão { "600" } s), acima de <c5/> (padrão { "5" } graus), em uma grade de <c6/> (padrão { "10" } graus) que <c7/>, <c8/>, <c9/> e <c10/> podem restringir; <c11/> acrescenta a deriva secular devida ao J2, o segundo harmônico zonal do campo gravitacional do corpo.

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
seg-743e68478333 = <b>Camadas Walker</b> na convenção <c1/>: <c2/> satélites em <c3/> planos igualmente espaçados com fase <c4/>. Um padrão <em>delta</em> distribui os nós ascendentes por { "360" } graus, um padrão <em>estrela</em> por { "180" } graus. O plano <c5/> fica no nó <c6/> e o satélite <c7/> dele na anomalia média <c8/>.

# text
seg-d86b01d633a0 = <b>Conjuntos explícitos de elementos</b>: semieixo maior ou altitude, excentricidade, inclinação, ascensão reta do nó ascendente (RAAN), argumento do periapsis e anomalia média.

# text
seg-0737ef1ddb72 = <b>Predefinições</b> a partir de elementos nominais publicados (somente a Terra; uma predefinição ao redor de outro corpo é um erro):

# text
seg-587beeccaa11 = Predefinição

# text
seg-1ff32b87e030 = Satélites

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5ª edição, abril de { "2020" }, Tabelas 3.2-1 e 3.2-3

# text
seg-fb6956d09acc = { "24" } a { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS Tabela 3.2-2: cada um dos seis slots expansíveis (B1, D2, F2, A2, C4, E3) citados em <c1/> é substituído pelo seu par dianteiro e traseiro; todos os seis por padrão

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), edição { "1.1" }: Walker 24/3/1, semieixo maior { "29 599.801" } km, { "56" } graus (Tabela { "1" }), slots da Tabela { "23" }

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), seção { "4.1" }: Walker de órbita terrestre média (MEO) 24/3/1 a { "21 528" } km e { "55" } graus, mais três satélites geoestacionários (GEO) a { "80" }, { "110.5" } e { "140" } graus L e três satélites geossíncronos inclinados (IGSO) a { "55" } graus

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), edição { "5.1" } ({ "2008" }), seção { "5.2" }: fórmula de slots, { "19 100" } km, { "64.8" } graus

# text
seg-654d7aceff94 = O RAAN da tabela do GPS é inercial na sua época; a predefinição o converte em uma longitude de nó fixa à Terra com o ângulo horário de Greenwich que a tabela declara ({ "100.765" } graus). O GLONASS declara diretamente longitudes absolutas (de Greenwich) dos nós. O documento do Galileo não declara ângulo horário, de modo que o seu RAAN é usado como longitude do nó. A norma do BeiDou não declara a fase MEO nem os nós IGSO; a predefinição inicia o padrão MEO no nó { "0" } e na anomalia média { "0" } e coloca os três IGSO em um mesmo traço no solo que cruza o equador a { "118" } graus L. Essas duas escolhas são modeladas.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Várias constelações podem compartilhar uma execução. Com <c1/> (o padrão), o receptor estima um relógio por sistema à vista, como faz um receptor multi-GNSS (Global Navigation Satellite System); <c2/> compartilha um único relógio.

# text
seg-27db52482bdd = O que sai

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Por célula da grade: média, menor e maior número de satélites acima da máscara; a parcela de épocas com fixo e com DOP de posição (PDOP) igual ou inferior a <c1/>; DOP geométrico, de posição, horizontal e vertical médios (GDOP, PDOP, HDOP, VDOP); maior PDOP. Globalmente, ponderado pelo cosseno da latitude para que cada célula conte pela sua área: disponibilidade, disponibilidade do pior sítio e a média, a mediana, os percentis 90, 95 e 99 e o máximo de cada DOP. Por satélite: um traço no solo reduzido por subamostragem (<c2/> amostras, padrão { "24" }, para no máximo <c3/> satélites, padrão { "120" }). O gráfico são dois mapas, a disponibilidade e o PDOP médio.

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
seg-988ae3272c1f = Um satélite de raio <c1/> está acima de uma máscara de elevação <c2/> exatamente quando o seu ângulo central em relação ao usuário é no máximo <c3/>, de modo que o teste de visibilidade é um produto escalar contra <c4/>. A cada época, os satélites também são ordenados pela latitude do subsatélite, e uma linha da grade na latitude <c5/> só testa os satélites a até <c6/> de <c7/>. Ambos são exatos em um corpo esférico, e um teste unitário compara todo mapa com uma varredura de força bruta com o teste direto de elevação. O bloco <c8/> informa os testes de pares que uma varredura de força bruta faria e os que foram feitos. O projeto de { "5" } 000 satélites do teste unitário em uma grade de { "10" } graus ({ "648" } pontos, { "6" } épocas) mantém { "9.9" } % dos { "19 440 000" } testes de pares de força bruta; o cenário incluído <c9/> ({ "5 000" } satélites, { "648" } pontos, { "12" } épocas) é executado em cerca de { "0.14" } s com o binário de linha de comando de versão em um laptop com chip Apple. Os tempos de relógio de parede variam com a máquina e a sua carga. O motor não usa threads, relógio nem sistema de arquivos, de modo que roda sem alterações como WebAssembly.

# text
seg-abba032ee1c7 = O que é verificado, e contra o quê

# text
seg-2342ed239300 = VALIDATED, contra documentos publicados:

# text
seg-dc7fe92fcf05 = o gerador Walker reproduz todas as { "24" } linhas da Tabela { "23" } do Galileo OS SDD, e a fórmula de slots do ICD do GLONASS é o mesmo conjunto de { "24" } slots de um Walker 24/3/1;

# text
seg-686f9543c7c9 = a predefinição do GPS reproduz a coluna de cruzamento equatorial do traço no solo das Tabelas 3.2-1 e 3.2-2 do SPS PS: { "35" } de { "36" } locais dentro de { "0.0108" } graus contra um limiar de arredondamento de { "0.015" } graus. O E3F é mantido a um limiar mais frouxo de { "0.06" } graus, porque a própria linha E3F da tabela é inconsistente com o seu RAAN e o seu argumento de latitude: o seu argumento de latitude está { "14.60" } graus à frente do de E3, o que desloca o cruzamento em { "7.30" } graus, enquanto a tabela o desloca em { "7.36" } graus;

# text
seg-dc2756c75401 = a linha de base do GPS sob as condições do Apêndice B do SPS PS (um dia sideral, { "287" } passos de cinco minutos, uma grade de { "4" } graus, todos à vista, máscara de { "5" } graus) dá uma mediana global de HDOP de { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } e média { "0.965" }, contra os publicados { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } e { "0.96" } (limiar { "0.03" }, fixado antes da primeira execução). A mediana do PDOP, { "1.795" }, é inferior ao { "1.815" } da Tabela B.3-1, que descreve uma mistura degradada de 20-24 satélites. Um PDOP de { "6" } ou menos vale em { "100" } % do tempo, contra { "98" } % global e { "88" } % no pior sítio na Tabela 3.8-1.

# text
seg-9aac9d8aa228 = Verificado contra uma derivação à mão, e não contra um documento externo: o DOP de uma única época coincide com a forma fechada para um satélite no zênite e três a { "30" } graus de elevação (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED: órbitas de dois corpos com uma deriva secular J2 opcional; um corpo esférico; apenas visibilidade geométrica (sem potência de sinal, saúde de satélite ou terreno); sem perturbação de terceiro corpo, da qual depende uma órbita lunar congelada real. O pior ponto único de tempo-espaço depende da grade: HDOP { "2.40" } e VDOP { "5.22" } aqui contra { "2.49" } e { "5.43" } publicados; são informados, não fixados. As predefinições dos quatro sistemas vêm de épocas de referência diferentes, de modo que a sua fase relativa em uma execução não é um instantâneo de nenhuma data.

# text
seg-a6c63abeb7e6 = Cenários incluídos

# text
seg-3e6a942c84d4 = Cada linha dá o que a execução imprime com o kshana { $version }.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou e GLONASS ({ "102" } satélites) ao longo de um dia acima de uma máscara de { "10" } graus, um relógio por sistema. Disponibilidade (PDOP { "6" } ou menos) { "100" } % globalmente e no pior sítio, PDOP mediano { "0.95" }, { "31.0" } satélites à vista em média.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/>: { "5 000" } satélites em quatro camadas de órbita baixa da Terra (LEO) para posicionamento, navegação e temporização (PNT), com J2, acima de uma máscara de { "20" } graus. Disponibilidade (PDOP { "3" } ou menos) { "99.22" } % globalmente e { "0" } % no pior sítio, PDOP mediano { "1.11" }, { "39.4" } satélites à vista em média.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/>: { "8" } satélites em órbitas lunares congeladas elípticas e uma camada circular de 6 satélites ao redor da Lua. Disponibilidade (PDOP { "6" } ou menos) { "21.33" } % globalmente e { "0" } % no pior sítio, PDOP mediano { "5.22" }, { "3.2" } satélites à vista em média.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = A cobertura LEO-PNT para usuários polares e do Ártico, em comparação com o GNSS de órbita terrestre média, é o modo polar do tipo de cenário <c1/> (<c2/>; veja <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Anterior</s1>Posicionamento fundido MEO e LEO

# text
seg-9f717b9015e1 = <s1>Próximo</s1>Modelos de sensores quânticos
