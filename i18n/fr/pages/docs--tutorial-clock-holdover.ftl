# docs--tutorial-clock-holdover: translations (fr)

# text
# c1: docs/tutorials/02-clock-holdover.md
seg-b59f529012a6 = Source : <c1/>

# text
seg-e66a5042182e = Tutoriel { "2" } — Holdover d'horloge : combien de temps pouvez-vous tenir en roue libre

# text
# c1: clock
# c2: scenarios/clock-holdover.toml
# c3: scenarios/clock.toml
seg-889112bc4c09 = <c1/> · <b>Scénario :</b> <c2/> (copie pédagogique : <a1><c3/></a1>) · <b>Difficulté :</b> débutant · <b>~{ "20" } min</b>

# text
seg-a4bdf55d96be = À la fin, vous aurez exécuté un holdover d'horloge avec les signaux GNSS (Global Navigation Satellite System) refusés, lu la figure de mérite de synchronisation temporelle, et compris la loi de dérive √(q_wf·T) qui explique <em>pourquoi</em> l'horloge optique tient plus longtemps que l'horloge à puce, avec une loi tirée du NIST (l'Institut national américain des normes et de la technologie), et non inventée.

# text
seg-51ae9468b92a = Ce qu'est ce scénario

# text
seg-87334505b228 = Quand les signaux GNSS disparaissent, un système garde l'heure avec sa propre horloge embarquée. La phase de cette horloge dérive lentement, et dès que la dérive dépasse la spécification de synchronisation temporelle opérationnelle, vous êtes hors service. Le <b>holdover</b> est la durée pendant laquelle vous restez dans la spécification après la perte du GNSS — la figure de mérite d'autonomie par excellence.

# text
seg-798ac031b5c6 = Le scénario exécute une chronologie de { "2" } h : { "10" } min de synchronisation GNSS, puis { "6600" } s ({ "1.83" } h) de refus, par rapport à une spécification de synchronisation de { "20" } ns, échantillonnée toutes les { "10" } s. Il compare deux horloges avec un code identique et leur bruit <em>propre</em> publié :

# text
seg-3d53622dbe12 = <b>Quantique</b> : une horloge optique à réseau de strontium, objectif spatial σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), une cible de démonstrateur au sol, jamais embarquée en vol. σ_y(τ) est l'écart type d'Allan, la mesure standard de la stabilité en fréquence d'une horloge à un temps de moyennage τ.

# text
seg-e25af6d0752f = <b>Classique</b> : une horloge atomique à puce (CSAC) Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (fiche technique) — un composant commercial déployé.

# text
seg-08f3fdc9252a = Lire le résumé d'une ligne

# text
seg-baa0cc808987 = Avec seed = { "42" }, la spécification de { "20" } ns et la panne de { "6600" } s :

# text
# c1: quantum holdover 6600s
seg-76f7739f8b17 = <b><c1/></b> — l'horloge optique tient toute la panne de { "6600" } s sans dépasser { "20" } ns. Son erreur de phase au 95e centile est de { "1.20e-4" } ns, environ un dix-millième de nanoseconde : elle bouge à peine.

# text
# c1: classical holdover 2610s
seg-0ba48fccffae = <b><c1/></b> — la CSAC dépasse la spécification de { "20" } ns à ~{ "2610" } s, soit moins de la moitié de la panne. Son erreur de phase p95 ({ "19.7" } ns) se situe juste sur la ligne de la spécification.

# text
# c1: security n/a (no attack)
# c2: fom.security
# c3: applicable: false
# c4: figure_tiers
seg-b745d05e2bf1 = <b><c1/></b> — ce scénario ne configure aucune attaque, il n'y a donc rien à détecter et le résumé n'affiche aucun nombre. Le JSON porte néanmoins la borne analytique de détectabilité du leurrage de chaque horloge dans <c2/> ({ "0.997" } pour l'horloge optique ; { "0.000" } pour la CSAC, dont le propre bruit de marche libre sur la fenêtre dépasse déjà { "20" } ns), marquée <c3/> dans le bloc <c4/>. Évaluer la détection face à une véritable attaque est l'objet du <a1>Tutoriel { "3" }</a1>.

# text
# c1: integrity 1.000
# c2: docs/INTEGRITY.md
seg-510e1cd8ed40 = <b><c1/></b> — il s'agit ici d'une <em>auto-cohérence du filtre</em> (la fraction des échantillons de la panne situés dans la borne k-sigma propre au filtre de Kalman), et <b>non</b> d'un niveau de protection horizontal ou vertical aéronautique (HPL/VPL). Voir <a1><c2/></a1>.

# text
seg-7cc0ba5e5d13 = La référence indépendante non circulaire : pourquoi { "2610" } s pour la CSAC ?

# text
# c1: q_wf = σ_y(1 s)²
# c2: tests/calibration.rs
seg-2958401e00ca = Pour une horloge à modulation de fréquence blanche (white-FM), l'erreur de phase à 1 σ croît comme <b>σ_x(T) ≈ √(q_wf · T)</b>, où <c1/> a pour unité s². Cette relation provient de la <b>publication spéciale NIST { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — les relations σ_y(τ)↔phase — la <em>même</em> relation SP-1065 par rapport à laquelle <c2/> valide l'écart type d'Allan du moteur à ~{ "2" } % près.

# text
# c1: q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²
seg-d6c8f68b42b9 = Pour la CSAC, <c1/>. Résolvons pour le temps où la phase à 1 σ atteint { "20" } ns = { "2" }×{ "10" }⁻⁸ s :

# text
# c1: holdover_s
# c2: step_s = 10
# c3: src/fom.rs
seg-0f28d1a1163f = Les { "2610" } s du moteur ne sont pas ce temps à 1 σ, et ne doivent pas l'être. <c1/> est le premier point de la grille de { "10" } s (<c2/>) auquel l'erreur de phase absolue de <em>cette réalisation à graine fixée</em> dépasse { "20" } ns (<c3/>). Le premier franchissement d'un niveau par une marche aléatoire survient souvent bien avant l'instant où son enveloppe à 1 σ atteint ce niveau, et la réalisation porte aussi l'erreur de fréquence résiduelle que le filtre conserve après les { "600" } s de synchronisation. La loi fixe donc l'échelle, quelques milliers de secondes pour une horloge de { "3" }×{ "10" }⁻¹⁰ face à { "20" } ns, et non la valeur exacte. Le test vérifie une <b>bande de { "2000" } à { "3200" } s</b> autour de celle-ci, et non le nombre.

# text
# c1: provenance
# c2: adev_curve
# c3: tests/calibration.rs
seg-2e7cbdefa9b7 = Les ancrages de la fiche technique sont eux-mêmes externes, cités dans les chaînes <c1/> du scénario : objectif du réseau optique Sr { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }) ; CSAC Microchip SA.45s { "3" }×{ "10" }⁻¹⁰ (fiche technique). Et la courbe <c2/> exportée correspond au σ_y(τ) de la fiche technique à ~{ "2" } % près (<c3/>, NIST SP { "1065" }). Tracez-la sous forme de graphique log-log « Stabilité de l'horloge (ADEV, écart type d'Allan) » dans le playground.

# text
seg-def5271a207d = Ce que le test fixe

# text
# c1: quantum holdover >= classical holdover
seg-ebddc1f5ffe2 = <c1/> (l'horloge optique doit tenir au moins aussi longtemps),

# text
# c1: quantum holdover ≈ 6600 s
seg-8e570268f107 = <c1/> (tient toute la panne),

# text
# c1: classical holdover ∈ [2000, 3200] s
seg-d60483c1af2e = <c1/> — une bande de tolérance autour de l'échelle white-FM de la SP-1065, <em>et non</em> un nombre magique. La référence indépendante est la loi, pas la valeur.

# text
seg-e5f926d1055b = Pièges et unités

# text
seg-0f57e35ed833 = <b>Les figures de synchronisation temporelle sont en nanosecondes</b>, jamais en mètres. (Le holdover de position est un paquet <em>différent</em> — voir la section inertielle du Tutoriel { "3" }.)

# text
# c1: q_wf
seg-2e476b213141 = <b><c1/> a pour unité s² et vaut σ_y({ "1" } s)².</b> C'est le pont entre un nombre d'Allan de fiche technique et le modèle.

# text
# c1: step_s
seg-75951a150b44 = <b>Le holdover est une borne inférieure quantifiée par la grille</b> (<c1/>). Ne surinterprétez pas la valeur exacte ; lisez la <em>bande</em>.

# text
# c1: integrity
seg-959eb86066f1 = <c1/> désigne ici l'auto-cohérence du filtre, et non l'intégrité aéronautique.

# text
seg-cb457294fc53 = Pour aller plus loin

# text
# c1: threshold_ns
# c2: exercises/tier2_sweep.py
# c3: kind = "sweep"
# c4: classical_q_wf
# c5: scenarios/sweep-clock-stability.toml
seg-aa3e50f2c699 = <b>Niveau { "2" } :</b> resserrez <c1/> de { "20" } à { "10" } et observez le holdover de la CSAC <em>chuter</em> ({ "2610" } s → { "1300" } s, mesuré avec <c2/>), ou utilisez <c3/> pour tabuler le holdover en fonction du niveau de bruit de la CSAC <c4/> (<c5/> : { "25" } points de { "10" }⁻²⁴ à { "10" }⁻¹⁸ s², holdover classique { "2610" } s → { "250" } s).

# text
# c1: runs = 200
# c2: scenarios/clock-ensemble.toml
# c3: classical holdover 844s [220-2130]
seg-cb31f104d104 = <b>Niveau { "3" } :</b> ajoutez <c1/> pour en faire un ensemble Monte-Carlo et lisez la bande de holdover [p05–p95] (<c2/> affiche <c3/>).

# text
seg-9cb56e10f0fd = Puis l'aboutissement : <a1>Tutoriel { "3" } — Résilience quantique contre classique</a1>.

# text
seg-7dc19a98c7ee = <s1>Précédent</s1>{ "1" } · Ma première orbite

# text
seg-c274e92fdcb5 = <s1>Suivant</s1>{ "3" } · Quantique contre classique
