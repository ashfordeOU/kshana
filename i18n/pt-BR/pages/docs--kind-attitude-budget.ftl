# docs--kind-attitude-budget: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Fonte: <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (tipo de cenário)

# text
seg-62c0dda9fc56 = Orçamento de erro de atitude e apontamento em 3 graus de liberdade: o torque perturbador de gradiente de gravidade de pior caso ((3/2)(μ/R³)ΔI) e um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes nomeados de 1σ (ruído de sensor, jitter da roda de reação, térmico, alinhamento), com o termo dominante, para uma altitude orbital + dispersão de inércia do corpo. Orçamento escalar de AOCS MODELLED — um complemento pré-hardware ao Basilisk/42, não uma simulação de malha de controle / 6 graus de liberdade / modos flexíveis.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Uma execução de <c1/> resume-se assim: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> torque de GG { "7.04e-5" } N·m; apontamento { "10.7" }" RSS (dominante: reaction_wheel_jitter) (orçamento escalar MODELLED)

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-7cf112b1bcc3 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/attitude-budget.toml
seg-91ebbc89f9bb = O exemplo <c1/> define, entre outros:

# text
seg-c33e3cbba749 = arcsec

# text
seg-36df1bc710ab = alinhamento

# text
seg-d45f0ee66587 = kg*m^{ "2" }

# text
seg-3e3ce4fa89aa = N*m

# text
seg-0a78a7d6f93f = Rótulo do resultado (o do motor): MODELLED — orçamento escalar de erro de AOCS em 3 graus de liberdade: torque perturbador de gradiente de gravidade de pior caso + orçamento de apontamento por RSS; NÃO é uma simulação de malha de controle / 6 graus de liberdade / modos flexíveis (um complemento pré-hardware ao Basilisk/42, não uma substituição)

# attr:alt
seg-ad0e72e3b688 = O gráfico que o motor grava para scenarios/attitude-budget.toml, tipo de cenário attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Torque perturbador de gradiente de gravidade de pior caso ((3/2)(μ/R³)ΔI) como o pico sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento por RSS sobre contribuintes nomeados de 1σ com o termo dominante (uma soma em quadratura de números fornecidos pelo chamador Testes: <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Torque perturbador de gradiente de gravidade de pior caso ((3/2)(μ/R³)ΔI) como o pico sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento por RSS sobre contribuintes nomeados de 1σ . Referência independente (ExternalDataset): GravityGradientEffector do Basilisk { "2.9.1" } (AVSLab, ISC), uma implementação independente em C++ do torque de gradiente de gravidade de tensor completo: o pico (3/2)(μ/R³)ΔI do Kshana é igual ao torque do Basilisk na atitude de { "45" } deg dentro de { "1e-12" } relativo (pior { "2.1e-15" }) em { "5" } altitudes e { "8" } tensores de inércia, e limita o torque do Basilisk em { "2000" } atitudes aleatórias por caso; tolerância fixada antes da comparação. Afirmação validada: o gravity-

# text
seg-d2a6cf813e95 = <b>PARTNER</b> Não fornecido — o Kshana é um simulador de desempenho de navegação, não um fabricante de plataformas. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
# c1: label
seg-3895121a5466 = MODELLED — orçamento escalar de erro de AOCS em 3 graus de liberdade: torque perturbador de gradiente de gravidade de pior caso + orçamento de apontamento por RSS; NÃO é uma simulação de malha de controle / 6 graus de liberdade / modos flexíveis (um complemento pré-hardware ao Basilisk/42, não uma substituição) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = Orçamento escalar de AOCS MODELLED — um complemento pré-hardware ao Basilisk/42, não uma simulação de malha de controle / 6 graus de liberdade / modos flexíveis. (catálogo de tipos de cenário (<c1/>))

# text
seg-333fca11ac0c = ESCOPO HONESTO: orçamento de erro escalar MODELLED -- um complemento pré-hardware ao Basilisk/42, NÃO uma simulação de malha de controle / 6-DoF / modos flexíveis. O termo de gradiente de gravidade é informado como um torque (convertê-lo em apontamento exige uma rigidez de controle que pertence ao chamador); o orçamento é a soma em quadratura dos contribuintes de 1 sigma fornecidos. Execução: kshana scenarios/attitude-budget.toml (comentário do arquivo de cenário, linhas { "8" } a { "13" })

# text
seg-0e27fcef1499 = <s1>Anterior</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Próxima</s1>body-pnt

seg-a349aa76b0ed = PARTNER
