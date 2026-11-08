# docs--i18n: translations (fr)

seg-c3c260b7063e = Tests

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Pas encore sur GitHub

seg-26b562e7f535 = Source : <c1/>

seg-60b2e78c882e = Localisation du moteur

seg-7f3a6f2932c2 = Le texte du moteur destiné aux personnes existe en { "17" } langues en plus de l'anglais : nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. L'anglais est la source ; <c1/> est une pseudo-locale qui accentue, entoure de crochets et complète chaque message, de sorte qu'un test peut voir si le texte est passé dans le catalogue. Le cadre est <a1>Project Fluent</a1> (<c2/>, <c3/>) ; le code est <c4/>.

seg-1ed9fde69630 = Ce qui est localisé et ce qui ne l'est jamais

seg-1cb6eb25338d = Localisé (une personne le lit)

seg-ab884f59f5f3 = Jamais localisé (un programme le lit)

seg-dbe9b8a0ed98 = messages et erreurs de la ligne de commande

seg-711a8e63c1de = clés et valeurs JSON de <c1/> et <c2/>

seg-a4066ef82152 = la ligne de synthèse de chaque exécution

seg-6fbdf82a22dc = en-têtes et lignes CSV

seg-8d08a6f5f16f = le texte des graphiques SVG (titres, axes, légendes, légendes de figure)

seg-8ad1234dfb18 = noms de fichiers

seg-777c2587e0da = <c1/> : titres, tableaux, notes, légendes

seg-d5cf8d8abe89 = codes d'erreur (<c1/>)

seg-7ba47f2644f5 = mots de verdict (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = la matrice de vérification, les définitions d'unités, la provenance

seg-122495009a9c = les descriptions des types de scénario (<c1/>)

seg-c7bc43c1e848 = mentions à titre consultatif, avertissements et avis (<c1/>)

seg-dd0fc888e0dc = les mêmes textes dans le JSON, qui restent en anglais

seg-a236606f1ca1 = <c1/> de la campagne iq, de la page de comparaison d'études, du classement bench, du rapport de résilience

seg-4ec45651bd09 = <c1/> d'un paquet de preuves et le PNG de l'observatoire : tous deux sont hachés dans un manifeste (celui du paquet est aussi signé), ils sont donc construits en anglais quelle que soit la langue

seg-048b6c3a9f0c = Les nombres dans le texte destiné aux personnes utilisent le séparateur décimal de la langue (une virgule dans { "15" } des { "18" } langues ; un point en en, ja, zh-Hans et en-XA). Les nombres dans les fichiers machine utilisent toujours le point. Un compteur (une variable nommée <c1/>, <c2/>, <c3/>, <c4/> ou <c5/>) parvient à Fluent comme un nombre, de sorte qu'une traduction peut écrire <c6/>.

seg-487d6d38fa39 = Choisir la langue

seg-79499bebb806 = Ligne de commande : <c1/>, puis <c2/>, <c3/>, <c4/>, <c5/>, puis l'anglais. <c6/> est pt-BR ; seul <c7/> est celui du Portugal. <c8/> est le chinois simplifié ; le traditionnel est refusé avec la liste des balises prises en charge.

seg-079f85726238 = Bibliothèque : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python : <c1/> sur <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> ; <c9/> ; <c10/>.

seg-017ca3380cee = WebAssembly : un <c1/> final facultatif sur <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/> ; <c11/> ; <c12/> ; <c13/>.

seg-3e49c408ad12 = MCP : <c1/> sur <c2/> et <c3/>.

seg-e133ee809c98 = Les erreurs et leurs codes

seg-fac73c5cbbc2 = Chaque message d'erreur a un code stable, l'identifiant du message en majuscules (<c1/> est <c2/>), le même dans toutes les langues. Le texte anglais de la ligne de commande est inchangé. Dans une autre langue, la ligne est <c3/> ; avec <c4/>, une seconde ligne <c5/> suit dans toutes les langues. L'API fournit <c6/> et <c7/> (<c8/>) ; les erreurs MCP portent <c9/> comme données d'erreur. Fiez-vous au code, jamais au texte.

seg-7d731dc5f888 = Comment une exécution fonctionne dans une autre langue (la règle de la double exécution)

seg-204df30d9ca2 = Un fichier machine ne doit pas dépendre de la langue. Une exécution dans une autre langue exécute donc le scénario deux fois : une fois en anglais, dont <c1/>, <c2/> et le CSV sont les fichiers machine, et une fois dans la langue de l'utilisateur, pour la synthèse, le graphique et <c3/>. L'anglais est une seule exécution, octet pour octet ce qu'elle était auparavant.

seg-b7447d4cd5a8 = Mesuré, natif, compilation de release, anglais puis <c1/> (secondes) : leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" } ; tout autre scénario fourni dure moins de { "4" } s ; les { "173" } scénarios fournis au moment de la mesure ont pris { "64" } s en anglais au total. Le coût est exactement le double pour une autre langue. WebAssembly n'a pas été mesuré (pas de wasm-bindgen ici) ; au facteur navigateur d'environ { "4" }, cela fait une minute pour le type le plus lent.

seg-cc148fdec7a2 = Une page évite l'attente en affichant tout de suite le résultat anglais puis en appelant <c1/> : c'est la seconde exécution seule, elle renvoie <c2/>, et le Studio peut afficher « traduction en cours… » jusqu'à son arrivée.

seg-cd0360ad624d = <b>Élément { "0.41" } : une seule exécution.</b> Rendre les deux à partir d'un enregistrement de <c1/>. Cela a été examiné et non réalisé : les résultats <c2/> sont inspectés, mesurés et hachés après leur création (largeurs du texte des graphiques, hachages de provenance sur le texte de sortie), et <c3/> formate au point d'appel, de sorte qu'un enregistrement mettrait des jetons de remplacement dans les fichiers machine et ferait dépendre leurs octets de la relecture. Il faudrait <c4/>/<c5/> qui renvoient des jetons, un finaliseur à chaque écrivain et une preuve d'identité des octets pour chaque écrivain.

seg-67e04a43cea8 = La compilation wasm n'embarque que le catalogue anglais. Les seize autres ajouteraient environ { "150" } kB en gzip chacun. Une page récupère <c1/> au choix d'une langue et appelle <c2/> ; si la récupération ou l'enregistrement échoue, la page reste en anglais. En natif, la ligne de commande et le wheel Python embarquent les { "18" }.

seg-9a2f85e7e43c = Taille, <c1/> non optimisé issu de <c2/> (avant wasm-bindgen et wasm-opt), base bc04e98f par rapport à cette branche : { "18.71" } MB -> { "19.88" } MB brut, { "5.43" } MB -> { "5.79" } MB en gzip, +{ "357" } kB en gzip. Le catalogue anglais fait { "521" } kB brut, dont { "153" } kB en gzip ; le reste est <c3/> et ses dépendances. Cela est accepté tel que mesuré.

seg-3ce9aab4916e = Le catalogue

seg-fdea76581cd8 = <c1/> contient les messages, dont les identifiants ont le préfixe <c2/>. <c3/> est la source ; les autres fichiers sont ceux des traducteurs et peuvent manquer de messages (chacun se rabat sur l'anglais message par message). Listes d'accompagnement dans <c4/> : <c5/> (messages avec variables de compte, pour les formes plurielles), <c6/> (nombres transmis comme placeables), <c7/> (messages qui sont des morceaux d'une phrase assemblée à l'exécution : à fusionner en messages de phrase entière, jamais à multiplier).

seg-9432bca8a935 = <c1/> prouve l'anglais : chaque message a un modèle d'origine enregistré et se rend exactement en ce texte ; chaque identifiant est utilisé ; les variables correspondent ; la pseudo-locale rend chaque message. <c2/>, <c3/>, <c4/> couvrent les points d'entrée, les descriptions des types et les textes juridiques. <c5/> échoue si un nouveau littéral de chaîne qu'une personne lirait contourne le catalogue : tolérance par fichier dans <c6/>, qui peut baisser et ne monte jamais. <c7/> exécute des scénarios entiers avec un binaire de référence et le binaire courant et compare chaque fichier de sortie.

seg-969a4b12b12c = Comment déplacer une chaîne dans le catalogue : <c1/>.

seg-48c3c0ca063d = Dépendances et licences

seg-b6c2f08c9a46 = Le cadre ajoute <c1/> { "0.16" } (Apache-2.0 OR MIT) et <c2/> { "0.9" } (MIT OR Apache-2.0), avec leurs crates transitives : <c3/> et <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only : l'alternative Apache-2.0 est celle qui est utilisée, ce que <c9/> autorise), <c10/> et <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Chacune est permissive selon la liste <c16/> de <c17/> ; <c18/> apparaît en deux versions ({ "1" } et { "2" }), ce que <c19/> ne fait que signaler. La liste des licences a été lue depuis <c20/> ; <c21/> n'est pas installé dans l'environnement de rédaction et s'exécute dans l'intégration continue.

seg-6aa2e78078ae = <s1>Précédent</s1>Glossaire

seg-670504be0531 = <s1>Suivant</s1>Guide du Studio
