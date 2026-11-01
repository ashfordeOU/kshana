# docs--kind-ascent-losses: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/ascent-losses.md
seg-5d7cf510f4e9 = Fonte: <c1/>

# text
# c1: ascent-losses
seg-23e7becab606 = <c1/> (tipo de cenário)

# text
seg-34d041d6bd9f = Subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa, através da US Standard Atmosphere { "1976" } (subida vertical, chute de arfagem, empuxo ao longo da velocidade), integrando as perdas por gravidade, arrasto, direcionamento e contrapressão e verificando o dv ideal menos as perdas contra a velocidade de fim de queima; max-Q, aceleração de pico e estado de fim de queima. MODELLED.

# text
# c1: scenarios/ascent-losses.toml
seg-cd6181de5e43 = Uma execução de <c1/> resume-se assim: ascent-losses: dv ideal { "11290" } m/s, perdas { "2359" } m/s (gravidade { "2276" }, arrasto { "15" }, direcionamento { "0" }, contrapressão { "67" }); fim de queima { "509" } km a { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

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
seg-68a37ebbc01e = Rótulo do resultado (o do motor): MODELLED — subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa através da US76, com as perdas por gravidade, arrasto, direcionamento e contrapressão integradas e a identidade dv-ideal-menos-perdas verificada; C_D constante, sem rotação, sem fase balística, sem guiagem além do chute de arfagem

# attr:alt
seg-ccf2185b0b5e = O gráfico que o motor grava para scenarios/ascent-losses.toml, tipo de cenário ascent-losses

# text
seg-3a3ee499961e = <b>MODELLED</b> Subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa, através da US Standard Atmosphere { "1976" } (densidade e pressão), com um chute de arfagem, empuxo reduzido pela contrapressão do bocal, fins de queima dos estágios em s exatos

# text
seg-cac91718c4e1 = <b>MODELLED</b> Subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa, através da US Standard Atmosphere { "1976" } (densidade e pressão), com um p. Referência independente (InternalConsistency): Consistência interna: a identidade exata velocidade de fim de queima = soma de Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo abaixo de { "1e-6" } m/s), a equação de Tsiolkovsky em uma queima vertical no vácuo com a gravidade como única perda, e as pressões da US76 ao nível do mar e na tropopausa. O QUE NÃO É: nenhuma perda de veículo publicado foi comparada; sem rotação da Terra, fase balística, aceleração controlada ou guiagem além do chute; C_D constante; não uma trajetória

# text
# c1: label
seg-906f001cd9ea = MODELLED — subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa através da US76, com as perdas por gravidade, arrasto, direcionamento e contrapressão integradas e a identidade dv-ideal-menos-perdas verificada; C_D constante, sem rotação, sem fase balística, sem guiagem além do chute de arfagem (resultado <c1/>)

# text
seg-f916c5a08595 = Perdas de subida em curva gravitacional de um lançador ILLUSTRATIVE de dois estágios a querosene/oxigênio (nenhum veículo real): subida vertical até { "1" } km, um chute de arfagem de { "3" } deg por { "10" } s e então empuxo ao longo da velocidade. A execução integra as perdas por gravidade, arrasto, direcionamento e contrapressão e verifica que o dv ideal menos as perdas é igual à velocidade de fim de queima. MODELLED: Terra planar e não rotativa, C_D constante, sem fase balística, sem guiagem além do chute. (comentário do arquivo de cenário, linhas { "1" } a { "5" })

# text
seg-4c237f051651 = As perdas por gravidade, arrasto, direcionamento e contrapressão na subida de lançamento são MODELLED, não validadas: verificadas contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8e62cc4af6ea = Página do tópico: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-73148557c9a6 = <s1>Anterior</s1>araim-reference-check

# text
seg-3af9699f27a7 = <s1>Próxima</s1>attitude-budget
