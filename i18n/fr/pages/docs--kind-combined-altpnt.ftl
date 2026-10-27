# docs--kind-combined-altpnt: translations (fr)

# text
# c1: docs/kinds/by-kind/combined-altpnt.md
seg-a83b25413fd8 = Source : <c1/>

# text
# c1: combined-altpnt
seg-92b24377c9be = <c1/> (type de scénario)

# text
seg-216efc4e6fba = Type de scénario du moteur v{ $version }, famille <a1>PNT alternatif en environnement sans GPS</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-f496b7f4c63a = Navigateur combiné gravité + magnétisme + relief sans GPS : trois canaux de champ scalaire fusionnés à chaque point de passage pour obtenir un recalage de la dérive plus précis (CRLB plus bas) que n'importe quel champ seul.

# text
# c1: scenarios/combined-altpnt.toml
seg-670730bd221e = Une exécution de <c1/> se résume ainsi : combined-altpnt | free-inertial drift { "70659" } m | gravity { "464" } m magnetic { "782" } m terrain { "368" } m | FUSED { "365" } m

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
seg-cf6981466329 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: coeffs
# c2: mascons
# c3: magnetic_mascons
# c4: igrf_alt_km
# c5: refine_stages
# c6: refine_factor
# c7: noise_seed
# c8: magnetic_grid
seg-078f09d100fa = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/combined-altpnt.toml
seg-557db767b9c3 = L'exemple <c1/> définit, entre autres :

# text
seg-df8d5e07e737 = mGal

# attr:alt
seg-498b1aea3770 = Le graphique que le moteur écrit pour scenarios/combined-altpnt.toml, type de scénario combined-altpnt

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-0df60ac6343f = <b>MODELLED</b> Appariement de carte gravimétrique, navigation par référence au relief (TERCOM/SITAN), anomalie magnétique. Référence indépendante (InternalConsistency) : coefficients IGRF-14 ; CRLB du filtre adapté issu des premiers principes. Le champ du banc d'essai gravimétrique en champ réel est vérifié en externe (ligne « Gravity-anomaly synthesis from a spherical-harmonic model »), mais son résultat de navigation n'a aucune référence indépendante externe

# text
seg-d776abd5691c = Le PNT alternatif / complémentaire est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Page de famille : <a1>PNT alternatif en environnement sans GPS</a1>

# text
seg-49efcd2ced81 = <s1>Précédent</s1>clock

# text
seg-f2ccea3bb03e = <s1>Suivant</s1>conflict-resilience
