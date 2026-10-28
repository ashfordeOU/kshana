# docs--kind-mars-pnt: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Le type de scénario <c1/> : un orbiteur ou un atterrisseur de surface autour d'un corps choisi par son nom navigue avec des pseudodistances à sens unique issues d'une constellation de navigation de Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 du corps, une horloge utilisateur inconnue

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-670191cf797f = Page thématique : <a1>SOLAR-SYSTEM.md</a1>

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Horloge de Kalman de van Loan à 3 états (phase/fréquence/dérive), stabilisée de Joseph. Référence indépendante (ReferenceImpl) : filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van Loan { "1978" } — une implémentation de référence indépendante qui reproduit toute la trajectoire du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge et l'étalonnage d'Allan ne sont pas validés en externe, ce qui laisse cela MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les horloges IGS finales de { "30" } s de { "11" } GPS Blo

# text
seg-8de95b3a9229 = L'estimation de l'état de l'horloge embarquée est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/mars-pnt.md
seg-c68502b9d675 = Source : <c1/>

# text
# c1: mars-pnt
seg-46072326d616 = <c1/> (type de scénario)

# text
seg-3f749aef8d89 = PNT martien en espace lointain : une constellation simulée de relais MARCONI (relais aréostationnaires + inclinés diffusant à sens unique + relayant en aller-retour vers une station en espace lointain) navigue pour un utilisateur de référence (transfert | lmo | surface) grâce à l'estimateur conjoint de fusion radiométrique à sens unique/aller-retour. Rapporte par époque la géométrie/visibilité, le RMS atteint par rapport à la vérité, et la covariance formelle (position à 1σ / 3σ) — une figure de mérite simulée honnête, PAS un niveau de protection certifié.

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-0254f9bd0ee6 = Une exécution de <c1/> se résume ainsi : mars-pnt 5aad87fcc94a | lmo user, uso clock | { "5" } relays (mean { "3.1" } in view) | converged pos RMS { "0.25" } m, formal 1σ { "0.31" } m (3σ { "0.93" } m — covariance FoM, not a certified PL) | clock-freq σ { "3.71e-13" } | cov-PD true

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-8eb513e7aeea = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-5a9640a3f9b4 = L'exemple <c1/> définit, entre autres :

# text
seg-8e0fecea19fc = uso

# text
seg-a16f2332397c = lmo

# attr:alt
seg-c564dca90854 = Le graphique que le moteur écrit pour scenarios/mars-pnt-lmo.toml, type de scénario mars-pnt

# text
seg-83c3a84f6b98 = <b>VALIDATED</b> Retrouver un état d'époque [r,v] à partir de distances de stations au sol par un correcteur différentiel par lots de Gauss–Newton et un filtre séquentiel, sur un modèle de forces à deux corps+J2. Référence indépendante (ExternalDataset) : Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — une bibliothèque d'estimation tierce indépendante sur un modèle de forces apparié ; l'état d'époque retrouvé et le RMS des résidus après ajustement concordent à <{ "1e-3" } m sans bruit et <{ "3" } m à un plancher de bruit de { "5" } m

# text
seg-4be479b81f39 = <s1>Précédent</s1>lunar-vlbi

# text
seg-2854e6a75833 = <s1>Suivant</s1>moonlight-service-volume

seg-6d595f01ffcc = <s1>Suivant</s1>mission-thread
