# docs--kind-quantum-gnss-free-nav: translations (pt-BR)

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Uma faixa, não uma paridade. { "0.30" } rodada { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página do tópico: <a1>QUANTUM.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns por figura de mérito, quântico contra clássico, com benefício de polaridade correta, opcional { "95" }%. Referência independente (InternalConsistency): identidades de benefício/vencedor em forma fechada + envoltório fiel do quantum_trade::TradeResult existente; a honestidade está ligada ao registro de representatividade e aos rótulos de verificação

# text
seg-eb75c6a4dcec = A evidência de comparação quântico-versus-clássico (forma comum) é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-gnss-free-nav.md
seg-bfbcc7e8f620 = Fonte: <c1/>

# text
# c1: quantum-gnss-free-nav
seg-cfa59601df4a = <c1/> (tipo de cenário)

# text
seg-790fbfdd80f0 = Navegação quântica sem GNSS, MODELLED: durante uma interrupção do GNSS, um orçamento inercial quântico (interferômetro de átomos frios) contra um INS clássico de grau de navegação — crescimento do erro de posição ao longo da deriva, holdover até um limiar de posição e a comparação quântico-versus-clássico como TradeEvidence honesto, com representatividade. Nota honesta de observabilidade: sem solução externa, o viés do acelerômetro é não observável, de modo que o erro cresce; o sensor quântico desacelera essa diferença, mas não a fecha. Parâmetros ilustrativos de dispositivo de fonte pública; modela a classe, sem TRL, voo nem certificação.

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-dd74f248373d = Uma execução de <c1/> resume-se assim: quantum-gnss-free-nav | outage 300s | quantum pos err { "0.00" } m vs classical { "37.31" } m (8289.5x) | holdover quantum 44721s vs classical 534s (thr { "100" } m) | trade quantum wins 2/2 | MODELLED

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-960491d74173 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-88d9dfe0353a = O exemplo <c1/> define, entre outros:

# attr:alt
seg-1bdbf1a737b2 = O gráfico que o motor escreve para scenarios/quantum-gnss-free-nav.toml, tipo de cenário quantum-gnss-free-nav

# text
seg-d196391dcf4f = <b>MODELLED</b> Navegação por estima com INS quântico (interferômetro de átomos frios) contra INS clássico de grau de navegação durante uma interrupção do GNSS: crescimento do erro de posição, holdover até um limiar de posição,. Referência independente (InternalConsistency): orçamentos inerciais reaproveitados, verificados de forma cruzada contra uma dupla integração independente em Octave da mesma EDO de navegação por estima (ambiente de execução diferente, modelo compartilhado → ReferenceImpl), mais o ruído de curto prazo publicado de Freier-2016 como âncora unilateral; o composto quântico-versus-clássico continua MODELLED

# text
# c1: kshana kinds --json
seg-af35cccc4e2c = Navegação quântica sem GNSS, MODELLED: durante uma interrupção do GNSS, um orçamento inercial quântico (interferômetro de átomos frios) contra um INS clássico de grau de navegação — crescimento do erro de posição ao longo da deriva, holdover até um limiar de posição e a comparação quântico-versus-clássico como TradeEvidence honesto, com representatividade. (catálogo de tipos de cenário (<c1/>))

# text
seg-9b9ce7600ffc = Navegação quântica sem GNSS — navegação por estima com INS quântico (interferômetro de átomos frios) contra INS clássico de grau de navegação durante uma interrupção do GNSS. MODELLED; parâmetros ilustrativos de dispositivo, de fonte pública; modela a classe, sem alegação de TRL nem de voo. (comentário do arquivo de cenário, linhas { "1" } a { "3" })

# text
seg-9d67411151e3 = A navegação quântica sem GNSS é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e1d502e1ed6d = <s1>Anterior</s1>quantum-anomaly-detect

# text
seg-1f3705925b3c = <s1>Próximo</s1>quantum-time-transfer
