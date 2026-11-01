# docs--kind-terrain-nav: translations (fr)

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
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Source : <c1/>

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (type de scénario)

# text
seg-0d7bf5a4f07e = Navigation par référence au terrain (TERCOM/SITAN) en l'absence de GPS : un altimètre radar/barométrique met en correspondance le profil d'altitude du sol avec un MNT de type SRTM pour retrouver la dérive de l'INS.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Une exécution de <c1/> se résume ainsi : terrain-nav | dérive inertielle libre { "70659" } m | recalée sur le terrain { "53" } m (réduction de 1342x) | sigma de mise en correspondance { "17.0" } m

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
seg-db286a072e43 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Champs facultatifs : <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-c5e33c7122e2 = Le graphique que le moteur écrit pour scenarios/terrain-nav.toml, type terrain-nav

# text
seg-0fcad0016c78 = <s1>Précédent</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Suivant</s1>terrain-slam

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> Le type et la phase <c1/> : un modèle d'erreur inertielle à cinq états par axe (position, vitesse, biais d'accéléromètre, inclinaison, biais de gyroscope) sur une descente propulsée, aidé par des points AFS (autonomes ou différentiels, avec le cas à trois relais aidé par l'horloge
