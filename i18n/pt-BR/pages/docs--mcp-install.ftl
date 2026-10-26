# docs--mcp-install: translations (pt-BR)

# text
seg-8d1e26cab542 = Todos os canais

# text
seg-261c059bec54 = Consultivo, não é um equipamento de navegação homologado: o operador continua responsável pela navegação. O servidor roda no seu computador; nada é enviado à Ashforde OÜ.

# text
seg-13641146503d = Cursor (um clique)

# text
seg-3bd13fe295f4 = VS Code (um clique)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Binário pré-compilado

# text
seg-d107bc8e1950 = Registro de MCP

# text
seg-842b77a21c5f = Canal

# text
seg-fdbb9db68f1d = nenhuma

# text
seg-a683980168f7 = Docker

# text
# c1: docs/MCP-INSTALL.md
seg-4a3510c45176 = Fonte: <c1/>

# text
seg-be0bf8294259 = Instalar o servidor MCP do Kshana (v{ $version })

# text
# c1: scripts/gen_mcp_install.py
# c2: scripts/test_gen_mcp_install.py
seg-bc58b4709618 = Todos os canais, com a forma fixada para esta versão. Os links de um clique e todos os trechos abaixo são gerados por <c1/> e decodificados de volta por <c2/>.

# text
seg-f3a2279d6df7 = Comando ou botão

# text
seg-20c5ae650eb7 = Requer

# text
seg-af4d3ce85e11 = Forma fixada

# text
seg-83c2ab5375f7 = Uma passagem que nomeia clientes de IA de terceiros fica de fora aqui; ela está em <a1>docs/MCP-INSTALL.md</a1> no GitHub.

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node ou Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ com uv ou pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = fórmula para v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> e depois <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifesto para v{ $version }

# text
seg-f7c0a2fbb0b5 = winget

# text
seg-9e599ab3c0a3 = winget (Windows)

# text
seg-091d1404bb8a = cargo

# text
seg-145ddf98e77f = Rust { "1.88" }+

# text
# c1: kshana-mcp
# c2: kshana-mcp-<target>[.exe]
# c3: SHA256SUMS
# c4: gh attestation verify
seg-b308519d4c8d = <a1>a página da versão</a1>: <c1/> (Linux x86-64), <c2/>, conferido por <c3/> e <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (encontrado por clientes que consultam o registro)

# text
seg-b1a6e807f06f = um cliente que consulta o registro

# text
seg-d5a3818ac3b6 = Remoto (HTTP em fluxo contínuo)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-e7b940d0b341 = <c1/>, hospedagem própria: veja <a1>../docs/deploy/mcp-http.md</a1>

# text
seg-5f1397b1ea30 = seu próprio host

# text
seg-f325b20ba911 = Escolha uma forma de iniciar o servidor

# text
seg-f7b7c7f2eb0d = Cada cliente abaixo aceita uma de três definições de servidor. Elas iniciam o mesmo servidor:

# text
# c1: npx -y kshana-mcp@0.39.0
seg-e40d4a54025f = <b>npx (Node)</b> (requer Node { "18" }+): <c1/>

# text
# c1: docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.39.0
seg-11aa05e3bace = <b>Docker</b> (requer Docker): <c1/>

# text
# c1: kshana-mcp
seg-d5fce7d58cfc = <b>kshana-mcp no PATH</b> (requer o binário (brew, scoop, winget, cargo ou um download da versão)): <c1/>

# text
seg-c320bcbc9bcd = Links de um clique

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC4zOS4wIl19
seg-0281dbe84644 = Cursor, npx (Node): <a1>link da web</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjM5LjAiXX0=
seg-405f915ef73a = Cursor, Docker: <a1>link da web</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoia3NoYW5hLW1jcCIsImFyZ3MiOltdfQ==
seg-cb98a41e1860 = Cursor, kshana-mcp no PATH: <a1>link da web</a1> · <c1/>

# text
seg-adf55784a59e = VS Code, npx (Node): <a1>abrir</a1> · <a2>Insiders</a2>

# text
seg-2befff4cecb5 = VS Code, Docker: <a1>abrir</a1> · <a2>Insiders</a2>

# text
seg-7a1f43b83429 = VS Code, kshana-mcp no PATH: <a1>abrir</a1> · <a2>Insiders</a2>

# text
# c1: goose://extension?cmd=npx&arg=-y&arg=kshana-mcp%400.39.0&timeout=300&id=kshana&name=Kshana&description=Kshana%20PNT-resilience%20simulator%20%28advisory%29
seg-a9ea65a68ba3 = Goose, npx: <c1/>

# text
seg-13df6618e070 = Outro cliente

# text
seg-bd94768521e0 = Configuração de cada cliente

# text
# c1: --scope user
seg-7da8e7a9d43d = Onde: execute em um terminal (acrescente <c1/> para todo projeto). Ou o plugin abaixo.

# text
seg-93d075d31cdd = npx (Node):

# text
seg-ae03b1ad65f1 = kshana-mcp no PATH:

# text
# c1: claude_desktop_config.json
# c2: .mcpb
seg-439fac4928a0 = Onde: <c1/> (Configurações, Desenvolvedor, Editar configuração). Ou dê um clique duplo na extensão <c2/> da versão: sem arquivo de configuração.

# text
seg-e998ab783248 = Cursor

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-1a35b243eeb1 = Onde: <c1/> (ou <c2/> em um projeto).

# text
seg-037830f503a6 = VS Code

# text
# c1: .vscode/mcp.json
# c2: code --add-mcp
# c3: name
seg-299fdd9ddc33 = Onde: <c1/>. Ou <c2/> com o mesmo objeto mais um <c3/>.

# text
seg-639e6489316c = Windsurf

# text
# c1: mcp_config.json
seg-1fc9f45fc618 = Onde: <c1/> (abra-o a partir das configurações de MCP do Cascade).

# text
seg-a335039dbfbc = Zed

# text
# c1: settings.json
seg-449c644479b3 = Onde: <c1/>.

# text
seg-98a55e5e8180 = Goose

# text
# c1: ~/.config/goose/config.yaml
seg-f84be6ce6c12 = Onde: <c1/>.

# text
seg-dc3ecf497e8b = Codex CLI

# text
# c1: ~/.codex/config.toml
seg-92181148d2cb = Onde: execute em um terminal, ou <c1/>.

# text
seg-a104919f2d57 = Gemini CLI

# text
# c1: ~/.gemini/settings.json
# c2: gemini mcp add
seg-286e9ef66ff9 = Onde: <c1/>, ou <c2/>.

# text
seg-1569eae38977 = Continue

# text
# c1: .continue/mcpServers/kshana.yaml
seg-1911b6d10cba = Onde: <c1/>.

# text
seg-f63917839413 = Uso remoto

# text
# c1: kshana-mcp --http <addr>
seg-db567a4e1a61 = <c1/> serve as mesmas ferramentas por HTTP em fluxo contínuo para um cliente que não pode executar um processo local. É para hospedagem própria; a Ashforde OÜ não opera um endpoint público. Veja <a1>deploy/mcp-http.md</a1>.

# text
seg-04c1f05fb027 = <s1>Anterior</s1>Servidor MCP

# text
seg-eba757f29814 = <s1>Próxima</s1>Servidor MCP: modo HTTP de hospedagem própria
