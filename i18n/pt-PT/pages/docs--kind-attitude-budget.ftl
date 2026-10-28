# docs--kind-attitude-budget: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Fonte: <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (tipo de cenário)

# text
seg-62c0dda9fc56 = Orçamento de erro de atitude e de apontamento a 3-DOF: o binário perturbador de gradiente de gravidade no pior caso ((3/2)(μ/R³)ΔI) e um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes nomeados de 1σ (ruído de sensores, vibração das rodas de reação, térmico, alinhamento) com o termo dominante, para uma altitude orbital e uma dispersão de inércia do corpo. Orçamento escalar de AOCS MODELLED — um complemento pré-hardware do Basilisk/42, não uma simulação de ciclo de controlo/6-DoF/modos flexíveis.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Uma execução de <c1/> resume-se assim: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG torque { "7.04e-5" } N·m; pointing { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalar budget)

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
seg-0a78a7d6f93f = Etiqueta do resultado (a do motor): MODELLED — orçamento de erro de AOCS escalar a 3-DOF: binário perturbador de gradiente de gravidade no pior caso + orçamento de apontamento por raiz da soma dos quadrados; NÃO é uma simulação de ciclo de controlo / 6-DoF / modos flexíveis (um complemento pré-hardware do Basilisk/42, não um substituto)

# attr:alt
seg-ad0e72e3b688 = O gráfico que o motor escreve para scenarios/attitude-budget.toml, tipo attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Binário perturbador de gradiente de gravidade no pior caso ((3/2)(μ/R³)ΔI) como o máximo sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes nomeados de 1σ com o termo dominante (uma soma em quadratura de números fornecidos por quem chama Testes: <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Binário perturbador de gradiente de gravidade no pior caso ((3/2)(μ/R³)ΔI) como o máximo sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes nomeados de 1σ . Referência independente (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), uma implementação independente em C++ do binário de gradiente de gravidade de tensor completo: o máximo (3/2)(μ/R³)ΔI do Kshana é igual ao binário do Basilisk na atitude de { "45" } deg com { "1e-12" } relativo (pior { "2.1e-15" }) ao longo de { "5" } altitudes e { "8" } tensores de inércia, e delimita o binário do Basilisk ao longo de { "2000" } atitudes aleatórias por caso; tolerância fixada antes da comparação. Afirmação validada: o gradiente de gravidade-

# text
seg-d2a6cf813e95 = <b>PARTNER</b> Não fornecido — o Kshana é um simulador de desempenho de navegação, não uma casa de plataformas. Referência independente (NoneKind): nenhuma: uma disciplina da responsabilidade do parceiro, sem módulo e sem teste por conceção

# text
# c1: label
seg-3895121a5466 = MODELLED — orçamento de erro de AOCS escalar a 3-DOF: binário perturbador de gradiente de gravidade no pior caso + orçamento de apontamento por raiz da soma dos quadrados; NÃO é uma simulação de ciclo de controlo / 6-DoF / modos flexíveis (um complemento pré-hardware do Basilisk/42, não um substituto) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = Orçamento escalar de AOCS MODELLED — um complemento pré-hardware do Basilisk/42, não uma simulação de ciclo de controlo/6-DoF/modos flexíveis. (catálogo de tipos (<c1/>))

# text
seg-333fca11ac0c = ÂMBITO HONESTO: orçamento de erro escalar MODELLED -- um complemento pré-hardware ao Basilisk/42, NÃO uma simulação de malha de controlo / 6-DoF / modos flexíveis. O termo de gradiente de gravidade é indicado como um binário (convertê-lo em apontamento exige uma rigidez de controlo que fica a cargo de quem invoca); o orçamento é a soma em quadratura dos contribuintes de 1 sigma fornecidos. Execução: kshana scenarios/attitude-budget.toml (comentário do ficheiro de cenário, linhas { "8" } a { "13" })

# text
seg-0e27fcef1499 = <s1>Anterior</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Seguinte</s1>body-pnt

# text
seg-a349aa76b0ed = PARTNER
