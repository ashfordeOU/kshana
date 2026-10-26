# docs--nmea-training: translations (pt-PT)

# text
seg-2247a2344710 = Significado

# text
seg-45425f378b61 = significado

# text
seg-6940543aa3c0 = cadeia de caracteres

# text
seg-f5e7215e6835 = objeto

# text
seg-c5fb6b91dc68 = graus

# text
seg-99427ab75a03 = campo

# text
seg-bbcdd898d24d = inteiro

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Fonte: <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = Fluxos NMEA de formação: <c1/>

# text
seg-3663955f80c7 = As academias marítimas e os centros de simuladores podem alimentar um simulador de ponte ou um plotter de cartas com NMEA { "0183" } gerado pelo Kshana para formar tripulações no reconhecimento de jamming e de spoofing de GNSS.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Apenas para formação e ensaio.</b> Os fluxos gerados são sintéticos. Nunca devem ser fornecidos aos sistemas de navegação em funcionamento de uma embarcação. O Kshana é consultivo, não um equipamento de navegação homologado. Cada fluxo começa, e repete de dez em dez segundos, com uma frase marcadora proprietária, <c1/>, que os recetores ignoram; <c2/> remove-a para um simulador que rejeita frases desconhecidas. Isto escreve <b>apenas texto</b> NMEA: não há saída de RF, de IQ nem de forma de onda, e nada transmite exceto o texto para o endereço indicado.

# attr:alt
seg-b66ff9ca2ff4 = Fluxo de formação do cenário coastal-drag-off (motor v{ $version }, semente { "22" }, { "25" } minutos a uma posição por cada { "10" } s do registo do instrutor). Um mapa mostra a trajetória verdadeira da embarcação e a trajetória que o recetor comunica: concordam até começar um arrastamento de posição programado aos { "421" } s, a trajetória comunicada afasta-se então da verdadeira enquanto o recetor mantém uma posição válida, e volta a aproximar-se quando o evento termina aos { "1140" } s. Ao lado, a distância entre as duas trajetórias ao longo do tempo e a densidade média de portadora sobre ruído que o recetor comunica, que sobe para um nível elevado enquanto o evento dura. Dados sintéticos de formação gerados pelo Kshana. Apenas para formação e ensaio: nunca fornecer este fluxo aos sistemas de navegação em funcionamento de uma embarcação. Apenas consultivo, não um equipamento de navegação homologado. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação. As posições, as datas e as trajetórias são inventadas.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = A figura é desenhada a partir do registo do instrutor de <c1/>.

# text
seg-32b620b3574e = Utilização

# text
seg-9cbd24964be4 = Opção

# text
# c1: <name>.nmea
seg-aadcf289aed2 = escrever o fluxo para um ficheiro; sem saída de rede, a predefinição é <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = escrever <c1/> e <c2/> (predefinição: junto ao ficheiro)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> ou <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = servidor TCP; a execução começa quando um cliente se liga (<c1/>). Uma porta isolada escuta apenas em <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> ou <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, uma frase por datagrama; <c1/> permite um endereço de difusão. Uma porta isolada envia para <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = regular o ritmo do fluxo; <c1/> é o mais rápido possível. A saída de rede usa por predefinição o tempo real, os ficheiros o mais rápido possível

# text
seg-97b82dfe97a7 = substituir a semente do cenário

# text
seg-86ac66fd2771 = omitir a frase marcadora

# text
seg-f6cc05a6d39a = <b>Não há autenticação.</b> Um servidor TCP com um endereço não local serve o fluxo a qualquer pessoa que o consiga alcançar, e o UDP envia para o endereço que for indicado. Um cliente TCP que não receba os seus dados no prazo de dois segundos é descartado, de modo que um consumidor parado não possa reter os restantes.

# text
seg-b4abb5a132ba = A mesma semente dá os mesmos bytes numa plataforma, e o ritmo nunca altera os bytes. Entre plataformas, a aritmética do próprio gerador é idêntica bit a bit (usa a camada de matemática portátil), mas as posições dos satélites e os ângulos de visada provêm de funções do motor que chamam a biblioteca de matemática do anfitrião, pelo que, num caso limite raro, um dígito arredondado de elevação, azimute ou C/N0 em GSV pode diferir entre plataformas.

# text
seg-97e31fc7f0d1 = O que é escrito

# text
# c1: GN
seg-632a4ca26567 = Cada época ({ "1" }, { "2" }, { "5" } ou { "10" } por segundo) transporta: <b>RMC, GGA, GNS</b> (posição, localização, hora), <b>GSA</b> (satélites usados e DOP, um por constelação), <b>GSV</b> (satélites à vista com elevação, azimute e SNR em dB-Hz, um conjunto por constelação, ID de sinal NMEA { "4.10" }), <b>VTG</b> (rumo e velocidade sobre o fundo), <b>ZDA</b> (hora e data), <b>HDT</b> (rumo da giroscópica) e <b>VBW</b> (velocidade na água e sobre o fundo a partir da barquinha). O emissor (talker) é <c1/> com várias constelações, caso contrário o da própria constelação. As linhas terminam em CRLF e têm somas de verificação válidas.

# text
seg-942803ad8c49 = HDT e VBW substituem sensores independentes (uma giroscópica e uma barquinha Doppler). <b>Nenhum evento os afeta</b>, o que é deliberado: a diferença entre o que o GNSS comunica e o que a giroscópica e a barquinha indicam é uma deixa para o debriefing.

# text
# c1: V
seg-2d9a9ea38dde = Quando a posição se perde, a qualidade de GGA é { "0" }, o estado de RMC é <c1/>, os campos de posição ficam vazios e os campos de hora continuam (o relógio do recetor continua a funcionar), tal como nos recetores reais.

# text
seg-c1c51ff381e7 = A embarcação

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> e <c2/> dão uma posição inicial, uma velocidade e os pontos por onde governar. A embarcação é governada para o ponto de passagem seguinte sob um <b>limite da taxa de viragem</b> (<c3/>, predefinição { "30" }), um limite para a rapidez com que a taxa de viragem aumenta (<c4/>) e um <b>limite de variação de velocidade</b> (<c5/>). A velocidade de um troço é o <c6/> do ponto de passagem. <c7/> acrescenta uma corrente, pelo que a velocidade sobre o fundo difere da velocidade na água e o rumo difere do rumo sobre o fundo, e uma variação magnética. <c8/> leva a embarcação ao repouso no último ponto de passagem.

# text
seg-4fc2cb8a1388 = Geometria dos satélites

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Os satélites provêm das constelações nominais do próprio motor (tabela de slots do GPS, padrões de Walker MEO do Galileo e do BeiDou, ICD do GLONASS), propagados por <c1/> (dois corpos mais J2 secular, rotação da Terra) e vistos da embarcação com os ângulos de visada WGS-84 do motor. A contagem visível, as elevações e os azimutes em GSV são plausíveis para o local e a hora do dia. <b>Isto é um céu nominal, não uma efeméride para a data do fluxo</b>: os PRN são atribuídos pela ordem dos slots e cada constelação mantém a sua disposição de slots publicada, propagada continuamente desde a época da tabela de slots do GPS (2016-12-31) sob J2, pelo que a disposição está intacta mas a sua orientação não é a do céu real na data do fluxo. O C/N0 acompanha a elevação (um nível zenital nominal, definido em <c2/>), com um desvio fixo por satélite, desvanecimento lento e ruído. Um satélite abaixo de <c3/> tem o campo SNR vazio; um abaixo de <c4/> é seguido mas não usado. São usados até <c5/> (predefinição { "12" }, o teto do GGA do NMEA) satélites utilizáveis, escolhidos pela geometria (primeiro o satélite mais alto de cada setor de azimute de { "30" } graus). Menos de quatro satélites utilizáveis fazem perder a posição, que regressa após <c6/> de sinal utilizável.

# text
seg-f2be7442bdf2 = Eventos

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Cada <c1/> tem um <c2/>, um início <c3/>, uma <c4/> (do início ao começo da libertação), uma rampa de início <c5/> e uma rampa de libertação <c6/>. A intensidade sobe linearmente durante <c7/>, mantém-se e depois desce durante <c8/>; <c9/> é um degrau. Todos os efeitos escalam com essa intensidade. Os parâmetros que não pertencem ao tipo são recusados.

# text
seg-3255e99c7265 = tipo

# text
seg-9285a9d699c0 = parâmetros

# text
seg-e83c9db4f9c7 = efeito

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (predefinição { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = o C/N0 de cada satélite desce até <c1/> (dispersão por satélite), os satélites caem por ordem do mais baixo, a posição perde-se quando há menos de quatro utilizáveis, e recupera após a libertação e <c2/>

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, um de <c2/> (verdadeiro) ou <c3/> (relativo ao rumo <b>no início</b>, depois mantido), <c4/> opcional, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = o recetor mantém uma <b>posição válida</b> cuja posição se afasta da verdade; SOG e COG incluem o arrastamento. O arrastamento segue smoothstep nas rampas, pelo que a trajetória falsa começa e para sem degrau de velocidade; os seus picos são <c1/> m/s e <c2/> m/s ao quadrado para uma rampa de <c3/> s sobre <c4/> m (ambos registados), e um cenário que excedesse <c5/> é recusado. Um degrau (<c6/>) move a posição sem tocar na velocidade

# text
seg-7da039c3262e = a hora de RMC, GGA, GNS e ZDA é deslocada do UTC verdadeiro; a posição mantém-se verdadeira

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (predefinição verdadeiro), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = a posição, a velocidade (e a hora) são as da embarcação de há <c1/>, com o atraso a seguir smoothstep nas suas rampas e a velocidade comunicada escalada por <c2/> enquanto ele varia: uma abstração simplificada ao estilo de meaconing, não um modelo de propagação

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: enquanto um arrastamento de posição, uma falsificação de hora ou um atraso de reprodução está ativo, todos os satélites seguidos mostram esse único nível elevado, um sinal clássico. Omiti-lo para um evento subtil em que o padrão genuíno de C/N0 é mantido. Enquanto qualquer evento de falsificação estiver ativo, o recetor segue o sinal falsificado, pelo que o jamming não o faz cair; uma posição perdida por jamming anterior regressa após <c2/> sobre o sinal falsificado (ver <c3/>). Uma alteração de hora que faria a hora comunicada parar ou andar para trás (taxa de { "1" } s por segundo ou mais) é recusada, a menos que seja um degrau (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Os eventos podem sobrepor-se; os seus efeitos somam-se (desvios, alterações de hora, atrasos) ou prevalece o mais forte (jamming). O <c1/> da cronologia é a primeira época em que o evento tem efeito, uma época depois do <c2/> programado quando o evento entra em rampa.

# text
seg-09e311ade9e6 = O registo do instrutor

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Junto com o fluxo, <c1/> e <c2/> dão:

# text
seg-51930977a6fe = os eventos tal como injetados, em linguagem simples com todos os parâmetros, e o seu início em UTC;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = uma cronologia: início, efeito total, início da recuperação, recuperado, e os próprios <c1/> e <c2/> do recetor;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = a trajetória verdadeira face à comunicada com o espaçamento de <c1/>: posição, velocidade e rumo verdadeiros e comunicados, erro de posição em metros, desvio de hora, satélites usados e seguidos, C/N0 médio e quais os eventos que estavam ativos;

# text
seg-303f5fbe0351 = a velocidade e a aceleração de pico da trajetória verdadeira e da comunicada;

# text
# c1: trainer_note
seg-593a4a1ef296 = o <c1/> do cenário.

# text
seg-8c4aebcd0eff = Mostrar o registo apenas no debriefing.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = Campos JSON (esquema <c1/>)

# text
seg-60b5b11cdc0b = tipo, unidade

# text
seg-f4963d090155 = a declaração de uso exclusivo para formação

# text
seg-7ad14e03d9e4 = do cenário

# text
seg-fac0fb50b31b = semente usada

# text
seg-f05d18516bd8 = ISO { "8601" } UTC

# text
seg-8752c09baa6a = início da execução

# text
seg-f0d8bb5aafef = duração da execução

# text
seg-0989e14f1e51 = nós

# text
seg-b657b979a455 = maior velocidade sobre o fundo, verdadeira e comunicada

# text
seg-24e947df31ae = m/s ao quadrado

# text
seg-a1ca3847c8d8 = maior variação de velocidade por segundo, verdadeira e entre posições comunicadas consecutivas

# text
seg-e1daadeb7d48 = um por evento programado

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = a partir de 1; usado por <c1/> e <c2/>

# text
seg-6bbb9db14f7b = descrição em linguagem simples com os parâmetros

# text
seg-2f3eac27a997 = início programado

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = o evento exatamente como escrito (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, e os parâmetros próprios do tipo; os ausentes são omitidos)

# text
seg-88db26711d77 = graus verdadeiros ou nulo

# text
seg-2f30c3d8b17b = arrastamento: a direção aplicada (um rumo relativo é resolvido no início)

# text
seg-55d6dd667365 = m/s, m/s ao quadrado ou nulo

# text
seg-021df000164f = arrastamento: picos que o arrastamento acrescenta à trajetória falsa

# text
seg-d3a2c65ebcd4 = momentos para o debriefing, por ordem temporal

# text
seg-b2b72301c1c9 = s desde o início, ISO { "8601" } UTC

# text
seg-34e24e21ac7e = quando (hora verdadeira)

# text
seg-cf29ba5ed968 = inteiro ou nulo

# text
seg-8dbc5e7239be = o identificador do evento; nulo para alterações de estado do recetor

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (eventos); <c5/>, <c6/> (recetor)

# text
seg-cd7c4057601b = explicação

# text
# c1: log_interval_s
seg-90e65cbe1a59 = uma linha por <c1/>

# text
seg-a57e27a3c470 = s, ISO { "8601" } UTC

# text
seg-24376fe24496 = posição verdadeira

# text
seg-f23b251a0e33 = nós, graus verdadeiros

# text
seg-242c1f2ccbd3 = velocidade e rumo verdadeiros sobre o fundo, e rumo da giroscópica

# text
seg-696dd61f8bbb = booleano

# text
seg-ea264ef0395c = o recetor comunicou uma posição

# text
seg-b073b87a813e = graus, nós, graus verdadeiros, ou nulo

# text
seg-b56345697092 = o que o recetor comunicou; nulo enquanto a posição está perdida

# text
seg-c4a33c03d9da = m ou nulo

# text
seg-463f6fc42ae5 = distância horizontal da posição verdadeira à comunicada

# text
seg-b68dfce8d81d = UTC comunicado menos UTC verdadeiro

# text
seg-ec28faa1efcc = inteiros

# text
seg-2bf397f77392 = satélites usados na posição, e seguidos

# text
seg-96b87348e90e = dB-Hz ou nulo

# text
seg-40f30b4a88cf = C/N0 médio dos satélites seguidos

# text
seg-3671c8aa3c1a = identificadores dos eventos com efeito neste instante

# text
# c1: /2
seg-8401fa92aae1 = Acrescentar um campo não altera a etiqueta do esquema. Mudar o nome de um campo ou removê-lo, ou alterar o significado ou a unidade de um campo, incrementa o número (<c1/>).

# text
seg-656ee92a3130 = A biblioteca de cenários

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, cada um com alguns minutos de travessia e uma nota do formador no seu TOML:

# text
seg-665b9b46b49b = ficheiro

# text
seg-11ed1f85d4be = o que mostra

# text
seg-50ffa85a1128 = o C/N0 cai em conjunto, os satélites caem, a posição perde-se e regressa

# text
seg-10bc30b9c57b = uma posição válida e de aspeto saudável arrasta { "1.4" } km em direção à costa; C/N0 elevado e uniforme

# text
seg-f141692988e4 = posição correta, o UTC deriva { "45" } s para a frente durante uma aproximação lenta ao porto

# text
seg-ce06a5ebdd42 = jamming, depois tomada falsificada com arrastamento e desvio de hora, depois um atraso de reprodução

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = um céu bloqueado, não interferência: as paredes de um fiorde (a predefinição de linha do horizonte REPRESENTATIVE <c1/>) escondem os satélites a leste e a oeste, e depois o canal volta a abrir-se (evento <c2/>, com uma tabela <c3/>)

# text
seg-5462f6b21fae = As posições, as datas e as trajetórias são inventadas; a biblioteca não contém nenhuma embarcação, operador nem gravação reais. Não faz nenhuma afirmação sobre o desempenho de qualquer recetor ou sistema perante interferência.

# text
seg-9831ab537b36 = Escolhas de modelação

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = O gerador é uma ferramenta de formação sem referência independente externa, e os seus números são escolhas de modelação, não medições de nenhum recetor. São escolhidos para se parecerem com o registo de um recetor comum: o declive de C/N0 de { "14" } dB do zénite ao horizonte abaixo do nível zenital (predefinição { "47" } dB-Hz) e o desvio por satélite de +/-1.5 dB, desvanecimento lento de { "0.8" } dB ao longo de { "97" } s e de { "0.5" } dB ao longo de { "31" } s, jitter de { "0.3" } dB; os limiares de seguimento ({ "20" } dB-Hz) e de utilização ({ "28" } dB-Hz); o ruído de posição ({ "1.5" } m com HDOP { "1" }, correlacionado ao longo de { "30" } s, o vertical o dobro); ruído de giroscópica de { "0.05" } graus e ruído de deriva de { "0.03" } nós; a constante de tempo de governo de { "20" } s e os raios de chegada aos pontos de passagem do modelo da embarcação; e a escolha de satélites por setor de azimute. As predefinições estão em <c1/> e <c2/> e podem ser todas alteradas no cenário.

# text
seg-84913be532a0 = Ler de volta

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> consegue ingerir estes ficheiros (<c2/>). Os testes verificam cada frase de cada cenário da biblioteca face às suas próprias regras de contagem de campos e de soma de verificação, e passam os ficheiros por esse leitor, que interpreta GGA, RMC e GSV e deixa passar os outros tipos sem saltar nenhum. Os testes fixam um excerto de referência por cenário (<c3/>); regenerar com <c4/> após uma alteração pretendida.

# text
seg-b94fbc3b1dd3 = <s1>Anterior</s1>Confiança marítima

# text
seg-ecdf748cb63d = <s1>Seguinte</s1>Mapa de interferência e exposição de rotas

# text
seg-24ad8471ff2a = Campos JSON (esquema kshana-nmea-training/1)
