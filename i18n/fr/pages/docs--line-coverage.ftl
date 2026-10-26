# docs--line-coverage: translations (fr)

# text
seg-31d58f23c0a2 = Exécuter

# text
seg-08994a4765be = Portée

# text
# c1: docs/COVERAGE.md
seg-a6eaa5a5d095 = Source : <c1/>

# text
seg-d4e29eac0ab3 = Couverture de lignes — la mesure de référence

# text
# c1: tests/coverage_figure_doc_sync.rs
seg-931a2a7e9022 = La « couverture de lignes de ~{ "95" } % » du badge du README, du tableau CI (intégration continue) du README, des pages d'accueil de crates.io et de PyPI (Python Package Index), de la page de couverture de lignes de kshana.dev et du rapport technique est <b>cette</b> mesure, arrondie au pourcentage entier le plus proche. <c1/> échoue si l'une de ces six surfaces indique un chiffre différent de celui enregistré ci-dessous, de sorte que la prochaine nouvelle mesure les déplace toutes ensemble ou aucune.

# text
seg-f3526b0d95f8 = Mesuré

# text
seg-6f8d24ecb89f = — { "55,970" } lignes sur { "58,697" }

# text
seg-03065c20d4d8 = Commit

# text
# c1: db796dd
# c2: v0.29.0
seg-d734cdb77d70 = <c1/> (moteur { "0.29.0" }, l'étiquette <c2/>)

# text
# c1: ci.yml
# c2: coverage
seg-a2af6144b6a0 = GitHub Actions, <c1/> job <c2/>, exécution { "36809850252" }, 2026-10-01

# text
seg-b88a2a9497c2 = Outil

# text
# c1: cargo tarpaulin --engine llvm
seg-f2f07088027a = <c1/> (instrumentation LLVM fondée sur le code source)

# text
# c1: src/
# c2: src/*_data.rs
# c3: src/main.rs
# c4: tests/
# c5: web/
seg-a3223ee99178 = <c1/>, à l'exclusion des tables de données générées <c2/> et du point d'entrée mince de l'interface en ligne de commande (CLI) <c3/> ; <c4/> et <c5/> ne sont pas mesurés

# text
seg-894b740fd381 = Artefact

# text
# c1: coverage-lcov
# c2: lcov.info
seg-1d6c540fd916 = <c1/> (<c2/>, { "290" } fichiers sources) joint à cette exécution

# text
seg-17f916216c92 = Plancher

# text
# c1: 85 %
# c2: --fail-under 85
seg-32861ca47b0c = le même job échoue en dessous de <c1/> (<c2/>) — le plancher est appliqué à chaque push ; le chiffre ci-dessus est un relevé, non une barrière

# text
# c1: .github/workflows/ci.yml
seg-63b9b152cde7 = La commande, telle quelle dans <c1/> :

# text
# c1: main
# c2: lcov.info
seg-121c43cf260f = Chaque push vers <c1/> relance le job et joint un nouveau <c2/>. Pour faire évoluer le chiffre publié, téléchargez l'artefact d'une exécution réussie et additionnez-le :

# text
seg-b566e95a74ab = puis mettez à jour le tableau ci-dessus et les six surfaces dans le même commit ; le test de synchronisation de la documentation nomme celles que vous oubliez.

# text
seg-6935c9c381b3 = Historique

# text
# c1: b1d350d
# c2: 1daa012
# c3: CHANGELOG.md
# c4: paper/kshana-technical-report.md
seg-daa9ae1913cd = Le chiffre a été remesuré, non retapé : { "95.63" } % sur le commit <c1/> (moteur { "0.27.2" } + non publié, exécution { "35934579709" }, 2026-09-24, { "37,697" } lignes sur { "39,419" }, publié comme ~{ "96" } %), révisé à { "95.35" } % sur { "0.29.0" } (ci-dessus), qui s'arrondit à ~{ "95" } % : le code a grossi de { "19,278" } lignes mesurées et les nouvelles lignes sont un peu moins couvertes que les anciennes ; { "95.85" } % à { "v0.17.0" } (commit <c2/>, 2026-06-14, publié comme ~{ "96" } %), et ~{ "97" } % dans deux notes de version antérieures (<c3/>, laissées comme historique). <c4/> disait « près de { "97" } % » jusqu'à ce qu'il soit aligné sur ce relevé ; c'est désormais la sixième surface que le test fige.

# text
seg-b2dbaf3a3b68 = <s1>Précédent</s1>Normes et interopérabilité

# text
seg-508de3808e04 = <s1>Suivant</s1>Paquets de preuves
