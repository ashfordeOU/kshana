# docs--studio: translations (pt-PT)

# text
seg-c3c260b7063e = Testes

# text
# c1: web/README.md
seg-ca497f6e51d4 = Fonte: <c1/>

# text
seg-256705861db0 = O sítio kshana.dev

# text
# c1: web/
# c2: index.html
# c3: missions.html
# c4: capabilities.html
# c5: evidence.html
# c6: developers.html
# c7: editions.html
# c8: docs/
# c9: studio/
# c10: studio/index.html
# c11: studio/advanced/index.html
# c12: <base href="../">
seg-82b7ed4e70af = <c1/> é a árvore que o GitHub Pages serve como <a1>https://kshana.dev</a1>: as páginas (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), a documentação em <c8/> e o Kshana Studio em <c9/> (servido em <a2>https://kshana.dev/studio/</a2>), a aplicação que executa o motor no navegador como WebAssembly (WASM), sem computação do lado do servidor e sem nada enviado. O Studio tem duas vistas de um só motor: a vista Simples (<c10/>, a resposta primeiro, em linguagem simples) e a vista Avançada (<c11/>, o painel completo), que partilha o motor, o worker, os módulos e os dados da vista Simples através de <c12/>.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Desde a { "0.35.0" }, o Studio tem mais quatro vistas, cada uma na sua própria página com <c1/>, sem indexação por motores de pesquisa e com uma pasta de amostras sintéticas que o seu teste lê:

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/>: a vista de confiança marítima, uma pontuação de confiança do recetor para um fluxo de posições de uma embarcação, com uma trajetória de demonstração em <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/>: o debriefing de formação de tripulações, a repetir NMEA sintético com um evento de jamming, drag-off, time-spoof ou replay (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/>: o mapa de interferência e a exposição do percurso (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/>: uma página de cartões de ferramentas com exemplos (<c2/>, <c3/>), incluindo pacotes de evidências assinados (<c4/>), a exportação de test bench (<c5/>), o mapeamento de compliance (<c6/>), a verificação Galileo OSNMA (<c7/>) e os canais do assistente de IA (<c8/>).

# text
seg-fb02aba9149f = De onde vêm os ficheiros

# text
seg-a58fb92bab82 = Aqui existem três tipos de ficheiro, e são alterados de três formas diferentes.

# text
# c1: docs/
# c2: css/
# c3: js/
# c4: assets/
# c5: data/
# c6: land.json
# c7: search.json
# c8: series.json
# c9: studio/
# c10: web/tools/port_site.py
# c11: PORT-MANIFEST.json
# c12: site.test.mjs
seg-d404d216114c = <b>Ficheiros portados.</b> As páginas, <c1/>, <c2/>, <c3/>, <c4/>, os dados do sítio em <c5/> (<c6/>, <c7/>, <c8/>) e tudo o que está em <c9/> são escritos por <c10/> a partir de uma compilação do sítio e do código-fonte do Studio. <c11/> lista cada um deles com a respetiva soma de controlo SHA-256 (Secure Hash Algorithm, 256 bits). <b>Não os edite aqui</b>: <c12/> falha perante uma edição manual. Altere a fonte e execute de novo a portagem:

# text
# c1: --check
# c2: web/
# c3: robots.txt
# c4: sitemap.xml
# c5: llms.txt
# c6: llms-full.txt
# c7: legacy-redirects.js
# c8: 404.html
# c9: playground/index.html
# c10: /studio/
seg-b681e66130e5 = A portagem é determinista: uma segunda execução não escreve nada, e <c1/> termina com { "1" } se <c2/> não for o que a portagem escreveria. Transporta sem alterações os ficheiros de rastreio da compilação do sítio (as etiquetas canónicas, de cartão social e schema.org de cada página, <c3/>, <c4/>, <c5/>, <c6/>), verifica-os, escreve <c7/>, <c8/> e a página de reencaminhamento no endereço antigo do Studio (<c9/>, para <c10/>), e aponta todas as páginas para os tipos de letra e as bibliotecas de scripts locais (abaixo).

# text
# c1: web/
seg-9be72ec8d40e = <b>Ficheiros que <c1/> possui.</b> São fontes por direito próprio e a portagem nunca lhes toca:

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> é a fonte estruturada dos cartões de capacidades e da grelha de normas. <b>Edite esse ficheiro, e não o HTML.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> é gerado (<c2/>) e fixado por <c3/>; não o edite à mão. <c4/>, <c5/> e <c6/> são mapeamentos mantidos à mão que o mesmo teste verifica face à matriz gerada. As cópias do Studio em <c7/> são estes ficheiros, byte a byte.

# text
# c1: og-card.svg
# c2: og-card.png
# c3: og-card.rendered-from.json
# c4: python3 tools/gen_og_card.py
seg-8901229c76ba = <c1/>, <c2/> e <c3/> são o cartão social (<c4/>).

# text
# c1: fonts/
# c2: vendor/
# c3: tools/fetch_third_party.py
seg-89d78af0258c = <c1/> e <c2/>: os ficheiros de tipos de letra e a biblioteca de scripts que as páginas usam, descarregados uma vez por <c3/> e registados (ver "Sem pedidos a terceiros").

# text
# c1: build.sh
# c2: smoke.mjs
# c3: site.test.mjs
# c4: legacy-urls.test.mjs
# c5: tools/
seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> e <c5/>.

# text
# c1: build.sh
# c2: pkg/
# c3: wasm-pack
# c4: studio/pkg/
# c5: scenarios/
seg-5071806d230f = <b>Resultados da compilação</b>, ignorados pelo git e produzidos por <c1/>: <c2/> (o pacote <c3/>, que é também a partir do qual o pacote npm é construído), <c4/> (o mesmo pacote no local onde o Studio o importa) e <c5/> (todos os cenários de referência, no endereço de onde o sítio anterior de página única os servia).

# text
seg-5042f55f78b5 = Compilar e servir localmente

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Sem a cadeia de ferramentas WASM, <c1/> prepara um pacote existente em vez de compilar um. O fluxo de trabalho das Pages nunca o usa.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Cada módulo em <c1/> é lógica pura com um <c2/> correspondente; os controladores do DOM (Document Object Model, a árvore de elementos da página) do Studio são <c3/> (a vista Simples) e <c4/> (a vista Avançada). A integração contínua executa cada um deles como um passo próprio e falha se um ficheiro de teste em <c5/> não tiver passo.

# text
seg-ba24be498f87 = Sem pedidos a terceiros

# text
seg-7215806f98d4 = O kshana.dev serve os seus próprios tipos de letra, estilos e scripts. Nenhuma página faz um pedido a um servidor de tipos de letra ou de scripts, pelo que o endereço de um visitante não lhe é entregue.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = O sítio e o Studio são escritos para o Google Fonts e para um servidor de scripts. A portagem substitui a ligação ao Google Fonts de cada página pela folha de estilos correspondente em <c1/> (as mesmas regras <c2/> e os mesmos ficheiros de tipos de letra, todos os subconjuntos, de modo que o texto seja desenhado como antes) e cada endereço de servidor de scripts pelo ficheiro em <c3/>. <c4/> e <c5/> registam de onde veio cada ficheiro e a sua soma de controlo; os tipos de letra estão sob a SIL Open Font License (<c6/>) e o three.js sob a licença MIT (<c7/>).

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> é o único passo que usa a rede. Execute-o de novo apenas quando uma página pedir um conjunto de tipos de letra ou uma versão de biblioteca que não esteja aqui: a portagem recusa e di-lo. <c2/> falha se alguma página, folha de estilos ou script portado nomear um servidor de tipos de letra ou carregar algo de outro servidor.

# text
seg-4ff8a4accad4 = A página { "404" }

# text
# c1: /404.html
seg-763503746a48 = O GitHub Pages responde a um endereço em falta com <c1/> e o estado { "404" }. A portagem constrói essa página a partir do invólucro da própria página inicial (navegação, rodapé, pesquisa) à volta de uma mensagem curta com ligações para o Início, a Documentação e o Studio. Todos os endereços nela são escritos a partir da raiz do sítio, porque é servida a qualquer profundidade.

# text
seg-9126631f595b = Endereços antigos

# text
# c1: /
# c2: /#playground
# c3: /#ledger
# c4: /#s=…
# c5: /?embed=1&…
# c6: tab=fom
# c7: tools/legacy-urls.json
# c8: legacy-redirects.js
seg-a64ed190233a = Até à { "v0.28.0" }, o sítio era uma página única, e tudo ficava atrás de um fragmento em <c1/> (<c2/>, <c3/>, ligações de partilha como <c4/>, incorporações como <c5/>; o nome antigo de um separador numa ligação de incorporação, como <c6/>, abre o separador do Studio que o substituiu). <c7/> lista cada um desses endereços que material publicado usa e onde passa agora a ficar; a página inicial carrega <c8/>, gerado a partir dessa lista, para os encaminhar para lá. Acrescente um caso à lista antes de retirar qualquer endereço.

# text
seg-a9db9b0675e2 = Implementação

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = O fluxo de trabalho do GitHub Actions <c1/> implementa uma etiqueta de versão, e não <c2/>: <c3/> aciona-o depois de uma versão ser publicada, e um acionamento manual reimplementa uma etiqueta indicada. Executa <c4/>, prepara <c5/> sem os testes, o script de compilação, <c6/>, o manifesto e este ficheiro, e publica o resultado no GitHub Pages.

# text
seg-6aa2e78078ae = <s1>Anterior</s1>Glossário

# text
seg-419353a4fb30 = <s1>Seguinte</s1>Tutoriais

# text
seg-74dc3fad6ee7 = <s1>Anterior</s1>Idiomas
