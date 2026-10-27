# docs--kind-leo-signal: translations (pt-BR)

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
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-ae15d15bf151 = Página do tópico: <a1>LEO-PASS.md</a1>

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: a integral seno (sine_integral), a fração de potência de BPSK-R dentro de uma banda bilateral em forma fechada (bpsk_power_in_band_closed_form), a banda. Referência independente (ExternalDataset): Fixados externamente: { "90.3" } por cento de potência do lóbulo principal, o jitter coerente early-late no ponto de operação declarado, os valores tabelados da integral seno e o coeficiente de separação espectral própria de BPSK 2/({ "3" } R_c) em deslocamento zero. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor de BPSK limitada em banda e a sua assíntota, e o coeficiente de separação espectral de BPSK com deslocamento em deslocamentos não nulos, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, alocação da ITU; componentes de aquisição, de dados e piloto com BPSK(n), BOC(m,n), MB. Referência independente (InternalConsistency): As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos em si são entradas: as predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espectros de QPSK de Feher aprimorado, de code shift keying e de OFDM são aproximados, e a forma

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Fonte: <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (tipo de cenário)

# text
seg-97b8d07150d4 = Projetos de sinais LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO), para qualquer sistema, banda e estrutura. Um SINAL é uma banda (frequência central, largura de banda de transmissão, alocação da UIT RNSS/RDSS/MSS/EESS/non-RNSS/other) e componentes (aquisição, dados, piloto; qualquer subconjunto), cada um com uma modulação (BPSK(n) com n fracionário, BOC(m,n), MBOC({ "6,1" },p) ou uma banda plana do tipo OFDM), uma fração de potência, deslocamentos opcionais de subportadoras FDMA, um comprimento de código e uma taxa de dados. Os sinais vêm de arquivos de predefinições públicas compilados no programa (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada um com o URL da sua fonte e todo valor não publicado rotulado REPRESENTATIVE) ou são escritos em linha. POR SINAL: a densidade espectral de potência limitada em banda e a fração da potência de cada componente que a banda de transmissão deixa passar (forma fechada do BPSK ao lado do valor numérico), a largura de banda RMS (Gabor), o jitter térmico de rastreamento de código da malha de captura de atraso em função de C/N0 e do espaçamento adiantado-atrasado, a partir da fórmula adiantado-atrasado coerente (ou não coerente) limitada em banda de Betz & Kolodziejski { "2009" }, com a sua forma de manual para banda ilimitada e o seu limite de Gabor para espaçamento tendendo a zero, a precisão de medição de distância em metros, o espaço de busca de aquisição (células Doppler a partir do Doppler máximo da órbita mais os termos do oscilador e do usuário, vezes as células de código), a probabilidade de detecção de lei quadrática e o tempo médio de aquisição serial e paralela em código, o coeficiente de separação espectral do sinal em relação a GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e E5 AltBOC e de cada um deles em relação ao sinal com a degradação de C/N0, e os J/S de onda contínua, de banda larga e casado que o componente rastreado tolera, a partir do mecanismo de SSC do próprio tipo de cenário spectrum. UMA COMPARAÇÃO ENTRE BANDAS: atraso ionosférico de primeira ordem ({ "40.3" } TEC/f^{ "2" }), perda no espaço livre, precisão de medição de distância com o mesmo C/N0 e com o mesmo EIRP, e tolerância a interferidores. VERIFICAÇÕES DE FORMA opcionais confrontam o espectro de um projeto com uma medição descrita (consistência MODELLED). VALIDATED: as formas fechadas da potência em banda do BPSK ({ "90.3" } % no lóbulo principal) e da largura de banda de Gabor, o jitter limitado em banda que se reduz à forma coerente adiantado-atrasado de manual e ao seu limite de Gabor, o coeficiente de separação espectral do BPSK deslocado contra a sua forma fechada de Parseval, a área unitária do espectro AltBOC, e o Doppler máximo em LEO contra os valores publicados do Xona Pulsar (32-34 kHz) e do Iridium ({ "36" } kHz). MODELLED: todos os projetos, as divisões de potência e os níveis de C/N0 e de interferidor; os espectros EFQPSK, CSK e OFDM são aproximados.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Uma execução de <c1/> resume-se assim: scenario leo-signal | { "5" } signals | noise floor -202.0 dBW/Hz | finest ranging generic-c-wide { "0.022" } m at { "45.0" } dB-Hz

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
seg-0f29946fe4fb = Rótulo do resultado (o do motor): MODELLED: projetos parametrizados de sinais de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO), limitados em banda à sua largura de banda de transmissão. As formas fechadas subjacentes são VALIDATED (potência em banda do BPSK e largura de banda de Gabor, o jitter de rastreamento de código adiantado-atrasado limitado em banda que se reduz à forma de manua

# attr:alt
seg-8bf45b6989d1 = O gráfico que o motor escreve para scenarios/leo-band-trade.toml, tipo de cenário leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que citam este tipo de cenário.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: a integral seno (sine_integral), a fração de potência do BPSK-R dentro de uma banda bilateral em forma fechada (bpsk_power_in_band_closed_form), a largura de banda de Gabor do BPSK limitado em banda em forma fechada (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: o maior Doppler de satélite em uma passagem pelo zênite na máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c, a partir da portadora e da altitude orbital de cada predefinição; o tipo de cenário <c1/> acrescenta o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinais parametrizados (banda, largura de banda de transmissão, alocação da UIT; componentes de aquisição, dados e piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, frações de potência, subportadoras FDMA, comprimentos de código e taxas de dados Testes: <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> O tipo de cenário <c1/> estendido além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com todos os componentes, limitado em banda à largura de banda de transmissão, com C/N0 e J/S referidos ao componente rastreado) ou como uma portadora e uma modulação personalizadas Testes: <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: o maior Doppler de satélite em uma passagem pelo zênite na máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c,. Referência independente (ExternalDataset): valores publicados: Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler do Iridium de até +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). A rotação da Terra é deixada de fora, o que desloca o valor em até cerca de { "2.3" } kHz; ambos os valores publicados são atingidos sem ela.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = os espectros exatos de QPSK de Feher aprimorado, de chaveamento por deslocamento de código e de OFDM: um envelope BPSK de chips retangulares ou uma banda plana toma o seu lugar, como cada predefinição declara (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = estrutura de linhas espectrais do código de espalhamento e correlação cruzada de acesso múltiplo entre códigos (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = os filtros de transmissão e de recepção além de um filtro ideal de parede de tijolo na largura de banda de transmissão: sem emissão fora da banda, sem atraso de grupo do filtro (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = multipercurso, quantização no receptor e controle automático de ganho (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = rotação da Terra no limite de Doppler (até cerca de { "0.46" } km/s de taxa de variação da distância no equador) (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = atraso ionosférico além da primeira ordem, e a divisão do conteúdo eletrônico acima e abaixo de um satélite LEO: o TEC oblíquo é uma entrada (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = perdas atmosféricas, por chuva e de polarização: compara-se apenas a perda no espaço livre (a chuva importa na banda C) (resultado <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = aquisição além de um único tempo de integração com penalidade de falso alarme: sem lógica de verificação de múltiplos tempos de integração, com um a priori uniforme de fase de código e o pior caso de cavalgamento (resultado <c1/>)

# text
seg-8eefe4197d7f = <s1>Anterior</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Próximo</s1>link-budget
