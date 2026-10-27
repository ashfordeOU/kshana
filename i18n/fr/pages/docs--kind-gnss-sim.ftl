# docs--kind-gnss-sim: translations (fr)

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
# c1: docs/kinds/by-kind/gnss-sim.md
seg-d5f4762f8455 = Source : <c1/>

# text
# c1: gnss-sim
seg-b634bbba2197 = <c1/> (type de scénario)

# text
seg-2ffccc9c1eff = Simulation de pseudodistances dans le domaine des mesures (ionosphère de Klobuchar, troposphère de Saastamoinen/Niell) + RAIM.

# text
# c1: scenarios/gnss-sim-raim.toml
seg-db93cbad6c6d = Une exécution de <c1/> se résume ainsi : scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: iono
# c2: tropo
# c3: mask_deg
# c4: noise_sigma_m
# c5: multipath_m
# c6: sat_clock_rms_m
# c7: uere_m
# c8: p_fa
# c9: p_md
# c10: alert_limit_h_m
# c11: alert_limit_v_m
# c12: skyline
seg-ee0d38971d08 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/gnss-sim-raim.toml
seg-c7b57e696bc3 = L'exemple <c1/> définit, entre autres :

# text
seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

# attr:alt
seg-47ee40d4eb73 = Le graphique que le moteur écrit pour scenarios/gnss-sim-raim.toml, type de scénario gnss-sim

# text
seg-ccc44a4ac68e = <b>VALIDATED</b> Retard de groupe ionosphérique oblique de Klobuchar en L1 monofréquence à partir des huit coefficients α/β diffusés Tests : <a1>klobuchar_reference.rs</a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Séparation de solutions à hypothèses multiples ARAIM selon l'ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels et add_v42_protecti. Référence indépendante (ExternalDataset) : trois outils indépendants, préenregistrés (0123cee1) avant l'existence de toute donnée de banc d'essai ou de référence, tolérances alors fixées. ({ "1" }) ARAIM : Stanford MAAST pour ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, exécuté comme programme séparé sous GNU Octave { "8.4" } avec une couche de compatibilité unique() côté pilote (divulguée, sans changement d'algorithme), au TOL_PL de l'ADD de { "0.05" } m : le Rust reproduit l'implémentation de référence de l'ADD sur

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP à partir de la géométrie des lignes de visée via Q=(HᵀH)⁻¹ avec une séparation ENU locale. Référence indépendante (ExternalDataset) : DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — bibliothèque indépendante, concordance à { "1e-6" } en relatif

# text
seg-752829346523 = <b>VALIDATED</b> Retard de groupe ionosphérique oblique de Klobuchar en L1 monofréquence à partir des huit coefficients α/β diffusés. Référence indépendante (ExternalDataset) : ionmodel de RTKLIB (tomojitakasu/RTKLIB, src/rtkcmn.c) — implémentation de référence indépendante compilée à partir des sources ; concordance à < { "1e-4" } m

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Le cœur distributionnel sur lequel repose tout niveau de protection : le seuil de détection de défaut instantané χ²₁₋ₚfₐ(dof), la non-centralité de détection manquée pbias=√λ, et. Référence indépendante (ExternalDataset) : SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — bibliothèque indépendante (Cephes/Boost), un algorithme différent de la série de la gamma incomplète de Kshana ; concordance à ≤{ "1e-6" } en rel. Noyau seulement. L'<em>allocation</em> du budget P_HMI de l'ARAIM MHSS n'est plus dépourvue de référence numérique publiée — l'exemple travaillé du sous-groupe technique ARAIM du WG-C appuie désormais la ligne distincte « ARAIM MHSS protection levels against published referen

# text
seg-cc7018560c2c = Page thématique : <a1>REAL_TLE_GUIDE.md</a1>

# text
seg-53a78e98af12 = Page thématique : <a1>SKYLINE.md</a1>

# text
seg-659e6288ad72 = <s1>Précédent</s1>gnss-ins

# text
seg-7d677a362edd = <s1>Suivant</s1>gnss-ssv
