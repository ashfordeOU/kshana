# docs--kind-aperture-duty-cycle: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Source : <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (type de scénario)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Rapport cyclique d'ouverture : le partage du temps entre navigation et communications qu'implique un plan de contacts pour un ensemble d'ouvertures orientables. Prend un plan de contacts (une liste de fenêtres <c1/> aos_s/los_s, chacune demandant la navigation ou les communications — le même vocabulaire aos_s/los_s qu'émet le prédicteur <c2/>), un nombre d'ouvertures, et une POLITIQUE D'ARBITRAGE (priorité à la navigation par défaut, ou priorité aux communications, ou premier arrivé premier servi sans préemption), et rapporte le rapport cyclique de navigation, le rapport cyclique de communications, le rapport cyclique d'inactivité, et l'indisponibilité par session — le temps de contact qu'une session a demandé et qu'aucune ouverture n'a servi. Un balayage d'intervalles exact sur les bornes des fenêtres, de sorte que des fenêtres contiguës n'entrent jamais en conflit et qu'aucune seconde d'ouverture n'est comptée deux fois ; les secondes d'ouverture de navigation, de communications et d'inactivité sont cumulées indépendamment et se referment sur apertures*horizon_s. Le rapport énonce la politique résolue, sa définition complète, et les définitions du rapport cyclique et de l'indisponibilité, car un rapport cyclique cité sans sa politique d'arbitrage n'est pas reproductible. Arithmétique d'ordonnancement MODELLED : aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session, aucun volume de données, état de tampon, budget énergétique ni fermeture de liaison n'entre dans la décision, et les fenêtres de contact sont des entrées — leur géométrie est ce qui les a produites. Ce n'est pas un produit d'ordonnancement de segment sol.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Une exécution de <c1/> se résume ainsi : aperture-duty-cycle: { "6" } session(s) on { "2" } aperture(s) under navigation-priority -> navigation duty { "0.1167" }, communications duty { "0.2667" }, idle { "0.6167" }; { "0" } s of { "6900" } s requested lost to contention (MODELLED)

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-67c665d5c8c0 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-60f25ccdab6e = L'exemple <c1/> définit, entre autres :

# text
seg-bf51947657c0 = navigation

# text
seg-b4ff1d640bdf = communications

# text
seg-2e78730d0737 = aperture*s

# text
seg-330cbcd04718 = fraction (sans dimension)

# text
seg-0ef5875db338 = Étiquette du résultat (celle du moteur) : MODELLED — arithmétique d'ordonnancement d'ouvertures sur un plan de contacts fourni : un balayage d'intervalles exact du partage du temps entre navigation et communications et de la perte par conflit par session sous une politique d'arbitrage nommée. Aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session,

# attr:alt
seg-a8b38ed8e029 = Le graphique que le moteur écrit pour scenarios/aperture-duty-cycle.toml, type de scénario aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Une exécution prend un plan de contacts (une liste de fenêtres aos_s/los_s, chacune demandant à l'ouverture la navigation ou les communications — le même vocabulaire de fenêtres qu'émet <c1/>, converti par <c2/>), un nombre d'ouvertures

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Une exécution prend un plan de contacts (une liste de fenêtres aos_s/los_s, chacune demandant à l'ouverture la navigation ou les communications — le même vocabulaire de fenêtres que `passes::pre. Référence indépendante (InternalConsistency) : Cohérence interne, à partir de trois grandeurs calculées par des expressions différentes dans le même balayage puis dont on exige qu'elles se referment. Les secondes d'ouverture de navigation, les secondes d'ouverture de communications et les secondes d'ouverture d'inactivité sont cumulées séparément — l'inactivité à partir de (ouvertures − |servies|) par intervalle élémentaire, jamais comme un reste — et leur somme est vérifiée par rapport à ouvertures × horizon_s, ce qui ferait échouer une borne mal encadrée, un double-c

# text
# c1: label
seg-a388c24fec99 = MODELLED — arithmétique d'ordonnancement d'ouvertures sur un plan de contacts fourni : un balayage d'intervalles exact du partage du temps entre navigation et communications et de la perte par conflit par session sous une politique d'arbitrage nommée. Aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session, aucun volume de données, état de tampon, budget énergétique ni fermeture de liaison n'entre dans la décision, et les fenêtres de contact sont des entrées — th (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = Arithmétique d'ordonnancement MODELLED : aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session, aucun volume de données, état de tampon, budget énergétique ni fermeture de liaison n'entre dans la décision, et les fenêtres de contact sont des entrées — leur géométrie est ce qui les a produites. (catalogue des types de scénario (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = PORTÉE HONNÊTE : arithmétique d'ordonnancement MODELLED sur les fenêtres fournies. Aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session ; aucun volume de données, état de tampon, budget énergétique ni fermeture de liaison n'entre dans la décision ; et les fenêtres de contact sont des entrées -- leur géométrie est ce qui les a produites (le scénario <c1/> émet le même vocabulaire aos_s / los_s). Ce n'est pas un ordonnancement de segment sol (commentaire du fichier de scénario, lignes { "18" } à { "24" })

# text
seg-0b7f8d86e5d5 = Le rapport cyclique navigation contre communications d'une ouverture est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Précédent</s1>aocs

# text
seg-5b4fd889fdff = <s1>Suivant</s1>araim-reference-check
