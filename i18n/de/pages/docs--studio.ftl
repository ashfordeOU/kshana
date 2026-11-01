# docs--studio: translations (de)

# text
seg-c3c260b7063e = Tests

# text
# c1: web/README.md
seg-ca497f6e51d4 = Quelle: <c1/>

# text
seg-256705861db0 = Die Website kshana.dev

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
seg-82b7ed4e70af = <c1/> ist der Baum, den GitHub Pages als <a1>https://kshana.dev</a1> ausliefert: die Seiten (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), die Dokumentation unter <c8/> und Kshana Studio unter <c9/> (ausgeliefert unter <a2>https://kshana.dev/studio/</a2>), die App, die die Engine im Browser als WebAssembly (WASM) ausführt, ohne serverseitige Berechnung und ohne dass etwas hochgeladen wird. Das Studio hat zwei Ansichten einer Engine: die einfache Ansicht (<c10/>, die Antwort zuerst in einfachen Worten) und die erweiterte Ansicht (<c11/>, das vollständige Dashboard), die über <c12/> Engine, Worker, Module und Daten der einfachen Ansicht teilt.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Seit { "0.35.0" } hat das Studio vier weitere Ansichten, jede eine eigene Seite mit <c1/>, ohne Suchindexierung und mit einem Ordner synthetischer Beispiele, die ihr Test liest:

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/>: die maritime Vertrauensansicht, ein Empfänger-Vertrauenswert für den Positionsstrom eines Schiffes, mit einer Demo-Spur in <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/>: die Nachbesprechung für das Training der Besatzung, die synthetisches NMEA mit einem Ereignis aus Jamming, Drag-off, Zeit-Spoofing oder Replay wiedergibt (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/>: die Störungskarte und die Routenexposition (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/>: eine Seite mit Werkzeugkarten mit Beispielen (<c2/>, <c3/>), darunter signierte Nachweispakete (<c4/>), der Test-bench-Export (<c5/>), das Compliance-Mapping (<c6/>), die Galileo-OSNMA-Verifikation (<c7/>) und die Kanäle des KI-Assistenten (<c8/>).

# text
seg-fb02aba9149f = Woher die Dateien stammen

# text
seg-a58fb92bab82 = Hier liegen drei Arten von Dateien, und sie werden auf drei verschiedene Weisen geändert.

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
seg-d404d216114c = <b>Portierte Dateien.</b> Die Seiten, <c1/>, <c2/>, <c3/>, <c4/>, die Website-Daten in <c5/> (<c6/>, <c7/>, <c8/>) und alles unter <c9/> werden von <c10/> aus einem Website-Build und dem Quellcode des Studios geschrieben. <c11/> listet jede mit ihrer SHA-256-Prüfsumme (Secure Hash Algorithm, 256 Bit) auf. <b>Bearbeiten Sie sie hier nicht</b>: <c12/> schlägt bei einer manuellen Änderung fehl. Ändern Sie die Quelle und führen Sie die Portierung erneut aus:

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
seg-b681e66130e5 = Die Portierung ist deterministisch: Ein zweiter Lauf schreibt nichts, und <c1/> beendet sich mit { "1" }, wenn <c2/> nicht dem entspricht, was die Portierung schreiben würde. Sie übernimmt die Crawl-Dateien des Website-Builds unverändert (die Tags für Canonical, Social Card und schema.org jeder Seite, <c3/>, <c4/>, <c5/>, <c6/>), prüft sie, schreibt <c7/>, <c8/> und die Weiterleitungsseite unter der alten Adresse des Studios (<c9/>, nach <c10/>) und lässt jede Seite auf die lokalen Schriften und Skriptbibliotheken verweisen (unten).

# text
# c1: web/
seg-9be72ec8d40e = <b>Dateien, die <c1/> besitzt.</b> Das sind eigenständige Quellen, und die Portierung berührt sie nie:

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> ist die strukturierte Quelle für die Fähigkeitenkarten und das Standardraster. <b>Bearbeiten Sie sie, nicht das HTML.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> wird erzeugt (<c2/>) und durch <c3/> festgeschrieben; bearbeiten Sie sie nicht von Hand. <c4/>, <c5/> und <c6/> sind von Hand gepflegte Zuordnungen, die derselbe Test gegen die erzeugte Matrix prüft. Die Kopien des Studios unter <c7/> sind diese Dateien, Byte für Byte.

# text
# c1: og-card.svg
# c2: og-card.png
# c3: og-card.rendered-from.json
# c4: python3 tools/gen_og_card.py
seg-8901229c76ba = <c1/>, <c2/> und <c3/> sind die Social Card (<c4/>).

# text
# c1: fonts/
# c2: vendor/
# c3: tools/fetch_third_party.py
seg-89d78af0258c = <c1/> und <c2/>: die Schriftdateien und die Skriptbibliothek, die die Seiten verwenden, einmal von <c3/> geholt und eingecheckt (siehe „Keine Anfragen an Dritte“).

# text
# c1: build.sh
# c2: smoke.mjs
# c3: site.test.mjs
# c4: legacy-urls.test.mjs
# c5: tools/
seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> und <c5/>.

# text
# c1: build.sh
# c2: pkg/
# c3: wasm-pack
# c4: studio/pkg/
# c5: scenarios/
seg-5071806d230f = <b>Build-Ausgaben</b>, von git ignoriert und von <c1/> erzeugt: <c2/> (das Paket von <c3/>, aus dem auch das npm-Paket gebaut wird), <c4/> (dasselbe Paket dort, wo das Studio es importiert) und <c5/> (jedes Referenzszenario, unter der Adresse, von der die frühere einseitige Website es auslieferte).

# text
seg-5042f55f78b5 = Lokal bauen und ausliefern

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Ohne die WASM-Toolchain stellt <c1/> ein vorhandenes Paket bereit, statt eines zu kompilieren. Der Pages-Workflow verwendet das nie.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Jedes Modul in <c1/> ist reine Logik mit einem passenden <c2/>; die DOM-Treiber (Document Object Model, der Elementbaum der Seite) des Studios sind <c3/> (die einfache Ansicht) und <c4/> (die erweiterte Ansicht). Die kontinuierliche Integration führt jeden davon als eigenen Schritt aus und schlägt fehl, wenn eine Testdatei unter <c5/> keinen Schritt hat.

# text
seg-ba24be498f87 = Keine Anfragen an Dritte

# text
seg-7215806f98d4 = kshana.dev liefert seine eigenen Schriften, Stile und Skripte aus. Eine Seite stellt keine Anfrage an einen Schriften- oder Skript-Host, sodass die Adresse eines Besuchers nicht an einen weitergegeben wird.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = Die Website und das Studio sind gegen Google Fonts und einen Skript-Host geschrieben. Die Portierung ersetzt den Google-Fonts-Link jeder Seite durch das passende Stylesheet in <c1/> (dieselben <c2/>-Regeln und dieselben Schriftdateien, jede Teilmenge, sodass der Text wie zuvor dargestellt wird) und jede Adresse eines Skript-Hosts durch die Datei unter <c3/>. <c4/> und <c5/> halten fest, woher jede Datei stammt und wie ihre Prüfsumme lautet; die Schriften stehen unter der SIL Open Font License (<c6/>) und three.js unter der MIT-Lizenz (<c7/>).

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> ist der einzige Schritt, der das Netzwerk nutzt. Führen Sie ihn nur erneut aus, wenn eine Seite einen Schriftsatz oder eine Bibliotheksversion verlangt, die hier nicht vorhanden ist: Die Portierung weist das zurück und sagt es. <c2/> schlägt fehl, wenn eine portierte Seite, ein Stylesheet oder ein Skript einen Schriften-Host nennt oder irgendetwas von einem anderen Host lädt.

# text
seg-4ff8a4accad4 = Die Seite { "404" }

# text
# c1: /404.html
seg-763503746a48 = GitHub Pages beantwortet eine fehlende Adresse mit <c1/> und dem Status { "404" }. Die Portierung erzeugt diese Seite aus der eigenen Hülle der Startseite (Navigation, Fußzeile, Suche) um eine kurze Meldung mit Links zu Startseite, Docs und Studio. Jede Adresse darin ist ab der Website-Wurzel geschrieben, weil sie in jeder Tiefe ausgeliefert wird.

# text
seg-9126631f595b = Alte Adressen

# text
# c1: /
# c2: /#playground
# c3: /#ledger
# c4: /#s=…
# c5: /?embed=1&…
# c6: tab=fom
# c7: tools/legacy-urls.json
# c8: legacy-redirects.js
seg-a64ed190233a = Bis { "v0.28.0" } war die Website eine einzelne Seite, und alles lag hinter einem Fragment auf <c1/> (<c2/>, <c3/>, Teilen-Links als <c4/>, Einbettungen als <c5/>; der alte Tabname eines Einbettungslinks, etwa <c6/>, öffnet den Studio-Tab, der ihn ersetzt hat). <c7/> listet jede solche Adresse auf, die veröffentlichtes Material verwendet, und wohin sie jetzt führt; die Startseite lädt <c8/>, erzeugt aus dieser Liste, um sie dorthin zu schicken. Fügen Sie der Liste einen Fall hinzu, bevor Sie eine Adresse einstellen.

# text
seg-a9db9b0675e2 = Bereitstellung

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = Der GitHub-Actions-Workflow <c1/> stellt ein Release-Tag bereit, nicht <c2/>: <c3/> stößt ihn an, sobald ein Release veröffentlicht ist, und ein manueller Auslöser stellt ein benanntes Tag neu bereit. Er führt <c4/> aus, stellt <c5/> ohne die Tests, das Build-Skript, <c6/>, das Manifest und diese Datei bereit und veröffentlicht das Ergebnis auf GitHub Pages.

# text
seg-6aa2e78078ae = <s1>Zurück</s1>Glossar

# text
seg-419353a4fb30 = <s1>Weiter</s1>Tutorials

seg-74dc3fad6ee7 = <s1>Zurück</s1>Sprachen
