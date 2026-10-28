# docs--kind-quantum-time-transfer: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-c37642bb24fe = <b>MODELLED</b> Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns quântico-vs-clássico por FoM com benefício de polaridade correta, opcional { "95" }%. Referência independente (InternalConsistency): identidades de forma fechada de benefício/vencedor + envolvimento fiel do quantum_trade::TradeResult existente; honestidade ligada ao registo de representatividade e às etiquetas de verificação

# text
seg-eb75c6a4dcec = A evidência de compromisso quântico-vs-clássico (forma comum) é MODELLED, não validada: verificada face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Fonte: <c1/>

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (tipo de cenário)

# text
seg-540545e6f846 = Cadeia de temporização quântica fidedigna MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede ótica + ligação por emaranhamento/fotão único) vs clássico (CSAC + RF bidirecional), um nível de proteção de temporização reutilizado + uma FoM de segurança contra ataques de atraso/repetição (1-P_md), uma probabilidade de deteção de anomalias do relógio + latência CUSUM, e o compromisso quântico-vs-clássico como TradeEvidence honesta com um registo de representatividade + lacunas até ao voo. Parâmetros ilustrativos de dispositivos/ligações de fontes públicas; modela a classe, sem alegação de TRL/voo/certificação.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Uma execução de <c1/> resume-se assim: quantum-time-transfer | cadeia quântica 1.233e-12s vs clássica 5.292e-9s | PL { "555.24" } ns | segurança Pd { "1.000" } (Pfa { "1e-3" }) | anomalia Pd { "0.761" } | no compromisso o quântico vence 2/2 | MODELLED

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
seg-09760f892c7b = O gráfico que o motor escreve para scenarios/quantum-time-transfer.toml, tipo quantum-time-transfer

# text
seg-873de4d05663 = <b>VALIDATED</b> Latência de deteção no pior caso do detetor CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) e comprimento médio de execução fora de controlo, usados pelo nível de proteção de temporização e pelos monitores de spoofing. Referência independente (ExternalDataset): ARL do CUSUM tabular publicado: aproximação de movimento browniano de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, eq. { "3.7" }) ancorada de forma cruzada nas tabelas ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) para k=½, h∈{ "{" }{ "4,5" }{ "}" }; latência determinística coincidente exatamente com uma referência de primeira passagem. O limite TPL composto continua MODELLED

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = Cadeia de temporização quântica fidedigna MODELLED: um orçamento de transferência de tempo de ponta a ponta quântico (relógio de rede ótica + ligação por emaranhamento/fotão único) vs clássico (CSAC + RF bidirecional), um nível de proteção de temporização reutilizado + uma FoM de segurança contra ataques de atraso/repetição (1-P_md), uma probabilidade de deteção de anomalias do relógio + latência CUSUM, e o compromisso quântico-vs-clássico como TradeEvidence honesta com um registo de representatividade + lacunas até ao voo. (catálogo de tipos (<c1/>))

# text
seg-dee0faf63e7f = Temporização quântica fidedigna — cadeia de transferência de tempo de ponta a ponta, disseminação segura, deteção de anomalias e um compromisso quântico-vs-clássico. MODELLED; parâmetros de dispositivos/ligações ilustrativos, de fontes públicas; modela a classe, sem alegação de TRL/voo. (comentário do ficheiro de cenário, linhas { "1" } a { "3" })

# text
seg-6e9f5dfca6b0 = A temporização quântica fidedigna (transferência de tempo + disseminação segura + anomalia) é MODELLED, não validada: verificada face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Anterior</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Seguinte</s1>quantum-trade

# text
seg-a349aa76b0ed = PARTNER
