# docs--mcp-install: translations (de)

# text
seg-8d1e26cab542 = Alle Wege

# text
seg-261c059bec54 = Beratend, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt für die Navigation verantwortlich. Der Server läuft auf Ihrem Computer; es wird nichts an Ashforde OÜ gesendet.

# text
seg-13641146503d = Cursor (ein Klick)

# text
seg-3bd13fe295f4 = VS Code (ein Klick)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Vorkompilierte Binärdatei

# text
seg-d107bc8e1950 = MCP-Register

# text
seg-842b77a21c5f = Kanal

# text
seg-fdbb9db68f1d = keine

# text
seg-a683980168f7 = Docker

# text
# c1: docs/MCP-INSTALL.md
seg-4a3510c45176 = Quelle: <c1/>

# text
seg-be0bf8294259 = Den Kshana-MCP-Server installieren (v{ $version })

# text
# c1: scripts/gen_mcp_install.py
# c2: scripts/test_gen_mcp_install.py
seg-bc58b4709618 = Jeder Kanal, mit der festgelegten Form für diese Version. Die Ein-Klick-Links und jedes Snippet unten werden von <c1/> erzeugt und von <c2/> wieder dekodiert.

# text
seg-f3a2279d6df7 = Befehl oder Schaltfläche

# text
seg-20c5ae650eb7 = Voraussetzung

# text
seg-af4d3ce85e11 = Festgelegte Form

# text
seg-83c2ab5375f7 = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier weggelassen; sie steht in <a1>docs/MCP-INSTALL.md</a1> auf GitHub.

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node oder Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ mit uv oder pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = Formel für v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/>, dann <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = Manifest für v{ $version }

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
seg-b308519d4c8d = <a1>die Release-Seite</a1>: <c1/> (Linux x86-64), <c2/>, geprüft mit <c3/> und <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (von registrierungsfähigen Clients gefunden)

# text
seg-b1a6e807f06f = ein registrierungsfähiger Client

# text
seg-d5a3818ac3b6 = Remote (Streamable HTTP)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-e7b940d0b341 = <c1/>, selbst gehostet: siehe <a1>../docs/deploy/mcp-http.md</a1>

# text
seg-5f1397b1ea30 = Ihr eigener Host

# text
seg-f325b20ba911 = Wählen Sie, wie der Server gestartet wird

# text
seg-f7b7c7f2eb0d = Jeder Client unten nimmt eine von drei Server-Definitionen. Sie starten denselben Server:

# text
# c1: kshana-mcp
seg-d5fce7d58cfc = <b>kshana-mcp im PATH</b> (braucht die Binärdatei (brew, scoop, winget, cargo oder einen Release-Download)): <c1/>

# text
seg-c320bcbc9bcd = Ein-Klick-Links

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoia3NoYW5hLW1jcCIsImFyZ3MiOltdfQ==
seg-cb98a41e1860 = Cursor, kshana-mcp im PATH: <a1>Web-Link</a1> · <c1/>

# text
seg-adf55784a59e = VS Code, npx (Node): <a1>öffnen</a1> · <a2>Insiders</a2>

# text
seg-2befff4cecb5 = VS Code, Docker: <a1>öffnen</a1> · <a2>Insiders</a2>

# text
seg-7a1f43b83429 = VS Code, kshana-mcp im PATH: <a1>öffnen</a1> · <a2>Insiders</a2>

# text
seg-13df6618e070 = Ein anderer Client

# text
seg-bd94768521e0 = Konfiguration jedes Clients

# text
# c1: --scope user
seg-7da8e7a9d43d = Wo: in einem Terminal ausführen (fügen Sie <c1/> für jedes Projekt hinzu). Oder das Plugin unten.

# text
seg-93d075d31cdd = npx (Node):

# text
seg-ae03b1ad65f1 = kshana-mcp im PATH:

# text
# c1: claude_desktop_config.json
# c2: .mcpb
seg-439fac4928a0 = Wo: <c1/> (Settings, Developer, Edit Config). Oder doppelklicken Sie auf die Erweiterung <c2/> aus dem Release: keine Konfigurationsdatei.

# text
seg-e998ab783248 = Cursor

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-1a35b243eeb1 = Wo: <c1/> (oder <c2/> in einem Projekt).

# text
seg-037830f503a6 = VS Code

# text
# c1: .vscode/mcp.json
# c2: code --add-mcp
# c3: name
seg-299fdd9ddc33 = Wo: <c1/>. Oder <c2/> mit demselben Objekt plus einem <c3/>.

# text
seg-639e6489316c = Windsurf

# text
# c1: mcp_config.json
seg-1fc9f45fc618 = Wo: <c1/> (öffnen Sie sie aus den MCP-Einstellungen von Cascade).

# text
seg-a335039dbfbc = Zed

# text
# c1: settings.json
seg-449c644479b3 = Wo: <c1/>.

# text
seg-98a55e5e8180 = Goose

# text
# c1: ~/.config/goose/config.yaml
seg-f84be6ce6c12 = Wo: <c1/>.

# text
seg-dc3ecf497e8b = Codex CLI

# text
# c1: ~/.codex/config.toml
seg-92181148d2cb = Wo: in einem Terminal ausführen oder <c1/>.

# text
seg-a104919f2d57 = Gemini CLI

# text
# c1: ~/.gemini/settings.json
# c2: gemini mcp add
seg-286e9ef66ff9 = Wo: <c1/> oder <c2/>.

# text
seg-1569eae38977 = Continue

# text
# c1: .continue/mcpServers/kshana.yaml
seg-1911b6d10cba = Wo: <c1/>.

# text
seg-f63917839413 = Remote-Nutzung

# text
# c1: kshana-mcp --http <addr>
seg-db567a4e1a61 = <c1/> stellt dieselben Werkzeuge über Streamable HTTP für einen Client bereit, der keinen lokalen Prozess ausführen kann. Es ist für das Selbst-Hosting; Ashforde OÜ betreibt keinen öffentlichen Endpunkt. Siehe <a1>deploy/mcp-http.md</a1>.

# text
seg-04c1f05fb027 = <s1>Zurück</s1>MCP-Server

# text
seg-eba757f29814 = <s1>Weiter</s1>MCP-Server: selbst gehosteter HTTP-Modus

seg-4ccbbc19fe86 = <b>npx (Node)</b> (braucht Node { "18" }+): <c1/>

seg-77230eb344ea = <b>Docker</b> (braucht Docker): <c1/>

seg-3398eea8e332 = Cursor, npx (Node): <a1>Web-Link</a1> · <c1/>

seg-67009baafb3b = Cursor, Docker: <a1>Web-Link</a1> · <c1/>

seg-6918cd89f776 = Goose, npx: <c1/>
