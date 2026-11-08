# docs--kind-solar-system: translations (pt-BR)

# text
seg-e27476e37522 = Terra

# text
seg-5b561b4fd201 = Marte

# text
seg-59f1f277012b = Júpiter

# text
seg-e6e209ad07e0 = Europa

# text
seg-6f12259c6ec4 = Saturno

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-dae4184bb004 = <b>VALIDATED</b> O tempo de luz newtoniano unidirecional de qualquer corpo para qualquer outro, recebido em uma época, resolvido pelo solucionador radiométrico de ponto fixo de tempo de luz (radiometric::light_time_solution, transmissor na sua posição retardada) por meio de solar_system::link_o Testes: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-670191cf797f = Página do tópico: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Página do tópico: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-4d208b6c0eb8 = dia

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: as linhas da <a1>matriz de verificação</a1> que citam este tipo de cenário.

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Fonte: <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (tipo de cenário)

# text
seg-0549bc926a9b = O sistema solar inteiro em uma época, para PNT (posicionamento, navegação e temporização) em torno de qualquer corpo. Para o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã, informa a posição e a velocidade heliocêntricas no ICRF (Referencial Celeste Internacional, equatorial J2000), a distância heliocêntrica e a longitude e a latitude eclípticas J2000, o parâmetro gravitacional, o raio equatorial e médio, J2 onde publicado e seu raio de referência, o período de rotação sideral, o polo da IAU e o meridiano principal na época, uma trilha orbital amostrada ao longo de uma revolução (heliocêntrica para planetas, centrada no corpo-pai para luas), e o tempo de luz, a distância de ida e a de ida e volta, o atraso Shapiro solar e a separação do Sol a partir de um corpo observador (padrão Terra); vínculos extras de/para recebem o mesmo tratamento. Posições: os elementos keplerianos do JPL de Standish e Williams (Tabela { "1" } para { "1800" } d.C. a { "2050" } d.C., Tabelas 2a/2b para { "3000" } a.C. a { "3000" } d.C.) com o erro nominal de cada planeta, a série lunar de Montenbruck & Gill para a separação Terra-Lua, elementos médios do JPL com a taxa de rotação síncrona da IAU para as luas marcianas e galileanas, e o modelo de rotação da IAU para Titã. Tempo de luz: a solução radiométrica de ponto fixo, com o transmissor em sua posição retardada; newtoniano, com o atraso Shapiro informado separadamente. VALIDATED contra o JPL Horizons (DE441) dentro de duas vezes o erro nominal: de Mercúrio a Saturno e a Terra a partir da Tabela { "1" } (pior caso { "1.87" } vez o nominal) e os oito planetas a partir das Tabelas 2a/2b (pior caso { "1.71" } vez), e o tempo de luz da Terra a Marte e Júpiter. MODELLED, cada linha rotulada: Urano e Netuno a partir da Tabela { "1" } ({ "2.0" } e { "5.2" } vezes o erro nominal contra o DE441), Plutão (a linha de { "1992" }; sem erro declarado), a Lua e as sete luas (medidas contra o Horizons, sem limite publicado).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Uma execução de <c1/> resume-se assim: Sistema solar em 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } corpos, observador Terra Standish Tabela { "1" } ({ "1800" } d.C. a { "2050" } d.C.) Sol { "0.0000" } au lon { "0.00" } deg tempo de luz { "500.1" } s [origem] Mercúrio { "0.4666" } au lon { "259.05" } deg tempo de luz { "605.3" } s [VALIDATED] Vênus { "0.7272" } au lon { "348.72" } deg tempo de luz { "182.1" } s [VALIDATED] Terra { "1.0022" } au lon { "4.52" } deg observador [VALIDATED] Lua { "1.0046" } au lon { "4.56" } deg tempo de luz { "1.3" } s [MODELLED] Marte { "1.5544" } au lon { "83.81" } deg tempo de luz { "841.1" } s [VALIDATED] Fobos { "1.5545" } au lon { "83.81" } deg tempo de luz { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg tempo de luz { "841.1" } s [MODELLED] Júpiter { "5.3036" } au lon { "130.91" } deg tempo de luz { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg tempo de luz { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg tempo de luz { "2968.7" } s [MODELLED] Ganimedes { "5.3005" } au lon { "130.98" } deg tempo de luz { "2969.6" } s [MODELLED] Calisto { "5.3153" } au lon { "130.96" } deg tempo de luz { "2976.7" } s [MODELLED] Saturno { "9.4356" } au lon { "10.77" } deg tempo de luz { "4212.2" } s [VALIDATED] Titã { "9.4401" } au lon { "10.74" } deg tempo de luz { "4214.3" } s [MODELLED] Urano { "19.4363" } au lon { "62.62" } deg tempo de luz { "9444.1" } s [MODELLED] Netuno { "29.8775" } au lon { "2.62" } deg tempo de luz { "14409.3" } s [MODELLED] Plutão { "35.6122" } au lon { "304.19" } deg tempo de luz { "17529.1" } s [MODELLED] vínculo Marte -> Júpiter: ida { "2193.539" } s, ida e volta { "4386.919" } s, Shapiro { "15.0" } us, Sol { "15.0" } deg vínculo Saturno -> Terra: ida { "4212.176" } s, ida e volta { "8424.347" } s, Shapiro { "22.1" } us, Sol { "172.5" } deg vínculo Europa -> Júpiter: ida { "2.218" } s, ida e volta { "4.437" } s, Shapiro { "0.0" } us, Sol { "22.0" } deg

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-26ecec1af8af = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/solar-system-tour.toml
seg-13de19567146 = O exemplo <c1/> define, entre outros:

# text
seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

# text
seg-c4b64eb26210 = ICRF (equatorial J2000), heliocêntrico; m

# text
seg-6096a0ab243b = Standish Tabela { "1" } ({ "1800" } d.C. a { "2050" } d.C.)

# text
seg-5c9a8d4716f5 = Rótulo do resultado (do mecanismo): MIXED: cada corpo traz o seu próprio rótulo. As posições dos planetas são VALIDATED contra o JPL Horizons dentro de duas vezes o erro nominal de Standish (de Mercúrio a Saturno e a Terra a partir da Tabela { "1" }; os oito planetas a partir das Tabelas 2a/2b); Urano e Netuno a partir da Tabela { "1" }, Plutão, a Lua e as sete luas são MODELLED.

# attr:alt
seg-537aa8010e50 = O gráfico que o mecanismo gera para scenarios/solar-system-tour.toml, tipo solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> O tipo <c1/> com planetary_kernel_path: cada corpo informado cujo próprio código NAIF o SPK contém obtém sua posição e velocidade heliocêntricas J2000 do kernel por meio do leitor do próprio mecanismo (rótulo KERNEL), um vínculo cujas duas extremi

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Posições heliocêntricas de Mercúrio, Vênus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } d.C. a { "2050" } d.C.), e dos oito planetas a partir das Tabelas 2a/2b ({ "3000" } a.C. a { "3000" } d.C., com os b, c, s, f mean-an Testes: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Posições de Urano e Netuno a partir da Tabela { "1" } de Standish (o padrão dentro de { "1800" } d.C. a { "2050" } d.C.), Plutão a partir da linha de { "1992" } da Tabela { "1" } que a página atual do JPL já não lista, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com Testes: <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> O tipo <c1/> com planetary_kernel_path: cada corpo informado cujo próprio código NAIF o SPK contém obtém sua posição e velocidade heliocêntricas J2000 de. Referência independente (ExternalDataset): estados heliocêntricos spkezr do NAIF SPICE Toolkit (CSPICE N0067 até spiceypy { "8.3.0" }) no de440s.bsp completo, um programa separado que não chama código do Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); o mecanismo lê recortes de de440s bit a bit. Pré-registrado f8e946ea. Uma verificação de biblioteca da ligação: o DE440 em si e os corpos analíticos não são validados aqui. Resultados: docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Posições heliocêntricas de Mercúrio, Vênus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } d.C. a { "2050" } d.C.), e de todos . Referência independente (ExternalDataset): vetores heliocêntricos geométricos do JPL Horizons DE441 (eclíptica e ICRF), obtidos após os commits de pré-registro { "80451866" }, 8d38a28b e 558cc807. Limiar: por planeta e componente, RMS de no máximo 1.0x os erros aproximados da Tabela { "8.10.1" } do Explanatory Supplement 3ª ed. (a linha EMB para a Terra); a separação Terra-EMB é conferida diretamente contra o DE441 { "399" } menos { "3" }, no máximo { "0.3" } deg e { "8.1" } km em cada época 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> O tempo de luz newtoniano de ida de qualquer corpo a qualquer outro, recebido em uma época, resolvido pelo solucionador radiométrico de ponto fixo de tempo de luz (radiometric::light_t. Referência independente (ExternalDataset): tempo de luz newtoniano LT do trecho de descida de ida do JPL Horizons DE441 (VEC_CORR=LT, observador o centro da Terra), pré-registrado (480037d3, emenda 54d5c86f que alterou apenas o espaçamento dos nós de interpolação depois que a primeira obtenção falhou na sua precondição de precisão de interpolação de { "10" } m, antes de qualquer tempo de luz ser comparado) com um limiar de { "1e-6" } s por tempo de luz, o solucionador alimentado com posições baricêntricas do DE441 de modo que a iteração do transmissor retardado é visib

# text
seg-5a2e745828ea = <b>MODELLED</b> Posições de Urano e Netuno a partir da Tabela { "1" } de Standish (o padrão dentro de { "1800" } d.C. a { "2050" } d.C.), Plutão a partir da linha de { "1992" } da Tabela { "1" } que a página atual do JPL já não li. Referência independente (ExternalDataset): medido contra o JPL Horizons DE441 (as mesmas fixtures versionadas), mas não validado: os valores declarados na Tabela { "1" } para Urano e Netuno são excedidos em até { "2.0" } e { "5.2" } vezes contra as posições heliocêntricas do DE441 (Netuno os atinge contra posições baricêntricas, o que sugere que o ajuste não foi heliocêntrico), a página não declara erro para Plutão, e não existe limite publicado para as velocidades. As Tabelas 2a/2b atingem seus própr

# text
# c1: label
seg-0131b082906b = MIXED: cada corpo traz o seu próprio rótulo. As posições dos planetas são VALIDATED contra o JPL Horizons dentro de duas vezes o erro nominal de Standish (de Mercúrio a Saturno e a Terra a partir da Tabela { "1" }; os oito planetas a partir das Tabelas 2a/2b); Urano e Netuno a partir da Tabela { "1" }, Plutão, a Lua e as sete luas são MODELLED. Os tempos de luz são newtonianos, a partir das mesmas posições. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, cada linha rotulada: Urano e Netuno a partir da Tabela { "1" } ({ "2.0" } e { "5.2" } vezes o erro nominal contra o DE441), Plutão (a linha de { "1992" }; sem erro declarado), a Lua e as sete luas (medidas contra o Horizons, sem limite publicado). (catálogo de tipos (<c1/>))

# text
seg-62b2e925233a = O QUE É VALIDATED, E O QUE NÃO É Cada corpo traz o seu próprio rótulo. De Mercúrio a Saturno e a Terra são VALIDATED contra o JPL Horizons (Development Ephemeris DE441) dentro de duas vezes o erro nominal da página de Standish. Urano e Netuno a partir da Tabela { "1" } excedem os valores da página contra o DE441 (em { "2.0" } e { "5.2" } vezes) e são MODELLED; assim também Plutão, a Lua e as sete luas, que foram medidas contra o Horizons mas não têm p (comentário do arquivo de cenário, linhas { "20" } a { "25" })

# text
seg-2b36ac40e457 = Urano e Netuno a partir da Tabela { "1" } de Standish, Plutão e as velocidades planetárias é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece Modelled. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = As posições da Lua e das sete luas principais (Fobos, Deimos, as luas galileanas, Titã) é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece Modelled. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = As constantes físicas de cada corpo do sistema solar e o relatório do sistema inteiro é MODELLED, não validado: conferido com a própria identidade analítica de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Anterior</s1>slot-timing

# text
seg-0493962a6937 = <s1>Seguinte</s1>space-packet
