# docs--mission-thread: translations (pt-PT)

# text
seg-e27476e37522 = Terra

# attr:title
seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

# text
seg-092dd691ca17 = O relatório

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
seg-b03d56f501c3 = Tipo

# text
seg-2afa300864a9 = Parâmetros

# text
# c1: docs/MISSION-THREAD.md
seg-b7cf72949a21 = Fonte: <c1/>

# text
seg-32755afa0f78 = A cadeia da missão

# text
seg-d4af67363efc = Software de caráter consultivo, não um equipamento de navegação certificado. Apenas fontes públicas; sem afiliação nem aval de qualquer agência, e nada aqui afirma conformidade com os requisitos de qualquer programa.

# text
# c1: kind = "mission-thread"
# c2: xval/mission-thread/
seg-816770c97995 = <c1/> encadeia fases de uma missão, cada uma de um de oito tipos registados com os seus próprios sensores e filtro, e indica o <b>orçamento de erro de navegação e temporização</b> da cadeia inteira: para cada fase, o 1-sigma de posição, velocidade e enviesamento de relógio na entrada, no pico e na saída; cada contribuição a ele, com a sua unidade; a margem face a um requisito que declara; o elo mais fraco; os eventos datados; e uma figura de cronologia. Todo número é <b>MODELLED</b>: uma entrada declarada ou um modelo dela. As únicas linhas de referência independente externa estão em <s1><c2/></s1> e dizem o que testam.

# text
seg-c29a19879c84 = Execute o exemplo a partir de um checkout (ele lê um recorte versionado de kernel da Lua):

# text
seg-00f84b734853 = O documento

# text
# c1: nav
# c2: duration_s
seg-9979b2c873df = <b>Um documento é recusado, e não adivinhado,</b> quando um id de fase se repete, uma lista <c1/> está vazia, um nome é desconhecido, uma chave de modelo não é uma que o tipo conhece, uma chave de duração discorda de <c2/>, ou uma fase lista uma fonte para a qual o seu modelo não fornece números.

# text
seg-9b1e6ac618b5 = O que uma transferência faz

# text
# c1: [x, y, z, vx, vy, vz]
seg-0e965f3e30fa = O estado transferido é a covariância completa 6x6 de <c1/> em unidades do SI, o relógio (enviesamento, deriva e a sua covariância, marcados com uma escala de tempo), o referencial, o tempo de missão e uma etiqueta de evidência. Uma transferência nunca reinicia uma covariância.

# text
seg-47599d03571d = Regra

# text
seg-023113cc5afb = transfere o estado sem alteração

# text
# c1: q_acc
# c2: gap_s
seg-43967d0b6dd8 = ruído de aceleração branco de PSD <c1/> ao longo de <c2/> num modelo de linha reta; a linha declara ambos

# text
# c1: acquire_s
seg-2c791ab0fd0f = navegação por estima durante <c1/>, depois um eixo é fixado no piso da fonte apenas onde o piso é menor; nunca abaixo do piso, nunca uma reinicialização

# text
seg-36b9117f5379 = Referenciais e escalas de tempo

# text
# c1: Gcrf <-> Mci
# c2: Mci <-> Mcmf
# c3: Utc <-> Tt
# c4: Tdb <-> Tt
# c5: Tt <-> Ltc
# c6: lunar_time
seg-5853aaba827f = A cadeia converte na transferência, nunca dentro de uma fase, e cada conversão é uma linha própria do orçamento. Referenciais: GCRF, MCI, MCMF (ITRF e LVLH são recusados com o motivo). <c1/> desloca a origem pelo estado geocêntrico da Lua: o estado de grau DE440 a partir do kernel onde ele cobre a época (valor substituto de { "5" } m e { "1" } mm/s; pior caso medido de { "2.6" } m contra valores fixados do JPL Horizons), caso contrário a série analítica com os seus { "195.7" } km RMS medidos, o que a linha declara; um exemplo lunar deve portanto trazer um kernel que cubra a sua época. <c2/> é a rotação sideral média com os eixos alinhados na época e sem libração. As escalas de tempo passam por TT: <c3/> exata, <c4/> acrescenta { "14" } us, <c5/> usa a taxa secular de <c6/> com o seu intervalo de { "56" } a { "59" } us/dia como incerteza da taxa.

# text
seg-5ee610d8ab89 = Os oito tipos de fase

# text
seg-70b73f1acebf = Segmento

# text
seg-0e39a468de1d = ascensão propulsionada a uma órbita de estacionamento: covariância de velocidade constante com ruído de aceleração branco, aquisição e desvanecimento de GNSS, holdover do relógio

# text
# c1: [phase.model]
# c2: src/mission_thread/earth/launch.rs
seg-d359ae5982a6 = chaves <c1/> em <c2/>

# text
seg-57c44fd6e061 = navegação relativa ao longo de excertos de sensor: transição de Clohessy-Wiltshire em LVLH, covariância de Kalman 6x6, janela de acoplagem

# text
seg-7dce961e2c67 = abaixo

# text
seg-4b233c6cdf8b = queima TLI e cruzeiro cislunar: propagação de Cowell, matriz de transição de estado por diferenças finitas, atualizações de gnss-ssv e de seguimento em solo

# text
seg-352e27d02c86 = arco inercial de retorno até à interface de reentrada; sigma do ângulo de trajetória, probabilidade do corredor, desaceleração máxima, área de aterragem

# text
seg-95eb34012fe8 = lunar

# text
seg-cc72d2fc8a43 = navegação relativa até à acoplagem numa órbita lunar

# text
seg-2cfa6846c937 = orçamento de dispersão de aterragem num local polar

# text
seg-e9f5fc58fe12 = igual

# text
seg-ba3c65a210dd = disponibilidade de PNT e temporização na superfície por local e estação

# text
seg-8b9c5124dd3c = ascensão propulsionada a uma órbita de inserção

# text
# c1: MISSION-THREAD-LUNAR.md
seg-4ce0fa85457c = Os tipos de cenário lunares também são tipos de cenário isolados; o projeto e as evidências estão em <a1><c1/></a1>.

# text
# c1: target_alt_m
# c2: target_abs_sigma_pos_m
# c3: target_abs_sigma_vel_mps
# c4: capture_pos_m
# c5: capture_vel_mps
# c6: process_q_acc
# c7: min_window_s
# c8: [[phase.model.legs]]
# c9: range_m
# c10: end_range_m
# c11: duration_s
# c12: sensor
# c13: optical-camera
# c14: lidar
# c15: rf-ranging
# c16: src/mission_thread/sensors.rs
# c17: interval_s
seg-d16877f38793 = O orçamento leva os sigmas <b>relativos</b>; a covariância absoluta do veículo perseguidor é transferida sem alteração e uma linha declara-o, porque esta fase mede os veículos um face ao outro, e não face à Terra. A covariância relativa inicial é a absoluta do perseguidor mais os sigmas declarados do alvo, somados como se fossem independentes (conservador). Chaves: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcionais <c6/> e <c7/>, e um ou mais <c8/> com <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> ou <c15/>, parâmetros ILLUSTRATIVE em <c16/>) e <c17/>; as durações dos excertos somam a da fase. A janela de acoplagem é o tempo a partir do qual o sigma relativo permanece dentro do envelope de captura até ao fim da fase. As repetições são fases separadas com os seus próprios ids.

# text
# c1: step_s
seg-088b78574ab4 = O estado médio é o propagador de Cowell do motor, com a gravidade da Terra e J2 e o Sol e a Lua como terceiros corpos. A covariância passa por cada segmento <c1/> com uma matriz de transição de estado por diferenças progressivas (a execução nominal e seis execuções perturbadas) e um ruído de aceleração branco. A queima é ao longo da velocidade de entrada com uma fração de tamanho e um erro de apontamento declarados. <b>Limite declarado:</b> os recortes de kernel da Lua versionados contêm a Lua mas não o Sol, de modo que o propagador toma a Lua do kernel e o Sol da série analítica (o termo de terceiro corpo do Sol é insensível ao erro dessa série); a fase diz num evento qual usou, e onde nenhum kernel cobre um segmento ela usa a série analítica para ambos. A queima <b>não é direcionada</b>: o estado nominal é onde a queima declarada o levar, e as fases lunares tomam apenas a covariância.

# text
# c1: gnss-ssv
# c2: ssv_window_s
# c3: ssv_uere_m
# c4: ground-tracking
# c5: tli_dv_mps
# c6: tli_dv_sigma_fraction
# c7: tli_pointing_sigma_rad
# c8: step_s
# c9: clock_q_f
# c10: clock_q_d
# c11: process_q_acc
# c12: ssv_uere_m
# c13: ssv_window_s
# c14: ssv_step_min
# c15: ssv_cn0_min_dbhz
# c16: ground_range_sigma_m
# c17: ground_range_rate_sigma_mps
# c18: ground_interval_s
# c19: ground_duty
seg-e5a67295a5ae = Atualizações, usadas apenas quando o documento lista a fonte: <c1/> (soluções de posição com disponibilidade e PDOP do varrimento do volume de serviço espacial do motor ao longo de uma órbita terrestre osculadora que substitui o arco, um varrimento por <c2/>; sigma da solução = PDOP mediano vezes <c3/>; a forma de informação esperada mantém a execução determinística) e <c4/> (distância e taxa de variação da distância ao longo da direção geocêntrica, de modo que o plano do céu não é observado; a variância da atualização é dividida pelo ciclo de seguimento). Chaves: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, opcionais <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
# c1: tli-and-cruise
# c2: interface_alt_m
# c3: ballistic_coeff_kg_m2
# c4: corridor_min_deg
# c5: corridor_max_deg
# c6: downrange_sensitivity_km_per_deg
# c7: flight_time_s
# c8: max_decel_g
# c9: scale_height_m
# c10: start_state_gcrf
seg-3a69ca6723ba = O arco inercial é o arco inercial de <c1/> sem queima, terminando na interface de reentrada; as suas chaves são as chaves do troço acima. Na interface a fase lê o ângulo de trajetória e o seu sigma a partir da covariância completa, a probabilidade de o ângulo estar dentro de um corredor declarado, a desaceleração máxima no ângulo nominal e nos dois extremos do corredor (a reentrada balística plana do motor ao lado da forma fechada de Allen-Eggers) face a um limite opcional, e a área de aterragem: alcance a partir de uma sensibilidade declarada, desvio lateral a partir da covariância na interface através do plano orbital. Chaves: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, opcionais <c8/>, <c9/> e <c10/> (o estado nominal de retorno, seis números, quando a cadeia não tem queima trans-Terra que o produza). Nada aqui modela a sustentação, a orientação ou o aquecimento de uma cápsula.

# text
seg-352783ef7181 = A sobreposição da rede terrestre

# text
# c1: [ground_network]
# c2: entry-orbit
# c3: moon-direction
# c4: stated
# c5: handover_gap_s
seg-69d6ab8e93bc = Uma tabela opcional <c1/> fornece estações e a menor elevação de seguimento; para cada fase que ela nomeia, a cadeia calcula a fração da fase que uma estação pode rastrear e a transmite à fase como o ciclo que escala a sua taxa de atualização de seguimento em solo. Geometrias: <c2/> (o estado de entrada voado em dois corpos com J2, para fases em órbita baixa), <c3/> (o veículo na posição da Lua, para o cruzeiro cislunar) e <c4/> (um ciclo que fornece). Uma troca de estação perde <c5/>; o orçamento da fase recebe o maior intervalo sem estação à vista e um evento indica o ciclo. Nada modela as antenas ou as escalas de uma rede.

# text
# c1: kshana-mission-thread/1
# c2: phases[]
# c3: budget_rows[]
# c4: events[]
# c5: weakest_link
# c6: timeline[]
# c7: label
# c8: units
seg-467b14d7ef59 = <c1/>: <c2/> (índice, id, tipo, tempos, etiqueta, fontes de navegação e de tempo, fonte limitante, sigmas de entrada, de pico e de saída, requisito, margem, <c3/> com uma unidade por linha, <c4/>), o <c5/> (menor margem face a um requisito declarado, caso contrário a maior posição de pico), o <c6/>, o <c7/> da cadeia (a etiqueta da fase mais fraca) e um bloco <c8/>. A figura é o 1-sigma de posição e de enviesamento de relógio em função do tempo de missão, uma faixa por fase.

# text
seg-a3c40c51c2ff = O que são as evidências

# text
# c1: xval/mission-thread-lunar/
# c2: xval/mission-thread/
seg-1168810d4407 = A etiqueta da cadeia é a etiqueta da fase mais fraca, e toda fase é MODELLED. O propagador lunar é comparado com o LRO e o CAPSTONE (<s1><c1/></s1>); o arco cislunar é comparado com uma trajetória pública do Horizons (<s2><c2/></s2>). Uma linha passa ou não atinge um limiar fixado num ficheiro versionado antes da execução, e uma falha é registada como falha. Nada é VALIDATED, a menos que o registo o diga.

# text
seg-ee3c5b58e6fa = <s1>Anterior</s1>Órbita e superfície lunares como infraestrutura

# text
seg-b963f8a02aed = <s1>Seguinte</s1>Cadeia da missão: o segmento lunar

# text
seg-af81a8087ca7 = entrada
