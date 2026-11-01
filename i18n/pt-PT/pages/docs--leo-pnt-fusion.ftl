# docs--leo-pnt-fusion: translations (pt-PT)

# text
seg-cae10fb9bff8 = Cenário

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-587beeccaa11 = Predefinição

# text
seg-a6c63abeb7e6 = Cenários incluídos

# text
seg-354b42e3a5d0 = RNTF

# text
seg-c5ce76c91ff7 = Etiqueta

# text
# c1: docs/LEO-PNT-FUSION.md
seg-9673ca8c2705 = Fonte: <c1/>

# text
seg-989faf40651b = Posicionamento, navegação e temporização fundidos MEO e LEO

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
seg-c14c586a29e7 = Três tipos de cenário fornecem posicionamento, navegação e temporização (PNT) com satélites em órbita terrestre baixa (LEO) isoladamente ou fundidos com os sistemas globais de navegação por satélite (GNSS) de órbita terrestre média (MEO): <c1/> (posição, velocidade e tempo), <c2/> (posicionamento preciso de ponto) e <c3/> (uma rede não terrestre 5G). Fonte: <c4/>.

# text
# c1: constellation-design
seg-351652fa0e42 = O motor é <b>independente do sistema</b>. Cada constelação é composta por camadas Walker, elementos orbitais explícitos ou uma predefinição GNSS do tipo <c1/>; cada sinal é uma portadora, uma taxa de chips e uma envolvente de densidade de portadora para ruído (C/N0); cada orçamento de erro é um sigma explícito. Os sistemas com nome são <b>predefinições</b> opcionais, um ficheiro cada, e cada capacidade, teste e cenário incluído funciona sem qualquer um deles em particular.

# text
seg-3e7c6608d5c4 = Sistemas e predefinições

# text
# c1: [[system]]
# c2: kshana <file>.toml
seg-1031746214ab = Um cenário lista os seus sistemas como tabelas <c1/>. Este cenário completo junta a constelação da linha de base do GPS a uma camada LEO genérica e executa-se tal como está escrito (<c2/>; o motor { $version } dá uma diluição de precisão de posição mediana de { "2.43" } só com GPS e { "1.17" } fundido, e um erro 3D quadrático médio de { "2.06" } m e { "0.47" } m):

# text
# c1: preset = "gps-baseline"
# c2: galileo
# c3: beidou-meo
# c4: glonass
# c5: leo_preset = "..."
# c6: navsignal::dll_code_jitter_chips
# c7: sigma_pr_m
# c8: sigma_doppler_hz
seg-6168fdca9b54 = <c1/> (o Global Positioning System, GPS; ou <c2/>, <c3/>, <c4/>) adota uma constelação GNSS publicada; <c5/> preenche o que a tabela deixar de fora a partir de uma predefinição LEO. O C/N0 varia linearmente com o seno da elevação, da máscara ao zénite (uma escolha de modelação: uma envolvente de passagem real depende do diagrama da antena de transmissão). O sigma da pseudodistância é o ruído térmico do ciclo de bloqueio de atraso (DLL) do motor (<c6/>) a esse C/N0, combinado com o erro de distância do sinal no espaço (SISRE), salvo se <c7/> o fixar; o sigma da taxa de variação da distância é o comprimento de onda vezes <c8/>. Como o sigma é um dado de entrada, um modelo de sinal separado pode alimentá-lo sem que o código de posicionamento saiba de onde veio.

# text
seg-a3f63252bd1b = O que transporta

# text
seg-9872e31ebd72 = Fontes

# text
seg-e20c823f36f3 = X1 a { "1593.3225" } MHz, { "1.023" } Mchip/s, potência recebida de −{ "148.2" } a −{ "139.1" } dBW; X5 a { "1190.51625" } MHz, { "10.23" } Mchip/s, de −{ "144.9" } a −{ "136.2" } dBW; { "258" } satélites em { "18" } planos a { "1080" } km, { "53" } e { "97" } graus

# text
seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Representativo: a repartição entre as duas inclinações, o faseamento, o erro de distância

# text
seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satélites, seis planos quase polares a { "780" } km e { "86.4" } graus; rajadas de { "1616" } a { "1626" } MHz, modulação por desvio de fase em quadratura (QPSK) a { "25 000" } símbolos/s; potência recebida de { "300" } a { "2400" } vezes o mínimo do GPS

# text
seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>constelação</a3>. DERIVED: a potência em dBW. Representativo: portadora no centro da banda, erro de distância

# text
seg-36771f73c21f = Apenas Doppler: { "11.325" } GHz, baliza de multiplexagem por divisão de frequências ortogonais (OFDM) de { "240" } MHz, C/N0 até { "57.07" } dB-Hz, erro de Doppler de { "30" } Hz; primeira camada de { "1584" } satélites a { "550" } km e { "53" } graus

# text
seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim e Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Representativo: faseamento, C/N0 no horizonte

# text
seg-2e13de07f9e9 = Modulação por desvio de fase binária (BPSK) a { "2.046" } Mchip/s perto de L1 e L5; determinação de órbita centimétrica

# text
seg-dd94a3839cb3 = PUBLIC: <a1>avaliação inicial</a1>, <a2>GPS Solutions</a2>. Representativo: portadoras, potência, toda a constelação operacional

# text
seg-a34d6a186a36 = Um sistema de banda C na atribuição do serviço de satélite de radionavegação (RNSS) de { "5010" } a { "5030" } MHz, para sistemas cujos parâmetros não são públicos

# text
seg-7712896ff69a = PUBLIC: a atribuição do <a1>Regulamento das Radiocomunicações da União Internacional das Telecomunicações (UIT)</a1>. Tudo o resto <b>representativo</b>

# text
seg-89ebc32469d9 = Um modelo de efemérides e relógio: efemérides polinomiais de sexta ordem, renovação a { "30" } s, relógio controlado para o tempo GNSS; SISRE { "0.26" } m

# text
# c1: ephemeris_preset
seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. DERIVED: o SISRE. Combina-se com qualquer constelação através de <c1/>

# text
seg-6389c92e07d4 = Demonstração em órbita (IOD) Celeste da Agência Espacial Europeia (ESA), uma configuração de um projeto de sinal parametrizado

# text
seg-b8bd6e76aeb2 = Órbita PUBLIC (<a1>ESA</a1>, <a2>resumo { "16907" } do Institute of Navigation (ION)</a2>); parâmetros de sinal WORKSHOP, apresentados no workshop LEO-PNT do Navigation Innovation and Support Programme (NAVISP) da ESA, { "2026" }

# text
# c1: fusion
# c2: src/celeste_iod.rs
# c3: scenarios/celeste-iod-fused-pvt.toml
# c4: tests/workshop_preset_isolation.rs
# c5: src/celeste_iod.rs
# c6: build.rs
# c7: scenarios/*celeste-iod*.toml
seg-bd7fb6eb444a = Todos os números derivados do workshop encontram-se no módulo <c1/> de <c2/>, usado por <c3/> (<c4/> impõe onde podem aparecer). Como a predefinição é retida: todos os números do motor derivados do workshop encontram-se num único ficheiro, <c5/>, que <c6/> só compila quando ele existe, e nos cenários exclusivos do repositório <c7/>. Eliminar esse ficheiro e esses cenários retém a predefinição sem qualquer edição de código; todos os outros testes, referências independentes e cenários funcionam sem ela, e a contagem de ficheiros de cenário do README continua a contar os ficheiros retidos.

# text
# c1: mode = "doppler" | "joint" | "polar" | "timing"
seg-12cdcc633ae0 = Um tipo, quatro modos (<c1/>).

# text
# c1: f_D
# c2: λ
# c3: ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ
# c4: u
# c5: ḋ
# c6: ∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ
# c7: doppler_only = true
# c8: starlink-sop
seg-72b5d8cc82ea = <b>Doppler.</b> Um recetor que mede o Doppler <c1/> ao comprimento de onda <c2/> observa a taxa de variação da distância <c3/>, sendo <c4/> a linha de visada e <c5/> a deriva do relógio do recetor. Um ajuste de Gauss-Newton em lote resolve a posição, a deriva e, opcionalmente, uma velocidade constante, com derivadas parciais analíticas <c6/>: apenas a velocidade do satélite transversal à linha de visada transporta informação de posição, pelo que a geometria é o modo como as linhas de visada rodam durante a janela. O relatório dá o erro em função da duração da janela, a envolvente de Doppler, de taxa de Doppler e de variação da taxa de cada sistema, e uma tabela de passagem única. Uma passagem localiza o utilizador ao longo da trajetória (o instante de Doppler nulo) e transversalmente a ela (a inclinação da curva de Doppler); o erro transversal cresce sem limite à medida que a passagem se aproxima do zénite, e a imagem especular em relação à projeção da trajetória no solo ajusta-se quase igualmente bem (só a rotação da Terra as separa). Um sistema só com Doppler (<c7/>, a predefinição <c8/>) funciona neste modo.

# text
seg-007d143c7fb4 = <b>Conjunto.</b> Em cada época, mínimos quadrados ponderados sobre as pseudodistâncias só dos sistemas GNSS, só dos sistemas LEO e de todos eles, um relógio de recetor por sistema (o enviesamento entre sistemas, ISB, é estimado) ou um desvio de difusão conhecido na escala de tempo de referência. Indica a diluição de precisão geométrica, de posição, horizontal, vertical e de tempo (GDOP, PDOP, HDOP, VDOP, TDOP), os erros, os enviesamentos estimados e o DOP em função do número de satélites LEO acrescentados à geometria GNSS.

# text
seg-22f136a0c96f = <b>Polar.</b> Satélites à vista, DOP mediano e disponibilidade em função da latitude para GNSS MEO, LEO e ambos.

# text
# c1: slot-timing
# c2: Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))
seg-1034557258d1 = <b>Temporização.</b> Numa posição conhecida, cada pseudodistância LEO é uma medição de relógio. O recetor executa um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o ruído de frequência branco e de passeio aleatório da classe do oscilador (o <c1/> e os modelos de relógio), mantém o tempo entre passagens e converte o tempo do sistema em Tempo Universal Coordenado (UTC) com a expressão <c2/> do IS-GPS-200; a incerteza do desvio de difusão é um enviesamento por execução.

# text
seg-0d76fcc05e7d = Um filtro de Kalman estendido (EKF) de posicionamento preciso de ponto (PPP) de ambiguidade flutuante sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de recetor branco, um enviesamento entre sistemas por cada sistema adicional, um atraso zenital húmido de passeio aleatório e uma ambiguidade flutuante por arco de satélite. O erro de órbita e relógio precisos é comum ao código e à fase de um satélite, pelo que cada satélite é uma atualização correlacionada de duas linhas, numa forma estabilizada de Joseph que mantém a covariância definida positiva ao longo de milhares de atualizações de fase de nível milimétrico. As medições são simuladas a partir do mesmo modelo, pelo que o erro de estimação normalizado ao quadrado (NEES) da posição tem de seguir uma lei do qui-quadrado com três graus de liberdade; o teste verifica-o sobre sementes de Monte Carlo. A convergência é a primeira época a partir da qual os erros horizontal e vertical permanecem abaixo dos limiares ({ "10" } cm) até ao fim da execução.

# text
seg-630384148ec7 = Um satélite LEO atravessa o céu em cerca de dez minutos, um satélite MEO move-se alguns graus, pelo que os arcos LEO separam as ambiguidades da posição muito mais cedo.

# text
# c1: c / (2π β sqrt(2 (C/N0) T))
# c2: β
# c3: B/√12
# c4: sqrt(3 / (2π² (C/N0) T³))
seg-17f9cf9cc24d = Uma ligação descendente de rede não terrestre (NTN) 5G na banda S do serviço móvel por satélite (MSS), banda n256 do 3rd Generation Partnership Project (3GPP) ({ "2170" } a { "2200" } MHz). O limite de Cramér-Rao (CRB) do tempo de chegada é <c1/>, sendo <c2/> a largura de banda quadrática média (de Gabor) (<c3/> para um espetro OFDM plano), e o da frequência de um tom é <c4/>. O tipo compara canais (por predefinição um canal New Radio de { "5" } MHz e um canal de banda estreita de { "200" } kHz) através de soluções de tempo de chegada na ligação descendente com um relógio de recetor desconhecido e de uma solução Doppler de um só satélite ao longo de uma passagem.

# text
seg-516afd013d38 = Tipo, modo

# text
seg-529a5aeea10a = O que mostra (com semente, determinístico)

# text
# c1: leo-pvt
seg-6cd0b721006a = <c1/>, doppler

# text
seg-c3c51264f12a = Camada Xona Pulsar X1 ({ "258" } satélites), ruído de Doppler de { "1" } Hz: erro 3D de { "7.5" } m após dez minutos ({ "26" } satélites); numa única passagem, o sigma transversal é de { "303" } m quando a passagem é quase sobre o zénite ({ "25" } km fora da trajetória) face a { "43" } m a { "250" } km fora da trajetória

# text
seg-da85037a6691 = Sinais de oportunidade só com Doppler, erro de Doppler de { "30" } Hz a { "10" } Hz: sigma horizontal formal de cerca de { "10" } m após { "20" } s com { "12" } satélites e { "6" } m após { "60" } s

# text
# c1: leo-pvt
seg-4dbb00da5310 = <c1/>, joint

# text
seg-553e8f4df276 = GPS e Galileo PDOP mediano { "1.47" } e erro 3D quadrático médio (RMS) { "1.06" } m; Xona X5 isolado { "1.73" } e { "0.49" } m; fundido { "1.06" } e { "0.41" } m; o enviesamento LEO de { "40" } ns ({ "11.99" } m) estimado como { "12.06" } m

# text
seg-83378a120e0d = Convergência de { "7.4" } min (só GNSS MEO), { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO

# text
seg-4aadc3b41822 = Limite de distância de { "0.26" } a { "1.03" } m para { "4.5" } MHz e de { "6.5" } a { "26" } m para { "180" } kHz; soluções de posição perto de { "2" } m face a { "26" } m

# text
# c1: leo-pvt
seg-5b1019210ca7 = <c1/>, polar

# text
seg-108488f6cc6c = GPS e Galileo VDOP { "1.20" } no equador, { "1.51" } a { "89.9" } graus; com Iridium { "1.14" } no polo

# text
# c1: leo-pvt
seg-bcdbe0796127 = <c1/>, timing

# text
seg-94ab83c05f50 = Transferência de tempo Iridium ao longo de { "6" } horas em Boulder: { "9.9" } a { "11.4" } ns RMS com C/N0 nominal em quatro classes de oscilador, { "15.1" } a { "25.0" } ns com { "30" } dB a menos

# text
# c1: celeste-iod-fused-pvt
seg-3007f5930dfd = <c1/> (opcional)

# text
seg-f6ff187a00aa = GNSS reforçado pelos dois satélites IOD na escala de tempo de referência (exclusivo do repositório, retido com a predefinição)

# text
# c1: leo-pvt
# c2: leo-focus-fused-pnt-sisre
# c3: leo-vertical-autonomous-vehicle
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-critical-infrastructure-timing
# c6: leo-vertical-5g-network-timing
# c7: leo-ppp
# c8: leo-focus-ppp-altitude
# c9: ntn-positioning
# c10: leo-focus-ntn-bandwidth
# c11: leo-pvt
# c12: leo-ppp
# c13: leo-pnt-chain
seg-98710204278b = Os tipos também funcionam dentro de outros cenários: <c1/> é membro da varredura <c2/> e das campanhas <c3/>, <c4/>, <c5/> e <c6/>; <c7/> da varredura <c8/>; <c9/> da varredura <c10/>; e <c11/> e <c12/> são as fases de solução fundida e de PPP do tipo <c13/>. Os seus resultados estão em <a1>LEO-PNT.md</a1>.

# text
seg-2f3086178d0b = Valores e etiquetas publicados

# text
seg-8980b5ae869b = Valor

# text
seg-0be9b5747c00 = Kshana

# text
seg-3d2d01038419 = Doppler Iridium até ±{ "36" } kHz

# text
seg-a88258961299 = { "35.9" } kHz, o máximo ao longo de um dia de passagens, a menos de { "5" }%

# text
# c1: tests/leo_doppler_reference.rs
seg-5bc3150b53f6 = VALIDATED (<c1/>)

# text
seg-35a3ec8ee073 = Doppler máximo Xona Pulsar X1 de { "32" } a { "34" } kHz

# text
seg-499acd31a8f8 = arXiv:{ "2509.19551" }

# text
seg-e8c9c880a3eb = { "33.6" } kHz de um satélite de cada camada publicada ({ "1080" } km, { "53" } e { "97" } graus), dentro do intervalo sem alargamento; só a camada de { "53" } graus atinge o pico de { "31.8" } kHz, uma vez que a rotação da Terra abranda uma órbita progressiva relativamente ao solo

# text
seg-e12713d5019f = VALIDATED (mesmo teste)

# text
seg-370ca62e7fc7 = Variação da taxa de Doppler Xona Pulsar X1 ±{ "1.26" } Hz/s²

# text
seg-4de9b0895288 = cerca de { "1.0" } Hz/s² numa passagem sobre o zénite

# text
seg-5019322f4669 = indicado, não validado

# text
seg-7fcb83027ff4 = Convergência PPP { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min com 60/96/192/288 LEO

# text
seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

# text
seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monótono

# text
seg-0a1133c16dce = Coerência MODELLED da tendência (constelações, ruído e estações não reproduzidos)

# text
seg-7c5292729f36 = Starlink cerca de { "2" } m em { "20" } s com três satélites

# text
seg-6a54a7c58ade = Kozhaya, Saroufim e Kassas { "2025" }

# text
seg-13fc5fc4f69f = sigma horizontal formal de cerca de { "10" } m após { "20" } s com { "12" } satélites, com efemérides perfeitas e todo o erro num sigma de Doppler de { "30" } Hz a { "10" } Hz

# text
seg-4fc80a02ed6c = Comparação MODELLED (recetor e taxa de medição não reproduzidos)

# text
seg-5d0ae24eb74c = Temporização Iridium abaixo de { "40" } ns de UTC(NIST)

# text
seg-fa4467605bc4 = NIST

# text
seg-b910bf5135dd = cerca de { "10" } ns RMS modelado

# text
seg-9025f3c376c5 = Comparação MODELLED

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-4434b0ff1caa = Tudo o resto é MODELLED, com a sua justificação na matriz de verificação (<c1/>): o DOP é verificado face a um caso de quatro satélites derivado à mão, as soluções de posição face à sua covariância, o modelo de Doppler face à identidade da aceleração da distância, o filtro PPP face à banda do NEES do qui-quadrado e os limites face à quadratura.

# text
seg-aa5482ac34ff = Limites, indicados com clareza

# text
seg-0b4564367dcd = Órbitas de dois corpos com a deriva secular de J2, o segundo harmónico zonal da Terra; sem erro de ajuste de efemérides difundidas para além do sigma do SISRE, sem diagrama de antena do satélite.

# text
# c1: leo-pvt
seg-b51ccfee4ab8 = Sem atraso ionosférico nem troposférico em <c1/> (o filtro PPP inclui um estado de atraso húmido; a sua combinação livre de ionosfera remove a ionosfera de primeira ordem), sem cintilação, multipercurso, saltos de ciclo nem resolução de ambiguidades inteiras.

# text
seg-a719ccac19c0 = A exatidão da NTN é um limite, não um resultado alcançado.

# text
seg-19ba6cc0ca75 = Os valores de predefinição marcados como representativos são ilustrativos e não descrevem o projeto de nenhum operador.

# text
seg-f9f335d67ff8 = <s1>Anterior</s1>Mensagem de navegação LEO

# text
seg-062138bbb73c = <s1>Seguinte</s1>Projeto de constelações
