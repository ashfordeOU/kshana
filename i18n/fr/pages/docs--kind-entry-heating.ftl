# docs--kind-entry-heating: translations (fr)

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-a44edb1eb84d = kg

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-d72b4c5393e0 = earth

# text
# c1: docs/kinds/by-kind/entry-heating.md
seg-13b9e9187ab9 = Source : <c1/>

# text
# c1: entry-heating
seg-3a3f732cc2dd = <c1/> (type de scénario)

# text
seg-b843e2e0a4ee = Entrée atmosphérique à masse ponctuelle et 3 degrés de liberté au-dessus d'une Terre ou d'un Mars sphérique en rotation (balistique ou portante à inclinaison constante), RK4, à travers US76, une atmosphère exponentielle ou l'atmosphère martienne, avec un échauffement convectif au point d'arrêt de Sutton-Graves (NASA TR R-376) : décélération, flux thermique et pression dynamique de pointe, charge thermique, portée au sol, un contrôle d'énergie en référentiel tournant et la forme fermée d'Allen-Eggers à côté. La décélération de pointe est vérifiée par rapport au nominal publié de Stardust ; l'échauffement est MODELLED.

# text
# c1: scenarios/entry-heating-stardust.toml
seg-05c8dac8d411 = Une exécution de <c1/> se résume ainsi : entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-96504cafb034 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/entry-heating-stardust.toml
seg-1b68d973fd30 = L'exemple <c1/> définit, entre autres :

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistic consta

# text
seg-3159fc595ac9 = kg/m^{ "3" }

# text
seg-2721e146b7be = Étiquette du résultat (celle du moteur) : MODELLED — entrée à masse ponctuelle et 3 degrés de liberté au-dessus d'une planète sphérique en rotation (gravité centrale, sans J2), atmosphère co-rotative sans vent, C_D, L/D et inclinaison constants, RK4 ; échauffement convectif au point d'arrêt selon NASA TR R-376 ({ "1971" }), paroi froide, AUCUN échauffement radiatif, AUCUNE réponse du TPS/de l'ablation, PAS à 6 degrés de liberté

# attr:alt
seg-dbb618cd6357 = Le graphique que le moteur écrit pour scenarios/entry-heating-stardust.toml, type de scénario entry-heating

# text
seg-e73b339df97b = <b>VALIDATED</b> Une entrée à masse ponctuelle et 3 degrés de liberté au-dessus d'une Terre sphérique en rotation à travers l'atmosphère standard américaine { "1976" }, intégrée par RK4 à partir d'un état d'entrée inertiel, indiquant la décélération de pointe et son altitude ; l'état d'entrée par rapport à la planète à partir de l'i Tests : <a1>entry_stardust_published.rs</a1>.

# text
seg-10124432b79b = <b>MODELLED</b> Flux thermique convectif au point d'arrêt q = k sqrt(rho/R_n) V^{ "3" } avec les constantes de Sutton-Graves pour l'air terrestre et l'atmosphère martienne (NASA TR R-376, { "1971" }), son pic et la charge thermique intégrée le long d'une entrée à 3 degrés de liberté, balistique ou portante à c Tests : <a1>entry_stardust_published.rs</a1>.

# text
seg-54d133781215 = <b>VALIDATED</b> Une entrée à masse ponctuelle et 3 degrés de liberté au-dessus d'une Terre sphérique en rotation à travers l'atmosphère standard américaine { "1976" }, intégrée par RK4 à partir d'un état d'entrée inertiel, indiquant. Référence indépendante (ExternalDataset) : le nominal de Stardust de Desai, Mitcheltree et Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }) : décélération maximale de { "33.4" } g à { "12.6" } km/s par rapport à la planète avec la masse au lancement de { "45.8" } kg, une trajectoire POST à 6 degrés de liberté avec la base de données aérodynamique complète ; interface d'entrée d'après Desai, Lyons, Tooley et Kangas (NTRS { "20090004445" }) : rayon { "6503.14" } km, { "12.9" } km/s inertiel à -8.2 deg. Seuils préenregistrés dans xval/entry-stardust/PREREGISTRATION.

# text
seg-03878684f9a1 = <b>MODELLED</b> Flux thermique convectif au point d'arrêt q = k sqrt(rho/R_n) V^{ "3" } avec les constantes de Sutton-Graves pour l'air terrestre et l'atmosphère martienne (NASA TR R-376, { "1971" }), son . Référence indépendante (InternalConsistency) : cohérence interne : la relation et les constantes telles qu'imprimées dans NASA TR R-376, un contrôle de convergence par demi-pas, et l'ordre attendu des pics d'échauffement et de décélération. CE QUI NE L'EST PAS : aucune valeur d'échauffement publiée n'a été comparée (les articles sur Stardust donnent une limite de conception et une estimation convective plus radiative d'environ { "1200" } W/cm2, qu'une relation uniquement convective ne peut pas égaler) ; aucun échauffement radiatif, aucune température de paroi ni

# text
# c1: label
seg-a0f300b2ce78 = MODELLED — entrée à masse ponctuelle et 3 degrés de liberté au-dessus d'une planète sphérique en rotation (gravité centrale, sans J2), atmosphère co-rotative sans vent, C_D, L/D et inclinaison constants, RK4 ; échauffement convectif au point d'arrêt selon NASA TR R-376 ({ "1971" }), paroi froide, AUCUN échauffement radiatif, AUCUNE réponse du TPS/de l'ablation, PAS à 6 degrés de liberté (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-47f81ab160cc = La décélération de pointe est vérifiée par rapport au nominal publié de Stardust ; l'échauffement est MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-47cda83af127 = Interface d'entrée à un rayon de { "6503.14" } km, { "12.9" } km/s inertiel à -8.2 deg, { "45.8" } kg, { "0.811" } m de diamètre, { "0.2202" } m de rayon de nez (Desai et al., NASA NTRS { "20050042027" } et { "20090004445" }). La latitude et le cap sont une entrée approximative supposée au-dessus du Pacifique ; C_D est la valeur par défaut du module pour une sphère-cône de { "60" } deg. Décélération de pointe nominale publiée à 6 degrés de liberté : { "33.4" } g. L'échauffement est uniquement convectif de Sutton-Graves, MODELLED. (commentaire du fichier de scénario, lignes { "4" } à { "8" })

# text
seg-98af076be1ac = L'échauffement convectif d'entrée au point d'arrêt (Sutton-Graves) sur une entrée à 3 degrés de liberté est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-77c073cd5d67 = <s1>Précédent</s1>earth-gnss-lunar

# text
seg-20ce5d56783c = <s1>Suivant</s1>eo-coverage
