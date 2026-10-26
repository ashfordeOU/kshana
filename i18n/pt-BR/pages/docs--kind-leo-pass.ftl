# docs--kind-leo-pass: translations (pt-BR)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Fonte: <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (tipo de cenário)

# text
seg-c3861f7d717c = Passagem LEO e balanço de enlace, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa), agnóstico de sistema: um usuário (em terra, no mar, no ar ou em ambiente fechado, estático ou em movimento) e um ou mais satélites LEO a partir de uma PASSAGEM PROJETADA (uma órbita circular posicionada de modo que o usuário veja uma passagem de uma elevação máxima escolhida em um instante escolhido, heliossíncrona se pedido), ELEMENTOS explícitos, um TLE (conjunto de elementos de duas linhas) pelo SGP4 do motor, ou uma constelação WALKER construída pelo código constellation-design (as passagens mais altas informadas). As bandas vêm de uma predefinição nomeada (UHF/L/S/C genérica multibanda, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como um sinal de oportunidade apenas de Doppler, CentiSpace, e uma predefinição opcional Celeste IOD marcada WORKSHOP) ou são escritas no cenário; cada predefinição declara se os seus números são PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP. Por satélite, banda e época: elevação, azimute, distância, taxa de variação da distância e aceleração da distância; perda no espaço livre; EIRP e o ganho do diagrama do satélite (isofluxo, feixe gaussiano ou plano); ganho da antena do usuário em função da elevação (patch, hemisférica ou isotrópica); atenuação gasosa (ITU-R P.676-10 Anexo { "2" }), atenuação por chuva (coeficientes da ITU-R P.838-3 e o procedimento da P.618-14, a partir de uma taxa de chuva e uma altura de chuva), cintilação troposférica (ITU-R P.618-14 seção { "2.4.1" }), perda de penetração em edificações para um usuário em ambiente fechado (ITU-R P.2109-2), descasamento de polarização, temperatura de ruído do sistema e C/N0 (densidade de portadora sobre ruído); Doppler e taxa de Doppler em forma fechada a partir da taxa de variação e da aceleração da distância, cada uma conferida contra diferenças centrais; o atraso ionosférico de primeira ordem { "40.3" } STEC/f^{ "2" } a partir de um TEC oblíquo de Klobuchar ou de TEC vertical, escalado para a parte da ionosfera abaixo do satélite. Pares de bandas recebem os coeficientes livres de ionosfera, a amplificação de ruído e o ruído de código no pico da passagem. Satélites GNSS em MEO (predefinições do Galileo ou do GPS) são avaliados com o mesmo modelo de antena e de ruído a partir das potências recebidas dos seus documentos de interface, de modo que a passagem LEO em forma de sino e as portadoras GNSS planas compartilham um mesmo gráfico. Uma seção opcional [iot] fornece tempo até a primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência de receptor declarado (MODELLED). Cada par de bandas fornece também o TEC oblíquo que a sua combinação livre de geometria recupera no pico e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Uma seção opcional [spoofer] falsifica os sinais de uma posição alegada que salta ou é empurrada para longe da verdadeira depois de um início e executa dois monitores com probabilidades de falso alarme e de detecção perdida declaradas: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes, um teste de qui-quadrado de mínimos quadrados generalizados sobre uma janela, nos canais GNSS, LEO e em todos) e consistência entre bandas (o passo de época a época da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO), informando estatísticas por época e quando cada monitor detecta (MODELLED). Componentes VALIDATED: perda no espaço livre, os coeficientes da P.838-3 contra a sua Tabela { "5" }, os procedimentos de chuva e cintilação da P.618-14 e a perda de penetração em edificações da P.2109 contra os exemplos de validação do Grupo de Estudos { "3" } da ITU-R, a razão de atraso de grupo L1/L2 do IS-GPS-200 e o Doppler máximo de usuário estático em uma órbita circular contra a Tabela { "1" } do arXiv { "2509.19551" }. MODELLED: EIRPs, diagramas, a fração de Chapman do TEC abaixo do satélite e a passagem inteira.

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Uma execução de <c1/> resume-se assim: balanço de enlace de passagem LEO, usuário aéreo em { "50.00" }, -30.00; { "1" } satélite(s) LEO, janela de { "900" } s Passagem Iridium [iridium-stl PUBLIC]: { "781" } km, elevação máxima { "65.0" } graus em { "444" } s, { "750" } s acima da máscara STL { "1621.000" } MHz: pico de C/N0 { "80.5" } dB-Hz mediana { "71.3" } dB-Hz; |Doppler| máx. { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } à vista, C/N0 de { "38.2" } dB-Hz a { "51.1" } dB-Hz (mediana { "46.2" } dB-Hz) pico de STL LEO { "80.5" } dB-Hz está { "34.3" } dB acima da mediana do GNSS; acima da portadora GNSS mais forte por { "750" } s

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
seg-e6f4e5c502d7 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pass-iridium.toml
seg-e12426a79a2f = O exemplo <c1/> define, entre outros:

# text
seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

# text
seg-7cd17bf1ac74 = Iridium STL a partir de uma aeronave

# text
seg-f4d857403ae0 = descending

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Rótulo do resultado (o do motor): MODELLED: geometria de passagem LEO e balanço de enlace por banda a partir de EIRPs declaradas e diagramas de antena idealizados com termos de propagação da ITU-R; os modelos de componentes carregam os seus próprios rótulos na matriz de verificação. Não é uma medição de nenhum satélite.

# attr:alt
seg-02ae51cfada6 = O gráfico que o motor gera para scenarios/leo-pass-iridium.toml, tipo de cenário leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-69ed19957592 = <b>VALIDATED</b> Equações ({ "1" }) a ({ "5" }) da ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3: k_H, alpha_H, k_V, alpha_V a partir dos ajustes de curva das Tabelas { "1" } a { "4" }, o (k, alpha) dependente do percurso e da polarização e a atenuação específica Testes: <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 seção { "2.2.1.1" } etapas { "2" } a { "10" } (percurso oblíquo e horizontal abaixo da altura da chuva, fatores de redução horizontal e de ajuste vertical, A0.01 e o seu escalonamento para { "0.001" } % a { "5" } % de um ano médio), com a altura da chuva (P.839) a Testes: <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 seção { "2.4.1" } etapas { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do percurso, fator de média da antena, profundidade de desvanecimento para { "0.01" } % a { "50" } % do tempo), com N_wet como entrada ou calculado a partir de temperatura, umidade e pressão por t Testes: <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Anexo { "1" } equações ({ "1" }) a ({ "10" }) com a Tabela { "1" }: a perda não excedida com probabilidade P para edificações tradicionais e termicamente eficientes na elevação do percurso na fachada, de { "80" } MHz a { "100" } GHz; aplicada por banda e época Testes: <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = e mais { "8" } na matriz.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 seção { "2.4.1" } etapas { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do percurso, fator de média da antena, profundidade de desvanecimento para { "0.01" } % a { "50" } % do tem. Referência independente (ExternalDataset): Exemplos de validação do Grupo de Estudos { "3" } da ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação da P.618-14, com o N_wet da P.453-14 de cada local dos mesmos exemplos; registrados em tests/fixtures/leo_link/p618_14_scintillation.csv com os URLs e a data de obtenção. A expressão de refratividade úmida a partir de temperatura e umidade não é coberta por esta linha

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes livres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação de ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referência independente (ExternalDataset): IS-GPS-200 seção { "20.3.3.3.3.2" }, que declara a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } decorrente do escalonamento de primeira ordem em 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escalonamento, não um TEC oblíquo

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: uma busca sobre cada posição orbital e cada usuário no horizonte do satélite de uma órbita circular, com a Terra. Referência independente (ExternalDataset): Leclere, Marathe e Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabela { "1" } (receptor estático em uma esfera de { "6371" } km, a rotação da Terra como único outro efeito): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz em L1. Cobre órbitas circulares de dois corpos

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> O tipo de cenário <c1/>: satélites a partir de uma passagem projetada, elementos, um TLE pelo SGP4 ou uma constelação Walker do constellation-design; por banda e época o l. Referência independente (InternalConsistency): Formas fechadas e autoconsistência: as identidades de taxa de variação da distância e de aceleração da distância contra derivadas numéricas, o ganho isofluxo que cancela o crescimento da distância, os limites clássicos de perda por polarização, a observação qualitativa LEO contra GNSS (uma passagem em forma de sino, de minutos, com pico vários dB acima das portadoras GNSS planas de 44-51 dB-Hz). As EIRPs e os diagramas são potências recebidas publicadas convertidas em uma EIRP ou representat

# text
# c1: label
seg-65a0444ca451 = MODELLED: geometria de passagem LEO e balanço de enlace por banda a partir de EIRPs declaradas e diagramas de antena idealizados com termos de propagação da ITU-R; os modelos de componentes carregam os seus próprios rótulos na matriz de verificação. Não é uma medição de nenhum satélite. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Uma seção opcional [iot] fornece tempo até a primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência de receptor declarado (MODELLED). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Uma seção opcional [spoofer] falsifica os sinais de uma posição alegada que salta ou é empurrada para longe da verdadeira depois de um início e executa dois monitores com probabilidades de falso alarme e de detecção perdida declaradas: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes, um teste de qui-quadrado de mínimos quadrados generalizados sobre uma jane (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED: EIRPs, diagramas, a fração de Chapman do TEC abaixo do satélite e a passagem inteira. (catálogo de tipos de cenário (<c1/>))

# text
seg-e675c999f303 = MODELLED. Os feixes pontuais, o cronograma de rajadas e a forma de onda do STL não são modelados. (comentário do arquivo de cenário, linha { "14" })

# text
seg-c3665ac09bf6 = Uma passagem LEO-PNT e o seu balanço de enlace por banda contra os satélites GNSS em MEO à vista são MODELLED, não validados: conferidos contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = As predefinições de sistemas LEO-PNT nomeados com fontes declaradas, e um motor agnóstico de sistema, são MODELLED, não validados: conferidos contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Página do tópico: <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Anterior</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Próximo</s1>leo-pnt-chain
