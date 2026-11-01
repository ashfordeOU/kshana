# docs--kind-solar-system: translations (pt-PT)

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
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-dae4184bb004 = <b>VALIDATED</b> O tempo de luz newtoniano unidirecional de qualquer corpo para qualquer outro, recebido numa época, resolvido pelo solucionador radiométrico de ponto fixo de tempo de luz (radiometric::light_time_solution, transmissor na sua posição retardada) por meio de solar_system::link_o Testes: <a1>solar_system_light_time_preregistered.rs</a1>.

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
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Fonte: <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (tipo de cenário)

# text
seg-0549bc926a9b = O sistema solar completo numa época, para PNT (posicionamento, navegação e temporização) em torno de qualquer corpo. Para o Sol, os oito planetas, Plutão, a Lua, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã, indica a posição e a velocidade heliocêntricas no ICRF (Referencial Celeste Internacional, equatorial J2000), a distância heliocêntrica e a longitude e latitude eclípticas J2000, o parâmetro gravitacional, o raio equatorial e médio, J2 quando publicado e o seu raio de referência, o período de rotação sideral, o polo IAU e o meridiano de origem na época, uma trajetória orbital amostrada ao longo de uma revolução (heliocêntrica para os planetas, centrada no corpo principal para as luas), e o tempo de luz, a distância unidirecional e bidirecional, o atraso de Shapiro solar e a separação do Sol a partir de um corpo observador (predefinição: Terra); as ligações adicionais de origem/destino recebem o mesmo tratamento. Posições: os elementos keplerianos JPL de Standish e Williams (Tabela { "1" } para { "1800" } AD a { "2050" } AD, Tabelas 2a/2b para { "3000" } BC a { "3000" } AD) com o erro nominal de cada planeta, a série lunar de Montenbruck & Gill para a separação Terra-Lua, elementos médios JPL com a taxa de rotação síncrona IAU para as luas marcianas e galileanas, e o modelo de rotação IAU para Titã. Tempo de luz: resolução radiométrica de ponto fixo, com o emissor na sua posição retardada; newtoniano, com o atraso de Shapiro indicado em separado. VALIDATED face ao JPL Horizons (DE441) dentro do dobro do erro nominal: de Mercúrio a Saturno e a Terra a partir da Tabela { "1" } (pior caso { "1.87" } vezes o nominal) e os oito planetas a partir das Tabelas 2a/2b (pior caso { "1.71" } vezes), e o tempo de luz da Terra a Marte e a Júpiter. MODELLED, cada linha etiquetada: Úrano e Neptuno a partir da Tabela { "1" } ({ "2.0" } e { "5.2" } vezes o erro nominal face ao DE441), Plutão (a linha de { "1992" }; sem erro indicado), a Lua e as sete luas (medidas face ao Horizons, sem limite publicado).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Uma execução de <c1/> resume-se assim: Sistema solar a 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } corpos, observador Terra Standish Tabela { "1" } ({ "1800" } AD a { "2050" } AD) Sol { "0.0000" } au lon { "0.00" } deg tempo de luz { "500.1" } s [origin] Mercúrio { "0.4666" } au lon { "259.05" } deg tempo de luz { "605.3" } s [VALIDATED] Vénus { "0.7272" } au lon { "348.72" } deg tempo de luz { "182.1" } s [VALIDATED] Terra { "1.0022" } au lon { "4.52" } deg observador [VALIDATED] Lua { "1.0046" } au lon { "4.56" } deg tempo de luz { "1.3" } s [MODELLED] Marte { "1.5544" } au lon { "83.81" } deg tempo de luz { "841.1" } s [VALIDATED] Fobos { "1.5545" } au lon { "83.81" } deg tempo de luz { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg tempo de luz { "841.1" } s [MODELLED] Júpiter { "5.3036" } au lon { "130.91" } deg tempo de luz { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg tempo de luz { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg tempo de luz { "2968.7" } s [MODELLED] Ganimedes { "5.3005" } au lon { "130.98" } deg tempo de luz { "2969.6" } s [MODELLED] Calisto { "5.3153" } au lon { "130.96" } deg tempo de luz { "2976.7" } s [MODELLED] Saturno { "9.4356" } au lon { "10.77" } deg tempo de luz { "4212.2" } s [VALIDATED] Titã { "9.4401" } au lon { "10.74" } deg tempo de luz { "4214.3" } s [MODELLED] Úrano { "19.4363" } au lon { "62.62" } deg tempo de luz { "9444.1" } s [MODELLED] Neptuno { "29.8775" } au lon { "2.62" } deg tempo de luz { "14409.3" } s [MODELLED] Plutão { "35.6122" } au lon { "304.19" } deg tempo de luz { "17529.1" } s [MODELLED] ligação Marte -> Júpiter: unidirecional { "2193.539" } s, bidirecional { "4386.919" } s, Shapiro { "15.0" } us, Sol { "15.0" } deg ligação Saturno -> Terra: unidirecional { "4212.176" } s, bidirecional { "8424.347" } s, Shapiro { "22.1" } us, Sol { "172.5" } deg ligação Europa -> Júpiter: unidirecional { "2.218" } s, bidirecional { "4.437" } s, Shapiro { "0.0" } us, Sol { "22.0" } deg

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
seg-6096a0ab243b = Standish Tabela { "1" } ({ "1800" } AD a { "2050" } AD)

# text
seg-5c9a8d4716f5 = Etiqueta de resultado (a do motor): MIXED: cada corpo tem a sua própria etiqueta. As posições dos planetas são VALIDATED face ao JPL Horizons dentro do dobro do erro nominal de Standish (de Mercúrio a Saturno e a Terra a partir da Tabela { "1" }; os oito planetas a partir das Tabelas 2a/2b); Úrano e Neptuno a partir da Tabela { "1" }, Plutão, a Lua e as sete luas são MODELLED.

# attr:alt
seg-537aa8010e50 = O gráfico que o motor escreve para scenarios/solar-system-tour.toml, tipo solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> O tipo <c1/> com planetary_kernel_path: cada corpo indicado cujo próprio código NAIF o SPK contém obtém a sua posição e velocidade heliocêntricas J2000 do kernel através do leitor do próprio motor (etiqueta KERNEL), uma ligação cujos dois extr

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Posições heliocêntricas de Mercúrio, Vénus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } AD a { "2050" } AD), e dos oito planetas a partir das Tabelas 2a/2b ({ "3000" } BC a { "3000" } AD, com os b, c, s, f de anomalia média Ensaios: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Posições de Úrano e Neptuno a partir da Tabela { "1" } de Standish (a predefinição entre { "1800" } AD e { "2050" } AD), Plutão a partir da linha da Tabela { "1" } de { "1992" } que a atual página do JPL já não lista, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com Ensaios: <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> O tipo <c1/> com planetary_kernel_path: cada corpo indicado cujo próprio código NAIF o SPK contém obtém a sua posição e velocidade heliocêntricas J2000 do. Referência independente (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 até spiceypy { "8.3.0" }) estados heliocêntricos spkezr no de440s.bsp completo, um programa separado que não chama código do Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); o motor lê recortes de de440s bit a bit. Pré-registado f8e946ea. Uma verificação de biblioteca da ligação: o próprio DE440 e os corpos analíticos não são validados aqui. Resultados: docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Posições heliocêntricas de Mercúrio, Vénus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } AD a { "2050" } AD), e de todos . Referência independente (ExternalDataset): vetores heliocêntricos geométricos JPL Horizons DE441 (eclíptica e ICRF), obtidos depois dos commits de pré-registo { "80451866" }, 8d38a28b e 558cc807. Limiar: por planeta e componente, RMS no máximo 1.0x os erros aproximados da Tabela { "8.10.1" } do Explanatory Supplement 3.ª ed. (a linha EMB para a Terra); a separação Terra-EMB é verificada diretamente face ao DE441 { "399" } menos { "3" }, no máximo { "0.3" } deg e { "8.1" } km em cada época 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> O tempo de luz newtoniano unidirecional de qualquer corpo para qualquer outro, recebido numa época, resolvido pelo solucionador radiométrico de ponto fixo de tempo de luz (radiometric::light_t. Referência independente (ExternalDataset): tempo de luz newtoniano LT unidirecional descendente do JPL Horizons DE441 (VEC_CORR=LT, observador no centro da Terra), pré-registado (480037d3, emenda 54d5c86f que alterou apenas o espaçamento dos nós de interpolação depois de a primeira obtenção falhar a sua pré-condição de precisão de interpolação de { "10" } m, antes de qualquer tempo de luz ser comparado) com um limiar de { "1e-6" } s por tempo de luz, o solucionador alimentado com posições baricêntricas DE441, de modo que a iteração do emissor retardado é visív

# text
seg-5a2e745828ea = <b>MODELLED</b> Posições de Úrano e Neptuno a partir da Tabela { "1" } de Standish (a predefinição entre { "1800" } AD e { "2050" } AD), Plutão a partir da linha da Tabela { "1" } de { "1992" } que a atual página do JPL já não li. Referência independente (ExternalDataset): medidas face ao JPL Horizons DE441 (as mesmas fixtures registadas), mas não validadas: os valores indicados na Tabela { "1" } para Úrano e Neptuno são excedidos em até { "2.0" } e { "5.2" } vezes face às posições heliocêntricas DE441 (Neptuno satisfaz-os face às posições baricêntricas, o que sugere que o ajuste não foi heliocêntrico), a página não indica erro para Plutão e não existe limite publicado para as velocidades. As Tabelas 2a/2b satisfazem os seus pró

# text
# c1: label
seg-0131b082906b = MIXED: cada corpo tem a sua própria etiqueta. As posições dos planetas são VALIDATED face ao JPL Horizons dentro do dobro do erro nominal de Standish (de Mercúrio a Saturno e a Terra a partir da Tabela { "1" }; os oito planetas a partir das Tabelas 2a/2b); Úrano e Neptuno a partir da Tabela { "1" }, Plutão, a Lua e as sete luas são MODELLED. Os tempos de luz são newtonianos, a partir das mesmas posições. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, cada linha etiquetada: Úrano e Neptuno a partir da Tabela { "1" } ({ "2.0" } e { "5.2" } vezes o erro nominal face ao DE441), Plutão (a linha de { "1992" }; sem erro indicado), a Lua e as sete luas (medidas face ao Horizons, sem limite publicado). (catálogo de tipos (<c1/>))

# text
seg-62b2e925233a = O QUE É VALIDATED, E O QUE NÃO É Cada corpo tem a sua própria etiqueta. De Mercúrio a Saturno e a Terra são VALIDATED face ao JPL Horizons (Development Ephemeris DE441) dentro do dobro do erro nominal da página de Standish. Úrano e Neptuno a partir da Tabela { "1" } excedem os valores da página face ao DE441 (em { "2.0" } e { "5.2" } vezes) e são MODELLED; o mesmo se passa com Plutão, a Lua e as sete luas, que foram medidas face ao Horizons mas não têm qualquer limite publ (comentário do ficheiro de cenário, linhas { "20" } a { "25" })

# text
seg-2b36ac40e457 = Úrano e Neptuno a partir da Tabela { "1" } de Standish, Plutão e as velocidades planetárias são MODELLED, não validados: uma subalegação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = As posições da Lua e de sete luas principais (Fobos, Deimos, as luas galileanas, Titã) são MODELLED, não validadas: uma subalegação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = As constantes físicas de cada corpo do sistema solar e o relatório do sistema completo são MODELLED, não validados: verificados face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Anterior</s1>slot-timing

# text
seg-0493962a6937 = <s1>Seguinte</s1>space-packet
