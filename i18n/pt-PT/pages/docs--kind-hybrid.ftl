# docs--kind-hybrid: translations (pt-PT)

# text
seg-03442e4be82d = Folha de dados do CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }

# text
seg-f4cf8b629797 = Página do tema: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

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
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e0633b308e4e = <b>MODELLED</b> Um filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que transportam a covariância cruzada); uma variante de 1-DOF aumentada com um viés constante de acelerómetro Testes: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } ronda { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = A resiliência da navegação inercial por estima de sensores quânticos é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
# c1: docs/kinds/by-kind/hybrid.md
seg-d91dc5633e67 = Fonte: <c1/>

# text
# c1: hybrid
seg-3b43d9c5624d = <c1/> (tipo de cenário)

# text
seg-22cd963c7042 = Capstone de PNT híbrido: relógio + IMU + auxílio por transferência de tempo.

# text
# c1: scenarios/hybrid-pnt.toml
seg-166be08d5276 = Uma execução de <c1/> resume-se assim: cenário f33d734ecc51 | holdover de PNT quântico 6600s (t 6600s/p 6600s) integridade { "0.998" } segurança n/d (sem ataque) | holdover de PNT clássico 350s (t 6600s/p 350s) integridade { "1.000" } segurança n/d (sem ataque)

# text
seg-5a70fcb097dc = Campos opcionais: nenhum

# text
# c1: scenarios/hybrid-pnt.toml
seg-f33278986879 = O exemplo <c1/> define, entre outros:

# text
seg-7bebd09c614b = Acelerómetro de quartzo de grau de navegação (Honeywell QA-2000 / G

# text
seg-4f5fd1bc8a4e = Tríade de acelerómetros quânticos híbridos Exail, estabilidade de viés { "5.8" }

# text
seg-49bff8dc860e = Acelerómetro de quartzo de grau de navegação (H

# attr:alt
seg-52378a7b074c = O gráfico que o motor gera para scenarios/hybrid-pnt.toml, tipo de cenário hybrid

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidirecional/TWSTFT (Sagnac), visada comum de GNSS, PPP; jitter do enlace→distância. Referência independente (ExternalDataset): Magnitude de Sagnac conferida contra um VALOR PUBLICADO de autoridade — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pela geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O transponder/visada comum/ BIPM TWSTFT composto

# text
seg-a8beb8dfc757 = O orçamento de erros de transferência de tempo é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a9c56fc9608a = Página do tópico: <a1>MACHINE-INPUTS.md</a1>

# text
seg-cc86939900fe = <s1>Anterior</s1>hybrid-ukf

# text
seg-53b95026bf54 = <s1>Seguinte</s1>impairment-eval
