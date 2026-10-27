# docs--kind-cislunar-observability: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-6d584e86deba = rapport (sans dimension)

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
# c1: docs/kinds/by-kind/cislunar-observability.md
seg-258f128cea60 = Source : <c1/>

# text
# c1: cislunar-observability
seg-f0c7758e472f = <c1/> (type de scénario)

# text
seg-7ccd0a3babb8 = Observabilité MODELLED d'une constellation cislunaire plane (P6) : suit une constellation plane de quatre engins sur DRO plane corrigée différentiellement avec mesure de distance inter-satellites et rapporte quelle part de l'état à quatre composantes [x,y,ẋ,ẏ] d'un engin l'arc rend observable. Émet ({ "1" }) le tableau rang-contre-longueur d'arc pour une seule liaison de distance seule — de rang 1 instantanément, croissant vers l'état complet à quatre composantes à mesure que l'arc s'allonge (P6 Tableau { "1" }) ; ({ "2" }) le spectre propre du Gramien d'observabilité + le nombre de conditionnement sur l'arc ; ({ "3" }) la comparaison de rang instantané distance seule contre distance + vitesse de distance (le levier de conception Doppler) plus le rapport de GDOP indéfini en distance seule / défini en distance + vitesse ; et ({ "4" }) une validation croisée indépendante par SRIF dont la covariance a posteriori devient finie / bien conditionnée exactement à l'arc où le rang observable atteint quatre. Cœur VALIDATED : le rang observable est un seuil de valeur singulière révélateur du rang, recoupé avec le rang propre du Gramien ; le spectre propre obéit aux invariants spectraux (trace=Σλ, det=Πλ, Frobenius²=Σλ²) ; la STM variationnelle est la STM du CR3BP validée par différences finies ; les lignes du jacobien de distance / vitesse de distance sont des dérivées partielles analytiques validées par différences finies (recoupées avec l'observable de vitesse de distance 3-D de la crate) ; les quatre conditions initiales sont des DRO planes corrigées différentiellement qui se ferment à un résidu de périodicité serré et sont rétrogrades ; la transition de rang est validée de façon croisée par le filtre d'information en racine carrée de la crate (covariance a posteriori finie exactement au rang plein, cond(P)=cond(OᵀO)) ; un instantané à rang déficient est signalé GDOP indéfini (fim condition=inf), jamais une valeur finie factice — la même garde de géométrie singulière que pvt::solve_spp applique. MODELLED : la conception de la constellation (amplitudes et phases au périlune des DRO) et la progression spécifique du rang qu'elle produit. Ce n'est pas un produit de performance de navigation certifié.

# text
# c1: scenarios/cislunar-observability.toml
seg-a59f2fa9efb9 = Une exécution de <c1/> se résume ainsi : cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h arc, { "24" } epochs | rank { "1" } → { "4" } of { "4" } over arc | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | instantaneous rank range-only { "2" } → range+rate { "4" } ({ "3" } links) | GDOP range-only undefined range+rate { "6.353" } | DRO ICs (max periodicity residual { "4.7e-9" }) | SRIF posterior finite at rank-4 epoch { "8" } (rang/STM/fermeture des DRO/SRIF validés, conception modélisée)

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-fb1601eda130 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/cislunar-observability.toml
seg-f3b5cc590c78 = L'exemple <c1/> définit, entre autres :

# text
seg-0cc8ab10786b = unités de temps du référentiel tournant

# text
seg-84781b6fff48 = GDOP indéfini (à rang déficient / singula

# text
seg-856eb311f24b = « indéfini » (texte tel que l'indique le document

# text
seg-1767b216650d = défini

# text
seg-fc5d34345fdd = Étiquette du résultat (celle du moteur) : observabilité MODELLED d'une constellation cislunaire plane (P6). Cœur VALIDATED : le RANG observable est un seuil de valeur singulière révélateur du rang, recoupé avec le rang propre du Gramien ; le spectre propre du Gramien obéit aux invariants spectraux (trace = somme des val. propres, det = produit des val. propres, Frobenius^{ "2" } = somme des val. propres^{ "2" }

# attr:alt
seg-f15bbf30b0dd = Le graphique que le moteur écrit pour scenarios/cislunar-observability.toml, type de scénario cislunar-observability

# text
seg-4564ad90378b = <b>MODELLED</b> Le seuil d'observabilité cislunaire selon la longueur d'arc dans le CR3BP SPATIAL à six états plutôt que dans sa version plane à quatre états, pour les familles DRO, halo L2 et halo quasi rectiligne L2, le bruit de mesure entrant dans le gramien et DEUX critères rapportant

# text
seg-9f857ff85800 = <b>MODELLED</b> Le seuil d'observabilité cislunaire selon la longueur d'arc dans le CR3BP SPATIAL à six états plutôt que dans sa version plane à quatre états, pour les familles DRO, halo L2 et halo quasi rectiligne L2 ha. Référence indépendante (InternalConsistency) : un rang indépendant par échelonnement de lignes, obtenu par élimination de Gauss avec pivot partiel, confirme chaque verdict de rang à six états — un algorithme différent, qui ne partage aucun code avec la voie valeurs propres/SVD testée. La matrice de transition d'état { "6" }×{ "6" } du CR3BP que cela compose porte sa propre référence indépendante ReferenceImpl, face à l'intégration variationnelle de SciPy, et les conditions initiales des halos/NRHO proviennent d'un correcteur qui reproduit le L2 sud publié

# text
# c1: label
seg-53c183035bde = Observabilité MODELLED d'une constellation cislunaire plane (P6). Cœur VALIDATED : le RANG observable est un seuil de valeurs singulières révélateur du rang, recoupé avec le rang des valeurs propres du gramien ; le spectre de valeurs propres du gramien obéit aux invariants spectraux (trace = somme des valeurs propres, det = produit des valeurs propres, Frobenius^{ "2" } = somme des valeurs propres^{ "2" }) ; la STM variationnelle est la STM du CR3BP validée par différences finies (crate::cr3bp) ; les lignes jacobiennes de distance / taux de variation de distance (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-f6a217f57bec = Observabilité MODELLED d'une constellation cislunaire plane (P6) : suit une constellation de quatre engins spatiaux en DRO plane corrigée par différentiation, avec télémétrie inter-satellites, et indique quelle part de l'état à quatre composantes [x,y,ẋ,ẏ] d'un engin l'arc rend observable. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-e5182743fd40 = MODELLED : la conception de la constellation (amplitudes et phases des périlunes de la DRO) et la progression de rang précise qu'elle produit. (catalogue des types de scénario (<c1/>))

# text
seg-5d3a370f1295 = Franchise : MODELLED. Cœur VALIDATED -- le RANG observable est un seuil de valeurs singulières révélateur du rang, recoupé avec le rang des valeurs propres du gramien ; le spectre de valeurs propres obéit aux invariants spectraux (trace = somme des valeurs propres, det = produit des valeurs propres, Frobenius^{ "2" } = somme des valeurs propres^{ "2" }) ; la STM variationnelle est la STM du CR3BP validée par différences finies ; les lignes jacobiennes de distance / taux de variation de distance sont des dérivées partielles analytiques validées par différences finies (recoupé (commentaire du fichier de scénario, lignes { "16" } à { "25" })

# text
seg-c68bc1df8975 = L'observabilité cislunaire spatiale, bruitée et multifamille selon la longueur d'arc est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ba3c2a8f0e28 = <s1>Précédent</s1>cislunar-arc-recovery

# text
seg-3adfb78b1f34 = <s1>Suivant</s1>clock
