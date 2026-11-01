# docs--mission-thread-lunar: translations (pt-PT)

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
seg-3b01a756c305 = O que calcula

# text
# c1: docs/MISSION-THREAD-LUNAR.md
seg-b478421b21bb = Fonte: <c1/>

# text
seg-dbd59cc01982 = O segmento lunar da cadeia da missão de classe Artemis

# text
# c1: mission-thread
# c2: src/mission_thread/
seg-7b56ed698c30 = Quatro tipos de cenário, cada um também um tipo de fase da interface <c1/> (<c2/>): eles levam um orçamento de erro de navegação e temporização por uma missão lunar polar sul, do encontro em órbita lunar à aterragem, à permanência na superfície e à ascensão de volta à órbita. <b>Todo número aqui é MODELLED</b>: um modelo declarado com entradas ILLUSTRATIVE, nada disso uma afirmação sobre qualquer missão, sistema ou local. "Classe Artemis" nomeia uma classe de conceito de missão, nada mais; nenhum dado, produto ou aval de agência é usado ou alegado, e nada aqui é afiliado a uma. Software de caráter consultivo, não um equipamento de navegação certificado. O Kshana não transmite nada e não aciona nenhum hardware.

# text
seg-5282ad2c498a = Fase e tipo

# text
seg-9b927127e042 = Cenário de exemplo

# text
seg-40f3e1b2d58b = Núcleo

# text
seg-2cfaaa8be402 = navegação relativa até à acoplagem, polar circular de { "100" } km ou polar elíptica de { "100" } km por { "3000" } km

# text
seg-9ee09d63fed3 = o orçamento de dispersão de aterragem num local polar sul

# text
# c1: scenarios/lunar-descent.toml
# c2: lunar-descent-lola.toml
seg-c4568984e75c = <c1/>, <c2/> (precisa do DEM, um checkout)

# text
seg-a098e14e6a63 = disponibilidade de posicionamento e temporização por local e estação

# text
# c1: scenarios/lunar-surface.toml
# c2: lunar-surface-terrain.toml
seg-8278ae655fcc = <c1/>, <c2/> (precisa do DEM, um checkout)

# text
seg-249eff5159d0 = ascensão até à órbita de encontro e a covariância levada de volta à órbita

# text
# c1: (config, entry state, thread context)
# c2: Mci
# c3: Mcmf
seg-36184e593ade = Cada núcleo é uma função de <c1/>; uma execução isolada constrói a entrada predefinida (uma covariância inercial centrada na Lua de { "100" } m e { "0.1" } m/s, um relógio LTC de { "1" } microssegundo) e a época predefinida 2028-01-01, e uma execução em cadeia toma a entrada da fase anterior. A cadeia, e não um núcleo, converte referenciais e escalas de tempo e aplica a regra de transferência: um invólucro de fase converte o estado de entrada para <c2/> (ou <c3/> para o mapa de superfície) e um relógio LTC por meio das conversões da cadeia, e as linhas de conversão são acrescentadas ao orçamento da fase. Um referencial ou escala de tempo que a cadeia não consegue converter (ITRF, por exemplo) é recusado com a mensagem da cadeia; um núcleo chamado diretamente com um referencial que não pode usar o recusa com o motivo. Uma fase nunca reinicia uma covariância, apenas transfere aquela com que termina.

# text
seg-59f4a1a2684e = O que cada fase faz

# text
seg-e112a34ef118 = Dois veículos, um perseguidor e um alvo, voam na mesma órbita sob o modelo de forças lunares da biblioteca (um campo gravitacional e a Terra e o Sol como terceiros corpos). Uma estimativa de Gauss-Newton em lote ao longo do arco recupera os dois estados iniciais a partir de:

# text
seg-33bb01b1e72a = uma solução absoluta de posição por veículo a partir de um conjunto de relés ILLUSTRATIVE de classe LCNS (relés atrás da Lua descartados, quatro necessários), cuja parte branca é o limite de seguimento de código do piloto AFS (BPSK({ "5" }), { "5.115" } Mchip/s) na C/N0 declarada vezes o cofator de DOP;

# text
# c1: common_mode_fraction
seg-b061f6742a86 = um erro <b>persistente</b> do sinal no espaço em cada solução: os erros dos relés não se anulam pela média ao longo de um arco de horas, de modo que ele é levado como enviesamentos constantes de posição, um comum aos dois veículos (<c1/> da variância, predefinição { "0.9" }, ILLUSTRATIVE) e um independente por veículo. Um enviesamento constante não dá nenhum benefício de média, a leitura conservadora;

# text
seg-437ac74b1400 = uma distância por enlace cruzado a partir do mesmo sinal na sua própria C/N0.

# text
# c1: sensors.rs
seg-3513a55e44e5 = Indica o erro relativo formal e de Monte Carlo de posição e velocidade nos eixos locais do alvo, a fração de épocas com soluções nos dois veículos, o erro de estimação normalizado quadrático médio (NEES) do estado relativo face ao seu valor esperado de { "6" }, a deriva relativa por ignorar os harmónicos da gravidade, uma verificação de Hill (Clohessy-Wiltshire) em forma fechada para o caso circular, os modelos terminais de sensor relativo de <c1/> da cadeia (parâmetros ILLUSTRATIVE) ao lado do valor só de sinais, e a covariância 6x6 do veículo perseguidor no final.

# text
# c1: relative_sensors
# c2: point-mass
seg-5d3fa3e8486c = <b>O que o resultado diz.</b> Só com sinais, a distância por enlace cruzado fixa a posição relativa ao longo da linha de vista, mas a posição relativa transversal a ela é limitada pelo erro independente do sinal no espaço e pelo que a dinâmica fornece; a acoplagem precisa de um sensor relativo, e as linhas <c1/> mostram a que distância cada um dos modelos de sensor da cadeia supera os sinais. O resultado também depende de a referência e o estimador partilharem um modelo de forças; a opção de estimador <c2/> mostra o custo de ignorar os harmónicos, e não se espera que essa execução seja consistente.

# text
# c1: orbit
seg-66c4eb27641b = A fase voa na sua própria órbita nominal (os campos <c1/>), de modo que o vetor de posição e velocidade de entrada não é usado, apenas a sua covariância, referencial e relógio; um evento na cadeia declara-o.

# text
seg-751f29ab7a35 = Por eixo horizontal, um modelo de erro inercial de cinco estados (posição, velocidade, enviesamento do acelerómetro, inclinação de atitude, enviesamento do giroscópio, conduzido pela força específica da descida) a partir da covariância de entrada e da IMU, depois um filtro sequencial sobre os auxílios ativados:

# text
# c1: standalone
# c2: differential
# c3: lunar-differential-pnt
# c4: c sigma_t
seg-c2eae4508a2f = <b>Solução AFS</b>: a partir dos relés visíveis acima de uma máscara plana, com o cofator de DOP ENU vezes um erro de distância do utilizador. <c1/> usa o erro do sinal no espaço; <c2/> usa o resíduo do enlace de correção de <c3/>. Com exatamente três relés à vista, o relógio é auxiliado, não estimado, e a solução passa então a levar <c4/>: é aqui que o tempo lunar entra na solução.

# text
# c1: terrain-nav
# c2: lola-crlb
# c3: I = sum(grad h grad h') / sigma_h^2
seg-39c938fb24e9 = <b>Solução relativa ao terreno</b>: <c1/> executa o correlacionador TERCOM/SITAN da biblioteca sobre o seu relevo sintético e uma escala métrica terrestre (um substituto, não o relevo polar sul); <c2/> toma o limite de Cramer-Rao da correlação de uma janela de elevação do DEM real do LOLA no local, <c3/>, e não reivindica solução onde o relevo restringe apenas uma direção (o problema de abertura).

# text
# c1: lunar-time-offset
# c2: lunar_time_mode = "tt"
# c3: "ltc"
# c4: v_h(t) sigma_t
seg-795ef82edc61 = <b>Tempo lunar</b>: o erro de relógio na solução combina o relógio de entrada, o seu crescimento desde a sincronização e o termo LTC-TT de <c1/>. Com <c2/> o veículo conta TT e o desvio acumulado é um enviesamento não corrigido; com <c3/> resta apenas a incerteza do intervalo publicado de { "56" } a { "59" } microssegundos por dia ao longo do horizonte. Um erro de marcação de tempo desloca uma solução ao longo da trajetória em <c4/>.

# text
# c1: guidance_sigma_m
# c2: ablation
seg-d655c932abbf = A dispersão de aterragem é o erro de navegação no toque mais um termo de orientação independente (<c1/>, ILLUSTRATIVE, { "20" } m por eixo por predefinição). A tabela <c2/> executa todas as combinações dos auxílios. A elipse é calibrada por Monte Carlo (a fração de aterragens simuladas dentro do contorno de 3 sigma face aos { "98.9" } % que uma gaussiana 2-D dá).

# text
seg-82b71e26bc89 = <b>Leia com cuidado.</b> A dispersão predefinida é dominada pelo termo de orientação suposto, e em todo local polar sul a geometria dos relés é quase a mesma, de modo que os locais diferem pouco. O tempo lunar importa pouco pela marcação temporal ({ "150" } m/s vezes alguns microssegundos é menos de um milímetro); importa quando a geometria se degrada para três relés.

# text
# c1: moonlight-service-volume
seg-f5af0aef6649 = Para cada local e estação (uma época e uma janela após ela): posicionamento por relés (quatro ou mais relés à vista acima da máscara e do horizonte de terreno do local com PDOP abaixo do limite, a partir das mesmas funções e da mesma constelação de <c1/>; o resultado de local único é igual, bit a bit, ao seu valor), se a Terra e o Sol estão acima do horizonte (Sol, Lua e orientação lunar analíticos, libração incluída) e a disponibilidade de temporização (um relé ou a Terra à vista) com o maior troço de nenhum dos dois. O valor dos relés não muda com a estação neste modelo (conjunto kepleriano, rotação média); os da Terra e do Sol mudam. A fase transfere a covariância sem alteração e disciplina o relógio até um piso de temporização (ILLUSTRATIVE, { "50" } ns), fica apenas a maior lacuna de temporização a atravessar em holdover.

# text
seg-0890ec65a04e = O modelo de cinco estados da descida nos três eixos do local a partir do estado de superfície, uma solução AFS num intervalo declarado com o mesmo tratamento do tempo lunar, e a covariância completa 6x6 de posição e velocidade na inserção transferida, com a correlação posição-velocidade de cada eixo mantida. A dispersão no corte do motor altera onde o veículo está e é indicada ao lado da covariância de navegação, não transferida. Os erros são mantidos nos eixos do local de lançamento (sem curvatura ao longo do alcance) e o estado nominal de saída é um substituto; apenas a covariância é o resultado.

# text
seg-f60b576fabcd = Como um documento declara uma fase

# text
# c1: [phase.model]
# c2: duration_s
# c3: arc_s
# c4: descent_s
# c5: stay_days
# c6: ascent_s
seg-be8e0001ed0c = Numa cadeia, a tabela <c1/> de uma fase é a própria tabela do cenário isolado. A duração da fase é o <c2/> da cadeia: um modelo que também declara a sua própria chave de duração (<c3/>, <c4/>, <c5/>, <c6/>) deve concordar com ele ou a fase é recusada, e um modelo que omite a chave assume a da cadeia. A semente é a semente de fase da cadeia, indexada pelo id, de modo que uma fase executada isoladamente com o mesmo id e a mesma semente da cadeia devolve os números que devolve na cadeia. Uma chave de modelo escrita errada é recusada, não ignorada. A transferência entre fases, e as conversões de referencial e de escala de tempo de que precisa (inercial centrado na Lua e fixo na Lua, Terra para Lua, os pares LTC), pertencem à cadeia.

# text
# c1: xval/mission-thread-lunar/PREREGISTRATION.md
# c2: xval/mission-thread-lunar/RESULTS.md
seg-52a6e2ec0a99 = Os projetos, as entradas e os limiares foram fixados em <c1/> antes de qualquer execução, com seis alterações datadas, cada uma divulgada no ficheiro; o veredito de cada limiar, inclusive as falhas e o histórico do estimador, está em <c2/>.

# text
seg-a1cf56c505d0 = <b>A1</b> (o propagador face à trajetória reconstruída do LRO, { "24" } h): MET, diferença 3-D máxima de { "33" } m contra { "500" } m, { "2.4" } m RMS radial contra { "60" } m.

# text
seg-25464238f6bd = <b>A2</b> (o mesmo propagador face à órbita de halo quase retilínea do CAPSTONE ao longo de uma revolução de 6,5 dias): <b>NOT MET</b>, diferença de posição final de { "136.8" } km contra { "25" } km, e diferença de raio de periapsia osculador de { "28.4" } km contra { "10" } km. As causas não foram isoladas (os candidatos são a pressão de radiação e o albedo omitidos, a sensibilidade da órbita ao estado inicial e as séries analíticas da Terra e do Sol); a linha permanece MODELLED.

# text
seg-e1099ad81a5d = Estas duas linhas testam o propagador que os tipos de cenário lunares partilham. <b>Elas não testam nenhum filtro de navegação, sinal ou orçamento, e nada mais aqui tem uma referência independente externa.</b>

# text
seg-9a4b2392aa92 = Todo o resto é MODELLED, e as verificações de consistência dos tipos de cenário (B1 a B8 do pré-registo) testam uma implementação face ao seu próprio modelo declarado, e não face à Lua.

# text
seg-3365490b59b7 = <s1>Anterior</s1>Cadeia da missão: do lançamento à reentrada

# text
seg-90932eed0074 = <s1>Seguinte</s1>Posicionamento, navegação e temporização em LEO
