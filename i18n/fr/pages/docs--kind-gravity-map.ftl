# docs--kind-gravity-map: translations (fr)

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-216efc4e6fba = Type de scénario du moteur v{ $version }, famille <a1>PNT alternatif en environnement sans GPS</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-df8d5e07e737 = mGal

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-0df60ac6343f = <b>MODELLED</b> Appariement de carte gravimétrique, navigation par référence au relief (TERCOM/SITAN), anomalie magnétique. Référence indépendante (InternalConsistency) : coefficients IGRF-14 ; CRLB du filtre adapté issu des premiers principes. Le champ du banc d'essai gravimétrique en champ réel est vérifié en externe (ligne « Gravity-anomaly synthesis from a spherical-harmonic model »), mais son résultat de navigation n'a aucune référence indépendante externe

# text
seg-d776abd5691c = Le PNT alternatif / complémentaire est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Page de famille : <a1>PNT alternatif en environnement sans GPS</a1>

# text
# c1: docs/kinds/by-kind/gravity-map.md
seg-43227f4c8295 = Source : <c1/>

# text
# c1: gravity-map
seg-2a4cb69bc920 = <c1/> (type de scénario)

# text
seg-9a58a7b09423 = Navigation par appariement de carte gravimétrique sans GPS : un gravimètre à atomes froids retrouve une dérive INS constante à partir de la séquence d'anomalies de gravité qu'il traverse.

# text
# c1: scenarios/gravity-map-nav.toml
seg-c8caaff45826 = Une exécution de <c1/> se résume ainsi : gravity-map | free-inertial drift { "78302" } m | gravity-matched { "1882" } m | matching sigma { "2.000e0" } mGal

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
seg-4d9bcce2dd39 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: coeffs
# c2: mascons
# c3: refine_stages
# c4: refine_factor
# c5: noise_seed
# c6: reference
# c7: map_error_mc
seg-54272925e770 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/gravity-map-nav.toml
seg-5dfee3a0cc22 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-c42d90057e9f = Le graphique que le moteur écrit pour scenarios/gravity-map-nav.toml, type de scénario gravity-map

# text
seg-fe3ba7e11502 = <s1>Précédent</s1>gnss-ssv

# text
seg-2b9bdd9def58 = <s1>Suivant</s1>holdover-test
