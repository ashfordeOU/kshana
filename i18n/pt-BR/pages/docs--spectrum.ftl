# docs--spectrum: translations (pt-BR)

# text
seg-6cb7a787ac67 = Referências

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Portadora

# text
seg-c5ce76c91ff7 = Rótulo

# text
seg-a86ce24d81de = Banda

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-72f051e2d7e1 = Sinal

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-53a7343c076e = Afirmação

# text
seg-430edd66bda0 = Não modelado

# text
seg-64509c048541 = O que é modelado

# text
# c1: docs/SPECTRUM.md
seg-f07519ff8071 = Fonte: <c1/>

# text
seg-901c3e032de7 = Modelo de espectro e waterfall

# text
# c1: spectrum
seg-eac92092dd34 = O tipo de cenário <c1/> constrói a banda L do Global Navigation Satellite System (GNSS), e qualquer outra banda que um sinal projetado ocupe (ultra-high frequency (UHF), banda S, banda C), como uma única densidade espectral de potência (PSD), permite que ela mude ao longo de uma linha do tempo de jammers roteirizada e a reduz ao que importa a um laço de rastreamento: a razão jammer-sinal (J/S) e a razão efetiva portadora-densidade de ruído (C/N₀) de cada banda. Ele desenha o resultado como um waterfall (frequência na horizontal, tempo para baixo, cor para a potência) ao lado de barras de C/N₀ por banda, e lê e grava gravações Signal Metadata Format (SigMF), para que uma captura real possa ser estimada e plotada ao lado do modelo.

# text
seg-0007b6ba97ca = Grave o exemplo incluído em um arquivo e execute-o:

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = Em um checkout, <c1/> executa o mesmo arquivo.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Código: <c1/> (o modelo, o tipo, o estimador de Welch), <c2/> (o codec de gravação), <c3/> (os espectros de sinal de área unitária e o coeficiente de separação espectral) e <c4/> (as predefinições de projeto de sinal que uma banda pode nomear).

# text
seg-bb1153873209 = Modulação

# text
seg-9758b36b554c = Potência recebida padrão

# text
seg-a1a68286b809 = Largura de banda padrão do receptor

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = chaveamento de fase binário, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = portadora de deslocamento binário multiplexada, MBOC(6,1,1/11), ou portadora de deslocamento binário BOC({ "1,1" })

# text
seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
seg-6dc5e3668a78 = { "14.322" } MHz

# text
seg-f03380403a2a = { "1227.60" } MHz

# text
seg-06c245582533 = BPSK({ "1" }) (códigos CM e CL multiplexados no tempo)

# text
seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

# text
seg-1982a811e1ef = { "1176.45" } MHz

# text
seg-dd074e33242e = BPSK({ "10" })

# text
seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

# text
seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
# c1: [[bands]]
seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A é o código de aquisição grosseira; L2C é o sinal civil L2; IS-GPS-200 e IS-GPS-705 são as especificações de interface do GPS; Galileo OS SIS ICD é o Galileo Open Service Signal-in-Space Interface Control Document. As potências recebidas são os mínimos da especificação; as larguras de banda são escolhas de modelagem. Ambas podem ser substituídas por banda. Sem uma tabela <c1/>, a execução usa estas cinco. GLONASS G1/G2, BeiDou B1/B2 e Galileo E6 <b>não</b> estão entre as bandas nomeadas.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Uma entrada <c1/> assume uma de três formas:

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = um nome da tabela acima, com <c1/> e <c2/> opcionais e, para <c3/>, <c4/>;

# text
# c1: signal = "<preset>"
# c2: leo-signal
# c3: name
# c4: xona-x1
# c5: xona-x5
# c6: iridium-stl
# c7: starlink-ku-beacon
# c8: centispace-l1
# c9: centispace-l5
# c10: generic-c-band-leo
# c11: generic-uhf
# c12: generic-l
# c13: generic-s
# c14: generic-c
# c15: generic-c-wide
seg-8596194c81f2 = <c1/>: um projeto de sinal de órbita baixa da Terra (LEO) ou representativo, da biblioteca de predefinições do tipo <c2/> (<a1>LEO-SIGNAL.md</a1>), em qualquer banda, desenhado com todos os componentes (aquisição, dados, piloto, subportadoras por divisão de frequência) e limitado em banda à sua largura de banda de transmissão; C/N₀ e J/S são referidos ao componente rastreado, e <c3/> apenas o rotula. As predefinições são <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> e <c15/>;

# text
# c1: name
# c2: centre_mhz
# c3: modulation
# c4: BPSK(n)
# c5: BOC(m,n)
# c6: MBOC(6,1,p)
# c7: signal_power_dbw
seg-2ca46a7f2949 = uma banda personalizada: qualquer <c1/> com <c2/>, <c3/> (<c4/>, <c5/> ou <c6/>) e <c7/>.

# text
# c1: [[jammers]]
# c2: waveform
seg-fcb0f9fcffbf = Os jammers (<c1/>) recebem um <c2/>:

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/> — um tom de onda contínua (CW) em <c2/>;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/> — ruído plano ao longo de <c2/>;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/> — ruído plano ao longo de uma <c2/> larga (um jammer de barragem): a mesma densidade de <c3/>, nomeado à parte porque o tipo <c4/> o pontua como banda larga;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/> — uma varredura linear em dente de serra de <c2/> a cada <c3/>;

# text
# c1: matched
# c2: matched_to
seg-675fb74a89e4 = <c1/> — ruído de banda larga cujo espectro é a própria modulação da banda <c2/>.

# text
# c1: received_power_dbw
# c2: eirp_dbw
# c3: range_m
# c4: rx_gain_dbi
# c5: jamming
# c6: on_s
# c7: off_s
seg-64d7a14a198e = Cada um fornece ou <c1/>, ou uma potência isotrópica radiada efetiva <c2/> com um <c3/> (e, opcionalmente, <c4/>), que passa pela perda de percurso em espaço livre do tipo <c5/>. <c6/> e <c7/> roteirizam a linha do tempo.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = O receptor (<c1/>) define o piso de ruído, <c2/> com <c3/> para a temperatura de antena <c4/> e a figura de ruído <c5/>, e o limiar de rastreamento.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = O waterfall principal cobre <c1/> (padrão de { "1160" } a { "1590" } MHz em { "430" } bins). Cada entrada <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, padrão de { "200" } bins) acrescenta outro waterfall sobre a sua própria faixa de frequência na mesma linha do tempo, para um espectro que abrange várias bandas.

# text
seg-a550e89c2907 = A cadeia de interferência

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Para um sinal de espectro de área unitária <c1/> e um jammer de espectro de potência unitária <c2/>, o coeficiente de separação espectral (SSC) sobre a banda do receptor <c3/> é <c4/>, e a razão portadora-densidade de ruído efetiva com vários jammers é

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3ª ed., §{ "9.4" }). Para um jammer, esta é exatamente a equação antijamming do tipo <c1/> com <c2/>; o bloco <c3/> do relatório executa as próprias funções do tipo <c4/> sobre as mesmas entradas do enlace e imprime a diferença, que é zero até o arredondamento.

# text
# c1: jamming
seg-c11d0cb8e670 = O relatório também imprime o C/N₀ que o tipo <c1/> fornece com a sua tabela de Q. A tabela contém os valores de livro-texto, fixados nos testes às formas fechadas:

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW e banda estreita: <c1/>.</b> Um tom CW sobre a portadora C/A tem <c2/>, de modo que <c3/>, e a tabela e os espectros concordam. No exemplo incluído, o tom dá { "17.98" } dB-Hz por ambos (a tabela dava { "19.74" } quando continha { "1.5" }).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Banda larga e varrido: <c1/>, desde a { "0.36" }.</b> Isso é ruído branco sobre o lóbulo principal com a potência do sinal em banda normalizada para um, <c2/>. A tabela continha { "1" } até a { "0.36" }, cerca de { "3" } dB pessimista (<c3/>).

# text
seg-cd03b9c900e1 = O modelo de espectro deriva seus próprios valores a partir dos espectros:

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> para ruído casado com o C/A (<c2/>);

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> para ruído plano de nulo a nulo sem a normalização (<c2/>).

# text
seg-6c2187f0e32b = Portanto, para esses jammers, os dois valores de C/N₀ impressos ainda diferem, por projeto.

# text
# c1: Q
seg-73dfbeabcac2 = Cada célula do waterfall é a PSD média sobre o seu bin de frequência e a sua linha. Um chirp é promediado exatamente sobre a linha, varreduras inteiras mais a parcial; um jammer que liga ou desliga no meio de uma linha é ponderado pelo seu ciclo de trabalho. A linha do tempo de C/N₀ usa as mesmas médias, de modo que a imagem e os números concordam. Por banda, a linha do tempo informa o J/S em banda (potência do jammer dentro da largura de banda do receptor sobre a potência do sinal). Por jammer e por banda, o relatório fornece o SSC, <c1/>, o J/S total, o J/S em banda e o C/N₀ em regime permanente.

# text
seg-2c214a0a30be = O exemplo incluído

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/>: uma linha do tempo de { "60" } s, uma linha por segundo, uma antena de { "290" } K e uma figura de ruído de { "2" } dB (piso de −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = De { "10" } s a { "40" } s: um chirp de { "16" } MHz em torno da L1, varreduras de { "9" } µs, { "50" } mW a { "100" } m.

# text
seg-b85319af4f85 = A partir de { "30" } s: um tom CW na portadora L1, { "10" } mW a { "1" } km.

# text
seg-21e2b4e76832 = A partir de { "45" } s: ruído plano de { "2" } MHz na L2, recebido a −{ "135" } dBW.

# text
seg-45dd378c692c = O que a execução calcula:

# text
seg-eecd7d7530bf = C/N₀ mínimo

# text
seg-1ead35e1aad5 = Primeira perda

# text
seg-bfb55a322ece = Linhas em rastreamento

# text
seg-863ea3f1fbe9 = { "3.23" } dB-Hz

# text
seg-9aa0239a3a0c = { "10" } s

# text
seg-9979940d2359 = { "44.73" } dB-Hz

# text
seg-25364ef39455 = { "4.44" } dB-Hz

# text
seg-c8d0bc71cccd = { "41.98" } dB-Hz

# text
seg-c945914c444c = { "36.86" } dB-Hz

# text
seg-9ff066fb53a6 = nunca

# text
seg-63d4f00f622d = { "44.08" } dB-Hz

# text
seg-58b097691919 = O tom CW é o motivo pelo qual os dois sinais L1 se separam em { "40" } s. Ele cai sobre o pico do espectro do C/A e mantém o C/A em { "17.98" } dB-Hz, abaixo do limiar de { "25" } dB-Hz. Ele cai no nulo do espectro MBOC; assim, o Galileo E1 volta ao seu C/N₀ nominal quando o chirp termina.

# text
seg-064579d5fbac = Os próprios sinais ficam cerca de { "20" } dB abaixo do piso de ruído; por isso, o waterfall mostra o piso e os jammers, e as barras de C/N₀ mostram o que o desespalhamento recupera.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Os mesmos jammers conduzem uma missão encadeada em <c1/> (veja <a1>CAMPAIGNS.md</a1>): o relógio mantém o holdover enquanto o chirp está ativo, e o receptor recorre ao Galileo E1 sob o tom CW.

# text
seg-6b0edbfca134 = Além da banda L

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> coloca sinais de posicionamento, navegação e temporização (PNT) LEO em quatro bandas ao lado do GPS L1 C/A e do Galileo E5a, cada banda com o seu próprio jammer, em uma linha do tempo de { "60" } s. O waterfall de <c2/> é a banda L; três <c3/> acrescentam UHF ({ "455" } a { "475" } MHz), S ({ "2482" } a { "2502" } MHz) e C ({ "5005" } a { "5035" } MHz).

# text
seg-6818247b5863 = { "10" } s: um tom CW na portadora UHF, recebido a −{ "120" } dBW.

# text
seg-02de8390de31 = { "20" } s: o chirp do exemplo de banda L ({ "16" } MHz em torno da L1, varreduras de { "9" } µs, { "50" } mW a { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s: ruído de banda larga, { "40" } MHz em torno de { "1185" } MHz, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s: ruído de banda estreita, { "2" } MHz na portadora S, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s: ruído casado com o espectro do próprio sinal da banda C, −{ "124" } dBW.

# text
seg-abacb60b16a3 = O que a execução calcula (o C/N₀ dos sinais projetados é o do componente rastreado; assim, o valor nominal fica abaixo da potência total recebida pela parcela rastreada):

# text
seg-1c921b6299e4 = representativo, BPSK({ "5" }), −{ "150" } dBW

# text
seg-5331cde832fb = { "34.38" } dB-Hz

# text
seg-35588b19fd72 = mínimo da especificação

# text
seg-7d3639369444 = { "3.38" } dB-Hz

# text
seg-9eef1ec7858f = { "38.51" } dB-Hz

# text
seg-c6743d980e6b = projeto publicado, −{ "144.9" } dBW

# text
seg-245bf7d080b3 = { "1190.51625" } MHz

# text
seg-f2aed7e062bf = { "46.29" } dB-Hz

# text
seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

# text
seg-a6f2bb955ca2 = representativo, BPSK({ "10" }), −{ "152" } dBW

# text
seg-b9312cc881d2 = { "40.35" } dB-Hz

# text
seg-03bb124d45d2 = Somente o chirp tira um sinal (GPS L1 C/A, a partir de { "20" } s). Cada um dos outros jammers degrada apenas a banda que o seu espectro alcança: o ruído casado de banda C, por exemplo, tem um SSC de −{ "71.87" } dB/Hz com o sinal de banda C e abaixo de −{ "133" } dB/Hz com todas as outras bandas.

# text
seg-a8bea652a85d = A mesma maquinaria conduz os cenários de resiliência de PNT em LEO (<a1>LEO-PNT.md</a1>):

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> aumenta em degraus de { "5" } dB, a cada { "10" } s, a partir de −{ "125" } dBW, um jammer de barragem de { "40" } MHz em { "1185" } MHz. O GPS L5 é perdido no degrau de −{ "105" } dBW, o Galileo E5a em −{ "100" } dBW e o Xona X5 em −{ "95" } dBW, enquanto um sinal representativo de banda L em LEO, recebido a −{ "135" } dBW, ainda é rastreado a −{ "90" } dBW: a potência recebida compra margem de J/S dB por dB.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> é uma varredura de campanha de uma execução <c2/> sobre a potência de uma barragem na banda L5 (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> é uma campanha encadeada cujas fases leem o C/N₀ de GNSS e de LEO de execuções <c2/>, com painéis de banda S e C.

# text
seg-42b00ae14ffe = IQ, SigMF e Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> desenha o modelo em um instante como amostras complexas em fase e em quadratura (IQ), as grava como uma gravação SigMF (<c2/> ou <c3/>), lê a gravação de volta e estima a sua PSD pelo método de Welch (janela de Hann, { "50" } % de sobreposição, periodogramas promediados, escala de densidade). O ruído térmico, os sinais e os jammers semelhantes a ruído são sorteados bin a bin a partir da densidade do próprio modelo; um tom e um chirp são desenhados como formas de onda reais. Apenas com jammers semelhantes a ruído, a estimativa de Welch fica a { "0.1" } dB do modelo (mediana). Um chirp periódico é um espectro de linhas na sua taxa de varredura, com ondulação e caudas além das bordas da sua banda que o modelo suave omite: no exemplo incluído, a potência total concorda a { "0.02" } % e o bin mediano difere em { "0.5" } dB. O instantâneo é um arquivo gravado para análise; nada é transmitido e nenhum hardware de rádio é acionado.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (somente em builds nativos) lê uma gravação SigMF real de <c2/> (o arquivo de dados assume por padrão o mesmo nome-base com <c3/>), estima a sua PSD e a imprime ao lado do modelo nas frequências da gravação. Um arquivo SigMF não tem calibração de potência absoluta; por isso, o relatório fornece o desvio mediano e a forma, não um nível.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = No build WebAssembly, a leitura de arquivos não está disponível; <c1/> e <c2/> funcionam sobre bytes que a página fornece.

# text
seg-69b384afe05d = PSDs de sinal e SSCs

# text
# c1: jamming
seg-a65b87c51f05 = Lóbulo principal do BPSK(n) de 2n × { "1.023" } MHz de nulo a nulo; lóbulos do BOC({ "1,1" }) centrados em ±{ "1.023" } MHz (Betz { "2001" }); SSCs de −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz para C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) a partir de suas formas fechadas de Parseval, os valores por trás dos publicados −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) e { "1.5" } (casado) (Kaplan & Hegarty §{ "9.4" }); as entradas da tabela do tipo <c1/> são iguais às formas fechadas: CW e banda estreita Q = { "1" }, banda larga e varrido Q = { "2" } (ruído branco sobre o lóbulo principal, potência em banda normalizada; { "1" } até a { "0.36" })

# text
seg-d2afc6e05969 = Linha do tempo de waterfall, J/S e C/N₀

# text
# c1: jamming
seg-c44413d5a060 = Reduz-se exatamente à cadeia do tipo <c1/>; as potências dos jammers, a linha do tempo e as larguras de banda são entradas

# text
seg-304f4aeaf4cb = Codec SigMF e estimativa de Welch

# text
seg-7a642dd02e5c = Idas e voltas, uma transformada de Fourier discreta direta, identidades de ruído branco e de Parseval; nenhuma gravação de terceiros está no repositório

# text
seg-1138c9e62a21 = Waterfall multibanda com sinais projetados e jammers por banda

# text
seg-ac38681004e9 = Reduz-se à cadeia da banda L (uma banda de componente único dá os mesmos números de antes da extensão) e aos espectros de sinal validados; os sinais projetados, os jammers e as larguras de banda são entradas

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Uma correção a uma abreviação comum: os lóbulos do espectro BOC({ "1,1" }) são <em>centrados</em> em ±{ "1.023" } MHz (entre o nulo da portadora e o nulo em { "2.046" } MHz), mas o máximo da PSD está em ±{ "0.759" } MHz, onde <c1/> com <c2/>. Os testes fixam ambos.

# text
seg-6ab6e241f7e5 = Estrutura de linhas do código de espalhamento (as linhas de { "1" } kHz do C/A): um tom é pontuado em relação ao envelope suave, não à linha de código mais próxima.

# text
seg-4be08100a707 = Controle automático de ganho, quantização, supressão de pulsos e filtragem notch.

# text
seg-0f195ea4126e = O diagrama da antena receptora na direção do jammer além de um único valor de ganho.

# text
seg-d3d03da9c962 = Interferência de acesso múltiplo entre satélites de uma mesma banda.

# text
seg-db5c7566f49e = As emissões de um sinal projetado fora da sua largura de banda de transmissão: seu espectro é truncado ali, de modo que nenhuma emissão fora da banda alcança uma banda vizinha.

# text
seg-9cbea7151036 = O efeito de um chirp sobre o laço em taxas de varredura comparáveis à largura de banda do laço: seu C/N₀ usa o espectro promediado por linha.

# text
seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan e C. J. Hegarty (orgs.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3ª ed., Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, maio/junho de { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = Especificação SigMF, <a1>https://sigmf.org/</a1> (fonte: <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Anterior</s1>Integridade e segurança

# text
seg-d5264da8bf65 = <s1>Próximo</s1>Referência do ARAIM
