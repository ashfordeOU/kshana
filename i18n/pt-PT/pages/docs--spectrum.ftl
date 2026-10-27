# docs--spectrum: translations (pt-PT)

# text
seg-6cb7a787ac67 = Referências

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Portadora

# text
seg-c5ce76c91ff7 = Etiqueta

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
seg-901c3e032de7 = Modelo de espectro e cascata

# text
# c1: spectrum
seg-eac92092dd34 = O tipo de cenário <c1/> constrói a banda L do Global Navigation Satellite System (GNSS), e qualquer outra banda que um sinal projetado ocupe (ultra-alta frequência (UHF), banda S, banda C), como uma única densidade espetral de potência (PSD), deixa-a variar ao longo de uma cronologia de emissores de interferência definida em guião, e reduz-a ao que interessa a um ciclo de seguimento: a razão interferência-sinal (J/S) e a razão efetiva entre a portadora e a densidade de ruído (C/N₀) de cada banda. Desenha o resultado como uma cascata (frequência na horizontal, tempo na vertical, cor para a potência) junto de barras de C/N₀ por banda, e lê e escreve gravações Signal Metadata Format (SigMF), de modo que uma captura real possa ser estimada e traçada junto do modelo.

# text
seg-0007b6ba97ca = Escreva o exemplo incluído num ficheiro e execute-o:

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = Num repositório clonado, <c1/> executa o mesmo ficheiro.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Código: <c1/> (o modelo, o tipo de cenário, o estimador de Welch), <c2/> (o codec de gravações), <c3/> (os espectros de sinal de área unitária e o coeficiente de separação espetral) e <c4/> (as predefinições de projeto de sinal que uma banda pode nomear).

# text
seg-bb1153873209 = Modulação

# text
seg-9758b36b554c = Potência recebida predefinida

# text
seg-a1a68286b809 = Largura de banda predefinida do recetor

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = modulação por desvio de fase binária, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = portadora com desvio binário multiplexada, MBOC(6,1,1/11), ou portadora com desvio binário BOC({ "1,1" })

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
seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A é o código de aquisição aproximada; L2C é o sinal civil L2; IS-GPS-200 e IS-GPS-705 são as especificações de interface do GPS; Galileo OS SIS ICD é o Galileo Open Service Signal-in-Space Interface Control Document. As potências recebidas são os mínimos da especificação; as larguras de banda são escolhas de modelação. Ambas podem ser substituídas por banda. Sem uma tabela <c1/>, a execução usa estas cinco. GLONASS G1/G2, BeiDou B1/B2 e Galileo E6 <b>não</b> figuram entre as bandas com nome.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Uma entrada <c1/> toma uma de três formas:

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = um nome da tabela acima, com <c1/>, <c2/> opcionais e, para <c3/>, <c4/>;

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
seg-8596194c81f2 = <c1/>: um projeto de sinal de órbita terrestre baixa (LEO) ou representativo, da biblioteca de predefinições do tipo de cenário <c2/> (<a1>LEO-SIGNAL.md</a1>), em qualquer banda, desenhado com todos os componentes (aquisição, dados, piloto, subportadoras de multiplexagem por divisão de frequência) e limitado em banda à sua largura de banda de transmissão; o C/N₀ e o J/S referem-se ao componente seguido, e <c3/> apenas o etiqueta. As predefinições são <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> e <c15/>;

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
seg-fcb0f9fcffbf = Os emissores de interferência (<c1/>) têm um <c2/>:

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/> — um tom de onda contínua (CW) em <c2/>;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/> — ruído plano sobre <c2/>;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/> — ruído plano sobre uma <c2/> larga (um emissor de interferência de barragem): a mesma densidade que <c3/>, nomeado em separado porque o tipo de cenário <c4/> o pontua como de banda larga;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/> — um varrimento linear em dente de serra de <c2/> a cada <c3/>;

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
seg-64d7a14a198e = Cada um indica <c1/>, ou uma potência isotrópica radiada equivalente <c2/> com um <c3/> (e, opcionalmente, <c4/>), que passa pela perda de percurso em espaço livre do tipo de cenário <c5/>. <c6/> e <c7/> definem a cronologia em guião.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = O recetor (<c1/>) define o patamar de ruído, <c2/> com <c3/> para a temperatura de antena <c4/> e o fator de ruído <c5/>, e o limiar de seguimento.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = A cascata principal cobre <c1/> (por predefinição, de { "1160" } a { "1590" } MHz em { "430" } intervalos). Cada entrada <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, predefinição de { "200" } intervalos) acrescenta outra cascata sobre o seu próprio intervalo de frequências na mesma cronologia, para um espectro que abranja várias bandas.

# text
seg-a550e89c2907 = A cadeia de interferência

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Para um sinal de espectro de área unitária <c1/> e um emissor de interferência de espectro de potência unitária <c2/>, o coeficiente de separação espetral (SSC) sobre a banda do recetor <c3/> é <c4/>, e a densidade efetiva entre a portadora e o ruído com vários emissores de interferência é

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3.ª ed., §{ "9.4" }). Para um só emissor de interferência, esta é exatamente a equação antijamming do tipo de cenário <c1/> com <c2/>; o bloco <c3/> do relatório executa as próprias funções do tipo de cenário <c4/> sobre as mesmas entradas da ligação e imprime a diferença, que é zero até ao arredondamento.

# text
# c1: jamming
seg-c11d0cb8e670 = O relatório imprime também o C/N₀ que o tipo de cenário <c1/> dá com a sua tabela de Q. A tabela contém os valores de manual, fixados nos testes face às formas fechadas:

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW e banda estreita: <c1/>.</b> Um tom CW sobre a portadora C/A tem <c2/>, pelo que <c3/>, e a tabela e os espectros concordam. No exemplo incluído, o tom dá { "17.98" } dB-Hz em ambos (a tabela dava { "19.74" } quando continha { "1.5" }).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Banda larga e varrido: <c1/>, desde a { "0.36" }.</b> Trata-se de ruído branco sobre o lóbulo principal, com a potência do sinal na banda normalizada a um, <c2/>. A tabela continha { "1" } até à { "0.36" }, cerca de { "3" } dB pessimista (<c3/>).

# text
seg-cd03b9c900e1 = O modelo de espectro deduz os seus próprios valores a partir dos espectros:

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> para ruído adaptado ao C/A (<c2/>);

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> para ruído plano de nulo a nulo sem a normalização (<c2/>).

# text
seg-6c2187f0e32b = Assim, para esses emissores de interferência, os dois valores de C/N₀ impressos continuam a diferir, por conceção.

# text
# c1: Q
seg-73dfbeabcac2 = Cada célula da cascata é a PSD média sobre o seu intervalo de frequência e a sua linha. Um varrimento é calculado exatamente como média sobre a linha, varrimentos completas mais a parcial; um emissor de interferência que liga ou desliga a meio de uma linha é ponderado pelo seu ciclo de trabalho. A cronologia de C/N₀ usa as mesmas médias, pelo que a imagem e os números concordam. Por banda, a cronologia reporta o J/S na banda (potência do emissor de interferência dentro da largura de banda do recetor sobre a potência do sinal). Por emissor de interferência e banda, o relatório dá o SSC, <c1/>, o J/S total, o J/S na banda e o C/N₀ em regime estacionário.

# text
seg-2c214a0a30be = O exemplo incluído

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/>: uma cronologia de { "60" } s, uma linha por segundo, uma antena de { "290" } K e um fator de ruído de { "2" } dB (patamar de −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = De { "10" } s a { "40" } s: um varrimento de { "16" } MHz em torno de L1, varrimentos de { "9" } µs, { "50" } mW a { "100" } m.

# text
seg-b85319af4f85 = A partir de { "30" } s: um tom CW na portadora L1, { "10" } mW a { "1" } km.

# text
seg-21e2b4e76832 = A partir de { "45" } s: ruído plano de { "2" } MHz em L2 recebido a −{ "135" } dBW.

# text
seg-45dd378c692c = O que a execução calcula:

# text
seg-eecd7d7530bf = C/N₀ mínimo

# text
seg-1ead35e1aad5 = Primeira perda

# text
seg-bfb55a322ece = Linhas em seguimento

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
seg-58b097691919 = O tom CW é a razão pela qual os dois sinais L1 se separam aos { "40" } s. Cai sobre o pico do espectro C/A e mantém o C/A em { "17.98" } dB-Hz, abaixo do limiar de { "25" } dB-Hz. Cai no nulo do espectro MBOC, pelo que o Galileo E1 regressa ao seu C/N₀ nominal quando o varrimento termina.

# text
seg-064579d5fbac = Os próprios sinais situam-se cerca de { "20" } dB abaixo do patamar de ruído, pelo que a cascata mostra o patamar e os emissores de interferência; as barras de C/N₀ mostram o que o desespalhamento recupera.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Os mesmos emissores de interferência conduzem uma missão encadeada em <c1/> (ver <a1>CAMPAIGNS.md</a1>): o relógio mantém-se em holdover enquanto o varrimento está ativo, e o recetor recorre ao Galileo E1 sob o tom CW.

# text
seg-6b0edbfca134 = Para além da banda L

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> coloca sinais de posicionamento, navegação e temporização (PNT) LEO em quatro bandas, junto do GPS L1 C/A e do Galileo E5a, cada banda com o seu próprio emissor de interferência, numa cronologia de { "60" } s. A cascata <c2/> é a banda L; três <c3/> acrescentam UHF ({ "455" } a { "475" } MHz), S ({ "2482" } a { "2502" } MHz) e C ({ "5005" } a { "5035" } MHz).

# text
seg-6818247b5863 = { "10" } s: um tom CW na portadora UHF, −{ "120" } dBW recebidos.

# text
seg-02de8390de31 = { "20" } s: o varrimento do exemplo da banda L ({ "16" } MHz em torno de L1, varrimentos de { "9" } µs, { "50" } mW a { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s: ruído de banda larga, { "40" } MHz em torno de { "1185" } MHz, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s: ruído de banda estreita, { "2" } MHz na portadora S, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s: ruído adaptado ao próprio espectro do sinal da banda C, −{ "124" } dBW.

# text
seg-abacb60b16a3 = O que a execução calcula (o C/N₀ dos sinais projetados é o do componente seguido, pelo que o valor nominal fica abaixo da potência total recebida na proporção do componente seguido):

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
seg-03bb124d45d2 = Só o varrimento retira um sinal (GPS L1 C/A, a partir de { "20" } s). Cada um dos outros emissores de interferência degrada apenas a banda que o seu espectro alcança: o ruído adaptado da banda C, por exemplo, tem um SSC de −{ "71.87" } dB/Hz com o sinal da banda C e inferior a −{ "133" } dB/Hz com todas as outras bandas.

# text
seg-a8bea652a85d = O mesmo mecanismo conduz os cenários de resiliência LEO-PNT (<a1>LEO-PNT.md</a1>):

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> faz subir em degraus de { "5" } dB, a cada { "10" } s, um emissor de interferência de barragem de { "40" } MHz a { "1185" } MHz, a partir de −{ "125" } dBW. O GPS L5 perde-se no degrau de −{ "105" } dBW, o Galileo E5a a −{ "100" } dBW e o Xona X5 a −{ "95" } dBW, enquanto um sinal LEO representativo da banda L recebido a −{ "135" } dBW ainda é seguido a −{ "90" } dBW: a potência recebida compra margem de J/S, dB por dB.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> é um varrimento de campanha de uma execução <c2/> sobre a potência de uma barragem na banda L5 (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> é uma campanha encadeada cujas fases leem o C/N₀ do GNSS e do LEO de execuções <c2/>, com painéis das bandas S e C.

# text
seg-42b00ae14ffe = IQ, SigMF e Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> desenha o modelo num instante como amostras complexas em fase e em quadratura (IQ), escreve-as como uma gravação SigMF (<c2/> ou <c3/>), lê a gravação de volta e estima a sua PSD pelo método de Welch (janela de Hann, sobreposição de { "50" } %, periodogramas médios, escalados em densidade). O ruído térmico, os sinais e os emissores de interferência semelhantes a ruído são desenhados intervalo a intervalo a partir da própria densidade do modelo; um tom e um varrimento são desenhados como formas de onda reais. Apenas com emissores de interferência semelhantes a ruído, a estimativa de Welch fica a { "0.1" } dB do modelo (mediana). Um varrimento periódico é um espectro de riscas à sua taxa de varrimento, com ondulação e caudas para além dos limites da sua banda que o modelo suave omite: no exemplo incluído, a potência total concorda dentro de { "0.02" } % e o intervalo mediano difere em { "0.5" } dB. A captura instantânea é um ficheiro escrito para análise; nada é transmitido e nenhum equipamento de rádio é acionado.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (apenas em compilações nativas) lê uma gravação SigMF real a partir de <c2/> (o ficheiro de dados tem por predefinição o mesmo nome base com <c3/>), estima a sua PSD e imprime-a junto do modelo nas frequências da gravação. Um ficheiro SigMF não tem calibração de potência absoluta, pelo que o relatório dá o desvio mediano e a forma, e não um nível.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = Na compilação WebAssembly, as leituras de ficheiros não estão disponíveis; <c1/> e <c2/> funcionam sobre bytes fornecidos pela página.

# text
seg-69b384afe05d = PSD de sinais e SSC

# text
# c1: jamming
seg-a65b87c51f05 = Lóbulo principal de BPSK(n) com 2n × { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados em ±{ "1.023" } MHz (Betz { "2001" }); SSC de −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz para C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) a partir das suas formas fechadas de Parseval, os valores por detrás dos publicados −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) e { "1.5" } (adaptado) (Kaplan & Hegarty §{ "9.4" }); as entradas da tabela do tipo de cenário <c1/> são iguais às formas fechadas: CW e banda estreita Q = { "1" }, banda larga e varrido Q = { "2" } (ruído branco sobre o lóbulo principal, potência na banda normalizada; { "1" } até à { "0.36" })

# text
seg-d2afc6e05969 = Cascata, J/S e cronologia de C/N₀

# text
# c1: jamming
seg-c44413d5a060 = Reduz-se exatamente à cadeia do tipo de cenário <c1/>; as potências, a cronologia e as larguras de banda dos emissores de interferência são entradas

# text
seg-304f4aeaf4cb = Codec SigMF e estimativa de Welch

# text
seg-7a642dd02e5c = Ida e volta, uma transformada de Fourier discreta direta, identidades de ruído branco e de Parseval; nenhuma gravação de terceiros consta do repositório

# text
seg-1138c9e62a21 = Cascata multibanda com sinais projetados e emissores de interferência por banda

# text
seg-ac38681004e9 = Reduz-se à cadeia da banda L (uma banda de um só componente dá os mesmos números que antes da extensão) e aos espectros de sinal validados; os sinais projetados, os emissores de interferência e as larguras de banda são entradas

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Uma correção a uma abreviatura corrente: os lóbulos do espectro BOC({ "1,1" }) estão <em>centrados</em> em ±{ "1.023" } MHz (entre o nulo da portadora e o nulo a { "2.046" } MHz), mas o máximo da PSD está em ±{ "0.759" } MHz, onde <c1/> com <c2/>. Os testes fixam ambos.

# text
seg-6ab6e241f7e5 = Estrutura de riscas do código de espalhamento (as riscas de { "1" } kHz do C/A): um tom é pontuado face à envolvente suave, e não face à risca de código mais próxima.

# text
seg-4be08100a707 = Controlo automático de ganho, quantização, supressão de impulsos e filtragem por filtro notch.

# text
seg-0f195ea4126e = O diagrama da antena de receção na direção do emissor de interferência para além de um único valor de ganho.

# text
seg-d3d03da9c962 = Interferência de acesso múltiplo entre satélites de uma mesma banda.

# text
seg-db5c7566f49e = As emissões de um sinal projetado fora da sua largura de banda de transmissão: o seu espectro é truncado aí, pelo que nenhuma emissão fora de banda chega a uma banda vizinha.

# text
seg-9cbea7151036 = O efeito de um varrimento sobre o ciclo a taxas de varrimento comparáveis à largura de banda do ciclo: o seu C/N₀ usa o espectro médio por linha.

# text
seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan e C. J. Hegarty (eds.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3.ª ed., Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, May/June { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = Especificação SigMF, <a1>https://sigmf.org/</a1> (código-fonte: <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Anterior</s1>Integridade e segurança

# text
seg-d5264da8bf65 = <s1>Seguinte</s1>Referência ARAIM
