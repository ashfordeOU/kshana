# docs--kind-mission-thread: translations (pt-BR)

seg-f942b36a11c4 = Ainda não está no GitHub

seg-be831b52a339 = e mais { "4" } na matriz.

seg-936e96edf423 = <b>MODELLED</b> O tipo de cenário <c1/>: um documento de fases, cada uma de um de oito tipos registrados, executadas em ordem com a covariância 6x6, o relógio e o referencial transferidos sob uma regra declarada (<c2/>; <c3/>, ruído de aceleração branco ao longo de um intervalo declarado Testes: <a1>field_units_global.rs</a1>.

seg-795e0409fa5a = <b>MODELLED</b> A fase <c1/>: o estado médio pelo propagador de Cowell do motor (massa pontual da Terra e J2, o Sol e a Lua como terceiros corpos, a Lua a partir do kernel DE440 da sequência onde ele cobre o segmento e o Sol a partir da série analít

seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Rótulo do resultado (o do motor): MODELLED

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-6ba426630d7e = Fonte: <c1/>

seg-e2ba596c17c6 = <c1/> (tipo de cenário)

seg-4816ff3c82ef = Tipo de cenário do motor v{ $version }, família <a1>Sequências de missão</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

seg-1ec485468daa = Orçamento de erro de navegação e temporização MODELLED de uma cadeia declarada de fases de missão, do lançamento à reentrada: lançamento e ascensão, encontro e acoplagem em órbita baixa da Terra (repetível), injeção trans-lunar e cruzeiro cislunar, encontro em órbita lunar, descida, permanência na superfície, ascensão e o retorno e a reentrada, cada fase um de oito tipos registrados com seus próprios sensores e filtro. A covariância 6x6, o relógio e o referencial são transferidos de fase em fase sob uma regra declarada (carry, inflate ou reacquire); as conversões de referencial e de escala de tempo (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) são linhas próprias do orçamento, com o estado da Lua a partir de um recorte opcional do kernel DE440 e a série analítica como alternativa declarada. Uma sobreposição opcional da rede terrestre define o ciclo de rastreamento de cada fase. Informa o orçamento por fase (1-sigmas de entrada, de pico e de saída, cada contribuição com sua unidade), a margem em relação a um requisito declarado, o elo mais fraco, os eventos e uma figura de linha do tempo. MODELLED: todo número é uma entrada declarada; a cadeia segue uma única pilha e nenhum veículo é modelado. Apenas fontes públicas; sem afiliação nem aval de qualquer agência; software de caráter consultivo, não um equipamento de navegação certificado.

seg-d6eb3dbb87c7 = Uma execução de <c1/> é resumida assim: mission-thread | { "11" } fases | sequência de missão de classe Artemis (ILLUSTRATIVE) | elo mais fraco descent | MODELLED

seg-9bb19202a104 = Campos obrigatórios: <c1/>, <c2/>, <c3/>

seg-e1faea3151d6 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-094b47cf8ae2 = O exemplo <c1/> define, entre outros:

seg-e5d2d8da2ec0 = gcrf

seg-2468a5014f25 = utc

seg-e92b7836bae3 = 2028-01-01T00:{ "00" }:00Z

seg-ffe559d3ff23 = cruise

seg-3be4934f4f4e = menor margem em relação a um requisi

seg-f32a7f31e191 = deriva inercial, sem auxílio, leste

seg-9fde3fc1cb5b = descent

seg-a07521d13bb4 = O gráfico que o motor grava para scenarios/mission-thread-artemis-class.toml, tipo mission-thread

seg-423ce11b54cd = <b>MODELLED</b> A fase <c1/>: uma covariância de posição e velocidade de velocidade constante com ruído de aceleração branco (o grau de navegação por estima), uma solução GNSS de precisão declarada aplicada após o tempo de aquisição e fora dos desvanecimentos declarados, um relógio de viés e-

seg-f393e01ac642 = <b>MODELLED</b> A fase <c1/>: o estado relativo nos eixos LVLH do alvo com a transição fechada de Clohessy-Wiltshire, uma covariância de Kalman 6x6 com ruído de aceleração branco e atualizações de posição cuja variância é a do sensor na dist

seg-c9ff01a17f3f = <b>MODELLED</b> O tipo de cenário <c1/>: um documento de fases, cada uma de um de oito tipos registrados, executadas em ordem com a covariância 6x6, o relógio e o referencial transferidos sob. Referência independente (InternalConsistency): Cálculos manuais nos testes (o crescimento retilíneo da covariância, a rotação sideral média, a taxa secular do relógio lunar) e, apenas para o estado da Lua, os recortes de kernel DE440 versionados em relação a valores fixados do JPL Horizons (pior caso { "2.6" } m e { "7e-6" } m/s). Nenhum dado de missão é comparado com a cadeia; suas fases são linhas próprias. O documento é uma cadeia declarada com entradas ILLUSTRATIVE, apenas fontes públicas e sem aval de agên

seg-529c9f8e8363 = <b>MODELLED</b> A fase <c1/>: uma covariância de posição e velocidade de velocidade constante com ruído de aceleração branco (o grau de navegação por estima), uma solução GNSS de precisão decl. Referência independente (InternalConsistency): O estado estacionário de Riccati e o cálculo manual da predição nos testes. Nada aqui modela um veículo lançador ou um receptor; todo número é uma entrada declarada

seg-01ef16f03f02 = <b>MODELLED</b> A fase <c1/>: o estado relativo nos eixos LVLH do alvo com a transição fechada de Clohessy-Wiltshire, uma covariância de Kalman 6x6 com ruído branco . Referência independente (InternalConsistency): Um cálculo manual em um eixo da predição e da atualização no teste; a transição de Clohessy-Wiltshire é a que cw_dynamics confere com uma integração numérica independente. Os sensores são ILLUSTRATIVE e nenhum encontro real é comparado

seg-1e77eae03d2c = <b>MODELLED</b> A fase <c1/>: o estado médio pelo propagador de Cowell do motor (massa pontual da Terra e J2, o Sol e a Lua como terceiros corpos, a Lua a partir do kernel da sequ. Referência independente (InternalConsistency): O teorema de Liouville (o determinante da matriz de transição de estado da parte conservativa é um) e uma diferença mais fina nos testes; o estado médio é comparado com uma trajetória pública na linha abaixo, que ele não atinge. O erro da queima, as atualizações e a covariância não são comparados com nada

seg-d9a1ea509a3c = Orçamento de erro de navegação e temporização MODELLED de uma cadeia declarada de fases de missão, do lançamento à reentrada: lançamento e ascensão, encontro e acoplagem em órbita baixa da Terra (repetível), injeção trans-lunar e cruzeiro cislunar, encontro em órbita lunar, descida, permanência na superfície, ascensão e o retorno e a reentrada, cada fase um de oito tipos registrados com seus próprios sensores e filtro. (catálogo de tipos de cenário (<c1/>))

seg-80221e9351e4 = MODELLED: todo número é uma entrada declarada; a cadeia segue uma única pilha e nenhum veículo é modelado. (catálogo de tipos de cenário (<c1/>))

seg-637296d00802 = HONESTIDADE. Todo número aqui é ILLUSTRATIVE: um valor redondo escolhido para fazer a cadeia funcionar, não o desempenho de qualquer veículo, sensor, estação ou rede. A cadeia segue uma única pilha como simplificação declarada; trocas de veículo, transferências de tripulação e a estação em órbita lunar não são modeladas, as órbitas lunares são as circulares e polares de { "100" } km que os tipos de cenário lunares voam (não a órbita de halo quase retilínea), e a queima TLI é (comentário do arquivo de cenário, linhas { "11" } a { "17" })

seg-f6574a80a60a = O orçamento de erro de navegação e temporização de uma cadeia de fases de missão do lançamento à reentrada (<c1/>) é MODELLED, não validado: verificado em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-9faba276f210 = O lançamento e a ascensão a uma órbita de estacionamento com aquisição e desvanecimento de GNSS (<c1/>) é MODELLED, não validado: verificado em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-20bbe2135d61 = A navegação relativa até o envelope de acoplagem em órbita baixa da Terra ao longo de trechos de sensor (<c1/>) é MODELLED, não validada: verificada em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-c60fd7868746 = A injeção trans-lunar e o cruzeiro cislunar: estado médio e covariância propagados com atualizações de rastreamento (<c1/>) é MODELLED, não validado: verificado em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-c10f77a86f4d = Página da família: <a1>Sequências de missão</a1>

seg-f3279128de3b = <s1>Anterior</s1>mars-pnt

seg-2854e6a75833 = <s1>Próximo</s1>moonlight-service-volume
