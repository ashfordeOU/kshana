# docs--kind-lunar-jamming: translations (pt-PT)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por conceção

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-cec5c06d38af = <b>MODELLED</b> Razão jammer-sinal nativa lunar, C/N₀ efetivo e perda de sincronismo para um utilizador na superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fonte pública da classe Moonlight/LCNS.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> O relatório <c1/> já não apoia o seu contorno de negação num único escalar.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Fonte: <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (tipo de cenário)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Jamming de RF nativo lunar: razão jammer-sinal por satélite, C/N₀ efetivo e perda de bloqueio para um utilizador à superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fontes públicas de órbita lunar da classe Moonlight/LCNS. Compõe a física aberta de jamming existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) com a geometria do céu lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); não se rededuz nenhuma geometria nem radiometria. Ao contrário do tipo de cenário <c1/> terrestre, a componente do sinal NÃO é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio orçamento de ligação EIRP − FSPL(distância oblíqua), pelo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Indica UMA LINHA POR LIGAÇÃO (época, satélite) VISÍVEL — azimute, elevação, distância oblíqua, as duas potências recebidas de que o J/S é a diferença, o J/S, o C/N₀ nominal e efetivo e o estado de bloqueio — mais figuras de mérito agregadas a par dessa tabela (nunca em seu lugar), e a mesma tabela como artefacto CSV. Cada campo numérico emitido traz uma unidade e uma classe de proveniência. Os subresultados VALIDATED trazem a referência independente do respetivo módulo de origem (a equação antiinterferência e a ligação J/S de Kaplan & Hegarty §{ "9.4" }, referenciadas externamente em tests/gnss_denied_jamming_resilience_reference.rs; a geometria lunar de lunar_service). A própria composição é verificada de forma cruzada face a um percurso independente de dois orçamentos de ligação (linkbudget::received_signal_power_dbw, uma expressão de perda no espaço livre diferente) até { "1e-9" } dB. MODELLED: a constelação ilustrativa, a EIRP / potência do jammer / ganhos de antena / temperatura de ruído representativos, e a ausência de sombreamento do terreno, multipercurso, dinâmica do AGC e anulação adaptativa. Não é um produto certificado de negação de serviço. Com um jammer configurado, o relatório traz também um CONTORNO DE NEGAÇÃO COM UMA BANDA DE INCERTEZA, em vez de um contorno lido a partir de um único escalar: a distribuição completa medida do C/N₀ do sinal pretendido sobre a tabela por satélite (n, mín., p05, p25, mediana, p75, p95, máx., média, desvio-padrão amostral e a própria assimetria da amostra), e o contorno avaliado em cada uma dessas estatísticas de ordem segundo AMBOS os critérios de negação que o motor reconhece — o incumbente de razão de potências (J/S = { "30" } dB, como em attack-surface e tracking-loop) e o de perda de bloqueio (C/N₀ efetivo a descer até tracking_threshold_dbhz, o critério que a própria coluna de estado deste relatório utiliza) — nos dois eixos do plano de negação (EIRP do jammer exigida à distância de afastamento do cenário, distância de afastamento de negação à EIRP do cenário). Os limites da banda SÃO contour(p05) e contour(p95), o mesmo mapa de forma fechada aplicado aos quantis da própria amostra: não um sigma ajustado à amostra e não mediana ± k·desvio-padrão, com o desvio-padrão emitido por continuidade e não utilizado por nada. Um quantil já igual ou inferior ao limiar de seguimento não tem J/S de negação finito e as suas colunas de perda de bloqueio são nulas, com um motivo contabilizado, nunca um raio truncado.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Uma execução de <c1/> resume-se assim: lunar-jamming | { "4" } sats, { "12" } épocas, { "38" } ligações a partir de (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (média { "35.622" }) | { "0" } LOST | disponibilidade de { "0.167" } de { "0.167" } nominal

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
seg-d4ae2f589112 = <b>MODELLED</b> Razão jammer-sinal nativa lunar, C/N₀ efetivo e perda de bloqueio para um utilizador à superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a ilustr. Referência independente (ReferenceImpl): Verificação cruzada da composição face a um percurso de código independente dentro do repositório: cada J/S por ligação é rededuzido como a diferença de dois orçamentos de ligação calculados com linkbudget::received_signal_power_dbw, cuja perda no espaço livre é a expressão única { "20" }·log10(4πRf/c) e não a soma de três termos que jamming::free_space_path_loss_db utiliza — as duas concordam até < { "1e-9" } dB em todas as linhas (pior caso medido de { "7.11e-14" } dB, isto é, arredondamento de vírgula flutuante)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> O relatório <c1/> deixa de apoiar o seu contorno de negação num único escalar. Emite a distribuição completa medida do C/N₀ do sinal pretendido sobre a tabela por satélite. Referência independente (InternalConsistency): Consistência interna face às funções diretas do próprio motor, que é tudo o que esta capacidade pode afirmar com honestidade. Cada ponto do contorno é uma inversão de forma fechada, e cada inversão é verificada fazendo passar a sua resposta de novo pela função DIRETA com que as linhas do próprio relatório foram avaliadas: a coluna do J/S através de jamming::effective_cn0_dbhz (que tem de devolver tracking_threshold_dbhz até < { "1e-9" } dB-Hz), a coluna da distância de afastamento

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED: a constelação ilustrativa, a EIRP / potência do jammer / ganhos de antena / temperatura de ruído representativos, e a ausência de sombreamento do terreno, multipercurso, dinâmica do AGC e anulação adaptativa. (catálogo de tipos de cenário (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. A constelação é a geometria ilustrativa, de fontes públicas, da classe Moonlight/LCNS (não as efemérides reais; sem afiliação nem aval implícitos), e o modelo de interferência é um orçamento de ligação: sem sombreamento do terreno ao jammer (um efeito de primeira ordem em terreno do polo sul), sem multipercurso, sem dinâmica perto/longe do AGC, sem anulação adaptativa, sem histerese aquisição-versus-seguimento. (comentário do ficheiro de cenário, linhas { "26" } a { "30" })

# text
seg-da57cc7f1aa4 = O jamming de RF da navegação à superfície lunar (J/S por satélite) é MODELLED, não validado: verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = O contorno de negação lunar com uma banda de incerteza a partir da dispersão medida do C/N₀ é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Página do tema: <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Anterior</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Seguinte</s1>lunar-joint-od-clock
