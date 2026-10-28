# docs--i18n: translations (pt-BR)

seg-c3c260b7063e = Testes

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Ainda não está no GitHub

seg-26b562e7f535 = Fonte: <c1/>

seg-60b2e78c882e = Localização do motor

seg-7f3a6f2932c2 = O texto do motor voltado às pessoas está em { "17" } idiomas além do inglês: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. O inglês é a fonte; <c1/> é uma pseudolocalidade que acentua, coloca entre colchetes e preenche cada mensagem, de modo que um teste pode ver se o texto foi para o catálogo. O framework é o <a1>Project Fluent</a1> (<c2/>, <c3/>); o código está em <c4/>.

seg-1ed9fde69630 = O que é localizado e o que nunca é

seg-1cb6eb25338d = Localizado (uma pessoa lê)

seg-ab884f59f5f3 = Nunca localizado (um programa lê)

seg-dbe9b8a0ed98 = mensagens e erros da linha de comando

seg-711a8e63c1de = chaves e valores JSON de <c1/> e <c2/>

seg-a4066ef82152 = a linha de resumo de cada execução

seg-6fbdf82a22dc = cabeçalhos e linhas de CSV

seg-8d08a6f5f16f = o texto dos gráficos SVG (títulos, eixos, legendas, descrições)

seg-8ad1234dfb18 = nomes de arquivos

seg-777c2587e0da = <c1/>: títulos, tabelas, notas, legendas

seg-d5cf8d8abe89 = códigos de erro (<c1/>)

seg-7ba47f2644f5 = palavras de veredito (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = a matriz de verificação, definições de unidades, proveniência

seg-122495009a9c = as descrições dos tipos de cenário (<c1/>)

seg-c7bc43c1e848 = declarações consultivas, avisos legais e comunicados (<c1/>)

seg-dd0fc888e0dc = os mesmos textos dentro de JSON, que permanecem em inglês

seg-a236606f1ca1 = <c1/> da campanha iq, a página de comparação de estudos, o placar do bench, o relatório de resiliência

seg-4ec45651bd09 = <c1/> de um pacote de evidências e o PNG do observatório: ambos têm hash em um manifesto (o do pacote também é assinado), por isso são gerados em inglês qualquer que seja o idioma

seg-048b6c3a9f0c = Os números em texto para pessoas usam o separador decimal do idioma (uma vírgula em { "15" } dos { "18" } idiomas; um ponto em en, ja, zh-Hans e en-XA). Os números em arquivos de máquina sempre usam o ponto. Uma contagem (uma variável chamada <c1/>, <c2/>, <c3/>, <c4/> ou <c5/>) chega ao Fluent como número, de modo que uma tradução pode escrever <c6/>.

seg-487d6d38fa39 = Escolha do idioma

seg-79499bebb806 = Linha de comando: <c1/>, depois <c2/>, <c3/>, <c4/>, <c5/>, depois o inglês. <c6/> é pt-BR; apenas <c7/> é o de Portugal. <c8/> é o simplificado; o tradicional é recusado com a lista das etiquetas aceitas.

seg-079f85726238 = Biblioteca: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> em <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: um <c1/> final opcional em <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> em <c2/> e <c3/>.

seg-e133ee809c98 = Erros e seus códigos

seg-fac73c5cbbc2 = Toda mensagem de erro tem um código estável, o id da mensagem em maiúsculas (<c1/> é <c2/>), o mesmo em todos os idiomas. O texto da linha de comando em inglês não muda. Em outro idioma a linha é <c3/>; com <c4/> uma segunda linha <c5/> vem em seguida em todos os idiomas. A API fornece <c6/> e <c7/> (<c8/>); os erros do MCP trazem <c9/> como dados do erro. Compare pelo código, nunca pelo texto.

seg-7d731dc5f888 = Como uma execução funciona em outro idioma (a regra de executar duas vezes)

seg-204df30d9ca2 = Um arquivo de máquina não pode depender do idioma. Uma execução em outro idioma portanto executa o cenário duas vezes: uma em inglês, cujos <c1/>, <c2/> e CSV são os arquivos de máquina, e outra no idioma do usuário, para o resumo, o gráfico e <c3/>. O inglês é uma única execução, byte a byte o que era antes.

seg-b7447d4cd5a8 = Medido, nativo, build de release, inglês e depois <c1/> (segundos): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; todo outro cenário incluído leva menos de { "4" } s; os { "173" } cenários incluídos quando isso foi medido levaram { "64" } s em inglês no total. O custo é exatamente o dobro para outro idioma. O WebAssembly não foi medido (sem wasm-bindgen aqui); com o fator do navegador de cerca de { "4" }, é um minuto para o tipo de cenário mais lento.

seg-cc148fdec7a2 = Uma página evita a espera mostrando o resultado em inglês de imediato e chamando <c1/> depois: essa é apenas a segunda execução, retorna <c2/>, e o Studio pode dizer "traduzindo..." até que ela chegue.

seg-cd0360ad624d = <b>Item da { "0.41" }: uma única execução.</b> Renderizar os dois a partir de um registro de <c1/>. Foi avaliado e não construído: os resultados de <c2/> são inspecionados, medidos e têm hash calculado depois de produzidos (larguras do texto dos gráficos, hashes de proveniência sobre o texto de saída), e <c3/> formata no ponto de chamada, de modo que um registro poria marcadores provisórios nos arquivos de máquina e faria seus bytes dependerem da repetição. Exigiria <c4/>/<c5/> que devolvem marcadores, um finalizador em cada gravador e uma prova de identidade de bytes por gravador.

seg-67e04a43cea8 = A build wasm incorpora apenas o catálogo em inglês. Os outros dezesseis acrescentariam cerca de { "150" } kB gzip cada um. Uma página busca <c1/> quando um idioma é escolhido e chama <c2/>; se a busca ou o registro falhar, a página permanece em inglês. Nativamente, a linha de comando e o wheel de Python incorporam todos os { "18" }.

seg-9a2f85e7e43c = Tamanho, <c1/> sem otimização a partir de <c2/> (antes do wasm-bindgen e do wasm-opt), base bc04e98f contra esta ramificação: { "18.71" } MB -> { "19.88" } MB bruto, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. O catálogo em inglês tem { "521" } kB brutos, { "153" } kB deles em gzip; o resto é <c3/> e suas dependências. Isso é aceito como medido.

seg-3ce9aab4916e = O catálogo

seg-fdea76581cd8 = <c1/> contém as mensagens, com ids prefixados por <c2/>. <c3/> é a fonte; os outros arquivos são dos tradutores e podem não ter mensagens (cada uma recorre ao inglês por mensagem). Listas complementares em <c4/>: <c5/> (mensagens com variáveis de contagem, para as formas plurais), <c6/> (números passados como placeables), <c7/> (mensagens que são partes de uma frase montada em tempo de execução: devem ser reunidas em mensagens de frase completa, nunca aumentar).

seg-9432bca8a935 = <c1/> prova o inglês: toda mensagem tem um modelo original registrado e é renderizada exatamente nesse texto; todo id é usado; as variáveis coincidem; a pseudolocalidade renderiza todas as mensagens. <c2/>, <c3/>, <c4/> cobrem os pontos de entrada, as descrições dos tipos de cenário e os textos legais. <c5/> falha se um novo literal de texto que uma pessoa leria contorna o catálogo: tolerância por arquivo em <c6/>, que pode diminuir e nunca aumentar. <c7/> executa cenários inteiros com um binário de referência e com o atual e compara todos os arquivos de saída.

seg-969a4b12b12c = Como mover um texto para o catálogo: <c1/>.

seg-48c3c0ca063d = Dependências e licenças

seg-b6c2f08c9a46 = O framework acrescenta <c1/> { "0.16" } (Apache-2.0 OR MIT) e <c2/> { "0.9" } (MIT OR Apache-2.0), com seus crates transitivos: <c3/> e <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: a alternativa Apache-2.0 é a usada, que <c9/> permite), <c10/> e <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Todas são permissivas segundo a lista <c16/> de <c17/>; <c18/> aparece em duas versões ({ "1" } e { "2" }), o que <c19/> apenas informa. A lista de licenças foi lida de <c20/>; <c21/> não está instalado no ambiente de elaboração e é executado na CI de integração.

seg-6aa2e78078ae = <s1>Anterior</s1>Glossário

seg-670504be0531 = <s1>Próximo</s1>Guia do Studio
