# docs--kind-lunar-frame-campaign: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
# c1: docs/kinds/by-kind/lunar-frame-campaign.md
seg-dd57b833cb20 = Fonte: <c1/>

# text
# c1: lunar-frame-campaign
seg-120769aba2cc = <c1/> (tipo de cenário)

# text
seg-55679aff66db = Datum de referencial de Helmert (de similaridade) de sete parâmetros conduzido por uma CAMPANHA DE OBSERVAÇÃO SIMULADA, e não por uma transformação injetada. Uma rede de estações terrestres observa um catálogo de balizas na superfície lunar segundo um cronograma explícito; as derivadas parciais do atraso VLBI lunar são acumuladas ao longo desse cronograma em uma matriz de informação de Fisher das coordenadas das balizas, exatamente como faz o lunar-vlbi-fim; e essa informação é propagada pelo projeto de Helmert A = [I3 | [p]_x | p] nos pontos do catálogo até a covariância do datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NENHUMA transformação é injetada e nada é recuperado de uma resposta plantada, de modo que a precisão do datum informada deriva do programa de observação: reduzir o sigma do atraso à metade a reduz exatamente à metade, e alongar o arco a melhora porque a libração que o relatório MEDE (sub_earth_direction_sweep_deg) é o que separa a coordenada da baliza na linha de visada das do plano do céu. Posto, defeito de datum, número de condição, o espectro completo, as direções não observáveis NA BASE DE SETE PARÂMETROS, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução; um parâmetro que a campanha não restringe é publicado como NULL com um status, nunca lido de uma inversa quase singular. A correlação de erro entre balizas é medida, não presumida: com as estações mantidas fixas nenhuma observação toca duas balizas, de modo que a matriz de informação é exatamente diagonal em blocos (offblock_fraction { "0" }), e com as estações estimadas o bloco marginalizado por Schur é acoplado, com a correlação induzida impressa e toda a propagação refeita com ela descartada, de modo que o preço de uma hipótese de independência é um número. A mesma propagação sob um sigma isotrópico por coordenada, e o erro de recuperação que o cenário lunar-frame-realisation informa, são ambos executados aqui e impressos ao lado do valor da campanha com as suas razões. MODELLED: o catálogo de balizas tem fonte, mas a CAMPANHA é simulada — a rede de estações e o sigma do atraso são entradas ilustrativas, as observações individuais de atraso são tratadas como independentes, e as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, de modo que a covariância do datum é um limite de Cramer-Rao para um conjunto reduzido de parâmetros. Não é um produto geodésico.

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-2e02c1ff8f48 = Uma execução de <c1/> resume-se assim: lunar-frame-campaign | { "4" } beacons x { "3" } baselines x { "49" } epochs = { "64" } obs (delay sigma { "1.000e-11" } s) | station datum fixed | Helmert rank 7/7 cond { "3.798e5" } | datum translation sigma { "6.397500" } m vs injected-transform recovery error { "0.3125" } m (ratio { "0.049" })

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-9c5feacf15ce = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-1d70a5b4a197 = O exemplo <c1/> define, entre outros:

# text
seg-df90e5910fb4 = h

# text
seg-d9523213de9f = Rótulo do resultado (o do motor): datum de referencial lunar MODELLED conduzido por campanha. A covariância de Helmert de sete parâmetros é propagada a partir de uma matriz de informação das coordenadas das balizas, acumulada a partir das derivadas parciais do atraso VLBI lunar do próprio motor sobre um cronograma explícito de balizas, linhas de base e épocas; NENHUMA transformação de similaridade é injetada e

# attr:alt
seg-883d94b321b4 = O gráfico que o motor escreve para scenarios/lunar-frame-campaign.toml, tipo de cenário lunar-frame-campaign

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: as linhas da <a1>matriz de verificação</a1> que citam este tipo de cenário.

# text
seg-2595bd629ffb = <b>MODELLED</b> O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada.

# text
seg-fd34d760edb1 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o cronograma são as épocas de transmissão em solo de { "337" } pontos normais arquivados de medição laser lunar do ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7" } Testes: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-055864084843 = <b>MODELLED</b> As entradas opcionais extra_reflectors e extra_beacons no cenário lunar-llr-datum acrescentam um bloco station_geodesy: a informação de Helmert de cinco arranjos a partir do trecho arquivado de medição laser lunar mais a informação que um retrorrefletor acrescentado (ran Testes: <a1>lunar_station_geodesy.rs</a1>.

# text
seg-23bd763c32d8 = <b>VALIDATED</b> A covariância do datum de Helmert de sete parâmetros do cenário lunar-frame-campaign com as estações terrestres estimadas (estação { "1" } ancorada), tal como lunar_frame_campaign a calcula em binary64: a informação de Fisher conjunta de estações e balizas acum Testes: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajuste do datum de Helmert de 7 parâmetros + amarração de orientação ICRF a partir de uma rede de pontos. Referência independente (ExternalDataset): resolvedor independente de transformação de similaridade de Umeyama (Horn) ponderado em forma fechada (baseado em SVD de numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — um algoritmo diferente do ajuste iterativo de Gauss–Newton do kshana, que atinge o mesmo ótimo de mínimos quadrados ponderados univocamente definido em redes de pontos idênticas byte a byte

# text
seg-d024abcfd87c = <b>MODELLED</b> O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada. Estações terrestres observam uma font. Referência independente (ReferenceImpl): identidades de forma fechada e um caminho independente dentro do repositório, sem nenhuma referência externa independente alegada. O projeto de Helmert — a única derivada nova do módulo — é rededuzido por diferença finita central de lunar_frame_realise::apply_helmert, um caminho que não compartilha nenhuma expressão com a forma analítica. A acumulação que ele compõe é a do lunar-vlbi-fim, cujo jacobiano é diferenciado por diferenças finitas contra lunar_vlbi::vlbi_delay_s ali, e que

# text
# c1: label
seg-0abd7b181f21 = Datum de referencial lunar MODELLED conduzido por campanha. A covariância de Helmert de sete parâmetros é propagada a partir de uma matriz de informação das coordenadas das balizas, acumulada a partir das derivadas parciais do atraso VLBI lunar do próprio motor sobre um cronograma explícito de balizas, linhas de base e épocas; NENHUMA transformação de similaridade é injetada e nada é recuperado de uma resposta plantada. O catálogo de balizas é a tabela de locais nomeados com fonte do crate, mas a CAMPA (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f92d22c06cd5 = A correlação de erro entre balizas é medida, não presumida: com as estações mantidas fixas nenhuma observação toca duas balizas, de modo que a matriz de informação é exatamente diagonal em blocos (offblock_fraction { "0" }), e com as estações estimadas o bloco marginalizado por Schur é acoplado, com a correlação induzida impressa e toda a propagação refeita com ela descartada, de modo que o preço de uma hipótese de independência é um número. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-534cea416496 = MODELLED: o catálogo de balizas tem fonte, mas a CAMPANHA é simulada — a rede de estações e o sigma do atraso são entradas ilustrativas, as observações individuais de atraso são tratadas como independentes, e as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, de modo que a covariância do datum é um limite de Cramer-Rao para um conjunto reduzido de parâmetros. (catálogo de tipos de cenário (<c1/>))

# text
seg-ec67b9d3adbb = A correlação de erro entre balizas é MEASURED, não presumida. Com as estações mantidas fixas nenhuma observação toca duas balizas, de modo que a matriz de informação é exatamente diagonal em blocos (offblock_fraction { "0" }); com as estações estimadas o bloco marginalizado por Schur é acoplado, a correlação induzida é impressa e toda a propagação é refeita com ela descartada, de modo que o preço de uma hipótese de independência é um número em vez de uma c (comentário do arquivo de cenário, linhas { "17" } a { "21" })

# text
seg-a2bb557da7ba = MODELLED: o catálogo de balizas tem fonte, mas a CAMPANHA é simulada — a rede de estações e o sigma do atraso são entradas ilustrativas, as observações individuais de atraso são tratadas como independentes, e as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS. Não é um produto geodésico. (comentário do arquivo de cenário, linhas { "27" } a { "30" })

# text
seg-57a371bca2c7 = O datum de referencial lunar a partir de uma campanha de observação é MODELLED, não validado: verificado contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-7b56c979b2c9 = <s1>Anterior</s1>lunar-differential-pnt

# text
seg-70072dbfa305 = <s1>Próximo</s1>lunar-frame-realisation
