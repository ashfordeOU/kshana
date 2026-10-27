# docs--kind-space-weather: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Source : <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (type de scénario)

# text
seg-5f25c5b71f0c = Modèle d'environnement de météorologie spatiale : indices d'activité solaire (F10.7/F10.7a) et géomagnétique (Kp, avec la table de définition Kp↔ap), la température exosphérique de Jacchia-1971 qu'ils pilotent (validée par rapport aux minimum, moyenne et maximum solaires publiés), et la densité neutre thermosphérique de Jacchia-1971 à la température exosphérique moyenne diurne par rapport au profil statique sans activité, à un ensemble d'altitudes — la dépendance de la densité au cycle solaire que l'atmosphère statique omet. MODELLED : la densité concorde avec les densités dérivées d'accéléromètres (TOLEOS CHAMP et GRACE) à un facteur { "2" } près au maximum solaire mais est environ 1.7x trop dense au minimum solaire de { "2008" }.

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Une exécution de <c1/> se résume ainsi : space-weather : F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K ; densité x1.49 à { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = L'exemple <c1/> définit, entre autres :

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Libellé du résultat (celui du moteur) : MODELLED — indices solaires et géomagnétiques, température exosphérique de Jacchia-71 et densité statique de Jacchia-71 à la température moyenne diurne

# attr:alt
seg-c1c6f2f73fb5 = Le graphique que le moteur écrit pour scenarios/space-weather.toml, type space-weather

# text
seg-15587da59e8e = <b>MODELLED</b> Indices solaires et géomagnétiques (table de définition Kp↔ap), température exosphérique de Jacchia-1971 et densité thermosphérique de Jacchia { "1971" } (SAO Special Report { "332" } : profils de diffusion statiques reproduisant sa Table { "7" }, avec les effets diurne, géomagne

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Indices solaires et géomagnétiques (table de définition Kp↔ap), température exosphérique de Jacchia-1971 et densité thermosphérique de Jacchia { "1971" } (SAO Special Report { "33" }. Référence indépendante (ExternalDataset) : table de définition Kp↔ap + forme fermée de la température exosphérique de Jacchia-1971 (concordant à <{ "1" } K avec les ancrages publiés, tests/space_weather_reference.rs) ; la densité est caractérisée par rapport à pymsis NRLMSISE-00 (un modèle NRL indépendant) : l'amplitude du cycle solaire à { "800" } km est de 10.4x contre 13.6x pour NRLMSISE-00. Révision { "0.30" } : le facteur d'activité calibré du premier ordre a été remplacé par Jacchia { "1971" } (densité du scénario par défaut à { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — indices solaires et géomagnétiques, température exosphérique de Jacchia-71 et densité statique de Jacchia-71 à la température moyenne diurne (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED : la densité concorde avec les densités dérivées d'accéléromètres (TOLEOS CHAMP et GRACE) à un facteur { "2" } près au maximum solaire mais est environ 1.7x trop dense au minimum solaire de { "2008" }. (catalogue des types (<c1/>))

# text
seg-b86a312077b5 = PORTÉE HONNÊTE : MODELLED. La conversion Kp<->ap est la table de définition de l'IAGA et la température exosphérique est validée par rapport aux ordres de grandeur publiés du minimum, de la moyenne et du maximum solaires, mais la correction de densité est un couplage de hauteur d'échelle du PREMIER ORDRE CALIBRÉ — elle capture le bon signe, la monotonie et l'ordre de grandeur, et NON la précision absolue d'une atmosphère validée sur des données (NRLMSISE-00). Exécution : kshana scenarios/space-weath (commentaire du fichier de scénario, lignes { "10" } à { "15" })

# text
seg-10cf16c12a2a = L'environnement de météorologie spatiale et la densité thermosphérique pilotée par l'activité sont MODELLED, non validés : une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Précédent</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Suivant</s1>spectrum
