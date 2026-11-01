# docs--kind-lunar-station-coverage: translations (fr)

# text
seg-9feefecdcf67 = rafs

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Station de référence différentielle de classe NovaMoon : annulation du mode commun + résiduel croissant avec la ligne de base + niveaux de protection DGNSS. Référence indépendante (InternalConsistency) : identité d'annulation d'erreur différentielle + réutilisation du mécanisme de niveau de protection SBAS de la DO-229E ; la simple différence + la résolution WLS sont en outre recoupées avec lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilé) — code de résolution indépendant, mais la même algèbre au premier ordre de la différence de ligne de visée, donc toujours InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Les trois termes qu'une correction différentielle accumule entre l'époque où elle est calculée et l'époque où elle est utilisée, chacun auparavant laissé comme marge non modélisée :. Référence indépendante (InternalConsistency) : identités en forme close et autocohérence : la variance du quantificateur uniforme pas²/12, la propagation exacte de covariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ qui se réduit à σ·PDOP pour des σ égaux, le transfert { "1" }:{ "1" } du terme de relevé comme conséquence de û_user ≈ û_ref, et la fermeture en quadrature de la désactivation. Le recoupement du PDOP avec orbit::dop partage la matrice normale [−û, { "1" }], c'est donc un contrôle de cohérence, et il est étiqueté comme tel plutôt que comme un indépendant

# text
seg-7171b2e3f29d = Le PNT différentiel lunaire est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Le PNT différentiel lunaire — budget résiduel de la liaison de correction est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Page de sujet : <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Source : <c1/>

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (type de scénario)

# text
seg-f7ea776e70c9 = Couverture modélisée d'une station de référence lunaire : un balayage de Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et une journée d'époques. Une station de référence différentielle en un site connu du pôle sud corrige une constellation donnée (képlérienne illustrative ou éphéméride tabulée) avec une erreur de signal dans l'espace, une erreur de relevé, une latence de correction et une quantification de liaison données ; par point et sur la région, elle rapporte l'erreur de position corrigée et non corrigée en percentile (3D, horizontale, verticale), la disponibilité, la couverture par rapport à un seuil donné, les niveaux de protection DO-229E, le rayon de couverture par azimut et le bilan de la liaison de correction à la station et au pire point. Pas une déclaration sur la performance d'un système réel ; sans affiliation ni aval d'aucune agence. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Une exécution de <c1/> se résume ainsi : lunar-station-coverage | { "346" } points x { "144" } epochs x { "200" } trials | availability { "92.2" } % | coverage { "76.5" } % (p95 <= { "20" } m) | corrected p95 3-D { "15.592" } m (uncorrected { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; not a statement about any real system

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-cb73ac0d57de = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

# text
# c1: scenarios/lunar-station-coverage.toml
seg-0c3460704315 = L'exemple <c1/> définit, entre autres :

# text
seg-2d84b341a41f = Libellé du résultat (celui du moteur) : MODELLED

# attr:alt
seg-922b8656fcae = Le graphique que le moteur écrit pour scenarios/lunar-station-coverage.toml, type de scénario lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Balayage de Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et une journée d'époques (le type de scénario <c1/>) : pour une station de référence différentielle en un site connu du pôle sud, par point et sur la région, le Tests : <a1>lunar_station_coverage_reference.rs</a1>.

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Balayage de Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et une journée d'époques (le type de scénario <c1/>) : pour une station de référence différentielle en un s. Référence indépendante (InternalConsistency) : arithmétique recalculée par un script numpy indépendant sur des cas exportés (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" } ; préenregistré dans tests/fixtures/lunar_station/PREREGISTRATION.md, consigné seul dans 9caedf97 avant la première exécution) : sur { "20" } cas avec tous les termes d'erreur activés, les ensembles visibles et l'état sont identiques, les erreurs de distance brutes concordent à { "1.4e-14" } m, les vecteurs et amplitudes d'erreur de position à { "1.4e-9" } m par rapport à

# text
# c1: label
seg-626ab55f0424 = MODELLED (résultat <c1/>)

# text
seg-6f09def22469 = HONNÊTETÉ : MODELLED. Sous les hypothèses énoncées ci-dessous, le modèle donne ces chiffres. Pas une déclaration sur la performance d'un système réel ; sans affiliation ni aval d'aucune agence ; aucune revendication de TRL ou d'héritage. Omis : masquage par le terrain et l'horizon au pôle (la première limite), multitrajet, matériel du récepteur. (commentaire du fichier de scénario, lignes { "15" } à { "18" })

# text
seg-db27cc015952 = La carte de couverture et de précision d'une station de référence lunaire est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Précédent</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Suivant</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>Précédent</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Suivant</s1>lunar-surface
