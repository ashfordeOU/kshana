# docs--kind-fusion: translations (pt-PT)

# text
seg-03442e4be82d = Folha de dados do CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Página do tema: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = e mais { "4" } na matriz.

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desvio de Allan/modificado/Hadamard + identificação de ruído de lei de potência com ICs de χ². Referência independente (ExternalDataset): NIST SP { "1065" } (Riley) / desvios de referência do Stable32 em NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crescimento do erro em inércia de forma fechada + holdover até ao limiar; classes de relógios quânticos. Referência independente (ReferenceImpl): Recursão de covariância multipasso de clock_state (conferência cruzada na mesma base de código); o núcleo subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com patamar de ruído vermelho permanecem MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Relógio de Kalman de 3 estados (fase/frequência/deriva) de van Loan, estabilizado por Joseph. Referência independente (ReferenceImpl): KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, por isso isto permanece MODELLED. Comparação externa { "0.30" }, um achado (permanece MODELLED): em relógios finais do IGS de { "30" } s de { "11" } GPS Blo

# text
seg-e12f672ae71d = O holdover do relógio sem GNSS é MODELLED, não validado: conferido contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = A estimativa do estado do relógio a bordo é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = A deteção de spoofing é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/fusion.md
seg-4de09fe367df = Fonte: <c1/>

# text
# c1: fusion
seg-53e498cffeba = <c1/> (tipo de cenário)

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-ec26df467b88 = PNT por fusão de sensores com filtro de Kalman conjunto sobre as mesmas entradas híbridas.

# text
# c1: scenarios/fusion-pnt.toml
seg-25708bf88728 = Uma execução de <c1/> resume-se assim: cenário c8eac911bbe0 | fundido | holdover de PNT quântico 6600s (t 6600s/p 6600s) integridade { "1.000" } segurança n/d (sem ataque) | holdover de PNT clássico 1330s (t 1330s/p 6600s) integridade { "0.973" } segurança n/d (sem ataque)

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: coupled
seg-3d5cae65f093 = Campos opcionais: <c1/>

# text
# c1: scenarios/fusion-pnt.toml
seg-56bca36cabba = O exemplo <c1/> define, entre outros:

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-5d3f15c0688a = Acelerómetro de quartzo de grau de navegação; ilustrativo, ruído-dr

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-6ddd8a067e26 = Acelerómetro de átomos frios, passeio aleatório de velocidade baixo em tau longo;

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e79eecc14bea = Acelerómetro de quartzo de grau de navegação; i

# attr:alt
seg-c8a1c797f4b1 = O gráfico que o motor gera para scenarios/fusion-pnt.toml, tipo de cenário fusion

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-46c0903ff7b5 = <b>VALIDATED</b> Recuperar um estado de época [r,v] a partir de distâncias de estações terrestres por meio de um corretor diferencial em lote de Gauss–Newton e de um filtro sequencial, sobre um modelo de forças de dois corpos+J2 Testes: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

# text
seg-44f77aaf9d7e = <b>MODELLED</b> EKF de estado de erro sobre { "15" } estados de INS, um relógio de recetor de dois estados e uma ambiguidade de portadora flutuante por satélite em seguimento; pseudodistância, fase da portadora e taxa de distância opcional a partir de uma constelação Walker SGP4 (tempo de luz e Sagnac), Klobuchar e Testes: <a1>fusion_carrier_tc.rs</a1>.

# text
seg-509f93c7e9ce = <b>MODELLED</b> Três cenários gnss-ins sobre a biblioteca de trajetórias (uma embarcação a serpentear a { "8" } m/s com uma interrupção de cinco minutos; um comboio por uma escavação com dois satélites e um túnel; uma aeronave cuja interrupção cobre uma curva inclinada de 25 graus) e o opcional do pacote Testes: <a1>gnss_ins_packs.rs</a1>.

# text
seg-e0633b308e4e = <b>MODELLED</b> Um filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que transportam a covariância cruzada); uma variante de 1-DOF aumentada com um viés constante de acelerómetro Testes: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } ronda { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Balanço de posição composto de viés + fator de escala + VRW + decaimento de estabilidade ao longo do holdover. Referência independente (ReferenceImpl): Integração independente de SDE por Monte Carlo em numpy do ruído de aceleração branca duplamente integrado (valida a variância analítica do VRW por um algoritmo genuinamente independente) + uma âncora de valores publicados de Groves { "2013" } para os termos de viés/fator de escala; os números do dispositivo CAI quantificam hardware de parceiro e permanecem MODELLED

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = A resiliência da navegação inercial por estima de sensores quânticos é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c894aa7d9585 = <s1>Anterior</s1>ephemeris

# text
seg-d14a7850df1c = <s1>Seguinte</s1>gnss-ins
