# docs--kind-lunar-llr-datum: translations (pt-PT)

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o calendário são as épocas de transmissão a partir do solo de { "337" } pontos normais arquivados de telemetria laser lunar da ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7" } Ensaios: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
# c1: docs/kinds/by-kind/lunar-llr-datum.md
seg-8db575fc6d82 = Fonte: <c1/>

# text
# c1: lunar-llr-datum
seg-5329c6c75887 = <c1/> (tipo de cenário)

# text
seg-25455a33523c = Datum de referencial lunar de Helmert de sete parâmetros conduzido por uma campanha de observação REAL e ARQUIVADA, e não por uma simulada. Onde o lunar-frame-campaign removeu a transformação injetada mas continuou a indicar a sua rede de estações, o seu calendário e o seu sigma por observação como entradas ILLUSTRATIVE, este tipo de cenário retira os três da medição: as épocas são os instantes de transmissão a partir do solo de pontos normais arquivados dos Consolidated Laser Ranging Data da ILRS, as observações são as distâncias laser efetivamente disparadas contra as cinco matrizes de retrorrefletores na Lua, e cada peso de observação é a PRÓPRIA precisão arquivada desse ponto normal, bin_rms/sqrt(n_raw), lida do ficheiro. As coordenadas das estações provêm da solução SLR ITRF2020 do IERS (propagadas para a época pelas suas velocidades publicadas) e as coordenadas dos refletores da Tabela { "7" } do JPL DE430, no referencial de Terra média/rotação média que o modelo WGCCRE da IAU de { "2015" } realiza. As derivadas parciais das distâncias acumulam-se na matriz de informação de Fisher conjunta das coordenadas dos refletores e propagam-se através do mesmo projeto de Helmert para a covariância do datum, diagnosticada por crate::fim::crlb. Posto, defeito, condição, espetro, direções inobserváveis na base de sete parâmetros, a direção mais fraca com posto completo e a parcela de cada parâmetro nela são emitidos em cada execução, e um parâmetro não restringido é publicado como NULL com um estado. A correlação entre matrizes é MEASURED como exatamente zero, em vez de assumida, porque uma distância laser toca numa só matriz. Um registo que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. QUAIS AS LIGAÇÕES MEASURED E QUAIS AS MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo segundo a IAU continuam modeladas e a sua dimensão combinada é emitida como o resíduo da distância unidirecional observado menos calculado sobre todos os pontos utilizados; a troposfera, as marés do corpo sólido, a excentricidade da estação, o movimento polar, o UT1-UTC, o atraso relativista e os relógios das estações estão ausentes e incluídos nesse resíduo. Como um erro de efemérides só chega a uma covariância através da direção de cada linha de vista, cada execução volta também a resolver todo o datum com todas as derivadas parciais inclinadas de sensitivity_tilt_deg (com o sinal alternado) e emite a razão, pelo que a insensibilidade da covariância às efemérides modeladas é um número e não um argumento. Os valores da própria campanha simulada são EXECUTADOS e impressos a par dos medidos, não transcritos. MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros num calendário real — não um datum resolvido, não uma análise LLR e não um produto geodésico. A fatia de dados reais registada é distribuída com o repositório, mas não com a crate publicada; aponte data_dir para uma cópia da mesma.

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Uma execução de <c1/> resume-se assim: lunar-llr-datum: { "337" } pontos normais arquivados ({ "349" } analisados) de { "2" } estação(ões) para { "5" } matrizes de retrorrefletores ao longo de { "80.9" } d; precisão mediana medida do ponto normal de { "5.13" } mm unidirecional; posto da informação dos refletores 15/15; posto de Helmert 7/7 cond { "2.399e4" }; sigma de translação do datum { "1.851746e-2" } m; RMS do resíduo unidirecional observado menos calculado de { "156493.9" } m (as ligações modeladas, principalmente as efemérides lunares analíticas)

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-7eda56c1285a = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-c95b4d285cbd = O exemplo <c1/> define, entre outros:

# text
seg-37a77f49f048 = ps

# text
seg-b5c1e8681164 = Etiqueta do resultado (a do motor): Datum de referencial lunar a partir de uma campanha de observação REAL. O calendário, o número de observações e cada peso de observação provêm de pontos normais arquivados de telemetria laser lunar da ILRS (medidos); as coordenadas das estações provêm do ITRF2020 do IERS e as coordenadas dos retrorrefletores da Tabela { "7" } do JPL DE430 (publicad

# attr:alt
seg-e4da113cbe18 = O gráfico que o motor escreve para scenarios/lunar-llr-datum.toml, tipo de cenário lunar-llr-datum

# text
seg-764e54be97a0 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros do lunar-llr-datum a partir de pontos normais arquivados da ILRS e dos seus pesos medidos, no percurso do núcleo: o centro geocêntrico da Lua é lido do JPL DE440 pelo leitor de núcleos do próprio motor (planetary_ker Ensaios: <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o calendário são as épocas de transmissão a partir do solo de { "337" } arquiv. Referência independente (ExternalDataset): Identidades de forma fechada, um percurso independente dentro do repositório e, desde a { "0.36" }, uma referência independente SPICE e NumPy sobre dados medidos novos (abaixo); não existe nenhum par publicado de covariância de datum LLR lunar com que comparar, pelo que não se alega nenhuma exatidão. A única derivada nova — a derivada parcial da distância em relação à posição do refletor fixa ao corpo — é rededuzida por diferença finita central do tempo de luz de ida e volta que dife

# text
# c1: label
seg-61ac3609406a = Datum de referencial lunar a partir de uma campanha de observação REAL. O calendário, o número de observações e cada peso de observação provêm de pontos normais arquivados de telemetria laser lunar da ILRS (medidos); as coordenadas das estações provêm do ITRF2020 do IERS e as coordenadas dos retrorrefletores da Tabela { "7" } do JPL DE430 (publicadas). As efemérides do centro da Lua, a orientação do corpo segundo o WGCCRE da IAU de { "2015" } e a ausência de troposfera, marés, excentr (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-97610a2cca73 = A correlação entre matrizes é MEASURED como exatamente zero, em vez de assumida, porque uma distância laser toca numa só matriz. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = QUAIS AS LIGAÇÕES MEASURED E QUAIS AS MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo segundo a IAU continuam modeladas e a sua dimensão combinada é emitida como o resíduo da distância unidirecional observado menos calculado sobre todos os pontos utilizados; a troposfera, as marés do corpo sólido, a excentricidade da estação, o movimento polar, o UT1-UTC, o atraso relativista e os relógios das estações estão ausentes e incluídos nesse resíduo. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros num calendário real — não um datum resolvido, não uma análise LLR e não um produto geodésico. (catálogo de tipos de cenário (<c1/>))

# text
seg-a19e2b1fcaf1 = as épocas são os instantes de transmissão a partir do solo de pontos normais arquivados dos Consolidated Laser Ranging Data da ILRS; * as observações são as distâncias laser efetivamente disparadas contra as cinco matrizes de retrorrefletores na Lua; * cada peso de observação é a PRÓPRIA precisão arquivada desse ponto normal, bin_rms/sqrt(n_raw), lida do ficheiro em vez de assumida. (comentário do ficheiro de cenário, linhas { "7" } a { "12" })

# text
seg-5ed6b83c01da = QUAIS AS LIGAÇÕES MEASURED E QUAIS AS MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ. As efemérides do centro da Lua e a orientação do corpo segundo a IAU continuam modeladas, e a sua dimensão combinada é emitida como o resíduo da distância unidirecional observado menos calculado sobre todos os pontos utilizados; a troposfera, as marés do corpo sólido, a excentricidade da estação, o movimento polar, o UT1-UTC, o atraso relativista e os relógios das estações estão ausentes e incluídos nesse resíduo. Como (comentário do ficheiro de cenário, linhas { "18" } a { "26" })

# text
seg-7e7ff3ce4971 = A correlação entre matrizes é MEASURED como exatamente zero, em vez de assumida, porque uma distância laser toca numa só matriz. Um registo que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. Os valores da própria campanha simulada são EXECUTADOS e impressos a par dos medidos. (comentário do ficheiro de cenário, linhas { "28" } a { "31" })

# text
seg-8bfe258bedf5 = MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros num calendário real. Não é um datum resolvido, não é uma análise LLR, não é um produto geodésico. (comentário do ficheiro de cenário, linhas { "33" } a { "34" })

# text
seg-598a7d6ba1e7 = <s1>Anterior</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Seguinte</s1>lunar-station-coverage
