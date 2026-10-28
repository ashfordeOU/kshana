# docs--kind-leo-pass: translations (pt-PT)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Fonte: <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (tipo de cenário)

# text
seg-c3861f7d717c = Passagem LEO e balanço de enlace, banda a banda, para LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa), agnóstico de sistema: um utilizador (em terra, no mar, no ar ou em ambiente fechado, estático ou em movimento) e um ou mais satélites LEO a partir de uma PASS PROJETADA (uma órbita circular posicionada de modo que o utilizador veja uma passagem de uma elevação máxima escolhida num instante escolhido, heliossíncrona se pedido), ELEMENTOS explícitos, um TLE (conjunto de elementos de duas linhas) pelo SGP4 do motor, ou uma constelação WALKER construída pelo código constellation-design (as passagens mais altas indicadas). As bandas vêm de uma predefinição nomeada (UHF/L/S/C genérica multibanda, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como um sinal de oportunidade apenas de Doppler, CentiSpace, e uma predefinição opcional Celeste IOD marcada WORKSHOP) ou são escritas no cenário; cada predefinição declara se os seus números são PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP. Por satélite, banda e época: elevação, azimute, distância, taxa de variação da distância e aceleração da distância; perda no espaço livre; EIRP e o ganho do diagrama do satélite (isofluxo, feixe gaussiano ou plano); ganho da antena do utilizador em função da elevação (patch, hemisférica ou isotrópica); atenuação gasosa (ITU-R P.676-10 Anexo { "2" }), atenuação por chuva (coeficientes da ITU-R P.838-3 e o procedimento da P.618-14, a partir de uma taxa de chuva e uma altura de chuva), cintilação troposférica (ITU-R P.618-14 secção { "2.4.1" }), perda de penetração em edifícios para um utilizador em ambiente fechado (ITU-R P.2109-2), descasamento de polarização, temperatura de ruído do sistema e C/N0 (densidade de portadora sobre ruído); Doppler e taxa de Doppler em forma fechada a partir da taxa de variação e da aceleração da distância, cada uma conferida contra diferenças centrais; o atraso ionosférico de primeira ordem { "40.3" } STEC/f^{ "2" } a partir de um TEC oblíquo de Klobuchar ou de TEC vertical, escalado para a parte da ionosfera abaixo do satélite. Pares de bandas recebem os coeficientes livres de ionosfera, a amplificação de ruído e o ruído de código no pico da passagem. Satélites GNSS em MEO (predefinições do Galileo ou do GPS) são avaliados com o mesmo modelo de antena e de ruído a partir das potências recebidas dos seus documentos de interface, de modo que a passagem LEO em forma de sino e as portadoras GNSS planas partilham um mesmo gráfico. Uma secção opcional [iot] fornece tempo até à primeira solução, energia por solução e vida útil da bateria em função do ciclo de trabalho para um orçamento de potência de recetor declarado (MODELLED). Cada par de bandas fornece também o TEC oblíquo que a sua combinação livre de geometria recupera no pico e o sigma de ruído de código dessa estimativa (sondagem da ionosfera). Uma secção opcional [spoofer] falsifica os sinais de uma posição alegada que salta ou é empurrada para longe da verdadeira depois de um início e executa dois monitores com probabilidades de falso alarme e de deteção perdida declaradas: consistência de Doppler e de geometria da passagem (taxas de variação da distância medidas contra as previstas a partir das órbitas e de uma posição e velocidade a priori independentes, um teste de qui-quadrado de mínimos quadrados generalizados sobre uma janela, nos canais GNSS, LEO e em todos) e consistência entre bandas (o passo de época a época da combinação livre de geometria, corrigida pelo modelo, de cada par de bandas LEO), com estatísticas por época e o momento em que cada monitor deteta (MODELLED). Componentes VALIDATED: perda no espaço livre, os coeficientes da P.838-3 contra a sua Tabela { "5" }, os procedimentos de chuva e cintilação da P.618-14 e a perda de penetração em edifícios da P.2109 contra os exemplos de validação do Grupo de Estudos { "3" } da ITU-R, a razão de atraso de grupo L1/L2 do IS-GPS-200 e o Doppler máximo de utilizador estático numa órbita circular contra a Tabela { "1" } do arXiv { "2509.19551" }. MODELLED: EIRPs, diagramas, a fração de Chapman do TEC abaixo do satélite e a passagem inteira.

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Uma execução de <c1/> resume-se assim: orçamento de ligação de uma passagem LEO, utilizador aéreo em { "50.00" }, -30.00; { "1" } satélite(s) LEO, janela de { "900" } s Iridium-pass [iridium-stl PUBLIC]: { "781" } km, elevação máxima de { "65.0" } graus aos { "444" } s, { "750" } s acima da máscara STL { "1621.000" } MHz: C/N0 máximo de { "80.5" } dB-Hz, mediana de { "71.3" } dB-Hz; |Doppler| máximo de { "35.4" } kHz; iono de { "7.53" } m GNSS gps-baseline L1: { "8" } à vista, C/N0 de { "38.2" } dB-Hz a { "51.1" } dB-Hz (mediana de { "46.2" } dB-Hz) O máximo LEO STL de { "80.5" } dB-Hz está { "34.3" } dB acima da mediana GNSS; acima da portadora GNSS mais forte durante { "750" } s

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
seg-f4d857403ae0 = descendente

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } cenários incluídos utilizam este tipo de cenário; os restantes estão em <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Etiqueta do resultado (a do motor): MODELLED: geometria da passagem LEO e orçamento de ligação por banda a partir de EIRP indicadas e diagramas de antena idealizados, com termos de propagação da ITU-R; os modelos componentes têm as suas próprias etiquetas na matriz de verificação. Não é uma medição de nenhum satélite.

# attr:alt
seg-02ae51cfada6 = O gráfico que o motor escreve para scenarios/leo-pass-iridium.toml, tipo de cenário leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-69ed19957592 = <b>VALIDATED</b> Equações ({ "1" }) a ({ "5" }) da ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3: k_H, alpha_H, k_V, alpha_V a partir dos ajustes de curva das Tabelas { "1" } a { "4" }, o (k, alpha) dependente do trajeto e da polarização e a atenuação específica atenuatio Ensaios: <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14, secção { "2.2.1.1" }, passos { "2" } a { "10" } (trajeto oblíquo e horizontal abaixo da altura da chuva, fatores de redução horizontal e de ajuste vertical, A0.01 e o seu escalonamento para { "0.001" } % a { "5" } % de um ano médio), com a altura da chuva (P.839) a Ensaios: <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14, secção { "2.4.1" }, passos { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do trajeto, fator de média da antena, profundidade do desvanecimento para { "0.01" } % a { "50" } % do tempo), com N_wet fornecido como entrada ou calculado a partir da temperatura, da humidade e da pressão por t Ensaios: <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2, Anexo { "1" }, equações ({ "1" }) a ({ "10" }) com a Tabela { "1" }: a perda não excedida com probabilidade P para edifícios tradicionais e termicamente eficientes, à elevação do trajeto na fachada, de { "80" } MHz a { "100" } GHz; aplicada por banda e época Ensaios: <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = e mais { "8" } na matriz.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14, secção { "2.4.1" }, passos { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do trajeto, fator de média da antena, profundidade do desvanecimento para { "0.01" } % a { "50" } % do tem. Referência independente (ExternalDataset): exemplos de validação do Grupo de Estudo { "3" } da ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação da P.618-14, com o N_wet da P.453-14 de cada local retirado dos mesmos exemplos; guardados em tests/fixtures/leo_link/p618_14_scintillation.csv com os URL e a data de obtenção. A expressão da refratividade húmida a partir da temperatura e da humidade não é abrangida por esta linha

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes sem ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação do ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referência independente (ExternalDataset): IS-GPS-200, secção { "20.3.3.3.3.2" }, que indica a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } decorrente do escalonamento de primeira ordem em 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escalonamento, não um TEC oblíquo

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: uma pesquisa sobre cada posição da órbita e cada utilizador no horizonte do satélite de uma órbita circular, com a Terra. Referência independente (ExternalDataset): Leclere, Marathe e Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabela { "1" } (recetor estático numa esfera de { "6371" } km, sendo a rotação da Terra o único outro efeito): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz em L1. Abrange órbitas circulares de dois corpos

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> O tipo de cenário <c1/>: satélites a partir de uma passagem concebida, de elementos, de uma TLE através do SGP4 ou de uma constelação Walker a partir de constellation-design; por banda e época o l. Referência independente (InternalConsistency): Formas fechadas e autoconsistência: as identidades da taxa de variação e da aceleração da distância face a derivadas numéricas, o ganho isofluxo a anular o crescimento da distância, os limites de perda de polarização dos manuais, a observação qualitativa LEO versus GNSS (uma passagem em forma de sino com minutos de duração, que atinge o máximo vários dB acima de portadoras GNSS planas de 44-51 dB-Hz). As EIRP e os diagramas são potências recebidas publicadas convertidas numa EIRP ou representat

# text
# c1: label
seg-65a0444ca451 = MODELLED: geometria da passagem LEO e orçamento de ligação por banda a partir de EIRP indicadas e diagramas de antena idealizados, com termos de propagação da ITU-R; os modelos componentes têm as suas próprias etiquetas na matriz de verificação. Não é uma medição de nenhum satélite. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Uma secção [iot] opcional indica o tempo até à primeira solução de posição, a energia por solução e a duração da bateria em função do ciclo de trabalho, para um orçamento de potência do recetor indicado (MODELLED). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Uma secção [spoofer] opcional falsifica os sinais de uma posição declarada que salta, ou é afastada, da posição verdadeira após um instante de início, e executa dois monitores com probabilidades de falso alarme e de deteção falhada indicadas: consistência do Doppler e da geometria da passagem (taxas de variação da distância medidas face às previstas a partir das órbitas e de uma posição e velocidade prévias independentes, um teste do qui-quadrado de mínimos quadrados generalizados sobre uma jan (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED: EIRP, diagramas, a fração de Chapman do TEC abaixo do satélite e toda a passagem. (catálogo de tipos de cenário (<c1/>))

# text
seg-e675c999f303 = MODELLED. Os feixes pontuais, o calendário de rajadas e a forma de onda STL não são modelados. (comentário do ficheiro de cenário, linha { "14" })

# text
seg-c3665ac09bf6 = Uma passagem LEO-PNT e o seu orçamento de ligação por banda face aos satélites GNSS MEO à vista é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = Predefinições de sistemas LEO-PNT com fontes indicadas, e um motor agnóstico quanto ao sistema, é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Página do tema: <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Anterior</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Seguinte</s1>leo-pnt-chain
