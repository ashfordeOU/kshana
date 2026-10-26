# docs--kind-lunar-vlbi-fim: translations (pt-PT)

# text
seg-b054c73f22e5 = sem valor

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

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
seg-1bc37634ba9f = Covariância das coordenadas das estações VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CALENDÁRIO explícito (linhas de base x épocas) numa matriz de informação de Fisher, invertida e indicada como a covariância das coordenadas das estações e o sigma da estação por coordenada — um resultado calculado do motor, e não uma precisão escalar do atraso passada por um fator de equipartição isotrópico g = { "3" } assumido. O estado transporta coordenadas das estações FIXAS à Terra (ITRS), pelo que a jacobiana é a derivada parcial inercial rodada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de vista fixa à Terra e a declinação da baliza em vez de as assumir. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderado por 1/delay_sigma_s^{ "2" }. Indica posto, defeito de datum, número de condição, o espetro de informação completo, a matriz de covariância, os sigmas por estação, por eixo e 3-D, e o espaço nulo da rede livre em cada execução; sob uma deficiência de posto, o sigma principal é publicado como NULL com um estado, nunca lido a partir de uma inversa quase singular. O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO calendário é emitido a par do valor calculado, com a razão, juntamente com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — pelo que a razão é a anisotropia que o pressuposto descartou. O fecho do atraso tau_ik = tau_ij + tau_jk faz com que apenas n-1 das n(n-1)/2 linhas de base sejam geometricamente independentes; o relatório indica as duas contagens. MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, pelo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado de sessão previsto; o sigma do atraso, as coordenadas das estações e o calendário são entradas. A derivada parcial que a jacobiana do atraso geométrico deixa de fora (o termo de Shapiro diferenciado) é medida por diferença finita e emitida. Não é um produto geodésico.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Uma execução de <c1/> resume-se assim: lunar-vlbi-fim | { "3" } estações / { "3" } linhas de base x { "49" } épocas = { "16" } obs (máscara de { "10.0" } graus) | datum anchor-first-station | posto 6/6 cond { "2.209e4" } | sigma da estação { "0.0926" } m vs equipartição g={ "3" } { "0.0013" } m (razão { "71.360" })

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
seg-8b098bf1df6b = Etiqueta do resultado (a do motor): covariância MODELLED das coordenadas das estações VLBI lunar. A covariância é acumulada a partir das derivadas parciais analíticas do atraso do próprio motor ao longo de um calendário explícito de linhas de base e épocas, e invertida; NÃO é convertida a partir de uma precisão escalar do atraso por um fator de geometria assumido. O sigma do atraso por observação

# attr:alt
seg-19c383444296 = O gráfico que o motor escreve para scenarios/lunar-vlbi-fim.toml, tipo de cenário lunar-vlbi-fim

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Derivadas parciais do atraso acumuladas ao longo de um calendário de linhas de base × épocas numa matriz de informação de Fisher, invertida para a covariância das coordenadas das estações e o sigma da estação por coordenada, substituindo uma ligação de equipartição isotrópica assumida a partir de

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Uma terceira escolha de datum, <c1/>, que mantém todas as estações terrestres e estima apenas as coordenadas da BALIZA fixas à Lua — a configuração para a qual a incerteza de um ponto da superfície lunar é efetivamente indicada, uma vez que as coordenadas das estações terrestres

# text
seg-811a412b40b6 = <b>VALIDATED</b> A covariância da baliza com todas as estações fixas do cenário lunar-vlbi-fim (todas as estações terrestres mantidas, as coordenadas da baliza fixas à Lua estimadas isoladamente), com a baliza colocada na Lua do JPL DE440 lida pelo leitor de núcleos do próprio motor

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Derivadas parciais do atraso acumuladas ao longo de um calendário de linhas de base × épocas numa matriz de informação de Fisher, invertida para a covariância das coordenadas das estações e o sigma da estação por coord. Referência independente (ExternalDataset): Um percurso independente dentro do repositório. Cada linha da jacobiana é rededuzida por diferença finita central de lunar_vlbi::vlbi_delay_s avaliada a partir das coordenadas fixas à Terra e fixas à Lua do próprio estado, rodadas para a frente através da cadeia de referenciais — um percurso que não calcula nenhuma derivada e não partilha nenhuma expressão com as derivadas parciais analíticas — e as matrizes de informação que as duas vias constroem concordam até < { "1e-6" } da maior diagonal. A

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Uma terceira escolha de datum, <c1/>, que mantém todas as estações terrestres e estima apenas as coordenadas da BALIZA fixas à Lua — a configuração para a qual uma. Referência independente (ReferenceImpl): Identidades de forma fechada, sem se alegar nem existir nenhuma referência independente externa. O braço de alavanca é verificado face a ρ/B e as duas formas de equipartição entre si até { "1e-15" } — identidades algébricas, pelo que apanham um erro de ligação e mais nada, e são etiquetadas como tal. O resultado substantivo é MEASURED em vez de afirmado: um atraso de uma linha de base fixa restringe a DIREÇÃO da baliza, pelo que a componente da linha de vista rea

# text
# c1: label
seg-2cbf700a234e = Covariância MODELLED das coordenadas das estações VLBI lunar. A covariância é acumulada a partir das derivadas parciais analíticas do atraso do próprio motor ao longo de um calendário explícito de linhas de base e épocas, e invertida; NÃO é convertida a partir de uma precisão escalar do atraso por um fator de geometria assumido. O sigma do atraso por observação, as coordenadas das estações, o local da baliza e o calendário são entradas. As efemérides do centro da Lua, os relógios das estações (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Covariância das coordenadas das estações VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CALENDÁRIO explícito (linhas de base x épocas) numa matriz de informação de Fisher, invertida e indicada como a covariância das coordenadas das estações e o sigma da estação por coordenada — um resultado calculado do motor, e não uma precisão escalar do atraso passada por um fator de equipartição isotrópico g = { "3" } assumido. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = O estado transporta coordenadas das estações FIXAS à Terra (ITRS), pelo que a jacobiana é a derivada parcial inercial rodada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de vista fixa à Terra e a declinação da baliza em vez de as assumir. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO calendário é emitido a par do valor calculado, com a razão, juntamente com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — pelo que a razão é a anisotropia que o pressuposto descartou. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, pelo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado de sessão previsto; o sigma do atraso, as coordenadas das estações e o calendário são entradas. (catálogo de tipos de cenário (<c1/>))

# text
seg-4df6e3981cc4 = A cadeia publicada do D3 vai de uma precisão do atraso por observação a uma incerteza da coordenada da estação através de um fator de equipartição ISOTRÓPICO g = { "3" } assumido. Esse passo é aquele que o próprio resumo do artigo designa como modelado e não medido. Este cenário elimina-o: as derivadas parciais do atraso VLBI lunar são acumuladas ao longo de um calendário real de pares (linha de base x época) numa matriz de informação de Fisher, invertida e indicada como (comentário do ficheiro de cenário, linhas { "3" } a { "8" })

# text
seg-489b93ca0f7f = O estado transporta coordenadas FIXAS à Terra (ITRS), pelo que a jacobiana é a derivada parcial inercial rodada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de vista fixa à Terra e a declinação da baliza em vez de as assumir. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderado por 1/delay (comentário do ficheiro de cenário, linhas { "10" } a { "14" })

# text
seg-efb5719364af = O que ler no relatório * os sigmas por estação, por eixo e 3-D — a resposta calculada; * o valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO calendário, impresso a seu lado com a razão. Essa razão É a anisotropia que o pressuposto descartou, e o limite isotrópico do traço sqrt(p/trace(M)) torna a desigualdade AM-HM um piso rígido, pelo que o pressuposto só pode subestimar; * posto, defeito de datum, número de condição, o espetro com (comentário do ficheiro de cenário, linhas { "16" } a { "26" })

# text
seg-96c1a129aeae = <s1>Anterior</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Seguinte</s1>lunar-vlbi
