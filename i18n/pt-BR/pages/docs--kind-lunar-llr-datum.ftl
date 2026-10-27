# docs--kind-lunar-llr-datum: translations (pt-BR)

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o cronograma são as épocas de transmissão em solo de { "337" } pontos normais arquivados de medição laser lunar do ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7" } Testes: <a1>lunar_llr_real_data.rs</a1>.

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
seg-25455a33523c = Datum de referencial lunar de Helmert de sete parâmetros conduzido por uma campanha de observação REAL e ARQUIVADA, em vez de simulada. Enquanto o lunar-frame-campaign removeu a transformação injetada, mas ainda declarava a sua rede de estações, o seu cronograma e o seu sigma por observação como entradas ILLUSTRATIVE, este tipo de cenário toma os três a partir de medições: as épocas são os instantes de transmissão em solo de pontos normais arquivados do Consolidated Laser Ranging Data do ILRS, as observações são as distâncias laser realmente disparadas contra os cinco arranjos de retrorrefletores na Lua, e cada peso de observação é a precisão arquivada do próprio ponto normal, bin_rms/sqrt(n_raw), lida do arquivo. As coordenadas das estações vêm da solução SLR ITRF2020 do IERS (propagadas até a época pelas suas velocidades publicadas) e as coordenadas dos refletores da Tabela { "7" } do JPL DE430 no referencial de Terra média/rotação média que o modelo WGCCRE da IAU { "2015" } realiza. As derivadas parciais de distância se acumulam na matriz de informação de Fisher conjunta das coordenadas dos refletores e se propagam pelo mesmo projeto de Helmert até a covariância do datum, diagnosticada por crate::fim::crlb. Posto, defeito, condição, espectro, direções não observáveis na base de sete parâmetros, a direção mais fraca com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução, e um parâmetro sem restrição é publicado como NULL com um status. A correlação entre arranjos é MEASURED como exatamente zero, em vez de presumida, porque uma medição laser toca um único arranjo. Um registro que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. QUAIS ENLACES SÃO MEASURED E QUAIS SÃO MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo pela IAU continuam modeladas e o seu tamanho combinado é emitido como o resíduo de distância unidirecional observado menos calculado sobre todos os pontos usados; troposfera, marés do corpo sólido, excentricidade da estação, movimento polar, UT1-UTC, atraso relativístico e relógios das estações estão ausentes e dentro desse resíduo. Como um erro de efemérides chega a uma covariância apenas pela direção de cada linha de visada, toda execução também resolve de novo o datum inteiro com todas as derivadas parciais inclinadas por sensitivity_tilt_deg (com sinal alternado) e emite a razão, de modo que a insensibilidade da covariância às efemérides modeladas é um número, e não um argumento. Os próprios valores da campanha simulada são EXECUTADOS e impressos ao lado dos medidos, não transcritos. MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros em um cronograma real — não um datum resolvido, não uma análise LLR e não um produto geodésico. A fatia de dados reais registrada acompanha o repositório, mas não o crate publicado; aponte data_dir para uma cópia dela.

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Uma execução de <c1/> resume-se assim: lunar-llr-datum: { "337" } archived normal points ({ "349" } parsed) from { "2" } station(s) to { "5" } retroreflector arrays over { "80.9" } d; median measured normal-point precision { "5.13" } mm one-way; reflector information rank 15/15; Helmert rank 7/7 cond { "2.399e4" }; datum translation sigma { "1.851746e-2" } m; observed-minus-computed one-way residual RMS { "156493.9" } m (the modelled links, chiefly the analytic lunar ephemeris)

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
seg-b5c1e8681164 = Rótulo do resultado (o do motor): datum de referencial lunar a partir de uma campanha de observação REAL. O cronograma, a contagem de observações e cada peso de observação vêm de pontos normais arquivados de medição laser lunar do ILRS (medidos); as coordenadas das estações vêm do IERS ITRF2020 e as coordenadas dos retrorrefletores da Tabela { "7" } do JPL DE430 (publishe

# attr:alt
seg-e4da113cbe18 = O gráfico que o motor escreve para scenarios/lunar-llr-datum.toml, tipo de cenário lunar-llr-datum

# text
seg-764e54be97a0 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros do lunar-llr-datum a partir de pontos normais arquivados do ILRS e dos seus pesos medidos, no caminho do kernel: o centro geocêntrico da Lua é lido do JPL DE440 pelo leitor de kernel do próprio motor (planetary_ker Testes: <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o cronograma são as épocas de transmissão em solo de { "337" } arquiv. Referência independente (ExternalDataset): identidades de forma fechada, um caminho independente dentro do repositório e, desde { "0.36" }, uma referência independente de biblioteca SPICE e NumPy sobre dados medidos novos (abaixo); não existe nenhum par publicado de covariância de datum LLR lunar contra o qual verificar, de modo que nenhuma precisão é alegada. A única derivada nova — a derivada parcial da distância em relação à posição do refletor fixa no corpo — é rededuzida por diferença finita central do tempo de luz de ida e volta que ela diferenc

# text
# c1: label
seg-61ac3609406a = Datum de referencial lunar a partir de uma campanha de observação REAL. O cronograma, a contagem de observações e cada peso de observação vêm de pontos normais arquivados de medição laser lunar do ILRS (medidos); as coordenadas das estações vêm do IERS ITRF2020 e as coordenadas dos retrorrefletores da Tabela { "7" } do JPL DE430 (publicadas). As efemérides do centro da Lua, a orientação do corpo WGCCRE da IAU { "2015" } e a ausência de troposfera, marés, ecce (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-97610a2cca73 = A correlação entre arranjos é MEASURED como exatamente zero, em vez de presumida, porque uma medição laser toca um único arranjo. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = QUAIS ENLACES SÃO MEASURED E QUAIS SÃO MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo pela IAU continuam modeladas e o seu tamanho combinado é emitido como o resíduo de distância unidirecional observado menos calculado sobre todos os pontos usados; troposfera, marés do corpo sólido, excentricidade da estação, movimento polar, UT1-UTC, atraso relativístico e relógios das estações estão ausentes e dentro desse resíduo. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros em um cronograma real — não um datum resolvido, não uma análise LLR e não um produto geodésico. (catálogo de tipos de cenário (<c1/>))

# text
seg-a19e2b1fcaf1 = as épocas são os instantes de transmissão em solo de pontos normais arquivados do Consolidated Laser Ranging Data do ILRS; * as observações são as distâncias laser realmente disparadas contra os cinco arranjos de retrorrefletores na Lua; * cada peso de observação é a precisão arquivada PRÓPRIA do ponto normal, bin_rms/sqrt(n_raw), lida do arquivo em vez de presumida. (comentário do arquivo de cenário, linhas { "7" } a { "12" })

# text
seg-5ed6b83c01da = QUAIS ENLACES SÃO MEASURED E QUAIS SÃO MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ. As efemérides do centro da Lua e a orientação do corpo pela IAU continuam modeladas, e o seu tamanho combinado é emitido como o resíduo de distância unidirecional observado menos calculado sobre todos os pontos usados; troposfera, marés do corpo sólido, excentricidade da estação, movimento polar, UT1-UTC, atraso relativístico e relógios das estações estão ausentes e ficam dentro desse resíduo. Porque (comentário do arquivo de cenário, linhas { "18" } a { "26" })

# text
seg-7e7ff3ce4971 = A correlação entre arranjos é MEASURED como exatamente zero, em vez de presumida, porque uma medição laser toca um único arranjo. Um registro que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. Os próprios valores da campanha simulada são EXECUTADOS e impressos ao lado dos medidos. (comentário do arquivo de cenário, linhas { "28" } a { "31" })

# text
seg-8bfe258bedf5 = MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros em um cronograma real. Não é um datum resolvido, nem uma análise LLR, nem um produto geodésico. (comentário do arquivo de cenário, linhas { "33" } a { "34" })

# text
seg-598a7d6ba1e7 = <s1>Anterior</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Próximo</s1>lunar-station-coverage
