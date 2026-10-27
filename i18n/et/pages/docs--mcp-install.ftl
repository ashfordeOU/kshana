# docs--mcp-install: translations (et)

# text
seg-8d1e26cab542 = Kõik kanalid

# text
seg-261c059bec54 = Nõuandev, mitte tüübikinnitust omav navigatsiooniseade: navigeerimise eest vastutab jätkuvalt operaator. Server töötab kasutaja arvutis; Ashforde OÜ-le ei saadeta midagi.

# text
seg-13641146503d = Cursor (üks klõps)

# text
seg-3bd13fe295f4 = VS Code (üks klõps)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Eelkompileeritud binaar

# text
seg-d107bc8e1950 = MCP register

# text
seg-842b77a21c5f = Kanal

# text
seg-fdbb9db68f1d = puudub

# text
seg-a683980168f7 = Docker

# text
# c1: docs/MCP-INSTALL.md
seg-4a3510c45176 = Allikas: <c1/>

# text
seg-be0bf8294259 = Paigaldage Kshana MCP server (v{ $version })

# text
# c1: scripts/gen_mcp_install.py
# c2: scripts/test_gen_mcp_install.py
seg-bc58b4709618 = Iga kanal, selle väljalaske fikseeritud kujuga. Ühe klõpsuga lingid ja iga allolev lõik genereeritakse skriptiga <c1/> ning dekodeeritakse uuesti skriptiga <c2/>.

# text
seg-f3a2279d6df7 = Käsk või nupp

# text
seg-20c5ae650eb7 = Nõuab

# text
seg-af4d3ce85e11 = Fikseeritud kuju

# text
seg-83c2ab5375f7 = Lõik, mis nimetab kolmandate osapoolte tehisintellekti kliente, on siit välja jäetud; see on GitHubis failis <a1>docs/MCP-INSTALL.md</a1>.

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node või Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ koos uv või pipx-iga

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = valem versiooni v{ $version } jaoks

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> seejärel <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifest versiooni v{ $version } jaoks

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
seg-b308519d4c8d = <a1>väljalaskeleht</a1>: <c1/> (Linux x86-64), <c2/>, kontrollitud käskudega <c3/> ja <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (leiavad registrit tundvad kliendid)

# text
seg-b1a6e807f06f = registrit tundev klient

# text
seg-d5a3818ac3b6 = Kaug (voogedastatav HTTP)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-e7b940d0b341 = <c1/>, ise majutatud: vt <a1>../docs/deploy/mcp-http.md</a1>

# text
seg-5f1397b1ea30 = teie oma host

# text
seg-f325b20ba911 = Valige serveri käivitamise viis

# text
seg-f7b7c7f2eb0d = Iga allolev klient võtab ühe kolmest serverimääratlusest. Need käivitavad sama serveri:

# text
# c1: npx -y kshana-mcp@0.39.0
seg-e40d4a54025f = <b>npx (Node)</b> (vajab Node { "18" }+): <c1/>

# text
# c1: docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.39.0
seg-11aa05e3bace = <b>Docker</b> (vajab Dockerit): <c1/>

# text
# c1: kshana-mcp
seg-d5fce7d58cfc = <b>kshana-mcp teel PATH</b> (vajab binaarfaili (brew, scoop, winget, cargo või väljalaskeallalaadimine)): <c1/>

# text
seg-c320bcbc9bcd = Ühe klõpsuga lingid

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC4zOS4wIl19
seg-0281dbe84644 = Cursor, npx (Node): <a1>veebilink</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjM5LjAiXX0=
seg-405f915ef73a = Cursor, Docker: <a1>veebilink</a1> · <c1/>

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoia3NoYW5hLW1jcCIsImFyZ3MiOltdfQ==
seg-cb98a41e1860 = Cursor, kshana-mcp teel PATH: <a1>veebilink</a1> · <c1/>

# text
seg-adf55784a59e = VS Code, npx (Node): <a1>ava</a1> · <a2>Insiders</a2>

# text
seg-2befff4cecb5 = VS Code, Docker: <a1>ava</a1> · <a2>Insiders</a2>

# text
seg-7a1f43b83429 = VS Code, kshana-mcp teel PATH: <a1>ava</a1> · <a2>Insiders</a2>

# text
# c1: goose://extension?cmd=npx&arg=-y&arg=kshana-mcp%400.39.0&timeout=300&id=kshana&name=Kshana&description=Kshana%20PNT-resilience%20simulator%20%28advisory%29
seg-a9ea65a68ba3 = Goose, npx: <c1/>

# text
seg-13df6618e070 = Muu klient

# text
seg-bd94768521e0 = Iga kliendi seadistus

# text
# c1: --scope user
seg-7da8e7a9d43d = Kus: käivitage terminalis (lisage <c1/> iga projekti jaoks). Või allolev plugin.

# text
seg-93d075d31cdd = npx (Node):

# text
seg-ae03b1ad65f1 = kshana-mcp teel PATH:

# text
# c1: claude_desktop_config.json
# c2: .mcpb
seg-439fac4928a0 = Kus: <c1/> (Settings, Developer, Edit Config). Või topeltklõpsake väljalaske laiendit <c2/>: seadistusfaili ei ole.

# text
seg-e998ab783248 = Cursor

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-1a35b243eeb1 = Kus: <c1/> (või <c2/> projektis).

# text
seg-037830f503a6 = VS Code

# text
# c1: .vscode/mcp.json
# c2: code --add-mcp
# c3: name
seg-299fdd9ddc33 = Kus: <c1/>. Või <c2/> sama objektiga pluss <c3/>.

# text
seg-639e6489316c = Windsurf

# text
# c1: mcp_config.json
seg-1fc9f45fc618 = Kus: <c1/> (avage see Cascade'i MCP seadetest).

# text
seg-a335039dbfbc = Zed

# text
# c1: settings.json
seg-449c644479b3 = Kus: <c1/>.

# text
seg-98a55e5e8180 = Goose

# text
# c1: ~/.config/goose/config.yaml
seg-f84be6ce6c12 = Kus: <c1/>.

# text
seg-dc3ecf497e8b = Codex CLI

# text
# c1: ~/.codex/config.toml
seg-92181148d2cb = Kus: käivitage terminalis või <c1/>.

# text
seg-a104919f2d57 = Gemini CLI

# text
# c1: ~/.gemini/settings.json
# c2: gemini mcp add
seg-286e9ef66ff9 = Kus: <c1/> või <c2/>.

# text
seg-1569eae38977 = Continue

# text
# c1: .continue/mcpServers/kshana.yaml
seg-1911b6d10cba = Kus: <c1/>.

# text
seg-f63917839413 = Kaugkasutus

# text
# c1: kshana-mcp --http <addr>
seg-db567a4e1a61 = <c1/> teenindab samu tööriistu voogedastatava HTTP kaudu kliendile, kes ei saa kohalikku protsessi käitada. See on ise majutamiseks; Ashforde OÜ ei käita avalikku lõpp-punkti. Vt <a1>deploy/mcp-http.md</a1>.

# text
seg-04c1f05fb027 = <s1>Eelmine</s1>MCP server

# text
seg-eba757f29814 = <s1>Järgmine</s1>MCP server: ise majutatav HTTP-režiim
