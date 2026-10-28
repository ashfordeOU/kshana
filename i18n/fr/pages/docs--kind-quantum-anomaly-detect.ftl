# docs--kind-quantum-anomaly-detect: translations (fr)

# text
seg-29e58493fdd4 = Modélisé

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
# c1: docs/kinds/by-kind/quantum-anomaly-detect.md
seg-836d5102f0d1 = Source : <c1/>

# text
# c1: quantum-anomaly-detect
seg-ad4ce0110e8d = <c1/> (type de scénario)

# text
seg-04310cd6cbec = Détection de défauts/anomalies MODELLED pour les systèmes PNT quantiques : un catalogue de défauts étiquetés (saut de fréquence/dérive/perte d'accrochage d'horloge ; échelon de biais/perte de signal d'un capteur), une AUC de ROC de la statistique de détection (avec un intervalle de confiance par bootstrap issu de eval_stats vérifié de façon externe) et un défaut minimal détectable à un taux de fausses alarmes fixé, le moniteur assisté par horloge quantique (bruit plus faible) détectant des défauts plus petits — sous forme de TradeEvidence honnête + représentativité. Modèle gaussien de la statistique de détection (AUC = Phi(mu/(sigma*sqrt2))) ; modélise la classe, paramètres illustratifs à sources publiques, aucun TRL, vol ni certification.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Une exécution de <c1/> se résume ainsi : quantum-anomaly-detect | AUC quantum { "0.9908" } vs classical { "0.7603" } | min-detectable fault quantum { "1.312" } vs classical { "4.372" } | { "5" } fault classes | trade quantum wins 2/2 | MODELLED

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-335b8d87e27d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-c2b10c0bdaf8 = L'exemple <c1/> définit, entre autres :

# text
seg-f44afe581836 = { $version }

# attr:alt
seg-2f1d14239d1a = Le graphique que le moteur écrit pour scenarios/quantum-anomaly-detect.toml, type de scénario quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> AUC de ROC binormale analytique = Φ(μ/(σ√{ "2" })) et défaut minimal détectable σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) sous-tendant les détecteurs de défauts et d'anomalies quantiques. Référence indépendante (ExternalDataset) : scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), tous deux BSD-3-Clause — des bibliothèques indépendantes calculant les mêmes grandeurs de queue gaussienne / d'AUC définies de façon unique, concordantes jusqu'au plancher de l'erf de A&S (~{ "7e-8" }). L'avantage quantique contre classique bâti dessus reste MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objet TradeEvidence reproductible (cadre fixé : scénario+graine+moteur ; valeurs communes quantique contre classique par figure de mérite avec bénéfice de polarité correcte, { "95" } % facultatif. Référence indépendante (InternalConsistency) : identités en forme close de bénéfice/gagnant et enveloppe fidèle de l'existant quantum_trade::TradeResult ; honnêteté liée au registre de représentativité et aux étiquettes de vérification

# text
seg-b854cedc8a51 = <b>MODELLED</b> Catalogue de défauts quantiques étiquetés (saut de fréquence/dérive/perte d'accrochage d'horloge ; échelon de biais/perte de signal d'un capteur), une AUC de ROC de la statistique de détection avec un intervalle de confiance par bootstrap, et un minimum. Référence indépendante (InternalConsistency) : AUC gaussienne en forme close = Phi(mu/(sigma*sqrt2)) recoupée avec eval_stats::bootstrap_auc_ci vérifié de façon externe (par rapport à scikit-learn) + seuils analytiques de détection

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = Détection de défauts/anomalies MODELLED pour les systèmes PNT quantiques : un catalogue de défauts étiquetés (saut de fréquence/dérive/perte d'accrochage d'horloge ; échelon de biais/perte de signal d'un capteur), une AUC de ROC de la statistique de détection (avec un intervalle de confiance par bootstrap issu de eval_stats vérifié de façon externe) et un défaut minimal détectable à un taux de fausses alarmes fixé, le moniteur assisté par horloge quantique (bruit plus faible) détectant des défauts plus petits — sous forme de TradeEvidence honnête + représentative (catalogue des types de scénario (<c1/>))

# text
seg-7f43972b246d = Détection de défauts/anomalies pour les systèmes PNT quantiques — catalogue de défauts étiquetés + AUC de ROC + défaut minimal détectable, moniteur assisté par horloge quantique contre moniteur classique. MODELLED ; paramètres illustratifs à sources publiques ; modélise la classe, aucune revendication de TRL ni de vol. (commentaire du fichier de scénario, lignes { "1" } à { "3" })

# text
seg-eb75c6a4dcec = Les éléments de preuve de compromis quantique contre classique (forme commune) sont MODELLED, et non vérifiés : ils sont contrôlés par rapport à leur propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = La détection de défauts/anomalies pour les systèmes PNT quantiques est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Précédent</s1>pvt

# text
seg-aa689568cf84 = <s1>Suivant</s1>quantum-gnss-free-nav

seg-a349aa76b0ed = PARTNER
