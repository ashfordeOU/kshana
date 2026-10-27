# docs--kind-body-pnt: translations (fr)

# text
seg-5b561b4fd201 = Mars

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: docs/kinds/by-kind/body-pnt.md
seg-02b8d1f1b7df = Source : <c1/>

# text
# c1: body-pnt
seg-e28ba749a2a1 = <c1/> (type de scénario)

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-e7dad1a1ecba = Positionnement autour de n'importe quel corps du système solaire : un orbiteur ou un atterrisseur de surface autour d'un corps central choisi par son nom (Mars, la Lune, Europe, Ganymède, Titan et le reste du catalogue du système solaire), naviguant avec des pseudodistances à sens unique issues d'une petite constellation de navigation de Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 propre au corps, une horloge utilisateur inconnue) et, facultativement, une mesure de distance aller-retour en espace lointain depuis la Terre, sans horloge, dont la direction et la distance proviennent de l'éphéméride analytique du système solaire à chaque époque. Les lignes de visée sont bloquées par la sphère moyenne du corps, et un utilisateur en surface a aussi besoin du masque d'élévation. Par époque : relais en vue, si la Terre est au-dessus du limbe, le GDOP et le PDOP de la constellation seule (dilution de précision géométrique et de position), l'incertitude formelle de position à un sigma avec et sans la ligne de la Terre, et l'erreur d'une solution des moindres carrés de Gauss-Newton initialisée, dans chaque cas ; sur l'exécution : disponibilité, visibilité de la Terre, PDOP médian, erreur efficace et sigma formel médian, ainsi que le temps de lumière Terre-corps, l'aller-retour, le retard de Shapiro et la séparation par rapport au Soleil à l'époque. MODELLED : les orbites des relais, les niveaux de bruit et le modèle de mesure instantané sont des choix de modélisation, non validés par rapport aux données de navigation d'une mission ; les constantes du corps sont les valeurs publiées citées dans body.rs, et la géométrie de la Terre hérite des étiquettes de l'éphéméride du système solaire.

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-c90c1a79f88b = Une exécution de <c1/> se résume ainsi : Positioning around Mars — orbiter user, { "12" } relays at { "10000" } km, { "296" } epochs Earth light time { "338.3" } s one-way, { "676.6" } s round trip; Sun-Earth-body angle { "175.4" } deg availability: { "1.000" } constellation only, { "1.000" } with the Earth range (Earth in view { "0.811" }) median PDOP { "1.375" } ; RMS error { "1.883" } m constellation only, { "1.629" } m with the Earth range median formal sigma { "1.375" } m constellation only, { "1.304" } m with the Earth range

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-31bacf177d9c = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-3f1989254167 = L'exemple <c1/> définit, entre autres :

# text
seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

# text
seg-753b1683fb7b = m^3/s^{ "2" }

# text
seg-81d4cd54bd62 = Étiquette du résultat (celle du moteur) : MODELLED : orbites de relais à deux corps avec dérive séculaire J2, visibilité géométrique, bruit de distance gaussien et modèle de mesure instantané autour d'un corps à partir des constantes publiées ; non validé par rapport aux données de navigation d'une mission. La géométrie Terre-corps hérite de l'étiquette de l'éphéméride du système solaire

# attr:alt
seg-6f341acbe994 = Le graphique que le moteur écrit pour scenarios/mars-orbit-pnt.toml, type de scénario body-pnt

# text
seg-dae4184bb004 = <b>VALIDATED</b> Le temps de lumière newtonien à sens unique de n'importe quel corps vers n'importe quel autre, reçu à une époque, résolu par le solveur radiométrique de temps de lumière à point fixe (radiometric::light_time_solution, émetteur à sa position retardée) via solar_system::link_o Tests : <a1>solar_system_light_time_preregistered.rs</a1>.

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Le type de scénario <c1/> : un orbiteur ou un atterrisseur de surface autour d'un corps choisi par son nom navigue avec des pseudodistances à sens unique issues d'une constellation de navigation de Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 du corps, une horloge utilisateur inconnue

# text
# c1: body-pnt
seg-5c3f8ac041d3 = <b>MODELLED</b> Le type de scénario <c1/> : un orbiteur ou un atterrisseur de surface autour d'un corps choisi par son nom navigue avec des pseudodistances à sens unique issues d'une constellation de navigation de Walker auto. Référence indépendante (InternalConsistency) : Formes fermées et autocohérence : la troisième loi de Kepler pour la période des relais, le rayon d'orbite et le rayon de surface maintenus sur l'exécution, le fait qu'ajouter une mesure n'augmente jamais l'incertitude formelle, et les erreurs initialisées concordant avec la covariance. Les orbites des relais ignorent les corps tiers (l'attraction de Jupiter sur les relais autour d'Europe n'est pas modélisée), le bruit est gaussien à des niveaux déclarés et le modèle de mesure est instanta

# text
# c1: label
seg-64920deda9cd = MODELLED : orbites de relais à deux corps avec dérive séculaire J2, visibilité géométrique, bruit de distance gaussien et modèle de mesure instantané autour d'un corps à partir des constantes publiées ; non validé par rapport aux données de navigation d'une mission. La géométrie Terre-corps hérite des étiquettes de l'éphéméride du système solaire. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-bcb5cbf9cbe3 = MODELLED : les orbites des relais, les niveaux de bruit et le modèle de mesure instantané sont des choix de modélisation, non validés par rapport aux données de navigation d'une mission ; les constantes du corps sont les valeurs publiées citées dans body.rs, et la géométrie de la Terre hérite des étiquettes de l'éphéméride du système solaire. (catalogue des types de scénario (<c1/>))

# text
seg-04cd882741e2 = MODELLED. Les orbites des relais, le bruit de distance de { "1" } m et le modèle de mesure instantané sont des choix de modélisation ; rien ici n'est validé par rapport aux données de navigation d'une mission. Les constantes de Mars sont les valeurs publiées citées dans src/body.rs. (commentaire du fichier de scénario, lignes { "20" } à { "22" })

# text
seg-df6bae4c422e = Le positionnement autour de n'importe quel corps du système solaire avec une constellation locale et une liaison en espace lointain depuis la Terre est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-670191cf797f = Page thématique : <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Page thématique : <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-a4c650a0eb7a = <s1>Précédent</s1>attitude-budget

# text
seg-96170e5c8e3f = <s1>Suivant</s1>campaign
