# docs--kind-entry-heating: translations (pt-BR)

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-a44edb1eb84d = kg

# text
seg-8e62cc4af6ea = Página do tópico: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-d72b4c5393e0 = earth

# text
# c1: docs/kinds/by-kind/entry-heating.md
seg-13b9e9187ab9 = Fonte: <c1/>

# text
# c1: entry-heating
seg-3a3f732cc2dd = <c1/> (tipo de cenário)

# text
seg-b843e2e0a4ee = Entrada atmosférica de massa pontual em 3-DoF sobre uma Terra esférica em rotação ou Marte (balística ou com sustentação a inclinação lateral constante), RK4, através da US76, de uma atmosfera exponencial ou da atmosfera de Marte, com aquecimento convectivo no ponto de estagnação de Sutton-Graves (NASA TR R-376): desaceleração de pico, fluxo de calor e pressão dinâmica, carga térmica, alcance longitudinal, uma verificação de energia no referencial em rotação e a forma fechada de Allen-Eggers ao lado. A desaceleração de pico é conferida contra o valor nominal publicado da Stardust; o aquecimento é MODELLED.

# text
# c1: scenarios/entry-heating-stardust.toml
seg-05c8dac8d411 = Uma execução de <c1/> resume-se assim: entry-heating (terra): V_rel { "12551" } m/s, γ { "8.43" }° -> pico { "35.4" } g a { "54.2" } km, q de pico { "746" } W/cm² a { "62.0" } km, carga térmica { "20970" } J/cm², q_dyn de pico { "20.8" } kPa; altitude terminal em { "317" } s (forma fechada { "60.2" } g; MODELLED 3-DoF, sem radiativo/TPS)

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-96504cafb034 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/entry-heating-stardust.toml
seg-1b68d973fd30 = O exemplo <c1/> define, entre outros:

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) constantes balísticas

# text
seg-3159fc595ac9 = kg/m^{ "3" }

# text
seg-2721e146b7be = Rótulo do resultado (o do motor): MODELLED — entrada de massa pontual em 3-DoF sobre um planeta esférico em rotação (gravidade central, sem J2), atmosfera co-rotante sem vento, C_D, L/D e inclinação lateral constantes, RK4; aquecimento convectivo no ponto de estagnação segundo a NASA TR R-376 ({ "1971" }), parede fria, SEM aquecimento radiativo, SEM resposta de TPS/ablação, NÃO 6-DoF

# attr:alt
seg-dbb618cd6357 = O gráfico que o motor gera para scenarios/entry-heating-stardust.toml, tipo de cenário entry-heating

# text
seg-e73b339df97b = <b>VALIDATED</b> Uma entrada de massa pontual em 3-DoF sobre uma Terra esférica em rotação através da Atmosfera Padrão dos EUA de { "1976" }, integrada com RK4 a partir de um estado de entrada inercial, informando a desaceleração de pico e a sua altitude; o estado de entrada relativo ao planeta a partir da i Testes: <a1>entry_stardust_published.rs</a1>.

# text
seg-10124432b79b = <b>MODELLED</b> Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), o seu pico e a carga térmica integrada ao longo de uma entrada em 3-DoF, balística ou com sustentação a c Testes: <a1>entry_stardust_published.rs</a1>.

# text
seg-54d133781215 = <b>VALIDATED</b> Uma entrada de massa pontual em 3-DoF sobre uma Terra esférica em rotação através da Atmosfera Padrão dos EUA de { "1976" }, integrada com RK4 a partir de um estado de entrada inercial, informando. Referência independente (ExternalDataset): O valor nominal da Stardust de Desai, Mitcheltree e Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): desaceleração máxima de { "33.4" } g a partir de { "12.6" } km/s relativos ao planeta com a massa de lançamento de { "45.8" } kg, uma trajetória POST em 6-DoF com o banco de dados aerodinâmico completo; interface de entrada de Desai, Lyons, Tooley e Kangas (NTRS { "20090004445" }): raio de { "6503.14" } km, inercial de { "12.9" } km/s a -8.2 graus. Limiares fixados antecipadamente em xval/entry-stardust/PREREGISTRATION.

# text
seg-03878684f9a1 = <b>MODELLED</b> Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), o seu . Referência independente (InternalConsistency): Consistência interna: a relação e as constantes como impressas na NASA TR R-376, uma verificação de convergência por meio passo e a ordenação esperada dos picos de aquecimento e de desaceleração. O QUE NÃO É: nenhum valor de aquecimento publicado foi comparado (os artigos da Stardust dão um limite de projeto e uma estimativa convectiva mais radiativa de cerca de { "1200" } W/cm2, que uma relação apenas convectiva não consegue reproduzir); sem aquecimento radiativo, temperatura de parede ou

# text
# c1: label
seg-a0f300b2ce78 = MODELLED — entrada de massa pontual em 3-DoF sobre um planeta esférico em rotação (gravidade central, sem J2), atmosfera co-rotante sem vento, C_D, L/D e inclinação lateral constantes, RK4; aquecimento convectivo no ponto de estagnação segundo a NASA TR R-376 ({ "1971" }), parede fria, SEM aquecimento radiativo, SEM resposta de TPS/ablação, NÃO 6-DoF (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-47f81ab160cc = A desaceleração de pico é conferida contra o valor nominal publicado da Stardust; o aquecimento é MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-47cda83af127 = Interface de entrada com raio de { "6503.14" } km, inercial de { "12.9" } km/s a -8.2 graus, { "45.8" } kg, { "0.811" } m de diâmetro, { "0.2202" } m de raio do nariz (Desai et al., NASA NTRS { "20050042027" } e { "20090004445" }). A latitude e o rumo são uma entrada aproximada presumida sobre o Pacífico; C_D é o padrão do módulo para esfera-cone de { "60" } graus. Desaceleração de pico nominal publicada em 6-DoF: { "33.4" } g. O aquecimento é apenas convectivo de Sutton-Graves, MODELLED. (comentário do arquivo de cenário, linhas { "4" } a { "8" })

# text
seg-98af076be1ac = O aquecimento convectivo de entrada no ponto de estagnação (Sutton-Graves) em uma entrada em 3-DoF é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-77c073cd5d67 = <s1>Anterior</s1>earth-gnss-lunar

# text
seg-20ce5d56783c = <s1>Próximo</s1>eo-coverage
