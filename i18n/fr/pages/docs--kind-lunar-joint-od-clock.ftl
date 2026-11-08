# docs--kind-lunar-joint-od-clock: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
# c1: docs/kinds/by-kind/lunar-joint-od-clock.md
seg-593938ee5995 = Source : <c1/>

# text
# c1: lunar-joint-od-clock
seg-d54a85227f43 = <c1/> (type de scénario)

# text
seg-200e58e189c2 = Estimateur par lots modélisé conjoint multi-techniques de détermination d'orbite lunaire + horloge sur un réseau SIMULÉ : un ajustement instantané de Gauss-Newton qui fusionne les retards VLBI géodésiques sur des lignes de base terrestres, les distances station↔satellite locales à la Lune et les distances inter-satellites pour retrouver, ensemble, la position 3D d'une station de surface lunaire, les positions d'une petite constellation et le décalage d'horloge de chaque élément à partir d'une vérité injectée. Le résultat principal, honnête — le VLBI rend observable la position 3D complète de la station là où la seule télémétrie locale à la Lune laisse une direction faiblement observée — est rapporté sous la forme du contraste d'erreur de station avec et sans VLBI. Récupération en boucle fermée simulée MODELLED (la vérité partage le modèle d'observation), déterministe (graine), NON vérifiée sur des données réelles ; aucune propagation par modèle de forces dans le résolveur ; aucun TRL, héritage ni aval d'une agence.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Une exécution de <c1/> se résume ainsi : lunar-joint-od-clock | { "3" } sats, { "6" } Earth stations | station 3-D err with VLBI { "3.54" } m vs range-only { "2184.02" } m ({ "617.5" }× sharper) | sat pos RMS { "2.20" } m | station clk err { "2.87e-10" } s | obs 40/16 params

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-be3bcad756cc = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-ef164af52468 = L'exemple <c1/> définit, entre autres :

# text
seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

# attr:alt
seg-cfa051b87e59 = Le graphique que le moteur écrit pour scenarios/lunar-joint-od-clock.toml, type de scénario lunar-joint-od-clock

# text
seg-4c6914c162d1 = <b>VALIDATED</b> Fusion par lots du VLBI + distance locale à la Lune + distance inter-satellites pour retrouver les positions et les horloges de la station et de la constellation. Référence indépendante (ExternalDataset) : P2 : numpy { "2.4.6" } (numpy.linalg.lstsq avec LAPACK gelsd, numpy.linalg.inv ; BSD-3) recalcule chaque pas de Gauss-Newton, la solution convergée des moindres carrés pondérés, les sigmas formels et l'erreur de station sur les jacobiens et observations figés de six réseaux simulés, préenregistrés (5094bc31) à max({ "1e-8" }, { "100" } kappa eps) en relatif. La première exécution a échoué sur le réseau sans VLBI ({ "6.1e-7" } contre { "1e-8" }, une équation normale en

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Information de Fisher M=HᵀWH, borne inférieure de Cramér–Rao, rang d'observabilité / espace nul du défaut de datum (pseudo-inverse de Moore–Penrose), et plan d'expérience optimal D/A/E/T. Référence indépendante (ExternalDataset) : NumPy { "2.4.1" } (numpy.linalg.eigh / .inv ; BSD-3-Clause, reposant sur LAPACK) — une autorité tierce indépendante calculant les mêmes valeurs propres définies de façon unique, la covariance de Cramér–Rao σ²(XᵀX)⁻¹ et les facteurs de dilution de précision GNSS par un algorithme différent (diviser pour régner de LAPACK + LU) de celui du balayage cyclique de Jacobi et de la pseudo-inverse spectrale de Kshana ; concordance à { "1e-9" }. La même classe de bibliothèque externe valide déjà le D

# text
seg-af12da412a10 = <b>MODELLED</b> Observabilité par information de Fisher de la résolution lunaire conjointe : sans lignes de base terrestres, le datum du référentiel absolu se trouve dans l'espace nul de HᵀWH (position de la station inobservable. Référence indépendante (InternalConsistency) : structure analytique du défaut de datum — le mode inobservable du référentiel absolu se trouve dans l'espace nul de l'information de Fisher (forme close), le seuil de rang correspond à la justification publiée de la conception à 3 stations, et l'estimateur atteint la CRLB qui en résulte en Monte-Carlo. La géométrie lunaire elle-même est un réseau représentatif (et non une éphéméride volée), de sorte que la ligne reste MODELLED ; le moteur FIM/CRLB sous-jacent est vérifié par rapport à

# text
# c1: kshana kinds --json
seg-865ba2668582 = Récupération en boucle fermée simulée MODELLED (la vérité partage le modèle d'observation), déterministe (graine), NON vérifiée sur des données réelles ; aucune propagation par modèle de forces dans le résolveur ; aucun TRL, héritage ni aval d'une agence. (catalogue des types de scénario (<c1/>))

# text
seg-a0d4350a1c66 = Honnêteté : récupération en boucle fermée simulée MODELLED. Une vérité injectée est transformée en observables synthétiques par le MÊME modèle géométrique que le résolveur inverse, un bruit gaussien initialisé par une graine est ajouté, et l'estimateur retrouve la vérité injectée dans les limites du bruit. La référence indépendante est la cohérence interne (récupération de la vérité + réalisme de covariance NEES), et NON une vérification sur des données réelles. Il n'y a aucune propagation par modèle de forces dans le résolveur — le sate (commentaire du fichier de scénario, lignes { "24" } à { "29" })

# text
seg-1465694e7e4f = L'observabilité de la station absolue lunaire (défaut de datum) est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Précédent</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Suivant</s1>lunar-llr-datum
