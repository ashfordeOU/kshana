# docs--kind-leo-signal: translations (pt-PT)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-1918189ac2bf = ppm

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-ae15d15bf151 = Página do tema: <a1>LEO-PASS.md</a1>

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: o integral seno (sine_integral), a fração de potência BPSK-R dentro de uma banda de dois lados em forma fechada (bpsk_power_in_band_closed_form), a banda-. Referência independente (ExternalDataset): Fixados externamente: { "90.3" } por cento de potência no lóbulo principal, o jitter coerente early-late no ponto de funcionamento indicado, os valores tabelados do integral seno e o coeficiente de separação espetral própria BPSK 2/({ "3" } R_c) com desvio nulo. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor BPSK limitada em banda e a sua assíntota, e o coeficiente de separação espetral BPSK com desvio, para desvios não nulos, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição da ITU; componentes de aquisição, de dados e piloto com BPSK(n), BOC(m,n), MB. Referência independente (InternalConsistency): As formas fechadas validadas das duas linhas anteriores, a identidade de falso alarme da lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos propriamente ditos são entradas: as predefinições assinaladas como REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espetros QPSK de Feher melhorado, de modulação por deslocamento de código e OFDM são aproximados, e a forma

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Fonte: <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (tipo de cenário)

# text
seg-97b8d07150d4 = Projetos de sinais LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) de órbita terrestre baixa (LEO) para qualquer sistema, banda e estrutura. Um SINAL é uma banda (frequência central, largura de banda de transmissão, atribuição da ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) e componentes (aquisição, dados, piloto; qualquer subconjunto), cada um com uma modulação (BPSK(n) com n fracionário, BOC(m,n), MBOC({ "6,1" },p) ou uma banda plana do tipo OFDM), uma quota de potência, desvios opcionais de subportadoras FDMA, um comprimento de código e uma taxa de dados. Os sinais provêm de ficheiros de predefinições públicas compilados no programa (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada um com o seu URL de origem e cada valor não publicado etiquetado REPRESENTATIVE) ou são escritos em linha. POR SINAL: a densidade espetral de potência limitada em banda e a fração da potência de cada componente que a banda de transmissão deixa passar (forma fechada BPSK a par do valor numérico), a largura de banda RMS (Gabor), o jitter térmico de seguimento de código do laço de bloqueio de atraso em função do C/N0 e do espaçamento early-late a partir da fórmula early-late coerente (ou não coerente) limitada em banda de Betz & Kolodziejski { "2009" }, com a sua forma de manual de banda ilimitada e o seu limite de Gabor para espaçamento nulo, a exatidão de medição de distâncias em metros, o espaço de pesquisa de aquisição (células de Doppler a partir do Doppler máximo da órbita mais termos do oscilador e do utilizador, vezes células de código), a probabilidade de deteção de lei quadrática e o tempo médio de aquisição em série e com código em paralelo, o coeficiente de separação espetral do sinal para o GPS L1 C/A, o Galileo E1, o GPS L5, o Galileo E5a, E5b e E5 AltBOC e de cada um para o sinal com a degradação do C/N0, e o J/S CW, de banda larga e adaptado que a componente seguida tolera, a partir da maquinaria SSC do próprio tipo de cenário spectrum. Um COMPROMISSO DE BANDA: atraso ionosférico de primeira ordem ({ "40.3" } TEC/f^{ "2" }), perda no espaço livre, exatidão de medição de distâncias com igual C/N0 e com igual EIRP, e tolerância a jammers. VERIFICAÇÕES DE FORMA opcionais confrontam o espetro de um projeto com uma medição descrita (consistência MODELLED). VALIDATED: as formas fechadas da potência BPSK em banda ({ "90.3" } % no lóbulo principal) e da largura de banda de Gabor, o jitter limitado em banda a reduzir-se à forma early-late coerente dos manuais e ao seu limite de Gabor, o coeficiente de separação espetral BPSK com desvio face à sua forma fechada de Parseval, a área unitária do espetro AltBOC e o Doppler LEO máximo face aos valores publicados do Xona Pulsar (32-34 kHz) e do Iridium ({ "36" } kHz). MODELLED: cada projeto, repartição de potência, C/N0 e nível de jammer; os espetros EFQPSK, CSK e OFDM são aproximados.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Uma execução de <c1/> resume-se assim: cenário leo-signal | { "5" } sinais | piso de ruído -202.0 dBW/Hz | melhor medição de distâncias generic-c-wide { "0.022" } m a { "45.0" } dB-Hz

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-b538d3ff9fdb = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/leo-band-trade.toml
seg-6aaf62f55e65 = O exemplo <c1/> define, entre outros:

# text
seg-9fd02351d844 = ms

# text
seg-05e8854de548 = chip

# text
seg-d12bc1d2b815 = coerente

# text
seg-0f29946fe4fb = Etiqueta do resultado (a do motor): MODELLED: projetos de sinais parametrizados de posicionamento, navegação e temporização (PNT) de órbita terrestre baixa (LEO), limitados em banda à sua largura de banda de transmissão. As formas fechadas subjacentes são VALIDATED (potência BPSK em banda e largura de banda de Gabor, o jitter de seguimento de código early-late limitado em banda a reduzir-se à forma dos manu

# attr:alt
seg-8bf45b6989d1 = O gráfico que o motor escreve para scenarios/leo-band-trade.toml, tipo de cenário leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: o integral seno (sine_integral), a fração de potência BPSK-R dentro de uma banda de dois lados em forma fechada (bpsk_power_in_band_closed_form), a largura de banda de Gabor BPSK limitada em banda em forma fechada (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: o maior Doppler de satélite numa passagem zenital à máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c, a partir da portadora e da altitude orbital de cada predefinição; o tipo de cenário <c1/> acrescenta o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição da ITU; componentes de aquisição, de dados e piloto com BPSK(n), BOC(m,n), MBOC ou espetros planos, quotas de potência, subportadoras FDMA, comprimentos de código e taxas de dados Ensaios: <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> O tipo de cenário <c1/> alargado para além da banda L: bandas indicadas como um projeto de sinal predefinido (desenhado com todas as componentes, limitado em banda à largura de banda de transmissão, C/N0 e J/S referidos à componente seguida) ou como uma portadora e uma modulação personalizadas Ensaios: <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: o maior Doppler de satélite numa passagem zenital à máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c,. Referência independente (ExternalDataset): Valores publicados: Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler do Iridium até +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). A rotação da Terra é deixada de fora, o que desloca o valor até cerca de { "2.3" } kHz; ambos os valores publicados são atingidos sem ela.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = os espetros exatos do QPSK de Feher melhorado, da modulação por deslocamento de código e do OFDM: em seu lugar entra uma envolvente BPSK de chips retangulares ou uma banda plana, como cada predefinição indica (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = a estrutura de riscas dos códigos de espalhamento e a correlação cruzada de acesso múltiplo entre códigos (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = os filtros de transmissão e de receção para além de uma parede de tijolo ideal à largura de banda de transmissão: sem emissão fora de banda, sem atraso de grupo do filtro (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = multipercurso, quantização no recetor e controlo automático de ganho (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = a rotação da Terra no limite do Doppler (até cerca de { "0.46" } km/s de taxa de variação da distância no equador) (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = o atraso ionosférico para além da primeira ordem, e a repartição do conteúdo eletrónico acima e abaixo de um satélite LEO: o TEC oblíquo é uma entrada (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = perdas atmosféricas, por chuva e de polarização: compara-se apenas a perda no espaço livre (a chuva é relevante na banda C) (resultado <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = aquisição para além de uma única permanência com uma penalização por falso alarme: sem lógica de verificação de várias permanências, com uma distribuição a priori uniforme da fase do código e o pior caso de sobreposição (resultado <c1/>)

# text
seg-8eefe4197d7f = <s1>Anterior</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Seguinte</s1>link-budget
