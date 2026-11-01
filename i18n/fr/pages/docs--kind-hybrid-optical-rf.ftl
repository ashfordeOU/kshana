# docs--kind-hybrid-optical-rf: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
# c1: docs/kinds/by-kind/hybrid-optical-rf.md
seg-0482fec5b0f6 = Source : <c1/>

# text
# c1: hybrid-optical-rf
seg-830c574e871b = <c1/> (type de scénario)

# text
seg-72ad48275ebe = Type de scénario du moteur v{ $version }, famille <a1>PNT optique</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-e6839b50b560 = Indice de mérite conjoint MODELLED de PNT hétérogène optique + RF (P5) : compose le bilan de liaison optique aller-retour à { "1550" } nm (CRLB de télémétrie aller-retour limitée par les photons σ_τ/√N et empreinte de diffraction λ/D·distance), un niveau de protection RAIM à séparation de solutions inter-modalités (position ET synchronisation temporelle) qui fusionne les solutions RF lâche et optique serrée avec des covariances disparates, la disponibilité optique par ciel dégagé à N stations (union indépendante { "1" }−Π({ "1" }−a_i) et variante corrélée spatialement), un transfert d'état/de covariance optique↔RF avec une moyenne DÉMONTRÉE continue au bit près (sans saut) et un contrôle de cohérence NEES en χ², et un score conjoint de P(disponible ET de précision requise ET d'intégrité assurée) avec traitement de la corrélation. Forme fermée VALIDATED : le CRLB de télémétrie, l'empreinte de diffraction, le quantile du niveau de protection en χ², la combinatoire de l'union, la continuité de la moyenne du transfert + le contrôle NEES, et le produit indépendant conjoint. MODELLED : les allocations de pertes optiques, les grandeurs σ RF/optiques, les entrées de climatologie nuageuse, les corrélations et le budget P_HMI. Ce n'est pas un produit de disponibilité/d'intégrité certifié.

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-30904e2367fc = Une exécution de <c1/> se résume ainsi : hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | CRLB/χ²-PL/union/handoff validés, σ/climatologie modélisés

# text
# c1: wavelength_nm
# c2: tx_power_w
# c3: tx_aperture_m
# c4: rx_aperture_m
# c5: range_km
# c6: pulse_rms_ps
# c7: integration_s
# c8: atmospheric_loss_db
# c9: pointing_loss_db
# c10: optics_efficiency
# c11: detector_efficiency
# c12: two_way
# c13: rf_pos_sigma_m
# c14: rf_vertical_sigma_m
# c15: rf_clock_sigma_s
# c16: p_fa
# c17: p_md
# c18: alert_limit_h_m
# c19: alert_limit_v_m
# c20: alert_limit_t_s
# c21: grade_pos_m
# c22: grade_time_s
# c23: n_optical_sites
# c24: site_correlation
# c25: fom_correlation
# c26: handoff_inflation
# c27: p_hmi
# c28: fault_ramp_rate_pos_m_s
# c29: fault_ramp_rate_clock_s_s
# c30: process_noise_pos_psd_m2_s
# c31: process_noise_clock_psd_s2_s
# c32: coast_coverage_k
# c33: rf_band
# c34: rf_eirp_dbw
# c35: rf_g_over_t_db
# c36: rf_other_losses_db
# c37: rf_data_rate_bps
# c38: rf_required_eb_n0_db
# c39: rf_chip_rate_hz
# c40: rf_correlator_spacing_chips
# c41: rf_dll_bandwidth_hz
# c42: rf_tracking_threshold_dbhz
# c43: rf_degraded_margin_db
seg-73e5cf56c92c = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-27338c8b2e5f = L'exemple <c1/> définit, entre autres :

# text
seg-7b9ce4689508 = Étiquette du résultat (celle du moteur) : indice de mérite conjoint de disponibilité / précision / intégrité du PNT hétérogène optique + RF (P5). Forme fermée VALIDATED : le CRLB de télémétrie limitée par les photons (σ_τ/√N) et l'empreinte de diffraction (λ/D·distance), le quantile du niveau de protection inter-modalités en χ², la disponibilité par union indépendante à N stations ({ "1" } − Π(

# attr:alt
seg-5cea5229815e = Le graphique que le moteur écrit pour scenarios/hybrid-optical-rf.toml, type de scénario hybrid-optical-rf

# text
# c1: variance
seg-a8923a682728 = <b>MODELLED</b> Le rapport hybrid-optical-rf indique la configuration de liaison avec laquelle il a effectivement été exécuté (longueur d'onde de la porteuse, ouverture d'émission et de réception, distance, largeur d'impulsion, intégratio. Référence indépendante (InternalConsistency) : aucune référence indépendante externe, et il n'y en a aucune de possible : c'est une auto-description, et non une mesure. Elle est consignée parce que son absence était un défaut -- P5 devait citer la longueur d'onde de la porteuse et l'ouverture d'émission à partir de valeurs par défaut de la source, et déduire qu'un <c1/> nu était en mètres carrés à partir d'un contrôle de cohérence interne. La déduction était correcte, et c'est précisément pour cela qu'elle importait : rien n'aurait détecté qu'elle était fausse

# text
seg-28abb5a84eaa = <b>MODELLED</b> Le rapport hybrid-optical-rf indique une disponibilité de liaison RF, composée à partir de grandeurs que le moteur calcule déjà plutôt qu'à partir d'une climatologie importée, et. Référence indépendante (InternalConsistency) : aucune référence indépendante externe, et ExternalDataset est écarté. Les deux entrées sont une marge d'Eb/N0 et un franchissement de seuil de C/N0, toutes deux fonctions d'une PIRE, d'un facteur de mérite et d'une allocation de pertes globale MODELLED ; il n'existe aucun enregistrement de disponibilité mesurée pour un service hybride optique/RF Terre-Lune auquel comparer le chiffre composé. Les contrôles qui existent sont internes et sont présentés comme tels : la composition est recalculée à partir de la r

# text
seg-888004543d37 = <b>MODELLED</b> Le rapport hybrid-optical-rf émet le rapport de précision de télémétrie optique par rapport à la RF avec l'UNIQUE configuration à laquelle les deux branches ont été évaluées portée dans le même objet : la sa. Référence indépendante (InternalConsistency) : aucune référence indépendante externe pour le RAPPORT, et ExternalDataset est volontairement écarté. La chaîne RF sous-jacente en a une -- tests/validate_p5_rf_ranging_precision.rs vérifie linkbudget::link_budget et navsignal::dll_code_jitter_chips par rapport à un banc d'essai Python/NumPy indépendant et à la valeur travaillée codée en dur de Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m à { "45" } dB-Hz) -- et le CRLB optique a sa propre ligne en forme fermée

# text
seg-db5ff373b50f = <b>MODELLED</b> Le rapport hybrid-optical-rf indique ce que le moniteur du khi-deux inter-modalités peut effectivement DÉTECTER, et pas seulement qu'il passe un cas sans défaut : le minimum détectable. Référence indépendante (InternalConsistency) : deux références internes, aucun jeu de données externe. ({ "1" }) Aller-retour en forme fermée : le biais minimal détectable est produit en inversant la queue du khi-deux non centré sur la non-centralité (raim::pbias) et est vérifié en réinjectant la non-centralité obtenue dans raim::noncentral_chi2_cdf au seuil propre du moniteur, ce qui doit redonner P_md. ({ "2" }) Injection par rapport à analyse : un biais est écrit dans l'estimation RF d'un axe

# text
# c1: label
seg-24f31f6b353f = Indice de mérite conjoint de disponibilité / précision / intégrité du PNT hétérogène optique + RF (P5). Forme fermée VALIDATED : le CRLB de télémétrie limitée par les photons (σ_τ/√N) et l'empreinte de diffraction (λ/D·distance), le quantile du niveau de protection inter-modalités en χ², la disponibilité par union indépendante à N stations ({ "1" } − Π({ "1" }−a_i)), l'invariant de continuité de la moyenne du transfert optique↔RF (sans saut, au bit près) et le contrôle NEES en χ², et l'indice conjoint indép (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-bec90783ad8b = Indice de mérite conjoint MODELLED de PNT hétérogène optique + RF (P5) : compose le bilan de liaison optique aller-retour à { "1550" } nm (CRLB de télémétrie aller-retour limitée par les photons σ_τ/√N et empreinte de diffraction λ/D·distance), un niveau de protection RAIM à séparation de solutions inter-modalités (position ET synchronisation temporelle) qui fusionne les solutions RF lâche et optique serrée avec des covariances disparates, la disponibilité optique par ciel dégagé à N stations (indépendante-un (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-15abc895e477 = MODELLED : les allocations de pertes optiques, les grandeurs σ RF/optiques, les entrées de climatologie nuageuse, les corrélations et le budget P_HMI. (catalogue des types de scénario (<c1/>))

# text
seg-9fafa5ffb521 = MODELLED. Formes fermées validées : CRLB de télémétrie (sigma_tau/sqrt(N)), empreinte de diffraction (lambda/D * distance), quantile du niveau de protection en khi-deux, combinatoire de l'union, continuité de la moyenne du transfert + contrôle NEES, et produit indépendant conjoint. Les allocations de pertes, les grandeurs sigma, les entrées de climatologie nuageuse, les corrélations et le budget P_HMI sont des entrées représentatives modélisées. Chaque champ ci-dessous est facultatif et présenté à sa (commentaire du fichier de scénario, lignes { "10" } à { "14" })

# text
seg-e5f964e5d422 = --- Injection de défauts de biais / de rampe G15 contre le moniteur inter-modalités --- Le biais minimal détectable et la courbe de puissance de détection sont ANALYTIQUES (inversion du khi-deux non centré), et n'ont donc besoin d'aucune entrée propre. Ces deux-ci fixent seulement la vitesse de rampe dont le temps de détection rapporté est une conversion. Les deux sont MODELLED. (commentaire du fichier de scénario, lignes { "56" } à { "59" })

# text
seg-70f50a62aa12 = --- Inertie après transfert G17 : bruit de processus et franchissement de la limite d'alerte --- Marche aléatoire sur le filtre de transfert existant à 4 états (est, nord, haut, horloge). Les limites d'alerte sont celles déjà déclarées plus haut ; seuls le bruit de processus et le facteur de couverture sont nouveaux. Les deux DSP sont des entrées représentatives MODELLED et les temps de franchissement en dépendent directement. (commentaire du fichier de scénario, lignes { "63" } à { "67" })

# text
seg-9fb4240fb0ef = L'auto-description du rapport hybride optique/RF est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a97755cb13eb = Page de famille : <a1>PNT optique</a1>

# text
seg-1586d90cdf1b = <s1>Précédent</s1>holdover-test

# text
seg-211275a00df0 = <s1>Suivant</s1>hybrid-ukf
