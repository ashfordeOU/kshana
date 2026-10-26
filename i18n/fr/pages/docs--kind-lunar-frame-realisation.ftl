# docs--kind-lunar-frame-realisation: translations (fr)

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajustement d'un datum de Helmert à 7 paramètres + rattachement d'orientation ICRF à partir d'un réseau de points. Référence indépendante (ExternalDataset) : résolveur indépendant de transformation de similitude d'Umeyama (Horn) pondérée en forme close (basé sur la SVD de numpy/scipy ; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — un algorithme différent de l'ajustement itératif de Gauss–Newton de kshana, atteignant le même optimum des moindres carrés pondérés défini de façon unique sur des réseaux de points identiques à l'octet près

# text
# c1: docs/kinds/by-kind/lunar-frame-realisation.md
seg-0225ace73ba8 = Source : <c1/>

# text
# c1: lunar-frame-realisation
seg-a092c5795651 = <c1/> (type de scénario)

# text
seg-0c4c119abfca = Réalisation modélisée du référentiel lunaire : ajustement d'un datum de Helmert (similitude) à 7 paramètres — { "3" } de translation, { "3" } de rotation à petit angle, { "1" } d'échelle — rattachant un ensemble estimé de coordonnées de points MCMF dérivées de coordonnées sélénographiques à un datum par moindres carrés pondérés (crate::batch_ls::gauss_newton), plus un simple rattachement d'orientation exprimant la petite rotation réalisée autour des axes de l'ICRF par rapport à l'orientation du corps WGCCRE de l'UAI { "2015" }. Le scénario injecte une petite transformation connue (translation ~dizaines de m, rotation ~µrad, échelle ~{ "1e-7" }) dans un réseau de points synthétique bien réparti, ajoute un bruit gaussien initialisé par une graine, retrouve le datum, et rapporte la transformation retrouvée, l'erreur de récupération par paramètre par rapport à la vérité injectée, et le résiduel RMS après ajustement. Autocohérence MODELLED — retrouve une transformation de similitude injectée (sans bruit à ~la précision machine), et NON une réalisation par rapport à de vraies données de suivi/VLBI ; déterministe (graine) ; aucun TRL, héritage ni aval d'une agence.

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-32d5e2749e64 = Une exécution de <c1/> se résume ainsi : lunar-frame-realisation | { "8" } points | translation err { "3.125e-1" } m, rotation err { "3.418e-7" } rad, scale err -5.891e2 ppb | rms residual { "0.887" } m | converged false

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-e732d2c2ab91 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-29f85024974b = L'exemple <c1/> définit, entre autres :

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# attr:alt
seg-f3a6d69d0225 = Le graphique que le moteur écrit pour scenarios/lunar-frame-realisation.toml, type de scénario lunar-frame-realisation

# text
# c1: kshana kinds --json
seg-f99a78efa965 = Autocohérence MODELLED — retrouve une transformation de similitude injectée (sans bruit à ~la précision machine), et NON une réalisation par rapport à de vraies données de suivi/VLBI ; déterministe (graine) ; aucun TRL, héritage ni aval d'une agence. (catalogue des types de scénario (<c1/>))

# text
seg-238cea087ae0 = Honnêteté : autocohérence MODELLED. La référence indépendante est la récupération d'une transformation de similitude à 7 paramètres injectée (sans bruit à ~la précision machine) plus l'identité algébrique d'aller-retour de apply_helmert. Ce n'est PAS une réalisation du référentiel lunaire par rapport à de vraies données de suivi / VLBI, et elle ne revendique aucune précision de référentiel absolue. Déterministe (graine). Aucun TRL, héritage de vol ni aval d'une agence n'est revendiqué. (commentaire du fichier de scénario, lignes { "23" } à { "27" })

# text
seg-07550d3d9610 = <s1>Précédent</s1>lunar-frame-campaign

# text
seg-5a3a7120aae2 = <s1>Suivant</s1>lunar-infrastructure
