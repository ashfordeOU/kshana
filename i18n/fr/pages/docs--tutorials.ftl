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
