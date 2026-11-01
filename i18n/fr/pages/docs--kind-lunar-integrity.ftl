# docs--kind-lunar-integrity: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Séparation de solutions à hypothèses multiples ARAIM selon l'ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels et add_v42_protecti. Référence indépendante (ExternalDataset) : trois outils indépendants, préenregistrés (0123cee1) avant l'existence de toute donnée de banc d'essai ou de référence, tolérances alors fixées. ({ "1" }) ARAIM : Stanford MAAST pour ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, exécuté comme programme séparé sous GNU Octave { "8.4" } avec une couche de compatibilité unique() côté pilote (divulguée, sans changement d'algorithme), au TOL_PL de l'ADD de { "0.05" } m : le Rust reproduit l'implémentation de référence de l'ADD sur

# text
# c1: docs/kinds/by-kind/lunar-integrity.md
seg-8ed008b206de = Source : <c1/>

# text
# c1: lunar-integrity
seg-26f0cf6d63c0 = <c1/> (type de scénario)

# text
seg-4b6daea39f5c = Passage de niveau de protection ARAIM au pôle sud lunaire par rapport à un ensemble représentatif de relais LunaNet. sigma_ure_m expose la précision de mesure de distance du signal dans l'espace (les niveaux de protection lui sont proportionnels, de sorte que la balayer répond à la question de la précision de mesure de distance qu'exige une limite d'alerte). Par défaut, le cas historique du pôle sud de classe LNIS.

# text
# c1: scenarios/lunanet-araim.toml
seg-a6eb6de27cb5 = Une exécution de <c1/> se résume ainsi : lunar-integrity | south pole | 0/24 epochs available ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-79da500e2726 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/lunanet-araim.toml
seg-21d10aa98c33 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-610fa190a393 = Le graphique que le moteur écrit pour scenarios/lunanet-araim.toml, type de scénario lunar-integrity

# text
seg-1903c67a762d = <b>VALIDATED</b> L'étape géométrie-vers-covariance du niveau de protection lunaire — (GᵀG)⁻¹ sur la géométrie tous satellites en vue et chaque sous-géométrie à défaut unique, projetée sur la verticale locale a. Référence indépendante (ExternalDataset) : deux implémentations tierces établies composées, toutes deux exécutées hors ligne, avec le jeu de données régénéré de bout en bout et vérifié identique à l'octet près. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilé à partir du source C avec -ULAPACK : lsq() → matinv() → ludcmp()/lubksb() inverse la matrice normale par LU de Crout avec pivot partiel, un algorithme sans rapport avec le invert4() de Gauss-Jordan écrit à la main de kshana

# text
seg-3c54da43686e = <s1>Précédent</s1>lunar-infrastructure

# text
seg-f6b399c3fd4a = <s1>Suivant</s1>lunar-interop-export
