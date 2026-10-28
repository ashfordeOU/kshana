# docs--mcp-install: translations (fr)

# text
seg-8d1e26cab542 = Tous les canaux

# text
seg-261c059bec54 = À titre consultatif, pas un équipement de navigation homologué : l'opérateur reste responsable de la navigation. Le serveur s'exécute sur votre ordinateur ; rien n'est envoyé à Ashforde OÜ.

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
seg-5c425ea185ee = Binaire précompilé

# text
seg-d107bc8e1950 = Registre MCP

# text
seg-842b77a21c5f = Canal

# text
seg-fdbb9db68f1d = aucun

# text
seg-a683980168f7 = Docker

# text
# c1: docs/MCP-INSTALL.md
seg-4a3510c45176 = Source : <c1/>

# text
seg-be0bf8294259 = Installer le serveur MCP Kshana (v{ $version })

# text
# c1: scripts/gen_mcp_install.py
# c2: scripts/test_gen_mcp_install.py
seg-bc58b4709618 = Chaque canal, avec la forme épinglée pour cette version. Les liens en un clic et chaque extrait ci-dessous sont générés par <c1/> et décodés de nouveau par <c2/>.

# text
seg-f3a2279d6df7 = Commande ou bouton

# text
seg-20c5ae650eb7 = Nécessite

# text
seg-af4d3ce85e11 = Forme épinglée

# text
seg-83c2ab5375f7 = Un passage nommant des clients d'IA tiers est omis ici ; il figure dans <a1>docs/MCP-INSTALL.md</a1> sur GitHub.

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node, ou Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ avec uv ou pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = formule pour v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> puis <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifeste pour v{ $version }

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
seg-b308519d4c8d = <a1>la page de la version</a1> : <c1/> (Linux x86-64), <c2/>, vérifié par <c3/> et <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (trouvé par les clients compatibles avec le registre)

# text
seg-b1a6e807f06f = un client compatible avec le registre

# text
seg-d5a3818ac3b6 = À distance (streamable HTTP)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-e7b940d0b341 = <c1/>, auto-hébergé : voir <a1>../docs/deploy/mcp-http.md</a1>

# text
seg-5f1397b1ea30 = votre propre hôte

# text
seg-f325b20ba911 = Choisir une façon de démarrer le serveur

# text
seg-f7b7c7f2eb0d = Chaque client ci-dessous prend l'une de trois définitions de serveur. Elles démarrent le même serveur :

# text
# c1: kshana-mcp
seg-d5fce7d58cfc = <b>kshana-mcp dans le PATH</b> (nécessite le binaire (brew, scoop, winget, cargo ou un téléchargement de version)) : <c1/>

# text
seg-c320bcbc9bcd = Liens en un clic

# text
# c1: cursor://anysphere.cursor-deeplink/mcp/install?name=kshana&config=eyJjb21tYW5kIjoia3NoYW5hLW1jcCIsImFyZ3MiOltdfQ==
seg-cb98a41e1860 = Cursor, kshana-mcp dans le PATH : <a1>lien web</a1> · <c1/>

# text
seg-adf55784a59e = VS Code, npx (Node) : <a1>ouvrir</a1> · <a2>Insiders</a2>

# text
seg-2befff4cecb5 = VS Code, Docker : <a1>ouvrir</a1> · <a2>Insiders</a2>

# text
seg-7a1f43b83429 = VS Code, kshana-mcp dans le PATH : <a1>ouvrir</a1> · <a2>Insiders</a2>

# text
seg-13df6618e070 = Un autre client

# text
seg-bd94768521e0 = La configuration de chaque client

# text
# c1: --scope user
seg-7da8e7a9d43d = Où : à exécuter dans un terminal (ajoutez <c1/> pour tous les projets). Ou le module d'extension ci-dessous.

# text
seg-93d075d31cdd = npx (Node) :

# text
seg-ae03b1ad65f1 = kshana-mcp dans le PATH :

# text
# c1: claude_desktop_config.json
# c2: .mcpb
seg-439fac4928a0 = Où : <c1/> (Settings, Developer, Edit Config). Ou double-cliquez sur l'extension <c2/> de la version : aucun fichier de configuration.

# text
seg-e998ab783248 = Cursor

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-1a35b243eeb1 = Où : <c1/> (ou <c2/> dans un projet).

# text
seg-037830f503a6 = VS Code

# text
# c1: .vscode/mcp.json
# c2: code --add-mcp
# c3: name
seg-299fdd9ddc33 = Où : <c1/>. Ou <c2/> avec le même objet plus un <c3/>.

# text
seg-639e6489316c = Windsurf

# text
# c1: mcp_config.json
seg-1fc9f45fc618 = Où : <c1/> (ouvrez-le depuis les paramètres MCP de Cascade).

# text
seg-a335039dbfbc = Zed

# text
# c1: settings.json
seg-449c644479b3 = Où : <c1/>.

# text
seg-98a55e5e8180 = Goose

# text
# c1: ~/.config/goose/config.yaml
seg-f84be6ce6c12 = Où : <c1/>.

# text
seg-dc3ecf497e8b = Codex CLI

# text
# c1: ~/.codex/config.toml
seg-92181148d2cb = Où : à exécuter dans un terminal, ou <c1/>.

# text
seg-a104919f2d57 = Gemini CLI

# text
# c1: ~/.gemini/settings.json
# c2: gemini mcp add
seg-286e9ef66ff9 = Où : <c1/>, ou <c2/>.

# text
seg-1569eae38977 = Continue

# text
# c1: .continue/mcpServers/kshana.yaml
seg-1911b6d10cba = Où : <c1/>.

# text
seg-f63917839413 = Utilisation à distance

# text
# c1: kshana-mcp --http <addr>
seg-db567a4e1a61 = <c1/> sert les mêmes outils via streamable HTTP pour un client qui ne peut pas exécuter de processus local. C'est destiné à l'auto-hébergement ; Ashforde OÜ n'exploite aucun point d'accès public. Voir <a1>deploy/mcp-http.md</a1>.

# text
seg-04c1f05fb027 = <s1>Précédent</s1>Serveur MCP

# text
seg-eba757f29814 = <s1>Suivant</s1>Serveur MCP : mode HTTP auto-hébergé

seg-4ccbbc19fe86 = <b>npx (Node)</b> (nécessite Node { "18" }+) : <c1/>

seg-77230eb344ea = <b>Docker</b> (nécessite Docker) : <c1/>

seg-3398eea8e332 = Cursor, npx (Node) : <a1>lien web</a1> · <c1/>

seg-67009baafb3b = Cursor, Docker : <a1>lien web</a1> · <c1/>

seg-6918cd89f776 = Goose, npx : <c1/>
