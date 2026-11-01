# docs--leo-signal: translations (pt-BR)

# text
seg-3ea93ae372ca = O que contém

# text
seg-6cb7a787ac67 = Referências

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-587beeccaa11 = Predefinição

# text
seg-6752521002b2 = Parte

# text
seg-2b0d77219437 = Predefinições

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-c5ce76c91ff7 = Rótulo

# text
seg-a86ce24d81de = Banda

# text
seg-74f4e80c65cb = Componentes

# attr:title
seg-e769f0411e64 = Retirada pelo seu editor; sem cópia arquivada

# text
# c1: docs/LEO-SIGNAL.md
seg-2255f9acec5b = Fonte: <c1/>

# text
seg-ff4c44ecdecb = Projetos de sinal LEO-PNT e o espectro multibanda

# text
# c1: leo-signal
# c2: spectrum
# c3: leo-pass
# c4: leo-pnt-chain
seg-5e222f965192 = O tipo de cenário <c1/> analisa sinais de posicionamento, navegação e temporização (PNT) em órbita baixa da Terra (LEO). Não está atrelado a um único sistema. Um sinal é um projeto parametrizado (dados, não código), de modo que o mesmo tipo analisa um sinal comercial publicado, um projeto representativo para uma banda que ninguém publicou ou qualquer projeto que um cenário escreva em linha. O tipo <c2/> também desenha esses projetos, em qualquer banda de ultra alta frequência (UHF) a C, cada banda com seus próprios interferidores, e uma banda <c3/> ou uma execução <c4/> pode conter qualquer um deles (ver <a1>Onde os projetos são usados</a1>).

# text
seg-caccfa826a1a = Execute os exemplos incluídos:

# text
# c1: kshana example leo-band-trade
seg-441136f32290 = <c1/>: uma comparação de bandas de UHF a C larga sobre projetos representativos;

# text
# c1: kshana example xona-pulsar-signals
seg-23cea428326c = <c1/>: os sinais publicados Xona Pulsar X1 e X5;

# text
# c1: kshana example multi-band-jamming-waterfall
# c2: spectrum
seg-5dcfa318a4f3 = <c1/>: painéis UHF, L, S e C sob interferidores por banda (um cenário <c2/>);

# text
# c1: kshana scenarios/celeste-iod-classical-pilot-signals.toml
seg-0390769a8d7f = <c1/>, a partir de uma cópia do repositório (não incluído): as bandas da Demonstração em Órbita (IOD) do Celeste e a configuração de sinal apresentadas no workshop LEO-PNT do Programa de Inovação e Apoio à Navegação (NAVISP) da Agência Espacial Europeia (ESA), { "2026" } (ver <a1>Parâmetros do workshop</a1> abaixo).

# text
# c1: src/leo_signal.rs
# c2: src/navsignal.rs
# c3: src/spectrum.rs
# c4: data/leo-signals/
seg-62511ee92f8a = Código: <c1/> (projetos de sinal, o tipo), <c2/> (as formas fechadas), <c3/> (a cascata multibanda), arquivos de predefinições em <c4/>.

# text
seg-ce08de9a19de = Um projeto de sinal

# text
seg-fc0d265f4006 = frequência central, largura de banda de transmissão (o espectro é zero fora dela) e a alocação da União Internacional de Telecomunicações (ITU): Serviço de Radionavegação por Satélite (RNSS), Serviço de Radiodeterminação por Satélite (RDSS), Serviço Móvel por Satélite (MSS), Serviço de Exploração da Terra por Satélite (EESS), uma banda não RNSS ou outra

# text
seg-be2d5e822342 = qualquer subconjunto de um componente de <b>aquisição</b> (curto e de baixa taxa, fácil de encontrar), um componente de <b>dados</b> (a mensagem de navegação) e um componente <b>piloto</b> (sem dados, para medição de distância)

# text
seg-e73d9832efe0 = Por componente

# text
# c1: FLAT(<MHz>)
seg-dac784d5f41a = modulação: chaveamento de fase binário BPSK(n) a n × { "1.023" } Mchip/s (n pode ser uma fração, BPSK(1/3) é { "341" } kchip/s), portadora de deslocamento binário BOC(m,n), BOC multiplexada ou <c1/> para um farol de multiplexação por divisão de frequência ortogonal (OFDM); fração da potência; deslocamentos de subportadora de acesso múltiplo por divisão de frequência (FDMA); comprimento do código; taxa de dados

# text
seg-4ccb9e269d64 = Opcional

# text
# c1: ranging = false
seg-4c22d21ea8f0 = potência recebida de referência e máxima, altitude da órbita, <c1/> para um sinal somente Doppler, notas sobre o que é publicado e o que é suposto

# text
# c1: presets = [...]
# c2: [[signals]]
# c3: generic-bands
seg-c6b46532af9a = Um cenário obtém sinais de <c1/> e de tabelas <c2/> em linha. Sem nenhum dos dois, analisa a predefinição <c3/>.

# text
# c1: data/leo-signals/
seg-a917a5ccfb79 = Um arquivo para cada um em <c1/>, compilados no programa, cada um citando a URL de sua fonte. Um valor que a fonte não publica é rotulado REPRESENTATIVE no arquivo e no relatório.

# text
seg-7159574bf255 = Sinais

# text
seg-c2831d853b1d = Aproximações declaradas

# text
# c1: xona-x1
# c2: xona-x5
seg-7816d4f1c3f1 = <c1/> ({ "1593.3225" } MHz, { "1.023" } Mchip/s), <c2/> ({ "1190.51625" } MHz, { "10.23" } Mchip/s); potência recebida mínima e máxima; { "1080" } km

# text
seg-332a08bef0de = chaveamento de fase em quadratura de Feher aprimorado (EFQPSK) desenhado com o envelope BPSK de chip retangular; chaveamento por deslocamento de código e códigos de sobreposição não modelados; largura de banda de transmissão = lóbulo principal (não publicada)

# text
# c1: iridium-stl
seg-d37420c5c9f5 = rajadas <c1/> de Tempo e Localização por Satélite (STL), chaveamento de fase em quadratura (QPSK) a { "25" } ksímbolo/s, { "780" } km, somente Doppler e temporização

# text
seg-a765878134e2 = PUBLIC, <a1>relatório da Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
seg-5ca54b21f017 = portadora no meio de { "1616" } a { "1626" } MHz; potência recebida derivada de { "300" } a { "2400" } vezes a do Sistema de Posicionamento Global (GPS) publicada

# text
# c1: starlink-ku-beacon
seg-e43d1db73131 = <c1/>, um farol OFDM de { "240" } MHz, somente Doppler

# text
seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

# text
seg-fee9a553c9ae = espectro plano; centro do canal e altitude da camada REPRESENTATIVE; a relação portadora/densidade de ruído (C/N₀) publicada de cerca de { "57" } dB-Hz é definida por meio do receptor

# text
# c1: centispace-l1
# c2: centispace-l5
seg-f89372b5231e = <c1/>, <c2/>, BPSK a { "2.046" } Mchip/s

# text
seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

# text
seg-ac53cebe5303 = portadoras colocadas nas portadoras GPS L1 e L5 ("perto de" na fonte); comprimento do código REPRESENTATIVE

# text
# c1: generic-c-band-leo
seg-cb1420efc108 = <c1/>, { "5020" } MHz, BPSK({ "10" }) em { "20" } MHz

# text
seg-895f6039fce2 = REPRESENTATIVE, para sistemas em banda C cujos parâmetros não são públicos (como o TrustPoint)

# text
seg-a407aaab864c = o projeto inteiro

# text
seg-2f679a429dae = REPRESENTATIVE, alocações do <a1>Regulamento de Radiocomunicações da ITU</a1>; a portadora UHF de { "465" } MHz do <s1>levantamento openRECEIVER público de sinais LEO-PNT</s1>

# text
seg-2054d9ce8a0d = o projeto inteiro (a largura de banda e a modulação UHF também)

# text
seg-24360342e8e6 = A efeméride polinomial de "relógio zero" do ATOMIC é um modelo de mensagem de navegação, não um projeto de sinal, e fica com o trabalho sobre mensagem de navegação, não aqui.

# text
seg-ebfc032d7898 = O que é calculado por sinal

# text
# c1: η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]
seg-211f655e00fa = <b>Densidade espectral de potência (PSD) limitada em banda</b> e, por componente, a fração de sua potência que a banda de transmissão deixa passar. Para um componente BPSK no centro, a forma fechada <c1/> fica ao lado do valor numérico ({ "90.3" } % para o lóbulo principal).

# text
# c1: β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)
seg-05e2a7b8235a = <b>Largura de banda em raiz do valor quadrático médio (RMS, Gabor)</b> do componente rastreado dentro da banda, com a forma fechada BPSK <c1/>.

# text
# c1: σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]
seg-f878fd0359c9 = <b>Jitter de ruído térmico do rastreamento de código</b> de um laço de sincronização de atraso (DLL) em função do C/N₀ e do espaçamento do correlador adiantado-atrasado, a partir da fórmula adiantado-atrasado limitada em banda de Betz e Kolodziejski ({ "2009" }): <c1/>, coerente por padrão, com a perda de quadratura não coerente sob solicitação. O relatório acrescenta a forma de livro-texto de banda ilimitada (Kaplan e Hegarty) e o limite de espaçamento tendendo a zero dado pela largura de banda de Gabor. A <b>precisão de medição de distância</b> é esse jitter em metros no C/N₀ e no espaçamento de referência.

# text
# c1: f v R_E cos(el) / ((R_E + h) c)
# c2: 2/(3T)
seg-089e4e98af82 = <b>Aquisição</b>: o maior Doppler de satélite em uma passagem pelo zênite na máscara de elevação (<c1/>, órbita circular, sem rotação da Terra) mais os termos do oscilador e do usuário; compartimentos Doppler de <c2/>; compartimentos de código ao longo de um período; a probabilidade de detecção de um detector de lei quadrática (Q de Marcum generalizada) a uma probabilidade de falso alarme por célula, centrada e no pior caso de desalinhamento; e o tempo médio de aquisição de uma busca serial e de uma busca paralela em código, de janela única (Holmes).

# text
seg-1e2029183bdc = <b>Compatibilidade</b>: o coeficiente de separação espectral (SSC) do sinal limitado em banda sobre o GPS L1 de aquisição grosseira (C/A), o Galileo E1, o GPS L5, o Galileo E5a, o E5b e o sinal E5 de BOC alternativa (AltBOC) em cada banda de receptor do sistema global de navegação por satélite (GNSS), a perda de C/N₀ que ele causa em sua potência recebida, e o SSC e a perda de C/N₀ de cada sinal GNSS sobre o componente rastreado do LEO.

# text
# c1: spectrum
# c2: spectrum::Jammer::ssc
seg-864f3f2a5aa1 = <b>Tolerância a interferidores</b>: a razão de potência interferidor/sinal (J/S) de um tom de onda contínua (CW) na portadora, de ruído plano sobre a banda de transmissão e de ruído casado ao componente rastreado que leva o componente rastreado ao limiar de rastreamento, a partir do código de SSC do próprio tipo <c1/> (<c2/>).

# text
# c1: 10 log₁₀(s/η)
# c2: spectrum
seg-0fbea397ab93 = Convenção de C/N₀: a varredura e a referência são o C/N₀ <b>total em banda</b>. A fração de um componente entra nas fórmulas de rastreamento e de interferidor como <c1/> (sua fração da potência não filtrada sobre a fração em banda), a mesma convenção que o tipo <c2/> usa para uma banda simples, cuja potência de modulação fora da banda do receptor é perdida do mesmo modo.

# text
seg-3b7d16e8873a = A comparação de bandas

# text
# c1: [trade]
# c2: 40.3·TEC/f²
seg-39382eb3a60c = <c1/> coloca cada sinal ao lado de um sinal de referência: atraso de grupo ionosférico de primeira ordem <c2/> para um conteúdo total de elétrons (TEC) oblíquo que você informa ({ "1" } unidade de TEC, TECU, = 10¹⁶ elétrons/m²), perda de percurso no espaço livre (FSPL) a uma distância oblíqua, precisão de medição de distância com <b>C/N₀ igual</b> e com <b>potência isotrópica radiada efetiva (EIRP) igual</b> (C/N₀ menos a diferença de perda no espaço livre, antenas isotrópicas em ambas as pontas) e a tolerância a interferidores no C/N₀ de EIRP igual.

# text
# c1: scenarios/leo-band-trade.toml
seg-58ced9eba711 = <c1/> ({ "50" } TECU, { "1000" } km, { "45" } dB-Hz, espaçamento coerente de 0.5 chip, laço de { "1" } Hz, { "20" } ms):

# text
seg-72f051e2d7e1 = Sinal

# text
seg-3cfdff157be3 = Atraso ionosférico

# text
seg-b1436d1fd7a4 = ΔFSPL em relação à L

# text
seg-b5ce20ced519 = Medição de distância, C/N₀ igual

# text
seg-2becbee24d47 = C/N₀, EIRP igual

# text
seg-aba982013f21 = Medição de distância, EIRP igual

# text
seg-8b292612e43e = Tolerância J/S CW

# text
seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

# text
seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

# text
seg-66e74ec8ec1f = −{ "8.17" } dB

# text
seg-4dfc4b277e46 = { "0.221" } m

# text
seg-2a67835c7ddd = { "53.17" } dB-Hz

# text
seg-b36b61eaff50 = { "0.086" } m

# text
seg-37de1532b69e = { "42.1" } dB

# text
seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

# text
seg-1cc0fc817fca = { "14.19" } m

# text
seg-c1d04452ee8f = { "0.111" } m

# text
seg-b1dccfc14bb2 = { "45.00" } dB-Hz

# text
seg-467afbc3965e = { "45.0" } dB

# text
seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

# text
seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

# text
seg-271acd87a8d6 = +{ "6.41" } dB

# text
seg-0f38ea614b7f = { "0.185" } m

# text
seg-c531dc11c01d = { "38.59" } dB-Hz

# text
seg-6edbdabf77cb = { "0.388" } m

# text
seg-b1c384a78d8c = { "41.7" } dB

# text
seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

# text
seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

# text
seg-fa10d26d0f8e = +{ "12.49" } dB

# text
seg-9f6390cc903b = { "32.51" } dB-Hz

# text
seg-d04fb147c95f = { "0.465" } m

# text
seg-e825ae4d1080 = { "43.4" } dB

# text
seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

# text
seg-6f22870202af = { "0.77" } m (×{ "0.055" })

# text
seg-ad13cdf3955f = +{ "12.63" } dB

# text
seg-da4b72e53c18 = { "0.022" } m

# text
seg-07ba1b6b9728 = { "32.37" } dB-Hz

# text
seg-e96dfdc0d92f = { "0.093" } m

# text
seg-04a27fee9486 = { "50.3" } dB

# text
seg-edcaed830e15 = A comparação vale nos dois sentidos. Com C/N₀ igual, a precisão de medição de distância é definida pela taxa de chip e pela banda (a C larga mede cinco vezes mais fino que a L). Com potência radiada igual, a perda no espaço livre cobra integralmente das bandas mais altas: a banda C perde { "12.5" } dB de C/N₀ e mede quatro vezes pior que a L, a UHF ganha { "8.2" } dB, mas carrega { "6.6" } vezes o atraso ionosférico. A C larga recupera sua precisão com largura de banda. Estes resultados se apoiam nos projetos representativos e em antenas isotrópicas; uma antena direcional de usuário na banda C altera as colunas de EIRP igual.

# text
seg-9bb6fa0e7a95 = Xona Pulsar

# text
# c1: scenarios/xona-pulsar-signals.toml
seg-d71e8de9cdda = <c1/> nas potências recebidas mínimas publicadas, contra uma antena de { "290" } K e uma figura de ruído de { "2" } dB (piso −{ "201.98" } dBW/Hz):

# text
seg-4cf70433cc54 = C/N₀ de referência

# text
seg-2a22ffc83e00 = { "53.78" } dB-Hz

# text
seg-8f274ed7feff = { "57.08" } dB-Hz

# text
seg-6be7e20ca92f = Precisão de medição de distância ({ "0.5" } chip, coerente, { "1" } Hz)

# text
seg-60218177538e = { "0.402" } m

# text
seg-e5ccbfea146d = { "0.028" } m

# text
seg-b5a638da9ee1 = Doppler máximo do satélite, { "1080" } km

# text
seg-6917f2712acf = { "33.2" } kHz

# text
seg-895ac83e4a5b = { "24.8" } kHz

# text
seg-b4c4179a0363 = Compartimentos Doppler × código ({ "1" } ms, { "0.5" } chip)

# text
seg-bed6ba024afe = Tempo médio de aquisição paralela em código

# text
seg-93ffb02c7c50 = { "0.15" } s

# text
seg-3671bc5f2ace = { "0.37" } s

# text
seg-7e4c190cb4ab = O X5 fica em { "1190.51625" } MHz, dentro da banda Galileo E5: seu SSC é −{ "91.2" } dB/Hz sobre o Galileo E5a e o GPS L5, −{ "103.2" } dB/Hz sobre o E5b e −{ "86.2" } dB/Hz sobre o sinal AltBOC, e um satélite X5 em sua potência mínima eleva a densidade de ruído de um receptor GNSS em { "0.0001" } a { "0.005" } dB. O Doppler do X1, { "33.2" } kHz, está dentro dos { "32" } a { "34" } kHz que o artigo relata (a linha VALIDATED de Doppler abaixo).

# text
seg-661eefb1f346 = O espectro multibanda

# text
# c1: spectrum
# c2: [[bands]]
# c3: gps-l1ca
# c4: galileo-e1
# c5: gps-l2c
# c6: gps-l5
# c7: galileo-e5a
seg-0a8bbe2921fd = As <c2/> do tipo <c1/> aceitam, além das cinco bandas GNSS nomeadas (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>):

# text
# c1: signal = "<preset signal>"
# c2: signal_power_dbw
# c3: tracked_power_dbw
seg-63bd7d8a192d = <c1/>: um projeto predefinido, desenhado com todos os componentes, limitado em banda à sua largura de banda de transmissão, recebido na potência de referência da predefinição ou em <c2/>. C/N₀ e J/S referem-se ao componente rastreado (<c3/> no relatório);

# text
# c1: centre_mhz
# c2: modulation
# c3: signal_power_dbw
seg-603a2b97e621 = <c1/> com <c2/> e <c3/>: qualquer banda personalizada.

# text
# c1: [[panels]]
# c2: wideband
# c3: l-band-waterfall-jamming
# c4: tests/leo_signal_reference.rs
seg-b1c30f5d69cf = <c1/> acrescentam cascatas sobre outras faixas de frequência na mesma linha do tempo e escala de cores, e um interferidor <c2/> (barragem) se junta ao CW, à banda estreita, ao chirp e ao ruído casado. Uma banda simples se comporta exatamente como antes: o exemplo incluído <c3/> ainda fornece { "43.48" } dB-Hz nominal e { "3.23" } dB-Hz mínimo para o L1 C/A (fixado em <c4/>).

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
seg-35151477cbc2 = <c1/> ({ "60" } s, uma linha por segundo):

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-e618666a44d8 = Após seu próprio interferidor

# text
seg-f75d3804cfe8 = Interferidor

# text
seg-5751b2520829 = generic-uhf ({ "465" } MHz)

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-a582f1a22a07 = { "34.38" } dB-Hz a partir de { "10" } s

# text
seg-23570b8c7403 = CW na portadora, −{ "120" } dBW

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-2e935ea7b90e = { "3.38" } dB-Hz a partir de { "20" } s (perdido)

# text
seg-52256ba98a99 = chirp de { "16" } MHz, { "50" } mW a { "100" } m

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-71abaef6924e = { "38.51" } dB-Hz a partir de { "30" } s

# text
seg-45441a20f061 = barragem de { "40" } MHz em { "1185" } MHz, −{ "118" } dBW

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-430461899d82 = { "46.29" } dB-Hz a partir de { "30" } s

# text
seg-4bcace842ce1 = a mesma barragem

# text
seg-472da83fd67a = generic-s ({ "2492.028" } MHz)

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-0f0cad45f636 = { "41.69" } dB-Hz a partir de { "40" } s

# text
seg-d04f42bc0567 = ruído de { "2" } MHz, −{ "128" } dBW

# text
seg-372655e7c722 = generic-c-band-leo ({ "5020" } MHz)

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-b27c4bc24059 = { "40.35" } dB-Hz a partir de { "50" } s

# text
seg-ab6304cf6aec = ruído casado, −{ "124" } dBW

# text
seg-1f8a742cb215 = Cada interferidor atinge apenas a sua própria banda; o teste mantém todas as outras bandas no seu C/N₀ nominal até que o seu próprio interferidor comece.

# text
seg-01c63dd5d11b = Onde os projetos são usados

# text
seg-74f85b484b08 = Um projeto é procurado pelo nome em qualquer lugar onde uma banda possa nomear um:

# text
# c1: spectrum
# c2: signal = "<design>"
# c3: multi-band-jamming-waterfall
# c4: leo-resilience-js-margin
# c5: leo-resilience-multiband-diversity
# c6: leo-resilience-gnss-jammed-leo-carries
seg-4a7aca809ec3 = uma banda <c1/> (<c2/>, acima): <c3/>, <c4/> e as campanhas <c5/> e <c6/>;

# text
# c1: leo-pass
# c2: signal = "<design>"
# c3: frequency_mhz
seg-1ee84efd74b3 = uma banda <c1/> (<c2/>): a banda adota a frequência central, a largura de banda de transmissão e a taxa de chip rastreada do projeto (a menos que <c3/> seja dado), divide sua EIRP entre os componentes segundo suas frações de potência e informa o C/N₀ do componente rastreado e o jitter de rastreamento de código limitado em banda a cada época (<a1>LEO-PASS.md</a1>);

# text
# c1: leo-pnt-chain
# c2: leo-pnt-end-to-end
# c3: xona-pulsar-end-to-end
seg-33732550ba94 = o tipo <c1/>, que repassa à passagem a divisão de potência e a taxa de chip de um projeto, e à solução fundida sua portadora e sua taxa de chip (<c2/>, <c3/>; <a1>LEO-PNT.md</a1>).

# text
seg-625f50ac3189 = Parâmetros do workshop

# text
# c1: scenarios/celeste-iod-classical-pilot-signals.toml
# c2: src/celeste_iod.rs
# c3: scenarios/*celeste-iod*.toml
seg-9d50778efa0a = <c1/> contém as bandas de frequência do Celeste IOD e a configuração nº 1 de sinal "Classical Pilot", como apresentadas no workshop LEO-PNT do ESA NAVISP, { "2026" }, com uma verificação de forma de um projeto contra o espectro medido mostrado ali. É um dos arquivos da predefinição Celeste IOD (os outros são <c2/> e os demais <c3/>); nenhuma especificação de sinal do Celeste é pública. Seus componentes trazem suas hipóteses (divisões de potência, comprimentos de código, deslocamentos FDMA e uma modulação representativa para as bandas cuja modulação não foi apresentada). A verificação de forma é consistência MODELLED: compara formas, não níveis calibrados.

# text
# c1: src/celeste_iod.rs
# c2: scenarios/*celeste-iod*.toml
# c3: kshana example
# c4: include_str!
seg-6e259f57af91 = Ele é retido junto com o resto da predefinição: apague <c1/> e os arquivos <c2/>. Nada compila o cenário no programa: a interface de linha de comando o lista como cenário somente do repositório (<c3/> o nomeia e explica, em vez de imprimi-lo), e um teste recusa qualquer <c4/> dele. Todos os outros cenários, testes e referências independentes rodam sem ele; o teste que o lê passa com uma nota quando ele está ausente, e a contagem de arquivos de cenário do README ainda o conta.

# text
seg-53a7343c076e = Afirmação

# text
seg-6e0de0f2b25f = potência BPSK em banda ({ "90.3" } % no lóbulo principal); jitter adiantado-atrasado limitado em banda reduzindo-se às formas de livro-texto coerente e não coerente e ao seu limite de Gabor; auto-SSC do BPSK 2/({ "3" } R_c)

# text
seg-e35f7c20a976 = Kaplan & Hegarty, Betz & Kolodziejski { "2009" }, Betz { "2001" }, Abramowitz & Stegun Tabela { "5.1" }

# text
seg-0ceb71e558f6 = Forma fechada da largura de banda de Gabor limitada em banda; SSC de BPSK deslocada em deslocamento não nulo; área unitária da AltBOC (tudo dentro da linha acima, como verificações cruzadas)

# text
seg-b0552001e519 = consistência interna

# text
seg-af6cff634177 = derivada aqui, conferida contra quadratura

# text
seg-6b74bc7777c7 = Doppler LEO máximo

# text
seg-f4f4ee11749d = Xona Pulsar X1 { "32" } a { "34" } kHz (arXiv { "2509.19551" }); Iridium ±{ "36" } kHz (RNTF)

# text
# c1: leo-signal
seg-08e5ec9a31a0 = <c1/> projetos, aquisição, compatibilidade, tolerância a interferidores, comparação, verificações de forma

# text
seg-64f232587c5f = as formas fechadas validadas, a identidade do detector P_d({ "0" }) = P_fa, o tempo médio de Holmes, a própria cadeia de SSC do tipo spectrum

# text
seg-a456645f97aa = Espectro multibanda

# text
seg-868432ccfa09 = redução às cadeias inalteradas de espectro e de interferência

# text
seg-430edd66bda0 = Não modelado

# text
seg-d3bba3714684 = Os espectros exatos de EFQPSK, de chaveamento por deslocamento de código e de OFDM.

# text
seg-53a727d317ae = Estrutura de linhas do código de espalhamento e correlação cruzada de acesso múltiplo.

# text
seg-08e229ae97e9 = Filtros de transmissão e de recepção além de uma parede de tijolos ideal: sem emissão fora da banda.

# text
seg-b1fe4ce62e6a = Multipercurso, quantização e controle automático de ganho.

# text
seg-5d2af0802400 = Rotação da Terra no limite de Doppler (até cerca de { "0.46" } km/s de taxa de variação da distância).

# text
seg-5e5e1124fbbb = Atraso ionosférico além da primeira ordem e a divisão do conteúdo de elétrons acima e abaixo de um satélite LEO: o TEC oblíquo é uma entrada.

# text
seg-8c0d738304ab = Perdas atmosféricas, por chuva e de polarização.

# text
seg-1fc440f042cf = Lógica de aquisição de múltiplas janelas.

# text
seg-090a6ecf879f = Interferência agregada além de uma contagem por satélite.

# text
seg-c4b2a79ee33d = J. W. Betz e K. R. Kolodziejski, "Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I," <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

# text
seg-52ad2f21daf4 = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }),

# text
seg-aeeea70a0258 = E. D. Kaplan e C. J. Hegarty (orgs.), <em>Understanding GPS/GNSS</em>, 3ª ed., Artech House,

# text
seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

# text
seg-34af310a980b = M. Abramowitz e I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } e Tabela { "5.1" }.

# text
seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

# text
seg-960fc01f0a62 = Leclère, Marathe e Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

# text
seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

# text
seg-72490fa16fd2 = Kozhaya, Saroufim e Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

# text
seg-00cfb54b28c0 = CentiSpace: <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

# text
seg-4d954d28b661 = Fatos do ESA Celeste IOD: <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

# text
seg-d43b8255ba58 = Regulamento de Radiocomunicações da ITU: <a1>https://www.itu.int/pub/R-REG-RR</a1>.

# text
# c1: generic-uhf
seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" } de agosto de { "2026" } (a fonte pública da portadora UHF de { "465" } MHz de <c1/>): <s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>. A página foi retirada do site (HTTP { "404" } e ausente do índice do blog em 2026-09-29); os mecanismos de busca ainda a listam com esse título.

# text
seg-18b16c83dd7c = <s1>Anterior</s1>Posicionamento, navegação e temporização em LEO

# text
seg-50fe3f8ae7ec = <s1>Próxima</s1>Passagem LEO e orçamento de enlace
