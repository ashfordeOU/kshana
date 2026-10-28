# docs--kind-lunar-ascent: translations (pt-BR)

seg-f942b36a11c4 = Ainda não está no GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Fonte: <c1/>

seg-b8ef47331221 = <c1/> (tipo de cenário)

seg-ae3053a1f6c8 = Ascensão propulsada MODELLED de um local de superfície polar sul até a órbita de encontro, e a covariância de posição e velocidade que ela leva de volta à órbita (classe Artemis). O modelo de erro inercial de cinco estados por eixo de lunar-descent (posição, velocidade, viés do acelerômetro, inclinação de atitude, viés do giroscópio, conduzido pela força específica) é executado nos três eixos do local a partir do estado de superfície com que a fase começa; uma solução de posição AFS a partir dos relés visíveis de uma constelação ILLUSTRATIVE de classe LCNS (isolada, ou diferencial usando o resíduo do enlace de correção de lunar-differential-pnt, com o relógio auxiliado quando apenas três relés estão visíveis) é obtida em um intervalo declarado, com o tempo lunar entrando pelo relógio do veículo e um erro de marcação de tempo ao longo da trajetória. Informa as fontes inerciais em forma fechada, a contribuição do auxílio, a ablação, os 1-sigmas de navegação ao longo da ascensão, a dispersão no corte do motor ao lado do conhecimento de navegação, e a covariância MCI 6x6 completa na inserção com a correlação posição-velocidade mantida. MODELLED: classe de IMU, força específica, conjunto de relés e dispersão no corte ilustrativos; erros mantidos nos eixos do local de lançamento; o estado nominal de saída é um substituto. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

seg-fc4d2ba3f99e = Uma execução de <c1/> é resumida assim: lunar-ascent | -89.50 deg | apenas inercial { "785" } m / { "3.49" } m/s | com AFS { "11.4" } m / { "0.071" } m/s | dispersão na inserção { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = O exemplo <c1/> define, entre outros:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Rótulo do resultado (o do motor): MODELLED

seg-463a919e84d5 = O gráfico que o motor grava para scenarios/lunar-ascent.toml, tipo lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: o modelo de erro inercial de cinco estados por eixo executado sobre uma ascensão propulsada com força específica ao longo da trajetória, auxiliado por soluções AFS e pelo tempo lunar, informando a covariância de posição e velocidade na inserção levada à órbi

seg-4e0c4b02eac0 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: o modelo de erro inercial de cinco estados por eixo executado sobre uma ascensão propulsada com força específica ao longo da trajetória, auxiliado por soluções AFS. Referência independente (InternalConsistency): A deriva inercial em forma fechada e verificações de monotonicidade nos testes. Nenhuma ascensão voada é comparada

seg-8732ad9f7e07 = <b>MODELLED</b> O propagador que os tipos de cenário lunares compartilham (GRAIL GL0660B de grau e ordem { "150" }, a Terra e o Sol como terceiros corpos, relatividade, orientação lunar DE440) comparado com as trajetórias púb. Referência independente (ExternalDataset): Efemérides de espaçonaves do JPL Horizons para o LRO e o CAPSTONE, em relação a limiares fixados antecipadamente em xval/mission-thread-lunar/PREREGISTRATION.md (Emendas { "1" } a { "6" }). LRO: MET, { "33" } m de maior diferença 3-D e { "2.4" } m RMS radial contra { "500" } m e { "60" } m. CAPSTONE: NOT MET, uma diferença de posição final de { "136.8" } km contra { "25" } km e uma diferença de periapsia de { "28.4" } km contra { "10" } km, as causas não isoladas. A linha é modelada porque o limiar do CAPSTON

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-745dfc03a929 = Ascensão propulsada MODELLED de um local de superfície polar sul até a órbita de encontro, e a covariância de posição e velocidade que ela leva de volta à órbita (classe Artemis). (catálogo de tipos de cenário (<c1/>))

seg-3fd0cca78937 = MODELLED: classe de IMU, força específica, conjunto de relés e dispersão no corte ilustrativos; erros mantidos nos eixos do local de lançamento; o estado nominal de saída é um substituto. (catálogo de tipos de cenário (<c1/>))

seg-2cfb37d39847 = HONESTIDADE: MODELLED. A classe de IMU, o alinhamento, a força específica e a dispersão no corte são entradas ILLUSTRATIVE, não medições. Os erros são mantidos nos eixos leste-norte-cima do local de lançamento, sem a curvatura da trajetória ao longo do alcance, e o estado nominal de saída é um substituto na vertical local do local: apenas a covariância é o resultado. Nenhuma concordância com qualquer veículo real é afirmada. Software de caráter consultivo, não c (comentário do arquivo de cenário, linhas { "11" } a { "15" })

seg-6faf49cac41a = Ascensão propulsada de um local polar lunar a uma órbita de inserção (<c1/>) é MODELLED, não validada: verificada em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = A propagação do modelo de forças lunares em relação a trajetórias públicas reconstruídas de orbitadores lunares e cislunares é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade inteira compõe partes modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

seg-59d4cb995cb9 = <s1>Próximo</s1>lunar-attack-surface
