# docs--bench: translations (fr)

# text
seg-5aa5efd6b7da = AUC

# text
# c1: docs/BENCH.md
seg-5fcf52aba837 = Source : <c1/>

# text
# c1: bench/SPEC.md
# c2: bench/LICENCES.md
# c3: xval/bench/PREREGISTRATION.md
# c4: PREREGISTRATION-v2.md
# c5: xval/bench/RESULTS-v2.md
seg-d3c3517e3bb2 = Un ensemble ouvert de tâches, de découpages et de métriques pour la détection d'interférences GNSS et le holdover de synchronisation temporelle. La spécification est <a1><c1/></a1> (version { "2.0.0" } ; licence du texte et des manifestes : CC-BY-4.0 / CC0 proposée, décision du propriétaire en attente). L'examen des licences du jeu de données est <a2><c2/></a2>. Les seuils des références de base ont été fixés avant la première exécution notée dans <a3><c3/></a3> et, pour { "2.0.0" }, dans <a4><c4/></a4>, et leurs résultats figurent dans <a5><c5/></a5>.

# text
# c1: agc_k_sigma
seg-6c455061baac = Verdicts tels qu'enregistrés à cet endroit : les seuils du noteur, C1 à C3 et D2, sont atteints ; <b>A2 est NOT MET</b> (<c1/> AUC { "0.766" } contre au moins { "0.80" } sur le découpage de test), <b>D1 est NOT MET</b> (plus grand écart { "0.0301" }) et <b>la tâche (b) R1 est NOT MET</b> (reprise, non réexécutée). Aucun seuil n'est assoupli.

# text
seg-ebe1c987bc7c = Ce que c'est : un moyen de comparer des méthodes sur les mêmes données avec le même code de métrique. Ce que ce n'est pas : un classement de produits, une approbation, ni la preuve qu'une méthode fonctionne sur le terrain. Chaque score est MODELLED, et un score décrit un journal ou un corpus, jamais un produit. Les résultats de Kshana sont à titre consultatif.

# attr:alt
seg-874effe5ee80 = Les références de base intégrées de la tâche D de kshana-bench (l'écart d'optimisme) sur le découpage de test, issues d'une exécution réelle du moteur v{ $version } (`kshana bench baseline`). Chaque paire de barres est l'aire sous la courbe ROC sur les cas en distribution et sur les cas décalés ; l'écart entre les deux est l'écart d'optimisme, pour une tolérance de { "0.05" }. fused-max-z : { "0.998" } et { "0.983" } (écart { "0.015" }) ; sqm-imbalance : { "0.882" } et { "0.882" } (écart { "0.001" }) ; agc-excess : { "0.848" } et { "0.819" } (écart { "0.030" }) ; raim-parity : { "0.682" } et { "0.672" } (écart { "0.010" }) ; energy-cn0-drop : { "0.595" } et { "0.565" } (écart { "0.030" }). Les étiquettes sont des étiquettes de modèle génératif d'un corpus synthétique, jamais des données de terrain : MODELLED. À titre consultatif : modélisé ou mesuré par rapport à des références indiquées, ni une approbation, ni une certification, ni une déclaration de conformité. Un score décrit un journal ou un corpus, jamais un produit.

# text
seg-6ce7bd4525d6 = Tâches

# text
seg-09907c94f04d = Tâche

# text
seg-1c6199627b90 = Données

# text
seg-9cdfe78e3b22 = Métrique principale

# text
seg-5093217f24a1 = (a) détection sur des journaux de récepteur

# text
seg-809068c95ddf = une époque d'un journal JammerTest { "2024" }

# text
# c1: scripts/fetch_jammertest2024.sh
seg-f87dda92fbd2 = récupéré par <c1/> (GPL-3.0+, jamais intégré au dépôt)

# text
seg-9493bfc5bd64 = (b) détection sur IQ

# text
seg-8d012e25aa62 = une fenêtre notée d'une scène

# text
seg-69f020ed20da = recette de scène synthétique de Kshana ; TEXBAT en référence seulement

# text
seg-499ae444224e = AUC par type d'alarme

# text
seg-73028caefeb0 = (c) prédiction du holdover de synchronisation temporelle

# text
seg-0d0b071690cf = (satellite, origine)

# text
seg-6cf42152f523 = horloges IGS à { "300" } s (extrait versionné, empreinte épinglée)

# text
seg-74bd23dfebf5 = RMSE à { "3600" } s

# text
seg-3cc3545250e5 = (d) écart d'optimisme hors distribution

# text
seg-ab343a29b019 = un cas synthétique

# text
# c1: impairment-eval
seg-b25d781ff536 = corpus <c1/>, en distribution et hors distribution

# text
seg-e32f49d34f7b = AUC hors distribution, et l'écart

# text
seg-1ad563733f12 = Commandes

# text
# c1: kshana-bench-predictions/1
# c2: scores
# c3: predictions
# c4: kshana-bench-result/1
seg-c9d00ff2e1d0 = Une soumission est un fichier (<c1/>) : <c2/> (un nombre par identifiant de cas ; plus il est élevé, plus le cas est probablement altéré) pour les tâches a, b et d, ou <c3/> (la variation de phase en ns à chaque horizon) pour la tâche c. Un fichier de résultats (<c4/>) nomme la version de la spécification, le découpage, le SHA-256 de la vérité et des prédictions, et les métriques. Les résultats de versions majeures différentes de la spécification ne sont jamais réunis dans un même tableau.

# text
seg-bdc715c52ab5 = Limites honnêtes

# text
# c1: bench/holdout/COMMITMENTS.json
seg-f26f0e79f2ed = Les jeux réservés de données réelles (a et c) sont publics, car chacun peut télécharger les données. Ils protègent contre le choix d'un découpage après avoir vu les scores, pas contre un réglage sur ces dossiers. Le jeu réservé scellé de la tâche (d) fonctionne par engagement puis révélation : le propriétaire n'engage que l'empreinte dans <c1/> et conserve la graine (aucun n'est encore scellé).

# text
# c1: kshana jammertest score
seg-81c3f961230b = La vérité de la tâche (a) correspond aux créneaux d'attaque planifiés des journaux d'événements, à la résolution d'une minute ; une probabilité de détection est donc une borne inférieure ; les métriques au niveau des événements (latence, alarmes manquées, fausses alarmes) arrivent avec le noteur Jammertest de <c1/>.

# text
# c1: docs/design/DETECTION-ROC.md
seg-47df52b5c5e6 = La référence de base IQ de la tâche (b) est reprise de <c1/>, et non réexécutée pour la v1.

# text
seg-d54342791763 = Le corpus de la tâche (d) est un contrôle de séparabilité et de chaîne de traitement ; une AUC sur ce corpus est une AUC sur des étiquettes issues du modèle.

# text
seg-3d8bfdeead6c = <s1>Précédent</s1>Observatoire des interférences : résultats

# text
seg-07f5b51844d1 = <s1>Suivant</s1>Exécuter un récepteur contre un scénario
