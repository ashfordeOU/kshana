# docs--kind-link-budget: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Razão jammer-sinal nativa lunar, C/N₀ efetivo e perda de sincronismo para um usuário na superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fonte pública da classe Moonlight/LCNS.

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Fonte: <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (tipo de cenário)

# text
seg-953188c11165 = Orçamento de enlace unidirecional sobre a equação de enlace CCSDS { "401" } / DSN 810-005: perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fechamento para um EIRP de transmissão, G/T de recepção, distância, taxa de dados e banda (s|x|ka) em relação a um Eb/N₀ exigido. Um cálculo de engenharia determinístico a partir das entradas fornecidas (não é uma folha de dados calibrada de terminal).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Uma execução de <c1/> resume-se assim: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margin { "92.1" } dB (closes)

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
seg-ebb923e1a3b5 = Rótulo do resultado (o do motor): Orçamento de enlace unidirecional sobre a equação de enlace CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); um cálculo de engenharia determinístico a partir das entradas fornecidas, NÃO uma folha de dados calibrada de terminal

# attr:alt
seg-bd375631bc7e = O gráfico que o motor escreve para scenarios/link-budget.toml, tipo de cenário link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fechamento sobre a equação de enlace CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda em relação a um Eb/N₀ exigido. Testes: <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fechamento sobre a equação de enlace CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda em relação a um Eb/N₀ exigido. Exec. Referência independente (ExternalDataset): tabela publicada de controle de projeto de telecomunicações de espaço profundo como vetores numéricos fixados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — o kshana remonta os itens de linha da tabela e reproduz o seu L_fs publicado de ponta a ponta de { "290.54" } dB e o Pr/N0 de { "54.6" } dB-Hz; a perda no espaço livre também é verificada contra ITU-R P.525

# text
seg-2598c2360113 = <b>MODELLED</b> O relatório do link-budget declara toda constante absoluta a partir da qual a sua própria margem foi calculada -- a frequência da portadora que a perda no espaço livre usou, o EIRP, o valor o. Referência independente (InternalConsistency): Nenhuma referência externa independente: isto é autodescrição sobre uma equação já validada contra uma tabela publicada de controle de projeto (ver a linha do orçamento de enlace unidirecional). Ela é registrada porque a sua ausência foi um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv divulgado exigiu resolver de trás para frente uma constante efetiva até { "0.0034" } dB a partir de todas as trinta linhas, e o motor agora tanto nomeia essa combinação quanto prova, por teste

# text
seg-c779823e860c = Opcional: a temperatura de ruído do sistema de recepção (K). Ela NÃO é uma entrada da equação de enlace -- esta precisa apenas da razão G/T -- mas declará-la permite que o relatório também forneça o ganho da antena de recepção que a figura de mérito implica (G = G/T + { "10" }*log10(T_sys)). Se omitida, a divisão do ganho fica ausente do relatório em vez de ser presumida. tsys_k = { "300.0" } (comentário do arquivo de cenário, linhas { "21" } a { "25" })

# text
seg-d717412c4f06 = A autodescrição do relatório de orçamento de enlace é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Anterior</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Próximo</s1>lunar-attack-surface

seg-410a790785e7 = <s1>Próximo</s1>lunar-ascent
