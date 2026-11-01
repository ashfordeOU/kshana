# docs--tutorials: translations (fr)

# text
seg-501402fc366f = Holdover d'horloge

# text
seg-cae10fb9bff8 = Scénario

# text
seg-a0b63210b807 = En savoir plus

# text
seg-a7cfe6f135f1 = Orbite et géométrie

# text
seg-835df2d05f2a = Domaine de mesure GNSS

# text
seg-3a0e724a8a2b = Niveau

# text
seg-28e87f407a10 = Domaine

# text
seg-d6476863f862 = Capacité

# text
seg-029de6b99be0 = Navigation à l'estime inertielle

# text
seg-9ef8f99ca6e4 = Transfert de temps

# text
seg-b03d56f501c3 = Type

# text
seg-ec26df467b88 = PNT par fusion de capteurs à filtre de Kalman conjoint sur les mêmes entrées hybrides.

# text
seg-4f19d4fb1341 = Balayage N-D générique sur n'importe quel paquet via des clés TOML pointées / des chemins de métriques JSON.

# text
seg-e7ab7b55c969 = Balayage 1-D d'étude de compromis sur un paramètre du paquet d'horloge.

# text
seg-e43910de5fd8 = Notebooks

# text
# c1: docs/tutorials/README.md
seg-3959aefa12be = Source : <c1/>

# text
# c1: tests/tutorials.rs
seg-a5ebe4befda8 = Des exemples détaillés et pratiques qui vous mènent de « exécuter un scénario fourni » à « quantifier et défendre un résultat ». Chaque nombre cité dans les trois tutoriels est une véritable sortie du moteur, ancré sur une référence indépendante faisant autorité, externe (non circulaire), et <b>fixé par un test d'intégration</b> (<c1/>), de sorte qu'un tutoriel ne peut jamais s'écarter silencieusement de ce que fait réellement le moteur. Si un tutoriel dit que l'horloge optique tient { "6600" } s, le test fait échouer la construction le jour où cela cesse d'être vrai.

# text
seg-1c045624a6be = Kshana est un simulateur de positionnement, navigation et synchronisation temporelle (PNT). Les tutoriels utilisent quelques abréviations supplémentaires, chacune développée à sa première apparition : GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (interface en ligne de commande) et TOML (Tom's Obvious Minimal Language, le format des fichiers de scénario).

# text
seg-7a84a80b57d5 = Vous découvrez le projet ? Lisez d'abord l'<a1>introduction aux concepts</a1> et le <a2>glossaire</a2>, puis revenez ici.

# text
seg-b4cd44590347 = Les trois exemples détaillés

# text
seg-eebeab9693b2 = Tutoriel

# text
seg-a0bc6e585d71 = Ce que vous apprenez

# text
seg-b6cc01b76947 = Type de scénario

# text
seg-429bab0a0e05 = Difficulté

# text
seg-0e188f9c0f65 = ~Durée

# text
seg-bcf40448e55d = Ma première orbite : où sont les satellites GPS

# text
seg-de1032024a69 = propager une véritable constellation GPS, lire la disponibilité, la dilution de la précision en position (PDOP) et la précision de position, et exporter l'endroit où se trouvent réellement les satellites (format d'orbite précise SP3)

# text
seg-e7b6c262333e = débutant

# text
seg-d6042fb74a5f = { "15" } min

# text
seg-07a8d6cfc1ae = Holdover d'horloge : combien de temps pouvez-vous tenir en roue libre

# text
seg-0e9c77468fb2 = exécuter un holdover d'horloge sans GNSS, lire la figure de mérite de synchronisation temporelle et comprendre la loi de croissance √(q_wf·T) qui la sous-tend

# text
seg-0f6fba31626a = { "20" } min

# text
seg-7973e9c54366 = Résilience GNSS quantique contre classique

# text
# c1: spoof
# c2: hybrid
seg-4d8036091b37 = l'aboutissement : un détecteur de leurrage (<c1/>) et une suite PNT fusionnée complète (<c2/>), et comment lire ensemble sécurité / intégrité / estime

# text
seg-1b39d4927602 = intermédiaire

# text
seg-ea37ac575235 = { "35" } min

# text
# c1: notebooks/
seg-1d56222dfd25 = Des notebooks Jupyter exécutables, sur des données synthétiques et des jeux d'éléments publics conservés uniquement dans le dépôt, se trouvent dans <a1><c1/></a1> :

# text
seg-9aae3a4e10dc = Confiance du navire et entraînement

# text
seg-1d680d635c6d = générer un flux NMEA synthétique de passerelle avec un événement scénarisé, puis l'évaluer avec les moniteurs de confiance du navire (à titre consultatif, et non un équipement de navigation homologué)

# text
seg-739f8f5a9082 = où les données de navigation ont paru dégradées, et quelle part d'un itinéraire elles touchent

# text
seg-443c908ff49b = Cartographie de compliance et export pour test bench

# text
seg-0d639065192a = les lignes de cadres publics en faveur desquelles un ensemble d'exécutions apporte des éléments de preuve (jamais qu'un cadre est satisfait), et le mouvement et les événements d'un scénario exportés sous forme de texte pour un simulateur GNSS de laboratoire (aucun signal n'est écrit)

# text
seg-981a3238794d = GDOP quantique contre classique

# text
seg-228ce150ee80 = la même géométrie de constellation avec un capteur quantique et un capteur classique, comparés par la dilution de la précision

# text
seg-4b82b5edd4ff = Géométrie du ciel sous une ligne d'horizon

# text
seg-1186b6cd6149 = les satellites qu'un site voit sous une ligne d'horizon de rue ou de quai, leur DOP et leur ellipse d'erreur, un ciel daté à partir d'éléments orbitaux et un Monte-Carlo à graine fixée par rapport à la covariance (MODELLED)

# text
seg-d9d06cb8e237 = Comment exécuter un tutoriel

# text
seg-ffc4ddfc9426 = Chaque tutoriel exécute le même scénario de trois façons ; choisissez celle qui vous convient. Toutes appellent <em>un seul</em> moteur, de sorte que les nombres sont identiques (reprend la section <a1>Utilisation</a1> du README).

# text
# c1: kind
# c2: <scenario>.result.json
# c3: <scenario>.chart.svg
# c4: <scenario>.report.html
# c5: <scenario>.report.json
# c6: <scenario>.table.csv
# c7: realtime-frame-eop
# c8: lunar-time-budget
# c9: lunar-jamming
# c10: leo-navmsg
# c11: telecom-timing
# c12: moonlight-service-volume
seg-e7ba76a06aa6 = <b>Ligne de commande.</b> La CLI aiguille selon le champ <c1/> du scénario et écrit <c2/>, <c3/>, <c4/> et <c5/> à côté de l'entrée (JSON est JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Quelques types de scénario publient aussi un tableau de reproductibilité sous la forme <c6/> (valeurs séparées par des virgules) : <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, et <c12/> lorsqu'un site d'export est défini. Aucun des trois tutoriels n'en fait partie ; vous ne verrez donc pas ce fichier ici.

# text
# c1: cargo run --
# c2: cargo install kshana
# c3: kshana scenarios/orbit-sgp4-gps.toml
# c4: kshana example
# c5: kshana example orbit-sgp4-gps > orbit-sgp4-gps.toml
# c6: scenarios/orbit-sgp4-gps.toml
seg-5ee6f15d3b08 = <c1/> compile la CLI à partir de ce dépôt cloné. Avec un binaire installé (<c2/>), la même commande est <c3/>. Sans dépôt cloné, la plupart des scénarios fournis sont intégrés au binaire : <c4/> les liste (et nomme les quelques-uns qui ne le sont pas, avec la raison), et <c5/> en écrit un : la copie de <c6/> avec laquelle le binaire a été construit.

# text
# c1: kshana.run
seg-1b7e851749d5 = <b>Python.</b> Compilez une fois l'extension à partir de ce dépôt cloné avec maturin, dans un environnement virtuel actif, puis appelez <c1/> :

# text
# c1: pip install kshana
# c2: json.loads(kshana.list_kinds())
seg-3aa10d551694 = <c1/> installe à la place la wheel publiée. Elle peut être en retard sur ce dépôt cloné : <c2/> vous indique quels types de scénario votre version contient.

# text
seg-333b7956b06b = <b>Playground dans le navigateur.</b> Aucune installation : ouvrez le <a1>Studio</a1>, choisissez un scénario, modifiez les paramètres et lisez le résultat. Rien n'est téléversé ; le moteur s'exécute côté client sous forme de WebAssembly.

# text
# c1: scenario + seed + engine version
seg-2cd8bbd1e7f0 = Les tutoriels citent la <b>CLI</b>, mais chaque commande a son équivalent Python et playground ci-dessus. Chaque résultat est reproductible à partir de <c1/> : exécutez-le deux fois et vous obtenez une sortie identique au bit près.

# text
seg-d497caeb889a = Scénarios pédagogiques annotés

# text
# c1: .toml
# c2: scenarios/
# c3: # expected:
# c4: scenarios/
# c5: tests/tutorials.rs
seg-c966709a600d = Pour chaque domaine de capacité, il existe un <c1/> abondamment commenté sous <a1><c2/></a1> : une <em>copie pédagogique</em> d'un scénario canonique avec chaque champ expliqué en ligne, la référence indépendante citée nommée, et le résumé attendu d'une ligne consigné dans un commentaire <c3/>. Les valeurs des champs sont identiques à celles du parent dans le répertoire <c4/> de premier niveau du dépôt (<c5/> compare le TOML analysé), de sorte que la sortie documentée reste exacte. Les empreintes de référence ne sont pas touchées non plus : un commentaire ne change jamais l'empreinte d'un scénario.

# text
seg-d78822583c64 = Notebook

# text
seg-871fcecc5ee1 = Fichier pédagogique

# text
seg-4e852a6a1581 = Issu de

# text
seg-e74e1c9b387e = Intégrité (RAIM, surveillance autonome de l'intégrité par le récepteur)

# text
seg-95b6cceb76e6 = Sécurité (leurrage)

# text
seg-dab48471c270 = PNT hybride

# text
# c1: kind = "spoof"
# c2: 1 − P_md
# c3: kind
seg-c889e5e77121 = Le fichier pédagogique pour la <b>sécurité</b> utilise <c1/> en interne : la figure de mérite de sécurité (<c2/>, un moins la probabilité de non-détection) est produite par le paquet spoof. Le nom du fichier suit la <em>capacité</em> (sécurité), alors que <c3/> suit le <em>paquet</em> (spoof). L'en-tête de ce fichier le signale.

# text
seg-89fef83a9d54 = Le catalogue complet des types de scénario

# text
# c1: runs > 1
seg-0f744a3a7193 = Holdover d'horloge par rapport à la spécification ; ensemble Monte-Carlo facultatif (<c1/>).

# text
seg-9a2564fdc86a = Navigation à l'estime inertielle à 1 DDL (un degré de liberté) pendant une interruption du GNSS.

# text
seg-62f0400581b3 = Disponibilité du GNSS + dilution de précision (DOP) à partir d'une constellation (Walker / éléments à deux lignes / RINEX, le format Receiver Independent Exchange).

# text
seg-59fc8330ba12 = Instantané / séparation des solutions / ARAIM (RAIM avancé) avec niveaux de protection horizontal et vertical (HPL/VPL) + diagramme de Stanford.

# text
seg-22c598d57e77 = Passage de niveau de protection ARAIM au pôle Sud lunaire par rapport à un ensemble de relais LunaNet.

# text
seg-f97d8fb3b6fa = Transfert bidirectionnel de temps/fréquence optique par rapport à radiofréquence (RF).

# text
seg-8af1c652d854 = Synthèse du PNT hybride : horloge + centrale inertielle (IMU) + aide par transfert de temps.

# text
seg-d24a9596f53e = Filtre de Kalman étendu à état d'erreur GNSS/INS (système de navigation inertielle) à couplage lâche et serré.

# text
seg-3c915870476a = Simulation de pseudodistance dans le domaine des mesures (ionosphère de Klobuchar, troposphère de Saastamoinen/Niell) + RAIM.

# text
seg-72284bad54e4 = Brouillage par bilan de liaison : rapport brouilleur/signal (J/S) → densité effective de rapport porteuse/bruit (C/N₀) → perte d'accrochage.

# text
seg-2ead4d42b427 = Détecteur stochastique de leurrage temporel (Neyman–Pearson / χ²₁) avec probabilités de fausse alarme et de non-détection par Monte-Carlo (P_fa/P_md).

# text
seg-5f2f9e63093a = Au-delà des tutoriels : les capacités plus récentes

# text
# c1: cargo run -- <file>
# c2: kshana <file>
# c3: tests/tutorials.rs
# c4: label
seg-3d6a8fd31402 = Les trois tutoriels restent sur les paquets classiques d'horloge, d'orbite et de sécurité. Le moteur est allé bien au-delà. Chaque ligne ci-dessous est un scénario livré que vous pouvez exécuter tel quel (<c1/> ou <c2/>) ; le résumé est la première ligne que kshana { "0.35.0" } a imprimée pour lui le 2026-10-10. Contrairement aux chiffres des tutoriels, ces lignes sont l'enregistrement d'une seule exécution, non figées par <c3/> : relancez le scénario pour obtenir la valeur actuelle. Les résultats indiquent leur propre portée (la plupart portent un <c4/>), et la <a1>matrice de vérification</a1> indique quelles capacités sont VALIDATED par rapport à une référence indépendante externe et lesquelles sont MODELLED.

# text
seg-2dc1d8680abb = Première ligne du résumé

# text
seg-abd799395f27 = Spectre en bande L et cascade de brouillage

# text
seg-33453b2cfdf3 = Le système solaire à une époque donnée

# text
seg-23bc4ff7f741 = Positionnement autour d'un autre corps

# text
seg-c135b151e469 = Conception de constellation à grande échelle

# text
seg-065995e9bd5e = Campagnes : types enchaînés sur une même ligne de temps

# text
seg-dbae357e7e34 = Un système LEO-PNT de bout en bout

# text
seg-9d3d72ea03df = Positionnement MEO + LEO fusionné

# text
seg-acc2793d1721 = Signaux LEO, passages et messages de navigation

# text
# c1: LEO pass link budget, air user at 50.00, -30.00; 1 LEO satellite(s), 900 s window
seg-db2626e54a24 = <c1/> (le passage)

# text
seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

# text
seg-aa93235e8c6d = Convergence PPP avec une couche LEO ; positionnement 5G

# text
seg-01160980ce50 = Résilience : GNSS brouillé, le LEO porte l'utilisateur

# text
seg-adf8453bc035 = Verticaux : ferroviaire, maritime, télécoms, véhicules, Arctique

# text
# c1: scenarios/leo-vertical-rail-maritime.toml
# c2: leo-vertical-*
seg-15a5098b5045 = <c1/> (et les autres fichiers <c2/>)

# text
seg-e6494ed83ee3 = Holdover télécoms par rapport aux limites d'horloge G.8272 de l'UIT-T (Union internationale des télécommunications, Secteur de la normalisation des télécommunications)

# text
seg-dfc04f1abe82 = LEO désigne l'orbite terrestre basse et MEO l'orbite terrestre moyenne ; PVT désigne position, vitesse et temps ; PPP désigne le positionnement précis par point ; 5G est la norme mobile de cinquième génération ; TDB est le temps dynamique barycentrique ; JD est la date julienne ; TE est l'erreur de temps.

# text
seg-1d45d94f2e5b = La CLI ajoute trois sorties à toute exécution :

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
# c3: kshana --study <suite.toml>
# c4: .study.json
# c5: .study.html
# c6: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml
seg-893276648fec = <b>Rapports.</b> Chaque exécution écrit <c1/> et <c2/> (voir <a1>REPORTS.md</a1>). <c3/> exécute une suite de scénarios dans un seul <c4/> et <c5/>, par exemple <c6/>.

# text
# c1: kshana <scenario.toml> --animate <svg|html|frames|all>
# c2: --animate html
# c3: scenarios/orbit-sgp4-gps.toml
# c4: orbit-sgp4-gps.animation.html
# c5: solar-system
seg-e9f06d47c82c = <c1/> restitue les séries temporelles de l'exécution, par exemple <c2/> sur <c3/> écrit <c4/>. Un type sans axe temporel échantillonné (tel que <c5/>) est refusé avec une erreur ; voir <a1>ANIMATION.md</a1>.

# text
seg-f037fe5d7ffa = Exports d'interopérabilité.

# text
# c1: --export <czml|kml|geojson|stk|sigmf|all|list>
# c2: --export list
# c3: spectrum
# c4: --export-sp3
# c5: --export-omm
# c6: --export-oem
seg-3977722b8517 = <c1/> écrit le résultat pour d'autres outils : CZML (Cesium Language), KML (Keyhole Markup Language, pour Google Earth), GeoJSON (JSON géographique), une éphéméride STK (Systems Tool Kit) ou un enregistrement SigMF (Signal Metadata Format). <c2/> indique quels formats s'appliquent à un scénario ; SigMF ne s'applique qu'à <c3/>. Le paquet d'orbite exporte aussi <c4/>, <c5/> et <c6/> (messages d'orbite du CCSDS, Consultative Committee for Space Data Systems). Voir <a1>INTEROP.md</a1>.

# text
seg-3abd51182cc0 = Exercices progressifs

# text
# c1: exercises/
seg-9513af4fb862 = Parcourez l'échelle. Chaque niveau est plus difficile et plus défendable que le précédent ; les solutions de référence se trouvent dans <a1><c1/></a1>.

# text
seg-89ad8eb64a54 = Objectif

# text
seg-0a824838ef57 = Ce que vous faites

# text
seg-2463a86470b8 = Solution de référence

# text
seg-7ce3ac2347b9 = Niveau { "1" } — exécuter et lire

# text
seg-e1dee35aedff = exécuter tel quel un scénario livré et lire une figure de mérite

# text
# c1: scenarios/clock-holdover.toml
# c2: holdover_s
seg-296694716b3b = Exécutez <c1/> ; affichez <c2/> quantique et classique. En CLI, dans le playground ou par un appel Python d'une ligne.

# text
seg-bad6d3afb6a0 = Niveau { "2" } — modifier et balayer

# text
seg-c18da238e470 = modifier un paramètre et observer un effet monotone

# text
# c1: threshold_ns
# c2: kind = "sweep"
# c3: "sweep-nd"
seg-598ca8efea83 = Resserrez la spécification d'horloge (<c1/>) ou allongez l'interruption et observez la baisse du holdover ; ou utilisez <c2/>/<c3/> pour la tabuler.

# text
seg-1d9dfecce6fa = Niveau { "3" } — quantifier et défendre

# text
seg-5b57f2c8ffb9 = Monte-Carlo, bandes de confiance, reproductibilité et niveau de protection

# text
# c1: runs = N
# c2: scenario_hash
seg-0fac2036b289 = Exécutez un ensemble d'horloges (<c1/>), lisez la bande [p05–p95], confirmez que deux exécutions donnent un <c2/> identique et lisez un résultat d'intégrité / de diagramme de Stanford.

# text
# c1: maturin develop --features python
# c2: tier2_sweep.py
seg-45dc753da682 = Les solutions de référence utilisent l'extension Python (d'abord <c1/>). Exécuté depuis la racine du dépôt, <c2/> affiche le holdover de l'horloge atomique à l'échelle d'une puce, qui passe de { "2610" } s pour une spécification de { "20" } ns à { "1140" } s pour { "5" } ns.

# text
seg-e59b1beadb98 = Besoin de données fraîches ?

# text
seg-530db2e609d0 = Les chiffres clés de ces tutoriels s'exécutent entièrement à partir de scénarios déjà présents dans le dépôt. Rien n'est téléchargé, ce qui les rend reproductibles et sûrs à exécuter en intégration continue (CI). Pour les exercices « pour aller plus loin », vous pouvez récupérer des données en direct :

# text
# c1: scripts/fetch_tles.sh
seg-6a20ec96cb92 = <b>Éléments à deux lignes (TLE) du GPS</b> (pour actualiser la constellation orbitale) : <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, jeux d'éléments à 3 lignes en texte brut (nom + ligne { "1" } + ligne { "2" }). Outil : <c1/>. Données ouvertes (catalogue du 18th Space Defense Squadron de l'US Space Force, redistribué par Celestrak, Dr T. S. Kelso).

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
seg-9bcea1d9eb12 = <b>Référence indépendante de vérification SGP4 (Simplified General Perturbations { "4" })</b> (déjà incluse, ne la récupérez pas à nouveau) : vecteurs de test AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 « Revisiting Spacetrack Report #3 », <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, utilisés par <c1/> ; voir <a2><c2/></a2>.

# text
seg-d33aa34b2762 = <b>Référence indépendante des relations de stabilité d'horloge</b> : NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, les relations σ_y(τ)↔phase derrière le tutoriel { "2" }.

# text
seg-36be39f17e35 = <s1>Précédent</s1>Guide du Studio

# text
seg-6f6204737a87 = <s1>Suivant</s1>{ "1" } · Votre première orbite

seg-2fa9e002b3a2 = Le moteur aiguille selon le <c1/> du scénario. Le tableau ci-dessous liste les types les plus couramment utilisés (les huit domaines des tutoriels ci-dessus et leurs voisins les plus proches). Ce n'est <b>pas</b> l'ensemble complet : <c2/> renvoie les <c3/> types intégrés. Cette fonction (exposée sous le nom <c4/> dans les liaisons Python et WebAssembly (WASM), et sous la forme <c5/> en ligne de commande) est le catalogue de référence, toujours à jour, et <a1><c6/></a1> en est l'énumération générée, une section par type avec les champs TOML obligatoires et facultatifs. <c7/> impose que chaque type documenté par un tutoriel soit un véritable type d'aiguillage ; rien dans ce tableau ne peut donc nommer un type qui n'existe pas.
