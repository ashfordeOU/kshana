# docs--reports: translations (fr)

# text
seg-3ea93ae372ca = Ce qu'il contient

# text
seg-245adc6e6766 = <s1>Précédent</s1>Campagnes

# text
seg-aa5482ac34ff = Limites, énoncées sans détour

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Source : <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Chaque exécution de l'interface en ligne de commande (CLI) écrit un rapport à côté de son résultat : une page HyperText Markup Language (HTML) imprimable, <c1/>, et un document JavaScript Object Notation (JSON) lisible par machine, <c2/>, au contenu identique. Le rapport fonctionne pour tout type de scénario et pour les campagnes.

# text
seg-e26b1a83a86d = Le document de résultat répond à <em>ce que le moteur a calculé</em>. Le rapport ajoute ce dont un lecteur a besoin avant d'agir : ce qui est entré, sur quoi reposent les chiffres, ce qui a été laissé de côté, et comment obtenir de nouveau les mêmes octets. Il n'invente rien de cela. Chaque section est lue à partir d'une source que le moteur conserve déjà, et nomme la source à côté de ce qu'elle cite.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = Le constructeur est <c1/> (<c2/>). C'est une fonction pure de la sortie de l'exécution, des octets du fichier de scénario et de la ligne de commande : il ne lit ni horloge, ni fichier, ni réseau, et il se construit pour WebAssembly.

# text
seg-bed0af192da5 = Sections

# text
seg-fca842769048 = Section

# text
seg-2654051d8292 = Lu à partir de

# text
seg-5790851a4a5f = Synthèse

# text
seg-3d34b2ef5988 = ce que fait le type de scénario, la synthèse en une ligne de l'exécution, les chiffres clés, l'étiquette d'honnêteté au niveau de l'exécution, le nombre de capacités VALIDATED / MODELLED / PARTNER utilisées

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = le catalogue des types de scénario (<c1/>), le <c2/> du résultat, son bloc <c3/> ou son bloc de chiffres de mérite, les centiles d'une campagne Monte Carlo

# text
seg-e1ce0e8d5c61 = chaque champ que fixe le fichier de scénario, aplati jusqu'à son chemin, avec son unité et l'origine de l'unité

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = le fichier de scénario ; unités tirées du bloc <c1/> du résultat (le schéma des unités de champ, <c2/>), sinon du suffixe du nom de champ (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …) ; une unité qu'aucun des deux n'indique est imprimée comme <b>non indiquée</b>

# text
seg-88ccaef6fc49 = le graphique de l'exécution, chaque scalaire du document de résultat avec son unité, et un récapitulatif nombre / minimum / maximum / premier / dernier de chaque colonne numérique

# text
# c1: units
seg-42a82485f8c8 = le document de résultat et son bloc <c1/>

# text
seg-f554fbcdd85c = Agrégation (campagnes et balayages)

# text
seg-7c0466805f54 = la table de nœuds d'un balayage ; la moyenne, l'écart type, les centiles 5e / 50e / 95e d'une exécution Monte Carlo et l'intervalle de confiance à { "95" } % sur la moyenne, avec un histogramme par métrique ; la table des phases d'une chaîne ; les conditions partagées, les membres et la synthèse combinée d'une composition

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = la section <c1/>, <c2/>, <c3/> ou <c4/> du résultat de la campagne ; la grille d'un résultat <c5/> ou <c6/>

# text
seg-3bf44008fc65 = Animation et exports

# text
# c1: --animate svg
seg-64d1073dfadc = le dessin animé de l'exécution (la sortie <c1/>) intégré comme image inerte, ou la raison pour laquelle il n'y en a pas ; des liens vers les fichiers d'animation et d'interopérabilité que la même commande a écrits à côté du rapport ; chaque format d'export, avec son applicabilité au scénario, la raison s'il ne s'applique pas, et sa spécification

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = l'exporteur d'animation (<c1/>), <c2/> et les fichiers écrits par la ligne de commande (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Chronologie des événements

# text
seg-f29f1b90edbd = fenêtres temporelles et événements ponctuels, dessinés et tabulés sur l'axe des temps de l'exécution

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = les tables du scénario avec <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> ou un instant de début ; la durée de l'exécution <c7/> ; tout tableau <c8/> du résultat ; les phases et les passages de relais d'une campagne

# text
seg-00bee96167aa = Étiquettes de vérification

# text
seg-6dea392111a6 = chaque ligne de la matrice de vérification que sollicitent les types de scénario de l'exécution, avec son étiquette, sa référence indépendante et ses preuves d'essai, et les niveaux par chiffre que le résultat énonce

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = la matrice de vérification (<c1/>, <c2/>), via la table de correspondance entre type de scénario et lignes <c3/>

# text
seg-c19ae28a2355 = Non modélisé, et hypothèses

# text
seg-aff7a016c7e2 = chaque limitation, citée

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = les blocs <c1/>, <c2/> et <c3/> du résultat ; les clauses MODELLED du catalogue des types de scénario ; les commentaires du scénario et les textes d'entrée qui disent « not modelled » ; la raison, dans la matrice, pour laquelle chaque ligne MODELLED reste modélisée (<c4/>)

# text
seg-a3ee5ba71183 = Fiche de reproductibilité

# text
seg-a9746c2f1881 = version du moteur, commit source, empreintes Secure Hash Algorithm 256 bits (SHA-256) du fichier de scénario et du document de résultat, graine, plateforme, commande exacte, règle du répertoire de travail, empreinte de chaque autre fichier d'entrée

# text
seg-ec1f62f6bbd1 = la construction, les fichiers, la ligne de commande

# text
seg-ea460048debd = Une section sans rien à lister en dit la raison en une phrase (par exemple, « No timed event: the scenario scripts no window or onset time and the result reports no event »). Aucune section n'est jamais vide et muette.

# text
seg-b99234469953 = Ce que signifie une étiquette dans le rapport

# text
seg-f9060b1e8077 = Une étiquette de vérification évalue la <b>capacité</b> nommée dans une ligne de la matrice, telle que la matrice la consigne. Elle n'évalue pas la configuration du scénario, et une ligne VALIDATED ne rend pas mesurées les entrées d'une exécution. Une ligne PARTNER est une discipline sur laquelle l'exécution s'appuie et que Kshana ne fournit pas (le matériel d'antenne pour les types de scénario radiofréquence, la charge utile quantique pour les types de scénario quantiques, le bus du satellite pour le bilan d'attitude) ; le rapport l'affiche comme <em>utilisée, non fournie</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = La table de correspondance entre types de scénario et lignes est une table de chaînes <c1/> de la matrice. L'étiquette, la référence indépendante et les preuves sont relues dans la matrice à la construction du rapport, de sorte que déplacer une ligne entre VALIDATED et MODELLED déplace avec elle chaque rapport. Une campagne porte la ligne de son mode (chaîne, balayage ou Monte Carlo, composition) plus chaque ligne de chaque type de scénario membre qu'elle a exécuté ; <c2/> porte les lignes du type de scénario qu'il a balayé. Chaque exécution porte aussi la ligne « Reproducibility & software assurance », sur laquelle repose la fiche de reproductibilité.

# text
# c1: advanced_report::PATH_GATED_CAPABILITIES
# c2: orbit
# c3: ephemeris
# c4: tle
# c5: slot-timing
# c6: oscillator.record
# c7: spectrum
# c8: [[panels]]
# c9: leo-pass
# c10: leo-pnt-chain
# c11: leo-navmsg
# c12: leo-pvt
# c13: terrain-nav
# c14: terrain-slam
seg-f38434695c28 = Une ligne qui n'évalue qu'un chemin d'entrée d'un type de scénario n'est listée que si l'exécution a pris ce chemin (<c1/>) : <c2/> et <c3/> ne portent la ligne « Orbit propagation & determination » qu'avec un <c4/> (le chemin Simplified General Perturbations { "4" } (SGP4) ; une orbite analytique est une propagation à deux corps), et <c5/> ne porte la ligne de l'enregistrement mesuré qu'avec un <c6/>. La même table conditionne la ligne multibande <c7/> au fait que l'exécution dessine <c8/>, et les lignes des types de scénario en orbite terrestre basse (LEO) au chemin pris par chaque exécution : une ligne pluie, entrée dans un bâtiment, basse énergie ou leurreur de <c9/> ou <c10/> seulement lorsque le scénario fixe ce terme, la ligne de scintillation sauf si le scénario la désactive, une ligne de <c11/>, <c12/> ou de positionnement ponctuel précis de chaîne seulement pour l'analyse ou le mode que porte le résultat, et la ligne de préréglage de système LEO seulement lorsqu'un préréglage nommé est utilisé. La ligne du lecteur Shuttle Radar Topography Mission (SRTM) n'est portée par aucun type de scénario : <c13/> et <c14/> s'exécutent sur un modèle numérique d'élévation (DEM) synthétique, et aucun champ de scénario ne lit une tuile SRTM. Une ligne VALIDATED que l'exécution n'a jamais touchée revendiquerait sinon des preuves que l'exécution n'a pas.

# text
seg-29efeadac5c7 = Reproduire une exécution à partir de son rapport

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> contient tout le nécessaire :

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Vérifiez le fichier de scénario par rapport à <c1/>, et tout fichier de <c2/> (un fichier d'orientation de la Terre <c3/>) par rapport à son empreinte.

# text
# c1: command
seg-5b3c59266451 = Exécutez <c1/> depuis le répertoire où l'exécution d'origine a été lancée. Le chemin du scénario, et tout chemin de données relatif à l'intérieur du scénario, se résolvent par rapport à lui.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = Le nouveau <c1/> a le SHA-256 indiqué dans <c2/>, et les nouveaux <c3/> et <c4/> sont identiques octet pour octet aux anciens.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> fait exactement cela pour un scénario d'horloge, une campagne chaînée, une campagne de balayage et une exécution d'orbite avec un fichier <c2/> : il lit la commande dans le rapport, l'exécute dans un répertoire neuf ne contenant que les entrées consignées, et compare les octets.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> est l'empreinte des octets exacts du fichier. Le <c2/> propre au résultat est autre chose : l'empreinte du scénario calculée par le type de scénario (souvent d'une forme canonique), et le rapport imprime les deux, étiquetés.

# text
# c1: seed
seg-3d72d2059a6c = <b>Graine.</b> La graine est le <c1/> du scénario, sinon celle que le résultat indique. Pour un type de scénario qui ne prend pas de graine, le rapport le dit, ainsi que le fait que le fichier de scénario et la construction du moteur suffisent seuls à fixer le résultat.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Commit source.</b> Le moteur ne consigne le commit que s'il a été construit avec la variable d'environnement <c1/> définie, lue à la compilation :

# text
seg-3c7ed74729d3 = Une construction sans elle indique le commit comme non consigné, et la version du moteur identifie la publication. Rien n'est deviné.

# text
seg-86ff67531a0e = <b>Plateforme.</b> Système d'exploitation, architecture et famille de la construction. Les résultats sont identiques octet pour octet sur une même plateforme ; d'une plateforme à l'autre, les résultats en virgule flottante peuvent différer dans les derniers chiffres (voir <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Déterminisme et l'unique horodatage

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = Les mêmes octets de scénario, la même graine et la même construction du moteur donnent un <c1/> et un <c2/> identiques octet pour octet. Le rapport ne porte aucun horodatage. La seule lecture d'horloge de tout le crate est celle que fait <c3/>, qui inscrit <c4/> dans le document de résultat ; le rapport affiche alors cet horodatage et dit que c'est le seul champ qu'une reproduction ne retrouvera pas. Pour l'éviter, exécutez sans <c5/>. <c6/> construit deux fois le rapport de chaque fichier de scénario sous <c7/> (hors le manifeste de la suite), et ré-exécute six scénarios (dont une campagne de chacun des modes chaîne, balayage et composition) pour vérifier cela de bout en bout.

# text
seg-8a3fc60a5b54 = Impression en PDF

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = Le moteur n'écrit pas de fichiers Portable Document Format (PDF). Un générateur de PDF qui rendrait les graphiques imposerait une nouvelle dépendance lourde ; il n'y a donc pas d'option <c1/>. À la place, <c2/> porte une feuille de style d'impression : ouvrez-le dans un navigateur, imprimez, et choisissez « Enregistrer au format PDF ».

# text
seg-13f1f294ede1 = La feuille de style est écrite pour A4 comme pour US Letter. Elle ne fixe aucun format de papier (le choix de la boîte de dialogue d'impression s'applique), conserve des marges de { "15" } mm / { "14" } mm qui conviennent aux deux feuilles, passe en noir sur blanc, répète les en-têtes de tableau sur chaque page, empêche les lignes de tableau, les figures et les cartes d'être coupées entre deux pages, garde les titres avec le texte qui suit, et commence les sections des entrées, des résultats, des étiquettes de vérification et de la reproductibilité sur une nouvelle page. La barre de navigation est masquée à l'impression.

# text
seg-a25bb320665d = Le document JSON

# text
# c1: report.json
# c2: report_schema = "kshana-report"
# c3: report_schema_version = "1.0"
# c4: kind
# c5: title
# c6: executive_summary
# c7: inputs
# c8: results
# c9: aggregation
# c10: events
# c11: capabilities
# c12: not_modelled
# c13: companions
# c14: animation
# c15: exports
# c16: export_command
# c17: reproducibility
# c18: items
# c19: omitted
# c20: items
# c21: statement
# c22: value
# c23: display
# c24: null
# c25: value
# c26: display
seg-9d9af39942a7 = <c1/> a <c2/> et <c3/>, puis <c4/> et <c5/> et une clé par section : <c6/>, <c7/>, <c8/>, <c9/> (campagnes et balayages seulement), <c10/>, <c11/>, <c12/>, <c13/> (section 3b : <c14/>, <c15/> et <c16/>) et <c17/>. Une section de liste a <c18/>, <c19/> (les lignes que le plafond de la page a laissées de côté ; le document de résultat porte chaque valeur) et, lorsque <c20/> est vide, un <c21/> qui en dit la raison. Une valeur conserve sa forme JSON brute dans <c22/> et le texte que montre la page dans <c23/> ; une valeur manquante est <c24/> dans <c25/> et « no value » dans <c26/>.

# text
seg-06cc70ca3601 = <b>Unités.</b> Lorsque ni le schéma des unités de champ ni le nom du champ ne donne d'unité, le rapport écrit « not stated » plutôt que de deviner. Les entrées imbriquées dans les scénarios membres d'une campagne sont résolues uniquement par rapport au bloc d'unités propre à la campagne et au suffixe du nom de champ, de sorte que davantage d'entre elles indiquent « not stated » que dans une exécution autonome.

# text
seg-023d5a1fbffc = <b>Jugement sur la table de correspondance.</b> Les lignes de la matrice que sollicite un type de scénario forment une table établie à la main, vérifiée par un test pour qu'elle nomme exactement une ligne existante par entrée et couvre chaque type de scénario intégré. Que chaque correspondance soit la bonne relève d'un jugement humain, comme le choix de la référence indépendante par la matrice elle-même.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Plafonds.</b> La page liste au plus { "400" } entrées, { "150" } résultats scalaires, { "60" } colonnes numériques et { "200" } événements ; <c1/> compte le reste. Un tableau de plus de { "24" } lignes dans un scénario (une série ingérée) est résumé par colonne.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> conserve ses propres <c2/> et <c3/> ; il n'écrit pas ce rapport.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Liaisons.</b> Les liaisons Python et WebAssembly conservent <c1/>, la fiche de synthèse d'une page ; le rapport téléchargeable du bac à sable est sa propre page (<c2/>). Ce rapport est écrit par la CLI, et les appelants Rust peuvent le construire avec <c3/>. Le serveur Model Context Protocol (MCP) le renvoie depuis son outil <c4/>, en JSON ou en page HTML ; le nom du fichier de scénario dans sa commande de reproduction est celui que passe l'appelant (par défaut <c5/>), et il ne liste aucun fichier d'accompagnement, puisque le serveur n'en écrit aucun.

# text
seg-c8ab7b4605cf = <s1>Suivant</s1>Export d'animation
