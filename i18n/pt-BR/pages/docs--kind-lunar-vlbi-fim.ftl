# docs--kind-lunar-vlbi-fim: translations (pt-BR)

# text
seg-b054c73f22e5 = sem valor

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
seg-2595bd629ffb = <b>MODELLED</b> O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada.

# text
# c1: docs/kinds/by-kind/lunar-vlbi-fim.md
seg-7ecec8d27f50 = Fonte: <c1/>

# text
# c1: lunar-vlbi-fim
seg-d54e29b7bc80 = <c1/> (tipo de cenário)

# text
seg-1bc37634ba9f = Covariância das coordenadas das estações do VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CRONOGRAMA explícito (linhas de base x épocas) em uma matriz de informação de Fisher, invertida, e informada como a covariância das coordenadas das estações e o sigma de cada coordenada de cada estação — uma saída calculada do motor, em vez de uma precisão escalar de atraso empurrada por um fator de equipartição isotrópico presumido g = { "3" }. O estado traz coordenadas de estação FIXAS na Terra (ITRS), de modo que o jacobiano é a derivada parcial inercial girada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de visada fixa na Terra e a declinação da baliza em vez de presumi-las. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderada por 1/delay_sigma_s^{ "2" }. Informa posto, defeito de datum, número de condição, o espectro completo de informação, a matriz de covariância, os sigmas por estação, por eixo e 3-D, e o espaço nulo da rede livre em toda execução; sob uma deficiência de posto, o sigma principal é publicado como NULL com um status, nunca lido de uma inversa quase singular. O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO cronograma é emitido ao lado do valor calculado com a razão, junto com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — de modo que a razão é a anisotropia que a hipótese descartou. O fechamento de atraso tau_ik = tau_ij + tau_jk torna geometricamente independentes apenas n-1 das n(n-1)/2 linhas de base; o relatório declara as duas contagens. MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, de modo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado previsto de sessão; o sigma do atraso, as coordenadas das estações e o cronograma são entradas. A derivada parcial que o jacobiano do atraso geométrico deixa de fora (o termo de Shapiro diferenciado) é medida por diferença finita e emitida. Não é um produto geodésico.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Uma execução de <c1/> resume-se assim: lunar-vlbi-fim | { "3" } stations / { "3" } baselines x { "49" } epochs = { "16" } obs (mask { "10.0" } deg) | datum anchor-first-station | rank 6/6 cond { "2.209e4" } | station sigma { "0.0926" } m vs equipartition g={ "3" } { "0.0013" } m (ratio { "71.360" })

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-f0dabe1b061b = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-fabf305ae1de = O exemplo <c1/> define, entre outros:

# text
seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

# text
seg-8b098bf1df6b = Rótulo do resultado (o do motor): covariância MODELLED das coordenadas das estações do VLBI lunar. A covariância é acumulada a partir das derivadas parciais analíticas de atraso do próprio motor sobre um cronograma explícito de linhas de base e épocas, e invertida; ela NÃO é convertida de uma precisão escalar de atraso por um fator geométrico presumido. O sigma de atraso por observação

# attr:alt
seg-19c383444296 = O gráfico que o motor escreve para scenarios/lunar-vlbi-fim.toml, tipo de cenário lunar-vlbi-fim

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Derivadas parciais de atraso acumuladas ao longo de um cronograma de linhas de base × épocas em uma matriz de informação de Fisher, invertida até a covariância das coordenadas das estações e o sigma de cada coordenada de cada estação, substituindo um vínculo de equipartição isotrópico presumido a partir de a

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Uma terceira escolha de datum, <c1/>, que mantém fixas todas as estações terrestres e estima apenas as coordenadas fixas no corpo lunar da BALIZA — a configuração para a qual a incerteza de um ponto da superfície lunar é de fato citada, já que as coordenadas das estações terrestres

# text
seg-811a412b40b6 = <b>VALIDATED</b> A covariância da baliza com todas as estações fixas do cenário lunar-vlbi-fim (toda estação terrestre mantida, as coordenadas da baliza fixas no corpo lunar estimadas isoladamente) com a baliza colocada sobre a Lua do JPL DE440 lida pelo leitor de kernel do próprio motor

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Derivadas parciais de atraso acumuladas ao longo de um cronograma de linhas de base × épocas em uma matriz de informação de Fisher, invertida até a covariância das coordenadas das estações e o sigma por coo. Referência independente (ExternalDataset): um caminho independente dentro do repositório. Toda linha do jacobiano é rededuzida por diferença finita central de lunar_vlbi::vlbi_delay_s avaliada a partir das próprias coordenadas fixas na Terra e fixas no corpo lunar do estado, giradas para frente pela cadeia de referenciais — um caminho que não calcula nenhuma derivada e não compartilha nenhuma expressão com as derivadas parciais analíticas — e as matrizes de informação que as duas rotas constroem concordam a menos de { "1e-6" } da maior diagonal. A

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Uma terceira escolha de datum, <c1/>, que mantém fixas todas as estações terrestres e estima apenas as coordenadas fixas no corpo lunar da BALIZA — a configuração para a. Referência independente (ReferenceImpl): identidades de forma fechada, sem nenhuma referência externa independente alegada ou disponível. O braço de alavanca é verificado contra ρ/B e as duas formas de equipartição entre si até { "1e-15" } — identidades algébricas, de modo que detectam um erro de ligação e nada mais, e são rotuladas como tal. O resultado substantivo é MEASURED em vez de afirmado: um atraso de uma linha de base fixa restringe a DIREÇÃO da baliza, de modo que o componente da linha de visada rea

# text
# c1: label
seg-2cbf700a234e = Covariância MODELLED das coordenadas das estações do VLBI lunar. A covariância é acumulada a partir das derivadas parciais analíticas de atraso do próprio motor sobre um cronograma explícito de linhas de base e épocas, e invertida; ela NÃO é convertida de uma precisão escalar de atraso por um fator geométrico presumido. O sigma de atraso por observação, as coordenadas das estações, o local da baliza e o cronograma são entradas. As efemérides do centro da Lua, os relógios das estações (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Covariância das coordenadas das estações do VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CRONOGRAMA explícito (linhas de base x épocas) em uma matriz de informação de Fisher, invertida, e informada como a covariância das coordenadas das estações e o sigma de cada coordenada de cada estação — uma saída calculada do motor, em vez de uma precisão escalar de atraso empurrada por um fator de equipartição isotrópico presumido g = { "3" }. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = O estado traz coordenadas de estação FIXAS na Terra (ITRS), de modo que o jacobiano é a derivada parcial inercial girada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de visada fixa na Terra e a declinação da baliza em vez de presumi-las. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO cronograma é emitido ao lado do valor calculado com a razão, junto com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — de modo que a razão é a anisotropia que a hipótese descartou. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, de modo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado previsto de sessão; o sigma do atraso, as coordenadas das estações e o cronograma são entradas. (catálogo de tipos de cenário (<c1/>))

# text
seg-4df6e3981cc4 = A cadeia publicada do D3 vai de uma precisão de atraso por observação até uma incerteza de coordenada de estação por um fator de equipartição ISOTRÓPICO presumido g = { "3" }. Esse passo é o que o próprio resumo do artigo chama de modelado, e não medido. Este cenário o remove: as derivadas parciais do atraso do VLBI lunar são acumuladas ao longo de um cronograma real de pares (linha de base x época) em uma matriz de informação de Fisher, invertida, e informada com (comentário do arquivo de cenário, linhas { "3" } a { "8" })

# text
seg-489b93ca0f7f = O estado traz coordenadas FIXAS na Terra (ITRS), de modo que o jacobiano é a derivada parcial inercial girada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de visada fixa na Terra e a declinação da baliza em vez de presumi-las. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderada por 1/delay (comentário do arquivo de cenário, linhas { "10" } a { "14" })

# text
seg-efb5719364af = O que ler no relatório * sigmas por estação, por eixo e 3-D — a resposta calculada; * o valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO cronograma, impresso ao lado dele com a razão. Essa razão É a anisotropia que a hipótese descartou, e o limite isotrópico do traço sqrt(p/trace(M)) torna a desigualdade AM-HM um piso rígido, de modo que a hipótese só pode subestimar; * posto, defeito de datum, número de condição, o espectro com (comentário do arquivo de cenário, linhas { "16" } a { "26" })

# text
seg-96c1a129aeae = <s1>Anterior</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Próximo</s1>lunar-vlbi
