# docs--deceived-time: translations (pt-PT)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Fonte: <c1/>

# text
seg-f44d01df7b1c = Um comando assinado aplicado num tempo enganado continua a encaminhar mal

# text
seg-6497012e401e = Uma nota técnica para operadores de redes indexadas no tempo: constelações que encaminham, atribuem tarefas ou transferem por um calendário, em que cada nó atua quando o seu próprio relógio atinge um instante programado.

# text
seg-714bce435435 = Abreviaturas: GNSS, Global Navigation Satellite System; TPL, nível de proteção da temporização; PNT, posicionamento, navegação e temporização.

# text
seg-a7208323de1c = A afirmação

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Autenticar mensagens de controlo, inclusive com assinaturas pós-quânticas, prova quem enviou uma mensagem e que esta não foi alterada. Não prova <b>quando o recetor atua com base nela</b>. Um nó executa um comando indexado no tempo face ao seu próprio relógio. Se esse relógio tiver sido deslocado de <c1/>, um comando válido para o instante <c2/> é executado no tempo verdadeiro <c3/>, com todas as assinaturas intactas. Quando <c4/> excede a guarda de slot, o tráfego cai no slot errado, uma ligação comuta enquanto a outra extremidade ainda aponta para outro lado, ou uma transferência ocorre antecipadamente. A rede encaminha mal e todas as verificações de integridade no caminho do comando comunicam sucesso.

# text
seg-8683f0749042 = Porque é que o relógio é o alvo fraco

# text
seg-1af5aea2ef5b = <b>O tempo GNSS é a referência habitual, e pode ser alvo de spoofing.</b> Um nó que disciplina o seu relógio pelo GNSS herda o tempo que o recetor servir. Um agente de spoofing que mantenha verdes os próprios indicadores de qualidade do recetor pode deslocar esse tempo lentamente.

# text
# c1: T + w
seg-354a4c706264 = <b>As verificações de frescura usam o mesmo relógio.</b> Uma janela de validade ("aceitar este comando até <c1/>") ou um contador de repetição associado ao tempo é avaliado face ao relógio local, pelo que um relógio deslocado pode também alargar a janela em que um comando assinado capturado é aceite.

# text
seg-a4b8a5db0975 = <b>O ataque não precisa de chave.</b> Nada no canal assinado é tocado. Uma criptografia mais forte aumenta o custo de forjar um comando e deixa este custo inalterado.

# text
seg-e514b03fbae3 = Isto situa-se ao lado do trabalho pós-quântico, não contra ele: os dois fecham brechas diferentes. As assinaturas impedem um comando forjado. A integridade do tempo impede que um comando genuíno seja executado no momento errado.

# text
seg-09f493386dbc = O que o limita

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Quatro medidas, cada uma quantificada pelo tipo de cenário <c1/> (<a1><c2/></a1>):

# text
seg-77cf39b434b5 = <b>Um monitor assistido pelo relógio.</b> Compara o tempo GNSS com o relógio do próprio nó em navegação livre ao longo de uma janela e dá alarme quando a diferença é demasiado grande para ser ruído do relógio. O TPL condicional limita o erro que pode passar despercebido antes do alarme.

# text
seg-e58f7fb94ac5 = <b>Verificações independentes, agendadas.</b> Uma transferência de tempo bidirecional com uma estação terrestre ou uma comparação por ligação cruzada com um vizinho fora do alcance do agente de spoofing limita a duração de um desvio lento. O seu intervalo de revisita é um parâmetro de segurança, não apenas operacional.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Geometria.</b> Um agente de spoofing no solo só alcança um satélite de órbita terrestre baixa enquanto este está acima do horizonte do agente, pelo que o desvio é limitado pela taxa de rampa do agente multiplicada por essa janela. Em termos aritméticos: uma rampa de { "10" } ns/s mantida durante { "600" } s dá { "6" } µs. O exemplo incluído (<c1/>: órbita de { "550" } km, rampa máxima de { "10" } ns/s) comunica uma exposição ao agente de spoofing de { "732" } s e um desvio limitado pela rampa de { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Uma guarda dimensionada a partir do limite e uma ação segura em caso de alarme.</b> A guarda de slot deve cobrir o maior erro não detetado que o monitor e as verificações permitem, e não apenas o ruído do relógio em marcha livre. Em caso de alarme, um nó deve manter o seu último calendário válido no seu relógio em navegação livre, em vez de seguir o GNSS.

# text
seg-c11b66f214ac = O que esta nota não afirma

# text
seg-8b0ed39ead25 = Não afirma que se tenha observado um satélite alvo de spoofing a encaminhar mal; não estima a exposição de nenhum operador; e os limites para que remete são MODELLED, condicionais à deteção e aos pressupostos de ameaça indicados. Defende uma composição: uma assinatura válida e um tempo de execução correto são propriedades separadas, e uma rede indexada no tempo precisa de ambas.

# text
seg-c1bf6467e3c9 = <s1>Anterior</s1>Temporização de telecomunicações

# text
seg-d4e9bfd42982 = <s1>Seguinte</s1>Teste de holdover e hardware de temporização no ciclo
