# docs--reproducibility: translations (fr)

# text
seg-03cb5fb3dd8f = Oui

# text
seg-a7d5633dbcc0 = Reproductibilité et provenance

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Source : <c1/>

# text
seg-1c48a3edda84 = Kshana est conçu pour être reproductible : les mêmes entrées produisent les mêmes résultats, et les artefacts de construction peuvent être retracés jusqu'à la source qui les a produits. Ce document énonce exactement ce qui est garanti, ce qui ne l'est pas, et comment les garanties sont appliquées.

# text
seg-95b0eba44abe = Garanties de déterminisme

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = Le moteur n'a aucune horloge murale, aucune dépendance au fil d'exécution et aucun aléa non initialisé. Chaque processus stochastique est piloté par un flux <c1/> indexé par la <c2/> du scénario, tiré dans un ordre fixe. Conséquences :

# text
seg-14df30025491 = Propriété

# text
seg-f0badf8cb640 = Garanti

# text
seg-9f6678ac42f5 = Appliqué par

# text
# c1: result.json
seg-cfc934af2c75 = Même scénario, même machine → <c1/> identique octet pour octet

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (exécute deux fois le scénario de référence, compare le SHA-256 (SHA : Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Même scénario → chiffres de mérite identiques champ par champ

# text
seg-bdeaf344acf8 = Oui, par plateforme

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> fige chaque chiffre de mérite (FoM) des quatre scénarios de référence

# text
# c1: scenario_hash
seg-f7c5427c88f9 = L'empreinte d'entrée du scénario (<c1/>) est indépendante de la plateforme

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = SHA-256 adressé par le contenu du scénario canonique, figé dans <c1/>

# text
seg-45861afe0994 = Empreinte d'entrée + <b>forme</b> de sortie identiques d'un système d'exploitation (OS) à l'autre

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> fige un SHA-256 exact par scénario (dix scénarios, un fichier <c2/> chacun dans <c3/>), vérifié sur la matrice d'intégration continue (CI) à 3 OS

# text
seg-e54b5ff80782 = Les <b>valeurs</b> de sortie concordent d'un OS à l'autre (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Oui, à { "1e-6" } près

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = le job CI <c1/> exécute <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) et <c4/> sur les trois OS

# text
seg-3876618cc821 = Une trame de message de navigation en orbite terrestre basse (LEO) a les mêmes octets sur chaque plateforme et dans chaque profil de construction, y compris la construction WebAssembly (WASM)

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (chaque fonction transcendante et chaque variable normale du type de scénario <c2/> passe par le crate Rust pur <c3/>) ; <c4/> fige une trame entière sans condition de plateforme

# text
seg-69750a5db756 = Les tirages d'indices initialisés par graine (rééchantillonnage bootstrap, mélanges) sont les mêmes sur les cibles 32 bits et 64 bits

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> échantillonne toujours en <c2/> ; figé dans <c3/>

# text
seg-e42899fd8a4e = Même chaîne d'outils partout

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> fige le canal ; <c2/> fait échouer la construction en cas de dérive ; la CI et la publication figent la même version

# text
seg-b0a3fd993614 = Même ensemble de dépendances

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> est versionné et <c2/> sert à la SBOM (nomenclature logicielle)

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Chaque exécution en ligne de commande écrit aussi une fiche de reproductibilité dans son rapport (<c1/> et <c2/>) : la version du moteur, le SHA-256 du fichier de scénario et du document de résultat, la graine, la plateforme et la commande exacte, que <c3/> ré-exécute jusqu'à un résultat identique octet pour octet. Le rapport est lui-même une fonction pure de l'exécution : deux exécutions de <c4/> écrivent le même <c5/> octet pour octet. Voir <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = La réserve inter-plateformes (et comment les valeurs de référence figées la traitent)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Les résultats numériques sont <b>identiques bit à bit sur une plateforme donnée</b> mais peuvent différer dans les derniers quelques unités de dernière position (ULP) <b>entre</b> plateformes. La cause est la bibliothèque mathématique de la plateforme : <c1/>, <c2/>, <c3/> et consorts ne sont pas tenues par IEEE-754 (IEEE : Institute of Electrical and Electronics Engineers) d'être correctement arrondies, de sorte que Linux (glibc, la bibliothèque C de GNU), macOS et Windows peuvent chacun renvoyer un dernier bit différent. Sur une longue exécution, ces écarts d'environ { "1e-16" } s'accumulent jusqu'à peut-être environ { "1e-12" } en relatif.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Deux choses rendent cet écart de dernière position plus grand qu'au départ, et les deux sont mesurées plutôt que supposées. Un <b>intégrateur adaptatif</b> choisit son pas suivant à partir de l'estimation de l'erreur par une racine cinquième, de sorte qu'une unité de dernière position change la suite des pas et que les deux plateformes ne concordent plus alors qu'à la tolérance d'intégration. Un <b>estimateur itératif</b> (un ajustement par moindres carrés, un filtre de détermination d'orbite) peut suivre un chemin différent jusqu'à la convergence. Les types de scénario construits sur l'un ou l'autre peuvent différer entre plateformes de plus de { "1e-6" } dans certains champs ; <c1/> consigne le même régime pour les tests unitaires.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = Le <b>profil de construction</b> compte de la même façon, sur une seule machine. Une construction optimisée sur macOS fusionne un sinus et un cosinus d'un même argument en un seul appel à la routine combinée du système, dont le sinus diffère du <c1/> isolé au dernier bit pour { "379" } arguments sur { "200 000" } ; une construction non optimisée fait les deux appels. Mesuré sur aarch64 macOS sur les { "138" } fichiers de scénario, une construction debug et une construction release d'une même source donnent des documents de résultat identiques octet pour octet pour { "102" } d'entre eux. Les { "36" } autres diffèrent dans les dernières positions : { "28" } à { "1e-6" } près, un (<c2/>) de { "2.8e-6" }, et sept campagnes seulement dans les empreintes de leurs exécutions membres ; aucun ne diffère par une étiquette, un décompte ou un verdict. La garantie d'identité octet pour octet ci-dessus vaut donc pour une construction : le même binaire deux fois.

# text
seg-ff368c627bd2 = Les <b>tirages normaux</b> initialisés par graine sont une troisième source, bien plus rare : l'échantillonneur appelle l'exponentielle et le logarithme de l'hôte dans ses branches rares, et environ un tirage sur un million diffère au dernier bit entre la construction native et la construction WASM.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Lorsqu'une sortie est <b>discrète</b>, un écart de dernière position n'est pas acceptable du tout, et le type de scénario est calculé avec <c1/> au lieu de la bibliothèque de l'hôte. Le type de scénario <c2/> est le premier : sa trame binaire est faite d'entiers transmis, et le même scénario a été codé une fois en trois trames différentes : dans une construction release, dans une construction debug de la même source, et dans le navigateur. C'est maintenant les mêmes octets dans les trois.

# text
seg-1746a0ea22fe = Pour cette raison, les tests de référence figée ne figent <b>pas</b> un seul hachage inter-plateformes de la sortie en virgule flottante — ce serait fragile et ferait échouer, à tort, des constructions correctes sur un autre OS. À la place :

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> fige chaque chiffre de mérite avec une tolérance relative de <c2/> — quatre ordres de grandeur plus serrée que toute vraie régression (qui déplace une valeur de pourcents entiers) mais bien plus large que la gigue des bibliothèques mathématiques (libm) d'une plateforme à l'autre. Les champs bornés par la grille (secondes de holdover) et les champs exactement nuls sont figés exactement.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b> — un hachage du contenu des <em>entrées</em> — est indépendant de la plateforme et figé exactement.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> fige un SHA-256 exact, versionné par scénario dans <c2/>, sur la projection qui <em>est</em> identique d'une plateforme à l'autre : l'empreinte d'entrée plus la <b>forme</b> de sortie (noms de champs, imbrication, types de feuilles, longueurs de tableaux — fixés par l'arithmétique déterministe de la grille, jamais les valeurs en virgule flottante). Cela attrape exactement les régressions structurelles, tandis que les tolérances ci-dessus attrapent les régressions de valeurs.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> impose une sortie identique octet pour octet entre deux exécutions <em>sur la même machine</em> (la garantie de déterminisme).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>Le job CI <c1/></b> exécute les quatre tests ci-dessus (<c2/>, <c3/>, <c4/>, <c5/>) sur <b>ubuntu-latest, macos-latest et windows-latest</b>, de sorte que la reproductibilité inter-plateformes est affirmée à chaque push — les références de forme et d'entrée exactement, la numérique à { "1e-6" } près, et les états SGP4 (Simplified General Perturbations { "4" }) à { "2e-5" } km près — plutôt que de reposer sur un seul OS.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Si vous devez régénérer les nombres figés (par exemple après un changement de modèle intentionnel), exécutez chaque scénario de référence et copiez les valeurs FoM imprimées dans <c1/>, puis notez le changement dans <c2/>.

# text
seg-9310a7af7ff8 = Nomenclature logicielle (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> émet une SBOM CycloneDX { "1.5" } listant chaque crate livré dans un artefact kshana, avec sa version exacte, sa source et sa licence. C'est un générateur sans dépendance construit sur <c2/> (il fonctionne donc avec la seule chaîne d'outils), et il parcourt le graphe de résolution depuis le paquet kshana en suivant uniquement les dépendances normales et de construction. Les dépendances de développement (crates réservés aux tests tels que <c3/>) sont exclues parce qu'aucun artefact ne les contient.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = Le graphe est l'union des ensembles de fonctionnalités avec lesquels les artefacts livrés sont construits : la construction par défaut (bibliothèque et interface en ligne de commande (CLI)), <c1/> (la roue PyPI (Python Package Index), dont la chaîne <c2/> est la frontière d'interface avec le code étranger) et <c3/> (le paquet npm, qui porte cette même SBOM dans son archive). Les dépendances conditionnelles à la plateforme pour toutes les cibles sont incluses, puisque les roues sont livrées pour plusieurs systèmes d'exploitation et que le paquet npm cible WebAssembly. Un seul document couvre les trois artefacts, de sorte que pour l'un quelconque d'entre eux, c'est un sur-ensemble. Il liste actuellement { "107" } composants ; le décompte est figé dans <c4/>. Le serveur autonome <c5/> a son propre manifeste et n'est pas décrit par cette SBOM.

# text
seg-4c8948e9ee7d = La sortie est déterministe — le même ensemble de dépendances donne un document identique octet pour octet, y compris un numéro de série dérivé de la liste triée des paquets plutôt que d'un horodatage.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = Le workflow de publication génère la SBOM (<c1/>) et la joint à chaque publication étiquetée ; le workflow de diffusion la livre aussi à côté des roues PyPI et dans le paquet npm.

# text
seg-928c3c0108a1 = Provenance de construction

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = Le workflow de publication produit une attestation de provenance de construction SLSA (Supply-chain Levels for Software Artifacts) (<c1/>) couvrant chaque fichier qu'il joint à la publication GitHub : les binaires en ligne de commande de chaque plateforme, le binaire du serveur <c2/>, la SBOM, la synthèse de validation et <c3/>. Un consommateur peut vérifier, avec <c4/>, que les artefacts ont été construits par le workflow de publication de ce dépôt à partir de cette source — comblant l'écart entre « voici un binaire » et « voici un binaire que je peux retracer jusqu'à sa source ». Par exemple, pour la SBOM de { "v0.28.0" } :

# text
seg-06515d230d33 = <s1>Précédent</s1>Provenance

# text
seg-c6dba4e40c76 = <s1>Suivant</s1>Carte des capacités
