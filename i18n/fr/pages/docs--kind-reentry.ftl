# docs--kind-reentry: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation, à travers l'US Standard Atmosphere { "1976" } (densité et pression), avec un coup de tangage, une poussée réduite par la contre-pression de la tuyère, des fins de combustion d'étage à des s exacts

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-195347c63a8a = m/s^{ "2" }

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Source : <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (type de scénario)

# text
seg-039f77066d97 = Corridor de rentrée balistique d'Allen-Eggers : décélération maximale (indépendante du coefficient balistique, V_e^{ "2" } sin|γ|/(2eH)), vitesse et altitude au pic de g, et vitesse au pic d'échauffement, pour une vitesse d'entrée, un angle de trajectoire et un coefficient balistique donnés dans une atmosphère exponentielle, plus une intégration planaire en masse ponctuelle de la même entrée balistique avec la gravité, la courbure de la Terre et l'atmosphère standard américaine { "1976" } (décélération maximale, vitesse, altitude et instant du pic). Entrée balistique (sans portance) MODELLED ; la sortie d'échauffement est la VITESSE au pic d'échauffement, et non un flux thermique (pas de modèle aérothermique ni de protection thermique).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Une exécution de <c1/> se résume ainsi : reentry (Allen–Eggers) : V_e { "7800" } m/s, γ { "6.0" }° -> pic { "16.6" } g à { "49" } km, { "4731" } m/s ; l'échauffement culmine à { "6603" } m/s ; masse ponctuelle (gravité, courbure, US76) pic { "16.4" } g (balistique MODELLED, sans aérothermique)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = L'exemple <c1/> définit, entre autres :

# text
seg-0b7769c97ff3 = Libellé du résultat (celui du moteur) : MODELLED — entrée balistique (sans portance) d'Allen–Eggers, atmosphère exponentielle isotherme, angle de trajectoire constant ; le pic de g est indépendant du coefficient balistique ; l'échauffement est la VITESSE au pic d'échauffement, et NON un flux thermique (pas de modèle aérothermique ni de protection thermique)

# attr:alt
seg-b0109481e8ff = Le graphique que le moteur écrit pour scenarios/reentry.toml, type reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Décélération maximale (indépendante du coefficient balistique), vitesse et altitude au pic de g, et vitesse au pic d'échauffement pour une entrée balistique dans une atmosphère exponentielle. Tests : <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Décélération maximale (indépendante du coefficient balistique), vitesse et altitude au pic de g, et vitesse au pic d'échauffement pour une entrée balistique dans une atmosphère exponentielle. R. Référence indépendante (InternalConsistency) : entrée analytique d'Allen–Eggers en forme fermée, en outre recoupée avec une intégration numérique scipy { "1.18" } solve_ivp (DOP853) de la MÊME EDO d'entrée à traînée seule (tests/ballistic_re_entry_corridor_reference.rs, { "36" } cas, pire a_max rel { "2.9e-9" }) — une vérification d'une intégrale numérique par rapport à sa propre forme analytique, donc toujours InternalConsistency, et NON une validation externe. Balistique (sans portance) MODELLED, sans aérothermique ni protection thermique — la sortie d'échauffement est une ve

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — entrée balistique (sans portance) d'Allen–Eggers, atmosphère exponentielle isotherme, angle de trajectoire constant ; le pic de g est indépendant du coefficient balistique ; l'échauffement est la VITESSE au pic d'échauffement, et NON un flux thermique (pas de modèle aérothermique ni de protection thermique) (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = Entrée balistique (sans portance) MODELLED ; la sortie d'échauffement est la VITESSE au pic d'échauffement, et non un flux thermique (pas de modèle aérothermique ni de protection thermique). (catalogue des types (<c1/>))

# text
seg-080b28422342 = PORTÉE HONNÊTE : balistique (sans portance) MODELLED, atmosphère exponentielle isotherme, angle de trajectoire constant. Pas de modèle aérothermique ni de protection thermique -- la sortie d'échauffement est la VITESSE au pic d'échauffement, et non un flux thermique. Pas une trajectoire à 3 ou 6 degrés de liberté. Exécution : kshana scenarios/reentry.toml (commentaire du fichier de scénario, lignes { "8" } à { "11" })

# text
seg-cfc345f0dc0d = Le corridor de rentrée balistique (Allen–Eggers) est MODELLED, non validé : vérifié par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Précédent</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Suivant</s1>slot-timing
