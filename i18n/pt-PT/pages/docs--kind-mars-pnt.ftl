# docs--kind-mars-pnt: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> O tipo de cenário <c1/>: um orbitador ou um módulo de aterragem na superfície em torno de um corpo escolhido pelo nome navega com pseudodistâncias unidirecionais de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do corpo, um relógio de utilizador desconhecido

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-670191cf797f = Página do tópico: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Relógio de Kalman de 3 estados (fase/frequência/deriva) de van Loan, estabilizado por Joseph. Referência independente (ReferenceImpl): KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, por isso isto permanece MODELLED. Comparação externa { "0.30" }, um achado (permanece MODELLED): em relógios finais do IGS de { "30" } s de { "11" } GPS Blo

# text
seg-8de95b3a9229 = A estimativa do estado do relógio a bordo é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/mars-pnt.md
seg-c68502b9d675 = Fonte: <c1/>

# text
# c1: mars-pnt
seg-46072326d616 = <c1/> (tipo de cenário)

# text
seg-3f749aef8d89 = PNT de espaço profundo em Marte: uma constelação simulada de retransmissores MARCONI (retransmissores areoestacionários + inclinados que difundem em sentido único + retransmitem em sentido duplo para uma estação de espaço profundo) navega um utilizador de referência (transfer | lmo | surface) através do estimador de fusão radiométrica conjunta de sentido único/duplo. Indica a geometria/visibilidade por época, o RMS alcançado face à verdade e a covariância formal (posição 1σ / 3σ) — uma figura de mérito simulada e honesta, NÃO um nível de proteção certificado.

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-0254f9bd0ee6 = Uma execução de <c1/> resume-se assim: mars-pnt 5aad87fcc94a | utilizador lmo, relógio uso | { "5" } retransmissores (média de { "3.1" } à vista) | RMS da posição convergida de { "0.25" } m, 1σ formal de { "0.31" } m (3σ de { "0.93" } m — FoM da covariância, não um PL certificado) | clock-freq σ { "3.71e-13" } | cov-PD verdadeiro

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-8eb513e7aeea = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-5a9640a3f9b4 = O exemplo <c1/> define, entre outros:

# text
seg-8e0fecea19fc = uso

# text
seg-a16f2332397c = lmo

# attr:alt
seg-c564dca90854 = O gráfico que o motor escreve para scenarios/mars-pnt-lmo.toml, tipo de cenário mars-pnt

# text
seg-83c3a84f6b98 = <b>VALIDATED</b> Recuperar um estado de época [r,v] a partir de distâncias de estações em terra através de um corretor diferencial em lote de Gauss–Newton e de um filtro sequencial, sobre um modelo de forças de dois corpos+J2. Referência independente (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — uma biblioteca de estimação independente de terceiros com um modelo de forças correspondente; o estado de época recuperado + o RMS do resíduo pós-ajuste concordam até <{ "1e-3" } m sem ruído e <{ "3" } m com um piso de ruído de { "5" } m

# text
seg-4be479b81f39 = <s1>Anterior</s1>lunar-vlbi

# text
seg-2854e6a75833 = <s1>Seguinte</s1>moonlight-service-volume

# text
seg-6d595f01ffcc = <s1>Seguinte</s1>mission-thread
