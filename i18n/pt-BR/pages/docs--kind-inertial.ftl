# docs--kind-inertial: translations (pt-BR)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-b054c73f22e5 = sem valor

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = e mais { "4" } na matriz.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Uma faixa, não uma paridade. { "0.30" } rodada { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Balanço de posição composto de viés + fator de escala + VRW + decaimento de estabilidade ao longo do holdover. Referência independente (ReferenceImpl): Integração independente de SDE por Monte Carlo em numpy do ruído de aceleração branca duplamente integrado (valida a variância analítica do VRW por um algoritmo genuinamente independente) + uma âncora de valores publicados de Groves { "2013" } para os termos de viés/fator de escala; os números do dispositivo CAI quantificam hardware de parceiro e permanecem MODELLED

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = A resiliência da navegação inercial por estima de sensores quânticos é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-ca448daf5ec7 = nominal

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página do tópico: <a1>QUANTUM.md</a1>

# text
seg-7bebd09c614b = Acelerômetro de quartzo de grau de navegação (Honeywell QA-2000 / G

# text
# c1: docs/kinds/by-kind/inertial.md
seg-cead54058894 = Fonte: <c1/>

# text
# c1: inertial
seg-783be547f01e = <c1/> (tipo de cenário)

# text
seg-bdedf28adc48 = Navegação inercial por estima em 1-DOF durante uma interrupção do GNSS.

# text
# c1: scenarios/imu-deadreckoning.toml
seg-55b5599ef867 = Uma execução de <c1/> resume-se assim: cenário fc9191cef784 | holdover quântico 6600s p95 41.39m | holdover clássico 350s p95 30629.9m

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
seg-b05c3cb45c0d = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
seg-94fd9afe6f30 = Campos opcionais: <c1/>

# text
# c1: scenarios/imu-deadreckoning.toml
seg-bd021b5dff80 = O exemplo <c1/> define, entre outros:

# text
seg-8a9e52e38b05 = Tríade de acelerômetros quânticos híbridos Exail: estabilidade de viés 6e-

# attr:alt
seg-873c402bb724 = O gráfico que o motor gera para scenarios/imu-deadreckoning.toml, tipo de cenário inertial

# text
seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-41f3a20fadfb = <b>VALIDATED</b> Mecanização inercial strapdown NED WGS-84 com atitude por quatérnions (com compensação de coning/sculling) propagando um estado de navegação a partir de incrementos (Δθ, Δv) Testes: <a1>classical_strapdown_ins_reference.rs</a1>.

# text
seg-102d2e51460e = <b>MODELLED</b> Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN) Testes: <a1>quantum_inertial_sensor_reference.rs</a1>.

# text
seg-83fa50d4859a = <b>MODELLED</b> Faixa dinâmica de ambiguidade de franjas de Mach–Zehnder: a leitura de franjas com periodicidade 2π define uma força específica máxima não ambígua a_max=π/(k_eff·T²), e a faixa não ambígua em células de resolução a_max/σ_a=π/σ_Φ é independente do fator de escala óptico

# text
seg-89ec2e65cf4f = <b>MODELLED</b> Balanço de posição composto de viés + fator de escala + VRW + decaimento de estabilidade ao longo do holdover Testes: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

# text
seg-bb07c8ee153f = <b>PARTNER</b> Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-fab4c926e628 = <s1>Anterior</s1>impairment-eval

# text
seg-aa783749183d = <s1>Próximo</s1>ins-trn-coast
