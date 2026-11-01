# docs--kind-lunar-time-budget: translations (pt-PT)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-cac3a0bcbfc6 = Orçamento de erro de tempo MODELLED, de ponta a ponta, do Tempo Lunar Coordenado (LTC): os sete termos de erro do LTC reunidos como curvas de erro de tempo x_i(τ) ao longo de uma grelha completa de tempos de média, somados em soma quadrática em x_Σ(τ), e o CRUZAMENTO τ entre relógio e referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele limitado pelo relógio) — a resposta honesta ao artefacto de um único τ. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, patamares τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas do relógio reproduzem as especificações publicadas de relógio a um dia (crate::clock_specs); as MAGNITUDES dos patamares da ligação RF/ótica, da realização do referencial, do resíduo relativista e das efemérides são atribuições de orçamento modeladas (predefinições documentadas, substituíveis por quem chama), não medições. O contributo é o cruzamento τ reprodutível, não um valor certificado por termo; não certificado para manutenção da hora operacional.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Uma execução de <c1/> resume-se assim: lunar-time-budget | relógio passive-h-maser | x_Σ(τ) de 7 termos em { "57" } pontos τ ({ "1" }–{ "1e7" } s) | cruzamento τ { "8.689e4" } s (x { "1.001e-9" } s) | patamar do referencial { "1.001e-9" } s | relógio x({ "1" } d) { "0.995" } ns (MODELLED)

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
seg-eebd3e40d0b9 = Etiqueta do resultado (a do motor): orçamento de erro de tempo LTC MODELLED de ponta a ponta. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, patamares τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas do relógio reproduzem as especificações publicadas de relógio a um dia; as magnitudes dos patamares da ligação RF/ótica, da realização do referencial, do resíduo relativista e das efemérides flo

# attr:alt
seg-56fe184f2a12 = O gráfico que o motor escreve para scenarios/lunar-time-budget.toml, tipo de cenário lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Uma execução de lunar-time-budget emite uma linha de cruzamento entre relógio e referencial por classe de relógio, face a um único termo de referencial partilhado, pelo que o relógio é a única variável da comparação; cada linha traz o cruzamento obtido de duas maneiras -- por bisseção a partir do gen

# text
seg-fd52e493b6c2 = <b>MODELLED</b> O bloco opcional [time_lab] do cenário lunar-time-budget modela o relógio de uma estação de referência lunar (por predefinição a classe miniRAFS, ou qualquer classe designada, ou um cartão de dispositivo ajustado a pontos de estabilidade indicados) controlado para o Tempo Lunar Coordenado an Ensaios: <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Uma execução de lunar-time-budget emite uma linha de cruzamento entre relógio e referencial por classe de relógio, face a um único termo de referencial partilhado, pelo que o relógio é a única variável da comp. Referência independente (InternalConsistency): Dois cálculos diferentes dentro da base de código da mesma grandeza, e não um reformulado: a bisseção sobre a curva de lei de potência da IEEE-1139 nada sabe sobre o tipo de ruído, ao passo que a forma fechada inverte algebricamente o tipo dominante, pelo que um tipo de ruído mal classificado ou um intervalo mal escolhido surge como uma diferença relativa não desprezável. Os quatro valores reproduzem também a tabela publicada do artigo até metade do seu último dígito impresso -- mas essa tabela era a sua própria

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> O cenário lunar-time-budget publica as suas saídas em forma de matriz como uma tabela em formato longo (índice da grelha, tempo de média, termo) a par do relatório, de modo que os sete por. Referência independente (InternalConsistency): Apenas autoconsistência: o total publicado é verificado face à soma quadrática dos termos no mesmo ficheiro, e a curva emitida reproduz o p3_time_budget_curve.csv divulgado em todos os { "57" } pontos. Ambas as verificações partilham as definições de termos do próprio motor, pelo que nenhuma é independente. O termo do relógio assenta em especificações de relógio publicadas, mas as MAGNITUDES dos patamares da ligação, do referencial, relativista e das efemérides estão documentad

# text
# c1: label
seg-8abdeb1a36e1 = Orçamento de erro de tempo LTC MODELLED de ponta a ponta. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, patamares τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas do relógio reproduzem as especificações publicadas de relógio a um dia; as MAGNITUDES dos patamares da ligação RF/ótica, da realização do referencial, do resíduo relativista e das efemérides são atribuições de orçamento modeladas (predefinições documentadas, substituíveis por quem chama), não medições. O contributo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = Orçamento de erro de tempo MODELLED, de ponta a ponta, do Tempo Lunar Coordenado (LTC): os sete termos de erro do LTC reunidos como curvas de erro de tempo x_i(τ) ao longo de uma grelha completa de tempos de média, somados em soma quadrática em x_Σ(τ), e o CRUZAMENTO τ entre relógio e referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele limitado pelo relógio) — a resposta honesta ao artefac (catálogo de tipos de cenário (<c1/>))

# text
seg-ca1763d4a416 = Honestidade: MODELLED. As inclinações em tau são de forma fechada e verificáveis analiticamente (relógio tau^{ "{" }+1/2{ "}" } ou tau^{ "{" }+{ "1" }{ "}" }, patamares tau^{ "0" }, medição tau^{ "{" }-1/2{ "}" }) e as linhas do relógio reproduzem as especificações publicadas de relógio a um dia; mas as MAGNITUDES dos patamares da ligação RF/ótica, da realização do referencial, do resíduo relativista e das efemérides são atribuições de orçamento modeladas (predefinições documentadas, substituíveis por quem chama), não medições. O contributo é (comentário do ficheiro de cenário, linhas { "13" } a { "18" })

# text
seg-8f884949bdf1 = A tabela de cruzamento do tempo lunar por classe de relógio é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = A reprodutibilidade do orçamento de erro de tempo lunar é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Anterior</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Seguinte</s1>lunar-time-offset

# text
seg-b851d30fe736 = <s1>Anterior</s1>lunar-surface
