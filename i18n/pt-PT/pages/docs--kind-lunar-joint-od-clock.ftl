# docs--kind-lunar-joint-od-clock: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-200e58e189c2 = Estimador em lote multitécnica modelado de OD lunar + relógio, numa rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos VLBI geodésicos de linha de base terrestre, distâncias locais lunares estação↔satélite e distâncias entre satélites para recuperar, em conjunto, a posição 3-D de uma estação à superfície lunar, as posições de uma pequena constelação e o desvio de relógio de cada ativo a partir de uma verdade injetada. O resultado principal, apresentado com honestidade — o VLBI torna observável a posição 3-D completa da estação, onde a medição de distâncias apenas local lunar deixa uma direção fracamente observada — é indicado como o contraste do erro da estação com versus sem VLBI. Recuperação simulada em malha fechada MODELLED (a verdade partilha o modelo de observação), determinística (semente fixa), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança de voo nem aval de agências.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Uma execução de <c1/> resume-se assim: lunar-joint-od-clock | { "3" } sats, { "6" } estações terrestres | erro 3-D da estação com VLBI de { "3.54" } m vs só distâncias de { "2184.02" } m ({ "617.5" }× mais preciso) | RMS da posição dos sats { "2.20" } m | erro do relógio da estação { "2.87e-10" } s | obs 40/16 parâmetros

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
seg-4c6914c162d1 = <b>VALIDATED</b> Fusão em lote de VLBI + distância local lunar + distância entre satélites para recuperar posições e relógios da estação e da constelação. Referência independente (ExternalDataset): P2: o numpy { "2.4.6" } (numpy.linalg.lstsq com LAPACK gelsd, numpy.linalg.inv; BSD-3) recalcula cada passo de Gauss-Newton, a solução convergida de mínimos quadrados ponderados, os sigmas formais e o erro da estação sobre as jacobianas e observações registadas de seis redes simuladas, pré-registado (5094bc31) a max({ "1e-8" }, { "100" } kappa eps) em termos relativos. A primeira execução falhou na rede sem VLBI ({ "6.1e-7" } face a { "1e-8" }, uma equação normal in

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Informação de Fisher M=HᵀWH, limite inferior de Cramér–Rao, posto de observabilidade / espaço nulo do defeito de datum (pseudoinversa de Moore–Penrose) e experiência ótima D/A/E/T-. Referência independente (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, com base em LAPACK) — uma autoridade independente de terceiros que calcula os mesmos valores próprios univocamente definidos, a covariância de Cramér–Rao σ²(XᵀX)⁻¹ e os fatores de diluição da precisão GNSS por um algoritmo diferente (divisão e conquista do LAPACK + LU) do varrimento cíclico de Jacobi e da pseudoinversa espetral do Kshana; concordância até { "1e-9" }. A mesma classe de biblioteca externa já valida o D

# text
seg-af12da412a10 = <b>MODELLED</b> Observabilidade por informação de Fisher da solução lunar conjunta: sem linhas de base terrestres, o datum de referencial absoluto situa-se no espaço nulo de HᵀWH (posição da estação não observ. Referência independente (InternalConsistency): Estrutura analítica do defeito de datum — o modo de referencial absoluto inobservável situa-se no espaço nulo da informação de Fisher (forma fechada), o limiar de posto coincide com a justificação publicada do projeto de 3 estações, e o estimador atinge o CRLB resultante em Monte Carlo. A geometria lunar propriamente dita é uma rede representativa (não efemérides de voo), pelo que a linha continua a ser MODELLED; o motor FIM/CRLB subjacente é verificado face a

# text
# c1: kshana kinds --json
seg-865ba2668582 = Recuperação simulada em malha fechada MODELLED (a verdade partilha o modelo de observação), determinística (semente fixa), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança de voo nem aval de agências. (catálogo de tipos de cenário (<c1/>))

# text
seg-a0d4350a1c66 = Honestidade: recuperação simulada em malha fechada MODELLED. Uma verdade injetada é convertida em observáveis sintéticos através do MESMO modelo de geometria que o resolvedor inverte, acrescenta-se ruído gaussiano de semente fixa, e o estimador recupera a verdade injetada dentro do ruído. A referência independente é a consistência interna (recuperação da verdade + realismo da covariância NEES), NÃO validação com dados reais. Não há propagação de modelo de forças dentro do resolvedor — o sate (comentário do ficheiro de cenário, linhas { "24" } a { "29" })

# text
seg-1465694e7e4f = A observabilidade absoluta de estações lunares (defeito de datum) é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Anterior</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Seguinte</s1>lunar-llr-datum
