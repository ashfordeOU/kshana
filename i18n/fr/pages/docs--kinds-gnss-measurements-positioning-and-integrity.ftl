# docs--kinds-gnss-measurements-positioning-and-integrity: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
# c1: published
seg-06197409c717 = Vecteurs de référence de certification ARAIM publiés : les niveaux de protection horizontal et vertical ARAIM du moteur exécutés sur les exemples numériques traités PROPRES au sous-groupe technique ARAIM du WG-C, à la tolérance (TOL_PL = { "5e-2" } m) que ces documents indiquent eux-mêmes. Deux vecteurs sont enregistrés comme jeux de test, chacun portant son URL de récupération, sa date de récupération, le SHA-256 du fichier source et la page : le Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) annexe D — autocohérent, et le vecteur d'acceptation — et le rapport du jalon { "3" } ({ "2016" }) annexe A section A.IX, la déclaration que citent les bibliographies de recherche. Chaque entrée publiée (la matrice de géométrie à 10 satellites et 2 constellations, les diagonales de variance C_int et C_acc, b_nom, P_sat, P_const et le jeu de constantes LPV-200) et chaque sortie publiée (VPL, HPL, EMT, sigma_v_acc, K_fa_3 et les sigma_3, sigma_ss_3 et b_3 des deux modes de défaut de constellation) est rapportée à côté du nombre propre du moteur et de leur différence absolue. L'équation du niveau de protection n'est PAS résolue de nouveau ici : la liste de modes de la référence est remise au raim::araim_protection_level / araim_integrity_risk existant du moteur, de sorte que la bissection et l'algèbre de la queue gaussienne éprouvées sont celles du moteur ; seuls la géométrie, les sous-solutions, les seuils de détection et la répartition publiée du budget sont construits pour lui. EXTERNALLY CHECKED par rapport au vecteur { "2019" } : VPL { "18.2926" } m contre { "18.3" } m publié, HPL { "13.4063" } m contre { "13.45" } m, EMT { "7.2997" } m contre { "7.2998" } m, sigma_v_acc { "1.3694" } m contre { "1.3694" } m, et les six intermédiaires publiés à moins d'une demi-unité de leur dernière décimale imprimée. Le vecteur { "2016" } comporte deux défauts internes que le rapport énonce au lieu de les cacher — une coquille de signe à la ligne { "3" } de G, et un K_fa_3 évalué à { "57" } modes de défaut alors que le document indique N_fault_max = { "1" } ({ "12" } modes) — de sorte que ses intermédiaires de géométrie se reproduisent exactement tandis que ses niveaux de protection sont rapportés comme des écarts mesurés et exclus du chiffre d'acceptation ; la tolérance n'est jamais élargie pour les absorber. Chaque champ numérique émis porte une unité et une classe de provenance, et un chiffre transcrit est étiqueté <c1/> afin de ne jamais pouvoir être pris pour un chiffre calculé. PORTÉE : seul N_fault_max = { "1" } (modes de défaut d'un seul satellite et d'une seule constellation) est mis en œuvre, et un cas dont les a priori exigent des sous-ensembles de défauts multi-événements simultanés est REFUSED au lieu d'être tronqué silencieusement ; la détection de défaut, l'exclusion, le contrôle de cohérence du khi-deux et l'étape de réallocation de double comptage de l'algorithme de référence sont hors périmètre. Cela reproduit l'exemple traité d'un algorithme de référence publié — ce n'est ni une certification, ni un artefact de navigabilité, ni une approbation.

# attr:alt
seg-693c823c85d1 = Le graphique que le moteur écrit pour scenarios/araim-reference-check.toml, type de scénario araim-reference-check

# text
seg-2ffccc9c1eff = Simulation de pseudodistances dans le domaine des mesures (ionosphère de Klobuchar, troposphère de Saastamoinen/Niell) + RAIM.

# attr:alt
seg-47ee40d4eb73 = Le graphique que le moteur écrit pour scenarios/gnss-sim-raim.toml, type de scénario gnss-sim

# text
seg-eb7e0c2feb2b = RAIM instantané / à séparation de solutions / ARAIM avec HPL/VPL et un diagramme de Stanford.

# attr:alt
seg-ce7f6130ddee = Le graphique que le moteur écrit pour scenarios/integrity-raim.toml, type de scénario integrity

# text
seg-b7b67e03f125 = Positionnement ponctuel sur observations réelles : résoudre la position d'un récepteur à partir d'un fichier d'observation RINEX { "3" } et d'un fichier de navigation diffusée (pseudodistances de code, éphéméride diffusée, ionosphère de Klobuchar, troposphère de Saastamoinen/Niell), éventuellement vérifié par rapport à une coordonnée relevée.

# attr:alt
seg-d76d59644d84 = Le graphique que le moteur écrit pour scenarios/pvt-abmf.toml, type de scénario pvt

# text
seg-edfcb546d9de = Budget de prévision du référentiel lunaire / de l'orientation de la Terre en temps réel : Table { "1" } de P4 (le contrôle de cohérence de l'erreur de référentiel — en post-traitement ~{ "0.27" } m ↔ ~{ "0.010" } ms et en temps réel ~{ "15" } m ↔ ~{ "0.5" } ms, chaque position de référentiel exprimée par son erreur UT1 équivalente via le bras de levier L19 Δr = D_EM·ω⊕·ΔUT1) et Table { "2" } (erreur mesurée de prévision d'UT1 en fonction de l'horizon — la courbe L18 lue directement sur la vraie série IERS finals2000A : le plancher final Bulletin A − Bulletin B et l'erreur du prédicteur de persistance sur plusieurs jours, chacune ramenée à une position dans le référentiel lunaire par L19), plus le budget d'erreur de référentiel en temps réel L21 en racine de la somme des carrés (EOP + éphéméride + plancher de réalisation). Forme close VALIDATED (le bras de levier L19, ω⊕ recoupé avec l'angle de rotation de la Terre du CIO) et données réelles VALIDATED (la courbe L18 lue sur les vraies lignes de finals2000A) ; sont MODELLED les ordres de grandeur de covariance d'OD du relais lunaire et le plancher de réalisation du référentiel (allocations représentatives) ainsi que le prédicteur de persistance (et non l'algorithme opérationnel du Bulletin A de l'IERS). Pas un produit certifié de référentiel en temps réel.

# attr:alt
seg-2721ed7727bb = Le graphique que le moteur écrit pour scenarios/realtime-frame-eop.toml, type de scénario realtime-frame-eop

# text
seg-5f25c5b71f0c = Modèle d'environnement de météorologie spatiale : indices d'activité solaire (F10.7/F10.7a) et géomagnétique (Kp, avec la table de définition Kp↔ap), la température exosphérique de Jacchia-1971 qu'ils pilotent (validée par rapport aux minimum, moyenne et maximum solaires publiés), et la densité neutre thermosphérique de Jacchia-1971 à la température exosphérique moyenne diurne par rapport au profil statique sans activité, à un ensemble d'altitudes — la dépendance de la densité au cycle solaire que l'atmosphère statique omet. MODELLED : la densité concorde avec les densités dérivées d'accéléromètres (TOLEOS CHAMP et GRACE) à un facteur { "2" } près au maximum solaire mais est environ 1.7x trop dense au minimum solaire de { "2008" }.

# attr:alt
seg-c1c6f2f73fb5 = Le graphique que le moteur écrit pour scenarios/space-weather.toml, type space-weather

# text
seg-4e31c8daf798 = Registre

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Source : <c1/>

# text
seg-569fac649b5d = Mesures GNSS, positionnement et intégrité (famille de types de scénario)

# text
seg-63c3a7483268 = { "6" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Pages thématiques : <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. En exécuter une : <c1/>. Toutes les familles : <a5>KINDS.md</a5>.

# attr:alt
seg-9c60c8803b6b = Planche-contact des graphiques que le moteur écrit pour les types de la famille Mesures GNSS, positionnement et intégrité

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Positionnement autonome sur observations réelles : résoudre la position d'un récepteur à partir d'un fichier d'observations RINEX { "3" } et d'un fichier de navigation diffusé (pseudodistances de code, éphéméride diffusée, ionosphère de Klobuchar, Saastamo

# text
seg-da89c260b1a3 = Vecteurs de référence ARAIM publiés pour la certification : les niveaux de protection horizontal et vertical ARAIM du moteur confrontés aux PROPRES exemples numériques détaillés du sous-groupe technique ARAIM du WG-C, à la tolé

# text
seg-7a750a89c9c4 = Modèle d'environnement de météorologie spatiale : indices d'activité solaire (F10.7/F10.7a) et géomagnétique (Kp, avec la table de définition Kp↔ap), la température exosphérique de Jacchia-1971 qu'ils pilotent (validée par rapport aux valeurs publi

# text
seg-d79d4d58275b = Budget de prédiction en temps réel du référentiel lunaire et de l'orientation de la Terre : P4 Table { "1" } (la vérification de cohérence des erreurs de référentiel — post-traité ~{ "0.27" } m ↔ ~{ "0.010" } ms et temps réel ~{ "15" } m ↔ ~{ "0.5" } ms, chaque position de référentiel expri

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
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Facultatifs : <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Registre :</b> MODELLED { "6" } · VALIDATED { "4" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>. Facultatifs : <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Champs obligatoires : <c1/>, <c2/>. Facultatifs : <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Champs obligatoires : aucun. Facultatif : <c1/>.

# text
seg-415f1fa78518 = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>space-weather</a1>.

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-64c512530ee6 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Précédent</s1>Constellations, couverture et géométrie

# text
seg-2cdfd7f8bfb3 = <s1>Suivant</s1>PNT alternatif sans GPS
