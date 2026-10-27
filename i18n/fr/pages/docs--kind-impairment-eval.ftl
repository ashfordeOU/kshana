# docs--kind-impairment-eval: translations (fr)

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: docs/kinds/by-kind/impairment-eval.md
seg-2e6b437f3e99 = Source : <c1/>

# text
# c1: impairment-eval
seg-134407946837 = <c1/> (type de scénario)

# text
seg-304496607bd7 = Type de scénario du moteur v{ $version }, famille <a1>Brouillage, leurrage et spectre</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-98e740d32860 = Banc d'évaluation de la détection par apprentissage automatique des altérations RF ({ "13494" }) : générer un corpus SYNTHÉTIQUE étiqueté et fondé sur des paramètres (nominal/brouillage/leurrage en temps/leurrage en position/trajets multiples), noter un détecteur (energy|agc|sqm|parity|fused) avec le banc indépendant du détecteur, et rapporter AUC/ROC/matrice de confusion + Pd par classe à un Pfa cible, ainsi que l'écart d'optimisme entre dans la distribution et hors de la distribution. Caractéristiques de fonctionnement MODELLED seulement — jamais de données de terrain/IQ, aucun verdict bon/mauvais.

# text
# c1: scenarios/impairment-eval.toml
seg-41c3f9559282 = Une exécution de <c1/> se résume ainsi : impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-9b0d7ebaa1f0 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/impairment-eval.toml
seg-283510d17885 = L'exemple <c1/> définit, entre autres :

# text
seg-6a64be3b3f07 = fused

# text
seg-3db71c5bdd0a = auc_out uses a subtler out-of-tuning-reg

# text
seg-667d26b3a2fe = Étiquette du résultat (celle du moteur) : MODELLED — corpus synthétique fondé sur des paramètres (jamais de données de terrain/IQ) ; caractéristiques de fonctionnement seulement, aucun verdict bon/mauvais

# attr:alt
seg-7e7b07bc5545 = Le graphique que le moteur écrit pour scenarios/impairment-eval.toml, type de scénario impairment-eval

# text
seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, égalités ½), matrice de confusion au seuil, P_d/P_md/P_fa/précision/exactitude/F1 Tests : <a1>eval_metrics_reference.rs</a1>.

# text
seg-ceedc14c623a = <b>VALIDATED</b> AUC de la ROC + intervalle de confiance par bootstrap séparant de vraies anomalies étiquetées ; détecteur transparent (reproduit les étiquettes) Tests : <a1>opssat_ad_reference.rs</a1>.

# text
seg-0ee5b31cfd09 = <b>MODELLED</b> Corpus synthétique étiqueté d'altérations + banc ROC/AUC/confusion/Pfa-Pmd indépendant du détecteur ; garde-fou contre les fuites, découpage stratifié, rapport d'optimisme sur le décalage de distribution (dans le régime et hors du régime).

# text
seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, égalités ½), matrice de confusion au seuil, P_d/P_md/P_fa/précision/exactitude/F1. Référence indépendante (ExternalDataset) : scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — bibliothèque indépendante, concordance exacte

# text
seg-c719d4060e1a = <b>MODELLED</b> Corpus synthétique étiqueté d'altérations + banc ROC/AUC/confusion/Pfa-Pmd indépendant du détecteur ; garde-fou contre les fuites, découpage stratifié, décalage de distribution (dans le régime et hors du r. Référence indépendante (InternalConsistency) : bornes d'AUC en forme fermée (Mann–Whitney) + un détecteur à référence parfaite ; le corpus est SYNTHÉTIQUE (fondé sur des paramètres, pas de données de terrain/IQ)

# text
# c1: label
seg-5565108cc4d1 = MODELLED — corpus synthétique fondé sur des paramètres (jamais de données de terrain/IQ) ; caractéristiques de fonctionnement seulement, aucun verdict bon/mauvais (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-d2a9f35ea8cc = Caractéristiques de fonctionnement MODELLED seulement — jamais de données de terrain/IQ, aucun verdict bon/mauvais. (catalogue des types de scénario (<c1/>))

# text
seg-376f86fbdcb7 = PÉRIMÈTRE HONNÊTE : caractéristiques de fonctionnement MODELLED seulement. Le corpus est synthétique et fondé sur des paramètres (composé à partir des modèles de brouillage/AGC/SQM/parité de Kshana) — jamais de captures de terrain ni d'IQ brut. Le banc est un arbitre ; il rapporte des caractéristiques, il ne prononce pas de verdict bon/mauvais. Exécution : kshana scenarios/impairment-eval.toml (commentaire du fichier de scénario, lignes { "9" } à { "12" })

# text
seg-882d67b9474f = L'évaluation par apprentissage automatique de la détection des altérations RF ({ "13494" }) est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5d23d7f8f872 = Page de famille : <a1>Brouillage, leurrage et spectre</a1>

# text
seg-6cf4bb2d7f7a = Page thématique : <a1>BENCH.md</a1>

# text
seg-dde90de4270b = <s1>Précédent</s1>hybrid

# text
seg-1e68310f2dc6 = <s1>Suivant</s1>inertial
