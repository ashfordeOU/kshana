# docs--kind-slot-timing: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Source : <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (type de scénario)

# text
seg-1b61962464c5 = Synchronisation d'un créneau : nombre de secondes avant qu'une horloge en marche libre ne sorte de la marge de garde d'un créneau d'acheminement ou d'affectation indexé sur le temps (l'erreur de temps absolue maximale que le créneau tolère), contribution de chaque terme à cet instant avec le terme dominant nommé (incertitude de recalage, bruit blanc de phase, bruit de fréquence blanc, de scintillation, de marche aléatoire et de course aléatoire, décalage de fréquence résiduel, température, vieillissement), temps restant depuis le dernier recalage, et plus grand intervalle de recalage qui maintient l'horloge dans la marge, net de la latence du recalage. L'oscillateur est une valeur par défaut de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs : un écart-type d'Allan à une seconde cité et un plancher de bruit rouge supposé), un PRÉRÉGLAGE DE FICHE TECHNIQUE de synchronisation télécom ou une FICHE TECHNIQUE en ligne (maxima d'écart-type d'Allan ajustés comme une enveloppe, plus le vieillissement et un coefficient de température), ou un ENREGISTREMENT DE PHASE MESURÉ en ligne (son écart-type d'Allan chevauchant ajusté par moindres carrés pondérés dans la base du bruit blanc de phase et du bruit de modulation de fréquence de l'IEEE Std { "1139" }, de sorte que le plancher de bruit rouge est mesuré et non supposé). Un dépassement au-delà du plus long temps de moyennage que la fiche technique ou l'enregistrement permet est signalé comme extrapolé. Une section facultative de leurrage ajoute le niveau de protection de la synchronisation temporelle pour un récepteur en orbite : vitesse et période orbitales, durée pendant laquelle un seul leurre au sol peut atteindre le satellite par passage, plancher du moniteur assisté par l'horloge et latence de détection CUSUM, borne conditionnelle, écart qu'accumule un leurre à un taux de rampe maximal donné avant que le satellite ne quitte sa portée ou qu'une vérification indépendante ne s'exécute, et indication si chaque vérification par contact au sol ou par liaison croisée est indépendante de ce leurre. VALIDATED : l'inversion de holdover à partir d'un enregistrement ajusté, mise de côté sur une vraie horloge au césium mesurée par rapport à un maser à hydrogène (tests/slot_timing_cs5071a_holdout.rs, conditionné par les données) ; sur un oscillateur à quartz mesuré, la prédiction mise de côté est prudente mais n'atteint pas le seuil, de sorte que le cas du quartz est MODELLED. MODELLED : les sources de classe et de fiche technique, les termes déterministes et l'évaluation du leurrage.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Une exécution de <c1/> se résume ainsi : slot-timing (source fiche technique) : marge de garde { "100.0" } ns à k={ "3" } franchie { "650.8" } s après un recalage ({ "50.8" } s restantes) ; recalage au moins toutes les { "645.8" } s ({ "133.80" } par jour) ; terme dominant : bruit de fréquence de marche aléatoire

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Champs obligatoires : <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Champs facultatifs : <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = L'exemple <c1/> définit, entre autres :

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = fiche technique

# text
seg-c13396b4e57b = Libellé du résultat (celui du moteur) : MODELLED — temps avant qu'une horloge en marche libre ne sorte de la marge de garde d'un créneau d'acheminement, et cadence de recalage qui la maintient dans la marge, à partir d'un modèle d'horloge stationnaire en loi de puissance. Une source de fiche technique est une enveloppe de ses maxima, et non la mesure d'une unité quelconque ; une source de classe repose sur un plancher de bruit rouge supposé.

# attr:alt
seg-97a91c8a60cd = Le graphique que le moteur écrit pour scenarios/slot-timing-ocxo-leo.toml, type slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> Le chemin d'enregistrement mesuré du type <c1/> : l'écart-type d'Allan chevauchant d'un enregistrement de phase ajusté par moindres carrés non négatifs pondérés par edf dans la base du bruit blanc de phase et du bruit de modulation de fréquence de l'IEEE Std { "1139" } (slot_timing::fit_weighted), Tests : <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> Le type <c1/> : l'erreur prédite E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inversée pour le dépassement, le temps restant, l'intervalle de resynchronisation net de la latence du recalage et les recalages par jour, chaque terme détaillé avec th Tests : <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, accessible comme section de leurrage du type <c1/> : vitesse et période en orbite circulaire, durée maximale pendant laquelle un leurre au sol peut atteindre le satellite par passage, plancher du moniteur assisté par l'horloge et latence de détection CUSUM l

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> Le type <c1/> : l'erreur prédite E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inversée pour le dépassement, le temps restant, la resynchronisati. Référence indépendante (InternalConsistency) : formes fermées pour chaque terme seul et recherche de racine indépendante holdover::holdover_seconds ; les valeurs de fiche technique sont les documents nommés (docs/SLOT-TIMING.md). Une valeur de classe par défaut repose sur un plancher de bruit rouge supposé et une source de fiche technique est une enveloppe de maxima, de sorte qu'aucune n'est la mesure d'une unité quelconque

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, accessible comme section de leurrage du type <c1/> : vitesse et période en orbite circulaire, durée maximale pendant laquelle un leurre au sol peut atteindre le satellite par passage, plancher du moniteur assisté par l'horloge et latence de détection CUSUM l. Référence indépendante (InternalConsistency) : réduction au niveau de protection de la synchronisation temporelle existant et aux formes fermées de visibilité pour une orbite circulaire et une Terre sphérique. Conditionnel à la détection, un leurre terrestre à un taux de rampe donné, un passage au zénith sur une Terre non tournante ; non validé sur un récepteur leurré en orbite

# text
# c1: not_modelled[0]
seg-29af1ec87672 = sauts de fréquence, effets des rayonnements et décalages de fréquence relativistes (résultat <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = un modèle thermique : l'excursion de température est appliquée comme un échelon au moment du recalage (résultat <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = le protocole de synchronisation lui-même : un recalage ramène l'erreur à fix_sigma_ns (résultat <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = la métrique de dérive selon laquelle un créneau d'acheminement devrait être accepté ; voir docs/SLOT-TIMING.md (résultat <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — temps avant qu'une horloge en marche libre ne sorte de la marge de garde d'un créneau d'acheminement, et cadence de recalage qui la maintient dans la marge, à partir d'un modèle d'horloge stationnaire en loi de puissance. Une source de fiche technique est une enveloppe de ses maxima, et non la mesure d'une unité quelconque ; une source de classe repose sur un plancher de bruit rouge supposé. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = L'oscillateur est une valeur par défaut de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs : un écart-type d'Allan à une seconde cité et un plancher de bruit rouge supposé), un PRÉRÉGLAGE DE FICHE TECHNIQUE de synchronisation télécom ou une FICHE TECHNIQUE en ligne (maxima d'écart-type d'Allan ajustés comme une enveloppe, plus le vieillissement et un coefficient de température), ou un ENREGISTREMENT DE PHASE MESURÉ en ligne (son écart-type d'Allan chevauchant ajusté par moindres carrés pondérés dans la base du bruit blanc de phase et de l'IEEE S (catalogue des types (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED : l'inversion de holdover à partir d'un enregistrement ajusté, mise de côté sur une vraie horloge au césium mesurée par rapport à un maser à hydrogène (tests/slot_timing_cs5071a_holdout.rs, conditionné par les données) ; sur un oscillateur à quartz mesuré, la prédiction mise de côté est prudente mais n'atteint pas le seuil, de sorte que le cas du quartz est MODELLED. (catalogue des types (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED : les sources de classe et de fiche technique, les termes déterministes et l'évaluation du leurrage. (catalogue des types (<c1/>))

# text
seg-1a72034c1343 = Page thématique : <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Précédent</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Suivant</s1>solar-system
