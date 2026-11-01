# docs--compliance-dhs-rpcf: translations (pt-BR)

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-fdbb9db68f1d = nenhuma

# text
# c1: docs/compliance/dhs-rpcf.md
seg-dbec6a166e56 = Fonte: <c1/>

# text
seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: para o que o Kshana fornece evidências em apoio

# text
seg-cef4181edf29 = A estrutura de referência descreve níveis de resiliência de { "0" } a { "4" } construídos a partir de oito requisitos numerados, e uma abordagem de avaliação que combina análise estática com análise dinâmica em que vetores de teste representam as ameaças. Ela não tem um esquema próprio de identificadores de requisitos, de modo que as referências abaixo são os seus números de nível e de requisito e os seus números de seção. É baseada em resultados e não cataloga ameaças.

# text
# c1: kshana compliance-report
seg-ff0e00610721 = Cada linha diz quais saídas do Kshana <b>fornecem evidências em apoio</b> do requisito e o que resta. Nada aqui diz que uma estrutura de referência é atendida nem que algum produto foi classificado ou aprovado por quem quer que seja. Execute <c1/> sobre os seus próprios arquivos de resultado para ver quais linhas as suas execuções realmente evidenciam; veja <a1>README.md</a1>.

# text
seg-30c8cabb6e90 = Documentos de origem

# text
seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Versão { "2.0" }, { "26" } de abril de { "2022" } (DHS Science and Technology Directorate, com a CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Lido em 2026-10-09: documento lido na íntegra; a página de apresentação da publicação não foi acessada.

# text
seg-955191e0baab = Mapeamento

# text
seg-6ba8f74126ee = O que pede (parafraseado)

# text
seg-0438151025da = Saídas do Kshana que fornecem evidências em apoio

# text
seg-3f265e18f56c = Lacuna

# text
seg-4263435e702a = Seção { "5.2" } (Prevent, Respond, Recover)

# text
seg-e7b721f6e216 = A resiliência é descrita como três funções: prevenir danos, responder (detectar, relatar, mitigar, conter) e recuperar. A detecção é probabilística, de modo que tanto os falsos alarmes quanto as detecções perdidas importam.

# text
seg-3447d3b53fe8 = Avaliação de confiança do registro do receptor; Detecção de spoofing e meaconing; Holdover e coasting

# text
seg-ab055a50e16e = A prevenção é uma propriedade de projeto do produto que nenhuma saída de simulação mostra. Estatísticas de detecção de uma execução sintética ou de uma única sessão não são uma taxa medida de falsos alarmes ou de perdas para um produto em campo.

# text
seg-501badd6a436 = Nível { "1" }, requisito { "1" }

# text
seg-e8cfbe121084 = Verificar se os dados armazenados que chegam de fontes externas correspondem aos formatos e às faixas de valores das normas pertinentes.

# text
seg-7d7196aefa05 = Uma propriedade de garantia de software e de validação de entrada do produto sob teste. O Kshana não inspeciona o tratamento de entradas de um produto.

# text
seg-6085030de980 = Nível { "1" }, requisito { "2" }

# text
seg-e8cd6fb732ad = Permitir a recuperação manual completa por meio da limpeza ou da reinicialização da memória, devolvendo o sistema ao desempenho definido assim que a ameaça cessar.

# text
seg-8d216d42c776 = Avaliação de confiança do registro do receptor

# text
seg-e3ca721d9d2e = Um registro de receptor mostra quando um fixo deixou de ser confiável e quando se recuperou; não mostra que uma reinicialização manual limpa todos os estados armazenados.

# text
seg-2c78c15cea96 = Nível { "1" }, requisito { "3" }

# text
seg-ab9458f8b8fc = Recarregar ou atualizar o firmware com segurança.

# text
seg-3a50eceb47f5 = A segurança da atualização de firmware está fora do que qualquer saída do Kshana observa.

# text
seg-752a194674f6 = Nível { "2" }, requisito { "4" }

# text
seg-a5f263a083c7 = Identificar fontes PNT comprometidas e impedir que corrompam a solução.

# text
seg-4e7034acccc0 = Detecção de spoofing e meaconing; Avaliação de confiança do registro do receptor; Monitoramento de integridade e níveis de proteção

# text
seg-d5fdef2a78f2 = O Kshana pontua detectores e monitores que modela ou executa sobre um registro; saber se a exclusão de fontes do próprio produto funciona exige o estado interno do produto, e não apenas o seu registro.

# text
seg-e3ea1208fac9 = Nível { "2" }, requisito { "5" }

# text
seg-c0219254fe8e = Recuperar fontes e o sistema automaticamente sem interromper a saída; uma solução continua sendo fornecida durante a ameaça, com degradação possivelmente ilimitada.

# text
seg-3dd48cb65cb4 = Holdover e coasting; Avaliação de confiança do registro do receptor

# text
seg-0c36c4a3eb4e = As execuções de holdover limitam a deriva modelada para um modelo declarado de relógio ou inercial, e não o comportamento de recuperação do próprio produto.

# text
seg-befbf4b94876 = Nível { "3" }, requisito { "6" }

# text
seg-45410d1675be = Dados corrompidos de uma fonte não devem contaminar outra fonte.

# text
seg-ff808ce8ec48 = Fontes PNT alternativas e diversas

# text
seg-ccf628643110 = O Kshana executa as fontes lado a lado; o isolamento de fontes dentro de um produto exige revisão de projeto ou injeção de falhas no produto.

# text
seg-a1d5a3125697 = Nível { "3" }, requisito { "7" }

# text
seg-db149ea618dd = Verificar de forma cruzada as soluções de todas as fontes e manter limitada a degradação durante uma ameaça.

# text
seg-4afa05ef42fa = Monitoramento de integridade e níveis de proteção; Holdover e coasting; Fontes PNT alternativas e diversas

# text
seg-8b1f938c0175 = A degradação limitada é mostrada para os sensores modelados; a verificação cruzada do próprio produto não é observada.

# text
seg-772244881e5b = Nível { "4" }, requisito { "8" }

# text
seg-aff5161e6363 = Usar fontes de tecnologias diferentes contra ameaças de modo comum, sem degradação durante a ameaça.

# text
seg-587889f9881c = Fontes PNT alternativas e diversas; Efeitos de jamming no orçamento de enlace

# text
seg-65b96caf8d6b = Um argumento de modo comum exige o conjunto de fontes do produto real e uma ameaça que as abranja; um cenário declara uma, mas não prova que o produto não tem fragilidade compartilhada.

# text
seg-3c4cc0793454 = Seção { "5.5" } (modo comum)

# text
seg-a87c9808dd99 = Mecanismos diversos não devem compartilhar uma fragilidade: por exemplo, um jammer que cobre duas bandas derrota a diversidade de bandas.

# text
seg-c10ba3bb01be = Efeitos de jamming no orçamento de enlace; Pontuação de resiliência sobre conjuntos de ameaças; Fontes PNT alternativas e diversas

# text
seg-843fe2fc9e33 = A pontuação usa um conjunto sintético de ameaças, declarado como tal; não são dados de campo.

# text
seg-3158e7efd1a5 = Seções { "8.1" } a { "8.3" } (avaliação)

# text
seg-3942d9cdc64b = A avaliação combina análise estática com análise dinâmica, em que vetores de teste representam as ameaças; as classes de teste são falha de fonte, interferência e falhas internas. Simuladores são citados como método de teste.

# text
seg-9d5c297c1ab9 = Avaliação de confiança do registro do receptor; Efeitos de jamming no orçamento de enlace; Detecção de spoofing e meaconing

# text
seg-bb02568e8f8f = O movimento e os eventos exportados podem conduzir um simulador de laboratório (docs/TEST-BENCH.md). O Kshana não grava nenhum sinal, de modo que o simulador e o seu operador, com a devida autorização, fornecem a ameaça.

# text
seg-b81625e9e071 = Seção { "8.6" } (elementos do plano de teste)

# text
seg-27d645a79672 = Um plano de teste declara o nível, o requisito, as entradas, as referências, o acesso a dados necessário, o procedimento com critérios de êxito ou falha, os resultados e as notas.

# text
seg-1f2898855ccc = Proveniência reprodutível da execução; Avaliação de confiança do registro do receptor

# text
seg-d8b08da48cb2 = Os critérios de êxito ou falha são escolhidos pelo avaliador; o Kshana registra as entradas, os limiares e os hashes com que foi executado.

# text
seg-ccfdf53a1e54 = <s1>Anterior</s1>Mapeamento de compliance

# text
seg-260ba950eb89 = <s1>Próximo</s1>Orientações da IMO para navios
