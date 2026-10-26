# docs--tutorial-quantum-vs-classical: translations (fr)

# text
seg-501d3a72ea43 = Intégrité

# text
seg-8980b5ae869b = Chiffre

# text
seg-e5f926d1055b = Pièges et unités

# text
seg-cb457294fc53 = Pour aller plus loin

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Source : <c1/>

# text
seg-0c2365600795 = Tutoriel { "3" } — Résilience GNSS quantique contre classique (aboutissement)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Scénarios :</b> <c3/>, <c4/> (copies pédagogiques : <a1><c5/></a1>, <a2><c6/></a2>) · <b>Difficulté :</b> intermédiaire · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = L'aboutissement. Vous allez exécuter un scénario de détecteur de leurrage et une suite complète fusionnée de positionnement, navigation et synchronisation temporelle (PNT), et apprendre à lire ensemble la <b>sécurité</b>, l'<b>intégrité</b> et l'<b>estime</b> — toute la thèse : l'inertiel quantique et la synchronisation temporelle optique procurent une résilience que le refus du GNSS (Global Navigation Satellite System) retirerait autrement.

# text
seg-ffa5242638c2 = Partie A — Sécurité : détecter un leurrage temporel

# text
# c1: 1 − P_md
seg-23c18da1415f = Un attaquant injecte un faux temps GNSS à rampe lente ({ "0.1" } ns/s, à partir de t = { "60" } s). Le récepteur recoupe le temps affirmé avec la prédiction de marche libre de sa propre horloge et signale le leurrage lorsque l'écart dépasse la borne de détection. Le détecteur est un <b>test d'énergie χ²₁ / de Neyman–Pearson</b> bilatéral à une probabilité de fausse alarme P_fa = { "0.01" } ; la figure de mérite de sécurité est <b><c1/></b> (un moins la probabilité de non-détection) pour une amplitude de leurrage correspondant à la spécification ({ "20" } ns).

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Quantique : <c1/>, détecté à { "70" } s.</b> Le seuil de détection de l'horloge optique est une fraction de nanoseconde ; elle signale donc le leurrage presque immédiatement — bien en deçà de la spécification de { "20" } ns.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Classique : <c1/>, détecté à { "430" } s.</b> Le bruit de marche libre propre à l'horloge atomique à puce (CSAC) sur la fenêtre est comparable à { "20" } ns ; elle ne peut donc souvent pas distinguer le leurrage de sa propre dérive — elle le manque { "44" } % du temps.

# text
seg-27b2b715efcb = La référence indépendante non circulaire : P_md analytique contre Monte-Carlo

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = La probabilité de non-détection du détecteur est calculée de <b>deux façons indépendantes</b> qui doivent concorder : une <b>queue de χ²₁ sous forme fermée</b> (le résultat de Neyman–Pearson) et une estimation <b>Monte-Carlo</b> (MC). Pour la CSAC, le P_md analytique est <c1/> et le P_md MC est <c2/> — ils concordent à { "0.002" } près, bien à l'intérieur de l'erreur d'échantillonnage <c3/>. Pour l'horloge optique, les deux valent { "0.000" }. Deux calculs distincts de la <em>même</em> probabilité qui concordent constituent le recoupement non circulaire (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em> ; détection NP / χ² standard). <c4/> vérifie <c5/> pour les deux horloges ainsi que <c6/>.

# text
seg-5cf0d909bac7 = Partie B — PNT hybride : la suite fusionnée complète

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Le scénario d'aboutissement fusionne maintenant une horloge optique et une centrale inertielle (IMU) à atomes froids (suite quantique) face à une CSAC et une IMU de qualité navigation (suite classique), à travers la même panne GNSS de { "6600" } s ({ "1.83" } h), face à une spécification de synchronisation temporelle de { "20" } ns et à une spécification de position de { "100" } m. Les deux suites recalent leurs horloges toutes les { "60" } s sur la même liaison optique de transfert de temps inter-satellites, modélisée avec une gigue de { "1" } ps par recalage (<c1/> dans le scénario ; <c2/> construit une liaison <c3/> pour l'une ou l'autre suite).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Lisez la répartition <c1/> — holdover de synchronisation temporelle contre holdover de position :

# text
seg-dee5b1a35bdd = <b>Quantique : PNT-holdover { "6600" } s</b> — tient à la fois la synchronisation temporelle (t { "6600" } s) et la position (p { "6600" } s) pendant toute la panne.

# text
seg-6441dfa026dc = <b>Classique : PNT-holdover { "350" } s</b> — la <em>synchronisation temporelle</em> tient les { "6600" } s complètes (t { "6600" } s), parce que le recalage par transfert de temps optique garde verrouillée même l'<em>horloge classique</em>. La suite est <b>limitée en position à p { "350" } s</b> : l'IMU de qualité navigation est le maillon faible. C'est la thèse de la fusion — isoler la défaillance de la suite classique sur son capteur inertiel.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> pour la suite quantique est réel et n'est pas un bogue.</b> C'est l'auto-cohérence du filtre sur un recalage bruité — <b>et non</b> une figure d'intégrité aéronautique (niveau de protection horizontal ou vertical, HPL/VPL). Ne surinterprétez pas ici le mot « intégrité » ; voir <a1><c2/></a1>.

# text
seg-587efcdcbc13 = La référence indépendante non circulaire : le holdover de position de { "350" } s

# text
# c1: b
seg-a70ad8fc122f = Le chiffre de { "350" } s relève de la physique de l'estime, et non d'un nombre ajusté. Un biais d'accéléromètre constant <c1/> fait croître l'erreur de position comme <b>½·b·T²</b>. Franchissement de la spécification de { "100" } m :

# text
# c1: q_va
seg-778e817e3e9b = Le moteur indique { "350" } s, le dernier point de la grille de { "10" } s avant son franchissement et { "2" } % en deçà des { "357" } s dus au seul biais : les accéléromètres du scénario portent aussi un bruit de marche aléatoire de vitesse (<c1/>), qui s'ajoute à la dérive du biais, de sorte que l'erreur modélisée atteint { "100" } m un peu plus tôt.

# text
seg-e105a8ab605b = Loi de référence : Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2e éd.), croissance de l'erreur d'estime. Ces deux valeurs de ½bT² rendent compte de la répartition { "350" } s / { "6600" } s du moteur : un contrôle physique en forme fermée, externe au filtre.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Vous pouvez voir directement le maillon faible inertiel dans le scénario d'estime (<a1><c1/></a1>, type de scénario <c2/>) : <c3/> : le capteur de qualité navigation diverge jusqu'à des dizaines de kilomètres.

# text
seg-6c688f2e7136 = Comment lire ensemble les trois figures

# text
seg-4f1a49d61cee = Ce que cela signifie ici

# text
seg-2e91989b1a89 = Ce que cela ne signifie <b>pas</b>

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = borne analytique de <em>détectabilité</em> du leurrage (<c1/>) pour une attaque configurée ; le résumé <c2/> affiche <c3/> parce que ce scénario n'en configure aucune

# text
seg-e04c25dd278d = pas un détecteur RAIM multi-satellites (receiver autonomous integrity monitoring)

# text
seg-7e678dd4409e = auto-cohérence du filtre (échantillons à l'intérieur de la borne k-σ)

# text
seg-1643e7e71209 = pas une intégrité aéronautique HPL/VPL/RAIM

# text
seg-4095f7ab4b14 = temps dans la spécification après la perte du GNSS, réparti entre synchronisation temporelle et position

# text
seg-5b90536cdfd5 = pas une précision CEP (circular error probable) ou 2DRMS (twice the distance root mean square) en 2D

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = La véritable intégrité autonome du récepteur — de vrais HPL/VPL avec limites d'alerte et un diagramme de Stanford — se trouve dans le paquet <c1/> (<a1><c2/></a1>) ; c'est l'exercice de lecture de niveau 3.

# text
seg-28cddec341ed = Ce que les tests fixent

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/> — le P_md analytique et le P_md MC concordent à moins de { "0.05" } pour les deux horloges ; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = Le résumé hybride ({ "6600" } s / { "350" } s) et la répartition inertielle sont fixés au moyen de leurs scénarios pédagogiques (<a1><c1/></a1>, <a2><c2/></a2>) par <c3/>, qui compare le résumé de chaque moteur à la ligne <c4/> que consigne le fichier. La référence indépendante ½bT² ci-dessus est le contrôle physique de ces nombres.

# text
seg-a4371822e379 = <b>La figure de mérite (FoM) de synchronisation temporelle est en nanosecondes ; la FoM de position est en mètres et à 1 DDL</b> (un degré de liberté : un seul axe, ni CEP ni 2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> est de l'auto-cohérence, et non de l'intégrité aéronautique.

# text
# c1: (t …/p …)
seg-87c49084032c = La <em>synchronisation temporelle</em> de la suite classique ne survit que grâce au recalage par transfert de temps optique ; lisez la répartition <c1/>, pas seulement le PNT-holdover affiché en tête.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Exécutez le cas d'échec assumé : <c1/> (type de scénario <c2/>) rapporte un passage ARAIM (advanced RAIM) au pôle sud où les niveaux de protection <em>dépassent</em> la limite d'alerte (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } époque disponible sur { "24" }), si bien que le système est déclaré <b>indisponible</b> : c'est une fonctionnalité, pas un bogue.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Portez le récit en orbite terrestre basse (LEO) : <c1/> (type de scénario <c2/>) enchaîne sur une seule chronologie une phase de brouillage du GNSS, une couche de positionnement LEO qui porte l'utilisateur à travers cette phase, et un contrôle d'intégrité. Voir <a1>les capacités plus récentes</a1> pour les autres scénarios de résilience et verticaux.

# text
seg-063422d3c70b = Défendre un résultat : faites l'<a1>exercice de niveau 3</a1> — bandes Monte-Carlo, reproductibilité et lecture d'un niveau de protection.

# text
seg-4f7275a21f44 = <s1>Précédent</s1>{ "2" } · Holdover d'horloge

# text
seg-8b0c90f82aab = <s1>Suivant</s1>Exemple détaillé : pipeline multi-outils
