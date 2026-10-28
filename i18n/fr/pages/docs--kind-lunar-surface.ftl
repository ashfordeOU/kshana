# docs--kind-lunar-surface: translations (fr)

seg-f942b36a11c4 = Pas encore sur GitHub

seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Étiquette du résultat (celle du moteur) : MODELLED

seg-626ab55f0424 = MODELLED (résultat <c1/>)

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Logiciel à titre consultatif, et non un équipement de navigat

seg-feea03a2c628 = Source : <c1/>

seg-6c0eff9f9211 = <c1/> (type de scénario)

seg-6c7d25f672fb = Disponibilité du positionnement et de la synchronisation temporelle en surface MODELLED par site et par saison pour des sites polaires sud de classe Artemis. Pour chaque site et chaque saison (une époque et une fenêtre après elle), elle rapporte le positionnement par relais (quatre relais ou plus d'une constellation ILLUSTRATIVE de classe LCNS en vue et PDOP sous un seuil, issus des mêmes fonctions que moonlight-service-volume et, avec une section de terrain, la ligne d'horizon tracée par rayons du terrain de lunar-station-coverage), si la Terre et le Soleil sont au-dessus de l'horizon du site (Soleil, Lune et orientation lunaire analytiques, libration comprise, ce qui varie avec la saison), et la disponibilité de la synchronisation temporelle (un relais ou la Terre en vue) avec la plus longue période sans aucun des deux, le holdover qu'une horloge de surface doit traverser. Un résultat à site unique égale celui de moonlight-service-volume au bit près. MODELLED : ensemble de relais képlériens illustratif sur une Lune à rotation moyenne ; le chiffre des relais ne change pas avec la saison ; le terrain est la découpe LOLA de { "1200" } m. Sans aval d'aucune agence ; logiciel à titre consultatif, et non un équipement de navigation certifié.

seg-3c13aefe4093 = Une exécution de <c1/> se résume ainsi : lunar-surface | { "4" } sites x { "4" } seasons | positioning { "41" }% to { "41" }% | worst timing availability { "100.0" }% | longest timing gap { "0.0" } h (MODELLED)

seg-02bc245c436e = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = L'exemple <c1/> définit, entre autres :

seg-0ceb87f45323 = polaire sud { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = transmis sans changement

seg-94b84de6c958 = Le graphique que le moteur écrit pour scenarios/lunar-surface.toml, type de scénario lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> Le type et la phase <c1/> : disponibilité des relais et PDOP, visibilité de la Terre et du Soleil et horloge de surface asservie pour chaque site et chaque saison, avec la ligne d'horizon du terrain de <c2/> ; une exécution à site unique égale celle de ce type

seg-70f63c99a478 = <b>MODELLED</b> Le type et la phase <c1/> : disponibilité des relais et PDOP, visibilité de la Terre et du Soleil et horloge de surface asservie pour chaque site et chaque saison, avec le terr. Référence indépendante (ReferenceImpl) : Égalité exacte avec le type existant pour un site, et vérifications de monotonie, dans les tests. L'ensemble de relais est ILLUSTRATIVE et aucune mesure en surface n'est comparée

seg-ab29e0e308d0 = Disponibilité du positionnement et de la synchronisation temporelle en surface MODELLED par site et par saison pour des sites polaires sud de classe Artemis. (catalogue des types de scénario (<c1/>))

seg-3f948092eba6 = MODELLED : ensemble de relais képlériens illustratif sur une Lune à rotation moyenne ; le chiffre des relais ne change pas avec la saison ; le terrain est la découpe LOLA de { "1200" } m. (catalogue des types de scénario (<c1/>))

seg-5b217c0bb606 = HONNÊTETÉ : MODELLED. L'ensemble de relais est illustratif et képlérien, avec la Lune tournant à la vitesse moyenne pour les relais (sans libration) comme dans moonlight-service-volume ; la Terre et le Soleil utilisent l'orientation analytique, de sorte que les deux référentiels diffèrent de cette omission. Le chiffre de positionnement par relais ne change pas avec la saison dans ce modèle ; ceux de la Terre et du Soleil, si. Aucun accord avec un service ou un site réels n'est affirmé. Logi (commentaire du fichier de scénario, lignes { "11" } à { "15" })

seg-958f00c2d647 = La disponibilité du positionnement et de la synchronisation temporelle en surface par site et par saison aux pôles lunaires (<c1/>) est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte dans cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Précédent</s1>lunar-station-coverage

seg-625c1973128e = <s1>Suivant</s1>lunar-time-budget
