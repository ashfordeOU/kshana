# docs--studio: translations (pt-BR)

# text
seg-c3c260b7063e = Testes

# text
# c1: web/README.md
seg-ca497f6e51d4 = Fonte: <c1/>

# text
seg-256705861db0 = O site kshana.dev

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
seg-82b7ed4e70af = <c1/> é a árvore que o GitHub Pages serve como <a1>https://kshana.dev</a1>: as páginas (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), a documentação em <c8/> e o Kshana Studio em <c9/> (servido em <a2>https://kshana.dev/studio/</a2>), o aplicativo que executa o motor no navegador como WebAssembly (WASM), sem computação no servidor e sem nada enviado. O Studio tem duas visões de um mesmo motor: a visão Simple (<c10/>, a resposta primeiro, em palavras simples) e a visão Advanced (<c11/>, o painel completo), que compartilha o motor, o worker, os módulos e os dados da visão Simple por meio de <c12/>.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Desde a { "0.35.0" }, o Studio tem mais quatro visões, cada uma em sua própria página com <c1/>, sem indexação por buscadores e com uma pasta de amostras sintéticas que o seu teste lê:

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/>: a visão marítima de confiança, uma pontuação de confiança do receptor para o fluxo de posições de uma embarcação, com uma trilha de demonstração em <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/>: o debriefing de treinamento de tripulação, que reproduz NMEA sintético com um evento de jamming, drag-off, time-spoof ou replay (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/>: o mapa de interferência e a exposição de rotas (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/>: uma página de cartões de ferramentas com exemplos (<c2/>, <c3/>), incluindo pacotes de evidências assinados (<c4/>), a exportação para test bench (<c5/>), o mapeamento de compliance (<c6/>), a verificação OSNMA do Galileo (<c7/>) e os canais do assistente de IA (<c8/>).

# text
seg-fb02aba9149f = De onde vêm os arquivos

# text
seg-a58fb92bab82 = Três tipos de arquivo ficam aqui, e eles são alterados de três maneiras diferentes.

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
seg-d404d216114c = <b>Arquivos portados.</b> As páginas, <c1/>, <c2/>, <c3/>, <c4/>, os dados do site em <c5/> (<c6/>, <c7/>, <c8/>) e tudo em <c9/> são escritos por <c10/> a partir de um build do site e do código-fonte do Studio. <c11/> lista cada um com o seu checksum SHA-256 (Secure Hash Algorithm, 256 bits). <b>Não os edite aqui</b>: <c12/> falha diante de uma edição manual. Altere a fonte e execute o port novamente:

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
seg-b681e66130e5 = O port é determinístico: uma segunda execução não escreve nada, e <c1/> termina com { "1" } se <c2/> não for o que o port escreveria. Ele repassa sem alteração os arquivos de rastreamento do build do site (o canonical, o cartão social e as tags schema.org de cada página, <c3/>, <c4/>, <c5/>, <c6/>), confere-os, escreve <c7/>, <c8/> e a página de encaminhamento no endereço antigo do Studio (<c9/>, para <c10/>), e aponta cada página para as fontes e bibliotecas de script locais (abaixo).

# text
# c1: web/
seg-9be72ec8d40e = <b>Arquivos que <c1/> possui.</b> São fontes por mérito próprio, e o port nunca os toca:

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> é a fonte estruturada dos cartões de capacidades e da grade de padrões. <b>Edite esse arquivo, não o HTML.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> é gerado (<c2/>) e fixado por <c3/>; não o edite à mão. <c4/>, <c5/> e <c6/> são mapeamentos mantidos à mão que o mesmo teste confere com a matriz gerada. As cópias do Studio em <c7/> são esses arquivos, byte a byte.

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
seg-89d78af0258c = <c1/> e <c2/>: os arquivos de fonte e a biblioteca de script que as páginas usam, obtidos uma única vez por <c3/> e versionados (veja "Sem requisições a terceiros").

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
seg-5071806d230f = <b>Saídas de build</b>, ignoradas pelo git e produzidas por <c1/>: <c2/> (o pacote <c3/>, a partir do qual também se constrói o pacote npm), <c4/> (o mesmo pacote, onde o Studio o importa) e <c5/> (todo cenário de referência, no endereço de onde o site anterior, de página única, os servia).

# text
seg-5042f55f78b5 = Compilar e servir localmente

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Sem a toolchain WASM, <c1/> prepara um pacote existente em vez de compilar um. O fluxo de trabalho do Pages nunca usa isso.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Cada módulo em <c1/> é lógica pura com um <c2/> correspondente; os drivers do DOM (Document Object Model, a árvore de elementos da página) do Studio são <c3/> (a visão Simple) e <c4/> (a visão Advanced). A integração contínua executa cada um deles como uma etapa própria e falha se um arquivo de teste em <c5/> não tiver etapa.

# text
seg-ba24be498f87 = Sem requisições a terceiros

# text
seg-7215806f98d4 = O kshana.dev serve as suas próprias fontes, estilos e scripts. Uma página não faz nenhuma requisição a um host de fontes ou a um host de scripts, de modo que o endereço de um visitante não é entregue a nenhum deles.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = O site e o Studio são escritos para usar o Google Fonts e um host de scripts. O port substitui o link do Google Fonts de cada página pela folha de estilo correspondente em <c1/> (as mesmas regras <c2/> e os mesmos arquivos de fonte, todos os subconjuntos, de modo que o texto seja renderizado como antes) e cada endereço de host de scripts pelo arquivo em <c3/>. <c4/> e <c5/> registram de onde veio cada arquivo e o seu checksum; as fontes estão sob a SIL Open Font License (<c6/>) e o three.js sob a licença MIT (<c7/>).

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> é a única etapa que usa a rede. Execute-a novamente apenas quando uma página pedir um conjunto de fontes ou uma versão de biblioteca que não esteja aqui: o port recusa e informa isso. <c2/> falha se qualquer página, folha de estilo ou script portado nomear um host de fontes ou carregar qualquer coisa de outro host.

# text
seg-4ff8a4accad4 = A página { "404" }

# text
# c1: /404.html
seg-763503746a48 = O GitHub Pages responde a um endereço inexistente com <c1/> e o status { "404" }. O port cria essa página a partir da própria estrutura da página inicial (navegação, rodapé, busca) em torno de uma mensagem curta com links para a Home, a Docs e o Studio. Todo endereço nela é escrito a partir da raiz do site, porque ela é servida em qualquer profundidade.

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
seg-a64ed190233a = Até a { "v0.28.0" }, o site era uma página única, e tudo ficava atrás de um fragmento em <c1/> (<c2/>, <c3/>, links de compartilhamento como <c4/>, incorporações como <c5/>; o nome antigo de uma aba em um link de incorporação, como <c6/>, abre a aba do Studio que a substituiu). <c7/> lista todo endereço desse tipo que o material publicado usa e para onde ele leva agora; a página inicial carrega <c8/>, gerado a partir dessa lista, para encaminhá-los até lá. Acrescente um caso à lista antes de aposentar qualquer endereço.

# text
seg-a9db9b0675e2 = Implantação

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = O fluxo de trabalho <c1/> do GitHub Actions implanta uma tag de release, não <c2/>: <c3/> o dispara assim que uma release é publicada, e um disparo manual reimplanta uma tag nomeada. Ele executa <c4/>, prepara <c5/> sem os testes, o script de build, <c6/>, o manifesto e este arquivo, e publica o resultado no GitHub Pages.

# text
seg-6aa2e78078ae = <s1>Anterior</s1>Glossário

# text
seg-419353a4fb30 = <s1>Próximo</s1>Tutoriais
