# docs--kind-body-pnt: translations (pt-PT)

# text
seg-5b561b4fd201 = Marte

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
# c1: docs/kinds/by-kind/body-pnt.md
seg-02b8d1f1b7df = Fonte: <c1/>

# text
# c1: body-pnt
seg-e28ba749a2a1 = <c1/> (tipo de cenário)

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-e7dad1a1ecba = Posicionamento em torno de qualquer corpo do sistema solar: um orbitador ou um módulo de aterragem na superfície em torno de um corpo central escolhido pelo nome (Marte, a Lua, Europa, Ganimedes, Titã e o restante do catálogo do sistema solar), a navegar com pseudodistâncias unidirecionais de uma pequena constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do próprio corpo, um relógio de utilizador desconhecido) e, opcionalmente, uma medida de distância bidirecional de espaço profundo, sem relógio, a partir da Terra, cuja direção e distância vêm das efemérides analíticas do sistema solar em cada época. As linhas de visada são bloqueadas pela esfera média do corpo, e um utilizador na superfície também precisa da máscara de elevação. Por época: relés em vista, se a Terra está acima do limbo, o GDOP e o PDOP apenas da constelação (diluição de precisão geométrica e de posição), a incerteza formal de posição de um sigma com e sem a linha da Terra, e o erro de uma solução de posição por mínimos quadrados de Gauss-Newton com semente, em cada caso; ao longo da execução: disponibilidade, visibilidade da Terra, PDOP mediano, erro RMS e sigma formal mediano, além do tempo de luz Terra-corpo, da ida e volta, do atraso de Shapiro e da separação do Sol na época. MODELLED: as órbitas dos relés, os níveis de ruído e o modelo de medida instantâneo são escolhas de modelação, não validadas contra dados de navegação de uma missão; as constantes do corpo são os valores publicados citados em body.rs, e a geometria da Terra herda os rótulos das efemérides do sistema solar.

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-c90c1a79f88b = Uma execução de <c1/> resume-se assim: Posicionamento em torno de Marte — utilizador orbitador, { "12" } relés a { "10000" } km, { "296" } épocas tempo de luz da Terra { "338.3" } s num só sentido, { "676.6" } s ida e volta; ângulo Sol-Terra-corpo { "175.4" } deg disponibilidade: { "1.000" } apenas constelação, { "1.000" } com a distância da Terra (Terra em vista { "0.811" }) PDOP mediano { "1.375" } ; erro RMS { "1.883" } m apenas constelação, { "1.629" } m com a distância da Terra sigma formal mediano { "1.375" } m apenas constelação, { "1.304" } m com a distância da Terra

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
seg-31bacf177d9c = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-3f1989254167 = O exemplo <c1/> define, entre outros:

# text
seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

# text
seg-753b1683fb7b = m^3/s^{ "2" }

# text
seg-81d4cd54bd62 = Rótulo do resultado (o do motor): MODELLED: órbitas de relés de dois corpos com deriva secular de J2, visibilidade geométrica, ruído gaussiano de distância e um modelo de medida instantâneo em torno de um corpo a partir das constantes publicadas; não validado contra dados de navegação de uma missão. A geometria Terra-corpo herda o rótulo das efemérides do sistema solar

# attr:alt
seg-6f341acbe994 = O gráfico que o motor escreve para scenarios/mars-orbit-pnt.toml, tipo de cenário body-pnt

# text
seg-dae4184bb004 = <b>VALIDATED</b> O tempo de luz newtoniano unidirecional de qualquer corpo para qualquer outro, recebido numa época, resolvido pelo solucionador radiométrico de ponto fixo de tempo de luz (radiometric::light_time_solution, transmissor na sua posição retardada) por meio de solar_system::link_o Testes: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> O tipo de cenário <c1/>: um orbitador ou um módulo de aterragem na superfície em torno de um corpo escolhido pelo nome navega com pseudodistâncias unidirecionais de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do corpo, um relógio de utilizador desconhecido

# text
# c1: body-pnt
seg-5c3f8ac041d3 = <b>MODELLED</b> O tipo de cenário <c1/>: um orbitador ou um módulo de aterragem na superfície em torno de um corpo escolhido pelo nome navega com pseudodistâncias unidirecionais de uma constelação de navegação Walker em torno. Referência independente (InternalConsistency): Formas fechadas e autoconsistência: a terceira lei de Kepler para o período dos relés, o raio da órbita e o raio da superfície mantidos ao longo da execução, o facto de o acréscimo de uma medida nunca aumentar a incerteza formal e de os erros com semente concordarem com a covariância. As órbitas dos relés ignoram terceiros corpos (a atração de Júpiter sobre relés em torno de Europa não é modelada), o ruído é gaussiano nos níveis declarados e o modelo de medida é instanta

# text
# c1: label
seg-64920deda9cd = MODELLED: órbitas de relés de dois corpos com deriva secular de J2, visibilidade geométrica, ruído gaussiano de distância e um modelo de medida instantâneo em torno de um corpo a partir das constantes publicadas; não validado contra dados de navegação de uma missão. A geometria Terra-corpo herda os rótulos das efemérides do sistema solar. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-bcb5cbf9cbe3 = MODELLED: as órbitas dos relés, os níveis de ruído e o modelo de medida instantâneo são escolhas de modelação, não validadas contra dados de navegação de uma missão; as constantes do corpo são os valores publicados citados em body.rs, e a geometria da Terra herda os rótulos das efemérides do sistema solar. (catálogo de tipos de cenário (<c1/>))

# text
seg-04cd882741e2 = MODELLED. As órbitas dos relés, o ruído de distância de { "1" } m e o modelo de medida instantâneo são escolhas de modelação; nada aqui é validado contra dados de navegação de uma missão. As constantes de Marte são os valores publicados citados em src/body.rs. (comentário do ficheiro de cenário, linhas { "20" } a { "22" })

# text
seg-df6bae4c422e = O posicionamento em torno de qualquer corpo do sistema solar com uma constelação local e um enlace de espaço profundo a partir da Terra é MODELLED, não validado: verificado contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-670191cf797f = Página do tópico: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Página do tópico: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-a4c650a0eb7a = <s1>Anterior</s1>attitude-budget

# text
seg-96170e5c8e3f = <s1>Seguinte</s1>campaign
