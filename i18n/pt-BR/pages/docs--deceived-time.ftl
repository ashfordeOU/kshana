# docs--deceived-time: translations (pt-BR)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Fonte: <c1/>

# text
seg-f44d01df7b1c = Um comando assinado aplicado em um tempo enganado ainda leva ao roteamento errado

# text
seg-6497012e401e = Uma nota técnica para operadores de redes indexadas no tempo: constelações que roteiam, atribuem tarefas ou fazem transferência por uma programação, em que cada nó age quando o seu próprio relógio atinge um instante programado.

# text
seg-714bce435435 = Abreviações: GNSS, sistema global de navegação por satélite; TPL, nível de proteção de temporização; PNT, posicionamento, navegação e temporização.

# text
seg-a7208323de1c = A alegação

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Autenticar mensagens de controle, inclusive com assinaturas pós-quânticas, prova quem enviou a mensagem e que ela não foi alterada. Não prova <b>quando o receptor age sobre ela</b>. Um nó executa um comando indexado no tempo contra o seu próprio relógio. Se esse relógio tiver sido puxado por <c1/>, um comando válido para o instante <c2/> é executado no tempo verdadeiro <c3/>, com todas as assinaturas intactas. Quando <c4/> excede a guarda de slot, o tráfego cai no slot errado, um enlace comuta enquanto a outra extremidade ainda aponta para outro lugar, ou uma transferência ocorre cedo demais. A rede roteia errado, e todas as verificações de integridade no caminho do comando informam sucesso.

# text
seg-8683f0749042 = Por que o relógio é o alvo fraco

# text
seg-1af5aea2ef5b = <b>O tempo GNSS é a referência habitual, e pode sofrer spoofing.</b> Um nó que disciplina o seu relógio ao GNSS herda o tempo que o receptor fornecer. Um spoofer que mantém verdes os próprios indicadores de qualidade do receptor pode puxar esse tempo lentamente.

# text
# c1: T + w
seg-354a4c706264 = <b>As verificações de atualidade usam o mesmo relógio.</b> Uma janela de validade ("aceitar este comando até <c1/>") ou um contador de repetição vinculado ao tempo é julgado contra o relógio local, de modo que um relógio puxado também pode ampliar a janela em que um comando assinado capturado é aceito.

# text
seg-a4b8a5db0975 = <b>O ataque não precisa de chave.</b> Nada no canal assinado é tocado. Uma criptografia mais forte eleva o custo de forjar um comando e deixa este custo inalterado.

# text
seg-e514b03fbae3 = Isso se situa ao lado do trabalho pós-quântico, e não contra ele: os dois fecham brechas diferentes. As assinaturas impedem um comando forjado. A integridade do tempo impede que um comando genuíno seja executado no momento errado.

# text
seg-09f493386dbc = O que o limita

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Quatro medidas, cada uma quantificada pelo tipo de cenário <c1/> (<a1><c2/></a1>):

# text
seg-77cf39b434b5 = <b>Um monitor auxiliado por relógio.</b> Compare o tempo GNSS com o próprio relógio do nó em navegação inercial ao longo de uma janela e dê alarme quando a diferença for grande demais para ser ruído do relógio. O TPL condicional limita o erro que pode passar despercebido antes do alarme.

# text
seg-e58f7fb94ac5 = <b>Verificações independentes, programadas.</b> Uma transferência de tempo bidirecional com uma estação terrestre ou uma comparação de crosslink com um vizinho fora do alcance do spoofer limita por quanto tempo um puxão lento pode durar. O intervalo de revisita é um parâmetro de segurança, e não apenas operacional.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Geometria.</b> Um spoofer em terra só alcança um satélite em órbita baixa da Terra enquanto ele está acima do horizonte do spoofer, de modo que o puxão é limitado pela taxa de rampa do spoofer vezes essa janela. Em aritmética: uma rampa de { "10" } ns/s mantida por { "600" } s dá { "6" } µs. O exemplo incluído (<c1/>: órbita de { "550" } km, rampa máxima de { "10" } ns/s) informa uma exposição ao spoofer de { "732" } s e um puxão limitado pela rampa de { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Uma guarda dimensionada a partir do limite e uma ação segura no alarme.</b> A guarda de slot deve cobrir o maior erro não detectado que o monitor e as verificações permitem, e não apenas o ruído do relógio em funcionamento livre. No alarme, um nó deve manter a sua última programação boa no seu relógio em navegação inercial, em vez de seguir o GNSS.

# text
seg-c11b66f214ac = O que esta nota não alega

# text
seg-8b0ed39ead25 = Ela não alega que um satélite com spoofing tenha sido observado causando roteamento errado; não estima a exposição de nenhum operador; e os limites a que remete são MODELLED, condicionais à detecção e às hipóteses de ameaça declaradas. Argumenta uma composição: uma assinatura válida e um tempo de execução correto são propriedades separadas, e uma rede indexada no tempo precisa de ambas.

# text
seg-c1bf6467e3c9 = <s1>Anterior</s1>Temporização de telecomunicações

# text
seg-d4e9bfd42982 = <s1>Próximo</s1>Teste de holdover e hardware de temporização em malha
