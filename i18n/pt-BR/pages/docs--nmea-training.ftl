# docs--nmea-training: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-45425f378b61 = significado

# text
seg-6940543aa3c0 = string

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
seg-738956d0a4b9 = Fluxos NMEA de treinamento: <c1/>

# text
seg-3663955f80c7 = Academias marítimas e centros de simuladores podem alimentar um simulador de passadiço ou um plotter de cartas com NMEA { "0183" } gerado pelo Kshana para treinar tripulações a reconhecer jamming e spoofing de GNSS.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Somente treinamento e teste.</b> Os fluxos gerados são sintéticos. Nunca devem ser alimentados aos sistemas de navegação em operação de uma embarcação. O Kshana é de caráter consultivo, não um equipamento de navegação homologado. Todo fluxo começa com uma sentença proprietária de marcação, que se repete a cada dez segundos, <c1/>, a qual os receptores ignoram; <c2/> a remove para um simulador que rejeita sentenças desconhecidas. Isto grava <b>somente texto</b> NMEA: não há saída de RF, de IQ nem de forma de onda, e nada transmite exceto o texto para o endereço que você indicar.

# attr:alt
seg-b66ff9ca2ff4 = Fluxo de treinamento do cenário coastal-drag-off (motor v{ $version }, semente { "22" }, { "25" } minutos com uma solução a cada { "10" } s do log do instrutor). Um mapa mostra a trajetória verdadeira da embarcação e a trajetória que o receptor relata: elas concordam até que um arrasto de posição roteirizado começa em { "421" } s, a trajetória relatada então se afasta da verdadeira enquanto o receptor mantém uma solução válida, e volta de um salto quando o evento termina em { "1140" } s. Ao lado, a distância entre as duas trajetórias ao longo do tempo e a densidade média de portadora sobre ruído que o receptor relata, que sobe para um único nível elevado enquanto o evento dura. Dados sintéticos de treinamento gerados pelo Kshana. Somente para treinamento e teste: nunca alimente este fluxo aos sistemas de navegação em operação de uma embarcação. De caráter consultivo, não um equipamento de navegação homologado. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação. Posições, datas e trajetórias são inventadas.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = A figura é desenhada a partir do log do instrutor de <c1/>.

# text
seg-32b620b3574e = Uso

# text
seg-9cbd24964be4 = Opção

# text
# c1: <name>.nmea
seg-aadcf289aed2 = grava o fluxo num arquivo; sem saída de rede o padrão é <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = grava <c1/> e <c2/> (padrão: ao lado do arquivo)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> ou <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = servidor TCP; a execução começa quando um cliente se conecta (<c1/>). Uma porta sozinha escuta apenas em <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> ou <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, uma sentença por datagrama; <c1/> permite um endereço de broadcast. Uma porta sozinha envia para <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = ritma o fluxo; <c1/> é o mais rápido possível. A saída de rede usa tempo real por padrão, os arquivos o mais rápido possível

# text
seg-97b82dfe97a7 = substitui a semente do cenário

# text
seg-86ac66fd2771 = omite a sentença de marcação

# text
seg-f6cc05a6d39a = <b>Não há autenticação.</b> Um servidor TCP com um endereço não local serve o fluxo a qualquer pessoa que consiga alcançá-lo, e o UDP envia para qualquer endereço que você indicar. Um cliente TCP que não recebe seus dados em dois segundos é descartado, de modo que um consumidor parado não pode atrasar os demais.

# text
seg-b4abb5a132ba = A mesma semente dá os mesmos bytes numa plataforma, e o ritmo nunca altera os bytes. Entre plataformas a aritmética própria do gerador é idêntica bit a bit (ele usa a camada de matemática portátil), mas as posições dos satélites e os ângulos de visada vêm de funções do motor que chamam a biblioteca matemática do hospedeiro, de modo que, num caso limítrofe raro, um dígito arredondado de elevação, azimute ou C/N0 em GSV pode diferir entre plataformas.

# text
seg-97e31fc7f0d1 = O que é gravado

# text
# c1: GN
seg-632a4ca26567 = Cada época ({ "1" }, { "2" }, { "5" } ou { "10" } por segundo) traz: <b>RMC, GGA, GNS</b> (solução, posição, tempo), <b>GSA</b> (satélites usados e DOP, um por constelação), <b>GSV</b> (satélites à vista com elevação, azimute e SNR em dB-Hz, um conjunto por constelação, ID de sinal NMEA { "4.10" }), <b>VTG</b> (rumo e velocidade sobre o fundo), <b>ZDA</b> (hora e data), <b>HDT</b> (rumo do girocompasso) e <b>VBW</b> (velocidade na água e sobre o fundo a partir da barquilha). O talker é <c1/> com várias constelações, caso contrário o da própria constelação. As linhas terminam em CRLF e têm checksum válido.

# text
seg-942803ad8c49 = HDT e VBW representam sensores independentes (um girocompasso e uma barquilha Doppler). <b>Nenhum evento os toca</b>, o que é deliberado: a diferença entre o que o GNSS relata e o que o girocompasso e a barquilha dizem é uma pista para o debriefing.

# text
# c1: V
seg-2d9a9ea38dde = Quando a solução é perdida, a qualidade do GGA é { "0" }, o status do RMC é <c1/>, os campos de posição ficam vazios e os campos de tempo continuam (o relógio do receptor continua rodando), como nos receptores reais.

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
seg-ada150c912eb = <c1/> e <c2/> dão uma posição inicial, uma velocidade e os pontos pelos quais governar. A embarcação é governada rumo ao próximo ponto de passagem sob um <b>limite de taxa de guinada</b> (<c3/>, padrão { "30" }), um limite de quão rápido a taxa de guinada se constrói (<c4/>) e um <b>limite de variação de velocidade</b> (<c5/>). A velocidade de um trecho é o <c6/> do ponto de passagem. <c7/> acrescenta uma corrente, de modo que a velocidade sobre o fundo difere da velocidade na água e o rumo difere do rumo sobre o fundo, e uma variação magnética. <c8/> leva a embarcação ao repouso no último ponto de passagem.

# text
seg-4fc2cb8a1388 = Geometria dos satélites

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Os satélites vêm das próprias constelações nominais do motor (tabela de slots do GPS, padrões Walker MEO do Galileo e do BeiDou, ICD do GLONASS), propagados por <c1/> (dois corpos mais J2 secular, rotação da Terra) e vistos da embarcação com os ângulos de visada WGS-84 do motor. A contagem visível, as elevações e os azimutes em GSV são plausíveis para o lugar e a hora do dia. <b>Este é um céu nominal, não uma efeméride para a data do fluxo</b>: os PRNs são atribuídos na ordem dos slots e cada constelação mantém o seu layout de slots publicado, propagado continuamente a partir da época da tabela de slots do GPS (2016-12-31) sob J2, de modo que o layout está intacto, mas a sua orientação não é a do céu real na data do fluxo. O C/N0 acompanha a elevação (um nível nominal de zênite, definido em <c2/>), com um deslocamento fixo por satélite, desvanecimento lento e ruído. Um satélite abaixo de <c3/> tem o campo de SNR vazio; um abaixo de <c4/> é rastreado, mas não usado. Até <c5/> (padrão { "12" }, o teto do GGA do NMEA) satélites utilizáveis são usados, escolhidos pela geometria (primeiro o satélite mais alto em cada setor de azimute de { "30" } graus). Menos de quatro satélites utilizáveis perdem a solução, e ela volta após <c6/> de sinal utilizável.

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
seg-db86ed4b40a9 = Cada <c1/> tem um <c2/>, um início <c3/>, uma <c4/> (do início até o começo da liberação), uma rampa de início <c5/> e uma rampa de liberação <c6/>. A intensidade sobe linearmente ao longo de <c7/>, se mantém e depois cai ao longo de <c8/>; <c9/> é um degrau. Todos os efeitos escalam com essa intensidade. Parâmetros que não pertencem ao tipo são recusados.

# text
seg-3255e99c7265 = tipo

# text
seg-9285a9d699c0 = parâmetros

# text
seg-e83c9db4f9c7 = efeito

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (padrão { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = o C/N0 de cada satélite cai em até <c1/> (dispersão por satélite), os satélites saem primeiro do mais baixo, a solução é perdida quando menos de quatro são utilizáveis e se recupera após a liberação e <c2/>

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, um de <c2/> (verdadeiro) ou <c3/> (em relação ao rumo <b>no início</b>, depois mantido), opcional <c4/>, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = o receptor mantém uma <b>solução válida</b> cuja posição se afasta da verdade; SOG e COG incluem o arrasto. O arrasto segue um smoothstep nas rampas, de modo que a trajetória falsa começa e para sem degrau de velocidade; seus picos são <c1/> m/s e <c2/> m/s ao quadrado para uma rampa de <c3/> s sobre <c4/> m (ambos registrados), e um cenário que excedesse <c5/> é recusado. Um degrau (<c6/>) move a posição sem tocar na velocidade

# text
seg-7da039c3262e = o tempo de RMC, GGA, GNS e ZDA é deslocado do UTC verdadeiro; a posição permanece verdadeira

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (padrão verdadeiro), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = posição, velocidade (e tempo) são as da embarcação de <c1/> atrás, com o atraso seguindo um smoothstep nas suas rampas e a velocidade relatada escalada por <c2/> enquanto ele muda: uma abstração simplificada, no estilo de meaconing, não um modelo de propagação

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: enquanto um arrasto de posição, uma falsificação de tempo ou um atraso de repetição está ativo, todo satélite rastreado mostra esse único nível elevado, um sinal clássico. Deixe-o de fora para um evento sutil em que o padrão genuíno de C/N0 é mantido. Enquanto qualquer evento falsificado está ativo, o receptor segue o sinal falsificado, de modo que o jamming não o derruba; uma solução perdida por jamming anterior volta após <c2/> sobre o sinal falsificado (ver <c3/>). Uma mudança de tempo que faria o tempo relatado parar ou correr para trás (taxa de { "1" } s por segundo ou mais) é recusada, a menos que seja um degrau (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Eventos podem se sobrepor; seus efeitos se somam (deslocamentos, mudanças de tempo, atrasos) ou prevalece o mais forte (jamming). O <c1/> da linha do tempo é a primeira época em que o evento tem efeito, uma época após o <c2/> roteirizado quando o evento entra em rampa.

# text
seg-09e311ade9e6 = O log do instrutor

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Junto com o fluxo, <c1/> e <c2/> trazem:

# text
seg-51930977a6fe = os eventos como injetados, em linguagem simples, com todos os parâmetros, e o seu início em UTC;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = uma linha do tempo: início, efeito pleno, início da recuperação, recuperado, e os próprios <c1/> e <c2/> do receptor;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = a trajetória verdadeira contra a relatada com espaçamento <c1/>: posição verdadeira e relatada, velocidade e rumo, erro de posição em metros, deslocamento de tempo, satélites usados e rastreados, C/N0 médio e quais eventos estavam ativos;

# text
seg-303f5fbe0351 = a velocidade e a aceleração de pico da trajetória verdadeira e da relatada;

# text
# c1: trainer_note
seg-593a4a1ef296 = o <c1/> do cenário.

# text
seg-8c4aebcd0eff = Mostre o log somente no debriefing.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = Campos JSON (esquema <c1/>)

# text
seg-60b5b11cdc0b = tipo, unidade

# text
seg-f4963d090155 = a declaração de uso somente para treinamento

# text
seg-7ad14e03d9e4 = do cenário

# text
seg-fac0fb50b31b = semente usada

# text
seg-f05d18516bd8 = UTC em ISO { "8601" }

# text
seg-8752c09baa6a = início da execução

# text
seg-f0d8bb5aafef = duração da execução

# text
seg-0989e14f1e51 = nós

# text
seg-b657b979a455 = maior velocidade sobre o fundo, verdadeira e relatada

# text
seg-24e947df31ae = m/s ao quadrado

# text
seg-a1ca3847c8d8 = maior variação de velocidade por segundo, verdadeira e entre soluções relatadas consecutivas

# text
seg-e1daadeb7d48 = um por evento roteirizado

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = base 1; usado por <c1/> e <c2/>

# text
seg-6bbb9db14f7b = descrição em linguagem simples com os parâmetros

# text
seg-2f3eac27a997 = início roteirizado

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = o evento exatamente como escrito (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, e os parâmetros próprios do tipo; os ausentes são omitidos)

# text
seg-88db26711d77 = graus verdadeiros ou null

# text
seg-2f30c3d8b17b = arrasto de posição: a direção aplicada (um rumo relativo é resolvido no início)

# text
seg-55d6dd667365 = m/s, m/s ao quadrado ou null

# text
seg-021df000164f = arrasto de posição: picos que o arrasto acrescenta à trajetória falsa

# text
seg-d3a2c65ebcd4 = momentos para o debriefing, em ordem de tempo

# text
seg-b2b72301c1c9 = s desde o início, UTC em ISO { "8601" }

# text
seg-34e24e21ac7e = quando (tempo verdadeiro)

# text
seg-cf29ba5ed968 = inteiro ou null

# text
seg-8dbc5e7239be = o id do evento; null para mudanças de estado do receptor

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (eventos); <c5/>, <c6/> (receptor)

# text
seg-cd7c4057601b = explicação

# text
# c1: log_interval_s
seg-90e65cbe1a59 = uma linha por <c1/>

# text
seg-a57e27a3c470 = s, UTC em ISO { "8601" }

# text
seg-24376fe24496 = posição verdadeira

# text
seg-f23b251a0e33 = nós, graus verdadeiros

# text
seg-242c1f2ccbd3 = velocidade e rumo verdadeiros sobre o fundo, e rumo do girocompasso

# text
seg-696dd61f8bbb = booleano

# text
seg-ea264ef0395c = o receptor relatou uma solução

# text
seg-b073b87a813e = graus, nós, graus verdadeiros ou null

# text
seg-b56345697092 = o que o receptor relatou; null enquanto a solução está perdida

# text
seg-c4a33c03d9da = m ou null

# text
seg-463f6fc42ae5 = distância horizontal da posição verdadeira à relatada

# text
seg-b68dfce8d81d = UTC relatado menos UTC verdadeiro

# text
seg-ec28faa1efcc = inteiros

# text
seg-2bf397f77392 = satélites usados na solução e rastreados

# text
seg-96b87348e90e = dB-Hz ou null

# text
seg-40f30b4a88cf = C/N0 médio dos satélites rastreados

# text
seg-3671c8aa3c1a = ids dos eventos com efeito neste instante

# text
# c1: /2
seg-8401fa92aae1 = Acrescentar um campo não muda a etiqueta do esquema. Renomear ou remover um campo, ou mudar o significado ou a unidade de um campo, incrementa o número (<c1/>).

# text
seg-656ee92a3130 = A biblioteca de cenários

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, cada um com alguns minutos de travessia e uma nota do instrutor no seu TOML:

# text
seg-665b9b46b49b = arquivo

# text
seg-11ed1f85d4be = o que mostra

# text
seg-50ffa85a1128 = o C/N0 cai em conjunto, os satélites saem, a solução é perdida e volta

# text
seg-10bc30b9c57b = uma solução válida, de aparência saudável, arrasta { "1.4" } km em direção à costa; C/N0 uniformemente elevado

# text
seg-f141692988e4 = posição correta, o UTC se adianta { "45" } s durante uma aproximação lenta ao porto

# text
seg-ce06a5ebdd42 = jamming, depois tomada falsificada com arrasto de posição e deslocamento de tempo, depois um atraso de repetição

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = um céu bloqueado, não interferência: as paredes de um fiorde (a predefinição de skyline REPRESENTATIVE <c1/>) escondem os satélites a leste e a oeste, depois o canal se abre de novo (evento <c2/>, com uma tabela <c3/>)

# text
seg-5462f6b21fae = Posições, datas e trajetórias são inventadas; a biblioteca não traz nenhuma embarcação, operador ou gravação reais. Ela não faz nenhuma afirmação sobre como qualquer receptor ou sistema se comportaria diante de interferência.

# text
seg-9831ab537b36 = Escolhas de modelagem

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = O gerador é uma ferramenta de treinamento sem referência independente externa, e seus números são escolhas de modelagem, não medições de nenhum receptor. Eles são escolhidos para parecer um log de receptor comum: a inclinação de C/N0 de { "14" } dB do zênite ao horizonte abaixo do nível do zênite (padrão { "47" } dB-Hz) e o deslocamento por satélite de +/-1.5 dB, desvanecimento lento de { "0.8" } dB ao longo de { "97" } s e { "0.5" } dB ao longo de { "31" } s, jitter de { "0.3" } dB; os limiares de rastreamento ({ "20" } dB-Hz) e de uso ({ "28" } dB-Hz); o ruído de posição ({ "1.5" } m com HDOP { "1" }, correlacionado ao longo de { "30" } s, o vertical o dobro); ruído de girocompasso de { "0.05" } grau e ruído de deriva de { "0.03" } nó; a constante de tempo de governo de { "20" } s e os raios de chegada aos pontos de passagem do modelo da embarcação; e a escolha de satélites por setor de azimute. Os padrões ficam em <c1/> e <c2/> e todos podem ser mudados no cenário.

# text
seg-84913be532a0 = Lendo de volta

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> pode ingerir esses arquivos (<c2/>). Os testes verificam cada sentença de cada cenário da biblioteca contra suas próprias regras de contagem de campos e de checksum, e passam os arquivos por esse leitor, que interpreta GGA, RMC e GSV e deixa passar os demais tipos sem pular nenhum. Os testes fixam um trecho golden por cenário (<c3/>); regenere com <c4/> após uma mudança pretendida.

# text
seg-b94fbc3b1dd3 = <s1>Anterior</s1>Confiança marítima

# text
seg-ecdf748cb63d = <s1>Próximo</s1>Mapa de interferência e exposição de rota

# text
seg-24ad8471ff2a = Campos JSON (esquema kshana-nmea-training/1)
