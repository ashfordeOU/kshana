# docs--kind-sweep-nd: translations (pt-PT)

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> O varrimento do tipo de cenário <c1/> (uma a três chaves com pontos de qualquer tipo de cenário, sobre os valores de eixo do varrimento genérico, opcionalmente um conjunto em cada nó) e a secção monte_carlo. Referência independente (InternalConsistency): A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções isoladas para a semeadura. Ela verifica a aritmética do conjunto sobre o próprio modelo de relógio do motor, não um conjunto de dados externo

# text
seg-d1c11e493795 = As varreduras de parâmetros e os conjuntos de Monte Carlo com semente sobre qualquer tipo de cenário são MODELLED, não validados: verificados contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } ronda { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Balanço de posição composto de viés + fator de escala + VRW + decaimento de estabilidade ao longo do holdover. Referência independente (ReferenceImpl): Integração independente de SDE por Monte Carlo em numpy do ruído de aceleração branca duplamente integrado (valida a variância analítica do VRW por um algoritmo genuinamente independente) + uma âncora de valores publicados de Groves { "2013" } para os termos de viés/fator de escala; os números do dispositivo CAI quantificam hardware de parceiro e permanecem MODELLED

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = A resiliência da navegação inercial por estima de sensores quânticos é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5a70fcb097dc = Campos opcionais: nenhum

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Fonte: <c1/>

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (tipo de cenário)

# text
seg-4f19d4fb1341 = Varrimento N-D genérico sobre qualquer pacote através de chaves TOML com pontos / caminhos de métricas JSON.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Uma execução de <c1/> resume-se assim: varrimento genérico de <c2/> sobre [threshold_m, accel_classical.bias] | { "15" } nós (forma [{ "5" }, { "3" }]) | métricas [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Campos obrigatórios: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = O exemplo <c1/> define, entre outros:

# attr:alt
seg-621a18c07044 = O gráfico que o motor escreve para scenarios/sweep-nd-inertial.toml, tipo sweep-nd

# text
seg-ce006a6715e9 = <s1>Anterior</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Seguinte</s1>sweep
