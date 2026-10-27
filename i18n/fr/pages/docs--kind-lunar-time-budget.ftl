# docs--kind-lunar-time-budget: translations (fr)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-8f8871ac8a0f = Page de sujet : <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Page de sujet : <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-time-budget.md
seg-11f512367036 = Source : <c1/>

# text
# c1: lunar-time-budget
seg-f7cd4fcfc62d = <c1/> (type de scénario)

# text
seg-cac3a0bcbfc6 = Budget d'erreur de temps de bout en bout MODELLED du Temps lunaire coordonné (LTC) : les sept termes d'erreur du LTC assemblés sous forme de courbes d'erreur de temps x_i(τ) sur toute une grille de temps de moyennage, sommés quadratiquement en x_Σ(τ), et le τ de CROISEMENT horloge-référentiel auquel le terme d'horloge croissant dépasse le terme constant de réalisation du référentiel en temps réel (en dessous, le budget est limité par le référentiel, au-dessus, limité par l'horloge) — la réponse honnête à l'artefact du τ unique. Les pentes en τ sont en forme close et vérifiables analytiquement (horloge τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, planchers τ^{ "0" }, mesure τ^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge publiées sur un jour (crate::clock_specs) ; les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résiduel relativiste et d'éphéméride sont des allocations de budget modélisées (valeurs par défaut documentées, redéfinissables par l'appelant), et non des mesures. L'apport est le τ de croisement reproductible, et non un nombre certifié par terme ; non certifié pour la tenue du temps en exploitation.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Une exécution de <c1/> se résume ainsi : lunar-time-budget | clock passive-h-maser | 7-term x_Σ(τ) over { "57" } τ-points ({ "1" }–{ "1e7" } s) | crossover τ { "8.689e4" } s (x { "1.001e-9" } s) | frame floor { "1.001e-9" } s | clock x({ "1" } d) { "0.995" } ns (MODELLED)

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-7cdc521303eb = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-time-budget.toml
seg-c050033b32c3 = L'exemple <c1/> définit, entre autres :

# text
seg-eebd3e40d0b9 = Libellé du résultat (celui du moteur) : budget d'erreur de temps LTC de bout en bout MODELLED. Les pentes en τ sont en forme close et vérifiables analytiquement (horloge τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, planchers τ^{ "0" }, mesure τ^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge publiées sur un jour ; les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résiduel relativiste et d'éphéméride

# attr:alt
seg-56fe184f2a12 = Le graphique que le moteur écrit pour scenarios/lunar-time-budget.toml, type de scénario lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Une exécution de lunar-time-budget émet une ligne de croisement horloge-référentiel par classe d'horloge face à un unique terme de référentiel partagé, de sorte que l'horloge est la seule variable de la comparaison ; chaque ligne porte le croisement obtenu de deux façons -- par bissection à partir du gen

# text
seg-fd52e493b6c2 = <b>MODELLED</b> Le bloc facultatif [time_lab] du scénario lunar-time-budget modélise une horloge de station de référence lunaire (par défaut la classe miniRAFS, ou toute classe nommée, ou une fiche de dispositif ajustée sur des points de stabilité donnés) asservie au Temps lunaire coordonné an Tests : <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Une exécution de lunar-time-budget émet une ligne de croisement horloge-référentiel par classe d'horloge face à un unique terme de référentiel partagé, de sorte que l'horloge est la seule variable de la comp. Référence indépendante (InternalConsistency) : deux calculs différents dans le même code source de la même grandeur, et non un seul reformulé : la bissection sur la courbe en loi de puissance de l'IEEE-1139 ne sait rien du type de bruit, tandis que la forme close inverse algébriquement le type dominant, de sorte qu'un type de bruit mal classé ou un encadrement défectueux apparaît comme une différence relative non minuscule. Les quatre valeurs reproduisent aussi le tableau publié de l'article à la moitié de son dernier chiffre imprimé -- mais ce tableau était lui-même

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> Le scénario lunar-time-budget publie ses sorties à valeurs de tableau sous forme d'un tableau long (indice de grille, temps de moyennage, terme) à côté du rapport, de sorte que les sept par. Référence indépendante (InternalConsistency) : autocohérence seulement : le total publié est contrôlé par rapport à la racine de la somme des carrés des termes du même fichier, et la courbe émise reproduit le p3_time_budget_curve.csv publié sur les { "57" } points. Les deux contrôles partagent les propres définitions de termes de ce moteur, de sorte qu'aucun n'est indépendant. Le terme d'horloge repose sur des spécifications d'horloge publiées, mais les ORDRES DE GRANDEUR des planchers de liaison, de référentiel, relativiste et d'éphéméride sont documentés

# text
# c1: label
seg-8abdeb1a36e1 = Budget d'erreur de temps LTC de bout en bout MODELLED. Les pentes en τ sont en forme close et vérifiables analytiquement (horloge τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, planchers τ^{ "0" }, mesure τ^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge publiées sur un jour ; les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résiduel relativiste et d'éphéméride sont des allocations de budget modélisées (valeurs par défaut documentées, redéfinissables par l'appelant), et non des mesures. L'apport (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = Budget d'erreur de temps de bout en bout MODELLED du Temps lunaire coordonné (LTC) : les sept termes d'erreur du LTC assemblés sous forme de courbes d'erreur de temps x_i(τ) sur toute une grille de temps de moyennage, sommés quadratiquement en x_Σ(τ), et le τ de CROISEMENT horloge-référentiel auquel le terme d'horloge croissant dépasse le terme constant de réalisation du référentiel en temps réel (en dessous, le budget est limité par le référentiel, au-dessus, limité par l'horloge) — la réponse honnête à l'artefact du τ uni (catalogue des types de scénario (<c1/>))

# text
seg-ca1763d4a416 = Honnêteté : MODELLED. Les pentes en tau sont en forme close et vérifiables analytiquement (horloge tau^{ "{" }+1/2{ "}" } ou tau^{ "{" }+{ "1" }{ "}" }, planchers tau^{ "0" }, mesure tau^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge publiées sur un jour ; mais les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résiduel relativiste et d'éphéméride sont des allocations de budget modélisées (valeurs par défaut documentées, redéfinissables par l'appelant), et non des mesures. L'apport est (commentaire du fichier de scénario, lignes { "13" } à { "18" })

# text
seg-8f884949bdf1 = Le tableau de croisement du temps lunaire par classe d'horloge est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = La reproductibilité du budget d'erreur de temps lunaire est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Précédent</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Suivant</s1>lunar-time-offset
