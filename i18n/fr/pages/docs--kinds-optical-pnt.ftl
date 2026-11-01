# docs--kinds-optical-pnt: translations (fr)

# text
seg-b03d56f501c3 = Type

# text
seg-e6839b50b560 = Indice de mérite conjoint MODELLED de PNT hétérogène optique + RF (P5) : compose le bilan de liaison optique aller-retour à { "1550" } nm (CRLB de télémétrie aller-retour limitée par les photons σ_τ/√N et empreinte de diffraction λ/D·distance), un niveau de protection RAIM à séparation de solutions inter-modalités (position ET synchronisation temporelle) qui fusionne les solutions RF lâche et optique serrée avec des covariances disparates, la disponibilité optique par ciel dégagé à N stations (union indépendante { "1" }−Π({ "1" }−a_i) et variante corrélée spatialement), un transfert d'état/de covariance optique↔RF avec une moyenne DÉMONTRÉE continue au bit près (sans saut) et un contrôle de cohérence NEES en χ², et un score conjoint de P(disponible ET de précision requise ET d'intégrité assurée) avec traitement de la corrélation. Forme fermée VALIDATED : le CRLB de télémétrie, l'empreinte de diffraction, le quantile du niveau de protection en χ², la combinatoire de l'union, la continuité de la moyenne du transfert + le contrôle NEES, et le produit indépendant conjoint. MODELLED : les allocations de pertes optiques, les grandeurs σ RF/optiques, les entrées de climatologie nuageuse, les corrélations et le budget P_HMI. Ce n'est pas un produit de disponibilité/d'intégrité certifié.

# attr:alt
seg-5cea5229815e = Le graphique que le moteur écrit pour scenarios/hybrid-optical-rf.toml, type de scénario hybrid-optical-rf

# text
seg-a878d9be65b7 = PNT optique MODELLED à travers l'atmosphère : pour une liaison optique et un ensemble de sites au sol avec des climats nuageux donnés, rapporte la perte en air clair dépendant de la longueur d'onde et de l'élévation (loi de visibilité de Kim plus Rayleigh), l'état de turbulence de Hufnagel-Valley (variance de Rytov, indice de scintillation, paramètres gamma-gamma, moyennage d'ouverture), la disponibilité pilotée par la météo par rapport à la marge de liaison (épaisseur optique des nuages issue d'un climat log-normal d'eau liquide, extinction en optique géométrique, évanouissement de turbulence indépendant), la marge de liaison nécessaire pour des disponibilités cibles, la distribution des durées d'interruption, la croissance de l'erreur de synchronisation temporelle et de mesure de distance par interruption via le modèle de holdover d'horloge, la disponibilité de diversité de sites corrélée avec la distance, et des gains hypothétiques pour des techniques d'amélioration (longueur d'onde, ouverture de réception, réduction de la scintillation par optique adaptative, marge supplémentaire). VALIDATED comme implémentation des formules énoncées par rapport à une référence mpmath indépendante : variance de Rytov, indice de scintillation, probabilité d'évanouissement gamma-gamma, facteur de moyennage d'ouverture, épaisseur optique des nuages et de l'air clair. MODELLED : chaque entrée de météo, de technique et d'horloge ainsi que les hypothèses d'indépendance et de copule ; aucun enregistrement de disponibilité mesurée n'a été comparé. Analyse à titre consultatif, et non un produit certifié de disponibilité ou de navigation.

# attr:alt
seg-4e2b759aff17 = Le graphique que le moteur écrit pour scenarios/optical-atmosphere-network.toml, type de scénario optical-atmosphere

# text
seg-4e31c8daf798 = Registre

# text
# c1: docs/kinds/optical-pnt.md
seg-963749981a7c = Source : <c1/>

# text
seg-079c8b284c44 = PNT optique (famille de types de scénario)

# text
seg-6dea687b727b = { "2" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/optical-atmosphere-network.toml
seg-d019c8511f48 = Pages thématiques : <a1>OPTICAL-ATMOSPHERE</a1>. En exécuter une : <c1/>. Toutes les familles : <a2>KINDS.md</a2>.

# attr:alt
seg-b8f937411028 = Planche-contact des graphiques que le moteur écrit pour les types de la famille PNT optique

# text
seg-76131e6805e5 = PNT optique MODELLED à travers l'atmosphère : pour une liaison optique et un ensemble de sites au sol avec des climats nuageux indiqués, il rapporte l'affaiblissement par ciel clair dépendant de la longueur d'onde et de l'élévation (visibilité de Kim

# text
seg-55725043f48e = Figure de mérite conjointe PNT optique + RF hétérogène MODELLED (P5) : compose le bilan de liaison optique bidirectionnel à { "1550" } nm (CRLB de télémétrie bidirectionnelle limitée par les photons σ_τ/√N et empreinte de diffraction λ/D·distance), un

# text
seg-5e658f01d9f4 = HETEROGENEOUS (libellé du résultat)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-750466e3188c = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-9e3ce423c0b9 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>optical-atmosphere</a1>.

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
seg-93f5d0527850 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

# text
seg-6a6f8eea5767 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>hybrid-optical-rf</a1>.

# text
seg-a4baaf1fbb8c = <s1>Précédent</s1>Analyse de mission, liaisons et opérations spatiales

# text
seg-48792381ba0b = <s1>Suivant</s1>Navigation de l'utilisateur spatial

seg-22449071fb11 = <s1>Précédent</s1>Fils de mission
