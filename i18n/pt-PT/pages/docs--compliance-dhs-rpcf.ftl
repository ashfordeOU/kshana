# docs--compliance-dhs-rpcf: translations (pt-PT)

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-fdbb9db68f1d = none

# text
# c1: docs/compliance/dhs-rpcf.md
seg-dbec6a166e56 = Fonte: <c1/>

# text
seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: aquilo em apoio de que o Kshana fornece elementos de prova

# text
seg-cef4181edf29 = O quadro de referência descreve níveis de resiliência de { "0" } a { "4" } construídos a partir de oito requisitos numerados e uma abordagem de avaliação que combina análise estática com análise dinâmica em que vetores de teste substituem as ameaças. Não tem um esquema próprio de identificadores de requisitos, pelo que as referências abaixo são os seus números de nível e de requisito e os seus números de secção. É baseado em resultados e não cataloga ameaças.

# text
# c1: kshana compliance-report
seg-ff0e00610721 = Cada linha indica quais as saídas do Kshana que <b>fornecem elementos de prova em apoio</b> do requisito e o que fica por cobrir. Nada aqui diz que um quadro de referência é satisfeito nem que algum produto foi classificado ou aprovado por quem quer que seja. Execute <c1/> sobre os seus próprios ficheiros de resultados para ver para que linhas as suas execuções fornecem efetivamente provas; ver <a1>README.md</a1>.

# text
seg-30c8cabb6e90 = Documentos de origem

# text
seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Versão { "2.0" }, { "26" } de abril de { "2022" } (DHS Science and Technology Directorate, com a CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Lido em 2026-10-09: documento lido na íntegra; a página de apresentação da publicação não foi obtida.

# text
seg-955191e0baab = Correspondência

# text
seg-6ba8f74126ee = O que pede (parafraseado)

# text
seg-0438151025da = Saídas do Kshana que fornecem elementos de prova em apoio

# text
seg-3f265e18f56c = Lacuna

# text
seg-4263435e702a = Secção { "5.2" } (Prevent, Respond, Recover)

# text
seg-e7b721f6e216 = A resiliência é descrita como três funções: prevenir danos, responder (detetar, comunicar, mitigar, conter) e recuperar. A deteção é probabilística, pelo que tanto os falsos alarmes como as deteções falhadas importam.

# text
seg-3447d3b53fe8 = Avaliação de confiança do registo de recetor; Deteção de spoofing e meaconing; Holdover e marcha livre

# text
seg-ab055a50e16e = A prevenção é uma propriedade de projeto do produto que nenhuma saída de simulação demonstra. As estatísticas de deteção de uma execução sintética ou de uma única sessão não são uma taxa medida de falsos alarmes ou de falhas de deteção de um produto em serviço.

# text
seg-501badd6a436 = Nível { "1" }, requisito { "1" }

# text
seg-e8cfbe121084 = Verificar que os dados armazenados que chegam de fontes externas correspondem aos formatos e intervalos de valores das normas relevantes.

# text
seg-7d7196aefa05 = Uma propriedade de garantia de software e de validação de entradas do produto em ensaio. O Kshana não inspeciona o tratamento de entradas de um produto.

# text
seg-6085030de980 = Nível { "1" }, requisito { "2" }

# text
seg-e8cd6fb732ad = Permitir a recuperação manual completa limpando ou repondo a memória, devolvendo o sistema ao desempenho definido assim que a ameaça desaparece.

# text
seg-8d216d42c776 = Avaliação de confiança do registo de recetor

# text
seg-e3ca721d9d2e = Um registo de recetor mostra quando uma solução de posição deixou de ser fiável e quando recuperou; não mostra que um reinício manual limpa todos os estados armazenados.

# text
seg-2c78c15cea96 = Nível { "1" }, requisito { "3" }

# text
seg-ab9458f8b8fc = Recarregar ou atualizar o firmware de forma segura.

# text
seg-3a50eceb47f5 = A segurança da atualização de firmware está fora do que qualquer saída do Kshana observa.

# text
seg-752a194674f6 = Nível { "2" }, requisito { "4" }

# text
seg-a5f263a083c7 = Identificar fontes PNT comprometidas e impedi-las de corromper a solução.

# text
seg-4e7034acccc0 = Deteção de spoofing e meaconing; Avaliação de confiança do registo de recetor; Monitorização de integridade e níveis de proteção

# text
seg-d5fdef2a78f2 = O Kshana pontua detetores e monitores que modela ou executa sobre um registo; saber se a exclusão de fontes do próprio produto funciona exige o estado interno do produto, e não apenas o seu registo.

# text
seg-e3ea1208fac9 = Nível { "2" }, requisito { "5" }

# text
seg-c0219254fe8e = Recuperar fontes e o sistema automaticamente sem interromper a saída; continua a ser fornecida uma solução durante a ameaça, com uma degradação possivelmente ilimitada.

# text
seg-3dd48cb65cb4 = Holdover e marcha livre; Avaliação de confiança do registo de recetor

# text
seg-0c36c4a3eb4e = As execuções de holdover limitam a deriva modelada para um modelo de relógio ou inercial indicado, e não o comportamento de recuperação do próprio produto.

# text
seg-befbf4b94876 = Nível { "3" }, requisito { "6" }

# text
seg-45410d1675be = Dados corrompidos de uma fonte não devem contaminar outra fonte.

# text
seg-ff808ce8ec48 = Fontes PNT alternativas e diversas

# text
seg-ccf628643110 = O Kshana executa fontes lado a lado; o isolamento de fontes dentro de um produto exige revisão de projeto ou injeção de falhas no produto.

# text
seg-a1d5a3125697 = Nível { "3" }, requisito { "7" }

# text
seg-db149ea618dd = Verificar de forma cruzada as soluções de todas as fontes e manter limitada a degradação durante uma ameaça.

# text
seg-4afa05ef42fa = Monitorização de integridade e níveis de proteção; Holdover e marcha livre; Fontes PNT alternativas e diversas

# text
seg-8b1f938c0175 = A degradação limitada é demonstrada para os sensores modelados; a verificação cruzada do próprio produto não é observada.

# text
seg-772244881e5b = Nível { "4" }, requisito { "8" }

# text
seg-aff5161e6363 = Usar fontes de tecnologias diferentes contra ameaças de modo comum, sem degradação durante a ameaça.

# text
seg-587889f9881c = Fontes PNT alternativas e diversas; Efeitos do orçamento de ligação de jamming

# text
seg-65b96caf8d6b = Um argumento de modo comum exige o conjunto de fontes do produto real e uma ameaça que as abranja; um cenário enuncia uma, não prova que o produto não tem fragilidade partilhada.

# text
seg-3c4cc0793454 = Secção { "5.5" } (modo comum)

# text
seg-a87c9808dd99 = Mecanismos diversos não devem partilhar uma fragilidade: por exemplo, um jammer que cubra duas bandas anula a diversidade de bandas.

# text
seg-c10ba3bb01be = Efeitos do orçamento de ligação de jamming; Pontuação de resiliência sobre ensembles de ameaças; Fontes PNT alternativas e diversas

# text
seg-843fe2fc9e33 = A pontuação usa um ensemble sintético de ameaças, declarado como tal; não são dados de campo.

# text
seg-3158e7efd1a5 = Secções { "8.1" } a { "8.3" } (avaliação)

# text
seg-3942d9cdc64b = A avaliação combina análise estática com análise dinâmica, em que vetores de teste substituem as ameaças; as classes de teste são falha de fonte, interferência e falhas internas. Os simuladores são nomeados como método de teste.

# text
seg-9d5c297c1ab9 = Avaliação de confiança do registo de recetor; Efeitos do orçamento de ligação de jamming; Deteção de spoofing e meaconing

# text
seg-bb02568e8f8f = O movimento e os eventos exportados podem conduzir um simulador de laboratório (docs/TEST-BENCH.md). O Kshana não escreve nenhum sinal, pelo que o simulador e o seu operador com autorização fornecem a ameaça.

# text
seg-b81625e9e071 = Secção { "8.6" } (elementos do plano de teste)

# text
seg-27d645a79672 = Um plano de teste indica o nível, o requisito, as entradas, as referências, o acesso a dados necessário, o procedimento com critérios de êxito ou falha, os resultados e as notas.

# text
seg-1f2898855ccc = Proveniência reprodutível de execuções; Avaliação de confiança do registo de recetor

# text
seg-d8b08da48cb2 = Os critérios de êxito ou falha são escolhidos pelo avaliador; o Kshana regista as entradas, os limiares e os hashes com que correu.

# text
seg-ccfdf53a1e54 = <s1>Anterior</s1>Mapeamento de compliance

# text
seg-260ba950eb89 = <s1>Seguinte</s1>Orientações da IMO para navios
