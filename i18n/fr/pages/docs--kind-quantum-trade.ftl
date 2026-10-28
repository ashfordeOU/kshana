# docs--kind-quantum-trade: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
seg-51cac2f918e0 = Page de sujet : <a1>POSITIONING.md</a1>

# text
# c1: docs/kinds/by-kind/quantum-trade.md
seg-3a8c76a2396f = Source : <c1/>

# text
# c1: quantum-trade
seg-f9af2813532e = <c1/> (type de scénario)

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Compromis PNT quantique contre classique ({ "13503" }) : bénéfice en holdover de synchronisation temporelle + holdover inertiel d'une horloge candidate (une courbe d'ADEV mesurée — le pivot de défendabilité — ou une classe d'horloge quantique) par rapport à une classe de référence de base classique, avec la réserve sur l'hypothèse de plancher à long tau portée sur l'artefact, plus une enveloppe de résilience en fonction du temps en l'absence de GNSS. MODELLED ; quantifie (ne valide jamais) un dispositif partenaire. L'horloge candidate est une courbe mesurée (<c1/> + <c2/>, de même longueur, d'au moins { "2" } points ; elle l'emporte lorsque les deux formes sont données) ou un <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Une exécution de <c1/> se résume ainsi : quantum-trade | candidate measured-ADEV | timing holdover 2621947s vs 203s (12943.62x) | inertial 14108s vs 378s (37.34x) | resilience coast 14108s | MODELLED [floor-assumed caveat]

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
seg-2639560aeff2 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: baseline_ins
# c2: candidate_ins
# c3: resilience_times_s
# c4: alt_pnt_bound_m
seg-d66f1ef84201 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-trade.toml
seg-f2cc0830b53f = L'exemple <c1/> définit, entre autres :

# text
seg-ee5bcbbe0167 = csac

# text
seg-f5fa445702c6 = Libellé du résultat (celui du moteur) : MODELLED — quantifie (ne valide jamais) une horloge/un capteur partenaire ; non démontré en vol

# attr:alt
seg-c74c63ffd859 = Le graphique que le moteur écrit pour scenarios/quantum-trade.toml, type de scénario quantum-trade

# text
seg-93310aaa6ead = <b>VALIDATED</b> Récupération NNLS en loi de puissance (FM blanc + plancher de bruit rouge) à partir d'un écart d'Allan mesuré publié de la transition d'horloge optique du ⁸⁸Sr — reproduisant σ_y(τ) et la loi principale de 4.7e-16/√τ à τ court avec un véritable plancher mesuré à τ long, plutôt que Tests : <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Ajustement NNLS de l'ADEV mesuré, bandes de cohérence χ² NEES/NIS, et covariance du bruit de processus discret de van Loan de l'horloge (dérive libre en holdover) — l'épine dorsale de calcul du moteur de compromis Tests : <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Ingestion de l'ADEV mesuré (NNLS), tableau de compromis (holdover de synchronisation temporelle/inertiel + bénéfice), enveloppe de résilience en fonction du temps ; réserve sur le plancher portée sur l'artefact.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Ajustement NNLS de l'ADEV mesuré, bandes de cohérence χ² NEES/NIS, et covariance du bruit de processus discret de van Loan de l'horloge (dérive libre en holdover) — l'épine dorsale de calcul du moteur de compromis. Référence indépendante (ExternalDataset) : scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm ; NNLS+Q exacts, χ² <{ "5e-4" } aux degrés de liberté de fonctionnement. Noyaux seulement — les chiffres de performance des dispositifs restent modélisés (ligne suivante)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Ingestion de l'ADEV mesuré (NNLS), tableau de compromis (holdover de synchronisation temporelle/inertiel + bénéfice), enveloppe de résilience en fonction du temps ; réserve sur le plancher portée sur l'artefact. Exécutable de. Référence indépendante (ExternalDataset) : le noyau d'ajustement ADEV mesuré→DSP (NNLS) concorde avec scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — un noyau externe indépendant ; mais les CHIFFRES du compromis quantifient (ne valident jamais) une horloge/un CAI partenaire, de sorte que le compromis lui-même reste MODELLED, sans halo de validation

# text
# c1: label
seg-3d678f64e41c = MODELLED — quantifie (ne valide jamais) une horloge/un capteur partenaire ; non démontré en vol (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Compromis PNT quantique contre classique ({ "13503" }) : bénéfice en holdover de synchronisation temporelle + holdover inertiel d'une horloge candidate (une courbe d'ADEV mesurée — le pivot de défendabilité — ou une classe d'horloge quantique) par rapport à une classe de référence de base classique, avec la réserve sur l'hypothèse de plancher à long tau portée sur l'artefact, plus une enveloppe de résilience en fonction du temps en l'absence de GNSS. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED ; quantifie (ne valide jamais) un dispositif partenaire. (catalogue des types de scénario (<c1/>))

# text
seg-15275d27252a = Calcule le bénéfice en holdover de synchronisation temporelle et en holdover inertiel d'une horloge CANDIDATE par rapport à une référence de base CLASSIQUE, plus une enveloppe de résilience en fonction du temps en l'absence de GNSS. Le plancher du candidat est piloté par la courbe d'ADEV à recouvrement MEASURED d'une horloge partenaire (le pivot de défendabilité) ajustée par moindres carrés non négatifs — de sorte que le budget de holdover repose sur des données réelles, et non sur un plancher à long tau supposé. (commentaire du fichier de scénario, lignes { "3" } à { "7" })

# text
seg-ecbdbc9b163e = PORTÉE HONNÊTE : MODELLED — il QUANTIFIE le bénéfice de l'horloge quantique d'un partenaire ; il NE valide PAS le dispositif, et n'emprunte jamais les îlots de validation SGP4/Allan/IGS. Lorsque le plancher d'une ligne est une valeur par défaut de classe supposée, une réserve sur le plancher s'affiche sur l'artefact. Exécution : kshana scenarios/quantum-trade.toml (commentaire du fichier de scénario, lignes { "9" } à { "12" })

# text
seg-4b59ac409819 = Le compromis PNT quantique contre classique et la résilience sans GNSS ({ "13503" }) sont MODELLED, et non vérifiés : une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte qu'elle reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Précédent</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Suivant</s1>realtime-frame-eop

seg-a349aa76b0ed = PARTNER
