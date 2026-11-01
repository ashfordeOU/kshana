# docs--kind-conflict-resilience: translations (fr)

# text
seg-c4ed27a559df = Page thématique : <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-216efc4e6fba = Type de scénario du moteur v{ $version }, famille <a1>PNT alternatif en environnement sans GPS</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-98133e74f88a = Page de famille : <a1>PNT alternatif en environnement sans GPS</a1>

# text
# c1: docs/kinds/by-kind/conflict-resilience.md
seg-34f14aa2ee0b = Source : <c1/>

# text
# c1: conflict-resilience
seg-a80556cfe1a9 = <c1/> (type de scénario)

# text
seg-c8f93431680a = Résilience MODELLED de PNT en couches face aux conflits (P7) : un utilisateur en environnement contesté dispose de plusieurs couches PNT (GNSS à service ouvert, GNSS à large bande, une constellation authentifiée, un relais d'augmentation), chacune avec une disponibilité de base, une précision à 1σ et une vulnérabilité de refus par vecteur face à la menace commune de brouillage/leurrage. Un Monte-Carlo À GRAINE FIXE, balayé en intensité, refuse chaque couche avec la probabilité clamp(vulnérabilité·intensité·poids_du_vecteur,{ "0,1" }), fusionne les survivantes par la règle en forme fermée de la variance inverse σ_fused=(Σ 1/σ_i²)^(−1/2), et indique la probabilité de perte totale (toutes les couches refusées), l'erreur fusionnée médiane et des statistiques d'utilisabilité/de refus par couche en fonction de l'intensité. Le rapport de résilience de tête (probabilité de perte totale d'une couche unique par rapport à celle de plusieurs couches) atteint ~7x sous l'hypothèse d'INDÉPENDANCE ; un balayage de refus corrélé par copule gaussienne à un facteur montre ensuite ce ~7x s'effondrer vers { "1" } à mesure que la corrélation de refus augmente (la corrélation met en échec la mise en couches). Un bloc de sensibilité aux a priori fait varier le chiffre de tête sur les a priori de vulnérabilité SOURCÉS via le diagramme en tornade mcda + une réallocation Dirichlet de l'effort de menace + des intervalles de confiance en percentiles. Cœur VALIDATED : la perte totale Monte-Carlo converge vers le produit indépendant en forme fermée Π_i p_deny_i (dans l'erreur standard Monte-Carlo à graine fixe et N grand) ; la fusion par variance inverse est une identité en forme fermée ; à ρ={ "0" } la copule se réduit au modèle indépendant et chaque ρ préserve le taux de refus marginal de chaque couche. MODELLED : les grandeurs de vulnérabilité/disponibilité/précision par couche sont des entrées sourcées mais modélisées (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — voir conflict_threat_params), et l'ordre de grandeur précis de ~7x ainsi que la forme de la courbe rapport-en-fonction-de-la-corrélation découlent de cette paramétrisation. Une ventilation de survie par vecteur au §{ "4.2" } résout ensuite la menace RF commune en quatre vecteurs nommés (brouillage/leurrage/cinétique/cyber) et indique pour chaque vecteur sa courbe de dégradation progressive du PNT utilisable S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED : le Monte-Carlo par couche à graine fixe converge vers cette forme fermée ; le brouillage est le vecteur le plus aigu pour la référence de base RF corrélée et la couche inertielle insensible aux RF est le survivant décisif. Ce n'est pas un produit de disponibilité de navigation certifié.

# text
# c1: scenarios/conflict-resilience.toml
seg-dd10a00edc2f = Une exécution de <c1/> se résume ainsi : conflict-resilience | { "4" } layers ({ "0" } baseline) | reference intensity { "1.00" } | resilience ratio closed-form 6.73x MC 6.19x (layered vs single-layer) | correlation defeats layering: ratio 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior CI [5.51-8.48]x | per-vector survival @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (sharpest jamming) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-674bafccbaf7 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/conflict-resilience.toml
seg-71fcff68edaf = L'exemple <c1/> définit, entre autres :

# text
seg-4e3b5bb5a5e7 = GNSS L1 C/A (service ouvert)

# text
seg-bd3832c8215d = Étiquette du résultat (celle du moteur) : résilience MODELLED de PNT en couches face aux conflits (P7). Cœur VALIDATED : la probabilité de perte totale Monte-Carlo converge vers le produit indépendant en forme fermée Pi_i p_deny_i (affirmée dans l'erreur standard Monte-Carlo à graine fixe et N grand) ; la fusion de position par variance inverse sigma_fused = (sum_i 1/sig

# attr:alt
seg-4dd2bcc206db = Le graphique que le moteur écrit pour scenarios/conflict-resilience.toml, type de scénario conflict-resilience

# text
seg-c0e69524f05d = <b>MODELLED</b> Sous-scores par dimension sur les sept catégories de résilience propres à Kshana (et non les termes du DHS), les fonctions RDRR de RethinkPNT et les critères de Yang, chacun étiqueté Modelled avec i. Référence indépendante (InternalConsistency) : formules par métrique dérivées à la main : diversité de Simpson inverse, composite en moyenne pondérée, durées de chronologie bornées/non bornées, échelle de niveaux au maillon le plus faible

# text
# c1: label
seg-2ca37a78e899 = Résilience MODELLED de PNT en couches face aux conflits (P7). Cœur VALIDATED : la probabilité de perte totale Monte-Carlo converge vers le produit indépendant en forme fermée Pi_i p_deny_i (affirmée dans l'erreur standard Monte-Carlo à graine fixe et N grand) ; la fusion de position par variance inverse sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) est une identité en forme fermée ; à la corrélation rho={ "0" } la copule gaussienne se réduit exactement au modèle indép (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-d0d834e377ee = Résilience MODELLED de PNT en couches face aux conflits (P7) : un utilisateur en environnement contesté dispose de plusieurs couches PNT (GNSS à service ouvert, GNSS à large bande, une constellation authentifiée, un relais d'augmentation), chacune avec une disponibilité de base, une précision à 1σ et une vulnérabilité de refus par vecteur face à la menace commune de brouillage/leurrage. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-3ca12700b54c = Le rapport de résilience de tête (probabilité de perte totale d'une couche unique par rapport à celle de plusieurs couches) atteint ~7x sous l'hypothèse d'INDÉPENDANCE ; un balayage de refus corrélé par copule gaussienne à un facteur montre ensuite ce ~7x s'effondrer vers { "1" } à mesure que la corrélation de refus augmente (la corrélation met en échec la mise en couches). (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-70e4fdff099f = MODELLED : les grandeurs de vulnérabilité/disponibilité/précision par couche sont des entrées sourcées mais modélisées (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — voir conflict_threat_params), et l'ordre de grandeur précis de ~7x ainsi que la forme de la courbe rapport-en-fonction-de-la-corrélation découlent de cette paramétrisation. (catalogue des types de scénario (<c1/>))

# text
seg-33541cca61b6 = Un utilisateur en environnement contesté dispose de quatre couches PNT RF qui empruntent toutes la même bande et partagent donc le vecteur de refus par brouillage/leurrage — le cas fragile et corrélé. Le scénario indique : * la probabilité de perte totale en fonction de l'intensité de la menace (Monte-Carlo par rapport au produit indépendant en forme fermée vers lequel il converge), * le rapport de résilience de ~7x entre plusieurs couches et une couche unique sous l'hypothèse d'indépendance, * comment ce ~7x s'effondre vers (commentaire du fichier de scénario, lignes { "3" } à { "15" })

# text
# c1: layers
seg-83badfe4784d = Chaque grandeur par couche est une entrée MODELLED avec sa provenance ; voir src/conflict_threat_params.rs pour les a priori [min, nominal, max] sourcés et les profils de sensibilité par vecteur (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Omettre <c1/> exécute la même référence de base sourcée à quatre couches ; elle est écrite ici — y compris le vector_profile de chaque couche — par souci de transparence. (commentaire du fichier de scénario, lignes { "17" } à { "22" })

# text
seg-bb182ed41520 = La notation alignée sur le cadre de résilience PNT est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-6a42653a8a0f = <s1>Précédent</s1>combined-altpnt

# text
seg-2bd3e9d1505c = <s1>Suivant</s1>constellation-design
