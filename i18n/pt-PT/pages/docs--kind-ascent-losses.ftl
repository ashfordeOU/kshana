# docs--kind-ascent-losses: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/ascent-losses.md
seg-5d7cf510f4e9 = Fonte: <c1/>

# text
# c1: ascent-losses
seg-23e7becab606 = <c1/> (tipo de cenário)

# text
seg-34d041d6bd9f = Ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação, através da US Standard Atmosphere { "1976" } (subida vertical, impulso de inclinação, tração ao longo da velocidade), integrando as perdas por gravidade, resistência, orientação e contrapressão e verificando o dv ideal menos as perdas face à velocidade no fim da queima; max-Q, aceleração máxima e estado no fim da queima. MODELLED.

# text
# c1: scenarios/ascent-losses.toml
seg-cd6181de5e43 = Uma execução de <c1/> resume-se assim: ascent-losses: ideal dv { "11290" } m/s, losses { "2359" } m/s (gravity { "2276" }, drag { "15" }, steering { "0" }, back-pressure { "67" }); burnout { "509" } km at { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-58f9e8d24a73 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ascent-losses.toml
seg-ec4396f2fa76 = O exemplo <c1/> define, entre outros:

# text
seg-a44edb1eb84d = kg

# text
seg-37205a55d23c = m^{ "2" }

# text
seg-98151954f217 = false

# text
seg-68a37ebbc01e = Etiqueta do resultado (a do motor): MODELLED — ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação através da US76, com as perdas por gravidade, resistência, orientação e contrapressão integradas e a identidade dv-ideal-menos-perdas verificada; C_D constante, sem rotação, sem fase de coast, sem orientação para além do impulso de inclinação

# attr:alt
seg-ccf2185b0b5e = O gráfico que o motor escreve para scenarios/ascent-losses.toml, tipo ascent-losses

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação através da US Standard Atmosphere { "1976" } (densidade e pressão), com um impulso de inclinação, tração reduzida pela contrapressão da tubeira, fins de queima dos andares em s

# text
seg-cac91718c4e1 = <b>MODELLED</b> Ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação através da US Standard Atmosphere { "1976" } (densidade e pressão), com um p. Referência independente (InternalConsistency): Consistência interna: a identidade exata velocidade no fim da queima = soma Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo inferior a { "1e-6" } m/s), a equação de Tsiolkovsky numa queima vertical no vácuo com a gravidade como única perda, e as pressões da US76 ao nível do mar e na tropopausa. O QUE NÃO É: não foram comparadas as perdas de nenhum veículo publicado; sem rotação da Terra, fase de coast, regulação de potência nem orientação para além do impulso; C_D constante; não é uma traject

# text
# c1: label
seg-906f001cd9ea = MODELLED — ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação através da US76, com as perdas por gravidade, resistência, orientação e contrapressão integradas e a identidade dv-ideal-menos-perdas verificada; C_D constante, sem rotação, sem fase de coast, sem orientação para além do impulso de inclinação (resultado <c1/>)

# text
seg-f916c5a08595 = Perdas de ascensão com viragem gravitacional de um lançador ILLUSTRATIVE de dois andares a querosene/oxigénio (nenhum veículo real): subida vertical até { "1" } km, um impulso de inclinação de { "3" } deg durante { "10" } s, e depois tração ao longo da velocidade. A execução integra as perdas por gravidade, resistência, orientação e contrapressão e verifica que o dv ideal menos as perdas é igual à velocidade no fim da queima. MODELLED: planar, Terra sem rotação, C_D constante, sem fase de coast, sem orientação para além do impulso. (comentário do ficheiro de cenário, linhas { "1" } a { "5" })

# text
seg-4c237f051651 = As perdas por gravidade, resistência, orientação e contrapressão na ascensão de lançamento são MODELLED, não validadas: verificadas face à sua própria identidade analítica / de forma fechada — apanha erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8e62cc4af6ea = Página do tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-73148557c9a6 = <s1>Anterior</s1>araim-reference-check

# text
seg-3af9699f27a7 = <s1>Seguinte</s1>attitude-budget
