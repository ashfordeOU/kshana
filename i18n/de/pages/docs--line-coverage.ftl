# docs--line-coverage: translations (de)

# text
seg-31d58f23c0a2 = Ausführen

# text
seg-08994a4765be = Geltungsbereich

# text
# c1: docs/COVERAGE.md
seg-a6eaa5a5d095 = Quelle: <c1/>

# text
seg-d4e29eac0ab3 = Zeilenabdeckung — die maßgebliche Messung

# text
# c1: tests/coverage_figure_doc_sync.rs
seg-931a2a7e9022 = Die „~{ "95" } % Zeilenabdeckung“ auf dem README-Badge, in der CI-Tabelle (kontinuierliche Integration) der README, auf den Startseiten von crates.io und PyPI (Python Package Index), auf der Seite zur Zeilenabdeckung von kshana.dev und im technischen Bericht ist <b>diese</b> Messung, auf die nächste ganze Prozentzahl gerundet. <c1/> schlägt fehl, wenn eine dieser sechs Stellen eine andere Zahl nennt als die unten festgehaltene, sodass die nächste Neumessung alle zusammen verschiebt oder keine.

# text
seg-f3526b0d95f8 = Gemessen

# text
seg-6f8d24ecb89f = — { "55,970" } von { "58,697" } Zeilen

# text
seg-03065c20d4d8 = Commit

# text
# c1: db796dd
# c2: v0.29.0
seg-d734cdb77d70 = <c1/> (Engine { "0.29.0" }, das Tag <c2/>)

# text
# c1: ci.yml
# c2: coverage
seg-a2af6144b6a0 = GitHub Actions, Job <c2/> aus <c1/>, Lauf { "36809850252" }, 2026-10-01

# text
seg-b88a2a9497c2 = Werkzeug

# text
# c1: cargo tarpaulin --engine llvm
seg-f2f07088027a = <c1/> (quellbasierte LLVM-Instrumentierung)

# text
# c1: src/
# c2: src/*_data.rs
# c3: src/main.rs
# c4: tests/
# c5: web/
seg-a3223ee99178 = <c1/>, ohne die erzeugten Datentabellen <c2/> und den schmalen Einstiegspunkt der Befehlszeilenschnittstelle (CLI) <c3/>; <c4/> und <c5/> werden nicht gemessen

# text
seg-894b740fd381 = Artefakt

# text
# c1: coverage-lcov
# c2: lcov.info
seg-1d6c540fd916 = <c1/> (<c2/>, { "290" } Quelldateien), an diesen Lauf angehängt

# text
seg-17f916216c92 = Untergrenze

# text
# c1: 85 %
# c2: --fail-under 85
seg-32861ca47b0c = derselbe Job schlägt unter <c1/> fehl (<c2/>) — die Untergrenze wird bei jedem Push durchgesetzt; die obige Zahl ist ein Nachweis, keine Schranke

# text
# c1: .github/workflows/ci.yml
seg-63b9b152cde7 = Der Befehl, wörtlich aus <c1/>:

# text
# c1: main
# c2: lcov.info
seg-121c43cf260f = Jeder Push auf <c1/> führt den Job erneut aus und hängt eine frische <c2/> an. Um die veröffentlichte Zahl zu verschieben, laden Sie das Artefakt eines grünen Laufs herunter und summieren es:

# text
seg-b566e95a74ab = dann aktualisieren Sie die obige Tabelle und die sechs Stellen im selben Commit; der Doc-Sync-Test nennt jede, die Sie übersehen.

# text
seg-6935c9c381b3 = Verlauf

# text
# c1: b1d350d
# c2: 1daa012
# c3: CHANGELOG.md
# c4: paper/kshana-technical-report.md
seg-daa9ae1913cd = Die Zahl wurde neu gemessen, nicht neu getippt: { "95.63" } % bei Commit <c1/> (Engine { "0.27.2" } + unveröffentlicht, Lauf { "35934579709" }, 2026-09-24, { "37,697" } von { "39,419" } Zeilen, veröffentlicht als ~{ "96" } %), korrigiert auf { "95.35" } % bei { "0.29.0" } (oben), was auf ~{ "95" } % gerundet wird: Der Code ist um { "19,278" } gemessene Zeilen gewachsen, und die neuen Zeilen sind etwas weniger abgedeckt als die alten; { "95.85" } % bei { "v0.17.0" } (Commit <c2/>, 2026-06-14, veröffentlicht als ~{ "96" } %) und ~{ "97" } % in zwei früheren Release-Notes (<c3/>, als Verlauf belassen). <c4/> sagte „nahe { "97" } %“, bis es auf diesen Nachweis gebracht wurde; es ist jetzt die sechste Stelle, die der Test festlegt.

# text
seg-b2dbaf3a3b68 = <s1>Zurück</s1>Normen und Interoperabilität

# text
seg-508de3808e04 = <s1>Weiter</s1>Nachweispakete
