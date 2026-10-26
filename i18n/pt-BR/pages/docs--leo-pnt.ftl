# docs--leo-pnt: translations (pt-BR)

# text
seg-46c7e6f003dd = Sistema

# text
seg-cae10fb9bff8 = Cenário

# text
seg-f1f903f1b9ff = Resiliência

# text
seg-1759a8cce7d6 = Tipos de cenário

# text
seg-71aee5eb55c5 = UHF

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-587beeccaa11 = Predefinição

# text
seg-e305279d5b11 = Conteúdo

# text
seg-b03d56f501c3 = Tipo

# text
seg-6752521002b2 = Parte

# text
seg-cf6ae60eea4f = Auxiliares

# text
seg-0bdbdd2c923b = Sincronização

# text
seg-b09dc4b322d3 = Efemérides

# text
seg-3a835a49b43f = Outros serviços

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
seg-c5ce76c91ff7 = Rótulo

# text
seg-c1020ac47091 = O que uma execução calcula

# text
seg-f708914fed48 = Bandas

# text
seg-486f17197d4d = REPRESENTATIVE, para sistemas de banda C cujos parâmetros não são públicos (por exemplo, a TrustPoint)

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (opcional)

# text
seg-fde146239f5d = Resultado de uma execução

# text
seg-a3f63252bd1b = O que ela transporta

# text
# c1: docs/LEO-PNT.md
seg-7d2c6fbf95b7 = Fonte: <c1/>

# text
seg-6f1f29597f4b = LEO-PNT no Kshana

# text
seg-2a3a1f19005a = LEO-PNT é posicionamento, navegação e temporização (PNT) a partir de satélites em órbita terrestre baixa (LEO), junto com ou no lugar dos sistemas globais de navegação por satélite (GNSS) de órbita terrestre média (MEO), como o Global Positioning System (GPS) e o Galileo. Esta página reúne todos os tipos de cenário e cenários LEO-PNT do mecanismo: o que cada um calcula, as bandas e predefinições de sinal e de onde vêm seus números, o que a mensagem de navegação transporta, o que é VALIDATED e o que é MODELLED, e como executar cada cenário. As páginas dos tipos de cenário aprofundam:

# text
seg-8e3556046e63 = Página

# text
# c1: leo-signal
# c2: spectrum
seg-cdb06a47be0a = <c1/> (projetos de sinal) e os painéis multibanda de <c2/>

# text
# c1: leo-pass
seg-09894e033033 = <c1/> (geometria da passagem e orçamento de enlace por banda, soluções de baixa energia, sondagem da ionosfera, monitores de spoofing)

# text
# c1: leo-navmsg
seg-f19c0bfe2996 = <c1/> (a mensagem de transmissão: ajustador, algoritmo do usuário, formatos binário e de texto)

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (posicionamento fundido, posicionamento por ponto preciso, posicionamento por rede não terrestre (NTN) 5G, temporização, cobertura polar)

# text
# c1: spectrum
seg-29013ad5656c = <c1/> (cascatas de jamming e a razão interferência-sinal (J/S) por banda)

# text
# c1: campaign
seg-d291250b5d01 = <c1/> (cadeias, varreduras, Monte Carlo e composições de quaisquer tipos de cenário)

# text
seg-8d2de8f77619 = Primeiro, agnóstico quanto ao sistema

# text
seg-f3750a8f2863 = O mecanismo é um simulador LEO-PNT genérico. Qualquer constelação (um padrão Walker, elementos orbitais explícitos, um conjunto de elementos de duas linhas (TLE) por meio do propagador Simplified General Perturbations { "4" } (SGP4), ou uma passagem única projetada), qualquer projeto de sinal (qualquer banda, qualquer mistura de componentes de modulação por chaveamento de fase binário (BPSK), portadora de deslocamento binário (BOC) e acesso múltiplo por divisão de frequência (FDMA)), qualquer modelo de mensagem de navegação. Os sistemas nomeados são predefinições opcionais: arquivos de dados, cada um com sua fonte, que preenchem apenas o que um cenário deixa de fora. Todo recurso, teste, referência independente e cenário incluído funciona sem nenhum dado do Celeste presente.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: scenarios/*celeste-iod*.toml
# c4: tests/workshop_preset_isolation.rs
seg-4d3bd0301e59 = A predefinição Celeste IOD (demonstração em órbita) é uma predefinição opcional entre elas. Seus parâmetros de sinal foram apresentados no workshop LEO-PNT do NAVISP da ESA (Programa de Inovação e Apoio à Navegação da Agência Espacial Europeia), { "2026" }, e ainda não têm fonte pública. Todo número derivado do workshop no mecanismo fica em um único arquivo, <a1><c1/></a1>, que <c2/> compila somente quando ele existe, e nos cenários exclusivos do repositório <c3/>. Excluir esse arquivo e esses cenários retém a predefinição sem edição de código-fonte; todos os outros testes, referências independentes e cenários funcionam sem ela (<c4/> vigia quais arquivos podem nomeá-la). Esta página não dá nenhum de seus números.

# text
seg-5b348102cb63 = Os tipos de cenário e como se conectam

# text
seg-120b9be05fc3 = a densidade espectral de potência (PSD) limitada em banda de um projeto de sinal, potência na banda, largura de banda (de Gabor) de raiz do valor quadrático médio, jitter de rastreamento de código contra a densidade de portadora para ruído (C/N0), busca de aquisição e coeficientes de separação espectral (SSC) contra sinais GNSS; um compromisso de bandas (frequência ultra-alta (UHF), L, S, C)

# text
seg-d9febf3c74c8 = formas fechadas VALIDATED, projetos e compromisso MODELLED

# text
# c1: spectrum
seg-d0d8d1edd9ee = <c1/> (painéis multibanda)

# text
seg-dc3ceb315e9a = cascatas por banda com jammers por banda (onda contínua (CW), chirp, banda estreita, banda larga, casado), o J/S de cada sinal e o C/N0 efetivo ao longo de uma linha do tempo

# text
seg-126a14392994 = espectros VALIDATED, jammers MODELLED

# text
seg-e63f73ab5bca = geometria da passagem, Doppler e taxa de Doppler, perda em espaço livre, antenas do satélite e do usuário, perdas gasosa, por chuva, por cintilação e de entrada em edificação da ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 por banda e época ao lado das portadoras GNSS MEO; ionosfera por banda e os pares livres de ionosfera; soluções de baixa energia; sondagem da ionosfera; monitores de spoofing

# text
seg-a9fd4162604f = componentes VALIDATED, passagem MODELLED

# text
seg-91304e663174 = a mensagem de efemérides e relógio de transmissão: ajustador, erro de distância no sinal no espaço (SISRE) contra o intervalo de ajuste e o período de atualização, continuidade da atualização no meio da passagem, algoritmo do usuário, quadro binário com verificação de redundância cíclica de 24 bits (CRC-24Q), exportações em estilo RINEX { "4" } (Receiver Independent Exchange Format) e como valores separados por vírgula (CSV)

# text
seg-cf93a9ba065c = algoritmo do usuário, pesos e CRC VALIDATED, ajustes MODELLED

# text
seg-3084696ad387 = posicionamento por Doppler, soluções conjuntas de pseudodistância GNSS + LEO com vieses entre sistemas, geometria polar e do Ártico, transferência de tempo para o Tempo Universal Coordenado (UTC), com um traço opcional do erro de tempo por época

# text
seg-79117194e50b = Doppler máximo VALIDATED, o restante MODELLED

# text
seg-1de31fd3cf86 = convergência do posicionamento por ponto preciso (PPP) somente com GNSS e com camadas LEO

# text
seg-525733c10d9b = acurácia de posicionamento NTN 5G a partir da largura de banda do enlace de descida (limite de Cramér-Rao)

# text
seg-cb8eee06e664 = um sistema de ponta a ponta: projeto de sinal, passagem, mensagem, solução fundida e PPP, com cada transferência listada

# text
seg-d28e18170f82 = qualquer um dos anteriores encadeado em uma linha do tempo, varrido, executado como um conjunto de Monte Carlo ou composto sob condições compartilhadas

# text
seg-5479654fabfd = A cadeia transfere valores no código (veja <a1>Cadeia LEO-PNT de ponta a ponta</a1> abaixo): o projeto de sinal define a divisão do EIRP (potência isotrópica radiada equivalente) da banda da passagem e a taxa de chips rastreada; a passagem fornece o C/N0 rastreado e o jitter de código; o SISRE da mensagem de navegação e o C/N0 da passagem ponderam as medições LEO da solução fundida.

# text
# c1: data/leo-signals/generic-bands.toml
# c2: generic-c-band.toml
seg-a0331a21413c = Os projetos genéricos usam centros de banda públicos; cada um é REPRESENTATIVE, não o sinal de nenhum sistema (<c1/>, <c2/>).

# text
seg-a86ce24d81de = Banda

# text
seg-daf61ebdca17 = Alocação

# text
seg-ba6fbebc2a98 = Projeto genérico

# text
seg-3332ae549a90 = Centro

# text
seg-c7be6f6797a8 = Largura de banda de transmissão

# text
seg-74f4e80c65cb = Componentes

# text
seg-e95de3591152 = Atraso ionosférico de primeira ordem em relação a L

# attr:title
seg-e769f0411e64 = Retirada pelo seu editor; sem cópia arquivada

# text
seg-8b04e51a023e = não é uma alocação de radionavegação (representativo); portadora da <s1>pesquisa openRECEIVER</s1> pública (página retirada desde então; veja <a1>LEO-SIGNAL.md</a1>)

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-8a3026904912 = { "10" } MHz

# text
seg-e1500e8695b9 = BPSK({ "5" }) piloto e dados

# text
seg-ac33d89291ca = serviço de satélites de radionavegação (RNSS), o centro do Galileo E5

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-54e10c07ace3 = BPSK({ "10" }) piloto e dados

# text
seg-5e28b8377751 = serviço de satélites de radiodeterminação (RDSS), a portadora S do NavIC (Navigation with Indian Constellation)

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-a573432714b8 = { "16.5" } MHz

# text
seg-6fe14d537f33 = RNSS, centro da alocação de { "5010" }–{ "5030" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-0b50907d3165 = { "20" } MHz

# text
seg-c43105d1c770 = C estendida

# text
seg-c05714081a0e = fora da alocação RNSS (representativo)

# text
seg-638ab0837b29 = { "5100" } MHz

# text
seg-4d3857271629 = { "120" } MHz

# text
seg-18bc5451fc46 = BPSK({ "50" }) piloto e dados

# text
seg-3714e1c00ab8 = S (serviço móvel por satélite, MSS)

# text
seg-cc26934bac14 = enlace de descida MSS, banda n256 do 3GPP (Third Generation Partnership Project)

# text
# c1: ntn-positioning
seg-12ca7304ece7 = usada por <c1/>

# text
seg-896b6ee57728 = { "2172.5" } MHz

# text
seg-e6e1d955489a = { "0.18" } a { "20" } MHz

# text
seg-50e44c7042c9 = sinais de posicionamento 5G New Radio

# text
# c1: (f_L/f)²
# c2: f_L
# c3: 20·log10(f/f_L)
seg-e75e48eeeca1 = BPSK(n) é modulação por chaveamento de fase binário a n × { "1.023" } Mchip/s. A razão de atraso é <c1/> com <c2/> = { "1191.795" } MHz. A perda em espaço livre cresce em <c3/> à mesma distância (−{ "8.2" } dB em UHF, +{ "6.4" } dB em S, +{ "12.5" } dB em C).

# text
seg-02f71b44edf5 = Predefinições de sinal e de sistema

# text
seg-c60ce9c32b57 = REPRESENTATIVE, centros de banda do Regulamento de Radiocomunicações da UIT

# text
# c1: generic-bands
# c2: generic-leo
# c3: leo-pass
seg-58fae66f7c12 = <c1/> (projetos de sinal): a tabela de bandas acima; <c2/> (o padrão de <c3/>): UHF a { "450" } MHz, L, S e C nos centros acima, EIRP de { "0" } dBW por banda, uma camada Walker 240/12/1 heliossíncrona a { "550" } km

# text
seg-5d918965c00c = BPSK({ "10" }) a { "5020" } MHz, feixe de isofluxo

# text
seg-dddb031a7e2e = PUBLIC: Leclère, Marathe e Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

# text
seg-67fc4039084d = X1 a { "1593.3225" } MHz ({ "1.023" } Mchip/s) e X5 a { "1190.51625" } MHz ({ "10.23" } Mchip/s), as potências recebidas mínima e máxima publicadas, { "258" } satélites a cerca de { "1080" } km (camadas de { "53" } e { "97" } graus)

# text
seg-f17f98d1ae0b = PUBLIC: <a1>apresentação da Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
# c1: leo-pass
seg-c6694cdbb02b = rajadas em { "1616" }–{ "1626" } MHz, Doppler de até ±{ "36" } kHz, { "66" } satélites a { "780" } km ({ "781" } km na predefinição <c1/>), potência recebida de "{ "300" } a { "2400" } vezes o GPS"

# text
# c1: starlink-soo
# c2: starlink-soop
# c3: starlink-sop
seg-704ec002a889 = <c1/> / <c2/> / <c3/> (tipos de cenário de sinal, de passagem e de posicionamento)

# text
seg-a4a3a7c7bc22 = valores de sinal PUBLIC: Kozhaya, Saroufim e Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; órbita REPRESENTATIVE

# text
seg-49985bf11216 = uma baliza em banda Ku de { "240" } MHz usada apenas para Doppler, C/N0 de cerca de { "57" } dB-Hz

# text
seg-84cb50b019e0 = estrutura de sinal PUBLIC: <a1>PMC10301026</a1>; órbita e potência REPRESENTATIVE

# text
seg-1c50faed9f1e = BPSK a { "2.046" } Mchip/s perto de L1 e L5

# text
# c1: atomic-zero-clock
# c2: atomic
seg-c72e9b87f116 = <c1/> (<c2/> no tipo de cenário de mensagem)

# text
seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, carga útil ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

# text
seg-4f0cff24b4fd = efemérides polinomiais de 6ª ordem sem termos de relógio (o relógio é direcionado ao tempo GNSS)

# text
seg-9d1e7aebcd84 = WORKSHOP: apresentado no workshop LEO-PNT do NAVISP da ESA, { "2026" }

# text
seg-28c2e7ae6065 = a configuração de sinal nº 1 e o layout de mensagem da demonstração em órbita, no único arquivo que pode ser retido

# text
seg-9f0d16f43993 = Cada predefinição marca seus números como PUBLIC (com uma URL), REPRESENTATIVE (uma escolha de projeto documentada, nunca uma afirmação sobre um sistema real) ou WORKSHOP, e o resultado de cada execução que usa uma delas diz qual.

# text
seg-556fe9c6c3b1 = A mensagem de navegação

# text
seg-a220662ed8de = Uma mensagem de navegação LEO (<a1>LEO-NAVMSG.md</a1>) transporta quatro partes, a estrutura que o Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) e as propostas LEO publicadas compartilham:

# text
seg-5bda276f6e82 = o conjunto kepleriano de 16 parâmetros do ICD do Galileo (raiz quadrada do semieixo maior, excentricidade, inclinação e sua taxa, ascensão reta do nodo e sua taxa, argumento do perigeu, anomalia média, correção do movimento médio, seis correções harmônicas, tempo de referência), mais polinômios de correção ao longo da trajetória, transversais e radiais; ou o modelo de 22 parâmetros de Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); ou o polinômio de relógio nulo do ATOMIC

# text
seg-8a7dabfece01 = número da semana e tempo da semana (TOW), e um polinômio de relógio de segunda ordem (af0, af1, af2 em torno de toc)

# text
seg-24eaf4ae7eb3 = identificador do veículo espacial (SVID), edição dos dados (IOD), integridade do sinal

# text
seg-e7d819b7a724 = correções ionosféricas para usuários de frequência única (um conjunto em estilo Klobuchar e os ai0–ai2 do NeQuick-G) e o deslocamento do tempo do sistema para o UTC (A0, A1, segundos intercalares e seu cronograma)

# text
seg-200e59d9279c = O quadro binário é a codificação documentada do próprio Kshana, modelada sobre esses componentes, e não o layout de bits de nenhum sistema. O RINEX { "4.02" } não define registros de navegação LEO, de modo que a exportação em estilo RINEX é uma extensão documentada do Kshana (trabalho anterior: <a1>arXiv { "2401.17767" }</a1>).

# text
# c1: campaign
# c2: spectrum
seg-aa18ab84599b = varredura <c1/> de <c2/>

# text
seg-70dc120ea19e = uma barragem de { "50" } MHz a { "1185" } MHz varrida de −{ "140" } a −{ "80" } dBW: o GPS L5 é perdido a −{ "105" } dBW, o Galileo E5a e o sinal LEO em banda L a −{ "100" } dBW; os sinais LEO em UHF, banda S e banda C mantêm { "49.4" }, { "49.2" } e { "47.4" } dB-Hz em qualquer potência

# text
seg-61f05d7e3a18 = uma barragem de { "40" } MHz a { "1185" } MHz subindo { "5" } dB a cada { "10" } s a partir de −{ "125" } dBW: o GPS L5 é perdido a −{ "105" } dBW, o Galileo E5a a −{ "100" } dBW, o Xona X5 (no mínimo publicado, −{ "144.9" } dBW) a −{ "95" } dBW; um sinal LEO genérico a −{ "135" } dBW ainda rastreia a −{ "90" } dBW ({ "28.9" } dB-Hz). A potência recebida compra margem de J/S dB por dB

# text
seg-6a3a46be60a5 = um salto de posição de { "30" } m em um local levantado: o teste de Doppler somente com GNSS nunca o detecta; o teste sobre todos os canais o detecta, { "105" } s após o início (veja <a1>LEO-PASS.md</a1>)

# text
# c1: campaign
# c2: leo-pass
seg-d0c4683d7c93 = composição <c1/> de <c2/>

# text
seg-bf0ec52f63ea = quatro spoofers, os dois monitores: um spoofer somente em banda L e um spoofer de todas as bandas sem ionosfera são pegos pelo monitor entre bandas no início ({ "300" } s) e pelo monitor de Doppler em { "420" } s e { "395" } s; um spoofer de todas as bandas ciente da ionosfera somente pelo monitor de Doppler ({ "395" } s); um empurrão de { "30" } m somente em GNSS por nenhum dos dois

# text
# c1: campaign
# c2: spectrum
# c3: integrity
seg-17bcc4ead2ee = cadeia <c1/> (<c2/>, <c3/>)

# text
seg-d9b6e6fe6807 = GNSS sofrendo jamming por { "15" } minutos (código de aquisição grosseira (C/A) do GPS L1 a cerca de { "10" } dB-Hz, E5a a { "17.4" } dB-Hz contra um piso de { "25" } dB-Hz) enquanto os sinais LEO em banda S e C mantêm { "49.2" } e { "47.4" } dB-Hz; o monitoramento autônomo de integridade pelo receptor (RAIM) somente na camada LEO forma um nível de proteção em cada época, abaixo do limite de alerta vertical de { "50" } m em { "28" } de { "30" } instantes da grade, com o alarme disparado nos outros dois; fases nominal e de recuperação de { "5.4" } a { "15.6" } m

# text
# c1: multi-band-jamming-waterfall
seg-42efdd12fc54 = Os monitores de spoofing, suas estatísticas e seus limites estão em <a1>LEO-PASS.md</a1>. A cascata multibanda com um jammer diferente por banda é <c1/> (<a2>LEO-SIGNAL.md</a2>).

# text
seg-d9e58c4aa8d5 = Um cenário por área de foco de experimento

# text
seg-1ab626f27e9d = As oito áreas de foco de experimento da chamada Celeste IOD para experimentação de terceiros (Open Space Innovation Platform da ESA, OSIP) são perguntas LEO-PNT genéricas; cada uma tem um cenário agnóstico quanto ao sistema:

# text
seg-afc60ca3c9da = Área de foco

# text
seg-8a8f40ce3e40 = Posicionamento de alta acurácia (PPP)

# text
# c1: campaign
# c2: leo-ppp
seg-b5eb3448dbb1 = varredura <c1/> de <c2/>

# text
seg-5692301bc7cf = uma camada de 192 satélites a { "500" }, { "1000" } e { "1500" } km reduz a convergência do PPP multi-GNSS de ambiguidade flutuante em Munique de { "13.0" } min para { "3.25" }, { "3.25" } e { "3.5" } min (seis realizações, épocas de { "30" } s)

# text
seg-3992215bc8c9 = Resiliência de PNT (L, S, C)

# text
seg-a2cc270b415c = veja Resiliência

# text
seg-8a6381ff15ac = Compatibilidade com NTN 5G/6G

# text
# c1: campaign
# c2: ntn-positioning
seg-ae21ac79775f = varredura <c1/> de <c2/>

# text
seg-cb52e7eb3c36 = largura de banda de referência de posicionamento de { "180" } kHz a { "20" } MHz: sigma de distância no zênite de { "6.5" } m a { "5.8" } cm, erro 3D de tempo de chegada de { "30.1" } m a { "2.1" } m, limitado pelo piso do erro de sincronização da rede de { "1" } m

# text
seg-45985b521980 = PNT de baixa energia para a Internet das Coisas (IoT) e dispositivos móveis

# text
# c1: campaign
# c2: leo-pass
# c3: [iot]
seg-9afaaed509ef = varredura <c1/> de <c2/> <c3/>

# text
seg-3bb8cc776a28 = EIRP em UHF de −{ "35" } a +{ "5" } dBW: abaixo de um C/N0 mediano de cerca de { "35" } dB-Hz, a energia por solução em partida a quente sobe de { "18" } mJ para { "55" } J; acima dele, a vida útil da bateria com uma solução por hora é de { "8334" } dias, determinada pela corrente de repouso

# text
seg-4b0890bd9215 = Ciência LEO-PNT

# text
seg-a1ddeda103fa = conteúdo eletrônico total (TEC) oblíquo a partir de cada par de bandas de uma passagem de quatro bandas sobre Tromsø: { "18.85" } unidades de TEC recuperadas por cada par, 1-sigma de { "0.017" } (UHF com L) a { "2.9" } unidades de TEC (S com C)

# text
seg-fc31db33e6fe = Serviços adicionais de dados de PNT

# text
# c1: campaign
# c2: leo-navmsg
seg-91db4e7b4d9c = composição <c1/> de <c2/>

# text
seg-aee8bb27a2fb = o quadro de mensagem do Kshana cresce de { "146" } bytes (efemérides e relógio, { "1045" } bits) para { "154" } com o conjunto de Klobuchar, { "159" } com o NeQuick-G e { "171" } com os parâmetros de UTC

# text
seg-bd6c76037986 = Navegação em ambientes internos (UHF)

# text
seg-0a274a3aeb86 = C/N0 de pico em ambiente interno em uma edificação tradicional: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; em uma termicamente eficiente, UHF { "15.3" } dB-Hz e todas as outras bandas menos

# text
seg-101de8218f35 = PNT fundido MEO + LEO

# text
# c1: campaign
# c2: leo-pvt
seg-b4daa58a2fe7 = varredura <c1/> de <c2/>

# text
seg-903d8dcb96cc = Xona X5 fundido com GPS e Galileo sobre Madri: erro 3D somente com GNSS de { "1.06" } m de raiz do valor quadrático médio (RMS); fundido, { "0.08" } m com um SISRE LEO de { "5" } cm, { "0.57" } m com { "0.5" } m e { "1.01" } m com { "5" } m

# text
seg-ebe7a27275cb = Um cenário por setor de usuário final

# text
# c1: campaign
# c2: leo-pass
seg-7c21d067769a = Cada setor é uma cadeia <c1/> em uma linha do tempo, de modo que anima, e cada um tem um membro <c2/>, de modo que exporta geometria (veja <a1>Execução</a1>).

# text
seg-1d1135625500 = Setor

# text
seg-f1a7e54ea7d0 = Veículos autônomos

# text
seg-3610a5f7c352 = um carro em Munique: via aberta, erro fundido médio de { "0.30" } m; em um cânion urbano de { "35" } graus, GPS e Galileo mantêm { "8" } satélites e um erro médio de { "5.8" } m, a camada LEO genérica acrescenta { "4" } a { "5" } e o leva a { "2.1" } m, ainda acima do limiar de nível de faixa de { "1.5" } m em cerca de metade das épocas do cânion

# text
seg-6622d9c7366d = Ferroviário e marítimo

# text
# c1: maritime-strait-jamming
# c2: rail-tunnel-coast
seg-73ba745cb492 = o navio <c1/> incluído perde todos os satélites GNSS ({ "12.1" } dB-Hz) enquanto sua passagem LEO em banda S e C atinge { "44.2" } e { "38.1" } dB-Hz; o trem <c2/> incluído atinge { "2" } m de erro inercial { "35.8" } s dentro do túnel; a céu aberto, sua passagem LEO dá { "35" } a { "50" } dB-Hz em L

# text
seg-c87973b9139a = Infraestrutura crítica

# text
seg-c16a4c99e132 = um oscilador de classe TCXO (cristal compensado por temperatura) de um servidor de tempo de subestação, em funcionamento livre durante um dia sem GNSS, chega a { "29" } µs, ultrapassando a guarda de { "1" } µs entre { "75" } e { "80" } minutos após a perda (na grade de 5 minutos); a mesma classe disciplinada ao Iridium permanece entre −{ "40" } e +{ "11" } ns

# text
seg-1be8e11b2530 = Usuários polares e do Ártico

# text
seg-660e450cb4ab = diluição de precisão de posição (PDOP) média de GPS + Galileo de { "1.38" }, { "1.57" } e { "1.62" } em Tromsø, Svalbard e no Polo Norte; com o Iridium, { "1.29" }, { "1.34" } e { "1.26" }, a partir de { "3.0" }, { "5.5" } e { "6.8" } satélites Iridium à vista

# text
seg-22d99734acf1 = Redes sem fio 5G/6G

# text
# c1: telecom-timing
seg-abcc6337206f = o oscilador a cristal com controle de forno (OCXO) de uma estação rádio base em holdover cruza o limite de rede de { "1.1" } µs após { "8863" } s e o limite de aplicação final de { "1.5" } µs após { "10006" } s (a análise do tipo de cenário <c1/>); disciplinado ao Xona X5, seu erro de tempo permanece entre −{ "0.7" } e +{ "0.3" } ns durante todo o dia, com um 1-sigma previsto de { "5" } ns, a incerteza declarada do deslocamento UTC transmitido

# text
seg-532d6814ab2d = Rastreamento de ativos e IoT

# text
seg-b4d6d822e1d0 = uma solução a quente em UHF de uma etiqueta de contêiner custa { "18" } mJ no cais e no mar ({ "8334" } dias de bateria com uma solução por hora) e { "34" } mJ em um armazém ({ "5770" } dias), onde a banda L cai para { "20" } a { "24" } dB-Hz

# text
seg-e54b0342fa79 = VALIDATED e MODELLED

# text
seg-dd808d1741f3 = Uma linha é VALIDATED somente quando um teste reproduz uma configuração publicada e fixa o valor publicado dentro de uma tolerância declarada; todo o resto é MODELLED, com sua justificativa (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

# text
seg-592a6cf625c5 = Linhas LEO-PNT VALIDATED:

# text
seg-344712930047 = potência de sinal limitada em banda em forma fechada e jitter de rastreamento de código early-late em pontos de operação publicados (Betz e Kolodziejski { "2009" }), com a largura de banda de Gabor e o SSC verificados de forma cruzada;

# text
seg-e93d5b5d3dda = o Doppler máximo de um satélite de navegação LEO (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) e o envelope de Doppler de usuário estático contra a Tabela { "1" } do arXiv { "2509.19551" };

# text
seg-b02c1b42e509 = coeficientes de chuva da ITU-R P.838-3, atenuação por chuva e cintilação troposférica da P.618-14 e perda de entrada em edificação da P.2109-2 contra os dados de validação do Grupo de Estudos { "3" } da ITU-R;

# text
seg-fc668542b66d = o escalonamento do atraso ionosférico de primeira ordem e a perda em espaço livre (razão de atraso de grupo do IS-GPS-200, a forma de Friis);

# text
seg-59847c667c8b = os pesos globais médios do SISRE (Montenbruck et al. { "2018" }), o algoritmo do usuário do ICD do Galileo contra o RTKLIB em efemérides de transmissão reais e o CRC-24Q contra seu valor de verificação de catálogo.

# text
seg-922761c46f8a = Linhas LEO-PNT MODELLED: todo projeto de sinal e compromisso de bandas, a cascata multibanda, toda passagem e orçamento de enlace como um todo, as predefinições, as soluções de baixa energia, o ajustador e os formatos da mensagem, o posicionamento por Doppler e conjunto, a convergência do PPP, o posicionamento NTN, a transferência de tempo, a cobertura polar, a cadeia de ponta a ponta, os monitores de spoofing e a sondagem da ionosfera, e toda campanha (uma campanha compõe tipos de cenário e não acrescenta física; suas identidades de composição são testadas, <a1>CAMPAIGNS.md</a1>). Nenhum valor de C/N0, de erro de medição de distância ou de posicionamento LEO é comparado com uma medição de qualquer satélite.

# text
seg-3cc1d3f1c0f8 = Executar um cenário

# text
# c1: kshana example <name>
seg-00d5b60c0ebb = Todo cenário acima está incluído: <c1/> o imprime, e

# text
# c1: .result.json
# c2: .chart.svg
# c3: .report.html
# c4: .report.json
# c5: .animation.html
seg-e01ebe977e65 = grava, ao lado do arquivo, o resultado (<c1/>), o gráfico (<c2/>), o relatório avançado (<c3/> e <c4/>, com uma seção que incorpora a execução animada e lista as exportações), o reprodutor interativo (<c5/>) e as exportações. O que se aplica depende do tipo de cenário:

# text
# c1: leo-pass
# c2: spoof.series
# c3: spectrum
# c4: leo-pvt
# c5: leo-ppp
# c6: --animate
# c7: leo-resilience-multiband-diversity
# c8: leo-resilience-spoof-monitors
# c9: leo-focus-*
# c10: leo-focus-science-iono-sounding
# c11: --animate
seg-8a96eda978b4 = uma execução com eixo de tempo anima: épocas de <c1/>, o <c2/> de uma execução de spoofing, linhas do tempo de <c3/>, épocas conjuntas e traços de temporização de <c4/>, curvas de erro de <c5/> e toda cadeia de campanha. Uma varredura ou uma composição não tem eixo de tempo: <c6/> a recusa com status de saída { "1" } e então o comando não grava nada, de modo que as oito varreduras e composições acima (<c7/>, <c8/> e todo cenário <c9/> exceto <c10/>) devem ser executadas sem <c11/>;

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: <name>.<member>.czml
seg-8d26148aeeff = <c1/> e <c2/> exportam efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON e STK (Systems Tool Kit) da geometria da passagem; uma campanha exporta cada membro que tem geometria como seu próprio conjunto de arquivos, com o rótulo do membro no nome do arquivo (<c3/>), de modo que todo setor exporta suas passagens LEO; os demais tipos de cenário LEO declaram por que um formato não se aplica (<a1>INTEROP.md</a1>).

# text
seg-6f3ad057f914 = Os demais cenários LEO, por tipo de cenário (detalhes na página de cada tipo de cenário):

# text
# c1: leo-band-trade
# c2: xona-pulsar-signals
# c3: celeste-iod-classical-pilot-signals
seg-73365a12bf64 = <c1/>, <c2/>, opcional <c3/>

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-pass-xona-pulsar
# c3: leo-pass-iridium
# c4: leo-indoor-uhf
# c5: leo-iot-energy
# c6: leo-pass-celeste-iod-multiband
seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcional <c6/>

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
# c5: leo-navmsg-celeste-iod
seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, opcional <c5/>

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: polar-arctic-leo-coverage
# c5: leo-timing-utc
# c6: celeste-iod-fused-pvt
seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcional <c6/>

# text
# c1: leo-pnt-end-to-end
# c2: xona-pulsar-end-to-end
# c3: celeste-iod-end-to-end
seg-e3017b224dfc = <c1/>, <c2/>, opcional <c3/>

# text
seg-1ada84b384ee = Os cenários opcionais são exclusivos do repositório e são retidos junto com o arquivo da predefinição Celeste.

# text
# c1: leo-pnt-mega-shell
# c2: constellation-design
# c3: slot-timing-ocxo-leo
# c4: slot-timing
seg-6305e46ec778 = Dois deles estão em outros tipos de cenário. <c1/> (<c2/>) dimensiona uma constelação LEO-PNT de 5000 satélites em quatro camadas Walker ilustrativas: disponibilidade de { "99.22" } % com PDOP de { "3" } ou menos acima de uma máscara de { "20" }°, PDOP mediano de { "1.11" } e { "39.4" } satélites à vista em média ao longo de { "648" } pontos de grade e { "12" } épocas. <c3/> (<c4/>) pergunta por quanto tempo o OCXO da folha de dados de um pequeno satélite LEO permanece dentro de uma guarda de slot de { "100" } ns com k = { "3" } após sua última solução GNSS: a guarda se rompe { "650.8" } s após uma solução, de modo que ele precisa de uma solução pelo menos a cada { "645.8" } s ({ "133.8" } por dia), com o ruído de frequência de passeio aleatório como termo dominante.

# text
seg-ee9f20a4485b = Cadeia LEO-PNT de ponta a ponta

# text
# c1: leo-pnt-chain
# c2: src/leo_pnt_chain.rs
seg-a6167db680ba = O tipo de cenário <c1/> (<a1><c2/></a1>) acompanha um sistema LEO-PNT do projeto de sinal até a posição do usuário. Cada etapa é um tipo de cenário próprio do mecanismo, executado em sua própria tabela do cenário da cadeia, e a cadeia transfere valores de uma etapa para a seguinte no código:

# text
seg-38ce4c90dd78 = De

# text
seg-2cbf005ed5cc = Para

# text
seg-5d84d64174b6 = O que é transferido

# text
seg-15372352ab42 = a fração de potência do componente rastreado, a fração na banda e a taxa de chips rastreada (a divisão do EIRP da banda e seu deslocamento de C/N0)

# text
# c1: [navmsg.orbit]
seg-0be525c6b695 = a altitude e a inclinação do satélite da cadeia (a órbita verdadeira da mensagem), a menos que <c1/> as declare

# text
seg-d2306e118be7 = o C/N0 rastreado na máscara de posicionamento e no zênite, a partir de uma reta de mínimos quadrados em sin(elevação) ajustada à passagem

# text
# c1: od_sisre_m
seg-ee40b8cd109b = o erro de distância no sinal no espaço (SISRE): o erro de representação da mensagem (raiz do valor quadrático médio, órbita e relógio) com o termo de determinação de órbita <c1/> do cenário, em raiz da soma dos quadrados

# text
seg-b4b3dff58f3b = a frequência da portadora e a taxa de chips rastreada

# text
# c1: handoffs
# c2: [pass]
# c3: signal = "<design>"
# c4: leo-pass
# c5: leo-signal
seg-4def115dba1b = Um valor é transferido somente onde a tabela a jusante o deixa sem definição, e toda transferência é listada na matriz <c1/> do resultado com seu valor, unidade e destino. Uma banda de <c2/> deve nomear o projeto (<c3/>); é assim que uma banda de <c4/> também carrega por conta própria qualquer projeto <c5/>: ela assume a frequência central, a largura de banda de transmissão e a taxa de chips rastreada do projeto, divide seu EIRP entre os componentes e informa, em cada época, o C/N0 do componente rastreado e o jitter de rastreamento de código early-late coerente limitado em banda (Betz e Kolodziejski { "2009" }; espaçamento de meio chip, laço de { "1" } Hz, { "20" } ms).
