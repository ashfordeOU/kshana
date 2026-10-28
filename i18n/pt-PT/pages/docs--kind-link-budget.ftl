# docs--kind-link-budget: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Razão jammer-sinal nativa lunar, C/N₀ efetivo e perda de sincronismo para um utilizador na superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fonte pública da classe Moonlight/LCNS.

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Fonte: <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (tipo de cenário)

# text
seg-953188c11165 = Orçamento de ligação unidirecional segundo a equação de ligação CCSDS { "401" } / DSN 810-005: perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fecho para uma EIRP de transmissão, G/T de receção, distância, taxa de dados e banda (s|x|ka) face a um Eb/N₀ exigido. Um cálculo de engenharia determinístico a partir das entradas fornecidas (não a ficha técnica de um terminal calibrado).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Uma execução de <c1/> resume-se assim: link-budget: banda x, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margem de { "92.1" } dB (fecha)

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-2305502051b6 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/link-budget.toml
seg-588476f4ae75 = O exemplo <c1/> define, entre outros:

# text
seg-ebb923e1a3b5 = Etiqueta do resultado (a do motor): Orçamento de ligação unidirecional segundo a equação de ligação CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); um cálculo de engenharia determinístico a partir das entradas fornecidas, NÃO a ficha técnica de um terminal calibrado

# attr:alt
seg-bd375631bc7e = O gráfico que o motor escreve para scenarios/link-budget.toml, tipo de cenário link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fecho segundo a equação de ligação CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda face a um Eb/N₀ exigido. Ensaios: <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fecho segundo a equação de ligação CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda face a um Eb/N₀ exigido. Runn. Referência independente (ExternalDataset): Tabela publicada de controlo de projeto de telecomunicações do espaço profundo, como vetores numéricos fixados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabela 1-1 (Galileo, banda X) — o kshana volta a montar as linhas da tabela e reproduz o seu L_fs de ponta a ponta publicado de { "290.54" } dB e o Pr/N0 de { "54.6" } dB-Hz; a perda no espaço livre é também verificada face à ITU-R P.525

# text
seg-2598c2360113 = <b>MODELLED</b> O relatório do link-budget indica todas as constantes absolutas a partir das quais a sua própria margem foi calculada -- a frequência da portadora que a perda no espaço livre utilizou, a EIRP, o valor o. Referência independente (InternalConsistency): Sem referência independente: trata-se de uma autodescrição sobre uma equação já validada face a uma tabela publicada de controlo de projeto (ver a linha do orçamento de ligação unidirecional). É registada porque a sua ausência foi um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv divulgado exigiu resolver retroativamente uma constante efetiva até { "0.0034" } dB a partir das trinta linhas, e o motor agora tanto designa essa combinação como prova, por teste

# text
seg-c779823e860c = Opcional: a temperatura de ruído do sistema de receção (K). NÃO é uma entrada da equação de ligação -- esta só precisa da razão G/T -- mas indicá-la permite que o relatório apresente também o ganho da antena de receção que a figura de mérito implica (G = G/T + { "10" }*log10(T_sys)). Se omitida, a repartição do ganho fica ausente do relatório, em vez de ser assumida. tsys_k = { "300.0" } (comentário do ficheiro de cenário, linhas { "21" } a { "25" })

# text
seg-d717412c4f06 = A autodescrição do relatório do orçamento de ligação é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Anterior</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Seguinte</s1>lunar-attack-surface

# text
seg-410a790785e7 = <s1>Seguinte</s1>lunar-ascent
