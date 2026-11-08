# docs--kind-lunar-joint-od-clock: translations (pt-BR)

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
# c1: docs/kinds/by-kind/lunar-joint-od-clock.md
seg-593938ee5995 = Fonte: <c1/>

# text
# c1: lunar-joint-od-clock
seg-d54a85227f43 = <c1/> (tipo de cenário)

# text
seg-200e58e189c2 = Estimador em lote conjunto, multitécnica, de OD lunar + relógio, modelado, em uma rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos VLBI geodésicos de linha de base terrestre, distâncias locais lunares estação↔satélite e distâncias entre satélites para recuperar, em conjunto, a posição 3-D de uma estação na superfície lunar, as posições de uma pequena constelação e o deslocamento de relógio de cada ativo a partir de uma verdade injetada. O resultado principal e honesto — o VLBI torna observável a posição 3-D completa da estação onde a medição de distância apenas local lunar deixa uma direção fracamente observada — é informado como o contraste de erro da estação com e sem VLBI. Recuperação simulada em malha fechada MODELLED (a verdade compartilha o modelo de observação), determinística (com semente), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança nem endosso de agência.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Uma execução de <c1/> resume-se assim: lunar-joint-od-clock | { "3" } sats, { "6" } Earth stations | station 3-D err with VLBI { "3.54" } m vs range-only { "2184.02" } m ({ "617.5" }× sharper) | sat pos RMS { "2.20" } m | station clk err { "2.87e-10" } s | obs 40/16 params

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-be3bcad756cc = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-ef164af52468 = O exemplo <c1/> define, entre outros:

# text
seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

# attr:alt
seg-cfa051b87e59 = O gráfico que o motor escreve para scenarios/lunar-joint-od-clock.toml, tipo de cenário lunar-joint-od-clock

# text
seg-4c6914c162d1 = <b>VALIDATED</b> Fusão em lote de VLBI + distância local lunar + distância entre satélites para recuperar posições e relógios da estação e da constelação. Referência independente (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq com LAPACK gelsd, numpy.linalg.inv; BSD-3) recalcula cada passo de Gauss-Newton, a solução convergida de mínimos quadrados ponderados, os sigmas formais e o erro da estação sobre os jacobianos e observações registrados de seis redes simuladas, com pré-registro (5094bc31) em max({ "1e-8" }, { "100" } kappa eps) relativo. A primeira execução reprovou a rede sem VLBI ({ "6.1e-7" } contra { "1e-8" }, uma equação normal in

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Informação de Fisher M=HᵀWH, limite inferior de Cramér–Rao, posto de observabilidade / espaço nulo do defeito de datum (pseudoinversa de Moore–Penrose) e projeto de experimento ótimo D/A/E/T. Referência independente (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, com base em LAPACK) — uma autoridade independente de terceiros que calcula os mesmos autovalores univocamente definidos, a covariância de Cramér–Rao σ²(XᵀX)⁻¹ e os fatores de diluição da precisão GNSS por um algoritmo diferente (dividir e conquistar do LAPACK + LU) do varrimento cíclico de Jacobi e da pseudoinversa espectral do Kshana; coincidência até { "1e-9" }. A mesma classe de biblioteca externa já valida o D

# text
seg-af12da412a10 = <b>MODELLED</b> Observabilidade por informação de Fisher da solução lunar conjunta: sem linhas de base terrestres, o datum de referencial absoluto está no espaço nulo de HᵀWH (posição da estação não observ. Referência independente (InternalConsistency): estrutura analítica do defeito de datum — o modo de referencial absoluto não observável está no espaço nulo da informação de Fisher (forma fechada), o limiar de posto coincide com a justificativa de projeto publicada de 3 estações, e o estimador atinge o CRLB resultante em Monte Carlo. A própria geometria lunar é uma rede representativa (não uma efeméride voada), de modo que a linha continua MODELLED; o motor FIM/CRLB subjacente é verificado contra

# text
# c1: kshana kinds --json
seg-865ba2668582 = Recuperação simulada em malha fechada MODELLED (a verdade compartilha o modelo de observação), determinística (com semente), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança nem endosso de agência. (catálogo de tipos de cenário (<c1/>))

# text
seg-a0d4350a1c66 = Honestidade: recuperação simulada em malha fechada MODELLED. Uma verdade injetada é mapeada para observáveis sintéticos pelo MESMO modelo de geometria que o resolvedor inverte, ruído gaussiano com semente é acrescentado, e o estimador recupera a verdade injetada dentro do ruído. A referência independente é a consistência interna (recuperação da verdade + realismo da covariância por NEES), NÃO a validação com dados reais. Não há propagação de modelo de forças dentro do resolvedor — o sate (comentário do arquivo de cenário, linhas { "24" } a { "29" })

# text
seg-1465694e7e4f = A observabilidade absoluta lunar da estação (defeito de datum) é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Anterior</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Próximo</s1>lunar-llr-datum
