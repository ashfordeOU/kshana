# docs--kinds-low-earth-orbit-navigation: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-867f3e41b5ab = Mensagem de navegação LEO: as efemérides e o relógio transmitidos de um satélite de posicionamento, navegação e temporização em órbita terrestre baixa (LEO), para qualquer órbita, portadora e modelo, com predefinições nomeadas opcionais (Xona Pulsar, Iridium, Starlink, CentiSpace, um sistema representativo em banda C, o modelo ATOMIC de relógio zero, Celeste IOD). CONTEÚDO: dados auxiliares (SVID, número de emissão dos dados, banda, saúde do sinal), sincronização (semana, tempo da semana, um polinómio de relógio de segunda ordem af0-af2 em torno de toc), efemérides num de quatro modelos -- o conjunto kepleriano de 16 parâmetros do Galileo OS SIS ICD; esse conjunto mais polinómios de correção ao longo da trajetória, transversais e radiais; o modelo de 22 parâmetros de Liu et al. { "2025" }; um polinómio ECEF sem termos de relógio (ATOMIC de relógio zero) -- e outros serviços (um conjunto de transmissão de Klobuchar, ai0-ai2 do NeQuick-G com o nível efetivo de ionização, e parâmetros de tempo do sistema para UTC com a lógica de segundos intercalares do ICD). AJUSTADOR: uma órbita-verdade integrada com gravidade zonal J2-J6 ou EGM2008 até ao grau escolhido e arrasto, e um relógio livre ou conduzido com semente; ajuste de Levenberg-Marquardt do conjunto kepleriano em elementos não singulares, depois polinómios de correção por mínimos quadrados lineares; relógio ajustado líquido do termo relativístico que o utilizador acrescenta. ANÁLISES: fit-interval-trade (erro de distância do sinal no espaço, SISRE, com pesos médios globais para a altitude da órbita, em função do intervalo de ajuste e do período de atualização, apenas órbita e com relógio), model-comparison (quatro modelos, número de parâmetros, bits codificados e o ajuste do Kshana nas altitudes de Liu et al. ao lado dos valores publicados), midpass-update (a passagem mais alta sobre um utilizador, o salto de posição, de relógio e de distância do utilizador a cada troca de mensagem, o salto na pior geometria, PASS/FAIL contra um limiar de continuidade), encode-decode (o quadro binário documentado do próprio Kshana com CRC-24Q, um orçamento de quantização de meio passo por campo, uma verificação de quadro corrompido, uma exportação e importação de registo no estilo RINEX 4 rotulada como extensão do Kshana, e uma tabela CSV). VALIDATED: os pesos do SISRE contra a tabela MEO/GEO publicada (Montenbruck et al. { "2018" }); o algoritmo de utilizador do Galileo contra o RTKLIB em efemérides de transmissão reais do Galileo; o CRC-24Q contra o seu valor de verificação de catálogo e o quadro de exemplo RTCM { "1005" }. MODELLED: cada valor de ajuste e de SISRE é erro de representação contra uma verdade integrada pelo Kshana (sem erro de determinação ou predição de órbita); a comparação com Liu et al. usa órbitas diferentes; os formatos de codificação e de texto são do próprio Kshana.

# attr:alt
seg-35e92abc6a23 = O gráfico que o motor gera para scenarios/leo-navmsg-celeste-iod.toml, tipo de cenário leo-navmsg

# text
seg-c3861f7d717c = Passagem LEO e balanço de enlace, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa), agnóstico de sistema: um utilizador (em terra, no mar, no ar ou em ambiente fechado, estático ou em movimento) e um ou mais satélites LEO a partir de uma PASS PROJETADA (uma órbita circular posicionada de modo que o utilizador veja uma passagem de uma elevação máxima escolhida num instante escolhido, heliossíncrona se pedido), ELEMENTOS explícitos, um TLE (conjunto de elementos de duas linhas) pelo SGP4 do motor, ou uma constelação WALKER construída pelo código constellation-design (as passagens mais altas indicadas). As bandas vêm de uma predefinição nomeada (UHF/L/S/C genérica multibanda, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como um sinal de oportunidade apenas de Doppler, CentiSpace, e uma predefinição opcional Celeste IOD marcada WORKSHOP) ou são escritas no cenário; cada predefinição declara se os seus números são PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP. Por satélite, banda e época: elevação, azimute, distância, taxa de variação da distância e aceleração da distância; perda no espaço livre; EIRP e o ganho do diagrama do satélite (isofluxo, feixe gaussiano ou plano); ganho da antena do utilizador em função da elevação (patch, hemisférica ou isotrópica); atenuação gasosa (ITU-R P.676-10 Anexo { "2" }), atenuação por chuva (coeficientes da ITU-R P.838-3 e o procedimento da P.618-14, a partir de uma taxa de chuva e uma altura de chuva), cintilação troposférica (ITU-R P.618-14 secção { "2.4.1" }), perda de penetração em edifícios para um utilizador em ambiente fechado (ITU-R P.2109-2), descasamento de polarização, temperatura de ruído do sistema e C/N0 (densidade de portadora sobre ruído); Doppler e taxa de Doppler em forma fechada a partir da taxa de variação e da aceleração da distância, cada uma conferida contra diferenças centrais; o atraso ionosférico de primeira ordem { "40.3" } STEC/f^{ "2" } a partir de um TEC oblíquo de Klobuchar ou de TEC vertical, escalado para a parte da ionosfera abaixo do satélite. Pares de bandas recebem os coeficientes livres de ionosfera, a amplificação de ruído e o ruído de código no pico da passagem. Satélites GNSS em MEO (predefinições do Galileo ou do GPS) são avaliados com o mesmo modelo de antena e de ruído a partir das potências recebidas dos seus documentos de interface, de modo que a passagem LEO em forma de sino e as portadoras GNSS planas partilham um mesmo gráfico. Uma secção opcional [iot] fornece tempo até à primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência de recetor declarado (MODELLED). Cada par de bandas fornece também o TEC oblíquo que a sua combinação livre de geometria recupera no pico e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Uma secção opcional [spoofer] falsifica os sinais de uma posição alegada que salta ou é empurrada para longe da verdadeira depois de um início e executa dois monitores com probabilidades de falso alarme e de deteção perdida declaradas: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes, um teste de qui-quadrado de mínimos quadrados generalizados sobre uma janela, nos canais GNSS, LEO e em todos) e consistência entre bandas (o passo de época a época da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO), com estatísticas por época e o momento em que cada monitor deteta (MODELLED). Componentes VALIDATED: perda no espaço livre, os coeficientes da P.838-3 contra a sua Tabela { "5" }, os procedimentos de chuva e cintilação da P.618-14 e a perda de penetração em edifícios da P.2109 contra os exemplos de validação do Grupo de Estudos { "3" } da ITU-R, a razão de atraso de grupo L1/L2 do IS-GPS-200 e o Doppler máximo de utilizador estático numa órbita circular contra a Tabela { "1" } do arXiv { "2509.19551" }. MODELLED: EIRPs, diagramas, a fração de Chapman do TEC abaixo do satélite e a passagem inteira.

# attr:alt
seg-02ae51cfada6 = O gráfico que o motor escreve para scenarios/leo-pass-iridium.toml, tipo de cenário leo-pass

# text
seg-81d1604171a5 = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir da órbita terrestre baixa) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal indicado por signal_design (uma predefinição pública ou um projeto [signal] em linha) define o centro, a largura de banda, a taxa de chips e a repartição da EIRP de uma banda [pass], o orçamento de ligação leo-pass fornece o C/N0 seguido e o jitter de código limitado em banda ao longo da passagem, uma reta de C/N0 em sin(elevação) e o SISRE de difusão da mensagem [navmsg] (ajustado à altitude do satélite da passagem) alimentam todos os sistemas LEO da solução de posição conjunta leo-pvt de [fusion] e, opcionalmente, os casos leo-ppp de [ppp]; cada transferência é listada com o seu valor e unidade. MODELLED.

# attr:alt
seg-abe0599498c9 = O gráfico que o motor escreve para scenarios/leo-pnt-end-to-end.toml, tipo de cenário leo-pnt-chain

# text
seg-32a570f1a4fa = Convergência do posicionamento pontual preciso (PPP) só com GNSS e com aumento por LEO: um filtro de Kalman estendido de parâmetros flutuantes sobre código e fase da portadora sem ionosfera, com as coordenadas estáticas da estação, um relógio do recetor branco, um desvio entre sistemas por cada sistema adicional, um atraso zenital húmido em passeio aleatório projetado por 1/sin(elevação) e uma ambiguidade flutuante por arco de satélite; o erro preciso de órbita e relógio é branco e comum ao código e à fase de um satélite, pelo que cada satélite é uma atualização correlacionada de duas linhas, numa forma estabilizada de Joseph. As medições são simuladas a partir do mesmo modelo com ruído de semente fixa, em vários locais e sementes, e cada caso (primeiro só GNSS, depois cada [[case]] de sistemas LEO, qualquer constelação ou predefinição) indica o tempo de convergência mediano (a primeira época a partir da qual os erros horizontal e vertical se mantêm abaixo dos limiares, { "10" } cm por predefinição), a fração convergida, as curvas de erro medianas e a consistência do filtro (o NEES da posição médio da execução face à banda do qui-quadrado bilateral de { "95" }%). Opcionalmente, a par dos valores de latitudes médias publicados por Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min para multi-GNSS, encurtados para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo.

# attr:alt
seg-225ef04c64af = O gráfico que o motor escreve para scenarios/leo-ppp-convergence.toml, tipo de cenário leo-ppp

# text
seg-093aac4b5ff1 = Posicionamento, navegação e temporização (PNT) fundidos de órbita terrestre média (MEO) e órbita terrestre baixa (LEO) sobre QUALQUER constelação: cada [[system]] é uma predefinição GNSS do tipo de cenário constellation-design, uma predefinição LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, o modelo de efemérides atomic-zero-clock, ou outro ficheiro de predefinição, cada um no seu próprio ficheiro com as fontes assinaladas como PUBLIC, WORKSHOP ou DERIVED), camadas Walker ou conjuntos de elementos explícitos, com uma portadora, uma taxa de chips, uma envolvente da densidade de ruído da portadora (C/N0) desde a máscara de elevação até ao zénite, um erro de distância do sinal no espaço (SISRE), um sigma de Doppler e um modelo de relógio (o seu próprio relógio do recetor, pelo que o desvio entre sistemas é estimado, ou um desvio de difusão conhecido). Quatro modos. DOPPLER: posicionamento em lote por Gauss-Newton a partir da taxa de variação da distância, com derivadas parciais analíticas, estados de deriva do relógio e de velocidade opcionais e uma restrição de altura opcional, com um ou vários satélites, o erro em função da duração da janela, a envolvente do Doppler, da taxa de Doppler e do jerk de cada sistema LEO, e a exatidão ao longo da trajetória e transversal numa única passagem em função do desvio transversal (o erro transversal cresce sem limite à medida que a passagem se torna zenital; uma única passagem tem também uma solução espelhada através do traço no solo). Aqui executa-se um sinal de oportunidade só com Doppler (starlink-sop). JOINT: soluções de pseudodistância por mínimos quadrados ponderados em cada época, só com GNSS, só com LEO e com ambos, sigmas por medição a partir de um modelo de ruído térmico do laço de bloqueio de atraso em C/N0 mais o SISRE (ou um sigma fixo, de modo que um modelo de sinal os possa alimentar), os desvios entre sistemas estimados e PDOP/HDOP/VDOP em função do número de satélites LEO acrescentados. POLAR: satélites à vista e DOP em função da latitude para GNSS, LEO e ambos. TIMING: transferência de tempo para o Tempo Universal Coordenado (UTC) a partir de satélites LEO numa posição conhecida, com um filtro de relógio de dois estados cujo ruído de processo provém das classes de osciladores do motor, em função do C/N0 e do oscilador, e a expressão do IS-GPS-200 do tempo do sistema para o UTC; com [timing] trace = true cada linha indica também o seu erro de tempo e o sigma previsto em cada época. VALIDATED: o maior Doppler de uma passagem do zénite ao horizonte face aos valores publicados do Iridium (até { "36" } kHz) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz). MODELLED: tudo o resto; o DOP é verificado face a um caso derivado à mão, as soluções de posição face à sua covariância e o modelo de Doppler face à identidade da aceleração da distância.

# attr:alt
seg-90361a6f4e3c = O gráfico que o motor escreve para scenarios/leo-pvt-fjord-skyline.toml, tipo de cenário leo-pvt

# text
seg-97b8d07150d4 = Projetos de sinais LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) de órbita terrestre baixa (LEO) para qualquer sistema, banda e estrutura. Um SINAL é uma banda (frequência central, largura de banda de transmissão, atribuição da ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) e componentes (aquisição, dados, piloto; qualquer subconjunto), cada um com uma modulação (BPSK(n) com n fracionário, BOC(m,n), MBOC({ "6,1" },p) ou uma banda plana do tipo OFDM), uma quota de potência, desvios opcionais de subportadoras FDMA, um comprimento de código e uma taxa de dados. Os sinais provêm de ficheiros de predefinições públicas compilados no programa (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada um com o seu URL de origem e cada valor não publicado etiquetado REPRESENTATIVE) ou são escritos em linha. POR SINAL: a densidade espetral de potência limitada em banda e a fração da potência de cada componente que a banda de transmissão deixa passar (forma fechada BPSK a par do valor numérico), a largura de banda RMS (Gabor), o jitter térmico de seguimento de código do laço de bloqueio de atraso em função do C/N0 e do espaçamento early-late a partir da fórmula early-late coerente (ou não coerente) limitada em banda de Betz & Kolodziejski { "2009" }, com a sua forma de manual de banda ilimitada e o seu limite de Gabor para espaçamento nulo, a exatidão de medição de distâncias em metros, o espaço de pesquisa de aquisição (células de Doppler a partir do Doppler máximo da órbita mais termos do oscilador e do utilizador, vezes células de código), a probabilidade de deteção de lei quadrática e o tempo médio de aquisição em série e com código em paralelo, o coeficiente de separação espetral do sinal para o GPS L1 C/A, o Galileo E1, o GPS L5, o Galileo E5a, E5b e E5 AltBOC e de cada um para o sinal com a degradação do C/N0, e o J/S CW, de banda larga e adaptado que a componente seguida tolera, a partir da maquinaria SSC do próprio tipo de cenário spectrum. Um COMPROMISSO DE BANDA: atraso ionosférico de primeira ordem ({ "40.3" } TEC/f^{ "2" }), perda no espaço livre, exatidão de medição de distâncias com igual C/N0 e com igual EIRP, e tolerância a jammers. VERIFICAÇÕES DE FORMA opcionais confrontam o espetro de um projeto com uma medição descrita (consistência MODELLED). VALIDATED: as formas fechadas da potência BPSK em banda ({ "90.3" } % no lóbulo principal) e da largura de banda de Gabor, o jitter limitado em banda a reduzir-se à forma early-late coerente dos manuais e ao seu limite de Gabor, o coeficiente de separação espetral BPSK com desvio face à sua forma fechada de Parseval, a área unitária do espetro AltBOC e o Doppler LEO máximo face aos valores publicados do Xona Pulsar (32-34 kHz) e do Iridium ({ "36" } kHz). MODELLED: cada projeto, repartição de potência, C/N0 e nível de jammer; os espetros EFQPSK, CSK e OFDM são aproximados.

# attr:alt
seg-8bf45b6989d1 = O gráfico que o motor escreve para scenarios/leo-band-trade.toml, tipo de cenário leo-signal

# text
seg-4f0edb786a35 = Posicionamento a partir de uma ligação descendente de uma rede não terrestre (NTN) 5G na banda S do serviço móvel por satélite (MSS) (banda 3GPP n256, ligação descendente de { "2170" } a { "2200" } MHz; portadora predefinida de { "2172.5" } MHz): o limite de Cramér-Rao (CRB) para o tempo de chegada, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), com beta a largura de banda quadrática média (de Gabor) do espetro OFDM plano (B/sqrt({ "12" })), e para o Doppler de um tom complexo, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), para cada sinal (por predefinição, um canal New Radio de { "5" } MHz com { "4.5" } MHz ocupados e um canal de banda estreita de { "200" } kHz com { "180" } kHz ocupados); depois, sobre qualquer constelação LEO, soluções de posição por tempo de chegada na ligação descendente com um relógio do recetor desconhecido (de semente fixa, com o limite mais um erro de sincronização da rede como sigma), o seu PDOP e o sigma 3D formal, e uma solução de posição por Doppler com um único satélite sobre a passagem mais longa com a altura mantida. MODELLED: o passo da largura de banda para o limite é a forma fechada dos manuais, verificada face à integração numérica dos espetros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a exatidão do posicionamento é um limite num canal sem multipercurso com um erro de sincronização indicado, não um resultado alcançado.

# attr:alt
seg-c200240dd65e = O gráfico que o motor escreve para scenarios/ntn-5g-positioning.toml, tipo de cenário ntn-positioning

# text
seg-4e31c8daf798 = Registo

# text
seg-6800289a282d = { "7" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Fonte: <c1/>

# text
seg-561a783e9516 = Navegação em órbita terrestre baixa (família de tipos de cenário)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Páginas de tema: <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. Executar uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Folha de contactos dos gráficos que o motor escreve para os tipos da família Navegação em órbita terrestre baixa

# text
seg-1e724b481e67 = Projetos de sinais LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO) para qualquer sistema, banda e estrutura.

# text
seg-82ad7da67939 = Passagem LEO e orçamento de ligação, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa), independente do sistema: um utilizador (terrestre, marítimo, aéreo ou interior, estático ou em movimento) e um ou mai

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = Mensagem de navegação LEO: as efemérides e o relógio difundidos de um satélite de posicionamento, navegação e temporização em órbita terrestre baixa (LEO), para qualquer órbita, portadora e modelo, com predefinições nomeadas opcionais (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Posicionamento, navegação e temporização (PNT) fundidos em órbita terrestre média (MEO) e baixa (LEO) sobre QUAISQUER constelações: cada [[system]] é uma predefinição GNSS do tipo constellation-design, uma predefinição LEO

# text
seg-d9e5f4726bbb = Convergência do posicionamento de ponto preciso (PPP) apenas com GNSS e com aumentação LEO: um filtro de Kalman estendido flutuante sobre código e fase da portadora sem ionosfera com as coordenadas estáticas da estação, um

# text
seg-44f4148f4a5f = Posicionamento a partir de uma ligação descendente de rede não terrestre (NTN) 5G na banda S do serviço móvel por satélite (MSS) (banda 3GPP n256, ligação descendente de { "2170" } a { "2200" } MHz; portadora predefinida { "2172.5" } MHz): o limite de Cramér-Rao

# text
seg-1ee838a551ef = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal indicado por signal_design (uma predefinição pública ou um [s em linha

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-70d1ac6ddc95 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-472d9e86ee20 = <b>Registo:</b> MODELLED { "2" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-signal</a1>.

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-17d1c06ba5c5 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-9a7671c30d7e = <b>Registo:</b> MODELLED { "7" } · VALIDATED { "5" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pass</a1>.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-cba2c7f7050a = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-7ba3e667487d = <b>Registo:</b> MODELLED { "5" } · VALIDATED { "6" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-navmsg</a1>.

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-8ca53a87d092 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-389c67090de1 = <b>Registo:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pvt</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-e004092d6056 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e485df9372e6 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-ppp</a1>.

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-089266c42199 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e0a3133f468f = <b>Registo:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>ntn-positioning</a1>.

# text
# c1: signal_design
# c2: pass
# c3: fusion
# c4: name
# c5: description
# c6: seed
# c7: signal
# c8: navmsg
# c9: od_sisre_m
# c10: ppp
seg-ea759d0040db = Campos obrigatórios: <c1/>, <c2/>, <c3/>. Opcionais: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-db08b7916378 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pnt-chain</a1>.

# text
seg-534d13455a76 = <s1>Anterior</s1>Jamming, spoofing e o espetro

# text
seg-ec3fb19fb5bd = <s1>Seguinte</s1>Lunar e cislunar
