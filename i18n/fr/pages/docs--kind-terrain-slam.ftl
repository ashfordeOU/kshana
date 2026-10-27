# docs--kind-terrain-slam: translations (fr)

# text
seg-216efc4e6fba = Type de scénario du moteur v{ $version }, famille <a1>PNT alternatif en environnement sans GPS</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-0df60ac6343f = <b>MODELLED</b> Appariement de carte gravimétrique, navigation par référence au relief (TERCOM/SITAN), anomalie magnétique. Référence indépendante (InternalConsistency) : coefficients IGRF-14 ; CRLB du filtre adapté issu des premiers principes. Le champ du banc d'essai gravimétrique en champ réel est vérifié en externe (ligne « Gravity-anomaly synthesis from a spherical-harmonic model »), mais son résultat de navigation n'a aucune référence indépendante externe

# text
seg-d776abd5691c = Le PNT alternatif / complémentaire est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Page de famille : <a1>PNT alternatif en environnement sans GPS</a1>

# text
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Source : <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (type de scénario)

# text
seg-6bdc150ab25b = Navigation séquentielle (récursive) par référence au terrain en l'absence de GPS : un filtre à particules exécute le modèle de mesure de correspondance au terrain époque par époque (SITAN comme filtre en continu), de sorte qu'une dérive variable de l'INS est suivie le long de la trace, là où le terrain-nav par lots ne retrouve qu'un unique décalage constant.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Une exécution de <c1/> se résume ainsi : terrain-slam | { "60" } points de passage | RMS inertiel libre { "2947" } m (final { "5082" } m) | RMS recalé sur le terrain { "1241" } m (final { "69" } m, réduction de 2x) | ESS moyen 2599/4000 | sigma de mise en correspondance { "17.0" } m

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
seg-939d877137f6 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-4aca87f022dc = Le graphique que le moteur écrit pour scenarios/terrain-slam.toml, type terrain-slam

# text
seg-832919783819 = <s1>Précédent</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Suivant</s1>time-transfer-budget
