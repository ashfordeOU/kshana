# docs--mcp-install: translations (es)

# text
seg-8d1e26cab542 = Todos los canales

# text
seg-261c059bec54 = De carácter consultivo, no es un equipo de navegación homologado: el operador sigue siendo responsable de la navegación. El servidor se ejecuta en su ordenador; no se envía nada a Ashforde OÜ.

# text
seg-13641146503d = Cursor (un clic)

# text
seg-3bd13fe295f4 = VS Code (un clic)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Binario precompilado

# text
seg-d107bc8e1950 = Registro de MCP

# text
seg-842b77a21c5f = Canal

# text
seg-fdbb9db68f1d = ninguna

# text
seg-a683980168f7 = Docker

# text
# c1: docs/MCP-INSTALL.md
seg-4a3510c45176 = Fuente: <c1/>

# text
seg-be0bf8294259 = Instalar el servidor MCP de Kshana (v{ $version })

# text
# c1: scripts/gen_mcp_install.py
# c2: scripts/test_gen_mcp_install.py
seg-bc58b4709618 = Todos los canales, con la forma fijada para esta versión. Los enlaces de un clic y cada fragmento de abajo los genera <c1/> y los vuelve a decodificar <c2/>.

# text
seg-f3a2279d6df7 = Comando o botón

# text
seg-20c5ae650eb7 = Requiere

# text
seg-af4d3ce85e11 = Forma fijada

# text
seg-83c2ab5375f7 = Aquí se omite un pasaje que nombra clientes de IA de terceros; está en <a1>docs/MCP-INSTALL.md</a1> en GitHub.

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node o Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ con uv o pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = fórmula para v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> y luego <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifiesto para v{ $version }

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
seg-b308519d4c8d = <a1>la página de la versión</a1>: <c1/> (Linux x86-64), <c2/>, comprobado con <c3/> y <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (lo encuentran los clientes que conocen el registro)

# text
seg-b1a6e807f06f = un cliente que conoce el registro

# text
seg-d5a3818ac3b6 = Remoto (HTTP en streaming)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-e7b940d0b341 = <c1/>, autoalojado: véase <a1>../docs/deploy/mcp-http.md</a1>

# text
seg-5f1397b1ea30 = su propio host

# text
seg-f325b20ba911 = Elija una forma de iniciar el servidor

# text
seg-f7b7c7f2eb0d = Cada cliente de abajo admite una de tres definiciones de servidor. Todas inician el mismo servidor:

# text
# c1: npx -y kshana-mcp@0.39.0
seg-e40d4a54025f = <b>npx (Node)</b> (necesita Node { "18" }+): <c1/>

# text
# c1: docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.39.0
seg-11aa05e3bace = <b>Docker</b> (necesita Docker): <c1/>

# text
# c1: kshana-mcp
seg-d5fce7d58cfc = <b>kshana-mcp en el PATH</b> (necesita el binario (brew, scoop, winget, cargo o una descarga de la versión)): <c1/>

# text
seg-c320bcbc9bcd = Enlaces de un clic

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC4zOS4wIl19
seg-0281dbe84644 = Cursor, npx (Node): <a1>enlace web</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjM5LjAiXX0=
seg-405f915ef73a = Cursor, Docker: <a1>enlace web</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoia3NoYW5hLW1jcCIsImFyZ3MiOltdfQ==
seg-cb98a41e1860 = Cursor, kshana-mcp en el PATH: <a1>enlace web</a1> · <c1/>

# text
seg-adf55784a59e = VS Code, npx (Node): <a1>abrir</a1> · <a2>Insiders</a2>

# text
seg-2befff4cecb5 = VS Code, Docker: <a1>abrir</a1> · <a2>Insiders</a2>

# text
seg-7a1f43b83429 = VS Code, kshana-mcp en el PATH: <a1>abrir</a1> · <a2>Insiders</a2>

# text
# c1: goose://extension?cmd=npx&arg=-y&arg=kshana-mcp%400.39.0&timeout=300&id=kshana&name=Kshana&description=Kshana%20PNT-resilience%20simulator%20%28advisory%29
seg-a9ea65a68ba3 = Goose, npx: <c1/>

# text
seg-13df6618e070 = Otro cliente

# text
seg-bd94768521e0 = Configuración de cada cliente

# text
# c1: --scope user
seg-7da8e7a9d43d = Dónde: ejecútelo en un terminal (añada <c1/> para todos los proyectos). O use el complemento de abajo.

# text
seg-93d075d31cdd = npx (Node):

# text
seg-ae03b1ad65f1 = kshana-mcp en el PATH:

# text
# c1: claude_desktop_config.json
# c2: .mcpb
seg-439fac4928a0 = Dónde: <c1/> (Settings, Developer, Edit Config). O haga doble clic en la extensión <c2/> de la versión: sin archivo de configuración.

# text
seg-e998ab783248 = Cursor

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-1a35b243eeb1 = Dónde: <c1/> (o <c2/> en un proyecto).

# text
seg-037830f503a6 = VS Code

# text
# c1: .vscode/mcp.json
# c2: code --add-mcp
# c3: name
seg-299fdd9ddc33 = Dónde: <c1/>. O <c2/> con el mismo objeto más un <c3/>.

# text
seg-639e6489316c = Windsurf

# text
# c1: mcp_config.json
seg-1fc9f45fc618 = Dónde: <c1/> (ábralo desde los ajustes MCP de Cascade).

# text
seg-a335039dbfbc = Zed

# text
# c1: settings.json
seg-449c644479b3 = Dónde: <c1/>.

# text
seg-98a55e5e8180 = Goose

# text
# c1: ~/.config/goose/config.yaml
seg-f84be6ce6c12 = Dónde: <c1/>.

# text
seg-dc3ecf497e8b = Codex CLI

# text
# c1: ~/.codex/config.toml
seg-92181148d2cb = Dónde: ejecútelo en un terminal, o <c1/>.

# text
seg-a104919f2d57 = Gemini CLI

# text
# c1: ~/.gemini/settings.json
# c2: gemini mcp add
seg-286e9ef66ff9 = Dónde: <c1/>, o <c2/>.

# text
seg-1569eae38977 = Continue

# text
# c1: .continue/mcpServers/kshana.yaml
seg-1911b6d10cba = Dónde: <c1/>.

# text
seg-f63917839413 = Uso remoto

# text
# c1: kshana-mcp --http <addr>
seg-db567a4e1a61 = <c1/> sirve las mismas herramientas por HTTP en streaming para un cliente que no puede ejecutar un proceso local. Es para autoalojamiento; Ashforde OÜ no ejecuta un endpoint público. Véase <a1>deploy/mcp-http.md</a1>.

# text
seg-04c1f05fb027 = <s1>Anterior</s1>Servidor MCP

# text
seg-eba757f29814 = <s1>Siguiente</s1>Servidor MCP: modo HTTP autoalojado
