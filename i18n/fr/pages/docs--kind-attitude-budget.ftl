# docs--kind-attitude-budget: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Source : <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (type de scénario)

# text
seg-62c0dda9fc56 = Bilan d'erreur d'attitude et de pointage à 3 DOF : le couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) et un bilan d'erreur de pointage en somme quadratique sur des contributeurs nommés à 1σ (bruit de capteur, gigue des roues de réaction, thermique, alignement) avec le terme dominant, pour une altitude d'orbite + un écart d'inertie du corps. Bilan AOCS scalaire MODELLED — un complément avant matériel à Basilisk/42, et non une simulation de boucle de commande / à 6 DoF / de modes flexibles.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Une exécution de <c1/> se résume ainsi : attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG torque { "7.04e-5" } N·m; pointing { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalar budget)

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-7cf112b1bcc3 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/attitude-budget.toml
seg-91ebbc89f9bb = L'exemple <c1/> définit, entre autres :

# text
seg-c33e3cbba749 = arcsec

# text
seg-36df1bc710ab = alignement

# text
seg-d45f0ee66587 = kg*m^{ "2" }

# text
seg-3e3ce4fa89aa = N*m

# text
seg-0a78a7d6f93f = Étiquette du résultat (celle du moteur) : MODELLED — bilan d'erreur AOCS scalaire à 3 DOF : couple perturbateur de gradient de gravité au pire cas + bilan de pointage en somme quadratique ; PAS une simulation de boucle de commande / à 6 DoF / de modes flexibles (un complément avant matériel à Basilisk/42, et non un remplacement)

# attr:alt
seg-ad0e72e3b688 = Le graphique que le moteur écrit pour scenarios/attitude-budget.toml, type de scénario attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) comme crête sur l'attitude (l'affirmation validée), plus un bilan d'erreur de pointage en somme quadratique sur des contributeurs nommés à 1σ avec le terme dominant (une somme quadratique de nombres fournis par l'appelant Tests : <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) comme crête sur l'attitude (l'affirmation validée), plus un bilan d'erreur de pointage en somme quadratique sur des contributeurs nommés à 1σ . Référence indépendante (ExternalDataset) : Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), une implémentation C++ indépendante du couple de gradient de gravité à tenseur complet : la crête (3/2)(μ/R³)ΔI de Kshana est égale au couple de Basilisk à l'attitude de { "45" } deg à { "1e-12" } relatif près (pire cas { "2.1e-15" }) sur { "5" } altitudes et { "8" } tenseurs d'inertie, et borne le couple de Basilisk sur { "2000" } attitudes aléatoires par cas ; tolérance fixée avant la comparaison. Affirmation validée : le gravity-

# text
seg-d2a6cf813e95 = <b>PARTNER</b> Non fourni — Kshana est un simulateur de performance de navigation, et non un fabricant de plateformes. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
# c1: label
seg-3895121a5466 = MODELLED — bilan d'erreur AOCS scalaire à 3 DOF : couple perturbateur de gradient de gravité au pire cas + bilan de pointage en somme quadratique ; PAS une simulation de boucle de commande / à 6 DoF / de modes flexibles (un complément avant matériel à Basilisk/42, et non un remplacement) (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = Bilan AOCS scalaire MODELLED — un complément avant matériel à Basilisk/42, et non une simulation de boucle de commande / à 6 DoF / de modes flexibles. (catalogue des types de scénario (<c1/>))

# text
seg-333fca11ac0c = PORTÉE HONNÊTE : bilan d'erreur scalaire MODELLED -- un complément avant matériel à Basilisk/42, et PAS une simulation de boucle de commande / à 6 DoF / de modes flexibles. Le terme de gradient de gravité est rapporté comme un couple (le convertir en pointage exige une raideur de commande que possède l'appelant) ; le bilan est la somme quadratique des contributeurs à 1 sigma fournis. Exécution : kshana scenarios/attitude-budget.toml (commentaire du fichier de scénario, lignes { "8" } à { "13" })

# text
seg-0e27fcef1499 = <s1>Précédent</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Suivant</s1>body-pnt
