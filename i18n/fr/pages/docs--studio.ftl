# docs--studio: translations (fr)

# text
seg-c3c260b7063e = Tests

# text
# c1: web/README.md
seg-ca497f6e51d4 = Source : <c1/>

# text
seg-256705861db0 = Le site kshana.dev

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
seg-82b7ed4e70af = <c1/> est l'arborescence que GitHub Pages sert sous <a1>https://kshana.dev</a1> : les pages (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), la documentation sous <c8/>, et Kshana Studio sous <c9/> (servi à <a2>https://kshana.dev/studio/</a2>), l'application qui exécute le moteur dans le navigateur sous forme de WebAssembly (WASM), sans calcul côté serveur et sans rien téléverser. Le Studio offre deux vues d'un même moteur : la vue Simple (<c10/>, la réponse d'abord, en langage courant) et la vue Avancée (<c11/>, le tableau de bord complet), qui partage le moteur, le worker, les modules et les données de la vue Simple via <c12/>.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Depuis la { "0.35.0" }, le Studio compte quatre vues de plus, chacune étant sa propre page avec <c1/>, sans indexation par les moteurs de recherche, et un dossier d'échantillons synthétiques que son test lit :

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/> : la vue de confiance maritime, un score de confiance du récepteur pour un flux de positions de navire, avec une trace de démonstration dans <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/> : le débriefing de formation d'équipage, qui rejoue du NMEA synthétique avec un événement de brouillage, de décrochage, de leurrage temporel ou de rejeu (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/> : la carte des interférences et l'exposition d'un itinéraire (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/> : une page de cartes d'outils avec des exemples (<c2/>, <c3/>), dont les paquets de preuves signés (<c4/>), l'export test bench (<c5/>), la cartographie compliance (<c6/>), la vérification Galileo OSNMA (<c7/>) et les canaux de l'assistant IA (<c8/>).

# text
seg-fb02aba9149f = D'où viennent les fichiers

# text
seg-a58fb92bab82 = Trois sortes de fichiers vivent ici, et elles se modifient de trois manières différentes.

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
seg-d404d216114c = <b>Fichiers portés.</b> Les pages, <c1/>, <c2/>, <c3/>, <c4/>, les données du site dans <c5/> (<c6/>, <c7/>, <c8/>) et tout ce qui se trouve sous <c9/> sont écrits par <c10/> à partir d'une construction du site et de la source du Studio. <c11/> les liste tous avec leur somme de contrôle SHA-256 (Secure Hash Algorithm, 256 bits). <b>Ne les modifiez pas ici</b> : <c12/> échoue en cas de modification manuelle. Changez la source et relancez le portage :

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
seg-b681e66130e5 = Le portage est déterministe : une seconde exécution n'écrit rien, et <c1/> se termine avec le code { "1" } si <c2/> n'est pas ce que le portage écrirait. Il reprend tels quels les fichiers d'exploration de la construction du site (les balises canoniques, de carte sociale et schema.org de chaque page, <c3/>, <c4/>, <c5/>, <c6/>), les vérifie, écrit <c7/>, <c8/> et la page de redirection à l'ancienne adresse du Studio (<c9/>, vers <c10/>), et fait pointer chaque page vers les polices et bibliothèques de scripts locales (ci-dessous).

# text
# c1: web/
seg-9be72ec8d40e = <b>Fichiers que possède <c1/>.</b> Ce sont des sources à part entière, et le portage n'y touche jamais :

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> est la source structurée des cartes de capacités et de la grille des normes. <b>Modifiez-la, et non le HTML.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> est généré (<c2/>) et figé par <c3/> ; ne le modifiez pas à la main. <c4/>, <c5/> et <c6/> sont des correspondances maintenues à la main que le même test vérifie par rapport à la matrice générée. Les copies du Studio sous <c7/> sont ces fichiers, octet pour octet.

# text
# c1: og-card.svg
# c2: og-card.png
# c3: og-card.rendered-from.json
# c4: python3 tools/gen_og_card.py
seg-8901229c76ba = <c1/>, <c2/> et <c3/> forment la carte sociale (<c4/>).

# text
# c1: fonts/
# c2: vendor/
# c3: tools/fetch_third_party.py
seg-89d78af0258c = <c1/> et <c2/> : les fichiers de polices et la bibliothèque de scripts qu'utilisent les pages, récupérés une fois par <c3/> et versionnés (voir « Aucune requête tierce »).

# text
# c1: build.sh
# c2: smoke.mjs
# c3: site.test.mjs
# c4: legacy-urls.test.mjs
# c5: tools/
seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> et <c5/>.

# text
# c1: build.sh
# c2: pkg/
# c3: wasm-pack
# c4: studio/pkg/
# c5: scenarios/
seg-5071806d230f = <b>Sorties de construction</b>, ignorées par git et produites par <c1/> : <c2/> (le paquet <c3/>, à partir duquel le paquet npm est aussi construit), <c4/> (le même paquet à l'endroit où le Studio l'importe) et <c5/> (chaque scénario de référence, à l'adresse d'où l'ancien site d'une seule page les servait).

# text
seg-5042f55f78b5 = Construire et servir en local

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Sans la chaîne d'outils WASM, <c1/> met en place un paquet existant au lieu d'en compiler un. Le workflow Pages ne l'utilise jamais.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Chaque module de <c1/> est de la logique pure avec un <c2/> correspondant ; les pilotes du DOM (Document Object Model, l'arbre des éléments de la page) du Studio sont <c3/> (la vue Simple) et <c4/> (la vue Avancée). L'intégration continue exécute chacun de ces tests comme une étape distincte et échoue si un fichier de test sous <c5/> n'a pas d'étape.

# text
seg-ba24be498f87 = Aucune requête tierce

# text
seg-7215806f98d4 = kshana.dev sert ses propres polices, styles et scripts. Une page n'envoie aucune requête à un hébergeur de polices ou de scripts, de sorte que l'adresse d'un visiteur n'est transmise à aucun d'eux.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = Le site et le Studio sont écrits pour Google Fonts et un hébergeur de scripts. Le portage remplace le lien Google Fonts de chaque page par la feuille de style correspondante dans <c1/> (les mêmes règles <c2/> et les mêmes fichiers de polices, tous les sous-ensembles, de sorte que le texte s'affiche comme avant) et chaque adresse de l'hébergeur de scripts par le fichier sous <c3/>. <c4/> et <c5/> consignent l'origine de chaque fichier et sa somme de contrôle ; les polices sont sous la SIL Open Font License (<c6/>) et three.js sous la licence MIT (<c7/>).

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> est la seule étape qui utilise le réseau. Ne la relancez que lorsqu'une page demande un jeu de polices ou une version de bibliothèque qui n'est pas présent : le portage refuse et le dit. <c2/> échoue si une page, une feuille de style ou un script porté nomme un hébergeur de polices ou charge quoi que ce soit depuis un autre hôte.

# text
seg-4ff8a4accad4 = La page { "404" }

# text
# c1: /404.html
seg-763503746a48 = GitHub Pages répond à une adresse manquante par <c1/> et le statut { "404" }. Le portage fabrique cette page à partir de la coque propre à la page d'accueil (navigation, pied de page, recherche) autour d'un court message avec des liens vers l'accueil, la documentation et le Studio. Chaque adresse qu'elle contient est écrite à partir de la racine du site, parce qu'elle est servie à n'importe quelle profondeur.

# text
seg-9126631f595b = Anciennes adresses

# text
# c1: /
# c2: /#playground
# c3: /#ledger
# c4: /#s=…
# c5: /?embed=1&…
# c6: tab=fom
# c7: tools/legacy-urls.json
# c8: legacy-redirects.js
seg-a64ed190233a = Jusqu'à la { "v0.28.0" }, le site était une page unique, et tout se trouvait derrière un fragment de <c1/> (<c2/>, <c3/>, liens de partage sous la forme <c4/>, intégrations sous la forme <c5/> ; l'ancien nom d'onglet d'un lien d'intégration, tel que <c6/>, ouvre l'onglet du Studio qui l'a remplacé). <c7/> liste chaque adresse de ce genre qu'utilise du matériel publié et l'endroit où elle mène désormais ; la page d'accueil charge <c8/>, généré à partir de cette liste, pour y envoyer les visiteurs. Ajoutez un cas à la liste avant de retirer toute adresse.

# text
seg-a9db9b0675e2 = Déploiement

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = Le workflow GitHub Actions <c1/> déploie une étiquette de version, et non <c2/> : <c3/> le déclenche une fois qu'une version est publiée, et un déclenchement manuel redéploie une étiquette nommée. Il exécute <c4/>, met en place <c5/> sans les tests, le script de construction, <c6/>, le manifeste et ce fichier, et publie le résultat sur GitHub Pages.

# text
seg-6aa2e78078ae = <s1>Précédent</s1>Glossaire

# text
seg-419353a4fb30 = <s1>Suivant</s1>Tutoriels

seg-74dc3fad6ee7 = <s1>Précédent</s1>Langues
