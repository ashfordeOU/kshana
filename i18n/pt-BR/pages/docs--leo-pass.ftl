# docs--leo-pass: translations (pt-BR)

# text
seg-cae10fb9bff8 = Cenário

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-587beeccaa11 = Predefinição

# text
seg-1ff32b87e030 = Satélites

# text
seg-a6c63abeb7e6 = Cenários incluídos

# text
seg-60cd077d82a7 = Modelo

# text
seg-2b0d77219437 = Predefinições

# text
seg-5566e1d71a4f = Órbita

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-c5ce76c91ff7 = Rótulo

# text
# c1: docs/LEO-PASS.md
seg-813d372bda81 = Fonte: <c1/>

# text
# c1: leo-pass
seg-0bd4af67ffdb = Passagem LEO e orçamento de enlace (<c1/>)

# text
# c1: leo-pass
seg-30417c63c48e = LEO-PNT é posicionamento, navegação e temporização (PNT) a partir de satélites em órbita terrestre baixa (LEO). O tipo de cenário <c1/> simula uma ou mais passagens de satélites LEO sobre um usuário e calcula o orçamento de enlace banda a banda, ao lado dos satélites GNSS (sistema global de navegação por satélite) de órbita terrestre média (MEO) à vista. O mecanismo é <b>agnóstico quanto ao sistema</b>: qualquer constelação, qualquer projeto de sinal e qualquer banda, escritos diretamente em um cenário. Os sistemas nomeados são predefinições opcionais, cada uma em seu próprio arquivo, com sua fonte.

# text
# c1: src/leo_pass.rs
# c2: src/leo_link/
seg-242c84daecb0 = Código: <a1><c1/></a1> (o tipo de cenário) e <a2><c2/></a2> (blocos de construção públicos que outros módulos podem chamar).

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-resilience-spoof-doppler
# c7: leo-focus-science-iono-sounding
# c8: leo-pass-celeste-iod-multiband
# c9: leo-resilience-spoof-monitors
# c10: leo-focus-iot-eirp
# c11: leo-focus-indoor-uhf
# c12: leo-vertical-*
# c13: leo-pnt-chain
seg-0e6b09e372f5 = Cenários: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> e o opcional <c8/> (resultados em <a1>Cenários incluídos</a1>). O tipo de cenário também é membro das campanhas <c9/>, <c10/>, <c11/> e de todo cenário <c12/>, e é a etapa de passagem do tipo de cenário <c13/>.

# text
seg-59cebed2f589 = Visão geral de todos os tipos de cenário e cenários LEO-PNT: <a1>LEO-PNT.md</a1>.

# text
# c1: tests/leo_link_reference.rs
# c2: tests/fixtures/leo_link/
seg-9646ce17cddf = Referências independentes: <a1><c1/></a1>, fixtures em <c2/> com suas URLs de origem.

# text
seg-c1020ac47091 = O que uma execução calcula

# text
seg-10dedc607eac = Para cada satélite LEO, banda e época:

# text
seg-35bf9a48e566 = Termo

# text
seg-b0f12ee05fe9 = Elevação, azimute, distância

# text
seg-24ad909c4fb8 = usuário em WGS-84 (World Geodetic System { "1984" }), satélite em um referencial inercial alinhado com o referencial fixo à Terra na época

# text
seg-c9f61c3348ef = calculado

# text
# c1: ρ̇ = d·Δv/ρ
# c2: ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ
seg-ebd800ec3d47 = Taxa de distância <c1/>, aceleração de distância <c2/>

# text
seg-232b42b71f03 = forma fechada; cada execução verifica ambas contra diferenças centrais da distância propagada e informa a maior diferença

# text
seg-b3a55e868346 = forma fechada

# text
# c1: −f·ρ̇/c
# c2: −f·ρ̈/c
seg-3f1f90a57c2f = Doppler <c1/>, taxa de Doppler <c2/>

# text
seg-852b6c351ce4 = primeira ordem, por banda

# text
seg-4eb4b779679b = Perda de percurso em espaço livre

# text
# c1: 20·log10(4πRf/c)
seg-31f67bcd2d50 = Friis, <c1/>

# text
seg-fb5f06a91de1 = EIRP do satélite (potência isotrópica radiada equivalente) e diagrama

# text
# c1: −12(η/θ₃)²
seg-883702244778 = isofluxo até uma elevação de borda, lóbulo principal gaussiano <c1/> dB, ou plano

# text
seg-b6e91c5252d3 = Antena do usuário

# text
# c1: G_z + 10·q·log10(sin el)
seg-ed92a0abf62f = patch <c1/> dBic, hemisférica ou isotrópica

# text
seg-0ac54d232e0a = Atenuação gasosa

# text
seg-30fb5b0a0bc7 = expressões simplificadas do Anexo { "2" } da ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 (substituída pela P.676-13, cujos coeficientes tabulados o mecanismo não possui)

# text
seg-58d58478e9eb = Atenuação por chuva

# text
seg-4c1e413d5fc3 = coeficientes da ITU-R P.838-3 e o procedimento do § { "2.2.1.1" } da P.618-14, a partir de uma taxa de chuva R0.01 e de uma altura de chuva

# text
seg-dab78c0552b6 = Cintilação troposférica

# text
seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; abaixo de { "4" } GHz, uma extrapolação, sinalizada no relatório

# text
seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

# text
seg-32dddfdba584 = Perda de entrada em edificação (usuário em ambiente interno)

# text
seg-ef9025622e81 = ITU-R P.2109-2, tradicional ou termicamente eficiente, na elevação do percurso na fachada

# text
seg-c7d1bccd4d51 = Descasamento de polarização

# text
seg-f4aaea269382 = fator de perda de polarização a partir das razões axiais e dos sentidos, com média sobre a orientação da elipse

# text
seg-96601850a9d5 = Temperatura de ruído do sistema

# text
# c1: 290(10^(NF/10) − 1)
seg-82735c7f3ea5 = piso da antena + emissão do céu do percurso absorvente ({ "275" } K) + cósmico { "2.7" } K + receptor <c1/>

# text
seg-53ce973b0ee7 = C/N0 (densidade de portadora para ruído)

# text
seg-fa01d060cf1a = Atraso de grupo ionosférico

# text
# c1: 40.3·STEC/f²
seg-33f2113dea70 = <c1/>, STEC (conteúdo eletrônico total oblíquo) a partir do modelo de Klobuchar ou de um conteúdo eletrônico total vertical (TEC), escalado pela fração de uma camada de Chapman abaixo do satélite

# text
seg-431dfeb5edba = escalonamento VALIDATED, TEC MODELLED

# text
# c1: √(a₁² + a₂²)
# c2: [iot]
seg-56df31449434 = Por par de bandas: os coeficientes livres de ionosfera, a amplificação de ruído <c1/> e o ruído térmico de código de cada banda e da combinação no pico da passagem. A comparação com o GNSS MEO usa a mesma antena de usuário e o mesmo receptor, com a potência recebida mínima do documento de interface de cada sinal (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Edição { "2.1" } Tabela { "12" }; GPS a partir do IS-GPS-200 e do IS-GPS-705), mais um excesso declarado, escalado pela distância. A seção opcional <c2/> (Internet das Coisas) fornece tempo até a primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência declarado do receptor (MODELLED, cada premissa é uma entrada e consta do relatório).

# text
# c1: orbit = "pass"
seg-7132ede02109 = <c1/> (padrão): uma órbita circular posicionada de modo que o usuário veja uma passagem com uma elevação máxima escolhida em um horário escolhido, ascendente ou descendente, a leste ou a oeste do usuário; a inclinação pode ser heliossíncrona.

# text
# c1: orbit = "elements"
seg-688307acbf0d = <c1/>: elementos keplerianos explícitos.

# text
# c1: orbit = "tle"
seg-e9085739bcb8 = <c1/>: um conjunto de elementos de duas linhas (TLE) por meio do propagador Simplified General Perturbations { "4" } (SGP4) do mecanismo.

# text
# c1: [[leo_constellation]]
# c2: constellation-design
# c3: ConstellationCfg
seg-7dcc5fdbc249 = <c1/>: uma constelação Walker construída pelo código <c2/> (seu <c3/> ou as camadas da predefinição); as passagens mais altas na janela são informadas.

# text
seg-ec7e163dd073 = Bandas e projetos de sinal

# text
# c1: system = "<preset>"
# c2: bands
# c3: [[satellite.band]]
# c4: system = "none"
# c5: [[satellite.band]]
seg-4d49743b3544 = Bandas: <c1/> com um subconjunto opcional <c2/> e entradas <c3/> que acrescentam uma banda ou substituem qualquer campo de uma banda da predefinição. <c4/> com apenas entradas <c5/> não usa nenhuma predefinição.

# text
# c1: leo-signal
# c2: signal = "xona-x5"
# c3: data/leo-signals/
# c4: leo-pnt-chain
# c5: frequency_mhz
# c6: leo-signal
seg-bd1e114aaea6 = Uma banda também pode nomear um projeto <c1/> (<c2/>, qualquer projeto em <c3/>, ou um que o tipo de cenário <c4/> forneça; veja <a1>LEO-SIGNAL.md</a1>). A banda então assume a frequência central do projeto (a menos que <c5/> seja dada), a largura de banda de transmissão e a taxa de chips do componente rastreado, divide seu EIRP entre os componentes do projeto segundo suas frações de potência e informa a cada época o C/N0 do componente rastreado e seu jitter de rastreamento de código early-late limitado em banda (Betz e Kolodziejski { "2009" }, a fórmula do tipo de cenário <c6/>) como o erro de medição de distância.

# text
seg-1d96501bb12d = Cada predefinição marca seus números como PUBLIC (com URL), REPRESENTATIVE (uma escolha de projeto documentada, nunca uma afirmação sobre um sistema real) ou WORKSHOP.

# text
seg-f708914fed48 = Bandas

# text
# c1: generic-leo
seg-6459abcaeebe = <c1/> (padrão)

# text
seg-a0dab2ebeb1b = REPRESENTATIVE; portadoras L, S e C a partir de documentos públicos

# text
seg-cd0075385395 = UHF { "450" } MHz (representativo), L { "1191.795" } MHz (centro do Galileo E5), S { "2492.028" } MHz (NavIC S, a portadora da banda S do Navigation with Indian Constellation), C { "5020" } MHz (centro da alocação RNSS (serviço de satélites de radionavegação) de { "5010" }–{ "5030" } MHz), cada uma com { "0" } dBW

# text
seg-3f0de4312fcb = { "550" } km heliossíncrona, Walker 240/12/1

# text
seg-486f17197d4d = REPRESENTATIVE, para sistemas de banda C cujos parâmetros não são públicos (por exemplo, a TrustPoint)

# text
seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (modulação por chaveamento de fase binário a { "10" } × { "1.023" } Mchip/s), isofluxo

# text
seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> Tabelas { "1" }–{ "2" }

# text
seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP a partir da potência recebida mínima publicada a { "10" }°

# text
seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) e { "97" }° ({ "66" })

# text
seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> e a órbita publicada

# text
seg-c995dade5aa6 = Satellite Time and Location (STL) a { "1621" } MHz (meio de { "1616" }–{ "1626" } MHz); EIRP a partir de "{ "300" } vezes o GPS"

# text
seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } em { "6" } planos

# text
seg-ad0ba129439b = valores de sinal PUBLIC (<a1>NAVIGATION { "72" }({ "1" })</a1>), órbita e EIRP REPRESENTATIVE

# text
seg-1931203a036c = baliza Ku de { "240" } MHz, somente Doppler

# text
seg-0533710bbbe1 = estrutura de sinal PUBLIC (<a1>PMC10301026</a1>), órbita e EIRP REPRESENTATIVE

# text
seg-cee286338f01 = BPSK { "2.046" } Mchip/s perto de L1 e L5

# text
seg-fe3cdce92b31 = { "1000" } km, { "55" }°

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (opcional)

# text
seg-800f173f2b20 = parâmetros de sinal WORKSHOP, órbita PUBLIC

# text
seg-e8626249e708 = sete bandas da configuração nº 1

# text
seg-cb29553176c7 = { "510" } km heliossíncrona

# text
# c1: link
# c2: src/celeste_iod.rs
# c3: scenarios/leo-pass-celeste-iod-multiband.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-10f79909a5bc = <b>A predefinição Celeste IOD (demonstração em órbita) é opcional.</b> Seus parâmetros de sinal foram apresentados no workshop LEO-PNT do Programa de Inovação e Apoio à Navegação (NAVISP) da Agência Espacial Europeia (ESA), { "2026" }, e ainda não têm fonte pública; ficam no módulo <c1/> de <c2/>, usado por <c3/>. Como a predefinição é retida: todo número derivado do workshop no mecanismo fica em um único arquivo, <c4/>, que <c5/> compila somente quando ele existe, e nos cenários exclusivos do repositório <c6/>. Excluir esse arquivo e esses cenários retém a predefinição sem edição de código-fonte; todos os outros testes, referências independentes e cenários funcionam sem ela, e a contagem de arquivos de cenário do README ainda conta os arquivos retidos. Seu EIRP e seu feixe são calibrados para um traço de C/N0 mostrado no workshop, de modo que esse cenário reproduz o traço por construção.

# text
seg-9f9ff4fe18f8 = O modelo de efemérides de transmissão em polinômio "de relógio nulo" do ATOMIC é uma predefinição de mensagem de navegação e não faz parte deste tipo de cenário.

# text
seg-dc496b16046b = A observação LEO versus GNSS

# text
# c1: scenarios/leo-pass-vs-gnss-cn0.toml
seg-6be559b1ac29 = <c1/> reproduz qualitativamente o que as demonstrações LEO-PNT mostram: o C/N0 do LEO sobe e desce em um sino que permanece acima da máscara por { "590" } s e atinge o pico de { "56.8" } dB-Hz, { "8.9" } dB acima da mediana das portadoras GNSS MEO planas (Galileo E1, de { "40.5" } a { "52.0" } dB-Hz, mediana de { "47.8" } dB-Hz). A margem vem da distância, não de um transmissor mais forte: no pico da passagem, o satélite está a { "569" } km, cerca de { "40" } vezes mais perto do que um satélite Galileo no zênite ({ "23 222" } km), o que significa { "32" } dB a menos de perda em espaço livre; a predefinição genérica irradia { "0" } dBW ({ "1" } W).

# text
# c1: kshana scenarios/<name>.toml
seg-08debab7c94a = Cada linha é uma execução de <c1/> (mecanismo { $version }):

# text
seg-9a60f0bf803e = Configuração

# text
seg-fde146239f5d = Resultado de uma execução

# text
# c1: generic-leo
seg-41455a3f15b6 = <c1/> banda L, { "550" } km, passagem de { "80" }° sobre Munique

# text
seg-9d5c154eceb1 = pico em L de { "56.8" } dB-Hz, mediana de { "42.2" } dB-Hz; mediana do Galileo E1 de { "47.8" } dB-Hz

# text
# c1: xona-pulsar
seg-9423b1184fb0 = <c1/>, uma passagem projetada de { "70" }° e quatro satélites em camada inclinada, usuário marítimo

# text
seg-63bf0b8f7f3a = pico de X1 de { "65.6" } dB-Hz e de X5 de { "68.9" } dB-Hz na passagem projetada; maior Doppler de X1 de { "31.4" } kHz

# text
# c1: iridium-stl
seg-8a3383072765 = <c1/>, passagem de { "65" }°, usuário aerotransportado

# text
seg-d2fea8542638 = pico do STL de { "80.5" } dB-Hz, { "34.3" } dB acima da mediana do GPS L1; maior Doppler de { "35.4" } kHz

# text
# c1: generic-leo
seg-d837a8a7648b = <c1/>, usuário em ambiente interno em Roma (edificação tradicional)

# text
seg-4fbead0588d2 = pico em UHF de { "34.1" }, L de { "24.2" }, S de { "16.5" }, C de { "8.5" } dB-Hz; mediana do Galileo E1 de { "22.4" } dB-Hz

# text
# c1: generic-leo
# c2: [iot]
seg-954e16842d59 = <c1/> UHF e L com a seção <c2/>

# text
seg-9aa81f6f4929 = solução a quente de { "0.90" } s e { "18.0" } mJ em todos os sinais; solução a frio em UHF de { "19.0" } s ({ "381" } mJ), em L de { "47.0" } s ({ "939" } mJ), em GPS L1 de { "38.1" } s ({ "762" } mJ)

# text
# c1: generic-leo
seg-97476f9d4212 = <c1/>, quatro bandas, passagem de { "70" }° sobre Tromsø

# text
seg-fd1463da9965 = veja <a1>Sondagem da ionosfera</a1>

# text
seg-1ad5bde12b4f = { "16" } satélites de uma camada genérica de { "1080" } km, L e C, um salto de { "30" } m

# text
seg-25cf36cf0de3 = veja <a1>Monitores de spoofing</a1>

# text
# c1: kshana scenarios/<name>.toml --animate html --export all
# c2: .animation.html
seg-6cdf9830433e = <c1/> também grava o reprodutor interativo (<c2/>, as épocas da passagem) e arquivos de efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON e STK (Systems Tool Kit) da geometria da passagem (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

# text
seg-d3a0fc36329a = Sondagem da ionosfera

# text
# c1: STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))
# c2: geometry_free_stec_tecu
# c3: geometry_free_stec_sigma_tecu
# c4: scenarios/leo-focus-science-iono-sounding.toml
seg-1e64715af2ff = Cada par de bandas também fornece o TEC oblíquo que sua combinação de código livre de geometria recupera no pico da passagem, <c1/>, e o 1-sigma dessa estimativa a partir do ruído de código das duas bandas no pico (<c2/>, <c3/>). A estimativa é igual ao TEC oblíquo do modelo por construção: a combinação é exata em primeira ordem. O sigma é o que faz um plano de bandas ser um sondador melhor ou pior: <c4/> (quatro bandas sobre Tromsø) recupera { "18.85" } unidades de TEC a partir de cada par, com um 1-sigma de { "0.017" } unidades de TEC para UHF com L e de { "2.9" } para S com C. Apenas ruído térmico de código; sem multipercurso nem viés entre frequências. MODELLED.

# text
# c1: [spoofer]
seg-8f59acefb2b3 = Monitores de spoofing (<c1/>)

# text
# c1: [spoofer]
# c2: onset_s
# c3: offset_m
# c4: push_rate_m_s
# c5: push_azimuth_deg
# c6: bands
# c7: gnss = false
# c8: simulate_iono
seg-91941393400a = A seção opcional <c1/> falsifica os sinais que um receptor veria em uma posição alegada. A partir de <c2/>, a posição alegada salta <c3/> e depois se move horizontalmente a <c4/> em direção a <c5/>; a distância e a taxa de distância falsificadas são exatamente as da posição alegada, nas bandas LEO nomeadas em <c6/> (padrão: todas) e no sinal GNSS MEO, a menos que <c7/>. <c8/> diz se as pseudodistâncias falsificadas carregam o atraso ionosférico (as de um transmissor em solo não carregam).

# text
# c1: src/leo_link/spoof.rs
# c2: p_fa
# c3: 1 − p_md
seg-845f6840d92d = O receptor executa dois monitores (<a1><c1/></a1>), cada um com uma probabilidade de falso alarme declarada por época (<c2/>, padrão { "1e-5" }), e declara a detecção na primeira época em que sua probabilidade de detecção atinge <c3/> (padrão { "0.999" }). As probabilidades de detecção são exatas para o ruído gaussiano declarado, avaliadas sobre o resíduo médio sem ruído; nenhum ruído é sorteado.

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-8b34ac584c3d = Estatística

# text
seg-7b158594c4d9 = O que ele vê

# text
seg-89756d80bc29 = Consistência entre Doppler e geometria da passagem

# text
# c1: prior_sigma_m
# c2: prior_velocity_sigma_m_s
# c3: window_s
# c4: drift_sigma_m_s
seg-2174c7725e48 = taxas de distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes (<c1/>, <c2/>); um qui-quadrado de mínimos quadrados generalizados sobre uma janela de <c3/> (padrão: um passo), com a deriva do relógio como parâmetro de perturbação (ou dada por <c4/>); ruído do laço de travamento de frequência a partir do C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), nos canais GNSS, nos canais LEO e em todos os canais

# text
# c1: δx
# c2: g·δx
# c3: g = −(Δv − ρ̇u)/ρ
seg-14eab06a47d5 = um erro de posição <c1/> desloca uma taxa de distância em <c2/>, <c3/>: a velocidade transversal de um satélite LEO sobre sua distância é cerca de { "25" } vezes a de um satélite MEO, de modo que o mesmo erro é cerca de { "25" } vezes maior no Doppler LEO

# text
seg-390ac49b3c09 = Consistência entre bandas

# text
# c1: √(2(σ₁² + σ₂²))
# c2: iono_rate_bound_m_s
seg-986d501c2b01 = o passo de época a época da combinação de pseudodistância livre de geometria de cada par de bandas LEO, com o modelo ionosférico do receptor removido, contra o ruído de código <c1/> e uma taxa ionosférica não modelada tolerada (<c2/>)

# text
seg-389187df55d7 = um spoofer que falsifica algumas bandas e outras não, ou todas as bandas sem a ionosfera, em seu início; não um que falsifique todas as bandas e simule a ionosfera

# text
# c1: scenarios/leo-resilience-spoof-doppler.toml
# c2: scenarios/leo-resilience-spoof-monitors.toml
seg-4dd44d7fa566 = <c1/>: um salto de { "30" } m em um local levantado em Frankfurt altera as taxas de distância GNSS em cerca de { "4" } mm/s e as do LEO em cerca de { "10" } cm/s (gradientes medianos de { "1.4e-4" } e { "3.5e-3" } por segundo). O teste somente com GNSS nunca o detecta (maior não centralidade de { "0.06" }); o teste sobre todos os canais o detecta { "105" } s após o início. <c2/> executa quatro spoofers contra os dois monitores.

# text
seg-1b64098e01f3 = Limitações, declaradas em cada resultado: o spoofer é um empurrão de posição idealizado e autoconsistente que compensa o próprio percurso (sem assinatura de potência, de ângulo de chegada ou de pico de correlação); o dado a priori é independente das soluções falsificadas; o modelo ionosférico do receptor é o do mecanismo, de modo que o resíduo autêntico entre bandas é zero na média. MODELLED (duas linhas em <a1>VERIFICATION-MATRIX.md</a1>).

# text
seg-edb7b16b6c0e = Validação

# text
seg-051b8cd1849d = Teste

# text
seg-609c537a9dfd = ITU-R P.838-3 Tabela { "5" }, { "115" } frequências

# text
seg-5bf24bec38f2 = todo coeficiente a até { "0.6" } de seu último dígito impresso (pior observado: { "0.51" })

# text
seg-86204b023d44 = exemplos de validação do Grupo de Estudos { "3" } da ITU-R (CG-3M3J-13-ValEx-Rev8.3.0), chuva da P.618-14

# text
seg-13180d4097d1 = { "56" } casos dentro de { "1e-4" } dB (observado: { "5e-6" } dB)

# text
seg-84161e5f97f8 = Mesmos exemplos, cintilação da P.618-14

# text
seg-0a4305c867ff = { "42" } casos dentro de { "1e-5" } dB

# text
seg-054f8dbe2792 = Planilha de Clutter e BEL do Grupo de Estudos { "3" } da ITU-R, P.2109

# text
seg-8ae2eeed4be4 = { "568" } valores dentro de { "0.001" } dB

# text
# c1: γ = (77/60)²
seg-6df2eded9f19 = razão de atraso de grupo do IS-GPS-200 <c1/>

# text
seg-d0b293230f91 = a { "1e-12" }; amplificação L1/L2 e L1/L5 de { "2.978" } e { "2.588" }

# text
seg-f9a0e24c00a7 = Forma de Friis em quilômetro–megahertz

# text
seg-4e94a67f40f6 = a { "1e-4" } dB

# text
seg-ee59b4c520eb = arXiv { "2509.19551" } Tabela { "1" } (validação em órbita (IOV) do Pulsar, capacidade operacional plena (FOC) polar, FOC inclinada, GPS)

# text
seg-345998ca457c = { "20" } velocidades e máximos de Doppler dentro de { "0.05" } %

# text
seg-30e34076f4a7 = As referências independentes de chuva e de cintilação tomam a altura de chuva e a refratividade úmida como os exemplos de validação as fornecem: o mecanismo não possui nem o mapa da ITU-R P.839 nem o da P.453.

# text
seg-d2d1075a0b67 = Os EIRPs e os diagramas são potências recebidas publicadas convertidas em EIRP, ou escolhas representativas; nenhum diagrama medido de satélite é usado e nenhum C/N0 LEO é comparado com uma medição.

# text
seg-915a9564608d = O termo gasoso é o método simplificado superado da P.676-10; abaixo de { "1" } GHz, é o valor de { "1" } GHz escalado por f², e a chuva é tomada como zero ali.

# text
seg-cdd9faf5b61d = A fração do TEC abaixo de um satélite LEO vem de uma única camada de Chapman (sem plasmasfera), substituível por uma fração declarada.

# text
seg-4b72218497e7 = As órbitas da passagem projetada e as Walker são de dois corpos com um J2 secular opcional (o segundo harmônico zonal da Terra); o caminho TLE usa o SGP4. A aceleração do próprio usuário é deixada de fora da taxa de Doppler em forma fechada (a verificação numérica informa o que isso custa para um usuário em movimento).

# text
seg-9fc2cd6d38e9 = O RINEX (Receiver Independent Exchange Format) { "4.02" } não tem registros de navegação LEO; qualquer exportação LEO em estilo RINEX pertence ao código da mensagem de navegação e é uma extensão documentada do Kshana (trabalho anterior: arXiv { "2401.17767" }).

# text
seg-593081243d8c = <s1>Anterior</s1>Projetos de sinal LEO

# text
seg-468e70f9a669 = <s1>Seguinte</s1>Mensagem de navegação LEO

# text
seg-072d0d8f618c = Monitores de spoofing ([spoofer])
