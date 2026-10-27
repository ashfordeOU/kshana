# docs--kind-leo-navmsg: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-navmsg.md
seg-648c27220789 = Fonte: <c1/>

# text
# c1: leo-navmsg
seg-087287602b47 = <c1/> (tipo de cenário)

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-867f3e41b5ab = Mensagem de navegação LEO: as efemérides e o relógio transmitidos de um satélite de posicionamento, navegação e temporização em órbita terrestre baixa (LEO), para qualquer órbita, portadora e modelo, com predefinições nomeadas opcionais (Xona Pulsar, Iridium, Starlink, CentiSpace, um sistema representativo em banda C, o modelo ATOMIC de relógio zero, Celeste IOD). CONTEÚDO: dados auxiliares (SVID, número de emissão dos dados, banda, saúde do sinal), sincronização (semana, tempo da semana, um polinómio de relógio de segunda ordem af0-af2 em torno de toc), efemérides num de quatro modelos -- o conjunto kepleriano de 16 parâmetros do Galileo OS SIS ICD; esse conjunto mais polinómios de correção ao longo da trajetória, transversais e radiais; o modelo de 22 parâmetros de Liu et al. { "2025" }; um polinómio ECEF sem termos de relógio (ATOMIC de relógio zero) -- e outros serviços (um conjunto de transmissão de Klobuchar, ai0-ai2 do NeQuick-G com o nível efetivo de ionização, e parâmetros de tempo do sistema para UTC com a lógica de segundos intercalares do ICD). AJUSTADOR: uma órbita-verdade integrada com gravidade zonal J2-J6 ou EGM2008 até ao grau escolhido e arrasto, e um relógio livre ou conduzido com semente; ajuste de Levenberg-Marquardt do conjunto kepleriano em elementos não singulares, depois polinómios de correção por mínimos quadrados lineares; relógio ajustado líquido do termo relativístico que o utilizador acrescenta. ANÁLISES: fit-interval-trade (erro de distância do sinal no espaço, SISRE, com pesos médios globais para a altitude da órbita, em função do intervalo de ajuste e do período de atualização, apenas órbita e com relógio), model-comparison (quatro modelos, número de parâmetros, bits codificados e o ajuste do Kshana nas altitudes de Liu et al. ao lado dos valores publicados), midpass-update (a passagem mais alta sobre um utilizador, o salto de posição, de relógio e de distância do utilizador a cada troca de mensagem, o salto na pior geometria, PASS/FAIL contra um limiar de continuidade), encode-decode (o quadro binário documentado do próprio Kshana com CRC-24Q, um orçamento de quantização de meio passo por campo, uma verificação de quadro corrompido, uma exportação e importação de registo no estilo RINEX 4 rotulada como extensão do Kshana, e uma tabela CSV). VALIDATED: os pesos do SISRE contra a tabela MEO/GEO publicada (Montenbruck et al. { "2018" }); o algoritmo de utilizador do Galileo contra o RTKLIB em efemérides de transmissão reais do Galileo; o CRC-24Q contra o seu valor de verificação de catálogo e o quadro de exemplo RTCM { "1005" }. MODELLED: cada valor de ajuste e de SISRE é erro de representação contra uma verdade integrada pelo Kshana (sem erro de determinação ou predição de órbita); a comparação com Liu et al. usa órbitas diferentes; os formatos de codificação e de texto são do próprio Kshana.

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-e5a4f0290e9e = Uma execução de <c1/> resume-se assim: mensagem de navegação LEO — { "510" } km, { "97.4" } graus, grau de gravidade { "20" }, modelo kepler-rac pesos do SISRE: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (máscara { "0" } graus) encode-decode: modelo kepler-rac, quadro { "152" } bytes ({ "1156" } bits de carga útil, { "891" } bits de efemérides+relógio), CRC-24Q 0x58ADF2 quantização: maior mudança de posição { "0.52" } mm, relógio { "0.09" } mm; SISRE exato { "0.0013" } m, quantizado { "0.0013" } m quadro corrompido rejeitado: true; ida e volta RINEX { "4.43e-6" } m; ida e volta CSV { "0.00e0" } m compromisso de intervalo de ajuste em { "1800" } s (período de uso = intervalo de ajuste): kepler16 { "60" } s SISRE órbita RMS { "0.0003" } m máx. { "0.0015" } m com relógio RMS { "0.0006" } m kepler16 { "120" } s SISRE órbita RMS { "0.0003" } m máx. { "0.0015" } m com relógio RMS { "0.0007" } m kepler16 { "300" } s SISRE órbita RMS { "0.0036" } m máx. { "0.0141" } m com relógio RMS { "0.0037" } m kepler16 { "600" } s SISRE órbita RMS { "0.0293" } m máx. { "0.1023" } m com relógio RMS { "0.0293" } m kepler16 { "900" } s SISRE órbita RMS { "0.1073" } m máx. { "0.3812" } m com relógio RMS { "0.1075" } m kepler-rac { "60" } s SISRE órbita RMS { "0.0000" } m máx. { "0.0000" } m com relógio RMS { "0.0005" } m kepler-rac { "120" } s SISRE órbita RMS { "0.0001" } m máx. { "0.0002" } m com relógio RMS { "0.0007" } m kepler-rac { "300" } s SISRE órbita RMS { "0.0005" } m máx. { "0.0021" } m com relógio RMS { "0.0012" } m kepler-rac { "600" } s SISRE órbita RMS { "0.0097" } m máx. { "0.0395" } m com relógio RMS { "0.0096" } m kepler-rac { "900" } s SISRE órbita RMS { "0.0388" } m máx. { "0.1143" } m com relógio RMS { "0.0390" } m O conjunto kepleriano de 16 parâmetros degrada-se de { "0.0003" } m em { "60" } s para { "0.1073" } m em { "900" } s: um único conjunto kepleriano com harmónicos de duas vezes por revolução não consegue acompanhar os termos de gravidade de frequência mais alta nem o arrasto de um arco LEO por mais do que alguns minutos, e o seu resíduo de mínimos quadrados oscila ao longo da janela. Os polinómios ao longo da trajetória/transversais/radiais, de grau mais alto do que o conjunto kepleriano abrange, absorvem o que resta, o que dá { "0.0388" } m em { "900" } s.

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
seg-3f299f6b20c8 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-3adfcd7e275c = O exemplo <c1/> define, entre outros:

# text
seg-8243db187e2f = [encode-decode, fit-interval-trade]

# text
seg-e866d042aab8 = Mensagem Celeste IOD (predefinição de workshop)

# text
seg-c42f5a1ed964 = [kepler16, kepler-rac]

# text
seg-549a6103e711 = bit

# text
seg-fb689f03361c = byte

# text
seg-c60901596100 = Rótulo do resultado (o do motor): MIXED — blocos de construção VALIDATED, resultados MODELLED. Os pesos do SISRE reproduzem a tabela MEO/GEO publicada (Montenbruck et al. { "2018" }), o algoritmo de utilizador do ICD do Galileo reproduz o RTKLIB em efemérides de transmissão reais do Galileo, e o CRC-24Q reproduz o seu valor de verificação de catálogo e o quadro de exemplo RTCM { "1005" }

# attr:alt
seg-35e92abc6a23 = O gráfico que o motor gera para scenarios/leo-navmsg-celeste-iod.toml, tipo de cenário leo-navmsg

# text
seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: o peso radial w_R e o peso transversal ao quadrado w_AC^{ "2" } como médias de cos^{ "2" } e metade de sin^{ "2" } do ângulo de nadir da linha de visada sobre utilizadores distribuídos uniformemente sobre a calota visível da Terra acima de uma elevação

# text
seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: a avaliação kepleriana do Galileo OS SIS ICD (equação de Kepler, correções de segundo harmónico, nó fixo à Terra) escrita separadamente do avaliador RINEX do motor, devolvendo a posição com o argumento Testes: <a1>leo_navmsg_reference.rs</a1>.

# text
seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: polinómio gerador 0x1864CFB, valor inicial { "0" }, sem reflexão, sem XOR final, a verificação que o quadro LEO do Kshana carrega sobre cada byte precedente

# text
# c1: leo-navmsg
seg-2b24c2669c23 = <b>VALIDATED</b> O ajustador e o compromisso do tipo de cenário <c1/>: uma órbita-verdade integrada com gravidade zonal J2-J6 ou EGM2008 até ao grau escolhido e arrasto, e um relógio livre ou conduzido com semente; um ajuste de Levenberg-Marquardt do conjunto kepleriano do Galileo em não singulares

# text
seg-ddb27b07b9af = e mais { "7" } na matriz.

# text
seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: o peso radial w_R e o peso transversal ao quadrado w_AC^{ "2" } como médias de cos^{ "2" } e metade de sin^{ "2" } do ângulo de nadir da linha de visada. Referência independente (ExternalDataset): A tabela publicada de fatores de ponderação do SISRE de Montenbruck, Steigenberger e Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } e 1/49, GLONASS { "0.98" } e 1/45, Galileo { "0.98" } e 1/61, BeiDou MEO { "0.98" } e 1/54, BeiDou IGSO/GEO { "0.99" } e 1/126. A mesma média avaliada em raios LEO dá o

# text
seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: a avaliação kepleriana do Galileo OS SIS ICD (equação de Kepler, correções de segundo harmónico, nó fixo à Terra) escrita separ. Referência independente (ExternalDataset): Posições ECEF eph2pos do RTKLIB 2.4.2-p13 (uma implementação independente do mesmo algoritmo do ICD) para registos de transmissão reais BKG/IGS de 2024-09-10, ambos fixados com proveniência em tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Isto valida o algoritmo de utilizador kepleriano; as correções ao longo da trajetória/transversais/radiais acrescentadas por cima são cobertas pelas suas próprias linhas, e os termos de Liu b

# text
seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: polinómio gerador 0x1864CFB, valor inicial { "0" }, sem reflexão, sem XOR final, a verificação que o quadro LEO do Kshana carrega sobre todo prece. Referência independente (ExternalDataset): O valor de verificação do catálogo de CRC para esses parâmetros (catálogo de CRC reveng.sourceforge.io, CRC-24/LTE-A: largura { "24" }, poly 0x864CFB, init { "0" }, verificação 0xCDE703), que são os parâmetros do CRC-24Q do RTCM { "10403" } e do Galileo OS SIS ICD, e o quadro de exemplo do tipo de mensagem { "1005" } impresso no RTCM { "10403" }

# text
# c1: leo-navmsg
seg-6e2719a28884 = <b>VALIDATED</b> O ajustador e o compromisso do tipo de cenário <c1/>: uma órbita-verdade integrada com gravidade zonal J2-J6 ou EGM2008 até ao grau escolhido e arrasto, e um relógio livre ou conduzido com. Referência independente (ExternalDataset): Órbitas científicas precisas reais como verdade (órbitas operacionais de dinâmica reduzida do TU Graz IfG/ITSG, de uso livre com reconhecimento; valores SHA-256 no NOTICE do fixture) ajustadas pelo conjunto de 16 parâmetros em arcos de { "20" } e { "30" } min, contra as estatísticas que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publicam para os mesmos satélites e dias: RMS ao longo da trajetória, transversal e radial, cada um dentro de 1.5x (medido de { "0.804" } a { "1.087" }), SISR

# text
# c1: limitations[0]
seg-0c26ec09bf16 = O SISRE é o erro de representação da mensagem contra a verdade à qual foi ajustada; os erros de determinação e de predição de órbita não são modelados. (resultado <c1/>)

# text
# c1: limitations[1]
seg-3762de39de07 = A órbita-verdade é uma integração numérica do Kshana (gravidade zonal ou EGM2008, arrasto exponencial estático), não a órbita precisa de um satélite real; sem terceiro corpo, pressão de radiação solar ou marés. (resultado <c1/>)

# text
# c1: limitations[2]
seg-4486dd350b57 = O formato binário é uma codificação documentada própria do Kshana, modelada sobre os componentes de mensagem publicados; não é o layout de bits do Celeste nem de nenhum outro sistema (nenhum é público). (resultado <c1/>)

# text
# c1: limitations[3]
seg-2a5c1bce8320 = O bloco no estilo RINEX é uma extensão documentada do Kshana; o RINEX { "4.02" } não define registos de navegação LEO. (resultado <c1/>)

# text
# c1: limitations[4]
seg-642d8f4d60e7 = Os coeficientes do NeQuick-G são transportados e o nível efetivo de ionização é calculado, mas a integração de densidade eletrónica do NeQuick que o converte em atraso não está implementada; o atraso de Klobuchar está, escalado para a portadora por 1/f^{ "2" } sem correção para um satélite que voa dentro da ionosfera. (resultado <c1/>)

# text
# c1: limitations[5]
seg-8ba04a3147bd = Os termos de 22 parâmetros de Liu et al. { "2025" } seguem o algoritmo de utilizador do artigo (Eq. 1-7) e a estratégia de ajuste (Secção { "2.3" }); os seus valores de SISRE em função da altitude usaram órbitas precisas reais, de modo que esta comparação numa órbita integrada pelo Kshana é MODELLED, não VALIDATED (a comparação com órbita real é tests/leo_navmsg_fit_real_orbit_oracle.rs). (resultado <c1/>)

# text
# c1: label
seg-b3585c7feb4e = MIXED — blocos de construção VALIDATED, resultados MODELLED. Os pesos do SISRE reproduzem a tabela MEO/GEO publicada (Montenbruck et al. { "2018" }), o algoritmo de utilizador do ICD do Galileo reproduz o RTKLIB em efemérides de transmissão reais do Galileo, e o CRC-24Q reproduz o seu valor de verificação de catálogo e o quadro de exemplo RTCM { "1005" }. Cada valor de ajuste, de SISRE, de continuidade e de quantização é MODELLED: o erro de representação de uma mensagem contra uma (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d6e412aab1b4 = MODELLED: cada valor de ajuste e de SISRE é erro de representação contra uma verdade integrada pelo Kshana (sem erro de determinação ou predição de órbita); a comparação com Liu et al. (catálogo de tipos de cenário (<c1/>))

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-d9257241d523 = Página do tópico: <a1>LEO-NAVMSG.md</a1>

# text
seg-b0dcad22aed6 = <s1>Anterior</s1>launch-window

# text
seg-2984c4c69850 = <s1>Seguinte</s1>leo-pass
