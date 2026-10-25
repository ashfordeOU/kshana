# benchmark: translations (fr)

# text
seg-0c0ce6abb920 = Mêmes journaux, mêmes règles. <s1>Des scores à découvert.</s1>

# text
seg-cb2911864ea1 = kshana-bench est un ensemble fixe de tâches, de partitions et de métriques pour la détection d'interférences GNSS et la prédiction de holdover de synchronisation temporelle, afin que des méthodes différentes puissent être comparées sur les mêmes données. Une soumission est un fichier ; rien ne s'exécute pour le compte de l'auteur de la soumission. Les références de base sont les propres moniteurs du moteur, avec des seuils consignés avant la première exécution notée.

# text
seg-11b19c2fd000 = Voir le tableau

# text
seg-b77706a0b8b5 = Lire la spécification

# attr:aria-label
seg-63a783e8fa0b = Classement

# text
seg-556a1861ad9c = Le tableau

# text
seg-64052578c384 = Fichiers de résultats, notés par le moteur.

# text
seg-0ac1117a39b8 = Classement kshana-bench

# text
# c1: kshana-bench/2.0.0
seg-b71ad83b27ad = Fichiers de résultats notés selon <c1/>. Une ligne indique que ce fichier a obtenu ce score sur cette partition. Cela ne signifie pas qu'un produit a été évalué ou approuvé par qui que ce soit, et aucune organisation n'est citée comme garante.

# text
seg-6a2052a10b6e = À titre consultatif : modélisé ou mesuré par rapport à des références indiquées, et non une approbation, une certification ni une déclaration de conformité. Un score décrit un journal ou un corpus, jamais un produit.

# text
seg-2918ee229bdd = Tâche (a) : détection sur les journaux de récepteur

# attr:aria-label
seg-7f2573819278 = Tâche (a) : détection sur les journaux de récepteur, résultats dev

# text
seg-082f44ff5710 = Partition : dev

# text
seg-46c7e6f003dd = Système

# text
seg-5aa5efd6b7da = AUC

# text
seg-dc9137d28ced = P_d au plafond de P_fa (borne supérieure)

# text
seg-75ada2743d1d = SHA-256 de la vérité terrain

# text
seg-e77eb0d4b34b = kshana receiver-trust agc_k_sigma (statistique de moniteur par défaut { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-c9d7efecc1d9 = noté

# text
seg-b47a5173a65c = kshana receiver-trust cn0_drop_db (statistique de moniteur par défaut { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# text
seg-8b5d25c24aee = kshana receiver-trust jam_ind_threshold (statistique de moniteur par défaut { "0.35" }) <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-9c794cbe6919 = Tâche (a) : détection sur les journaux de récepteur, résultats du jeu réservé

# text
seg-bf455fb5bda5 = Partition : jeu réservé

# attr:aria-label
seg-d69e976e0fa9 = Tâche (a) : détection sur les journaux de récepteur, résultats test

# text
seg-c163c8084e23 = Partition : test

# text
seg-4c475a58619d = Tâche (b) : détection sur IQ

# attr:aria-label
seg-26740783c99e = Tâche (b) : détection sur IQ, résultats test

# text
seg-6f1b3b3729bf = moniteurs kshana iq : cn0_drop (CUSUM) <s1>kshana-bench/2.0.0</s1>

# text
seg-7e2dd8e3fb49 = reporté : docs/design/DETECTION-ROC.md section { "3" } : la campagne R1 de tests/iq_campaign_roc.rs, exécutée le 2026-10-13 ; non réexécutée pour bench v1. Le seuil R1 (AUC >= { "0.95" }) n'a PAS été atteint : NOT MET.

# text
seg-e7c2cfbb1e8c = Tâche (c) : prédiction de holdover de synchronisation temporelle

# attr:aria-label
seg-9198e0e61f53 = Tâche (c) : prédiction de holdover de synchronisation temporelle, résultats dev

# text
seg-46487e0c8856 = RMSE { "3600" } s (ns)

# text
seg-6c032477c78f = RMSE { "300" } s (ns)

# text
seg-780fda205195 = RMSE { "7200" } s (ns)

# text
seg-2246c31f1782 = référence de base kshana-bench : linéaire <s1>kshana-bench/2.0.0</s1>

# text
seg-af33c581ac95 = référence de base kshana-bench : quadratique <s1>kshana-bench/2.0.0</s1>

# text
seg-d8bb527fe5be = référence de base kshana-bench : maintien <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-18fd676cd356 = Tâche (c) : prédiction de holdover de synchronisation temporelle, résultats test

# text
seg-ca13357b9f63 = Tâche (d) : écart d'optimisme hors distribution

# attr:aria-label
seg-dbbcfa3baaf4 = Tâche (d) : écart d'optimisme hors distribution, résultats dev

# text
seg-b022faebf582 = AUC dans la distribution

# text
seg-824b2aff7e8d = AUC hors distribution

# text
seg-835f66c4ee63 = Écart d'optimisme

# text
seg-fea8fb19c38c = Indicateur

# text
seg-698f3f00492d = référence de base impairment-eval : fused(max-z) <s1>kshana-bench/2.0.0</s1>

# text
seg-6320a9edbdca = dans la tolérance

# text
seg-aa7cda114a64 = référence de base impairment-eval : sqm-imbalance <s1>kshana-bench/2.0.0</s1>

# text
seg-c272e7fd6a7f = référence de base impairment-eval : agc-excess <s1>kshana-bench/2.0.0</s1>

# text
seg-02fb2080da2e = référence de base impairment-eval : raim-parity <s1>kshana-bench/2.0.0</s1>

# text
seg-00c8aea0d4fe = référence de base impairment-eval : energy(cn0-drop) <s1>kshana-bench/2.0.0</s1>

# attr:aria-label
seg-ee090c2f6612 = Tâche (d) : écart d'optimisme hors distribution, résultats test

# text
seg-88c3cc6c3800 = Chaque score est modélisé, sauf si une ligne indique qu'une référence indépendante externe l'a confirmé. Licence de la spécification et des manifestes : CC-BY-4.0 / CC0 proposée, décision du propriétaire en attente. Le jeu réservé de données réelles n'est pas secret : voir la spécification, section { "4" }.

# attr:aria-label
seg-68e7ed4fc6ee = Ce qu'une ligne peut dire

# text
seg-7912ad415e48 = Ce qu'une ligne signifie

# text
seg-7b6aa7dbc2e4 = Un score décrit un journal, pas un produit.

# text
seg-69cc3c1470b3 = Une ligne dit : ce fichier a obtenu X sur la partition S selon la version V de la spécification. Elle ne dit pas qu'un produit est certifié, conforme, approuvé ou cautionné, et aucune organisation n'est citée comme garante.

# text
seg-dd289a4fc50a = Les données sont enregistrées ou synthétiques et nommées dans la spécification. Les données de tiers ne sont jamais copiées dans le dépôt : des manifestes et des scripts de récupération identifient chaque fichier par son SHA-256, et chaque licence est consignée avant l'utilisation des données.

# text
seg-d48b2ec4cbe8 = La vérité terrain d'un journal enregistré correspond aux créneaux programmés du plan d'essai, et non aux heures d'émission effectivement enregistrées ; une probabilité de détection est donc une borne inférieure. La spécification le précise à côté de chaque tâche.

# text
seg-6883a66f3bdd = Un jeu réservé scellé n'est noté que lors d'une session de classement, et sa graine est révélée après celle-ci. Les seuils de toute référence de base qui revendique un chiffre sont fixés avant l'exécution notée et ne sont jamais assouplis par la suite ; un échec est consigné comme NOT MET.

# text
seg-97d14f361df5 = Verdicts tels que consignés dans le fichier de résultats : les seuils du noteur, C1 à C3 et D2, sont atteints ; A2 est NOT MET (AUC de agc_k_sigma { "0.766" } contre au moins { "0.80" } sur la partition test), D1 est NOT MET (écart maximal { "0.0301" }) et le R1 de la tâche (b) est NOT MET (reporté, non réexécuté). Aucun seuil n'est assoupli.

# text
seg-23023a10ef10 = À titre consultatif seulement : les résultats de Kshana sont modélisés ou mesurés par rapport à des références indiquées, et ne constituent ni une approbation ni une déclaration de conformité.

# text
# c1: kshana bench score
# c2: kshana bench leaderboard
seg-b30115d8c2eb = Exécutez-le vous-même : <c1/> transforme une soumission et la vérité terrain d'une partition en fichier de résultats ; <c2/> met en page les fichiers de résultats pour produire cette page.
