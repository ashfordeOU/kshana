# docs--kind-quantum-time-transfer: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-a3697ad561db = Hz

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidirecional/TWSTFT (Sagnac), visada comum de GNSS, PPP; jitter do enlace→distância. Referência independente (ExternalDataset): Magnitude de Sagnac conferida contra um VALOR PUBLICADO de autoridade — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pela geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O transponder/visada comum/ BIPM TWSTFT composto

# text
seg-a8beb8dfc757 = O orçamento de erros de transferência de tempo é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns por figura de mérito, quântico contra clássico, com benefício de polaridade correta, opcional { "95" }%. Referência independente (InternalConsistency): identidades de benefício/vencedor em forma fechada + envoltório fiel do quantum_trade::TradeResult existente; a honestidade está ligada ao registro de representatividade e aos rótulos de verificação

# text
seg-eb75c6a4dcec = A evidência de comparação quântico-versus-clássico (forma comum) é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Fonte: <c1/>

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (tipo de cenário)

# text
seg-540545e6f846 = Cadeia de temporização quântica confiável, MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede óptica + enlace de emaranhamento/fóton único) contra clássico (CSAC + RF de dois sentidos), um nível de proteção de temporização reaproveitado + uma figura de mérito de segurança contra ataque de atraso/repetição (1-P_md), uma probabilidade de detecção de anomalia de relógio + latência do CUSUM, e a comparação quântico-versus-clássico como TradeEvidence honesto, com um registro de representatividade + lacunas até o voo. Parâmetros ilustrativos de dispositivo/enlace de fonte pública; modela a classe, sem alegação de TRL, voo nem certificação.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Uma execução de <c1/> resume-se assim: quantum-time-transfer | quantum chain 1.233e-12s vs classical 5.292e-9s | PL { "555.24" } ns | security Pd { "1.000" } (Pfa { "1e-3" }) | anomaly Pd { "0.761" } | trade quantum wins 2/2 | MODELLED

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-80e94491c3df = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-time-transfer.toml
seg-6b03fa15a60d = O exemplo <c1/> define, entre outros:

# attr:alt
seg-09760f892c7b = O gráfico que o motor escreve para scenarios/quantum-time-transfer.toml, tipo de cenário quantum-time-transfer

# text
seg-873de4d05663 = <b>VALIDATED</b> Latência de detecção no pior caso do detector CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) e comprimento médio de execução fora de controle, usados pelo nível de proteção de temporização e pelos monitores de falsificação. Referência independente (ExternalDataset): ARL publicado do CUSUM tabular: aproximação de movimento browniano de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, eq. { "3.7" }) ancorada de forma cruzada nas tabelas de ARL de Montgomery, Introduction to Statistical Quality Control (Wiley), para k=½, h∈{ "{" }{ "4,5" }{ "}" }; a latência determinística coincide exatamente com uma referência de primeira passagem. O limite TPL composto continua MODELLED

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = Cadeia de temporização quântica confiável, MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede óptica + enlace de emaranhamento/fóton único) contra clássico (CSAC + RF de dois sentidos), um nível de proteção de temporização reaproveitado + uma figura de mérito de segurança contra ataque de atraso/repetição (1-P_md), uma probabilidade de detecção de anomalia de relógio + latência do CUSUM, e a comparação quântico-versus-clássico como TradeEvidence honesto, com um registro de representatividade + lacunas até o voo. (catálogo de tipos de cenário (<c1/>))

# text
seg-dee0faf63e7f = Temporização quântica confiável — cadeia de transferência de tempo de ponta a ponta, disseminação segura, detecção de anomalias e uma comparação quântico-versus-clássico. MODELLED; parâmetros ilustrativos de dispositivo/enlace, de fonte pública; modela a classe, sem alegação de TRL nem de voo. (comentário do arquivo de cenário, linhas { "1" } a { "3" })

# text
seg-6e9f5dfca6b0 = A temporização quântica confiável (transferência de tempo + disseminação segura + anomalia) é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Anterior</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Próximo</s1>quantum-trade
