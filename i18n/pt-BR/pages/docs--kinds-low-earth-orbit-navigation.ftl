# docs--kinds-low-earth-orbit-navigation: translations (pt-BR)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-867f3e41b5ab = Mensagem de navegação LEO: as efemérides e o relógio transmitidos de um satélite de posicionamento, navegação e temporização em órbita terrestre baixa (LEO), para qualquer órbita, portadora e modelo, com predefinições nomeadas opcionais (Xona Pulsar, Iridium, Starlink, CentiSpace, um sistema representativo em banda C, o modelo ATOMIC de relógio zero, Celeste IOD). CONTEÚDO: dados auxiliares (SVID, número de emissão dos dados, banda, saúde do sinal), sincronização (semana, tempo da semana, um polinômio de relógio de segunda ordem af0-af2 em torno de toc), efemérides em um de quatro modelos -- o conjunto kepleriano de 16 parâmetros do Galileo OS SIS ICD; esse conjunto mais polinômios de correção ao longo da trilha, transversais e radiais; o modelo de 22 parâmetros de Liu et al. { "2025" }; um polinômio ECEF sem termos de relógio (ATOMIC de relógio zero) -- e outros serviços (um conjunto de transmissão de Klobuchar, ai0-ai2 do NeQuick-G com o nível efetivo de ionização, e parâmetros de tempo do sistema para UTC com a lógica de segundos intercalares do ICD). AJUSTADOR: uma órbita-verdade integrada com gravidade zonal J2-J6 ou EGM2008 até o grau escolhido e arrasto, e um relógio livre ou conduzido com semente; ajuste de Levenberg-Marquardt do conjunto kepleriano em elementos não singulares, depois polinômios de correção por mínimos quadrados lineares; relógio ajustado líquido do termo relativístico que o usuário acrescenta. ANÁLISES: fit-interval-trade (erro de distância do sinal no espaço, SISRE, com pesos médios globais para a altitude da órbita, em função do intervalo de ajuste e do período de atualização, apenas órbita e com relógio), model-comparison (quatro modelos, número de parâmetros, bits codificados e o ajuste do Kshana nas altitudes de Liu et al. ao lado dos valores publicados), midpass-update (a passagem mais alta sobre um usuário, o salto de posição, de relógio e de distância do usuário a cada troca de mensagem, o salto na pior geometria, PASS/FAIL contra um limiar de continuidade), encode-decode (o quadro binário documentado do próprio Kshana com CRC-24Q, um orçamento de quantização de meio passo por campo, uma verificação de quadro corrompido, uma exportação e importação de registro no estilo RINEX 4 rotulada como extensão do Kshana, e uma tabela CSV). VALIDATED: os pesos do SISRE contra a tabela MEO/GEO publicada (Montenbruck et al. { "2018" }); o algoritmo de usuário do Galileo contra o RTKLIB em efemérides de transmissão reais do Galileo; o CRC-24Q contra o seu valor de verificação de catálogo e o quadro de exemplo RTCM { "1005" }. MODELLED: todo valor de ajuste e de SISRE é erro de representação contra uma verdade integrada pelo Kshana (sem erro de determinação ou predição de órbita); a comparação com Liu et al. usa órbitas diferentes; os formatos de codificação e de texto são do próprio Kshana.

# attr:alt
seg-35e92abc6a23 = O gráfico que o motor gera para scenarios/leo-navmsg-celeste-iod.toml, tipo de cenário leo-navmsg

# text
seg-c3861f7d717c = Passagem LEO e balanço de enlace, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa), agnóstico de sistema: um usuário (em terra, no mar, no ar ou em ambiente fechado, estático ou em movimento) e um ou mais satélites LEO a partir de uma PASSAGEM PROJETADA (uma órbita circular posicionada de modo que o usuário veja uma passagem de uma elevação máxima escolhida em um instante escolhido, heliossíncrona se pedido), ELEMENTOS explícitos, um TLE (conjunto de elementos de duas linhas) pelo SGP4 do motor, ou uma constelação WALKER construída pelo código constellation-design (as passagens mais altas informadas). As bandas vêm de uma predefinição nomeada (UHF/L/S/C genérica multibanda, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como um sinal de oportunidade apenas de Doppler, CentiSpace, e uma predefinição opcional Celeste IOD marcada WORKSHOP) ou são escritas no cenário; cada predefinição declara se os seus números são PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP. Por satélite, banda e época: elevação, azimute, distância, taxa de variação da distância e aceleração da distância; perda no espaço livre; EIRP e o ganho do diagrama do satélite (isofluxo, feixe gaussiano ou plano); ganho da antena do usuário em função da elevação (patch, hemisférica ou isotrópica); atenuação gasosa (ITU-R P.676-10 Anexo { "2" }), atenuação por chuva (coeficientes da ITU-R P.838-3 e o procedimento da P.618-14, a partir de uma taxa de chuva e uma altura de chuva), cintilação troposférica (ITU-R P.618-14 seção { "2.4.1" }), perda de penetração em edificações para um usuário em ambiente fechado (ITU-R P.2109-2), descasamento de polarização, temperatura de ruído do sistema e C/N0 (densidade de portadora sobre ruído); Doppler e taxa de Doppler em forma fechada a partir da taxa de variação e da aceleração da distância, cada uma conferida contra diferenças centrais; o atraso ionosférico de primeira ordem { "40.3" } STEC/f^{ "2" } a partir de um TEC oblíquo de Klobuchar ou de TEC vertical, escalado para a parte da ionosfera abaixo do satélite. Pares de bandas recebem os coeficientes livres de ionosfera, a amplificação de ruído e o ruído de código no pico da passagem. Satélites GNSS em MEO (predefinições do Galileo ou do GPS) são avaliados com o mesmo modelo de antena e de ruído a partir das potências recebidas dos seus documentos de interface, de modo que a passagem LEO em forma de sino e as portadoras GNSS planas compartilham um mesmo gráfico. Uma seção opcional [iot] fornece tempo até a primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência de receptor declarado (MODELLED). Cada par de bandas fornece também o TEC oblíquo que a sua combinação livre de geometria recupera no pico e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Uma seção opcional [spoofer] falsifica os sinais de uma posição alegada que salta ou é empurrada para longe da verdadeira depois de um início e executa dois monitores com probabilidades de falso alarme e de detecção perdida declaradas: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes, um teste de qui-quadrado de mínimos quadrados generalizados sobre uma janela, nos canais GNSS, LEO e em todos) e consistência entre bandas (o passo de época a época da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO), informando estatísticas por época e quando cada monitor detecta (MODELLED). Componentes VALIDATED: perda no espaço livre, os coeficientes da P.838-3 contra a sua Tabela { "5" }, os procedimentos de chuva e cintilação da P.618-14 e a perda de penetração em edificações da P.2109 contra os exemplos de validação do Grupo de Estudos { "3" } da ITU-R, a razão de atraso de grupo L1/L2 do IS-GPS-200 e o Doppler máximo de usuário estático em uma órbita circular contra a Tabela { "1" } do arXiv { "2509.19551" }. MODELLED: EIRPs, diagramas, a fração de Chapman do TEC abaixo do satélite e a passagem inteira.

# attr:alt
seg-02ae51cfada6 = O gráfico que o motor gera para scenarios/leo-pass-iridium.toml, tipo de cenário leo-pass

# text
seg-81d1604171a5 = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal nomeado por signal_design (uma predefinição pública ou um projeto [signal] em linha) define o centro, a largura de banda, a taxa de chips e a divisão de EIRP de uma banda de [pass], o balanço de enlace do leo-pass fornece o C/N0 rastreado e o jitter de código limitado em banda ao longo da passagem, e uma reta de C/N0 em sin(elevação) e o SISRE de transmissão da mensagem [navmsg] (ajustado na altitude do satélite da passagem) alimentam todo sistema LEO da solução conjunta leo-pvt de [fusion] e, opcionalmente, os casos leo-ppp de [ppp]; cada transferência é listada com o seu valor e a sua unidade. MODELLED.

# attr:alt
seg-abe0599498c9 = O gráfico que o motor gera para scenarios/leo-pnt-end-to-end.toml, tipo de cenário leo-pnt-chain

# text
seg-32a570f1a4fa = Convergência do posicionamento preciso por ponto (PPP) apenas com GNSS e com aumentação por LEO: um filtro de Kalman estendido flutuante sobre código e fase da portadora livres de ionosfera, com as coordenadas estáticas da estação, um relógio de receptor branco, um viés entre sistemas por sistema adicional, um atraso úmido zenital em passeio aleatório mapeado por 1/sin(elevação) e uma ambiguidade flutuante por arco de satélite; o erro de órbita e relógio preciso é branco e comum ao código e à fase de um satélite, de modo que cada satélite é uma atualização correlacionada de duas linhas em uma forma estabilizada de Joseph. As medições são simuladas a partir do mesmo modelo com ruído com semente em vários locais e sementes, e cada caso (primeiro apenas GNSS, depois cada [[case]] de sistemas LEO, de qualquer constelação ou predefinição) informa o tempo mediano de convergência (a primeira época depois da qual os erros horizontal e vertical permanecem abaixo dos limiares, { "10" } cm por padrão), a fração convergida, as curvas medianas de erro e a consistência do filtro (o NEES de posição médio da execução contra a faixa de qui-quadrado bilateral de { "95" }%). Opcionalmente ao lado dos valores publicados de Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) em latitudes médias: { "9.6" } min para multi-GNSS reduzidos a { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo.

# attr:alt
seg-225ef04c64af = O gráfico que o motor gera para scenarios/leo-ppp-convergence.toml, tipo de cenário leo-ppp

# text
seg-093aac4b5ff1 = Posicionamento, navegação e temporização (PNT) fundidos em órbita terrestre média (MEO) e baixa (LEO) sobre QUALQUER constelação: cada [[system]] é uma predefinição de GNSS do tipo de cenário constellation-design, uma predefinição LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, o modelo de efemérides atomic-zero-clock, ou outro arquivo de predefinição, cada um em seu próprio arquivo com as fontes marcadas PUBLIC, WORKSHOP ou DERIVED), camadas Walker ou conjuntos explícitos de elementos, com uma portadora, uma taxa de chips, um envelope de densidade de portadora sobre ruído (C/N0) da máscara de elevação até o zênite, um erro de distância do sinal no espaço (SISRE), um sigma de Doppler e um modelo de relógio (o seu próprio relógio de receptor, de modo que o viés entre sistemas é estimado, ou um deslocamento de transmissão conhecido). Quatro modos. DOPPLER: posicionamento em lote de Gauss-Newton a partir da taxa de variação da distância com derivadas parciais analíticas, estados de deriva do relógio e, opcionalmente, de velocidade e uma restrição opcional de altura, com um ou vários satélites, o erro em função da duração da janela, o envelope de Doppler, de taxa de Doppler e de jerk de cada sistema LEO, e a exatidão ao longo da trilha e transversal de uma única passagem em função do afastamento transversal (o erro transversal cresce sem limite à medida que a passagem fica sobre o usuário; uma única passagem também tem uma solução espelhada do outro lado do traço no solo). Um sinal de oportunidade apenas de Doppler (starlink-sop) roda aqui. CONJUNTO: soluções de pseudodistância por mínimos quadrados ponderados a cada época apenas com GNSS, apenas com LEO e com ambos, sigmas por medição de um modelo de ruído térmico de malha de captura de atraso em C/N0 mais o SISRE (ou um sigma fixo, para que um modelo de sinal possa alimentá-los), os vieses entre sistemas estimados, e PDOP/HDOP/VDOP em função do número de satélites LEO acrescentados. POLAR: satélites à vista e DOP em função da latitude para GNSS, LEO e ambos. TEMPORIZAÇÃO: transferência de tempo para o Tempo Universal Coordenado (UTC) a partir de satélites LEO em posição conhecida com um filtro de relógio de dois estados cujo ruído de processo vem das classes de osciladores do motor, em função do C/N0 e do oscilador, e a expressão do IS-GPS-200 de tempo do sistema para UTC; com [timing] trace = true cada linha também informa o seu erro de tempo e o sigma previsto a cada época. VALIDATED: o maior Doppler de uma passagem do zênite ao horizonte contra os valores publicados do Iridium (até { "36" } kHz) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz). MODELLED: todo o resto; o DOP é conferido contra um caso derivado à mão, as soluções contra a sua covariância e o modelo de Doppler contra a identidade da aceleração da distância.

# attr:alt
seg-90361a6f4e3c = O gráfico que o motor gera para scenarios/leo-pvt-fjord-skyline.toml, tipo de cenário leo-pvt

# text
seg-97b8d07150d4 = Projetos de sinais LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO), para qualquer sistema, banda e estrutura. Um SINAL é uma banda (frequência central, largura de banda de transmissão, alocação da UIT RNSS/RDSS/MSS/EESS/non-RNSS/other) e componentes (aquisição, dados, piloto; qualquer subconjunto), cada um com uma modulação (BPSK(n) com n fracionário, BOC(m,n), MBOC({ "6,1" },p) ou uma banda plana do tipo OFDM), uma fração de potência, deslocamentos opcionais de subportadoras FDMA, um comprimento de código e uma taxa de dados. Os sinais vêm de arquivos de predefinições públicas compilados no programa (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada um com o URL da sua fonte e todo valor não publicado rotulado REPRESENTATIVE) ou são escritos em linha. POR SINAL: a densidade espectral de potência limitada em banda e a fração da potência de cada componente que a banda de transmissão deixa passar (forma fechada do BPSK ao lado do valor numérico), a largura de banda RMS (Gabor), o jitter térmico de rastreamento de código da malha de captura de atraso em função de C/N0 e do espaçamento adiantado-atrasado, a partir da fórmula adiantado-atrasado coerente (ou não coerente) limitada em banda de Betz & Kolodziejski { "2009" }, com a sua forma de manual para banda ilimitada e o seu limite de Gabor para espaçamento tendendo a zero, a precisão de medição de distância em metros, o espaço de busca de aquisição (células Doppler a partir do Doppler máximo da órbita mais os termos do oscilador e do usuário, vezes as células de código), a probabilidade de detecção de lei quadrática e o tempo médio de aquisição serial e paralela em código, o coeficiente de separação espectral do sinal em relação a GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e E5 AltBOC e de cada um deles em relação ao sinal com a degradação de C/N0, e os J/S de onda contínua, de banda larga e casado que o componente rastreado tolera, a partir do mecanismo de SSC do próprio tipo de cenário spectrum. UMA COMPARAÇÃO ENTRE BANDAS: atraso ionosférico de primeira ordem ({ "40.3" } TEC/f^{ "2" }), perda no espaço livre, precisão de medição de distância com o mesmo C/N0 e com o mesmo EIRP, e tolerância a interferidores. VERIFICAÇÕES DE FORMA opcionais confrontam o espectro de um projeto com uma medição descrita (consistência MODELLED). VALIDATED: as formas fechadas da potência em banda do BPSK ({ "90.3" } % no lóbulo principal) e da largura de banda de Gabor, o jitter limitado em banda que se reduz à forma coerente adiantado-atrasado de manual e ao seu limite de Gabor, o coeficiente de separação espectral do BPSK deslocado contra a sua forma fechada de Parseval, a área unitária do espectro AltBOC, e o Doppler máximo em LEO contra os valores publicados do Xona Pulsar (32-34 kHz) e do Iridium ({ "36" } kHz). MODELLED: todos os projetos, as divisões de potência e os níveis de C/N0 e de interferidor; os espectros EFQPSK, CSK e OFDM são aproximados.

# attr:alt
seg-8bf45b6989d1 = O gráfico que o motor escreve para scenarios/leo-band-trade.toml, tipo de cenário leo-signal

# text
seg-4f0edb786a35 = Posicionamento a partir de um enlace de descida de rede não terrestre (NTN) 5G no serviço móvel por satélite (MSS) na banda S (banda 3GPP n256, enlace de descida de { "2170" } a { "2200" } MHz; portadora padrão de { "2172.5" } MHz): o limite de Cramér-Rao (CRB) do tempo de chegada, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), com beta a largura de banda quadrática média (de Gabor) do espectro OFDM plano (B/sqrt({ "12" })), e do Doppler de um tom complexo, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), para cada sinal (por padrão um canal New Radio de { "5" } MHz com { "4.5" } MHz ocupados e um canal de banda estreita de { "200" } kHz com { "180" } kHz ocupados); depois, sobre qualquer constelação LEO, soluções de tempo de chegada no enlace de descida com um relógio de receptor desconhecido (com semente, com o limite mais um erro de sincronização da rede como sigma), o seu PDOP e o sigma 3D formal, e uma solução Doppler de um único satélite na passagem mais longa com a altura mantida. MODELLED: o passo de largura de banda para limite é a forma fechada de manual, verificada contra a integração numérica dos espectros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a precisão de posicionamento é um limite em um canal sem multipercurso com um erro de sincronização declarado, não um resultado alcançado.

# attr:alt
seg-c200240dd65e = O gráfico que o motor escreve para scenarios/ntn-5g-positioning.toml, tipo de cenário ntn-positioning

# text
seg-4e31c8daf798 = Registro

# text
seg-6800289a282d = { "7" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Fonte: <c1/>

# text
seg-561a783e9516 = Navegação em órbita baixa da Terra (família de tipos de cenário)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Páginas de tópico: <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. Execute uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Navegação em órbita baixa da Terra

# text
seg-1e724b481e67 = Projetos de sinal LEO-PNT: sinais parametrizados de posicionamento, navegação e temporização (PNT) em órbita baixa da Terra (LEO) para qualquer sistema, banda e estrutura.

# text
seg-82ad7da67939 = Passagem LEO e orçamento de enlace, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir da órbita baixa da Terra), independente de sistema: um usuário (em solo, marítimo, aéreo ou em ambiente interno, estático ou em movimento) e um ou mai

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = Mensagem de navegação LEO: as efemérides e o relógio transmitidos de um satélite de posicionamento, navegação e temporização em órbita baixa da Terra (LEO), para qualquer órbita, portadora e modelo, com predefinições nomeadas opcionais (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Posicionamento, navegação e temporização (PNT) fundidos em órbita média da Terra (MEO) e órbita baixa da Terra (LEO) sobre QUAISQUER constelações: cada [[system]] é uma predefinição de GNSS do tipo constellation-design, uma predefinição de LEO

# text
seg-d9e5f4726bbb = Convergência do posicionamento preciso por ponto (PPP) somente com GNSS e com aumentação por LEO: um filtro de Kalman estendido de ponto flutuante sobre código livre de ionosfera e fase da portadora com as coordenadas estáticas da estação, um

# text
seg-44f4148f4a5f = Posicionamento a partir de um enlace de descida de rede não terrestre (NTN) 5G na banda S do serviço móvel por satélite (MSS) (banda n256 do 3GPP, enlace de descida de { "2170" } a { "2200" } MHz; portadora padrão { "2172.5" } MHz): o limite de Cramér-Rao

# text
seg-1ee838a551ef = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir da órbita baixa da Terra) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal nomeado por signal_design (uma predefinição pública ou um [s

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
seg-472d9e86ee20 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-signal</a1>.

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
seg-9a7671c30d7e = <b>Registro:</b> MODELLED { "7" } · VALIDATED { "5" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pass</a1>.

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
seg-7ba3e667487d = <b>Registro:</b> MODELLED { "5" } · VALIDATED { "6" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-navmsg</a1>.

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
seg-389c67090de1 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pvt</a1>.

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
seg-e485df9372e6 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-ppp</a1>.

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
seg-e0a3133f468f = <b>Registro:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>ntn-positioning</a1>.

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
seg-db08b7916378 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>leo-pnt-chain</a1>.

# text
seg-534d13455a76 = <s1>Anterior</s1>Jamming, spoofing e o espectro

# text
seg-ec3fb19fb5bd = <s1>Seguinte</s1>Lunar e cislunar
