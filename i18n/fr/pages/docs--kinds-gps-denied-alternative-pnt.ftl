# docs--kinds-gps-denied-alternative-pnt: translations (fr)

# text
seg-b03d56f501c3 = Type

# text
seg-f496b7f4c63a = Navigateur combiné gravité + magnétisme + relief sans GPS : trois canaux de champ scalaire fusionnés à chaque point de passage pour obtenir un recalage de la dérive plus précis (CRLB plus bas) que n'importe quel champ seul.

# attr:alt
seg-498b1aea3770 = Le graphique que le moteur écrit pour scenarios/combined-altpnt.toml, type de scénario combined-altpnt

# text
seg-c8f93431680a = Résilience MODELLED de PNT en couches face aux conflits (P7) : un utilisateur en environnement contesté dispose de plusieurs couches PNT (GNSS à service ouvert, GNSS à large bande, une constellation authentifiée, un relais d'augmentation), chacune avec une disponibilité de base, une précision à 1σ et une vulnérabilité de refus par vecteur face à la menace commune de brouillage/leurrage. Un Monte-Carlo À GRAINE FIXE, balayé en intensité, refuse chaque couche avec la probabilité clamp(vulnérabilité·intensité·poids_du_vecteur,{ "0,1" }), fusionne les survivantes par la règle en forme fermée de la variance inverse σ_fused=(Σ 1/σ_i²)^(−1/2), et indique la probabilité de perte totale (toutes les couches refusées), l'erreur fusionnée médiane et des statistiques d'utilisabilité/de refus par couche en fonction de l'intensité. Le rapport de résilience de tête (probabilité de perte totale d'une couche unique par rapport à celle de plusieurs couches) atteint ~7x sous l'hypothèse d'INDÉPENDANCE ; un balayage de refus corrélé par copule gaussienne à un facteur montre ensuite ce ~7x s'effondrer vers { "1" } à mesure que la corrélation de refus augmente (la corrélation met en échec la mise en couches). Un bloc de sensibilité aux a priori fait varier le chiffre de tête sur les a priori de vulnérabilité SOURCÉS via le diagramme en tornade mcda + une réallocation Dirichlet de l'effort de menace + des intervalles de confiance en percentiles. Cœur VALIDATED : la perte totale Monte-Carlo converge vers le produit indépendant en forme fermée Π_i p_deny_i (dans l'erreur standard Monte-Carlo à graine fixe et N grand) ; la fusion par variance inverse est une identité en forme fermée ; à ρ={ "0" } la copule se réduit au modèle indépendant et chaque ρ préserve le taux de refus marginal de chaque couche. MODELLED : les grandeurs de vulnérabilité/disponibilité/précision par couche sont des entrées sourcées mais modélisées (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — voir conflict_threat_params), et l'ordre de grandeur précis de ~7x ainsi que la forme de la courbe rapport-en-fonction-de-la-corrélation découlent de cette paramétrisation. Une ventilation de survie par vecteur au §{ "4.2" } résout ensuite la menace RF commune en quatre vecteurs nommés (brouillage/leurrage/cinétique/cyber) et indique pour chaque vecteur sa courbe de dégradation progressive du PNT utilisable S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED : le Monte-Carlo par couche à graine fixe converge vers cette forme fermée ; le brouillage est le vecteur le plus aigu pour la référence de base RF corrélée et la couche inertielle insensible aux RF est le survivant décisif. Ce n'est pas un produit de disponibilité de navigation certifié.

# attr:alt
seg-4dd2bcc206db = Le graphique que le moteur écrit pour scenarios/conflict-resilience.toml, type de scénario conflict-resilience

# text
seg-9a58a7b09423 = Navigation par appariement de carte gravimétrique sans GPS : un gravimètre à atomes froids retrouve une dérive INS constante à partir de la séquence d'anomalies de gravité qu'il traverse.

# attr:alt
seg-c42d90057e9f = Le graphique que le moteur écrit pour scenarios/gravity-map-nav.toml, type de scénario gravity-map

# text
seg-0d7bf5a4f07e = Navigation par référence au terrain (TERCOM/SITAN) en l'absence de GPS : un altimètre radar/barométrique met en correspondance le profil d'altitude du sol avec un MNT de type SRTM pour retrouver la dérive de l'INS.

# attr:alt
seg-c5e33c7122e2 = Le graphique que le moteur écrit pour scenarios/terrain-nav.toml, type terrain-nav

# text
seg-6bdc150ab25b = Navigation séquentielle (récursive) par référence au terrain en l'absence de GPS : un filtre à particules exécute le modèle de mesure de correspondance au terrain époque par époque (SITAN comme filtre en continu), de sorte qu'une dérive variable de l'INS est suivie le long de la trace, là où le terrain-nav par lots ne retrouve qu'un unique décalage constant.

# attr:alt
seg-4aca87f022dc = Le graphique que le moteur écrit pour scenarios/terrain-slam.toml, type terrain-slam

# text
seg-4e31c8daf798 = Registre

# text
seg-efd15cff3d32 = MODELLED (libellé du résultat)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Source : <c1/>

# text
seg-d9fdaf3208ca = PNT alternatif sans GPS (famille de types de scénario)

# text
seg-9fde6af9e09f = { "5" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Pages thématiques : <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. En exécuter une : <c1/>. Toutes les familles : <a3>KINDS.md</a3>.

# attr:alt
seg-6dfd2dc2721a = Planche-contact des graphiques que le moteur écrit pour les types de la famille PNT alternatif sans GPS

# text
seg-cff60d8c17d2 = Navigation séquentielle (récursive) par référence au terrain en l'absence de GPS : un filtre à particules exécute le modèle de mesure de correspondance au terrain époque par époque (SITAN comme filtre en continu), de sorte qu'une dérive variable de l'INS est su

# text
seg-9d8f69b51742 = Résilience aux conflits des PNT en couches MODELLED (P7) : un utilisateur en environnement contesté dispose de plusieurs couches PNT (GNSS à service ouvert, GNSS à large bande, une constellation authentifiée, un relais d'augmentation), chacune avec

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
# c14: coeffs
# c15: mascons
# c16: refine_stages
# c17: refine_factor
# c18: noise_seed
# c19: reference
# c20: map_error_mc
seg-28486745bb43 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Facultatifs : <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

# text
seg-c2187e8291f9 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>gravity-map</a1>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
# c13: refine_stages
# c14: refine_factor
# c15: noise_seed
seg-b1ff6f0e1769 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Facultatifs : <c13/>, <c14/>, <c15/>.

# text
seg-9bd19903f577 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>terrain-nav</a1>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: n_particles
# c12: init_pos_sigma_deg
# c13: process_sigma_deg
# c14: resample_ess_frac
# c15: seed
seg-3ec7b38184b7 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Facultatifs : <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-7c777178ee8f = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>terrain-slam</a1>.

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
# c16: coeffs
# c17: mascons
# c18: magnetic_mascons
# c19: igrf_alt_km
# c20: refine_stages
# c21: refine_factor
# c22: noise_seed
# c23: magnetic_grid
seg-c5124441822e = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Facultatifs : <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
seg-d78bd011956c = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>combined-altpnt</a1>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-ab895b157152 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>conflict-resilience</a1>.

# text
seg-c0ef7d676ec1 = <s1>Précédent</s1>Mesures GNSS, positionnement et intégrité

# text
seg-54b45b00a2f0 = <s1>Suivant</s1>Inertiel, fusion et capteurs quantiques
