# docs--mission-thread-lunar: translations (pt-BR)

seg-f942b36a11c4 = Ainda não está no GitHub

seg-3b01a756c305 = O que calcula

seg-b478421b21bb = Fonte: <c1/>

seg-dbd59cc01982 = O segmento lunar da sequência de missão de classe Artemis

seg-7b56ed698c30 = Quatro tipos de cenário, cada um também um tipo de fase da interface <c1/> (<c2/>): eles levam um orçamento de erro de navegação e temporização por uma missão lunar polar sul, do encontro em órbita lunar ao pouso, à permanência na superfície e à ascensão de volta à órbita. <b>Todo número aqui é MODELLED</b>: um modelo declarado com entradas ILLUSTRATIVE, nada disso uma afirmação sobre qualquer missão, sistema ou local. "Classe Artemis" nomeia uma classe de conceito de missão, nada mais; nenhum dado, produto ou aval de agência é usado ou alegado, e nada aqui é afiliado a uma. Software de caráter consultivo, não um equipamento de navegação certificado. O Kshana não transmite nada e não aciona nenhum hardware.

seg-5282ad2c498a = Fase e tipo

seg-9b927127e042 = Cenário de exemplo

seg-40f3e1b2d58b = Núcleo

seg-2cfaaa8be402 = navegação relativa até a acoplagem, polar circular de { "100" } km ou polar elíptica de { "100" } km por { "3000" } km

seg-9ee09d63fed3 = o orçamento de dispersão de pouso em um local polar sul

seg-c4568984e75c = <c1/>, <c2/> (precisa do DEM, um checkout)

seg-a098e14e6a63 = disponibilidade de posicionamento e temporização por local e estação

seg-8278ae655fcc = <c1/>, <c2/> (precisa do DEM, um checkout)

seg-249eff5159d0 = ascensão até a órbita de encontro e a covariância levada de volta à órbita

seg-36184e593ade = Cada núcleo é uma função de <c1/>; uma execução isolada constrói a entrada padrão (uma covariância inercial centrada na Lua de { "100" } m e { "0.1" } m/s, um relógio LTC de { "1" } microssegundo) e a época padrão 2028-01-01, e uma execução em sequência toma a entrada da fase anterior. A sequência, e não um núcleo, converte referenciais e escalas de tempo e aplica a regra de transferência: um invólucro de fase converte o estado de entrada para <c2/> (ou <c3/> para o mapa de superfície) e um relógio LTC por meio das conversões da sequência, e as linhas de conversão são acrescentadas ao orçamento da fase. Um referencial ou escala de tempo que a sequência não consegue converter (ITRF, por exemplo) é recusado com a mensagem da sequência; um núcleo chamado diretamente com um referencial que não pode usar o recusa com o motivo. Uma fase nunca reinicia uma covariância, apenas transfere aquela com que termina.

seg-59f4a1a2684e = O que cada fase faz

seg-e112a34ef118 = Dois veículos, um perseguidor e um alvo, voam a mesma órbita sob o modelo de forças lunares da biblioteca (um campo gravitacional e a Terra e o Sol como terceiros corpos). Uma estimativa de Gauss-Newton em lote ao longo do arco recupera os dois estados iniciais a partir de:

seg-33bb01b1e72a = uma solução absoluta de posição por veículo a partir de um conjunto de relés ILLUSTRATIVE de classe LCNS (relés atrás da Lua descartados, quatro necessários), cuja parte branca é o limite de rastreamento de código do piloto AFS (BPSK({ "5" }), { "5.115" } Mchip/s) na C/N0 declarada vezes o cofator de DOP;

seg-b061f6742a86 = um erro <b>persistente</b> do sinal no espaço em cada solução: os erros dos relés não se anulam pela média ao longo de um arco de horas, de modo que ele é levado como vieses constantes de posição, um comum aos dois veículos (<c1/> da variância, padrão { "0.9" }, ILLUSTRATIVE) e um independente por veículo. Um viés constante não dá nenhum benefício de média, a leitura conservadora;

seg-437ac74b1400 = uma distância por enlace cruzado a partir do mesmo sinal na sua própria C/N0.

seg-3513a55e44e5 = Informa o erro relativo formal e de Monte Carlo de posição e velocidade nos eixos locais do alvo, a fração de épocas com soluções nos dois veículos, o erro de estimação normalizado quadrático médio (NEES) do estado relativo em relação ao seu valor esperado de { "6" }, a deriva relativa por ignorar os harmônicos da gravidade, uma verificação de Hill (Clohessy-Wiltshire) em forma fechada para o caso circular, os modelos terminais de sensor relativo de <c1/> da sequência (parâmetros ILLUSTRATIVE) ao lado do valor só de sinais, e a covariância 6x6 do veículo perseguidor no final.

seg-5d3fa3e8486c = <b>O que o resultado diz.</b> Só com sinais, a distância por enlace cruzado fixa a posição relativa ao longo da linha de visada, mas a posição relativa transversal a ela é limitada pelo erro independente do sinal no espaço e pelo que a dinâmica fornece; a acoplagem precisa de um sensor relativo, e as linhas <c1/> mostram a que distância cada um dos modelos de sensor da sequência supera os sinais. O resultado também depende de a referência e o estimador compartilharem um modelo de forças; a opção de estimador <c2/> mostra o custo de ignorar os harmônicos, e não se espera que essa execução seja consistente.

seg-66c4eb27641b = A fase voa a sua própria órbita nominal (os campos <c1/>), de modo que o vetor de posição e velocidade de entrada não é usado, apenas sua covariância, referencial e relógio; um evento na sequência o declara.

seg-751f29ab7a35 = Por eixo horizontal, um modelo de erro inercial de cinco estados (posição, velocidade, viés do acelerômetro, inclinação de atitude, viés do giroscópio, conduzido pela força específica da descida) a partir da covariância de entrada e da IMU, depois um filtro sequencial sobre os auxílios habilitados:

seg-c2eae4508a2f = <b>Solução AFS</b>: a partir dos relés visíveis acima de uma máscara plana, com o cofator de DOP ENU vezes um erro de distância do usuário. <c1/> usa o erro do sinal no espaço; <c2/> usa o resíduo do enlace de correção de <c3/>. Com exatamente três relés à vista, o relógio é auxiliado, não estimado, e a solução passa então a levar <c4/>: é aqui que o tempo lunar entra na solução.

seg-39c938fb24e9 = <b>Solução relativa ao terreno</b>: <c1/> executa o correlacionador TERCOM/SITAN da biblioteca sobre seu relevo sintético e uma escala métrica terrestre (um substituto, não o relevo polar sul); <c2/> toma o limite de Cramer-Rao da correlação de uma janela de elevação do DEM real do LOLA no local, <c3/>, e não reivindica solução onde o relevo restringe apenas uma direção (o problema de abertura).

seg-795ef82edc61 = <b>Tempo lunar</b>: o erro de relógio na solução combina o relógio de entrada, seu crescimento desde a sincronização e o termo LTC-TT de <c1/>. Com <c2/> o veículo conta TT e o deslocamento acumulado é um viés não corrigido; com <c3/> resta apenas a incerteza da faixa publicada de { "56" } a { "59" } microssegundos por dia ao longo do horizonte. Um erro de marcação de tempo desloca uma solução ao longo da trajetória em <c4/>.

seg-d655c932abbf = A dispersão de pouso é o erro de navegação no toque mais um termo de guiagem independente (<c1/>, ILLUSTRATIVE, { "20" } m por eixo por padrão). A tabela <c2/> executa todas as combinações dos auxílios. A elipse é calibrada por Monte Carlo (a fração de pousos simulados dentro do contorno de 3 sigma em relação aos { "98.9" } % que uma gaussiana 2-D dá).

seg-82b71e26bc89 = <b>Leia com cuidado.</b> A dispersão padrão é dominada pelo termo de guiagem suposto, e em todo local polar sul a geometria dos relés é quase a mesma, de modo que os locais diferem pouco. O tempo lunar importa pouco pela marcação de tempo ({ "150" } m/s vezes alguns microssegundos é menos de um milímetro); importa quando a geometria se degrada para três relés.

seg-f5af0aef6649 = Para cada local e estação (uma época e uma janela após ela): posicionamento por relés (quatro ou mais relés à vista acima da máscara e do horizonte de terreno do local com PDOP abaixo do limite, a partir das mesmas funções e da mesma constelação de <c1/>; o resultado de local único é igual, bit a bit, ao seu valor), se a Terra e o Sol estão acima do horizonte (Sol, Lua e orientação lunar analíticos, libração incluída) e a disponibilidade de temporização (um relé ou a Terra à vista) com o maior trecho de nenhum dos dois. O valor dos relés não muda com a estação neste modelo (conjunto kepleriano, rotação média); os da Terra e do Sol mudam. A fase transfere a covariância sem alteração e disciplina o relógio até um piso de temporização (ILLUSTRATIVE, { "50" } ns), restando apenas a maior lacuna de temporização a atravessar em holdover.

seg-0890ec65a04e = O modelo de cinco estados da descida nos três eixos do local a partir do estado de superfície, uma solução AFS em um intervalo declarado com o mesmo tratamento do tempo lunar, e a covariância completa 6x6 de posição e velocidade na inserção transferida, com a correlação posição-velocidade de cada eixo mantida. A dispersão no corte do motor altera onde o veículo está e é informada ao lado da covariância de navegação, não transferida. Os erros são mantidos nos eixos do local de lançamento (sem curvatura ao longo do alcance) e o estado nominal de saída é um substituto; apenas a covariância é o resultado.

seg-f60b576fabcd = Como um documento declara uma fase

seg-be8e0001ed0c = Em uma sequência, a tabela <c1/> de uma fase é a própria tabela do cenário isolado. A duração da fase é o <c2/> da sequência: um modelo que também declara sua própria chave de duração (<c3/>, <c4/>, <c5/>, <c6/>) deve concordar com ele ou a fase é recusada, e um modelo que omite a chave assume a da sequência. A semente é a semente de fase da sequência, indexada pelo id, de modo que uma fase executada isoladamente com o mesmo id e a mesma semente da sequência devolve os números que devolve na sequência. Uma chave de modelo escrita errada é recusada, não ignorada. A transferência entre fases, e as conversões de referencial e de escala de tempo de que precisa (inercial centrado na Lua e fixo na Lua, Terra para Lua, os pares LTC), pertencem à sequência.

seg-52a6e2ec0a99 = Os projetos, as entradas e os limiares foram fixados em <c1/> antes de qualquer execução, com seis emendas datadas, cada uma divulgada no arquivo; o veredito de cada limiar, inclusive as falhas e o histórico do estimador, está em <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (o propagador em relação à trajetória reconstruída do LRO, { "24" } h): MET, diferença 3-D máxima de { "33" } m contra { "500" } m, { "2.4" } m RMS radial contra { "60" } m.

seg-25464238f6bd = <b>A2</b> (o mesmo propagador em relação à órbita de halo quase retilínea do CAPSTONE ao longo de uma revolução de 6,5 dias): <b>NOT MET</b>, diferença de posição final de { "136.8" } km contra { "25" } km, e diferença de raio de periapsia osculador de { "28.4" } km contra { "10" } km. As causas não foram isoladas (os candidatos são a pressão de radiação e o albedo omitidos, a sensibilidade da órbita ao estado inicial e as séries analíticas da Terra e do Sol); a linha permanece MODELLED.

seg-e1099ad81a5d = Estas duas linhas testam o propagador que os tipos de cenário lunares compartilham. <b>Elas não testam nenhum filtro de navegação, sinal ou orçamento, e nada mais aqui tem uma referência independente externa.</b>

seg-9a4b2392aa92 = Todo o resto é MODELLED, e as verificações de consistência dos tipos de cenário (B1 a B8 do pré-registro) testam uma implementação em relação ao seu próprio modelo declarado, e não em relação à Lua.

seg-3365490b59b7 = <s1>Anterior</s1>Sequência de missão: do lançamento à reentrada

seg-90932eed0074 = <s1>Próximo</s1>Posicionamento, navegação e temporização em LEO
