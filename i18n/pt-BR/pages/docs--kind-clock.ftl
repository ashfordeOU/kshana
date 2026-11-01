# docs--kind-clock: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/clock.md
seg-33555d61ddc6 = Fonte: <c1/>

# text
# c1: clock
seg-618393657d01 = <c1/> (tipo de cenário)

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-78cba87823f7 = Holdover do relógio em relação à especificação; conjunto Monte Carlo opcional (execuções > { "1" }).

# text
# c1: scenarios/clock-ensemble.toml
seg-dd2ad570a6c9 = Uma execução de <c1/> resume-se assim: cenário 91d2b6d10d14 | { "200" } execuções | holdover quântico 6600s [6600-6600] p95 8.78e-4ns segurança n/d (sem ataque) | holdover clássico 844s [220-2130] p95 167.0ns segurança n/d (sem ataque)

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
seg-51820163de28 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
# c2: integrity
seg-80fe14eb5e79 = Campos opcionais: <c1/>, <c2/>

# text
# c1: scenarios/clock-ensemble.toml
seg-807e7c5a2565 = O exemplo <c1/> define, entre outros:

# text
seg-b0a5473bec67 = Folha de dados do CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Relógio óptico de rede de estrôncio, meta para uso espacial sigma_y

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# attr:alt
seg-cb0b7da83f5c = O gráfico que o motor gera para scenarios/clock-ensemble.toml, tipo de cenário clock

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> A seção opcional [integrity] do tipo de cenário clock (clock_integrity::run): a partir de um local e de predefinições de constelação declarados (geometry::sky_geometry), em cada época de integridade enquanto a linha do tempo do GNSS não está negada, RAIM instantâneo (raim::snapshot_ Testes: <a1>clock_integrity.rs</a1>.

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: uma camada de análise sintática que converte um arquivo de relógio RINEX (registros AS/AR de um relógio nomeado, versões { "2" } e { "3.00" } a { "3.04" }), um registro ASCII de fase ou frequência no estilo TimeLab, ou um registro de carimbos de tempo ou intervalos do TAPR TICC em um pha uniforme Testes: <a1>clock_log_allantools.rs</a1>.

# text
seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input com os formatos ptp4l, phc2sys, ts2phc, chrony-tracking e chrony-statistics: o desvio registrado de uma linha de servo do linuxptp (ns, o carimbo de tempo entre colchetes da própria linha, leituras antes de o servo informar s2 pela primeira vez omitidas a

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desvio de Allan/modificado/Hadamard + identificação de ruído de lei de potência com ICs de χ². Referência independente (ExternalDataset): NIST SP { "1065" } (Riley) / desvios de referência do Stable32 em NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crescimento do erro em inércia de forma fechada + holdover até o limiar; classes de relógios quânticos. Referência independente (ReferenceImpl): Recursão de covariância multipasso de clock_state (conferência cruzada na mesma base de código); o núcleo subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com piso de ruído vermelho permanecem MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Relógio de Kalman de 3 estados (fase/frequência/deriva) de van Loan, estabilizado por Joseph. Referência independente (ReferenceImpl): KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, por isso isto permanece MODELLED. Comparação externa { "0.30" }, um achado (permanece MODELLED): em relógios finais do IGS de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos em uma figura de mérito de segurança por época. Referência independente (ExternalDataset): parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, um achado (permanece MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores em nível de observável (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não levantaram alarme em até { "10" } s de nenhum dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o pu

# text
seg-e12f672ae71d = O holdover do relógio sem GNSS é MODELLED, não validado: conferido contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = A estimativa do estado do relógio a bordo é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = A detecção de spoofing é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
seg-46ed0b786244 = Página do tópico: <a1>RECEIVER-TRUST.md</a1>

# text
seg-e06f9a5a0291 = <s1>Anterior</s1>cislunar-observability

# text
seg-aba9395185fa = <s1>Próximo</s1>combined-altpnt

seg-d1beb62cf742 = { "6" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> O tipo de cenário <c1/>: um documento de fases, cada uma de um de oito tipos registrados, executadas em ordem com a covariância 6x6, o relógio e o referencial transferidos sob uma regra declarada (<c2/>; <c3/>, ruído de aceleração branco ao longo de um intervalo declarado Testes: <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = e mais { "1" } na matriz.
