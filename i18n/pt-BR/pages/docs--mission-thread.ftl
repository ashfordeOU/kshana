# docs--mission-thread: translations (pt-BR)

seg-e27476e37522 = Terra

seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

seg-092dd691ca17 = O relatório

seg-f942b36a11c4 = Ainda não está no GitHub

seg-b03d56f501c3 = Tipo

seg-2afa300864a9 = Parâmetros

seg-b7cf72949a21 = Fonte: <c1/>

seg-32755afa0f78 = A sequência de missão

seg-d4af67363efc = Software de caráter consultivo, não um equipamento de navegação certificado. Apenas fontes públicas; sem afiliação nem aval de qualquer agência, e nada aqui afirma conformidade com os requisitos de qualquer programa.

seg-816770c97995 = <c1/> encadeia fases de uma missão, cada uma de um de oito tipos registrados com seus próprios sensores e filtro, e informa o <b>orçamento de erro de navegação e temporização</b> da cadeia inteira: para cada fase, o 1-sigma de posição, velocidade e viés de relógio na entrada, no pico e na saída; cada contribuição a ele, com sua unidade; a margem em relação a um requisito que você declara; o elo mais fraco; os eventos datados; e uma figura de linha do tempo. Todo número é <b>MODELLED</b>: uma entrada declarada ou um modelo dela. As únicas linhas de referência independente externa estão em <s1><c2/></s1> e dizem o que testam.

seg-c29a19879c84 = Execute o exemplo a partir de um checkout (ele lê um recorte versionado de kernel da Lua):

seg-00f84b734853 = O documento

seg-9979b2c873df = <b>Um documento é recusado, e não adivinhado,</b> quando um id de fase se repete, uma lista <c1/> está vazia, um nome é desconhecido, uma chave de modelo não é uma que o tipo conhece, uma chave de duração discorda de <c2/>, ou uma fase lista uma fonte para a qual seu modelo não fornece números.

seg-9b1e6ac618b5 = O que uma transferência faz

seg-0e965f3e30fa = O estado transferido é a covariância completa 6x6 de <c1/> em unidades do SI, o relógio (viés, deriva e sua covariância, marcados com uma escala de tempo), o referencial, o tempo de missão e um rótulo de evidência. Uma transferência nunca reinicia uma covariância.

seg-47599d03571d = Regra

seg-023113cc5afb = transfere o estado sem alteração

seg-43967d0b6dd8 = ruído de aceleração branco de PSD <c1/> ao longo de <c2/> em um modelo de linha reta; a linha declara ambos

seg-2c791ab0fd0f = navegação por estima durante <c1/>, depois um eixo é fixado no piso da fonte apenas onde o piso é menor; nunca abaixo do piso, nunca uma reinicialização

seg-36b9117f5379 = Referenciais e escalas de tempo

seg-5853aaba827f = A sequência converte na transferência, nunca dentro de uma fase, e cada conversão é uma linha própria do orçamento. Referenciais: GCRF, MCI, MCMF (ITRF e LVLH são recusados com o motivo). <c1/> desloca a origem pelo estado geocêntrico da Lua: o estado de grau DE440 a partir do kernel onde ele cobre a época (valor substituto de { "5" } m e { "1" } mm/s; pior caso medido de { "2.6" } m contra valores fixados do JPL Horizons), caso contrário a série analítica com seus { "195.7" } km RMS medidos, o que a linha declara; um exemplo lunar deve portanto trazer um kernel que cubra sua época. <c2/> é a rotação sideral média com os eixos alinhados na época e sem libração. As escalas de tempo passam por TT: <c3/> exata, <c4/> acrescenta { "14" } us, <c5/> usa a taxa secular de <c6/> com sua faixa de { "56" } a { "59" } us/dia como incerteza da taxa.

seg-5ee610d8ab89 = Os oito tipos de fase

seg-70b73f1acebf = Segmento

seg-0e39a468de1d = ascensão propulsada a uma órbita de estacionamento: covariância de velocidade constante com ruído de aceleração branco, aquisição e desvanecimento de GNSS, holdover do relógio

seg-d359ae5982a6 = chaves <c1/> em <c2/>

seg-57c44fd6e061 = navegação relativa ao longo de trechos de sensor: transição de Clohessy-Wiltshire em LVLH, covariância de Kalman 6x6, janela de acoplagem

seg-7dce961e2c67 = abaixo

seg-4b233c6cdf8b = queima TLI e cruzeiro cislunar: propagação de Cowell, matriz de transição de estado por diferenças finitas, atualizações de gnss-ssv e de rastreamento em solo

seg-352e27d02c86 = trecho inercial de retorno até a interface de reentrada; sigma do ângulo de trajetória, probabilidade do corredor, desaceleração máxima, área de pouso

seg-95eb34012fe8 = lunar

seg-cc72d2fc8a43 = navegação relativa até a acoplagem em uma órbita lunar

seg-2cfa6846c937 = orçamento de dispersão de pouso em um local polar

seg-e9f5fc58fe12 = igual

seg-ba3c65a210dd = disponibilidade de PNT e temporização na superfície por local e estação

seg-8b9c5124dd3c = ascensão propulsada a uma órbita de inserção

seg-4ce0fa85457c = Os tipos de cenário lunares também são tipos de cenário isolados; o projeto e as evidências estão em <a1><c1/></a1>.

seg-d16877f38793 = O orçamento leva os sigmas <b>relativos</b>; a covariância absoluta do veículo perseguidor é transferida sem alteração e uma linha o declara, porque esta fase mede os veículos um em relação ao outro, e não em relação à Terra. A covariância relativa inicial é a absoluta do perseguidor mais os sigmas declarados do alvo, somados como se fossem independentes (conservador). Chaves: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcionais <c6/> e <c7/>, e um ou mais <c8/> com <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> ou <c15/>, parâmetros ILLUSTRATIVE em <c16/>) e <c17/>; as durações dos trechos somam a da fase. A janela de acoplagem é o tempo a partir do qual o sigma relativo permanece dentro do envelope de captura até o fim da fase. As repetições são fases separadas com seus próprios ids.

seg-088b78574ab4 = O estado médio é o propagador de Cowell do motor, com a gravidade da Terra e J2 e o Sol e a Lua como terceiros corpos. A covariância passa por cada segmento <c1/> com uma matriz de transição de estado por diferenças progressivas (a execução nominal e seis execuções perturbadas) e um ruído de aceleração branco. A queima é ao longo da velocidade de entrada com uma fração de tamanho e um erro de apontamento declarados. <b>Limite declarado:</b> os recortes de kernel da Lua versionados contêm a Lua mas não o Sol, de modo que o propagador toma a Lua do kernel e o Sol da série analítica (o termo de terceiro corpo do Sol é insensível ao erro dessa série); a fase diz em um evento qual usou, e onde nenhum kernel cobre um segmento ela usa a série analítica para ambos. A queima <b>não é direcionada</b>: o estado nominal é onde a queima declarada o levar, e as fases lunares tomam apenas a covariância.

seg-e5a67295a5ae = Atualizações, usadas apenas quando o documento lista a fonte: <c1/> (soluções de posição com disponibilidade e PDOP da varredura do volume de serviço espacial do motor ao longo de uma órbita terrestre osculadora que substitui o arco, uma varredura por <c2/>; sigma da solução = PDOP mediano vezes <c3/>; a forma de informação esperada mantém a execução determinística) e <c4/> (distância e taxa de variação da distância ao longo da direção geocêntrica, de modo que o plano do céu não é observado; a variância da atualização é dividida pelo ciclo de rastreamento). Chaves: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, opcionais <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = O trecho inercial é o trecho inercial de <c1/> sem queima, terminando na interface de reentrada; suas chaves são as chaves do trecho acima. Na interface a fase lê o ângulo de trajetória e seu sigma a partir da covariância completa, a probabilidade de o ângulo estar dentro de um corredor declarado, a desaceleração máxima no ângulo nominal e nas duas bordas do corredor (a reentrada balística plana do motor ao lado da forma fechada de Allen-Eggers) em relação a um limite opcional, e a área de pouso: alcance a partir de uma sensibilidade declarada, desvio lateral a partir da covariância na interface através do plano orbital. Chaves: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, opcionais <c8/>, <c9/> e <c10/> (o estado nominal de retorno, seis números, quando a cadeia não tem queima trans-Terra que o produza). Nada aqui modela a sustentação, a guiagem ou o aquecimento de uma cápsula.

seg-352783ef7181 = A sobreposição da rede terrestre

seg-69d6ab8e93bc = Uma tabela opcional <c1/> fornece estações e a menor elevação de rastreamento; para cada fase que ela nomeia, a sequência calcula a fração da fase que uma estação pode rastrear e a repassa à fase como o ciclo que escala sua taxa de atualização de rastreamento em solo. Geometrias: <c2/> (o estado de entrada voado em dois corpos com J2, para fases em órbita baixa), <c3/> (o veículo na posição da Lua, para o cruzeiro cislunar) e <c4/> (um ciclo que você fornece). Uma troca de estação perde <c5/>; o orçamento da fase recebe o maior intervalo sem estação à vista e um evento informa o ciclo. Nada modela as antenas ou as programações de uma rede.

seg-467b14d7ef59 = <c1/>: <c2/> (índice, id, tipo, tempos, rótulo, fontes de navegação e de tempo, fonte limitante, sigmas de entrada, de pico e de saída, requisito, margem, <c3/> com uma unidade por linha, <c4/>), o <c5/> (menor margem em relação a um requisito declarado, caso contrário a maior posição de pico), o <c6/>, o <c7/> da sequência (o rótulo da fase mais fraca) e um bloco <c8/>. A figura é o 1-sigma de posição e de viés de relógio em função do tempo de missão, uma faixa por fase.

seg-a3c40c51c2ff = O que são as evidências

seg-1168810d4407 = O rótulo da sequência é o rótulo da fase mais fraca, e toda fase é MODELLED. O propagador lunar é comparado com o LRO e o CAPSTONE (<s1><c1/></s1>); o arco cislunar é comparado com uma trajetória pública do Horizons (<s2><c2/></s2>). Uma linha passa ou não atinge um limiar fixado em um arquivo versionado antes da execução, e uma falha é registrada como falha. Nada é VALIDATED, a menos que o registro o diga.

seg-ee3c5b58e6fa = <s1>Anterior</s1>Órbita e superfície lunares como infraestrutura

seg-b963f8a02aed = <s1>Próximo</s1>Sequência de missão: o segmento lunar

seg-af81a8087ca7 = entrada
