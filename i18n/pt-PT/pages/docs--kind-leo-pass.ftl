# docs--kind-leo-pass: translations (pt-PT)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
