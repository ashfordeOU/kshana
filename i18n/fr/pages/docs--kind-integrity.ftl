# docs--kind-integrity: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> La section facultative [integrity] du type de scénario clock (clock_integrity::run) : à partir d'un site indiqué et de préréglages de constellation (geometry::sky_geometry), à chaque époque d'intégrité tant que la chronologie GNSS n'est pas refusée, RAIM instantané (raim::snapshot_ Tests : <a1>clock_integrity.rs</a1>.

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Séparation de solutions à hypothèses multiples ARAIM selon l'ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels et add_v42_protecti. Référence indépendante (ExternalDataset) : trois outils indépendants, préenregistrés (0123cee1) avant l'existence de toute donnée de banc d'essai ou de référence, tolérances alors fixées. ({ "1" }) ARAIM : Stanford MAAST pour ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, exécuté comme programme séparé sous GNU Octave { "8.4" } avec une couche de compatibilité unique() côté pilote (divulguée, sans changement d'algorithme), au TOL_PL de l'ADD de { "0.05" } m : le Rust reproduit l'implémentation de référence de l'ADD sur

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP à partir de la géométrie des lignes de visée via Q=(HᵀH)⁻¹ avec une séparation ENU locale. Référence indépendante (ExternalDataset) : DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — bibliothèque indépendante, concordance à { "1e-6" } en relatif

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Le cœur distributionnel sur lequel repose tout niveau de protection : le seuil de détection de défaut instantané χ²₁₋ₚfₐ(dof), la non-centralité de détection manquée pbias=√λ, et. Référence indépendante (ExternalDataset) : SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — bibliothèque indépendante (Cephes/Boost), un algorithme différent de la série de la gamma incomplète de Kshana ; concordance à ≤{ "1e-6" } en rel. Noyau seulement. L'<em>allocation</em> du budget P_HMI de l'ARAIM MHSS n'est plus dépourvue de référence numérique publiée — l'exemple travaillé du sous-groupe technique ARAIM du WG-C appuie désormais la ligne distincte « ARAIM MHSS protection levels against published referen

# text
# c1: docs/kinds/by-kind/integrity.md
seg-4bec24cd43f6 = Source : <c1/>

# text
# c1: integrity
seg-dd304550e695 = <c1/> (type de scénario)

# text
seg-eb7e0c2feb2b = RAIM instantané / à séparation de solutions / ARAIM avec HPL/VPL et un diagramme de Stanford.

# text
# c1: scenarios/integrity-raim.toml
seg-706887c285d8 = Une exécution de <c1/> se résume ainsi : integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
seg-c3f7debf260a = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: sigma_ura_m
# c2: b_nom_m
# c3: constellations
# c4: seed
# c5: araim_dual
# c6: p_hmi
# c7: skyline
seg-7b28ab6567df = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/integrity-raim.toml
seg-581a5231b230 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-ce7f6130ddee = Le graphique que le moteur écrit pour scenarios/integrity-raim.toml, type de scénario integrity

# text
seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-dff469738ec3 = <b>VALIDATED</b> TPL à séparation de solutions en temps scalaire sur des sources hétérogènes ; PL piloté par le bruit du sous-ensemble à pire exclusion + biais UTC(k)

# text
seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)) ; PL semi-continu inférieurement PL({ "0" }+)≥PL({ "0" }−) ; maximum glissant K(IR/2) ; exposants de phase τ/τ³/τ⁵

# text
seg-4787b0b565df = <b>VALIDATED</b> L'enveloppe à maximum glissant surestime et couvre (sans perforation) une série métrologique réelle à chaque décalage testé tau>=90d sur un segment disjoint ; le tau court (<=30d) est une limite déclarée, modélisée Tests : <a1>cti_holdover_coverage_reference.rs</a1>.

# text
seg-090415eca3b7 = et { "6" } autres dans la matrice.

# text
seg-b4bc9ccbcee2 = <s1>Précédent</s1>ins-trn-coast

# text
seg-f1ba804baade = <s1>Suivant</s1>jamming
