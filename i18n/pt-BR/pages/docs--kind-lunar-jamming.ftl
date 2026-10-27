# docs--kind-lunar-jamming: translations (pt-BR)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = broadband

# text
seg-cec5c06d38af = <b>MODELLED</b> Razão jammer-sinal nativa lunar, C/N₀ efetivo e perda de sincronismo para um usuário na superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fonte pública da classe Moonlight/LCNS.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> O relatório <c1/> não apoia mais o seu contorno de negação em um único escalar.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Fonte: <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (tipo de cenário)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Interferência de RF nativa lunar: razão interferidor-sinal por satélite, C/N₀ efetivo e perda de sincronismo para um usuário na superfície selenográfica sob um interferidor na superfície lunar (ou elevado), sobre a constelação em órbita lunar ilustrativa, de fonte pública, da classe Moonlight/LCNS. Compõe a física aberta de interferência existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) com a geometria do céu lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rededuzida. Diferentemente do tipo de cenário <c1/> da Terra, o trecho do sinal NÃO é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio orçamento de enlace EIRP − FSPL(distância oblíqua), de modo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Informa UMA LINHA POR ENLACE (época, satélite) VISÍVEL — azimute, elevação, distância oblíqua, as duas potências recebidas cuja diferença é o J/S, o J/S, o C/N₀ nominal e efetivo e o estado de sincronismo — mais valores agregados de mérito ao lado da (nunca no lugar da) tabela, e a mesma tabela como artefato CSV. Todo campo numérico emitido traz uma unidade e uma classe de proveniência. Os subresultados VALIDATED carregam a referência independente do seu módulo de origem (a equação antiinterferência e o enlace J/S de Kaplan & Hegarty §{ "9.4" }, referenciados externamente em tests/gnss_denied_jamming_resilience_reference.rs; a geometria lunar de lunar_service). A própria composição é verificada de forma cruzada contra um caminho independente de dois orçamentos de enlace (linkbudget::received_signal_power_dbw, uma expressão diferente de perda no espaço livre) até { "1e-9" } dB. MODELLED: a constelação ilustrativa, o EIRP / a potência do interferidor / os ganhos de antena / a temperatura de ruído representativos, e a ausência de sombreamento do terreno, de multipercurso, de dinâmica de AGC e de anulação adaptativa. Não é um produto certificado de negação de serviço. Com um interferidor configurado, o relatório traz também um CONTORNO DE NEGAÇÃO COM UMA FAIXA DE INCERTEZA, em vez de um contorno lido a partir de um único escalar: a distribuição completa medida do C/N₀ do sinal desejado sobre a tabela por satélite (n, mínimo, p05, p25, mediana, p75, p95, máximo, média, desvio-padrão amostral e a assimetria da própria amostra), e o contorno avaliado em cada uma dessas estatísticas de ordem sob AMBOS os critérios de negação que o motor reconhece — o vigente, de razão de potência (J/S = { "30" } dB, como em attack-surface e tracking-loop) e o de perda de sincronismo (C/N₀ efetivo caindo até tracking_threshold_dbhz, o critério que a própria coluna de estado deste relatório usa) — nos dois eixos do plano de negação (EIRP do interferidor exigido no afastamento do cenário, afastamento de negação no EIRP do cenário). Os extremos da faixa SÃO contour(p05) e contour(p95), o mesmo mapa de forma fechada aplicado aos próprios quantis da amostra: não um sigma ajustado à amostra e não a mediana ± k·desvio-padrão, com o desvio-padrão emitido por continuidade e usado por nada. Um quantil já igual ou abaixo do limiar de rastreamento não tem J/S finito de negação e as suas colunas de perda de sincronismo são nulas com um motivo contado, nunca um raio truncado.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Uma execução de <c1/> resume-se assim: lunar-jamming | { "4" } sats, { "12" } epochs, { "38" } links from (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (mean { "35.622" }) | { "0" } LOST | availability { "0.167" } of { "0.167" } nominal

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-6e01b6354e40 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/lunar-jamming.toml
seg-c61fb6515ed9 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-6fe8b3c6c584 = O gráfico que o motor escreve para scenarios/lunar-jamming.toml, tipo de cenário lunar-jamming

# text
seg-d4ae2f589112 = <b>MODELLED</b> Razão interferidor-sinal nativa lunar, C/N₀ efetivo e perda de sincronismo para um usuário na superfície selenográfica sob um interferidor na superfície lunar (ou elevado), sobre a ilustr. Referência independente (ReferenceImpl): verificação cruzada da composição contra um caminho de código independente dentro do repositório: todo J/S por enlace é rededuzido como a diferença de dois orçamentos de enlace calculados com linkbudget::received_signal_power_dbw, cuja perda no espaço livre é a expressão única { "20" }·log10(4πRf/c) em vez da soma de três termos que jamming::free_space_path_loss_db usa — as duas concordam a menos de { "1e-9" } dB em todas as linhas (pior caso medido { "7.11e-14" } dB, isto é, arredondamento de ponto flutuante)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> O relatório <c1/> deixa de apoiar o seu contorno de negação em um único escalar. Ele emite a distribuição completa medida do C/N₀ do sinal desejado sobre a tabela por satélite. Referência independente (InternalConsistency): consistência interna contra as próprias funções diretas do motor, que é tudo o que esta capacidade pode alegar com honestidade. Todo ponto do contorno é uma inversão de forma fechada, e cada inversão é verificada devolvendo a sua resposta pela função DIRETA com a qual as linhas do próprio relatório foram pontuadas: a coluna de J/S por jamming::effective_cn0_dbhz (que deve devolver tracking_threshold_dbhz a menos de { "1e-9" } dB-Hz), a coluna de afastamento

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED: a constelação ilustrativa, o EIRP / a potência do interferidor / os ganhos de antena / a temperatura de ruído representativos, e a ausência de sombreamento do terreno, de multipercurso, de dinâmica de AGC e de anulação adaptativa. (catálogo de tipos de cenário (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. A constelação é a geometria ilustrativa, de fonte pública, da classe Moonlight/LCNS (não as efemérides reais; sem afiliação nem endosso implícitos), e o modelo de interferência é um orçamento de enlace: sem sombreamento do terreno sobre o interferidor (um efeito de primeira ordem em terreno do polo sul), sem multipercurso, sem dinâmica próximo/distante de AGC, sem anulação adaptativa, sem histerese entre aquisição e rastreamento. (comentário do arquivo de cenário, linhas { "26" } a { "30" })

# text
seg-da57cc7f1aa4 = A interferência de RF na navegação de superfície lunar (J/S por satélite) é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = O contorno lunar de negação com uma faixa de incerteza a partir da dispersão medida do C/N₀ é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Página do tema: <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Anterior</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Próximo</s1>lunar-joint-od-clock
