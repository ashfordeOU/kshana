# docs--kind-lunar-time-budget: translations (pt-BR)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Página do tema: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-time-budget.md
seg-11f512367036 = Fonte: <c1/>

# text
# c1: lunar-time-budget
seg-f7cd4fcfc62d = <c1/> (tipo de cenário)

# text
seg-cac3a0bcbfc6 = Orçamento de erro de tempo de ponta a ponta do Tempo Lunar Coordenado (LTC), MODELLED: os sete termos de erro do LTC montados como curvas de erro de tempo x_i(τ) sobre toda uma grade de tempos de média, somados em raiz em x_Σ(τ), e o τ de CRUZAMENTO relógio-referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele é limitado pelo relógio) — a resposta honesta ao artefato de um único τ. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, pisos τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas de relógio reproduzem as especificações publicadas de relógio de um dia (crate::clock_specs); as MAGNITUDES dos pisos do enlace de RF/óptico, da realização do referencial, do resíduo relativístico e das efemérides são alocações modeladas do orçamento (valores padrão documentados, substituíveis por quem chama), não medições. A contribuição é o τ de cruzamento reproduzível, não um número certificado por termo; não certificado para a manutenção operacional da hora.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Uma execução de <c1/> resume-se assim: lunar-time-budget | clock passive-h-maser | 7-term x_Σ(τ) over { "57" } τ-points ({ "1" }–{ "1e7" } s) | crossover τ { "8.689e4" } s (x { "1.001e-9" } s) | frame floor { "1.001e-9" } s | clock x({ "1" } d) { "0.995" } ns (MODELLED)

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-7cdc521303eb = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-time-budget.toml
seg-c050033b32c3 = O exemplo <c1/> define, entre outros:

# text
seg-eebd3e40d0b9 = Rótulo do resultado (o do motor): orçamento de erro de tempo do LTC de ponta a ponta, MODELLED. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, pisos τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas de relógio reproduzem as especificações publicadas de relógio de um dia; as MAGNITUDES dos pisos do enlace de RF/óptico, da realização do referencial, do resíduo relativístico e das efemérides

# attr:alt
seg-56fe184f2a12 = O gráfico que o motor escreve para scenarios/lunar-time-budget.toml, tipo de cenário lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Uma execução do lunar-time-budget emite uma linha de cruzamento relógio-referencial por classe de relógio contra um único termo de referencial compartilhado, de modo que o relógio é a única variável da comparação; cada linha traz o cruzamento obtido de duas maneiras -- por bisseção a partir do gen

# text
seg-fd52e493b6c2 = <b>MODELLED</b> O bloco opcional [time_lab] do cenário lunar-time-budget modela o relógio de uma estação de referência lunar (por padrão a classe miniRAFS, ou qualquer classe nomeada, ou uma ficha de dispositivo ajustada a pontos de estabilidade declarados) disciplinado ao Tempo Lunar Coordenado e Testes: <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Uma execução do lunar-time-budget emite uma linha de cruzamento relógio-referencial por classe de relógio contra um único termo de referencial compartilhado, de modo que o relógio é a única variável da comp. Referência independente (InternalConsistency): duas computações diferentes dentro da base de código para a mesma grandeza, e não uma só reformulada: a bisseção sobre a curva de lei de potência da IEEE-1139 nada sabe sobre o tipo de ruído, enquanto a forma fechada inverte algebricamente o tipo dominante, de modo que um tipo de ruído mal classificado ou um intervalo inicial ruim aparece como uma diferença relativa que não é minúscula. Os quatro valores também reproduzem a tabela publicada do artigo até metade do seu último dígito impresso -- mas essa tabela era a sua

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> O cenário lunar-time-budget publica as suas saídas em forma de arranjo como uma tabela em formato longo (índice da grade, tempo de média, termo) ao lado do relatório, de modo que os sete por. Referência independente (InternalConsistency): apenas autoconsistência: o total publicado é verificado contra a raiz da soma dos quadrados dos termos no mesmo arquivo, e a curva emitida reproduz o p3_time_budget_curve.csv divulgado em todos os { "57" } pontos. As duas verificações compartilham as próprias definições de termos deste motor, de modo que nenhuma é independente. O termo do relógio se apoia em especificações publicadas de relógios, mas as MAGNITUDES dos pisos de enlace, de referencial, relativístico e de efemérides são documentadas

# text
# c1: label
seg-8abdeb1a36e1 = Orçamento de erro de tempo do LTC de ponta a ponta, MODELLED. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, pisos τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas de relógio reproduzem as especificações publicadas de relógio de um dia; as MAGNITUDES dos pisos do enlace de RF/óptico, da realização do referencial, do resíduo relativístico e das efemérides são alocações modeladas do orçamento (valores padrão documentados, substituíveis por quem chama), não medições. A contribuição (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = Orçamento de erro de tempo de ponta a ponta do Tempo Lunar Coordenado (LTC), MODELLED: os sete termos de erro do LTC montados como curvas de erro de tempo x_i(τ) sobre toda uma grade de tempos de média, somados em raiz em x_Σ(τ), e o τ de CRUZAMENTO relógio-referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele é limitado pelo relógio) — a resposta honesta ao artefato de um único τ (catálogo de tipos de cenário (<c1/>))

# text
seg-ca1763d4a416 = Honestidade: MODELLED. As inclinações em tau são de forma fechada e verificáveis analiticamente (relógio tau^{ "{" }+1/2{ "}" } ou tau^{ "{" }+{ "1" }{ "}" }, pisos tau^{ "0" }, medição tau^{ "{" }-1/2{ "}" }) e as linhas de relógio reproduzem as especificações publicadas de relógio de um dia; mas as MAGNITUDES dos pisos do enlace de RF/óptico, da realização do referencial, do resíduo relativístico e das efemérides são alocações modeladas do orçamento (valores padrão documentados, substituíveis por quem chama), não medições. A contribuição é (comentário do arquivo de cenário, linhas { "13" } a { "18" })

# text
seg-8f884949bdf1 = A tabela de cruzamento de tempo lunar por classe de relógio é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = A reprodutibilidade do orçamento de erro de tempo lunar é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Anterior</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Próximo</s1>lunar-time-offset
