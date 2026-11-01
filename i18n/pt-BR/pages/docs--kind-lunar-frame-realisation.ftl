# docs--kind-lunar-frame-realisation: translations (pt-BR)

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajuste do datum de Helmert de 7 parâmetros + amarração de orientação ICRF a partir de uma rede de pontos. Referência independente (ExternalDataset): resolvedor independente de transformação de similaridade de Umeyama (Horn) ponderado em forma fechada (baseado em SVD de numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — um algoritmo diferente do ajuste iterativo de Gauss–Newton do kshana, que atinge o mesmo ótimo de mínimos quadrados ponderados univocamente definido em redes de pontos idênticas byte a byte

# text
# c1: docs/kinds/by-kind/lunar-frame-realisation.md
seg-0225ace73ba8 = Fonte: <c1/>

# text
# c1: lunar-frame-realisation
seg-a092c5795651 = <c1/> (tipo de cenário)

# text
seg-0c4c119abfca = Realização modelada do referencial lunar: um ajuste de datum de Helmert (de similaridade) de 7 parâmetros — { "3" } de translação, { "3" } de rotação de ângulo pequeno, { "1" } de escala — que amarra um conjunto estimado de coordenadas de pontos MCMF derivadas de coordenadas selenográficas a um datum por mínimos quadrados ponderados (crate::batch_ls::gauss_newton), mais uma amarração de orientação simples que exprime a pequena rotação realizada em torno dos eixos ICRF em relação à orientação do corpo WGCCRE da IAU { "2015" }. O cenário injeta uma pequena transformação conhecida (translação de ~dezenas de m, rotação de ~µrad, escala de ~{ "1e-7" }) em uma rede sintética de pontos bem distribuída, acrescenta ruído gaussiano com semente, recupera o datum e informa a transformação recuperada, o erro de recuperação por parâmetro contra a verdade injetada e o resíduo RMS pós-ajuste. Autoconsistência MODELLED — recupera uma transformação de similaridade injetada (sem ruído, até cerca da precisão de máquina), NÃO uma realização contra dados reais de rastreamento/VLBI; determinístico (com semente); sem TRL, herança nem endosso de agência.

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-32d5e2749e64 = Uma execução de <c1/> resume-se assim: lunar-frame-realisation | { "8" } points | translation err { "3.125e-1" } m, rotation err { "3.418e-7" } rad, scale err -5.891e2 ppb | rms residual { "0.887" } m | converged false

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-e732d2c2ab91 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-29f85024974b = O exemplo <c1/> define, entre outros:

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# attr:alt
seg-f3a6d69d0225 = O gráfico que o motor escreve para scenarios/lunar-frame-realisation.toml, tipo de cenário lunar-frame-realisation

# text
# c1: kshana kinds --json
seg-f99a78efa965 = Autoconsistência MODELLED — recupera uma transformação de similaridade injetada (sem ruído, até cerca da precisão de máquina), NÃO uma realização contra dados reais de rastreamento/VLBI; determinístico (com semente); sem TRL, herança nem endosso de agência. (catálogo de tipos de cenário (<c1/>))

# text
seg-238cea087ae0 = Honestidade: autoconsistência MODELLED. A referência independente é a recuperação de uma transformação de similaridade de 7 parâmetros injetada (sem ruído, até cerca da precisão de máquina) mais a identidade algébrica de ida e volta de apply_helmert. Isto NÃO é uma realização do referencial lunar contra dados reais de rastreamento / VLBI e não alega nenhuma precisão absoluta do referencial. Determinístico (com semente). Não se alega TRL, herança de voo nem endosso de agência. (comentário do arquivo de cenário, linhas { "23" } a { "27" })

# text
seg-07550d3d9610 = <s1>Anterior</s1>lunar-frame-campaign

# text
seg-5a3a7120aae2 = <s1>Próximo</s1>lunar-infrastructure
