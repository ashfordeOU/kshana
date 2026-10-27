# docs--campaigns: translations (fr)

# text
seg-f917e7fcac09 = Ce que c'est

# text
seg-cae10fb9bff8 = Scénario

# text
# c1: docs/CAMPAIGNS.md
seg-7603033b1c87 = Source : <c1/>

# text
# c1: campaign
# c2: kind
# c3: api::run_toml
# c4: kshana <file>.toml
seg-699c946d7d09 = Un scénario unique répond à une question sur une situation. Une mission est une suite de situations, et une étude de conception en est une famille. Le type de scénario <c1/> compose les types existants en une seule exécution sans en réimplémenter aucun : chaque membre est une table de scénario ordinaire portant son propre <c2/>, répartie via <c3/> exactement comme <c4/> l'exécuterait, et la campagne se contente de relire des nombres dans les documents de résultats.

# text
seg-cb4f48673970 = Une campagne est <b>MODELLED</b>. Ses identités de composition sont testées (ci-dessous), mais enchaîner des phases est un choix de modélisation, et chaque phase ne vaut que ce que vaut le type qui l'a exécutée.

# text
seg-80e367fbc391 = Exécutez-en une comme n'importe quel autre scénario :

# text
seg-9f9995ebc904 = Une campagne peut contenir n'importe quelle combinaison de quatre sections ; une campagne sans aucune s'exécute et son résumé indique qu'elle n'a rien composé.

# text
# c1: [[phases]]
seg-002ddd72b3a2 = <c1/> : une mission enchaînée sur une seule chronologie

# text
# c1: [timeline] step_s
seg-e99c4453b79d = Chaque phase exécute un ou plusieurs scénarios sur une fenêtre d'une chronologie de mission partagée, par exemple une horloge en holdover et un système de navigation inertielle (INS) en roue libre au même moment. Les sorties de chaque exécution sont lues dans des <b>canaux</b> nommés, placées à l'instant de début de la phase et rééchantillonnées sur une grille commune (<c1/>) par blocage d'ordre zéro : un instant de la grille prend le dernier échantillon de l'exécution de la phase propriétaire situé à cet instant ou avant, et vaut null lorsqu'aucune exécution de cette phase ne fournit le canal.

# text
seg-842b77a21c5f = Canal

# text
seg-b2eb598fab2a = Source prédéfinie

# text
seg-f42465f7d066 = ns

# text
seg-fdb4600bf100 = erreur de temps de l'horloge

# text
seg-aef6b877191d = garde d'erreur de temps

# text
# c1: threshold_ns
seg-cc989ca58f1d = le <c1/> propre à l'exécution

# text
seg-5e9f7cd33017 = rapport moyen effectif porteuse sur densité de bruit (C/N0) sur les satellites visibles

# text
# c1: jamming
# c2: epochs[].sats[].cn0_effective_dbhz
seg-af6f07319f2d = <c1/> : moyenne de <c2/>

# text
seg-f6b4ea158327 = plancher de perte de poursuite

# text
# c1: jamming
# c2: tracking_threshold_dbhz
seg-126535297c32 = <c1/> : le <c2/> du scénario, lorsqu'il en indique un

# text
seg-f8f430695a88 = satellites toujours poursuivis

# text
seg-3f9a9f33010b = niveau de protection vertical

# text
seg-2cfc68fa1c15 = limite d'alerte verticale

# text
seg-d165177a255c = erreur de position

# text
seg-29651ae6be6f = seuil d'erreur de position

# text
seg-c893c5e3ace5 = { "1" } tant qu'un moniteur de la phase alarme

# text
seg-ade1d7072512 = voir ci-dessous

# text
# c1: <side>
# c2: classical
# c3: side = "quantum"
# c4: [[phases.runs.series]]
# c5: []
# c6: epochs[].t
# c7: input:
# c8: mean
# c9: min
# c10: max
# c11: count
seg-e8c7ac7d117f = <c1/> vaut <c2/> sauf si l'exécution définit <c3/>. Toute autre grandeur est lue avec une entrée <c4/> explicite : un chemin temporel avec un <c5/> nommant les lignes (<c6/>), un chemin de valeur partageant ces lignes ou un scalaire diffusé à chaque ligne (le préfixe <c7/> lit le scénario de l'exécution au lieu de son résultat), une réduction facultative (<c8/>, <c9/>, <c10/>, <c11/>) pour plusieurs valeurs sous une même ligne, une échelle, et une unité pour un canal que la campagne ne connaît pas.

# text
seg-7d7bc5d19a61 = Les <b>alarmes</b> proviennent de trois sources, combinées par un OU logique au sein d'une phase :

# text
# c1: jamming
# c2: integrity
seg-74a10f5283ec = des indicateurs prédéfinis lus dans l'exécution : <c1/> alarme tant que moins de quatre satellites sont poursuivis (sa propre définition de la disponibilité) ; <c2/> alarme aux époques qu'il marque comme indisponibles ;

# text
# c1: carry
# c2: clock
# c3: guard_ns
# c4: gnss-ins
# c5: position_threshold_m
# c6: [[phases.runs.alarms]]
seg-f22be2880015 = des règles prédéfinies sur les canaux de la phase, évaluées <b>après</b> <c1/> : <c2/> alarme tant que l'erreur de temps absolue dépasse <c3/> ; <c4/> tant que l'erreur de position dépasse <c5/> ; les règles explicites vont dans <c6/> ;

# text
# c1: spoof
# c2: detect_time_s
# c3: spoof-detect
seg-ccd94a7cb652 = des événements d'alarme : <c1/> en déclenche un au <c2/> de son moniteur assisté par l'horloge ; <c3/> en déclenche un au début de la phase lorsque sa décision fusionnée alerte.

# text
seg-f88b8ad5672f = <b>L'état est transmis</b> entre les phases de trois manières explicites :

# text
# c1: carry = ["time_error_ns"]
seg-0e3a0ee8e172 = <c1/> ajoute la valeur du canal à la fin de la phase précédente aux valeurs de cette phase pour ce canal. La phase d'horloge qu'un leurreur a tirée est le point de départ du holdover. Ajouter le décalage est exact pour la phase d'horloge, qui intègre la fréquence ; pour une erreur de position, cela suppose que les deux erreurs sont colinéaires, le cas pessimiste.

# text
# c1: [[phases.handoff]]
# c2: channel:<name>
seg-4db8b11391a5 = <c1/> écrit un nombre issu de la phase précédente (<c2/> pour la valeur finale d'un canal, ou tout chemin de résultat d'une exécution précédente) dans une clé pointée du scénario de cette phase avant son exécution, avec une échelle et un décalage facultatifs.

# text
# c1: end_at = "<result path>"
# c2: duration_s
# c3: classical.detect_time_s
seg-fdd5aa8b9627 = <c1/> termine la phase à un instant calculé par une exécution, plafonné à <c2/>. La mission intégrée termine sa phase de leurrage à <c3/>.

# text
# c1: skip_s
seg-cdd64676f509 = <c1/> écarte les premières secondes de la chronologie propre d'une exécution (une montée en régime) avant l'instant zéro de la phase.

# text
seg-d48bcd9890d3 = La mission intégrée

# text
# c1: scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-52fc5abca41f = <c1/> exécute { "18" } scénarios membres sur six phases, sur une grille de { "10" } s :

# text
seg-baea4e05ad26 = Phase

# attr:aria-label, text
seg-9d3ee6a5613e = Exécutions

# text
seg-87fbeeb9abb9 = Ce que montre la chronologie

# text
seg-82bebc2bb038 = nominal, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-cf54dae64cb7 = <c1/>, <c2/> (sans brouilleur), <c3/>

# text
seg-5cb80e4a7d4d = erreur de temps { "0" } ns ; C/N0 { "43.0" } dB-Hz contre un plancher de { "25" } dB-Hz ; niveau de protection vertical de { "9.1" } à { "21.6" } m contre une limite d'alerte de { "50" } m

# text
seg-13c92a72544a = brouillage, { "600" } s

# text
seg-f9c01304734d = identique, brouilleur à -30 dBW, { "1" } km

# text
seg-27d3b65152b0 = le C/N0 chute à { "27.7" } dB-Hz, les { "8" } satellites restent tous poursuivis

# text
# c1: end_at
seg-6a052db03815 = leurrage, terminé à { "370" } s par <c1/>

# text
# c1: spoof
# c2: spoof-detect
# c3: jamming
seg-89856c1f83f8 = <c1/> (rampe de temps de { "0.1" } ns/s), <c2/>, <c3/>

# text
seg-cfcdd96b1132 = l'erreur de temps monte en rampe jusqu'à { "36" } ns ; le détecteur radiofréquence alarme au début de la phase, le moniteur assisté par l'horloge à { "370" } s

# text
seg-92c8a76b84c2 = holdover, { "1800" } s

# text
# c1: clock
# c2: gnss-ins
# c3: jamming
seg-8a6e0b2898d1 = <c1/> (refusé, reporte { "37.0" } ns), <c2/> (unité tactique en roue libre), <c3/> à { "10" } dBW

# text
seg-1948491e25ec = tous les satellites perdus (C/N0 d'environ -12 dB-Hz) ; erreur de temps de { "36.4" } à { "62.7" } ns contre la garde de { "50" } ns ; erreur de position jusqu'à { "24" } km

# text
seg-93e59087dd44 = integrity-alarm, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-f28f37baf8fe = <c1/> (reporte { "59.6" } ns), <c2/> et <c3/> avec un masque de { "25" } deg

# text
seg-83d890c819f8 = { "5" } satellites poursuivis ; niveau de protection de { "19" } à { "135" } m, absent à { "18" } instants de grille sur { "60" } ; l'erreur de temps reportée, de { "52.1" } à { "61.7" } ns, reste au-dessus de la garde de { "50" } ns, si bien que l'alarme est active pendant toute la phase

# text
seg-1ab40b7893db = recovery, { "600" } s

# text
seg-181d2a2f800b = erreur de temps revenue à { "0" } ns ; alarme silencieuse

# text
# c1: integrity
seg-26ef3dc422ff = Les exécutions d'<c1/> utilisent la trajectoire utilisateur propre à l'exemple (une trajectoire circulaire à { "0.4" } km d'altitude), et non le site fixe du récepteur de brouillage, et le masque de { "25" } deg remplace le ciel partiel d'un récepteur en réacquisition. Ce sont des choix de scénario, indiqués dans le fichier.

# text
seg-03ae98f17988 = Une mission pilotée par le spectre en bande L

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: jamming
# c4: scenarios/l-band-waterfall-jamming.toml
seg-5daf8c8fdd83 = <c1/> exécute { "8" } scénarios membres sur trois phases, sur une grille de { "1" } s, le C/N0 de GPS L1 C/A et de Galileo E1 étant lu dans le type <c2/> (voir <a1>SPECTRUM.md</a1>) plutôt que dans la table par satellite du type <c3/>. Les brouilleurs sont ceux de <c4/>.

# text
# c1: end_at
seg-7f34a00af961 = début, terminé à { "10" } s par <c1/>

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-471ec0d86f76 = <c1/>, <c2/> (chirp à partir de { "10" } s), <c3/>

# text
# c1: timeline.bands[0].first_loss_t_s
seg-00b032242ebc = L1 C/A { "43.48" } et E1 { "44.73" } dB-Hz ; la phase se termine à la première perte de L1 C/A de l'exécution spectre elle-même (<c1/>) ; niveau de protection de { "21.6" } m contre { "50" } m

# text
seg-50220d719d5d = holdover, { "600" } s

# text
# c1: clock
# c2: spectrum
seg-50de7cd69ac0 = <c1/> (refusé, reporte l'erreur de début, { "0" } ns ici), <c2/> (chirp actif)

# text
seg-1d59e94d94e5 = L1 C/A { "3.38" } et E1 { "4.44" } dB-Hz, tous deux sous le plancher de { "25" } dB-Hz ; erreur de temps de -0.07 à { "5.06" } ns contre la garde de { "50" } ns ; alarme active

# text
seg-6c56497d74fb = galileo-fallback, { "300" } s

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-62bcfd3e8732 = <c1/> (resynchronisée), <c2/> (tonalité CW sur la porteuse L1), <c3/> sur un Walker 24/3/1 de type Galileo

# text
seg-d455f0c06ee6 = L1 C/A maintenu à { "17.98" } dB-Hz, E1 revenu à { "44.73" } dB-Hz ; niveau de protection de { "6.1" } à { "17.7" } m ; alarme silencieuse

# text
seg-2db37e292efe = Le retour de E1 sous la tonalité CW repose sur le traitement à spectre continu du type spectre : la tonalité se situe dans le zéro du spectre MBOC et ne couple rien. Une vraie tonalité se couplerait par les raies spectrales du code ; cela est indiqué dans le fichier et dans SPECTRUM.md.

# text
# c1: [sweep]
seg-fb8d8636c554 = <c1/> : une grille de paramètres sur n'importe quel type

# text
# c1: sweep-nd
# c2: runs > 1
# c3: k
# c4: k
# c5: scenarios/campaign-sweep-jammer-power.toml
seg-b14a11d60e9f = Une à trois clés de scénario pointées, chacune sur une plage linéaire ou logarithmique, sur les mêmes valeurs d'axe que celles qu'utilise le type <c1/>. Chaque axe a un nom et une unité ; chaque métrique a un nom et un chemin de résultat, et son unité est lue dans le bloc d'unités du type balayé, sauf si la campagne en déclare une. Avec <c2/>, chaque nœud est un ensemble Monte Carlo à graine (réalisation <c3/> à la graine du nœud plus <c4/>), rapporté avec les statistiques ci-dessous. <c5/> balaie un brouilleur situé à { "1" } km du récepteur de -50 à +{ "10" } dBW : le rapport moyen brouilleur sur signal varie d'exactement { "1" } dB par dB ({ "12.2" } à { "72.2" } dB), et la disponibilité passe de { "1" } à { "0" } entre -30 et -25 dBW.

# text
# c1: system.2.sisre_m
# c2: sisre_m
# c3: [[system]]
# c4: case.0.system.0.shell.0.altitude_km
seg-c1931e311cca = Une clé pointée peut indexer par position un tableau de tables : <c1/> est le <c2/> de la troisième table <c3/>, et <c4/> descend de trois niveaux.

# text
# c1: [monte_carlo]
seg-e774c578906d = <c1/> : un ensemble à graine

# text
# c1: k
# c2: base_seed + k
# c3: classical.series[-1].error_ns
seg-bbacb9c66f92 = La réalisation <c1/> exécute le scénario avec sa clé de graine fixée à <c2/>, la convention déjà utilisée par l'ensemble d'horloge, de sorte que l'ensemble se reproduit exactement. Chaque métrique rapporte la moyenne, l'écart type de la population, les 5e, 50e et 95e percentiles au rang le plus proche, un intervalle de confiance à { "95" } % par bootstrap percentile à graine fixe sur la moyenne ({ "2000" } rééchantillonnages) et, par défaut, chaque échantillon dans l'ordre des graines. Les chemins de résultat peuvent indexer des tableaux : <c3/> est le dernier échantillon.

# text
# c1: [compose]
seg-ed182d15151d = <c1/> : plusieurs scénarios sous des conditions partagées

# text
# c1: scenarios/campaign-shared-jammer-sea-road.toml
seg-26fab14de534 = Des valeurs partagées nommées (un nombre ou un tableau de nombres, avec une unité) sont écrites dans chaque membre aux clés auxquelles il les lie, de sorte que les membres ne peuvent pas être en désaccord sur la condition partagée. Chaque membre s'exécute et, pour chaque métrique, le résumé combiné donne la plus petite, la plus grande et la moyenne des valeurs sur les membres, en nommant le meilleur et le pire. <c1/> place un brouilleur de { "8" } dBW entre un navire dans le golfe de Finlande (à environ { "30" } km) et une voiture sur une route côtière d'Helsinki (à environ { "50" } km) : le navire perd tous les satellites (rapport moyen brouilleur sur signal de { "39.0" } dB) tandis que la voiture en garde au moins quatre ({ "34.6" } dB).

# text
# c1: [optimize]
seg-c888630c92d7 = <c1/> : la meilleure valeur d'une métrique

# text
# c1: [lo, hi]
# c2: lin
# c3: log
# c4: goal = "minimize"
# c5: "maximize"
# c6: "target"
# c7: target
seg-b54f0deedd0f = Une à trois clés de scénario pointées, chacune bornée à <c1/> sur une échelle <c2/> ou <c3/>, sont explorées pour trouver la meilleure valeur d'une métrique (<c4/>, <c5/> ou <c6/>, qui minimise la distance à <c7/>).

# text
seg-b57ec5e5168a = Il existe deux méthodes :

# text
# c1: method = "grid"
# c2: steps
seg-8fba07ce0cde = <c1/> exécute chaque nœud d'une grille de <c2/> par clé, sur les valeurs d'axe du balayage.

# text
# c1: method = "nelder-mead"
# c2: max_evals
# c3: step
# c4: ftol
# c5: xtol
seg-844a7c1e3578 = <c1/> (par défaut) exécute un simplexe de Nelder–Mead déterministe en coordonnées normalisées à [{ "0" }, { "1" }] par clé. Les points d'essai sont projetés sur la boîte. La section accepte <c2/>, un <c3/> initial et les tolérances d'arrêt <c4/> et <c5/>.

# text
# c1: runs > 1
# c2: best_coords
# c3: best_metric
# c4: best_score
# c5: evals
# c6: stop_reason
# c7: trace
seg-2b1159b467f8 = Une exécution dont la métrique est absente ou non finie obtient le pire score, et elle est conservée dans la trace. Avec <c1/>, la métrique est la moyenne sur les mêmes graines à chaque évaluation. Le résultat donne <c2/>, <c3/>, <c4/>, <c5/>, <c6/> et chaque évaluation dans <c7/>.

# text
# c1: scenarios/campaign-optimize-link-budget.toml
seg-778a40736e7b = <c1/> recherche la portée et le débit de données pour une marge de liaison de { "3" } dB. L'optimum est local à la boîte et au point de départ. Il est MODELLED, jamais une affirmation globale.

# text
# c1: docs/design/evidence/cap32-optimize/
# c2: tests/campaign_optimize_reference.rs
seg-b94ab5e6dad4 = Le protocole et ses seuils fixés à l'avance figurent dans <c1/>. Le test est <c2/>. Les résultats :

# text
seg-232c68472fa4 = une résolution de cible 1-D concorde avec la forme fermée à { "6e-15" } près ;

# text
seg-22f7abf70fc4 = la méthode de grille concorde bit à bit avec une boucle de force brute indépendante ;

# text
seg-faea43f01e37 = le simplexe fait au moins aussi bien que la grille de { "41" } × { "41" }, en environ un dixième de ses exécutions.

# text
seg-df1533fe6b95 = Le seuil 1-D du tour { "1" } est enregistré NOT MET : la boîte fixée à l'avance excluait la solution.

# text
# c1: scenario_hash
# c2: reproducibility
# c3: run_digest
# c4: scenario_hash
seg-0862a4e9aa61 = Chaque résultat de campagne porte <c1/>, le SHA-256 (Secure Hash Algorithm { "2" }, empreinte de 256 bits) de la forme JavaScript Object Notation (JSON) canonique du document de campagne (l'ordre des clés et la mise en forme ne la modifient pas), et un bloc <c2/> avec le nombre d'exécutions membres et <c3/>, un SHA-256 calculé sur l'empreinte de chaque résultat membre dans l'ordre de répartition. Deux exécutions de même empreinte ont produit des résultats membres identiques octet pour octet. Chaque exécution de phase enregistre aussi son type, son propre <c4/> lorsque le type en a un, et le SHA-256 de son document de résultats. Chaque nombre du document a une entrée d'unités.

# text
seg-2eeddb87e889 = Le cœur est séquentiel et ne lit aucun fichier, de sorte qu'une campagne s'exécute sans changement dans la version WebAssembly. Les campagnes ne peuvent pas contenir de campagnes.

# text
seg-f9b8b78dd64a = Exports

# text
# c1: --export
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
seg-c4443bf160f7 = <c1/> sur une campagne écrit chaque scénario membre doté d'une géométrie sous forme d'un jeu de fichiers distinct, l'étiquette du membre étant insérée avant le suffixe de format : chaque exécution de phase (<c2/>, ou <c3/> lorsque la phase compte plusieurs exécutions), le scénario de base du balayage (<c4/>), le scénario Monte Carlo (<c5/>) et chaque membre composé (avec sa propre étiquette, et les valeurs partagées qu'il lie y sont écrites). Un membre identique à un précédent n'est écrit qu'une fois ; les transmissions et les valeurs de balayage ou de graine appliquées à l'exécution ne figurent pas dans les scénarios exportés.

# text
seg-0ba270495309 = Un format qu'aucun des membres ne peut décrire est refusé, avec cette raison. Le tableau par scénario figure dans <a1>INTEROP.md</a1>.

# text
seg-c20904c9d3b5 = Campagnes LEO-PNT

# text
seg-a598e2c06f51 = Quinze campagnes intégrées cadrent des questions de positionnement, de navigation et de synchronisation temporelle (PNT) en orbite terrestre basse (LEO) ; <a1>LEO-PNT.md</a1> décrit ce que montre chacune. Ce qu'exécute chacune, tel que la ligne de commande le résume :

# text
seg-f65b1f2b4182 = Mode

# text
seg-e7d7defa7e71 = Question

# text
seg-08ab59acfe62 = composition, { "4" } membres

# text
seg-a21e4db0fda9 = données de service du message de navigation selon la longueur de trame

# text
# c1: leo-pvt
seg-6c29f4690d2c = balayage de <c1/>, { "7" } nœuds

# text
seg-97fba77aa2ec = positionnement fusionné MEO et LEO selon l'erreur de distance du signal dans l'espace (SISRE) LEO

# text
seg-7b9fbe34d38c = composition, { "2" } membres

# text
seg-28352bd0c9e3 = LEO-PNT en intérieur selon la bande et la classe de bâtiment

# text
# c1: leo-pass
seg-a447c56022ec = balayage de <c1/>, { "9" } nœuds

# text
seg-5b3cbfced221 = énergie par position de l'Internet des objets (IoT) selon la puissance d'émission UHF LEO

# text
# c1: ntn-positioning
seg-3ebd95e5933a = balayage de <c1/>, { "9" } nœuds

# text
seg-cfbac004ff64 = positionnement par réseau non terrestre (NTN) selon la largeur de bande du signal de référence

# text
# c1: leo-ppp
seg-07e8765975d1 = balayage de <c1/>, { "3" } nœuds

# text
seg-db872d35033e = convergence du positionnement précis par point (PPP) selon l'altitude d'une couche LEO de 192 satellites

# text
seg-a4ec677dc4e6 = chaîne, { "3" } phases sur { "2100" } s

# text
seg-2d91ecf8455d = Global Navigation Satellite System (GNSS) brouillé, la couche LEO porte l'utilisateur, intégrité maintenue

# text
# c1: spectrum
seg-c44991a2a24e = balayage de <c1/>, { "13" } nœuds

# text
seg-4b6e292d88f5 = diversité de bandes LEO face à un brouilleur à barrage en bande L

# text
seg-30d86b528bee = les moniteurs de leurrage face à quatre leurreurs

# text
seg-1690baf3a1b8 = chaîne, { "1" } phase sur { "86 400" } s

# text
seg-4d5b507c04de = synchronisation temporelle de stations de base 5G : holdover et temps LEO

# text
seg-d32a80c40470 = chaîne, { "3" } phases sur { "1440" } s

# text
seg-c38f9d3bd54e = suivi de conteneurs avec UHF LEO : énergie par position le long d'un trajet

# text
seg-9bf38e403696 = chaîne, { "2" } phases sur { "1500" } s

# text
seg-dea7117552f4 = un véhicule autonome dans un canyon urbain avec une couche LEO

# text
seg-dbbd9ffcbfb4 = chaîne, { "2" } phases sur { "1800" } s

# text
# c1: city-street
seg-37c0c3570023 = le même canyon urbain avec un angle de coupure plat de { "35" } deg et avec un horizon <c1/>

# text
seg-ccaa34122145 = chaîne, { "2" } phases sur { "87 000" } s

# text
seg-d16d8b2e9089 = synchronisation temporelle d'infrastructures critiques : holdover avec temps LEO

# text
seg-4ee0b3036f4a = chaîne, { "3" } phases sur { "10 800" } s

# text
seg-157c5bec7f5f = utilisateurs polaires et arctiques avec une couche LEO polaire

# text
seg-64404160d0e7 = chaîne, { "3" } phases sur { "2520" } s

# text
seg-a35e1603ba32 = utilisateurs ferroviaires et maritimes avec une couche LEO

# text
seg-3d819fa3fd1c = MEO désigne l'orbite terrestre moyenne, UHF les ultra hautes fréquences et 5G la cinquième génération de réseaux mobiles.

# text
seg-490920844143 = Ce qui est vérifié

# text
# c1: tests/campaign_composition_reference.rs
seg-483b1d4efb20 = <c1/> fixe les identités de composition :

# text
# c1: clock
# c2: integrity
# c3: jamming
# c4: run_toml
seg-881d97a3fa2b = <b>Une campagne à une phase reproduit bit à bit l'exécution autonome.</b> Pour <c1/>, <c2/> et <c3/>, le document de résultats du membre est identique octet pour octet à <c4/> sur le fichier de scénario, son empreinte est celle que rapporte la campagne et, avec la grille au pas propre de l'exécution, chaque valeur alignée est égale à la valeur de la série autonome (le C/N0 de brouillage est égal à la moyenne calculée indépendamment à partir du document autonome).

# text
seg-1a9e1ed5b18c = <b>Un balayage à un nœud et une composition à un membre</b> relisent exactement le nombre de l'exécution autonome.

# text
# c1: k
# c2: seed + k
seg-883bb72e1239 = <b>Un ensemble à graine fixe est stable octet pour octet</b>, et la réalisation <c1/> est exactement l'exécution autonome à <c2/> ; le hachage de la campagne ignore l'ordre des clés.

# text
seg-170bc86059fa = Un cas analytique.

# text
# c1: scenarios/campaign-monte-carlo-clock-holdover.toml
seg-0fd27291d6f4 = <c1/> exécute { "200" } graines d'une horloge atomique à puce avec du seul bruit blanc de fréquence (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synchronisée à { "590" } s et en roue libre jusqu'à { "3600" } s. L'erreur de temps finale est gaussienne, de moyenne { "0" } et d'écart type sqrt(q_wf * { "3010" } s) = { "16.459" } ns (la marche aléatoire de la phase sous bruit blanc de fréquence, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). L'intervalle rapporté, [-2.52, { "1.59" }] ns, contient la vraie moyenne { "0" } ; l'écart type de l'échantillon, { "14.93" } ns, donne une statistique du khi-deux de { "164.5" } sur { "199" } degrés de liberté, à l'intérieur de l'intervalle bilatéral à { "99" } % [{ "151.37" }, { "254.14" }]. Avec { "3000" } graines, le même scénario donne { "16.31" } ns.

# text
seg-61b54a16243f = <b>La chaîne pilotée par le spectre</b> relit les nombres autonomes : la phase de début dure exactement le temps de première perte de l'exécution spectre, et chaque valeur L1 C/A et E1 de la chronologie est égale, à { "1e-9" } dB près, à la ligne de l'exemple autonome de cascade pour le même état de brouilleur (nominal, chirp seul, tonalité CW seule).

# text
seg-5ebc02a24ce1 = <b>La chaîne</b> transmet l'état comme documenté : la phase de leurrage dure exactement le temps de détection de l'exécution de leurrage, le holdover reporte exactement le décalage de l'exécution de leurrage à la détection, la récupération ne reporte rien, et l'alarme est active partout où le niveau de protection est absent ou dépasse la limite d'alerte.

# text
seg-153e28bcb38a = Ces contrôles vérifient que la composition ne change rien de ce qu'elle ne devrait pas changer. Ils ne valident pas une mission enchaînée par rapport à une mission mesurée, ce qui explique que les trois lignes de campagne de <a1>VERIFICATION-MATRIX.md</a1> soient MODELLED.

# text
seg-e82860f2d902 = <s1>Précédent</s1>Utiliser de vrais TLE

# text
seg-e40757a0b4cb = <s1>Suivant</s1>Rapports d'exécution

# text
seg-e65edbaca6bf = [[phases]] : une mission enchaînée sur une seule chronologie

# text
seg-a433ddf74e55 = [sweep] : une grille de paramètres sur n'importe quel type

# text
seg-7ca90ac531bf = [monte_carlo] : un ensemble à graine

# text
seg-03d764a4cb56 = [compose] : plusieurs scénarios sous des conditions partagées

# text
seg-61a0db2550ba = [optimize] : la meilleure valeur d'une métrique
